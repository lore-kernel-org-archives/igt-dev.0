Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D4DC52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 17:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7BE10E677;
	Wed, 21 Aug 2024 17:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4d3Y8Nz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F3410E676;
 Wed, 21 Aug 2024 17:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724260404; x=1755796404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YsMaF/dojUC5k+7kRctPPOfNWibBSA3851nR9lBJXg0=;
 b=W4d3Y8NzDboc2rYEl9cRLJ27mgOnHZCM4NMvvVMpvWEmPdLEl5/GS0oK
 GRQL1+shwWq3tvOK/DNTxqTgl2YvZvIAMp746pQ2u8hjvqxyjICUirgGb
 7NnhqubsPrafZCKOAwzAwwKu9x6uLdKfDorLj0AsO0MtN2NTiLTI61gjT
 QuEehTY5i/98FT+wWJ/mYy3rDP1fDOoZjfXpjUelT7Jii7crUF1gQm6ZW
 f840pTXF3lVB33BqzZ9ZU+oc4NRmClyh6D8jBMla/7uGI8XL366QK2JxU
 X1m7wfLnNap3piATMEv5lb46CEwNiIbV6K858v/H6IEuDLInm1FkO4ZO1 Q==;
X-CSE-ConnectionGUID: DtF/6lg+SQCaxYPj6nT3EQ==
X-CSE-MsgGUID: o/iIW+94TJm4slAnuk6KLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26430067"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="26430067"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 10:13:23 -0700
X-CSE-ConnectionGUID: iAqKLwVlSd+0UzcZ2p7/Gg==
X-CSE-MsgGUID: n1Rrei83TH+EUn/4ZRliIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61287581"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 10:13:22 -0700
Date: Wed, 21 Aug 2024 19:13:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for Fix
 compilation for musl in intel/kms_pm_backlight
Message-ID: <20240821171319.vbhebgbc7sbfhobi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240821095137.60254-1-kamil.konieczny@linux.intel.com>
 <172425814909.721581.15278207553073772463@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172425814909.721581.15278207553073772463@2413ebb6fbb6>
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
On 2024-08-21 at 16:35:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix compilation for musl in intel/kms_pm_backlight
> URL   : https://patchwork.freedesktop.org/series/137557/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7981_full -> XEIGTPW_11609_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11609_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11609_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11609_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
>     - shard-lnl:          NOTRUN -> [FAIL][1] +12 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/shard-lnl-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
>     - shard-lnl:          [PASS][2] -> [FAIL][3] +7 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7981/shard-lnl-5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/shard-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
> 
>   * igt@xe_module_load@reload:
>     - shard-lnl:          [PASS][4] -> [ABORT][5] +1 other test abort
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7981/shard-lnl-3/igt@xe_module_load@reload.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/shard-lnl-3/igt@xe_module_load@reload.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-lnl:          [SKIP][6] ([Intel XE#873]) -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7981/shard-lnl-7/igt@kms_async_flips@invalid-async-flip.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-lnl:          [SKIP][8] ([Intel XE#1477]) -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7981/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          [SKIP][10] ([Intel XE#1399]) -> [FAIL][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7981/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
>     - shard-lnl:          [SKIP][12] ([Intel XE#373]) -> [FAIL][13] +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7981/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>     - shard-lnl:          [SKIP][14] ([Intel XE#1421]) -> [FAIL][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7981/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          [SKIP][16] ([Intel XE#656]) -> [FAIL][17] +2 other tests fail
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7981/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-lnl:          [SKIP][18] ([Intel XE#2318]) -> [FAIL][19] +1 other test fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7981/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 

Unrelated to change.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
>
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7981 -> IGTPW_11609
>   * Linux: xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c -> xe-1804-c83ab549ef8f647c3de42793d222a980021a973f
> 
>   IGTPW_11609: 11609
>   IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c: 50db4c0a8d28ec0d03ea120d17a914265fa47d5c
>   xe-1804-c83ab549ef8f647c3de42793d222a980021a973f: c83ab549ef8f647c3de42793d222a980021a973f
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/index.html
