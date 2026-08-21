Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5459C5DF87
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 09:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC5D10F286;
	Fri, 21 Aug 2026 09:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRj6AIrB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7546A10F286
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 09:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787305393; x=1818841393;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FgHxMk22Lx/+ZW+yYuGeNlCLi0bgPixNScZrVyYJSc4=;
 b=DRj6AIrBlWzpVUXfwtB1WtBUbtfaKzP8pvJ1aYoPkdlyTQDtxFVhCorz
 ZcMQKxihd+Un2sp2SDuYCoR3EHV/M7S41tt/lqm6bg7MZykBYLeOMZBos
 R0qQAT5m2lyWG4L0m3NOFpi/0g9yPS8I4+xbKTucK9zRcWnxN3e3HFZKQ
 UACg3GYZ9WIb1YGmwizf/D6XJth+ok27dYBUGUmuCI0qYjgl4is0w2ZFi
 bZt88EnfkwHqmoYwhtkFVVJrZ4UaMx44sq4dm3YVFpq+Ux6ZVYFwxwteW
 O5c8DfkO6wE6h2niY3eK/lJ5HlJ84jI5r6MoCyLnYK5QzxzlCwlkzfpXd w==;
X-CSE-ConnectionGUID: KXaolSB3RECTZ4nds8krIA==
X-CSE-MsgGUID: UO2bRBynT56j1+DdqrXS3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87911732"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87911732"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:43:13 -0700
X-CSE-ConnectionGUID: NRW/ZOONTwyPq1Yf6x7aGw==
X-CSE-MsgGUID: MtxXHBPESPO8+9xDCu1cPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="262577942"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.165])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:43:11 -0700
Message-ID: <341d0d27d10daf87a9d2f4e191082b04dd69b9c1.camel@linux.intel.com>
Subject: Re: [PATCH] tests/core_hotunplug: add *-with-load subtests
 exercising GPU workload during hotplug
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>, igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Date: Fri, 21 Aug 2026 11:43:09 +0200
In-Reply-To: <20260821065838.1865108-2-nitin.r.gote@intel.com>
References: <20260821065838.1865108-2-nitin.r.gote@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
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

Good job, however, I think we still need some improvements.

On Fri, 2026-08-21 at 12:28 +0530, Nitin Gote wrote:
> The six fd-holding hot* subtests keep a DRM fd open across unbind/unplug
> but leave the GPU idle, so the kernel hotplug path is never exercised
> against an active workload.
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
> gone by then -- igt_spin_end() writes the stop condition via a userspace
> mmap and lets the DRM fd close reclaim kernel-side resources.
>=20
> Validated on BMG and DG2 with a KASAN-enabled kernel:
> all six new subtests pass with no KASAN reports.
>=20
> v4: Rebase to latest igt.
>     Also the failure seen with the new core_hotunplug "with-load"
>     IGT subtests is fixed by kmd patch:
>     https://patchwork.freedesktop.org/series/171989/
>=20
> v3: Extend struct gpu_workload with a union of vendor-named members
>     to match the chipset dispatch in workload_start()/stop(). (Janusz)
>=20
> v2: Pass the hotunplug priv struct to workload_start()/stop()
>     and dispatch via an explicit if/else-if chipset block to invite
>     other vendors to contribute. (Janusz)
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  tests/core_hotunplug.c | 294 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 294 insertions(+)
>=20
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 33de65369..b11a4231b 100644
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
> @@ -550,6 +578,56 @@ static void post_healthcheck(struct hotunplug *priv)
>  	cleanup(priv);
>  }
> =20
> +/* GPU workload helpers */
> +
> +struct gpu_workload {
> +	union {
> +		struct {
> +			igt_spin_t *spin;
> +			uint64_t ahnd;
> +		} intel; /* Xe and i915 */
> +	};
> +};
> +
> +static bool workload_available(int chipset)
> +{
> +	return chipset =3D=3D DRIVER_XE || chipset =3D=3D DRIVER_INTEL;

NIT: I think a switch (chipset) { case DRIVER_XE: ... } construct, here=C2=
=A0
and=C2=A0consequently below in workload_start/stop, could be=C2=A0more effe=
ctive and=C2=A0
more easily extendable=C2=A0with potential=C2=A0future additions from other=
 vendors,=C2=A0
but that can be refactored later, on a first such addition.

> +}
> +
> +static void workload_start(struct hotunplug *priv, int fd,
> +			   struct gpu_workload *w)
> +{
> +	if (priv->chipset =3D=3D DRIVER_XE || priv->chipset =3D=3D DRIVER_INTEL=
) {
> +		local_debug("%s\n", "starting GPU spinner");
> +		priv->failure =3D "GPU workload start failure!";
> +		w->intel.ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +		w->intel.spin =3D igt_spin_new(fd, .ahnd =3D w->intel.ahnd);
> +		priv->failure =3D NULL;
> +	}
> +}
> +
> +static void workload_stop(struct hotunplug *priv, struct gpu_workload *w=
)
> +{
> +	if (priv->chipset =3D=3D DRIVER_XE || priv->chipset =3D=3D DRIVER_INTEL=
) {
> +		if (!w->intel.spin)
> +			return;

Since igt_fail() can be called from inside igt_spin_new(), workload_start()
can fail leaving an open ahnd but no spin.  We need to handle that case.

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
> +		igt_spin_end(w->intel.spin);
> +		put_ahnd(w->intel.ahnd);
> +		w->intel.spin =3D NULL;
> +		w->intel.ahnd =3D 0;
> +	}
> +}
> +
>  /* Subtests */
> =20
>  static void unbind_rebind(struct hotunplug *priv)
> @@ -664,6 +742,150 @@ static void hotreplug_lateclose(struct hotunplug *p=
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

Since igt_fail() can be called from driver_unbind(), as well as from other=
=C2=A0
functions called between workload_start() and workload_stop() in other=C2=
=A0
subtests below, we need=C2=A0to address those cases to be on the safe side.
We could e.g.:
- embed struct gpu_workload inside struct hotunplug,
- extend cleanup() (or recover()) function with another workload_stop().

Thanks,
Janusz


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
> @@ -802,6 +1024,78 @@ int igt_main()
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
