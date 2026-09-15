Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1DEC88E53
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 08:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E5A10FAEC;
	Tue, 15 Sep 2026 08:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGFET5P8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E0F10F32B;
 Tue, 15 Sep 2026 08:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789460125; x=1820996125;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PGNYwhFrRhtBGd5yjOLJXVxksLfDXHZxC9qc1gj2/MY=;
 b=QGFET5P8TOPwR+5TEmJXePNXoRk08suuTwBYjk4iPlEB0Rfbv/TS55HX
 dLEWKCU2IejI898K2ESGXUeZPPNDfatK6jRNYhf7cbymdRmYtABRDAQ1A
 bhj37KyWZA+aG4T2ooS3Ias1xKzlvWVPeO3VjzLCVLsXDD2Hnto/It/92
 z2EWr/ZzWE1Z0vyOltxhnp6esmT94mvRtkGOQff3wRH8JaiLrjrUif2Cp
 uFhRlPXwdWQm5rz/GrHpQb+kK64pwD/7nanrKHdJ38I7l3wl0cNSn7NqF
 k3L/3zPdxqadvhMywQRtrXRjCRal/dApXPuN9Qjk6gOms/HVxQjmVqAjF A==;
X-CSE-ConnectionGUID: maJ/PXmnTnekkFQv7qFsIw==
X-CSE-MsgGUID: cF/43wTHQaCdk/e6ETFpUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89948734"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89948734"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 01:15:24 -0700
X-CSE-ConnectionGUID: rC86RRIHTiajVRyanKOd/g==
X-CSE-MsgGUID: SUt3QE1SR36oTl3/sIkHTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271465161"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:15:23 -0700
Date: Tue, 15 Sep 2026 10:15:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests=2Fi?=
 =?utf-8?Q?ntel=2Fxe=5Fexec=5Freset?= =?utf-8?Q?=3A?= Update gt reset dmesg
 ignore regex (rev2)
Message-ID: <20260915081506.uknp2safv6cvadg5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260914221220.437212-1-jonathan.cavitt@intel.com>
 <178944528724.162217.8964514356697140702@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178944528724.162217.8964514356697140702@61270ab9df2a>
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
On 2026-09-15 at 04:08:07 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_reset: Update gt reset dmesg ignore regex (rev2)
> URL   : https://patchwork.freedesktop.org/series/174055/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9094_full -> IGTPW_15842_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15842_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15842_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15842/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15842_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1:
>     - shard-tglu:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9094/shard-tglu-7/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15842/shard-tglu-10/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html
> 

Unrelated to Xe test change.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15842_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15842/shard-dg2-8/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15842/shard-mtlp-8/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
...cut...
