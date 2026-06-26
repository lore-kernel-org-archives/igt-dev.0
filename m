Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB63CDE008
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jun 2026 09:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A8210F52C;
	Fri, 26 Jun 2026 09:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+0ltBOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDB810E327
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 09:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782465569; x=1814001569;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p6v0aK1Flenbu69P5NGPYa9uMWtC2Ar0k8ApJbfid0A=;
 b=l+0ltBOYm/KZeYnLWKTN80H8JuNYVKbEu2bNpUiJd0axnOBD+VPTiLaB
 vdmEQKKnMBwALFFa6nxGiji2nXTQZCKD1s+wS4K+7euzh+gYBCmnEBYcG
 RmjazBudZMX2eO0k94JHAcobeP767Rmzd0IC2mFDosJL3B+vOn8gt1hpp
 b22Q1oiHSg6uCCYm+WIEAaimUi1A9yolPJScbMjS4cucE6vynnu3RtNjX
 PSH9Ih0/dg9hM58BfjXu/KfsbmqPC63facj6BHDwCzNsDNV26lJn+mlNy
 Ky5JjTmjxB2FaM7q30OXjt71J+zr8HwZuarwcj0YuRDsU3Y1eleDWUBzA g==;
X-CSE-ConnectionGUID: Z95NggM6SHu4zNdy175Okg==
X-CSE-MsgGUID: kIdvNJ3KQK+9RCUv9IN2Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93915387"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="93915387"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:19:29 -0700
X-CSE-ConnectionGUID: GASvALoAQk+8K39VcStTpA==
X-CSE-MsgGUID: QBkgVQDoRcC1XQmGhgffaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="248645497"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.232])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:19:28 -0700
Date: Fri, 26 Jun 2026 11:19:25 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 11/11] lib: Add genxml annotated batch buffer decode
Message-ID: <2tgsw7tfa24k37nzs3mdp424sp47uwcrn4c5j6vgvw6minji2c@5hkdkhng5e75>
References: <20260622035106.3023047-1-jan.maslak@intel.com>
 <20260622035106.3023047-12-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622035106.3023047-12-jan.maslak@intel.com>
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

On Mon, Jun 22, 2026 at 05:51:06AM +0200, Jan Maslak wrote:
> When IGT_BB_ANNOTATE=1 is set, intel_bb_dump() writes a companion
> <filename>.annotated file alongside the raw hex dump.  The annotated file
> identifies each command and prints its field names and values, decoded via
> the genxml *_decode.h headers.
> 
> The opt-in environment variable avoids file I/O overhead in normal test runs.
> A disclaimer in the file header notes that the decode is best-effort and may
> lag hardware on newer platforms.

This one also looks good to me.

Amazing work Janek, it's new quality in IGT render code. Definitely
will help us to faster add render code for future platforms. Annotating
is also great, it's much easier now to see structures fields meaning
during debugging.


For this patch:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Address my minor nits and we can merge it.

--
Zbigniew

> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  lib/intel_batchbuffer.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 912b936e0c..1dacfdc6c7 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -42,6 +42,7 @@
>  #include "intel_batchbuffer.h"
>  #include "intel_bufops.h"
>  #include "intel_chipset.h"
> +#include "intel/genxml/igt_genxml_decode.h"
>  #include "intel_pat.h"
>  #include "media_fill.h"
>  #include "media_spin.h"
> @@ -1611,7 +1612,9 @@ void intel_bb_print(struct intel_bb *ibb)
>   * @filename: name to which write bb
>   * @in_hex: dump bb in hex form
>   *
> - * Dump batch bo to file.
> + * Dump batch bo to file.  When IGT_BB_ANNOTATE=1 is set, also writes
> + * a companion annotated file (filename + ".annotated") with
> + * genxml-decoded field names and values.
>   */
>  void intel_bb_dump(struct intel_bb *ibb, const char *filename, bool in_hex)
>  {
> @@ -1641,6 +1644,33 @@ void intel_bb_dump(struct intel_bb *ibb, const char *filename, bool in_hex)
>  	}
>  	fclose(out);
>  
> +	/* Write a companion annotated decode alongside the raw dump,
> +	 * but only when explicitly requested via IGT_BB_ANNOTATE=1.
> +	 */
> +	if (getenv("IGT_BB_ANNOTATE")) {
> +		char *ann_filename;
> +		unsigned batch_dwords;
> +
> +		igt_assert(asprintf(&ann_filename, "%s.annotated", filename) > 0);
> +		batch_dwords = intel_bb_offset(ibb) / sizeof(uint32_t);
> +
> +		out = fopen(ann_filename, "w");
> +		if (out) {
> +			fprintf(out,
> +				"# Batch buffer annotated decode\n"
> +				"# Decoded using IGT's genxml definitions.\n"
> +				"# This is a best-effort annotation and may be inaccurate,\n"
> +				"# especially on newer platforms where the XML definitions\n"
> +				"# may not yet reflect the latest hardware changes.\n"
> +				"\n");
> +			igt_genxml_decode_batch(out, ibb->devid,
> +						(const uint32_t *)ptr,
> +						batch_dwords);
> +			fclose(out);
> +		}
> +		free(ann_filename);
> +	}
> +
>  	if (ptr != ibb->batch)
>  		munmap(ptr, ibb->size);
>  }
> -- 
> 2.43.0
> 
