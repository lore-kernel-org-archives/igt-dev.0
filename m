Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ED5D6552D
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 16:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1E710E953;
	Tue, 26 Nov 2024 16:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BruRqlph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480D710E953
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732640147; x=1764176147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S23yDDxnYFH+DdDW+t8tdKmvQ+QT8NWyY+rPLhDNawo=;
 b=BruRqlphUBP72BYjlyssWEYMA8GnFR4rH2u5SwL1drOXnD0THfP3CMvD
 Bb2P/Ei4yhSZjBkfr7/ovMTptXdt5AcQQYEwtXhqWibDAU28v1wptmL/H
 ljnBmd2lIMYZzoz48KFbSfoo5Hafa3t43v6gAoOy0g/2hbiWaQKOQjwga
 7XpohvZmbHc0OvX6lv0A/7iJC+YCY1L5gfpWY4TEQOy1+dKI5qZP5Mhv7
 QKorqcnzCtJtgKq1laIterjxw6WHzznnl1CzMAKc/n9i6ewBFfUUsKhE0
 waRdSAbj/MVuE4ziK7F1W79VDj9nANJ5+msmEeTEKRWPM2fiM6Dsy0AWi A==;
X-CSE-ConnectionGUID: MS8vFj1CQ120Natpz4VdFQ==
X-CSE-MsgGUID: 0qeYkRWhRvC+0dLk3OZhKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36600473"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="36600473"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:55:46 -0800
X-CSE-ConnectionGUID: dSKwFyTCQXCrSoUbzz5rcg==
X-CSE-MsgGUID: U2fQ59KgTCSsp/pNf0qFDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114941342"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 08:55:44 -0800
Date: Tue, 26 Nov 2024 17:55:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH v7 2/4] tests/intel/xe_sysfs*: Restore values on test
 failure
Message-ID: <20241126165541.5kpurie66hge4cox@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 vinay.belgaumkar@intel.com
References: <20241118180511.64212-1-jonathan.cavitt@intel.com>
 <20241118180511.64212-3-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118180511.64212-3-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2024-11-18 at 18:05:09 +0000, Jonathan Cavitt wrote:
