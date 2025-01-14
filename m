Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B408E77188
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 11:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6AF10E186;
	Tue, 14 Jan 2025 11:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqQ6jeq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0E410E186
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2025 11:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736853456; x=1768389456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rnwb/EM++l/0Ug6amTvl91J6f2XmgXUSJqMnkfNCT8U=;
 b=NqQ6jeq7UDATwHl/rcIGeT0wxf6nd8b4UGSFPXs41ziHq5QRtMk/b3VE
 P+8HZaIzQNOUPYjV1i/3QQqSJaGnYvfFaOyW6JxBN9IiR3qyVVZsow60n
 8BHbSv+t2jeDPv+nyHUFmMLK32TJmlfUCDNTuJb/OBhLtLZh4Pr/9azzU
 C7XgAek8An/ClzSNhdZGWxGLgwGvCSTUMs35/mtxvqRehHWGcRuX7RCAS
 mCnx5vbWcRlsIsgHh0yTXxEwetdGCbM/JEcqB/Xyyoj9NO27fsLl9Bh6h
 fXsABmawHMPmuEdeiz/7AdOYYAzRonk7mY9AlaSQyYqDHKm3Rd0oElbWG w==;
X-CSE-ConnectionGUID: ErAOw/+oRLqPpbPA35EmDA==
X-CSE-MsgGUID: vyr/KjAeSmq4SjQhKhUwUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37299012"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="37299012"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 03:17:36 -0800
X-CSE-ConnectionGUID: dB01/8jRRG+A43zSzTqlGQ==
X-CSE-MsgGUID: TTUHXHRjS/Gvl9FojD9isw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="105288940"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 03:17:35 -0800
Date: Tue, 14 Jan 2025 12:17:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 tests/intel/xe_vm: Fixed documentation (rev2)
Message-ID: <20250114111732.g5jev6igiolaayxg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Gurram, Pravalika" <pravalika.gurram@intel.com>
References: <20250109090044.913444-1-pravalika.gurram@intel.com>
 <173666791842.2811904.17029985292773063507@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173666791842.2811904.17029985292773063507@b555e5b46a47>
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
On 2025-01-12 at 07:45:18 -0000, Patchwork wrote:

Below are unrelated, this patch corrects documentation of test xe_vm.

Regards,
Kamil

> == Series Details ==
> 
> Series: tests/intel/xe_vm: Fixed documentation (rev2)
> URL   : https://patchwork.freedesktop.org/series/143310/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8183_full -> IGTPW_12416_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12416_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12416_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12416/index.html
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12416_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@debugfs_test@read_all_entries_display_on:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-mtlp-7/igt@debugfs_test@read_all_entries_display_on.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12416/shard-mtlp-6/igt@debugfs_test@read_all_entries_display_on.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12416_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8411]) +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12416/shard-dg2-4/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@drm_fdinfo@busy-check-all@bcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8414]) +7 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12416/shard-dg1-12/igt@drm_fdinfo@busy-check-all@bcs0.html
> 

...cut...

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12416/index.html
