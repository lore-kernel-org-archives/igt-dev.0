Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC6EEF9001
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 16:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F97610E596;
	Wed,  4 Mar 2026 16:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwI0JLE1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BE310E596
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 16:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772641892; x=1804177892;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dhZYJRZaB0m9nTtg/get6au/QnejeQgyFU2kvKwKdDs=;
 b=LwI0JLE1ew2aGXhnyTktYzeKddzDy5L8Zi9rfyATdflnbnktYUxOIw2U
 yppzwnKSfmwG8oeu1vZS2eyEhbp7QK0ClpcJDJIn+SZj3YpqCVr3aWmsy
 O0LHXnrwJYNBUQ7isfWez+og2SrJrJM7m6hS/k/gkeN6BzCpT6rkE4gn3
 q1HIt74fIqrKQXrWV78ft4Y5eAiA3BPEmBQv5nydpcSYpK2nnnckfyd07
 WdzKRUGSNd5nI+ST6XDKHUp7C+fvbse0WIstn7qn9YIrys4TjczE7apyh
 73wcxwSV5YAt5Vb829Ad8IwO3Aedae/w/flgFIE6x0ZJRpExGnC2DHAzj w==;
X-CSE-ConnectionGUID: GkTkcBaNR+W4/EBFLWcCCA==
X-CSE-MsgGUID: SgpnXvy5QUm8pompdzzrhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72735257"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="72735257"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:31:32 -0800
X-CSE-ConnectionGUID: vQG+GDoTQ9SFeZVB9GvItg==
X-CSE-MsgGUID: 17pYdCUHTCaxDBIQrjt7Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="222550184"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.97])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:31:31 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>, igt-dev@lists.freedesktop.org, 
 stuart.summers@intel.com,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Subject: Re: [i-g-t] tests/core_hotunplug: Open render capable DRM device
Date: Wed, 04 Mar 2026 17:31:28 +0100
Message-ID: <2263648.irdbgypaU6@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260304135601.iwue6vspcb5oxbo5@kamilkon-DESK.igk.intel.com>
References: <9e4d3126426686f9fde73011753ca1e85a32dd0d.1772578021.git.jagmeet.randhawa@intel.com>
 <20260304135601.iwue6vspcb5oxbo5@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi,

On Wednesday, 4 March 2026 14:56:01 CET Kamil Konieczny wrote:
> Hi Jagmeet,
> On 2026-03-04 at 06:53:32 +0800, Jagmeet Randhawa wrote:
> > The test may select simpledrm when opening DRIVER_ANY,
> > which does not expose a render node. This causes the
> > later render open to fail.
> >=20
> > Open a render capable device initially using
> > __drm_open_driver_render(DRIVER_ANY) to avoid
> > selecting simpledrm.
>=20
> This is strange, as this test assumes card open and then tries
> uses render for verification so I am not sure if you could
> start with render. Adding Janusz to Cc.

My design didn't expect a missing render node, and that was a mistake. =20
In real world, devices with only master or only render node can exist. =20
If we want to keep the test hardware agnostic, as it was designed, then=20
it should probe both node types for their existence on start, store that=20
information, and then use it while running to skip those processing paths=20
that are not applicable.

Thanks,
Janusz

>=20
> Could you also add links to issues on GitLab, if there are any?
>=20
> Other idea to solve this would be to add simpledrm to known
> drivers and a blocked ones, like VGEM.
>=20
> Regards,
> Kamil
>=20
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
>=20
> >=20
> > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> > ---
> >  tests/core_hotunplug.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> > index 7c9dae1bf..3a612fce2 100644
> > --- a/tests/core_hotunplug.c
> > +++ b/tests/core_hotunplug.c
> > @@ -696,8 +696,8 @@ int igt_main()
> >  		int fd_drm;
> >  		char driver[32] =3D {};
> > =20
> > -		fd_drm =3D __drm_open_driver(DRIVER_ANY);
> > -		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
> > +		fd_drm =3D __drm_open_driver_render(DRIVER_ANY);
> > +		igt_skip_on_f(fd_drm < 0, "No known DRM render device found\n");
> > =20
> >  		priv.chipset =3D drm_get_chipset(fd_drm);
> >  		/* Make sure it opens the same driver */
>=20




