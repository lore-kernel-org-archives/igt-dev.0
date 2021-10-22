Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C2C6E939
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Oct 2021 09:49:16 +0000 (UTC)
Date: Fri, 22 Oct 2021 12:47:48 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YXKIxAVZYwX0NZjs@platvala-desk.ger.corp.intel.com>
References: <20211021180641.8950-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021180641.8950-1-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/i915/kms_big_fb: Skip tests if there is
 no connector connected
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 11:36:41PM +0530, Jeevan B wrote:
> Modify test to skip if no connector is connected as Unsupported config
> should be followed by this check.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/i915/kms_big_fb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
> index 86659038..4be90531 100644
> --- a/tests/i915/kms_big_fb.c
> +++ b/tests/i915/kms_big_fb.c
> @@ -810,6 +810,7 @@ igt_main
>  
>  		igt_require_pipe_crc(data.drm_fd);
>  		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
>  
>  		res = drmModeGetResources(data.drm_fd);
>  		igt_assert(res);
> -- 
> 2.19.1
> 
