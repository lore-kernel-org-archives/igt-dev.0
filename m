Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CE2CCA471
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 14:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C5010E91E;
	Fri,  3 Oct 2025 14:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8n2KUM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C693110E91D;
 Fri,  3 Oct 2025 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759500815; x=1791036815;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9YR/mZ5e2WB9jbVEES56uM8YHPwxdPmLvBxDIr10bxk=;
 b=f8n2KUM/GdNLh4z4gJyYmJ7cBIMHamToVezyG0ElNhqKjtawfeJ92rKR
 28VbHVhbg91D+L/Hw0+krLle0vsiVYB3+2UZviuG7QnXs8Sj+5WanWPOE
 kbzNO5ihJxGIFtPWdUuS7sSOMXUxdto4JplM4LYEyQADgbXehO7M2K+/7
 QeNiD4pkag3g0sAp+0Dbif7wGdLIPeNzh4LVdHKrQcUlseBiEGZ7730Tr
 zzbZG9GTZhIbRyL4i31WGS+BxMk+zoUUxySDSthpl8DkK6pBMX4ZrPGjn
 RYza2Un2WYsZi+XsGikZ+IbdGhuxdPS0lSpAUV3PYln/tRDekIH40m0SY A==;
X-CSE-ConnectionGUID: QA1Zh+X1QI+pmdlZz4LTrw==
X-CSE-MsgGUID: FvjKNokPQ6KBE+jbt5PvPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61946238"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="61946238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:13:34 -0700
X-CSE-ConnectionGUID: oOzL3ThuTZq5ZHZOgKoSKg==
X-CSE-MsgGUID: KnMq011BRluY9biv5XekqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="178940759"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 07:13:33 -0700
Date: Fri, 3 Oct 2025 16:13:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mark Yacoub <markyacoub@google.com>,
	I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 lib/drmtest: Add Support for Virtio-GPU
Message-ID: <20251003141316.2ycd7sxit56kt7e3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20251002151714.595492-1-markyacoub@google.com>
 <175944554238.56.13686855648340266735@6aec98b87f92>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175944554238.56.13686855648340266735@6aec98b87f92>
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
On 2025-10-02 at 22:52:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/drmtest: Add Support for Virtio-GPU
> URL   : https://patchwork.freedesktop.org/series/155340/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8571_FULL -> XEIGTPW_13855_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13855_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13855_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13855_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@single-move@pipe-c:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8571/shard-dg2-433/igt@kms_cursor_legacy@single-move@pipe-c.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13855/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-c.html
> 

Unrelated.

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13855_FULL that come from known issues:
> 
...cut...
