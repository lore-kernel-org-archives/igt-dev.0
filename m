Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFC5606A321
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dr2wPG+r
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388B410E6BF;
	Fri, 23 Oct 2026 15:45:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B1410E6BF
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792770270; x=1824306270;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0jpICVB8XfXsVstNDdam4uHExQouTm4pTfoX21YEJlI=;
 b=Dr2wPG+rcimY/WSJcV1K0aYz/DM3bNHI/Z0WRxZm+ku4z2R4Lymtk+Mc
 OFIU4hoR7dlAwiv1i4Te7TM6QFyQUkPsWkRykJFyEq5DyZH+6wYbaR/K6
 esOIkkv3qEY3nWvNMcLYwpvR9ugTVLmFooyYZ61CT4jB/xlzJGfLvyD6F
 8RfcAD/8DUnDhMRSa8o8NBiXkbMcuLuiRfB5rkYFchLpdj9zVKqiBBrgM
 8ULYGB9DkdGJZNBEHm67ST3JlPYzkicU9WWdrcmmYHrjZUgTFQnUwfARn
 Ez8XtDuUD+eXfRV0vNBQoC2c4Yg8a4+RMsBs17WASECRqOSHUflMlX3/V g==;
X-CSE-ConnectionGUID: ajp/x0aITAmFj/DmIEIoSA==
X-CSE-MsgGUID: t5TQBES9SSSuExlR+y758A==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1436877"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1436877"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 08:44:30 -0700
X-CSE-ConnectionGUID: 5Z3N2w3xQ+q/0Saw2xL6uQ==
X-CSE-MsgGUID: D1TvVEFWQeyrhKA7cCocZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3663334"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 08:44:28 -0700
Date: Fri, 23 Oct 2026 17:44:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sokolowski, Jan" <jan.sokolowski@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_st?=
 =?utf-8?Q?arting_with_=5Bi-g-t=2C1=2F1=5D_tests=2Fintel=2Fxe=5Flive=5Fkte?=
 =?utf-8?B?c3Q6?= remove xe_eudebug from ktest list
Message-ID: <20261023154425.ynyjwgog3hig3pvq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20261022130258.407901-1-jan.sokolowski@intel.com>
 <179272066997.59583.12615642075083104001@221881a7231d>
 <PH3PPF5AF05F6D91446E50A4E8F692055E999642@PH3PPF5AF05F6D9.namprd11.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH3PPF5AF05F6D91446E50A4E8F692055E999642@PH3PPF5AF05F6D9.namprd11.prod.outlook.com>
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
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jan,
On 2026-10-23 at 07:41:11 +0000, Sokolowski, Jan wrote:
> These reports appear to have no relation to my patch.

You reply has 888KB, please cut it in future after 'Known issues'
to keep it short, unless you want to comment on some known ones.

Regards,
Kamil


> 
> From: Patchwork <patchwork@emeril.freedesktop.org>
> Sent: Friday, October 23, 2026 3:58 AM
> To: Sokolowski, Jan <jan.sokolowski@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: ✗ i915.CI.Full: failure for series starting with [i-g-t,1/1] tests/intel/xe_live_ktest: remove xe_eudebug from ktest list
> 
> Patch Details
> Series:
> series starting with [i-g-t,1/1] tests/intel/xe_live_ktest: remove xe_eudebug from ktest list
> URL:
> https://patchwork.freedesktop.org/series/176645/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16035/index.html
> CI Bug Log - changes from CI_DRM_19384_full -> IGTPW_16035_full
> Summary
> 
> FAILURE
> 
> Serious unknown changes coming with IGTPW_16035_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_16035_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org<mailto:I915-ci-infra@lists.freedesktop.org>) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16035/index.html
> 
> Participating hosts (11 -> 10)
> 
> Missing (1): pig-kbl-iris
> 
> Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_16035_full:
> 
> IGT changes
> Possible regressions
> 
>   *   igt@perf_pmu@frequency:
> 
>      *   shard-snb: PASS<https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19384/shard-snb1/igt@perf_pmu@frequency.html> -> FAIL<https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16035/shard-snb7/igt@perf_pmu@frequency.html> +1 other test fail
> 
> Known issues
> 
> Here are the changes found in IGTPW_16035_full that come from known issues:
> 
[cut]
