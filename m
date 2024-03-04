Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CD0C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09A211224B;
	Mon,  4 Mar 2024 15:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJ4CrukZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E59C11224B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709564588; x=1741100588;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MaHbnLzjE9zzdnLKRMfdyEh8btcx94ufi3jsUGFVNIM=;
 b=gJ4CrukZxAuZXnqippYTE+Fio2pDIDkXteBL8l2TM1WYEoA/Bfj8Htc8
 MC0MUG5MK4ij+zC0Epb4I0GScWY/j11O9Y1KVWChrP3eOHn8S08HDOpWq
 18iwAhP6AE6C1aF5kcxLhnd5zq0MlRjKq4s17Zo347l61o2xxgOR6qy4j
 f8kQNJ8DctcpnkxDUuoycMhEOk984PnpEiODILdDpYGPgOgXh2YuMAnpr
 a1Q1LYR5ZCt7wto0k9NXdIaPcNNuyzRJ5tFeKCiZlN6ER/LWVP/3tfEv1
 u4OrvFlVSA8EKUaR4eXzEIc6PRyQ6gxB0QlLJMPJPXxrJivsTvgbjNooi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4224744"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4224744"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8934373"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:03:07 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EE826580960;
 Mon,  4 Mar 2024 07:03:04 -0800 (PST)
Date: Mon, 4 Mar 2024 16:03:02 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>, Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 03/24] tests/intel: Introduce Fences subcategory
Message-ID: <20240304160302.6d14b78a@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-4-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-4-katarzyna.piecielska@intel.com>
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

On Mon,  4 Mar 2024 11:15:56 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's introduce 'Fences' subcategory to allow better alignment between i9=
15
> and XE.
>=20

You added already a bucket at Functionality level also called "fences".

While this works fine for igt_doc tools, it is confusing for people to
have the same name meaning different things. Also, some Intel CI tools
don't allow two buckets with the same name. So, please either change the
term on patch 2 or here.

Regards,
Mauro

> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/gem_fence_thrash.c       |  3 +++
>  tests/intel/gem_fence_upload.c       |  3 +++
>  tests/intel/gem_fenced_exec_thrash.c |  3 +++
>  tests/intel/gem_vm_create.c          | 10 ++++------
>  tests/intel/prime_busy.c             |  2 +-
>  5 files changed, 14 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thras=
h.c
> index 4cb3d842b..0c9be92df 100644
> --- a/tests/intel/gem_fence_thrash.c
> +++ b/tests/intel/gem_fence_thrash.c
> @@ -46,6 +46,9 @@
>  /**
>   * TEST: gem fence thrash
>   * Feature: gtt, synchronization
> + * Sub-category: Fences
> + * Category: Desktop client
> + * Functionality: synchronization
>   * Run type: FULL
>   *
>   * SUBTEST: bo-copy
> diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_uploa=
d.c
> index b239c0e78..074908d81 100644
> --- a/tests/intel/gem_fence_upload.c
> +++ b/tests/intel/gem_fence_upload.c
> @@ -43,6 +43,9 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem fence upload
> + * Sub-category: Fences
> + * Category: Desktop client
> + * Functionality: synchronization
>   * Run type: FULL
>   *
>   * SUBTEST: performance
> diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fence=
d_exec_thrash.c
> index 098f22ef4..b26eb7780 100644
> --- a/tests/intel/gem_fenced_exec_thrash.c
> +++ b/tests/intel/gem_fenced_exec_thrash.c
> @@ -37,6 +37,9 @@
>   * TEST: gem fenced exec thrash
>   * Description: Test execbuf fence accounting.
>   * Feature: gtt, synchronization
> + * Sub-category: Fences
> + * Category: Desktop client
> + * Functionality: synchronization
>   * Run type: FULL
>   *
>   * SUBTEST: 2-spare-fences
> diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
> index 8834c987f..d3d03eb73 100644
> --- a/tests/intel/gem_vm_create.c
> +++ b/tests/intel/gem_vm_create.c
> @@ -30,22 +30,20 @@
>  /**
>   * TEST: gem vm create
>   * Category: Server
> - * Functionality: context management
> - * Run type: FULL
> - * Sub-category: Compute
> + * Functionality: compute
> + * Sub-category: Context
> + * Feature: mapping
>   * Test category: GEM_Legacy
> + * Run type: FULL
>   *
>   * SUBTEST: create-ext
> - * Feature: mapping
>   *
>   * SUBTEST: execbuf
>   * Feature: cmd_submission, mapping
>   *
>   * SUBTEST: invalid-create
> - * Feature: mapping
>   *
>   * SUBTEST: invalid-destroy
> - * Feature: mapping
>   *
>   * SUBTEST: isolation
>   * Feature: context, mapping
> diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
> index 90d79864f..a4edb0e0a 100644
> --- a/tests/intel/prime_busy.c
> +++ b/tests/intel/prime_busy.c
> @@ -33,7 +33,7 @@
>   * Feature: prime
>   * Functionality: buffer management
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Fences
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: after
