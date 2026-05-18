Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A180BCD4F52
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 12:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5830110E258;
	Mon, 18 May 2026 12:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNcd7FWu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CC110E258
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 12:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779108804; x=1810644804;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8DAqbMCXq2Z2bZgG3mYcXyPF9zosNuAI5DVSmubYQtU=;
 b=aNcd7FWu3IYGJLcG00ubzy1kFJO03FALhnh4g9yD5x0+Cb913sSYY5hG
 9dNkJsWfy9AhB1G4qgTYtVzcGKCYRmkLRW9cecl8NlrbxTG5uOYuAGw+h
 bXQjEQThsO7hdA4BHhoZAJQJRhTHrnghdtpLwKsGk4X/GCBs0CSfNB5db
 KCagzZNtUrFBMiEJZVzwZ9+yzY3CFJoU2VwMgHcm0b0gN3/fLWDbXmycz
 L0zcQ/Srz6zOmFz52b5VQmNlfShHhhCIjx6L+39GqiHHGJ5T2sa3e3QSY
 VdnhnHM5yuGNLdMD17dOFhsk8G5j+saYKOtA1WWt3CrHn0c9xMP+sHwFJ g==;
X-CSE-ConnectionGUID: VG8Qev1CTO+B1SsyV0CVTw==
X-CSE-MsgGUID: CHJns2d3RG6RyAqoW7jRcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="102632217"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="102632217"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 05:53:24 -0700
X-CSE-ConnectionGUID: eILspctBQ7O+sEX61J8v6A==
X-CSE-MsgGUID: Rm/1j7ylRO23qFh2/3XhmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="236788589"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.48])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 05:53:21 -0700
Message-ID: <4838d8f82d9efb732c357977480388f92619798a.camel@linux.intel.com>
Subject: Re: [PATCH] tests/core_hotunplug: add *-with-load subtests
 exercising GPU workload during hotplug
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>, igt-dev@lists.freedesktop.org, 
 kamil.konieczny@linux.intel.com
Cc: matthew.auld@intel.com
Date: Mon, 18 May 2026 14:53:19 +0200
In-Reply-To: <20260518120133.5651-2-nitin.r.gote@intel.com>
References: <20260518120133.5651-2-nitin.r.gote@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
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

Hi Nitin,

On Mon, 2026-05-18 at 17:31 +0530, Nitin Gote wrote:
> The six fd-holding hot* subtests keep a DRM fd open across unbind/unplug
> but leave the GPU idle, so the kernel hotplug path is never exercised
> against an active VM, exec queue and BOs.
>=20
> Add six new dedicated *-with-load subtests that run a GPU spinner across
> the unbind/unplug sequence so the device is removed while a workload is
> actively using it.
>=20
> The workload helpers use an explicit chipset dispatch block in
> workload_start()/stop() so that other vendors can contribute
> support by adding an else-if branch. New subtests are gated on
> workload_available(), which currently covers DRIVER_XE and DRIVER_INTEL,
> and returns false (SKIP) on any other driver.
>=20
> igt_spin_free() is avoided in workload_stop() since the device may be
> gone by then =E2=80=94 igt_spin_end() writes the stop condition via a use=
rspace
> mmap and lets the DRM fd close reclaim kernel-side resources.
>=20
> Validated on BMG and DG2 with a KASAN-enabled kernel:
> all six new subtests pass with no KASAN reports.
>=20
> v2: Pass the hotunplug priv struct to workload_start()/stop()
>     and dispatch via an explicit if/else-if chipset block to invite
>     other vendors to contribute. (Janusz)
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Assisted-by: Copilot:claude-opus-4.7
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  tests/core_hotunplug.c | 290 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 290 insertions(+)
>=20
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 7c9dae1bf..38dcbb97d 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -80,6 +80,34 @@
>   * SUBTEST: unplug-rescan
>   * Description: Check if a device believed to be closed can be cleanly
>   *		unplugged, then restored
> + *
> + * SUBTEST: hotunbind-rebind-with-load
> + * Description: Check if the driver can be cleanly unbound from an open =
device
> + *		with a background GPU workload in flight, then released and
> + *		rebound
> + *
> + * SUBTEST: hotunplug-rescan-with-load
> + * Description: Check if an open device with a background GPU workload i=
n
> + *		flight can be cleanly unplugged, then released and restored
> + *
> + * SUBTEST: hotrebind-with-load
> + * Description: Check if the driver can be cleanly rebound to a device w=
ith a
> + *		still open hot unbound driver instance while a background GPU
> + *		workload is in flight
> + *
> + * SUBTEST: hotreplug-with-load
> + * Description: Check if a hot unplugged and still open device can be cl=
eanly
> + *		restored while a background GPU workload is in flight
> + *
> + * SUBTEST: hotrebind-lateclose-with-load
> + * Description: Check if a hot unbound driver instance still open after =
hot
> + *		rebind with a background GPU workload in flight can be cleanly
> + *		released
> + *
> + * SUBTEST: hotreplug-lateclose-with-load
> + * Description: Check if an instance of a still open while hot replugged
> + *		device with a background GPU workload in flight can be cleanly
> + *		released
>   */
> =20
>  IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug"=
);
> @@ -565,6 +593,52 @@ static void set_filter_from_device(int fd)
>  	igt_assert_eq(igt_device_filter_add(filter), 1);
>  }
> =20
> +/* GPU workload helpers */
> +
> +struct gpu_workload {
> +	igt_spin_t *spin;
> +	uint64_t ahnd;
> +};

