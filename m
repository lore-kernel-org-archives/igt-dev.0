Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37A0C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 17:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3A511A670;
	Thu, 25 Apr 2024 17:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdNh9Zc7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE43111A670
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714064862; x=1745600862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+b9/zFBB3i8xKNhKpFbNDNg/3nGody4/CI8/ItuQJo4=;
 b=PdNh9Zc7PI5OQB8ARv6qgroPmYVfg78eRGMDxrA6uthPweXs2DsPV7kH
 QQa0s66llUqkHXbcekkG2qmFCe4w5fZbJvgAn63tyl47Q2SOduFg0vZab
 f1d3Qbs1hmpJF3iiiQXpsOeolRq43LBvqCRAwrUF/XUZnPu/+vC001N9g
 alDuVGVi9425asF2uLUYXfe7R+tCI5SvJPsv2SNznf0tfZ2r6IB5JamJp
 hwQKzsGz0OtJXUoXkRCr+ADSHVBJiPpUcGlFeLpy9bOT5RDW/S1Fnjbz6
 987cgcrkRh7SbH/9uE5aCILN77nimo69it/pIA/PMt+DucTtKym0Y8Kqt g==;
X-CSE-ConnectionGUID: LHrOHDJ8RsG7jh7GZfkYxw==
X-CSE-MsgGUID: 9ZCyVvjVTS+EhwmhJp2MjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="32263811"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="32263811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 10:07:42 -0700
X-CSE-ConnectionGUID: Sdg3MMhoQ7WTDkNjD6CNYw==
X-CSE-MsgGUID: SspWLHSeSYyR3Eko9x6fZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56081719"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 10:07:40 -0700
Date: Thu, 25 Apr 2024 19:07:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: Re: [PATCH i-g-t v2 12/16] tests/intel: Introduce Render Mega feature
Message-ID: <20240425170737.apykaduvymqvbtop@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
 <20240423104913.3559587-13-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240423104913.3559587-13-katarzyna.piecielska@intel.com>
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
On 2024-04-23 at 10:49:09 +0000, Katarzyna Piecielska wrote:
> Add mega feature to Render tests.
> Group:
> 	SUBTEST
> 	Description
> 	Category
> 	Mega feature
> 	Sub-category
> 	Functionality
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>
> CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
> ---
>  tests/intel/gem_render_copy.c       | 5 +++--
>  tests/intel/gem_render_copy_redux.c | 3 ++-
>  tests/intel/xe_render_copy.c        | 1 +

There is conflict in render:

n.Functionality:../tests/intel/xe_render_copy.c: * Functionality: render
n.Mega.feature:../tests/intel/gem_render_copy.c: * Mega feature: Render

Regards,
Kamil

>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
> index 0b5a0ac4a..e9a82c465 100644
> --- a/tests/intel/gem_render_copy.c
> +++ b/tests/intel/gem_render_copy.c
> @@ -51,10 +51,11 @@
>  /**
>   * TEST: gem render copy
>   * Description: Basic test for the render_copy() function.
> - * Feature: mapping
> - * Sub-category: Render copy
>   * Category: Desktop client
> + * Mega feature: Render
> + * Sub-category: Render copy
>   * Functionality: render_copy
> + * Feature: mapping
>   *
>   * SUBTEST: linear
>   * Description: Test render_copy() from a mixed-tiled to a linear buffer.
> diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
> index 60366fd42..6dcd3145d 100644
> --- a/tests/intel/gem_render_copy_redux.c
> +++ b/tests/intel/gem_render_copy_redux.c
> @@ -51,8 +51,9 @@
>  /**
>   * TEST: gem render copy redux
>   * Description: Advanced test for the render_copy() function.
> - * Sub-category: Render copy
>   * Category: Desktop client
> + * Mega feature: Render
> + * Sub-category: Render copy
>   * Functionality: render_copy
>   *
>   * SUBTEST: flink
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index 4f98cb7df..184662a17 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -18,6 +18,7 @@
>  /**
>   * TEST: Copy memory using 3d engine
>   * Category: Software building block
> + * Mega feature: Render
>   * Sub-category: 3d
>   * Functionality: render
>   * Test category: functionality test
> -- 
> 2.34.1
> 
