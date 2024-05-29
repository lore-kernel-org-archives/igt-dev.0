Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACBCC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 21:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6AF10FA3F;
	Wed, 29 May 2024 21:45:25 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4402A10FA3F
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 21:45:17 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239] helo=hazy.lan)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sCR6f-00000001Hkm-2AzF; Thu, 30 May 2024 00:45:14 +0300
Message-ID: <2d94493d7f2827c0e5d5536ef46066b72346d3b7.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Jani Saarinen
 <jani.saarinen@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>,  Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>
Date: Thu, 30 May 2024 00:45:12 +0300
In-Reply-To: <20240529163744.3tkyh44fcgjsxxy4@kamilkon-DESK.igk.intel.com>
References: <20240528075855.463729-1-luciano.coelho@intel.com>
 <20240528075855.463729-3-luciano.coelho@intel.com>
 <20240529163744.3tkyh44fcgjsxxy4@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel: check drmModeGetConnector()
 return in i915_pm_rpm
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

On Wed, 2024-05-29 at 18:37 +0200, Kamil Konieczny wrote:
> Hi Luca,
> On 2024-05-28 at 10:58:55 +0300, Luca Coelho wrote:
>=20
> this subject imho is too long:
>=20
> [PATCH i-g-t v2 2/2] tests/intel: check drmModeGetConnector() return in i=
915_pm_rpm
>=20
> It should have test name at begin, not at end:
>=20
> tests/intel/i915_pm_rpm: Fix bug in init_mode_set_data()
>=20
> or
>=20
> tests/intel/i915_pm_rpm: check drmModeGetConnector() before use
>=20
> or find out something better.

This is the same as in the previous patch.  So, just tell me which one
of your options you want me to use and I'll do it.  No need to bike-
shed on this here.


> > The drmModeGetConnector() function can return NULL in some cases, so
> > we need to check the return value before accessing it.  This is not
> > being checked in init_mode_set_data(), so fix that.
>=20
> Please cite few lines from bug report:
>=20
> Starting subtest: module-reload
> Received signal SIGSEGV.
> Stack trace:=20
> #0 [fatal_sig_handler+0x10f]
> #1 [killpg+0x40]
> #2 [setup_environment+0x33f]

This is one click away, in the link I added below, but I see the
potential usefulness to copy it here.  It could make it easier to find
patches that fix bugs in specific tests, if you use git grep, for
instance.  Though I'm in general of the opinion that duplicating
information that is already linked in one way or another.

But sure, I'll add it. :)


> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>=20
> Add here also some KMS devs to Cc, I added Jani, Juha-Pekka and Bhanuprak=
ash.
>=20
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Jani Saarinen <jani.saarinen@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Okay. :)

Do you have something like the kernel's get_maintainer.pl script?
Otherwise it's hard to know who should be justifiably spammed. ;)


> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  tests/intel/i915_pm_rpm.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> > index 0ea5fbd8afd9..3b4034f24a57 100644
> > --- a/tests/intel/i915_pm_rpm.c
> > +++ b/tests/intel/i915_pm_rpm.c
> > @@ -515,6 +515,12 @@ static void init_mode_set_data(struct mode_set_dat=
a *data)
> >  			data->connectors[i] =3D
> >  				drmModeGetConnector(drm_fd,
> >  						    data->res->connectors[i]);
> > +			if (!data->connectors[i]) {
>=20
> imho we should also check it later before using this or edids[]
> so maybe this should really be a warn? Or even igt_assert? Or maybe
> we should lower number of available connectors? Please ask KMS devs
> for possible solution here.

There probably are other places where this could be a problem, for
sure.  But I'm fixing a specific bug and maybe other changes should be
in separate patches? I actually checked all the places where
drmModeGetConnector() is called and only this part and the one in
chamelium code had to be changed.

I did discuss this with the kernel display driver team, I'm part of it
after all. ;) The driver can't guarantee the validity of a connector
returned in the list when we call drmModeGetConnector(), because it can
be disconnected at any time an return NULL.  Another option we
considered was to simply restart the test silently (or at least get the
list of connector IDs again), because this happens because of race
conditions.  But at this stage, I wanted a=C2=A0fix to prevent a crash, not
a full refactor of the test case.

One of my goals was to change the test as little as possible.  Without
my change, if this happened, the test would just crash.  I originally
made it warn, which, like the crash, would cause the test to fail,
making it visible.  But you asked me to change it to igt_debug(), so I
did.


> Above code should work if you also fix fini_mode_set_data() below
> and also at one more function:
>=20
> grep -n count_connectors tests/intel/i915_pm_rpm.c
>=20
> 319:    for (int i =3D 0; i < data->res->count_connectors; i++) {
> 513:            igt_assert(data->res->count_connectors <=3D MAX_CONNECTOR=
S);
> 514:            for (int i =3D 0; i < data->res->count_connectors; i++) {
> 531:            for (int i =3D 0; i < data->res->count_connectors; i++) {

I don't think the checks should be where count_connectors is used, but
in the functions that may fail if the connector is (or becomse)
invalid.  That's where the crash can happen if we assume it returns a
valid pointer and not NULL.

--
Cheers,
Luca.