> The tests xe_sysfs_preempt_timeout and xe_sysfs_timeslice_duration
> modify the values of preempt_timeout_us and timeslice_duration_us,
> respectively.  However, on a test failure, it is possible that these
> values may remain in their modified states, resulting in the values
> being used in future tests and causing unexpected behavior.
> 
> Save the respective modified values before starting the test and attempt
> to restore the values on test exit.
> 
> v2:
> - Fix some formatting issues (Kamil)
> - Abort if value restore fails (Kamil)
> - Directly call igt_sysfs_printf on exit to avoid duplicating on helper
>   (Kamil)
> 
> v3:
> - Do not compare potentially unassigned variable (Kamil)
> - Whitespace and commit name fixes (Kamil)
> 
> v4:
> - Fix igt_sysfs_scanf/printf usage in tests (Kamil)
> 
> Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_sysfs_preempt_timeout.c    | 58 +++++++++++++++++++----
>  tests/intel/xe_sysfs_timeslice_duration.c | 57 ++++++++++++++++++----
>  2 files changed, 96 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
> index 7fa0dfcdf7..841c04b215 100644
> --- a/tests/intel/xe_sysfs_preempt_timeout.c
> +++ b/tests/intel/xe_sysfs_preempt_timeout.c
> @@ -170,6 +170,7 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
>  	set_preempt_timeout(engine, saved);
>  }
>  
> +#define	MAX_GTS	8
>  igt_main
>  {
>  	static const struct {
> @@ -183,8 +184,10 @@ igt_main
>  				       "preempt_timeout_min",
>  				       "preempt_timeout_max"}, };
>  	int count = sizeof(property) / sizeof(property[0]);
> +	int gt_count = 0;
>  	int fd = -1, sys_fd, gt;
> -	int engines_fd = -1, gt_fd = -1;
> +	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
> +	unsigned int pts[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -192,26 +195,61 @@ igt_main
>  		sys_fd = igt_sysfs_open(fd);
>  		igt_require(sys_fd != -1);
>  		close(sys_fd);
> +
> +		xe_for_each_gt(fd, gt) {
> +			int *list, size;
> +			igt_require(gt_count < MAX_GTS);
> +
> +			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
> +			igt_require(gt_fd[gt_count] != -1);
> +			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
> +			igt_require(engines_fd[gt_count] != -1);
> +
> +			list = igt_sysfs_get_engine_list(engines_fd[gt_count], &size);
> +			igt_require(size > 0);
> +
> +			for (int i = 0; i < size; i++)
> +				igt_require(igt_sysfs_scanf(list[i], "preempt_timeout_us", "%u",
> +							    &pts[gt_count][i]) == 1);
> +
> +			igt_sysfs_free_engine_list(list, size);
> +			gt_count++;
> +		}
>  	}
>  
>  	for (int i = 0; i < count; i++) {
>  		for (typeof(*tests) *t = tests; t->name; t++) {
>  			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
> +				int j = 0;
>  				xe_for_each_gt(fd, gt) {
> -					gt_fd = xe_sysfs_gt_open(fd, gt);
> -					igt_require(gt_fd != -1);
> -					engines_fd = openat(gt_fd, "engines", O_RDONLY);
> -					igt_require(engines_fd != -1);
> -
> -					igt_sysfs_engines(fd, engines_fd, gt, 1, property[i],
> -									  t->fn);
> -					close(engines_fd);
> -					close(gt_fd);
> +					int e = engines_fd[j];
> +
> +					igt_sysfs_engines(fd, e, gt, 1, property[i], t->fn);
> +					j++;
>  				}
>  			}
>  		}
>  	}
>  	igt_fixture {
> +		for (int i = gt_count - 1; i >= 0; i--) {
> +			int *list, size;
> +			list = igt_sysfs_get_engine_list(engines_fd[i], &size);
> +
> +			for (int j = size - 1; j >= 0; j--) {
> +				unsigned int store = UINT_MAX;
> +
> +				igt_assert_lte(0, igt_sysfs_printf(list[j], "preempt_timeout_us",

This should be abort.

> +								   "%u", pts[i][j]));
> +				igt_sysfs_scanf(list[j], "preempt_timeout_us", "%u", &store);
> +				igt_abort_on_f(store != pts[i][j],
> +					       "preempt_timeout_us not restored!\n");
> +			}
> +
> +			igt_sysfs_free_engine_list(list, size);
> +			close(engines_fd[i]);
> +			close(gt_fd[i]);
> +		}
> +
>  		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
> index cf95a3ac1c..22c543692c 100644
> --- a/tests/intel/xe_sysfs_timeslice_duration.c
> +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> @@ -142,6 +142,7 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
>  	set_timeslice_duration(engine, saved);
>  }
>  
> +#define	MAX_GTS	8
>  igt_main
>  {
>  	static const struct {
> @@ -155,8 +156,10 @@ igt_main
>  				       "timeslice_duration_min",
>  				       "timeslice_duration_max"}, };
>  	int count = sizeof(property) / sizeof(property[0]);
> +	int gt_count = 0;
>  	int fd = -1, sys_fd, gt;
> -	int engines_fd = -1, gt_fd = -1;
> +	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
> +	unsigned int tds[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -164,25 +167,61 @@ igt_main
>  		sys_fd = igt_sysfs_open(fd);
>  		igt_require(sys_fd != -1);
>  		close(sys_fd);
> +
> +		xe_for_each_gt(fd, gt) {
> +			int *list, size;
> +			igt_require(gt_count < MAX_GTS);
> +
> +			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
> +			igt_require(gt_fd[gt_count] != -1);
> +			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
> +			igt_require(engines_fd[gt_count] != -1);
> +
> +			list = igt_sysfs_get_engine_list(engines_fd[gt_count], &size);
> +			igt_require(size > 0);
> +
> +			for (int i = 0; i < size; i++)
> +				igt_require(igt_sysfs_scanf(list[i], "timeslice_duration_us", "%u",
> +							    &tds[gt_count][i]) == 1);
> +
> +			igt_sysfs_free_engine_list(list, size);
> +			gt_count++;
> +		}
>  	}
>  
>  	for (int i = 0; i < count; i++) {
>  		for (typeof(*tests) *t = tests; t->name; t++) {
>  			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
> +				int j = 0;
>  				xe_for_each_gt(fd, gt) {
> -					gt_fd = xe_sysfs_gt_open(fd, gt);
> -					igt_require(gt_fd != -1);
> -					engines_fd = openat(gt_fd, "engines", O_RDONLY);
> -					igt_require(engines_fd != -1);
> -					igt_sysfs_engines(fd, engines_fd, gt, 1, property[i],
> -										 t->fn);
> -					close(engines_fd);
> -					close(gt_fd);
> +					int e = engines_fd[j];
> +
> +					igt_sysfs_engines(fd, e, gt, 1, property[i], t->fn);
> +					j++;
>  				}
>  			}
>  		}
>  	}
>  	igt_fixture {
> +		for (int i = gt_count - 1; i >= 0; i--) {
> +			int *list, size;
> +			list = igt_sysfs_get_engine_list(engines_fd[i], &size);
> +
> +			for (int j = size - 1; j >= 0; j--) {
> +				unsigned int store = UINT_MAX;
> +
> +				igt_assert_lte(0, igt_sysfs_printf(list[j], "timeslice_duration_us",

Same here.
With above fixed you can keep my r-b,

Regards,
Kamil

> +								   "%u", tds[i][j]));
> +				igt_sysfs_scanf(list[j], "timeslice_duration_us", "%u", &store);
> +				igt_abort_on_f(store != tds[i][j],
> +					       "timeslice_duration_us not restored!\n");
> +			}
> +
> +			igt_sysfs_free_engine_list(list, size);
> +			close(engines_fd[i]);
> +			close(gt_fd[i]);
> +		}
> +
>  		drm_close_driver(fd);
>  	}
>  }
> -- 
> 2.43.0
> 
