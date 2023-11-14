Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919E710E498
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 17:37:35 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53e751aeb3cso9157119a12.2
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 09:37:35 -0800 (PST)
Message-ID: <1ca0b43f-27b8-4654-9855-bae69722fbd6@gmail.com>
Date: Tue, 14 Nov 2023 19:37:23 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20231102062304.1204625-1-kunal1.joshi@intel.com>
 <20231102062304.1204625-2-kunal1.joshi@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231102062304.1204625-2-kunal1.joshi@intel.com>
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

On 2.11.2023 8.23, Kunal Joshi wrote:
> added helper function for dark screen detection
> 
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_debugfs.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   lib/igt_debugfs.h |  3 +++
>   2 files changed, 44 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index a7b54bae5..e2a4b17ea 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -743,3 +743,44 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
>   	igt_log(IGT_LOG_DOMAIN, level, "%s:\n%s\n", filename, contents);
>   	free(contents);
>   }
> +
> +bool igt_is_dark_screen_supported(int drm_fd, enum pipe pipe)
> +{
> +        char buf[256];
> +        int dir;
> +
> +        dir = igt_debugfs_pipe_dir(drm_fd, pipe, O_DIRECTORY);
> +        igt_require_fd(dir);
> +        igt_debugfs_simple_read(dir, "i915_darkscreen_status", buf, sizeof(buf));
> +        close(dir);
> +        if (*buf == '\0')
> +                return false;
> +
> +        return strcasestr(buf, "0") || strcasestr(buf, "1");
> +}
> +
> +ssize_t igt_enable_dark_screen_detection(int drm_fd, enum pipe pipe)
> +{
> +        char buf[2];
> +        int dir;
> +	int enable_dark_screen_detection;
> +
> +	enable_dark_screen_detection = 1;
> +        snprintf(buf, sizeof(buf), "%d", enable_dark_screen_detection);

This feels bit excessive handling just to get char buf that says "1"

> +        dir = igt_debugfs_pipe_dir(drm_fd, pipe, O_DIRECTORY);
> +        igt_require_fd(dir);
> +        return igt_sysfs_write(dir, "i915_darkscreen_status", buf, sizeof(buf) - 1);
> +}
> +
> +ssize_t igt_disable_dark_screen_detection(int drm_fd, enum pipe pipe)
> +{
> +        char buf[2];
> +        int dir;
> +	int disable_dark_screen_detection;
> +
> +	disable_dark_screen_detection = 0;
> +        snprintf(buf, sizeof(buf), "%d", disable_dark_screen_detection);

Here same as above. Also this patch has some indentations done with 
spaces instead of tab. Patch generally seems ok, just these small detail.

/Juha-Pekka

> +        dir = igt_debugfs_pipe_dir(drm_fd, pipe, O_DIRECTORY);
> +        igt_require_fd(dir);
> +        return igt_sysfs_write(dir, "i915_darkscreen_status", buf, sizeof(buf) - 1);
> +}
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index 3e6194ade..bd539f54d 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -77,6 +77,9 @@ void igt_hpd_storm_reset(int fd);
>   bool igt_hpd_storm_detected(int fd);
>   void igt_require_hpd_storm_ctl(int fd);
>   bool igt_ignore_long_hpd(int fd, bool enable);
> +bool igt_is_dark_screen_supported(int drm_fd, enum pipe pipe);
> +ssize_t igt_enable_dark_screen_detection(int drm_fd, enum pipe pipe);
> +ssize_t igt_disable_dark_screen_detection(int drm_fd, enum pipe pipe);
>   
>   /*
>    * Drop caches
