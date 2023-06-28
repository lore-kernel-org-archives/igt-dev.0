Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A7E10E0B8
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 18:51:00 +0000 (UTC)
Date: Wed, 28 Jun 2023 20:50:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: IGT GPU Tools <igt-dev@lists.freedesktop.org>
Message-ID: <20230628185055.rtg4fercx5b2ykpw@kamilkon-desk1>
References: <20230623230954.115437-1-jshargo@chromium.org>
 <20230623230954.115437-2-jshargo@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230623230954.115437-2-jshargo@chromium.org>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/drmtest: Add VKMS as a known
 driver type
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

Hi James,

On 2023-06-23 at 19:09:52 -0400, James Shargo wrote:
> From: Jim Shargo <jshargo@chromium.org>

Please write here description what do you added to lib.
Use checkpatch.pl perl script from Linux kernel to spot
some problems with patches.

> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
>  lib/drmtest.c | 26 ++++++++++++++++++++++++++
>  lib/drmtest.h |  7 ++++++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 220cfb64d..ad8cbe302 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -150,6 +150,16 @@ bool is_intel_device(int fd)
>  	return is_i915_device(fd) || is_xe_device(fd);
>  }
>  

Document each new public function.

> +bool is_vkms_device(int fd)

Why not make it as other functions? Use __is_device()

> +{
> +	char name[64] = "";
> +
> +	if (__get_drm_device_name(fd, name, sizeof(name) - 1))
> +		return false;
> +
> +	return strncmp("vkms", name, strlen("vkms")) == 0;
> +}
> +
>  static char _forced_driver[16] = "";
>  
>  /**
> @@ -734,3 +744,19 @@ void igt_require_xe(int fd)
>  {
>  	igt_require(is_xe_device(fd));
>  }
> +

Same here, write documentation.

> +void igt_require_vkms(void)
> +{
> +	// Since VKMS can create and destroy virtual drivers at will,
> +	// instead look to make sure the driver is installed.
---------- ^ ----- ^ -- ^^
s/instead look to //
imho here you should use C-style comment.

> +	struct stat s = {};
> +	int ret;
> +	char *vkms_module_dir = "/sys/module/vkms";
------- ^
const
btw maybe this should be first param.

> +
> +	ret = stat(vkms_module_dir, &s);
> +
> +	igt_require_f(ret == 0, "VKMS stat of %s returned %d (%s)\n",
> +		      vkms_module_dir, ret, strerror(ret));
> +	igt_require_f(S_ISDIR(s.st_mode),
> +		      "VKMS stat of %s was not a directory\n", vkms_module_dir);
> +}

You should also add this into modules[] struct in libdrm.c

> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index ae86ee19a..1d418e1f6 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -53,14 +53,17 @@
>  #define DRIVER_MSM	(1 << 6)
>  #define DRIVER_XE	(1 << 7)
>  #define DRIVER_VMWGFX   (1 << 8)
> +#define DRIVER_VKMS	(1 << 9)
>  
>  /*
>   * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
>   * with vgem as well as a supported driver, you can end up with a
>   * near-100% skip rate if you don't explicitly specify the device,
>   * depending on device-load ordering.
> + *
> + * Exclude VKMS to prefer hardware drivers.
>   */
> -#define DRIVER_ANY 	~(DRIVER_VGEM)
> +#define DRIVER_ANY ~(DRIVER_VGEM | DRIVER_VKMS)
>  
>  /*
>   * Compile friendly enum for i915/xe.
> @@ -114,6 +117,7 @@ void igt_require_i915(int fd);
>  void igt_require_nouveau(int fd);
>  void igt_require_vc4(int fd);
>  void igt_require_xe(int fd);
> +void igt_require_vkms(void);

Keep it sorted aplhabetically.

>  
>  bool is_amdgpu_device(int fd);
>  bool is_i915_device(int fd);
> @@ -123,6 +127,7 @@ bool is_nouveau_device(int fd);
>  bool is_vc4_device(int fd);
>  bool is_xe_device(int fd);
>  bool is_intel_device(int fd);
> +bool is_vkms_device(int fd);

Move it after is_vc4_device.

Regards,
Kamil

>  
>  /**
>   * do_or_die:
> -- 
> 2.41.0.162.gfafddb0af9-goog
> 
