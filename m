Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC10C10E23F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 20:51:36 +0000 (UTC)
Date: Wed, 15 Nov 2023 22:46:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <ZVUuIAIYjmYkQQDb@intel.com>
References: <20231115140231.1555702-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231115140231.1555702-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V2] lib/igt_kms: Don't read max dotclock on
 non-display platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 07:32:31PM +0530, Bhanuprakash Modem wrote:
> On non-display platforms, there is no point in checking for
> max dotclock.
> 
> V2: Fix resource leak
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/9672
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 89510ff22..0aa8f4a46 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6055,10 +6055,18 @@ int igt_get_max_dotclock(int fd)
>  	char buf[4096];
>  	char *s;
>  	int dir, res, max_dotclock = 0;
> +	drmModeRes *resources;
>  
>  	if (!is_intel_device(fd))
>  		return max_dotclock;
>  
> +	/* If there is no display, then no point to check for dotclock. */
> +	resources = drmModeGetResources(fd);
> +	if (!resources)
> +		return max_dotclock;
> +	else
> +		drmModeFreeResources(resources);

Not a big fan of the use of 'else' here. So I'd drop that.

But otherwise looks fine, so
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

However a simpler approach could be to just drop the old
i915_frequency_info fallback and simply return 0 on failure
to read i915_cdclk_info.

> +
>  	dir = igt_debugfs_dir(fd);
>  	igt_require(dir);
>  
> -- 
> 2.40.0

-- 
Ville Syrjälä
Intel
