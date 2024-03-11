Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9D6C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 13:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CB8112AA7;
	Mon, 11 Mar 2024 13:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JkH/AjE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F838112AA7
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710165594; x=1741701594;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NWPuKn8jh5IMZDvn3o7l5FsMl95H12ngPLGHe9qPQns=;
 b=JkH/AjE4XNW1fQPnsncLGEPEl37TIU36BEaNPtD5QIFo1n4orx5eKg9H
 4SCLq8z3bQUajlPPM8PuUix21s2FJ20Oo8Ae8o8Yx2eecYFewLNwnH/cl
 xF2T3j09S5ekLogNhgsLFAiJMs79DW1g5juzjnqzS0hlejoKfg/UN5Ytd
 RfeW2nZMv63sccp07ImuVbAjcakLGTBOa1PUCIv8JspdQ8ieV3Ea8/wGv
 C4KTmGk2NL+JUo80StvANSeMLX8Y1n5AeUOdIkr52NQhRcwv/OswAYImt
 FTAyG2BaUgyYuAl4uRBmHqHD6LN6Iq/exWIEeguIbTXrmlC012JyWbYHb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15389620"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15389620"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11168371"
Received: from unknown (HELO localhost) ([10.245.244.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:59:53 -0700
Date: Mon, 11 Mar 2024 14:59:50 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Andrzej Turko <andrzej.turko@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 12/25] tests/intel: Introduce Media subcategory
Message-ID: <20240311135950.svr5sqke2cjgh2l5@zkempczy-mobl2>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-13-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240308083657.1092049-13-katarzyna.piecielska@intel.com>
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

On Fri, Mar 08, 2024 at 08:36:44AM +0000, Katarzyna Piecielska wrote:
> Let's have media tests under Media subcategory.
> 
> v2: changing functionality to not break automation tools:
>  - igt@gem_media_fill@media-fill - s/media/fill media/
>  - igt@gem_media_vme - s/media/vme media block/
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Andrzej Turko <andrzej.turko@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_media_fill.c | 3 +++
>  tests/intel/gem_media_vme.c  | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
> index 79a06f7b8..f0ba797d9 100644
> --- a/tests/intel/gem_media_fill.c
> +++ b/tests/intel/gem_media_fill.c
> @@ -49,6 +49,9 @@
>   * TEST: gem media fill
>   * Description: Basic test for the media_fill() function, a very simple workload for the Media pipeline.
>   * Feature: media
> + * Sub-category: Media
> + * Category: Desktop client
> + * Functionality: fill media
>   * Run type: FULL
>   *
>   * SUBTEST: media-fill
> diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
> index 38ebd157d..ee1f020fc 100644
> --- a/tests/intel/gem_media_vme.c
> +++ b/tests/intel/gem_media_vme.c
> @@ -39,6 +39,9 @@
>   * TEST: gem media vme
>   * Description: A very simple workload for the VME media block.
>   * Feature: media
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
