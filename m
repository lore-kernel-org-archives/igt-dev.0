Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C71CD4857
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 06:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16010E97E;
	Tue, 12 May 2026 06:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MMgeXUno";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27D210E987
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 06:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UbA15CzU4kxe95fVw6anrcdCy4theswUxT3vjYUlp6I=; b=MMgeXUno/ohDXZCANMDs7rKtxJ
 RefZeq7B2Hf+UIFPgIWCWzNk/00mm2UiLFVwfCgpIX4HxNlLOuL6HBwebvIhBRTSrwI8Y69ZOSQsj
 QFRACDULkZQd8/s5b7qf14r/M09YWE0W3K23SnRy2dxgEwYvBsm8mR0U/ftWXKPFEQeSv0OjkXB67
 7xSECHFYc/xMV6ja5xDrIPr7PEQ8ih502XnKl1xsKxu9ck5J1xyEjQYWFGoqvevXUmy3eYWFXkSPh
 GuUF34lta1eAUEbtiBd2IfcFPPc2oKyI+hcTAZ/qCZ7pCn7XlhtNKgPHrqVTDKlV2dYYTR/gsWF24
 2e9btbcA==;
Received: from static-197-2-86-188.ipcom.comunitel.net ([188.86.2.197]
 helo=[192.168.0.17]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wMgwp-009KnU-JO; Tue, 12 May 2026 08:50:30 +0200
Message-ID: <9ded122232024d0d4e9d18cd7267196b6471a745.camel@igalia.com>
Subject: Re: [PATCH i-g-t 5/5] tests/v3d_perfmon: Add global perfmon and
 counter isolation tests
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com
Date: Tue, 12 May 2026 08:50:20 +0200
In-Reply-To: <20260508124446.1260672-7-mcanal@igalia.com>
References: <20260508124446.1260672-2-mcanal@igalia.com>
 <20260508124446.1260672-7-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
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

Hi Ma=C3=ADra,

patches 1-4 are:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

For patch 5, I have some comments below:

El vie, 08-05-2026 a las 09:42 -0300, Ma=C3=ADra Canal escribi=C3=B3:

(...)
> +	igt_describe("Make sure that the global perfmon is tracking
> all jobs consistently.");
> +	igt_subtest("global-perfmon-valid-perfmon") {
> +		struct drm_v3d_perfmon_set_global set_global =3D { 0
> };
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +		uint64_t *values1, *values2;
> +		uint32_t id, out_sync;
> +		uint8_t counters[2];
> +
> +		/*
> +		 * Different V3D versions have different performance
> counters
> +		 * IDs for the same counters.
> +		 */
> +		if (ver >=3D 71) {
> +			counters[0] =3D 0; /* cycle-count */
> +			counters[1] =3D 1; /* core-active */
> +		} else if (ver >=3D 42) {
> +			counters[0] =3D V3D_PERFCNT_CYCLE_COUNT;
> +			counters[1] =3D V3D_PERFCNT_CLE_ACTIVE;
> +		} else
> +			igt_abort_on_f(true, "This V3D version is
> not supported.");
> +
> +		id =3D igt_v3d_perfmon_create(fd,
> ARRAY_SIZE(counters), counters);
> +
> +		values1 =3D calloc(ARRAY_SIZE(counters),
> sizeof(*values1));
> +		values2 =3D calloc(ARRAY_SIZE(counters),
> sizeof(*values2));
> +
> +		set_global.id =3D id;
> +		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL,
> &set_global);
> +
> +		igt_v3d_perfmon_get_values(fd, id, values1);
> +
> +		out_sync =3D syncobj_create(fd, 0);
> +		job->submit->out_sync =3D out_sync;
> +
> +		/* Submit an arbitrary number of CL jobs to stress
> the perfcnts. */
> +		for (int i =3D 0; i < 10; i++)
> +			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job-
> >submit);
> +
> +		/* Wait for the last job to complete so counters are
> captured. */
> +		igt_assert(syncobj_wait(fd, &out_sync, 1, INT64_MAX,
> 0, NULL));

If the intent was to wait for all jobs to complete, should we not move
the syncobj_wait into the loop above and reset the syncobj after each
iteration? Otherwise I think this is only really waiting for the first
job's completion. Alternatively, you can set out_sync only for the last
job instead.

> +
> +		igt_v3d_perfmon_get_values(fd, id, values2);
> +
> +		/* As the global perfmon is active, the cycle-count
> must have
> +		 * increased with time.
> +		 */
> +		for (int i =3D 0; i < ARRAY_SIZE(counters); i++)
> +			igt_assert_lt(values1[i], values2[i]);
> +
> +		set_global.flags =3D DRM_V3D_PERFMON_CLEAR_GLOBAL;
> +		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL,
> &set_global);
> +
> +		igt_v3d_perfmon_get_values(fd, id, values1);
> +
> +		/* Submit an arbitrary number of CL jobs to stress
> the perfcnts. */
> +		for (int i =3D 0; i < 10; i++)
> +			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job-
> >submit);
> +

