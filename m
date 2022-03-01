Return-Path: <petri.latvala@intel.com>
Date: Tue, 1 Mar 2022 18:13:00 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH v2 0/9] Add support to collect code coverage
 data
Message-ID: <Yh5GDGcm72996+Lj@platvala-desk.ger.corp.intel.com>
References: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 01, 2022 at 08:59:20AM +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The gcc compiler has a feature that allows collecting code coverage
> in runtime, which is already supported by the Linux Kernel, as described
> on its documentation:
> 
> 	https://01.org/linuxgraphics/gfx-docs/drm/dev-tools/gcov.html
> 
> Add support for it at the igt_runner and scripts/run-tests.sh.
> 
> With such support, once a Kernel is compiled with:
> 
> 	./scripts/config -e DEBUG_FS -e GCOV_KERNEL
> 
> And GCOV is enabled by one or more drivers, like doing:
> 
> 	for i in $(find drivers/gpu/drm/ -name Makefile); do sed '1 a GCOV_PROFILE := y' -i $i; done
> 
> One can use igt_runner and/or run-tests.sh to collect the code coverage.
> 
> The way the implementation works is that the igt_runner has internally
> the logic which reset the gcov usage counters. The code capture itself
> is done via an external script.
> 
> There are two versions of such script:
> 
> - scripts/code_cov_capture.sh:
> 
>   Assumes that the Kernel was built at the same machine, and uses
>   the lcov tool to generate GCC-independent code coverage data,
>   in the form of *.info files;
> 
> - scripts/code_cov_gather_on_test.py:
> 
>   Generates a gzipped tarbal with the code coverage counters in
>   binary format. Such kind of output should then be parsed at
>   the same machine where the Kernel as built, as its content is not
>   ony dependent on the Kernel source, but also on the Kernel output
>   objects.
> 
> Either way, both igt_runner and scripts/run-tests.sh could be used
> to generate the code coverage results.
> 
> So, in order to get the code coverage results, storing results per each
> IGT test, one should run either:
> 
> 	./scripts/run-tests.sh -T my_tests.testlist -k ~/linux \
> 		-c scripts/code_cov_gather_on_test.py -P
> 
> or:
> 
> 	sudo ./build/runner/igt_runner -o --test-list my_tests.testlist \
> 		--coverage-per-test \
> 		--collect-script scripts/code_cov_gather_on_test.py \
> 		build/tests results
> 
> Once the data is captured, it is possible to generate HTML reports
> using scripts/code_cov_gen_report.sh:
> 
> 	scripts/code_cov_gen_report.sh -r results/code_cov/i915_selftest_live.info -k ~/linux -o cov_results -i -f
> 
> v2:
>   - Applied this commant to patch 8:
>     sed 's!/home/gta/!/basedir/!;s,\./basedir,/basedir,' -i docs/code_coverage.md
> 
> Mauro Carvalho Chehab (8):
>   runner: check if it has root permissions
>   runner: Add support for code coverage
>   scripts/code_cov_gather*/sh: add help scripts for code coverage
>   scripts/code_cov_gather_on_build.sh: Improve the script
>   scripts/code_cov_capture.sh: add a script to use lcov on build+test
>     machine
>   scripts/code_cov_gen_report.sh: add a script to generate code coverage
>     reports
>   scripts/run-tests.sh: add code coverage support
>   docs: add documentation for code coverage
> 
> Tomi Sarvela (1):
>   scripts:code_cov_gather_on_test: use a faster script
> 
>  docs/code_coverage.md               | 293 ++++++++++++++++++++++++++++
>  runner/executor.c                   | 200 ++++++++++++++++++-
>  runner/resume.c                     |   4 +-
>  runner/runner_tests.c               |  30 +++
>  runner/settings.c                   |  87 ++++++++-
>  runner/settings.h                   |   8 +
>  scripts/code_cov_capture.sh         |  25 +++
>  scripts/code_cov_gather_on_build.sh |  39 ++++
>  scripts/code_cov_gather_on_test.py  |  91 +++++++++
>  scripts/code_cov_gen_report.sh      | 170 ++++++++++++++++
>  scripts/run-tests.sh                |  52 ++++-
>  11 files changed, 979 insertions(+), 20 deletions(-)
>  create mode 100644 docs/code_coverage.md
>  create mode 100755 scripts/code_cov_capture.sh
>  create mode 100755 scripts/code_cov_gather_on_build.sh
>  create mode 100755 scripts/code_cov_gather_on_test.py
>  create mode 100755 scripts/code_cov_gen_report.sh
> 
> -- 
> 2.35.1
> 


Support for -o (overwrite) is missing from this version of the series,
I suppose we should get that done at least before this can be merged
and put into use. Having the code_cov* scripts be installed by meson
is a semi-necessity for i915 CI but can be left for later, whatever
you prefer.


-- 
Petri Latvala
