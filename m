Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639B6C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 09:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E992D10E6DA;
	Wed, 16 Sep 2026 09:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boTqkYXi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A483D10E8F5;
 Wed, 16 Sep 2026 09:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789549854; x=1821085854;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tpdg3wfAgfROoV9xJrSJ2eEYyIPm8t3X3xjIO1KImTg=;
 b=boTqkYXibN2mY3ZBBlEn3bdOPhMSdjVAW54fchTX5BO8OE6dAgYLlkeX
 O4zIq5WBL3K6BELriR3EzCcTYQVfukOlDnk0xLDCrAlXMjOvZVG1YeaVU
 iU3zvGPk5z49qqGTnuhgAY2wlfKsVdH3HlgRm5YirsHGBln2mhQt+rG4d
 1SPdNQM41+xwlqR/sibl2m/YupdzTF89curCuXHolWv30B6KBeyZoaQWl
 Y9iRojLmC+j/boklbj4z/+xmo7Pd7lJJhLHok3a5LuM8GB2mg9Gd4UnYk
 Q1/0hrHG3gt78sUumH3wJWkzAFpyc190Z9DcePxjfQ4EelxlPRbtHNzki Q==;
X-CSE-ConnectionGUID: PkWwfbjcQTmpK+iJa0n1Aw==
X-CSE-MsgGUID: WAr2L4LyTE2ieVebAH6XEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90056606"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90056606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:10:53 -0700
X-CSE-ConnectionGUID: 2+Kz4gBoQsq5stH1d4lBhw==
X-CSE-MsgGUID: 3hHM4WE1QrCUv0GeE1BVkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="298342247"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:10:52 -0700
Date: Wed, 16 Sep 2026 11:10:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 gitlab-ci: Fix computing sum for debian image
Message-ID: <20260916091050.dau5jlinh5f2mkrd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260915125123.228545-1-kamil.konieczny@linux.intel.com>
 <178952041077.168006.14220130653908006149@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178952041077.168006.14220130653908006149@61270ab9df2a>
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
On 2026-09-16 at 01:00:10 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: gitlab-ci: Fix computing sum for debian image
> URL   : https://patchwork.freedesktop.org/series/174141/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9098_full -> IGTPW_15847_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15847_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15847_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15847/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15847_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9098/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15847/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3.html
> 

Unrelated, no test nor libs were changed.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15847_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15847/shard-dg1-17/igt@api_intel_bb@object-reloc-keep-cache.html
> 
...cut...
