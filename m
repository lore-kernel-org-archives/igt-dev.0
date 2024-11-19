Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62040D6C29A
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 20:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C0110E36E;
	Tue, 19 Nov 2024 20:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRkFVzXW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98CC10E364;
 Tue, 19 Nov 2024 20:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732049300; x=1763585300;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=stLH25FqA+dsiwYoc6PdiwrqKymlKWPOhY/LSI/LFo8=;
 b=MRkFVzXWHlBu8oCWe53DigLfjhj/ysc4UySscR1EOKOGrNirAtpOvU73
 DtIsuZgc97rQlskYl8fKWzuUdnV6sA2ZWciixvt/L0lRI1h+GwSIpifXS
 GErJDaOgBR8cKgtuCaxF2YZqNtdvst0lLZZkOiMOQ6ED5lEVGVuoYgsFQ
 reh3NZm685b98XlgizkMU0mn3eHnba0uvvrpRI8l2zkYKwH7fcft2ESb8
 18HRSAoxtXBVXpTX2wcpbjfiuFfgd4z6jATRVWKmdgHWps30M3Qig3hyG
 1Cq1rmIyFEaWMQW4Tb1pqVYSL4gegQUujzw//8Jromo6sTrd+NyIYMyga w==;
X-CSE-ConnectionGUID: MsrHCq6aRgOlv2vUsOZOPg==
X-CSE-MsgGUID: 9X6AZzfURdKDwAipzRmyGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31829744"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31829744"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 12:48:20 -0800
X-CSE-ConnectionGUID: EfgEHiX5QhKMSP2WMfKncw==
X-CSE-MsgGUID: lGL5yzKZRtG23Wiad7P1/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="90091242"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 12:48:18 -0800
Date: Tue, 19 Nov 2024 21:48:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests=2Fsyncob?=
 =?utf-8?Q?j=5Fwait=3A?= Update invalid-wait-zero-handles test (rev4)
Message-ID: <20241119204816.niwhfodznctkkkwm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241118124422.11868-1-krzysztof.niemiec@intel.com>
 <173202411961.328999.5851734361848435028@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173202411961.328999.5851734361848435028@b555e5b46a47>
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
On 2024-11-19 at 13:48:39 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/syncobj_wait: Update invalid-wait-zero-handles test (rev4)
> URL   : https://patchwork.freedesktop.org/series/140727/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8115_full -> XEIGTPW_12127_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12127_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12127_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12127_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@single-move@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][1] +2 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-dg2-433/igt@kms_cursor_legacy@single-move@pipe-d.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][2] +12 other tests dmesg-warn
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +74 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][5] +3 other tests dmesg-fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_plane@pixel-format:
>     - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-4/igt@kms_plane@pixel-format.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-4/igt@kms_plane@pixel-format.html
> 
>   * igt@kms_plane@pixel-format@pipe-a-plane-3:
>     - shard-bmg:          [PASS][8] -> [SKIP][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-4/igt@kms_plane@pixel-format@pipe-a-plane-3.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-4/igt@kms_plane@pixel-format@pipe-a-plane-3.html
> 
>   * igt@kms_vblank@query-forked-busy-hang:
>     - shard-bmg:          [PASS][10] -> [DMESG-FAIL][11] +5 other tests dmesg-fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-7/igt@kms_vblank@query-forked-busy-hang.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-8/igt@kms_vblank@query-forked-busy-hang.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] +7 other tests dmesg-warn
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s2idle-vm-bind-userptr:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][14] +1 other test dmesg-fail
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html
> 
>   * igt@xe_vm@large-binds-1073741824:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][15] +2 other tests dmesg-warn
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-dg2-433/igt@xe_vm@large-binds-1073741824.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][16] ([Intel XE#3442]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][18] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][19] +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_cursor_legacy@single-move:
>     - shard-dg2-set2:     [SKIP][20] ([Intel XE#2423] / [i915#2575]) -> [DMESG-FAIL][21]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-466/igt@kms_cursor_legacy@single-move.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-dg2-433/igt@kms_cursor_legacy@single-move.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [FAIL][22] ([Intel XE#2882]) -> [DMESG-FAIL][23]
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][24] ([Intel XE#3486]) -> [DMESG-WARN][25]
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          [FAIL][26] ([Intel XE#2333]) -> [DMESG-FAIL][27] +3 other tests dmesg-fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [FAIL][28] ([Intel XE#2333]) -> [INCOMPLETE][29]
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256:
>     - shard-bmg:          [DMESG-FAIL][30] ([Intel XE#3468]) -> [DMESG-FAIL][31]
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-7/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-3/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
>     - shard-bmg:          [DMESG-FAIL][32] ([Intel XE#3468]) -> [FAIL][33]
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-7/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-bmg-3/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg2-set2:     [SKIP][34] ([Intel XE#3309]) -> [SKIP][35]
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
>     - shard-dg2-set2:     [SKIP][36] ([Intel XE#1130]) -> [DMESG-WARN][37]
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-dg2-435/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
> 

Above are unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12127_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_getstats:
>     - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#2423]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-464/igt@core_getstats.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-dg2-466/igt@core_getstats.html
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-dg2-set2:     [PASS][40] -> [SKIP][41] ([Intel XE#1885])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-464/igt@core_hotunplug@hotunplug-rescan.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html
> 
...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8115 -> IGTPW_12127
>   * Linux: xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4 -> xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
> 
>   IGTPW_12127: 12127
>   IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4: 6abefc8e3bf638090d5277bc3e6fd02bb25579a4
>   xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/index.html
