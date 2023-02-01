Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A52D10E41F
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Feb 2023 15:44:45 +0000 (UTC)
Date: Wed, 1 Feb 2023 16:44:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230201154441.keb4xwtafvsxkqgq@kamilkon-desk1>
References: <20230201132657.575932-1-zbigniew.kempczynski@intel.com>
 <20230201132657.575932-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230201132657.575932-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/i915_crc: Use graphics version
 to determine ALU SHL/SHR caps
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

On 2023-02-01 at 14:26:57 +0100, Zbigniew Kempczyński wrote:
> Start supporting crc calculations on platforms which contains necessary
> ALU instructions.

Something to consider in future: maybe we can add to i915 library new
function has_alu_shl_shr(devid) ?

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> ---
>  lib/i915/i915_crc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/i915/i915_crc.c b/lib/i915/i915_crc.c
> index cdd3cef6df..7d68f8e5c4 100644
> --- a/lib/i915/i915_crc.c
> +++ b/lib/i915/i915_crc.c
> @@ -295,5 +295,5 @@ bool supports_i915_crc32(int i915)
>  {
>  	uint16_t devid = intel_get_drm_devid(i915);
>  
> -	return IS_DG2(devid);
> +	return intel_graphics_ver(devid) > IP_VER(12, 50);
>  }
> -- 
> 2.34.1
> 
