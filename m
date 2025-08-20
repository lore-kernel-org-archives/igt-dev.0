Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442CECA0EF5
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 05:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA07710E345;
	Wed, 20 Aug 2025 05:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdWbIUNU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CD110E345
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 05:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755666771; x=1787202771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d5+HAeQ7ax83QueJuvWXo6xXOlBcTY1LNuPARCyY3JA=;
 b=EdWbIUNUHOV4xrcZHg41ZtoTxI+Zqsp23PqRMWIzh1TKCRqCm51Qj3wP
 PxY61ejlOFfZ8GDMMQa20sBXohtRPhe6iSHgqwyD8Hr12zxzlgPzP+49F
 UgQf2NjWUH3Sf7XIEepwlDOIPn3ocF+qtm0603pdZAHxb0SThV2ko9ks/
 gyuNoWlJPafLi2Dvqy59iQvzt1jl/nqUKm1Iz758yftglMTkYpwlr1cqy
 0lu3pngE4JqwgRRfuPVy5GpYST/ub/bqNxj+oxPeyhxWUfXPCsu79+Z7O
 joZ9i1AySKQwXhlxZe4Ub4CyNVM+rWq+HeY4484dHHMVOgVGzNXYCL1YQ A==;
X-CSE-ConnectionGUID: 6d0icZh1SEaCUWXRIgyW1Q==
X-CSE-MsgGUID: eSSeXdVHStqQgqskpbGsYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68194035"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="68194035"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 22:12:51 -0700
X-CSE-ConnectionGUID: FMFoYL4LRGGB/vq596cP8Q==
X-CSE-MsgGUID: zfhhlFuUT1yoJMxtNE6lpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="172455755"
Received: from agladkov-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 22:12:45 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Pawel Sikora <pawel.sikora@linux.intel.com>
Subject: [PATCH i-g-t v2 2/3] docs: Initialize MkDocs documentation structure
Date: Wed, 20 Aug 2025 07:12:23 +0200
Message-Id: <20250820051224.121006-3-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820051224.121006-1-pawel.sikora@intel.com>
References: <20250820051224.121006-1-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This commit establishes the groundwork for a comprehensive
documentation site, enhancing accessibility and organization.

 * Update README with basic content, reflecting
   the reorganization of documentation files.
 * Move detailed documentation into the docs directory,
   splitting content across multiple markdown files.
 * Set up the structure for automatic site generation using MkDocs,
   facilitating easier navigation and maintenance.

v2:
 - Add new content and make corrections (Swati)
 - Fix line width to 100 characters (Kamil)
 - Fix moved/copied files (Kamil)

Co-authored-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Pawel Sikora <pawel.sikora@linux.intel.com>
---
 README.md                            |  203 +---
 docs/CONTRIBUTING.md                 |   91 ++
 docs/MAINTAINERS.md                  |   16 +
 docs/NEWS.md                         | 1471 ++++++++++++++++++++++++++
 docs/api.md                          |   30 +
 docs/blocklists.md                   |  387 +++++++
 docs/building.md                     |   27 +
 docs/{chamelium.txt => chamelium.md} |    2 +-
 docs/ci_infrastructure.md            |  419 ++++++++
 docs/cross-building.md               |  240 +++++
 docs/cross-building.txt              |  122 ---
 docs/faq.md                          |   92 ++
 docs/new_driver.md                   |  230 ++++
 docs/overview.md                     |  249 +++++
 docs/patchwork.md                    |   18 +
 docs/running_tests.md                |  130 +++
 docs/test_categories.md              |  266 +++++
 docs/test_plan.md                    |  216 ++++
 docs/mkdocs.yml => mkdocs.yml        |    2 +
 19 files changed, 3914 insertions(+), 297 deletions(-)
 create mode 100644 docs/CONTRIBUTING.md
 create mode 100644 docs/MAINTAINERS.md
 create mode 100644 docs/NEWS.md
 create mode 100644 docs/api.md
 create mode 100644 docs/blocklists.md
 create mode 100644 docs/building.md
 rename docs/{chamelium.txt => chamelium.md} (99%)
 create mode 100644 docs/ci_infrastructure.md
 create mode 100644 docs/cross-building.md
 delete mode 100644 docs/cross-building.txt
 create mode 100644 docs/faq.md
 create mode 100644 docs/new_driver.md
 create mode 100644 docs/overview.md
 create mode 100644 docs/patchwork.md
 create mode 100644 docs/running_tests.md
 create mode 100644 docs/test_categories.md
 create mode 100644 docs/test_plan.md
 rename docs/mkdocs.yml => mkdocs.yml (98%)

diff --git a/README.md b/README.md
index ed6647726..6c04ae673 100644
--- a/README.md
+++ b/README.md
@@ -1,190 +1,45 @@
-IGT GPU Tools
-=============
+# IGT GPU Tools
 
+**IGT GPU Tools** is a collection of low-level tools, utilities, and test suites designed for **development and validation of Linux Direct Rendering Manager (DRM) drivers**, with a primary focus on Intel graphics hardware. It is used extensively by kernel developers, CI systems, and hardware teams to detect regressions, verify features, and maintain GPU driver quality.
 
-Description
------------
+##  What Is It?
 
-IGT GPU Tools is a collection of tools for development and testing of the DRM
-drivers. There are many macro-level test suites that get used against the
-drivers, including xtest, rendercheck, piglit, and oglconform, but failures from
-those can be difficult to track down to kernel changes, and many require
-complicated build procedures or specific testing environments to get useful
-results. Therefore, IGT GPU Tools includes low-level tools and tests
-specifically for development and testing of the DRM Drivers.
+IGT stands for **Intel Graphics Tests**, though support for non-Intel platforms is growing through community contributions.
 
-Generated documentation for the latest master is published under
-<https://drm.pages.freedesktop.org/igt-gpu-tools/>.
+This project provides:
 
+- A comprehensive set of **automated tests** targeting various parts of the graphics stack (KMS, GEM, command submission, memory management, etc.)
+- **Diagnostic tools** and utilities for manual inspection and debugging
+- **Microbenchmarks** to measure GPU performance characteristics
+- A shared **library of testing helpers** and wrappers for kernel interfaces (e.g., ioctls, sysfs, debugfs)
+- A flexible **test runner** for executing and filtering test cases in development or CI environments
 
-Requirements
-------------
+IGT GPU Tools is especially useful for:
 
-See `Dockerfile.build-fedora` for up-to-date list of package names in Fedora
-or `Dockerfile.build-debian-minimal` and `Dockerfile.build-debian` for Debian.
+- Detecting regressions early in the kernel development cycle
+- Verifying compliance with DRM driver expectations
+- Exercising corner cases not covered by higher-level test suites like Piglit or RenderDoc
+- Supporting hardware bring-up and validation workflows
 
-If your distribution packages IGT you can also use your package manager to
-install the dependencies, e.g.:
+## What's Inside?
 
-    # dnf builddep igt-gpu-tools
+- `tests/` — functional and stress tests for graphics subsystems
+- `lib/` — shared C libraries and macros for writing tests
+- `tools/` — command-line utilities for GPU state inspection and debugging
+- `benchmarks/` — microbenchmarks for measuring throughput, latency, and power
+- `runner/` — infrastructure for batch test execution and result reporting
+- `docs/` — Sphinx-based developer and API documentation
 
-But keep in mind that this may be slightly outdated and miss some
-recently added dependencies for building the current master.
+## License
 
