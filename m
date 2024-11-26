Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A9AD65522
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 16:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6462110E950;
	Tue, 26 Nov 2024 16:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZpC3vnnX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9D810E950;
 Tue, 26 Nov 2024 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732639232; x=1764175232;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kdi4GsccR75YrNXxDjMw2rKQIyOec7vyJ+M+XF/bqnc=;
 b=ZpC3vnnXuI5ZS6pBkCwtzbcj//WsjfbtfMZ66fvVODNB2S6yTkMrO3yr
 QhMoehbRcJwxIAYi9JZFkSL33U+uIsp7LcSvxaNwZV7rYpormTD4jneyh
 gPzSdUDlOZy42hpmmh3QMPNOdJh8LcAcHKLimbdUQimtIUCBonKHp3fM6
 iZNlv91MBetA6EFufJYZTI0jihKzT3+xn0a9+fQCFjmfObpcHjBl1S/g4
 PI7N14TNsbRIQDqVMiP3vCO4lOxMwy0r5P+A8TUK7QUjjE4M/nOPutHzs
 sajF919G9Z7iLkAwqMID/Nqvs1UTDYN+m52slNeUItfI+Ls9Ci+FObrii g==;
X-CSE-ConnectionGUID: NxkZATSDSnyb7YzELb4e6w==
X-CSE-MsgGUID: hCFXZBExSxmBcGhLhqt8iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="50216826"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="50216826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:40:31 -0800
X-CSE-ConnectionGUID: sluF8B3qQ3ie6462o27gqA==
X-CSE-MsgGUID: Aputu+cpRsqGnd3bpYrhLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="92133899"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 08:40:29 -0800
Date: Tue, 26 Nov 2024 17:40:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Ignore more warns in xe_wedged tests (rev4)
Message-ID: <20241126164027.ihujhyamfao3mrti@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
 <173257997623.3058141.13669358954501986103@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173257997623.3058141.13669358954501986103@b555e5b46a47>
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
On 2024-11-26 at 00:12:56 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Ignore more warns in xe_wedged tests (rev4)
> URL   : https://patchwork.freedesktop.org/series/140511/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8125_full -> XEIGTPW_12191_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12191_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12191_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12191_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +3 other tests incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/shard-bmg-3/igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [PASS][2] -> [SKIP][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-lnl:          [PASS][4] -> [FAIL][5] +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@xe_eudebug_online@pagefault-write:
>     - shard-bmg:          NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/shard-bmg-1/igt@xe_eudebug_online@pagefault-write.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
>     - shard-lnl:          [PASS][7] -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-5/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/shard-lnl-1/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
> 

Above are unrelated.

>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-bmg:          NOTRUN -> [ABORT][9]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html
>

This is new bug.

>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][10] ([Intel XE#2136]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
>     - shard-bmg:          [DMESG-FAIL][12] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-FAIL][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
>

Also unrelated to change in xe_wedged.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8125_full and XEIGTPW_12191_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-6:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.08] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12191_full that come from known issues:
> 

...cut...

>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8125 -> IGTPW_12191
> 
>   IGTPW_12191: ae4ed220a690ce77a7679ebfcfc5ae36c7cc9d3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2275-6510562075d8541c218e72188f9ef339f8ba371f: 6510562075d8541c218e72188f9ef339f8ba371f
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12191/index.html
