Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AC789CCE
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 12:01:04 +0000 (UTC)
Date: Thu, 6 Aug 2020 15:01:01 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200806120101.GB28220@platvala-desk.ger.corp.intel.com>
References: <20200806114314.549732-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806114314.549732-1-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915_perf: drop dependency on libigt
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 06, 2020 at 02:43:14PM +0300, Lionel Landwerlin wrote:
> There is no need for it, we just depend on libigt_chipset.
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  lib/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 341696e5..bccebba2 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -257,7 +257,7 @@ endforeach
>  lib_igt_i915_perf_build = shared_library(
>    'i915_perf',
>    i915_perf_files,
> -  dependencies: [lib_igt, lib_igt_chipset],
> +  dependencies: lib_igt_chipset,
>    include_directories : inc,
>    install: true,
>    soversion: '0')



Well that was easy then.

Did you try gpuvis with that?


Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
