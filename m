Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A79C67861
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 17:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACB310E71F;
	Fri,  5 Apr 2024 17:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHIB56XW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11B710E71F
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 17:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712337493; x=1743873493;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xhkNWO7cGdQ+QTiqtcnslH49oomub0tR4nU1vn4gMZQ=;
 b=PHIB56XWGa5zWiOb3GD04ZFTv3irCTfqjyZ3ek7b9PQT1qjNHN3nkkFW
 2LwI10Nh3D8PGtSHDcCJ4f3m0MM3Ok5+CWqdGyKcIg3aP8H8tCCW+rFPe
 RjWF+yqwRuY2e3aLqlaHq/6Ef6I+IOh1RzwLLTlRDNCMP/OL9y/ZKZiCX
 ySO6FiM8qPQ7sAqSNTgFtyjIiYsMwgTTb7DaF6pyvZoeRUUB7r2oByzIe
 jJMpTI5BUi+19I113kbOVe4KGOg1VoPTUJAyWPv7EO/vg3fuEd2ULIB/l
 MjkogOStv0OQqhryhoi5Fu7YcBnTQaF0t+GdkwkHrcuRYXDIFaWcj/vSj A==;
X-CSE-ConnectionGUID: n42Ry7ZbS1mqN12mURwyaw==
X-CSE-MsgGUID: wxpKbkOGQeOnGwyISFZIlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7909607"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7909607"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 10:17:52 -0700
X-CSE-ConnectionGUID: wDnVglW5Qcyxc9EXy2Njxg==
X-CSE-MsgGUID: PMDTW3K3TH2l5MGB3ZkDkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19777429"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 10:17:50 -0700
Date: Fri, 5 Apr 2024 19:17:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Melanie Lobo <melanie.lobo@intel.com>, juha-pekka.heikkila@intel.com,
 vidya.srinivas@intel.com, swati2.sharma@intel.com,
 bhanuprakash.modem@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH 1/2] lib/intel_aux_pgtable: Library to add support for
 FP16 compressed formats
Message-ID: <20240405171733.tspiizgucjkc5kmo@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Melanie Lobo <melanie.lobo@intel.com>,
 juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 swati2.sharma@intel.com, bhanuprakash.modem@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
 <20240405102622.11666-1-melanie.lobo@intel.com>
 <20240405102622.11666-2-melanie.lobo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240405102622.11666-2-melanie.lobo@intel.com>
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

Hi Melanie,
On 2024-04-05 at 15:56:21 +0530, Melanie Lobo wrote:

one nit about subject:
[PATCH 1/2] lib/intel_aux_pgtable: Library to add support for FP16 compressed formats

This imho should be:
[PATCH 1/2] lib/intel_aux_pgtable: Add FP16 compressed XRGB format

> MTL supports FP16 format which is a binary floating-point computer
> number format that occupies 16 bits in computer memory. In this test
--------------------------------------------------------- ^^^^^^^^^^^^
> platform shall render compression in display engine to receive
> FP16 compressed formats.

Drop this sentence from this patch, here you are adding change to lib,
not a test. I would rather see here a format your are adding, write
that it is XRGB16161616_64B.

Regards,
Kamil

> 
> This was tested with kernel patch,
> https://patchwork.freedesktop.org/patch/563854
> 
> Test-with: 20231012062620.23886-1-melanie.lobo@intel.com
> 
> cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> cc: Swati Sharma <swati2.sharma@intel.com>
> 
> Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
> ---
>  lib/intel_aux_pgtable.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index 3cbb0e26f35c..1741c41af9a9 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -22,6 +22,7 @@
>  #define AUX_FORMAT_AYUV		0x09
>  #define AUX_FORMAT_ARGB_8B	0x0A
>  #define AUX_FORMAT_NV12_21	0x0F
> +#define AUX_FORMAT_XRGB16161616_64B 0x10
>  
>  struct pgtable_level_desc {
>  	int idx_shift;
> @@ -306,6 +307,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
>  			entry.e.format = AUX_FORMAT_ARGB_8B;
>  			entry.e.depth = bpp_to_depth_val(32);
>  			break;
> +		case 64:
> +			entry.e.format = AUX_FORMAT_XRGB16161616_64B;
> +			entry.e.depth = bpp_to_depth_val(64);
> +			break;
>  		default:
>  			igt_assert(0);
>  		}
> -- 
> 2.17.1
> 
