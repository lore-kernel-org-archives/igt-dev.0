Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BB210E7E8
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 07:24:40 +0000 (UTC)
Date: Thu, 7 Dec 2023 08:24:35 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Message-ID: <20231207072435.yqr4jyjsw3oakm5q@zkempczy-mobl2>
References: <20231206194512.332721-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206194512.332721-1-dominik.grzegorzek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Use COMPUTE
 instead of RENDER engine for Xe if missing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 08:45:12PM +0100, Dominik Grzegorzek wrote:
> Make engine fallback in intel_batchbuffer more generic. Up to this
> point, we were replacing render with compute only on PVC.
> Replace it whenever there is no compute engine. As was stated in
> 989920cfc4 this still remains only a workaround, more rework
> in intel-bb is necessary to better support both - i915 and xe.

Agree, this solution is more generic:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_batchbuffer.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 472c88129..1268ac8f0 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -2366,10 +2366,10 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
>  			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
>  			break;
>  		case I915_EXEC_RENDER:
> -			if (IS_PONTEVECCHIO(xe_dev_id(ibb->fd)))
> -				inst.engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
> -			else
> +			if (xe_has_engine_class(ibb->fd, DRM_XE_ENGINE_CLASS_RENDER))
>  				inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
> +			else
> +				inst.engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
>  			break;
>  		case I915_EXEC_VEBOX:
>  			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
> -- 
> 2.34.1
> 
