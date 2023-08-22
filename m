Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A96210E0B5
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 20:47:14 +0000 (UTC)
Date: Tue, 22 Aug 2023 22:47:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230822204709.zuoxonzyn5ij42jy@kamilkon-desk.igk.intel.com>
References: <20230822201833.29474-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230822201833.29474-1-aurabindo.pillai@amd.com>
Subject: Re: [igt-dev] [PATCH v4] tests/amdgpu: Fix build error due to
 external file include
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Aurabindo,

On 2023-08-22 at 16:18:33 -0400, Aurabindo Pillai wrote:
> Remove the external file include that causes build error
> on certain systems configured in the CI.
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>  tests/amdgpu/amd_odm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
> index 2781ad1c2..839f2de3f 100644
> --- a/tests/amdgpu/amd_odm.c
> +++ b/tests/amdgpu/amd_odm.c
> @@ -5,7 +5,6 @@
>  
>  #include <fcntl.h>
>  #include <stdio.h>
> -#include <xf86drmMode.h>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Will this test work without xf86drmMode.h?
If it is kms test you may just include igt_kms.h but first
apply fix (or revert).

Regards,
Kamil

>  
>  #include "igt.h"
>  #include "igt_amd.h"
> -- 
> 2.41.0
> 
