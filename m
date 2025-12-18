Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B263CD68BF6
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 09:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FABC10E974;
	Thu, 18 Dec 2025 09:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaPrH8hu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE6D10E974;
 Thu, 18 Dec 2025 09:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766051635; x=1797587635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TzQk2SRt8mzzzoPdHN623ok2wlK7+T5QpSYJLEsBe6Q=;
 b=WaPrH8huHgdnvLNVP17p8Wrhc0AEGuTDYSlb5wh0m3safEmeqgRTB+CQ
 aVs687L0qiTdAn2USqocsvt80yeY/NiyPNrCQ/nVOw7puvcYk/P+ejw1A
 OdK2mZRKgrxMsxlTMRv4YFdvopIDn38apcJZULRZEoCAZBSxwko3WsnWJ
 kae9AaFV+o0oyTgjR4YEuqd8MiFtzobXixk+B8nBMSu9bk3yHhfZJ2yiC
 WUSUzbMFSmCrUzyH2aPW8OJeWD9SnXDFvPTD6Bm4vTfTAaa0b1F8Al+qX
 mVUSxLjJX2bzgFYrmYA7Dokl/ji2ieXTZ58KhuR8xMfndE5ajRhx6QdJT A==;
X-CSE-ConnectionGUID: yUP663/gTD6MD/tPhVRS+Q==
X-CSE-MsgGUID: SF9IZYKZSuSTe9ZZtbWzHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78713764"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="78713764"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 01:53:55 -0800
X-CSE-ConnectionGUID: WwwnToj8RdSxy8MDb3E9rg==
X-CSE-MsgGUID: q1FQxws7Ry6VeiMYLKN+Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203441441"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.252])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 01:53:54 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for
 tests/intel/gem_lmem_swapping: Avoid false failures from oom-killer
Date: Thu, 18 Dec 2025 10:53:51 +0100
Message-ID: <6112761.MhkbZ0Pkbq@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176601860648.97606.18400949079259535367@a3b018990fe9>
References: <20251217145110.131121-2-janusz.krzysztofik@linux.intel.com>
 <176601860648.97606.18400949079259535367@a3b018990fe9>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Thursday, 18 December 2025 01:43:26 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_lmem_swapping: Avoid false failures from oom-killer
> URL   : https://patchwork.freedesktop.org/series/159160/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8670_full -> IGTPW_14228_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14228_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14228_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14228/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14228_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_big@single:
>     - shard-mtlp:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-mtlp-3/igt@gem_exec_big@single.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14228/shard-mtlp-4/igt@gem_exec_big@single.html

The change under this pre-merge testing modifies only gem_lmem_swapping, not 
other tests.  The above failure is not related.  Please update filters and re-
report.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
...



