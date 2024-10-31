Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58182D767F6
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 18:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B0510E03D;
	Thu, 31 Oct 2024 18:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hm+oH8iz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D46410E03D
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730398587; x=1761934587;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lBv9liKnPVH6X8oe3lL6LktgH8jsNeFqpmjP2mzEfn8=;
 b=hm+oH8izIqk2AkrGT2lBAv6UXv16qws5ToUJq2aAkp4j/BJMaqlrU2YI
 AGTihUSCsLggpVqvShW1HHlKuHJcZ4pR8v0PuD9Y7hXr3id8aNuKUm+SQ
 e2M+YmV9s1ri42+aeBceZJcFf9JRn+Q770o0KTNqjbEPpnDh7X2c+RezT
 Wk/3R1vxff8AioezfHSJjT/trX3nPLG9o0CsrPJL0PGfvJlfTLpYhY03n
 KFFfQ2IWEmHCO0QY7LK2Mf/k84FXzXRhBSA77WQ8eNYn2VpUatry4Cp2N
 v5mI/GFUpuNDpfpBuWgRLyzdJRkj0shmhzZ2Yt+wetpOr+lXucdXub0al Q==;
X-CSE-ConnectionGUID: 0QctYYC3RguzsGNk4FHrbA==
X-CSE-MsgGUID: oSpcFYsnRrWDRuX04aJm9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29927631"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29927631"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:16:26 -0700
X-CSE-ConnectionGUID: cRBfjZOFS1GzCDB51L/Nzg==
X-CSE-MsgGUID: 52MPsuVYTmyVlevGhdraFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="113555514"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:16:24 -0700
Date: Thu, 31 Oct 2024 19:16:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH v2 1/2] tests/intel/sysfs: Restore sysfs values on test
 failure
Message-ID: <20241031181622.aslg426dj3ty4jvh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 vinay.belgaumkar@intel.com
References: <20241031163122.37356-1-jonathan.cavitt@intel.com>
 <20241031163122.37356-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241031163122.37356-2-jonathan.cavitt@intel.com>
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
On 2024-10-31 at 16:31:21 +0000, Jonathan Cavitt wrote:
> The tests xe_sysfs_preempt_timeout and xe_sysfs_timeslice_duration
> modify the values of preempt_timeout_us and timeslice_duration_us,
> respectively.  However, on a test failure, it is possible that these
> values may remain in their modified states, resulting in the values
> being used in future tests and causing unexpected behavior.
> 
> Save the respective modified values before starting the test and attempt
> to restore the values on test exit.
> 
> Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Thank you for the patch, I have few nits, see below.

> ---
>  tests/intel/xe_sysfs_preempt_timeout.c    | 34 ++++++++++++++++-------
>  tests/intel/xe_sysfs_timeslice_duration.c | 33 ++++++++++++++++------
>  2 files changed, 48 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
> index 7fa0dfcdf7..1b9c26bfdc 100644
> --- a/tests/intel/xe_sysfs_preempt_timeout.c
> +++ b/tests/intel/xe_sysfs_preempt_timeout.c
> @@ -183,8 +183,10 @@ igt_main
>  				       "preempt_timeout_min",
>  				       "preempt_timeout_max"}, };
>  	int count = sizeof(property) / sizeof(property[0]);
> +	int gt_count = 0;
>  	int fd = -1, sys_fd, gt;
> -	int engines_fd = -1, gt_fd = -1;
> +	int engines_fd[8], gt_fd[8];
> +	unsigned int pts[8];

Please use define here, for example
#define MAX_XE_ENGINE 8

	int engines_fd[MAX_XE_ENGINE], gt_fd[MAX_XE_ENGINE];
	unsigned int pts[MAX_XE_ENGINE];

or allocate/realloc/dealloc it (it could be then a struct).

