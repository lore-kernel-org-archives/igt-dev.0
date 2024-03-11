Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57705C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 15:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B02D112AFA;
	Mon, 11 Mar 2024 15:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aj5VPemT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9C4112AF1
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710169873; x=1741705873;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uC/EzNEjv0u3/z3X1ckI9WgQAxZcZEA6x+TSgCUYlo8=;
 b=aj5VPemToDuG/Su6vecxuS3L/j9YmA4Lm3iKAbZk1Sj82BbhzyAqrBYQ
 YPW8fOXxA6at6IIm++lAXqwra+e2by2dV3iLOhYq+GZsYcMejlF0uf9Hp
 AgW8ME4d7P9f+l/v1/Lf1wGiV6UNdnVaLdJnGrK6amQMv03JHOOgPog38
 mVuCBXmejrsJkZfJ9SZ7JHbCPTjj3ev7+4TMVcM+nyU2DARFvrGTlq5oI
 yOV3ufFNRaxa7v4CvtwSBT0s+rlmzOg+WkW/P8L/n3olzfvBYAmpFpduu
 hmldJE7fyLb/U4CQiWfILtFshzCtZCE7pSlPjAJrk6PRRN6p7ih6WV/hz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8654563"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8654563"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11111835"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 08:10:57 -0700
Date: Mon, 11 Mar 2024 16:10:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 09/25] tests/intel: Introduce FDinfo subcategory
Message-ID: <20240311151055.7vkmvsrdgw25kruw@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-10-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240308083657.1092049-10-katarzyna.piecielska@intel.com>
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
On 2024-03-08 at 08:36:41 +0000, Katarzyna Piecielska wrote:
> Let's introduce FDinfo subcategory.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/drm_fdinfo.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
> index 3ced658f2..65d942330 100644
> --- a/tests/intel/drm_fdinfo.c
> +++ b/tests/intel/drm_fdinfo.c
> @@ -37,6 +37,9 @@
>   * TEST: drm fdinfo
>   * Description: Test the i915 drm fdinfo data
>   * Feature: client_busyness
> + * Functionality: client_busyness
> + * Sub-category: FDinfo
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: all-busy-check-all
> -- 
> 2.34.1
> 
