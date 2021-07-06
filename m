Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B406E489
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jul 2021 12:35:58 +0000 (UTC)
Date: Tue, 6 Jul 2021 08:35:53 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210706123553.m2eumbrdpcnytjcy@outlook.office365.com>
References: <20210621172146.4130875-1-markyacoub@chromium.org>
 <20210622181152.3ihjwqrurd27lwvd@outlook.office365.com>
 <YNLRnYcVTsTF1kZC@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YNLRnYcVTsTF1kZC@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2] lib/igt_fb: Support Tile Size for AMD non
 linear modifiers.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1466801790=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>, seanpaul@chromium.org, bas@basnieuwenhuizen.nl
List-ID: <igt-dev@lists.freedesktop.org>

--===============1466801790==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5mr35dqlf3t4kehy"
Content-Disposition: inline

--5mr35dqlf3t4kehy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/23, Petri Latvala wrote:
> On Tue, Jun 22, 2021 at 02:11:52PM -0400, Rodrigo Siqueira wrote:
> > On 06/21, Mark Yacoub wrote:
> > > From: Mark Yacoub <markyacoub@google.com>
> > >=20
> > > Calculate the width and height of the tile on amdgpu when the modifier
> > > is not linear.
> > >=20
> > > v1:
> > > Change width_ret to bytes not pixels.
> > >=20
> > > Cc: bas@basnieuwenhuizen.nl
> > > Cc: daniel.vetter@ffwll.ch
> > > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > > Change-Id: I30849ee1368fc626d1ce2826fb726cd76565a449
> > > ---
> > >  lib/igt_fb.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >=20
> > > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > > index 71b89855..a3926dc9 100644
> > > --- a/lib/igt_fb.c
> > > +++ b/lib/igt_fb.c
> > > @@ -396,6 +396,19 @@ void igt_get_fb_tile_size(int fd, uint64_t modif=
ier, int fb_bpp,
> > >  		vc4_modifier_param =3D fourcc_mod_broadcom_param(modifier);
> > >  		modifier =3D fourcc_mod_broadcom_mod(modifier);
> > >  	}
> > > +	// For all non-linear modifiers, AMD uses 64 KiB tiles
> > > +	else if (IS_AMD_FMT_MOD(modifier)) {
> > > +		igt_require_amdgpu(fd);
> > > +		const int bytes_per_pixel =3D fb_bpp / 8;
> > > +		const int format_log2 =3D log2(bytes_per_pixel);
> > > +		const int pixel_log2 =3D log2(64 * 1024) - format_log2;
> > > +		const int width_log2 =3D (pixel_log2 + 1) / 2;
> > > +		const int height_log2 =3D pixel_log2 - width_log2;
> > > +
> > > +		*width_ret =3D bytes_per_pixel << width_log2;
> > > +		*height_ret =3D 1 << height_log2;
> > > +		return;
> > > +	}
> >=20
> > Hi Mark,
> >=20
> > This patch lgtm,
> >=20
> > Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> >=20
> > However, let's check if Bas has any comment about it.
> >=20
> > Btw, is the CI failure a false positive?
>=20
> Looks like those results are caused by the regression in the kernel we
> had for a bit. I queued this patch for a re-test.

Hi Petri,

Thanks a lot for queued the path for re-test. I can see that everything
is looks good now:

https://patchwork.freedesktop.org/series/89017/

I'm going to apply it.

Thanks
Siqueira
=20
>=20
> --=20
> Petri Latvala

--=20
Rodrigo Siqueira
https://siqueira.tech

--5mr35dqlf3t4kehy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDkTiUACgkQWJzP/com
vP9LnBAAhEYN6VSjyGxJ3qc6EE2EO3EefOVz2Zb7xZBnJjN8ZRzKr7iA/YwNcw8G
DIQuz86cwfwxMW5v9Ckk/BdD/tI/KzL2UKTPMkQNqHd7L3XdTuKkP3rAHpa1O2XN
9TGyDdvfWeS8NtELT31cdItLhE7DKrjVh5UeoOK4RuTRgpyNsxx8VfsL+3aSRU6J
JMLAsh59rT13TbNogmPNkwQIYld4Qg1R1WQ8T5srjqnySappQFw4D5g8nVmGXvhg
Y05a5Ak+Zv3MMwks4hYrSzlI+SL7FMwdBC0yPHZEJmkHCWWWYiKEL0k/MKNcomSx
dHoYc+hEKRilrith2uCh/iCp6/46Uj4yccvKVPwub8GpXx4wpSU7yCj8WGj699ZG
03Tdy1nRtKnBGbTL34lAAVRdDRpElkfMDZK1BIFPt2yvOV2a+96zNpbgX+jSwPCN
hJiv29oOILph1fTvdDYnQiRIMMH+X67CzfJcmlBi7R2cnZus8RHpUQHL//qp8uw3
FKxmjlgar+Nv05LEOyu1POQqzNPUW2ZgvS8/CYvPtDQLXqpld4cg55wzUpwnc8mi
qby4QMbGzftzG9j9uJ4vE/Oa4QdbYhwo5SreyedKR09ri59+D95sHfsJ5Gx1bHFj
XMHwDcVzBim1ggkLOg4EiHG2fAES7xGRq7DGy7IXpysJD6+czN4=
=4NFD
-----END PGP SIGNATURE-----

--5mr35dqlf3t4kehy--

--===============1466801790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1466801790==--
