Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34144F9936B
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 10:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA4A10F093;
	Thu, 23 Apr 2026 10:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncV/zQWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6605810F0B0
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 10:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776941765; x=1808477765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GZAChullrzEIMucVQDXCYMAtGx9oDz258ht34hLnJhs=;
 b=ncV/zQWBSy+l+KKaVPdtInX/Vd/97KguDV55fhk9drbQgoi4WKfvKIE/
 0rYynVRqgHB0d9IgQZjp4PPj565qgVvAiVA0hfD1p05CDZ/WJAaslFucu
 P+iWuXHWzBTsJJvVQn0y6lT3xU1XtDpgZS+NclWfXRB2NKksW2kNfypbI
 a7+w1wP0Yfe7Lk5MD1/rxD+hOlCSw8Ni9lguXCe646KooZgrqDTgc8GxG
 qAReZ7aPyk3tyapHx6VPHC6qYKcXpk+05Dek5n6/4iwS1+tPKpwBqDJqQ
 Cs7TCZV0Db+OeH5RARasNwQDap30q9GxVC0LkdnhvlC2VjUN5a47Tv9qi g==;
X-CSE-ConnectionGUID: BHhx4NzBTDuO/D5EsY2bxA==
X-CSE-MsgGUID: kRHwfF2+RWaftbYhLtSfKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95319824"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="95319824"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:56:05 -0700
X-CSE-ConnectionGUID: 8I+ILNReQ8yl2ZWJmwUt3w==
X-CSE-MsgGUID: rbYyzOCBTm6WEe6mVnXbFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232936333"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 03:56:03 -0700
Date: Thu, 23 Apr 2026 12:56:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH 10/10] lib: Add genxml annotated batch buffer decode
Message-ID: <20260423105600.72def6ktze3lleeu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org,
 zbigniew.kempczynski@intel.com
References: <20260415220720.1594414-1-jan.maslak@intel.com>
 <20260415220720.1594414-11-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415220720.1594414-11-jan.maslak@intel.com>
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

Hi Jan,
On 2026-04-16 at 00:07:20 +0200, Jan Maslak wrote:
> When IGT_BB_ANNOTATE=1 is set, intel_bb_dump() writes a companion
> <filename>.annotated file alongside the raw hex dump.  The annotated file
> identifies each command and prints its field names and values, decoded via
> the genxml *_decode.h headers.
> 
> The opt-in environment variable avoids file I/O overhead in normal test runs.
> A disclaimer in the file header notes that the decode is best-effort and may
> lag hardware on newer platforms.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  lib/intel_batchbuffer.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index b09506574..5b3c3da48 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -49,6 +49,7 @@
>  #include "veboxcopy.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> +#include "intel/genxml/igt_genxml_decode.h"

Pleas move it to proper place, it should keep alphabetical order.

Regards,
Kamil

>  
>  #define BCS_SWCTRL 0x22200
>  #define BCS_SRC_Y (1 << 0)
> @@ -1579,7 +1580,9 @@ void intel_bb_print(struct intel_bb *ibb)
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
> @@ -1609,6 +1612,33 @@ void intel_bb_dump(struct intel_bb *ibb, const char *filename, bool in_hex)
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
> 2.34.1
> 
