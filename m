Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EB6CD3436
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 09:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AE010E303;
	Fri,  8 May 2026 09:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTvXWC0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94E910E303
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778231059; x=1809767059;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wNqIe8ycxD3wkcKyEgZTN4/9/ix3MvpoYchepJTZYoE=;
 b=eTvXWC0GAtrrbWjo/czUEu5KThmAye7AQcsnfYpjhL97+EpTpZFNQL7A
 Vb0OT9tQG3TDljIpRcP1QPDkWdG5nU8MTfC9KTAFKc7GIrj2YCwuyijMD
 q2uNY3VWK1LfG38sCH2sLfURUzsJnriJBEbrgzIa59Ox+eqoWSPvHd2jF
 Gzm7Sf7OAC2k7Jg86UFqjxs3BQ5P8VVkk0B4jq4rUrtxwa1lYzuw6E/LQ
 FTIYADKtu9A/rn16E+OENH4cxTt46Qon38YAy/wrRw2yFZhPJJYcGZK12
 zRH8hPSVfSp7ouslqoA9UN22bJx1e5Td51SxZTMPYm6c3bxbGPQOuOpjY w==;
X-CSE-ConnectionGUID: /QMcwSnfSuaq7PTCypIALQ==
X-CSE-MsgGUID: 4+3bnqGwQmio6qhIn9fDog==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="104656476"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="104656476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 02:04:18 -0700
X-CSE-ConnectionGUID: TBQdgKWzSwaJa2BXLpjukw==
X-CSE-MsgGUID: Ir07NoHTQ4+2gpyqvCdp5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="267093220"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.53])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 02:04:17 -0700
Message-ID: <a4fb5c49367356423c3c52e0dbd0da7f010723ea.camel@linux.intel.com>
Subject: Re: [PATCH] tests/core_hotunplug: exercise fd-holding subtests with
 Xe workload
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Auld, Matthew" <matthew.auld@intel.com>
Date: Fri, 08 May 2026 11:04:14 +0200
In-Reply-To: <SA3PR11MB81181CA7FFDE5B350CDEBD51D03F2@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260506135714.1819588-2-nitin.r.gote@intel.com>
 <20260506141814.nseva2m4zhywwqxy@kamilkon-DESK.igk.intel.com>
 <SA3PR11MB81181CA7FFDE5B350CDEBD51D03F2@SA3PR11MB8118.namprd11.prod.outlook.com>
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

On Wed, 2026-05-06 at 14:37 +0000, Gote, Nitin R wrote:
> Hi Kamil,
>=20
> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: Wednesday, May 6, 2026 7:48 PM
> > To: Gote, Nitin R <nitin.r.gote@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.co=
m>;
> > Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Subject: Re: [PATCH] tests/core_hotunplug: exercise fd-holding subtests=
 with Xe
> > workload
> >=20
> > Hi Nitin,
> > On 2026-05-06 at 19:27:15 +0530, Nitin Gote wrote:
> > > The six fd-holding subtests (hotunbind-rebind, hotunplug-rescan,
> > > hotrebind, hotreplug, hotrebind-lateclose, hotreplug-lateclose) keep =
a
> > > DRM fd open across unbind/unplug but leave the GPU idle, so on Xe the
> > > unbind/unplug path is never exercised against an active VM, exec queu=
e
> > > and BOs.
> > >=20
> > > Add xe_workload_start()/xe_workload_stop() helpers, gated on
> > > is_xe_device(), that run a spinner on the GPU across the unbind/unplu=
g
> > > sequence, so the device is removed while a workload is using it. i915
> > > already has equivalent coverage via local_i915_healthcheck().
> > >=20
> > > Validated on BMG with a KASAN-enabled kernel: all subtests pass with
> > > no KASAN reports.
> > >=20
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Assisted-by: Copilot:claude-opus-4.7
> > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > ---
> > >  tests/core_hotunplug.c | 74
> > > ++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 74 insertions(+)
> > >=20
> > > diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c index
> > > 7c9dae1bf..88a2133af 100644
> > > --- a/tests/core_hotunplug.c
> > > +++ b/tests/core_hotunplug.c
> > > @@ -565,6 +565,44 @@ static void set_filter_from_device(int fd)
> > >  	igt_assert_eq(igt_device_filter_add(filter), 1);  }
> > >=20
> > > +/* Xe GPU workload helpers */
> > > +
> > > +struct xe_workload {
> > > +	igt_spin_t *xe_spin;
> > > +	uint64_t xe_ahnd;
> > > +};
> > > +
> > > +static void xe_workload_start(struct hotunplug *priv, int fd,
> > > +			      struct xe_workload *w)
> > > +{
> > > +	if (!is_xe_device(fd))
> > > +		return;
> > > +
> > > +	local_debug("%s\n", "starting Xe GPU spinner");
> > > +	priv->failure =3D "Xe workload start failure!";
> > > +	w->xe_ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> > > +	w->xe_spin =3D igt_spin_new(fd, .ahnd =3D w->xe_ahnd);
> > > +	priv->failure =3D NULL;
> > > +}
> > > +
> > > +static void xe_workload_stop(struct xe_workload *w) {
> > > +	if (!w->xe_spin)
> > > +		return;
> > > +
> > > +	/*
> > > +	 * The device may be gone (unbind/unplug), so avoid igt_spin_free()=
:
> > > +	 * on Xe it asserts in xe_spin_sync_wait() because the syncobj will
> > > +	 * never signal. Stop the spinner via a userspace mmap write and le=
t
> > > +	 * the DRM fd close reclaim the kernel-side resources.
> > > +	 */
> > > +	local_debug("%s\n", "stopping Xe GPU spinner");
> > > +	igt_spin_end(w->xe_spin);
> > > +	put_ahnd(w->xe_ahnd);
> > > +	w->xe_spin =3D NULL;
> > > +	w->xe_ahnd =3D 0;
> > > +}
> > > +
> > >  /* Subtests */
> > >=20
> > >  static void unbind_rebind(struct hotunplug *priv) @@ -591,12 +629,18
> > > @@ static void unplug_rescan(struct hotunplug *priv)
> > >=20
> > >  static void hotunbind_rebind(struct hotunplug *priv)  {
> > > +	struct xe_workload w =3D { 0 };
> > > +
> > >  	pre_check(priv);
> > >=20
> > >  	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot unbind"=
);
> > >=20
> > > +	xe_workload_start(priv, priv->fd.drm, &w);
> > > +
> > >  	driver_unbind(priv, "hot ", 0);
> > >=20
> > > +	xe_workload_stop(&w);
> > > +
> >=20
> > This makes these hot* tests Xe driver only which is not a way to go.
> > +Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> >=20
>=20
> Thank you for the review, but it is not the case.
> xe_workload_start() checks is_xe_device(fd) and returns immediately on no=
n-Xe drivers, leaving w->xe_spin NULL;=20
> and xe_workload_stop() then returns early at the !w->xe_spin check.
> So, on i915 the hot* tests work exactly as before.

