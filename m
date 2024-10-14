Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7575D1627E
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 14:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8887610E466;
	Mon, 14 Oct 2024 14:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjzUzKFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC210E190;
 Mon, 14 Oct 2024 14:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728917091; x=1760453091;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1LyhDaZFxoH6l3CzIeyIVfpYrlcWt/dL6iET358vnRQ=;
 b=PjzUzKFfZXNtmOuLY2r1V6A7f59WT4+0z1HpgzWYK6SvrxMMZ2zMvHVS
 vK2/XG5gb5yD+Qnebn1wnYY3cGz7DFf7uP7Igs4u8AlLWPRYr7CjiTXUR
 kXqC4qQrImj/878fa9CkB0PDs5P8nkxq7xXTOJE5zYSv3GtYGpVsYC0jT
 12sm98rERuYEDuGFWSUcQz82u6QpfRW4kNnP9awSak9m5MyLs2uAcXyc7
 tlidstMUNgrlEjEFA6Zz/x5ELiO+mrO79tJPJPAT5ZJ4N+0eq/zB9CGqi
 xFSDfm98UiWqzWkqWhI7VEyoCRkYSmHe/gDPjBRM2DD0IyvcQMdRh/YTR Q==;
X-CSE-ConnectionGUID: j0tp92quQG+9sOhIO7dlWw==
X-CSE-MsgGUID: atG0HwDLSLO5O45zYYkHWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38822488"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="38822488"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 07:44:51 -0700
X-CSE-ConnectionGUID: sfedTUBOTdqLpiRO5YnGBQ==
X-CSE-MsgGUID: IclIzJ+4Qbycvg2JQ5Jfiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="108329113"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 07:44:50 -0700
Date: Mon, 14 Oct 2024 16:44:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 lib/gem_mman: Stop lying about I915_MMAP_OFFSET_GTT support
Message-ID: <20241014144447.nj75qilphwpyz5o7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241010135023.275507-2-janusz.krzysztofik@linux.intel.com>
 <172870546544.1243112.9070458413069745151@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172870546544.1243112.9070458413069745151@2413ebb6fbb6>
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
On 2024-10-12 at 03:57:45 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/gem_mman: Stop lying about I915_MMAP_OFFSET_GTT support
> URL   : https://patchwork.freedesktop.org/series/139847/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8065_full -> IGTPW_11898_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11898_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11898_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11898/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11898_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_balancer@nop:
>     - shard-mtlp:         NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11898/shard-mtlp-1/igt@gem_exec_balancer@nop.html

Test succeeds but there is warning in dmesg:
<7> [423.878047] i915 0000:00:02.0: [drm:skl_enable_dc6 [i915]] Enabling DC6
<7> [423.878154] i915 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [i915]] Setting DC state from 00 to 02
<3> [442.629081] i915 0000:00:02.0: [drm] *ERROR* GT1: GUC: TLB invalidation response timed out for seqno 80985

> 
>   * igt@gem_exec_create@forked@smem:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][2] +1 other test incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11898/shard-dg2-11/igt@gem_exec_create@forked@smem.html
> 
>   * igt@gem_exec_gttfill@engines@vcs1:
>     - shard-dg2:          [PASS][3] -> [DMESG-FAIL][4] +1 other test dmesg-fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8065/shard-dg2-4/igt@gem_exec_gttfill@engines@vcs1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11898/shard-dg2-6/igt@gem_exec_gttfill@engines@vcs1.html
> 

These are unrelated, change couldn't cause dmesg warns.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8065_full and IGTPW_11898_full:
> 
...cut...
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11898/index.html
