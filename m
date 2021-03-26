Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A146EF3F
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Mar 2021 08:56:54 +0000 (UTC)
Date: Fri, 26 Mar 2021 10:57:37 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YF2iARzHntUhCvhj@platvala-desk.ger.corp.intel.com>
References: <20210325191057.55288-1-arek@hiler.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325191057.55288-1-arek@hiler.eu>
Subject: Re: [igt-dev] [PATCH i-g-t] README: Spell "privileged" correctly
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
To: Arkadiusz Hiler <arek@hiler.eu>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 09:10:57PM +0200, Arkadiusz Hiler wrote:
> Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  README.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/README.md b/README.md
> index f33e9455..6d9e40f3 100644
> --- a/README.md
> +++ b/README.md
> @@ -110,7 +110,7 @@ podman/docker to to run it on your system.
>  
>  Oneliner to get you started with the latest master:
>  
> -    # podman run --rm --priviledged registry.freedesktop.org/drm/igt-gpu-tools/igt:master
> +    # podman run --rm --privileged registry.freedesktop.org/drm/igt-gpu-tools/igt:master
>  
>  
>  Other Things
> -- 
> 2.31.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
