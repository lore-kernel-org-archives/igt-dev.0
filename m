Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D961CCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 13:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C0910E2BF;
	Tue, 30 Sep 2025 13:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWc0vWuO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B8610E2BF
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759237446; x=1790773446;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=xtY6hIiSR9JyQnT/7GRPDcJih2q7UctqBe1B777lG5U=;
 b=UWc0vWuOS5sIUicXaATYk77kB72FVz201cRDlQUWXUJy8daSu2Q5zryY
 lE9CtNzwc7gyj2x/WAotl/NmAbHM5kz8gq1oWSD0+gvxYq2T9ktMYQAq2
 BFxw0Z5CgpgvIyfS/p1NIRHQMWEasF83ZWRrEsLqIWOwHv8ggD4fydxIK
 FRbrsofpaW5MnFVIobsUnFoPpCpTxpU41pixMu3KC1vPkEcssNZ1LTQiv
 rS6g161VJVeWuhjUXBTgYdFptAnikW9qOnjYJaHbLBuqkW1P5iI4OBzWY
 j7PknJdDrqD1Xt3jFzhBrdEgQyu39lPWVpl0D+QtK9HQc+WwiGZb3KRYc A==;
X-CSE-ConnectionGUID: /z/aQ5RsRpS1Cf3HgWRsqA==
X-CSE-MsgGUID: M6/eJDgzSZKyN0JCPbPvwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61382942"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61382942"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 06:04:04 -0700
X-CSE-ConnectionGUID: /6mhyThHS6OG2FldF/98Fw==
X-CSE-MsgGUID: XyPrmtm8Q7uNabWS6JT9dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="202195784"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 06:04:01 -0700
Date: Tue, 30 Sep 2025 15:03:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 intel-ci: Fix typo in Xe LNL display blocklist
Message-ID: <20250930130357.jhgmsepy442cfimi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250923113718.78290-1-kamil.konieczny@linux.intel.com>
 <175872295353.361551.12556142964671832229@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175872295353.361551.12556142964671832229@1538d3639d33>
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
On 2025-09-24 at 14:09:13 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Fix typo in Xe LNL display blocklist
> URL   : https://patchwork.freedesktop.org/series/154899/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17263_full -> IGTPW_13801_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13801_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13801_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13801/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13801_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-edp-1:
>     - shard-mtlp:         [PASS][1] -> [FAIL][2] +4 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-mtlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13801/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-tglu-1:       NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13801/shard-tglu-1/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2:          [PASS][4] -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13801/shard-dg2-10/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-3:
>     - shard-dg2:          NOTRUN -> [ABORT][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13801/shard-dg2-10/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-3.html
> 

These are unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13801_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
...cut...
