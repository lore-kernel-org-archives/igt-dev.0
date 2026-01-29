Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BE8D358E9
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 09:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC6810E809;
	Thu, 29 Jan 2026 09:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2Gvzoo3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4747A10E809
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 09:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769678992; x=1801214992;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=pren4N3cVNzzZt5xwVcQFUpxQCRF2NKzQ+q2itrc0Xs=;
 b=A2Gvzoo3RP9KwKWpzhwMClEG6od38eq1DlDdQUSU4fmxeDMuA8KGcj57
 qugSPNUdTz7C+hmpbAjsXh8l5hC+M6Rwc19txx1qkUqK/0ZfmizU3X1dq
 3hiTucdJZEmWIbXRtcvDQC1+YZKagy+wPkMbwfkSiHaeA6rXPPwU2we2P
 3LMWrrwqyKORMb+yJXMNnXUeeBYRSdcqueht31SJ13BjD2+XXo9xAbrRr
 JbI3yRdGtxO+QN91vMynBZl5e1LRrDTz3TNsOAy/5vO0drJwOtFPtnzpJ
 OexK0xqOGfYdVGbweAWKcbHEMUmxyPve8aoTpM8ng6ct/AZgGMoqGIxqr g==;
X-CSE-ConnectionGUID: 0vaKlkkBRn6G70IvHBGYrw==
X-CSE-MsgGUID: +F/CU4pgTTql2S38aQpq0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70881156"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70881156"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 01:29:51 -0800
X-CSE-ConnectionGUID: l0T1tEl5Ty2QRw9SEtahag==
X-CSE-MsgGUID: G316WbqkRKyCV30Azm9FCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208536228"
Received: from pjwade-mobl1.ger.corp.intel.com (HELO [10.245.17.81])
 ([10.245.17.81])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 01:29:51 -0800
Message-ID: <7f8b8095a03416aa48b9caf68495c67f6cb74438.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/1] RFC tests/intel/xe_exec_reset: Filter
 expected timeout dmesg during reset tests
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>, igt-dev@lists.freedesktop.org, 
 matthew.brost@intel.com
Date: Thu, 29 Jan 2026 10:29:26 +0100
In-Reply-To: <20260123065238.48129-2-sobin.thomas@intel.com>
References: <20260123065238.48129-1-sobin.thomas@intel.com>
 <20260123065238.48129-2-sobin.thomas@intel.com>
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

Hi Sobin,

Please see my comments bellow.

On Fri, 2026-01-23 at 06:52 +0000, Sobin Thomas wrote:
> During reset testing there are timedout messages with lrc seq no
> and seqno coming in CI Dmesg. These logs are causing CI warnings.
>=20
> Since we are intentionally causing the GPU reset, so timeout messages
> are expected behavior rather than actual test failures. These
> messages
> filtered by CI and incorrectly flagged as errors.
>=20
> This change adds ignore_timeout_dmesg() function that registers a
> regex
> pattern to filter out expected timeout-related dmesg messages:
> - "Timedout"
> - "timeout"
>=20
> The function is strategically called before operations that trigger
> resets to proactively filter expected messages:
> - GT reset operations (xe_force_gt_reset_async/sync)
> - Legacy test modes involving resets
> - Compute mode tests with GT reset flags
> - Thread-based reset testing scenarios
>=20
> This ensures cleaner test output by suppressing expected noise while
> preserving genuine error reporting for actual test failures.
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
> =C2=A0tests/intel/xe_exec_reset.c | 49 +++++++++++++++++++++++++++++++---=
-
> --
> =C2=A01 file changed, 41 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_reset.c
> b/tests/intel/xe_exec_reset.c
> index 7aaee31dd..19b2c96b9 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -28,6 +28,17 @@
> =C2=A0
> =C2=A0#define SYNC_OBJ_SIGNALED	(0x1 << 0)
> =C2=A0#define LEGACY_MODE_ADDR	0x1a0000
> +static void ignore_timeout_dmesg(void)
> +{
> +	/*
> +	 * Timedout jobs are expected during reset testing,
> +	 * so ignore these in igt_runner.
> +	 */
> +	static const char *store =3D "Timedout|timeout";
> +
> +	igt_emit_ignore_dmesg_regex(store);
> +}
> +

