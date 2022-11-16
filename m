Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E237E10E0A2
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 18:41:08 +0000 (UTC)
Message-ID: <217efc0d-3e79-27db-8a1f-f0bd1c8f5a87@intel.com>
Date: Wed, 16 Nov 2022 20:41:01 +0200
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20221116170751.195223-1-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20221116170751.195223-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/perf: Propagate return from
 unsupported_i915_perf_platform
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

On 16/11/2022 19:07, Ashutosh Dixit wrote:
> NULL return from unsupported_i915_perf_platform must be propagated up the
> call stack to inform callers of intel_perf_for_devinfo and
> intel_perf_for_fd.
>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/7358
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>


Thanks a lot, well spotted!

Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


> ---
>   lib/i915/perf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index 28f37948e52..4a946906a84 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -366,7 +366,7 @@ intel_perf_for_devinfo(uint32_t device_id,
>   			intel_perf_load_metrics_tglgt2(perf);
>   			break;
>   		default:
> -			unsupported_i915_perf_platform(perf);
> +			return unsupported_i915_perf_platform(perf);
>   		}
>   	} else if (devinfo->is_rocketlake) {
>   		intel_perf_load_metrics_rkl(perf);
> @@ -391,7 +391,7 @@ intel_perf_for_devinfo(uint32_t device_id,
>   		else if (is_acm_gt3(&perf->devinfo))
>   			intel_perf_load_metrics_acmgt3(perf);
>   		else
> -			unsupported_i915_perf_platform(perf);
> +			return unsupported_i915_perf_platform(perf);
>   	} else {
>   		return unsupported_i915_perf_platform(perf);
>   	}

