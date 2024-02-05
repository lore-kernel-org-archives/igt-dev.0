Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7E6C48292
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 17:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08F010E271;
	Mon,  5 Feb 2024 17:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3hF1ZWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06C710E271
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 17:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707155212; x=1738691212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MXTe1YjtydAwwaCoJHesuW3MyxQROWB0pEyRHDf0ypM=;
 b=R3hF1ZWnlWZWRKHoVo8cj+z8vyvyY+5kbUDGzxQNbgO4brV1oc0WVnFr
 cJm5JYukomhsfPbUPnmFZlmivvHVums2cLkhz98B0Waq8Tau13yHCuuy8
 sMsv6g0lA4vqFKOiXpfYapM87TqCuFHU+FZgQQw7pwN2kaz8XnOVRx4J5
 ftgM7TZdymHQXXChLx9gIjpydy5k+gLSR3yTnidtT4IAcUMOgE7HZ76k9
 uw+Z2KOc/MvpXrxWufXJuSsuZIUnGo5yiSEXdHGwe+eLMW9HAlgbCOH1G
 HZCarbYGQ/IBIdad+eljbgrETErV+FTss27Lc1pbwbPGJ/iI8rO1jo7SC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="394994470"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="394994470"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 09:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="909353523"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="909353523"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 09:46:50 -0800
Date: Mon, 5 Feb 2024 18:46:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [i-g-t] tests/intel/xe_exec_queue_property: Remove persistence
 queue property
Message-ID: <20240205174647.bdsnxjm6ilrbq4p7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20240205060225.35672-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240205060225.35672-1-tejas.upadhyay@intel.com>
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
On 2024-02-05 at 11:32:25 +0530, Tejas Upadhyay wrote:
> KMD has removed support setting persistence queue property
> here https://patchwork.freedesktop.org/series/129311/, to
------------------------------------------------------ ^

Please do not add any chars at end of http link.

> have parity remove test support as well

Also I would expect info about drm-uapi change in subject,
instead of:

[i-g-t] tests/intel/xe_exec_queue_property: Remove persistence queue property

I would suggest:

[PATCH v1 i-g-t] drm-uapi/xe: remove persistence queue

+cc Ashutosh

Regards,
Kamil

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  include/drm-uapi/xe_drm.h            | 9 ++++-----
>  tests/intel/xe_exec_queue_property.c | 8 --------
>  2 files changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index bacdca787..1917e4c50 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -1046,11 +1046,10 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		3
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		4
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		5
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	6
>  /* Monitor 128KB contiguous region with 4K sub-granularity */
>  #define     DRM_XE_ACC_GRANULARITY_128K				0
>  /* Monitor 2MB contiguous region with 64KB sub-granularity */
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