>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -192,26 +194,38 @@ igt_main
>  		sys_fd = igt_sysfs_open(fd);
>  		igt_require(sys_fd != -1);
>  		close(sys_fd);
> +
> +		xe_for_each_gt(fd, gt) {

Check

			igt_require(gt_count < MAX_XE_ENGINE);

or reallocate.

> +			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
> +			igt_require(gt_fd[gt_count] != -1);
> +			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
> +			igt_require(engines_fd[gt_count] != -1);
> +			igt_assert(igt_sysfs_scanf(engines_fd[gt_count],

Why assert? imho igt_require should be enough.

> +						   "preempt_timeout_us",
> +						   "%u", &pts[gt_count]) == 1);
> +			gt_count++;
> +		}
> +
>  	}
>  
>  	for (int i = 0; i < count; i++) {
>  		for (typeof(*tests) *t = tests; t->name; t++) {
>  			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
> +				int j = 0;
>  				xe_for_each_gt(fd, gt) {

Add
			igt_assert(gt_count < MAX_XE_ENGINE);

> -					gt_fd = xe_sysfs_gt_open(fd, gt);
> -					igt_require(gt_fd != -1);
> -					engines_fd = openat(gt_fd, "engines", O_RDONLY);
> -					igt_require(engines_fd != -1);
> -
> -					igt_sysfs_engines(fd, engines_fd, gt, 1, property[i],
> -									  t->fn);
> -					close(engines_fd);
> -					close(gt_fd);
> +					igt_sysfs_engines(fd, engines_fd[j], gt, 1, property[i],
> +										    t->fn);

I would prefere this in one line, or align to 'fd'.

> +					j++;
>  				}
>  			}
>  		}
>  	}
>  	igt_fixture {
> +		for (int i = gt_count - 1; i >= 0; i--) {
> +			set_preempt_timeout(engines_fd[i], pts[i]);
> +			close(engines_fd[i]);
> +			close(gt_fd[i]);
> +		}

Add newline.

>  		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
> index cf95a3ac1c..914575a282 100644
> --- a/tests/intel/xe_sysfs_timeslice_duration.c
> +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> @@ -155,8 +155,10 @@ igt_main
>  				       "timeslice_duration_min",
>  				       "timeslice_duration_max"}, };
>  	int count = sizeof(property) / sizeof(property[0]);
> +	int gt_count = 0;
>  	int fd = -1, sys_fd, gt;
> -	int engines_fd = -1, gt_fd = -1;
> +	int engines_fd[8], gt_fd[8];
> +	unsigned int tds[8];

Same here, use define instead of '8' or dynamic alloc.

>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -164,25 +166,38 @@ igt_main
>  		sys_fd = igt_sysfs_open(fd);
>  		igt_require(sys_fd != -1);
>  		close(sys_fd);
> +
> +		xe_for_each_gt(fd, gt) {

Same here, add guard for 'gt_count < MAX_XE_ENGINE'.

> +			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
> +			igt_require(gt_fd[gt_count] != -1);
> +			engines_fd[gt_count] = openat(gt_fd[gt_count],
> +					                  "engines", O_RDONLY);

One line or align to 'gt_fd[...]'
Btw use checkpatch.pl from linux kernel, here are too many spaces.

> +			igt_require(engines_fd[gt_count] != -1);
> +			igt_assert(igt_sysfs_scanf(engines_fd[gt_count],

Same here, igt_require.

> +						   "timeslice_duration_us",
> +						   "%u", &tds[gt_count]) == 1);
> +			gt_count++;
> +		}
>  	}
>  
>  	for (int i = 0; i < count; i++) {
>  		for (typeof(*tests) *t = tests; t->name; t++) {
>  			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
> +				int j = 0;
>  				xe_for_each_gt(fd, gt) {

Same here, guard 'j < MAX_XE_ENGINE'

> -					gt_fd = xe_sysfs_gt_open(fd, gt);
> -					igt_require(gt_fd != -1);
> -					engines_fd = openat(gt_fd, "engines", O_RDONLY);
> -					igt_require(engines_fd != -1);
> -					igt_sysfs_engines(fd, engines_fd, gt, 1, property[i],
> -										 t->fn);
> -					close(engines_fd);
> -					close(gt_fd);
> +					igt_sysfs_engines(fd, engines_fd[j], gt, 1, property[i],
> +										    t->fn);

Same here, one line or align to 'fd'.

> +					j++;
>  				}
>  			}
>  		}
>  	}
>  	igt_fixture {
> +		for (int i = gt_count - 1; i >= 0; i--) {
> +			set_timeslice_duration(engines_fd[i], tds[i]);
> +			close(engines_fd[i]);
> +			close(gt_fd[i]);
> +		}

Add newline.

With above fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		drm_close_driver(fd);
>  	}
>  }
> -- 
> 2.43.0
> 
