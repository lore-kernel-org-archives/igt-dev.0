Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767AAC369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 10:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32ED710E306;
	Thu, 24 Apr 2025 10:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjWQiBG6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1DD10E306
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 10:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745490098; x=1777026098;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BF6EPe9nWM72Lx89TgYsLuiq/lEW8v7ocmeKtma1Njg=;
 b=gjWQiBG6AFpDapX+c2j7MkhwZHOs6p3mm/SePxnfRnckMrvAdJAaIkV3
 jsjj8c3KqnpdFuhS1sf0Xzp6n39SliicnL0BpgTkrAiNPcsw1DygnkdWQ
 P0c5yVHDoCXOskAMRvXtLPiQcPdLy4Y6KAfZu6LyfLD99jyl9WL+7IpJb
 iHcea0v3UBYRlAo8divjeq23G80/Sz3rfsoI7J6epefwDey+QSg98v3Ze
 wiMhqJmM2TrLhqXVXgdJTuXei3p5a07Q4rc10al0wLwjhOTGuXEkKWhBW
 8UWyn8+8gK9QEPPrLQykCTx9zO2ofRWcRFw1V6bvYjT9KuHOyGJxiNbaZ w==;
X-CSE-ConnectionGUID: HuBTwUHrT/+Q4MWrkM1T6w==
X-CSE-MsgGUID: x1UiKRB7SgGunSFWxxZ9Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46984987"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="46984987"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 03:21:38 -0700
X-CSE-ConnectionGUID: /6xxD8aNSWqpzlV9Hp2crA==
X-CSE-MsgGUID: PyGWcohLRnyor2Eq7mNNCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="132484190"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:21:36 -0700
Date: Thu, 24 Apr 2025 12:21:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 1/1] tests/intel/xe_eu_stall: Add tests to run blocking
 and non-blocking read twice
Message-ID: <20250424102122.fp555xr6zvrfwvvi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>,
 igt-dev@lists.freedesktop.org
References: <eef990ac70dd804c500c31d801e7329a364cd6fd.1745376823.git.harish.chegondi@intel.com>
 <87a58623sp.wl-ashutosh.dixit@intel.com>
 <aAljdg7bjcW9Fbbl@intel.com>
 <875xiu5v3a.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875xiu5v3a.wl-ashutosh.dixit@intel.com>
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

Hi Dixit,,
On 2025-04-23 at 16:14:33 -0700, Dixit, Ashutosh wrote:
> On Wed, 23 Apr 2025 15:02:30 -0700, Harish Chegondi wrote:
> >
> > On Wed, Apr 23, 2025 at 10:20:06AM -0700, Dixit, Ashutosh wrote:
> > > On Tue, 22 Apr 2025 19:57:34 -0700, Harish Chegondi wrote:
> > > >
> > > > Add tests that enable EU stall sampling, read all the EU stall data and
> > > > disable EU stall sampling, two times back to back. Add tests for both
> > > > blocking and non-blocking reads. Also, add a check for the presence of
> > > > /proc/sys/dev/xe/observation_paranoid file which is required for the
> > > > unprivileged-access test.

imho that second change should go in separate patch.

> > > >
> > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > ---
> > > >  tests/intel/xe_eu_stall.c | 44 ++++++++++++++++++++++++++++++---------
> > > >  1 file changed, 34 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> > > > index da9bd7843..15d4589c6 100644
> > > > --- a/tests/intel/xe_eu_stall.c
> > > > +++ b/tests/intel/xe_eu_stall.c
> > > > @@ -14,9 +14,15 @@
> > > >   * SUBTEST: non-blocking-read
> > > >   * Description: Verify non-blocking read of EU stall data during a workload run
> > > >   *
> > > > + * SUBTEST: non-blocking-read-twice
> > > > + * Description: Run non-blocking read test twice with disable and enable between the runs
> > > > + *
> > > >   * SUBTEST: blocking-read
> > > >   * Description: Verify blocking read of EU stall data during a workload run
> > > >   *
> > > > + * SUBTEST: blocking-read-twice
> > > > + * Description: Run blocking read test twice with disable and enable between the runs
> > > > + *
> > >
> > > Not sure about the "read-twice" name, i.e. not sure if that name clearly
> > > communicates the purpose of these new tests. The purpose to me seems that
> > > reads can be done after a disable and enable, correct?
> > >
> > > Maybe "blocking-enable-disable" and "non-blocking-enable-disable" are
> > > better names?
> > Yes I will change the names. How about non-blocking-read-after-re-enable
> > and blocking-read-after-re-enable ? This would convey that the test
> > would enable two times and a read after the second enable ?
> 
> "read" is sort of obvious, e.g. OA uses "blocking" and "non-blocking" as
> the names, without "read". So, in the interest of keeping the names short,
> I would just name them "non-blocking-re-enable" and
> "blocking-re-enable". But anyway, the final choice of the names is yours,
> the patch already has a R-b :)
> 

I agree here, please keep names short and informative (which is hard...).