I think we would also want wait for completion of the jobs here before
retrieving the values below.

> +		igt_v3d_perfmon_get_values(fd, id, values2);
> +
> +		/* As the global perfmon was cleared, the perfmon is
> inactive
> +		 * and it must preserve its values.
> +		 */
> +		for (int i =3D 0; i < ARRAY_SIZE(counters); i++)
> +			igt_assert_eq(values1[i], values2[i]);
> +
> +		igt_v3d_perfmon_destroy(fd, id);
> +
> +		syncobj_destroy(fd, out_sync);
> +		igt_v3d_free_cl_job(fd, job);
> +
> +		free(values1);
> +		free(values2);
> +	}
> +
> +	igt_describe("Make sure that a global perfmon tracks jobs
> from other file descriptors.");
> +	igt_subtest("global-perfmon-multifd") {
> +		struct drm_v3d_perfmon_set_global set_global =3D { 0
> },
> +						=C2=A0 set_global2 =3D { 0
> };
> +		int fd2 =3D drm_open_driver_render(DRIVER_V3D);
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd2);
> +		uint32_t id1, id2, out_sync;
> +		uint64_t values1, values2;
> +		uint8_t counter;
> +
> +		/*
> +		 * Different V3D versions have different performance
> counters
> +		 * IDs for the same counters.
> +		 */
> +		if (ver >=3D 71)
> +			counter =3D 0; /* cycle-count */
> +		else if (ver >=3D 42)
> +			counter =3D V3D_PERFCNT_CYCLE_COUNT;
> +		else
> +			igt_abort_on_f(true, "This V3D version is
> not supported.");
> +
> +		/* Create and set global perfmon from fd. */
> +		id1 =3D igt_v3d_perfmon_create(fd, 1, &counter);
> +		set_global.id =3D id1;
> +		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL,
> &set_global);
> +
> +		igt_v3d_perfmon_get_values(fd, id1, &values1);
> +
> +		/* Submit jobs from the second fd; the global
> perfmon should track them. */
> +		out_sync =3D syncobj_create(fd2, 0);
> +		job->submit->out_sync =3D out_sync;
> +		for (int i =3D 0; i < 10; i++)
> +			do_ioctl(fd2, DRM_IOCTL_V3D_SUBMIT_CL, job-
> >submit);
> +		igt_assert(syncobj_wait(fd2, &out_sync, 1,
> INT64_MAX, 0, NULL));
> +

Same issue here about using the same out_sync on all jobs.

> +		igt_v3d_perfmon_get_values(fd, id1, &values2);
> +		igt_assert_lt(values1, values2);
> +
> +		/* fd2 cannot set its own global perfmon while fd's
> is active. */
> +		id2 =3D igt_v3d_perfmon_create(fd2, 1, &counter);
> +		set_global2.id =3D id2;
> +		do_ioctl_err(fd2, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL,
> &set_global2, EBUSY);
> +
> +		igt_v3d_perfmon_destroy(fd2, id2);
> +		igt_v3d_perfmon_destroy(fd, id1);
> +
> +		syncobj_destroy(fd2, out_sync);
> +		igt_v3d_free_cl_job(fd2, job);
> +
> +		drm_close_driver(fd2);
> +	}
> +
> +	igt_describe("Make sure closing a file descriptor with an
> active global "
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "perfmon does not crash the driver.");
> +	igt_subtest("global-perfmon-destroy-multifd") {
> +		struct drm_v3d_perfmon_set_global set_global =3D { 0
> };
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +		int fd2 =3D drm_open_driver(DRIVER_V3D);
> +		uint32_t id, new_id, out_sync;
> +		uint8_t counter =3D 0;
> +
> +		/* Create and set global perfmon from fd2. */
> +		id =3D igt_v3d_perfmon_create(fd2, 1, &counter);
> +		set_global.id =3D id;
> +		do_ioctl(fd2, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL,
> &set_global);
> +
> +		/* Keep HW busy from fd while fd2 is closed. */
> +		out_sync =3D syncobj_create(fd, 0);
> +		job->submit->out_sync =3D out_sync;
> +		for (int i =3D 0; i < 10; i++)
> +			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job-
> >submit);
> +

Same here.


