Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EBC6EBFD
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 15:26:24 +0000 (UTC)
Date: Wed, 24 Nov 2021 17:25:06 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YZ5ZUsvgAEh3U7sf@platvala-desk.ger.corp.intel.com>
References: <20211124151245.29369-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211124151245.29369-1-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Accept
 missing FBC debugfs files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 24, 2021 at 05:12:45PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> With multiple FBC instances becoming a thing at some point
> the current plan is to go with separate debugfs files for
> each FBC instance. Which also means that if there is no
> FBC there will be no debugfs files either. Adapt the test
> to tolerate such conditions.
>=20
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  tests/i915/kms_frontbuffer_tracking.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_front=
buffer_tracking.c
> index d6a884926c48..532bfbb9b481 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -724,7 +724,7 @@ static void __debugfs_read(const char *param, char *b=
uf, int len)
>  {
>  	len =3D igt_debugfs_simple_read(drm.debugfs, param, buf, len);
>  	if (len < 0)
> -		igt_assert_eq(len, -ENODEV);
> +		igt_assert(len =3D=3D -ENOENT || len =3D=3D -ENODEV);

If this fires, we now lose the information on what the error
was. Although we automatically print errno in that case, is the error
in there?

--=20
Petri Latvala


>  }
> =20
>  static int __debugfs_write(const char *param, char *buf, int len)
> --=20
> 2.32.0
>=20
