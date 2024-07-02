Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7BFC30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 22:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C54710E4A1;
	Tue,  2 Jul 2024 22:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CM/92j6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAED10E4A1
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 22:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719961020; x=1751497020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XXKBxYRLj8SkhcMmZrf+m1gjVm/FEXVwzmPTQNzdIt4=;
 b=CM/92j6Y8tObRSwwyQhpc4GeH11rOVzldC2ToDDYf7nfbMr6ZoGdAikq
 zTyq3Y9BDNXLFvWG3Skx01htU1umRWWuoD6FrJrbc9eVvqS8OruehABah
 4icmi72RpvrBR4XXiiEjJRQq73KDB57ixNIRfcLBYr+SzvoRxjQUN2490
 k85WKSk2wJQqKEJ/az6A7kxOUPBBGrZj1vLHwNl2wC20nJPKExGozPZaU
 QUHRJvVbjVfiEZA+CN2aY/MV6VCK0g2Rc8evQV8hEYz7CQNvlEhEx4jgr
 sNcWH2EhLSNS2CiBafYIwjz1kFQYzuyy8tscgYEGtF0fA0t+9ixUadVFd w==;
X-CSE-ConnectionGUID: x4SZakCGT52MIbabYVnpcQ==
X-CSE-MsgGUID: C0THmalxQYutdVHwGpbEWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17041517"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="17041517"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 15:56:59 -0700
X-CSE-ConnectionGUID: LE93Zqf/QcGLKgIS+eHcYw==
X-CSE-MsgGUID: Kf23378/TAW4l94dlzsExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46039766"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 15:56:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 01:56:55 +0300
Date: Wed, 3 Jul 2024 01:56:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Melanie Lobo <melanie.lobo@intel.com>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com,
 vidya.srinivas@intel.com, ville.syrjala@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH 1/2] lib/intel_aux_pgtable: Library to add support for
 RGB16161616_64B format
Message-ID: <ZoSFtySp9RFtIH4O@intel.com>
References: <20240624144818.216349-1-melanie.lobo@intel.com>
 <20240624144818.216349-2-melanie.lobo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624144818.216349-2-melanie.lobo@intel.com>
X-Patchwork-Hint: comment
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

On Mon, Jun 24, 2024 at 08:18:17PM +0530, Melanie Lobo wrote:
> MTL supports RGB16161616_64B FP16 format which is a binary

It's supportes on TGL+.

> floating-point computer number format that occupies 16 bits
> in computer memory.
> 
> This was tested with kernel patch,
> https://patchwork.freedesktop.org/series/124957/
> https://lore.kernel.org/all/20231201091133.23508-1-melanie.lobo@intel.com/
> 
> cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> cc: Swati Sharma <swati2.sharma@intel.com>
> cc: Ville Syrjala <ville.syrjala@intel.com>
> Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
> ---
>  lib/intel_aux_pgtable.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index 3cbb0e26f35c..e31b9ba57c0a 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -22,6 +22,7 @@
>  #define AUX_FORMAT_AYUV		0x09
>  #define AUX_FORMAT_ARGB_8B	0x0A
>  #define AUX_FORMAT_NV12_21	0x0F
> +#define AUX_FORMAT_RGBA16_FLOAT	0x1

That should be 0x10.

There are huge gaps elsewhere in igt wrt fp16+ccs. I'll post
a bigger series that addresses most of it (+ adds 10bpc+ccs
stuff as well).

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
> 2.34.1

-- 
Ville Syrjälä
Intel
