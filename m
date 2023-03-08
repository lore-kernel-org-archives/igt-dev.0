Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF57810E6CF
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Mar 2023 18:36:16 +0000 (UTC)
Date: Wed, 8 Mar 2023 19:36:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230308183612.dpcssg4poni2fx7p@kamilkon-desk1>
References: <20230214095724.77881-1-vinod.govindapillai@intel.com>
 <20230214095724.77881-2-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230214095724.77881-2-vinod.govindapillai@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] lib/igt_debugfs: set provision
 to ignore long HPDs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vinod,

On 2023-02-14 at 11:57:23 +0200, Vinod Govindapillai wrote:
> Add provision to ignore long HPDs as some displays generate
> long HPDs even while connected. For some CI systems with
> such displays it might be usefull to ignore such spurious
> HPDs while executing testcases.
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  lib/igt_debugfs.c | 22 ++++++++++++++++++++++
>  lib/igt_debugfs.h |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index 6de178d6..8d2d3144 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -411,6 +411,28 @@ bool igt_debugfs_search(int device, const char *filename, const char *substring)
>  	return matched;
>  }
>  
> +/**
> + * igt_ignore_long_hpd:

Add also description of parameters here.

> + *
> + * Set / unset ignore long HPD events from the panels. Some panels
> + * generate long HPDs even while connected to the ports causing
> + * unexpected CI execution issues. Set this to ignore such unexpected
> + * long HPDs where we dont expect to disconnect the displays.
> + */
> +void igt_ignore_long_hpd(int drm_fd, bool enable)
-- ^
imho bool would be better.

> +{
> +	int fd = igt_debugfs_open(drm_fd, "i915_ignore_long_hpd", O_WRONLY);
> +
> +	if (fd < 0) {
> +		igt_debug("couldn't open ignore long hpd file\n");
> +		return;

Then you can
	return false;
here.

> +	}
> +
> +	igt_assert_eq(write(fd, enable ? "1" : "0", 1), 1);

Asserts in libs should be avoided, so maybe:
	ret = write(fd, enable ? "1" : "0", 1);

> +
> +	close(fd);

and then:
	return ret == 1;

Btw regarding your second patch, did you reset this to old value
before leaving subtest ?

Regards,
Kamil

> +}
> +
>  static void igt_hpd_storm_exit_handler(int sig)
>  {
>  	int fd = drm_open_driver(DRIVER_INTEL);
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index a883e2d4..fe23a5ef 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -72,6 +72,7 @@ void igt_hpd_storm_set_threshold(int fd, unsigned int threshold);
>  void igt_hpd_storm_reset(int fd);
>  bool igt_hpd_storm_detected(int fd);
>  void igt_require_hpd_storm_ctl(int fd);
> +void igt_ignore_long_hpd(int fd, bool enable);
>  
>  /*
>   * Drop caches
> -- 
> 2.34.1
> 
