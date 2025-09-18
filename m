Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA802CAC59A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 13:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F3210E1CF;
	Thu, 18 Sep 2025 13:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWKpyTol";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE96410E1CF
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758203986; x=1789739986;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v1hKhagxJi/6U1Uc9k9CGDV7VqgnzGG16fsaprnpgYw=;
 b=UWKpyTolCL0z75dnPjAOUvNK2HZ2D+Vs2dnc9Ej1jZofGPurPbbFVwcr
 N35a49Tx1eUQrXOq5OtAeTXc2mYRnbVT/rO35lGFfSJtcECl9z4nhG1NL
 0Ab5WmTE2wE6duEm3xNbqzPBDGCmielDSrSJJui0OGZI0W9BXuwJHFsFW
 AEzIaWgWJI7veafi+5yU6GY+qBtS5sKgW4pttZyAZwQgwIkHEUwE7Ih6Q
 MVyg7hRHia06wi18+aBwUzMaGkxi/HnEE+55OfB4TU+BVGv/1stEJskYz
 qwwZG9MxQWbuQC35IwmsJEV9Ut9EuMDnzOdNpoWthzUIsysiA9aTZ/YpS w==;
X-CSE-ConnectionGUID: aS+zyPwbQhiLIksK4CPABw==
X-CSE-MsgGUID: nwsl76O5SKeMPNzGf7cukg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64337365"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64337365"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:59:45 -0700
X-CSE-ConnectionGUID: Kll2ah9TTzCRgOdSHqJ2xA==
X-CSE-MsgGUID: qcnFDdWtTr2eH0uxLG/gDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="174656339"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 06:59:43 -0700
Date: Thu, 18 Sep 2025 15:59:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 pravalika.gurram@intel.com, himal.prasad.ghimiray@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH v8 1/1] tests/intel/xe_exec_system_allocator: Add
 pat-index-madvise
Message-ID: <20250918135941.ojqfvsey656e7oxs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 pravalika.gurram@intel.com, himal.prasad.ghimiray@intel.com,
 kamil.konieczny@intel.com
References: <20250917171941.3025392-1-nishit.sharma@intel.com>
 <20250917171941.3025392-2-nishit.sharma@intel.com>
 <85ecs4kgup.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85ecs4kgup.wl-ashutosh.dixit@intel.com>
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

Hi Dixit,,
On 2025-09-17 at 12:40:30 -0700, Dixit, Ashutosh wrote:
> On Wed, 17 Sep 2025 10:19:41 -0700, <nishit.sharma@intel.com> wrote:
> >
> > +	for (const struct section *s = intel_get_pat_idx_functions; s->name; s++) {
> > +		igt_subtest_f("pat-index-%s", s->name) {
> > +			if ((strstr(s->name, "madvise-pat-idx-wt-") ||
> > +			     strstr(s->name, "madvise-pat-idx-uc-comp-")) &&
> > +			     !xe_has_vram(fd)) {
> > +				igt_skip("Skipping compression-related PAT index\n");
> > +			}
> > +			xe_for_each_engine(fd, hwe)
> > +				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
> 
> I think it is also possible to add a 'igt_require(xe_has_vram(fd))' in
> intel_get_pat_idx_wt() and intel_get_pat_idx_uc_comp(). But anyway, it's ok
> as is too, so this is:
> 
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 

You are right, there are other fails on -uc-, despite CI.Xe.Full
showing green, in mail body there is new test fail on LNL:

* {igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma} (NEW):
- shard-lnl:          NOTRUN -> [FAIL][1]
[1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13774/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

Nishit please extend this skip according to Ashutosh suggestion,
and use igt_require():
			if (strstr(s->name, "madvise-pat-idx-wt-") ||
			    strstr(s->name, "madvise-pat-idx-uc-"))
				igt_require(xe_has_vram(fd));

Regards,
Kamil

> >		}
> >	}
> >
> > --
> > 2.43.0
> >
