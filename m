Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84007D3399B
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 16:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A0110E513;
	Mon, 28 Oct 2024 16:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QC1CI7r5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2E510E513;
 Mon, 28 Oct 2024 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730134551; x=1761670551;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bSxVBlHq6oPMT673UXM3r6fYsOixSs7Tv2LtPSMPYls=;
 b=QC1CI7r54ZMGzNkdSvTI4Mop09yAd46M2iKOgtWdTaoKG6/Ih5KJV+3i
 zym2S/15VIPjK8SwuDC75gcVeFde5GChTTyNatm5GWSTGrwjnN4gbKO1V
 rMjq7jiPqr0e/1AOxJgQ46+Luo1EigRgva84yto1aRk6RpCczzxX9HZdo
 sUodIANS0Ek8XhPzLLWMYPERWojD/bB68BlHHX6uvRftn6HYc/nmz1gcX
 NN0h0wQlR0/W2lTctRTWnPJ+ihbvjabU4rrwsTba8hK9gW4TONYH5vF6F
 /7UP3oGt6pM4ULc8M3QrOjKz3A6LkEhpUZEm3/3WypVqyQY8n4VOTWI1J Q==;
X-CSE-ConnectionGUID: HCmoc1DASoSCGeBoFJLjCg==
X-CSE-MsgGUID: yJTRgjTlSAWh9wYnLjyFTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52293131"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52293131"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 09:55:51 -0700
X-CSE-ConnectionGUID: 8kO2vCVITAyNUlDyxyyKgQ==
X-CSE-MsgGUID: rvuU9v3NRCmvH4wm/dDFew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="86813282"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 09:55:50 -0700
Date: Mon, 28 Oct 2024 17:55:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_vm:Reduce n_execs for bind-array-enobufs
Message-ID: <20241028165547.2wzenuqw5l4srbly@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241022201130.5724-1-jagmeet.randhawa@intel.com>
 <172965827549.1322097.15498286541015336544@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172965827549.1322097.15498286541015336544@2413ebb6fbb6>
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
On 2024-10-23 at 04:37:55 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_vm:Reduce n_execs for bind-array-enobufs
> URL   : https://patchwork.freedesktop.org/series/140336/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8082_full -> XEIGTPW_11960_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11960_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11960_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11960_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +2 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11960/shard-lnl-2/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>     - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11960/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@xe_vm@bind-array-enobufs:
>     - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_vm@bind-array-enobufs.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11960/shard-dg2-463/igt@xe_vm@bind-array-enobufs.html

Jagmeet, please look into this, was it caused by your patch?

Rest of failures are unrelated,

Regards,
Kamil

> 
>   * igt@xe_vm@bind-array-exec_queue-many:
>     - shard-dg2-set2:     [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-435/igt@xe_vm@bind-array-exec_queue-many.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11960/shard-dg2-466/igt@xe_vm@bind-array-exec_queue-many.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11960_full that come from known issues:
> 

...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8082 -> IGTPW_11960
> 
>   IGTPW_11960: d44f495790106e3e64d4540a30faa09c9fc4d1ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11960/index.html
