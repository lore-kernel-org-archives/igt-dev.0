Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECC4C77B7F
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 13:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C476210E22E;
	Fri, 27 Jun 2025 13:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LjSKFDus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047610E22E
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751030464; x=1782566464;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=4Xjxg+X2bQJhtW6Szc/M1/jayKu0GiS2T4BKNHzEMrE=;
 b=LjSKFDus6gzhwoXWOFdgyqasrrJ2wO0+MaA0qztoiWvLoA1ci7e8ti0A
 J0jwBHHmkmIVU3HKFgpz12BA5fU0+OpczuSq4ropGQTGzQ7xf+0nI/rlh
 VvDMBDeDYTPlkTBQ58qL+qY4UsG5pE3AIoAObm8gOtaw+CoXNSgs+3xcz
 Q1F4zeCSHeHBj+vdIo17a2qi5WhKzEd/5iPk8WUzU5LlD08a2VtSyadgn
 /fquJEAnvtfwqKsN+sX6e9fqQSwA4Z6n3NcnsY0iQGfdfp4hWU1zR9ueD
 /Xi4RYca6eFAlAde20Hd17KugZ28P7a67LvNjwteH3axDx+iaH0dsuRUm Q==;
X-CSE-ConnectionGUID: WVw0mEMnQo2FUnGT+1YguQ==
X-CSE-MsgGUID: azZYdAkHQNyDy+X3KHfPaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53309733"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53309733"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:21:03 -0700
X-CSE-ConnectionGUID: kLxYPK1oQ+6EmJ3PRm0/IA==
X-CSE-MsgGUID: lh48ppXERC2suotrcQzrKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="157093132"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:21:02 -0700
Date: Fri, 27 Jun 2025 15:20:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: xorg-announce@lists.x.org
Cc: xorg@lists.x.org, igt-dev@lists.freedesktop.org
Subject: [ANNOUNCE] igt-gpu-tools 2.1
Message-ID: <aF6au_Y3o3VqRknn@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 xorg-announce@lists.x.org, xorg@lists.x.org,
 igt-dev@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

A new igt-gpu-tools release is available with the following changes:

Release 2.01 (2025-06-27)
- -------------------------

General changes:

- - Bumped required meson version to 0.52.1 (Andrzej Hajda)

- - Added man page for lsgpu. (Peter Senna Tschudin)

Devops changes:

- - Improved GitLab CI pipeline. (Andrzej Hajda)

- - Bumped Debian version to bullseye and Fedora to latest 42 (Andrzej Hajda)

- - Removed MIPS testing (Ryszard Knop and Andrzej Hajda)

Library changes:

- - Updated PCI ids for BMG/PTL. (Shekhar Chauhan and Kamil Konieczny)

- - Preliminary enablement for Android compilation (Sapna Singh and Jeevaka
  Prabu Badrappan)

- - Improved kernel module un/binding. (Lucas De Marchi and Francois Dugast)

- - Added user mode queues UMQ support for amdgpu. (Sunil Khatri)

- - Improved Intel GPGPU compute libs. (Francois Dugast and Zbigniew Kempczyński)

- - New configfs library. (José Expósito, Jim Shargo, Marius Vlad, Riana Tauro)

- - Added PTL support in Xe OA libs. (Sushma Venkatesh Reddy)

- - Improved capturing logs for child processes. (Pawel Sikora)

Test changes:

- - New test drm_virtgpu for VirtIO-GPU. (Dorinda Bassey)

- - New Xe survivability mode testing. (Riana Tauro)

- - New amdgpu tests for jpeg and vcn queues. (Ruili Ji)

- - New Xe system allocator test. (Matthew Brost).

- - Improved Xe fault injection. (Satyanarayana K V P)

- - New Xe PXP test. (Daniele Ceraolo Spurio)

- - Unified Intel sysfs and debugfs testing. (Peter Senna Tschudin)

- - Improved chamelium color test. (Swati Sharma)

- - Improved Xe OA testing. (Ashutosh Dixit, Sai Teja Pottumuttu and Umesh
  Nerlige Ramappa)

- - Added dual display subtest in multi plane test. (Karthik B S)

Tools changes:

- - New tool intel_hdcp for printing HDCP info on connected outputs. (Santhosh
  Reddy Guddati)

- - Add support for gen10+ devices in intel_gtt (Tomita Moeko)

- - Add support for Xe in intel_pm_rpm (Soham Purkait)

Runner changes:

- - Use boottime for time checks. (Kamil Konieczny)

