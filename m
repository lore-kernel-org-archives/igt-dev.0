Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCC0606A326
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 15:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EsWkw2ML
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760F110E6BF;
	Fri, 23 Oct 2026 15:43:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7F810E6BF
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792770124; x=1824306124;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R1Ayk8N0tw1E4JwX3TuCodTBqJLxASl2vNxqNucNw4o=;
 b=EsWkw2ML/i4Vt1pqfeq1+l1MxxnJkp5TmOqbo68LYIxvkwQPCG1V1dXj
 t7BQfAxpiAwrACr/N0NpNHGhDwVghvuADkRdk5YrP9gpxj7vvDEtza+7M
 gTCSkp0Srg2N71Xrh+Q5t1JpjKNr7rNplZ5dLWN/AOkrBaFvJ9kSPXlXa
 p4WAzI0Q27KXnbSz+m/aWXjhaBJ7y4/UTlP8ZfVl3MU0KBMmWlL9ViPQ1
 HVm0tR0SgsVfvXp7N102MYHn+e/it/IJaI5hFqobDaW8+u04ehDzWyXuA
 H5UXCvXhA9q+DUEL8UvX//WwZqt/9xSBImU580cJnclKSmCsqJeJvBrRZ Q==;
X-CSE-ConnectionGUID: Wq97rw73QIqTMbNkePQlmg==
X-CSE-MsgGUID: a74SJ4e0TYumMt4yrXnvQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1436656"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1436656"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 08:42:04 -0700
X-CSE-ConnectionGUID: LUwrjqaiQ36SkaJo/r14Fw==
X-CSE-MsgGUID: xSCb9XuBTvGc9r1CH5uSfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3662745"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 08:42:01 -0700
Date: Fri, 23 Oct 2026 17:41:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 peter.senna@linux.intel.com, piotr.rudnicki@intel.com,
 mika.kuoppala@intel.com
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_live_ktest: remove xe_eudebug
 from ktest list
Message-ID: <20261023154159.2mcdq7hmwci2wnxf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 peter.senna@linux.intel.com, piotr.rudnicki@intel.com,
 mika.kuoppala@intel.com
References: <20261022130258.407901-1-jan.sokolowski@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022130258.407901-1-jan.sokolowski@intel.com>
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

Hi Jan,
On 2026-10-22 at 15:02:58 +0200, Jan Sokolowski wrote:
> Eudebug is currently not supported and there are no ktests there
> available.
> 
> Remove it from xe_live_ktest list.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_live_ktest.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
> index e80d7f68e0..b6dcb29d4f 100644
> --- a/tests/intel/xe_live_ktest.c
> +++ b/tests/intel/xe_live_ktest.c
> @@ -35,13 +35,6 @@
>   * Description:
>   *	Kernel dynamic selftests to check mocs configuration.
>   * Functionality: mocs configuration
> - *
> - * SUBTEST: xe_eudebug
> - * Description:
> - *	Kernel dynamic selftests to check eudebug functionality.
> - * Functionality: eudebug kunit
> - * Mega feature: EUdebug
> - * Sub-category: kunit eudebug
>   */
>  
>  static const char *live_tests[] = {
> @@ -50,7 +43,6 @@ static const char *live_tests[] = {
>  	"xe_dma_buf",
>  	"xe_migrate",
>  	"xe_mocs",
> -	"xe_eudebug",
>  };
>  
>  int igt_main()
> -- 
> 2.43.0
> 
