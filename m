Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878606E199
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 09:29:45 +0000 (UTC)
Date: Tue, 18 Feb 2020 11:29:43 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200218092943.GO25209@platvala-desk.ger.corp.intel.com>
References: <20200218082904.12327-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218082904.12327-1-tomeu.vizoso@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: Avoid hitting assertion on
 non-intel HW
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
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 09:29:04AM +0100, Tomeu Vizoso wrote:
> Recently a call to intel_get_drm_devid was added in a code path that
> gets run on all hardware.
> 
> Restore the previous behavior by bailing out before we reach the assert.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Fixes: 8b90eefce9b4 ("lib/igt_fb: Use render copy/blit on platforms w/o HW detiling")

The path is from use_blitter() to blitter_ok() to fast_blit_ok() where
the intel_get_drm_devid call is, right? And the change that broke this
was using blitter_ok() unconditionally instead of almost-accidentally
avoiding the blitter_ok call by checking for I915_FORMAT_MOD_*
modifiers...


Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/igt_fb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 49a032f65c06..0c4fdc5d4889 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1992,6 +1992,9 @@ static bool fast_blit_ok(const struct igt_fb *fb)
>  
>  static bool blitter_ok(const struct igt_fb *fb)
>  {
> +	if (!is_i915_device(fb->fd))
> +		return false;
> +
>  	if (is_ccs_modifier(fb->modifier))
>  		return false;
>  
> -- 
> 2.21.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
