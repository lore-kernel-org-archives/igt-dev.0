Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7E2C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6271112275;
	Mon,  4 Mar 2024 15:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKsf/dLL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692DE112275
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565418; x=1741101418;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dxJ6ThWrBIrcSL8bP1r9voZOPocYNT1Cz25pj732rRI=;
 b=dKsf/dLLMqWut66DDoIHlCpX1M4d0m3614MJwdg00TGeRgSZXMd26kWM
 TlqCCbbbcrnr0F4NCr6BUuio2wGLOkjl8VKEuKWeHiXiN3Zl5fJFMKSOc
 J/dbwOM9Eb8X5/2UebFclNbUhcruJxI58+bggHgJb5LNI3MXTe5dmrwYU
 eVZZwfSbf+aKyFkbEwksNjj2dtBSDqcdMDmcuB+Pq1etO7imyPjrnFpyv
 m7RT1lyyroC9hnr53yeVVKB6M7Q1Jm6wDq+b0pNGo6bbX/6BzKwAVO/sk
 yZ226vYC1jwJZzoqy4XGD6NtRILeDCF6QjVyfjxYq1VFRrHKwhWM0nhdG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4184769"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4184769"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:16:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9410802"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:16:56 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6339C5807E7;
 Mon,  4 Mar 2024 07:16:54 -0800 (PST)
Date: Mon, 4 Mar 2024 16:16:51 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 10/24] tests/intel: Introduce Flat-ccs subcategory
Message-ID: <20240304161651.2cc0f015@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-11-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-11-katarzyna.piecielska@intel.com>
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

On Mon,  4 Mar 2024 11:16:03 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's introduce flat-ccs subcategory.
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/gem_ccs.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index 3442ecfd3..e6257aeac 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -20,6 +20,9 @@
>   * TEST: gem ccs
>   * Description: Exercise gen12 blitter with and without flatccs compress=
ion
>   * Feature: flat_ccs_mapping
> + * Sub-category: Flat-ccs
> + * Category: Desktop \ Server
> + * Functionality: block-copy

LGTM.

A minor nitpick: on some places like "Desktop \ Server" you're using the
left/reverse backslash, while on others, you're using the right one.=20

I would standardize it to always use "/".

I guess this can be solved on a separate series. So, for this one:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

>   * Run type: FULL
>   *
>   * SUBTEST: block-copy-compressed
