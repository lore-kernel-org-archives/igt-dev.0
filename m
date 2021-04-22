Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963D66EA6F
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Apr 2021 11:33:58 +0000 (UTC)
Date: Thu, 22 Apr 2021 14:35:03 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YIFfZ4bZ5FQ/XaFY@platvala-desk.ger.corp.intel.com>
References: <20210105081352.82045-1-kunal1.joshi@intel.com>
 <20210105081352.82045-2-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105081352.82045-2-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/3] Make basic chamelium function
 accessible to other tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 01:43:50PM +0530, Kunal Joshi wrote:
> There are many use case where we can integrate chamelium with other tests,
> Migrating some of basic chamelium functions to igt_chamelium lib to avoid
> Code rewriting.
> 
> v2: Moved one more function reset_state from tests/kms_chamelium to
> lib/igt_chamelium.
> 
> v3: - Shifted disabling of modeset to igt_kms
>     - Replace connection_str with kmstest_connector_status_str (Petri)
>     - Generalized require__connector_present (Petri)
>     - Avoided using data_chamelium_t struct (Petri)
> 
> v4: - Moved function to library (Petri)
>     - Renamed some functions and added documentation (Petri)
> 
> v6: - Documentation of functions(Petri)
>     - Shifted function to igt_kms and renamed (Petri)
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  lib/igt_chamelium.c   | 131 +++++++++++++++
>  lib/igt_chamelium.h   |  28 ++++
>  lib/igt_kms.c         | 100 +++++++++++
>  lib/igt_kms.h         |  23 ++-
>  tests/kms_chamelium.c | 378 +++++++++++++++---------------------------
>  5 files changed, 411 insertions(+), 249 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 585fdfa8..112181d1 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -218,6 +218,137 @@ const char *chamelium_port_get_name(struct chamelium_port *port)
>  	return port->name;
>  }
>  
> +/**
> + * chamelium_require_connector_present
> + * @ports: All connected ports
> + * @type: Required port type
> + * @port_count: Total port count
> + * @count: The required number of port count
> + *
> + * Check there are required ports connected of given type
> + */
> +void
> +chamelium_require_connector_present(struct chamelium_port **ports,
> +				    unsigned int type,
> +				    int port_count,
> +				    int count)
> +{
> +	int i;
> +	int found = 0;
> +
> +	for (i = 0; i < port_count; i++) {
> +		if (chamelium_port_get_type(ports[i]) == type)
> +			found++;
> +	}
> +
> +	igt_require_f(found == count,
> +		      "port of type %s found %d and required %d\n",
> +		      kmstest_connector_type_str(type), found, count);
> +}

I can't think of a reason to require exactly 'count' ports, as opposed to >=.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
