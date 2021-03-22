Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD814898A4
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 06:29:12 +0000 (UTC)
References: <1616390813-26157-1-git-send-email-kunal1.joshi@intel.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <f3a01f1b-3805-2ee8-866c-daa9086c893b@mupuf.org>
Date: Mon, 22 Mar 2021 08:29:02 +0200
MIME-Version: 1.0
In-Reply-To: <1616390813-26157-1-git-send-email-kunal1.joshi@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: only check chamelium's
 presence in chamelium tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 22/03/2021 07:26, Kunal Joshi wrote:
> Avoid checking if chamelium is present or not in non chamelium
> tests as its just an overhead.

The point of doing this was to stop having screens in CI and instead 
mostly have chameliums. This means that we need to make sure the 
chamelium exposes all the ports before starting a KMS test, since some 
tests may have left the screens disconnected.

Is that making sense?

> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_kms.c | 31 ++++++++++++++++++-------------
>   1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 08d429a8..397635d8 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1958,21 +1958,26 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   
>   #ifdef HAVE_CHAMELIUM
>   	{
> -		struct chamelium *chamelium;
> -
> -		chamelium = chamelium_init_rpc_only();
> -		if (chamelium) {
> -			igt_abort_on_f(!chamelium_wait_reachable(chamelium, 20),
> -				       "cannot reach the configured chamelium!\n");
> -			igt_abort_on_f(!chamelium_plug_all(chamelium),
> -				       "failed to plug all the chamelium ports!\n");
> -			igt_abort_on_f(!chamelium_wait_all_configured_ports_connected(chamelium, drm_fd),
> -				       "not all configured chamelium ports are connected!\n");
> -			chamelium_deinit_rpc_only(chamelium);
> -		}
> -	}
> +		if (strstr(igt_test_name(), "feature_discovery") != NULL ||
> +		    strstr(igt_test_name(), "cham") != NULL) {
> +
> +			struct chamelium *chamelium;
> +
> +			chamelium = chamelium_init_rpc_only();
> +			if (chamelium) {
> +				igt_abort_on_f(!chamelium_wait_reachable(chamelium, 20),
> +					       "cannot reach the configured chamelium!\n");
> +				igt_abort_on_f(!chamelium_plug_all(chamelium),
> +					       "failed to plug all the chamelium ports!\n");
> +				igt_abort_on_f(!chamelium_wait_all_configured_ports_connected(chamelium, drm_fd),
> +					       "not all configured chamelium ports are connected!\n");
> +				chamelium_deinit_rpc_only(chamelium);
> +			}
> +		}
> +	}
>   #endif
>   
> +
>   	/*
>   	 * With non-contiguous pipes display, crtc mapping is not always same
>   	 * as pipe mapping, In i915 pipe is enum id of i915's crtc object.
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
