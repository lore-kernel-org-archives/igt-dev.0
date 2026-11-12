Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2031606A893
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hnbHuy3l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E3311222D;
	Thu, 12 Nov 2026 16:46:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C78D11220F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794501916; x=1826037916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pH8gSItrBFk6ocPveCapcuUKb3xp+CyYkpRQT6Y+g80=;
 b=hnbHuy3lLjBjB1xYrpIPVBnPuONxYuPPWqwEdjR4KZGDFnsAZ3Rq4zdp
 P1DuDlRQJh7kUknC1iRDutOTkW3jgqVUGQiHk9HDsQjOj1/EfIqVani34
 lLfoBbkcCOzYFpDyxmIej1nbCnGYs+2//aQy7drk9j/rffsMcjrzXpN+W
 ZcSoZHQ6AUFM+kfNf6tJBWL+B1qd04Rrs/rHZrj12rW0tfYIwcJUBmTnK
 G8smhPWGCxi/mOwUz9uzH1gWQtr+EgC0wQfRz71lTPTnx86Q7SxU7no7k
 SblgW6iwgepzIDgcdMjWqRwskxwrOwps/dcwL0dB/CEJlpUQLpkkZ/PLW A==;
X-CSE-ConnectionGUID: 5VtIlKmISD+KEp8sesRY/Q==
X-CSE-MsgGUID: CVRmO2K9ThC5xk8jSjw10g==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3393491"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3393491"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 08:45:16 -0800
X-CSE-ConnectionGUID: aR0XbFGBRM2iQjtI4ZOyYA==
X-CSE-MsgGUID: VKUN7TF9ST6t5uoQ4BOJzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9023624"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 08:45:15 -0800
Date: Thu, 12 Nov 2026 17:44:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com, 
 sk.anirban@intel.com
Subject: Re: [PATCH] intel-ci: Block xe_err_injection tests
Message-ID: <vftku6dhtuglgxwbdoebzzk23gtsjx3ou2clbigewytxaujwu7@j7yw6u4hkz65>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com, 
 sk.anirban@intel.com
References: <20261112160428.1459730-1-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112160428.1459730-1-ravi.kishore.koppuravuri@intel.com>
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

Hi Ravi,
On 2026-11-12 at 21:34:28 +0530, Ravi Kishore Koppuravuri wrote:
> xe_err_injection tests are only supported on CRI, so block it on the other
> xe platforms.
> 
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.bmg.core.blocklist.txt | 2 ++
>  tests/intel-ci/xe.lnl.core.blocklist.txt | 2 ++
>  tests/intel-ci/xe.nvl.core.blocklist.txt | 2 ++
>  tests/intel-ci/xe.ptl.core.blocklist.txt | 2 ++
>  4 files changed, 8 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
> index e7b57558b..ea2b285a4 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -80,3 +80,5 @@ igt@.*multi.queue.*
>  ##################################################################
>  igt@xe_wedged@cold-reset-wedged
>  ##################################################################
> +igt@xe_err_injection@.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
> index 970c88932..769cfe8d2 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -108,3 +108,5 @@ igt@.*multi.queue.*
>  ##################################################################
>  igt@xe_wedged@cold-reset-wedged
>  ##################################################################
> +igt@xe_err_injection@.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index b960c15cc..91f9b1a47 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -109,3 +109,5 @@ igt@xe_live_ktest@xe_eudebug
>  ##################################################################
>  igt@xe_wedged@cold-reset-wedged
>  ##################################################################
> +igt@xe_err_injection@.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
> index e2284bdfe..30978ad60 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -88,3 +88,5 @@ igt@.*multi.queue.*
>  ##################################################################
>  igt@xe_wedged@cold-reset-wedged
>  ##################################################################
> +igt@xe_err_injection@.*
> +##################################################################
> -- 
> 2.34.1
> 
