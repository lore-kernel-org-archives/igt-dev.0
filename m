Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CC3C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 12:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2D010E34E;
	Mon,  6 Jul 2026 12:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjyHSzk/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39E910E919;
 Mon,  6 Jul 2026 12:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783340647; x=1814876647;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YeRMELNz/4Kydr00LlNFirooQBB6tSZlh8zXoyDZVF0=;
 b=GjyHSzk/8Mr96XSiQfVAPERCwwr6+qRBNLv5Y2anKHWWnoibeHnnjL58
 y0tacvdlCMjcVXkw39x/tZYPpDIkCkznKGzMW3HkpE4mZz9YY7mQpSb42
 rNElNsMxw3mQ57wE/hAtV+nprW0mJ1Ed6j3ZoDhXhq+HzI0i618zQbyjm
 oslcZuVScMZvJ4O1pkm3q/7puz3hys3l9hM6j8nwi/4gKH01Nd2jv4WJB
 nFtVHLMHKiFiCe+e3jJRngp0bOi9dkkLT/YrpZ2a4BJVGMvMy7v5rU7a3
 5kF8lic4maluArLHThps0T9zI5RKPrmITeWNHJcpqP4iK4ftV1uhb8eRz A==;
X-CSE-ConnectionGUID: xIxTjtK2Rxuz5IqIDmZJww==
X-CSE-MsgGUID: kr347KmxSgWL1Xuep8r+EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94577155"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="94577155"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 05:24:06 -0700
X-CSE-ConnectionGUID: tFM1EqNzTa6IiRRS00vf4A==
X-CSE-MsgGUID: br4OnNvFSaqOLTwAAxYEYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="257571795"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 05:24:05 -0700
Date: Mon, 6 Jul 2026 14:23:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/2] tests/msm: Add perfcntrs test
Message-ID: <20260706122339.3ljtwoudncez6k2p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20260703143949.280272-1-rob.clark@oss.qualcomm.com>
 <20260703143949.280272-3-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703143949.280272-3-rob.clark@oss.qualcomm.com>
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

Hi Rob,
On 2026-07-03 at 07:39:49 -0700, Rob Clark wrote:
> Add tests for new PERFCNTR_CONFIG ioctl.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>

Your series do not compile on arm64 docker image.

[1451/1760] Compiling C object tests/msm/msm_perfcntrs.p/msm_perfcntrs.c.o
FAILED: tests/msm/msm_perfcntrs.p/msm_perfcntrs.c.o
...
msm_perfcntrs.p/msm_perfcntrs.c.o.d -o tests/msm/msm_perfcntrs.p/msm_perfcntrs.c.o -c ../tests/msm/msm_perfcntrs.c
../tests/msm/msm_perfcntrs.c: In function '__configure_counters':
../tests/msm/msm_perfcntrs.c:17:2: error: variable-sized object may not be initialized
   17 |  uint32_t countables[count] = {};   /* selecting countable 0 for each counter is fine */
         |  ^~~~~~~~
	 ninja: build stopped: subcommand failed.



Regards,
Kamil

