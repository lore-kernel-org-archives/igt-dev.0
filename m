Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E667E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 17:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA4710E1A4;
	Tue,  7 Jan 2025 17:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQGOxWPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0DB10E012
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736272688; x=1767808688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xBr5s73oaVyfkcoTXA2jEKKiQgcx2f4Jw6eYLcfA1Ng=;
 b=aQGOxWPu+d1s6/j26R1cVdJMBzI3/O2oWRej1qV/+BKLBSt9pfZnpSEE
 2kz6yrhvHPtN9IgAbgaa4XinRIuBqgxkVE3KUw2iyOLDJjcP0Dd8LRs1m
 z6r1yLQ/glG1zLTqpntIoNAQjN8mLP2xf4FaJ7cBi3ah/9iqYqVyY9CaY
 3y96tDuOIvN2NEjs++UqRVvl0V7Zl3FVdugJAkr/e77oiObDAZLtUiTC7
 1ftObAVhQ0WYMUIY8nvjsUH5h+KxeQsGeCubobu5Rn18AkTiQlujKcd0G
 fZWaoc/3QWRbkyN7erimiMRONPzNxiKrSwoT2gu6VoEx6KkpUWKIgOAF/ w==;
X-CSE-ConnectionGUID: N4SKBYQRTL+9e24faa2prw==
X-CSE-MsgGUID: haDP5oKoRyKO1yHU868INg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36351832"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36351832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 09:58:04 -0800
X-CSE-ConnectionGUID: Zz/YDyipQBi08k9N4IVjhg==
X-CSE-MsgGUID: 0igNDqGbSS2dCWQpk9zBsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="102740124"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.171])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 09:57:58 -0800
Date: Tue, 7 Jan 2025 11:57:52 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/8] lib/xe: Move functions from xe_util to xe_gt
Message-ID: <2ayla6lr6xwinaok7qujbkmnhzqcdwrx2g6tztncanbfj6pc37@xbymfqopfpt6>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
 <20250104071548.737612-3-lucas.demarchi@intel.com>
 <CH0PR11MB5444D73EA4E6B5A0AA3279C3E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444D73EA4E6B5A0AA3279C3E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
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

On Mon, Jan 06, 2025 at 10:58:15PM +0000, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De Marchi
>Sent: Friday, January 3, 2025 11:16 PM
>To: igt-dev@lists.freedesktop.org
>Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
>Subject: [PATCH i-g-t 3/8] lib/xe: Move functions from xe_util to xe_gt
>>
>> Some functions are clearly gt-related, so move them to xe_gt.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>LGTM, though at some point in the future, we should probably take a closer look at
>the test files that have been impacted by this change and check if xe_util.h is still a
>required includes for them.

good idea. I went ahead and did that. I will include it in v2. Since we
only include xe_util.h from *.c, that's easy:

$ git grep -l  xe_util.h | xargs sed -i '/xe_util\.h/d'
$ meson compile --ninja-args "-k 2000" -C build  2>/dev/null | grep -e "^FAILED:.*\.c\.o"
FAILED: tests/xe_copy_basic.p/intel_xe_copy_basic.c.o       
FAILED: lib/libigt-xe_xe_util_c.a.p/xe_xe_util.c.o          
FAILED: lib/libigt-intel_allocator_c.a.p/intel_allocator.c.o
FAILED: tests/xe_peer2peer.p/intel_xe_peer2peer.c.o         
FAILED: tests/xe_exercise_blt.p/intel_xe_exercise_blt.c.o   
FAILED: tests/xe_exec_store.p/intel_xe_exec_store.c.o       
FAILED: tests/xe_ccs.p/intel_xe_ccs.c.o                     
FAILED: tests/xe_pat.p/intel_xe_pat.c.o                     
FAILED: lib/libigt-intel_blt_c.a.p/intel_blt.c.o            

Then remove the changes for the ones that failed, and make sure we have
.o for the ones that succeeded (i.e. they are not guarded by build
flags).


>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

thanks
Lucas De Marchi

