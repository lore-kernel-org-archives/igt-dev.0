Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E0606A319
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BcPW+utE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534A610E205;
	Tue, 20 Oct 2026 12:10:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15C810E205
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792498168; x=1824034168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+WycM597gTlkhd5ReVv4vvVGG6mmDuG896QAj6WbCfM=;
 b=BcPW+utErhvYgnCHZeuC5lVg31UC/avPmUBTPJXxIR2YLi8grzIjOaBS
 AcbQFW+ZDB1c/y215v/ltTMAlBuTIiGtd3xLVFy1siSfJMC7S5XK2I8C6
 y+Q287ZzuPkgsHKHV+oEHoyby6nl5ibLvOGl6aDIM/pS6XK+dWu9EXOEP
 o6GgOF0xWnqfW16CleGwJfgagdx4vac43w8nDRHV+SS8BibxpICHpqx6P
 6upYrHT1NPz/Ah6GNHZz9LxPd9GVUA7fPfKPHKarvy6t1sLL0O/+hRGZa
 zDX2ZGN0TcFrlkACno8ypxWKI3MX6kWrQlOsB5ke8aC4k9lwJRxabYIU9 g==;
X-CSE-ConnectionGUID: uuOWGta7S/mAgjQ1SPSZ1A==
X-CSE-MsgGUID: 6mmZlnGPQJa6M0tdI8uRVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1086792"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1086792"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:09:28 -0700
X-CSE-ConnectionGUID: r58HnxcdQqaTIWXvScINiQ==
X-CSE-MsgGUID: ktCBayYCSliaspuCgzg51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3143483"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:09:26 -0700
Date: Tue, 20 Oct 2026 14:09:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH] unigraf: Use proper hardware API for HPD pulsing
Message-ID: <20261020120924.hsh3ls36rvxbrh7y@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com, Imre Deak <imre.deak@intel.com>
References: <20260813164500.2287576-1-markyacoub@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813164500.2287576-1-markyacoub@google.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mark,
On 2026-08-13 at 12:45:00 -0400, Mark Yacoub wrote:
> With the latest Unigraf firmware, hardware HPD pulsing works reliably.
> Switch to using the `unigraf_write_u32(TSI_DPRX_HPD_PULSE_W, ...)` API
> directly rather than circumventing it with manual assert/deassert
> time-based toggles.
> 
> Signed-off-by: Mark Yacoub <markyacoub@google.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

+cc Imre Deak <imre.deak@intel.com>

Regards,
Kamil

> ---
>  lib/vendor/unigraf/unigraf.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
> index 30ee3c72b..627ec65b1 100644
> --- a/lib/vendor/unigraf/unigraf.c
> +++ b/lib/vendor/unigraf/unigraf.c
> @@ -612,13 +612,7 @@ void unigraf_hpd_assert(void)
>   */
>  void unigraf_hpd_pulse(int duration)
>  {
> -	/* In theory this should work:
> -	 * unigraf_write_u32(TSI_DPRX_HPD_PULSE_W, duration);
> -	 * But this seems to be broken and this works:
> -	 */
> -	unigraf_hpd_deassert();
> -	usleep(duration);
> -	unigraf_hpd_assert();
> +	unigraf_write_u32(TSI_DPRX_HPD_PULSE_W, duration);
>  }
>  
>  /**
> -- 
> 2.55.0.691.gc56d675ccc-goog
> 
