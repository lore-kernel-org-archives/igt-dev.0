Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65FB10E78E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 11:57:56 +0000 (UTC)
Date: Tue, 14 Mar 2023 12:57:52 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230314125752.009f197a@maurocar-mobl2>
In-Reply-To: <20230314105452.2169208-2-bhanuprakash.modem@intel.com>
References: <20230314105452.2169208-1-bhanuprakash.modem@intel.com>
 <20230314105452.2169208-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t 1/5] lib/drmtest: Add helpers to check and
 require the XE driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 14 Mar 2023 16:24:48 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> In order to add support for features specific to the XE driver, add
> helpers for checking and requiring the driver.
> 
> This patch will also update igt_require_intel() to support XE, and
> create new helper igt_require_i915() as both i915 & XE belongs to
> intel.
> 
> Credits-to: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/drmtest.c | 20 ++++++++++++++++++++
>  lib/drmtest.h |  4 ++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 0ceab1038..ef0d4909f 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -139,6 +139,16 @@ bool is_vc4_device(int fd)
>  	return __is_device(fd, "vc4");
>  }
>  
> +bool is_xe_device(int fd)
> +{
> +	return __is_device(fd, "xe");
> +}
> +
> +bool is_intel_device(int fd)
> +{
> +	return is_i915_device(fd) || is_xe_device(fd);
> +}
> +
>  static char _forced_driver[16] = "";
>  
>  /**
> @@ -645,6 +655,11 @@ void igt_require_amdgpu(int fd)
>  }
>  
>  void igt_require_intel(int fd)
> +{
> +	igt_require(is_i915_device(fd) || is_xe_device(fd));

I would code it as:

	igt_require(is_intel_device(fd))

With that:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> +}
> +
> +void igt_require_i915(int fd)
>  {
>  	igt_require(is_i915_device(fd));
>  }
> @@ -658,3 +673,8 @@ void igt_require_vc4(int fd)
>  {
>  	igt_require(is_vc4_device(fd));
>  }
> +
> +void igt_require_xe(int fd)
> +{
> +	igt_require(is_xe_device(fd));
> +}
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 448ac03b4..392470ac0 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -99,8 +99,10 @@ int __drm_open_driver_render(int chipset);
>  
>  void igt_require_amdgpu(int fd);
>  void igt_require_intel(int fd);
> +void igt_require_i915(int fd);
>  void igt_require_nouveau(int fd);
>  void igt_require_vc4(int fd);
> +void igt_require_xe(int fd);
>  
>  bool is_amdgpu_device(int fd);
>  bool is_i915_device(int fd);
> @@ -108,6 +110,8 @@ bool is_mtk_device(int fd);
>  bool is_msm_device(int fd);
>  bool is_nouveau_device(int fd);
>  bool is_vc4_device(int fd);
> +bool is_xe_device(int fd);
> +bool is_intel_device(int fd);
>  
>  /**
>   * do_or_die:
