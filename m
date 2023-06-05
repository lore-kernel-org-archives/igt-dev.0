Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D358D10E288
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 10:56:17 +0000 (UTC)
Date: Mon, 5 Jun 2023 12:56:12 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Message-ID: <20230605125612.5a14ffcc@maurocar-mobl2>
In-Reply-To: <20230605104716.5678-3-dominik.karol.piatkowski@intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <20230605104716.5678-3-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] lib/igt_kmod.c: check if module is
 builtin before attempting to unload it
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon,  5 Jun 2023 12:47:10 +0200
Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com> wrote:

> From: Isabella Basso <isabbasso@riseup.net>
>=20
> This change makes `igt_kmod_unload_r` safer as it checks whether the
> module can be unloaded before attempting it.
>=20
> v2 -> v3:
> - Fix commit message
> - Make return value clearer
>=20
> Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> Signed-off-by: Isabella Basso <isabbasso@riseup.net>
>=20
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> ---
>  lib/igt_kmod.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 93fa2006..26d58e29 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -259,6 +259,9 @@ static int igt_kmod_unload_r(struct kmod_module *kmod=
, unsigned int flags)
>  	int err, tries;
>  	const char *mod_name =3D kmod_module_get_name(kmod);
> =20
> +	if (kmod_module_get_initstate(kmod) =3D=3D KMOD_MODULE_BUILTIN)
> +		return 0;
> +
>  	holders =3D kmod_module_get_holders(kmod);
>  	kmod_list_foreach(pos, holders) {
>  		struct kmod_module *it =3D kmod_module_get_module(pos);