> +		/* Closing fd2 must cleanly stop the active global
> perfmon and
> +		 * clear the global perfmon without crashing.
> +		 */
> +		drm_close_driver(fd2);
> +
> +		igt_assert(syncobj_wait(fd, &out_sync, 1, INT64_MAX,
> 0, NULL));
> +
> +		/* fd can now set a new global perfmon without
> EBUSY. */
> +		new_id =3D igt_v3d_perfmon_create(fd, 1, &counter);
> +
> +		set_global.id =3D new_id;
> +		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL,
> &set_global);
> +
> +		set_global.flags =3D DRM_V3D_PERFMON_CLEAR_GLOBAL;
> +		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL,
> &set_global);
> +
> +		igt_v3d_perfmon_destroy(fd, new_id);
> +
> +		syncobj_destroy(fd, out_sync);
> +		igt_v3d_free_cl_job(fd, job);
> +	}
> +

(...)

> +
> +	igt_describe("Make sure a non-perfmon CL job submitted after
> a perfmon CL job "
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "is serialized behind it and does not
> contaminate its counter values.");
> +	igt_subtest("perfmon-counter-isolation-subsequent-cl") {
> +		struct v3d_cl_job *job1 =3D igt_v3d_noop_job(fd);
> +		struct v3d_cl_job *job2 =3D igt_v3d_noop_job(fd);
> +		uint64_t id, values, values_after_j2;
> +		uint32_t blocker, out1, out2;
> +		int timeline, fence_fd;
> +		uint8_t counter;
> +
> +		igt_require_sw_sync();
> +
> +		/*
> +		 * Different V3D versions have different performance
> counters IDs
> +		 * for the same counters.
> +		 */
> +		if (ver >=3D 71)
> +			counter =3D 0; /* cycle-count */
> +		else if (ver >=3D 42)
> +			counter =3D V3D_PERFCNT_CYCLE_COUNT;
> +		else
> +			igt_abort_on_f(true, "This V3D version is
> not supported.");
> +
> +		id =3D igt_v3d_perfmon_create(fd, 1, &counter);
> +
> +		/*
> +		 * Create an unsignaled fence via sw_sync. job1 will
> wait on
> +		 * this fence and stay blocked until we increment
> the timeline.
> +		 */
> +		timeline =3D sw_sync_timeline_create();
> +		fence_fd =3D sw_sync_timeline_create_fence(timeline,
> 1);
> +
> +		blocker =3D syncobj_create(fd, 0);
> +		syncobj_import_sync_file(fd, blocker, fence_fd);
> +		close(fence_fd);
> +
> +		out1 =3D syncobj_create(fd, 0);
> +		out2 =3D syncobj_create(fd, 0);
> +
> +		/* job1: BIN job is blocked until we signal the
> blocker. */
> +		job1->submit->in_sync_bcl =3D blocker;
> +		job1->submit->perfmon_id =3D id;
> +		job1->submit->out_sync =3D out1;
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job1->submit);
> +
> +		/* job2: no perfmon, must wait for job1 due to job
> serialization. */
> +		job2->submit->out_sync =3D out2;
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job2->submit);
> +
> +		/* job2 is serialized behind job1, so it cannot have
> completed yet. */
> +		igt_assert_eq(syncobj_wait_err(fd, &out2, 1, 0, 0),
> -ETIME);
> +
> +		/* While job1 has not started, the perfmon must
> still read zero. */
> +		igt_v3d_perfmon_get_values(fd, id, &values);
> +		igt_assert_eq(values, 0);
> +
> +		/* Release the blocker. */
> +		sw_sync_timeline_inc(timeline, 1);
> +
> +		igt_assert(syncobj_wait(fd, &out1, 1, INT64_MAX, 0,
> NULL));
> +		igt_assert(syncobj_wait(fd, &out2, 1, INT64_MAX, 0,
> NULL));

I think that for the tests below to make sense you would want to move
the second wait after checking values for the first time....

> +
> +		/* job1 must have contributed cycles to the perfmon.
> */
> +		igt_v3d_perfmon_get_values(fd, id, &values);
> +		igt_assert_lt(0, values);

Otherwise, this is really checking potential contributions from both
jobs, not just job1.

> +
> +		/* job2 doesn't have a perfmon attached, so a second
> read must
> +		 * return the same value.
> +		 */
> +		igt_v3d_perfmon_get_values(fd, id,
> &values_after_j2);
> +		igt_assert_eq(values, values_after_j2);

And this is not really checking anything about job2, so it is always
going to give the same values.

> +
> +		close(timeline);
> +		syncobj_destroy(fd, blocker);
> +		syncobj_destroy(fd, out1);
> +		syncobj_destroy(fd, out2);
> +
> +		igt_v3d_perfmon_destroy(fd, id);
> +
> +		igt_v3d_free_cl_job(fd, job1);
> +		igt_v3d_free_cl_job(fd, job2);
> +	}
> +
> =C2=A0	igt_fixture()
> =C2=A0		drm_close_driver(fd);
> =C2=A0}