Sorry for not touching this before when asking you to make room for other=
=C2=A0
vendors in functions, but now as we have that in place, I think it would=C2=
=A0
be=C2=A0good to=C2=A0have the same also for data.  A union maybe, with its =
members=C2=A0
named after=C2=A0vendors?

Thanks,
Janusz


> +
> +static bool workload_available(int chipset)
> +{
> +	return chipset =3D=3D DRIVER_XE || chipset =3D=3D DRIVER_INTEL;
> +}
> +
> +static void workload_start(struct hotunplug *priv, int fd,
> +			   struct gpu_workload *w)
> +{
> +	if (priv->chipset =3D=3D DRIVER_XE || priv->chipset =3D=3D DRIVER_INTEL=
) {
> +		local_debug("%s\n", "starting GPU spinner");
> +		priv->failure =3D "GPU workload start failure!";
> +		w->ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +		w->spin =3D igt_spin_new(fd, .ahnd =3D w->ahnd);
> +		priv->failure =3D NULL;
> +	}
> +}
> +
> +static void workload_stop(struct hotunplug *priv, struct gpu_workload *w=
)
> +{
> +	if (priv->chipset =3D=3D DRIVER_XE || priv->chipset =3D=3D DRIVER_INTEL=
) {
> +		if (!w->spin)
> +			return;
> +
> +		/*
> +		 * The device may be gone (unbind/unplug), so avoid
> +		 * igt_spin_free(): on Xe it would wait forever on a syncobj
> +		 * that never signals; on i915 it would touch the dead fd via
> +		 * gem_munmap()/gem_close(). Instead, end the spinner via a
> +		 * userspace mmap write and let the DRM fd close reclaim the
> +		 * kernel-side resources.
> +		 */
> +		local_debug("%s\n", "stopping GPU spinner");
> +		igt_spin_end(w->spin);
> +		put_ahnd(w->ahnd);
> +		w->spin =3D NULL;
> +		w->ahnd =3D 0;
> +	}
> +}
> +
>  /* Subtests */
> =20
>  static void unbind_rebind(struct hotunplug *priv)
> @@ -679,6 +753,150 @@ static void hotreplug_lateclose(struct hotunplug *p=
riv)
>  	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
>  }
> =20
> +static void hotunbind_rebind_with_load(struct hotunplug *priv)
> +{
> +	struct gpu_workload w =3D { 0 };
> +
> +	pre_check(priv);
> +
> +	igt_require_f(workload_available(priv->chipset),
> +		      "No GPU workload support for this driver\n");
> +
> +	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot unbind");
> +
> +	workload_start(priv, priv->fd.drm, &w);
> +
> +	driver_unbind(priv, "hot ", 0);
> +
> +	workload_stop(priv, &w);
> +
> +	priv->fd.drm =3D close_device(priv->fd.drm, "late ", "unbound ");
> +	igt_assert_eq(priv->fd.drm, -1);
> +
> +	driver_bind(priv, 0);
> +
> +	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
> +}
> +
> +static void hotunplug_rescan_with_load(struct hotunplug *priv)
> +{
> +	struct gpu_workload w =3D { 0 };
> +
> +	pre_check(priv);
> +
> +	igt_require_f(workload_available(priv->chipset),
> +		      "No GPU workload support for this driver\n");
> +
> +	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot unplug");
> +
> +	workload_start(priv, priv->fd.drm, &w);
> +
> +	device_unplug(priv, "hot ", 0);
> +
> +	workload_stop(priv, &w);
> +
> +	priv->fd.drm =3D close_device(priv->fd.drm, "late ", "removed ");
> +	igt_assert_eq(priv->fd.drm, -1);
> +
> +	bus_rescan(priv, 0);
> +
> +	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
> +}
> +
> +static void hotrebind_with_load(struct hotunplug *priv)
> +{
> +	struct gpu_workload w =3D { 0 };
> +
> +	pre_check(priv);
> +
> +	igt_require_f(workload_available(priv->chipset),
> +		      "No GPU workload support for this driver\n");
> +
> +	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot rebind");
> +
> +	workload_start(priv, priv->fd.drm, &w);
> +
> +	driver_unbind(priv, "hot ", 60);
> +
> +	driver_bind(priv, 0);
> +
> +	workload_stop(priv, &w);
> +
> +	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
> +}
> +
> +static void hotreplug_with_load(struct hotunplug *priv)
> +{
> +	struct gpu_workload w =3D { 0 };
> +
> +	pre_check(priv);
> +
> +	igt_require_f(workload_available(priv->chipset),
> +		      "No GPU workload support for this driver\n");
> +
> +	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot replug");
> +
> +	workload_start(priv, priv->fd.drm, &w);
> +
> +	device_unplug(priv, "hot ", 60);
> +
> +	bus_rescan(priv, 0);
> +
> +	workload_stop(priv, &w);
> +
> +	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
> +}
> +
> +static void hotrebind_lateclose_with_load(struct hotunplug *priv)
> +{
> +	struct gpu_workload w =3D { 0 };
> +
> +	pre_check(priv);
> +
> +	igt_require_f(workload_available(priv->chipset),
> +		      "No GPU workload support for this driver\n");
> +
> +	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot rebind");
> +
> +	workload_start(priv, priv->fd.drm, &w);
> +
> +	driver_unbind(priv, "hot ", 60);
> +
> +	driver_bind(priv, 0);
> +
> +	workload_stop(priv, &w);
> +
> +	priv->fd.drm =3D close_device(priv->fd.drm, "late ", "unbound ");
> +	igt_assert_eq(priv->fd.drm, -1);
> +
> +	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
> +}
> +
> +static void hotreplug_lateclose_with_load(struct hotunplug *priv)
> +{
> +	struct gpu_workload w =3D { 0 };
> +
> +	pre_check(priv);
> +
> +	igt_require_f(workload_available(priv->chipset),
> +		      "No GPU workload support for this driver\n");
> +
> +	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot replug");
> +
> +	workload_start(priv, priv->fd.drm, &w);
> +
> +	device_unplug(priv, "hot ", 60);
> +
> +	bus_rescan(priv, 0);
> +
> +	workload_stop(priv, &w);
> +
> +	priv->fd.drm =3D close_device(priv->fd.drm, "late ", "removed ");
> +	igt_assert_eq(priv->fd.drm, -1);
> +
> +	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
> +}
> +
>  /* Main */
> =20
>  int igt_main()
> @@ -817,6 +1035,78 @@ int igt_main()
>  			recover(&priv);
>  	}
> =20
> +	igt_fixture()
> +		post_healthcheck(&priv);
> +
> +	igt_subtest_group() {
> +		igt_describe("Check if the driver can be cleanly unbound from an open =
device with a background GPU workload in flight, then released and rebound"=
);
> +		igt_subtest("hotunbind-rebind-with-load")
> +			hotunbind_rebind_with_load(&priv);
> +
> +		igt_fixture()
> +			recover(&priv);
> +	}
> +
> +	igt_fixture()
> +		post_healthcheck(&priv);
> +
> +	igt_subtest_group() {
> +		igt_describe("Check if an open device with a background GPU workload i=
n flight can be cleanly unplugged, then released and restored");
> +		igt_subtest("hotunplug-rescan-with-load")
> +			hotunplug_rescan_with_load(&priv);
> +
> +		igt_fixture()
> +			recover(&priv);
> +	}
> +
> +	igt_fixture()
> +		post_healthcheck(&priv);
> +
> +	igt_subtest_group() {
> +		igt_describe("Check if the driver can be cleanly rebound to a device w=
ith a still open hot unbound driver instance while a background GPU workloa=
d is in flight");
> +		igt_subtest("hotrebind-with-load")
> +			hotrebind_with_load(&priv);
> +
> +		igt_fixture()
> +			recover(&priv);
> +	}
> +
> +	igt_fixture()
> +		post_healthcheck(&priv);
> +
> +	igt_subtest_group() {
> +		igt_describe("Check if a hot unplugged and still open device can be cl=
eanly restored while a background GPU workload is in flight");
> +		igt_subtest("hotreplug-with-load")
> +			hotreplug_with_load(&priv);
> +
> +		igt_fixture()
> +			recover(&priv);
> +	}
> +
> +	igt_fixture()
> +		post_healthcheck(&priv);
> +
> +	igt_subtest_group() {
> +		igt_describe("Check if a hot unbound driver instance still open after =
hot rebind with a background GPU workload in flight can be cleanly released=
");
> +		igt_subtest("hotrebind-lateclose-with-load")
> +			hotrebind_lateclose_with_load(&priv);
> +
> +		igt_fixture()
> +			recover(&priv);
> +	}
> +
> +	igt_fixture()
> +		post_healthcheck(&priv);
> +
> +	igt_subtest_group() {
> +		igt_describe("Check if an instance of a still open while hot replugged=
 device with a background GPU workload in flight can be cleanly released");
> +		igt_subtest("hotreplug-lateclose-with-load")
> +			hotreplug_lateclose_with_load(&priv);
> +
> +		igt_fixture()
> +			recover(&priv);
> +	}
> +
>  	igt_fixture() {
>  		post_healthcheck(&priv);
> =20
