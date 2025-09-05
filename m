Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A47CA1013
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 12:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D8F10EB98;
	Fri,  5 Sep 2025 12:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drPZYnAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C86E10EB98
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757075996; x=1788611996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KneU924uatVYV/kQJt2Hlg0IvilecyQErczVN16Tcco=;
 b=drPZYnAp+15oTx9konzQBBPWIlGO46RFbmgIQ5q/bNNXgeCOM6CmroDL
 be29nA0hXzjAxaRlgzJhPibA9YmM8f541Dw1/91jMETzTXETsCetMg+Xl
 viReBcYSg3bRdwse8FA+nqSaigaYod+X2ZCE2g4eqWYgoWjCKO2+BfYU7
 JTXE6J9m75ZIQUpZoFnBQRLfEVvBZkcrvlgqVavx0iujndBpoBTCnhDQJ
 Ww8cFKK7bYxhCs3C0ft/3OLzktrErOUfIwWLOOoAkqAMXrIkDx49rTX01
 JzCnwVtN+W17wDaN2O4eVMFTs7kD4Gtwj0r/SYFqqigdINuHhVQUUf9UL w==;
X-CSE-ConnectionGUID: Dp4K6xnaSjqFbD7d0xcmiQ==
X-CSE-MsgGUID: CX1Y00BCRbGni1bKdrincA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82018259"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82018259"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 05:39:55 -0700
X-CSE-ConnectionGUID: G6XaWI0nRLy9R32+nk0DGw==
X-CSE-MsgGUID: NXXOcLvgQmiAMf8xtC1TqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="172507621"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.226])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 05:39:54 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 4/6] README: simplify and point to mkdocs docs
Date: Fri,  5 Sep 2025 14:39:25 +0200
Message-ID: <20250905123928.130927-5-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905123928.130927-1-pawel.sikora@intel.com>
References: <20250905123928.130927-1-pawel.sikora@intel.com>
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

Update README with basic content, reflecting
the reorganization of documentation files.

Content removed in this patch from README has
been moved to docs/overview.md, docs/building.md
and some other documentation files with specific
purposes.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 README.md | 213 ++++++++++--------------------------------------------
 1 file changed, 39 insertions(+), 174 deletions(-)

diff --git a/README.md b/README.md
index ed6647726..ebb4befb6 100644
--- a/README.md
+++ b/README.md
@@ -1,190 +1,55 @@
-IGT GPU Tools
-=============
+# IGT GPU Tools
 
+**IGT GPU Tools** is a collection of low-level tools, utilities, and test suites
+designed for **development and validation of Linux Direct Rendering Manager (DRM)
+drivers**, with a primary focus on Intel graphics hardware.
+It is used extensively by kernel developers, CI systems, and hardware teams
+to detect regressions, verify features, and maintain GPU driver quality.
 
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
+IGT stands for **Intel Graphics Tests**, though support for non-Intel platforms
+is growing through community contributions.
 
-Generated documentation for the latest master is published under
-<https://drm.pages.freedesktop.org/igt-gpu-tools/>.
+This project provides:
 
+- A comprehensive set of **automated tests** targeting various parts
+of the graphics stack (KMS, GEM, command submission, memory management, etc.)
+- **Diagnostic tools** and utilities for manual inspection and debugging
+- **Microbenchmarks** to measure GPU performance characteristics
+- A shared **library of testing helpers** and wrappers for kernel interfaces
+(e.g., ioctls, sysfs, debugfs)
+- A flexible **test runner** for executing and filtering test cases
+in development or CI environments
 
-Requirements
-------------
+IGT GPU Tools is especially useful for:
 
-See `Dockerfile.build-fedora` for up-to-date list of package names in Fedora
-or `Dockerfile.build-debian-minimal` and `Dockerfile.build-debian` for Debian.
+- Detecting regressions early in the kernel development cycle
+- Verifying compliance with DRM driver expectations
+- Exercising corner cases not covered by higher-level test suites
+like Piglit or RenderDoc
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
+- `data/` - test data files and reference materials
+- `docs/` — Sphinx-based developer and API documentation
 
-But keep in mind that this may be slightly outdated and miss some
-recently added dependencies for building the current master.
 
+## License
 
-Building
---------
+IGT GPU Tools is licensed under the **MIT License**.
+By contributing, you agree to the [Developer Certificate of Origin (DCO)](http://developercertificate.org/).
 
-Oneliner to get started:
+## Documentation
 
-    $ meson setup build && ninja -C build
+Detailed documentation, including build instructions, test guides,
+and API references, is available at:
 
-Note that meson insist on separate build directories from the source tree.
+- [IGT Documentation](https://drm.pages.freedesktop.org/igt-gpu-tools)
 
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
-- 
2.51.0

