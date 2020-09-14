Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E008389C9C
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2020 12:26:23 +0000 (UTC)
Message-ID: <416a0681084395c13db7ed617bf524aa3850fb87.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 14 Sep 2020 14:26:18 +0200
In-Reply-To: <20200914124818.11497-1-uma.shankar@intel.com>
References: <20200914124818.11497-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/device_reset: Work around for
 driver unbind issue with audio
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
To: Uma Shankar <uma.shankar@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi Uma,

On Mon, 2020-09-14 at 18:18 +0530, Uma Shankar wrote:
> Unbinding the i915 driver on some Haswell and Broadwell platforms with
> Azalia audio results in a kernel WARNING on "i915 raw-wakerefs=1
> wakelocks=1 on cleanup".  The issue can be worked around by manually
> enabling runtime power management for the conflicting audio adapter.
> Use that method but also display a warning to preserve visibility of
> the issue. Also tag the workaround with a FIXME comment.
> 
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---

Even if the code looks the same as in my patch against core_hotunplug,
this is a separate submission so I think you can drop drop my S-o-b, or
replace it with a Suggested-by:, then add my

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Thanks,
Janusz



>  tests/device_reset.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index b1181b3b..9cb59ee4 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -232,9 +232,20 @@ static void set_device_filter(const char* dev_path)
>  
>  static void unbind_reset_rebind(struct device_fds *dev)
>  {
> +	uint32_t devid = intel_get_drm_devid(dev->fds.dev);
>  	igt_debug("close the device\n");
>  	close_if_opened(&dev->fds.dev);
>  
> +	/**
> +	 * FIXME: Unbinding the i915 driver on some platforms with Azalia audio
> +	 * results in a kernel WARN on "i915 raw-wakerefs=1 wakelocks=1 on cleanup".
> +	 * The below CI friendly user level workaround prevents the warning from
> +	 * appearing. Drop this hack as soon as this is fixed in the kernel.
> +	 */
> +	if (igt_warn_on_f((bool) IS_HASWELL(devid) || IS_BROADWELL(devid),
> +	    "Manually enabling audio PM to work around a kernel WARN\n"))
> +		igt_pm_enable_audio_runtime_pm();
> +
>  	driver_unbind(dev);
>  
>  	initiate_device_reset(dev);

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
