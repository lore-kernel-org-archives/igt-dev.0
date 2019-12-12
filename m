Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8BE6E0C2
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 11:01:55 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20191211005235.67897-11-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
 <20191211005235.67897-11-d.scott.phillips@intel.com>
Date: Thu, 12 Dec 2019 13:01:50 +0200
Message-ID: <87o8wd3izl.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 10/29] drm-uapi: patch sync_file.h to
 depend on drm.h
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: D Scott Phillips <d.scott.phillips@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 10 Dec 2019, D Scott Phillips <d.scott.phillips@intel.com> wrote:
> linux/sync_file.h isn't strictly part of the drm uapi and so
> doesn't include drm.h. drm.h contains some compatibility #defines
> for non-Linux platforms for things like __u32 which synf_file
> needs.

Unfortunately, stuff in drm-uapi are supposed to be verbatim copies from
the kernel.

BR,
Jani.

>
> Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
> ---
>  include/drm-uapi/sync_file.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/include/drm-uapi/sync_file.h b/include/drm-uapi/sync_file.h
> index b4f2db00..4713b5b9 100644
> --- a/include/drm-uapi/sync_file.h
> +++ b/include/drm-uapi/sync_file.h
> @@ -12,8 +12,7 @@
>  #ifndef _LINUX_SYNC_H
>  #define _LINUX_SYNC_H
>  
> -#include <linux/ioctl.h>
> -#include <linux/types.h>
> +#include "drm.h"
>  
>  /**
>   * struct sync_merge_data - data passed to merge ioctl

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
