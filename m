Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD98C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152011226C;
	Mon,  4 Mar 2024 15:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYPo2Rb7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4374011226C
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565205; x=1741101205;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ejGX5Uq38pQNra48XbdKch1qCEuZxNo2z/0UzOoWvv4=;
 b=NYPo2Rb7fs2EhzrIhhNlrfK4hlk76th3m10LkBq2RnnkarI0INVh6GIL
 gLXN6ECLhZWQL/qf6iBreNujoxdM4U27Ykw1R74srOmYXFLiUSqQhgnFy
 EJXnjM9KTgJKszGagZhzDn77z1ycJOCr4sYUDn334aqVeK5FSnqtbXYio
 OhR+5XYFghFkNRtxS9SHZkyFr+YmNLUpNjfsfz0I7oUlHAcj8QyDQR2Zc
 rU0blr7QWhntdzTP/ELUOz0ee+Pca4eschwKUgTQUDURBC41ZqqE+3qwt
 nvp7t8zVVTrwfWzPZ+CpOE9ETdU76Vdcz7W+Rf/foc/Mx0jBaHfnDfA6Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7873001"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7873001"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:13:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13688512"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:13:23 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A6D12580960;
 Mon,  4 Mar 2024 07:13:20 -0800 (PST)
Date: Mon, 4 Mar 2024 16:13:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?=
 <zbigniew.kempczynski@intel.com>, Karolina Stolarek
 <karolina.stolarek@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 08/24] tests/intel: Introduce Blitter subcategory
Message-ID: <20240304161317.4acc2076@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-9-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-9-katarzyna.piecielska@intel.com>
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

On Mon,  4 Mar 2024 11:16:01 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's introduce Blitter subcategory.

Same here: blitter is used on two different hierarchical levels.

>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/gem_exercise_blt.c      | 14 +++++++-------
>  tests/intel/gem_set_tiling_vs_blt.c |  3 +++
>  tests/intel/gen9_exec_parse.c       |  3 +++
>  3 files changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_bl=
t.c
> index 4a9bc3729..f8fc689ff 100644
> --- a/tests/intel/gem_exercise_blt.c
> +++ b/tests/intel/gem_exercise_blt.c
> @@ -14,18 +14,18 @@
>   * TEST: gem exercise blt
>   * Description: Exercise blitter commands
>   * Feature: blitter
> - * Run type: FULL
> + * Sub-category: Blitter
> + * Category: Desktop client
> + * Functionality: blitter
>   * Test category: GEM_Legacy
> + * Run type: FULL
>   *
>   * SUBTEST: fast-copy
> - * Description:
> - *   Check fast-copy blit
> - *   blitter
> + * Description: Check fast-copy blit blitter
>   *
>   * SUBTEST: fast-copy-emit
> - * Description:
> - *   Check multiple fast-copy in one batch
> - *   blitter
> + * Description: Check multiple fast-copy in one batch blitter
> + *
>   */
> =20
>  IGT_TEST_DESCRIPTION("Exercise blitter commands");
> diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_ti=
ling_vs_blt.c
> index 9077e0f3f..28469f5f3 100644
> --- a/tests/intel/gem_set_tiling_vs_blt.c
> +++ b/tests/intel/gem_set_tiling_vs_blt.c
> @@ -61,6 +61,9 @@
>   * TEST: gem set tiling vs blt
>   * Description: Check for proper synchronization of tiling changes vs. t=
iled gpu access.
>   * Feature: blitter, gtt
> + * Functionality: tiling
> + * Sub-category: Blitter
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: tiled-to-tiled
> diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
> index 33ff6bcb5..509a2e80f 100644
> --- a/tests/intel/gen9_exec_parse.c
> +++ b/tests/intel/gen9_exec_parse.c
> @@ -36,6 +36,9 @@
>  /**
>   * TEST: gen9 exec parse
>   * Feature: blitter, command_parser
> + * Sub-category: Blitter
> + * Functionality: command_parser
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: allowed-all