Benchmark changes:

- - New Xe benchmarks. (Pravalika Gurram)


And many other bug fixes, improvements, cleanups and new tests.


Aditya Chauhan (2):
      tests/intel/xe_exec_system_allocator: Add GPU platform PTL for sys allocator tests
      Revert "tests/intel/xe_exec_system_allocator: Add GPU platform PTL for sys allocator tests"

Alex Deucher (2):
      lib/amdgpu: fix SDMA packet contents for deadlock helper
      lib/amdgpu: fix valid error codes for deadlock asserts

Alex Hung (2):
      tests/amdgpu/amd_hotplug: add missing include file fcntl.h
      README: Update oneliner build command

Andrzej Hajda (17):
      lib/iga64: fix send macro for DG2 platforms
      scripts/generate_iga64_codes: make script less chatty
      scripts/generate_iga64_codes: fix handling empty asms
      scripts/generate_iga64_codes: remove parenthesis around ARG macro body
      lib/meson: refactor GPGPU assembly build process
      Revert "lib/meson: refactor GPGPU assembly build process"
      gitlab-ci: create own base buildah image instead of wayland's
      Dockerfile: remove MIPS architecture
      Dockerfile: bump debian version
      Dockerfile: bump fedora version
      meson: bump required and tested version of meson
      gitlab-ci: remove podman login
      gitlab-ci: correct meson setup commands
      gitlab-ci: build docs before installation
      lib/tests/igt_assert: use volatile cast in igt_assert
      Dockerfile: bump fedora version to the newest one
      lib/meson: refactor GPGPU assembly build process

André Almeida (4):
      lib/ioctl_wrappers: let the caller handle capability check result
      tests/kms_async_flips: Check for atomic async flip cap
      kms_async_flips: Refactor data options
      tests/kms_async_flips: Create subtest for overlay planes

Arun R Murthy (1):
      tests/kms_properties: Add IN_FORMATS_ASYNC property

Ashutosh Dixit (13):
      tests/intel/xe_oa: Fix __for_one_render_engine
      tests/intel/xe_oa: Don't limit sync tests to render engine
      tests/intel/xe_oa: Check for DRM_XE_OA_CAPS_OA_BUFFER_SIZE
      tests/intel/xe_oa: Rename check_reports to mmap_check_reports
      tests/intel/xe_oa: Fix oa_tick_delta
      tests/intel/xe_oa: Sanity check PEC report data for TestOa metric set
      tests/intel/xe_oa: Only sanity check timer PEC reports
      tests/intel/xe_oa: Reduce test_non_zero_reason execution time
      tests/intel/xe_oa: Drop pec_sanity_check_one
      tests/intel/xe_oa: Skip non-zero-reason subtest in simulation
      tests/intel/xe_oa: Avoid divide by zero SIGFPE
      drm-uapi/xe: Sync with OAM uapi updates
      tools/xe-perf: Change xe_perf_recorder command line to use OA unit id

Bram Stolk (1):
      tools/xe-perf/xe-perf-record: Fix printing sysctl suggestion

Chris Wilson (2):
      test/intel/prime_mmap: Limit aperture testing to machines with an aperture
      tests/intel/prime_mmap: Fix second buffer size

Daniele Ceraolo Spurio (7):
      tests/intel/xe_vm: Update invalid flag subtest with valid PXP flag
      tests/intel/xe_query: Add test for PXP status query
      tests/intel/xe_pxp: Add PXP object and queue creation tests
      tests/intel/xe_pxp: Test PXP submissions
      tests/intel/xe_pxp: Termination tests
      tests/intel/xe_pxp: Test encrypted FBs
      tests/intel/xe_pxp: Terminate PXP on exit

Dominik Grzegorzek (2):
      tests/xe_eudebug: Implement faultable variations of some testcases
      tests/xe_eudebug_online: Implement faultable variations of some testcases

Dominik Karol Piątkowski (2):
      tests/xe_eudebug_online: Calculate bb_size from shader
      tests/intel/xe_exec_sip: Adjust test documentation

Dorinda Bassey (1):
      tests/drm_virtgpu: Add functional coverage for core VirtIO-GPU ioctls

