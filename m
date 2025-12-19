Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5E1D74970
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 09:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B6E10EC89;
	Fri, 19 Dec 2025 09:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfCZh4UH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3B710EC89
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766137107; x=1797673107;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+fG02VbqD0CA21cmDY6//U2iycPetcbSYcl90ZKcRn0=;
 b=nfCZh4UH+62QPlve1TfZrlnZlRv5lhwT68giMUVE8aQphdmZeTwUbGXA
 c63H7BcMa4/AVZXM/sV0TZbS3nww7S9sVW5MtgqDRH9jgcbIhYGivNcxV
 kbyprOgJlOrBfT4WmaOu5dRBd4gj66sgPIMOafnrj+l3un+rFZpdENF5A
 HdHNp4xbktIO6nYtPktDwKgTenIQBamdfbp1qmvhEJgR4HSh5ueDd4LCQ
 1Z0K7MJdd8AHEC7QvpqXvC7b0lrc8qxgVcHQCOYWxByZlphzYNeCE4Rrt
 3npmxayd/U3RES2KWiZp4IIjxWWnwxBNu3B9YlhcLZ0PmmmDQJe712EFN A==;
X-CSE-ConnectionGUID: 6LXIG5/4SKyso3tOZC2DOw==
X-CSE-MsgGUID: B0hrGYhpSPizka/DzzCZFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67095542"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67095542"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 01:38:26 -0800
X-CSE-ConnectionGUID: Xttt3EpMTYq/dJuNPlPKWQ==
X-CSE-MsgGUID: mciSw4LOSdWUeMguYFdv2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199080815"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.203])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 01:38:24 -0800
Date: Fri, 19 Dec 2025 10:38:22 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Wang, X" <x.wang@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, igt-dev@lists.freedesktop.org, 
 alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com, 
 kamil.konieczny@intel.com, ravi.kumar.vodapalli@intel.com, 
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v6 1/2] lib/intel_pat: read Xe PAT config from debugfs
Message-ID: <nhddiyaknjfhybzec4jgenlztl6am3s5bojizjolk5qvvhzrdh@wcqh247atlry>
References: <20251217080732.266257-1-x.wang@intel.com>
 <20251217080732.266257-2-x.wang@intel.com>
 <20251217191535.GB1180203@mdroper-desk1.amr.corp.intel.com>
 <ec15d0f9-149b-45fb-b499-420d76f1f258@intel.com>
 <20251218222708.GM4164497@mdroper-desk1.amr.corp.intel.com>
 <14157c03-f8e5-4023-84ec-0edac1e67007@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14157c03-f8e5-4023-84ec-0edac1e67007@intel.com>
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

On Fri, Dec 19, 2025 at 12:18:00AM -0800, Wang, X wrote:

<cut>

> Thanks Matt — agreed that xe_device_get() should stay focused on ioctl-query
> state, and debugfs is a test-only backchannel that shouldn't become a hard
> dependency of generic device bring-up. The tricky part is that PAT is not
> only consumed directly by tests. There are multiple library call paths that
> end up calling intel_get_pat_idx_*() implicitly (e.g. VM bind defaults to
> intel_get_pat_idx_wb(fd) when callers pass DEFAULT_PAT_INDEX, and similar
> logic exists in other common helpers like bind/copy/blit/buf init). In those
> cases, a test author may not have a clear place to "prefetch PAT before
> dropping privileges," because the dependency is hidden behind the lib call
> chain. Because of that, we still need a library-level "ensure PAT"
> mechanism. Storing the parsed PAT table as per-fd state in struct xe_device
> provides a single, consistent cache for all library users (and avoids
> global/static caching, which is important for multi-GPU). So I think a
> pragmatic approach is to try to prefetch pat_sw_config into xe_dev when
> xe_device_get() is called. This makes PAT available before any privilege
> drop and before any indirect lib call path. If PAT is still missing when
> intel_get_pat_idx_*() is called, we can then igt_require_f() there since the
> caller truly depends on it.
> 
> Related lib call paths that can reach intel_get_pat_idx_*():
> 
> lib/igt_draw.c		igt_draw_rect() -> intel_get_pat_idx_uc(fd)
> lib/igt_fb.c		do_block_copy() -> intel_get_pat_idx_uc()
> 			igt_fb_create_intel_buf -> intel_get_pat_idx_uc()
> 			blitcopy() -> intel_get_pat_idx_uc()
> 			
> lib/intel_blt.c		blt_create_object() -> intel_get_pat_idx_uc_comp()
> 	     blt_surface_get_flatccs_data() -> intel_get_pat_idx_uc_comp()
> 
> lib/intel_bufops.c	intel_buf_init()
> 			intel_buf_init_in_region()
> 			intel_buf_init_using_handle_and_size()
> 					    -> intel_get_pat_idx_uc_comp()
> lib/xe/xe_util.c	xe_alloc_bind_ops() -> intel_get_pat_idx_wb()
> lib/xe/xe_ioctl.c	___xe_vm_bind() -> intel_get_pat_idx_wb()
> lib/xe/xe_legacy.c	xe_legacy_test_mode()->intel_get_pat_idx_uc_comp()

You can call intel_get_pat_idx_*() family from non-root account, only
what you need is a possibility to open drm fd. So getting device id
and then returning predefined entries (uc/wt/wb/uc_comp) allows non-root
to select necessary pat entry idx (pat tables are predefined and are not
subject of change from time to time). Most of blitter code above will
work even if you're not a root - with the exception of flatccs check
in intel_blt (it tries to access debugfs path for the answer).

So I think getting pat_sw_config() is nice addon which might be used
by the tests which verify it, but for most of tests it is not required.

--
Zbigniew

> 
> Xin
