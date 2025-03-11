Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688A1C28B2F
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 07:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1538E10E129;
	Tue, 11 Mar 2025 07:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmGtOTJZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B49110E129;
 Tue, 11 Mar 2025 07:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741677024; x=1773213024;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Srx97NNzs/swor98D6zxpuzIFY14f99Y81q3oNG8UcI=;
 b=BmGtOTJZuR9s7DSJ4Sz/Ql8BtsBvrfwt8yujKvn+NGQhMQedIQhGAqXA
 Xvo41zE0bFZ/jK65uJ6exQYjrb1+6UeG5rHBgovYULuwPd3wjlMuheWpw
 WAyXkvx/5F+v7aRGHlLb+yztjWpsFFSXO38bf1M+XHo13we9arURp9oCQ
 fXIDPBgl2QYh8VmJMHaAW3yCMGvcDZn3HcQpoaxCxMkUrLOnsy6KKEqPo
 fXu+8rzajU1kwtcwXW68MqodxuPK/op31/Lmnx1rhNYviu0lBy7wAMWYp
 ex2WcpFNOVJvBolYqTfbw+o5yI+dDV5R0V67ix7JtOm20+8RN32qxzLGT w==;
X-CSE-ConnectionGUID: zhWsBslzTD+vCDGYbYONpg==
X-CSE-MsgGUID: rfIl47XHQnmaC+e2pClZow==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42551331"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42551331"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 00:10:23 -0700
X-CSE-ConnectionGUID: SQh+B8sPQ6+PfksBfnfn2w==
X-CSE-MsgGUID: zgI9eOB/TtqMMJOG6iT28A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120159804"
Received: from unknown (HELO [10.245.253.236]) ([10.245.253.236])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 00:10:23 -0700
Message-ID: <cbfc6f23-16f7-4c9c-9000-0c1d57356f51@linux.intel.com>
Date: Tue, 11 Mar 2025 08:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_runner/kme?=
 =?UTF-8?Q?mleak=3A_Remove_unnecessary_lseek=28=29_calls?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250310200220.233045-1-peter.senna@linux.intel.com>
 <174165762026.16386.5400280116303969337@18a75f3d1eae>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174165762026.16386.5400280116303969337@18a75f3d1eae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I15,

On 11.03.2025 02:47, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/kmemleak: Remove unnecessary lseek() calls
> URL   : https://patchwork.freedesktop.org/series/146105/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8270 -> IGTPW_12739
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12739 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12739, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/index.html
> 
> Participating hosts (44 -> 43)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12739:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - fi-tgl-1115g4:      [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8270/fi-tgl-1115g4/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/fi-tgl-1115g4/igt@i915_selftest@live.html
> These are unrelated. Please fix and resubmit.

Thank you,

Peter



[...]
