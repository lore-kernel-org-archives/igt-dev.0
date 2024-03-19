Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E559C54E60
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 12:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B190410F987;
	Tue, 19 Mar 2024 12:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SL1jRKnb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6991610F987
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710852271; x=1742388271;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lRZmT71lM54/jm8aeTeFCjnOs8hLAgvNFoEE5qWA+Qc=;
 b=SL1jRKnbBzQ5QbsgUfnw0Xoh/GdGhiHjT2xLlBqF0/Xx8nkoEJApoN6Z
 HUCttPGo9JANK8O5HxynjrA54IXLTA39CooqncDwR79JwBlF6kWlXPQuA
 oy9Ws/laacXpvpTCnuRT04dbxzOb503rUWPeE3N9YMOmXxeS02SwW2zYU
 f1Agn2SO+jYsiWRwWJMJbCbRk0vXr1xVhcpExHA7fK3tMvxudzAFdqIVx
 Jbgu87SZw8keDRZf2ZaSED2WHuowkI/RZmxQgrfk1pvqVTmR/07D3WOum
 Y1GoxpIchbUUnX8puFJ1bS7wefbrJYC04U3y4qx+koHgXirk6UQWlqc+E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5568415"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5568415"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 05:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="14456702"
Received: from unknown (HELO localhost) ([10.245.246.227])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 05:44:29 -0700
Date: Tue, 19 Mar 2024 13:44:25 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Andrzej Turko <andrzej.turko@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 12/25] tests/intel: Introduce Media subcategory
Message-ID: <20240319124425.fiueobmkssjf6tnm@zkempczy-mobl2>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-13-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314143455.1436688-13-katarzyna.piecielska@intel.com>
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

On Thu, Mar 14, 2024 at 02:34:42PM +0000, Katarzyna Piecielska wrote:
> Let's have media tests under Media subcategory.
> 
> v2: changing functionality to not break automation tools:
>  - igt@gem_media_fill@media-fill - s/media/fill media/
>  - igt@gem_media_vme - s/media/vme media block/
> 
> v3: Make Sub-category/Functionality/Feature unique values. (Kamil)
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Andrzej Turko <andrzej.turko@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_media_fill.c | 5 ++++-
>  tests/intel/gem_media_vme.c  | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
> index 79a06f7b8..fcd90b70c 100644
> --- a/tests/intel/gem_media_fill.c
> +++ b/tests/intel/gem_media_fill.c
> @@ -48,7 +48,10 @@
>  /**
>   * TEST: gem media fill
>   * Description: Basic test for the media_fill() function, a very simple workload for the Media pipeline.
> - * Feature: media
> + * Feature: media feature
> + * Sub-category: Media
> + * Category: Desktop client
> + * Functionality: fill media
>   * Run type: FULL
>   *
>   * SUBTEST: media-fill
> diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
> index 38ebd157d..d6afca01e 100644
> --- a/tests/intel/gem_media_vme.c
> +++ b/tests/intel/gem_media_vme.c
> @@ -38,7 +38,10 @@
>  /**
>   * TEST: gem media vme
>   * Description: A very simple workload for the VME media block.
> - * Feature: media
> + * Feature: media feature
> + * Sub-category: Media
> + * Category: Desktop client
> + * Functionality: vme media block
>   * Run type: FULL
>   *
>   * SUBTEST:
> -- 
> 2.34.1
> 

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
