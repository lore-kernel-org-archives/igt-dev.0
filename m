Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AAA606A33C
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 19:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HMSzYjss
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C1610E0CA;
	Fri, 20 Nov 2026 19:02:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25972112CBF;
 Fri, 20 Nov 2026 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795201276; x=1826737276;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5P/QOSO50SiWfjz+sAcXEJn5CzOw439ZlyQLNDNg4/s=;
 b=HMSzYjssJvr9U4H501rCB29Oo7UTrZ6rE0xhg3Fk2DaFcSX8hKDqRsT7
 De61Sx8xquO9y2s+kQ4dtWZC46KnJ04m4OWbApI5d1bg18J/neIOFwg0J
 MMlCUMVjXg4l4/hO93hSRD/m85r9aeuGVf1FCrxWSHld/pIwwuo0XNqH5
 2I3CnhyHoZOf6UhD7Q6XyU9YQpigRUCSaMOom3JVRq6QjCr6xFo8JKyDl
 lVCrDcllCGa87yGbJEQvqbX8Uk6YfWjuyn+LV+5jT8n2D2+0SXtXNlj3C
 WajLp0fGjvJZxWzWftyjuTp6Zm7EOQJwez+EfnuqE6fnGRd8Vlea/Ffya g==;
X-CSE-ConnectionGUID: 4fdrkl1ERyOj3ih64QhQfg==
X-CSE-MsgGUID: NdRBRwznToKGdK7LvhbIXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3932633"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3932633"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 11:01:16 -0800
X-CSE-ConnectionGUID: zn228lHtRGyf11anh8g4Bw==
X-CSE-MsgGUID: XN+2iLgARaKJOSOqHhQzIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10652565"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 11:01:15 -0800
Date: Fri, 20 Nov 2026 20:01:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/core_sysfs: Create listing while reading (rev3)
Message-ID: <3ov732xk43ibf7pv2omib3xf72j6lf47vajcgdtarxl5i2s76e@kti7plxnoqm4>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20261118174245.207808-1-kamil.konieczny@linux.intel.com>
 <179517578873.58569.12948288258869521079@9ac1b63fe3ea>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179517578873.58569.12948288258869521079@9ac1b63fe3ea>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi igt-dev,
On 2026-11-20 at 11:56:28 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_sysfs: Create listing while reading (rev3)
> URL   : https://patchwork.freedesktop.org/series/178819/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9198_full -> IGTPW_16175_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_16175_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_16175_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16175/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_16175_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-mtlp:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@gem_softpin@noreloc-s3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16175/shard-mtlp-5/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-mtlp:         ([PASS][3], [PASS][4]) -> [INCOMPLETE][5]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_fbcon_fbt@psr-suspend.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_fbcon_fbt@psr-suspend.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16175/shard-mtlp-1/igt@kms_fbcon_fbt@psr-suspend.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_16175_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_allocator@execbuf-with-allocator:
>     - shard-snb:          NOTRUN -> [SKIP][6] ([i915#17647])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16175/shard-snb6/igt@api_intel_allocator@execbuf-with-allocator.html
> 
...cut...
