Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E603C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 18:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BDD10E27E;
	Mon,  5 Aug 2024 18:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYOqJ2+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E282410E27E;
 Mon,  5 Aug 2024 18:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722883528; x=1754419528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vnqY+SNbWu01XOSX2tokMd1ZCm3MqNIRGv1bVblJBLo=;
 b=cYOqJ2+1IqLHJKe6grLw0dxyrs664YuYL6fQmER6RP06w4nm+AE1Tddb
 CT4kJp8wiuID9obwkQhiIk1vneNy8FAAt+twX804qZHkoyIPodt2qXt/b
 C2fDJZ0EjGpD4IxwipmRS0Mc94ac0OOwbwW7vUlFc4J4fBebIkyY6XcPO
 6YuO+NemrwKQamKVcIbRFeH+ltxHCaKdoyh2rNkYu6+HYngR8DKiyvRd5
 EplSjmRj3R3KqTh27rPLSNOO9edbf4/SwP8199HNsWt1j22klHHOqqmaR
 e6pYj62eNAVlRxCbxPHUDdRTxnopqF9a7Om5l4i55XrvOJ5kHlFHC80Cr A==;
X-CSE-ConnectionGUID: pCaKRGwdSbSR4TILWBoCuA==
X-CSE-MsgGUID: JWNgsG8BRYClfxPZYoQFWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="12874345"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="12874345"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 11:45:28 -0700
X-CSE-ConnectionGUID: kUUVd5CgTCmL8zumSWfwTw==
X-CSE-MsgGUID: y69WG2WVR16CUJZHPdOjtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="60398532"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 11:45:27 -0700
Date: Mon, 5 Aug 2024 20:45:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 tests/core_hotunplug: Make it fail only once
Message-ID: <20240805184509.gooczcnhkynkvcda@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
 <172287514243.540583.13294552188876628775@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172287514243.540583.13294552188876628775@2413ebb6fbb6>
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
On 2024-08-05 at 16:25:42 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_hotunplug: Make it fail only once
> URL   : https://patchwork.freedesktop.org/series/136888/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7956_full -> XEIGTPW_11531_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11531_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11531_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11531_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7956/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11531/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7956/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11531/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_sequence@queue-idle@pipe-c-edp-1:
>     - shard-lnl:          [PASS][5] -> [FAIL][6] +2 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7956/shard-lnl-7/igt@kms_sequence@queue-idle@pipe-c-edp-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11531/shard-lnl-8/igt@kms_sequence@queue-idle@pipe-c-edp-1.html
> 

These looks unrelated to core_hotrebind,

Regards,
Kamil


>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
...cut...

>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7956 -> IGTPW_11531
>   * Linux: xe-1714-a0d88000f0e2352047f037e14fc7f9d1a66a6e2b -> xe-1715-d15caf398bccf6c9d34363f65251b7192f833dc9
> 
>   IGTPW_11531: 11531
>   IGT_7956: dc7e77d1a8643f50832c38b4c8f8ddb598c0cf48 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1714-a0d88000f0e2352047f037e14fc7f9d1a66a6e2b: a0d88000f0e2352047f037e14fc7f9d1a66a6e2b
>   xe-1715-d15caf398bccf6c9d34363f65251b7192f833dc9: d15caf398bccf6c9d34363f65251b7192f833dc9
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11531/index.html
