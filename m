Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4014A10E966
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 14:16:01 +0000 (UTC)
Date: Wed, 19 Apr 2023 16:15:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230419141557.ev3u5q2g4pigxnle@kamilkon-desk1>
References: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
 <20230418072535.14946-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230418072535.14946-4-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 03/10] lib/xe_query: Remove commented
 out function prototype
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

On 2023-04-18 at 09:25:28 +0200, Zbigniew Kempczyński wrote:
> Remove unnecessary commented out code.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/xe/xe_query.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index f49acb1d7b..cc6e7cefdc 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -88,7 +88,6 @@ const char *xe_region_name(uint64_t region);
>  uint32_t xe_min_page_size(int fd, uint64_t region);
>  unsigned int xe_number_hw_engines(int fd);
>  bool xe_has_vram(int fd);
> -//uint64_t xe_vram_size(int fd);
>  uint64_t xe_vram_size(int fd, int gt);
>  uint32_t xe_get_default_alignment(int fd);
>  uint32_t xe_va_bits(int fd);
> -- 
> 2.34.1
> 
