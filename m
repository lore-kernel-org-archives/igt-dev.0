Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1191F606A32C
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k0k39mcx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900A610ED9A;
	Mon,  2 Nov 2026 12:17:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3F310E61F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 12:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793621768; x=1825157768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Si4AgfE4bYftKwUbZMyXMWALUW9veHX385bQJ9aCSaI=;
 b=k0k39mcxA0k5cc8ms7ZOK6zWH6gloYiZOqP7XDfRzACfM+x5LvzrQLcp
 7xTeo/iEXVr86DHdvQvnoPv2Q4hD1A1p9hJbOkNIDJxQXcaolMNt2KmZJ
 zqCi6IQqcgUFpwJFBUldzQHsSPv5SF21kr5eDw5HMuH1IT2b0AH0fSjT4
 A1LxVPjDmDSWvH2aZ2rooLJBwGKzXVd6SVP7jbltzIfwMBCPTiKEmNtZj
 OwDst18jdlo+fqS+nWLcKFYxV+Buvyw8DEkfPNAExuaKdSaBwPWM5vIA7
 foXbGM46jaq3OGCFMZFnK/+0mqKMAL8fHA5/in3C8TghoQnFJ+wdY/UPt A==;
X-CSE-ConnectionGUID: 3dmriV5+TDe7tTyQPYvUzQ==
X-CSE-MsgGUID: n6LarULkTSmgBr/Y8WjjUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2318226"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2318226"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:16:07 -0800
X-CSE-ConnectionGUID: zIH6qtIjQ8aGwAg39X8XRw==
X-CSE-MsgGUID: nUhMHHYZQEav58CGcb06hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6277851"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:16:06 -0800
Date: Mon, 2 Nov 2026 13:15:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, jvignan@qti.qualcomm.com,
 robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com
Subject: Re: [PATCH i-g-t] tests/msm/msm_bo: Add memory advice tests
Message-ID: <20261102121546.hyh24f662eirrg54@kamilkon-DESK.igk.intel.com>
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

Applied, thanks!

Btw can you test and send tested-by to two patches sent by Jitta?

Regards,
Kamil

> ---
>  tests/msm/msm_bo.c | 238 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 238 insertions(+)
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
> +	igt_describe("Set WILLNEED advice and verify that the buffer is retained");
> +	igt_subtest("bo-madvise-willneed") {
[cut]
