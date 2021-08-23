Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E194F89E7C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Aug 2021 03:13:05 +0000 (UTC)
Date: Mon, 23 Aug 2021 05:13:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210823031300.GC3253@zkempczy-mobl2>
References: <20210821071025.1657059-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210821071025.1657059-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_media_fill: Add support for
 local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: thomas.hellstrom@linux.intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Aug 21, 2021 at 12:40:25PM +0530, apoorva1.singh@intel.com wrote:
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Add support for local memory region (Device memory)
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_media_fill.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_media_fill.c b/tests/i915/gem_media_fill.c
> index 28c18e79..1d08df24 100644
> --- a/tests/i915/gem_media_fill.c
> +++ b/tests/i915/gem_media_fill.c
> @@ -154,7 +154,8 @@ igt_main
>  		igt_assert(query_info);
>  
>  		set = get_memory_region_set(query_info,
> -					    I915_SYSTEM_MEMORY);
> +					    I915_SYSTEM_MEMORY,
> +					    I915_DEVICE_MEMORY);
>  
>  		igt_fork_hang_detector(data.drm_fd);
>  	}
> -- 
> 2.25.1
> 

Works fine, thanks!

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
