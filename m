Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231BBC83F23
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 13:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB93410E6B1;
	Thu, 29 Aug 2024 13:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcJfAtEp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF4710E6AF;
 Thu, 29 Aug 2024 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724938909; x=1756474909;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5dpkaxirAVmFUQL2Ms1NbaC6FoCj5fks7DLeqylO8mc=;
 b=LcJfAtEpN4EEXJVp4Omuoq2HtenensCx5NRMDZqnwKw7L2qBHJensoCv
 9fghYn/ahSbuHlrGilf+9Ms3I3uKQaAiLH/F2YJuerhJrCLQwlHIOyUGU
 NYmCzxpmVbQR1SHyn3rVI2Xb+w2dkzs2Rx0lcMxrd69gknNozmS4rjleY
 3y1lKzaH3WTrQ7BVYIhmTXSIi/rSgLfMU+otNeFpG1tH4dXMROWSS8HY7
 SvCVDUn781lES62HOLMGYibUuYj30hQvcv6g8vr6dSQATJLeK2xSAxAWM
 QOY1Uwk00wiFvjVNYoFr1rKSO593nm0cf9mE6TKzqiFkqYTkzOIMbCn1N w==;
X-CSE-ConnectionGUID: Pg++H89YQA+XE6HBvSTWcw==
X-CSE-MsgGUID: 8VLNsaoTRM+QYw3h5hz2eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34935440"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34935440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 06:41:48 -0700
X-CSE-ConnectionGUID: bgoVg/BuSNC8+3d+qB5agA==
X-CSE-MsgGUID: lq/rQV7MQnyprAuH2YsHGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="101094964"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 06:41:47 -0700
Date: Thu, 29 Aug 2024 15:41:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 lib/igt_kms: Helpers for connector managment
Message-ID: <20240829134134.pnphh56376rszjld@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240828-b4-cv3-01-igt-kms-v1-0-d6e21b1e5d04@bootlin.com>
 <172489747197.829689.10706366801100189583@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172489747197.829689.10706366801100189583@2413ebb6fbb6>
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
On 2024-08-29 at 02:11:11 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kms: Helpers for connector managment
> URL   : https://patchwork.freedesktop.org/series/137915/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7993_full -> XEIGTPW_11654_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11654_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11654_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11654_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 

These are unrelated to a change, none of added lib functions
were ever used.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3:
>     - {shard-bmg}:        [PASS][3] -> [INCOMPLETE][4] +2 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-2/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-bmg-3/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11654_full that come from known issues:
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7993 -> IGTPW_11654
>   * Linux: xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b -> xe-1846-cc2365ebeb3e24e591de171d3788a6512a122989
> 
>   IGTPW_11654: 622e3af0c046df5a6b126215991cbe8fe34f75aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b: 0f7dbe16a23882ef9c928d9650ea0613925e710b
>   xe-1846-cc2365ebeb3e24e591de171d3788a6512a122989: cc2365ebeb3e24e591de171d3788a6512a122989
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/index.html
