Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911ABECE577
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 18:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA0510E5A8;
	Mon,  9 Sep 2024 18:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOVVRC05";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212FF10E5A8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 18:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725904851; x=1757440851;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GfJnjFy5IeIJGu4A3/Dt56Yb/TiuCAmAARmy6RsKw/o=;
 b=bOVVRC05ANjayE4dDt4SnSIU6yZA555TJjnSA9fuCGEnibZ58DeKPY3h
 YryH4nzMN+qsb9K8SjXlRK6ymOuXS54/GG8YA1n9BzlvIvT+Qg7ns96qX
 +GpTR/lgajQS8HZyoAM4TICgCpBxSE2SIW5qZM4KvvO/atyI/6wnwgmxJ
 6S8H8vdcPM0477rDNc5giZYp8Q1SxrhVzpmc61PUIzOStQGQOGlQUc0NW
 i8T43JxQKTFIlTg4GNI2JkJRx07bp+sc9J+ni2K0+r3S6PWyXl1fKPvv5
 MQwdMu9sU1SB/JVqygJkzMofuP6k7yhTqJUws/+k/SrKxEHfufx+n46oV w==;
X-CSE-ConnectionGUID: FmNUh4k5T5SEvEgDrohooQ==
X-CSE-MsgGUID: gKHaAX6ZQEie7tCcCMA1Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="27540291"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="27540291"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 11:00:50 -0700
X-CSE-ConnectionGUID: ALTJixj/QYmOuBGgeZUXWA==
X-CSE-MsgGUID: HtkYZfZ2RQSVg7e71JEm1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="104214065"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.215.122.181])
 ([10.215.122.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 11:00:49 -0700
Message-ID: <6d912f26-b9a9-49d0-9ec2-19cf03812765@intel.com>
Date: Mon, 9 Sep 2024 23:30:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/kms_async_flips: add async flips suspend
 resume tests
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com
References: <20240906072824.509607-1-santhosh.reddy.guddati@intel.com>
 <20240906072824.509607-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240906072824.509607-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Santosh,

Please find my review comments below:

Fix subject,
s/tests/test

Also, cover-letter can be avoided for single patch.

On 06-Sep-24 12:58 PM, Santhosh Reddy Guddati wrote:
> ---

Commit message missing. Please add.

>   tests/kms_async_flips.c | 53 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5b70c4033..fd851397e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -66,6 +66,9 @@
>    *
>    * SUBTEST: invalid-async-flip
>    * Description: Negative case to verify if changes in fb are rejected from kernel as expected
> + *
> + * SUBTEST: async-flip-suspend-resume
> + * Description: Verify the async flip functionality with suspend and resume cycle
>    */
>   
>   #define CURSOR_POS 128
> @@ -672,6 +675,51 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   	}
>   }
>   
> +static void test_async_flip_suspend_resume(data_t *data)

Instead of adding new func(), is it possible to modify test_async_flip() 
to accommodate suspend resume api calls ?

> +{
> +	int ret, frame;
> +	long long int fps;
> +	struct timeval start, end, diff;
> +	int suspend_time = 1;
> +	int resume_time = 1;
> +
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	gettimeofday(&start, NULL);
> +	frame = 1;
> +	do {
> +		int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> +
> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> +				      data->bufs[frame % NUM_FBS].fb_id,
> +				      flags, data);
> +		igt_assert_eq(ret, 0);
> +
> +		wait_flip_event(data);
> +
> +		gettimeofday(&end, NULL);
> +		timersub(&end, &start, &diff);
> +
> +		if (diff.tv_sec == suspend_time) {
> +			igt_info("system suspending\n");
> +			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +			suspend_time = 0;
> +		}
> +
> +		if (diff.tv_sec == resume_time) {
> +			igt_info("system resuming\n");
> +			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +			resume_time = 0;
> +		}
> +
> +		frame++;
> +	} while (diff.tv_sec < RUN_TIME);
> +
> +	fps = frame * 1000 / RUN_TIME;
> +	igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
> +		     "FPS should be significantly higher than the refresh rate\n");
> +}
> +
>   static data_t data;
>   
>   igt_main
> @@ -750,6 +798,11 @@ igt_main
>   		run_test(&data, test_crc);
>   	}
>   
> +	igt_describe("Verify the async flip functionality after suspend and resume cycle");
> +	igt_subtest_with_dynamic("async-flip-suspend-resume") {
> +		run_test(&data, test_async_flip_suspend_resume);
> +	}
> +
>   	igt_fixture {
>   		for (i = 0; i < NUM_FBS; i++)
>   			igt_remove_fb(data.drm_fd, &data.bufs[i]);
