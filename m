Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC32C25B79
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB14B10E0C3;
	Fri, 24 May 2024 08:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MK3iDJ9v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D336510E3DA;
 Fri, 24 May 2024 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716539340; x=1748075340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GhBFAywAfxNnM6Ot9yAlCP01agifRqp+wjjRodHCiVk=;
 b=MK3iDJ9vL6E9J203m9F09wEMREAoMPKZtEnN9lGPqhdEpFa0ysWau+Fx
 TAg7u8ianqCG890MseuLQYckF81GIc6PEJY3QgZzIAa8bftmHX+PQ23RY
 PdRxXgc+PKWeKv+Tu3A2IsByInfS//ba9lM4lcpgT7kqWu3uTk+MN4J0P
 jNt+BC1cSBeuRMHkw2InjnT0UkRwgiRDU97nbBInkoaw2Jzp5DSSPJ7M2
 lZXRsZBLhUzlJRGwW820tkfNLNLjxJLkmLBgTZljP6Uo3Fc1psL0srqyj
 Ye7voNXaZzPLpwQYM/29PE5h9HA6ss5PDX+49oU4IKpdzW0WXND7sQNJj A==;
X-CSE-ConnectionGUID: DU8jGYbAT5Gu1ixpV31j5w==
X-CSE-MsgGUID: 7SU5HFa/RUe2GAt8eFnRxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="38291158"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="38291158"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:28:59 -0700
X-CSE-ConnectionGUID: W9ZCAC1FRkWNSwfKNPkg6A==
X-CSE-MsgGUID: bDpcaowXTH2UCC+/HktZpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="33937157"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 01:28:58 -0700
Date: Fri, 24 May 2024 10:28:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 Introduce SR-IOV VM-level testing tool
Message-ID: <20240524082855.zml5vlqizq6g2fcx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240523075156.181339-1-adam.miszczak@linux.intel.com>
 <171646054426.2169849.18174156031456999965@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171646054426.2169849.18174156031456999965@8e613ede5ea5>
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
On 2024-05-23 at 10:35:44 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Introduce SR-IOV VM-level testing tool
> URL   : https://patchwork.freedesktop.org/series/133950/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7869_full -> XEIGTPW_11180_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11180_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11180_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 2)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11180_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_sequence@queue-idle:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][1] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-dg2-435/igt@kms_sequence@queue-idle.html
> 
>   * igt@xe_vm@mmap-style-bind-one-partial:
>     - shard-dg2-set2:     [PASS][2] -> [ABORT][3] +4 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/shard-dg2-463/igt@xe_vm@mmap-style-bind-one-partial.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-dg2-434/igt@xe_vm@mmap-style-bind-one-partial.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_cursor_crc@cursor-random-256x256:
>     - shard-dg2-set2:     [DMESG-WARN][4] ([Intel XE#1214] / [Intel XE#282]) -> [ABORT][5] +1 other test abort
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/shard-dg2-463/igt@kms_cursor_crc@cursor-random-256x256.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-dg2-435/igt@kms_cursor_crc@cursor-random-256x256.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     [SKIP][6] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [ABORT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][8] ([Intel XE#1201] / [Intel XE#305]) -> [ABORT][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][10] ([Intel XE#1201]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
> 

Unrelated.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - {shard-lnl}:        [SKIP][12] ([Intel XE#373]) -> [ABORT][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/shard-lnl-2/igt@kms_chamelium_hpd@dp-hpd-fast.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>     - {shard-lnl}:        [PASS][14] -> [ABORT][15] +6 other tests abort
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
>     - {shard-lnl}:        [SKIP][16] ([Intel XE#656]) -> [INCOMPLETE][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>     - {shard-lnl}:        [SKIP][18] ([Intel XE#498]) -> [INCOMPLETE][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][20]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>     - {shard-lnl}:        NOTRUN -> [SKIP][21] +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/shard-lnl-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11180_full that come from known issues:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7869 -> IGTPW_11180
>   * Linux: xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921 -> xe-1333-7643e429e72c546f3779339624df885f6160124c
> 
>   IGTPW_11180: 5602d6276b10863242185b3d09f410b9f3d68301 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921: 42b9a14c5932c577019bf2f5d5ff25d208c1f921
>   xe-1333-7643e429e72c546f3779339624df885f6160124c: 7643e429e72c546f3779339624df885f6160124c
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11180/index.html
