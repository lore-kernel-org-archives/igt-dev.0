Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7514C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECFF10E805;
	Mon,  4 Mar 2024 15:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EH/7s6ov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE6811223F
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565273; x=1741101273;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JqTnNmO94zETB+Odj/cKEnNFgWBTcYebUraxARfZz3I=;
 b=EH/7s6ovcisrTD8+/HhElbKY3IoXAqPfoJ8V68J2098VnJqPuadNsdZD
 86EqT5bMCLaBDf4Qr7uehnNAZq+DvYC0bYI9+bMqISfhuA+BEToXtSOYO
 Y9h/kbYnBlA9dYBYJy4/rG0gd7w3jlIaETceUUDrw/CLDnEqU+SDCO3l5
 N9sEogeiKZqM0J5y/dx+KhoKCgkJWEJuvD3R5vv5iImtG42yhF5hS2dyn
 OeAryWcJSrsc2FL4ypYCoLIuE/820qljv2QalYpVj4vxNKAVyNUjXOPL+
 44/VPeVGBjWExOig7TjoEMG4KNb0064k4uQPgeFHA/v0G6uGOuFXhr0gW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15494910"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15494910"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:14:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="46535116"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:14:31 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C84D65807E7;
 Mon,  4 Mar 2024 07:14:29 -0800 (PST)
Date: Mon, 4 Mar 2024 16:14:26 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 09/24] tests/intel: Introduce FDinfo subcategory
Message-ID: <20240304161426.06c53380@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-10-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-10-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon,  4 Mar 2024 11:16:02 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's introduce FDinfo subcategory.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
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

Hmm Both feature and functionality are identical. Maybe you can just
drop feature here.

> + * Sub-category: FDinfo
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: all-busy-check-all
