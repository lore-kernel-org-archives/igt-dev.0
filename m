Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39766E8C6
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 11:41:47 +0000 (UTC)
Date: Tue, 23 Mar 2021 13:42:27 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YFnUIx0S0c47EfbL@platvala-desk.ger.corp.intel.com>
References: <20210323105306.400-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323105306.400-1-venkata.sai.patnana@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/kms: Add for_each_pipe_clamped
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
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 04:23:05PM +0530, venkata.sai.patnana@intel.com wro=
te:
> From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> =

> for_each_pipe and for_each_pipe_static cannot be used for limiting pipe i=
teration.
> This api will provide limits the pipe iteration
> =

> v2: Handle fused pipes (Petri)
>     Add a variable pipe count (Bhanu)
> v3: change api name as suggested (Petri)
> =

> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Juha-Pekka Heikkil=E4 <juha-pekka.heikkila@intel.com>
> Cc: Modem Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>  lib/igt_kms.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> =

> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 09b10b3e04..7dbf14483c 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -534,6 +534,18 @@ static inline bool igt_output_is_connected(igt_outpu=
t_t *output)
>  	for_each_pipe_static(pipe) \
>  		for_each_if((display)->pipes[(pipe)].enabled)
>  =

> +/**
> + * for_each_pipe_clamped:
> + * @display: a pointer to an #igt_display_t structure
> + * @pipe: The pipe to iterate.
> + * @pipe_count: Number of pipes to be iterate
> + *
> + * This for loop iterates based on pipe_count and supported by IGT libra=
ries,
> + */
> +#define for_each_pipe_clamped(display, pipe, pipe_count) \
> +	for_each_pipe_static(pipe) \
> +                for_each_if((display)->pipes[(pipe)].enabled) \
> +			for_each_if(pipe_count-- > 0)

This is awkward to use. It requires an lvalue as the third parameter,
and doesn't restore it after the loop is done. Patch 2/2 completely
breaks testing when running multiple subtests at a time.

You need something like

#define for_each_pipe_clamped(display, pipe, count) \
  for (int igt_tokencat(__tmpint,__LINE__) =3D 0, pipe =3D 0; \
      igt_tokencat(__tmpint,__LINE__) < (count) && (pipe) < IGT_MAX_PIPES; \
      (pipe) ++) \
      for_each_if((display)->pipes[(pipe)].enabled) \
        for_each_if(igt_tokencat(__tmpint,__LINE__) ++)


(Above code completely untested)

-- =

Petri Latvala




>  /**
>   * for_each_pipe_with_valid_output:
>   * @display: a pointer to an #igt_display_t structure
> -- =

> 2.25.1
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
