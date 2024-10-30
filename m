Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D175DD5CCA6
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 12:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8782510E0C2;
	Wed, 30 Oct 2024 12:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IY5ZG8SD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F262E10E0C2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 12:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730292689; x=1761828689;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DGqSwvxLVkx66vO5ciQJmLLh5nKY68Sw7nMm6wMl3Hk=;
 b=IY5ZG8SDnyaq8MtsyA7bes9xkO8QOrSGtZ0KpNMlwH3y8p29fYb3Nww2
 KvSVv609T3WhAPh/FyPtF+C7hAWCN6/BxJ5pZKh5+koPAiGQ4BoLvnaCN
 qXkYiSLYigwA5YI1WOwXMA6DBTGAj64SzieAjfSP6TthDn1LDc7sez4Nq
 J8mvHmUZK88YqtcMfBYtentxyYOzanoV7Q75YPPhPe7trMDqDHv86774l
 ADqNK3B04wRtGqBtzQ/5jyGxnH86QSkf9vzuhZFEoCm5rbTWtwdkRoiRf
 r2wjw4vtkV2Pyih/SimJqDy8AGGkGhQJGztVuqhdt62tK7G2tmNneKyl2 Q==;
X-CSE-ConnectionGUID: fWIwLQnZTu63joxsk4dflA==
X-CSE-MsgGUID: BBPOOzjeRaeRuTgQgw/6Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40523205"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40523205"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 05:51:28 -0700
X-CSE-ConnectionGUID: f0B+ilSQTfmHIN+Z7UyMTw==
X-CSE-MsgGUID: HJs2L6HFQz2KJg3Wh02IHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="82388424"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 05:51:27 -0700
Date: Wed, 30 Oct 2024 13:51:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Restore preempt
 timeout
Message-ID: <20241030125124.234xdbbvwqfirvl7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 vinay.belgaumkar@intel.com
References: <20241029213621.170938-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241029213621.170938-1-jonathan.cavitt@intel.com>
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
On 2024-10-29 at 21:36:21 +0000, Jonathan Cavitt wrote:
> The subtests of sysfs_timeslice_duration modify the preempt_timeout_us
> and timeslice_duration_us values.  However, while the test does restore
> the timeslice_duration_us value at the end of execution, it does not do
> the same for preempt_timeout_us.  Because the value is not properly
> restored, future tests can end up using the unexpected preempt timeout
> value and thus have unexpected behavior.
> 
> Save and restore the preempt_timeout_us value during the test.
> 
> This fix does not apply to xe_sysfs_preempt_timeout because only the
> preempt_timeout_us is modified during those tests, and the value is
> correcty restored before the tests end.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2976
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  tests/intel/xe_sysfs_timeslice_duration.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
> index cf95a3ac1c..6912f166b4 100644
> --- a/tests/intel/xe_sysfs_timeslice_duration.c
> +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> @@ -115,10 +115,11 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
>  static void test_timeout(int fd, int engine, const char **property, uint16_t class, int gt)
>  {
>  	uint64_t delays[] = { 1000, 50000, 100000, 500000 };
> -	unsigned int saved;
> +	unsigned int saved, old_pt;
>  	uint64_t elapsed;
>  	uint64_t epsilon;
>  
> +	igt_assert(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &old_pt) == 1);
>  	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u", 1) == 1);
>  	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) == 1);
>  	igt_debug("Initial %s:%u\n", property[0], saved);
> @@ -140,6 +141,9 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
>  	}
>  
>  	set_timeslice_duration(engine, saved);
> +	igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us", "%u", old_pt));

Looks good but it will not reach this line if any
igt_assert/require triggers before.

Regards,
Kamil

> +	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
> +	igt_assert_eq(saved, old_pt);
>  }
>  
>  igt_main
> -- 
> 2.43.0
> 