> > >
> > > Otherwise this is:
> > >
> > > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > >
> > > Let me know if you are going to change the names. Thanks.
> > >
> > > >   * SUBTEST: unprivileged-access
> > > >   * Description: Verify unprivileged open of a EU stall data stream fd
> > > >   *
> > > > @@ -33,6 +39,7 @@
> > > >  #include <fcntl.h>
> > > >  #include <poll.h>
> > > >  #include <sys/ioctl.h>
> > > > +#include <sys/stat.h>
> > > >  #include <sys/wait.h>
> > > >
> > > >  #include "igt.h"
> > > > @@ -460,13 +467,13 @@ static void print_eu_stall_data(uint32_t devid, uint8_t *buf, size_t size)
> > > >   * while the parent process reads the stall counters data, disables EU stall
> > > >   * counters once the workload completes execution.
> > > >   */
> > > > -static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> > > > +static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int iter)
> > > >  {
> > > > -	uint32_t num_samples = 0, num_drops = 0;
> > > > +	uint32_t num_samples, num_drops;
> > > >	struct igt_helper_process work_load = {};
> > > >	struct sigaction sa = { 0 };
> > > >	int ret, flags, stream_fd;
> > > > -	uint64_t total_size = 0;
> > > > +	uint64_t total_size;
> > > >	uint8_t *buf;
> > > >
> > > >	uint64_t properties[] = {
> > > > @@ -520,7 +527,7 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> > > >		flags = O_CLOEXEC;
> > > >
> > > >	set_fd_flags(stream_fd, flags);
> > > > -
> > > > +enable:
> > > >	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
> > > >
> > > >	sa.sa_handler = sighandler;
> > > > @@ -540,6 +547,9 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> > > >			_exit(run_gpgpu_fill(drm_fd, devid));
> > > >		}
> > > >	}
> > > > +	total_size = 0;
> > > > +	num_samples = 0;
> > > > +	num_drops = 0;
> > > >	/* Parent process reads the EU stall counters data */
> > > >	do {
> > > >		if (!blocking_read) {
> > > > @@ -574,14 +584,16 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> > > >	igt_info("Number of samples: %u\n", num_samples);
> > > >	igt_info("Number of drops reported: %u\n", num_drops);
> > > >
> > > > +	ret = wait_child(&work_load);
> > > > +	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
> > > > +	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
> > > > +
> > > >	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
> > > > +	if (--iter)
> > > > +		goto enable;
> > > >
> > > >	close(stream_fd);
> > > >	free(buf);
> > > > -
> > > > -	ret = wait_child(&work_load);
> > > > -	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
> > > > -	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
> > > >  }
> > > >
> > > >  static int opt_handler(int opt, int opt_index, void *data)
> > > > @@ -634,6 +646,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
> > > >  {
> > > >	int drm_fd;
> > > >	uint32_t devid;
> > > > +	struct stat sb;
> > > >	bool blocking_read = true;
> > > >
> > > >	igt_fixture {
> > > > @@ -642,6 +655,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
> > > >		devid = intel_get_drm_devid(drm_fd);
> > > >		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
> > > >		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
> > > > +		igt_require(!stat(OBSERVATION_PARANOID, &sb));

This looks like an unrelated fix for a separate patch?
It is also better to use
	igt_require_f(condition, "description\n");

> > > >		if (output_file) {
> > > >			output = fopen(output_file, "w");
> > > >			igt_require(output);
> > > > @@ -650,12 +664,22 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
> > > >
> > > >	igt_describe("Verify non-blocking read of EU stall data during a workload run");
> > > >	igt_subtest("non-blocking-read") {
> > > > -		test_eustall(drm_fd, devid, !blocking_read);
> > > > +		test_eustall(drm_fd, devid, !blocking_read, 1);
> > > > +	}
> > > > +
> > > > +	igt_describe("Run non-blocking read test twice with disable and enable between the runs");
> > > > +	igt_subtest("non-blocking-read-twice") {
> > > > +		test_eustall(drm_fd, devid, !blocking_read, 2);

Why not just call it twice here?
	test_eustall(drm_fd, devid, !blocking_read);
	test_eustall(drm_fd, devid, !blocking_read);

> > > >	}
> > > >
> > > >	igt_describe("Verify blocking read of EU stall data during a workload run");
> > > >	igt_subtest("blocking-read") {
> > > > -		test_eustall(drm_fd, devid, blocking_read);
> > > > +		test_eustall(drm_fd, devid, blocking_read, 1);
> > > > +	}
> > > > +
> > > > +	igt_describe("Run blocking read test twice with disable and enable between the runs");
> > > > +	igt_subtest("blocking-read-twice") {
> > > > +		test_eustall(drm_fd, devid, blocking_read, 2);

Same here.

Regards,
Kamil

> > > >	}
> > > >
> > > >	igt_describe("Verify that unprivileged open of a EU stall data fd fails");
> > > > --
> > > > 2.48.1
> > > >
