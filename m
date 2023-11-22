Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9E510E317
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Nov 2023 21:01:52 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a02d91ab199so21830566b.0
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Nov 2023 13:01:52 -0800 (PST)
Message-ID: <bd0bdf97-594c-4f01-8cfe-1b51d05df079@gmail.com>
Date: Wed, 22 Nov 2023 23:01:38 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20231117070356.1727656-1-kunal1.joshi@intel.com>
 <20231117070356.1727656-2-kunal1.joshi@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231117070356.1727656-2-kunal1.joshi@intel.com>
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

The code look all ok to me, those new functions just need the comment 
block above them as they're in lib and not static functions.

/Juha-Pekka

On 17.11.2023 9.03, Kunal Joshi wrote:
> added helper function for dark screen detection
> 
> v2: Fix indentation (JP)
>      Reduce complexity and redundancy (JP)
> 
> v3: Close fd (JP)
>      Use ternary operator (JP)
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_debugfs.c | 24 ++++++++++++++++++++++++
>   lib/igt_debugfs.h |  2 ++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index a7b54bae5..a39405710 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -743,3 +743,27 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
>   	igt_log(IGT_LOG_DOMAIN, level, "%s:\n%s\n", filename, contents);
>   	free(contents);
>   }
> +
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
