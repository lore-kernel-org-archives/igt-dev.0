Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110F0A353D
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jul 2022 08:07:32 +0000 (UTC)
Date: Thu, 14 Jul 2022 10:07:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Ys/Ovq0hK1bu/FiH@kamilkon-desk1>
References: <20220713181637.10707-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220713181637.10707-1-nirmoy.das@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Make sure i915 loaded
 properly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nirmoy,

On 2022-07-13 at 20:16:37 +0200, Nirmoy Das wrote:
> Previous test may leave incomplete i915 state.
> make this more resilient my unload and reloading i915.
-------------------------- ^
s/my/by/

> 
> Reference: https://gitlab.freedesktop.org/drm/intel/-/issues/5608
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/i915/perf.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index e641d5d2d..9c36aac34 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -41,8 +41,8 @@
>  #include "i915/gem.h"
>  #include "i915/perf.h"
>  #include "igt.h"
> +#include "igt_kmod.h"
>  #include "igt_sysfs.h"
> -#include "drm.h"
>  
>  IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
>  
> @@ -4916,7 +4916,8 @@ igt_main
>  		 * loading/unloading i915. Load i915 here before we stat the
>  		 * files.
>  		 */
> -		drm_load_module(DRIVER_INTEL);
> +		igt_i915_driver_unload();
> +		igt_assert_eq(igt_i915_driver_load(NULL), 0);
>  
>  		igt_require(stat("/proc/sys/dev/i915/perf_stream_paranoid", &sb)
>  			    == 0);
> -- 
> 2.35.1
>

See below.
 
> Intel Deutschland GmbH
> Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
> Tel: +49 89 99 8853-0, www.intel.de <http://www.intel.de>
> Managing Directors: Christin Eisenschmid, Sharon Heck, Tiffany Doon Silva  
> Chairperson of the Supervisory Board: Nicole Lau
> Registered Office: Munich
> Commercial Register: Amtsgericht Muenchen HRB 186928
> 

Please do not send this in patches,

Regards,
Kamil
