Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B162C27C79
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 13:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E3B10E55B;
	Fri, 14 Jun 2024 13:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/6YzEXU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7931610E55B;
 Fri, 14 Jun 2024 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718371657; x=1749907657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SYTnkBAn08WqL/hAAMaxKjCYb6jA2SUTPouac/J1vh8=;
 b=m/6YzEXUOsD0FkJuTocvUD0zHHh707sgrmqjXRlehFcRt+PN7Mi7OztP
 sgTcABuTB+CBdNfKFcj0h5RIk/93yA2B3lorWOE+I3avF4gxv1EcoFHqo
 1UZQUaOKbWlu/0EuXbYQxip5sK3Z09z2EaY6uKlRid9ttBEF6+PVSMVHM
 lVHbAzxZlp6vQQLTQljXnLie9l+x5g2Pn+tqPqDKLkXr6ksVJO2Mxk8Q3
 nHfRTHsvBJHZDZbB8kfmU9gDezUri8oxW2H7Hkghn3meqhyTbdIxrWtGM
 tCqcWMwQEBEoaIYldFjgb7dGgpD90+MBvSdIeiD6XwSbuIuPFKAAl4AhS w==;
X-CSE-ConnectionGUID: 5DvVwSKnRiaAigCTje/j9Q==
X-CSE-MsgGUID: SvmTFZswTXC5XhA5Q9o+QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15380718"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="15380718"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 06:27:36 -0700
X-CSE-ConnectionGUID: lXwxIHSASredzIrbf70zKA==
X-CSE-MsgGUID: VfKxSI0BQDeBHwGWiUZ3wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="41005718"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:27:35 -0700
Date: Fri, 14 Jun 2024 15:27:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLnhlQkFU?= =?utf-8?Q?=3A?= failure for
 lib/gpgpu: add shader support (rev7)
Message-ID: <20240614132731.vizhnvphj22kyek5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
References: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
 <171818753213.68617.8043397927356476587@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171818753213.68617.8043397927356476587@a6498e030952>
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

Hi igt-dev,
On 2024-06-12 at 10:18:52 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/gpgpu: add shader support (rev7)
> URL   : https://patchwork.freedesktop.org/series/133020/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7882_BAT -> XEIGTPW_11252_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11252_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11252_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 1)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11252_BAT prevented too many machines from booting.
> 
>   Additional (1): bat-pvc-2 
>   Missing    (4): bat-atsm-2 bat-dg2-oem2 bat-lnl-1 bat-adlp-7 

This is unlikly.

> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11252_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - bat-pvc-2:          NOTRUN -> [SKIP][1] ([i915#6077]) +30 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 

imho PVC has no display so all kms tests should be blocklisted
for this particular GPU. Adding Bhanu and Jari to cc.

Regards,
Kamil

>   * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>     - bat-pvc-2:          NOTRUN -> [SKIP][2] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#1024] / [Intel XE#784])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - bat-pvc-2:          NOTRUN -> [SKIP][4] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#540]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-pvc-2:          NOTRUN -> [SKIP][6] ([Intel XE#1024] / [Intel XE#783])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-pvc-2:          NOTRUN -> [SKIP][7] ([Intel XE#829]) +6 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_prop_blob@basic:
>     - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#780])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_prop_blob@basic.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-pvc-2:          NOTRUN -> [SKIP][9] ([Intel XE#1024]) +2 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@xe_evict@evict-beng-small-external:
>     - bat-pvc-2:          NOTRUN -> [FAIL][10] ([Intel XE#1000]) +3 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][11] ([Intel XE#482]) +3 other tests dmesg-fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_gt_freq@freq_range_idle:
>     - bat-pvc-2:          NOTRUN -> [SKIP][12] ([Intel XE#1021]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#255])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_intel_bb@render:
>     - bat-pvc-2:          NOTRUN -> [SKIP][14] ([Intel XE#532])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_intel_bb@render.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - bat-pvc-2:          NOTRUN -> [SKIP][15] ([Intel XE#977]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc@render:
>     - bat-pvc-2:          NOTRUN -> [SKIP][16] ([Intel XE#976])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - bat-pvc-2:          NOTRUN -> [SKIP][17] ([Intel XE#979])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm_residency@gt-c6-on-idle:
>     - bat-pvc-2:          NOTRUN -> [SKIP][18] ([Intel XE#531])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html
> 
>   
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
>   [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>   [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
>   [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
>   [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
>   [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
>   [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
>   [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
>   [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
>   [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7882 -> IGTPW_11252
>   * Linux: xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3 -> xe-1447-86b413568d7dbde6078f6c40341f5ae1ae63c552
> 
>   IGTPW_11252: 11252
>   IGT_7882: 257418cba11c724111fe0e983649763c407e5bc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3: 950ce28fe0b31a24c5bddcc337aba9554a41cbb3
>   xe-1447-86b413568d7dbde6078f6c40341f5ae1ae63c552: 86b413568d7dbde6078f6c40341f5ae1ae63c552
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/index.html
