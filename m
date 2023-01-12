Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC4010E8E1
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 13:23:35 +0000 (UTC)
Date: Thu, 12 Jan 2023 14:23:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230112132331.kr7ncmhw267lytlt@kamilkon-desk1>
References: <20230111181205.55997-1-zbigniew.kempczynski@intel.com>
 <20230111181205.55997-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111181205.55997-4-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_cursor_legacy: Add
 dependency size for spinner creation
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

On 2023-01-11 at 19:12:05 +0100, Zbigniew Kempczyński wrote:
> Fix the bug where lack of information about dependency object size
> during spinner creation may lead to object overlapping and failing
> with ENOSPC.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/7681
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_cursor_legacy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 6b75e98cb8..f1e55906a0 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1471,7 +1471,8 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>  
>  		spin = igt_spin_new(display->drm_fd,
>  				    .ahnd = ahnd,
> -				    .dependency = fb_info[1].gem_handle);
> +				    .dependency = fb_info[1].gem_handle,
> +				    .dependency_size = fb_info[1].size);
>  
>  		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
>  
> -- 
> 2.34.1
> 
