Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E374A10E23C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 16:18:03 +0000 (UTC)
Date: Mon, 26 Jun 2023 18:17:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230626161750.vpzd6tyw7wxu5md7@kamilkon-desk1>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
 <20230626051031.2363120-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230626051031.2363120-5-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [V4 i-g-t 04/24] lib/igt_msm: Use drm_close_driver()
 to close the drm fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,
On 2023-06-26 at 10:40:11 +0530, Bhanuprakash Modem wrote:
> To close the drm file descriptor, use igt helper drm_close_driver()
> instead of using close().
> 
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_msm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_msm.c b/lib/igt_msm.c
> index 8c0380f42..a236898b6 100644
> --- a/lib/igt_msm.c
> +++ b/lib/igt_msm.c
> @@ -87,7 +87,7 @@ igt_msm_dev_close(struct msm_device *dev)
>  {
>  	if (!dev)
>  		return;
> -	close(dev->fd);
> +	drm_close_driver(dev->fd);
>  	free(dev);
>  }
>  
> -- 
> 2.40.0
> 
