Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D07210E206
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 09:27:12 +0000 (UTC)
Message-ID: <cc8942ff-7e69-9d8d-23a3-e0c220947f10@intel.com>
Date: Tue, 11 Oct 2022 11:27:07 +0200
MIME-Version: 1.0
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221010084448.140541-1-vinod.govindapillai@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20221010084448.140541-1-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_debugfs: set provision to
 ignore long HPDs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jani.nikula@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 10.10.2022 10:44, Vinod Govindapillai wrote:
> Add provision to ignore long HPDs as some displays generate
> long HPDs even while connected. Setting to ignore the long
> HPDs to avoid unexpected CI execution issues
>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   lib/igt_debugfs.c | 22 ++++++++++++++++++++++
>   lib/igt_debugfs.h |  1 +
>   lib/igt_kms.c     |  3 +++
>   3 files changed, 26 insertions(+)
>
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index a56688a5..92ce52dd 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -713,6 +713,28 @@ void igt_require_hpd_storm_ctl(int drm_fd)
>   	close(fd);
>   }
>   
> +/**
> + * igt_ignore_long_hpd:
> + *
> + * Set / unset ignore long HPD events from the panels. Some panels
> + * generate long HPDs even while connected to the ports causing
> + * unexpected CI execution issues. Set this to ignore such unexpected
> + * long HPDs where we dont expect to disconnect the displays.
> + */
> +void igt_ignore_long_hpd(int drm_fd, bool enable)
> +{
> +	int fd = igt_debugfs_open(drm_fd, "i915_ignore_long_hpd", O_WRONLY);
> +
> +	if (fd < 0) {
> +		igt_debug("couldn't open ignore long hpd file\n");
> +		return;
> +	}
> +
> +	igt_assert_eq(write(fd, enable ? "1" : "0", 1), 1);
> +
> +	close(fd);
> +}
> +
>   static igt_pipe_crc_t *
>   pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>   {
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index 37e85067..50f5e00f 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -129,6 +129,7 @@ void igt_hpd_storm_set_threshold(int fd, unsigned int threshold);
>   void igt_hpd_storm_reset(int fd);
>   bool igt_hpd_storm_detected(int fd);
>   void igt_require_hpd_storm_ctl(int fd);
> +void igt_ignore_long_hpd(int fd, bool enable);
>   
>   /*
>    * Drop caches
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 665594aa..2db4e5fa 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2356,6 +2356,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   	display->drm_fd = drm_fd;
>   	is_i915_dev = is_i915_device(drm_fd);
>   
> +	/* Ignore the long HPDs */
> +	igt_ignore_long_hpd(display->drm_fd, true);
> +

Long HPD, even if it comes from bad hw, is useful for testing 
unplug/replug of the monitor in unexpected moments.
With this setting we loose the opportunity, but at least we can focus on 
the real purpose of the tests.
Maybe it would be useful to run sometimes tests without ignore_long_hpd?

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>   
>   	resources = drmModeGetResources(display->drm_fd);
