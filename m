Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACD010E7C6
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 06:19:33 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 14 Jul 2023 06:19:23 +0000
Message-ID: <DM4PR11MB631264FD662C5388CF75181D9034A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230713091726.272816-1-kunal1.joshi@intel.com>
 <20230713091726.272816-3-kunal1.joshi@intel.com>
In-Reply-To: <20230713091726.272816-3-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_chamelium: Added is_mapped
 to track mapped ports
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

LTGM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Thursday, July 13, 2023 2:47 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [igt-dev] [PATCH i-g-t 2/3] lib/igt_chamelium: Added is_mapped t=
o
> track mapped ports
>=20
> Added boolean is_mapped, which is true for mapped ports and only plug
> mapped ports
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_chamelium.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c index
> 95983ff25..a737330a6 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -99,6 +99,7 @@ struct chamelium_port {
>  	char *name;
>  	bool adapter_allowed;
>  	char *connector_path;
> +	bool is_mapped;
>  };
>=20
>  struct chamelium_frame_dump {
> @@ -2721,6 +2722,7 @@ static bool chamelium_autodiscover(struct
> chamelium *chamelium)
>  			igt_info("Failed to auto-discover port %d\n", port_id);
>  			goto unplug_port;
>  		}
> +		port->is_mapped =3D true;
>  		is_any_port_mapped =3D true;
>=20
>  		/* If we found a connector for our port, increment the number
> of valid Chamelium ports. */ @@ -2746,9 +2748,10 @@ unplug_port:
>  	}
>=20
>  	/* After we're all set, turn on all supported ports */
> -	for (i =3D 0; i < chamelium->port_count; i++) {
> +	for (i =3D 0; i < CHAMELIUM_MAX_PORTS; i++) {
>  		struct chamelium_port *port =3D &chamelium->ports[i];
> -		chamelium_plug(chamelium, port);
> +		if (port->is_mapped)
> +			chamelium_plug(chamelium, port);
>  	}
>  	sleep(CHAMELIUM_HOTPLUG_DETECTION_DELAY);
>=20
> --
> 2.25.1
