Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A166CAC5A7
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 14:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C70110E951;
	Thu, 25 Sep 2025 14:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JrHaI61h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1324A10E951
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758809781; x=1790345781;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vuCHI454Oy+LTMu3zUVMnToWqRzu3guLEQesmdy78tE=;
 b=JrHaI61hd3ntdbqDBdpeDe9DkQqY077a69ufKqkH6LKoZBAG+76abBEI
 9Yuz48F3VovEVDWTt67tvvVc9Y7BSJu5vBbqtkkBfHwzvrDeK4VNWKJ8I
 IJbqwg6GGpITw8YND5jfi0rliHjLeUiCNLUZrm5y/s0phLVE9Yb2h2X4K
 Phzy2yGPD5+lPmQF/rqR5AFXhKhAYHPS3vZiaLXIIOnhdIdD5KpiJzECT
 PkFZPyjhvmbyQuSb6kLJiqyngj43AYF0H/x3XOepifgrxgMBDrINI2nuJ
 erRcV3R1FuqCo0KSQZ4oVZLrdfXLOu+elhDqT5mfG4LBh3TYsGPLl7OrO Q==;
X-CSE-ConnectionGUID: 87ez2CFNSbiOfKoOpfNWsw==
X-CSE-MsgGUID: LOpLKoz0QuSYJM7X6qeJkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72555756"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="72555756"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:16:21 -0700
X-CSE-ConnectionGUID: cgvuLLRmSQCkL3oaUMiQKw==
X-CSE-MsgGUID: 2yV73M1KRqGhr+sD4WnG+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="182501998"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 07:16:19 -0700
Date: Thu, 25 Sep 2025 16:16:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: aditya.chauhan@intel.com
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com, jari.tahvanainen@intel.com,
 karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t] tests/intel-ci : Add PTL blocklists and GPU
 excluded platform definition
Message-ID: <20250925141616.q76o64v4n2dznhqd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 aditya.chauhan@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 jari.tahvanainen@intel.com, karthik.b.s@intel.com
References: <20250925105649.1683512-1-aditya.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250925105649.1683512-1-aditya.chauhan@intel.com>
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

