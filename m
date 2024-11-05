Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D599CD31761
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 16:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955BB10E41B;
	Tue,  5 Nov 2024 16:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Loncqn8i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B0210E5EF;
 Tue,  5 Nov 2024 16:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730824245; x=1762360245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mACVOhseIJ9IAGiYjko9h7dyDRiF2VGUDHrGq71OH9o=;
 b=Loncqn8i2JlUAoVWHmp0JCYO3uvKpRaFfrl3Ozgm7wJUqC6JZPMaG4ig
 BSHJOkH0DBcNN4GOHARLRKwF4cOIDGwdyXGTqw6nIrLN0T3CZBMYK9PMl
 r9a/I5OY08r6NY16XyjJgkdvLKoYU0Aggd2O8PO1A/eiCAgPxjnC0Ml12
 cmhJHjYidQfcnD9pARxJ7BJhrrBEacINJFDmbCE6/mx5PAELoYgyICSSl
 BB/HhpmU/a5qq3/wTgbLVec4nw9lFwZfEsesJP2SNH0r3QLzLfARFM5+v
 ao7i1lThGvV0xMzdELf28l57Gi1BwsZMmDZ7e8UVc70OKfe9wDaoDkNZv g==;
X-CSE-ConnectionGUID: TTYTsOS6RSCnidFHXlqpig==
X-CSE-MsgGUID: yXR1QuRUSx6wAPViFUwL+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30539121"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30539121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:30:45 -0800
X-CSE-ConnectionGUID: kPA/mIfbSTKxHs/70FDeEQ==
X-CSE-MsgGUID: bdsSr4G7QTuKKLCQcoOZEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84895495"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 08:30:45 -0800
Date: Tue, 5 Nov 2024 17:30:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeff Dagenais <jeff.dagenais@gmail.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_scripts=2Fgene?=
 =?utf-8?Q?rate=5Figa64=5Fcodes?= =?utf-8?Q?=3A?= prevent objcopy from
 modifying the input file
Message-ID: <20241105163041.oxrnvivf4cjyzwjs@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jeff Dagenais <jeff.dagenais@gmail.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241030184054.73065-1-jdagenais@tesla.com>
 <173070790861.1390508.5993238575932317076@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173070790861.1390508.5993238575932317076@2413ebb6fbb6>
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
On 2024-11-04 at 08:11:48 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: scripts/generate_iga64_codes: prevent objcopy from modifying the input file
> URL   : https://patchwork.freedesktop.org/series/140771/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8091_full -> XEIGTPW_12015_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12015_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12015_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12015_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_hdr@brightness-with-hdr@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/shard-dg2-466/igt@kms_hdr@brightness-with-hdr@pipe-a-dp-4.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-imm:
>     - shard-lnl:          [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-5/igt@xe_exec_fault_mode@once-userptr-imm.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/shard-lnl-2/igt@xe_exec_fault_mode@once-userptr-imm.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-lnl:          [PASS][6] -> [ABORT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-lnl-5/igt@xe_module_load@many-reload.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/shard-lnl-5/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   * igt@xe_vm@bind-array-enobufs:
>     - shard-dg2-set2:     [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/shard-dg2-466/igt@xe_vm@bind-array-enobufs.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/shard-dg2-464/igt@xe_vm@bind-array-enobufs.html
> 

These are unrelated to change in scripts.

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8091_full and XEIGTPW_12015_full:
> 
> ### New IGT tests (2) ###
> 
>   * igt@fbdev@pan:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.05] s
> 
>   * igt@kms_pm_lpsp@kms-lpsp@pipe-a-edp-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.18] s
> 

This definitly do not come from this patch.

Regards,
Kamil

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12015_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1466])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 

...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8091 -> IGTPW_12015
>   * Linux: xe-2149-54ceaf112b111612f3a7430132b2395fcce62414 -> xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932
> 
>   IGTPW_12015: 12015
>   IGT_8091: 8091
>   xe-2149-54ceaf112b111612f3a7430132b2395fcce62414: 54ceaf112b111612f3a7430132b2395fcce62414
>   xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932: 9c4962db90300e1d8daca8ed54195bc31d0ee932
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12015/index.html
