Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E1F10E1AA
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 06:27:39 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 14 Jul 2023 06:27:31 +0000
Message-ID: <DM4PR11MB63123DD7F0D9D1B59B587BD79034A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230713091726.272816-1-kunal1.joshi@intel.com>
 <20230713091726.272816-4-kunal1.joshi@intel.com>
In-Reply-To: <20230713091726.272816-4-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib/igt_chamelium: Added function
 to sort chamelium ports based on is_mapped
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
> Subject: [igt-dev] [PATCH i-g-t 3/3] lib/igt_chamelium: Added function to=
 sort
> chamelium ports based on is_mapped
>=20
> port_count was used to iterate on chamelium ports but its not neccessary =
that
> mapped ports are always on the top chamelium_ports array after autodiscov=
ery
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_chamelium.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c index
> a737330a6..8358ca109 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2638,6 +2638,44 @@ static bool get_connector_id_for_port(struct
> chamelium *chamelium,
>  	return false;
>  }
>=20
> +static void selective_sort_ports(struct chamelium_port *ports) {
> +    int mapped_count =3D 0;
> +    int unmapped_count =3D 0;
> +    int mapped_index =3D 0;
> +    int unmapped_index =3D mapped_count;
> +
> +    /*
> +     * Count the number of mapped and unmapped ports
> +     */
> +    for (int i =3D 0; i < CHAMELIUM_MAX_PORTS; i++) {
> +        if (ports[i].is_mapped) {
> +            mapped_count++;
> +        } else {
> +            unmapped_count++;
> +        }
> +    }
> +
> +    /*
> +     * Rearrange the ports such that mapped ports are at the start
> +     */
> +    unmapped_index =3D mapped_count;
> +
> +    struct chamelium_port sorted_ports[CHAMELIUM_MAX_PORTS];
> +
> +    for (int i =3D 0; i < CHAMELIUM_MAX_PORTS; i++) {
> +        if (ports[i].is_mapped) {
> +            sorted_ports[mapped_index++] =3D ports[i];
> +        } else {
> +            sorted_ports[unmapped_index++] =3D ports[i];
> +        }
> +    }
> +
> +    /*
> +     * Copy the sorted ports back to the original array
> +     */
> +    memcpy(ports, sorted_ports, CHAMELIUM_MAX_PORTS * sizeof(struct
> +chamelium_port)); }
> +
>  /**
>   * chamelium_autodiscover: automagically discover the Chamelium port
> mapping
>   *
> @@ -2755,6 +2793,10 @@ unplug_port:
>  	}
>  	sleep(CHAMELIUM_HOTPLUG_DETECTION_DELAY);
>=20
> +	/*
> +	 * Sort the ports based on the is_mapped flag
> +	 */
> +	selective_sort_ports(chamelium->ports);
>  	elapsed_ns =3D igt_nsec_elapsed(&start);
>  	igt_debug("Auto-discovery took %fms and found %i connector(s)\n",
>  		  (float)elapsed_ns / (1000 * 1000), chamelium->port_count);
> --
> 2.25.1
