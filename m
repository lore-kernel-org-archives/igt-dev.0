Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ED91067042
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8288910EA35;
	Thu, 12 Mar 2026 15:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfMZw2Hk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667DE10EA35
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773328090; x=1804864090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tPBQMqYFZDWF4kIfSWC8iJkvkAbmviaCTQ1ZF6dIBQc=;
 b=cfMZw2HkgAaMr26BDphKhRHrbK/Pt225mFEkUpITKV3eNsWhbhVCGiCA
 RDiJ2Z/jiWkbWgsvCN9sB0T0scRy6xdLRFK+ZZt2Bafnx68EtIqMbvHTA
 2w9dAHNqujk4PAC/xbI4AFocxlMWfgrEop2jPhIATM6eel8ta1wPtNJl0
 NRECs/gFVVrf1NI6VYa9p3WBP9LtQsB1spQQ8e8KQakFrqdh0QBXGLCaI
 VAISdqz4r2yim0qGeWJNxuipr6X1CE9q19azw7KIQw9JvQMmnjgF8pbcL
 ozmENmdcm0hF9q/ygQlwnSktq4x4zb+Xh/IEr4F7nFjCvO2mmV3zw76qb g==;
X-CSE-ConnectionGUID: F4GHbfkgQdKnqlXrCrLlmg==
X-CSE-MsgGUID: 4ZHQTGUQRH+FsCaO+yolvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85508012"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85508012"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:08:10 -0700
X-CSE-ConnectionGUID: IhM9y3tOReylUdRkDOER4A==
X-CSE-MsgGUID: DvBMhanqT26sKniRsDbRRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225292137"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 08:08:08 -0700
Date: Thu, 12 Mar 2026 16:08:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v1 2/6] docs: add pages for API reference
 introduction
Message-ID: <20260312150805.vgala52lljvilky4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20260220150202.1013804-1-pawel.sikora@intel.com>
 <20260220150202.1013804-3-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220150202.1013804-3-pawel.sikora@intel.com>
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

Hi Pawel,
On 2026-02-20 at 16:01:56 +0100, Pawel Sikora wrote:
> Separate pages for an index, lib and tests.
> They will be used by mkdocs(cdoc) plugin,
> so do not include them in the navigation config
> directly in mkdocs.yml
> 
> Align docs/running_tests.md API reference URL.
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> ---
>  docs/api-intro.md     | 81 +++++++++++++++++++++++++++++++++++++++++++
>  docs/running_tests.md |  2 +-
>  docs/tests-intro.md   | 46 ++++++++++++++++++++++++
>  3 files changed, 128 insertions(+), 1 deletion(-)
>  create mode 100644 docs/api-intro.md
>  create mode 100644 docs/tests-intro.md
> 
> diff --git a/docs/api-intro.md b/docs/api-intro.md
> new file mode 100644
> index 000000000..133f16e9b
> --- /dev/null
> +++ b/docs/api-intro.md
> @@ -0,0 +1,81 @@
> +
> +## Welcome to the igt-gpu-tools API reference.
> +
> +The reference covers two areas:
> +
> +- **[Core Library](../api_reference/lib)** (`lib/`) — shared helpers for DRM testing, KMS,
> +  framebuffer management, debugfs, GPU-specific support, and more.
> +  These are the building blocks that all IGT tests rely on.
> +- **[Tests](../api_reference/tests)** (`tests/`) — the full test catalog with structured metadata,
> +  subtest listings, and "By Category" / "By Functionality" group pages.
> +
> +Each library module below links to its generated API page with function
> +signatures, parameter tables, and cross-referenced symbols. Use the A–Z
> +index on each overview page to jump directly to any symbol.
> +
> +---
> +
> +### Core / Xe API Reference

As discussed offline this should be:

### API Reference

> +
> +| Module | Source | Description |
> +|--------|--------|-------------|
> +| **DMABUF Sync File** | :file:`dmabuf_sync_file.c` | DMABUF importing/exporting fencing support library |
> +| **drmtest** | :file:`drmtest.c` | Base library for drm tests and tools |
> +| **ALSA** | :file:`igt_alsa.c` | Library with ALSA helpers |
> +| **Audio** | :file:`igt_audio.c` | Library for audio-related tests |
> +| **aux** | :file:`igt_aux.c` | Auxiliary libraries and support functions |
> +| **Chamelium** | :file:`igt_chamelium.c` | Library for using the Chamelium into igt tests |
> +| **Collection** | :file:`igt_collection.c` | Generic combinatorics library |
> +| **Core** | :file:`igt_core.c` | Core i-g-t testing support |
> +| **CRC** | :file:`igt_crc.c` | igt crc tables and calculation functions |
> +| **debugfs** | :file:`igt_debugfs.c` | Support code for debugfs features |
> +| **igt_device** | :file:`igt_device.c` | igt_device |
> +| **Device selection** | :file:`igt_device_scan.c` | Device scanning and selection |
> +| **Draw** | :file:`igt_draw.c` | drawing helpers for tests |
> +| **Dummyload** | :file:`igt_dummyload.c` | Library for submitting GPU workloads |
> +| **Framebuffer** | :file:`igt_fb.c` | Framebuffer handling and drawing library |
> +| **Frame** | :file:`igt_frame.c` | Library for frame-related tests |
> +| **fs** | :file:`igt_fs.c` | Helpers for file operations |
> +| **GT** | :file:`igt_gt.c` | GT support library |

Intel GT support library

