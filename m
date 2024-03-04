Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325DFC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C82B10E88B;
	Mon,  4 Mar 2024 15:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="egBc0hsN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5C610E88B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565518; x=1741101518;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=67rb9H66h1AgQOxAp96ionNNRXgmcE6kU/aoCpRRaOg=;
 b=egBc0hsNeAbDEkTtMiPDRYBHnOxEqybdYvjziTe+NTMRKXbGSlynRVCc
 pAVQrRw1yvlr9ENnyAKfdF0kNv9PbLPQfv9oVbEx58pc/IoBtZ8oZRIYE
 VDJmhgo+3IoaD6fy8BbI+yL35MnSWqlYNTohHo/4H/eyU2/6Em/gdd2rq
 pyCjP3sGiY9zkL/KVBkCRGuQ/Keuuj/9kwwMNkqslSar0oXvD5kAJxvvP
 Ax+QYn6KbyYuZHs4FJIOj1UpmIM8BKx7P0plE3HZb5Nk6qEgsOo16094a
 YxMEXEl61yAecItA1s/guG0YkKsRv2Y2t4U8ftaw9+Jiuk1D+pT6OWrEG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="26529990"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="26529990"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:18:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8967738"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:18:36 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BA11A580960;
 Mon,  4 Mar 2024 07:18:34 -0800 (PST)
Date: Mon, 4 Mar 2024 16:18:31 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 13/24] tests/intel: Introduce Render copy subcategory
Message-ID: <20240304161831.29223674@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-14-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-14-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon,  4 Mar 2024 11:16:06 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's put render tests under Render copy subcategory.
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/gem_render_copy.c       | 3 +++
>  tests/intel/gem_render_copy_redux.c | 3 +++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
> index 57ca2c9ec..f97a3f3f9 100644
> --- a/tests/intel/gem_render_copy.c
> +++ b/tests/intel/gem_render_copy.c
> @@ -52,6 +52,9 @@
>   * TEST: gem render copy
>   * Description: Basic test for the render_copy() function.
>   * Feature: mapping
> + * Sub-category: Render copy
> + * Category: Desktop client
> + * Functionality: render copy

same here.

>   * Run type: FULL
>   *
>   * SUBTEST: linear
> diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render=
_copy_redux.c
> index 06777dd7f..b8e796109 100644
> --- a/tests/intel/gem_render_copy_redux.c
> +++ b/tests/intel/gem_render_copy_redux.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gem render copy redux
>   * Description: Advanced test for the render_copy() function.
> + * Sub-category: Render copy
> + * Category: Desktop client
> + * Functionality: render copy
>   * Run type: FULL
>   *
>   * SUBTEST: flink
