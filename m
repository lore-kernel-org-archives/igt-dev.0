Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BB26E08C
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Jan 2021 12:25:39 +0000 (UTC)
Date: Mon, 25 Jan 2021 14:25:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YA64v4C3f5rAyDV1@intel.com>
References: <20210125070336.15378-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125070336.15378-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_panel_fitting: test requires
 eDP
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
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 12:33:36PM +0530, Nidhi Gupta wrote:
> Added a condition to check the availability of eDP
> before execution of the test. Skip the test with
> proper debug messsage if eDP is not there
> =

> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_panel_fitting.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> =

> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index 4f4c5608..9f6b00e5 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -254,7 +254,10 @@ igt_main
>  	igt_fixture {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
>  		igt_display_require(&data.display, data.drm_fd);
> -		igt_display_require_output(&data.display);
> +
> +		if (data.display.outputs->config.connector->connector_type !=3D
> +		    DRM_MODE_CONNECTOR_eDP)
> +			igt_skip("Can't test: no usable eDP screen.\n");

No, it just wants an output type where we've hooked up the pfit.
It already checks for that by looking for the scaling mode prop.

>  	}
>  =

>  	igt_subtest("legacy")
> -- =

> 2.26.2
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
