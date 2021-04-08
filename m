Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B988E6E2D8
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 18:12:06 +0000 (UTC)
Date: Thu, 8 Apr 2021 11:18:53 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210408181852.GD18350@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-9-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-9-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 08/14] lib: Add timestmap registers
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 12:37:41PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Add definitions for the timestamp registers.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  lib/intel_reg.h | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> index d5017f3d..d4045c36 100644
> --- a/lib/intel_reg.h
> +++ b/lib/intel_reg.h
> @@ -2294,6 +2294,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWA=
RE.
>   */
>  #define PIPEAFRMCOUNT_G4X	0x70040
>  #define PIPEAFLIPCOUNT_G4X	0x70044
> +#define PIPEAFRMTMSMTP		0x70048
>  /*
>   * Computing GMCH M and N values.
>   *
> @@ -2801,6 +2802,8 @@ typedef enum {
>  #define MCHBAR_RENDER_STANDBY	0x111B8
>  #define RENDER_STANDBY_ENABLE	(1 << 30)
>  =

> +#define ILK_TIMESTAMP_HI        0x70070
> +#define IVB_TIMESTAMP_CTR       0x44070
>  =

>  /* Ironlake */
>  =

> -- =

> 2.19.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
