Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A71A10E068
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jan 2023 12:59:28 +0000 (UTC)
Message-ID: <a105a05d-ec3a-5954-b094-6cc6795ab6e9@intel.com>
Date: Tue, 24 Jan 2023 18:29:13 +0530
From: "Tauro, Riana" <riana.tauro@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 <igt-dev@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>
References: <20230121054153.410979-1-ashutosh.dixit@intel.com>
 <20230121054153.410979-2-ashutosh.dixit@intel.com>
Content-Language: en-US
In-Reply-To: <20230121054153.410979-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/i915_power: Sanity check power
 measurement
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh,

On 1/21/2023 11:11 AM, Ashutosh Dixit wrote:
> Add a test to sanity check power measurement on integrated/discrete by
> requiring power under load to be > 0 and >= idle power.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   tests/i915/i915_power.c | 73 +++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build       |  1 +
>   2 files changed, 74 insertions(+)
>   create mode 100644 tests/i915/i915_power.c
> 
> diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
> new file mode 100644
> index 00000000000..e7d5c32f1af
> --- /dev/null
> +++ b/tests/i915/i915_power.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
Year 2023

With the above change
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> +
> +#include "igt.h"
> +#include "i915/gem.h"
> +#include "igt_power.h"
> +
> +IGT_TEST_DESCRIPTION("i915 power measurement tests");
> +
> +static double power(int i915, const char *domain, bool load)
measure_power instead of power?
> +{
> +	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
> +	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
> +	struct power_sample sample[2];
> +	int sleep_duration_sec = 2;
> +	struct igt_power pwr;
> +	igt_spin_t *spin;
> +	double mW;
> +
> +	gem_quiescent_gpu(i915);
> +	if (load) {
> +		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
> +				    .engine = ALL_ENGINES,
> +				    .flags = IGT_SPIN_POLL_RUN);
> +		/* Wait till at least one spinner starts */
> +		igt_spin_busywait_until_started(spin);
> +	}
> +
> +	igt_require(!igt_power_open(i915, &pwr, domain));
> +	igt_power_get_energy(&pwr, &sample[0]);
> +	usleep(sleep_duration_sec * USEC_PER_SEC);
> +	igt_power_get_energy(&pwr, &sample[1]);
> +
> +	mW = igt_power_get_mW(&pwr, &sample[0], &sample[1]);
> +	igt_info("Domain: %s, Load: %d, Measured power: %g mW\n", domain, load, mW);
> +
> +	igt_power_close(&pwr);
> +	igt_free_spins(i915);
> +	put_ahnd(ahnd);
> +	intel_ctx_destroy(i915, ctx);
> +
> +	return mW;
> +}
> +
> +static void sanity(int i915, const char *domain)
> +{
> +	double idle, busy;
> +
> +	idle = power(i915, domain, false);
> +	busy = power(i915, domain, true);
> +
> +	igt_assert(busy > 0 && busy >= idle);
> +}
> +
> +igt_main
> +{
> +	int i915;
> +
> +	igt_fixture {
> +		i915 = drm_open_driver_master(DRIVER_INTEL);
> +	}
> +
> +	igt_describe("Sanity check power measurement");
> +	igt_subtest("sanity") {
> +		sanity(i915, "gpu");
> +	}
> +
> +	igt_fixture {
> +		close(i915);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index e20a864035b..e0f41e9e6a1 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -212,6 +212,7 @@ i915_progs = [
>   	'i915_pm_dc',
>   	'i915_pm_rps',
>   	'i915_pm_sseu',
> +	'i915_power',
>   	'i915_query',
>   	'i915_selftest',
>   	'i915_suspend',
