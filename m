Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0519E6E2C8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 09:50:17 +0000 (UTC)
Date: Fri, 14 May 2021 12:53:35 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20210514095335.GE8652@intel.com>
References: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
 <20210414022754.31710-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414022754.31710-6-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/8] tools/intel_watermark: TGL+ can
 have 4 pipes
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

On Wed, Apr 14, 2021 at 05:27:51AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Decode pipe D watermark stuff too.

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@gmail.com>

> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_watermark.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> =

> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index ff373fdb0c6d..657fff20ec7a 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -131,6 +131,11 @@ static char endis_ast(bool enabled)
>  	return enabled ? '*' : ' ';
>  }
>  =

> +static int skl_num_pipes(uint32_t d)
> +{
> +	return intel_gen(d) >=3D 12 ? 4 : 3;
> +}
> +
>  static int skl_num_planes(uint32_t d, int pipe)
>  {
>  	int gen =3D intel_gen(d);
> @@ -269,7 +274,7 @@ static void skl_wm_dump(void)
>  {
>  	struct intel_mmio_data mmio_data;
>  	int pipe, plane, level;
> -	int num_pipes =3D 3;
> +	int num_pipes =3D skl_num_pipes(devid);
>  	int max_planes =3D skl_max_planes(devid);
>  	int num_levels =3D 8;
>  	uint32_t base_addr =3D 0x70000, addr, wm_offset;
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
