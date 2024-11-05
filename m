Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D956FD31769
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 17:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937F610E418;
	Tue,  5 Nov 2024 17:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDfrHndU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C13010E418
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 17:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730829003; x=1762365003;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vIIXiUJb++2Vn50NjcX/RAki/nDSyj5o/AcJEYlUZ+k=;
 b=ZDfrHndUsOEyZf5prE5Dq6gq0Unq9rO1AibvfT7A0T8LauDyTydo09EP
 OyCosmCdS9QmTWbC9eSRU6+M/uA5KCD7Pv6qBXXOIPBmnUHhHZnATX2In
 4OWxV/uyKyIebB51hrS9/NYNTAU3uvnX1c1q/YNDCxR3YOJGCq5T71WxP
 Vv++qALYHMDDQikHmqLFcVOG1x7rMPQo1jW9VSK9tYMBv/aZuhuTBWfIe
 C0PVcICAsI59s9hpnXzuNc8OhBj/ORMmBC4q3OjpupuhGBwun9P0eRbNs
 ao+OSRuicH2Z8tjuvCSJ/E+cmGDQXIdsqkPVO8gRJgYXES77RZNYtdgkF w==;
X-CSE-ConnectionGUID: uwQw9sS+SIS6RRdoVPGeoA==
X-CSE-MsgGUID: dDG3qhe6QHSDDTgEPBGpig==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="55991064"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="55991064"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:50:03 -0800
X-CSE-ConnectionGUID: cADbmEbSTaeSadHOL03C5Q==
X-CSE-MsgGUID: 5iBlakgNQTG/Lcy+YAlXbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="107425769"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 09:50:01 -0800
Date: Tue, 5 Nov 2024 18:49:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH v3 1/2] tests/intel/sysfs: Restore sysfs values on test
 failure
Message-ID: <20241105174946.6zldfd2n5vykcpnt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 vinay.belgaumkar@intel.com
References: <20241105154823.66078-1-jonathan.cavitt@intel.com>
 <20241105154823.66078-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105154823.66078-2-jonathan.cavitt@intel.com>
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
On 2024-11-05 at 15:48:22 +0000, Jonathan Cavitt wrote:

please add 'xe_' in subject, instead of:

[PATCH v3 1/2] tests/intel/sysfs: Restore sysfs values on test failure

better:

[PATCH v3 1/2] tests/intel/xe_sysfs*: Restore values on test failure

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
> Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  tests/intel/xe_sysfs_preempt_timeout.c    | 43 +++++++++++++++++------
>  tests/intel/xe_sysfs_timeslice_duration.c | 42 +++++++++++++++++-----
>  2 files changed, 66 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
> index 7fa0dfcdf7..3bfda826d4 100644
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
> +	unsigned int pts[MAX_GTS];
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -192,26 +195,46 @@ igt_main
>  		sys_fd = igt_sysfs_open(fd);
>  		igt_require(sys_fd != -1);
>  		close(sys_fd);
> +
> +		xe_for_each_gt(fd, gt) {
> +			igt_require(gt_count < MAX_GTS);
> +
> +			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
> +			igt_require(gt_fd[gt_count] != -1);
> +			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
> +			igt_require(engines_fd[gt_count] != -1);
> +			igt_require(igt_sysfs_scanf(engines_fd[gt_count],
> +						    "preempt_timeout_us",
> +						    "%u", &pts[gt_count]) == 1);
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

Add newline.

> +					igt_sysfs_engines(fd, e, gt, 1, property[i], t->fn);
> +					j++;
>  				}
>  			}
>  		}
>  	}
>  	igt_fixture {
> +		for (int i = gt_count - 1; i >= 0; i--) {
> +			int store;
> +
> +			igt_assert_lte(0, igt_sysfs_printf(engines_fd[i], "preempt_timeout_us",
> +							   "%u", pts[i]));
> +			igt_sysfs_scanf(engines_fd[i], "preempt_timeout_us", "%u", &store);
> +			igt_abort_on_f(store != pts[i], "preempt_timeout_us not restored!\n");
> +
> +			close(engines_fd[i]);
> +			close(gt_fd[i]);
> +		}
> +
>  		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
> index cf95a3ac1c..b34d78a784 100644
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
> +	unsigned int tds[MAX_GTS];
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -164,25 +167,46 @@ igt_main
>  		sys_fd = igt_sysfs_open(fd);
>  		igt_require(sys_fd != -1);
>  		close(sys_fd);
> +
> +		xe_for_each_gt(fd, gt) {
> +			igt_require(gt_count < MAX_GTS);
> +
> +			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
> +			igt_require(gt_fd[gt_count] != -1);
> +			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
> +			igt_require(engines_fd[gt_count] != -1);
> +			igt_require(igt_sysfs_scanf(engines_fd[gt_count],
> +						    "timeslice_duration_us",
> +						    "%u", &tds[gt_count]) == 1);
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

Add newline.

With above fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +					igt_sysfs_engines(fd, e, gt, 1, property[i], t->fn);
> +					j++;
>  				}
>  			}
>  		}
>  	}
>  	igt_fixture {
> +		for (int i = gt_count - 1; i >= 0; i--) {
> +			unsigned int store;
> +
> +			igt_assert_lte(0, igt_sysfs_printf(engines_fd[i], "timeslice_duration_us",
> +							   "%u", tds[i]));
> +			igt_sysfs_scanf(engines_fd[i], "timeslice_duration_us", "%u", &store);
> +			igt_abort_on_f(store != tds[i], "timeslice_duration_us not restored!\n");
> +
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