Francois Dugast (20):
      lib/igt_kmod: Allow igt_kmod_unbind() on a specific device
      lib/igt_sysfs: Remove XE_SYSFS_DRIVER_UNBIND
      tests/intel/xe_fault_injection: Add test for xe_hw_engine_class_sysfs
      lib/intel_blt: Promote MEM_COPY_MOCS_SHIFT
      lib/xe/xe_spin: Add mem copy capability to spinner
      tests/intel/xe_spin_batch: Add basic test for mem copy from spinner
      tests/intel/xe_render_copy: Expose render duration
      tests/intel/xe_render_copy: Add new test for render under copy stress
      lib/intel_compute: Use common constant for surface state size
      lib/intel_compute: Use common constant for dynamic state size
      lib/intel_compute: Use common constant for indirect object size
      lib/intel_compute: Use common constant for binding table size
      lib/intel_compute: Use common constant for general state size
      lib/intel_compute: Use constant for binding table address
      lib/intel_compute: Compact memory map
      lib/intel_compute: Relocate input and output objects
      lib/intel_compute: Fix enqueued local size starting with xelpg
      lib/intel_compute: Use constants for thread groups and local work size
      lib/intel_compute: Make array size a dynamic parameter
      lib/intel_compute: Allow the user to override input and output addresses

Harish Chegondi (6):
      tests/intel/xe_eu_stall: Add invalid input tests for EU stall sampling
      tests/intel/xe_eu_stall: Add tests to run blocking and non-blocking read twice
      tests/intel/xe_eu_stall: Check if observation_paranoid file is present
      tests/intel/xe_eu_stall: Close any open EU stall fd before opening a new one
      tests/intel/xe_eu_stall: Do not check for presence of data on simulation
      tests/intel/xe_eu_stall: Use query IOCTL to check for EU stall support

Himanshu Girotra (2):
      tests/intel-ci: Add platform blocklists for Eudebug
      tests/intel/xe_live_ktest: Adjust test documentation

Jakub Kolakowski (4):
      lib/igt_pm: Introduce helper to check for PM capability
      tests/intel/xe_pm: Add a check for power management capability
      tests/kms_plane_cursor: check for display before cursor size
      tests/kms_cursor_edge_walk: check for display and pipe CRC before cursor size

Jan Sokolowski (13):
      tests/intel/xe_*: Add missing test documentation
      lib/xe/xe_eudebug: skip when disabling eudebug with no eudebug support
      tests/intel/xe_render_copy: Skip tests on renderless cards
      lib/amdgpu: fix print formatting for 32-bit compilation
      tests/amdgpu: fix print formatting for 32-bit compilation
      lib/igt_nouveau: fix print formatting for 32-bit compilation
      lib/igt_perf: fix scan formatting for 32-bit compilation
      lib/xe/xe_sriov*: fix print/scan formatting for 32-bit compilation
      tests/intel/xe_sriov*: fix print formatting for 32-bit compilation
      runner: fix print/scan formatting for 32-bit compilation
      tests/intel/xe*: fix print formatting for 32-bit compilation
      tests/intel/xe_eudebug: fix print formatting for 32-bit compilation
      tests/intel/xe_eudebug: move multigpu requirement to test block

Jani Nikula (1):
      lib/dsc: use intel_display_caps instead of i915_display_capabilities