> +| **Hook support** | :file:`igt_hook.c` | Support for running a hook script on test execution |
> +| **kmod** | :file:`igt_kmod.c` | Wrappers around libkmod for module loading/unloading |
> +| **KMS** | :file:`igt_kms.c` | Kernel modesetting support library |
> +| **IGT List** | :file:`igt_list.c` | a list implementation inspired by the kernel |
> +| **IGT Map** | :file:`igt_map.c` | a linear-reprobing hashmap implementation |
> +| **msm** | :file:`igt_msm.c` | msm support library |
> +| **pipe_crc** | :file:`igt_pipe_crc.c` | Pipe CRC support |
> +| **Power Management** | :file:`igt_power.c` | Power Management related helpers |
> +| **Primes** | :file:`igt_primes.c` | Prime numbers helper library |
> +| **Random** | :file:`igt_rand.c` | Random numbers helper library |
> +| **Stats** | :file:`igt_stats.c` | Tools for statistical analysis |
> +| **syncobj** | :file:`igt_syncobj.c` | Library with syncobj helpers |
> +| **sysfs** | :file:`igt_sysfs.c` | Support code for sysfs features |
> +| **VC4** | :file:`igt_vc4.c` | VC4 support library |
> +| **VGEM** | :file:`igt_vgem.c` | VGEM support library |
> +| **x86** | :file:`igt_x86.c` | x86 helper library |
> +| **Intel allocator** | :file:`intel_allocator.c` | igt implementation of allocator |
> +| **Batch Buffer** | :file:`intel_batchbuffer.c` | Batchbuffer and blitter support |

Same here, it is Intel specific and imho it should be noted
in description, like:

| **Batch Buffer** | :file:`intel_batchbuffer.c` | Intel batchbuffer and blitter support |

> +| **Buffer operations** | :file:`intel_bufops.c` | Buffer operation on tiled surfaces |

Same here.

> +| **Chipset** | :file:`intel_chipset.c` | Feature macros and chipset helpers |

Same here.

> +| **I/O** | :file:`intel_mmio.c` | Register access and sideband I/O library |

Same here.

> +| **ioctl wrappers** | :file:`ioctl_wrappers.c` | ioctl wrappers and related functions |
> +| **SW Sync** | :file:`sw_sync.c` | Software sync (fencing) support library |
> +
> +### i915 API Reference

Oe maybe move above into Intel specific lib section, similar to i915?

+cc Zbigniew

> +
> +| Module | Source | Description |
> +|--------|--------|-------------|
> +| **GEM Create** | :file:`gem.c` | Helpers for dealing with objects creation |
> +| **GEM Context** | :file:`gem_context.c` | Helpers for dealing with contexts |
> +| **GEM Engine Topology** | :file:`gem_engine_topology.c` | Helpers for dealing engine topology |
> +| **GEM Scheduler** | :file:`gem_scheduler.c` | Helpers for querying scheduler capabilities |
> +| **GEM Submission** | :file:`gem_submission.c` | Helpers for determining submission method |
> +| **Blitter library** | :file:`intel_blt.c` | i915/xe blitter library |
> +| **I915 GPU CRC** | :file:`i915_crc.c` | i915 gpu crc |
> +| **Intel Context Wrapper** | :file:`intel_ctx.c` | Wrapper structs for dealing with contexts |
> +
> +
> +---
> +
> +This documentation is auto-generated from C/C++ source comments using
> +[mkdocs-cdoc](https://github.com/pawelsikora/mkdocs-cdoc).
> diff --git a/docs/running_tests.md b/docs/running_tests.md
> index b0f22ca64..2fe97b559 100644
> --- a/docs/running_tests.md
> +++ b/docs/running_tests.md
> @@ -116,7 +116,7 @@ scripts/run-tests.sh -h
>  
>  Test results are saved as a JSON file.
>  
> -For the tests API reference please look at: [API Reference Documentation](api_reference/index.html)
> +For the tests API reference please look at: [API Reference Documentation](api_reference/)
>  
>  
>  ## :material-docker: Running via Container
> diff --git a/docs/tests-intro.md b/docs/tests-intro.md
> new file mode 100644
> index 000000000..fcfac9cfd
> --- /dev/null
> +++ b/docs/tests-intro.md
> @@ -0,0 +1,46 @@
> +## About the Test Catalog

s/Test/Tests/

> +
> +The `tests/` directory contains the full IGT test suite. Each `.c` file is a
> +standalone test binary that exercises a specific kernel subsystem or feature
> +through the DRM/KMS/GEM interfaces.
> +
> +### How tests are organized
> +
> +Every test file carries structured metadata in its doc comment — Category,
> +Mega feature, Sub-category, and per-subtest Functionality tags. These are
> +used to generate the **"By …"** group pages in the sidebar so you can browse
> +tests by topic rather than filename.
> +
> +### Quick links
> +
> +- **By Category** — top-level grouping (Core, Display, …)
> +- **By Mega Feature** — feature area (KMS, Memory Management, …)
> +- **By Sub Category** — finer grouping (GEM, Framebuffer, …)
> +- **By Functionality** — per-subtest capability tags
> +
> +### Writing a new test
> +
> +A minimal IGT test needs a `TEST:` doc comment block and at least one
> +`igt_subtest()` call:
> +
> +```c
> +/**
> + * TEST: my_new_test
> + * Category: Core
> + * Mega feature: GEM
> + * Description: Verify basic GEM object creation.
> + *
> + * SUBTEST: create-simple
> + * Description: Create a GEM object and check the handle.
> + */

imho add also ald-style global test description here.

Regards,
Kamil
> +
> +igt_main {
> +    igt_describe("Create a GEM object and check the handle.");
> +    igt_subtest("create-simple") {
> +        // ...
> +    }
> +}
> +```
> +
> +The subtest listing and metadata table below are generated automatically
> +from these comments and macro calls.
> -- 
> 2.51.0
> 
