Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1242C021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 10:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D0D10E26D;
	Thu, 27 Feb 2025 10:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ct4OG7Yb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075AA10E26D;
 Thu, 27 Feb 2025 10:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740653970; x=1772189970;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2NE6/PYeO/h5nZjD3358SQHJkqYUsBzMVt1i18XCtDY=;
 b=Ct4OG7YbBHpgZerlo38GWc32X3hwCevXfG5xAUZ9R8XfNPINR8KWwk/1
 8k8+AGExOL9PN5vPHkCADbjSQWjT9Pe0n3KB8nDmTdaTgLQ2XfxKs6bgo
 Q0GyZNuH5jlkTT3gh9cJ6FHUgqqfEvmMav4crwRCIFex2jtoxTpqZ6Gti
 sAzsiuap7SKpnjOPV6HekuiwhIFvFdefajjkP1GY5WmVyszyKI2ynJ2Cu
 MPkruB3Wjd0jYWWDnQoGnSSo6I0PDmd2P6GPIm7kdyTb34M7UHkWy+IeA
 OetIe7li9x0Op/5wTsBbpfggFieET9Kry5jresWNVk+Mgxy9kOW6SvZE4 A==;
X-CSE-ConnectionGUID: nSP7wInmRJKJfFWgqNLNZQ==
X-CSE-MsgGUID: 7mnvMxTbSlqqdytIGIqCxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45316657"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="45316657"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 02:59:24 -0800
X-CSE-ConnectionGUID: mq7zxCizTGaUr/3tq1GPnQ==
X-CSE-MsgGUID: sQ1ojRm4S0yJKwSGtLDwnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117482361"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 02:59:22 -0800
Date: Thu, 27 Feb 2025 11:59:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_star?=
 =?utf-8?Q?ting_wit?= =?utf-8?Q?h?= [i-g-t,1/2] lib/syncobj: Make running
 under Valgrind quiet
Message-ID: <20250227105920.uz2wojlvfvnn6ksa@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250225124454.1976-1-tvrtko.ursulin@igalia.com>
 <174064372684.2625663.9658880946357231727@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174064372684.2625663.9658880946357231727@b555e5b46a47>
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
On 2025-02-27 at 08:08:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] lib/syncobj: Make running under Valgrind quiet
> URL   : https://patchwork.freedesktop.org/series/145403/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8249_full -> XEIGTPW_12665_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12665_full absolutely need to be
>   verified manually.

Unrelated,

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12665_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12665_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12665/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][2] +3 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12665/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_plane_multiple@tiling-4:
>     - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8249/shard-dg2-464/igt@kms_plane_multiple@tiling-4.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12665/shard-dg2-463/igt@kms_plane_multiple@tiling-4.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-bmg:          [ABORT][5] ([Intel XE#4268]) -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8249/shard-bmg-7/igt@xe_pm@s4-vm-bind-userptr.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12665/shard-bmg-7/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8249_full and XEIGTPW_12665_full:

These patches do not introduced new tests.

> 
> ### New IGT tests (4) ###
> 
>   * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-hdmi-a-6:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12665_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-lnl:          NOTRUN -> [ABORT][7] ([Intel XE#3914]) +1 other test abort
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12665/shard-lnl-6/igt@core_hotunplug@hotunplug-rescan.html

...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8249 -> IGTPW_12665
>   * Linux: xe-2718-aca765dd193ad1c98ca57c2e22303f1a91c9df94 -> xe-2721-8541a64154cd8b9c07977dedc1d22883f43279a0
> 
>   IGTPW_12665: 12665
>   IGT_8249: 8cb34f260a285ff7eaa3d79cf71f0a4960e4c890 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2718-aca765dd193ad1c98ca57c2e22303f1a91c9df94: aca765dd193ad1c98ca57c2e22303f1a91c9df94
>   xe-2721-8541a64154cd8b9c07977dedc1d22883f43279a0: 8541a64154cd8b9c07977dedc1d22883f43279a0
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12665/index.html
