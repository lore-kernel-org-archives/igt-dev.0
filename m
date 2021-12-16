Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5DF10E94F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 08:27:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211216080805.12086-1-arjun.melkaveri@intel.com>
References: <20211216080805.12086-1-arjun.melkaveri@intel.com>
From: Chris Wilson <chris.p.wilson@intel.com>
Date: Thu, 16 Dec 2021 08:27:30 +0000
Message-ID: <163964325029.6488.15902356750124995306@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_schedule: Added
 igt_spin_end for submit_slice subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org, krishnaiah.bommu@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Arjun Melkaveri (2021-12-16 08:08:05)
> Due to new ctx implementation , "submit_slice" subtests are waiting for
> long time at I915_GEM_WAIT.
> Adding igt_spin_end resolves this issue.
>=20
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>  tests/i915/gem_exec_schedule.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedul=
e.c
> index 68457406..2c72c5e1 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -875,6 +875,7 @@ static void submit_slice(int i915, const intel_ctx_cf=
g_t *cfg,
>                 if (timeline !=3D -1)
>                         close(timeline);
> =20
> +               igt_spin_end(spin);

No. This completely breaks the test. The spinner is terminated on the
GPU by cancel_spinner(). That was broken by the conversion.

The timeout is the intentional failure condition for the scheduler being
broken; except in this case the test was broken first.
-Chris
