Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040EB606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 16:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OfXucTCo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CEA10F64F;
	Tue, 24 Nov 2026 16:14:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0E910F79C
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795536823; x=1827072823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f7YfFFtbOBhOrp076Qggz0+3+4iOQes8WY2XXGh+FJo=;
 b=OfXucTCo18Cr0nHayh9JflO5FcYswPuXY11BIWG/JRsfOG9sIyAsf/Mt
 1jL+yZZc5qAeJs+hTgYogEQBPkQ4wYMNg6k+O8QHQnSulm3K0cCJRxrap
 xCenti6FP7Do+aL8jc57jru4tSs0MUtNFzqJcsemU/c+pejRCkuXrEOsU
 /1mOUZOjwjp/vz3LYvQkf7UmXbnJL6LTJLTQ134RsFpdQ7UIkl6ZxqnPz
 Nc/tf3XPf6sia00cZEy5/XZzbGW8L9h9a/2EtULt6kGs7MWiHg7LxY3uF
 w4wdoZ6Yq9SXZ2XfNd0eU5lP58m34oHcFF4kB3X9e3dAPLslDwngkmjjk Q==;
X-CSE-ConnectionGUID: /rW86FYBRMiM4frQQTZQyw==
X-CSE-MsgGUID: kHSRr6Q2QIKG9jn51TzB0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4437911"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4437911"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 08:04:40 -0800
X-CSE-ConnectionGUID: UDIsNUATSJWWvMJj1o3n9Q==
X-CSE-MsgGUID: wWFxYAUsQ5KI0f8xYnML3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12189555"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 08:04:40 -0800
Date: Tue, 24 Nov 2026 17:04:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: "Sharma, Nishit" <nishit.sharma@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kempczynski,
 Zbigniew" <zbigniew.kempczynski@intel.com>, 
 "B S, Karthik" <karthik.b.s@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_compute: Use monotonic clock in
 loop-duration-2s
Message-ID: <b6yxt7nygssym375sfotaa32isppakwude5pwfkedkcbtgbyrn@3bk4x55r5eob>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Sharma,
 Nishit" <nishit.sharma@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kempczynski,
 Zbigniew" <zbigniew.kempczynski@intel.com>, 
 "B S, Karthik" <karthik.b.s@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
References: <20261119010857.377785-2-shuicheng.lin@intel.com>
 <bdae5fbd-eb7c-4d18-96f2-2bd53aed2e4a@intel.com>
 <DM4PR11MB5456E36DF756A3F92A13C26FEA442@DM4PR11MB5456.namprd11.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB5456E36DF756A3F92A13C26FEA442@DM4PR11MB5456.namprd11.prod.outlook.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lin,,
On 2026-11-24 at 06:49:55 +0000, Lin, Shuicheng wrote:
> Thanks Nishit for the review.
> 
> Hi all,
> Could you please help me review and merge it?
> Thanks.
> 
> Shuicheng
> 

Applied, thank you all!

Regards,
Kamil

> On Thu, Nov 19, 2026 11:26 AM Nishit Sharma wrote:
> > On 11/19/2026 6:38 AM, Shuicheng Lin wrote:
> > > The subtest times the loop kernel with gettimeofday(), which follows
> > > CLOCK_REALTIME. If the system time is stepped (e.g. by NTP) during the
> > > run, the measured time falls outside (1.8s, 2.2s) and the test fails,
> > > even though the kernel ran for about 2s.
> > >
> > > Use igt_nsec_elapsed(), which is monotonic, and print the measured
> > > time and bounds on failure.
> > >
> > > Reproduced on PTL by stepping the clock with date -s during the test:
> > > the old code fails every time, the fixed code passes.
> > >
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9795
> > > Cc: Nishit Sharma <nishit.sharma@intel.com>
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > ---
> > >   tests/intel/xe_compute.c | 18 +++++++-----------
> > >   1 file changed, 7 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c index
> > > e738c9dab..ee376fd88 100644
> > > --- a/tests/intel/xe_compute.c
> > > +++ b/tests/intel/xe_compute.c
> > > @@ -207,12 +207,6 @@ test_compute_kernel_with_ccs_mode(void)
> > >   	igt_require(num_gt_with_ccs_mode > 0);
> > >   }
> > >
> > > -static double elapsed(const struct timeval *start,
> > > -		      const struct timeval *end)
> > > -{
> > > -	return (end->tv_sec - start->tv_sec) + 1e-6*(end->tv_usec - start-
> > >tv_usec);
> > > -}
> > > -
> > >   /**
> > >    * SUBTEST: loop-duration-2s
> > >    * Functionality: OpenCL kernel
> > > @@ -228,7 +222,6 @@ test_compute_kernel_loop(uint64_t loop_duration)
> > >   	const struct intel_compute_kernels *kernels;
> > >   	struct user_execenv execenv = { 0 };
> > >   	struct drm_xe_engine_class_instance *hwe;
> > > -	struct timeval start, end;
> > >   	double elapse_time, lower_bound, upper_bound;
> > >
> > >   	fd = drm_open_driver(DRIVER_XE);
> > > @@ -247,20 +240,23 @@ test_compute_kernel_loop(uint64_t
> > loop_duration)
> > >   	execenv.kernel_size = kernels->loop_kernel_size;
> > >
> > >   	xe_for_each_engine(fd, hwe) {
> > > +		struct timespec start = {};
> > > +
> > >   		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> > >   			continue;
> > >
> > >   		igt_info("Running loop_kernel on ccs engine %d\n", hwe-
> > >engine_instance);
> > > -		gettimeofday(&start, NULL);
> > > +		igt_nsec_elapsed(&start);
> > >   		igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd,
> > hwe, &execenv,
> > >
> > EXECENV_PREF_SYSTEM),
> > >   			     "Unable to run compute kernel successfully\n");
> > > -		gettimeofday(&end, NULL);
> > > -		elapse_time = elapsed(&start, &end);
> > > +		elapse_time = igt_nsec_elapsed(&start) / 1e9;
> > >   		lower_bound = loop_duration / 1e6 - DURATION_MARGIN;
> > >   		upper_bound = loop_duration / 1e6 + DURATION_MARGIN;
> > >
> > > -		igt_assert(lower_bound < elapse_time && elapse_time <
> > upper_bound);
> > > +		igt_assert_f(lower_bound < elapse_time && elapse_time <
> > upper_bound,
> > > +			     "Elapsed time %.3fs out of range (%.3fs, %.3fs)\n",
> > > +			     elapse_time, lower_bound, upper_bound);
> > >   	}
> > >   	drm_close_driver(fd);
> > >   }
> > 
> > 
> > LGTM:
> > 
> > Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
> 