+IGT GPU Tools is licensed under the **MIT License**.
+By contributing, you agree to the [Developer Certificate of Origin (DCO)](http://developercertificate.org/).
 
-Building
---------
+---
 
-Oneliner to get started:
+## Documentation
 
-    $ meson setup build && ninja -C build
+Detailed documentation, including build instructions, test guides, and API references, is available at:
 
-Note that meson insist on separate build directories from the source tree.
+ [IGT Documentation](https://drm.pages.freedesktop.org/igt-gpu-tools)
 
-Running selfchecks for `lib/tests` and `tests/` is done with
-
-    $ ninja -C build test
-
-Documentation is built using
-
-    $ ninja -C build igt-gpu-tools-doc
-
-Please notice that some drivers and test sets may require that all
-tests to be properly documented via testplan. By default, build
-will fail if one forgets to document or update the documentation.
-This is currently enabled for the Xe, i915 drivers and for KMS tests.
-See docs/test_documentation.md for more details.
-
-Running Tests
--------------
-
-In `tests/` you can find a set of automated tests to run against the DRM
-drivers to validate your changes. Many of the tests have subtests, which can
-be listed by using the `--list-subtests` command line option and then run
-using the --run-subtest option. If `--run-subtest` is not used, all subtests
-will be run. Some tests have further options and these are detailed by using
-the `--help` option.
-
-Most of the test must be run as a root and with no X or Wayland compositor
-running.
-
-    # build/tests/core_auth
-    IGT-Version: 1.24 (x86_64) (Linux: 5.3.0 x86_64)
-    Starting subtest: getclient-simple
-    Subtest getclient-simple: SUCCESS (0.001s)
-    Starting subtest: getclient-master-drop
-    Subtest getclient-master-drop: SUCCESS (0.000s)
-    Starting subtest: basic-auth
-    Subtest basic-auth: SUCCESS (0.000s)
-    Starting subtest: many-magics
-    Subtest many-magics: SUCCESS (0.000s)
-
-    # build/tests/core_auth --run-subtest getclient-simple
-    IGT-Version: 1.24 (x86_64) (Linux: 5.3.0 x86_64)
-    Starting subtest: getclient-simple
-    Subtest getclient-simple: SUCCESS (0.000s)
-
-
-The test suite can be run using the `run-tests.sh` script available in the
-`scripts/` directory. To use it make sure that `igt_runner` is built, e.g.:
-
-    meson -Drunner=enabled build && ninja -C build
-
-`run-tests.sh` has options for filtering and excluding tests from test
-runs:
-
-    -t <regex>      only include tests that match the regular expression
-    -x <regex>      exclude tests that match the regular expression
-
-Useful patterns for test filtering are described in the [API
-documentation][API] and the full list of tests and subtests can be produced
-by passing `-l` to the `run-tests.sh` script. Further options are are
-detailed by using the `-h` option.
-
-Results are written to a JSON file.
-
-[API]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html
-
-
-IGT Containers
---------------
-
-IGT is packed into nifty docker-compatible containers for ease of execution
-and to avoid having to install all the dependencies. You can use
-podman/docker to to run it on your system.
-
-Oneliner to get you started with the latest master:
-
-    # podman run --rm --privileged registry.freedesktop.org/drm/igt-gpu-tools/igt:master
-
-
-Other Things
-------------
-
-### `benchmarks/`
-
-A collection of useful microbenchmarks that can be used to tune DRM code.
-
-The benchmarks require KMS to be enabled.  When run with an X Server
-running, they must be run as root to avoid the authentication
-requirement.
-
-Note that a few other microbenchmarks are in tests (e.g. `gem_gtt_speed`).
-
-### `tools/`
-
-A collection of debugging tools. They generally must be run as root, except
-for the ones that just decode dumps.
-
-### `docs/`
-
-Contains the infrastructure to automatically generate igt-gpu-tools libraries
-reference documentation. You need to have the gtk-doc tools installed.
-
-To regenerate the html files when updating documentation, use:
-
-    $ ninja -C build igt-gpu-tools-doc
-
-If you've added/changed/removed a symbol or anything else that changes the
-overall structure or indexes you need to reflect the change in
-`igt-gpu-tools-sections.txt`. Entirely new sections also need to be added to
-`igt-gpu-tools-docs.xml` in the appropriate place.
-
-### `include/drm-uapi/`
-
-Imported DRM uapi headers from airlied's drm-next branch.
-
-These should be updated all together by:
-
-    # From the kernel dir with a drm/drm-next commit checked out:
-    $ make INSTALL_HDR_PATH=<dest-dir> headers_install
-    $ rm -f <igt-dir>/include/drm-uapi/*
-    $ cp <dest-dir>/include/drm/* <igt-dir>/include/drm-uapi/
-
-Then, commit with a note of which exact commit from airlied's branch
-was used to generate them.
-
-### `include/drm-uapi/i915_drm.h`
-
-Imported i915_drm.h uapi headers from airlied's drm-next branch.
-
-In some cases updating a single uapi file is needed as our history
-shows. In this case, it should be done by:
-
-    # From the kernel dir with a drm/drm-next commit checked out:
-    $ make INSTALL_HDR_PATH=<dest-dir> headers_install
-    $ cp <dest-dir>/include/drm/i915_drm.h <igt-dir>/include/drm-uapi/
-
-Then, commit with a note of which exact commit from airlied's branch
-was used to generate it.
-
-### `include/linux-uapi/sync_file.h`
-
-Imported non-DRM uapi headers from airlied's drm-next branch.
-
-    # From the kernel dir with a drm/drm-next commit checked out:
-    $ make INSTALL_HDR_PATH=<destdir> headers_install
-    $ cp <destdir>/include/linux/sync_file.h ~/igt/include/linux-uapi/
-
-Then, commit with a note of which exact commit from airlied's branch
-was used to generate them.
diff --git a/docs/CONTRIBUTING.md b/docs/CONTRIBUTING.md
new file mode 100644
index 000000000..e52f8dd0d
--- /dev/null
+++ b/docs/CONTRIBUTING.md
@@ -0,0 +1,91 @@
+# :material-account-multiple-plus-outline: CONTRIBUTING
+
+!!! info "Patches to igt-gpu-tools are very much welcome!"
+    we really want this to be the universal set of low-level tools and testcases for
+    kernel graphics drivers on Linux and similar platforms. So please bring on porting
+    patches, bugfixes, improvements for documentation and new tools and testcases.
+
+## :material-code-tags-check: The Code
+
+- The code should follow kernel coding style:
+  https://www.kernel.org/doc/html/latest/process/coding-style.html
+
+- Testcases (subtests) have to use minus signs (-) as a word separator.
+  The generated documentation contains glossary of commonly used terms.
+
+- All new test have to be described using `igt_describe()` family of functions.
+  The description should contain the spirit of the test (what is the general idea
+  behind the test) and *not* the letter (C to English translation of the test).
+  Refer to [`igt_describe()` documentation][igt-describe] for more details.
+
+- The generated documentation contains explanation of magic control blocks like
+  `igt_subtest` and `igt_fixture`. Please make sure that you understand their roles
+  and limitation before using/altering them.
+
+- Also please make full use of all the helpers and convenience macros provided by the
+  igt library. The semantic patch `lib/igt.cocci` can help with more automatic
+  conversions.
+
+- Tests that use kernel interfaces (uapi, sysfs, or even debugfs) that become
+  deprecated in favour of new interfaces should have fallbacks to the deprecated
+  interfaces if the new stuff is not present in the running kernel.
+
+[igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
+
+## :material-library-shelves: IGT Libraries
+
+- Tests and benchmarks are the main usage of IGT libraries, so they could use
+  test-specific macros/functions like `igt_assert`, `igt_require`, `igt_skip`,
+  `igt_info`, or `igt_debug`.
+
+- New library function should ideally be added when at least two different tests can
+  reuse it. Sometimes one user is acceptable if future reuse is highly likely.
+
+- If it uses `igt_assert`, `igt_require`, or `igt_skip`, consider also writing a
+  `__function()` variant without those macros.
+
+- **Libraries and `igt_runner`**:
+  `igt_runner` should not depend on lib functions, as this poses CI reliability risks.
+  (Yes, known exceptions are on the ToDo list.)
+
+- **Libraries and `tools/`**:
+  Think carefully before using IGT libs in tools. Tools should fail gracefully and log
+  to `stdout`/`stderr`.
+
+## :material-source-branch: Sending Patches
+
+- IGT is MIT licensed and contributors must follow the Developer Certificate of Origin:
+  http://developercertificate.org/
+
+- Submit patches using `git format-patch` / `git send-email` to:
+  `igt-dev@lists.freedesktop.org`
+
+- Use the subject prefix:
+  `--subject-prefix="PATCH i-g-t"`
+
+- Tools like `meson.sh` will auto-set this on first run:
+  `git config format.subjectprefix "PATCH i-g-t"`
+
+- If contributing regularly, subscribe to the dev mailing list:
+  https://lists.freedesktop.org/mailman/listinfo/igt-dev
+
+- Check status of your patches at:
+  https://patchwork.freedesktop.org/project/igt/series/
+  https://lore.kernel.org/igt-dev/
+
+- Subject formatting example:
+  `tests/simple_test: short description`
+
+- Helpful patch writing resources:
+    - https://kernelnewbies.org/PatchPhilosophy
+    - https://www.kernel.org/doc/html/latest/process/submitting-patches.html
+    - https://www.kernel.org/doc/html/latest/process/submit-checklist.html
+
+- All patches are reviewed on the mailing list.
+  Cross-review is encouraged even for single-contributor drivers.
+
+- Use `checkpatch.pl` before submission.
+  Suggested flags:
+  ```sh
+  --emacs --strict --show-types --max-line-length=100 \
+  --ignore=BIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER
diff --git a/docs/MAINTAINERS.md b/docs/MAINTAINERS.md
new file mode 100644
index 000000000..b7693e872
--- /dev/null
+++ b/docs/MAINTAINERS.md
@@ -0,0 +1,16 @@
+# Maintainers
+
+The following table lists the maintainers of the IGT GPU Tools project.
+
+These individuals are responsible for overseeing the development and maintenance of the project, ensuring its quality and progress.
+
+| Name                   | Email                           |
+|------------------------|---------------------------------|
+| Petri Latvala          | adrinael@adrinael.net           |
+| Arkadiusz Hiler        | arek@hiler.eu                   |
+| Kamil Konieczny        | kamil.konieczny@linux.intel.com |
+| Juha-Pekka Heikkila    | juhapekka.heikkila@gmail.com    |
+| Bhanuprakash Modem     | bhanuprakash.modem@gmail.com    |
+| Ashutosh Dixit         | ashutosh.dixit@intel.com        |
+| Karthik B S            | karthik.b.s@intel.com           |
+
diff --git a/docs/NEWS.md b/docs/NEWS.md
new file mode 100644
index 000000000..a7e6bf72d
--- /dev/null
+++ b/docs/NEWS.md
@@ -0,0 +1,1471 @@
+Release 2.01 (2025-06-27)
+-------------------------
+
+General changes:
+
+- Bumped required meson version to 0.52.1 (Andrzej Hajda)
+
+- Added man page for lsgpu. (Peter Senna Tschudin)
+
+Devops changes:
+
+- Improved GitLab CI pipeline. (Andrzej Hajda)
+
+- Bumped Debian version to bullseye and Fedora to latest 42 (Andrzej Hajda)
+
+- Removed MIPS testing (Ryszard Knop and Andrzej Hajda)
+
+Library changes:
+
+- Updated PCI ids for BMG/PTL. (Shekhar Chauhan and Kamil Konieczny)
+
+- Preliminary enablement for Android compilation (Sapna Singh and Jeevaka
+  Prabu Badrappan)
+
+- Improved kernel module un/binding. (Lucas De Marchi and Francois Dugast)
+
+- Added user mode queues UMQ support for amdgpu. (Sunil Khatri)
+
+- Improved Intel GPGPU compute libs. (Francois Dugast and Zbigniew Kempczyński)
+
+- New configfs library. (José Expósito, Jim Shargo, Marius Vlad, Riana Tauro)
+
+- Added PTL support in Xe OA libs. (Sushma Venkatesh Reddy)
+
+- Improved capturing logs for child processes. (Pawel Sikora)
+
+Test changes:
+
+- New test drm_virtgpu for VirtIO-GPU. (Dorinda Bassey)
+
+- New Xe survivability mode testing. (Riana Tauro)
+
+- New amdgpu tests for jpeg and vcn queues. (Ruili Ji)
+
+- New Xe system allocator test. (Matthew Brost).
+
+- Improved Xe fault injection. (Satyanarayana K V P)
+
+- New Xe PXP test. (Daniele Ceraolo Spurio)
+
+- Unified Intel sysfs and debugfs testing. (Peter Senna Tschudin)
+
+- Improved chamelium color test. (Swati Sharma)
+
+- Improved Xe OA testing. (Ashutosh Dixit, Sai Teja Pottumuttu and Umesh
+  Nerlige Ramappa)
+
+- Added dual display subtest in multi plane test. (Karthik B S)
+
+Tools changes:
+
+- New tool intel_hdcp for printing HDCP info on connected outputs. (Santhosh
+  Reddy Guddati)
+
+- Add support for gen10+ devices in intel_gtt (Tomita Moeko)
+
+- Add support for Xe in intel_pm_rpm (Soham Purkait)
+
+Runner changes:
+
+- Use boottime for time checks. (Kamil Konieczny)
+
+Benchmark changes:
+
+- New Xe benchmarks. (Pravalika Gurram)
+
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+
+Release 2.00 (2025-03-13)
+-------------------------
+
+General changes:
+
+- Added Karthik B S as a new maintainer.
+
+Library changes:
+
+- Added GFX1153 to GFX1150 amdgpu family. (Tim Huang)
+
+- Improved kernel module un/loading. (Lucas De Marchi)
+
+- Added ftrace logs at test boundaries. (Umesh Nerlige Ramappa)
+
+- Improved device scanning used in device filters. (Zbigniew Kempczyński)
+
+- Add support to check joiner mode limit. (Jeevan B)
+
+- Updated PCI ids for DG2/MTL/BMG/PTL. (Matt Atwood)
+
+- Added PTL opencl kernels. (Janga Rahul Kumar and Priyanka Dandamudi)
+
+- Extended GPGPU compute square kernel for PTL. (Sai Gowtham Ch)
+
+- Using Long Running mode for GPGPU compute with Xe. (Francois Dugast)
+
+- Make running under Valgrind quiet. (Tvrtko Ursulin)
+
+Runner changes:
+
+- Added igt_runner cmdline to results. (Lucas De Marchi)
+
+- Added printing GPU related facts. (Peter Senna Tschudin)
+
+- Added kmemleak scans. (Peter Senna Tschudin)
+
+- Parse results more persistently. (Kamil Konieczny)
+
+Test changes:
+
+- Improved Xe EUdebug tests. (Dominik Grzegorzek)
+
+- Improved support for 3d testing on VMs for vmwgfx. (Maaz Mombasawala)
+
+- Improved Xe debugfs testing. (Pravalika Gurram)
+
+- Improved amdgpu PCI unplug test. (Vitaly Prosyak)
+
+- Added support for page queues in amdgpu tests. (Jesse Zhang)
+
+- New short hibernate subtest in Intel KMS ccs. (Juha-Pekka Heikkila)
+
+- Renamed test i915_pipe_stress into kms_pipe_stress and added
+  support for Xe in it. (Swati Sharma)
+
+- New test for devcoredump for Xe. (Zhanjun Dong)
+
+- New DP link training validation of both UHBR and non-UHBR link
+  rates over SST and MST configurations. (Kunal Joshi)
+
+- New test for Frame Buffer Compression (FBC) with dirty rectangles which
+  allows FBC to recompress a subsection of a frame. (Santhosh Reddy Guddati)
+
+- New test for EU stall sampling for Xe. (Harish Chegondi)
+
+- New test for eudebug/SR-IOV exclusion for Xe. (Christoph Manszewski)
+
+- New test for PMU (Performance Monitoring Unit) for Xe. (Vinay Belgaumkar
+  and Riana Tauro)
+
+- New test for SRIOV auto-provisioning for Xe. (Marcin Bernatowicz)
+
+- New equal-throughput validation for VFs in SRIOV. (Marcin Bernatowicz)
+
+- Improved test documentation. (Katarzyna Piecielska and Swati Sharma)
+
+- Improved Xe OA test. (Umesh Nerlige Ramappa, Sai Teja Pottumuttu and
+  Ashutosh Dixit)
+
+Tools and scripts changes:
+
+- New tool for measuring display memory bandwidth utilization (Ville Syrjälä)
+
+- New igt_facts tool for displaying GPU related info. (Peter Senna Tschudin)
+
+- Power tool renamed to igt_power (Kamil Konieczny)
+
+- New --pci-slot option in intel_reg for multi-GPU configs. (Łukasz Łaguna
+  and Kamil Konieczny)
+
+- Added kmemleak option to run-tests.sh script. (Peter Senna Tschudin)
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+
+Release 1.30 (2024-12-13)
+-------------------------
+
+General changes:
+
+- New meson options xe_eudebug and vmtb.
+
+Library changes:
+
+- Added PantherLake (PTL) support, unified PCI IDs into one
+  common header pciids.h (Ngai-Mint Kwan)
+
+- Added BMG support for OA (Observability Architecture) for Xe driver.
+  (José Roberto de Souza)
+
+- Added support for Xe3 platforms in GPGPU shader. (Andrzej Hajda)
+
+- Added 6k resolution support for a single CRTC. (Jeevan B)
+
+- Added support for MTL platform in GPGPU compute. (Nishit Sharma)
+
+Runner changes:
+
+- Set option PRUNE_KEEP_ALL as default. (Kamil Konieczny)
+
+- Allow to dynamically ignore dmesg warn messages when generating
+  results, usefull when driver is using kernel fault injection.
+  (Kamil Konieczny).
+
+Test changes:
+
+- Added sanity checks for KMS properties. (Dmitry Baryshkov, Maxime Ripard)
+
+- Improved GPGPU tests for i915 and Xe. (Zbigniew Kempczyński)
+
+- New SRIOV test for Functional Level Reset (FLR) for Xe. (Marcin Bernatowicz)
+
+- Added test that draws triangle without using 3d commands for vmwgfx.
+  (Maaz Mombasawala)
+
+- Added subtest for fallback for DP connector. (Kunal Joshi)
+
+- Added async flips suspend resume subtest. (Santhosh Reddy Guddati)
+
+- New test for error handling of Xe at probe time. (Francois Dugast)
+
+- Added testing SIZE_HINTS property in KMS cursor test. (Ville Syrjälä)
+
+- Added KMS testing for ultrajoiner. (Karthik B S)
+
+- New test for TLB invalidation in Xe. (Sai Gowtham Ch)
+
+- New test for timeslice duration in Xe. (Sai Gowtham Ch)
+
+- Display brightness test during DPMS on and off. (Mohammed Thasleem)
+
+- New tests for EU debugging for Xe. (Dominik Grzegorzek, Mika Kuoppala,
+  Christoph Manszewski, Karolina Stolarek, Maciej Patelczyk, Pawel Sikora,
+  Andrzej Hajda, Dominik Karol Piątkowski, Jonathan Cavitt et al)
+
+Tools changes:
+
+- New power tool for power/energy measurement. (Ville Syrjälä)
+
+- New VM Testbench (VMTB) - SR-IOV Virtual Machine testing tool.
+  (Adam Miszczak)
+
+- Fixes in amd_hdmi_compliance. (Stylon Wang and Wayne Lin)
+
+- Fixes in intel_reg. (Lucas De Marchi)
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+
+Release 1.29 (2024-09-04)
+-------------------------
+
+General changes:
+
+- Added gcc warns: dangling-pointer, int-conversion (Bhanuprakash Modem)
+
+- More guidelines in CONTRIBUTING. (Louis Chauvet, Kamil Konieczny)
+
+- Reorganized Tests: Moved all vendor specific tests to their own dir
+  (Bhanuprakash Modem)
+
+- Fix musl/uclibc build (Bernd Kuhls, Stefano Ragni)
+
+Benchmarks changes:
+
+- New KMS framebuffer stress benchmark. (Arthur Grillo)
+
+- Added basic Xe support in gem_wsim. (Marcin Bernatowicz)
+
+Documentation changes:
+
+- Add documentation about cross-builds. (Mauro Carvalho Chehab)
+
+- Improve tests documentation. (Katarzyna Piecielska)
+
+Library changes:
+
+- Add Battlemage (BMG) support in xe_pciids.h (Andrzej Hajda)
+
+- Add amdgpu GFX1152, GFX1150 and gfx12. (Jesse Zhang and Tim Huang)
+
+- Added inline support for iga64 assembly in GPGPU shader. (Andrzej Hajda)
+
+- Improved KUnit support. (Janusz Krzysztofik)
+
+- Enable igt run on security enhanced distros (like Gentoo/Hardened)
+  (Matt Turner)
+
+- Use blitter as a default for all KMS tests. (Juha-Pekka Heikkila and
+  Bhanuprakash Modem)
+
+- Increased MAX supported pipes to 16 (Pipe-A to Pipe-P) (Vignesh Raman)
+
+- Added generic way to reset sysfs/debugfs attrs to default values upon
+  exit. (Ville Syrjälä)
+
+Runner changes:
+
+- Added hook scripts to igt_runner. (Gustavo Sousa)
+
+Test changes:
+
+- Added support for Xe in KMS tests. (Swati Sharma, Bhanuprakash Modem et al)
+
+- Added new subtests and improvements to VRR. (Bhanuprakash Modem, Jeevan B,
+  Manasi Navare, Sean Paul et al)
+
+- Added new subtests to force joiner. (Kunal Joshi)
+
+- Added fbdev tests to Xe. (Bhanuprakash Modem)
+
+- Added amdgpu fuzzing tests. (Vitaly Prosyak)
+
+- Added syncobj_eventfd test. (Simon Ser)
+
+- Added basic Single-Root IO Virtualization (SRIOV) test. (Katarzyna Dec et al)
+
+- Added prime test for vmwgfx. (Zack Rusin)
+
+- Improved core_getversion. (Rob Clark, Helen Koike, Kamil Konieczny)
+
+- Improved kms_atomic on non-mutable planes. (Melissa Wen)
+
+- Added and improved Xe tests. (Rodrigo Vivi, Matthew Auld, Zbigniew Kempczyński,
+  Francois Dugast, Nirmoy Das, Lucas De Marchi, Janga Rahul Kumar et al)
+
+Tools and scripts changes:
+
+- New Xe perf/OA tools. (Ashutosh Dixit)
+
+- New intel_tiling_detect tool. (Zbigniew Kempczyński)
+
+- New option in lsgpu for printing GPU on PCI bus, working also
+  in case when no gpu driver is loaded. (Zbigniew Kempczyński)
+
+- Added sysfs profiling knob to gputop. (Adrián Larumbe)
+
+- Support for Xe in gputop. (Lucas De Marchi)
+
+- Improved generating test lists at compilation time.(Mauro Carvalho Chehab)
+
+- Improved code coverage. (Mauro Carvalho Chehab)
+
+- Improved intel_vbt_decode and other intel tools. (Ville Syrjälä,
+  Lucas De Marchi, Jani Nikula, Tvrtko Ursulin, Gustavo Sousa et al)
+
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+
+Release 1.28 (2023-09-13)
+-------------------------
+
+General changes:
+
+- New meson options testplan, sphinx and xe_driver. (Mauro Carvalho Chehab)
+
+Library changes:
+
+- Add amdgpu GFX1036, GFX1037 chips. (Jesse Zhang)
+
+- Add xe_pciids.h with Lunar Lake (LNL) support. (Lucas De Marchi)
+
+- Use the new procps library libproc2. (Craig Small)
+
+- Add helper for srandom seed initialization. (Łukasz Łaguna)
+
+- Support for vmwgfx driver. (Maaz Mombasawala, Roye Eshed, Zack Rusin)
+
+- i915_pciids.h updated to include Pontevecchio (PVC) platform.
+  (Niranjana Vishwanathapura)
+
+- Add OAM formats and support for media engines in perf tests.
+  (Umesh Nerlige Ramappa)
+
+- Support for Xe driver. (Matthew Brost, Mauro Carvalho Chehab, Rodrigo Vivi,
+  Jason Ekstrand, Francois Dugast, Philippe Lecluse, Zbigniew Kempczyński,
+  Maarten Lankhorst, Juha-Pekka Heikkila, Bhanuprakash Modem et al)
+
+Runner changes:
+
+- igt_runner can now dump GPU state on timeout. (Chris Wilson)
+
+- igt_runner will now use proper 'abort' as result instead of pseudoresult.
+  (Petri Latvala)
+
+Tools changes:
+
+- New vendor agnostic gputop tool. (Tvrtko Ursulin)
+
+- New tool to dump Intel GuC/HuC CSS header. (Lucas De Marchi)
+
+- Improve tools intel_watermark, intel_vbt_decode, intel_reg. (Ville Syrjälä)
+
+Documentation changes:
+
+- New way for documenting tests will allow to generate documentation and
+  testlists during build, see README.md and test_documentation.md. This
+  is mandatory for Intel (both i915 and xe) and kms tests. (Mauro Carvalho
+  Chehab)
+
+Test changes:
+
+- Move intel specific tests to new directory. (Bhanuprakash Modem)
+
+- Ported and refactored drmlib security tests in amdgpu. (Vitaly Prosyak)
+
+- Switch DRM selftests to KUnit. (Isabella Basso, Dominik Karol Piątkowski,
+  Mauro Carvalho Chehab)
+
+- Enabled MeteorLake aux ccs tests. (Juha-Pekka Heikkila)
+
+- Exercise oversized object detection for Xe. (Priyanka Dandamudi)
+
+- Enable validation for VDSC output formats. (Swati Sharma)
+
+- Add support for Bigjoiner / 8K mode. (Bhanuprakash Modem)
+
+- Use intel_cmds_info library. (Karolina Stolarek)
+
+- Use Intel kernel gpu command definitions. (Zbigniew Kempczyński)
+
+- Add a basic perf_pmu test. (Riana Tauro)
+
+- Add test for V3D's Wait BO IOCTL. (Maíra Canal)
+
+- Add i915_power test for power measurement. (Ashutosh Dixit)
+
+- Remove sysfs_clients. (Lucas De Marchi)
+
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+
+Release 1.27.1 (2023-01-18)
+-------------------------
+
+- Removed gcc option -fcommon from meson.build and fix broken
+  build on Linux RedHat platform. (Zbigniew Kempczyński)
+
+- Updated CONTRIBUTING guidelines for interface deprecation. (Petri Latvala)
+
+- Fixed one additional test bug (Zbigniew Kempczyński)
+
+Release 1.27 (2023-01-12)
+-------------------------
+
+- Support for Intel discrete graphics and other new platforms (Andrzej
+  Turko, Matt Roper, Clint Taylor, Tejas Upadhyay, et al)
+
+- Support for MSM driver. (Mark Yacoub, Rob Clark)
+
+- Support for SRIOV device selection. (Łukasz Łaguna)
+
+- Tiled display emulation support with chamelium. (Kunal Joshi)
+
+- Support for Chamelium v3. (Mark Yacoub)
+
+- Initial FreeBSD support. (Jake Freeland)
+
+- Structured communication from tests to igt_runner. (Petri Latvala)
+
+- Removed last remaining uses of libdrm_intel in tests and
+  tools. (Zbigniew Kempczyński)
+
+- Automatic kernel code coverage collection during testing. (Mauro
+  Carvalho Chehab)
+
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+
+Release 1.26 (2021-04-23)
+-------------------------
+
+- Autotools support has been entirely dropped in favor of only meson. (Arkadiusz Hiler)
+
+- Tests can now signal that the whole test round should be aborted. (Arkadiusz Hiler)
+
+- Various robustness improvements for Chamelium use. (Arkadiusz Hiler,
+  Kunal Joshi, Imre Deak, et al)
+
+- Device filtering improvements for multi-device use. (Arkadiusz Hiler)
+
+- Device filtering for various Intel tools like intel_gpu_top. (Ayaz A Siddiqui)
+
+- Overhauled kernel parameter handling. (Jani Nikula)
+
+- Introduced an i915 batchbuffer facility. (Zbigniew Kempczyński)
+
+- Improvements for testing nouveau. (Lyude Paul)
+
+- More readable and useful output for lsgpu and other tools that list
+  devices. (Tvrtko Ursulin)
+
+- intel_gpu_top can now show per-client busyness stats. (Tvrtko Ursulin)
+
+- igt_runner can now limit the disk space used by a single test. (Petri Latvala)
+
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+
+Release 1.25 (2020-03-20)
+-------------------------
+
+- Meson build options have been renamed. Please check the news options in
+  meson_options.txt and make sure you don't get any warnings when configuring
+  the project. (Simon Ser)
+
+- Compile-testing CI for MIPS. (Guillaume Tucker)
+
+- Various igt_runner reliability improvements (Petri Latvala & Arkadiusz Hiler)
+
+- Switched GEM tests to engine discovery. (Tvrtko Ursulin et al)
+
+- Subtests can now be documented and their descriptions are available in
+  generated HTML docs and on the command line via --describe. Documenting new
+  tests is mandatory. (Arkadiusz Hiler)
+
+- Unified library for EDID creation (Simon Ser)
+
+- Chamelium port auto-discovery (Simon Ser)
+
+- Tigerlake support (Lucas De Marchi)
+
+- Cometlake support (Anusha Srivatsa)
+
+- Add kernel selftest wrapper for dmabuf (Chris Wilson)
+
+- Bumped required meson version to 0.47.2 (Arkadiusz Hiler)
+
+- Rewritten README to be more friendly (Arkadiusz Hiler)
+
+- Introduced dynamic subsubtests for getting partial result for
+  runtime-dependant features (Petri Latvala)
+
+- IGT can now run on the selected GPU via --device and lsgpu tool (Zbigniew
+  Kempczyński)
+
+- Reduced runtime of many many tests (Chris Wilson et al)
+
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+
+Release 1.24 (2019-06-20)
+-------------------------
+
+- Bumped required meson version to 0.47. (Arkadiusz Hiler)
+
+- All the meson build options that used auto, true and false are now first
+  class 'feature' options taking auto, enabled and disabled. (Arkadiusz Hiler)
+
+- Piglit as the primary test executor replaced by mostly drop-in
+  compatible igt_runner. (Petri Latvala)
+
+- Stack traces now contain source file names and line numbers, using
+  libdw. (Maarten Lankhorst)
+
+- Pixman dependency is now mandatory. (Maxime Ripard)
+
+- The project has moved to gitlab, and uses gitlab's CI to build test
+  and sanity test each commit on various distributions and
+  architectures. (Arkadiusz Hiler et al)
+
+- Shader debugger removed due to lack of use and accumulation of
+  bitrot. (Arkadiusz Hiler)
+
+- Added support for testing DP/HDMI audio with the Chamelium device,
+  dropping the audio tests that required exotic custom hardware to
+  execute. (Simon Ser)
+
+- Autotools support dropped for various parts of IGT (assembler,
+  documentation, etc). (Daniel Vetter)
+
+- intel-gpu-top can now output data to stdout or a log file for
+  noninteractive use. (Tvrtko Ursulin)
+
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+
+Release 1.23 (2018-07-18)
+-------------------------
+
+General changes:
+
+- Bumped used C standard to gnu11. (Lucas De Marchi)
+
+- Bumped required meson version to 0.44. (Petri Latvala)
+
+- Introduced meson options for explicit control over optional dependencies.
+  (Petri Latvala)
+
+- Added a meson option to set runpath for the installed executables.
+  (Petri Latvala)
+
+- GLib is now a mandatory dependency. (Petri Latvala)
+
+- Added testlists for the vc4 driver. (Maxime Ripard)
+
+- The project has now finalized its name change and is now IGT GPU Tools,
+  docs and install paths are now "igt-gpu-tools". (Arkadiusz Hiler)
+
+- Added a blacklist for the Intel CI. (Petri Latvala)
+
+
+Library changes:
+
+- i915_pciids.h updated to include KBL, ICL, WHL and AML.
+  (José Roberto de Souza, Paulo Zanoni)
+
+- Overhaul of gpu_cmds, gpgpu_fill, media_fill and rendercopy.
+  (Katarzyna Dec, Lukasz Kalamarz)
+
+- Added igt_matrix and igt_color_encoding helper libraries. (Ville Syrjälä)
+
+- IGT now shows the kernel stack trace when reporting a GPU hang. (Chris Wilson)
+
+- Added Icelake platform support. (Arkadiusz Hiler, Paulo Zanoni)
+
+
+Tools changes:
+
+- intel-gpu-top was rewritten to be safe to use. (Tvrtko Ursulin)
+
+
+Documentation changes:
+
+- Documented commit rights in CONTRIBUTING. (Daniel Vetter)
+
+
+Test changes:
+
+- kms_prs_sink_crc was renamed to kms_psr. (Dhinakaran Pandiyan)
+
+- kms_frontbuffer_tracking no longer tests sink crc. (Dhinakaran Pandiyan)
+
+- drm_vma_limiter is no more. (Chris Wilson)
+
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+
+Release 1.22 (2018-03-09)
+-------------------------
+
+General changes:
+
+- Libudev has been made a mandatory dependency. (Antonio Argenziano)
+
+- Documentation changed to refer to the new igt-dev mailing
+  list. (Rhys Kidd)
+
+Library changes:
+
+- Refactored timer usage for smaller code size. (Chris Wilson)
+
+- Various fixes to support planar framebuffers. (Maarten Lankhorst)
+
+- Added support for fetching the most recent CRC without waiting for a
+  vblank, along with flushing the queue of already collected
+  CRCs. (Maarten Lankhorst)
+
+- Added a helper to mark BOs purgeable on vc4. (Boris Brezillon)
+
+- Moved handling of a "cork" BO into lib from various tests.
+  (Daniele Ceraolo Spurio)
+
+- Added support for looping over physical i915 engines, as opposed to
+  uABI engines that can alias. (Chris Wilson)
+
+- Added an accelerated method for reading from WC buffers.
+  (Chris Wilson)
+
+Tools changes:
+
+- Improved intel_vbt_decode output, updated the data from current
+  kernel. (Jani Nikula)
+
+- intel_reg can now read/write registers using a given engine.
+  (Mika Kuoppala)
+
+- Aubdump can now simulate enhanced execlist submission, for
+  gen11+. (Scott D Phillips)
+
+
+
+
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+Release 1.21 (2018-01-16)
+-------------------------
+
+Library changes:
+
+- Added helpers for using DRM syncobj. (Jason Ekstrand)
+
+- Refactored several i915 helpers into library functions.
+  (Michał Winiarski)
+
+- Improved the GPU quiescing code to more thoroughly flush old data
+  and pending work. (Chris Wilson)
+
+- Reworked DRM property handling to be more suitable for
+  atomic commits. (Maarten Lankhorst)
+
+- Removed support for legacy CRC API. The generic API has been
+  available since kernel 4.10. (Maarten Lankhorst)
+
+- Opening a DRM device now automatically loads its module. (Chris Wilson)
+
+- Imported the drm-uapi headers as copies instead of using what's
+  installed in the system. (Eric Anholt)
+
+- Moved the perf code to its own library from
+  intel-gpu-overlay. (Tvrtko Ursulin)
+
+- Removed Android support due to lack of use and
+  maintenance. (Arkadiusz Hiler)
+
+- Upgraded meson to official production status, automake is still kept
+  around for now.
+
+Tools changes:
+
+- Improved the output of intel_vbt_decode. (Jani Nikula)
+
+- intel_error_decode now prints user buffers if they contain debug
+  logs. (Chris Wilson)
+
+- Improved the output of intel_watermark. (Ville Syrjälä,
+  Dhinakaran Pandiyan)
+
+- Aubdump can now simulate execlist submission, converting from ring
+  buffer submission method. (Scott D Phillips)
+
+- intel-gpu-overlay can now show data from perf PMU. (Tvrtko Ursulin,
+  Chris Wilson)
+
+- intel-gpu-overlay now parses tracepoint locations from
+  sysfs. (Lionel Landwerlin)
+
+Documentation changes:
+
+- Documentation can now be built with Meson. (Daniel Vetter)
+
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+Release 1.20 (2017-10-03)
+-------------------------
+
+Library changes:
+
+- Added helpers for launching external processes and capturing their
+  outputs. (Abdiel Janulgue)
+
+- Increased max pipe count to 6 to support AMD GPUs. (Leo (Sunpeng) Li)
+
+- Various improvements for Chamelium support. (Paul Kocialkowski)
+
+- Added Coffeelake platform support. (Rodrigo Vivi, Anusha Srivatsa)
+
+- Added Cannonlake platform support. (Rodrigo Vivi)
+
+- Added support for audio testing. (Paul Kocialkowski)
+
+- Added preliminary meson build system support. (Daniel Vetter, et al)
+  -- Autotools remains the supported build system for now.
+
+Tools changes:
+
+- Refactored video bios data to use definitions copied from the
+  kernel. (Jani Nikula)
+
+Documentation changes:
+
+- Added user and developer documentation about Chamelium support to
+  aid deploying the platform. (Paul Kocialkowski)
+
+- Added documentation about the required hardware setup for audio
+  testing. (Paul Kocialkowski)
+
+Tests changes:
+
+- Converted remaining shell-script tests to C code (Abdiel Janulgue)
+
+- Multiple new tests.
+
+
+And many other bug fixes and improvements.
+
+Release 1.19 (2017-06-09)
+-------------------------
+
+Library changes:
+
+- Changed debugfs handlers to open files for the DRM device in use,
+  for setups with more than one DRM device. (Tomeu Vizoso)
+
+- Added support for 4K and audio HDMI EDID injection. (Abdiel
+  Janulgue, Marius Vlad)
+
+- Added support for AMDGPU devices. (Chris Wilson)
+
+Tools changes:
+
+- intel_error_decode now automatically opens a pager. (Chris Wilson)
+
+- intel_error_decode now dumps the GuC firmware logs if available.
+  (Chris Wilson)
+
+Benchmark changes:
+
+- gem_wsim: New benchmark that simulates command submission
+  workloads. (Tvrtko Ursulin)
+
+Scripts changes:
+
+- trace.pl: New tool to parse i915 tracepoints for performance
+  analysis. (Tvrtko Ursulin)
+
+- media-bench.pl: New tool to programmatically analyze simulated media
+  workloads using gem_wsim to find the optimal load balancing
+  strategy. (Tvrtko Ursulin)
+
+Test changes:
+
+- Imported amdgpu tests from libdrm. (Chris Wilson)
+
+- Multiple other new tests.
+
+
+And many other bug fixes and improvements.
+
+Release 1.18 (2017-03-13)
+-------------------------
+
+Library changes:
+
+- Various changes to library functions so that they don't assume Intel
+  hardware. (Lyude)
+
+- Added helper functions for managing synchronization primitives.
+  (Robert Foss)
+
+- Added support for the new generic CRC capture kernel ABI. (Tomeu
+  Vizoso)
+
+- Added Geminilake platform support. (Ander Conselvan de Oliveira)
+
+- Added helpers for sysfs hotplug events. (Lyude)
+
+- Added support for hotplug testing with the Chamelium device (Lyude)
+
+Tools changes:
+
+- intel_dp_compliance: New tool for running automated DisplayPort
+  compliance tests. (Manasi Navare)
+
+- Renamed intel_bios_reader to intel_vbt_decode. (Jani Nikula)
+
+- intel_gvtg_test: New tool for setting up GVT-g guests based on
+  KVMGT. (Terrence Xu)
+
+Test changes:
+
+- Multiple new tests.
+
+
+And many other bug fixes and improvements.
+
+Release 1.17 (2016-12-02)
+-------------------------
+
+Library changes:
+
+- Added an iterator that generate primes for creating input data that
+  should not fall into any patterns that may be optimised by the
+  drivers. (Chris Wilson)
+
+- Crashes in fixture blocks now print a stacktrace. (Marius Vlad)
+
+- Added support for various system suspend/resume options. (Imre Deak)
+
+- Added linked list helpers from the Wayland project. (Lyude)
+
+- Added a generic dummy workload helper for submitting GPU workloads
+  that consume exactly a specified amount of time. (Abdiel Janulgue)
+
+- Added C functions for driver loading/unloading, pkill and lsof, for
+  converting shell script tests to C code. (Marius Vlad)
+
+Tools changes:
+
+- intel_reg: Add Kabylake support. (Jani Nikula)
+
+- intel_bios_reader: Also dump PSR info. (Ville Syrjälä)
+
+- intel_guc_logger: New tool for capturing logs from the GuC
+  firmware. (Akash Goel)
+
+- intel_aubdump: Added commandline option to stream the dump to
+  another process. (Lionel Landwerlin)
+
+- intel_aubdump: Annotate the dump with the application name and the
+  used PCI ID. (Jason Ekstrand)
+
+Benchmark changes:
+
+- gem_latency: Added support for measuring fence wakeup latencies. (Chris Wilson)
+
+- prime_lookup: New microbenchmark for stressing prime_fd_to_handle
+  and prime_handle_to_fd. (Chris Wilson)
+
+Test changes:
+
+- Multiple new tests.
+
+- Added an explicit list of tests used for Intel CI. (Petri Latvala)
+
+- Converted multiple shell script tests to C. (Marius Vlad)
+
+
+And many other bug fixes and improvements.
+
+Release 1.16 (2016-09-02)
+-------------------------
+
+- Build automatically tests required when issueing a make check, Tests/subtests
+that receive a crash signal should print a backtrace when i-g-t is built with
+libunwind support (Marius Vlad)
+
+- lib/igt_kms: Force connector probing on first use (Chris Wilson)
+
+- vc4: Add a test for BO lookup failure error path (Eric Anholt)
+
+- tests/gem_mocs_settings: Remove direct register tests,
+and added RC6 tests (Peter Antoine)
+
+- Check for libdrm_intel and build if present, Add stubs for intel_bufmgr
+(Robert Foss)
+
+- igt/gem_mmap_gtt: Add a test to detect non-WC access (Chris Wilson)
+
+- Various documentation improvements (Daniel Vetter)
+
+- Added new tests: tests/kms_rmfb and tests/kms_atomic_transition, a test for
+fastboot, tests/kms_panel_fitting, and a test that only tries to set the
+current property values back, tests/kms_properties. Various improvements to
+tests/kms_cursor_legacy (Maarten Lankhorst)
+
+- lib/igt_kms: Use pipes for committing, not outputs and assign pipe properties
+in pipe init and many other improvements (Maarten Lankhorst)
+
+- tests/gem_workarounds: read test added as a basic test, fix assertion of num
+of regs (Mika Kuoppala)
+
+- Various improvements to tools/intel_bios_reader and tools/intel_reg (Ville
+Syrjälä)
+
+- lib: Add x86 cpuid based feature detection (Chris Wilson)
+
+- demos/intel_sprite_on: Instead of looping until the first disconnected port
+is found, now go through all possible connectors, drawing the sprite on any
+connected display. (Jim Bride)
+
+- Multiple improvements to lib/igt_kms (Robert Foss)
+
+- lib/igt_aux: Framework for measuring latency in raising signals (Chris
+Wilson)
+
+- Various modifications to intel_chipset: Replace lookup of GT size with
+computation, remove unused PCI_CHIP ids, converting platforms names using
+device info (Chris Wilson)
+
+- tests/kms_chv_cursor_fail: Run the tests with fewer steps
+(Maarten Lankhorst)
+
+- lib/intel_chipset: Add more Kabylake PCI IDs and removed PCI IDs that are no
+longer listed as Kabylake (Rodrigo Vivi)
+
+- Basic framework for GVT-g testing has landed (Chris Wilson)
+
+- Various improvements to tests/kms_flip (Ville Syrjälä)
+
+- igt/kms_cursor_legacy: Add a rudimentary test to detect stalled cursors,
+detect pageflip errors and check that cursor updates do not stall flips
+(Chris Wilson)
+
+- vGEM support: lib and added tests/vgem_basic, tests/vgem_slow and
+tests/vgem_reload_basic (Chris Wilson)
+
+- Various fixes to tests/kms_frontbuffer_tracking: prefer BLT drawing, recreate
+FBS at every subtest and properly handle mixing GTT and WC mmaps (Paulo Zanoni)
+
+- Replace drv_missed_irq_hang script with a C-equivalent: tests/drv_missed_irq
+(Chris Wilson)
+
+- Added a test case for polling dma-buf fences: tests/prime_busy (Chris Wilson)
+
+- lib/igt_gt: Omit illegal instruction on gen8+ and time
+constrains on hang detection (igt/gem_reset_stats) (Mika Kuoppala)
+
+- Added tests/kms_invalid_dotclock, a test that makes sure every modeset gets
+rejected by the kernel if the requested dotclock is beyond the hardware
+capabilities (Ville Syrjälä)
+
+- tests/gem_stolen: Verify contents of stolen-backed objects across
+hibernation, fix for no_mmap subtest and check for available stolen memory size
+(Ankitprasad Sharma)
+
+- tests/core_prop_blob: Add invalid tests to set fb props (Daniel Vetter)
+
+- Many more fixes and improvements.
+
+Release 1.15 (2016-05-31)
+-------------------------
+
+- New KMS test: tests/kms_cursor_legacy (Stress legacy cursor ioctl)
+(Chris Wilson)
+
+- Several GEM tests have been removed from BAT: tests/gem_exec_whisper,
+tests/gem_sync (dropped individual engines), test/gem_cs_prefetch (replaced
+by test/gem_exec_gttfill), tests/gem_ctx_param_basic (got relabeled
+to tests/gem_ctx_param) (Chris Wilson)
+
+- build: Skip configure step if is NOCONFIGURE set (Tomeu Vizoso)
+
+- tools/intel_bios_reader: Added options for dumping individual panels, specific
+section, hex format and other various fixes (Jani Nikula)
+
+- build: Add optional --enable-werror
+(hard-fail in case of compiler warnings) (Marius Vlad)
+
+- New KMS test: tests/prime_mmap_kms (show case dma-buf new API
+and processes restrictions) (Tiago Vignatti)
+
+- Several tests have gained to ability to be run on different platforms
+than Intel: tests/testdisplay (Tomeu Vizoso), tests/kms_panel_fitting
+(Robert Foss), tests/kms_flip_event_leak, tests/kms_flip (Tomeu Vizoso).
+
+- compute exitcode first: In the case of running multiple subtests which all
+happen to be skipped, igt_exitcode is 0, but the final exit code will be 77.
+(Chris Wilson)
+
+- Shorten tests/kms_flip test (Tvrtko Ursulin)
+
+- Half the timeout for suspend to RAM and a third for suspend to disk
+(Marius Vlad)
+
+- lib: Pass format instead of bpp to create_bo_for_fb (Ville Syrjälä)
+
+- Removed from tests/test-list.txt, tests/gem_concurrent_all and added
+tests/test-list-full.txt that contains all the tests. This will speed
+up considerably piglit when starting tests. (Gabriel Feceoru)
+
+- piglit changed its behaviour to prevent overwriting the results. A fairly new
+version of piglit is required to run i-g-t tests. (Gabriel Feceoru)
+
+- lib: Replace drmIoctl() with a layer of indirection (Chris Wilson)
+
+- Adding missing Broxton PCI IDs (Rodrigo Vivi)
+
+- Added COMMIT_ATOMIC (lib/igt_kms, w/ tests/kms_rotation_crc).
+Requires nuclear_pageflip parameter turned on in the i915 driver.
+(Mayuresh Gharpure, Pratik Vishwakarma)
+
+- man/: rewrite manual pages in reStructuredText (Jani Nikula)
+
+- tests/drv_module_reload_basic: perform fault injection (Chris Wilson)
+with various improvements (Imre Deak)
+
+- Removed tests/gem_multi_bsd_sync_loop which was superseded by
+tests/gem_ring_sync_loop and tests/gem_dummy_reloc_loop by
+tests/gem_exec_reloc (Chris Wilson)
+
+- New GEM tests: tests/gem_exec_whisper, tests/gem_exec_store,
+test/gem_exec_gttfill, tests/gem_exec_suspend, tests/gem_exec_flush
+(Chris Wilson)
+
+- New benchmarks: benchmarks/gem_syslatency, benchmarks/gem_exec_fault
+(Chris Wilson)
+
+- tests/gem_exec_nop included in BAT (Chris Wilson)
+
+- tests/pm_rpm: Fix crash on machines that lack LLC (David Weinehall)
+
+- lib/igt_fb: Fix domain tracking for GTT cairo surfaces (Chris Wilson)
+
+- Add igt_subtest_group to allow igt_fixture for only a subset of subtests
+without skipping/failing all subsequent subtests. (Daniel Vetter)
+
+- Many more fixes and improvements.
+
+Release 1.14 (2016-03-01)
+-------------------------
+
+- New test: gem_create validate parameters for GEM_CREATE ioctl
+(Ankitprasad Sharma)
+
+- New test: gem_softpin exercise the userptr ioctl to create shared
+buffers between CPU and GPU (Vinay Belgaumkar)
+
+- New tests: prime_mmap_coherency/kms_mmap_write_crc cache coherency
+tests (Tiago Vignatti)
+
+- New test: prime_mmap mmap() on dma-buf fds (Rob Bradford)
+
+- New test: gem_exec_reloc sanity check of execbuf-ioctl relocations (Chris
+Wilson)
+
+- New test: gem_exec_basic sanity check of execbuf-ioctl rings (Chris Wilson)
+
+- improved igt_hang_ring() infrastructure for generic hang injection support in
+the core library (Chris Wilson)
+
+- new igt_pm library to collect power management testing helpers (David
+Weinehall)
+
+- lig/igt_vc4: VC4 support library (Eric Anholt)
+
+- kms_frontbuffer_tracking: included in BAT (Paulo Zanoni)
+
+- kms_psr_sink_crc: Add BAT test for PSR active (Rodrigo Vivi)
+
+- gem_wait: test superseded by gem_latency in benchmarks (Chris Wilson)
+
+- igt_core: Fix logging to display extended line (Derek Morton)
+
+- igt_core: Expand --run-subtest functionality (Derek Morton)
+
+- kms_force_connector_basic: various fixes and included in BAT set (Daniel
+Vetter)
+
+- Many other improvements and bug fixes.
+
+Release 1.13 (2015-12-02)
+-------------------------
+
+- New test: kms_atomic tests atomic mode setting (Daniel Stone)
+
+- New test: core_prop_blob tests blob properties (Daniel Stone)
+
+- New test: gem_request_retire targets request retirement code paths
+  (Tvrtko Ursulin)
+
+- New test: core_setmaster_vs_auth checks that drop/setMaster correctly
+  transfer master state (Thomas Hellstrom/Daniel Vetter)
+
+- Wildcard characters are now accepted when using the --run-subtest command
+  line option to specify multiple subtests to run. (Thomas Wood)
+
+- Add support for Broxton in intel_audio_dump (Han Lu)
+
+- Added Kabylake support (Rodrigo Vivi/Wayne Boyer)
+
+- Many other bug fixes and improvements
+
+Release 1.12 (2015-09-11)
+-------------------------
+
+- Various new tests and tools
+
+- New statistical analysis functions. (Damien Lespiau)
+
+- New benchmark tests. (Chris Wilson)
+
+- Old register tools that were superseded by intel_reg have been removed.
+
+- Various tests have been marked "basic", to indicate they are suitable for
+  use in basic acceptance testing. (Jesse Barnes)
+
+- Per-ring gem_storedw_loop tests combined into a single test with subtests.
+  (Jesse Barnes)
+
+- New "aubdump" tool, used to launch an application and capture rendering to
+  an AUB file. (Kristian Høgsberg Kristensen)
+
+- Cherryview support added to intel_display_poller. (Ville Syrjälä)
+
+- Skylake and Broadwell support added to gem_gpgpu_fill tests.
+  (Dominik Zeromski)
+
+- Support for running core drm tests on any platform. (Micah Fedke)
+
+- Many other bug fixes
+
+Release 1.11 (2015-06-11)
+-------------------------
+
+- Various new tests and tools
+
+- Single combined test list (supported by piglit since commit 8a122bb)
+
+- Optional dependency on libunwind to provide automatic stack traces on test
+  failures. (Thomas Wood)
+
+- Add optional default debug and optimisation flags for tests to enable better
+  stack traces and debugging. (Thomas Wood)
+
+- Test programs are now installed into libexec. This is useful when building a
+  complete software stack for a DUT from scratch. (Building and installing
+  tests can still be disabled by the --disable-tests configure flag.)
+  (Joonas Lahtinen)
+
+- New tool to decode watermark registers (Ville Syrjälä)
+
+- Timeout mechanism now reports test as failed
+
+- Introduce intel_reg as the one Intel graphics register multitool to replace
+  intel_reg_read, intel_reg_write, intel_iosf_sb_read, intel_iosf_sb_write,
+  intel_vga_read, intel_vga_write, intel_reg_dumper, intel_reg_snapshot,
+  and quick_dump.py. (Jani Nikula)
+
+- Add functions to manipulate i915.ko parameters and ensure features are enabled
+  for testing. (Paulo Zanoni)
+
+Release 1.10 (2015-03-12)
+-------------------------
+
+- New frequency manipulation tool (intel_gpu_frequency)
+
+- Adjustments for the Solaris port (Alan Coopersmith).
+
+- Remove tests/NAMING-CONVENTION since it's all in the docbook now, to avoid
+  divergent conventions.
+
+- New CRITICAL log level for really serious stuff (Thomas Wood).
+
+- Interactive test mode can now be enabled by the shared cmdline option
+  --interactive-debug=$var (Rodrigo Vivi).
+
+- Improved logging to kmsg to better line up test runs with kernel messages
+  (Chris Wilson).
+
+- Record all log levels (including disabled levels) in a ringbuffer and dump
+  that on test failures for quicker diagnostics of automated test run results
+  (Thomas Wood).
+
+- A lot of small polish all over the test library.
+
+- Piles of new testcases and improvements to existing ones as usual.
+
+Release 1.9 (2014-12-12)
+------------------------
+
+- New test cases added: drm_import_export, gem_gpgpu_fill, gem_ppgtt,
+  gem_tiled_wb, kms_pwrite_crc.
+
+- New helper for interactive progress indicators (see igt_print_activity and
+  igt_progress), which can be disabled by setting the log-level to warn (Thomas
+  and Daniel).
+
+- Basic skl support: pci ids, rendercopy & mediafill (Damien, Zhao Yakui).
+
+- chv support for the iosf sideband tools and a few other improvements (Ville).
+
+- Fence register support for intel_reg_dumper on bdw+ (Rodrigo).
+
+- Support for skl in quick_dump (Damien).
+
+- Golden state generation infrastructure (Mika).
+
+- New skl watermark tool (Damien).
+
+- New EDID test block that includes multiple display modes (Thomas).
+
+- Individual test documentation available in generated documentation and from
+  the test binaries (Thomas).
+
+- New logging domains and log filtering (Thomas).
+
+- Various API documentation fixes and improvements (Thomas).
+
+Release 1.8 (2014-09-08)
+------------------------
+
+- Added lib/igt.cocci semantic patch to catch often-seen patterns and convert
+  them to igt macros/infrastructure.
+
+- Improvements to the documentation build systems (Thomas).
+
+- Small fixes and improvements to the igt infrastructure and helpers all over.
+
+- As usual piles of new tests.
+
+- Improved plane/pipe handling in the igt_kms library (Damien).
+
+- Unified option parsing between simple tests and tests with subtests (Thomas).
+  This will allow us to merge the different Makefile targets once test runners
+  are converted.
+
+- New commit functions for igt_kms to support the new universal planes
+  interfaces (Matt Roper).
+
+- Polish the debug output when test requirements aren't met a bit and inject the
+  program name/subtest in dmesg for easier backtrace/oom debugging (Chris).
+
+- A bit of polish for the framebuffer helper functions (Damien).
+
+- Robuster option parsing helpers, they now check for conflicts when merging
+  different option lists (Thomas).
+
+- MIPI DSI vbt support in intel_bios_read (Gaurav K Singh).
+
+- Clarify the split between low-level helpers and the high-level library in
+  igt_kms a bit by renaming some functions and improving and extending the api
+  documentation.
+
+- Helper to restore the vt mode, useful to test lastclose/fbdev emulation
+  behaviour (Thomas).
+
+- Refactor the support for 64bit relocs. By specifying the number of relocations
+  explicit a lot of the gen8 checks can be removed from simple testcases which
+  only use the blitter (Chris).
+
+Release 1.7 (2014-06-09)
+------------------------
+
+- Piles of API documentation for the core i-g-t testing libraries.
+
+- Improved igt loggin, now also with igt_vlog (for va_args printf-style
+  logging).
+
+- Polish for the igt_debugfs library.
+
+- Split out igt_fb library from igt_kms, cleanup of the igt_kms functions.
+
+- Android porting patches (Tim Gore, Tvrtko Ursulin).
+
+- Piles more tests as usual.
+
+- Support for building libcairo based tests on Android. Set ANDROID_HAS_CAIRO=1
+  in the build enviroment when you have this (Tim Gore).
+
+- Timeout support in igt_aux, see igt_set_timeout (Thomas).
+
+- Documentation for the testrunner interface like exit codes, subtest
+  enumeration and log output. Should help other people to run the tests in their
+  own framework.
+
+- Make swig an optional dependency (Damien).
+
+- Helpers for runtime pm tests in igt_aux.
+
+Release 1.6 (2014-03-13)
+------------------------
+
+- Changes to support Broadwell in the test suite. (Ben, Damien, et al.)
+
+- Updated (now working again!) Android support from Oscar Mateo.
+
+- Test coverage through i-g-t is now officially an integral part of any drm/i915
+  feature work and also for bugfixes. For more details see:
+
+  http://blog.ffwll.ch/2013/11/testing-requirements-for-drmi915.html
+
+- Fix the gen4asm build dependency handling, now that the assembler is included in
+  i-g-t (Ben).
+
+- Improve the cairo object lifetime management of the kmstest helpers (Chris).
+
+- Allow register access to succeed if i915 is loaded but debugfs isn't found
+  (i.e. nomodeset is used)
+
+- New kernel modesetting helper library for simpler testcases (Damien).
+
+- New structure logging support for tests. Message at the WARN level be
+  reflected in the piglit result, also included igt_warn_on macros to simplify
+  test asserts which should just result in warnings, but not in a test abort.
+
+- Broadwell support for intel_audio_dump (Mengdong Lin).
+
+- API documentation support (Thomas)
+
+Release 1.5 (2013-11-06)
+------------------------
+
+- Some polishing of the test infrastructure, for details see:
+
+  http://blog.ffwll.ch/2013/09/more-drmi915-testsuite-infrastructure.html
+
+- Haswell support for the DPF tool (tools/intel_l3_parity) and other
+  improvements (Ben).
+
+- Stereo/3D support in testdisplay (Damien).
+
+- Support for gen7 gpu perf counters in tools/intel_perf_counters (Kenneth).
+
+- Improvements to the VBT decoder (Jani).
+
+- New tool to read legacy VGA registers (Ville).
+
+- New helpers in the test library to help deal with debugfs files and the new
+  display pipe CRC support (Damien).
+
+- Introduction of a proper naming convention for all the testcases, see
+  tests/NAMING-CONVENTION.
+
+- As usual tons of new testcases and improvements and bugfixes to existing ones.
+
+- The testsuite framework itself has gained some regression tests which can be
+  run at compile-time with "make check".
+
+- New helpers for the drop_cache kernel interface and use drop_caches(RETIRE) to
+  really make sure the gpu is idle in testcases (Oscar Mateo).
+
+Release 1.4 (2013-09-16)
+------------------------
+
+- Integration of the gen4+ assembler (Damien).
+
+- Start of a new performance analysis tool from Chris Wilson with front-ends for
+  both X11 and plain kms. This uses the perf subsystem and the gpu performance
+  counter kernel patches from Chris.
+
+- New register dumper quick_dump from Ben, with lots of work from Damien. This
+  will superseed intel_reg_dumper for newer platforms (which are not yet
+  released) since it will allow us to automatically generate register dumps from
+  the internal xml register specifications.
+
+- Tools to access the pletoria of new indirect register access functions on
+  newer platforms.
+
+- Framebuffer contents dumper to debug some of the nastier corruption issues.
+  The advantage here is that this bypasses any userspace drivers and so avoids
+  that the corruptions get magically fixed when taking an X screenshot.
+
+- Tons of new testcases. Including subtests we are now at roughly 450 tests!
+
+- Improvements to the test framework infrastructure. See
+  http://blog.ffwll.ch/2013/08/recent-drmi915-testsuite-improvements.html
+  for an overview.
+
+Release 1.3 (2012-08-27)
+------------------------
+
+- massive improvements to the testsuite
+- dpf tool for handling l3 remapping on gen7 (Ben)
+- robustify against wc gtt mappings (Chris)
+- improvements to the reg_dumper and register read/write tools
+- haswell support
+
+Release 1.2 (2012-02-09)
+------------------------
+
+- intel_audio_dump improvements (Wu Fengguang)
+- buildsystem improvements (Gaetan Nadon)
+- solaris support (Alan Coopersmith)
+- massive refactoring of testcases and rendercpy extraction
+- new tests
+- fixed up intel_reg_read/write for platforms needing forcewake (needs a
+  kernel patch which from 3.3 to work on ivb - Ben Widawsky)
+
+Release 1.1 (2011-12-24)
+------------------------
+
+Improved testsuite, usable for kernel regression testing!
+
+Release 1.0 (2009-04-27)
+------------------------
+
+Initial release:
+- miscellaneous userland tools that don't really fit into the 2D driver tree
+- standalone regression tests for the DRM (make check)
+- microbenchmarks of the DRM for kernel performance regression testing
diff --git a/docs/api.md b/docs/api.md
new file mode 100644
index 000000000..cbe2a7da1
--- /dev/null
+++ b/docs/api.md
@@ -0,0 +1,30 @@
+# IGT GPU Tools API
+
+**IGT GPU Tools** provides a set of C libraries and helper macros for writing and
+running test cases targeting the Linux graphics stack.
+
+Generated documentation is available at:
+
+ - [IGT API Reference](https://drm.pages.freedesktop.org/igt-gpu-tools/)
+
+## Purpose
+
+The API is designed to:
+
+ - Simplify interaction with kernel graphics drivers (e.g., via DRM ioctls)
+ - Provide reusable infrastructure for writing test cases
+ - Offer abstractions for managing displays, buffers, events, and execution contexts
+
+## Key Components
+
+ - `igt_assert`, `igt_skip`, `igt_require`: Macros for managing test flow
+ - `igt_fixture`, `igt_subtest`: Infrastructure for setup/teardown and subtest isolation
+
+Helper modules for:
+  - Buffer objects (e.g., `intel_buf`)
+  - Display configuration (e.g., `kmstest`, `igt_display`)
+  - Memory mapping, fences, command streams, and performance counters
+
+##  Examples
+
+For code examples, browse the `tests/` and `lib/` directories.
diff --git a/docs/blocklists.md b/docs/blocklists.md
new file mode 100644
index 000000000..f81e43d99
--- /dev/null
+++ b/docs/blocklists.md
@@ -0,0 +1,387 @@
+# :material-block-helper: Blocklists
+
+## :material-information-outline: Overview
+
+Blocklists (formerly called blacklists) in IGT GPU Tools are essential mechanisms for
+excluding problematic, unstable, or inappropriate tests from automated CI runs. They help
+maintain CI stability by filtering out tests that are known to cause issues, while still
+preserving the tests in the codebase for manual execution or future fixing.
+
+!!! info "Purpose"
+    Blocklists allow CI systems to run comprehensive test suites while automatically excluding tests that:
+
+    - Are known to be flaky or unstable
+    - Require specific hardware configurations not available in CI
+    - Are under development and not ready for production testing
+    - Cause system hangs or crashes
+    - Are deprecated but not yet removed
+
+## :material-file-outline: Blocklist Files
+
+### Driver-Specific Blocklists
+
+IGT maintains separate blocklists for different GPU drivers and testing scenarios:
+
+| File | Purpose | Usage |
+|||--|
+| **`blacklist.txt`** | i915 driver test exclusions | Full IGT runs on i915 hardware |
+| **`xe.blocklist.txt`** | Xe driver test exclusions | Full IGT runs on Xe hardware |
+| **Test lists** | Positive inclusion lists | BAT and fast-feedback testing |
+
+### File Locations
+
+```
+tests/intel-ci/
+├── blacklist.txt              # i915 driver blocklist
+├── xe.blocklist.txt          # Xe driver blocklist
+├── fast-feedback.testlist    # i915 BAT test list
+└── xe-fast-feedback.testlist # Xe BAT test list
+```
+
+## :material-format-text: Blocklist Format and Syntax
+
+### Basic Pattern Matching
+
+Blocklists use pattern matching to exclude tests flexibly:
+
+```bash
+# Exact test match
+igt@i915_module_load@load
+
+# Wildcard patterns
+igt@gem_caching@.*              # All gem_caching subtests
+igt@kms_prime@.*               # All kms_prime subtests
+igt@prime_vgem@coherency-.*    # All coherency subtests
+
+# Binary-level exclusions
+igt@gem_workarounds@.*         # Entire gem_workarounds test binary
+```
+
+### Pattern Types
+
+| Pattern | Description | Example |
+||-||
+| **Exact Match** | Specific test/subtest | `igt@core_auth@getclient-simple` |
+| **Wildcard (.*)**| All subtests in a test | `igt@gem_exec_nop@.*` |
+| **Partial Match** | Tests matching prefix | `igt@kms_.*@basic` |
+| **Regex Support** | Advanced pattern matching | `igt@.*@.*-suspend` |
+
+### Comment Syntax
+
+```bash
+# Full line comments start with #
+igt@problematic_test@.*
+
+# Inline comments after patterns
+igt@flaky_test@.* # Known to be unstable
+
+############################################
+# Section separators for organization
+############################################
+```
+
+## :material-cog: Driver-Specific Blocklists
+
+### i915 Driver Blocklist (`blacklist.txt`)
+
+**Purpose:** Exclude tests from Full IGT runs on i915 hardware
+
+**Common Exclusion Categories:**
+
+```bash
+# Hardware-specific exclusions
+igt@gem_caching@.*              # Requires specific cache coherency
+igt@gem_userptr_blits@.*        # Userptr functionality issues
+
+# Display-specific exclusions
+igt@kms_cursor_legacy@.*        # Legacy cursor compatibility
+igt@kms_scaling_modes@.*        # Scaling mode limitations
+
+# Performance/stability exclusions
+igt@gem_exec_whisper@.*         # Resource-intensive stress tests
+igt@gem_concurrent_blit@.*      # Concurrent operation stability
+```
+
+### Xe Driver Blocklist (`xe.blocklist.txt`)
+
+**Purpose:** Exclude tests from Full IGT runs on Xe hardware
+
+**Xe-Specific Exclusions:**
+
+```bash
+# KMS tests requiring i915-specific features
+igt@kms_prime@.*               # Prime buffer sharing limitations
+igt@kms_cursor_legacy@.*       # Legacy API compatibility
+
+# Memory management differences
+igt@gem_caching@.*             # Different memory architecture
+igt@gem_mmap_gtt@.*           # GTT mapping not applicable
+
+# SR-IOV test management
+igt@sriov_basic@.*            # Controlled SR-IOV test execution
+```
+
+## :material-lightning-bolt: Dynamic Blocklist Management
+
+### Adding Tests to Blocklists
+
+**For urgent CI stability:**
+```bash
+# Add to appropriate blocklist file
+echo "igt@problematic_test@.*" >> tests/intel-ci/blacklist.txt
+
+# Commit with clear justification
+git commit -m "intel-ci: Blocklist problematic_test due to [issue]"
+```
+
+**For systematic exclusions:**
+```bash
+# Include issue tracking and reasoning
+# In blocklist file:
+############################################
+# Blocked due to hardware incompatibility
+# See: https://gitlab.freedesktop.org/drm/intel/-/issues/XXXX
+############################################
+igt@hardware_specific_test@.*
+```
+
+### Removing Tests from Blocklists
+
+**When issues are resolved:**
+
+1. **Verify fix** - Ensure the underlying issue is resolved
+2. **Test locally** - Run the test on affected hardware
+3. **Remove from blocklist** - Delete the line from appropriate file
+4. **Monitor CI** - Watch for regressions after removal
+
+## :material-timeline-check: Blocklist Categories
+
+### By Test Stability
+
+| Category | Description | Examples |
+|-|-|-|
+| **Flaky Tests** | Intermittent failures | Tests with timing dependencies |
+| **Hardware-Specific** | Requires unavailable hardware | Specific GPU generations only |
+| **Environment-Dependent** | Needs special configuration | Display connection requirements |
+| **Under Development** | Work-in-progress features | New functionality testing |
+
+### By Impact Level
+
+| Level | Description | Action |
+|-|-|--|
+| **Critical** | Causes system hangs/crashes | Immediate blocklisting |
+| **High** | Consistent CI failures | Blocklist until fixed |
+| **Medium** | Intermittent issues | Monitor and consider blocklisting |
+| **Low** | Minor failures | Keep in CI with issue tracking |
+
+## :material-chart-timeline: CI Integration
+
+### How Blocklists Are Applied
+
+**During CI Execution:**
+
+1. **Test Discovery** - CI enumerates all available IGT tests
+2. **Blocklist Filtering** - Excludes tests matching blocklist patterns
+3. **Test Execution** - Runs remaining tests in filtered set
+4. **Result Reporting** - Reports only on tests that were attempted
+
+**CI Run Types:**
+
+| Run Type | Blocklist Used | Test Scope |
+|-|-||
+| **BAT (Basic Acceptance)** | Test lists (positive) | Curated fast tests |
+| **Full IGT** | Blocklists (negative) | All tests minus blocked |
+| **Idle Runs** | Blocklists (negative) | Extended coverage |
+
+### Integration with Intel GFX CI
+
+**Automatic Application:**
+
+- **i915 Full IGT:** All IGT tests filtered by `blacklist.txt`
+- **Xe Full IGT:** All IGT tests filtered by `xe.blocklist.txt`
+- **Cross-platform:** Same blocklist patterns across different hardware
+
+**Result Filtering:**
+
+- Blocked tests don't appear in CI results
+- No false positives from known problematic tests
+- Focus on real regressions and new issues
+
+## :material-bug: Issue Tracking Integration
+
+### Linking Blocklists to Issues
+
+**Best Practices:**
+```bash
+# Include issue references in blocklist comments
+############################################
+# Blocked due to regression in foo feature
+# See: https://gitlab.freedesktop.org/drm/intel/-/issues/1234
+# Remove when fixed
+############################################
+igt@affected_test@.*
+```
+
+**Issue Lifecycle Management:**
+
+1. **Issue Reported** - Problem identified in CI or manual testing
+2. **Temporary Blocklist** - Add to blocklist to stabilize CI
+3. **Issue Investigation** - Development team investigates root cause
+4. **Fix Implementation** - Code changes to resolve issue
+5. **Blocklist Removal** - Remove from blocklist after verification
+6. **Monitoring** - Watch for regressions
+
+### Automated Issue Tracking
+
+**CI Bug Log Integration:**
+
+- Links blocklist entries to GitLab issues
+- Tracks issue lifecycle and resolution
+- Automatic notifications when issues are resolved
+- Historical data on blocklist effectiveness
+
+## :material-wrench: Maintenance and Best Practices
+
+### Regular Maintenance Tasks
+
+**Periodic Review:**
+```bash
+# Review blocklist contents quarterly
+# Check for resolved issues
+# Remove outdated entries
+# Update issue references
+```
+
+**Validation Procedures:**
+
+1. **Test Removal Candidates** - Try removing old entries
+2. **Hardware Updates** - Review when new hardware is added
+3. **Driver Updates** - Check blocklists after major driver changes
+4. **CI Infrastructure Changes** - Verify patterns after CI updates
+
+### Best Practices for Contributors
+
+**Adding Blocklist Entries:**
+
+- ✅ Include clear justification and issue references
+- ✅ Use minimal patterns (specific as possible)
+- ✅ Add comments explaining the exclusion reason
+- ✅ Link to tracking issues when available
+
+**Pattern Guidelines:**
+
+- Use `.*` for all subtests in a test binary
+- Use specific subtest names when only some subtests fail
+- Avoid overly broad patterns that exclude working tests
+- Test patterns locally before committing
+
+**Documentation Requirements:**
+```bash
+# Good blocklist entry:
+############################################
+# gem_caching tests require coherent memory
+# Not supported on DG2 hardware - see issue #1234
+############################################
+igt@gem_caching@.*
+
+# Poor blocklist entry:
+igt@gem_caching@.*  # broken
+```
+
+## :material-history: Evolution and Changes
+
+### Historical Context
+
+**Naming Evolution:**
+
+- **Legacy:** "blacklist" terminology (historical)
+- **Modern:** "blocklist" terminology (current standard)
+- **Migration:** Gradual transition in file names and documentation
+
+**Scope Expansion:**
+
+- **Initial:** Simple test exclusion
+- **Current:** Sophisticated pattern matching with issue tracking
+- **Future:** AI-assisted blocklist management and prediction
+
+### Current Trends
+
+**Improved Automation:**
+
+- Better integration with bug tracking systems
+- Automated blocklist suggestion based on CI patterns
+- Machine learning for flaky test prediction
+
+**Enhanced Granularity:**
+
+- Hardware-specific blocklists
+- Conditional blocklisting based on system configuration
+- Dynamic blocklist adjustment based on CI load
+
+## :material-file-code: Example Blocklist Configurations
+
+### Complete i915 Blocklist Example
+
+```bash
+############################################
+# i915 Driver Test Blocklist
+# Last Updated: 2024-XX-XX
+############################################
+
+# Memory management tests requiring specific hardware
+igt@gem_caching@.*              # Cache coherency not universal
+igt@gem_userptr_blits@.*        # Userptr stability issues
+
+# Display tests with hardware dependencies
+igt@kms_cursor_legacy@.*        # Legacy cursor compatibility
+igt@kms_scaling_modes@.*        # Hardware scaling limitations
+
+# Resource-intensive stress tests
+igt@gem_exec_whisper@.*         # CPU/memory intensive
+igt@gem_concurrent_blit@.*      # Concurrent stability
+
+############################################
+# Module loading tests - BAT only
+# See: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227
+############################################
+igt@i915_module_load@load       # Requires unloaded i915 module
+```
+
+### Complete Xe Blocklist Example
+
+```bash
+############################################
+# Xe Driver Test Blocklist
+# Last Updated: 2025-XX-XX
+############################################
+
+# KMS tests requiring i915-specific features
+igt@kms_prime@.*               # Prime implementation differences
+igt@kms_cursor_legacy@.*       # Legacy API not supported
+
+# Memory architecture differences
+igt@gem_caching@.*             # Different memory subsystem
+igt@gem_mmap_gtt@.*           # GTT not applicable to Xe
+
+############################################
+# SR-IOV test management
+# Only specific subtests should run in CI
+############################################
+igt@sriov_basic@enable-vfs-autoprobe-off.*
+igt@sriov_basic@enable-vfs-bind-unbind-each.*
+igt@sriov_basic@bind-unbind-vf.*
+
+############################################
+# Platform-specific exclusions
+############################################
+igt@xe_wedged@.*              # Controlled error injection
+```
+
+## :material-link: References and Resources
+
+### Configuration Files
+
+- `tests/intel-ci/blacklist.txt` - i915 blocklist
+- `tests/intel-ci/xe.blocklist.txt` - Xe blocklist
+- `tests/intel-ci/fast-feedback.testlist` - BAT test list
+- `tests/intel-ci/xe-fast-feedback.testlist` - Xe BAT list
diff --git a/docs/building.md b/docs/building.md
new file mode 100644
index 000000000..12b1b4f44
--- /dev/null
+++ b/docs/building.md
@@ -0,0 +1,27 @@
+## :material-hammer-wrench: Tests
+
+To get started quickly and build tests:
+
+```bash
+meson setup build && ninja -C build
+```
+
+!!! info "Meson requires that builds be done in a separate directory from the source tree!"
+
+To run self-tests from `lib/tests` and `tests/`:
+
+```bash
+ninja -C build test
+```
+## :material-book: Documentation
+
+To build the documentation:
+
+```bash
+ninja -C build igt-gpu-tools-doc
+```
+
+!!! info "Missing documentation for a new test?"
+    Some drivers (e.g., Xe, i915) and KMS tests require proper documentation in a
+    **test plan**. The build will fail if documentation is missing! See
+    [`test_documentation.md`](test_documentation.md) for details.
diff --git a/docs/chamelium.txt b/docs/chamelium.md
similarity index 99%
rename from docs/chamelium.txt
rename to docs/chamelium.md
index 64f851c28..240c8e2c8 100644
--- a/docs/chamelium.txt
+++ b/docs/chamelium.md
@@ -41,7 +41,7 @@ While the FPGA is used for logic control, the CPU runs daemons that allow the
 board to be controlled over the network via a XMLRPC interface.
 
 [Current limitation] Cv3 hardware uses an ITE chip which allows only 1 port to
-be plugged in a time. This limitation will be fixed in the upcoming iteration. 
+be plugged in a time. This limitation will be fixed in the upcoming iteration.
 
 Chamelium V2 Documentation
 --------------------------
diff --git a/docs/ci_infrastructure.md b/docs/ci_infrastructure.md
new file mode 100644
index 000000000..a9c883285
--- /dev/null
+++ b/docs/ci_infrastructure.md
@@ -0,0 +1,419 @@
+# :material-cloud-cog: CI Infrastructure
+
+## :material-information-outline: Overview
+
+IGT GPU Tools employs a comprehensive Continuous Integration (CI) infrastructure to ensure
+code quality, prevent regressions, and maintain driver stability. The CI system operates
+across multiple platforms and architectures, providing automated testing for both pre-merge
+and post-merge scenarios.
+
+The infrastructure consists of two main components:
+
+- **GitLab CI** (Freedesktop.org) - Build validation and cross-platform testing
+- **Intel GFX CI** - Comprehensive hardware testing on real Intel GPU systems
+
+## :material-gitlab: GitLab CI (Freedesktop.org)
+
+### Infrastructure Overview
+
+IGT uses GitLab CI hosted at `gitlab.freedesktop.org` for:
+
+- **Build validation** across multiple architectures
+- **Container-based testing** for reproducible environments
+- **Cross-platform compatibility** checks
+- **Documentation generation** and validation
+
+### Container Infrastructure
+
+IGT leverages containerized builds for consistency and reliability:
+
+```bash
+# Pre-built containers available at:
+registry.freedesktop.org/drm/igt-gpu-tools/igt:master
+
+# Run IGT in container:
+podman run --rm --privileged registry.freedesktop.org/drm/igt-gpu-tools/igt:master
+```
+
+### Build Matrix
+
+| Platform | Architecture | Purpose |
+|-|-||
+| **Debian** | x86_64 | Primary build and test platform |
+| **Fedora** | x86_64 | Alternative distro validation |
+| **Debian Minimal** | x86_64 | Minimal dependency testing |
+| **Multi-arch** | arm64, mips | Cross-platform compatibility |
+
+### Container Technology Stack
+
+The CI migrated from Docker to modern container tools for improved reliability:
+
+- **Buildah** - Container building (replaces docker build)
+- **Podman** - Container runtime (replaces docker run)
+- **Skopeo** - Image management and registry operations
+- **Containerfile/Dockerfile** - Build definitions
+
+**Benefits of the modern stack:**
+
+- No daemon dependencies (more reliable in CI)
+- Better isolation using chroot
+- Improved network handling for nested containers
+- Faster builds and reduced resource usage
+
+
+
+## :material-cpu-64-bit: Intel GFX CI
+
+### Mission-Critical Testing
+
+Intel GFX CI provides the backbone for Intel GPU driver validation:
+
+!!! quote "Intel GFX CI Mission"
+    "Test each patch that goes into i915, Intel Xe, or IGT GPU Tools **before** it lands
+    in the repository, comparing results with post-merge baselines to catch regressions
+    early."
+
+### Hardware Infrastructure
+
+**Diverse GPU Coverage:**
+
+- Multiple Intel GPU generations (Gen7 through latest)
+- Various form factors (desktop, mobile, server)
+- Different display configurations (HDMI, DP, eDP, VGA)
+- Specialized hardware for specific features
+
+**Sample Hardware Types:**
+
+- `bat-apl-1` - Apollo Lake platform
+- `bat-jsl-3` - Jasper Lake system
+- `bat-rpls-1` - Raptor Lake S
+- `bat-mtlp-8` - Meteor Lake P
+- `shard-tglb1` - Tiger Lake (sharded testing)
+
+### Test Execution Tiers
+
+#### 1. Basic Acceptance Tests (BAT)
+**Purpose:** Fast feedback and gating mechanism
+**Duration:** ~1 hour
+**Test List:** `tests/intel-ci/fast-feedback.testlist`
+
+```bash
+# Example BAT tests:
+igt@core_auth@getclient-simple
+igt@i915_module_load@load
+igt@kms_busy@basic@modeset
+igt@debugfs_test@read_all_entries
+```
+
+**Key Characteristics:**
+
+- Ensures testing configuration is working
+- Gates all further testing (sharded runs)
+- Fast-feedback tests for quick validation
+- Must pass before proceeding to full testing
+
+#### 2. Full IGT (Sharded Runs)
+**Purpose:** Comprehensive validation
+**Duration:** ~6 hours
+**Scope:** All IGT tests (filtered by blocklists)
+
+**Driver-Specific Execution:**
+
+- **i915:** All IGT tests filtered by `blacklist.txt`
+- **Xe:** All IGT tests filtered by `xe.blocklist.txt`
+
+**Sharding Strategy:**
+Tests are distributed across multiple machines for parallel execution:
+
+- `shard-tglb1`, `shard-tglb2` - Tiger Lake systems
+- `shard-dg2` - DG2/Arc GPU systems
+- Multiple concurrent executions for faster results
+
+#### 3. Specialized Runs
+
+| Run Type | Purpose | Characteristics |
+|-||--|
+| **Idle Runs** | Extra coverage during quiet periods | Run when CI is idle |
+| **KASAN Runs** | Memory safety validation | Kernel Address Sanitizer enabled |
+| **100 Re-runs** | Flaky test detection | Same test 100 times for statistics |
+| **Resume Runs** | Suspend/resume validation | Single machine, resume capability |
+| **drmtip Runs** | Extended coverage | Full IGT on BAT hardware |
+
+
+
+## :material-email-fast: Pre-Merge Testing Workflow
+
+### Patch Submission Process
+
+1. **Mailing List Submission**
+   ```bash
+   # IGT patches should include i-g-t tag:
+   git config --local format.subjectPrefix "PATCH i-g-t"
+
+   # Example subject:
+   [PATCH i-g-t] tests/kms_atomic: Add new subtest for cursor planes
+   ```
+2. **Automatic CI Triggering**
+
+   - CI automatically detects patches on mailing lists
+   - Both BAT and Full IGT are scheduled
+   - Results sent as email replies to original patch
+
+3. **Result Timeline**
+
+   - **BAT Results:** ~1 hour
+   - **Full IGT Results:** ~6 hours
+   - **All results emailed** even on success
+
+### Forcing Custom Test Configurations
+
+For specific testing needs, developers can override CI behavior:
+
+```bash
+# Force specific tests in BAT (mark with HAX):
+[PATCH i-g-t HAX] tests/intel-ci: Add kms_example to fast-feedback
+
+# Change kernel configuration:
+[PATCH HAX] kernel: Enable CONFIG_EXAMPLE for testing
+
+# Force IGT test list changes:
+# Modify tests/intel-ci/fast-feedback.testlist in a HAX patch
+```
+
+### Trybot System
+
+**Purpose:** Test changes before formal review
+
+**Usage:**
+
+- Submit to trybot mailing list
+- Get CI feedback without formal patch review
+- Useful for experimental changes
+
+
+
+## :material-bug: Results and Bug Tracking
+
+### Result Categories
+
+| Result | Description | Action Required |
+|--|-|--|
+| **PASS** | Test completed successfully | None |
+| **SKIP** | Test skipped (missing hardware/feature) | Generally acceptable |
+| **FAIL** | Test failed | Investigation required |
+| **Dmesg-Warn** | Kernel warnings detected | Review warnings |
+| **Incomplete** | Test didn't complete | Infrastructure issue |
+
+### Bug Tracking Integration
+
+**Automated Bug Filtering:**
+
+- Known issues are filtered out using pattern matching
+- New failures automatically trigger investigation
+- Results tied to specific dmesg patterns and hardware
+
+**Bug Trackers:**
+
+- **freedesktop GitLab** - Kernel, Xe, and IGT issues
+- **Hardware-specific filters** - Machine type patterns
+- **Pattern-based matching** - dmesg output analysis
+
+## :material-git: Repository Integration
+
+### CI-Tagged Repositories
+
+**IGT CI Tags:** `https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git`
+
+- Contains CI-specific tags and metadata
+- Used for tracking tested versions
+- Integration with kernel development
+
+**Kernel Integration:** `git://anongit.freedesktop.org/gfx-ci/linux`
+
+- Kernel tree with CI integration
+- Automated testing of kernel + IGT combinations
+- Firmware coordination
+
+### Firmware Management
+
+**Firmware Repositories:**
+
+- **intel-staging** - Upcoming firmware blobs ready for merge
+- **intel-for-ci** - CI-specific firmware with intel-ci directory
+- **Automatic deployment** - Firmware updated on test machines
+
+**Firmware Deployment Process:**
+
+1. New pushes detected on firmware branches
+2. Extract i915 and xe directories from intel-staging
+3. Extract intel-ci from intel-for-ci
+4. Deploy all three directories to test machines
+5. Integrate with base OS firmware tree (Ubuntu)
+
+
+
+## :material-docker: Container Registry
+
+### Available Images
+
+**Primary IGT Container:**
+```bash
+registry.freedesktop.org/drm/igt-gpu-tools/igt:master
+```
+
+**Build Images:**
+
+- Debian-based development environment
+- Fedora-based testing environment
+- Multi-architecture build support
+- Documentation generation environment
+
+### Usage Examples
+
+```bash
+# Run tests in container:
+podman run --rm --privileged \
+  registry.freedesktop.org/drm/igt-gpu-tools/igt:master \
+  /usr/libexec/igt-gpu-tools/core_auth
+
+# Build IGT in container:
+podman run --rm -v $(pwd):/workspace \
+  registry.freedesktop.org/drm/igt-gpu-tools/igt:master \
+  bash -c "cd /workspace && meson build && ninja -C build"
+```
+
+
+
+## :material-chart-timeline-variant: CI Configuration Files
+
+### GitLab CI Configuration
+
+**Primary Configuration:** `.gitlab-ci.yml`
+
+- Multi-stage pipeline definition
+- Container build and test stages
+- Cross-architecture build matrix
+- Documentation generation jobs
+
+**Key Configuration Sections:**
+```yaml
+# Build stage example:
+build:
+  stage: build
+  script:
+    - meson build
+    - ninja -C build
+  artifacts:
+    paths:
+      - build/
+
+# Test stage example:
+test:
+  stage: test
+  script:
+    - cd build && meson test
+```
+
+### Intel CI Configuration
+
+**Test Lists:**
+
+- `tests/intel-ci/fast-feedback.testlist` - BAT test definitions
+- `tests/intel-ci/xe-fast-feedback.testlist` - Xe-specific BAT tests
+- `tests/intel-ci/blacklist.txt` - i915 test exclusions
+- `tests/intel-ci/xe.blocklist.txt` - Xe test exclusions
+
+**Hardware Configuration:**
+
+- Platform-specific test routing
+- Display configuration requirements
+- GPU generation compatibility matrices
+
+
+
+## :material-monitor-dashboard: Monitoring and Maintenance
+
+### Performance Metrics
+
+**CI Health Indicators:**
+
+- Queue depth and processing time
+- Success/failure rates by platform
+- Hardware utilization statistics
+- Container build performance
+
+**Continuous Monitoring:**
+
+- Real-time queue status
+- Historical trend analysis
+- Capacity planning metrics
+- Infrastructure reliability tracking
+
+### Maintenance Operations
+
+**Regular Tasks:**
+
+- Container image updates
+- Hardware firmware updates
+- Test list maintenance
+- Bug filter updates
+
+**Scaling Operations:**
+
+- Hardware addition/retirement
+- Load balancing adjustments
+- Performance optimization
+- Capacity expansion
+
+
+
+## :material-account-group: Development Integration
+
+### Developer Workflow
+
+1. **Local Development**
+   ```bash
+   # Test locally with containers:
+   podman run --rm --privileged \
+     -v $(pwd):/workspace \
+     registry.freedesktop.org/drm/igt-gpu-tools/igt:master
+   ```
+
+2. **Patch Submission**
+
+   - Email patches to mailing lists
+   - CI automatically triggered
+   - Results delivered via email
+
+3. **Result Analysis**
+
+   - Review BAT results first (~1 hour)
+   - Full results available later (~6 hours)
+   - Investigate any failures or warnings
+
+### Best Practices
+
+**For Contributors:**
+
+- Test patches locally before submission
+- Use appropriate subject line tags ([PATCH i-g-t])
+- Mark experimental patches with HAX
+- Monitor CI results and respond to failures
+
+**For Maintainers:**
+
+- Review CI results before merging
+- Update test lists as needed
+- Maintain bug filters
+- Coordinate with hardware teams
+
+
+
+## :material-link-variant: Resources and References
+
+### CI Infrastructure Links
+
+- **Intel GFX CI:** https://intel-gfx-ci.01.org/
+- **GitLab Repository:** https://gitlab.freedesktop.org/drm/igt-gpu-tools
+- **Container Registry:** https://gitlab.freedesktop.org/drm/igt-gpu-tools/container_registry
+- **CI Tags Repository:** https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags
diff --git a/docs/cross-building.md b/docs/cross-building.md
new file mode 100644
index 000000000..b14182878
--- /dev/null
+++ b/docs/cross-building.md
@@ -0,0 +1,240 @@
+# :material-hammer-screwdriver: Cross-Building IGT
+
+## :material-information-outline: Overview
+
+Producing an IGT build for another architecture requires setting up a cross-compilation
+environment with the appropriate toolchain, system root directory, and Meson
+configuration. This guide covers the essential steps for cross-building IGT GPU Tools
+for different target architectures.
+
+## :material-wrench-cog: Cross-Build Toolchain
+
+### Required Components
+
+Cross-building requires installing a toolchain with support for the target architecture,
+or a toolchain built specifically for the target, plus an emulator (like QEMU). For IGT,
+the minimal toolchain consists of GCC and binutils.
+
+**Example: ARM64 on Fedora**
+
+For cross-building with ARM64 as the target architecture, install these packages:
+
+```bash
+# Fedora packages for ARM64 cross-compilation
+binutils-aarch64-linux-gnu
+gcc-aarch64-linux-gnu
+```
+
+### Alternative Toolchain Sources
+
+Pre-built cross-compiler toolchain tarballs are also available:
+
+- **Bootlin Toolchains**: https://toolchains.bootlin.com/
+- Various distribution-specific cross-compilation packages
+- Custom-built toolchains for specific targets
+
+## :material-folder-cog: System Root Directory (sysroot)
+
+### Purpose
+
+Besides a toolchain, a system root directory containing the libraries used by IGT
+pre-compiled to the target architecture is required.
+
+### Obtaining a Sysroot
+
+The sysroot can be obtained through several methods:
+
+1. **Cross-building a distribution** using Yocto, buildroot, or similar tools
+2. **Copying the system root** from an existing installation for the desired architecture
+3. **Building dependencies** manually for the target architecture
+
+The sysroot must contain all IGT build-time and runtime library dependencies compiled
+for the target architecture.
+
+### Important Considerations
+
+!!! warning "Toolchain Dependencies"
+    Cross-build toolchains may require some dependent object files and libraries to
+    also be copied to the system root directory. For instance, with Fedora, files
+    located under `/usr/aarch64-linux-gnu/sys-root/` (for aarch64 architecture) should
+    also be stored in the sysroot directory used by Meson, otherwise the preparation
+    step will fail.
+
+## :material-cog-outline: Meson Configuration
+
+### Cross-File Requirement
+
+Meson requires an extra configuration file for non-native builds, passed via the
+`--cross-file` parameter. This file contains details about:
+
+- Target OS/architecture specifications
+- Host (native) OS/architecture information
+- Sysroot location and compiler configurations
+- Binary locations and execution wrappers
+
+### Configuration Sections
+
+#### `[host_machine]` Section
+Defines the system and architecture of the native OS.
+
+**Example:** Native OS is Linux x86_64 architecture
+```ini
+[host_machine]
+system = 'linux'
+cpu_family = 'x86_64'
+cpu = 'x86_64'
+endian = 'little'
+```
+
+#### `[target_machine]` Section
+Contains details about the target OS/architecture.
+
+**Example:** Target is aarch64 (ARM 64-bit architecture)
+```ini
+[target_machine]
+system = 'linux'
+cpu_family = 'aarch64'
+cpu = 'aarch64'
+endian = 'little'
+```
+
+#### `[constants]` Section (Optional)
+Helps define reusable paths and arguments for use in other sections.
+
+```ini
+[constants]
+sysroot = '/aarch64-sysroot'
+common_args = ['--sysroot=' + sysroot]
+```
+
+#### `[properties]` Section
+Contains arguments to be used by the build binaries.
+
+```ini
+[properties]
+sys_root = sysroot
+c_args = common_args
+c_link_args = common_args
+pkg_config_libdir = [
+    sysroot + '/usr/lib64/pkgconfig',
+    sysroot + '/usr/share/pkgconfig',
+    sysroot + '/usr/local/lib/pkgconfig'
+]
+```
+
+#### `[binaries]` Section
+Contains the binaries to be used during the build.
+
+- Can use either native or target toolchain
+- If using target toolchain, requires `exe_wrapper` pointing to an architecture
+  emulator like `qemu-arm`
+
+```ini
+[binaries]
+c = '/usr/bin/aarch64-linux-gnu-gcc'
+ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'
+ld = '/usr/bin/aarch64-linux-gnu-ld'
+strip = '/usr/bin/aarch64-linux-gnu-strip'
+pkgconfig = 'pkg-config'
+```
+
+## :material-play-circle-outline: Build Process
+
+### Preparation
+
+Prepare for cross-compilation by calling Meson with the cross-compilation config file
+and build directory:
+
+```bash
+meson --cross-file arm64_cross.txt build
+```
+
+### Compilation
+
+Execute the actual compilation using Ninja:
+
+```bash
+ninja -C build
+```
+
+### Build Limitations
+
+!!! info "Cross-Compilation Limitations"
+    Some parts of the IGT build are disabled during cross-compilation, including:
+
+    - Testlist file creation
+    - Documentation generation
+    - Other steps that depend on running generated code on the native machine
+
+## :material-file-code: Pre-configured Examples
+
+The IGT root directory contains pre-configured cross-compilation examples using QEMU
+to run target-OS machine toolchains:
+
+- `meson-cross-arm64.txt` - ARM64 architecture
+- `meson-cross-armhf.txt` - ARM hard-float architecture
+- `meson-cross-mips.txt` - MIPS architecture
+
+## :material-script-text: Complete Example Configuration
+
+### Native Cross-Builder Toolchain: `arm64_cross.txt`
+
+```ini
+[constants]
+sysroot = '/aarch64-sysroot'
+common_args = ['--sysroot=' + sysroot]
+
+[properties]
+sys_root = sysroot
+c_args = common_args
+c_link_args = common_args
+pkg_config_libdir = [
+    sysroot + '/usr/lib64/pkgconfig',
+    sysroot + '/usr/share/pkgconfig',
+    sysroot + '/usr/local/lib/pkgconfig'
+]
+
+[binaries]
+c = '/usr/bin/aarch64-linux-gnu-gcc'
+ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'
+ld = '/usr/bin/aarch64-linux-gnu-ld'
+strip = '/usr/bin/aarch64-linux-gnu-strip'
+pkgconfig = 'pkg-config'
+
+[host_machine]
+system = 'linux'
+cpu_family = 'x86_64'
+cpu = 'x86_64'
+endian = 'little'
+
+[target_machine]
+system = 'linux'
+cpu_family = 'aarch64'
+cpu = 'aarch64'
+endian = 'little'
+```
+
+## :material-lightbulb-outline: Best Practices
+
+### Sysroot Management
+
+- Ensure all required dependencies are present in the sysroot
+- Verify library paths match the target architecture
+- Include both runtime and development packages
+
+### Toolchain Verification
+
+- Test the cross-compilation toolchain independently before building IGT
+- Verify that the toolchain can produce working binaries for the target
+- Check that all required tools (gcc, binutils, etc.) are available
+
+### Build Validation
+
+- Use emulation (QEMU) to test cross-compiled binaries when possible
+- Validate that the cross-compiled IGT works on actual target hardware
+- Compare functionality with native builds to ensure completeness
+
+## :material-link: References
+
+- [Meson Cross-compilation Documentation](https://mesonbuild.com/Cross-compilation.html)
+- [Bootlin Toolchains](https://toolchains.bootlin.com/)
diff --git a/docs/cross-building.txt b/docs/cross-building.txt
deleted file mode 100644
index 2c0e3caf3..000000000
--- a/docs/cross-building.txt
+++ /dev/null
@@ -1,122 +0,0 @@
-Producing an IGT for another architecture
-=========================================
-
-Cross-build toolchain
----------------------
-
-Producing cross-builds require installing a toolchain with support
-to the target architecture, or a toolchain built for the target,
-plus an emulator (like qemu). In the case of IGT, the minimal toolchain
-is GCC and binutils. For instance, on Fedora, to cross-build with arm64
-as the target architecture, those packages are needed:
-
-	binutils-aarch64-linux-gnu
-	gcc-aarch64-linux-gnu
-
-There are also tarballs with cross-compiler chains that can be used
-instead, like:
-
-	https://toolchains.bootlin.com/
-
-System root directory (sysroot)
--------------------------------
-
-Besides a toolchain, a system root directory containing the libraries
-used by IGT pre-compiled to the target architecture is required.
-
-This can be obtained by either cross-building a distribution using
-Yocto, buildroot or similar, or by copying the system root from
-an existing installation for the desired architecture, containing
-the IGT needed build time and runtime library dependencies.
-
-Please notice that cross-build toolchains may require some
-dependent object files and libraries used by it to also be copied
-to the system root directory. For instance, in the case of Fedora,
-the files are located  under /usr/aarch64-linux-gnu/sys-root/
-(for aarch64 architecture) shall also be stored at the sysroot
-directory used by Meson, as otherwise the preparation step will fail.
-
-Meson preparation
------------------
-
-Meson requires an extra configuration file to be used for
-non-native builds. This is passed via --cross-file parameter to it.
-
-Such file contains details about the target OS/architecture, about
-the host (native) OS/architecture and declares the location of
-sysroot:
-
-- the [host_machine] section defines the system and architecture from
-  the native OS;
-  At the example below, the native OS is Linux x86_64 architecture.
-- the [target_machine] section contains details about the target
-  OS/architecture.
-  At the example below, the target is aarch64 (arm 64 bits architecture).
-- the [constants] section is optional, but it helps to use the sysroot
-  path directory on multiple keys at the [properties] section;
-- the [properties] section contains arguments to be used by the
-  the binaries;
-- the [binaries] section contains the binaries to be used during the
-  build. It can either be a native or a target toolchain.
-  If a target toolchan is used, an exe_wrapper key pointing to an arch
-  emulalor like qemu-arm is needed.
-
-The sysroot directory is where IGT dependent libraries and header
-files, compiled for a given architecture, are stored. At the example
-below, the sysroot is /aarch64-sysroot.
-
-Preparing for cross compilation is done by calling meson with the
-cross-compilation config file name, plus a build directory:
-
-	meson --cross-file arm64_cross.txt build
-
-The actual compilation can then be done using ninja:
-
-	ninja -C build
-
-Please notice that some parts of the IGT build are disabled during
-cross-compilation, like testlist file creation and documentation,
-as such steps depend on running the generated code at the native
-machine.
-
-The IGT root directory has already 3 examples that uses qemu to
-run a target-OS machine toolchain:
-
-	meson-cross-arm64.txt
-	meson-cross-armhf.txt
-	meson-cross-mips.txt
-
-The example below contains cross-build instructions when using
-a native cross-build toolchain.
-
-Example: arm64_cross.txt with a native cross-builder toolchain
---------------------------------------------------------------
-
-[constants]
-sysroot = '/aarch64-sysroot'
-common_args = ['--sysroot=' + sysroot]
-
-[properties]
-sys_root = sysroot
-c_args = common_args
-c_link_args = common_args
-pkg_config_libdir = [sysroot + '/usr/lib64/pkgconfig', sysroot +'/usr/share/pkgconfig', sysroot +'/usr/local/lib/pkgconfig']
-
-[binaries]
-c = '/usr/bin/aarch64-linux-gnu-gcc'
-ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'
-ld = '/usr/bin/aarch64-linux-gnu-ld'
-strip = '/usr/bin/aarch64-linux-gnu-strip'
-pkgconfig = 'pkg-config'
-
-[host_machine]
-system = 'linux'
-cpu_family = 'x86_64'
-cpu = 'x86_64'
-endian = 'little'
-
-[target_machine]
-system = 'linux'
-cpu_family = 'aarch64'
-cpu = 'aarch64'
-endian = 'little'
diff --git a/docs/faq.md b/docs/faq.md
new file mode 100644
index 000000000..189bf6b62
--- /dev/null
+++ b/docs/faq.md
@@ -0,0 +1,92 @@
+# Frequently Asked Questions (FAQ)
+
+This FAQ covers common questions about using, building, and contributing to
+**IGT GPU Tools**.
+
+### What is IGT GPU Tools?
+
+IGT GPU Tools is a collection of low-level tests and utilities used to validate and
+debug Linux DRM (Direct Rendering Manager) graphics drivers. It focuses primarily on
+Intel GPUs but supports other platforms in varying degrees.
+
+### How do I build IGT?
+
+You can build IGT using [Meson](https://mesonbuild.com/) and Ninja. Here's a quick
+example:
+
+```sh
+meson setup build && ninja -C build
+```
+
+Make sure required dependencies are installed. You can refer to:
+
+- `Dockerfile.build-fedora`
+- `Dockerfile.build-debian` or `Dockerfile.build-debian-minimal`
+
+They contain up-to-date package lists for common distros.
+
+### How do I run tests?
+
+Tests are located in the `tests/` directory and can be run directly. For example:
+
+```sh
+sudo ./build/tests/core_auth
+```
+
+Use `--list-subtests` to list available subtests and `--run-subtest` to run a specific
+one:
+
+```sh
+sudo ./build/tests/core_auth --list-subtests
+sudo ./build/tests/core_auth --run-subtest basic-auth
+```
+
+You can also run tests using the `scripts/run-tests.sh` wrapper, which supports
+filtering and batch execution.
+
+### Do I need to run as root?
+
+Most tests require root privileges and a system without a running graphical session
+(X or Wayland). Some tools may work without root, especially those that only inspect
+or decode state.
+
+### What platforms are supported?
+
+IGT primarily targets Intel GPUs (Gen9+), but partial support exists for:
+
+- AMD (amdgpu)
+- NVIDIA (nouveau)
+- Virtual GPUs (e.g., virtio-gpu in QEMU/KVM)
+
+Hardware coverage may vary by test.
+
+### What's the difference between `tests/`, `tools/`, and `benchmarks/`?
+
+- `tests/` – Automated functional tests, designed for CI and driver validation
+- `tools/` – Debugging and inspection utilities (e.g., checking GPU state)
+- `benchmarks/` – Performance-oriented microbenchmarks (e.g., memory or rendering speed)
+
+### Where do I report security issues?
+
+Do **not** report vulnerabilities in public issues or mailing lists.
+Instead, contact a maintainer directly. See the `MAINTAINERS` file for contact
+information.
+
+### How do I submit a patch?
+
+Use `git send-email` to send your patch to:
+
+```
+igt-dev@lists.freedesktop.org
+```
+
+Prefix your subject with `PATCH i-g-t`. You can track submissions at:
+
+- [Patchwork](https://patchwork.freedesktop.org/project/igt/series/)
+- [Lore Archive](https://lore.kernel.org/igt-dev/)
+
+More details are in `CONTRIBUTING.md`.
+
+If your question isn't answered here, feel free to ask on the
+[igt-dev mailing list](mailto:igt-dev@lists.freedesktop.org) or open an issue on GitLab.
+
diff --git a/docs/new_driver.md b/docs/new_driver.md
new file mode 100644
index 000000000..8d7136657
--- /dev/null
+++ b/docs/new_driver.md
@@ -0,0 +1,230 @@
+# :material-plus-circle: Port New Driver in IGT
+
+Here is a detailed procedure to support a new driver in IGT, using Intel's "XE" driver as
+an example.
+
+## :material-search: Detect the Driver
+
+Add support in IGT lib to detect the driver, so that IGT will recognize the driver. The
+device name should match with the DRIVER_NAME configured in the Linux Kernel Module.
+
+Example: https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_drv.h#L11
+
+### KMD Changes:
+
+```c
+#define DRIVER_NAME     "xe"
+
+#define DRIVER_DESC     "Intel Xe Graphics"
+
+#define DRIVER_DATE     "20201103"
+```
+
+### IGT Changes:
+
+```diff
+diff --git a/lib/drmtest.c b/lib/drmtest.c
+
+index 8e2d1ac50b..0ceab10389 100644
+
+--- a/lib/drmtest.c
+
++++ b/lib/drmtest.c
+
+@@ -189,6 +189,7 @@  static const struct module {
+
+ 	{ DRIVER_V3D, "v3d" },
+
+ 	{ DRIVER_VC4, "vc4" },
+
+ 	{ DRIVER_VGEM, "vgem" },
+
++	{ DRIVER_XE, "xe" },
+
+ 	{}
+
+ };
+
+
+
+@@ -547,6 +548,8 @@  static const char *chipset_to_str(int chipset)
+
+ 		return "panfrost";
+
+ 	case DRIVER_MSM:
+
+ 		return "msm";
+
++	case DRIVER_XE:
+
++		return "xe";
+
+ 	case DRIVER_ANY:
+
+ 		return "any";
+
+ 	default:
+
+diff --git a/lib/drmtest.h b/lib/drmtest.h
+
+index b5debd44b3..448ac03b49 100644
+
+--- a/lib/drmtest.h
+
++++ b/lib/drmtest.h
+
+@@ -51,6 +51,7 @@
+
+ #define DRIVER_V3D	(1 << 4)
+
+ #define DRIVER_PANFROST	(1 << 5)
+
+ #define DRIVER_MSM	(1 << 6)
+
++#define DRIVER_XE	(1 << 7)
+```
+
+
+With the above changes, the simple IGT snippet `int fd = drm_open_driver_master(DRIVER_XE);`
+can open the "XE" driver.
+
+## :material-code-braces: UAPI Changes to Support Driver-Specific IOCTLs
+
+Import UAPI headers: https://gitlab.freedesktop.org/drm/igt-gpu-tools#includedrm-uapi
+
+## :material-wrench: Develop IGT Helpers
+
+Now we can develop driver-specific IGT helpers based on DRM_IOCTL_VERSION.
+
+Example:
+
+```diff
++++ b/lib/drmtest.c
+
+@@ -139,6 +139,16 @@  bool is_vc4_device(int fd)
+
+ 	return __is_device(fd, "vc4");
+
+ }
+
+
+
++bool is_xe_device(int fd)
+
++{
+
++	return __is_device(fd, "xe");
+
++}
+
+
+
++++ b/lib/intel_chipset.c
+
+@@ -125,22 +163,18 @@  intel_get_pci_device(void)
+
+ uint32_t
+
+ intel_get_drm_devid(int fd)
+
+ {
+
+
+
++	if (is_xe_device(fd))
+
++		return __xe_get_drm_devid(fd);
+
++	else
+
++		return __i915_get_drm_devid(fd);
+
+}
+```
+
+## :material-monitor: Porting All Display IGTs to Support XE Driver
+
+The task of porting all display-specific IGTs to support the XE driver is significant and
+critical. This process involves several steps.
+
+### :material-eye: Understanding the Current IGTs
+
+The existing codebase must be thoroughly understood. This involves reviewing the code for
+all display IGTs, understanding their functionality, and identifying any potential issues
+that may arise when porting to the XE driver.
+
+!!! info "Challenges"
+    As there are several hundreds of display subtests, it's always a challenge to
+    read/review the codebase.
+
+### :material-chip: Understanding the XE Driver
+
+The XE driver's specifications and capabilities must be understood. This will allow for
+the identification of any features that the IGTs can take advantage of, as well as any
+limitations that must be worked around.
+
+!!! info "Challenges"
+    Identify all i915 display-specific ioctls and find the corresponding ioctl in XE.
+
+    Different approach of using modparams and missing debugfs.
+
+### :material-map: Mapping the IGTs to the XE Driver
+
+Once we understand both the IGTs and the XE driver, we can start mapping the functionality
+of the IGTs to the XE driver. This involves identifying which tests can be supported by
+the XE driver, which ones need to be modified, and which ones cannot be supported.
+
+### :material-library: Modifying IGT Libraries
+
+Start modifying the IGT libraries to support the XE driver and try to make the APIs as
+unified (to support both i915 and XE). To achieve this, collaborate and contribute with
+the core-mm and other development teams.
+
+!!! info "Challenges"
+    Make the core team understand the display use cases to write unified APIs
+    (Ex: VM bind, GPU HANG, and BUSY).
+
+    Integrate XE-specific APIs with existing IGT display libraries (Ex: BO creation).
+
+**Notable contributions by Bhanu:**
+
+- Add IGT helpers to check for the XE driver
+- Add an interface to query dev_id
+- Get and cache the XE_config at driver opening level and uncache at driver closing level
+- Support to create a BO for display framebuffers
+- Add rendercopy support for display tests
+- Add tiling support for XE
+- API support to get the pipe index
+
+### :material-code-tags: Modifying the IGTs
+
+Based on the mapping, we can start modifying the IGTs to support the XE driver. This
+could involve changing the code, adding new lib helpers, adding new tests, or removing
+unsupported tests. This process involves the following steps:
+
+- Modify test initialization code to open the XE driver instead of Intel where applicable
+- Update any Intel-specific code/defines in the tests to use equivalent XE APIs
+- Ensure all relevant XE driver features are properly exercised by the tests. Add any
+  missing test coverage
+- Update documentation like man pages, comments, etc. to cover XE driver usage
+
+!!! info "Challenges"
+    Some KMS tests are complex and very difficult to update.
+
+### :material-test-tube: Testing the Ported IGTs
+
+After the IGTs have been modified, they need to be tested to ensure they work correctly
+with the XE driver. This involves running the tests, analyzing the results, and fixing
+any issues that are identified.
+
+## :material-file-document: Test-Plan Documentation
+
+With the addition of the Xe driver, a new way to document tests was added. It is based on
+special comment-like annotation inside the C code. We need to update each and every IGT
+with this new style of documentation.
+
+!!! info "Challenges"
+    - Time-consuming process, as we have several hundreds of subtests
+    - Add missing documentation in existing legacy way
+    - Identify different features and align with several internal tools like
+      feature-mapping, Grafana, etc.
diff --git a/docs/overview.md b/docs/overview.md
new file mode 100644
index 000000000..f7d1c3924
--- /dev/null
+++ b/docs/overview.md
@@ -0,0 +1,249 @@
+# :material-clipboard-check-outline: General
+
+
+
+!!! info "IGT GPU Tools"
+
+    **IGT GPU Tools** is a collection of low-level tools and tests for developing and testing
+    DRM(Direct Rendering Manager) drivers.
+    While macro-level test suites like `xtest`, `rendercheck`, `piglit`,
+    and `oglconform` are useful, they can be hard to trace back to kernel-level issues.
+    IGT focuses on targeted, low-level testing that's easier to build,
+    debug, and trace to the kernel.
+
+:material-book-outline: Latest API documentation:
+<https://drm.pages.freedesktop.org/igt-gpu-tools/>
+
+## :material-cog-outline: Requirements
+
+- Fedora users: see `Dockerfile.build-fedora` for package dependencies.
+- Debian-based systems: check `Dockerfile.build-debian` or `Dockerfile.build-debian-minimal`.
+
+If IGT is available in your distro's package manager:
+
+```bash
+dnf builddep igt-gpu-tools
+```
+
+:material-alert-circle-outline: **Note:** Package dependencies may be outdated compared to
+`master` branch requirements.
+
+## :material-folder-outline: Directory Overview
+
+This section explains the purpose of each major directory in the IGT GPU Tools project.
+Understanding the structure will help new contributors and users navigate the codebase
+more effectively.
+
+### :material-file-tree-outline: `tests/`
+
+Contains test cases and subtests – the core of IGT validation.
+
+- Each test is a standalone executable built from a `.c` file.
+- Tests follow naming conventions and are managed by `igt_runner`.
+- Subtests are organized using `igt_subtest` and described using `igt_describe()`.
+- Certain tests may be specific to `i915` or `Xe` drivers and follow respective
+  documentation requirements.
+
+### :material-puzzle-outline: `lib/`
+
+Shared helper libraries used across tests.
+
+- Provides wrappers for kernel interactions, memory management, and display configuration.
+- Contains useful macros like `igt_assert`, `igt_require`, and `igt_info`.
+- Some helpers are hardware-specific (e.g., Intel platform tools).
+
+### :material-tools: `tools/`
+
+Standalone utilities that use IGT libraries but aren't part of the test suite.
+
+- Often used for debugging or GPU state inspection.
+- May require root access depending on functionality.
+
+### :material-database-outline: `data/`
+
+Contains test data files and reference materials used by IGT tests.
+
+- **Reference images and frames**: Used for visual comparison tests and CRC validation
+- **Test configuration files**: Standard test data and expected outputs for validation
+- **Binary test data**: GPU-specific test patterns, EDID data, and hardware configurations
+- **Frame dump data**: Reference frames for display testing and Chamelium validation
+
+**Key features:**
+
+- Accessed via `igt_fopen_data(filename)` helper function
+- Automatic fallback search: installation directory → build directory → current directory
+- Used for frame comparison tests, display validation, and hardware-specific test data
+- Essential for tests that require known-good reference data or specific input patterns
+
+**Common use cases:**
+
+```c
+// Open a reference frame for comparison
+FILE *ref_file = igt_fopen_data("reference_frame_1080p.raw");
+
+// Load test pattern data
+FILE *pattern = igt_fopen_data("test_patterns/gradient.bin");
+```
+
+### :material-book-open-outline: `docs/`
+
+Contains developer documentation, test plan tools, and API references.
+
+- Some content is generated via `gtk-doc`.
+- Tests for `i915` and `Xe` drivers are subject to test plan validation.
+  Documentation must be kept in sync – see `docs/test_documentation.md`.
+
+To regenerate:
+
+```bash
+ninja -C build igt-gpu-tools-doc
+```
+
+### :material-play-circle-outline: `runner/`
+
+The `igt_runner` test harness manages batch execution and filtering.
+
+- Supports result summaries, filtering by subtest, and dry-run modes.
+- Used heavily in CI and automation.
+
+### :material-file-document-outline: `include/`
+
+Public headers and UAPI headers:
+
+- Includes types and APIs exposed by IGT.
+- Subdirectories such as `drm-uapi/` and `linux-uapi/` are synced from upstream kernel
+  headers (e.g., `drm-next`).
+
+### :material-chart-box-outline: `benchmarks/`
+
+Microbenchmarks for evaluating GPU performance.
+
+- Focus on throughput, memory speed, and latency.
+- Useful for low-level tuning and regression checks.
+
+### :material-script-text-outline: `scripts/`
+
+Helper scripts for CI, patch formatting, and test orchestration.
+
+- Not always cross-platform.
+- Includes the `run-tests.sh` script to simplify test execution.
+
+### :material-console-line: Build Files
+
+- `meson.build`, `configure.ac`, `Makefile.am`: Build system support.
+- Autotools and Meson support may coexist but Meson is preferred for modern development.
+
+
+
+## :material-chip: Recommended Hardware
+
+**IGT GPU Tools** is designed to validate Linux DRM drivers across a variety of Intel
+and non-Intel platforms. While virtual environments help with development, real hardware
+is recommended for full test coverage, performance metrics, and regression tracking.
+
+### :material-lightbulb-outline: General Guidelines
+
+- **Use modern Intel GPUs (Gen9+)** for maximum test compatibility.
+- Prefer **dedicated test systems** for kernel and firmware flexibility.
+- Ensure **reliable cooling** to avoid throttling during performance tests.
+- **Use `Xe` hardware** if contributing to or testing the next-generation driver stack.
+
+
+
+### :material-table-large: Recommended Intel Platforms
+
+| GPU Generation | Example Platform / CPU      | Notes                                        |
+|-||-|
+| Gen9           | Skylake (e.g., i5-6200U)    | Stable, well-supported baseline              |
+| Gen11          | Ice Lake (e.g., i7-1065G7)  | Better display/media support                 |
+| Gen12          | Tiger Lake / Alder Lake     | Used for both `i915` and early `Xe` testing  |
+| DG2            | Intel Arc A-Series GPUs     | Required for `Xe` HPG-specific validation    |
+| XeHP/XeHPC     | (If available)              | Specialized use by hardware teams/devs       |
+
+:material-information-outline: *Older GPUs (Gen7/Gen8) are still useful for regression
+testing but may not support new test features.*
+
+### :material-chip: Non-Intel GPU Support
+
+Although IGT is Intel-focused, basic support exists for other platforms:
+
+- **AMD (AMDGPU):** Some display and KMS tests run; feature support may vary.
+- **NVIDIA (nouveau):** Partial functionality; manual testing encouraged.
+- **VirtIO-GPU / QEMU / GVT-g:** Useful for automation and limited pipeline testing.
+- **ARM SoCs (e.g., Mali, Vivante):** Experimental – not all tests apply.
+
+:material-account-group-outline: Community contributions are welcome to expand non-Intel
+support!
+
+
+
+### :material-lan: Special Testing Scenarios
+
+- **Multi-GPU testing:** Useful for scenarios involving iGPU + dGPU switching.
+- **Display testing:** EDID dongles or connected screens required.
+- **Power management:** Laptops or devices with sensors give better PM insights.
+- **Virtualization:** Run in KVM/QEMU to emulate certain configurations.
+
+### :material-wrench-clock: Optional Tools
+
+- **EDID dongles** – simulate display hotplug events.
+- **Serial/UART debug cables** – capture early boot logs.
+- **Power meters (RAPL, Watts Up Pro)** – validate runtime PM and energy use.
+- **CI hardware** – watchdog-capable systems with remote boot and serial access.
+- **Chamelium** - automates external display testing across VGA, HDMI, and DisplayPort
+  (DP). More: [External Tools -> Chamelium](chamelium.md) or [The Chromium Projects - Chamelium](https://www.chromium.org/chromium-os/developer-library/guides/hardware-schematics/chamelium/)
+
+### :material-cloud-outline: CI and Development Tips
+
+- Ensure **firmware can be updated** easily on your test hardware.
+- Be prepared to **compile and switch kernels** frequently.
+- Run tests on a **known-good setup** to rule out config or version issues.
+
+
+
+## :material-shield-account-outline: i915 vs Xe Drivers
+
+IGT supports two major Intel GPU drivers in the kernel:
+
+Here are some basic information, for more please visit an official
+[Intel Graphics for Linux - Documentation](https://drm.pages.freedesktop.org/intel-docs/)
+
+### :material-chip: `i915` Driver
+
+- Supports older Intel platforms (Gen9–Gen12).
+- Mature, well-tested, and fully integrated into kernel and userspace stacks.
+- Tests targeting `i915` must include proper documentation (using `igt_describe`) and
+  follow test plan validation rules.
+
+### :material-flash: `Xe` Driver
+
+- Next-generation Intel GPU driver for **DG2 (Arc)** and newer architectures.
+- Designed to replace `i915` for future platforms.
+- Modular, uses a new codebase and device model.
+- Tests targeting `Xe` must follow the same documentation and validation practices but may
+  focus on newer UAPI/ABI interactions.
+
+### :material-alert-outline: Key Differences
+
+| Aspect           | i915                         | Xe                                    |
+|||-|
+| Target Platforms | Gen9–Gen12, some DG1         | DG2 (Arc), XeHP/HPG/HPC               |
+| Kernel Interface | Legacy DRM, widely used      | New driver stack with modernized UAPI |
+| Development      | Stable, long-maintained      | In active development                 |
+| Test Requirements| Strict documentation rules   | Same, with new feature emphasis       |
+
+
+
+If you're unsure which driver your hardware uses, check:
+
+```bash
+lspci -nn | grep VGA
+dmesg | grep drm
+```
+
+And refer to the platform-specific driver documentation for more details.
+
+
+
+:material-email-outline: Questions? Reach out via
+[igt-dev@lists.freedesktop.org](mailto:igt-dev@lists.freedesktop.org)
diff --git a/docs/patchwork.md b/docs/patchwork.md
new file mode 100644
index 000000000..248ea1592
--- /dev/null
+++ b/docs/patchwork.md
@@ -0,0 +1,18 @@
+# Patchwork for IGT GPU Tools
+
+**Patchwork** is used to track patches submitted to the IGT GPU Tools mailing list.
+
+- View submitted patches: [IGT Patchwork](https://patchwork.freedesktop.org/project/igt/series/)
+- Patch status archive: [Lore: igt-dev](https://lore.kernel.org/igt-dev/)
+
+##  What it is
+
+Patchwork collects patches sent to: :material-email-outline:
+[igt-dev@lists.freedesktop.org](mailto:igt-dev@lists.freedesktop.org)
+
+It helps maintainers and contributors:
+
+ - Track patch series
+ - See review status
+ - Check CI results
+ - Organize accepted, rejected, or pending changes
diff --git a/docs/running_tests.md b/docs/running_tests.md
new file mode 100644
index 000000000..b0f22ca64
--- /dev/null
+++ b/docs/running_tests.md
@@ -0,0 +1,130 @@
+## :material-play-circle-outline: General
+
+Tests are located in the `tests/` directory.
+
+- List available subtests:
+
+```bash
+build/tests/core_auth --list-subtests
+```
+
+- Run a specific subtest:
+
+```bash
+build/tests/core_auth --run-subtest getclient-simple
+```
+
+- If `--run-subtest` is not used, all subtests will be executed.
+
+!!! info "Most tests must be run as **root** and with **no X or Wayland compositor** running."
+
+Example output:
+
+```
+# build/tests/core_auth
+IGT-Version: 1.24 (x86_64) (Linux: 5.3.0 x86_64)
+Starting subtest: getclient-simple
+Subtest getclient-simple: SUCCESS (0.001s)
+...
+
+```
+
+### Dynamic Subtests
+
+IGT supports dynamic subtests using `igt_subtest_with_dynamic` for cases where the full
+set of possible subtests is too large or impossible to know beforehand. Dynamic subtests
+are useful for operations like testing each KMS pipe separately.
+
+**Key characteristics of dynamic subtests:**
+
+- Used when reporting several aspects separately is desired
+- Useful when the full possible set is too big or impossible to know beforehand
+- Each dynamic subtest runs within a parent subtest block
+- Results are aggregated: SKIP if no dynamic subtests run, PASS if all pass, FAIL if
+  any fail
+
+**Example use case:** Testing KMS pipes where the number of available pipes varies by
+hardware:
+```c
+igt_subtest_with_dynamic("pipe-tests") {
+    igt_require(is_kms_available(fd));
+    for_each_pipe(display, pipe) {
+        igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+            test_pipe_operation(pipe);
+        }
+    }
+}
+```
+
+**Running dynamic subtests:**
+
+- List dynamic subtests: `--list-subtests` shows both parent and dynamic subtests
+- Run specific dynamic subtest: `--run-subtest parent-subtest@dynamic-name`
+- Run all dynamic subtests under a parent: `--run-subtest parent-subtest`
+
+**Dynamic subtest naming:**
+
+- Parent subtest name followed by `@` and dynamic name
+- Example: `pipe-tests@pipe-A`, `pipe-tests@pipe-B`
+- Dynamic names are generated at runtime based on available hardware
+
+**Example listing dynamic subtests:**
+```bash
+# List all subtests including dynamic ones
+build/tests/kms_atomic --list-subtests
+atomic-commits
+atomic-commits@pipe-A-HDMI-1
+atomic-commits@pipe-B-DP-1
+atomic-commits@pipe-C-eDP-1
+```
+
+**Example running dynamic subtests:**
+```bash
+# Run all dynamic subtests under atomic-commits
+build/tests/kms_atomic --run-subtest atomic-commits
+
+# Run specific dynamic subtest
+build/tests/kms_atomic --run-subtest atomic-commits@pipe-A-HDMI-1
+```
+
+### Using `run-tests.sh`
+
+You can also use the `scripts/run-tests.sh` wrapper script:
+
+```bash
+meson -Drunner=enabled build && ninja -C build
+```
+
+Run tests with filters:
+
+```bash
+scripts/run-tests.sh -t <regex>       # Include tests matching regex
+scripts/run-tests.sh -x <regex>       # Exclude tests matching regex
+```
+
+- List all tests and subtests:
+
+```bash
+scripts/run-tests.sh -l
+```
+
+- Get help on options:
+
+```bash
+scripts/run-tests.sh -h
+```
+
+Test results are saved as a JSON file.
+
+For the tests API reference please look at: [API Reference Documentation](api_reference/index.html)
+
+
+## :material-docker: Running via Container
+
+You can run IGT in a container using `podman` or `docker`:
+
+```bash
+podman run --rm --privileged registry.freedesktop.org/drm/igt-gpu-tools/igt:master
+```
+
+This avoids installing build dependencies locally.
diff --git a/docs/test_categories.md b/docs/test_categories.md
new file mode 100644
index 000000000..30f829f9b
--- /dev/null
+++ b/docs/test_categories.md
@@ -0,0 +1,266 @@
+# IGT GPU Tools Test Documentation Categories
+
+This document explains the different types of test categorization and documentation markup
+used in the IGT GPU Tools project for organizing and documenting test cases.
+
+## Overview
+
+IGT GPU Tools uses a structured documentation system with various categories and
+subcategories to organize tests. The project has been evolving its documentation markup
+to make it more precise and maintainable, with recent changes removing some deprecated
+fields like 'Functionality' and 'Test category' that were dependent on developer
+interpretation.
+
+!!! warning "Deprecated fields"
+    Not all the tests (e.g. for Core sub-category) have deprecated fields like
+    'Functionality', 'Test category' yet.
+
+## Primary Documentation Fields
+
+### 1. **Sub-category**
+The Sub-category field is the primary organizational unit for grouping related tests.
+This field has been actively maintained and expanded with new subcategories being
+introduced regularly.
+
+Recent Sub-categories include:
+
+- **Core** : Basic DRM functionality tests
+- **Synchronization** : Tests for synchronization mechanisms
+- **CMD submission** : Command submission related tests
+- **Blitter** : Blitter engine tests (unified for i915 and Xe)
+- **GPGPU** : General Purpose GPU compute tests
+- **Compute** : Computational workload tests
+- **Performance** : Performance measurement tests
+- **Memory management** : Memory allocation and management tests
+- **Power management** : Power-related functionality tests
+- **Display** : Display/KMS related tests
+- **Firmware** : Firmware interaction tests
+- **Media** : Media processing tests
+- **Render copy** : Render copy operation tests
+- **Debugging** : Debug and diagnostic tests
+- **Workarounds** : Hardware workaround tests
+- **Obsolete** : Deprecated or legacy tests
+- **SysMan** : System management tests
+- **FDinfo** : File descriptor information tests
+- **Flat-ccs** : Flat CCS (Color Compression Surface) tests
+
+### 2. **Mega-feature**
+While not explicitly detailed in the current documentation, mega-feature appears to be a
+higher-level categorization that groups multiple related sub-categories under broader
+functional areas.
+
+### 3. **Test Description**
+IGT uses the `igt_describe()` macro to attach descriptions to subtests. The description
+should complement the test/subtest name and provide context on what is being tested. It
+should explain the idea of the test without mentioning implementation details.
+
+**Best practices for descriptions:**
+
+- Focus on the userspace perspective
+- Capture the reason for the test's existence
+- Be brief and avoid implementation details
+- Don't translate code into English
+
+**Good examples:**
+
+- "make sure that legacy cursor updates do not stall atomic commits"
+- "check that atomic updates of many planes are indeed atomic and take effect
+  immediately after the commit"
+- "make sure that the meta-data exposed by the kernel to the userspace is correct and
+  matches the used EDID"
+
+## Deprecated Fields
+
+### **Test Category**
+The 'Test category' field has been removed from KMS tests documentation as it was not
+being used consistently.
+
+### **Functionality**
+The 'Functionality' field has also been removed as it "solely depends upon developer's
+interpretation" and was making documentation maintenance difficult.
+
+### **Run Type**
+The 'Run type' documentation field has been removed from recent versions.
+
+## Documentation Structure
+
+### **Test Organization**
+Tests can be organized using `igt_subtest_group` blocks, where the resulting subtest
+documentation is a concatenation of its own description and all parenting subtest group
+descriptions, starting from the outermost one.
+
+### **Dynamic Subtests**
+IGT supports dynamic subtests using `igt_subtest_with_dynamic` for cases where the full
+set of possible subtests is too large or impossible to know beforehand. Dynamic subtests
+are useful for operations like testing each KMS pipe separately.
+
+## Driver-Specific Categories
+
+### **Intel Tests**
+The Intel-specific tests have their own subcategory system:
+
+- **i915** driver tests
+- **Xe** driver tests (newer Intel GPU architecture)
+- **DRM** general Direct Rendering Manager tests
+
+### **Vendor-Specific**
+
+- **AMDGPU** - AMD GPU specific tests
+- **intel-nouveau** - Intel and Nouveau driver interaction tests
+
+## Documentation Generation
+
+The test documentation is automatically generated and can be accessed via the `--describe`
+command line switch. The IGT framework also supports `--list-subtests` to enumerate
+available subtests and `--run-subtest` to execute specific subtests.
+
+## Recent Changes and Evolution
+
+The IGT project has been actively refining its documentation system, with version 1.29
+introducing numerous subcategory additions and removing inconsistent documentation fields.
+The focus has shifted toward more precise categorization that is easier to maintain.
+
+### Key Improvements:
+
+- Unification of Blitter subcategory across i915 and Xe
+- Standardization of Sub-category/Functionality naming
+- Removal of developer-dependent interpretation fields
+- Addition of missing documentation fields for SRIOV and Display tests
+
+## Usage
+
+When adding new tests to IGT, developers should:
+
+1. Use appropriate Sub-category classification
+2. Provide clear, implementation-agnostic descriptions using `igt_describe()`
+3. Follow the established naming conventions
+4. Avoid using deprecated documentation fields
+5. Ensure consistency with existing test organization
+
+This categorization system helps maintain the large IGT test suite by providing clear
+organization and making it easier for developers to find relevant tests and understand
+their purpose.
+
+## Documentation Fields and Values Table
+
+Based on the current IGT GPU Tools codebase, here are the documented fields and their
+possible values:
+
+### Primary Documentation Fields
+
+| Field | Status | Description | Possible Values |
+|-------|--------|-------------|-----------------|
+| **Sub-category** | Active | Primary organizational unit for grouping related tests | See detailed list below |
+| **Test Description** | Active | Human-readable description using `igt_describe()` | Free text (implementation-agnostic) |
+| **Mega-feature** | Active | High-level categorization grouping multiple sub-categories | Driver-specific groupings |
+
+### Main Test Categories (Top-level)
+
+| Category | Description | Examples |
+|----------|-------------|----------|
+| **Core Tests** | Tests for core DRM ioctls and behaviour | Authentication, basic operations |
+| **KMS Tests** | Tests for kernel mode setting | Display functionality, connectors |
+| **GEM Tests** | Tests for graphics execution manager | Memory management, buffer operations |
+| **i915 Tests** | Tests for overall i915 driver behaviour | Intel-specific functionality |
+| **Display Tests** | Tests for display validation | Panel fitting, CRC validation |
+| **Perf Tests** | Tests for performance metrics | GPU performance counters |
+| **PM Tests** | Tests for power management features | Suspend/resume, power states |
+| **Prime Tests** | Tests for buffer sharing | Inter-device buffer sharing |
+| **Debugfs Tests** | Tests for debugfs behaviour | Debug filesystem functionality |
+| **DRM Tests** | Tests for libdrm behaviour | Library functionality |
+| **Meta Tests** | Tests for the CI system itself | Test infrastructure validation |
+| **SW Sync Tests** | Tests for software sync (fencing) | Synchronization primitives |
+| **vGEM Tests** | Tests for virtual graphics execution manager | Virtual GPU functionality |
+| **Tools Tests** | Tests for IGT tools behaviour | Tool validation |
+
+### Sub-category Values (Detailed)
+
+#### Core Infrastructure
+| Sub-category | Description |
+|--------------|-------------|
+| **Core** | Basic DRM functionality tests |
+| **Synchronization** | Tests for synchronization mechanisms |
+| **Device** | Device enumeration and management |
+| **Authentication** | DRM authentication mechanisms |
+
+#### Intel-Specific Sub-categories
+| Sub-category | Description |
+|--------------|-------------|
+| **CMD submission** | Command submission related tests |
+| **Blitter** | Blitter engine tests (unified for i915 and Xe) |
+| **GPGPU** | General Purpose GPU compute tests |
+| **Compute** | Computational workload tests |
+| **Performance** | Performance measurement tests |
+| **Memory management** | Memory allocation and management tests |
+| **Power management** | Power-related functionality tests |
+| **Firmware** | Firmware interaction tests |
+| **Media** | Media processing tests |
+| **Render copy** | Render copy operation tests |
+| **Debugging** | Debug and diagnostic tests |
+| **Workarounds** | Hardware workaround tests |
+| **SysMan** | System management tests |
+| **FDinfo** | File descriptor information tests |
+| **Flat-ccs** | Flat CCS (Color Compression Surface) tests |
+
+#### Display Sub-categories
+| Sub-category | Description |
+|--------------|-------------|
+| **Display** | General display functionality |
+| **KMS** | Kernel Mode Setting tests |
+| **Chamelium** | External test device integration |
+| **Panel** | Panel-specific functionality |
+| **HDMI** | HDMI interface tests |
+| **DisplayPort** | DisplayPort interface tests |
+| **VGA** | VGA interface tests |
+
+#### Vendor-Specific Sub-categories
+| Sub-category | Description |
+|--------------|-------------|
+| **AMDGPU** | AMD GPU specific tests |
+| **intel-nouveau** | Intel and Nouveau driver interaction |
+| **i915** | Intel i915 driver tests |
+| **Xe** | Intel Xe driver tests |
+
+#### Legacy/Deprecated Sub-categories
+| Sub-category | Description |
+|--------------|-------------|
+| **Obsolete** | Deprecated or legacy tests |
+
+### Deprecated Fields
+
+| Field | Status | Reason for Deprecation |
+|-------|--------|----------------------|
+| **Test Category** | Removed | Not used consistently |
+| **Functionality** | Removed | Developer-dependent interpretation |
+| **Run Type** | Removed | Unclear usage patterns |
+
+### Driver-Specific Mega-features
+
+| Driver | Mega-feature Examples |
+|--------|---------------------|
+| **i915** | Display, GEM, Performance, Power Management |
+| **Xe** | Compute, CMD Submission, Memory Management |
+| **AMDGPU** | Display, Compute, Performance |
+
+### Documentation Markup Examples
+
+```c
+/**
+ * SUBTEST: %s
+ * Description: %s
+ * Sub-category: %s
+ */
+
+// Example usage:
+igt_describe("check that atomic updates are indeed atomic");
+igt_subtest_with_dynamic("atomic-plane-updates") {
+    // Test implementation
+}
+```
+
+### Field Usage Guidelines
+
+1. **Sub-category**: Always required, must match established categories
+2. **Test Description**: Should be implementation-agnostic and focus on what is tested
+3. **Mega-feature**: Used for high-level organization, typically driver-specific
+4. **Avoid deprecated fields**: Do not use Test Category, Functionality, or Run Type
diff --git a/docs/test_plan.md b/docs/test_plan.md
new file mode 100644
index 000000000..edda50f4b
--- /dev/null
+++ b/docs/test_plan.md
@@ -0,0 +1,216 @@
+# :material-clipboard-text: Test Plan
+
+## :material-information-outline: Overview
+
+IGT GPU Tools implements a comprehensive test plan system to ensure proper documentation
+and validation of all tests. The test plan is particularly important for maintaining
+quality and consistency across different GPU drivers and test categories.
+
+!!! warning "Build Requirement"
+    **Some drivers and test sets require that all tests be properly documented via
+    testplan.** By default, the build will fail if documentation is missing or outdated.
+    This is currently enabled for:
+
+    - **Xe driver tests**
+    - **i915 driver tests**
+    - **KMS (Kernel Mode Setting) tests**
+
+For more details, see `docs/test_documentation.md` in the IGT source tree.
+
+## :material-file-document-outline: Test Plan Structure
+
+### Documentation Requirements
+
+Every test that falls under test plan validation must include proper documentation using
+the IGT documentation system:
+
+```c
+/**
+ * TEST: test_name
+ * Category: Display|Core|Performance|etc
+ * Description: Brief description of what the test validates
+ * Sub-category: Specific functional area
+ */
+
+/**
+ * SUBTEST: subtest_name
+ * Description: What this specific subtest validates
+ */
+```
+
+## :material-cog-outline: Test Plan Validation
+
+### Build-Time Validation
+
+The IGT build system automatically validates test documentation:
+
+```bash
+# Build will fail if documentation is missing
+meson build
+ninja -C build
+
+# Error example:
+# ERROR: Test 'kms_example' is missing required documentation
+# Please add proper TEST and SUBTEST documentation blocks
+```
+
+### Documentation Generation
+
+IGT provides tools to generate and validate test documentation:
+
+```bash
+# Generate test documentation
+./scripts/igt_doc.py --config=tests/kms_test_config.json
+
+# Filter by functionality
+./scripts/igt_doc.py --config=tests/kms_test_config.json \
+    --filter-field=Functionality=~'kms_core,synchronization'
+
+# Validate specific test categories
+./scripts/igt_doc.py --config=tests/intel_test_config.json \
+    --filter-field=Category=Display
+```
+
+## :material-script-text-outline: Documentation Examples
+
+### Basic Test Documentation
+
+```c
+/**
+ * TEST: kms_atomic
+ * Category: Display
+ * Description: Test atomic modesetting functionality
+ * Sub-category: Atomic
+ */
+
+/**
+ * SUBTEST: plane-cursor-legacy
+ * Description: Test interaction between cursor plane and legacy cursor API
+ */
+igt_subtest("plane-cursor-legacy") {
+    igt_describe("Verify cursor plane behavior when mixing atomic and legacy APIs");
+    test_cursor_interaction();
+}
+```
+
+### Advanced Documentation with Dynamic Subtests
+
+```c
+/**
+ * TEST: kms_pipe_operations
+ * Category: Display
+ * Description: Validate operations across different display pipes
+ * Sub-category: Core
+ */
+
+/**
+ * SUBTEST: pipe-%s-basic-modeset
+ * Description: Basic modeset validation for pipe %arg[1]
+ */
+igt_subtest_with_dynamic("pipe-basic-modeset") {
+    for_each_pipe(display, pipe) {
+        igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+            igt_describe("Verify basic modeset functionality on a single pipe");
+            test_basic_modeset(pipe);
+        }
+    }
+}
+```
+
+## :material-check-circle-outline: Test Plan Compliance
+
+### Mandatory Requirements
+
+For Xe, i915, and KMS tests:
+
+1. **Complete Documentation**: Every test and subtest must have proper documentation blocks
+2. **Accurate Descriptions**: Descriptions must be implementation-agnostic and focus on
+   what is tested
+3. **Proper Categorization**: Tests must use established categories and sub-categories
+4. **Build Validation**: Documentation is validated at build time
+
+### Best Practices
+
+1. **Descriptive Names**: Use clear, descriptive test and subtest names
+2. **Consistent Categories**: Follow established category hierarchies
+3. **Implementation-Agnostic**: Avoid describing how tests work, focus on what they
+   validate
+4. **Regular Updates**: Keep documentation in sync with test changes
+
+### Common Documentation Issues
+
+❌ **Bad Documentation:**
+```c
+// Too implementation-specific
+"spawn 10 threads, each pinning cpu core with a busy loop..."
+
+// Too vague
+"test stuff"
+
+// Missing required fields
+/**
+ * TEST: example
+ * Description: Some test
+ */
+// Missing Category and Sub-category
+```
+
+✅ **Good Documentation:**
+```c
+/**
+ * TEST: kms_cursor_legacy
+ * Category: Display
+ * Description: Test legacy cursor interface functionality and compatibility
+ * Sub-category: Cursor
+ */
+
+/**
+ * SUBTEST: basic-flip-before-cursor
+ * Description: Verify cursor updates work correctly after page flips
+ */
+```
+
+
+## :material-tools: Validation Tools
+
+### igt_doc.py Script
+
+The main tool for test plan validation and generation:
+
+```bash
+# Basic validation
+./scripts/igt_doc.py --config=tests/kms_test_config.json
+
+# Generate HTML documentation
+./scripts/igt_doc.py --config=tests/kms_test_config.json --output-dir=docs/
+
+# Validate specific functionality
+./scripts/igt_doc.py --filter-field=Sub-category=Synchronization
+
+# Check for missing documentation
+./scripts/igt_doc.py --validate-only
+```
+
+### Configuration Files
+
+Test configurations are stored in JSON files:
+
+- `tests/kms_test_config.json` - KMS test configuration
+- `tests/intel_test_config.json` - Intel driver test configuration
+- `tests/xe_test_config.json` - Xe driver test configuration
+
+### CI Integration
+
+Test plan validation is integrated into CI systems:
+
+- **Pre-merge testing**: Documentation is validated before patches are merged
+- **Post-merge validation**: Ensures documentation stays up-to-date
+- **Automated reporting**: Missing documentation triggers build failures
+
+
+## :material-link: References
+
+- `docs/test_documentation.md` - Detailed documentation requirements
+- IGT source tree test files - Examples of proper documentation
+- CI system logs - Build validation feedback
+- `scripts/igt_doc.py` - Documentation generation tool
diff --git a/docs/mkdocs.yml b/mkdocs.yml
similarity index 98%
rename from docs/mkdocs.yml
rename to mkdocs.yml
index 000c007f0..4b8e8ee0c 100644
--- a/docs/mkdocs.yml
+++ b/mkdocs.yml
@@ -21,6 +21,8 @@ nav:
         - Code:
           - How to use the code: 'api.md'
           - How to track/submit changes: 'patchwork.md'
+        - External tools:
+          - Chamelium: 'chamelium.md'
         - Contributing:
           - How to contribute: 'CONTRIBUTING.md'
           - How to document tests: 'test_documentation.md'
-- 
2.34.1

