Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBD7C52D72
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 05:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84DD10E96D;
	Fri,  2 Aug 2024 05:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VesAJS7S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CE610E96D
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Aug 2024 05:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722575531; x=1754111531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cPJDkimi+Ofu6rklWPgMPDNn7gAPOdJ6n19tLi5WDiU=;
 b=VesAJS7SXxhL1VK7eLiHFvp301bEic3Vfjr8DLToDzYuoEXNdExSlW/r
 iCS4mPONpwy66e8ZqDiYEdP+diyhlfiIZUGtXAfSRR6rJywQIu/IVKvMM
 2P92xaSBAFYJ0vfqkvW4/LWosw6ZXfUfuCZxhQXezJB2a8sSg3y1ef5cL
 t8zThawQ2Z/Xjod2Klswe1qXUR/uss5yslKhUrS5YLpyFkackIVeSe82V
 kOhfcKnxSYOqmsi8PjYU64ixtDQwI9SEr/WYFW622Sw5797itUdj6OIjF
 ABHPt7hzz2mniifnyyRgg8/D77Xm+UMHIdG+zNoXCZd2kUaYMH3obGjua A==;
X-CSE-ConnectionGUID: BboCIXssRjyZXQngPQbMYA==
X-CSE-MsgGUID: rBR1Q+ZWQZSrwfDtkeb2UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="12844635"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="12844635"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 22:12:10 -0700
X-CSE-ConnectionGUID: IEM96kdTTq6Z8UTxNf33ZA==
X-CSE-MsgGUID: evB2LTVNRauQYDCIOEpk9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="59391489"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.46])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 22:12:09 -0700
Date: Fri, 2 Aug 2024 07:12:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel/xe_create: Remove the elapsed time validation
Message-ID: <20240802051206.7qkzsh7pdfbc56zl@zkempczy-mobl2>
References: <20240801123312.1539769-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801123312.1539769-1-balasubramani.vivekanandan@intel.com>
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

On Thu, Aug 01, 2024 at 06:03:12PM +0530, Balasubramani Vivekanandan wrote:
> Time check used is incorrect. Time limit used for validation is
> arbitrarily chosen as 5 seconds with no real resoning behind it.
> With different execution environments taking different execution times,
> limit can't be fixed and leads to unnecessary hacks.
> So remove this time check completely.

MAXTIME picked in the past was chosen as a fraction of created/destroyed
exec queues in some (safe) time period. Up to relatively small number
of exec queues (up to 512) there was no issue observed. But with larger
number of exec queues we noticed kernel lockup (iirc guc related).

I think keeping some time regime for those operations is good idea, we
may notice performance / stability drop if something unexpected will
happen in kmd/guc. MAXTIME/MAXEXECQUEUES were chosen as safe values
which should be easily handled. If you're removing this check you may
delete subtest as well.

--
Zbigniew

> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  tests/intel/xe_create.c | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index 76ffdcef2..80de07789 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -157,7 +157,6 @@ enum vm_count {
>  };
>  
>  #define MAXEXECQUEUES 2048
> -#define MAXTIME 5
>  
>  /**
>   * SUBTEST: create-execqueues-%s
> @@ -175,10 +174,8 @@ enum vm_count {
>  static void create_execqueues(int fd, enum exec_queue_destroy ed,
>  			      enum vm_count vc)
>  {
> -	struct timespec tv = { };
>  	uint32_t num_engines, exec_queues_per_process, vm;
> -	int nproc = sysconf(_SC_NPROCESSORS_ONLN), seconds;
> -	int real_timeout = MAXTIME * (vc == SHARED ? 4 : 1);
> +	int nproc = sysconf(_SC_NPROCESSORS_ONLN);
>  
>  	if (vc == SHARED) {
>  		fd = drm_reopen_driver(fd);
> @@ -189,8 +186,6 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
>  	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
>  	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
>  
> -	igt_nsec_elapsed(&tv);
> -
>  	igt_fork(n, nproc) {
>  		struct drm_xe_engine *engine;
>  		uint32_t exec_queue, exec_queues[exec_queues_per_process];
> @@ -236,16 +231,6 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
>  		xe_vm_destroy(fd, vm);
>  		drm_close_driver(fd);
>  	}
> -
> -	seconds = igt_seconds_elapsed(&tv);
> -	if (seconds > real_timeout) {
> -		if (igt_run_in_simulation())
> -			igt_info("Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
> -				 MAXEXECQUEUES, seconds, real_timeout);
> -		else
> -			igt_assert_f(false, "Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
> -				     MAXEXECQUEUES, seconds, real_timeout);
> -	}
>  }
>  
>  /**
> -- 
> 2.34.1
> 
