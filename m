Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08149C4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 16:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3544010F06C;
	Wed,  7 Feb 2024 16:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7YF1lRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9F610F07B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707322185; x=1738858185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tedEH6ZilkjjM1KNyq+dUVUXMPRcSChDDikLzoESdEo=;
 b=L7YF1lRMsZjIyHBST+6FC8FAvme5tiHau+yUn3Tu24sU1ISahd9qB+kf
 V75O+DKGCDV1cCgnDIrTlK4w5nrRHNOQLalhjgZt2DFBRB4whGcSIyXaC
 ODbgVWQ9NJ3D+nOhWNmJyFUqc4ROYoWbvC2SklR3r7sNKQP3pkk0tJSiu
 vHDZfF3M+cGqexicNf78fsOpE5rUGM+3cNietBKlD7vrDj9dXUoEUmkDe
 +D3K5DgVZWa0oUrXrXzwFXZ//nxuTQaf70ynibw52Gor9ub3+tls/YS4k
 yaiiE//1EPqbUVkJJvkSbiGIDqgDffkDigoLxXMXGT+3R+rPBa00hPyJg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1175099"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1175099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 08:09:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1680136"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 08:09:41 -0800
Date: Wed, 7 Feb 2024 17:09:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH v3 i-g-t] drm-uapi/xe: remove persistence queue
Message-ID: <20240207160923.6izae2ro5gb6bzqi@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
References: <20240207103541.634047-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240207103541.634047-1-tejas.upadhyay@intel.com>
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

Hi Tejas,
On 2024-02-07 at 16:05:41 +0530, Tejas Upadhyay wrote:
> KMD has removed support setting persistence queue property
> https://patchwork.freedesktop.org/series/129311/ here, to
> have parity remove test as well
> 
> V3:
>   - Update commit message - Kamil
>   - dont change drm-uapi/xe_drm.h manually - Lucas
> V2(Priyanka):
>   - Leave hole in uapi define to have parity with KMD
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  tests/intel/xe_exec_queue_property.c | 8 --------

Now you are only removing subtest, no drm-uapi/xe_drm.h
changes, so this should be:

[PATCH i-g-t] tests/intel/xe_exec_queue_property: remove persistence subtest

Regards,
Kamil

>  1 file changed, 8 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 53e08fb0e..4fdd4ceae 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -11,8 +11,6 @@
>   * Test category: functionality test
>   * SUBTEST: priority-set-property
>   * Description: tests basic priority property by setting invalid values and positive values.
> - * SUBTEST: persistence-set-property
> - * Description: tests basic persistence property by setting positive values
>   * SUBTEST: %s-property-min-max
>   * Description: Test to check if %s arg[1] schedule parameter checks for min max values.
>   *
> @@ -214,12 +212,6 @@ igt_main
>  		igt_waitchildren();
>  	}
>  
> -	igt_subtest("persistence-set-property") {
> -		/* Tests persistence property by setting positive values. */
> -		test_set_property(xe, DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE, 1, 0);
> -
> -	}
> -
>  	igt_subtest_group {
>  		igt_fixture {
>  			sys_fd = igt_sysfs_open(xe);
> -- 
> 2.25.1
> 
