Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D55C47DDF
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 12:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3319B10EC24;
	Wed, 24 Jan 2024 12:24:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8475710EC24
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 12:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706099054; x=1737635054;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k8uzWqPf9TzEgKpycHMT/s88q7zaFbrO+/cqqAkk4as=;
 b=dVul92WPntkEhS3WRgJKaV8WGH8XjoNSK+Sr9VKJLAb79YMg65s6wZot
 20SRqu9ftLFL8UJyhJvCuDXNraW+ZsAOdvAACF6Bm1C5BpDVztb8X9fun
 cfkpajj3Qbvbyp4+s/7dIojZnXy43TlJ1LDfU6Eyq/EfJsjQP2QOFeqos
 VqiiHZEUIdKXY4gzNFQw5F/i+cXr0dlW4ShnERt7un3iKiIaxCc0BtC2A
 49HRypP5wnvMpw2jJRh/RdWuIQu9Y34zotPs6bIz+s/NnIUEqUV9766uL
 VKQD3PWJCCM932CoM/nyNMlZDQ8Itz7OVD8TgVq7GLwAZxtQbrbMGN0aG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23294197"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23294197"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1914694"
Received: from wheelerj-mobl.ger.corp.intel.com (HELO [10.213.198.85])
 ([10.213.198.85])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:24:11 -0800
Message-ID: <b6b2503e-4caf-4547-9c7c-22153aaa5a4a@linux.intel.com>
Date: Wed, 24 Jan 2024 12:24:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] benchmarks/gem_wsim: Extend engine selection
 syntax
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240115154448.29263-1-marcin.bernatowicz@linux.intel.com>
 <20240115154448.29263-2-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240115154448.29263-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


Hi,

On 15/01/2024 15:44, Marcin Bernatowicz wrote:
> This commit introduces significant changes to the engine selection
> syntax:
> - Dynamically generates the list of available physical engines by
>    querying the device.
> - Identifies engines using [class:instance:gt] tuples.
> - Allows specifying engine instance and gt as
>    `engine_class[<engine_instance>-<gt_id>]`
>    ex. First VCS engine may be specified as VCS, VCS1, and VCS1-0.
> - Adds support for compute engine class (CCS).
> - Maintains 1-based engine instance ids for compatibility with existing
>    workload definitions.
> - Each `w_step` now includes an `engine_idx` (populated during prepare
>    workload phase), simplifying the run phase with an index in the
>    device/context engine map.
>    Second index field `request_idx` was introduced to support throttling
>    functionality, enabling control over the rate of requests on a given
>    engine.

I wanted to have a look but keep getting discouraged by the sheer size 
of the patch. Becase when I look at the list of bullet points above I 
wonder if it could be split into more manageable (for review) chunks.

Worry is the regression potential given we have no test suite and there 
is quite a number of engine selection combos across platforms, drivers 
and uapis.

What is your opinion on the splitability?

Regards,

Tvrtko

> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 788 +++++++++++++++++++++---------------------
>   1 file changed, 402 insertions(+), 386 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 955b6799e..e79d26513 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -68,17 +68,6 @@
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_spin.h"
>   
> -enum intel_engine_id {
> -	DEFAULT,
> -	RCS,
> -	BCS,
> -	VCS,
> -	VCS1,
> -	VCS2,
> -	VECS,
> -	NUM_ENGINES
> -};
> -
>   struct duration {
>   	unsigned int min, max;
>   	bool unbound;
> @@ -126,9 +115,16 @@ struct w_arg {
>   	bool sseu;
>   };
>   
> +typedef struct drm_xe_engine_class_instance intel_engine_t;
> +
> +struct intel_engines {
> +	unsigned int nr_engines;
> +	intel_engine_t *engines;
> +};
> +
>   struct bond {
> -	uint64_t mask;
> -	enum intel_engine_id master;
> +	struct intel_engines mask;
> +	intel_engine_t master;
>   };
>   
>   struct work_buffer_size {
> @@ -153,7 +149,8 @@ struct w_step {
>   	/* Workload step metadata */
>   	enum w_type type;
>   	unsigned int context;
> -	unsigned int engine;
> +	unsigned int engine_idx;
> +	intel_engine_t engine;
>   	struct duration duration;
>   	struct deps data_deps;
>   	struct deps fence_deps;
> @@ -165,15 +162,9 @@ struct w_step {
>   		int target;
>   		int throttle;
>   		int priority;
> -		struct {
> -			unsigned int engine_map_count;
> -			enum intel_engine_id *engine_map;
> -		};
> +		struct intel_engines engine_map;
>   		bool load_balance;
> -		struct {
> -			uint64_t bond_mask;
> -			enum intel_engine_id bond_master;
> -		};
> +		struct bond bond;
>   		int sseu;
>   		struct working_set working_set;
>   	};
> @@ -181,7 +172,7 @@ struct w_step {
>   	/* Implementation details */
>   	unsigned int idx;
>   	struct igt_list_head rq_link;
> -	unsigned int request;
> +	unsigned int request_idx;
>   	unsigned int preempt_us;
>   
>   	union {
> @@ -220,8 +211,7 @@ struct xe_exec_queue {
>   struct ctx {
>   	uint32_t id;
>   	int priority;
> -	unsigned int engine_map_count;
> -	enum intel_engine_id *engine_map;
> +	struct intel_engines engine_map;
>   	unsigned int bond_count;
>   	struct bond *bonds;
>   	bool load_balance;
> @@ -267,8 +257,8 @@ struct workload {
>   	int sync_timeline;
>   	uint32_t sync_seqno;
>   
> -	struct igt_list_head requests[NUM_ENGINES];
> -	unsigned int nrequest[NUM_ENGINES];
> +	struct igt_list_head *requests;
> +	unsigned int *nrequest;
>   };
>   
>   #define __for_each_ctx(__ctx, __wrk, __ctx_idx) \
> @@ -296,16 +286,44 @@ static struct drm_i915_gem_context_param_sseu device_sseu = {
>   #define FLAG_DEPSYNC		(1<<2)
>   #define FLAG_SSEU		(1<<3)
>   
> -static const char *ring_str_map[NUM_ENGINES] = {
> -	[DEFAULT] = "DEFAULT",
> -	[RCS] = "RCS",
> -	[BCS] = "BCS",
> -	[VCS] = "VCS",
> -	[VCS1] = "VCS1",
> -	[VCS2] = "VCS2",
> -	[VECS] = "VECS",
> +enum intel_engine_class {
> +	RCS,
> +	BCS,
> +	VCS,
> +	VECS,
> +	CCS,
> +	NUM_ENGINE_CLASSES,
>   };
>   
> +_Static_assert(RCS == DRM_XE_ENGINE_CLASS_RENDER, "mismatch");
> +_Static_assert(BCS == DRM_XE_ENGINE_CLASS_COPY, "mismatch");
> +_Static_assert(VCS == DRM_XE_ENGINE_CLASS_VIDEO_DECODE, "mismatch");
> +_Static_assert(VECS == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE, "mismatch");
> +_Static_assert(CCS == DRM_XE_ENGINE_CLASS_COMPUTE, "mismatch");
> +_Static_assert((int)RCS == (int)I915_ENGINE_CLASS_RENDER, "mismatch");
> +_Static_assert((int)BCS == (int)I915_ENGINE_CLASS_COPY, "mismatch");
> +_Static_assert((int)VCS == (int)I915_ENGINE_CLASS_VIDEO, "mismatch");
> +_Static_assert((int)VECS == (int)I915_ENGINE_CLASS_VIDEO_ENHANCE, "mismatch");
> +_Static_assert((int)CCS == (int)I915_ENGINE_CLASS_COMPUTE, "mismatch");
> +
> +static const char *intel_engine_class_string(uint16_t engine_class)
> +{
> +	switch (engine_class) {
> +	case RCS:
> +		return "RCS";
> +	case BCS:
> +		return "BCS";
> +	case VCS:
> +		return "VCS";
> +	case VECS:
> +		return "VECS";
> +	case CCS:
> +		return "CCS";
> +	default:
> +		igt_assert(0);
> +	}
> +}
> +
>   static void w_step_sync(struct w_step *w)
>   {
>   	if (is_xe)
> @@ -521,218 +539,261 @@ out:
>   	} \
>   }
>   
> -static int str_to_engine(const char *str)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(ring_str_map); i++) {
> -		if (!strcasecmp(str, ring_str_map[i]))
> -			return i;
> -	}
> -
> -	return -1;
> -}
> +#define INVALID_ID ((uint16_t)-2)
> +#define DEFAULT_ID ((uint16_t)-1)
>   
> -static struct intel_engine_data *query_engines(void)
> +static struct intel_engines *query_engines(void)
>   {
> -	static struct intel_engine_data engines = {};
> +	static struct intel_engines engines = {};
>   
> -	if (engines.nengines)
> +	if (engines.nr_engines)
>   		return &engines;
>   
>   	if (is_xe) {
>   		struct drm_xe_engine_class_instance *hwe;
>   
> -		xe_for_each_engine(fd, hwe) {
> -			engines.engines[engines.nengines].class = hwe->engine_class;
> -			engines.engines[engines.nengines].instance = hwe->engine_instance;
> -			engines.nengines++;
> +		engines.engines = calloc(xe_number_engines(fd), sizeof(intel_engine_t));
> +		igt_assert(engines.engines);
> +		engines.nr_engines = 0;
> +		xe_for_each_engine(fd, hwe)
> +			engines.engines[engines.nr_engines++] = *hwe;
> +		igt_assert(engines.nr_engines);
> +	} else {
> +		struct intel_engine_data ed = {};
> +
> +		ed = intel_engine_list_of_physical(fd);
> +		igt_assert(ed.nengines);
> +		engines.nr_engines = ed.nengines;
> +		engines.engines = calloc(engines.nr_engines, sizeof(intel_engine_t));
> +		igt_assert(engines.engines);
> +		for (int i = 0; i < ed.nengines; ++i) {
> +			engines.engines[i].engine_class = ed.engines[i].class;
> +			engines.engines[i].engine_instance = ed.engines[i].instance;
> +			engines.engines[i].gt_id = DEFAULT_ID;
>   		}
> -	} else
> -		engines = intel_engine_list_of_physical(fd);
> +	}
>   
> -	igt_assert(engines.nengines);
>   	return &engines;
>   }
>   
> -static unsigned int num_engines_in_class(enum intel_engine_id class)
> -{
> -	const struct intel_engine_data *engines = query_engines();
> -	unsigned int i, count = 0;
> +/* engine_class[<engine_instance>-<gt_id>] */
> +static intel_engine_t str_to_engine(const char *str)
> +{
> +	intel_engine_t e = {INVALID_ID, DEFAULT_ID, DEFAULT_ID};
> +	size_t pos;
> +
> +	if (!strcasecmp("DEFAULT", str)) {
> +		e.engine_class = DEFAULT_ID;
> +		return e;
> +	} else if (!strncasecmp("RCS", str, 3)) {
> +		e.engine_class = RCS;
> +		pos = 3;
> +	} else if (!strncasecmp("BCS", str, 3)) {
> +		e.engine_class = BCS;
> +		pos = 3;
> +	} else if (!strncasecmp("VCS", str, 3)) {
> +		e.engine_class = VCS;
> +		pos = 3;
> +	} else if (!strncasecmp("VECS", str, 4)) {
> +		e.engine_class = VECS;
> +		pos = 4;
> +	} else if (!strncasecmp("CCS", str, 3)) {
> +		e.engine_class = CCS;
> +		pos = 3;
> +	} else
> +		return (intel_engine_t){INVALID_ID};
> +
> +	if (str[pos]) {
> +		char *s = strchr(&str[pos], '-');
> +		char *endptr = NULL;
> +		long id;
> +
> +		if (!s || (s && *s != str[pos])) {
> +			id = strtol(&str[pos], &endptr, 10);
> +			if (endptr == &str[pos] || id < 1 || id >= INVALID_ID)
> +				return (intel_engine_t){INVALID_ID};
> +			e.engine_instance = id - 1;
> +		}
>   
> -	igt_assert(class == VCS);
> +		if (s && *(++s)) {
> +			id = strtol(s, &endptr, 10);
> +			if (endptr == s || id < 0 || id >= INVALID_ID)
> +				return (intel_engine_t){INVALID_ID};
> +			e.gt_id = id;
> +		}
>   
> -	for (i = 0; i < engines->nengines; i++) {
> -		if (engines->engines[i].class == I915_ENGINE_CLASS_VIDEO)
> -			count++;
> +		if (endptr && endptr != (str + strlen(str)))
> +			return (intel_engine_t){INVALID_ID};
>   	}
>   
> -	igt_assert(count);
> -	return count;
> +	return e;
>   }
>   
> -static void
> -fill_engines_id_class(enum intel_engine_id *list,
> -		      enum intel_engine_id class)
> +static bool is_valid_engine(const intel_engine_t *engine)
>   {
> -	const struct intel_engine_data *engines = query_engines();
> -	enum intel_engine_id engine = VCS1;
> -	unsigned int i, j = 0;
> -
> -	igt_assert(class == VCS);
> -	igt_assert(num_engines_in_class(VCS) <= 2);
> -
> -	for (i = 0; i < engines->nengines; i++) {
> -		if (engines->engines[i].class != I915_ENGINE_CLASS_VIDEO)
> -			continue;
> -
> -		list[j++] = engine++;
> -	}
> +	return engine->engine_class != INVALID_ID;
>   }
>   
> -static unsigned int
> -find_physical_instance(enum intel_engine_id class, unsigned int logical)
> +static bool is_default_engine(const intel_engine_t *engine)
>   {
> -	const struct intel_engine_data *engines = query_engines();
> -	unsigned int i, j = 0;
> -
> -	igt_assert(class == VCS);
> -
> -	for (i = 0; i < engines->nengines; i++) {
> -		if (engines->engines[i].class != I915_ENGINE_CLASS_VIDEO)
> -			continue;
> -
> -		/* Map logical to physical instances. */
> -		if (logical == j++)
> -			return engines->engines[i].instance;
> -	}
> -
> -	igt_assert(0);
> -	return 0;
> +	return engine->engine_class == DEFAULT_ID &&
> +	       engine->engine_instance == DEFAULT_ID &&
> +	       engine->gt_id == DEFAULT_ID;
>   }
>   
> -static struct i915_engine_class_instance
> -get_engine(enum intel_engine_id engine)
> +static struct i915_engine_class_instance to_i915_engine_class(const intel_engine_t *engine)
>   {
> -	struct i915_engine_class_instance ci;
> -
> -	query_engines();
> +	return (struct i915_engine_class_instance){engine->engine_class, engine->engine_instance};
> +}
>   
> -	switch (engine) {
> +static unsigned int to_i915_legacy_ring(const intel_engine_t *engine)
> +{
> +	switch (engine->engine_class) {
> +	case DEFAULT_ID:
> +		return I915_EXEC_DEFAULT;
>   	case RCS:
> -		ci.engine_class = I915_ENGINE_CLASS_RENDER;
> -		ci.engine_instance = 0;
> -		break;
> +		return I915_EXEC_RENDER;
>   	case BCS:
> -		ci.engine_class = I915_ENGINE_CLASS_COPY;
> -		ci.engine_instance = 0;
> -		break;
> -	case VCS1:
> -	case VCS2:
> -		ci.engine_class = I915_ENGINE_CLASS_VIDEO;
> -		ci.engine_instance = find_physical_instance(VCS, engine - VCS1);
> +		return I915_EXEC_BLT;
> +	case VCS:
> +		if (engine->engine_instance == DEFAULT_ID)
> +			return I915_EXEC_BSD;
> +		else if (engine->engine_instance == 0)
> +			return I915_EXEC_BSD | I915_EXEC_BSD_RING1;
> +		else if (engine->engine_instance == 1)
> +			return I915_EXEC_BSD | I915_EXEC_BSD_RING2;
>   		break;
>   	case VECS:
> -		ci.engine_class = I915_ENGINE_CLASS_VIDEO_ENHANCE;
> -		ci.engine_instance = 0;
> -		break;
> -	default:
> -		igt_assert(0);
> +		return I915_EXEC_VEBOX;
>   	};
>   
> -	return ci;
> +	igt_assert(0);
>   }
>   
> -static struct drm_xe_engine_class_instance
> -xe_get_engine(enum intel_engine_id engine)
> +static bool are_equal_engines(const intel_engine_t *e1, const intel_engine_t *e2)
>   {
> -	struct drm_xe_engine_class_instance hwe = {}, *hwe1;
> -	bool found_physical = false;
> -
> -	switch (engine) {
> -	case RCS:
> -		hwe.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
> -		break;
> -	case BCS:
> -		hwe.engine_class = DRM_XE_ENGINE_CLASS_COPY;
> -		break;
> -	case VCS1:
> -		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
> -		break;
> -	case VCS2:
> -		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
> -		hwe.engine_instance = 1;
> -		break;
> -	case VECS:
> -		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
> -		break;
> -	default:
> -		igt_assert(0);
> -	};
> +	return e1->engine_class == e2->engine_class &&
> +	       e1->engine_instance == e2->engine_instance &&
> +	       e1->gt_id == e2->gt_id;
> +}
>   
> -	xe_for_each_engine(fd, hwe1) {
> -		if (hwe.engine_class == hwe1->engine_class &&
> -		    hwe.engine_instance  == hwe1->engine_instance) {
> -			hwe = *hwe1;
> -			found_physical = true;
> -			break;
> +static bool
> +find_engine_in_map(const intel_engine_t *engine, struct intel_engines *engines, unsigned int *idx)
> +{
> +	igt_assert(idx);
> +	for (unsigned int i = 0; i < engines->nr_engines; ++i)
> +		if (are_equal_engines(engine, &engines->engines[i])) {
> +			*idx = i;
> +			return true;
>   		}
> -	}
>   
> -	igt_assert(found_physical);
> -	return hwe;
> +	return false;
>   }
>   
> -static struct drm_xe_engine_class_instance
> -xe_get_default_engine(void)
> +static bool engine_matches_filter(const intel_engine_t *engine, const intel_engine_t *filter)
>   {
> -	struct drm_xe_engine_class_instance default_hwe, *hwe;
> +	return (filter->engine_class == DEFAULT_ID ||
> +		filter->engine_class == engine->engine_class) &&
> +	       (filter->engine_instance == DEFAULT_ID ||
> +		filter->engine_instance == engine->engine_instance) &&
> +	       (filter->gt_id == DEFAULT_ID ||
> +		filter->gt_id == engine->gt_id);
> +}
>   
> -	/* select RCS0 | CCS0 or first available engine */
> -	default_hwe = xe_engine(fd, 0)->instance;
> -	xe_for_each_engine(fd, hwe) {
> -		if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> -		     hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) &&
> -		    hwe->engine_instance == 0) {
> -			default_hwe = *hwe;
> -			break;
> -		}
> +#define for_each_matching_engine(__engine, __filter, __engines) \
> +	for (unsigned int __i = 0; __i < __engines->nr_engines && \
> +	     (__engine = &__engines->engines[__i]); __i++) \
> +		for_if(engine_matches_filter(__engine, __filter))
> +
> +static unsigned int
> +append_matching_engines(const intel_engine_t *filter, struct intel_engines *engines)
> +{
> +	unsigned int prev_nr_engines;
> +	struct intel_engines *all = query_engines();
> +	intel_engine_t *engine;
> +
> +	igt_assert(engines);
> +	prev_nr_engines = engines->nr_engines;
> +
> +	for_each_matching_engine(engine, filter, all) {
> +		engines->nr_engines++;
> +		engines->engines = realloc(engines->engines,
> +					   engines->nr_engines * sizeof(intel_engine_t));
> +		igt_assert(engines->engines);
> +		engines->engines[engines->nr_engines - 1] = *engine;
>   	}
>   
> -	return default_hwe;
> +	return engines->nr_engines - prev_nr_engines;
> +}
> +
> +static intel_engine_t get_default_engine(void)
> +{
> +	struct intel_engines *all_engines = query_engines();
> +	const intel_engine_t filters[] = {
> +		{RCS, DEFAULT_ID, DEFAULT_ID},
> +		{CCS, DEFAULT_ID, DEFAULT_ID},
> +		{DEFAULT_ID, DEFAULT_ID, DEFAULT_ID},
> +		{INVALID_ID}
> +	}, *filter, *default_engine;
> +
> +	for (filter = filters; is_valid_engine(filter); filter++)
> +		for_each_matching_engine(default_engine, filter, all_engines)
> +			return *default_engine;
> +
> +	igt_assert(0);
> +}
> +
> +static intel_engine_t resolve_to_physical_engine_(const intel_engine_t *engine)
> +{
> +	struct intel_engines *all_engines = query_engines();
> +	intel_engine_t *resolved;
> +
> +	igt_assert(engine);
> +	if (is_default_engine(engine))
> +		return get_default_engine();
> +
> +	for_each_matching_engine(resolved, engine, all_engines)
> +		return *resolved;
> +
> +	return (intel_engine_t){INVALID_ID};
> +}
> +
> +static void resolve_to_physical_engine(intel_engine_t *engine)
> +{
> +	*engine = resolve_to_physical_engine_(engine);
> +	igt_assert(is_valid_engine(engine));
>   }
>   
>   static int parse_engine_map(struct w_step *step, const char *_str)
>   {
>   	char *token, *tctx = NULL, *tstart = (char *)_str;
> +	intel_engine_t engine;
>   
>   	while ((token = strtok_r(tstart, "|", &tctx))) {
> -		enum intel_engine_id engine;
> -		unsigned int add;
> -
>   		tstart = NULL;
>   
> -		if (!strcmp(token, "DEFAULT"))
> +		engine = str_to_engine(token);
> +		if (!is_valid_engine(&engine) || is_default_engine(&engine))
>   			return -1;
>   
> -		engine = str_to_engine(token);
> -		if ((int)engine < 0)
> +		if (!append_matching_engines(&engine, &step->engine_map))
>   			return -1;
> +	}
> +
> +	return 0;
> +}
>   
> -		if (engine != VCS && engine != VCS1 && engine != VCS2 &&
> -		    engine != RCS)
> -			return -1; /* TODO */
> +static int parse_bond_engines(struct w_step *step, const char *_str)
> +{
> +	char *token, *tctx = NULL, *tstart = (char *)_str;
> +	intel_engine_t engine;
>   
> -		add = engine == VCS ? num_engines_in_class(VCS) : 1;
> -		step->engine_map_count += add;
> -		step->engine_map = realloc(step->engine_map,
> -					   step->engine_map_count *
> -					   sizeof(step->engine_map[0]));
> +	while ((token = strtok_r(tstart, "|", &tctx))) {
> +		tstart = NULL;
>   
> -		if (engine != VCS)
> -			step->engine_map[step->engine_map_count - add] = engine;
> -		else
> -			fill_engines_id_class(&step->engine_map[step->engine_map_count - add], VCS);
> +		engine = str_to_engine(token);
> +		if (append_matching_engines(&engine, &step->bond.mask) != 1)
> +			return -1;
>   	}
>   
>   	return 0;
> @@ -854,26 +915,6 @@ static int parse_working_set(struct working_set *set, char *str)
>   	return 0;
>   }
>   
> -static uint64_t engine_list_mask(const char *_str)
> -{
> -	uint64_t mask = 0;
> -
> -	char *token, *tctx = NULL, *tstart = (char *)_str;
> -
> -	while ((token = strtok_r(tstart, "|", &tctx))) {
> -		enum intel_engine_id engine = str_to_engine(token);
> -
> -		if ((int)engine < 0 || engine == DEFAULT || engine == VCS)
> -			return 0;
> -
> -		mask |= 1 << engine;
> -
> -		tstart = NULL;
> -	}
> -
> -	return mask;
> -}
> -
>   static unsigned long
>   allocate_working_set(struct workload *wrk, struct working_set *set);
>   
> @@ -1145,18 +1186,19 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
>   							  "Invalid context at step %u!\n",
>   							  nr_steps);
>   					} else if (nr == 1) {
> -						step.bond_mask = engine_list_mask(field);
> -						check_arg(step.bond_mask == 0,
> -							"Invalid siblings list at step %u!\n",
> -							nr_steps);
> +						tmp = parse_bond_engines(&step, field);
> +						check_arg(tmp < 0,
> +							  "Invalid siblings list at step %u!\n",
> +							  nr_steps);
>   					} else if (nr == 2) {
> -						tmp = str_to_engine(field);
> -						check_arg(tmp <= 0 ||
> -							  tmp == VCS ||
> -							  tmp == DEFAULT,
> +						struct intel_engines engines;
> +
> +						step.bond.master = str_to_engine(field);
> +						check_arg(append_matching_engines(&step.bond.master,
> +										  &engines) != 1,
>   							  "Invalid master engine at step %u!\n",
>   							  nr_steps);
> -						step.bond_master = tmp;
> +						free(engines.engines);
>   					}
>   
>   					nr++;
> @@ -1214,13 +1256,11 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
>   		if (field) {
>   			fstart = NULL;
>   
> -			i = str_to_engine(field);
> -			check_arg(i < 0,
> +			step.engine = str_to_engine(field);
> +			check_arg(!is_valid_engine(&step.engine),
>   				  "Invalid engine id at step %u!\n", nr_steps);
>   
>   			valid++;
> -
> -			step.engine = i;
>   		}
>   
>   		field = strtok_r(fstart, ".", &fctx);
> @@ -1266,7 +1306,7 @@ add_step:
>   			step.delay = __duration(step.delay, scale_time);
>   
>   		step.idx = nr_steps++;
> -		step.request = -1;
> +		step.rq_link.next = step.rq_link.prev = NULL;
>   		steps = realloc(steps, sizeof(step) * nr_steps);
>   		igt_assert(steps);
>   
> @@ -1386,9 +1426,9 @@ add_step:
>   static struct workload *
>   clone_workload(struct workload *_wrk)
>   {
> +	int nr_engines = query_engines()->nr_engines;
>   	struct workload *wrk;
>   	struct w_step *w;
> -	int i;
>   
>   	wrk = malloc(sizeof(*wrk));
>   	igt_assert(wrk);
> @@ -1423,8 +1463,12 @@ clone_workload(struct workload *_wrk)
>   		}
>   	}
>   
> -	for (i = 0; i < NUM_ENGINES; i++)
> -		IGT_INIT_LIST_HEAD(&wrk->requests[i]);
> +	wrk->requests = calloc(nr_engines, sizeof(*wrk->requests));
> +	igt_assert(wrk->requests);
> +	wrk->nrequest = calloc(nr_engines, sizeof(*wrk->nrequest));
> +	igt_assert(wrk->nrequest);
> +	while (--nr_engines >= 0)
> +		IGT_INIT_LIST_HEAD(&wrk->requests[nr_engines]);
>   
>   	return wrk;
>   }
> @@ -1451,37 +1495,32 @@ __get_ctx(struct workload *wrk, const struct w_step *w)
>   	return &wrk->ctx_list[w->context];
>   }
>   
> -static uint32_t mmio_base(int i915, enum intel_engine_id engine, int gen)
> +static uint32_t mmio_base(int i915, const intel_engine_t *engine, int gen)
>   {
> -	const char *name;
> +	char name[16];
>   
>   	if (gen >= 11)
>   		return 0;
>   
> -	switch (engine) {
> -	case NUM_ENGINES:
> +	switch (engine->engine_class) {
>   	default:
>   		return 0;
>   
> -	case DEFAULT:
> +	case DEFAULT_ID:
>   	case RCS:
> -		name = "rcs0";
> +		snprintf(name, sizeof(name), "rcs%u", engine->engine_instance);
>   		break;
> -
>   	case BCS:
> -		name = "bcs0";
> +		snprintf(name, sizeof(name), "bcs%u", engine->engine_instance);
>   		break;
> -
>   	case VCS:
> -	case VCS1:
> -		name = "vcs0";
> -		break;
> -	case VCS2:
> -		name = "vcs1";
> +		snprintf(name, sizeof(name), "vcs%u", engine->engine_instance);
>   		break;
> -
>   	case VECS:
> -		name = "vecs0";
> +		snprintf(name, sizeof(name), "vecs%u", engine->engine_instance);
> +		break;
> +	case CCS:
> +		snprintf(name, sizeof(name), "ccs%u", engine->engine_instance);
>   		break;
>   	}
>   
> @@ -1491,7 +1530,7 @@ static uint32_t mmio_base(int i915, enum intel_engine_id engine, int gen)
>   static unsigned int create_bb(struct w_step *w, int self)
>   {
>   	const int gen = intel_gen(intel_get_drm_devid(fd));
> -	const uint32_t base = mmio_base(fd, w->engine, gen);
> +	const uint32_t base = mmio_base(fd, &w->engine, gen);
>   #define CS_GPR(x) (base + 0x600 + 8 * (x))
>   #define TIMESTAMP (base + 0x3a8)
>   	const int use_64b = gen >= 8;
> @@ -1574,47 +1613,10 @@ static unsigned int create_bb(struct w_step *w, int self)
>   	return r;
>   }
>   
> -static const unsigned int eb_engine_map[NUM_ENGINES] = {
> -	[DEFAULT] = I915_EXEC_DEFAULT,
> -	[RCS] = I915_EXEC_RENDER,
> -	[BCS] = I915_EXEC_BLT,
> -	[VCS] = I915_EXEC_BSD,
> -	[VCS1] = I915_EXEC_BSD | I915_EXEC_BSD_RING1,
> -	[VCS2] = I915_EXEC_BSD | I915_EXEC_BSD_RING2,
> -	[VECS] = I915_EXEC_VEBOX
> -};
> -
>   static void
> -eb_set_engine(struct drm_i915_gem_execbuffer2 *eb, enum intel_engine_id engine)
> +eb_update_flags(struct workload *wrk, struct w_step *w)
>   {
> -	eb->flags = eb_engine_map[engine];
> -}
> -
> -static unsigned int
> -find_engine_in_map(struct ctx *ctx, enum intel_engine_id engine)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ctx->engine_map_count; i++) {
> -		if (ctx->engine_map[i] == engine)
> -			return i + 1;
> -	}
> -
> -	igt_assert(ctx->load_balance);
> -	return 0;
> -}
> -
> -static void
> -eb_update_flags(struct workload *wrk, struct w_step *w,
> -		enum intel_engine_id engine)
> -{
> -	struct ctx *ctx = __get_ctx(wrk, w);
> -
> -	if (ctx->engine_map)
> -		w->i915.eb.flags = find_engine_in_map(ctx, engine);
> -	else
> -		eb_set_engine(&w->i915.eb, engine);
> -
> +	w->i915.eb.flags = w->engine_idx;
>   	w->i915.eb.flags |= I915_EXEC_HANDLE_LUT;
>   	w->i915.eb.flags |= I915_EXEC_NO_RELOC;
>   
> @@ -1633,19 +1635,9 @@ static struct xe_exec_queue *
>   xe_get_eq(struct workload *wrk, const struct w_step *w)
>   {
>   	struct ctx *ctx = __get_ctx(wrk, w);
> -	struct xe_exec_queue *eq;
>   
> -	if (ctx->engine_map) {
> -		igt_assert_eq(ctx->xe.nr_queues, 1);
> -		igt_assert(ctx->xe.queue_list[0].id);
> -		eq = &ctx->xe.queue_list[0];
> -	} else {
> -		igt_assert(w->engine >= 0 && w->engine < ctx->xe.nr_queues);
> -		igt_assert(ctx->xe.queue_list[w->engine].id);
> -		eq = &ctx->xe.queue_list[w->engine];
> -	}
> -
> -	return eq;
> +	igt_assert_lt(w->engine_idx, ctx->xe.nr_queues);
> +	return &ctx->xe.queue_list[w->engine_idx];
>   }
>   
>   static struct xe_vm *
> @@ -1669,7 +1661,6 @@ static uint32_t alloc_bo(int i915, unsigned long *size)
>   static void
>   alloc_step_batch(struct workload *wrk, struct w_step *w)
>   {
> -	enum intel_engine_id engine = w->engine;
>   	struct dep_entry *dep;
>   	unsigned int j = 0;
>   	unsigned int nr_obj = 2 + w->data_deps.nr;
> @@ -1724,7 +1715,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>   	w->i915.eb.buffer_count = j + 1;
>   	w->i915.eb.rsvd1 = get_ctxid(wrk, w);
>   
> -	eb_update_flags(wrk, w, engine);
> +	eb_update_flags(wrk, w);
>   #ifdef DEBUG
>   	printf("%u: %u:|", w->idx, w->i915.eb.buffer_count);
>   	for (i = 0; i <= j; i++)
> @@ -1853,22 +1844,6 @@ static void vm_destroy(int i915, uint32_t vm_id)
>   	igt_assert_eq(__vm_destroy(i915, vm_id), 0);
>   }
>   
> -static unsigned int
> -find_engine(struct i915_engine_class_instance *ci, unsigned int count,
> -	    enum intel_engine_id engine)
> -{
> -	struct i915_engine_class_instance e = get_engine(engine);
> -	unsigned int i;
> -
> -	for (i = 0; i < count; i++, ci++) {
> -		if (!memcmp(&e, ci, sizeof(*ci)))
> -			return i;
> -	}
> -
> -	igt_assert(0);
> -	return 0;
> -}
> -
>   static struct drm_i915_gem_context_param_sseu get_device_sseu(void)
>   {
>   	struct drm_i915_gem_context_param param = { };
> @@ -1892,7 +1867,7 @@ set_ctx_sseu(struct ctx *ctx, uint64_t slice_mask)
>   	if (slice_mask == -1)
>   		slice_mask = device_sseu.slice_mask;
>   
> -	if (ctx->engine_map && ctx->load_balance) {
> +	if (ctx->engine_map.nr_engines && ctx->load_balance) {
>   		sseu.flags = I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX;
>   		sseu.engine.engine_class = I915_ENGINE_CLASS_INVALID;
>   		sseu.engine.engine_instance = 0;
> @@ -2102,9 +2077,8 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>   
>   			if (w->type == ENGINE_MAP) {
>   				ctx->engine_map = w->engine_map;
> -				ctx->engine_map_count = w->engine_map_count;
>   			} else if (w->type == LOAD_BALANCE) {
> -				if (!ctx->engine_map) {
> +				if (!ctx->engine_map.nr_engines) {
>   					wsim_err("Load balancing needs an engine map!\n");
>   					return 1;
>   				}
> @@ -2123,10 +2097,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>   						     ctx->bond_count *
>   						     sizeof(struct bond));
>   				igt_assert(ctx->bonds);
> -				ctx->bonds[ctx->bond_count - 1].mask =
> -					w->bond_mask;
> -				ctx->bonds[ctx->bond_count - 1].master =
> -					w->bond_master;
> +				ctx->bonds[ctx->bond_count - 1] = w->bond;
>   			}
>   		}
>   	}
> @@ -2134,7 +2105,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>   	/*
>   	 * Create and configure contexts.
>   	 */
> -	for_each_ctx(ctx, wrk) {
> +	__for_each_ctx(ctx, wrk, ctx_idx) {
>   		struct drm_i915_gem_context_create_ext_setparam ext = {
>   			.base.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
>   			.param.param = I915_CONTEXT_PARAM_VM,
> @@ -2176,19 +2147,40 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>   
>   		__configure_context(ctx_id, wrk->prio);
>   
> -		if (ctx->engine_map) {
> +		if (ctx->engine_map.nr_engines) {
>   			struct i915_context_param_engines *set_engines =
> -				alloca0(sizeof_param_engines(ctx->engine_map_count + 1));
> +				alloca0(sizeof_param_engines(ctx->engine_map.nr_engines + 1));
>   			struct i915_context_engines_load_balance *load_balance =
> -				alloca0(sizeof_load_balance(ctx->engine_map_count));
> +				alloca0(sizeof_load_balance(ctx->engine_map.nr_engines));
>   			struct drm_i915_gem_context_param param = {
>   				.ctx_id = ctx_id,
>   				.param = I915_CONTEXT_PARAM_ENGINES,
> -				.size = sizeof_param_engines(ctx->engine_map_count + 1),
> +				.size = sizeof_param_engines(ctx->engine_map.nr_engines + 1),
>   				.value = to_user_pointer(set_engines),
>   			};
>   			struct i915_context_engines_bond *last = NULL;
>   
> +			/* update engine_idx and request_idx */
> +			for_each_w_step(w, wrk) {
> +				if (w->context != ctx_idx)
> +					continue;
> +				if (w->type == BATCH) {
> +					unsigned int map_idx = 0;
> +
> +					if (find_engine_in_map(&w->engine, &ctx->engine_map,
> +								&map_idx))
> +						/* 0 is virtual, map indexes are shifted by one */
> +						w->engine_idx = map_idx + 1;
> +					else
> +						igt_assert(ctx->load_balance);
> +
> +					igt_assert(find_engine_in_map(
> +							&ctx->engine_map.engines[map_idx],
> +							query_engines(),
> +							&w->request_idx));
> +				}
> +			}
> +
>   			if (ctx->load_balance) {
>   				set_engines->extensions =
>   					to_user_pointer(load_balance);
> @@ -2196,11 +2188,11 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>   				load_balance->base.name =
>   					I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE;
>   				load_balance->num_siblings =
> -					ctx->engine_map_count;
> +					ctx->engine_map.nr_engines;
>   
> -				for (j = 0; j < ctx->engine_map_count; j++)
> +				for (j = 0; j < ctx->engine_map.nr_engines; j++)
>   					load_balance->engines[j] =
> -						get_engine(ctx->engine_map[j]);
> +						to_i915_engine_class(&ctx->engine_map.engines[j]);
>   			}
>   
>   			/* Reserve slot for virtual engine. */
> @@ -2209,34 +2201,31 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>   			set_engines->engines[0].engine_instance =
>   				I915_ENGINE_CLASS_INVALID_NONE;
>   
> -			for (j = 1; j <= ctx->engine_map_count; j++)
> +			for (j = 1; j <= ctx->engine_map.nr_engines; j++)
>   				set_engines->engines[j] =
> -					get_engine(ctx->engine_map[j - 1]);
> +					to_i915_engine_class(&ctx->engine_map.engines[j - 1]);
>   
>   			last = NULL;
>   			for (j = 0; j < ctx->bond_count; j++) {
> -				unsigned long mask = ctx->bonds[j].mask;
> +				struct intel_engines *mask = &ctx->bonds[j].mask;
>   				struct i915_context_engines_bond *bond =
> -					alloca0(sizeof_engines_bond(__builtin_popcount(mask)));
> +					alloca0(sizeof_engines_bond(mask->nr_engines));
>   				unsigned int b, e;
>   
>   				bond->base.next_extension = to_user_pointer(last);
>   				bond->base.name = I915_CONTEXT_ENGINES_EXT_BOND;
>   
>   				bond->virtual_index = 0;
> -				bond->master = get_engine(ctx->bonds[j].master);
> +				bond->master = to_i915_engine_class(&ctx->bonds[j].master);
>   
> -				for (b = 0, e = 0; mask; e++, mask >>= 1) {
> +				for (b = 0, e = 0; e < mask->nr_engines; e++) {
>   					unsigned int idx;
>   
> -					if (!(mask & 1))
> -						continue;
> +					igt_assert(find_engine_in_map(&mask->engines[e],
> +								      &ctx->engine_map,
> +								      &idx));
>   
> -					idx = find_engine(&set_engines->engines[1],
> -							  ctx->engine_map_count,
> -							  e);
> -					bond->engines[b++] =
> -						set_engines->engines[1 + idx];
> +					bond->engines[b++] = set_engines->engines[1 + idx];
>   				}
>   
>   				last = bond;
> @@ -2244,6 +2233,20 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>   			load_balance->base.next_extension = to_user_pointer(last);
>   
>   			gem_context_set_param(fd, &param);
> +		} else {
> +			/* update engine_idx and request_idx */
> +			for_each_w_step(w, wrk) {
> +				if (w->context != ctx_idx)
> +					continue;
> +				if (w->type == BATCH) {
> +					w->engine_idx = to_i915_legacy_ring(&w->engine);
> +					resolve_to_physical_engine(&w->engine);
> +					igt_assert(find_engine_in_map(
> +							&w->engine,
> +							query_engines(),
> +							&w->request_idx));
> +				}
> +			}
>   		}
>   
>   		if (wrk->sseu) {
> @@ -2281,9 +2284,8 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>   				continue;
>   			if (w->type == ENGINE_MAP) {
>   				ctx->engine_map = w->engine_map;
> -				ctx->engine_map_count = w->engine_map_count;
>   			} else if (w->type == LOAD_BALANCE) {
> -				if (!ctx->engine_map) {
> +				if (!ctx->engine_map.nr_engines) {
>   					wsim_err("Load balancing needs an engine map!\n");
>   					return 1;
>   				}
> @@ -2292,15 +2294,15 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>   		}
>   
>   		/* create exec queue for each referenced engine */
> -		if (ctx->engine_map) {
> +		if (ctx->engine_map.nr_engines) {
>   			ctx->xe.nr_queues = 1;
>   			ctx->xe.queue_list = calloc(ctx->xe.nr_queues, sizeof(*ctx->xe.queue_list));
>   			igt_assert(ctx->xe.queue_list);
>   			eq = &ctx->xe.queue_list[ctx->xe.nr_queues - 1];
> -			eq->nr_hwes = ctx->engine_map_count;
> +			eq->nr_hwes = ctx->engine_map.nr_engines;
>   			eq->hwe_list = calloc(eq->nr_hwes, sizeof(*eq->hwe_list));
>   			for (i = 0; i < eq->nr_hwes; ++i) {
> -				eq->hwe_list[i] = xe_get_engine(ctx->engine_map[i]);
> +				eq->hwe_list[i] = ctx->engine_map.engines[i];
>   
>   				/* check no mixing classes and no duplicates */
>   				for (int j = 0; j < i; ++j) {
> @@ -2322,8 +2324,10 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>   				}
>   
>   				if (verbose > 3)
> -					printf("%u ctx[%d] %s [%u:%u:%u]\n",
> -						id, ctx_idx, ring_str_map[ctx->engine_map[i]],
> +					printf("%u ctx[%d] %s [%d:%d:%d]\n",
> +						id, ctx_idx,
> +						intel_engine_class_string(
> +							ctx->engine_map.engines[i].engine_class),
>   						eq->hwe_list[i].engine_class,
>   						eq->hwe_list[i].engine_instance,
>   						eq->hwe_list[i].gt_id);
> @@ -2331,41 +2335,56 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>   
>   			xe_exec_queue_create_(ctx, eq);
>   		} else {
> -			int engine_classes[NUM_ENGINES] = {};
> -
> -			ctx->xe.nr_queues = NUM_ENGINES;
> -			ctx->xe.queue_list = calloc(ctx->xe.nr_queues, sizeof(*ctx->xe.queue_list));
> -
> +			/* create engine_map, update engine_idx */
>   			for_each_w_step(w, wrk) {
>   				if (w->context != ctx_idx)
>   					continue;
> -				if (w->type == BATCH)
> -					engine_classes[w->engine]++;
> +				if (w->type == BATCH) {
> +					resolve_to_physical_engine(&w->engine);
> +					if (!find_engine_in_map(&w->engine, &ctx->engine_map,
> +								&w->engine_idx)) {
> +						igt_assert_eq(1, append_matching_engines(&w->engine,
> +										&ctx->engine_map));
> +						w->engine_idx = ctx->engine_map.nr_engines - 1;
> +					}
> +				}
>   			}
>   
> -			for (i = 0; i < NUM_ENGINES; i++) {
> -				if (engine_classes[i]) {
> -					eq = &ctx->xe.queue_list[i];
> -					eq->nr_hwes = 1;
> -					eq->hwe_list = calloc(1, sizeof(*eq->hwe_list));
> +			/* skip not referenced context */
> +			if (!ctx->engine_map.nr_engines)
> +				continue;
>   
> -					if (i == DEFAULT)
> -						eq->hwe_list[0] = xe_get_default_engine();
> -					else if (i == VCS)
> -						eq->hwe_list[0] = xe_get_engine(VCS1);
> -					else
> -						eq->hwe_list[0] = xe_get_engine(i);
> +			ctx->xe.nr_queues = ctx->engine_map.nr_engines;
> +			ctx->xe.queue_list = calloc(ctx->xe.nr_queues, sizeof(*ctx->xe.queue_list));
>   
> -					if (verbose > 3)
> -						printf("%u ctx[%d] %s [%u:%u:%u]\n",
> -							id, ctx_idx, ring_str_map[i],
> -							eq->hwe_list[0].engine_class,
> -							eq->hwe_list[0].engine_instance,
> -							eq->hwe_list[0].gt_id);
> +			for (i = 0; i < ctx->xe.nr_queues; i++) {
> +				eq = &ctx->xe.queue_list[i];
> +				eq->nr_hwes = 1;
> +				eq->hwe_list = calloc(1, sizeof(*eq->hwe_list));
> +				eq->hwe_list[0] = ctx->engine_map.engines[i];
>   
> -					xe_exec_queue_create_(ctx, eq);
> -				}
> -				engine_classes[i] = 0;
> +				if (verbose > 3)
> +					printf("%u ctx[%d] %s [%d:%d:%d]\n",
> +						id, ctx_idx,
> +						intel_engine_class_string(
> +							ctx->engine_map.engines[i].engine_class),
> +						eq->hwe_list[0].engine_class,
> +						eq->hwe_list[0].engine_instance,
> +						eq->hwe_list[0].gt_id);
> +
> +				xe_exec_queue_create_(ctx, eq);
> +			}
> +		}
> +
> +		/* update request_idx */
> +		for_each_w_step(w, wrk) {
> +			if (w->context != ctx_idx)
> +				continue;
> +			if (w->type == BATCH) {
> +				igt_assert(find_engine_in_map(
> +						&ctx->engine_map.engines[w->engine_idx],
> +						query_engines(),
> +						&w->request_idx));
>   			}
>   		}
>   	}
> @@ -2577,12 +2596,12 @@ static void do_xe_exec(struct workload *wrk, struct w_step *w)
>   }
>   
>   static void
> -do_eb(struct workload *wrk, struct w_step *w, enum intel_engine_id engine)
> +do_eb(struct workload *wrk, struct w_step *w)
>   {
>   	struct dep_entry *dep;
>   	unsigned int i;
>   
> -	eb_update_flags(wrk, w, engine);
> +	eb_update_flags(wrk, w);
>   	update_bb_start(wrk, w);
>   
>   	for_each_dep(dep, w->fence_deps) {
> @@ -2656,7 +2675,6 @@ static void *run_workload(void *data)
>   		clock_gettime(CLOCK_MONOTONIC, &repeat_start);
>   
>   		for_each_w_step(w, wrk) {
> -			enum intel_engine_id engine = w->engine;
>   			int do_sleep = 0;
>   
>   			if (!wrk->run)
> @@ -2775,15 +2793,14 @@ static void *run_workload(void *data)
>   			if (is_xe)
>   				do_xe_exec(wrk, w);
>   			else
> -				do_eb(wrk, w, engine);
> +				do_eb(wrk, w);
>   
> -			if (w->request != -1) {
> +			if (w->rq_link.next) {
>   				igt_list_del(&w->rq_link);
> -				wrk->nrequest[w->request]--;
> +				wrk->nrequest[w->request_idx]--;
>   			}
> -			w->request = engine;
> -			igt_list_add_tail(&w->rq_link, &wrk->requests[engine]);
> -			wrk->nrequest[engine]++;
> +			igt_list_add_tail(&w->rq_link, &wrk->requests[w->request_idx]);
> +			wrk->nrequest[w->request_idx]++;
>   
>   			if (!wrk->run)
>   				break;
> @@ -2792,17 +2809,16 @@ static void *run_workload(void *data)
>   				w_step_sync(w);
>   
>   			if (qd_throttle > 0) {
> -				while (wrk->nrequest[engine] > qd_throttle) {
> +				while (wrk->nrequest[w->request_idx] > qd_throttle) {
>   					struct w_step *s;
>   
> -					s = igt_list_first_entry(&wrk->requests[engine],
> +					s = igt_list_first_entry(&wrk->requests[w->request_idx],
>   								 s, rq_link);
>   
>   					w_step_sync(s);
>   
> -					s->request = -1;
>   					igt_list_del(&s->rq_link);
> -					wrk->nrequest[engine]--;
> +					wrk->nrequest[w->request_idx]--;
>   				}
>   			}
>   		}
> @@ -2831,7 +2847,7 @@ static void *run_workload(void *data)
>   		}
>   	}
>   
> -	for (int i = 0; i < NUM_ENGINES; i++) {
> +	for (int i = query_engines()->nr_engines; --i >= 0;) {
>   		if (!wrk->nrequest[i])
>   			continue;
>   
