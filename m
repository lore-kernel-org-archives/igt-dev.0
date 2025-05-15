Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FE1C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 08:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C92010E7CC;
	Thu, 15 May 2025 08:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MPCYppod";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4944E10E7CC
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747299335; x=1778835335;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XjzduJLL1scKiK1ye2QHSNQcN90Q1vVxVwE8zRfq9bQ=;
 b=MPCYppodZHDfEbD90DBumDzYa1rrseYVA18naihGr7A5DZD4cZPfBIXK
 J3TtK+qCDdps+Ci8rT+rFudQ8Llfu+eIC19pZWIsTKVZafuDWwObqeM1g
 DhkVurgUcarapVi9l29TibOXl/hE+qcu88APNauL8bvhiFYO97ph3iSvs
 lLxqCuPaIgWGHFPAlI4BEimvuszOPytXz4vB7+dzPkn2MZTG7IFVA9yFn
 lSqrEL5TPtmmtR6v67txj5b7dAqreXlkYXgDndd1n9YXVEtx2NqacY4ll
 +OB495pZtX+neJ+oypdWDWewEF2FaUnc96n5WqTYDwpYenzvNYh6ank1U w==;
X-CSE-ConnectionGUID: gGiI1DdPQuSjBsm4hBBO4A==
X-CSE-MsgGUID: MKwXJ0t/RCKZaRLH3Dv4FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59878239"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="59878239"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:55:35 -0700
X-CSE-ConnectionGUID: Q3pS1S0KQbijJvecdjjM6g==
X-CSE-MsgGUID: G2I09elzSI2EgaBWWWCGMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138844858"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.87])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:55:29 -0700
Date: Thu, 15 May 2025 10:55:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 1/1] tests/intel/xe_render_copy: Skip tests on
 renderless cards
Message-ID: <obhwrhwzmfqvxffzp5nhre2cu5down63cwr2lz2oq5bgqilckj@bi7wbphge2hf>
References: <20250515071832.63953-1-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515071832.63953-1-jan.sokolowski@intel.com>
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

On Thu, May 15, 2025 at 07:18:32AM +0000, Jan Sokolowski wrote:
> As some cards (eg. PVC) don't have render,
> these tests will fail by definition.
> 
> Skip render tests on cards that don't have render.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
> 
> v2: made the check general instead of targetting only one card.
> 
> ---
>  tests/intel/xe_render_copy.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index fadfd162c..d420191d6 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -697,6 +697,10 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>  
>  	igt_fixture {
>  		xe = drm_open_driver(DRIVER_XE);
> +
> +		/* As some cards don't have render, we should skip these. */
> +		igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));

Ok, that's another good choice.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +
>  		bops = buf_ops_create(xe);
>  		srand(time(NULL));
>  		set = xe_get_memory_region_set(xe, DRM_XE_MEM_REGION_CLASS_SYSMEM);
> -- 
> 2.34.1
> 
