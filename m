Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4017EE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 10:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1B310EF52;
	Fri, 20 Dec 2024 10:16:10 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B0910EF52
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 10:16:09 +0000 (UTC)
Received: from 91-155-254-69.elisa-laajakaista.fi ([91.155.254.69]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tOa3C-000000038my-2gnd; Fri, 20 Dec 2024 12:16:07 +0200
Message-ID: <3fee23488664a489d31013d5080d70d463c0e6be.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "B, Jeevan" <jeevan.b@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>,  "Murthy, Arun R" <arun.r.murthy@intel.com>
Date: Fri, 20 Dec 2024 12:16:05 +0200
In-Reply-To: <SN6PR11MB2704BA34578734826B3A656ADB072@SN6PR11MB2704.namprd11.prod.outlook.com>
References: <20241219155453.24946-1-santhosh.reddy.guddati@intel.com>
 <b53da129da1f2eafb7733ac7eb0f22b1246a6178.camel@coelho.fi>
 <SN6PR11MB2704BA34578734826B3A656ADB072@SN6PR11MB2704.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v1] lib/igt_kms: Backup connector modes before
 sorting
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

On Fri, 2024-12-20 at 10:06 +0000, Reddy Guddati, Santhosh wrote:
>=20
>=20
>=20
>=20
>=20
> From:=C2=A0Luca Coelho <luca@coelho.fi>
> Sent:=C2=A0Friday, December 20, 2024 3:13 PM
> To:=C2=A0Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; igt-=
dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> Cc:=C2=A0B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@inte=
l.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> Subject:=C2=A0Re: [PATCH i-g-t v1] lib/igt_kms: Backup connector modes be=
fore sorting
> =C2=A0
> On Thu, 2024-12-19 at 21:24 +0530, Santhosh Reddy Guddati wrote:
> > Backup connector modes before sorting to ensure the original mode
> > is not changed if the joiner is not found.This will skip updating
> > connector->mode[0] if joiner is not available.
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13287
> > Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com=
>
> > ---
> > =C2=A0 lib/igt_kms.c | 26 ++++++++++++++++++++++++--
> > =C2=A0 1 file changed, 24 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 3d061abc5..21a6a4639 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -6394,6 +6394,11 @@ bool bigjoiner_mode_found(int drm_fd, drmModeCon=
nector *connector,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 int max_dotclock, drmModeModeInfo *mode)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool found =3D false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 drmModeModeInfo *modes_backup;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 modes_backup =3D malloc(connector->count_mode=
s * sizeof(drmModeModeInfo));
> > +=C2=A0=C2=A0=C2=A0=C2=A0 igt_assert(modes_backup);
> > +=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(modes_backup, connector->modes, connec=
tor->count_modes * sizeof(drmModeModeInfo));
>=20
> It's usually considered safer to use the size of the instance and not
> of the structure itself (though in practice it doesn't make much
> difference): sizeof(*modes_backup).
>=20
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 igt_sort_connector_modes(con=
nector, sort_drm_modes_by_res_dsc);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found =3D igt_bigjoiner_poss=
ible(drm_fd, &connector->modes[0], max_dotclock);
> > @@ -6401,8 +6406,14 @@ bool bigjoiner_mode_found(int drm_fd, drmModeCon=
nector *connector,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 igt_sort_connector_modes(connector, sort_drm_modes_by=
_clk_dsc);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 found =3D igt_bigjoiner_possible(drm_fd, &connector->=
modes[0], max_dotclock);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=C2=A0=C2=A0=C2=A0=C2=A0 if (found)
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (found) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 *mode =3D connector->modes[0];
> > +=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 memcpy(connector->modes, modes_backup,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector->count_modes * size=
of(drmModeModeInfo));
> > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 free(modes_backup);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return found;
> > =C2=A0 }
> > =C2=A0
> > @@ -6438,6 +6449,11 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeC=
onnector *connector,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 int max_dotclock, drmModeModeInfo *mode)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool found =3D false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 drmModeModeInfo *modes_backup;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 modes_backup =3D malloc(connector->count_mode=
s * sizeof(drmModeModeInfo));
> > +=C2=A0=C2=A0=C2=A0=C2=A0 igt_assert(modes_backup);
> > +=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(modes_backup, connector->modes, connec=
tor->count_modes * sizeof(drmModeModeInfo));
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 igt_sort_connector_modes(con=
nector, sort_drm_modes_by_res_dsc);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found =3D igt_ultrajoiner_po=
ssible(&connector->modes[0], max_dotclock);
> > @@ -6445,8 +6461,14 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeC=
onnector *connector,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 igt_sort_connector_modes(connector, sort_drm_modes_by=
_clk_dsc);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 found =3D igt_ultrajoiner_possible(&connector->modes[=
0], max_dotclock);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=C2=A0=C2=A0=C2=A0=C2=A0 if (found)
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (found) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 *mode =3D connector->modes[0];
> > +=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 memcpy(connector->modes, modes_backup,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector->count_modes * size=
of(drmModeModeInfo));
> > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 free(modes_backup);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return found;
> > =C2=A0 }
> > =C2=A0
>=20
> Generally this looks okay to fix the bug, but IMHO the actual problem
> is that we shouldn't really be sorting the modes in order to find them.
> Maybe it would be better to use an find_max_res_mode() or something
> similar instead of using the sort function to find the mode you want?
>=20
> The intention of the original change was to identify if the output suppor=
ts joiner, as part of this we are checking this is_joiner_mode, While doing=
 so identified the problem to be sorting all the modes on the connector ins=
ide `ultrajoiner_mode_found`, this change avoids sorting the passed connect=
or modes.
>=20
> Please let me know your thoughts or questions.
>=20
> https://patchwork.freedesktop.org/patch/627125/?series=3D141614&rev=3D6

You patch will work, of course, but what I'm trying to say is that
you're sorting the list and then reverting the sort in case it's not
supported.  And the only reason why you're sorting it, is to find the
largest possible mode.  It's unnecessary to sort the list.  If you
don't sort, but just look for what you want in the existing list, you
don't need to "backup" and "restore" the list in case of failures.

--
Cheers,
Luca.
