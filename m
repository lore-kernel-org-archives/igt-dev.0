Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C4C10E4BB
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 14:32:58 +0000 (UTC)
Date: Tue, 7 Mar 2023 15:32:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230307143249.jsybiw7cs3crztsf@kamilkon-desk1>
References: <20230307104519.706553-1-zbigniew.kempczynski@intel.com>
 <20230307104519.706553-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307104519.706553-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] lib/huc_copy: Rename to avoid
 macro name clash
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

Hi Zbigniew,

On 2023-03-07 at 11:45:18 +0100, Zbigniew Kempczyński wrote:
> Adding intel_gpu_commands.h requires to solve some name clashes.
> Rename MFX_WAIT to HUC_MFX_WAIT to be consistent with other macros
> in the huc code.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

imho it may be better to place it as first patch.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/huc_copy.c | 6 +++---
>  lib/huc_copy.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/huc_copy.c b/lib/huc_copy.c
> index 6ec68864b7..bf8254c612 100644
> --- a/lib/huc_copy.c
> +++ b/lib/huc_copy.c
> @@ -80,14 +80,14 @@ gen9_huc_copyfunc(int fd, uint64_t ahnd,
>  	buf[i++] = 0;
>  	buf[i++] = 0x3;
>  
> -	buf[i++] = MFX_WAIT;
> -	buf[i++] = MFX_WAIT;
> +	buf[i++] = HUC_MFX_WAIT;
> +	buf[i++] = HUC_MFX_WAIT;
>  
>  	buf[i++] = HUC_PIPE_MODE_SELECT;
>  	buf[i++] = 0;
>  	buf[i++] = 0;
>  
> -	buf[i++] = MFX_WAIT;
> +	buf[i++] = HUC_MFX_WAIT;
>  
>  	memset(reloc, 0, sizeof(reloc));
>  
> diff --git a/lib/huc_copy.h b/lib/huc_copy.h
> index 69d1409335..1789e87359 100644
> --- a/lib/huc_copy.h
> +++ b/lib/huc_copy.h
> @@ -31,7 +31,7 @@
>  #include "intel_reg.h"
>  
>  #define PARALLEL_VIDEO_PIPE		(0x3<<29)
> -#define MFX_WAIT			(PARALLEL_VIDEO_PIPE|(0x1<<27)|(0x1<<8))
> +#define HUC_MFX_WAIT			(PARALLEL_VIDEO_PIPE|(0x1<<27)|(0x1<<8))
>  
>  #define HUC_IMEM_STATE			(PARALLEL_VIDEO_PIPE|(0x2<<27)|(0xb<<23)|(0x1<<16)|0x3)
>  #define HUC_PIPE_MODE_SELECT		(PARALLEL_VIDEO_PIPE|(0x2<<27)|(0xb<<23)|0x1)
> -- 
> 2.34.1
> 
