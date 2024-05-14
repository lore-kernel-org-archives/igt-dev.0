Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D04C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 11:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DBB10E3D7;
	Tue, 14 May 2024 11:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqXEVgD1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAEA10E2BE;
 Tue, 14 May 2024 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715684403; x=1747220403;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=on45IgeWsW/mDYUN2kJ2Z9DmkR+X61PT6h8rrEmxHIA=;
 b=DqXEVgD1nYH4lix781MgkYejuB2IkKQ5xlC3vxD4gXHSPMGz9rpbti7R
 2vfJlpWDmNAKqL4FHbVEr8uRQIkmDR9oraX8kkQtZCtfwZzELoclftadb
 L9KtI19ov2vP0d9gZv/7hu6ViQCPH1Wr0iiPuNXd1LvtCH77CejHr0U2Q
 n7f+C/5Jh7PjzBQDr8o2DLoT6LAU7Sy1Sg1IUlSSqCPq3CGc4MXq7YNz3
 8yBg7s6CvgEmUjhwk4UoYRq2lmcQMuOHiq5CiKxeRAa1fjFc6c3ZhSSMN
 SqYk6ckGa6Vx/21MuvzkolbR8hut6JPvGYKYcMUkRG7TaULxakUqxQe/M g==;
X-CSE-ConnectionGUID: b1u6d3YnReGtM/Qioja9ng==
X-CSE-MsgGUID: 3i0Ec+deQtSyrMA+koT7lA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="29149352"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="29149352"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 04:00:03 -0700
X-CSE-ConnectionGUID: 7ZhZNriVTV2BfN5mXKDFpw==
X-CSE-MsgGUID: zZG19pVZRpq6Sf3ughKM3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="31191311"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 04:00:02 -0700
Date: Tue, 14 May 2024 12:59:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_fo?= =?utf-8?Q?r?=
 tests/kms_writeback: Set atomic and writeback_connector early
Message-ID: <20240514105957.ixzt65u55w6lslpx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240513230356.695515-1-alex.hung@amd.com>
 <171565372648.2097178.17948925377404583583@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171565372648.2097178.17948925377404583583@8e613ede5ea5>
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
On 2024-05-14 at 02:28:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_writeback: Set atomic and writeback_connector early
> URL   : https://patchwork.freedesktop.org/series/133574/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7850_full -> XEIGTPW_11138_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11138_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11138_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 1)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11138_full prevented too many machines from booting.
> 
>   Missing    (2): shard-adlp shard-lnl 

test kms_writeback cannot do that, no need for respin
as it is already merged.

Regards,
Kamil

> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11138_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
>     - shard-dg2-set2:     [PASS][1] -> [SKIP][2] ([Intel XE#1201]) +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1124] / [Intel XE#1201])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-463/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#787]) +67 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][7] ([Intel XE#616]) +3 other tests fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +20 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][10] ([Intel XE#1178])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-434/igt@kms_content_protection@legacy@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_edge_walk@128x128-right-edge:
>     - shard-dg2-set2:     [PASS][11] -> [FAIL][12] ([Intel XE#581])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_cursor_edge_walk@128x128-right-edge.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_cursor_edge_walk@128x128-right-edge.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - shard-dg2-set2:     [PASS][15] -> [DMESG-WARN][16] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#776])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][18] ([Intel XE#361])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_psr@pr-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_psr@pr-dpms.html
> 
>   * igt@kms_rmfb@close-fd@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#294])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-434/igt@kms_rmfb@close-fd@pipe-b-dp-4.html
> 
>   * igt@kms_vrr@negative-basic@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][21] ([Intel XE#1195])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-435/igt@kms_vrr@negative-basic@pipe-a-dp-4.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][22] -> [TIMEOUT][23] ([Intel XE#1473] / [Intel XE#402])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#1192] / [Intel XE#1201])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][27] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][29] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][30] +7 other tests pass
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-a.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-a.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2-set2:     [SKIP][31] ([Intel XE#1201]) -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_dp_aux_dev.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-435/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-dg2-set2:     [INCOMPLETE][33] ([Intel XE#1195]) -> [PASS][34] +1 other test pass
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-433/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-dg2-set2:     [SKIP][35] ([Intel XE#1201] / [Intel XE#1226]) -> [PASS][36] +13 other tests pass
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][37] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [FAIL][39] ([Intel XE#771] / [Intel XE#899]) -> [PASS][40]
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][41] ([Intel XE#899]) -> [PASS][42]
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][43] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][45] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-rebind:
>     - shard-dg2-set2:     [FAIL][47] ([Intel XE#1256]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-rebind.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-rebind.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [TIMEOUT][49] ([Intel XE#1093] / [Intel XE#1206]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@xe_module_load@many-reload.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-435/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][51] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][52]
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-dg2-set2:     [DMESG-FAIL][53] ([Intel XE#1162] / [Intel XE#1548]) -> [DMESG-FAIL][54] ([Intel XE#1548])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][55] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][56] ([Intel XE#1124] / [Intel XE#1201])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][57] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][58] ([Intel XE#1201] / [Intel XE#829])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg2-set2:     [SKIP][59] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][60] ([Intel XE#1201] / [Intel XE#346])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][61] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][63] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][64] ([Intel XE#1201] / [Intel XE#829])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     [SKIP][65] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][66] ([Intel XE#1201] / [Intel XE#306])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_frames@dp-frame-dump:
>     - shard-dg2-set2:     [SKIP][67] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][68] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_chamelium_frames@dp-frame-dump.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-466/igt@kms_chamelium_frames@dp-frame-dump.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-dg2-set2:     [SKIP][69] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][70] ([Intel XE#1201] / [Intel XE#455])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_content_protection@content-type-change.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-set2:     [SKIP][71] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][72] ([Intel XE#1178])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_content_protection@legacy.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-434/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     [FAIL][73] ([Intel XE#1188]) -> [SKIP][74] ([Intel XE#1201] / [Intel XE#455])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_content_protection@uevent.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-464/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][75] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][77] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [INCOMPLETE][78] ([Intel XE#1195] / [Intel XE#910])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     [SKIP][79] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][80] ([Intel XE#1201])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][81] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][82] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][83] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][84] ([Intel XE#1201])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][85] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][86] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-dg2-set2:     [DMESG-FAIL][87] ([Intel XE#1162]) -> [FAIL][88] ([Intel XE#616]) +1 other test fail
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     [SKIP][89] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][90] ([Intel XE#1201] / [Intel XE#455])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-464/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201] / [Intel XE#1226]) -> [FAIL][92] ([Intel XE#361])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
>     - shard-dg2-set2:     [TIMEOUT][93] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][94] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [TIMEOUT][95] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][96] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_psr@fbc-pr-sprite-render:
>     - shard-dg2-set2:     [SKIP][97] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][98] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-render.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-render.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][100] ([Intel XE#1201] / [Intel XE#327])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-270.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-dg2-set2:     [SKIP][101] ([Intel XE#1201] / [Intel XE#455]) -> [INCOMPLETE][102] ([Intel XE#1195])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_vrr@negative-basic.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-435/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][103] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][104] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) +1 other test incomplete
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][105] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][106] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][107] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][108] ([Intel XE#1195] / [Intel XE#1473])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_evict@evict-threads-large.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/shard-dg2-466/igt@xe_evict@evict-threads-large.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1093
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
>   [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
>   [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7850 -> IGTPW_11138
>   * Linux: xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e -> xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5
> 
>   IGTPW_11138: 11138
>   IGT_7850: 7850
>   xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e: 3d00e04692d45ab076e9e493252361bb18373a0e
>   xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5: 5f823e6608065c42909c6a41adc7ff448cbfbfc5
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11138/index.html
