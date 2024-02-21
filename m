Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296BEC48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 10:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE06710E45E;
	Wed, 21 Feb 2024 10:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGVMvsNC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1013510E45E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 10:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708509873; x=1740045873;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tDRPN7s6vhUCX0L05q7llJ5Y5fmItQBV7b5WaRllt7o=;
 b=AGVMvsNC4kNtGIr9PU2rz3nQCmRtdaMPIusg6iprcWP+ibY1p+T/IuNe
 wiApecivbXsUIDGvCu0KrZ/RuNPSIQ2TXJumnUJrvxuWk0eHViQZ6KaR4
 I1RGeXZ66l1UWYYF6Uk6Q1Bie92+idhgqHwOvXRKpvdHpsVImdloqpEdZ
 pb6/5/hAArNpo5valgZ3cHoHSvFQJrHOH9T1rIklwUSdzSKWGT+tRRncI
 esSJX8nqFL+U1M3DuqIUyE7hLQKPCitJGXfQM8lArL5fhBOLhsD6Mm8Vq
 I+zMcj36Y6JKpuRtRXA8BSEBeR7XU0QqLi4wJEm8D57iAjkDTAsCvhrtT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2527063"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2527063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="36126530"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.23.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:04:29 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Dominik Karol =?utf-8?B?UGnEhXRrb3dza2k=?=
 <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v9 2/7] lib/drmtest: Introduced
 drm_open_driver_another
Date: Wed, 21 Feb 2024 11:04:26 +0100
Message-ID: <61020864.matp6XCIr4@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240220183344.x4lkuflz5ackohcc@kamilkon-desk.igk.intel.com>
References: <20240215161014.60304-1-kamil.konieczny@linux.intel.com>
 <10419859.qUNvkh4Gvn@jkrzyszt-mobl2.ger.corp.intel.com>
 <20240220183344.x4lkuflz5ackohcc@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Hi Kamil,

On Tuesday, 20 February 2024 19:33:44 CET Kamil Konieczny wrote:
> Hi Janusz,
> On 2024-02-20 at 10:32:58 +0100, Janusz Krzysztofik wrote:
> > Hi Kamil,
> >=20
> > On Monday, 19 February 2024 18:42:32 CET Kamil Konieczny wrote:
> > > Hi Janusz,
> > > On 2024-02-16 at 11:23:58 +0100, Janusz Krzysztofik wrote:
> > > > Hi Kamil, Dominik,
> > > >=20
> > > > On Thursday, 15 February 2024 17:10:09 CET Kamil Konieczny wrote:
> > > > > From: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@int=
el.com>
> > > > >=20
> > > > > For user convenience, introduce drm_open_driver_another as
> > > > > a wrapper for __drm_open_driver_another with successful open
> > > > > assert.
> > > >=20
> > > > Out of several existing variants of *drm_open_driver* functions, th=
ose which=20
> > > > names start with "drm_", wrapped around their counterparts which na=
mes start=20
> > > > with double underscores, used to set up an exit handler that perfor=
ms=20
> > > > necessary cleanups before exit, freeing users from taking care of t=
hat.  Don't=20
> > > > we want to keep that convention also for drm_open_driver_another() =
and set up=20
> > > > the exit handler from inside that wrapper on success?
> > > >=20
> > > > Thanks,
> > > > Janusz
> > > >=20
> > >=20
> > > How and what should we unwind here? There is only fd, I do not see
> > > any other var or state to unwind? Am I missing something?
> >=20
> > Have you had a look at drm_open()?
> >=20
> >         /* For i915, at least, we ensure that the driver is idle before
> >          * starting a test and we install an exit handler to wait until
> >          * idle before quitting.
> >          */
> >         if (is_i915_device(fd)) {
> >                 if (__sync_fetch_and_add(&open_count, 1) =3D=3D 0) {
> >                         __cancel_work_at_exit(fd);
> >                         at_exit_drm_fd =3D drm_reopen_driver(fd);
> >                         igt_install_exit_handler(cancel_work_at_exit);
> >                 }
> >         }
> >=20
> > From that point of view, how does multi-gpu testing differ from single-=
gpu?
> >=20
> > And yes, that can be not trivial to extend the existing exit handlers s=
olution=20
> > over multiple device file descriptor handling.
> >=20
>=20
> This is another problem, I try to solve one, not all at once.
> I could add a helper to stop resets from children as it can be
> helpfull not only in multi-gpu scenarios.

OK, but users may still expect extra features from the new function, compar=
ed=20
to the one it wraps around, similar to those provided by drm_open_driver() =
vs.=20
__drm_open_driver().  If that expectation can't be satisfied at the moment=
=20
then we should warn users via a comment about those potentially expected=20
features missing for now, I believe.  Or explain why drm_open_driver_anothe=
r()=20
is going to handle that in a way different from drm_driver_open(), if so=20
decided.

Thanks,
Janusz

>=20
> > Also ...
> >=20
> > >=20
> > > Regards,
> > > Kamil
> > >=20
> > > > >=20
> > > > > v2: rebased (Kamil)
> > > > > v6: reword description (Janusz)
> > > > >=20
> > > > > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > > > Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatk=
owski@intel.com>
> > > > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > > Reviewed-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@inte=
l.com>
> > > > > ---
> > > > >  lib/drmtest.c | 19 +++++++++++++++++++
> > > > >  lib/drmtest.h |  1 +
> > > > >  2 files changed, 20 insertions(+)
> > > > >=20
> > > > > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > > > > index 52b5a2020..73d9159af 100644
> > > > > --- a/lib/drmtest.c
> > > > > +++ b/lib/drmtest.c
> > > > > @@ -563,6 +563,25 @@ int __drm_open_driver_another(int idx, int c=
hipset)
> > > > >  	return fd;
> > > > >  }
> > > > > =20
> > > > > +/*
> > > > > + * drm_open_driver_another
> > > > > + * @idx: index of the device you are opening
> > > > > + * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_=
INTEL
> > > > > + *
> > > > > + * A wrapper for __drm_open_driver with successful open assert.
> > > > > + *
> > > > > + * Returns:
> > > > > + * An open DRM fd
> > > > > + */
> > > > > +int drm_open_driver_another(int idx, int chipset)
> > > > > +{
> > > > > +	int fd =3D __drm_open_driver_another(idx, chipset);
> > > > > +
> > > > > +	igt_assert_fd(fd);
> >=20
> > drm_open_driver() skips in that case.  Shouldn't drm_open_driver_anothe=
r()=20
> > also skip for consistency?
>=20
> Good point, I will re-read this,
>=20
> Regards,
> Kamil
>=20
> >=20
> > Thanks,
> > Janusz
> >=20
> > > > > +
> > > > > +	return fd;
> > > > > +}
> > > > > +
> > > > >  /**
> > > > >   * __drm_open_driver:
> > > > >   * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_=
INTEL
> > > > > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > > > > index 6bc819734..856208c48 100644
> > > > > --- a/lib/drmtest.h
> > > > > +++ b/lib/drmtest.h
> > > > > @@ -101,6 +101,7 @@ void __set_forced_driver(const char *name);
> > > > > =20
> > > > >  int __drm_open_device(const char *name, unsigned int chipset);
> > > > >  void drm_load_module(unsigned int chipset);
> > > > > +int drm_open_driver_another(int idx, int chipset);
> > > > >  int drm_open_driver(int chipset);
> > > > >  int drm_open_driver_master(int chipset);
> > > > >  int drm_open_driver_render(int chipset);
> > > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20




