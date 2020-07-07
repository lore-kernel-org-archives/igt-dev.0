Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E466F6E14E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2020 15:17:41 +0000 (UTC)
Date: Tue, 7 Jul 2020 13:49:49 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20200707081949.GA15847@intel.com>
References: <20200707131814.17540-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707131814.17540-1-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_chamelium: Sanitize the
 init error and deinit path
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
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org, lyude@redhat.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2020-07-07 at 16:18:12 +0300, Imre Deak wrote:
> Always return NULL from init in case of an error, and reuse
> chamelium_deinit_rpc_only() for symmetry with init, instead of
> open-coding the same.
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
For the whole series
> ---
>  lib/igt_chamelium.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 58e01ab72..5924e5615 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2512,7 +2512,8 @@ struct chamelium *chamelium_init(int drm_fd)
>  	return chamelium;
>  error:
>  	chamelium_deinit_rpc_only(chamelium);
> -	return chamelium;
> +
> +	return NULL;
>  }
>  
>  /**
> @@ -2550,12 +2551,11 @@ void chamelium_deinit(struct chamelium *chamelium)
>  	}
>  
>  	xmlrpc_client_destroy(chamelium->client);
> -	xmlrpc_env_clean(&chamelium->env);
>  
>  	for (i = 0; i < chamelium->port_count; i++)
>  		free(chamelium->ports[i].name);
>  
> -	free(chamelium);
> +	chamelium_deinit_rpc_only(chamelium);
>  }
>  
>  bool chamelium_plug_all(struct chamelium *chamelium)
> -- 
> 2.23.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
