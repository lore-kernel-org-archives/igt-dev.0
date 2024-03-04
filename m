Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B17C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC2C10E9E9;
	Mon,  4 Mar 2024 15:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThruHtO2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DE710E9E9
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709564857; x=1741100857;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CloTruWa2YMXYyK162CZ1Zt4nvv0VavQoNfUxrmVJ5s=;
 b=ThruHtO2LhEHM+tNhwmSj4sUNh00387bUHrttpqUMPjoZEpf+mB5pVPt
 CfH0VpYm173rPn3hHjui+weu+UiGAw5LMeldZtDJPW3yljzPoapxLW43F
 O6FSwcXfi/mwp9nLh7PgIJDKT0QblwajXnBfUUMAvYPKEZIMoNaN1jbnw
 t9K+tbG6r1Gv/VyqbWeL5O5ebW99FvaDkEamBsLk8BymUXSkMsKfk7Srw
 Q7QI6p2S/Zkmj3NP3K82fcHzbsOmm1rj1+SXA0a8RheG7LSKTOh+bVIwh
 ZEsYBz8y+R5NjEMBxQ3CcFt4t1M3vEMIB9cUpmU1GDoWidkQZbOia8uk5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3923540"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3923540"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9451168"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:07:35 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CE5B15807E7;
 Mon,  4 Mar 2024 07:07:33 -0800 (PST)
Date: Mon, 4 Mar 2024 16:07:30 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 07/24] tests/intel: Introduce GPGPU subcategory
Message-ID: <20240304160730.748fca13@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-8-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-8-katarzyna.piecielska@intel.com>
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

On Mon,  4 Mar 2024 11:16:00 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's introduce GPGPU subcategory.
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/gem_gpgpu_fill.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
> index ac283620e..535ac0cc8 100644
> --- a/tests/intel/gem_gpgpu_fill.c
> +++ b/tests/intel/gem_gpgpu_fill.c
> @@ -51,13 +51,13 @@
>  /**
>   * TEST: gem gpgpu fill
>   * Category: Server
> - * Functionality: command submission
> - * Run type: FULL
> - * Sub-category: Compute
> + * Functionality: gpgpu
> + * Sub-category: GPGPU

See my previous comments: gpgpu and GPGPU are named the same. This cause
troubles for some tools used internally, which are case-insensitive.

>   * Test category: GEM_Legacy
> + * Feature: compute
> + * Run type: FULL
>   *
>   * SUBTEST: basic
> - * Feature: compute
>   */
> =20
>  #define WIDTH 64
