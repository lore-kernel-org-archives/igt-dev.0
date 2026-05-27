Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00787CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 16:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724D110E826;
	Wed, 27 May 2026 16:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrfiRHim";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF57210E26B
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 16:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779899106; x=1811435106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JuEgA8ZVAEk7yHYO0veGfo+SNm+1BhJuyLNYPx2XnjY=;
 b=XrfiRHimL8kEyAFM0b9CTu81D/bTl7Gn/FAg1jo/DdtaxUPPe5L2Qes4
 bDnRKDWfILhVGyIey2sHez7XsOEUkFpFrJ0Ket8CcT7SC84ocLeJSmyVo
 1TU0wEECEIQLdNV4hIdawY8VfULvic3hsKBgShhqHa9L0TCj1GiTNTJSM
 APaHVKE3YqEWpMlOgVs6zI9pmVCjd67GPaPrJqcjloxjqrBWfS2/LY/OT
 zdv/44mrJEeLy1HFlkfC4/hCcR1j3O8cFbjrq6OBdXc3kPSLopHFpfBvN
 zkoYjcQxVAtKFrh0vGcDQrT0SmEBd/E6mbqmlSuUErqRzb7ohfKetp6lh g==;
X-CSE-ConnectionGUID: GjS9Tyd9QhKUOYviqbAXgw==
X-CSE-MsgGUID: CpGyu5zuSE+cdVkGRZK6VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="83313854"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="83313854"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 09:25:05 -0700
X-CSE-ConnectionGUID: 8vHMFu6VSOqm79O3WsR5tA==
X-CSE-MsgGUID: 419siak9RTOGX1E2Aeem4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="235910516"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 09:25:04 -0700
Date: Wed, 27 May 2026 18:24:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org, jia.yao@intel.com, x.wang@intel.com
Subject: Re: [PATCH v2 0/3] tests/intel/xe_pat: dynamic PAT index selection
 for pat-index-auto
Message-ID: <20260527162447.pcxznssw25cgha3t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>, igt-dev@lists.freedesktop.org,
 jia.yao@intel.com, x.wang@intel.com
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
 <20260526223655.81924-1-zongyao.bai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526223655.81924-1-zongyao.bai@intel.com>
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

Hi Zongyao,
On 2026-05-26 at 22:36:51 +0000, Zongyao Bai wrote:

please use 'i-g-t' string after PATCH for all changes sent to
igt-dev mailing list, so for example this mail will look like:

[PATCH i-g-t v2 0/3] tests/intel/xe_pat: dynamic PAT index selection

Btw see CONTRIBUTING.md

Regards,
Kamil

> From Xe2 onwards, the PAT table has grown large enough that exhaustive
> testing of all index combinations is impractical. This series introduces
> a new pat-index-auto dynamic subtest that selects PAT indices from the
> hardware PAT software configuration at runtime, improving coverage across
> runs without hard-coding platform-specific tables.
> 
> Two cleanups are included first:
>   - Fix a copy-paste typo in a debug print statement.
>   - Remove a redundant srand() call in igt_fixture(); the IGT framework
>     already initialises the random seed via igt_srandom().
> 
> The main patch adds pat-index-auto, which builds a test mode set in two
> stages:
>   Mandatory entries: one representative WT, coherent, and non-coherent
>     entry, always included for baseline coverage.
>   Random entries: remaining valid PAT entries shuffled with Fisher-Yates
>     and appended up to the configured test count.
> 
> pat-index-auto is added to xe.fast-feedback.testlist.
> 
> v2:
>   - Fix pat index in xe2_blt_decompress_dst(): use pat_idx_wb instead of
>     pat_idx_uc for the alias destination compression disabled path.
>   - Replace TEST_MODE_CNT constant with explicit values: 5 in simulation
>     mode, 16 on real hardware approaching IGT_COLLECTION_MAXSIZE limit.
>     (suggested by Xin Wang)
> 
> Zongyao Bai (3):
>   tests/intel/xe_pat: fix typo in r2 wc debug print
>   tests/intel/xe_pat: drop redundant manual srand initialization
>   tests/intel/xe_pat: Add dynamic PAT index selection for pat-index-auto
> 
>  tests/intel-ci/xe.fast-feedback.testlist |   1 +
>  tests/intel/xe_pat.c                     | 168 +++++++++++++++++++++--
>  2 files changed, 160 insertions(+), 9 deletions(-)
> 
> -- 
> 2.43.0
> 
