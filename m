Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C4A6E2C8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 09:49:47 +0000 (UTC)
Date: Fri, 14 May 2021 12:53:03 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20210514095303.GD8652@intel.com>
References: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
 <20210414022754.31710-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414022754.31710-5-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/8] tools/intel_watermark: Reduce the
 number of planes for rkl/adls/adlp
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

On Wed, Apr 14, 2021 at 05:27:50AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Modern platforms have just 5 universal planes + cursor per pipe..

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@gmail.com>

> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_watermark.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> =

> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index 4a5764b59677..ff373fdb0c6d 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -135,7 +135,9 @@ static int skl_num_planes(uint32_t d, int pipe)
>  {
>  	int gen =3D intel_gen(d);
>  =

> -	if (gen >=3D 11)
> +	if (gen >=3D 13 || IS_ALDERLAKE_S(d) || IS_ROCKETLAKE(d))
> +		return 6;
> +	else if (gen >=3D 11)
>  		return 8;
>  	else if (gen =3D=3D 10 || IS_GEMINILAKE(d))
>  		return 5;
> @@ -149,7 +151,9 @@ static int skl_max_planes(uint32_t d)
>  {
>  	int gen =3D intel_gen(d);
>  =

> -	if (gen >=3D 11)
> +	if (gen >=3D 13 || IS_ALDERLAKE_S(d) || IS_ROCKETLAKE(d))
> +		return 6;
> +	else if (gen >=3D 11)
>  		return 8;
>  	else if (gen =3D=3D 10 || IS_GEMINILAKE(d) || IS_BROXTON(d))
>  		return 5;
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
