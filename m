Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAABC4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 12:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D7710E460;
	Fri, 17 Jul 2026 12:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDTun2lE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E228F10F548
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 12:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784291955; x=1815827955;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U+T/GpSZXVFZAIczfpx0gez3MPWTp76oH0H4LjOpE14=;
 b=nDTun2lEHPXlNRACi7ZfXUea3GkXpj/AyfN9PuEcaJM55O0u8caGsHTJ
 p9dS3rK/wJSYwSiGgyun7gaV934qQaqzH2Aft0/JpAa7StvB4k2zulhQf
 CVEKEOnxOf6WskSsxQqI1V/5sTuFkwzXk//tMFzLL1TLUAUZa4Ys/xkcB
 W80F6bdRXo5RU6SgJqVJ6OxV6eMtzsuAvYzKL0dEtCQXZe/l7GWkJYPRE
 x9WDpQNpqRlNRRymB6B0CXju5WQRBUjxoUZpqqBTKSiF/ptJOmgy4fceg
 TmnlutaTwzXXhDPD8UohxdNjzlRCSfjLfCK4R+Jo6aD8sFdqPFsBDNUkj A==;
X-CSE-ConnectionGUID: 9ab4WapMR26BZd2B2RadFw==
X-CSE-MsgGUID: MZh+X0eYRUyRpQ0BUZTNoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96097023"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="96097023"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 05:39:15 -0700
X-CSE-ConnectionGUID: yhXn35UcQY6g66ggTbU9gQ==
X-CSE-MsgGUID: myS/wo6oTg+YOgy1Ur/IFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="255016474"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 05:39:14 -0700
Date: Fri, 17 Jul 2026 14:39:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <jason-jh.lin@mediatek.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests=2Fkms?=
 =?utf-8?B?X2hkcjo=?= Skip unsupported formats in bpc-switch test (rev4)
Message-ID: <20260717123911.gvyaqnbxlypr4nrf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <jason-jh.lin@mediatek.com>
References: <20260709073913.1645371-1-jason-jh.lin@mediatek.com>
 <178421937290.198460.1077575576675113295@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178421937290.198460.1077575576675113295@6beec6c84f66>
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
On 2026-07-16 at 16:29:32 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_hdr: Skip unsupported formats in bpc-switch test (rev4)
> URL   : https://patchwork.freedesktop.org/series/166923/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9008_FULL -> XEIGTPW_15541_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15541_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15541_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15541_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15541/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@runner@aborted:
>     - shard-lnl:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15541/shard-lnl-5/igt@runner@aborted.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0:
>     - shard-bmg:          NOTRUN -> [FAIL][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15541/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][5] ([Intel XE#2313]) -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9008/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15541/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 

Unrelated.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15541_FULL that come from known issues:
> 
...cut...
