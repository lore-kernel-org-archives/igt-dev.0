Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5F910E1C6
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 08:29:32 +0000 (UTC)
Date: Thu, 17 Aug 2023 10:29:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230817082928.4mme6mlyioiweegc@kamilkon-desk1>
References: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
 <20230816163206.402705-4-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230816163206.402705-4-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V4 03/20] tests/kms_getfb: Extended ccs tests
 to support XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,

On 2023-08-16 at 22:01:49 +0530, Bhanuprakash Modem wrote:
> Add support for ccs tests work on XE driver.
> 
> V2: - Update XE blocklist
> 
> Fixes: 5fd20e72a (tests/kms_getfb: Add XE support)
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt |  1 -
>  tests/kms_getfb.c               | 10 +++++++---
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 1778e91f1..805939507 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -78,7 +78,6 @@ igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-(atomic|legacy)
>  igt@kms_rotation_crc@primary-(4|x|y|yf)-tiled-.*
>  igt@kms_rotation_crc@exhaust-fences
>  igt@kms_force_connector_basic@force-load-detect
> -igt@kms_getfb@.*-ccs

Could you separate intel-ci changes into one separate (last)
patch? Here and at other kms patches?

Regards,
Kamil

>  igt@kms_plane_lowres@tiling-(4|x|y|yf)
>  igt@kms_.*@.*hang.*
>  ##################################################################
> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
> index f90e51d64..6ee58caab 100644
> --- a/tests/kms_getfb.c
> +++ b/tests/kms_getfb.c
> @@ -48,6 +48,7 @@
>  #include "i915/gem_create.h"
>  #include "igt_device.h"
>  #include "xe/xe_query.h"
> +#include "xe/xe_ioctl.h"
>  
>  IGT_TEST_DESCRIPTION("Tests GETFB and GETFB2 ioctls.");
>  
> @@ -145,7 +146,10 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
>  		size += add.pitches[1] * ALIGN(ALIGN(add.height, 16) / 16, 32);
>  	}
>  
> -	add.handles[0] = gem_buffer_create_fb_obj(fd, size);
> +	if (is_i915_device(fd))
> +		add.handles[0] = gem_buffer_create_fb_obj(fd, size);
> +	else
> +		add.handles[0] = xe_bo_create_flags(fd, 0, size, vram_if_possible(fd, 0));
>  	igt_require(add.handles[0] != 0);
>  
>  	if (!HAS_FLATCCS(devid))
> @@ -315,7 +319,7 @@ static void test_duplicate_handles(int fd)
>  		struct drm_mode_fb_cmd2 add_ccs = { };
>  		struct drm_mode_fb_cmd get = { };
>  
> -		igt_require_i915(fd);
> +		igt_require_intel(fd);
>  		igt_require_f(!HAS_FLATCCS(intel_get_drm_devid(fd)),
>  			      "skip because flat ccs has only one buffer.\n");
>  
> @@ -421,7 +425,7 @@ static void test_getfb2(int fd)
>  		struct drm_mode_fb_cmd2 get = { };
>  		int i;
>  
> -		igt_require_i915(fd);
> +		igt_require_intel(fd);
>  		get_ccs_fb(fd, &add_ccs);
>  		igt_require(add_ccs.fb_id != 0);
>  		get.fb_id = add_ccs.fb_id;
> -- 
> 2.40.0
> 

