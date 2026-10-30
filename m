Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002DD606A325
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 11:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZfW+vhol
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49C311277E;
	Fri, 30 Oct 2026 11:50:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CA011276D
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 11:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793360961; x=1824896961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0dQzfYRXuCZZTavoHgGKhoDVWM7UpJDDOy7P9mL1CDM=;
 b=ZfW+vholAeXZ9THwnHogd0w99HRXYHLmpFHST6x2QLK/la7HV2oqai/M
 gmTnSZtX9SzCyv+4rA+UqIQGF8sYlmbW4Ryai+L+xHlfQRIJgsrT3NCfx
 Nb0en4U4KICmjHW7jz7RlPrMTN0c0JppDgQhkKXzcG/78dC3cOXXrfcgC
 DXGFBAoAtlp5c6T7m+D/NPrPECB+gradq8zELNbpPn4G39oHic63nkZYF
 h3q/16JE5cOmdNTm0Ns0jSIx7auHyHLIMsGQXZZchTKjgFvild4XcN/sW
 g2fOdGEz8IwNzJeuCj48jLJph5FpoUg8ThZ6k4LxtpSZqQ5G/9m8vfhOA A==;
X-CSE-ConnectionGUID: jp6E8Qv5RqGNc1YYhB62Pg==
X-CSE-MsgGUID: LpsIY/ZGTl+ba94luJP7Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1998749"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="1998749"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:49:21 -0700
X-CSE-ConnectionGUID: zoSCiHQFT6aaYfG1i5KaQg==
X-CSE-MsgGUID: DgFZNOdcRTWSZSojdl2eGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5310872"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:49:19 -0700
Date: Fri, 30 Oct 2026 12:49:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, jvignan@qti.qualcomm.com,
 robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com
Subject: Re: [PATCH i-g-t] tests/msm/msm_bo: Add memory advice tests
Message-ID: <20261030114900.d4wto2ygwbqr6q4o@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sri Vidya Patrayani <spatraya@qti.qualcomm.com>,
 igt-dev@lists.freedesktop.org, jvignan@qti.qualcomm.com,
 robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com
References: <20261030060638.2849895-1-spatraya@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030060638.2849895-1-spatraya@qti.qualcomm.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sri,
On 2026-10-30 at 11:36:38 +0530, Sri Vidya Patrayani wrote:
> Add positive and negative coverage for MSM buffer object memory advice.
> 
> Exercise WILLNEED and DONTNEED advice across write-combine, cached,
> mapped, large, and multiple buffer objects, including CPU access
> transitions.
> 
> Verify invalid handles, invalid advice values, and advice requests
> after buffer release are rejected as expected.
> 
> Signed-off-by: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
> ---
>  tests/msm/msm_bo.c | 238 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 238 insertions(+)
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> index 3257697f5..906f801ef 100644
> --- a/tests/msm/msm_bo.c
> +++ b/tests/msm/msm_bo.c
> @@ -414,6 +414,244 @@ int igt_main()
>  		igt_msm_bo_free(bo);
>  	}
>  
> +	/* Memory Advice Tests - Positive Cases */
[cut]