Jeevaka Prabu Badrappan (20):
      tools/gputop: find program name from command line
      tools/intel_gpu_top: Replace index with strchr
      lib/igt_core: Conditionally define __noreturn
      lib/igt_core: Add a dummy workaround when libunwind is not present
      lib/igt_device_scan: Replace rindex with strrchr
      lib/igt_core: Fix printing when libunwind is not present
      lib/igt_dummyload: Avoid pthread_cancel use by overriding timer value
      lib/xe/xe_spin: Avoid pthread_cancel use by overriding timer value
      lib/intel_batchbuffer: handle base64 encode fail
      tests/intel/*_intel_bb: handle base64 encode fail
      lib/igt_device_scan: reuse igt hash
      lib: Include local igt glib header for Android
      lib/igt_aux: Handle absence of libproc2 in Android
      tests/intel: Include local glib header for Android
      tests/testdisplay: Include local glib header for Android
      runner: Include local glib header for Android
      tools: Include local glib header for Android
      tests/intel/xe_create: Conditionally define PAGE_SIZE for non-Android platforms
      tools/intel_firmware_decode: Conditionally define __packed
      include/android/glib: Fix Android build error

Jeevan B (5):
      tests/intel/kms_dirtyfb: Fix misplaced parenthesis in display version check
      lib/igt_kms: Prevent bigjoiner assignment if next pipe is already in use
      Revert "tests/kms_display_modes: Skip test if joiner display is connected"
      tests/kms_display_modes: Fit modes within MST bandwidth constraints
      tests/kms_vrr: Skip LOBF test if PR is not supported on sink

Jesse.Zhang (7):
      lib/amdgpu: add timeout support for user queue submissions
      lib/amdgpu: enhance command submission and error handling with user queue support
      igt/amdgpu: Add user queue support to deadlock tests
      lib/amdgpu: Generalize command submission NOP function
      tests/amdgpu: Add SDMA with UMQ test case to amd_basic
      lib/amdgpu: Generalize command submission to support SDMA
      tests/amdgpu: Add user queue test control via environment variable

Jesse.zhang@amd.com (5):
      lib/meson.build: Add AMDGPU_USERQ_ENABLED check for user queues
      tests/amdgpu: Add secure UMQ tests for GFX and compute
      lib/amdgpu: Add encrypted flag for secure user queues
      drm-uapi/amdgpu: Add queue priority and secure flags definitions
      lib/amdgpu: Implement priority and secure flags for user queues

Jonathan Cavitt (5):
      tests/intel/xe_oa: Remove buffer overflow guard from buffer-size tests
      lib/igt_os: Add igt_get_meminfo
      tests/intel/xe_exec_system_allocator: Check for huge pages before thp tests
      tests/intel/xe_exec_system_allocator: Check huge pages free in thp tests
      tests/intel/xe_fault_injection: Make pci_slot const

José Expósito (2):
      lib/igt_aux: Move is_mountpoint() to igt_aux
      lib/igt_configfs: Add helper to mount configfs

Juha-Pekka Heikkila (4):
      lib/igt_fb: simulate i915 linear fb behavior on xe
      tests/kms_plane: Print out tested formats
      tests/kms_plane: Fix crash on fail
      tests/kms_getfb: replace CCS with NV12 and use libigt functions

Kamil Konieczny (19):
      CONTRIBUTING: Add subscription and patchwork info
      CONTRIBUTING: Add guide about igt libraries
      runner/executor: Use bootime for time checks
      intel-ci/i915: Block more Xe tests in i915 runs
      intel-ci/xe: Block more i915 tests in Xe runs
      runner/executor: sync outputs after tests end
      tests/intel: rename drm_fdinfo into i915_drm_fdinfo
      intel/xe_test_config.json: add intel_sysfs_debugfs
      Revert "tests/xe: Add system_allocator test"
      lib/xe/xe_ioctl: Fix compilation on 32-bit armhf
      tests/intel/xe_exec_system_allocator: Fix 32-bit compilation
      intel-ci/xe.blocklist: Fix regex for blocked tests
      intel-ci/xe.blocklist: remove device_reset@unbind-reset-rebind
      intel/xe_test_config.json: add device_reset
      lib/pciids: Add one BMG pci id
      tests/amdgpu: Fix compilation warnings for USERQ
      intel-ci: Block virtgpu tests for i915
      intel-ci/xe.blocklist: Block virtgpu test
      Update NEWS, bump version to 2.1

Karthik B S (7):
      scripts/test_list: Do not stop the build if documentation fails
      tests/kms_addfb_basic: Split tests into subtest groups
      lib/igt_kms: Use get_max_pipe_hdisplay in joiner_possible functions
      tests/kms_plane_multiple: Add dual display subtest
      tests/intel-ci: Blocklist AMD specifc subtest
      tests/intel-ci: Add platform blocklists to enable platform testlist creation
      tests/intel/test_config: Add GPU excluded platform definition for LNL/BMG

Kolanupaka Naveena (2):
      tests/intel/xe_mmap: Fix open/close calls
      tests/intel/xe_mmap: Acquire rpm reference for pci-membarrier tests

Krzysztof Niemiec (1):
      Revert "tests/intel/gem_exec_capture: Deal with DG1 recoverable vs. capture uapi changes"

Kunal Joshi (1):
      tests/chamelium/kms_chamelium_color: force connector reprobe after plugging ports

Lucas De Marchi (14):
      tests/intel/xe_fault_injection: Test some early probe functions
      tests/intel/xe_fault_injection: Use separate functions
      tests/intel/perf_pmu: Remove invalid_init test for cpu
      lib/igt_kmod: Fix leaking dir
      lib/igt_kmod: Fix comment about unbound devices
      lib/igt_kmod: Simplify igt_kmod_unbind()
      lib/igt_kmod: Use igt_kmod_unbind() to kick snd_hda_intel
      lib/igt_kmod: Add igt_kmod_bind()
      tests/intel/xe_fault_injection: Use igt_kmod_bind()
      tests/intel/xe_fault_injection: Drop XE_SYSFS_DRIVER_TRY_BIND usage
      lib/igt_kmod: Add rebind abstraction
      tests/intel/xe_wedged: Drop XE_SYSFS_DRIVER_REBIND usage
      lib/igt_sysfs: Drop xe_sysfs_driver_do()
      tests/intel/xe_configfs: Test engines_allowed

Lukasz Laguna (3):
      tests/intel/xe_*: skip subtests using "mocs" debugfs if it's not present
      tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM flag where it's missing
      tests/intel/xe_exec_atomic: Fix incorrect GEM create flag

Marcin Bernatowicz (8):
      tests/intel/xe_fault_injection: Injection list clear at exit
      tests/intel-ci/xe-sriov-vm.blocklist.txt: Blocklist for SR-IOV VM runs
      intel-ci/meson.build: Add missing xe-sriov-vm.blocklist.txt
      tests/intel/xe_fault_injection: Skip OA test if Xe OA interface is not available
      tests/intel/xe_fault_injection: Make inject-fault-probe-function* tests VF-aware
      tests/intel/xe_pmu: Unprovision VFs on cleanup
      tests/intel/xe_pmu: Check default scheduling attributes before test
      tests/intel/xe_sriov_scheduling: Close open handles before disabling VFs

Matt Roper (1):
      lib/xe_query: Fix doc string for xe_device->memory_regions

Matthew Brost (4):
      lib/xe/spin: Use READ_ONCE, WRITE_ONCE macros in Xe spin library
      uapi/xe: Sync latest uAPI KMD headers
      tests/xe: Add system_allocator test
      tests/xe: Add system_allocator test

Melissa Wen (1):
      tests/kms_async_flip: skip subtest on AMD if invalid condition

Michal Wajdeczko (3):
      lib/xe_gt: Move reset related function to xe_gt.c
      lib/xe_gt: Trigger forced GT reset using write
      lib/xe_gt: Update has_xe_gt_reset function

Mitul Golani (3):
      tests/kms_vrr: Bucketize refresh rate tolerance
      tests/kms_vrr: Increase readability of kms_vrr
      tests/kms_vrr: Skip display config when commit already failed

Mohammed Thasleem (2):
      tests/intel/kms_pm_dc: Add skip logic and logging for DC5 psr test
      tests/intel/kms_pm_dc: Remove PKGC10 dependency to validate DC6

Nakshtra Goyal (2):
      tests/intel/xe_fault_injection: Inject errors during observation IOCTL
      tests/intel/xe_mmap: Adding igt exercise for RO page

Naladala Ramanaidu (5):
      lib/igt_psr: Fix PSR active check for DisplayPort connectors
      tests/intel-ci: Blocklist unsupported Xe scaling tests
      Revert "tests/intel-ci: Blocklist unsupported Xe scaling tests"
      tests/kms_flip: Default to tiled modifiers for stable flips on high refresh panels
      tests/kms_flip: Track and report unexpected events with pass rate metric

Nemesa Garg (1):
      tests/kms_universal_plane: Fix fb count mismatch

Pawel Sikora (1):
      lib/igt_core: capture logs for child processes

Peter Senna Tschudin (10):
      runner/kmemleak: Remove unnecessary lseek() calls
      man/lsgpu: Add man page for lsgpu
      tests/intel/intel_sysfs_debugfs Unify sysfs and debugfs testing
      tests/intel: Remove debugfs_test and xe_debugfs
      tests/intel/intel_sysfs_debugfs: Remove xe-gt
      lib/igt_facts: Remove NULL and bool comparisions
      lib/igt_facts: Remove unnecessary extern from header
      lib/igt_facts: Fix potential NULL pointer dereference
      lib/xe/xe_legacy: Move test_legacy_mode to lib/
      runner/settings: Fix while loop

Pranay Samala (2):
      tests/kms_vrr: Reclassify DRRS subtest under general display features
      tests/kms_plane_multiple: Add skip for not supported modifier

Pravalika Gurram (3):
      benchmarks/xe_create: Measure allocation time for objects
      benchmarks/xe_exec_ctx: Measure context overhead
      benchmarks/xe_blt: Add measure of BLT performance

Randhawa, Jagmeet (1):
      tests/intel/xe_vm: Fix typos and clarify ENOBUFS error

Riana Tauro (17):
      tests/intel/xe_pmu: move xe perf device to fixture
      tests/intel/xe_pmu: Add engine activity test for all functions
      tests/intel/xe_pmu: Add a test to validate engine activity on a function
      lib/igt_fs: Rename igt_io to igt_fs to add additional helpers
      lib/igt_fs: Add helper functions to create and remove directories
      tests/intel/xe_configfs: Add test to validate survivability mode
      tests/intel/xe_pmu: Add a helper function to check and end cork
      tests/intel/xe_pmu: Move descriptions of tests to the top of file
      tests/intel/xe_pmu: Add tests to validate engine activity with single engine active
      tests/intel/xe_pmu: Add tests to validate engine activity on all engines
      test/intel/xe_pmu: Add tests to validate engine activity by loading most engines
      tests/intel/xe_pmu: Validate engine activity on gt reset
      tests/intel/xe_pmu: Validate engine activity after suspend
      tests/intel/xe_pmu: Add tests to validate engine activity on render node
      tests/intel/xe_pmu: Add a test to validate engine activity after starting load
      tests/intel/xe_pmu: Add multi client engine activity test
      tests/intel/xe_pmu: Add gt id check while selecting engines

Ruili Ji (4):
      lib/amdgpu: implement vcn/jpeg queue tests
      test/amdgpu: to implement vcn/jpeg queue tests
      test/amdgpu: implement vcn queue tests
      test/amdgpu: implement jpeg queue tests

Ryszard Knop (1):
      gitlab-ci: Remove MIPS

Sai Teja Pottumuttu (3):
      tests/intel/xe_oa: Keep OA user buffer size dynamic
      lib/intel_batchbuffer: Refactor igt_get_render_copyfunc
      tests/intel/xe_oa: Add a new mmio triggered test

Santhosh Reddy Guddati (16):
      tests/intel/kms_joiner: Fix mode handling invalid joiner subtest
      tests/kms_async_flips: Split subtest to handle linear buffers separately
      tests/kms_async_flips: Use tiling modifiers
      tests/intel-ci: Block unsupported dirty rect test for i915
      tests/intel-ci: Block unsupported dirty rect test for i915
      tools/intel_hdcp: Introduce intel_hdcp tool
      lib/igt_panel: Skip hdcp tests on unsupported panels
      tests/kms_content_protection: Whitelist check for panel support
      lib/igt_panel: Validate vendor name in igt_is_panel_blocked
      tests/kms_content_protection: Skip empty vendor names in blocklist
      lib/igt_kms: Add support to retrieve async modifiers and formats
      tests/kms_async_flips: use in_formats_async for async modifiers
      tests/kms_async_flips: Add test for all async format modifiers
      tests/kms_async_flips: Remove allow_fail flag from async flip tests
      tests/kms_async_flips: Skip Async Flips with Linear Modifier
      tests/kms_async_flips: Fix mixed declaration warning

Sapna Singh (1):
      include/android: Add stub for glib

Satyanarayana K V P (8):
      tests/intel/xe_fault_injection: Make setup_injection_fault() programmable.
      tests/intel/xe_fault_injection: Inject errors in xe_guc_* calls
      tests/intel/xe_fault_injection: Return result from inject_fault_probe()
      tests/intel/xe_fault_injection: Suppress GuC CT dumps
      tests/intel/xe_fault_injection: Ignore more GuC errors in dmesg
      Revert "tests/intel/xe_fault_injection: Suppress GuC CT dumps"
      tests/intel/xe_fault_injection: Ignore all errors while injecting fault
      tests/intel/xe_fault_injection: Suppress GuC CT dumps during fault injection

Shekhar Chauhan (2):
      tests/kms_cursor_crc: Test async changes midframe
      lib/pciids: Sync pciid's with kernel commit 9b779ff

Shuicheng Lin (3):
      tests/intel/xe_vm: Fix assertion on the return value of mmap
      tests/intel/xe_vm: Fix assertions of batch buffer size
      tests/intel/xe_exec_compute_mode: Fix assertion of batch buffer size

Sk Anirban (5):
      tests/intel/xe_pmu: Fix frequency stashing issue
      tests/intel/xe_pmu: Account for potential RPe adjustments by GuC
      tests/intel/xe_pmu: Ensure consistent GPU frequency comparison
      tests/intel/pm_rc6_residency: Use sysfs to achieve peak frequency
      tests/intel/pm_rc6_residency: Ensure that SLPC is enabled for test rc6-idle

Sobin Thomas (1):
      tests/intel/xe_sysfs_scheduler: Add invalid string test for engine sysfs properties

Soham Purkait (2):
      lib/igt_device_scan: Add driver field to igt_device_card struct
      tools/intel_pm_rpm: Add support for xe in runtime pm

Sunil Khatri (27):
      drm-uapi/amdgpu: align with kernel commit adc218676eef
      lib/amdgpu: Add user mode queue support in ring context
      lib/amdgpu: Add support of amd user queues
      lib/amdgpu: add func amdgpu_bo_alloc_and_map_sync
      tests/amdgpu: Add user queue support for gfx and compute
      tests/amdgpu: Add UMQ submission tests for gfx and compute
      tests/amdgpu: Add amdgpu_sync_dependency_test with UMQ
      tests/amdgpu: use memory API's from amd_memory.h
      lib/amdgpu: add macro for adding cmds in user queue
      lib/amdgpu: use macro to add cmds in the user ring
      tests/amdgpu: Add amdgpu_cp_nops tests for UMQ
      lib/amdgpu: use right API to get the correct size
      lib/amdgpu: use a memory fence to serialize write
      tests/amdgpu: disable check for IP presense with no kernel queue
      lib/amdgpu: make the local functions as static
      lib/amdgpu: enable UMQ function under macro
      tests/amdgpu: Disable the UMQ tests under a macro
      tests/amdgpu: add missing user queue destroy for cs_nops
      drm-uapi/amdgpu: add UAPI query if user queues are supported
      lib/amdgpu: add func to read the userqueue support
      tests/amdgpu: execute userq tests only if userq support IP
      lib/amdgpu: make amdgpu userqueue file name at par with kernel names
      tests/amdgpu: disable unstable tests to avoid failure in CI
      lib/meson: Enable userqueues based on libdrm version
      tests/amdgpu: add environment variable to enable tests
      tests/amdgpu: disabled tests are skipped with skip message
      tests/amdgpu: use uniform names for umq tests

Sushma Venkatesh Reddy (2):
      xe/oa: Update scripts to support PTL
      xe/oa: Add oa-ptl.xml and guids.xml

Swati Sharma (8):
      tests/kms: Fix documentation
      tests/kms: Align test documentation
      lib/igt_core: Add igt_dynamic_subtest_name()
      lib/igt_frame: Use igt_dynamic_subtest_name()
      lib/igt_chamelium: Add chamelium_frame_match_or_dump_frame_pair()
      lib/igt_chamelium: Fix CRC calculation in compared_frames_dump()
      tests/chamelium/kms_chamelium_color: Fix ctm-limited-range subtest
      tests/intel-ci: Update xe blocklist

Tom Chung (2):
      tests/amdgpu/amd_hotplug: Check the suspend state after resume
      tests/amdgpu/amd_vrr_range: Fix test may fail on non-zero card index

Tomita Moeko (1):
      tools/intel_gtt: add support for gen10+ devices

Umesh Nerlige Ramappa (9):
      tests/intel/xe_oa: Print oa_status value in the helper
      tests/intel/xe_oa: Get stream status on read error
      tests/intel/xe_oa: Save and restore errno in get_stream_status
      tests/intel/xe_oa: Ignore other errors when looking for buffer overflow
      tests/intel/xe_drm_fdinfo: Use end_cork helper to end the spinner
      tests/intel/xe_drm_fdinfo: Drop TEST_TRAILING_IDLE
      tests/intel/xe_drm_fdinfo: Rename TEST_BUSY to TEST_WITH_LOAD
      tests/intel/xe_drm_fdinfo: Test utilization while load is active
      tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag

Ville Syrjälä (2):
      tests/kms_flip: Add flip-vs-dpms-on-nop subtest
      tests/intel/gem_exec_capture: Deal with DG1 recoverable vs. capture uapi changes

Vinay Belgaumkar (2):
      lib/xe_gt: Move get/set GT freq utils to lib
      tests/xe_pmu: Add frequency test

Vinod Govindapillai (2):
      Revert "tests/intel/kms_frontbuffer_tracking: update to FBC support check"
      lib/i915/fbc: update fbc support based on psr mode

Vitaly Prosyak (2):
      lib/amdgpu: fix potential issue with bitwise AND operation
      tests/amd_queue_reset: use the AMDGPU_RESET_TYPE_PER_QUEUE flag unconditionally

Zbigniew Kempczyński (29):
      lib/igt_core: reinitialize log_buffer_mutex in child process
      lib/intel_allocator: protect binding for multithreaded tests
      lib/intel_compute: add support for stoppable loop
      lib/intel_compute_square_kernels: use stoppable loop for LNL/BMG
      lib/intel_compute_square_kernel: add loop shader binary for PTL
      tests/xe_compute_preempt: adjust number of children according to ram size
      tests/xe_compute_preempt: consume all ram for wmtp
      lib/xe_spin: limit width/pitch for mem-copy
      tests/xe_render_copy: change width and pitch to be in valid range
      tests/xe_spin_batch: change width and pitch to be in valid range
      tests/xe_copy_basic: use non-zero pitch
      lib/intel_compute: move user-fence to allow async exec call
      lib/intel_compute: simplify compute-preempt subtests
      lib/intel_compute: calculate array size at compile time
      lib/intel_compute: refactor to remove code duplication
      lib/intel_cmds_info: rename M to TYPE in blt_memop_type
      lib/intel_blt: separate mem-copy and mem-set
      lib/intel_cmds_info: add blt_memop_mode (byte/page)
      lib/intel_blt: add emit batchbuffer end
      lib/intel_blt: use struct instead of inline coding
      tests/xe_copy_basic: replace size to rect which keeps objects geometry
      tests/xe_copy_basic: add testcase with large buffer size
      tests/xe_copy_basic: add subtest to verify mem-copy in pages
      lib/intel_blt: add support for matrix mem-copy
      tests/xe_copy_basic: add mem-copy matrix type subtests
      lib/intel_blt: add mem-copy debug facility
      lib/intel_compute: add alloc preference for objects used in compute
      tests/xe_compute_preempt: add compute preempt on vram bos
      lib/intel_compute: change shader and logic for threadgroup preemption

Zhanjun Dong (1):
      tests/intel/xe_fault_injection: Fix typo error tab

git tag: v2.1

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.1.tar.xz
MD5:  e6f66340b8f8d1bc45834757a599de4d  igt-gpu-tools-2.1.tar.xz
SHA1: 260747754af49bc79c207aa168c64c3f63815b20  igt-gpu-tools-2.1.tar.xz
SHA256: bf72beff71093db692f386c9359b557dfa8e8c45250439c952564b1b6fe343f8  igt-gpu-tools-2.1.tar.xz
SHA512: 401e9912044e2d37cc581cf01ba03b4d14c2e685e28c4764cb544c481291c6ec36cb90beaadb51537ba7cc8dc33d4aa7139dad91b4484ae0b718cbe19c1a987e  igt-gpu-tools-2.1.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.1.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEETPf8JI3Czo80u+SPwwTEoxBABekFAmhej1MACgkQwwTEoxBA
BelC1g//SiU2YA2ZN2GJA1o8Ywhk7cui3KjIsYNA/Np8ntkgcKzTQO+v663TH/IJ
ngeAZZ/qWInHH8SSDW2aUr8CS48E19YQQ29dvn2oXmHOQLh8V/YVtVxnmyL/rDlp
0ZZ4lrfTRndRlJ0j26M4U0gJdsav6GChMJja3Aw8LNv/O2BYcXOoehX11zcIg+f1
M+WhSlowHJD2u0iB1JlRONRWJuTwnhQft2RUqNE0vXipgw/+ptCakQIUuOedvRyF
/nzmhzJ4TTTZw51NSVCD0EY2/3Skkq+7HjypLvfsWpl63RGfjKDhgZmdUvoQV7lE
YIcRiCbkiC7nobNKPhDaH+W0d05md2ng4IhUAYtP9tOx1hDZ2Zjz3c+Hk7c8b2FU
h/TPuoGlUy65Z3Wn7Wi7KQLkO+QQR4ue2KKdEfLeI+fh2hh601Pk7y6Zo6ewxZ2b
SDgL7vZmiC6iTGYGlz7nDKkDKj0J6RgrfurAKWZqLA7ScBmPgwtyZ33G7VLrF+aR
72gj/E3hi1XaH8TOwRXS7nDz2D2JWwySSstvyW2Lawgr433CZGxDS5IIXLK51EMd
HGkOXUpgyZrxOYAjmIVtPjwiBfRnfXyLAKKLfNNPA9CP5s2k9w5/O29DNTdCYOOs
z4UAp4hj9kGf7VzthZ07w4O5UOE7grt2e6ZvbesV7nCN98VmCwc=
=UT5G
-----END PGP SIGNATURE-----
