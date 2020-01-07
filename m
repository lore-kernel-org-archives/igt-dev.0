Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538B86E02F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2020 11:36:44 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200107082548.3693-1-ramalingam.c@intel.com>
References: <20200107082548.3693-1-ramalingam.c@intel.com>
Message-ID: <157839698964.2273.2720814071802440483@skylake-alporthouse-com>
Date: Tue, 07 Jan 2020 11:36:29 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/intel_memory_region: wrappers
 for memory regions ops
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
To: Ramalingam C <ramalingam.c@intel.com>, igt-dev <igt-dev@lists.freedesktop.org>
Cc: Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ramalingam C (2020-01-07 08:25:48)
> +static void __debugfs_read(int fd, const char *param, char *buf, int len)
> +{
> +       len = igt_debugfs_simple_read(fd, param, buf, len);
> +       if (len < 0)
> +               igt_assert_eq(len, -ENODEV);
> +}
> +
> +#define debugfs_read(fd, p, arr) __debugfs_read(fd, p, arr, sizeof(arr))
> +
> +#define MAX_i915_GEM_OBJ_BUF_LEN       5000
> +
> +static int get_i915_gem_objects_str(int drm_fd, char *buf)
> +{
> +       int fd;
> +
> +       fd = igt_debugfs_dir(drm_fd);
> +       if (fd < 0)
> +               return -ENODEV;
> +
> +       debugfs_read(fd, "i915_gem_objects", buf);

How you will laugh about this one later!
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
