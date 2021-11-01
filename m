Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C60289FDD
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Nov 2021 09:21:56 +0000 (UTC)
Date: Mon, 1 Nov 2021 11:20:36 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YX+xZDnzHEIbHcYL@platvala-desk.ger.corp.intel.com>
References: <20211030000744.231762-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211030000744.231762-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/meson: Fix build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 29, 2021 at 05:07:43PM -0700, Jos=E9 Roberto de Souza wrote:
> Getting:
> ../lib/meson.build:158:4: ERROR: Function does not take positional argume=
nts.
> with meson 0.60.
>=20
> Acording to documentation underscorify() do not take any arguments as
> it will be executed over the string/object instace of the class.
> https://mesonbuild.com/Reference-manual_elementary_str.html#strunderscori=
fy
>=20
> Not sure why older versions was not complaning about it.
>=20
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>

https://patchwork.freedesktop.org/patch/461649/?series=3D96375&rev=3D1

Wanna throw a something-by: line to that patch?

> ---
>  lib/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/meson.build b/lib/meson.build
> index c3080fc82..297b0ad26 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -155,7 +155,7 @@ lib_version =3D vcs_tag(input : 'version.h.in', outpu=
t : 'version.h',
> =20
>  lib_intermediates =3D []
>  foreach f: lib_sources
> -    name =3D f.underscorify(f)
> +    name =3D f.underscorify()
>      lib =3D static_library('igt-' + name,
>  	[ f, lib_version ],
>  	include_directories: inc,
> --=20
> 2.33.1
>=20
