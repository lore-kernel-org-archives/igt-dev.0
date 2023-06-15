Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6AD10E4B3
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 09:53:15 +0000 (UTC)
Date: Thu, 15 Jun 2023 11:53:11 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Message-ID: <20230615115311.63dbc485@maurocar-mobl2>
In-Reply-To: <20230614133301.4888-2-dominik.karol.piatkowski@intel.com>
References: <20230614133301.4888-1-dominik.karol.piatkowski@intel.com>
 <20230614133301.4888-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_core.h: Typo fix
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 14 Jun 2023 15:33:01 +0200
Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com> wrote:

> Fixed IGT_EXIT_ABORT description typo in lib/igt_core.h
>=20
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/igt_core.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index ef6bed6a5..26bb0cb68 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -136,8 +136,8 @@ struct _GKeyFile *igt_load_igtrc(void);
>  /**
>   * IGT_EXIT_ABORT
>   *
> - * Exit status indicating a severe test/enviroment failure, any continued
> - * testing past this point can yeild unexpected reasults and is not reco=
mmended
> + * Exit status indicating a severe test/environment failure, any continu=
ed
> + * testing past this point can yield unexpected results and is not recom=
mended
>   */
>  #define IGT_EXIT_ABORT 112
> =20
