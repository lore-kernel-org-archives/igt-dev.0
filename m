Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2ABC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 12:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E7610E00A;
	Fri,  7 Jun 2024 12:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwJDmp+T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED0710E00A
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 12:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717762919; x=1749298919;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AR7ZrKjw2UZtptP+g1N2wqS3pLDiijyP77IquYwOCaQ=;
 b=VwJDmp+Tt9A+Mvduwb/cN3vWhtxpqj/bmonEyb4cVmrfCO20CiC7vhij
 pEIKt4LOa2DHaZVzPcXVKq/+zMYwRe0KwIyHfcFVDgQaYbrad3rArkFDc
 /nDCbvKO5FUiOymAWf1PyUfjr0cHs5qvuy4Rry3xXoYkEp7RdOCDO1tNv
 Sk5xFHwMyDTRvocHBy4AZpAH72K91GIi0QUQGz0YdsyBIO/qaDoMuRot+
 Mw+Idorrtsu5fAoZPjc1u6teJZiPbXanZiAdW4EP4tyFLgnIc6Vfubcod
 u0lTRGGQBYJ95rQu7zaHaxXtvxrOSwdvFtuK2h5tEciNavBkWlZwwbrj8 g==;
X-CSE-ConnectionGUID: 6uhHMEhvS+WU4UzkYScDwA==
X-CSE-MsgGUID: Dm0fB+ctRaOVyd3OBBKG5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25108060"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25108060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:21:59 -0700
X-CSE-ConnectionGUID: s4rZHFrETp6UIsDFtJhpHw==
X-CSE-MsgGUID: NUyEV6wkT0iw8yfBJJt3yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38759848"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:21:57 -0700
Date: Fri, 7 Jun 2024 14:21:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Melanie Lobo <melanie.lobo@intel.com>, vidya.srinivas@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH 1/2] lib/intel_aux_pgtable: Library to add support for
 RGB16161616_64B format
Message-ID: <20240607122153.q7zjk4nqeyyjnxio@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Melanie Lobo <melanie.lobo@intel.com>, vidya.srinivas@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20240606121523.5347-1-melanie.lobo@intel.com>
 <20240606121523.5347-2-melanie.lobo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240606121523.5347-2-melanie.lobo@intel.com>
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
On 2024-06-06 at 17:45:22 +0530, Melanie Lobo wrote:
> MTL supports RGB16161616_64B FP16 format which is a binary
> floating-point computer number format that occupies 16 bits
> in computer memory.
> 
> This was tested with kernel patch,
> https://patchwork.freedesktop.org/series/124957/
> https://lore.kernel.org/all/20240605055819.9510-1-melanie.lobo@intel.com/
> 
> cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
> ---
>  lib/intel_aux_pgtable.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index 3cbb0e26f35c..87df50e71bbd 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -22,6 +22,7 @@
>  #define AUX_FORMAT_AYUV		0x09
>  #define AUX_FORMAT_ARGB_8B	0x0A
>  #define AUX_FORMAT_NV12_21	0x0F
> +#define AUX_FORMAT_RGBA16_FLOAT        0x1
--------------------------------- ^^^^^^^^
There are some unprintable chars, please change that into tab/spaces
also check compilation locally before sending:

../lib/intel_aux_pgtable.c:25:9: warning: ISO C99 requires whitespace after the macro name
   25 | #define AUX_FORMAT_RGBA16_FLOAT        0x1
      |         ^~~~~~~~~~~~~~~~~~~~~~~

and later:
../lib/intel_aux_pgtable.c: In function 'pgt_get_l1_flags':
../lib/intel_aux_pgtable.c:25:32: error: stray '\302' in program

Regards,
Kamil

>  
>  struct pgtable_level_desc {
>  	int idx_shift;
> @@ -306,6 +307,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
>  			entry.e.format = AUX_FORMAT_ARGB_8B;
>  			entry.e.depth = bpp_to_depth_val(32);
>  			break;
> +		case 64:
> +			entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
> +			entry.e.depth = bpp_to_depth_val(64);
> +			break;
>  		default:
>  			igt_assert(0);
>  		}
> -- 
> 2.17.1
> 
