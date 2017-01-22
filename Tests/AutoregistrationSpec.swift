// https://github.com/Quick/Quick

import Quick
import Nimble
import SwinjectAutoregistration
import Swinject

class AutoregistrationSpec: QuickSpec {
    
    class DependencyA {}
    class DependencyB {}
    class DependencyC {}
    class DependencyD {}
    class DependencyE {}
    class DependencyF {}
    class DependencyG {}
    class DependencyH {}
    class DependencyI {}
    class DependencyJ {}
    
    class Service1 {
        init(a: DependencyA){}
    }
    
    class Service2 {
        init(a: DependencyA, b: DependencyB){}
    }
    
    class Service3 {
        init(a: DependencyA, b: DependencyB, c: DependencyC){}
    }
    
    class Service4 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD){}
    }
    
    class Service5 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE){}
    }
    
    class Service6 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF){}
    }
    
    class Service7 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG){}
    }
    
    class Service8 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG, h: DependencyH){}
    }
    
    class Service9 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG, h: DependencyH, i: DependencyI){}
    }
    
    class Service10 {
        init(a: DependencyA, b: DependencyB, c: DependencyC, d: DependencyD, e: DependencyE, f: DependencyF, g: DependencyG, h: DependencyH, i: DependencyI, j: DependencyJ){}
    }
    
    class OptionalService {
        init(a: DependencyA?){}
    }
    
    class UnwrappedService {
        init(a: DependencyA!){}
    }
    
    class SameArgumentsService {
        let nameA: String; let nameB: String
        init(a: DependencyA, nameA: String, age: Int, nameB: String){
            self.nameA = nameA; self.nameB = nameB
        }
    }
    
    override func spec() {
        describe("autoregistration") {
            
            var container: Container!
            
            beforeEach {
                container = Container()
                
                container.autoregister(DependencyA.self, initializer: DependencyA.init)
                container.autoregister(DependencyB.self, initializer: DependencyB.init)
                container.autoregister(DependencyC.self, initializer: DependencyC.init)
                container.autoregister(DependencyD.self, initializer: DependencyD.init)
                container.autoregister(DependencyE.self, initializer: DependencyE.init)
                container.autoregister(DependencyF.self, initializer: DependencyF.init)
                container.autoregister(DependencyG.self, initializer: DependencyG.init)
                container.autoregister(DependencyH.self, initializer: DependencyH.init)
                container.autoregister(DependencyI.self, initializer: DependencyI.init)
                container.autoregister(DependencyJ.self, initializer: DependencyJ.init)
            }
            
            it("registers service with one dependency") {
                container.autoregister(Service1.self, initializer: Service1.init)
                let service = container.resolve(Service1.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with two dependencies") {
                container.autoregister(Service2.self, initializer: Service2.init)
                let service = container.resolve(Service2.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with three dependencies") {
                container.autoregister(Service3.self, initializer: Service3.init)
                let service = container.resolve(Service3.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with four dependencies") {
                container.autoregister(Service4.self, initializer: Service4.init)
                let service = container.resolve(Service4.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with five dependencies") {
                container.autoregister(Service5.self, initializer: Service5.init)
                let service = container.resolve(Service5.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with six dependencies") {
                container.autoregister(Service6.self, initializer: Service6.init)
                let service = container.resolve(Service6.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with seven dependencies") {
                container.autoregister(Service7.self, initializer: Service7.init)
                let service = container.resolve(Service7.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with eight dependencies") {
                container.autoregister(Service8.self, initializer: Service8.init)
                let service = container.resolve(Service8.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with nine dependencies") {
                container.autoregister(Service9.self, initializer: Service9.init)
                let service = container.resolve(Service9.self)
                expect(service).notTo(beNil())
            }
            
            it("registers service with one dynamic argument") {
                container.autoregister(Service2.self, argument: DependencyB.self, initializer: Service2.init)
                let service = container.resolve(Service2.self, argument: DependencyB())
                expect(service).notTo(beNil())
            }
            
            it("registers service with two dynamic arguments") {
                container.autoregister(Service3.self, arguments: DependencyB.self, DependencyC.self, initializer: Service3.init)
                let service = container.resolve(Service3.self, arguments: DependencyB(), DependencyC())
                expect(service).notTo(beNil())
            }
            
            it("registers service with three dynamic arguments") {
                container.autoregister(Service4.self, arguments: DependencyB.self, DependencyC.self, DependencyD.self, initializer: Service4.init)
                let service = container.resolve(Service4.self, arguments: DependencyB(), DependencyC(), DependencyD())
                expect(service).notTo(beNil())
            }
            
            it("registers with arguments interchangeably") {
                container.autoregister(Service4.self, arguments: DependencyC.self, DependencyD.self, DependencyB.self, initializer: Service4.init)
                let service = container.resolve(Service4.self, arguments: DependencyC(), DependencyD(), DependencyB())
                expect(service).notTo(beNil())
            }
            
            it("throws assertion when same type arguments are passed") {
                expect { () -> Void in
                    container.autoregister(SameArgumentsService.self, arguments: String.self, Int.self, String.self, initializer: SameArgumentsService.init)
                }.to(throwAssertion())
            }
            
            it("throws assertion when trying to resolve service with ten dependencies") {
                expect { () -> Void in
                    container.autoregister(Service10.self, initializer: Service10.init)
                    _ = container.resolve(Service10.self)
                }.to(throwAssertion())
            }
            
            it("throws assertion when trying to resolve service with optional dependency") {
                expect { () -> Void in
                    container.autoregister(OptionalService.self, initializer: OptionalService.init)
                    _ = container.resolve(OptionalService.self)
                }.to(throwAssertion())
            }
            
            it("throws assertion when trying to resolve service with unwrapped dependency") {
                expect { () -> Void in
                    container.autoregister(UnwrappedService.self, initializer: UnwrappedService.init)
                    _ = container.resolve(UnwrappedService.self)
                }.to(throwAssertion())
            }
        }
    }
}