1. Please don't change scope of existing subtests.  If you need=C2=A0
   to=C2=A0test=C2=A0hot unplug with a background workload then please add =
a new=C2=A0
   dedicated subtest.

2. Please keep the test hardware agnostic.  That also means, don't call=C2=
=A0
   unconditionally functions which names suggest applicability to a=C2=A0
   specific platform.  That's misleading.  You may e.g. follow a code=C2=A0
   pattern=C2=A0now used when a platform specific healtcheck is called.

Thanks,
Janusz

>=20
> - Nitin
>=20
> > Regards,
> > Kamil
> >=20
> > >  	priv->fd.drm =3D close_device(priv->fd.drm, "late ", "unbound ");
> > >  	igt_assert_eq(priv->fd.drm, -1);
> > >=20
> > > @@ -607,12 +651,18 @@ static void hotunbind_rebind(struct hotunplug
> > > *priv)
> > >=20
> > >  static void hotunplug_rescan(struct hotunplug *priv)  {
> > > +	struct xe_workload w =3D { 0 };
> > > +
> > >  	pre_check(priv);
> > >=20
> > >  	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot unplug"=
);
> > >=20
> > > +	xe_workload_start(priv, priv->fd.drm, &w);
> > > +
> > >  	device_unplug(priv, "hot ", 0);
> > >=20
> > > +	xe_workload_stop(&w);
> > > +
> > >  	priv->fd.drm =3D close_device(priv->fd.drm, "late ", "removed ");
> > >  	igt_assert_eq(priv->fd.drm, -1);
> > >=20
> > > @@ -623,40 +673,58 @@ static void hotunplug_rescan(struct hotunplug
> > > *priv)
> > >=20
> > >  static void hotrebind(struct hotunplug *priv)  {
> > > +	struct xe_workload w =3D { 0 };
> > > +
> > >  	pre_check(priv);
> > >=20
> > >  	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot rebind"=
);
> > >=20
> > > +	xe_workload_start(priv, priv->fd.drm, &w);
> > > +
> > >  	driver_unbind(priv, "hot ", 60);
> > >=20
> > >  	driver_bind(priv, 0);
> > >=20
> > > +	xe_workload_stop(&w);
> > > +
> > >  	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);  }
> > >=20
> > >  static void hotreplug(struct hotunplug *priv)  {
> > > +	struct xe_workload w =3D { 0 };
> > > +
> > >  	pre_check(priv);
> > >=20
> > >  	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot replug"=
);
> > >=20
> > > +	xe_workload_start(priv, priv->fd.drm, &w);
> > > +
> > >  	device_unplug(priv, "hot ", 60);
> > >=20
> > >  	bus_rescan(priv, 0);
> > >=20
> > > +	xe_workload_stop(&w);
> > > +
> > >  	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);  }
> > >=20
> > >  static void hotrebind_lateclose(struct hotunplug *priv)  {
> > > +	struct xe_workload w =3D { 0 };
> > > +
> > >  	pre_check(priv);
> > >=20
> > >  	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot rebind"=
);
> > >=20
> > > +	xe_workload_start(priv, priv->fd.drm, &w);
> > > +
> > >  	driver_unbind(priv, "hot ", 60);
> > >=20
> > >  	driver_bind(priv, 0);
> > >=20
> > > +	xe_workload_stop(&w);
> > > +
> > >  	priv->fd.drm =3D close_device(priv->fd.drm, "late ", "unbound ");
> > >  	igt_assert_eq(priv->fd.drm, -1);
> > >=20
> > > @@ -665,14 +733,20 @@ static void hotrebind_lateclose(struct hotunplu=
g
> > > *priv)
> > >=20
> > >  static void hotreplug_lateclose(struct hotunplug *priv)  {
> > > +	struct xe_workload w =3D { 0 };
> > > +
> > >  	pre_check(priv);
> > >=20
> > >  	priv->fd.drm =3D local_drm_open_driver(false, "", " for hot replug"=
);
> > >=20
> > > +	xe_workload_start(priv, priv->fd.drm, &w);
> > > +
> > >  	device_unplug(priv, "hot ", 60);
> > >=20
> > >  	bus_rescan(priv, 0);
> > >=20
> > > +	xe_workload_stop(&w);
> > > +
> > >  	priv->fd.drm =3D close_device(priv->fd.drm, "late ", "removed ");
> > >  	igt_assert_eq(priv->fd.drm, -1);
> > >=20
> > > --
> > > 2.50.1
> > >=20
