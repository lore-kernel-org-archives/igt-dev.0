Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6FD10E1B5
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 06:15:14 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 14 Jul 2023 06:15:10 +0000
Message-ID: <DM4PR11MB631264B5741A7807A631D1169034A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230713091726.272816-1-kunal1.joshi@intel.com>
 <20230713091726.272816-2-kunal1.joshi@intel.com>
In-Reply-To: <20230713091726.272816-2-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_chamelium: reset chamelium
 before starting autodiscovery
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM=20
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Thursday, July 13, 2023 2:47 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_chamelium: reset chamelium b=
efore
> starting autodiscovery
>=20
> TypeC connector need disabling modeset for correctly doing hpd cycle so d=
o it
> before going for autodiscovery
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_chamelium.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c index
> a235f3c87..95983ff25 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2903,6 +2903,13 @@ struct chamelium *chamelium_init(int drm_fd,
> igt_display_t *display)
>  	chamelium->drm_fd =3D dup(drm_fd);
>  	IGT_INIT_LIST_HEAD(&chamelium->edids);
>=20
> +	/*
> +	 * Reset the chamelium and do a disabling modeset for
> +	 * TypeC connector to come up nicely
> +	 */
> +	chamelium_reset(chamelium);
> +	igt_modeset_disable_all_outputs(display);
> +
>  	if (!chamelium_read_port_mappings(chamelium, drm_fd))
>  		goto error;
>=20
> --
> 2.25.1
