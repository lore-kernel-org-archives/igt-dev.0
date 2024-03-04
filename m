Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122DDC5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7153F88647;
	Mon,  4 Mar 2024 15:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4hmstDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C012112298
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565814; x=1741101814;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hK3FlSaBUPxAApesT6nZwdozcSKaRd4c+Nt0JPwHUHo=;
 b=P4hmstDs9WN+GcBj+lxuHeW5ELblsxD2RpGQZ47G+x0Sa9kyrGagmeIP
 rlOiGCJKeQSqWJfkXCgj3yMpa2l0FNn0VXyCscQvyZiMuK4p1e0dSk2kU
 /ghEmUbEL/NoYmo3DL1fjAT1opZW8JtnDKjWJhYHczcQcsZXDOpUobtA0
 X380nDgGBXHmtuJ0uwZXLn7Dy9UjiboKEb00KPP7uxt42tOpdT7tjnR6y
 tOMq7ZTj++usBLh9KrsqROd1FCvUY+q7O//D/lOdeqVs53rsntn48Khyr
 C+Ms22M88nlM/pUASau40ZypnFuPBLw3DfmTVpa990iuo1j6MWeJCxTst g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3986940"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3986940"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:23:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13589787"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:23:32 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C4936580DA0;
 Mon,  4 Mar 2024 07:23:29 -0800 (PST)
Date: Mon, 4 Mar 2024 16:23:26 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 19/24] tests: Introduce intel-nouveau subcategory
Message-ID: <20240304162326.05e75cd9@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-20-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-20-katarzyna.piecielska@intel.com>
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

On Mon,  4 Mar 2024 11:16:12 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> There are some intel-nouveau tests that deserve its own subcategory.

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> ---
>  tests/prime_nv_api.c   | 22 ++++++++++++++++++++++
>  tests/prime_nv_pcopy.c | 18 ++++++++++++++++++
>  tests/prime_nv_test.c  | 17 +++++++++++++++++
>  3 files changed, 57 insertions(+)
>=20
> diff --git a/tests/prime_nv_api.c b/tests/prime_nv_api.c
> index cb3d52e8d..a33e2202b 100644
> --- a/tests/prime_nv_api.c
> +++ b/tests/prime_nv_api.c
> @@ -8,6 +8,28 @@
>     test4 - export handle twice from intel, import into nouveau twice, ch=
eck handle is the same
>  */
> =20
> +/**
> + * TEST: prime_nv_api
> + * Description: Basic api tests between intel and nouveau
> + * Sub-category: uapi
> + * Functionality: intel-nouveau
> + * Run type: FULL
> + *
> + * SUBTEST: i915_nv_import_twice
> + * SUBTEST: i915_nv_import_twice_check_flink_name
> + * SUBTEST: i915_nv_reimport_twice_check_flink_name
> + * SUBTEST: nv_i915_import_twice_check_flink_name
> + * SUBTEST: nv_i915_reimport_twice_check_flink_name
> + * SUBTEST: i915_nv_import_vs_close
> + * SUBTEST: i915_nv_double_import
> + * SUBTEST: i915_nv_double_export
> + * SUBTEST: i915_self_import
> + * SUBTEST: nv_self_import
> + * SUBTEST: i915_self_import_to_different_fd
> + * SUBTEST: nv_self_import_to_different_fd
> + *
> + */
> +
>  #include "igt.h"
>  #include <stdio.h>
>  #include <stdlib.h>
> diff --git a/tests/prime_nv_pcopy.c b/tests/prime_nv_pcopy.c
> index 5b2a89d80..ecaa9fb1b 100644
> --- a/tests/prime_nv_pcopy.c
> +++ b/tests/prime_nv_pcopy.c
> @@ -13,6 +13,24 @@
>     TODO add some nouveau rendering tests
>  */
> =20
> +/**
> + * TEST: prime_nv_pcopy
> + * Description: Basic set of prime tests between intel and nouveau
> + * Sub-category: intel-nouveau
> + * Functionality: buffer management
> + * Run type: FULL
> + *
> + * SUBTEST: test1_macro
> + * SUBTEST: test1_micro
> + * SUBTEST: test2
> + * SUBTEST: test3_1
> + * SUBTEST: test3_2
> + * SUBTEST: test3_3
> + * SUBTEST: test3_4
> + * SUBTEST: test3_5
> + * SUBTEST: test_semaphore
> + *
> + */
> =20
>  #include "igt.h"
>  #include <inttypes.h>
> diff --git a/tests/prime_nv_test.c b/tests/prime_nv_test.c
> index eb5e2d8ea..be9e56414 100644
> --- a/tests/prime_nv_test.c
> +++ b/tests/prime_nv_test.c
> @@ -13,6 +13,23 @@
>     TODO add some nouveau rendering tests
>  */
> =20
> +/**
> + * TEST: prime_nv_test
> + * Description: Basic set of prime tests between intel and nouveau
> + * Sub-category: intel-nouveau
> + * Functionality: buffer management
> + * Run type: FULL
> + *
> + * SUBTEST: i915_nv_sharing
> + * SUBTEST: nv_i915_sharing
> + * SUBTEST: nv_write_i915_cpu_mmap_read
> + * SUBTEST: nv_write_i915_gtt_mmap_read
> + * SUBTEST: i915_import_cpu_mmap
> + * SUBTEST: i915_import_gtt_mmap
> + * SUBTEST: i915_import_pread_pwrite
> + * SUBTEST: i915_blt_fill_nv_read
> + *
> + */
> =20
>  #include "igt.h"
>  #include <stdio.h>
