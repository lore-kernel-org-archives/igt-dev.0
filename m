Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121D0C02184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 11:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9560910E18E;
	Tue, 14 Jan 2025 11:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlecDCuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D084610E186;
 Tue, 14 Jan 2025 11:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736853404; x=1768389404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3vVcX26KyvualRVE3P2W0eBlT2ocmRu68YfGa+eOEDs=;
 b=nlecDCuCfU6e01g6HEcpzdti5es1Wi+zbqmnjHjThClo2k4kHiN0S8+T
 Sy7FVWzN2ThHjTlzc05qWFP7ak6qyBLVLS84u0acB2WhgISScoX4i9jU7
 YM2hsTSBRqjYDCRjo71Q2HdpQDPlDV7EZ2boVvRrIXyx5Aut8729JKahs
 YZT4GL+wpRb6fZpqoJ8ZXuhSYy49JVbahYbs9OlPlfugl10TgoB3xuiI6
 8pTeMSP5RoLH0Ad7I1RH4uwOGC/xBUqn2OQVZpM95RRbdtZdUlq3BxidE
 wCAdy/xm6uNjlOPndxHl7ng8igrad059AmXuUkwCrOntUfnu5pdLJUfAS w==;
X-CSE-ConnectionGUID: 3BM36vsCRcWQpFbec75kKQ==
X-CSE-MsgGUID: qA0AeMNlSPWIrzPmgcjtQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47632726"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="47632726"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 03:16:44 -0800
X-CSE-ConnectionGUID: oVy8R8LTSBmwbrIBc6KpzA==
X-CSE-MsgGUID: OfoXdZJCTtqlVYF63h3Y1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="109715567"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 03:16:42 -0800
Date: Tue, 14 Jan 2025 12:16:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 tests/intel/xe_vm: Fixed documentation (rev2)
Message-ID: <20250114111623.3fuu57prbqtsxrwc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250109090044.913444-1-pravalika.gurram@intel.com>
 <173662098290.2539242.5379790398419825508@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173662098290.2539242.5379790398419825508@b555e5b46a47>
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
On 2025-01-11 at 18:43:02 -0000, Patchwork wrote:

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
> CI Bug Log - changes from XEIGT_8183_full -> XEIGTPW_12416_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12416_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12416_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12416_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +2 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8183/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12416/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][3] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12416/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
>     - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8183/shard-dg2-436/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12416/shard-dg2-463/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [DMESG-WARN][6] ([Intel XE#877]) -> [DMESG-WARN][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8183/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12416/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8183_full and XEIGTPW_12416_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_hdr@static-swap@pipe-a-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.98] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12416_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
>     - shard-lnl:          NOTRUN -> [FAIL][8] ([Intel XE#3719]) +3 other tests fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12416/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
> 

...cut...

>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8183 -> IGTPW_12416
> 
>   IGTPW_12416: c74a7c48547d6db3cb4a53019c21e9be90b9edc1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8183: b2dbc6f22815128c0dd5c737504f42e1f1a6ad62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b: 14e0c4a8247c9514dc57b2231602fb6d9455802b
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12416/index.html
