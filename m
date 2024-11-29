Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94190D6EBEC
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 08:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5130110EDB6;
	Fri, 29 Nov 2024 08:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jALU++0s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131DA10EDB6;
 Fri, 29 Nov 2024 08:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732868182; x=1764404182;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FaDk3P2mDQ6IReEde16Vp8QiqzA77bvHjrhPxVUtXO0=;
 b=jALU++0smeO9aJgWuiB2QVReesY4F/yMZwQ7466uezM+n5hlRvtrRyRc
 15jb5zoIYoD4fFZy2XJxV/0F5KcVPBpSWHUEPgw9TDaAOMa0m6bNAAYjj
 XLys62/Z0B/IiN9fg6I1xZ9/gBVVd0h6yLNf4tdIHss5zWgG3OTXO78NE
 y7HTQCeTfDgttn9yYFEDBWWXMCdo2ZmIFYNuaYAXDHrid8fJgQSqws00u
 fZto1siKrKVb+5tw4KrBsbm1k9BkY0wUkR4j6wT+0p57DJx7km9OS70sN
 axfG3flUkhT/ECV6vxd9IOKz3IDAyN3j2jsAgrP5ei6wWRvXr0I/Fh/G1 g==;
X-CSE-ConnectionGUID: P8n4Bh1VQC6bwl0tMWP7pA==
X-CSE-MsgGUID: 5kdyFahTQVSJ+rDPgd7v6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44476025"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="44476025"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 00:16:22 -0800
X-CSE-ConnectionGUID: ybdEZc21RTqaBxlV9cgJFw==
X-CSE-MsgGUID: +NGKvWltQ/yj8kZt8+0Ysg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="97471305"
Received: from moandrew-mobl2.ger.corp.intel.com (HELO [10.213.198.81])
 ([10.213.198.81])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 00:16:21 -0800
Message-ID: <2133e8a2-9a00-4aad-b0fa-f30e8ba271ca@linux.intel.com>
Date: Fri, 29 Nov 2024 09:16:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_igt-runner?=
 =?UTF-8?Q?_fact_checking_=28rev9=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173286764294.213798.1042774316885389138@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173286764294.213798.1042774316885389138@b555e5b46a47>
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


Dear I915,

On 29.11.2024 09:07, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev9)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8130 -> IGTPW_12219
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12219 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12219, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12219:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-kbl-guc:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@kms_flip@basic-plain-flip@b-dp1:
>     - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@b-dp1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@b-dp1.html

These are unrelated to my change. Please fix and re-run.

Thank you,

Peter

[...]
