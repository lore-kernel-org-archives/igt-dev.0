Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D35C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237ED11227B;
	Mon,  4 Mar 2024 15:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FG6Gnxlg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C250B11227B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565493; x=1741101493;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h2WA4JutyxVpm5UDsi8jyKRkZ5zLwqzX4mu7avgp6oA=;
 b=FG6GnxlgnStdeRbTn18pWEsNDYt5cWQ9o38VuiKKdgc6v0PzEM8iyx2Q
 l7jvVNYuMmbcMtQgJHiUQUq7KHrPCi4ypS4aDUvYyJjBRyPSmHrlvy3yU
 V1DjElkh4rPREdgut1qaJCb+eKOpOQQRlIONAFupRyWFfqs1T9HOoemzT
 /fmmQcMzuy5IHhFQN/pmJJAyoO26iPlPnPZ/zJmIL+NAOWa+OXNOeY4BZ
 uguzXTN5y+gIdCPbI0uNIBKCUVyCY0lBtCnYZwmT3T61WDqFIhHG2LujF
 AIROz1O51NJz/l+/4Bj2300sme0EOQR9V1Yv0YriPl6fK70KhbfM0mUFz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="21599410"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="21599410"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:18:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8973382"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:18:13 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id F216F5807E7;
 Mon,  4 Mar 2024 07:18:10 -0800 (PST)
Date: Mon, 4 Mar 2024 16:18:08 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?=
 <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 12/24] tests/intel: Introduce Media subcategory
Message-ID: <20240304161746.1c9dd9f4@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-13-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-13-katarzyna.piecielska@intel.com>
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

On Mon,  4 Mar 2024 11:16:05 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's have media tests under Media subcategory.
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Andrzej Turko <andrzej.turko@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_media_fill.c | 3 +++
>  tests/intel/gem_media_vme.c  | 3 +++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
> index 79a06f7b8..65b53a6e0 100644
> --- a/tests/intel/gem_media_fill.c
> +++ b/tests/intel/gem_media_fill.c
> @@ -49,6 +49,9 @@
>   * TEST: gem media fill
>   * Description: Basic test for the media_fill() function, a very simple =
workload for the Media pipeline.
>   * Feature: media
> + * Sub-category: Media
> + * Category: Desktop client
> + * Functionality: fill surface with media block
>   * Run type: FULL
>   *
>   * SUBTEST: media-fill
> diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
> index 38ebd157d..d58c990f7 100644
> --- a/tests/intel/gem_media_vme.c
> +++ b/tests/intel/gem_media_vme.c
> @@ -39,6 +39,9 @@
>   * TEST: gem media vme
>   * Description: A very simple workload for the VME media block.
>   * Feature: media
> + * Sub-category: Media
> + * Category: Desktop client
> + * Functionality: media

Same here.

>   * Run type: FULL
>   *
>   * SUBTEST:
