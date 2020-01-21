Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022576ECFB
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 13:42:37 +0000 (UTC)
Date: Tue, 21 Jan 2020 15:42:34 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200121134234.GD25209@platvala-desk.ger.corp.intel.com>
References: <1579586055-27583-1-git-send-email-kunal1.joshi@intel.com>
 <1579586055-27583-3-git-send-email-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579586055-27583-3-git-send-email-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/3] lib/igt_color Moved kms_color
 functions to lib/igt_color to git avoid code duplication
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
Cc: igt-dev@lists.freedesktop.org, daniel.vetter@intel.com, ville.syrjala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 11:24:14AM +0530, Kunal Joshi wrote:
> kms_color and kms_color_chamelium shared common functions.
> Moved them to lib/igt_color to avoid code duplication.
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Suggested-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  lib/Makefile.sources |   2 +
>  lib/igt_color.c      | 386 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_color.h      | 105 ++++++++++++++
>  3 files changed, 493 insertions(+)
>  create mode 100644 lib/igt_color.c
>  create mode 100644 lib/igt_color.h

Meson changes are missing.

The removal of those functions from tests/kms_color.c should be in this commit too.


> diff --git a/lib/igt_color.c b/lib/igt_color.c
> +
> +#include "igt_color.h"
> +
> +void paint_gradient_rectangles(data_t *data,
> +			       drmModeModeInfo *mode,
> +			       color_t *colors,
> +			       struct igt_fb *fb)


You can't just blindly copy the functions over. data_t is a name tests
use for their test-specific structures, library code shouldn't have
such a name. This function for example just uses drm_fd from data, so
the function should take int fd instead.


> +struct drm_color_lut *coeffs_to_lut(data_t *data,
> +				    const gamma_lut_t *gamma,
> +				    uint32_t color_depth,
> +				    int off)
> +{
> +	struct drm_color_lut *lut;
> +	int i, lut_size = gamma->size;
> +	uint32_t max_value = (1 << 16) - 1;
> +	uint32_t mask;
> +
> +	if (is_i915_device(data->drm_fd))
> +		mask = ((1 << color_depth) - 1) << 8;
> +	else
> +		mask = max_value;
> +
> +	lut = malloc(sizeof(struct drm_color_lut) * lut_size);
> +
> +	if (IS_CHERRYVIEW(data->devid))

Another example why you can't just copy over functions from a test:
Nothing in this patch fills in the devid field.

Some documentation for new lib functions would also be very nice.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
