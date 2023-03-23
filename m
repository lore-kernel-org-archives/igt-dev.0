Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9613210EAEB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 19:06:09 +0000 (UTC)
Date: Thu, 23 Mar 2023 20:06:05 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230323190605.bhrggql7u6kmdszs@zkempczy-mobl2>
References: <20230320100017.2913328-1-bhanuprakash.modem@intel.com>
 <20230320100017.2913328-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320100017.2913328-5-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 4/5] tests/kms_force_connector_basic: Add XE
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, jani.nikula@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 03:30:16PM +0530, Bhanuprakash Modem wrote:
> Add XE driver support for kms tests.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_force_connector_basic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
> index 4ff1efe3b..6a13fe4ed 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -53,7 +53,9 @@ static void reset_connectors(void)
>  		drmModeFreeConnector(connector);
>  	}
>  
> -	igt_set_module_param_int(drm_fd, "load_detect_test", 0);
> +	/* FIXME: load_detect_test is not found in XE. */
> +	if (is_i915_device(drm_fd))
> +		igt_set_module_param_int(drm_fd, "load_detect_test", 0);

What's the plan of addressing 'load_detect_test' param? If there will be
none I think "FIXME" should be get rid of here.

--
Zbigniew

>  
>  	close(drm_fd);
>  }
> -- 
> 2.40.0
> 
