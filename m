Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E026E2D8
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 18:06:58 +0000 (UTC)
Date: Thu, 8 Apr 2021 11:13:44 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210408181344.GA18350@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-2-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-2-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 01/14] tools/intel_display_poller: Fix
 TILEOFF vs. LINOFF for skl+
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

On Mon, Mar 01, 2021 at 12:37:34PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> skl+ (like hsw/bdw) always use the TILEOFF register, and never
> the LINOFF register. Let's respect that.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  tools/intel_display_poller.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index f4797a20..15da8e76 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -128,9 +128,9 @@ static uint32_t dspoffset_reg(uint32_t devid, int pip=
e)
>  	bool use_tileoff;
>  	int plane =3D pipe_to_plane(devid, pipe);
>  =

> -	if (IS_GEN2(devid) || IS_GEN3(devid))
> +	if (intel_gen(devid) < 4)
>  		use_tileoff =3D false;
> -	else if (IS_HASWELL(devid) || IS_BROADWELL(devid))
> +	else if (IS_HASWELL(devid) || IS_BROADWELL(devid) || intel_gen(devid) >=
=3D 9)
>  		use_tileoff =3D true;
>  	else
>  		use_tileoff =3D read_reg(PIPE_REG(plane, DSPACNTR)) & DISPLAY_PLANE_TI=
LED;
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
