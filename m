Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F009F606A31E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 12:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CpEcZCeB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30F010E4F6;
	Fri, 27 Nov 2026 12:33:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A762E10E56C
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 12:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795782772; x=1827318772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=li6os6KzvaH8Gr26C37wlKLqIdjoUO+UuiNtWfCJqno=;
 b=CpEcZCeBqGQB2opEYjbODCX25WiEtSCJiPllmfatGp5ID9Vx9IvToCAX
 nOQeTlR4iojNj8BvQskuYDYWHO3BqpNDvVH3tGjA0oqVVgmy2X9lv2X4/
 zWe4W9NEiXYEkVL9Urf6B+DzMvIyP7D5qsaY4CwcjkOkYxxuoUHGecQGa
 GIP7z7cj4DLHq60uLG+wQOhNmVFPN8oFb6XdiRp/5KuzycoNv90GHbeyd
 E85fbZhtVoQGv5+nR2JIaL5o1eHJ6FHRhh1o8rXKnAsKUdnq6dpvVTkNg
 r28tKQ/99umfNnsgwttoCsF7olO2wWpmTLMBTP7+2NhawpCuL5PyWtT1m A==;
X-CSE-ConnectionGUID: AI+X89pPSV2akqBWeyXAyQ==
X-CSE-MsgGUID: gtWfwB1xQGi9W9PUQ3Eifg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4693256"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4693256"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:32:52 -0800
X-CSE-ConnectionGUID: OHH7DglwTDePSpELse+bkQ==
X-CSE-MsgGUID: GtlAoBM5S3i6qFEQIhbFJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14064046"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:32:50 -0800
Date: Fri, 27 Nov 2026 13:32:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Himanshu Girotra <himanshu.girotra@intel.com>
Subject: Re: [PATCH] lib/pciids: sync with kernel commit 78b2ef7a0c02
Message-ID: <dm2abxt4feloott4iqwlsyag7bhfsfhyd6jt7dbrsrns3jeilh@5y63tjfdr6bc>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 igt-dev@lists.freedesktop.org, 
 Himanshu Girotra <himanshu.girotra@intel.com>
References: <20261127112441.762644-2-balasubramani.vivekanandan@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261127112441.762644-2-balasubramani.vivekanandan@intel.com>
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

Hi Balasubramani,
On 2026-11-27 at 16:54:42 +0530, Balasubramani Vivekanandan wrote:
> Sync brings new PCI IDs for CRI.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Applied, thanks!


Regards,
Kamil

> ---
>  lib/pciids.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/pciids.h b/lib/pciids.h
> index a21609207..ab02bef26 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -905,7 +905,12 @@
>  	MACRO__(0x674E, ## __VA_ARGS__), \
>  	MACRO__(0x674F, ## __VA_ARGS__), \
>  	MACRO__(0x6750, ## __VA_ARGS__), \
> -	MACRO__(0x6751, ## __VA_ARGS__)
> +	MACRO__(0x6751, ## __VA_ARGS__), \
> +	MACRO__(0x6752, ## __VA_ARGS__), \
> +	MACRO__(0x6753, ## __VA_ARGS__), \
> +	MACRO__(0x6754, ## __VA_ARGS__), \
> +	MACRO__(0x6755, ## __VA_ARGS__), \
> +	MACRO__(0x6756, ## __VA_ARGS__)
>  
>  /* NVL-P */
>  #define INTEL_NVLP_IDS(MACRO__, ...) \
> -- 
> 2.53.0
> 