>-Jonathan Cavitt
>
>> ---
>>  lib/xe/xe_gt.c                 | 67 ++++++++++++++++++++++++++++++++++
>>  lib/xe/xe_gt.h                 |  8 ++++
>>  lib/xe/xe_util.c               | 67 ----------------------------------
>>  lib/xe/xe_util.h               |  7 ----
>>  tests/intel/xe_drm_fdinfo.c    |  2 +
>>  tests/intel/xe_exec_balancer.c |  1 +
>>  tests/intel/xe_exec_reset.c    |  1 +
>>  tests/intel/xe_exec_threads.c  |  1 +
>>  tests/intel/xe_gt_freq.c       |  1 +
>>  tests/intel/xe_pm_residency.c  |  2 +
>>  10 files changed, 83 insertions(+), 74 deletions(-)
>>
>> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
>> index 53554beb0..e1f353b41 100644
>> --- a/lib/xe/xe_gt.c
>> +++ b/lib/xe/xe_gt.c
>> @@ -174,3 +174,70 @@ int xe_gt_stats_get_count(int fd, int gt, const char *stat)
>>
>>  	return count;
>>  }
>> +
>> +/**
>> + * xe_is_gt_in_c6:
>> + * @fd: pointer to xe drm fd
>> + * @gt: gt number
>> + *
>> + * Check if GT is in C6 state
>> + */
>> +bool xe_is_gt_in_c6(int fd, int gt)
>> +{
>> +	char gt_c_state[16];
>> +	int gt_fd;
>> +
>> +	gt_fd = xe_sysfs_gt_open(fd, gt);
>> +	igt_assert(gt_fd >= 0);
>> +	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
>> +	close(gt_fd);
>> +
>> +	return strcmp(gt_c_state, "gt-c6") == 0;
>> +}
>> +
>> +/**
>> + * xe_gt_fill_engines_by_class:
>> + * @fd: pointer to xe drm fd
>> + * @gt: gt number
>> + * @class: engine class to use to filter engines
>> + * @eci: output argument to copy engines to
>> + *
>> + * Fill out @drm_xe_engine_class_instance with all the engines in @gt that have
>> + * a certain @class.
>> + *
>> + * Return: number of engines that match the gt and clas
>> + */
>> +int xe_gt_fill_engines_by_class(int fd, int gt, int class,
>> +				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE])
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	int n = 0;
>> +
>> +	xe_for_each_engine(fd, hwe)
>> +		if (hwe->engine_class == class && hwe->gt_id == gt)
>> +			eci[n++] = *hwe;
>> +
>> +	return n;
>> +}
>> +
>> +/**
>> + * xe_gt_count_engines_by_class:
>> + * @fd: pointer to xe drm fd
>> + * @gt: gt number
>> + * @class: engine class to use to filter engines
>> + *
>> + * Count number of engines in @gt that have a certain @class.
>> + *
>> + * Return: number of engines that match the gt and clas
>> + */
>> +int xe_gt_count_engines_by_class(int fd, int gt, int class)
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	int n = 0;
>> +
>> +	xe_for_each_engine(fd, hwe)
>> +		if (hwe->engine_class == class && hwe->gt_id == gt)
>> +			n++;
>> +
>> +	return n;
>> +}
>> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
>> index 756b5f38e..47569cec3 100644
>> --- a/lib/xe/xe_gt.h
>> +++ b/lib/xe/xe_gt.h
>> @@ -8,6 +8,8 @@
>>
>>  #include "lib/igt_gt.h"
>>
>> +#include "xe_query.h"
>> +
>>  bool has_xe_gt_reset(int fd);
>>  void xe_force_gt_reset_all(int fd);
>>  igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
>> @@ -15,4 +17,10 @@ igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
>>  void xe_post_hang_ring(int fd, igt_hang_t arg);
>>  int xe_gt_stats_get_count(int fd, int gt, const char *stat);
>>
>> +bool xe_is_gt_in_c6(int fd, int gt);
>> +
>> +int xe_gt_fill_engines_by_class(int fd, int gt, int class,
>> +				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
>> +int xe_gt_count_engines_by_class(int fd, int gt, int class);
>> +
>>  #endif
>> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
>> index 9482819c2..f0b6bbb2d 100644
>> --- a/lib/xe/xe_util.c
>> +++ b/lib/xe/xe_util.c
>> @@ -235,70 +235,3 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint32_t bind_engine,
>>
>>  	free(bind_ops);
>>  }
>> -
>> -/**
>> - * xe_is_gt_in_c6:
>> - * @fd: pointer to xe drm fd
>> - * @gt: gt number
>> - *
>> - * Check if GT is in C6 state
>> - */
>> -bool xe_is_gt_in_c6(int fd, int gt)
>> -{
>> -	char gt_c_state[16];
>> -	int gt_fd;
>> -
>> -	gt_fd = xe_sysfs_gt_open(fd, gt);
>> -	igt_assert(gt_fd >= 0);
>> -	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
>> -	close(gt_fd);
>> -
>> -	return strcmp(gt_c_state, "gt-c6") == 0;
>> -}
>> -
>> -/**
>> - * xe_gt_fill_engines_by_class:
>> - * @fd: pointer to xe drm fd
>> - * @gt: gt number
>> - * @class: engine class to use to filter engines
>> - * @eci: output argument to copy engines to
>> - *
>> - * Fill out @drm_xe_engine_class_instance with all the engines in @gt that have
>> - * a certain @class.
>> - *
>> - * Return: number of engines that match the gt and clas
>> - */
>> -int xe_gt_fill_engines_by_class(int fd, int gt, int class,
>> -				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE])
>> -{
>> -	struct drm_xe_engine_class_instance *hwe;
>> -	int n = 0;
>> -
>> -	xe_for_each_engine(fd, hwe)
>> -		if (hwe->engine_class == class && hwe->gt_id == gt)
>> -			eci[n++] = *hwe;
>> -
>> -	return n;
>> -}
>> -
>> -/**
>> - * xe_gt_count_engines_by_class:
>> - * @fd: pointer to xe drm fd
>> - * @gt: gt number
>> - * @class: engine class to use to filter engines
>> - *
>> - * Count number of engines in @gt that have a certain @class.
>> - *
>> - * Return: number of engines that match the gt and clas
>> - */
>> -int xe_gt_count_engines_by_class(int fd, int gt, int class)
>> -{
>> -	struct drm_xe_engine_class_instance *hwe;
>> -	int n = 0;
>> -
>> -	xe_for_each_engine(fd, hwe)
>> -		if (hwe->engine_class == class && hwe->gt_id == gt)
>> -			n++;
>> -
>> -	return n;
>> -}
>> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
>> index b9fbfc5cd..c544d912f 100644
>> --- a/lib/xe/xe_util.h
>> +++ b/lib/xe/xe_util.h
>> @@ -47,11 +47,4 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
>>  			  struct igt_list_head *obj_list,
>>  			  uint32_t sync_in, uint32_t sync_out);
>>
>> -bool xe_is_gt_in_c6(int fd, int gt);
>> -
>> -int xe_gt_fill_engines_by_class(int fd, int gt, int class,
>> -				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
>> -int xe_gt_count_engines_by_class(int fd, int gt, int class);
>> -
>> -
>>  #endif /* XE_UTIL_H */
>> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>> index 6549629b4..f4264aadb 100644
>> --- a/tests/intel/xe_drm_fdinfo.c
>> +++ b/tests/intel/xe_drm_fdinfo.c
>> @@ -8,7 +8,9 @@
>>  #include "igt_device.h"
>>  #include "igt_drm_fdinfo.h"
>>  #include "lib/igt_syncobj.h"
>> +
>>  #include "xe_drm.h"
>> +#include "xe/xe_gt.h"
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_query.h"
>>  #include "xe/xe_spin.h"
>> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
>> index 1e552e9ef..f2df5cbec 100644
>> --- a/tests/intel/xe_exec_balancer.c
>> +++ b/tests/intel/xe_exec_balancer.c
>> @@ -19,6 +19,7 @@
>>  #include "lib/intel_reg.h"
>>  #include "xe_drm.h"
>>
>> +#include "xe/xe_gt.h"
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_query.h"
>>  #include "xe/xe_spin.h"
>> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>> index a3eaf8bbf..47c7666df 100644
>> --- a/tests/intel/xe_exec_reset.c
>> +++ b/tests/intel/xe_exec_reset.c
>> @@ -21,6 +21,7 @@
>>
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_query.h"
>> +#include "xe/xe_gt.h"
>>  #include "xe/xe_spin.h"
>>  #include "xe/xe_util.h"
>>  #include <string.h>
>> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>> index 661117bed..c8fc17366 100644
>> --- a/tests/intel/xe_exec_threads.c
>> +++ b/tests/intel/xe_exec_threads.c
>> @@ -21,6 +21,7 @@
>>
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_query.h"
>> +#include "xe/xe_gt.h"
>>  #include "xe/xe_spin.h"
>>  #include "xe/xe_util.h"
>>  #include <string.h>
>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
>> index de4d111ea..5d806cf15 100644
>> --- a/tests/intel/xe_gt_freq.c
>> +++ b/tests/intel/xe_gt_freq.c
>> @@ -17,6 +17,7 @@
>>  #include "igt_sysfs.h"
>>
>>  #include "xe_drm.h"
>> +#include "xe/xe_gt.h"
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_spin.h"
>>  #include "xe/xe_query.h"
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>> index d4b26b231..18e5cb6c3 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -21,7 +21,9 @@
>>  #include "igt_sysfs.h"
>>
>>  #include "lib/igt_syncobj.h"
>> +
>>  #include "xe/xe_ioctl.h"
>> +#include "xe/xe_gt.h"
>>  #include "xe/xe_query.h"
>>  #include "xe/xe_util.h"
>>
>> --
>> 2.47.0
>>
>>
