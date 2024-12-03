Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D497E74AC3
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 18:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CFF10E496;
	Tue,  3 Dec 2024 18:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IyyMHcrR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3248210EB17
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733250994; x=1764786994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8IFUEfPVPSSxwasxvyE/8VwgVsVjde3yuuIX3FEoKOw=;
 b=IyyMHcrR0b3yCtBLhaz67zP184+Bd752IRWB/xANhY0KtXp7JrZRf8+g
 0w5vZOrd10Y0bV/SjN6UK28xvjfes0wNR/DCX/KO5xztWdBnNaJsDBxgx
 alfGfxiRL2aNdrfALR7Qr8seOPlB/Bi+F1+/sicKj8toQ31b0LIxs1v/n
 w9zqdUJYalfQxO5VfIkhKLNqKzQZz31HN6xLk2FLQHVTcfTM24lgdb//N
 B+KAjalm8pY+JsuLgqOb9pGeVhBg4bcHmrmLauiwBgeRBdgjZ7Tff0OZU
 4pBt5A56S99TYAmktuCkDtCOTJFAPXv32rTW4szLQce0ncw5dwnAvxBZ+ A==;
X-CSE-ConnectionGUID: vXrFN5czR0aOgSFgkeyFnw==
X-CSE-MsgGUID: MmDeaA1SQeSrScnsfLd3+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37421505"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="37421505"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 10:36:33 -0800
X-CSE-ConnectionGUID: 0I3nhPWtTvSBinSizETWXQ==
X-CSE-MsgGUID: sabUifNXThCLFZB+TCzJVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98536279"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 10:36:32 -0800
Date: Tue, 3 Dec 2024 19:36:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH v8 4/4] tests/intel/xe_sysfs_scheduler: Assert sysfs
 params are restored
Message-ID: <20241203183629.nta4orjlcmevzctg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
References: <20241202180816.47538-1-jonathan.cavitt@intel.com>
 <20241202180816.47538-5-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202180816.47538-5-jonathan.cavitt@intel.com>
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
On 2024-12-02 at 18:08:16 +0000, Jonathan Cavitt wrote:
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
>  tests/intel/xe_sysfs_scheduler.c | 88 ++++++++++++++++++++++++++++----
>  1 file changed, 78 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> index 947dbdbc9b..7b7cd960c6 100644
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
> @@ -138,28 +151,83 @@ igt_main
>  		sys_fd = igt_sysfs_open(xe);
>  		igt_require(sys_fd != -1);
>  		close(sys_fd);
> +
> +		xe_for_each_gt(xe, gt) {
> +			int *list, i = 0;

List should be global in igt_main.

> +
> +			igt_require(gt_count < MAX_GTS);
> +
> +			gt_fd[gt_count] = xe_sysfs_gt_open(xe, gt);
> +			igt_require(gt_fd[gt_count] != -1);
> +			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
> +			igt_require(engines_fd[gt_count] != -1);
> +
> +			list = igt_sysfs_get_engine_list(engines_fd[gt_count]);
> +
> +			while (list[i] != -1) {
> +				for (int j = 0; j < count; j++) {
> +					const char **pl = property[j];
> +
> +					for (int k = 0; k < 3; k++) {
> +						unsigned int *loc = &store[i][j][k];
> +
> +						igt_require(igt_sysfs_scanf(list[i], pl[k],
> +									    "%u", loc) == 1);
> +					}
> +				}
> +				i++;
> +			}
> +
> +			igt_require(i > 0);
> +			igt_sysfs_free_engine_list(list);
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
> -
> -					gt_fd = xe_sysfs_gt_open(xe, gt);
> -					igt_require(gt_fd != -1);
> -					engines_fd = openat(gt_fd, "engines", O_RDONLY);
> -					igt_require(engines_fd != -1);
> +					int e = engines_fd[j];
>  
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
> +			int *list, i = 0;
> +
> +			list = igt_sysfs_get_engine_list(engines_fd[gtn]);

It should be filled in first igt_fixture and removed from this.
With this fixed you could add my r-b.

Regards,
Kamil

> +
> +			while (list[i] != -1) {
> +				int e = list[i];
> +
> +				for (int j = count - 1; j >= 0; j--) {
> +					const char **pl = property[j];
> +
> +					for (int k = 2; k >= 0; k--) {
> +						unsigned int read = UINT_MAX;
> +						unsigned int val = store[i][j][k];
> +
> +						igt_sysfs_printf(e, pl[k], "%u", val);
> +						igt_sysfs_scanf(e, pl[k], "%u", &read);
> +						igt_abort_on_f(read != val,
> +							       "%s not restored!\n", pl[k]);
> +					}
> +				}
> +				i++;
> +			}
> +
> +			igt_sysfs_free_engine_list(list);
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