This will cause igt to ignore all timeouts. Would it be a good idea to
make this more specific so that only the expected timeouts are ignored?

> =C2=A0
> =C2=A0/**
> =C2=A0 * SUBTEST: spin
> @@ -73,6 +84,7 @@ static void test_spin(int fd, struct
> drm_xe_engine_class_instance *eci,
> =C2=A0
> =C2=A0	sync[0].handle =3D syncobj_create(fd, 0);
> =C2=A0	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	ignore_timeout_dmesg();
> =C2=A0
> =C2=A0#define N_TIMES 4
> =C2=A0	for (i =3D 0; i < N_TIMES; ++i) {
> @@ -260,8 +272,10 @@ test_balancer(int fd, int gt, int class, int
> n_exec_queues, int n_execs,
> =C2=A0
> =C2=A0	}
> =C2=A0
> -	if (flags & GT_RESET)
> +	if (flags & GT_RESET) {
> +		ignore_timeout_dmesg();
> =C2=A0		xe_force_gt_reset_async(fd, gt);
> +	}
> =C2=A0
> =C2=A0	if (flags & CLOSE_FD) {
> =C2=A0		if (flags & CLOSE_EXEC_QUEUES) {
> @@ -446,6 +460,7 @@ test_compute_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
> =C2=A0	}
> =C2=A0
> =C2=A0	if (flags & GT_RESET) {
> +		ignore_timeout_dmesg();
> =C2=A0		xe_spin_wait_started(&data[0].spin);
> =C2=A0		xe_force_gt_reset_sync(fd, eci->gt_id);
> =C2=A0	}
> @@ -590,6 +605,7 @@ gt_reset(int fd, int n_threads, int n_sec)
> =C2=A0
> =C2=A0	pthread_mutex_init(&mutex, 0);
> =C2=A0	pthread_cond_init(&cond, 0);
> +	ignore_timeout_dmesg();
> =C2=A0
> =C2=A0	for (i =3D 0; i < n_threads; ++i) {
> =C2=A0		threads[i].mutex =3D &mutex;
> @@ -650,6 +666,7 @@ gt_mocs_reset(int fd, int gt)
> =C2=A0	igt_debugfs_dump(fd, path);
> =C2=A0	igt_debugfs_read(fd, path, mocs_content_pre);
> =C2=A0
> +	ignore_timeout_dmesg();
> =C2=A0	xe_force_gt_reset_sync(fd, gt);
> =C2=A0
> =C2=A0	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
> @@ -683,6 +700,7 @@ static void *thread(void *data)
> =C2=A0		pthread_cond_wait(t->cond, t->mutex);
> =C2=A0	pthread_mutex_unlock(t->mutex);
> =C2=A0
> +	ignore_timeout_dmesg();
> =C2=A0	xe_legacy_test_mode(t->fd, t->hwe, t->n_exec_queue, t-
> >n_exec,
> =C2=A0			=C2=A0=C2=A0=C2=A0 t->flags, LEGACY_MODE_ADDR, false);
> =C2=A0
> @@ -739,6 +757,7 @@ static void threads(int fd, int n_exec_queues,
> int n_execs, unsigned int flags)
> =C2=A0	pthread_mutex_init(&mutex, 0);
> =C2=A0	pthread_cond_init(&cond, 0);
> =C2=A0
> +	ignore_timeout_dmesg();
> =C2=A0	xe_for_each_engine(fd, hwe) {
> =C2=A0		if (hwe->gt_id && (flags & GT0))
> =C2=A0			continue;
> @@ -797,12 +816,15 @@ int igt_main()
> =C2=A0			test_spin(fd, hwe, SYNC_OBJ_SIGNALED);
> =C2=A0
> =C2=A0	igt_subtest("cat-error")
> -		xe_for_each_engine(fd, hwe)
> +		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();
> =C2=A0			xe_legacy_test_mode(fd, hwe, 2, 2,
> CAT_ERROR,
> =C2=A0					=C2=A0=C2=A0=C2=A0 LEGACY_MODE_ADDR,
> false);
> +		}
> =C2=A0
> =C2=A0	igt_subtest("cancel")
> =C2=A0		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();
> =C2=A0			xe_legacy_test_mode(fd, hwe, 1, 1, 0,
> =C2=A0					=C2=A0=C2=A0=C2=A0 LEGACY_MODE_ADDR,
> false);
> =C2=A0			break;
> @@ -810,6 +832,7 @@ int igt_main()
> =C2=A0
> =C2=A0	igt_subtest("cancel-preempt")
> =C2=A0		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();
> =C2=A0			xe_legacy_test_mode(fd, hwe, 1, 1, PREEMPT,
> =C2=A0					=C2=A0=C2=A0=C2=A0 LEGACY_MODE_ADDR,
> false);
> =C2=A0			break;
> @@ -897,25 +920,33 @@ int igt_main()
> =C2=A0			LONG_SPIN_REUSE_QUEUE);
> =C2=A0
> =C2=A0	igt_subtest("gt-reset")
> -		xe_for_each_engine(fd, hwe)
> +		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();
> =C2=A0			xe_legacy_test_mode(fd, hwe, 2, 2, GT_RESET,
> =C2=A0					=C2=A0=C2=A0=C2=A0 LEGACY_MODE_ADDR,
> false);
> +		}
> =C2=A0
> =C2=A0	igt_subtest("close-fd-no-exec")
> -		xe_for_each_engine(fd, hwe)
> +		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();
> =C2=A0			xe_legacy_test_mode(-1, hwe, 16, 0,
> CLOSE_FD,
> =C2=A0					=C2=A0=C2=A0=C2=A0 LEGACY_MODE_ADDR,
> false);
> +		}
> =C2=A0
> =C2=A0	igt_subtest("close-fd")
> -		xe_for_each_engine(fd, hwe)
> +		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();
> =C2=A0			xe_legacy_test_mode(-1, hwe, 16, 256,
> CLOSE_FD,
> =C2=A0					=C2=A0=C2=A0=C2=A0 LEGACY_MODE_ADDR,
> false);
> +		}
> =C2=A0
> =C2=A0	igt_subtest("close-execqueues-close-fd")
> -		xe_for_each_engine(fd, hwe)
> +		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();
> =C2=A0			xe_legacy_test_mode(-1, hwe, 16, 256,
> CLOSE_FD |
> =C2=A0					=C2=A0=C2=A0=C2=A0 CLOSE_EXEC_QUEUES,
> =C2=A0					=C2=A0=C2=A0=C2=A0 LEGACY_MODE_ADDR,
> false);
> +		}
> =C2=A0
> =C2=A0	igt_subtest("cm-cat-error")
> =C2=A0		xe_for_each_engine(fd, hwe)
> @@ -941,17 +972,19 @@ int igt_main()
> =C2=A0	for (const struct section *s =3D sections; s->name; s++) {
> =C2=A0		igt_subtest_f("%s-cat-error", s->name)
> =C2=A0			xe_for_each_gt(fd, gt)

The changes after this point should either be on a separate patch or
simply removed.
> -				xe_for_each_engine_class(class)
> +				xe_for_each_engine_class(class) {
> =C2=A0					test_balancer(fd, gt, class,
> XE_MAX_ENGINE_INSTANCE + 1,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_MAX_ENGINE_INSTANCE + 1,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CAT_ERROR | s-
> >flags);
> +				}
> =C2=A0
> =C2=A0		igt_subtest_f("%s-gt-reset", s->name)
> =C2=A0			xe_for_each_gt(fd, gt)
> -				xe_for_each_engine_class(class)
> +				xe_for_each_engine_class(class) {
> =C2=A0					test_balancer(fd, gt, class,
> XE_MAX_ENGINE_INSTANCE + 1,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_MAX_ENGINE_INSTANCE + 1,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GT_RESET | s-
> >flags);
> +				}
> =C2=A0
> =C2=A0		igt_subtest_f("%s-close-fd-no-exec", s->name)
> =C2=A0			xe_for_each_gt(fd, gt)

