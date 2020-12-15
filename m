Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB3589A0F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Dec 2020 17:55:30 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201215174656.3956-1-jcline@redhat.com>
References: <20201215174656.3956-1-jcline@redhat.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 15 Dec 2020 17:55:26 +0000
Message-ID: <160805492611.14591.2434241016144904414@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/device_reset: check for i915 in
 unbind_reset_rebind()
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
To: Jeremy Cline <jcline@redhat.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Jeremy Cline (2020-12-15 17:46:56)
> Commit 265f1d4a5a14 ("tests/device_reset: Work around for driver unbind
> issue with audio") introduced an assertion on is_i915_device() by way of
> intel_get_drm_devid(). Since this is a work-around for an i915-specific
> issue, guard it with a check on the device type so the test runs on
> other devices.
> 
> Signed-off-by: Jeremy Cline <jcline@redhat.com>
> ---
>  tests/device_reset.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 9cb59ee4..9347a3f4 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -232,7 +232,7 @@ static void set_device_filter(const char* dev_path)
>  
>  static void unbind_reset_rebind(struct device_fds *dev)
>  {
> -       uint32_t devid = intel_get_drm_devid(dev->fds.dev);
> +       uint32_t devid;

There should have been a newline here between variable declarations and
code, but we can move devid down into the if {}

>         igt_debug("close the device\n");
>         close_if_opened(&dev->fds.dev);
>  
> @@ -242,9 +242,12 @@ static void unbind_reset_rebind(struct device_fds *dev)
>          * The below CI friendly user level workaround prevents the warning from
>          * appearing. Drop this hack as soon as this is fixed in the kernel.
>          */
> -       if (igt_warn_on_f((bool) IS_HASWELL(devid) || IS_BROADWELL(devid),
> -           "Manually enabling audio PM to work around a kernel WARN\n"))
> -               igt_pm_enable_audio_runtime_pm();
> +       if (is_i915_device(dev->fds.dev)) {
> +               devid = intel_get_drm_devid(dev->fds.dev);
> +               if (igt_warn_on_f((bool) IS_HASWELL(devid) || IS_BROADWELL(devid),

The cast of IS_HASWELL() to bool when it is being used in a logical
context that already implicitly cases to bool? Fascinating.

Might as well remove the redundant (bool) while you are here.

> +                   "Manually enabling audio PM to work around a kernel WARN\n"))
> +                       igt_pm_enable_audio_runtime_pm();
> +       }
>  
>         driver_unbind(dev);
>  
> -- 
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
