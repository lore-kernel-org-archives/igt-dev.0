Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77497D6552F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 17:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181A810E966;
	Tue, 26 Nov 2024 17:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfBRgmon";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094AB10E966
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732641324; x=1764177324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dIMy/aHUctwxDdJE98MN1pWkHbBqMRpOYX7Ur2AqakE=;
 b=JfBRgmone4x/GND5VLlfsUKOzgdYfcXIeXRN/hLnzYzlAh4F+R20x+ap
 5GbtTtxTzaPwEgOMkzdB+Hepcv9KCeBn+2EPdSyxFV1HyrecqKePqWudX
 MXCw05CCNLImZGAet/JieVLypLZMqWgV08ww5UqIWOq7T2lntvBwRrLMg
 CkiPTF2rFGqpTBOXWRtkyMFkXZPTsKRwoAnv3BK0JYA6ZQb4xQs/hTaD/
 JVLtOcBK/AfI6pAe12Xy+OEiwV9Sm5TkAvPTe98DkcMZlb002aYV3YAu/
 5PsKaf1vYscf36Ndty4Mg3qZcvOO812Xlh0LUFC+JZg0aV38HWOjNdkQo Q==;
X-CSE-ConnectionGUID: 7zKWpv88Se2UNPSg/pWcww==
X-CSE-MsgGUID: 4eegwCcdSnahAvRqn3j6ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43474773"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43474773"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:15:23 -0800
X-CSE-ConnectionGUID: utwnvObgSnOtzIrz4w0kzg==
X-CSE-MsgGUID: ba1kNne/TFGENV+ceBCYdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91623925"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:15:22 -0800
Date: Tue, 26 Nov 2024 18:15:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH v7 4/4] tests/intel/xe_sysfs_scheduler: Assert sysfs
 params are restored
Message-ID: <20241126171519.inqjx7nnjsm26wlo@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 vinay.belgaumkar@intel.com
References: <20241118180511.64212-1-jonathan.cavitt@intel.com>
 <20241118180511.64212-5-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118180511.64212-5-jonathan.cavitt@intel.com>
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
On 2024-11-18 at 18:05:11 +0000, Jonathan Cavitt wrote:
> The xe_sysfs_scheduler tests modify various sysfs parameters.  At the
> end of the test, the sysfs parameters are restored, but we do not
> currently assert that the restoration process completes successfully.
> Assert the restoration is successful.
> 
> Additionally, when the tests fail, it is possible that the various
> modified sysfs parameters may be left in modified states, which can
> cause future tests to behave unpredictably.  At the end of the test,
> attempt to restore all modified sysfs parameters to their original
> values, aborting all tests if this is unsuccessful.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/xe_sysfs_scheduler.c | 82 ++++++++++++++++++++++++++++----
>  1 file changed, 72 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> index 947dbdbc9b..9e04b5c418 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -107,10 +107,19 @@ static void test_min_max(int xe, int engine, const char **property,
>  
>  	/* Reset property, max, min to original values */
>  	igt_sysfs_printf(engine, property[0], "%d", store);
> +	igt_sysfs_scanf(engine, property[0], "%u", &set);
> +	igt_assert_eq(set, store);
> +
>  	igt_sysfs_printf(engine, property[1], "%d", default_min);
> +	igt_sysfs_scanf(engine, property[1], "%u", &set);
> +	igt_assert_eq(set, default_min);
> +
>  	igt_sysfs_printf(engine, property[2], "%d", default_max);
> +	igt_sysfs_scanf(engine, property[2], "%u", &set);
> +	igt_assert_eq(set, default_max);
>  }
>  
> +#define MAX_GTS 8
>  igt_main
>  {
>  	static const struct {
> @@ -126,10 +135,14 @@ igt_main
>  				      {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
>  				      {"job_timeout_ms", "job_timeout_min", "job_timeout_max"},
>  	};
> +
> +	unsigned int store[MAX_GTS][3][3];
>  	int count = sizeof(property) / sizeof(property[0]);
> +	int gt_count = 0;
>  	int xe = -1;
>  	int sys_fd;
>  	int gt;
> +	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
>  
>  	igt_fixture {
>  		xe = drm_open_driver(DRIVER_XE);
> @@ -138,28 +151,77 @@ igt_main
>  		sys_fd = igt_sysfs_open(xe);
>  		igt_require(sys_fd != -1);
>  		close(sys_fd);
> +
> +		xe_for_each_gt(xe, gt) {
> +			int *list, size;
> +			igt_require(gt_count < MAX_GTS);
> +
> +			gt_fd[gt_count] = xe_sysfs_gt_open(xe, gt);
> +			igt_require(gt_fd[gt_count] != -1);
> +			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
> +			igt_require(engines_fd[gt_count] != -1);
> +
> +			list = igt_sysfs_get_engine_list(engines_fd[gt_count], &size);
> +			igt_require(size > 0);
> +
> +			for (int i = 0; i < size; i++) {
> +				for (int j = 0; j < count; j++) {
> +					const char **pl = property[j];
> +					for (int k = 0; k < 3; k++) {
> +						unsigned int *loc = &store[i][j][k];
> +
> +						igt_require(igt_sysfs_scanf(list[i], pl[k],
> +									    "%u", loc) == 1);
> +					}
> +				}
> +			}
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
>  				xe_for_each_gt(xe, gt) {
> -					int engines_fd = -1;
> -					int gt_fd = -1;
> +					int e = engines_fd[j];
>  
> -					gt_fd = xe_sysfs_gt_open(xe, gt);
> -					igt_require(gt_fd != -1);
> -					engines_fd = openat(gt_fd, "engines", O_RDONLY);
> -					igt_require(engines_fd != -1);
> -
> -					igt_sysfs_engines(xe, engines_fd, 0, 0, property[i], t->fn);
> -					close(engines_fd);
> -					close(gt_fd);
> +					igt_sysfs_engines(xe, e, 0, 0, property[i], t->fn);
> +					j++;
>  				}
>  			}
>  		}
>  	}
> +
>  	igt_fixture {
> +		for (int gtn = gt_count - 1; gtn >= 0; gtn--) {
> +			int *list, size;
> +			list = igt_sysfs_get_engine_list(engines_fd[gtn], &size);
> +
> +			for (int i = size - 1; i >= 0; i--) {
> +				int e = list[i];
> +				for (int j = count - 1; j >= 0; j--) {
> +					const char **pl = property[j];
> +					for (int k = 2; k >= 0; k--) {
> +						unsigned int read = UINT_MAX;
> +						unsigned int val = store[i][j][k];
> +
> +						igt_assert_lte(0, igt_sysfs_printf(e, pl[k],

This should be igt_abort, with this fixed you can add my r-b.

Regards,
Kamil

> +									           "%u", val));
> +						igt_sysfs_scanf(e, pl[k], "%u", &read);
> +						igt_abort_on_f(read != val,
> +							       "%s not restored!\n", pl[k]);
> +					}
> +				}
> +			}
> +
> +			igt_sysfs_free_engine_list(list, size);
> +			close(engines_fd[gtn]);
> +			close(gt_fd[gtn]);
> +		}
> +				
>  		xe_device_put(xe);
>  		close(xe);
>  	}
> -- 
> 2.43.0
> 
