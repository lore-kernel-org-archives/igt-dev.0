Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0522EC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 11:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D69E10E73B;
	Thu, 21 Mar 2024 11:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azF0bt7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB4610E73B
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 11:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711020305; x=1742556305;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x8a/oalYNW6cXMlbHLGjTt2wLJaAw6tUtdCGPfFd3xA=;
 b=azF0bt7/xb5VAAwuG6453s1ZvLTC+tGiLLIDeJqaZ66VCDcvJdP8OOud
 Pt4fhTbMk5UCzvV+M///PqmkQGhFBSqE72BAekDTM2C48CgiixnofWXRp
 b4S2r4G7kC8kvYdK13PUUYVgbCfJVugWMwdrEYywi2rGC9AmxOoj6JTR6
 UYjIggolSIcYoeH5IrOWu4uh7r2VPUPrlDXpizZrswzSrkBWA28JRImI+
 NCTXjjpGnHLOJ283fIDgEFY7GLjh28uaiwAF0dwVehl2ZT6zabLIgUmpt
 VxgNcSjz3ODdf3aCSEYXgdDtoMxBrqcx4elswDcQaeqDBnlEISpnwlOAV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6126360"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6126360"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:25:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14453777"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 04:25:02 -0700
Date: Thu, 21 Mar 2024 12:25:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH i-g-t v4 04/25] tests/intel: Introduce Caching subcategory
Message-ID: <20240321112500.bkanbaaq56kaxti7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-5-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314143455.1436688-5-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-03-14 at 14:34:34 +0000, Katarzyna Piecielska wrote:
> Let's have 'Caching' subcategory to show where we are testing cashing.
> 
> v2: Make Sub-category/Functionality/Feature unique
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/gem_caching.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
> index 4a8f69e97..963982e11 100644
> --- a/tests/intel/gem_caching.c
> +++ b/tests/intel/gem_caching.c
> @@ -44,10 +44,10 @@
>   * TEST: gem caching
>   * Category: Desktop client
>   * Description: Test snoop consistency when touching partial cachelines.
> - * Feature: caching
> - * Functionality: data coherency
> + * Feature: caching feature

There are other places where 'Feature: caching' needs to be changed:

gem_madvise.c: * Feature: caching, gtt, mapping
gem_madvise.c: * Feature: caching, mapping
gem_mmap_wc.c: * Feature: caching, mapping
gem_partial_pwrite_pread.c: * Feature: caching, mapping
gem_tiled_wb.c: * Feature: caching, gtt
gem_tiled_wc.c: * Feature: caching, gtt

Regards,
Kamil

> + * Functionality: coherency
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: Caching
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: read-writes
> -- 
> 2.34.1
> 
