Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BC910E61A
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Mar 2022 13:57:13 +0000 (UTC)
Message-ID: <047a91a4-e5e9-06af-c2b7-08092400e2a1@intel.com>
Date: Tue, 22 Mar 2022 15:57:12 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220322122501.1093384-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220322122501.1093384-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] i915/perf: Enable perf OA tests for ADL-N
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

On 22/03/2022 14:25, Tejas Upadhyay wrote:
> ADL-N and ADL use the same OA metrics. Add ADL-N support
> for OA tests.
>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


Thanks for taking care of this.


-Lionel

> ---
>   lib/i915/perf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index 98b2f29d..d88835ff 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -278,7 +278,7 @@ intel_perf_for_devinfo(uint32_t device_id,
>   	} else if (devinfo->is_dg1) {
>   		intel_perf_load_metrics_dg1(perf);
>   	} else if (devinfo->is_alderlake_s || devinfo->is_alderlake_p ||
> -		   devinfo->is_raptorlake_s) {
> +		   devinfo->is_raptorlake_s || devinfo->is_alderlake_n) {
>   		intel_perf_load_metrics_adl(perf);
>   	} else {
>   		return unsupported_i915_perf_platform(perf);