Hi Aditya,
On 2025-09-25 at 16:26:49 +0530, aditya.chauhan@intel.com wrote:
> From: Aditya Chauhan <aditya.chauhan@intel.com>
> 
> Add PTL blocklists for both core and display as well as update GPU excluded
> definitions so that the blocklists can be used to generate platform
> testlists
> 
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/meson.build                  |   2 +
>  tests/intel-ci/xe.ptl.core.blocklist.txt    |  76 +++++++++
>  tests/intel-ci/xe.ptl.display.blocklist.txt | 170 ++++++++++++++++++++
>  tests/intel/kms_test_config.json            |   3 +-
>  tests/intel/xe_test_config.json             |   1 +
>  5 files changed, 251 insertions(+), 1 deletion(-)
>  create mode 100644 tests/intel-ci/xe.ptl.core.blocklist.txt
>  create mode 100644 tests/intel-ci/xe.ptl.display.blocklist.txt
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 7f46cb17e..ca50e93aa 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -21,6 +21,8 @@ intelci_files = [
>    'xe.lnl.core.blocklist.txt',
>    'xe.lnl.display.blocklist.txt',
>    'xe.lnl.eudebug.blocklist.txt',
> +  'xe.ptl.core.blocklist.txt',
> +  'xe.ptl.display.blocklist.txt',
>    'xe-fast-feedback.testlist',
>    'xe-fast-feedback-chamelium-only.testlist',
>    'xe-sriov-vf.blocklist.txt',
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
> new file mode 100644
> index 000000000..3ca03a89d
> --- /dev/null
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -0,0 +1,76 @@
> +##################################################################
> +# KMS - Display related tests
> +# Other Display specific tests
> +##################################################################
> +igt@.*kms.*
> +igt@testdisplay
> +igt@xe_pat@display-vs-wb-transient
> +igt@fbdev@.*
> +##################################################################
> +# Expected skip as iGPU has no vram
> +##################################################################
> +igt@xe_mmap@vram$
> +igt@xe_mmap@small-bar
> +igt@xe_sysfs_tile@physical_vram_size_bytes
> +igt@xe_noexec_ping_pong
> +igt@xe_create@create-big-vram
> +igt@xe_pm@d3hot-mmap-vram
> +igt@xe_compute_preempt@.*vram.*
> +igt@xe_vm@out-of-memory
> +igt@xe_evict.*
> +##################################################################
> +# No d3cold support for HW as of now
> +##################################################################
> +igt@xe_pm@.*d3cold.*
> +##################################################################
> +# Expected skip, S3 is not supported on HW as of now
> +##################################################################
> +igt@xe_gt_freq@freq_suspend
> +igt@xe_pm@s3.*
> +igt@xe_pm_residency@cpg-basic
> +##################################################################
> +# Expected skips as the tests are only expected to run on older
> +# platforms
> +##################################################################
> +igt@xe_pat@pat-index-xe3p-xpc
> +igt@xe_pat@pat-index-xehpc
> +igt@xe_pat@pat-index-xelp
> +igt@xe_pat@pat-index-xelpg
> +igt@xe_media_fill@media-fill
> +igt@xe_compute@ccs-mode-basic
> +igt@xe_configfs@survivability-mode
> +##################################################################
> +# Features not supported for integrated platforms
> +##################################################################
> +igt@intel_hwmon@.*
> +igt@.*@.*multigpu.*
> +igt@xe_peer2peer@.*
> +igt@xe_mmap@pci-membarrier.*
> +igt@xe_pm@d3hot-i2c
> +##################################################################
> +# Expected skip for the platform as the tests need more than
> +# one CCS engine
> +##################################################################
> +igt@xe_compute@ccs-mode-basic
> +igt@xe_compute@ccs-mode-compute-kernel
> +##################################################################
> +# Expected skips as the tests are not supported on PTL
> +##################################################################
> +igt@xe_access_counter@.*
> +igt@xe_oa@oa-tlb-invalidate
> +igt@xe_oa@unprivileged-single-ctx-counters
> +##################################################################
> +# Not Supported for the platform as GSC firmware is not
> +# loading and GSC engine is also disabled
> +##################################################################
> +igt@xe_pm_residency@gt-c6-freeze
> +igt@xe_pm_residency@toggle-gt-c6
> +##################################################################
> +# Expected skip as PXP is not enabled for PTL upstream
> +##################################################################
> +igt@xe_pxp@.*
> +##################################################################
> +# System allocator feature is not POR for PTL
> +##################################################################
> +igt@xe_exec_system_allocator@.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> new file mode 100644
> index 000000000..5802c57c5
> --- /dev/null
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -0,0 +1,170 @@
> +##############################################################################
> +# non-KMS tests
> +##############################################################################
> +igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
> +##############################################################################
> +# Valid skip :- HDMI not enabled in VBT
> +##############################################################################
> +igt@kms_force_connector_basic@force-connector-state
> +igt@kms_force_connector_basic@force-edid
> +igt@kms_force_connector_basic@prune-stale-modes
> +igt@kms_hdmi_inject@inject-audio
> +igt@kms_hdmi_inject@inject-4k
> +igt@kms_3d
> +##############################################################################
> +# Valid skip: Y and Yf-Tiling not supported
> +##############################################################################
> +igt@kms_(big_fb|ccs|rotation_crc)@.*(y|yf)-tiled.*
> +igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
> +igt@kms_flip_scaled_crc@.*(yf|y)tile.*
> +igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> +igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
> +##############################################################################
> +# Valid skip: Test skip due to hybrid config requirement
> +##############################################################################
> +igt@kms_addfb_basic@invalid-smem-bo-on-discrete
> +##############################################################################
> +# Valid skip: 90/270 rotation not supported
> +##############################################################################
> +igt@kms_big_fb@.*rotate-(90|270)
> +igt@kms_rotation_crc@.*rotation-(90|270).*
> +igt@kms_rotation_crc@bad-(pixel-format|tiling)
> +##############################################################################
> +# Valid skip: Mutable zpos not supported
> +##############################################################################
> +igt@kms_atomic@plane-primary-overlay-mutable-zpos
> +##############################################################################
> +# Valid skip: Cursor size = 32 and Cursor size > 256
> +# are not supported
> +##############################################################################
> +igt@kms_cursor_crc@.*-max-size
> +igt@kms_cursor_crc@.*-(32x10|32x32|512x).*
> +igt@kms_cursor_crc@cursor.*(21|42|85)
> +##############################################################################
> +# Valid skip: !cursor_slowpath(&display, i)
> +##############################################################################
> +igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
> +##############################################################################
> +# Valid skip: Use of a single CRTC for two connectors
> +##############################################################################
> +igt@kms_setmode@basic-clone-single-crtc
> +##############################################################################
> +# Valid skip: Connector uses CRTC that is incompatible
> +# with the connector
> +##############################################################################
> +igt@kms_setmode@invalid-clone-exclusive-crtc
> +##############################################################################
> +# Valid skip: Requires TV connector
> +##############################################################################
> +igt@kms_tv_load_detect@load-detect
> +##############################################################################
> +# Valid skip: Feature not enabled
> +##############################################################################
> +igt@kms_writeback@.*
> +##############################################################################
> +# Valid skip: Scaling mode none not supported
> +##############################################################################
> +igt@kms_scaling_modes@scaling-mode-none
> +##############################################################################
> +# Valid skip: DG2 & MTL specific
> +##############################################################################
> +igt@kms_ccs@.*-dg2-.*
> +igt@kms_ccs@.*-mtl-.*
> +igt@kms_flip_scaled_crc@.*dg2rcccs.*
> +##############################################################################
> +# Valid skip: Valid for display ver < 13
> +##############################################################################
> +igt@kms_psr2_su@.*
> +##############################################################################
> +# Valid skip: Downscaling factor not supported
> +##############################################################################
> +igt@kms_plane_scaling@.*downscale-factor-0-25.*
> +##############################################################################
> +# Valid skip: Downscaling not supported on second plane MTLP+
> +##############################################################################
> +igt@kms_plane_scaling@planes-downscale-factor-0-(5|75)$
> +igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
> +##############################################################################
> +# Valid skip: Simulation specific
> +##############################################################################
> +igt@kms_pm_dc@dc3co-vpb-simulation
> +##############################################################################
> +# Feature Currently not supported
> +##############################################################################
> +igt@kms_pm_power_saving@.*
> +##############################################################################
> +# Mei interface not supported for PTL
> +##############################################################################
> +igt@kms_content_protection@mei-interface
> +##############################################################################
> +# Expected skips
> +##############################################################################
> +igt@kms_getfb@.*ccs
> +##############################################################################
> +# VGA subtests on chamelium are expected skips for PTL
> +##############################################################################
> +igt@kms_chamelium.*@.*(vga).*
> +##############################################################################
> +# Tiled display config not enabled
> +##############################################################################
> +igt@kms_tiled_display@.*
> +##############################################################################
> +# Config not enabled on CI
> +##############################################################################
> +igt@kms_content_protection@.*(type1|type-1|type-change).*
> +##############################################################################
> +# Simulation specific test
> +##############################################################################
> +igt@kms_simulation_hpd@sim-hpd
> +##############################################################################
> +# Use either of connected/non-connected kms_bw
> +##############################################################################
> +igt@kms_bw@linear-tiling-.*-display.*
> +##############################################################################
> +# Expected skip for graphics ver >= 20
> +##############################################################################
> +igt@kms_getfb@getfb2-accept-ccs
> +##############################################################################
> +# BMG modifiers are valid skips for PTL
> +##############################################################################
> +igt@kms_ccs@.*4-tiled-bmg-ccs
> +##############################################################################
> +# Expected fail on current CI config
> +##############################################################################
> +igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
> +igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> +##############################################################################
> +# Expected skip on PTL
> +##############################################################################
> +igt@kms_big_fb@linear-max-hw-stride.*hflip
> +##############################################################################
> +# Horizontal flip is not supported with tile4 surface formats
> +##############################################################################
> +igt@kms_big_fb@4-tiled.*hflip.*
> +igt@kms_rotation_crc@primary-4-tiled-reflect-x.*
> +##############################################################################
> +# X tile defeatured on PTL
> +##############################################################################
> +igt@kms_(plane_lowres|plane_multiple|rotation_crc|big_fb|flip_scaled_crc)@.*(x-tile|xtile|tiling-x).*
> +igt@kms_pipe_stress@stress-xrgb8888-xtiled
> +##############################################################################
> +# Not supported by current CI configs
> +##############################################################################
> +igt@kms_bw@.*4-displays.*
> +##############################################################################
> +# Expected skip on PTL, FBC + PSR is unsupported
> +##############################################################################
> +igt@kms_front_buffer_tracking@fbcpsr-.*
> +igt@kms_psr@fbc-(psr|psr2|pr)-.*
> +igt@kms_psr2_sf@fbc-(psr2|pr)-.*
> +igt@kms_front_buffer_tracking@plane-fbc-rte
> +##############################################################################
> +# Expected skip on PTL, UJ not supported
> +##############################################################################
> +igt@kms_joiner@.*ultra-joiner.*
> +##############################################################################
> +# Deep-pkgc IGT not applicable
> +##############################################################################
> +igt@kms_pm_dc@deep-pkgc
> +##############################################################################
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 4fab26275..02fb32534 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -60,7 +60,8 @@
>  		    "include": [
>  			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
>  			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
> -			{ "LNL, BMG": "../intel-ci/xe.blocklist.txt" },
> +			{ "PTL": "../intel-ci/xe.ptl.display.blocklist.txt" },
> +			{ "LNL, BMG, PTL": "../intel-ci/xe.blocklist.txt" },
>  			{ "ADLP, ADLS, DG2, MTL": "../intel-ci/i915.blocklist.txt" }
>  		    ]
>  		}
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index a754ccda8..df7e6dcf0 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -79,6 +79,7 @@
>  		    "include": [
>  			{ "LNL": "../intel-ci/xe.lnl.core.blocklist.txt" },
>  			{ "BMG": "../intel-ci/xe.bmg.core.blocklist.txt" },
> +			{ "PTL": "../intel-ci/xe.ptl.core.blocklist.txt" },
>  			{ "all": "../intel-ci/xe.blocklist.txt" }
>  		    ]
>  		}
> -- 
> 2.34.1
> 
