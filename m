Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E67810E110
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 16:27:15 +0000 (UTC)
Date: Wed, 25 Oct 2023 18:26:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231025162604.t3ele2q37b6vannp@kamilkon-desk.igk.intel.com>
References: <20231025082006.3929717-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231025082006.3929717-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/kms: Use drm_close_driver() to close
 the drm fd
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

Hi Bhanuprakash,
On 2023-10-25 at 13:50:06 +0530, Bhanuprakash Modem wrote:
> Add missing changes to the commit: fcaa2c5efa
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/kms_fb_coherency.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
> index d0c0df9ee..1b532fd99 100644
> --- a/tests/intel/kms_fb_coherency.c
> +++ b/tests/intel/kms_fb_coherency.c
> @@ -288,6 +288,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> -- 
> 2.40.0
> 
