def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end