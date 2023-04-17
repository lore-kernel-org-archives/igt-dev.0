Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB5910E415
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Apr 2023 10:59:17 +0000 (UTC)
Date: Mon, 17 Apr 2023 12:59:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230417105914.ngubzfffdeopfx42@zkempczy-mobl2>
References: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
 <20230413162732.1155058-4-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230413162732.1155058-4-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 3/7] lib: Use i915 namespace for XE debugfs
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

On Thu, Apr 13, 2023 at 09:57:28PM +0530, Bhanuprakash Modem wrote:
> As of now XE is going to use i915 namesapce for their debugfs.
                                    ^-- nit

With that:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
> Example: i915_current_bpc is applicable for both i915 & XE
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 2 +-
>  lib/igt_psr.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 50655f136b8..720e68ca7c9 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5706,7 +5706,7 @@ unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe)
>  	fd = igt_debugfs_pipe_dir(drmfd, pipe, O_RDONLY);
>  	igt_assert(fd >= 0);
>  
> -	if (is_i915_device(drmfd))
> +	if (is_intel_device(drmfd))
>  		strcpy(debugfs_name, "i915_current_bpc");
>  	else if (is_amdgpu_device(drmfd))
>  		strcpy(debugfs_name, "amdgpu_current_bpc");
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index a2d88031268..13f7c567dc9 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -277,7 +277,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd)
>  	int debugfs_fd;
>  	bool ret;
>  
> -	if (!is_i915_device(drm_fd))
> +	if (!is_intel_device(drm_fd))
>  		return false;
>  
>  	debugfs_fd = igt_debugfs_dir(drm_fd);
> @@ -303,7 +303,7 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
>  	int debugfs_fd;
>  	bool ret = false;
>  
> -	if (!is_i915_device(drm_fd))
> +	if (!is_intel_device(drm_fd))
>  		return ret;
>  
>  	debugfs_fd = igt_debugfs_dir(drm_fd);
> -- 
> 2.40.0
> 
