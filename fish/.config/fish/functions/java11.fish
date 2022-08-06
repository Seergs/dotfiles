function java11 --wraps='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.15.jdk/Contents/Home; java -version' --description 'alias java11=export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.15.jdk/Contents/Home; java -version'
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.15.jdk/Contents/Home; java -version $argv; 
end
