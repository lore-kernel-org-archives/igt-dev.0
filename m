Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D73E6E2C8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 09:44:49 +0000 (UTC)
Date: Fri, 14 May 2021 12:47:56 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20210514094756.GC8606@intel.com>
References: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
 <20210414022754.31710-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414022754.31710-4-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/8] tools/intel_watermark: Deal with
 TGL planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 05:27:49AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> TGL has the same amount of planes as ICL. Make intel_watermark
> aware of that fact.
> =

> v2: Use intel_gen()

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@gmail.com>

> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_watermark.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> =

> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index 39aaf9fbe055..4a5764b59677 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -133,9 +133,11 @@ static char endis_ast(bool enabled)
>  =

>  static int skl_num_planes(uint32_t d, int pipe)
>  {
> -	if (IS_GEN11(d))
> +	int gen =3D intel_gen(d);
> +
> +	if (gen >=3D 11)
>  		return 8;
> -	else if (IS_GEN10(d) || IS_GEMINILAKE(d))
> +	else if (gen =3D=3D 10 || IS_GEMINILAKE(d))
>  		return 5;
>  	else if (IS_BROXTON(d))
>  		return pipe =3D=3D 2 ? 4 : 5;
> @@ -145,9 +147,11 @@ static int skl_num_planes(uint32_t d, int pipe)
>  =

>  static int skl_max_planes(uint32_t d)
>  {
> -	if (IS_GEN11(d))
> +	int gen =3D intel_gen(d);
> +
> +	if (gen >=3D 11)
>  		return 8;
> -	else if (IS_GEN10(d) || IS_GEMINILAKE(d) || IS_BROXTON(d))
> +	else if (gen =3D=3D 10 || IS_GEMINILAKE(d) || IS_BROXTON(d))
>  		return 5;
>  	else
>  		return 4;
> -- =

> 2.26.3
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
