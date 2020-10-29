Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 29 Oct 2020 18:59:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20201029165948.GF6112@intel.com>
References: <20201029110030.9959-1-chris@chris-wilson.co.uk>
 <20201029164417.14487-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029164417.14487-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH v2] drm: Quieten [zero] EDID carping
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 04:44:17PM +0000, Chris Wilson wrote:
> We have a few displays in CI that always report their EDID as a bunch of
> zeroes. This is consistent behaviour, so one assumes intentional
> indication of an "absent" EDID. Flagging these consistent warnings
> detracts from CI.
> =

> One option would be to ignore the zero EDIDs as intentional behaviour,
> but Ville would like to keep the information available for debugging.
> The simple alternative then is to reduce the loglevel for all the EDID
> dumping from WARN to DEBUG so the information is present but not annoy
> CI. Note that the bad EDID dumping is already only shown if
> drm.debug=3DKMS, it's just the loglevel chosen was set to be caught by CI
> if it ever occurred as it was expected to be an internal error not
> external.

Indeed. That makes this even less controversial.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> =

> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2203
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 631125b46e04..c7363af731b4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1844,7 +1844,7 @@ static void connector_bad_edid(struct drm_connector=
 *connector,
>  	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
>  		return;
>  =

> -	drm_warn(connector->dev, "%s: EDID is invalid:\n", connector->name);
> +	drm_dbg_kms(connector->dev, "%s: EDID is invalid:\n", connector->name);
>  	for (i =3D 0; i < num_blocks; i++) {
>  		u8 *block =3D edid + i * EDID_LENGTH;
>  		char prefix[20];
> @@ -1856,7 +1856,7 @@ static void connector_bad_edid(struct drm_connector=
 *connector,
>  		else
>  			sprintf(prefix, "\t[%02x] GOOD ", i);
>  =

> -		print_hex_dump(KERN_WARNING,
> +		print_hex_dump(KERN_DEBUG,
>  			       prefix, DUMP_PREFIX_NONE, 16, 1,
>  			       block, EDID_LENGTH, false);
>  	}
> -- =

> 2.20.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
