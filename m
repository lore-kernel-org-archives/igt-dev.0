Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3E4CA0EED
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 07:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B868210E3DA;
	Mon, 25 Aug 2025 07:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/juNJIZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E2210E3DA
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 07:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756107133; x=1787643133;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NgiPIKc9fdPLIYA4VwWod9gX0B6y2O4lsM8iSzCTj5g=;
 b=A/juNJIZizCzGITnHAkLlC0DQ5QrfIGWYXYj4q/II1mDzX5w4Cn38C78
 jO6MuVOJ0u89xJrkzAqxMLU0u5OL+UozOuMz4PcxHjlN1tD79LpO8Fbek
 6RXxpFAAZWHm2ZSNWWztHyvLrnLh47gi0cwDYi6laUw5gTFKjZu9Oc+d9
 wx+N+OEdC7QKfCk5DRkAyDWygLD6UK08qmWsTx6OAAJC/jWqj0+uD3oEl
 krX+ZB3sWRESa7p8d4du2toF4V1A0PXs15ffMSXTg17uZaqC1htUOrdZm
 34smJ3Fv5wCIBulid7AFistVtCFA4G4xXZFnI+RIfpQj83mnCGOF1bKPi g==;
X-CSE-ConnectionGUID: bprnF4b7Q020TAuRQAWU1w==
X-CSE-MsgGUID: Na5K093+TjGz+U0ONdHing==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58383316"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58383316"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 00:31:35 -0700
X-CSE-ConnectionGUID: rE/XoxJbRl2j8EieOjvveA==
X-CSE-MsgGUID: v9y99VfsQUKM0/3fWj0P/A==
X-ExtLoop1: 1
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.0.246])
 ([10.246.0.246])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 00:31:34 -0700
Message-ID: <baf56d24-517a-49ed-83f1-5adc4b3a429f@linux.intel.com>
Date: Mon, 25 Aug 2025 09:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/3] tests/intel/xe_sriov_scheduling: Compute
 throughput from completion timestamps
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250819165045.467613-1-marcin.bernatowicz@linux.intel.com>
 <20250819165045.467613-3-marcin.bernatowicz@linux.intel.com>
 <f77e940f-83fb-45a2-813b-8cbf565590ba@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <f77e940f-83fb-45a2-813b-8cbf565590ba@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 8/22/2025 3:44 PM, Laguna, Lukasz wrote:
> 
> On 8/19/2025 18:50, Marcin Bernatowicz wrote:
>> Make throughput comparisons robust under overlap/prefill and CPU jitter
>> by basing the window on actual completion times rather than thread 
>> timing.
>>
>> - Record per-sample complete_ts[] and per-slot submit_ts[].
>> - Build the common window from completions: [max(first), min(last)].
>> - Compute throughput as count/window within that window.
>> - Push durations as submit->completion (complete_ts − submit_ts) and
>> print "mean submit->signal latency".
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> ---
>>   tests/intel/xe_sriov_scheduling.c | 65 ++++++++++++++++++-------------
>>   1 file changed, 37 insertions(+), 28 deletions(-)
>>
>> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/ 
>> xe_sriov_scheduling.c
>> index 28a2b6e26..97263cbd2 100644
>> --- a/tests/intel/xe_sriov_scheduling.c
>> +++ b/tests/intel/xe_sriov_scheduling.c
>> @@ -39,6 +39,7 @@ struct subm_stats {
>>       igt_stats_t samples;
>>       uint64_t start_timestamp;
>>       uint64_t end_timestamp;
>> +    uint64_t *complete_ts; /* absolute completion timestamps (ns) */
>>       unsigned int num_early_finish;
>>       unsigned int concurrent_execs;
>>       double concurrent_rate;
>> @@ -54,13 +55,14 @@ struct subm {
>>       uint32_t vm;
>>       struct drm_xe_engine_class_instance hwe;
>>       uint32_t exec_queue_id;
>> -    /* K slots (K BOs / addresses / mapped spinners / done fences) */
>> +    /* K slots (K BOs / addresses / mapped spinners / done fences / 
>> submit timestamps) */
>>       unsigned int slots;
>>       uint64_t *addr;
>>       uint32_t *bo;
>>       size_t bo_size;
>>       struct xe_spin **spin;
>>       uint32_t *done_fence;
>> +    uint64_t *submit_ts;
>>       struct drm_xe_sync sync[1];
>>       struct drm_xe_exec exec;
>>   };
>> @@ -101,8 +103,9 @@ static void subm_init(struct subm *s, int fd, int 
>> vf_num, uint64_t addr,
>>       s->bo = calloc(s->slots, sizeof(*s->bo));
>>       s->spin = calloc(s->slots, sizeof(*s->spin));
>>       s->done_fence = calloc(s->slots, sizeof(*s->done_fence));
>> +    s->submit_ts = calloc(s->slots, sizeof(*s->submit_ts));
>> -    igt_assert(s->addr && s->bo && s->spin && s->done_fence);
>> +    igt_assert(s->addr && s->bo && s->spin && s->done_fence && s- 
>> >submit_ts);
>>       base = addr ? addr : 0x1a0000;
>>       stride = ALIGN(s->bo_size, 0x10000);
>> @@ -137,6 +140,7 @@ static void subm_fini(struct subm *s)
>>       free(s->bo);
>>       free(s->spin);
>>       free(s->done_fence);
>> +    free(s->submit_ts);
>>   }
>>   static void subm_workload_init(struct subm *s, struct subm_work_desc 
>> *work)
>> @@ -158,6 +162,7 @@ static void subm_wait_slot(struct subm *s, 
>> unsigned int slot, uint64_t abs_timeo
>>   static void subm_exec_slot(struct subm *s, unsigned int slot)
>>   {
>> +    struct timespec tv;
>>       int nsync = 0;
>>       syncobj_reset(s->fd, &s->done_fence[slot], 1);
>> @@ -169,6 +174,8 @@ static void subm_exec_slot(struct subm *s, 
>> unsigned int slot)
>>       s->exec.num_syncs = nsync;
>>       s->exec.syncs = to_user_pointer(&s->sync[0]);
>>       s->exec.address = s->addr[slot];
>> +    igt_gettime(&tv);
>> +    s->submit_ts[slot] = (uint64_t)tv.tv_sec * (uint64_t)NSEC_PER_SEC 
>> + (uint64_t)tv.tv_nsec;
>>       xe_exec(s->fd, &s->exec);
>>   }
>> @@ -214,9 +221,11 @@ static void subm_exec_loop(struct subm *s, struct 
>> subm_stats *stats,
>>       for (i = 0; i < s->work.repeats; ++i) {
>>           unsigned int slot = i % inflight;
>> -        igt_gettime(&tv);
>>           subm_wait_slot(s, slot, INT64_MAX);
>> -        igt_stats_push(&stats->samples, igt_nsec_elapsed(&tv));
>> +        igt_gettime(&tv);
>> +        stats->complete_ts[i] = (uint64_t)tv.tv_sec * 
>> (uint64_t)NSEC_PER_SEC +
>> +                    (uint64_t)tv.tv_nsec;
>> +        igt_stats_push(&stats->samples, stats->complete_ts[i] - s- 
>> >submit_ts[slot]);
>>           if (!subm_is_work_complete(s, slot)) {
>>               stats->num_early_finish++;
>> @@ -386,16 +395,22 @@ static void 
>> compute_common_time_frame_stats(struct subm_set *set)
>>       struct subm_stats *stats;
>>       uint64_t common_start = 0;
>>       uint64_t common_end = UINT64_MAX;
>> +    uint64_t first_ts, last_ts;
>> -    /* Find the common time frame */
>> +    /* Find common window from completion timestamps */
>>       for (i = 0; i < ndata; i++) {
>>           stats = &data[i].stats;
>> -        if (stats->start_timestamp > common_start)
>> -            common_start = stats->start_timestamp;
>> +        if (!stats->samples.n_values)
>> +            continue;
>> +
>> +        first_ts = stats->complete_ts[0];
>> +        last_ts = stats->complete_ts[stats->samples.n_values - 1];
>> -        if (stats->end_timestamp < common_end)
>> -            common_end = stats->end_timestamp;
>> +        if (first_ts > common_start)
>> +            common_start = first_ts;
>> +        if (last_ts < common_end)
>> +            common_end = last_ts;
>>       }
>>       igt_info("common time frame: [%" PRIu64 ";%" PRIu64 "] %.2fms\n",
>> @@ -406,8 +421,7 @@ static void compute_common_time_frame_stats(struct 
>> subm_set *set)
>>       /* Compute concurrent_rate for each sample set within the common 
>> time frame */
>>       for (i = 0; i < ndata; i++) {
>> -        uint64_t total_samples_duration = 0;
>> -        uint64_t samples_duration_in_common_frame = 0;
>> +        const double window_s = (common_end - common_start) * 1e-9;
>>           stats = &data[i].stats;
>>           stats->concurrent_execs = 0;
>> @@ -415,29 +429,20 @@ static void 
>> compute_common_time_frame_stats(struct subm_set *set)
>>           stats->concurrent_mean = 0.0;
>>           for (j = 0; j < stats->samples.n_values; j++) {
>> -            uint64_t sample_start = stats->start_timestamp + 
>> total_samples_duration;
>> -            uint64_t sample_end = sample_start + stats- 
>> >samples.values_u64[j];
>> +            uint64_t cts = stats->complete_ts[j];
>> -            if (sample_start >= common_start &&
>> -                sample_end <= common_end) {
>> +            if (cts >= common_start && cts <= common_end) {
>>                   stats->concurrent_execs++;
>> -                samples_duration_in_common_frame +=
>> -                    stats->samples.values_u64[j];
>> +                stats->concurrent_mean += stats->samples.values_u64[j];
>>               }
>> -
>> -            total_samples_duration += stats->samples.values_u64[j];
>>           }
>> -        stats->concurrent_rate = samples_duration_in_common_frame ?
>> -                     (double)stats->concurrent_execs /
>> -                         (samples_duration_in_common_frame *
>> -                          1e-9) :
>> -                     0.0;
>> +        stats->concurrent_rate = (window_s > 0.0) ?
>> +                     ((double)stats->concurrent_execs / window_s) : 0.0;
>>           stats->concurrent_mean = stats->concurrent_execs ?
>> -                      (double)samples_duration_in_common_frame /
>> -                          stats->concurrent_execs :
>> -                      0.0;
>> -        igt_info("[%s] Throughput = %.4f execs/s mean duration=%.4fms 
>> nsamples=%d\n",
>> +                     (double)stats->concurrent_mean /
>> +                     stats->concurrent_execs : 0.0;
>> +        igt_info("[%s] Throughput = %.4f execs/s mean submit->signal 
>> latency=%.4fms nsamples=%d\n",
>>                data[i].subm.id, stats->concurrent_rate, stats- 
>> >concurrent_mean * 1e-6,
>>                stats->concurrent_execs);
>>       }
>> @@ -667,6 +672,8 @@ static void throughput_ratio(int pf_fd, int 
>> num_vfs, const struct subm_opts *opt
>>                       .repeats = job_sched_params.num_repeats });
>>           igt_stats_init_with_size(&set->data[n].stats.samples,
>>                        set->data[n].subm.work.repeats);
>> +        set->data[n].stats.complete_ts = calloc(set- 
>> >data[n].subm.work.repeats,
>> +                            sizeof(uint64_t));
> 
> missing free() in subm_set_free_data ?

Missed in patch split, my bad. Thanks for catching.

> 
>>           if (set->sync_method == SYNC_BARRIER)
>>               set->data[n].barrier = &set->barrier;
>>       }
>> @@ -762,6 +769,8 @@ static void nonpreempt_engine_resets(int pf_fd, 
>> int num_vfs,
>>                       .repeats = MIN_NUM_REPEATS });
>>           igt_stats_init_with_size(&set->data[n].stats.samples,
>>                        set->data[n].subm.work.repeats);
>> +        set->data[n].stats.complete_ts = calloc(set- 
>> >data[n].subm.work.repeats,
>> +                            sizeof(uint64_t));
>>           if (set->sync_method == SYNC_BARRIER)
>>               set->data[n].barrier = &set->barrier;
>>       }

