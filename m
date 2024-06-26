Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C7BC30653
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 11:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F331010E857;
	Wed, 26 Jun 2024 11:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FO9p2JQ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0ED10E841;
 Wed, 26 Jun 2024 11:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719401298; x=1750937298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=79sL0vH5z6UllkjNVNR4k9GAyNrA6I+4W9PbJ03dDN8=;
 b=FO9p2JQ2UXMAxPcIQaV+dsU43hR5NHsXcdNJmdu3Urxz+peo9OcC6wcA
 ptm9asNIpInn1fjtaa7cKlVqbqA2JguHynpBq9JLs60blqsOeBNOk9+bX
 4FKfYBNpWUkZyBuOg/Lsv+IYECijA55UP/UlgaqPic5mwr6tP9H7vuxzl
 s+napzI/JmTOETzrsBb1YoSPxVhaJW09JHqRK0IB9WtrkHBaVzNzFcX+l
 ZgmhjORqGWr7iUMzd5GeWbUFlCCVzo+TfKDIVcOQZkFLibLjbLR2wgwgq
 NDV3+uLrkLP0HoF3Ssv1j0S/++oJJ6zTGiQBpusYvicFDS2qDbmSFzyZQ g==;
X-CSE-ConnectionGUID: exeSvXr+RC2wE+31Psia0g==
X-CSE-MsgGUID: GyD8PY3mTm+qy7pYRyuWTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16150343"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16150343"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:28:17 -0700
X-CSE-ConnectionGUID: zAyLtchvSzSgIEe1HDcaJw==
X-CSE-MsgGUID: xa80RHOOTDmxB3O0r3oYnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="81510993"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:28:16 -0700
Date: Wed, 26 Jun 2024 13:28:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 lib/intel_blt: Fix printing mocs on Xe2+
Message-ID: <20240626112813.6chzkpml354xsuco@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240625091847.134707-1-zbigniew.kempczynski@intel.com>
 <171932308832.153309.18128279098165631358@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171932308832.153309.18128279098165631358@a6498e030952>
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
On 2024-06-25 at 13:44:48 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_blt: Fix printing mocs on Xe2+
> URL   : https://patchwork.freedesktop.org/series/135344/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7898_full -> XEIGTPW_11311_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11311_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11311_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11311_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7898/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html

Unrelated,

Regards,
Kamil

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - {shard-lnl}:        [SKIP][3] ([Intel XE#352]) -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7898/shard-lnl-2/igt@kms_force_connector_basic@force-connector-state.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11311_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#316])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1124] / [Intel XE#1201])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#367])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#1252])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#306])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#307])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#308])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-b:
>     - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7898/shard-dg2-436/igt@kms_cursor_legacy@torture-bo@pipe-b.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-b.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1195] / [Intel XE#2049])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7898/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#658])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#653])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#653])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#1489])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-pr-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#929])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-432/igt@kms_psr@fbc-pr-suspend.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#756])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1123])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1126] / [Intel XE#1201])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][28] ([Intel XE#1473] / [Intel XE#392])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][29] -> [TIMEOUT][30] ([Intel XE#1473])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7898/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][31] -> [TIMEOUT][32] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7898/shard-dg2-433/igt@xe_evict@evict-threads-large.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-463/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][33] -> [DMESG-WARN][34] ([Intel XE#1214]) +3 other tests dmesg-warn
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7898/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#288])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#288])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [PASS][37] -> [TIMEOUT][38] ([Intel XE#2105])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7898/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#255])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1195] / [Intel XE#1358])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7898/shard-dg2-434/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-464/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [PASS][42] -> [DMESG-WARN][43] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7898/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     [PASS][44] -> [DMESG-WARN][45] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7898/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#944])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   
> #### Possible fixes ####
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7898 -> IGTPW_11311
>   * Linux: xe-1522-31d8e23bbf793469d597f3a17888fa55fffe7195 -> xe-1524-5e45785f315938951d86af616d35a5ba08bfeabc
> 
>   IGTPW_11311: 11311
>   IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1522-31d8e23bbf793469d597f3a17888fa55fffe7195: 31d8e23bbf793469d597f3a17888fa55fffe7195
>   xe-1524-5e45785f315938951d86af616d35a5ba08bfeabc: 5e45785f315938951d86af616d35a5ba08bfeabc
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11311/index.html
