Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7620710ED4C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 08:49:42 +0000 (UTC)
Message-ID: <b0f0c679-214a-e3b8-d700-d2befc4588c0@linux.intel.com>
Date: Thu, 30 Mar 2023 09:49:36 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230330003656.1294873-1-umesh.nerlige.ramappa@intel.com>
 <20230330003656.1294873-2-umesh.nerlige.ramappa@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230330003656.1294873-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/7] lib/debugfs: GT directory helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Andi Shyti <andi.shyti@intel.com>, badal.nilawar@intel.com,
 arjun.melkaveri@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 30/03/2023 01:36, Umesh Nerlige Ramappa wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Add two debugfs helpers to be used for opening per-gt debugfs directories.
> 
> Note: This likely needs updating once the final debugfs layout is set.

Andi - final debugfs layout is set now, right? If so probably remove 
this note from the commit message.

Regards,

Tvrtko

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   lib/igt_debugfs.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_debugfs.h |  4 ++++
>   2 files changed, 64 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index 05889bbe..afde2da6 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -217,6 +217,37 @@ int igt_debugfs_dir(int device)
>   	return open(path, O_RDONLY);
>   }
>   
> +/**
> + * igt_debugfs_gt_dir:
> + * @device: fd of the device
> + * @gt: GT instance number
> + *
> + * This opens the debugfs directory corresponding to device for use
> + * with igt_sysfs_get() and related functions.
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_debugfs_gt_dir(int device, unsigned int gt)
> +{
> +	int debugfs_gt_dir_fd;
> +	char path[PATH_MAX];
> +	char gtpath[16];
> +	int ret;
> +
> +	if (!igt_debugfs_path(device, path, sizeof(path)))
> +		return -1;
> +
> +	ret = snprintf(gtpath, sizeof(gtpath), "/gt%u", gt);
> +	igt_assert(ret < sizeof(gtpath));
> +	strncat(path, gtpath, sizeof(path) - 1);
> +
> +	debugfs_gt_dir_fd = open(path, O_RDONLY);
> +	igt_debug_on_f(debugfs_gt_dir_fd < 0, "path: %s\n", path);
> +
> +	return debugfs_gt_dir_fd;
> +}
> +
>   /**
>    * igt_debugfs_connector_dir:
>    * @device: fd of the device
> @@ -313,6 +344,35 @@ bool igt_debugfs_exists(int device, const char *filename, int mode)
>   	return false;
>   }
>   
> +/**
> + * igt_debugfs_gt_open:
> + * @device: open i915 drm fd
> + * @gt: gt instance number
> + * @filename: name of the debugfs node to open
> + * @mode: mode bits as used by open()
> + *
> + * This opens a debugfs file as a Unix file descriptor. The filename should be
> + * relative to the drm device's root, i.e. without "drm/$minor".
> + *
> + * Returns:
> + * The Unix file descriptor for the debugfs file or -1 if that didn't work out.
> + */
> +int
> +igt_debugfs_gt_open(int device, unsigned int gt, const char *filename, int mode)
> +{
> +	int dir, ret;
> +
> +	dir = igt_debugfs_gt_dir(device, gt);
> +	if (dir < 0)
> +		return dir;
> +
> +	ret = openat(dir, filename, mode);
> +
> +	close(dir);
> +
> +	return ret;
> +}
> +
>   /**
>    * igt_debugfs_simple_read:
>    * @dir: fd of the debugfs directory
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index 4824344a..3e6194ad 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -45,6 +45,10 @@ void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size
>   int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
>   bool igt_debugfs_search(int fd, const char *filename, const char *substring);
>   
> +int igt_debugfs_gt_dir(int device, unsigned int gt);
> +int igt_debugfs_gt_open(int device, unsigned int gt, const char *filename,
> +			int mode);
> +
>   /**
>    * igt_debugfs_read:
>    * @filename: name of the debugfs file
