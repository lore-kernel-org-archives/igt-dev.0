Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B46606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jq9OZuKm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9144C10E3C7;
	Thu, 22 Oct 2026 12:43:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DAD10E3C7
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 12:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792672941; x=1824208941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aHMc23idU7OfuuZieA2rps3FEcHpz8gHV5XoBPIzaM0=;
 b=Jq9OZuKma+91CgIxX569c1Abcc9OzLmYjtHF8KMSp8XfebFVUSDPmQzx
 JdsPdwTmM/AwyODXEy19rJk7iKY4GndW2Nj3ElAikFNuX7rk3vrGI6XPl
 TgLWD4KO67kyci2tGwgs9+Pzy+D+D8WouC3kIf1RefzbMxlus4ZjR8rPb
 1YVOFkKUdcQpZaFYXXxKTm3kIUDI+s4hrbKaGbmcfhXbeQHTcoFFfH/u2
 Dn/AinIJD3PJSoFGRBuhzVNLeBrha3+Ecs6l3fz/KUjryTdLl7kAVGPFB
 1uLe9spvAQzsz9V48ltVFnCVa8waHhu8CqXLheytPNama7viMzIvSkF7k A==;
X-CSE-ConnectionGUID: MVZybzisQ/6ULLk+rqYY+w==
X-CSE-MsgGUID: LMXIxV9ETc6llkp6A9fUig==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1307323"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1307323"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:42:21 -0700
X-CSE-ConnectionGUID: WYes9brgQ8S4eWdfGXGmxw==
X-CSE-MsgGUID: GTM7FWNoRXWtnvIVCsBmGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3234446"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:42:20 -0700
Date: Thu, 22 Oct 2026 14:42:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 priyanka.dandamudi@intel.com, daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v2 2/2] intel-ci: add xe_pxp coverage subtest
Message-ID: <20261022124216.tu66prwxvqizpegd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com, priyanka.dandamudi@intel.com,
 daniele.ceraolospurio@intel.com
References: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
 <20261022054420.180035-3-shivtej.eknath.patil@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022054420.180035-3-shivtej.eknath.patil@intel.com>
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

Hi shivtej.eknath.patil,
On 2026-10-22 at 05:44:20 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> Add the newly introduced xe_pxp coverage subtest
> to xe.fast-feedback.testlist so it is executed by CI.
> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index 59d1cff2e..1f168cba6 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -204,6 +204,7 @@ igt@xe_prime_self_import@basic-with_one_bo
>  igt@xe_prime_self_import@basic-with_fd_dup
>  #igt@xe_prime_self_import@basic-llseek-size
>  igt@xe_pxp@pxp-bo-alloc
> +igt@xe_pxp@pxp-debugfs-info

Nack, see reported Xe BAT failure.
Also imho this should run in full runs, not in BATs, as it is
not exposed on GPUs without PXP.


Regards,
Kamil

>  igt@xe_pxp@pxp-queue-alloc
>  igt@xe_query@query-engines
>  igt@xe_query@query-mem-usage
> -- 
> 2.43.0
> 
