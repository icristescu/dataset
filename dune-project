(lang dune 2.8)
(using dune_site 0.1)
(name dataset)
(generate_opam_files true)

(source (github icristescu/dataset))
(license ISC)
(authors "Ioana Cristescu")

(package
 (name dataset)
 (synopsis "A trace for benchmarks")
 (sites (share data)))
