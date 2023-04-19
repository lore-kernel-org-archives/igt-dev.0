Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AF110E9A9
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 14:10:19 +0000 (UTC)
Date: Wed, 19 Apr 2023 16:10:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230419141015.g5qjseomx67dqjlg@kamilkon-desk1>
References: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
 <20230418072535.14946-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230418072535.14946-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 01/10] lib/xe_ioctl: Add missing
 header for direct resolving
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

On 2023-04-18 at 09:25:26 +0200, Zbigniew Kempczyński wrote:
> xe_ioctl.h user expects all types resolving. Add missing stddef.h
> header which contains size_t definition.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/xe/xe_ioctl.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index d8c40eda01..049cd183d6 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -11,6 +11,7 @@
>  #ifndef XE_IOCTL_H
>  #define XE_IOCTL_H
>  
> +#include <stddef.h>
>  #include <stdint.h>
>  #include <xe_drm.h>
>  
> -- 
> 2.34.1
> 
