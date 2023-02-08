Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA69510E6D0
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 05:01:49 +0000 (UTC)
Message-ID: <e97545a7-ae19-b91f-3e93-6cd80278580e@intel.com>
Date: Wed, 8 Feb 2023 10:31:36 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230208015959.24015-1-nidhi1.gupta@intel.com>
 <20230208015959.24015-5-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230208015959.24015-5-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 4/4] tests/i915/kms_frontbuffer_tracking:
 Reduce the execution time on simulation
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

Hi Nidhi,

On Wed-08-02-2023 07:29 am, Nidhi Gupta wrote:
> With IGT_DRAW_RENDER draw method test is taking lot of time to
> complete causing timeout in simulation, to avoid the time out
> skipping IGT_DRAW_METHOD only for simulation
> 
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Please drop internal reviews & ask for the new.

- Bhanu

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/i915/kms_frontbuffer_tracking.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> index 5b47999e..1d05a916 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -3159,6 +3159,9 @@ static void basic_subtest(const struct test_mode *t)
>   	fb1 = params->primary.fb;
>   
>   	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
> +		if (igt_run_in_simulation() && method == IGT_DRAW_RENDER)
> +			continue;
> +
>   		if (method == IGT_DRAW_MMAP_GTT &&
>   		    !gem_has_mappable_ggtt(drm.fd))
>   			continue;
