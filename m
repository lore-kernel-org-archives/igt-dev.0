Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B5C10E166
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 16:12:45 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54bb5ebbb35so882932a12.1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 08:12:45 -0800 (PST)
Message-ID: <1564f013-7cb4-408e-944f-c8430f9db4b7@gmail.com>
Date: Tue, 28 Nov 2023 18:12:36 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20231123062944.1889520-1-kunal1.joshi@intel.com>
 <20231123062944.1889520-2-kunal1.joshi@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231123062944.1889520-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_debugfs: added helper to
 enable/disable dark screen detection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 23.11.2023 8.29, Kunal Joshi wrote:
> added helper function for dark screen detection
> 
> v2: Fix indentation (JP)
>      Reduce complexity and redundancy (JP)
> 
> v3: Close fd (JP)
>      Use ternary operator (JP)
> 
> v4: Added comments for functions (JP)
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_debugfs.c | 39 +++++++++++++++++++++++++++++++++++++++
>   lib/igt_debugfs.h |  2 ++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index a7b54bae5..323030b19 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -743,3 +743,42 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
>   	igt_log(IGT_LOG_DOMAIN, level, "%s:\n%s\n", filename, contents);
>   	free(contents);
>   }
> +
> +/**
> + * igt_is_dark_screen_supported:
> + * @drm_fd: fd of the device
> + * @pipe: display pipe
> + *
> + * Returns true if dark screen detection supported on platform
> + */
> +bool igt_is_dark_screen_supported(int drm_fd, enum pipe pipe)
> +{
> +	char buf[256];
> +	int dir;
> +
> +	dir = igt_debugfs_pipe_dir(drm_fd, pipe, O_DIRECTORY);
> +	igt_require_fd(dir);
> +	igt_debugfs_simple_read(dir, "i915_darkscreen_status", buf, sizeof(buf));
> +	close(dir);
> +	return (*buf == '0' || *buf == '1');
> +}
> +
> +/**
> + * igt_set_dark_screen_detection:
> + * @drm_fd: fd of the device
> + * @pipe: display pipe
> + * @enable: bool to enable/disable dark screen detection
> + *
> + * Enable/Disable dark screen detection for given @pipe

please include here also comment for the meaning of return value. With that

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

> + */
> +ssize_t igt_set_dark_screen_detection(int drm_fd, enum pipe pipe, bool enable)
> +{
> +	int dir;
> +	int size;
> +
> +	dir = igt_debugfs_pipe_dir(drm_fd, pipe, O_DIRECTORY);
> +	igt_require_fd(dir);
> +	size = igt_sysfs_write(dir, "i915_darkscreen_status", enable ? "1" : "0", 1);
> +	close(dir);
> +	return size;
> +}
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index 3e6194ade..68f25be59 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -77,6 +77,8 @@ void igt_hpd_storm_reset(int fd);
>   bool igt_hpd_storm_detected(int fd);
>   void igt_require_hpd_storm_ctl(int fd);
>   bool igt_ignore_long_hpd(int fd, bool enable);
> +bool igt_is_dark_screen_supported(int drm_fd, enum pipe pipe);
> +ssize_t igt_set_dark_screen_detection(int drm_fd, enum pipe pipe, bool enable);
>   
>   /*
>    * Drop caches
