Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20201126154856.738141-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <e260b30d-2fc7-aede-3fbd-2382fbe4d51e@linux.intel.com>
Date: Thu, 26 Nov 2020 16:05:04 +0000
MIME-Version: 1.0
In-Reply-To: <20201126154856.738141-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel_gpu_top: Fixup imc event
 parsing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 26/11/2020 15:48, Chris Wilson wrote:
> After combining rapl_parse and imc_parse into a single pmu_parse, I left
> the "energy-" prefixes used by rapl (but not imc) in place. Lift the
> prefix to rapl_open() so that pmu_parse() does work for both rapl and
> imc!
> 
> Reported-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: d0b71b967ccd ("tools/intel_gpu_top: Consolidate imc to use pmu_counter")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   tools/intel_gpu_top.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 5d42a2fad..3ff9236ed 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -151,13 +151,13 @@ static int pmu_parse(struct pmu_counter *pmu, const char *path, const char *str)
>   
>   	result &= igt_sysfs_scanf(dir, "type", "%"PRIu64, &pmu->type) == 1;
>   
> -	snprintf(buf, sizeof(buf) - 1, "events/energy-%s", str);
> +	snprintf(buf, sizeof(buf) - 1, "events/%s", str);
>   	result &= igt_sysfs_scanf(dir, buf, "event=%"PRIx64, &pmu->config) == 1;
>   
> -	snprintf(buf, sizeof(buf) - 1, "events/energy-%s.scale", str);
> +	snprintf(buf, sizeof(buf) - 1, "events/%s.scale", str);
>   	result &= igt_sysfs_scanf(dir, buf, "%lf", &pmu->scale) == 1;
>   
> -	snprintf(buf, sizeof(buf) - 1, "events/energy-%s.unit", str);
> +	snprintf(buf, sizeof(buf) - 1, "events/%s.unit", str);
>   	result &= igt_sysfs_scanf(dir, buf, "%127s", buf) == 1;
>   	pmu->units = strdup(buf);
>   
> @@ -217,13 +217,13 @@ rapl_open(struct pmu_counter *pmu,
>   static void gpu_power_open(struct pmu_counter *pmu,
>   			   struct engines *engines)
>   {
> -	rapl_open(pmu, "gpu", engines);
> +	rapl_open(pmu, "energy-gpu", engines);
>   }
>   
>   static void pkg_power_open(struct pmu_counter *pmu,
>   			   struct engines *engines)
>   {
> -	rapl_open(pmu, "pkg", engines);
> +	rapl_open(pmu, "energy-pkg", engines);
>   }
>   
>   static uint64_t
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