> ---
>  tests/msm/meson.build     |   1 +
>  tests/msm/msm_perfcntrs.c | 194 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 195 insertions(+)
>  create mode 100644 tests/msm/msm_perfcntrs.c
> 
> diff --git a/tests/msm/meson.build b/tests/msm/meson.build
> index 2ba5b4db2279..0a7f35662c03 100644
> --- a/tests/msm/meson.build
> +++ b/tests/msm/meson.build
> @@ -1,6 +1,7 @@
>  msm_progs = [
>  	'msm_bo',
>  	'msm_mapping',
> +	'msm_perfcntrs',
>  	'msm_recovery',
>  	'msm_shrink',
>  	'msm_submit',
> diff --git a/tests/msm/msm_perfcntrs.c b/tests/msm/msm_perfcntrs.c
> new file mode 100644
> index 000000000000..7dab92b5c6bc
> --- /dev/null
> +++ b/tests/msm/msm_perfcntrs.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <errno.h>
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_msm.h"
> +#include "msm_drm.h"
> +
> +static int
> +__configure_counters(struct msm_device *dev, bool global, unsigned nr_groups,
> +		     const char **groups, unsigned count)
> +{
> +	uint32_t countables[count] = {};   /* selecting countable 0 for each counter is fine */
> +	struct drm_msm_perfcntr_group group[nr_groups];
> +	struct drm_msm_perfcntr_config req = {
> +		.flags = global ? MSM_PERFCNTR_STREAM : 0,
> +		.nr_groups = nr_groups,
> +		.groups = VOID2U64(group),
> +		.period = global ? NSEC_PER_SEC : 0,
> +		.bufsz_shift = global ? 10 : 0,
> +		.group_stride = sizeof(struct drm_msm_perfcntr_group),
> +	};
> +
> +	memset(group, 0, sizeof(group));
> +
> +	for (unsigned i = 0; i < nr_groups; i++) {
> +		strcpy(group[i].group_name, groups[i]);
> +		group[i].nr_countables = count;
> +		group[i].countables = global ? VOID2U64(countables) : 0;
> +	}
> +
> +	return drmIoctl(dev->fd, DRM_IOCTL_MSM_PERFCNTR_CONFIG, &req);
> +}
> +
> +static int
> +configure_counters(struct msm_device *dev, bool global, unsigned count)
> +{
> +	/* CP group is present on all gens.. SP would be another good candidate */
> +	const char *groups[] = {"CP"};
> +	return __configure_counters(dev, global, 1, groups, count);
> +}
> +
> +static unsigned
> +get_available_counters(struct msm_device *dev, bool global)
> +{
> +	for (unsigned i = 0; ; i++) {
> +		int ret = configure_counters(dev, global, i + 1);
> +		igt_warn("%u: ret=%d\n", i, ret);
> +		if (ret < 0)
> +			return i;
> +		if (global)
> +			close(ret);
> +	}
> +}
> +
> +
> +int igt_main()
> +{
> +	/* device instance for global counter collection: */
> +	struct msm_device *dev_global = NULL;
> +	/* device instances for local counter reservation: */
> +	struct msm_device *dev_local_1 = NULL;
> +	struct msm_device *dev_local_2 = NULL;
> +	unsigned num_counters;
> +
> +	igt_fixture() {
> +		dev_global = igt_msm_dev_open();
> +		dev_local_1 = igt_msm_dev_open();
> +		dev_local_2 = igt_msm_dev_open();
> +
> +		num_counters = get_available_counters(dev_global, true);
> +		igt_info("num_counters=%u\n", num_counters);
> +	}
> +
> +	igt_describe("Multiple process should be able to reserve the same "
> +		     "counters for local counter collection");
> +	igt_subtest("perfcntrs-local-coexist") {
> +		igt_require(num_counters > 0);
> +
> +		igt_assert_eq(0, configure_counters(dev_local_1, false, num_counters));
> +		igt_assert_eq(0, configure_counters(dev_local_2, false, num_counters));
> +
> +		/* release the reservations: */
> +		configure_counters(dev_local_1, false, 0);
> +		configure_counters(dev_local_2, false, 0);
> +	}
> +
> +	igt_describe("non-conflict global and local counters");
> +	igt_subtest("perfcntrs-non-conflict-global-local") {
> +		int num_local = num_counters - 2;
> +		int stream_fd;
> +
> +		igt_require(num_counters > 2);
> +
> +		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
> +		igt_assert_eq(0, configure_counters(dev_local_2, false, num_local));
> +
> +		stream_fd = configure_counters(dev_global, true, 2);
> +		igt_assert_lte(0, stream_fd);
> +		close(stream_fd);
> +
> +		/* release the reservations: */
> +		configure_counters(dev_local_1, false, 0);
> +		configure_counters(dev_local_2, false, 0);
> +	}
> +
> +	igt_describe("conflict, local first");
> +	igt_subtest("conflict-local-first") {
> +		int num_local = num_counters - 1;
> +		int stream_fd;
> +
> +		igt_require(num_counters > 2);
> +
> +		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
> +		igt_assert_eq(0, configure_counters(dev_local_2, false, num_local));
> +
> +		stream_fd = configure_counters(dev_global, true, 2);
> +		igt_assert_lt(stream_fd, 0);
> +
> +		/* release the reservation for dev_local_1: */
> +		configure_counters(dev_local_1, false, 0);
> +
> +		/* should still fail: */
> +		stream_fd = configure_counters(dev_global, true, 2);
> +		igt_assert_lt(stream_fd, 0);
> +
> +		/* release the reservation for dev_local_2: */
> +		configure_counters(dev_local_2, false, 0);
> +
> +		/* now should succeed: */
> +		stream_fd = configure_counters(dev_global, true, 2);
> +		igt_assert_lte(0, stream_fd);
> +		close(stream_fd);
> +	}
> +
> +	igt_describe("conflict, global first");
> +	igt_subtest("conflict-global-first") {
> +		int num_local = num_counters - 1;
> +		int stream_fd;
> +
> +		igt_require(num_counters > 2);
> +
> +		stream_fd = configure_counters(dev_global, true, 2);
> +		igt_assert_lte(0, stream_fd);
> +
> +		/* Should fail because two counters already allocated for global collection: */
> +		igt_assert_neq(0, configure_counters(dev_local_1, false, num_local));
> +
> +		/* release global counters: */
> +		close(stream_fd);
> +
> +		/* Now reservation should succeed: */
> +		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
> +
> +		/* release the reservations: */
> +		configure_counters(dev_local_1, false, 0);
> +	}
> +
> +	igt_describe("multiple groups");
> +	igt_subtest("multiple-groups") {
> +		const char *groups[] = {"CP", "SP"};
> +
> +		igt_require(num_counters > 0);
> +
> +		igt_assert_eq(0,
> +			__configure_counters(dev_local_1, false, ARRAY_SIZE(groups), groups, 1));
> +
> +		/* release the reservations: */
> +		configure_counters(dev_local_1, false, 0);
> +	}
> +
> +	igt_describe("duplicate groups");
> +	igt_subtest("duplicate-groups") {
> +		const char *groups[] = {"CP", "CP"};
> +
> +		igt_require(num_counters > 0);
> +
> +		igt_assert_neq(0,
> +			__configure_counters(dev_local_1, false, ARRAY_SIZE(groups), groups, 1));
> +
> +		/* release the reservations: */
> +		configure_counters(dev_local_1, false, 0);
> +	}
> +
> +	igt_fixture() {
> +		igt_msm_dev_close(dev_global);
> +		igt_msm_dev_close(dev_local_1);
> +		igt_msm_dev_close(dev_local_2);
> +	}
> +}
> -- 
> 2.54.0
> 
