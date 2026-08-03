Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A32C55179
	for <igt-dev@archiver.kernel.org>; Mon,  3 Aug 2026 12:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE9310E320;
	Mon,  3 Aug 2026 12:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9DXViMp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C48710E320
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2026 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785758480; x=1817294480;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=dQqLeVpoaV20KnK40NFTcr0DF3TPeJS+H7BLSqXkA1U=;
 b=d9DXViMpYJNu9E+w2lO0/T200a9dxXxC+OXjkryXgRxTKBAfnIY3/vzc
 E7/1sTgtU1Mz6zey+wcrBAHHjVnsQixynf/ATyoZyz2RYv/2R8NrA9uyd
 KqI4Rb0uZgIQBH9IdGB6fAkTzmdF3dIy1PHv5bh2xr4RsVYIxv9vvc1gO
 BZmOlXIaWYx1MxKkVxM0tJaxIhYBhHlx7l5DaWqmRXOvoTnO+o4bb7yC/
 8+DCfTgdxLTyzd0Rz++XwwGvPk1yx3hkaUiXifmBbVLJjWDgW3fhPDFES
 JgRSJX9Xx/Vx5YB+tpJKhTh6NiTQeNumtNxEmkIeRS5ZkEerftbcLV0m/ g==;
X-CSE-ConnectionGUID: c35qHPYcSoagKKoeG0U9Dw==
X-CSE-MsgGUID: 2GzqwAk+QmqR4cpIoNghfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="90103579"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="90103579"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 05:01:19 -0700
X-CSE-ConnectionGUID: TjKbohz4T32h6n5zWrKHoA==
X-CSE-MsgGUID: xCnxYMjjSM6+s+1LfxcKcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="291133630"
Received: from rbalaar-mobl1.gar.corp.intel.com (HELO [10.247.151.71])
 ([10.247.151.71])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 05:01:18 -0700
Message-ID: <ff12ca0e-60f1-4e54-9b91-f49521655c75@intel.com>
Date: Mon, 3 Aug 2026 17:31:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_dp_linktrain_fallback: Add
 UHBR-to-HBR fallback subtest
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com
References: <20260803080514.687715-1-sowmiya.s@intel.com>
 <52f8c63a-2b4f-4d31-a439-b0c746415d6d@intel.com>
Content-Language: en-US
In-Reply-To: <52f8c63a-2b4f-4d31-a439-b0c746415d6d@intel.com>
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

Re-sending review comments, as above version didn't come up as anticipated.

On 03-08-2026 17:24, Joshi, Kunal1 wrote:
> Hello Sowmiya,
>
> Please find review comments inline,
> I see checkpatch flag below issues please fix those,
>
> 32: ERROR:EXECUTE_PERMISSIONS: do not set execute permissions for 
> source files
> #32: FILE: tests/intel/kms_dp_linktrain_fallback.c
>
> 223: ERROR:SPACING: space required after that ',' (ctx:VxV)
> #223: FILE: tests/intel/kms_dp_linktrain_fallback.c:540:
> + igt_output_name(data->output),prev_link_rate);
>                                                       ^
> total: 2 errors, 0 warnings, 0 checks, 283 lines checked
>
> On 03-08-2026 13:35, Sowmiya S wrote:
>
>> Cover the UHBR (128b/132b) to HBR3 (8b/10b) encoding boundary missed
>> by dp-fallback. Add uhbr-to-hbr-fallback to pin the link at the
>> highest sustainable UHBR rate, force repeated link training failures,
>> and verify the rate drops below UHBR10 (1,000,000 kbps). Stop at
>> that threshold and leave the HBR step-down to dp-fallback. Exercise
>> both SST and MST outputs since MST siblings share the physical link.
> NIT: Fix Units in subject message, code and the logs
> DP link rates in i915/DRM are in 10 kbit/s units, see drm_dp_is_uhbr_rate
>>
>> v2: Improve UHBR fallback subtest
> NIT: Please spell out what actually changed in v2
> "Improve UHBR fallback subtest" is too generic
>>
>> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
>> ---
>>   tests/intel/kms_dp_linktrain_fallback.c | 205 ++++++++++++++++++++++--
>>   1 file changed, 191 insertions(+), 14 deletions(-)
>>   mode change 100644 => 100755 tests/intel/kms_dp_linktrain_fallback.c
>>
>> diff --git a/tests/intel/kms_dp_linktrain_fallback.c 
>> b/tests/intel/kms_dp_linktrain_fallback.c
>> old mode 100644
>> new mode 100755
>> index 115183d2dc..c691443aa8
>> --- a/tests/intel/kms_dp_linktrain_fallback.c
>> +++ b/tests/intel/kms_dp_linktrain_fallback.c
>> @@ -24,6 +24,14 @@
>>    *
>>    * SUBTEST: dsc-fallback
>>    * Description: Test fallback to DSC when BW isn't sufficient
>> + *
>> + * SUBTEST: uhbr-to-hbr-fallback
>> + * Description: Verify fallback from UHBR (>= 10 Gbps, 128b/132b) to 
>> HBR3 or
>> + *              lower (8b/10b) on a UHBR-capable DP connector by 
>> forcing
>> + *              repeated link training failures, exercising the port 
>> slice
>> + *              reset path on the transition. Supports both SST and MST
>> + *              (topology-wide) outputs; MST siblings share the 
>> physical
>> + *              link so fallback applies to the whole topology.
>>    */
> "exercising the port slice reset path on the transition" - nothing in 
> the test
> observes that. The subtest only reads back the link rate from debugfs, 
> so it
> cannot tell a port-slice reset from any other retrain. Please drop 
> that clause
> (or move it to the commit message as motivation), otherwise the 
> documented
> scope of the subtest does not match what it verifies.
>
>>     #define RETRAIN_COUNT 1
>> @@ -33,6 +41,12 @@
>>    */
>>   #define LT_FAILURE_REDUCED_CAPS 2
>>   #define SPURIOUS_HPD_RETRY 3
>> +/*
>> + * UHBR10 link rate threshold in Kbps.
>> + * Rates at or above this value use 128b/132b encoding 
>> (UHBR10/13.5/20).
>> + * Rates below this value use 8b/10b encoding (HBR3 and lower).
>> + */
>> +#define UHBR10_LINK_RATE 1000000
> NIT: Instead of having a definition we can have a reusable helper that 
> can be used by other tests
> to check given rate is uhbr or not.
>>     static int traversed_mst_outputs[IGT_MAX_PIPES];
>>   static int traversed_mst_output_count;
>> @@ -73,9 +87,10 @@ static bool setup_mst_outputs(data_t *data, 
>> igt_output_t *mst_output[],
>>           output = mst_output[i];
>>           if (traversed_mst_output_count < IGT_MAX_PIPES) {
>> traversed_mst_outputs[traversed_mst_output_count++] = 
>> output->config.connector->connector_id;
>> -            igt_info("Output %s is in same topology as %s\n",
>> -                 igt_output_name(output),
>> -                 igt_output_name(data->output));
>> +            if (output->id != data->output->id)
>> +                igt_info("Output %s is in same MST topology as %s\n",
>> +                     igt_output_name(output),
>> +                     igt_output_name(data->output));
> This hunk is an unrelated cosmetic change - it suppresses the 
> self-referential
> log line and rewords an existing message. It has nothing to do with UHBR
> fallback, and rewording an existing igt_info() can break whatever 
> people grep
> for in CI logs. Please split it into its own patch (or drop it).
>
>>           } else {
>>               igt_assert_f(false, "Unable to save traversed output\n");
>>               return false;
>> @@ -347,7 +362,7 @@ static bool fix_link_status_and_recommit(data_t 
>> *data,
>>       return true;
>>   }
>>   -static void test_fallback(data_t *data, bool is_mst)
>> +static bool test_fallback(data_t *data, bool is_mst, bool force_uhbr)
> Worth documenting what the bool means, because it is doing double duty 
> below:
> for the !force_uhbr callers it is ignored entirely, and for force_uhbr 
> it feeds
> igt_require_f(), i.e. false == "skip"
>>   {
>>       int output_count, retries;
>>       int max_link_rate, curr_link_rate, prev_link_rate;
>> @@ -361,14 +376,94 @@ static void test_fallback(data_t *data, bool 
>> is_mst)
>>       retries = SPURIOUS_HPD_RETRY;
>>         igt_display_reset(&data->display);
>> -    i915_dp_reset_link_params(data->drm_fd, data->output);
>> -    if (!setup_outputs(data, is_mst, outputs,
>> -               &output_count, modes, fbs,
>> -               primaries))
>> -        return;
>>   -    igt_info("Testing link training fallback on %s\n",
>> -         igt_output_name(data->output));
>> +    /*
>> +     * For the UHBR-to-HBR fallback case, pin the link to the sink's
>> +     * negotiated max rate (i915_dp_get_max_link_rate() — the common
> stick to ASCII punctuation ("-")
>> +     * source/sink rate, not i915_dp_get_max_supported_rate() which 
>> lists
>> +     * every rate the *source* can generate, including ones the sink
>> +     * doesn't advertise in its DPCD). If the physical link still can't
>> +     * sustain that rate (cable limit), fall back to the next-lower 
>> UHBR
>> +     * rate advertised in the debugfs list and retry. Skip the test 
>> if no
>> +     * UHBR rate is achievable.
>> +     */
> [X]
> Change dropped the unconditional i915_dp_reset_link_params() (removed 
> a few
> lines up) and only kept it in the !force_uhbr branch. So on this path
> i915_dp_get_max_link_rate() is now read before anything is reset. That
> debugfs file is not the sink's static maximum - it is the currently 
> allowed
> maximum.
>
> Those limits shrink on every fallback. Concretely: the second and later
> outputs sharing an intel_dp (MST siblings), or a full-binary run where
> dp-fallback already walked this connector down to 2.7 Gbps, will read
> max=270000 here and print "does not support UHBR (max=270000 kbps),
> skipping" on a panel that very much does support UHBR.
>> +    if (force_uhbr) {
>> +        char buf[512], rate_str[16], lane_auto[] = "auto";
>> +        int try_rate = i915_dp_get_max_link_rate(data->drm_fd,
>> +                             data->output);
>> +        /* Preserve MST state for fallback retries; keep final 
>> discovery cached.*/
>> +        int saved_mst_count = traversed_mst_output_count;
>> +
>> +        if (try_rate < UHBR10_LINK_RATE) {
>> +            igt_info("Output %s does not support UHBR (max=%d kbps), 
>> skipping\n",
>> +                 igt_output_name(data->output), try_rate);
>> +            return false;
>> +        }
> This is one of two different "does not support UHBR" skips, the other 
> being the
> i915_dp_get_max_supported_rate() gate in 
> run_uhbr_to_hbr_fallback_test(). An
> output that passes the outer gate (source can do UHBR) and fails here 
> (sink
> cannot) prints both messages, which reads like a bug in the test. 
> Please gate
> once, in one place, on the same helper.
>> +
>> +        curr_link_rate = 0;
>> +        while (try_rate >= UHBR10_LINK_RATE) {
>> +            char *token;
>> +            int next = 0;
>> +
>> +            /* Allow MST re-discovery on every UHBR-rate attempt. */
>> +            traversed_mst_output_count = saved_mst_count;
>> +
>> +            snprintf(rate_str, sizeof(rate_str), "%d", try_rate);
>> +            i915_dp_set_link_params(data->drm_fd, data->output,
>> +                        rate_str, lane_auto);
> lane_auto[] only exists because i915_dp_set_link_params() takes "char 
> *" rather
> than "const char *", so a string literal would warn. Rather than 
> working around
> it at every call site, please fix the helper in a small prep patch.
>> +
>> +            if (!setup_outputs(data, is_mst, outputs,
>> +                       &output_count, modes, fbs, primaries)) {
>> +                i915_dp_reset_link_params(data->drm_fd,
>> +                              data->output);
>> +                return false;
>> +            }
>> +
>> +            curr_link_rate = 
>> i915_dp_get_current_link_rate(data->drm_fd,
>> +                                       data->output);
>> +            if (curr_link_rate >= UHBR10_LINK_RATE) {
>> +                igt_info("Link trained at UHBR %d kbps on %s\n",
>> +                     curr_link_rate,
>> +                     igt_output_name(data->output));
>> +                break;
>> +            }
>> +
>> +            igt_info("Rate %d not sustained (got %d kbps) on %s, 
>> trying next-lower UHBR\n",
>> +                 try_rate, curr_link_rate,
>> +                 igt_output_name(data->output));
>> +            igt_display_reset(&data->display);
>> +
>> +            igt_debugfs_read_connector_file(data->drm_fd,
>> +                            igt_output_name(data->output),
>> +                            "i915_dp_force_link_rate",
>> +                            buf, sizeof(buf));
>> +            for (token = strtok(buf, " \t\n"); token;
>> +                 token = strtok(NULL, " \t\n")) {
>> +                int r = (int)strtol(token, NULL, 0);
>> +
>> +                if (r >= UHBR10_LINK_RATE && r < try_rate && r > next)
>> +                    next = r;
>> +            }
> A few things about this block:
>
> (a) The return value of igt_debugfs_read_connector_file() is dropped 
> and buf[]
>     is uninitialised, so if the read fails you strtok() over 
> uninitialised
>     stack. Every other caller in lib/i915/i915_dp.c asserts on the 
> result:
>
>         res = igt_debugfs_read_connector_file(...);
>         igt_assert_f(res == 0, "Unable to read 
> %s/i915_dp_force_link_rate\n", ...);
>
>     Please do the same (or better, see (c)).
>
> (b) The list you are parsing is intel_dp->source_rates - the show 
> handler is:
>
>         seq_printf(m, "%sauto%s", ...);
>         for (i = 0; i < intel_dp->num_source_rates; i++)
>                 seq_printf(m, " %s%d%s%s",
>                            intel_dp->source_rates[i] == force_rate ? 
> "[" : "",
>                            intel_dp->source_rates[i],
>                            intel_dp->source_rates[i] == current_rate ? 
> "*" : "",
>                            intel_dp->source_rates[i] == force_rate ? 
> "]" : "");
>
>     i.e. "[auto] 162000 216000 ... 810000* 1000000 1350000 2000000", 
> and the
>     write handler validates only against source_rates too. 
> UHBR10/13.5/20 are
>     advertised independently by the sink, so a sink that does UHBR20 
> but not
>     UHBR13.5 will send you to 1350000, the write will succeed, and you 
> will
>     then quietly train at whatever the driver falls back to. The
>     intel_dp_allowed_link_configs debugfs file (source AND sink AND 
> current
>     limits, printed as "<lanes>x<rate>") is the right source for this 
> if you
>     need to enumerate.
>
> (c) The tokenising only works by accident. "auto" -> strtol() returns 
> 0, and the
>     forced entry is bracketed - "[1000000*]" -> strtol() also returns 
> 0. It
>     happens not to matter because candidates must be < try_rate, but 
> please
>     parse explicitly (skip "auto", strip '[', '*', ']') instead of 
> relying on
>     strtol() bailing out. While there: use strtok_r(), base 10 rather 
> than 0,
>     and check endptr/errno.
>
>     Given the amount of parsing, this really wants to live in 
> lib/i915/i915_dp.c
>     next to i915_dp_get_max_supported_rate() - something like
>     i915_dp_get_next_lower_rate(fd, output, rate) - rather than 
> open-coded in
>     the test.
>
>> +            try_rate = next;
>> +        }
>> +
>> +        if (curr_link_rate < UHBR10_LINK_RATE) {
>> +            igt_info("Output %s cannot sustain any UHBR rate, 
>> skipping\n",
>> +                 igt_output_name(data->output));
>> +            i915_dp_reset_link_params(data->drm_fd, data->output);
>> +            return false;
>> +        }
>> +
>> +        /* Clear the pin so the fallback loop below can reduce rate. */
>> +        i915_dp_reset_link_params(data->drm_fd, data->output);
> This does considerably more than "clear the pin". The write handler is:
>
>         intel_dp_reset_link_params(intel_dp);
>         link_caps->forced_params.rate = rate;
>
> and intel_dp_reset_link_params() -> intel_dp_link_caps_reset() ->
> reset_max_link_limits_reenable_all(), i.e. it re-enables *all* link 
> configs and
> throws away accumulated fallback state, right before you start forcing
> failures.
>
> On the interesting path - the one where the loop above had to walk 
> down because
> the cable could not sustain the sink's max - this hands the driver 
> back exactly
> the rate you just proved unusable. Have you confirmed on real hardware 
> that the
> first post-unpin retrain steps down from the pinned rate rather than
> re-selecting the max? If it re-selects, curr_link_rate can come back 
> *higher*
> than prev_link_rate and the existing igt_assert_f("Fallback 
> unsuccessful")
> below will fire.
>
> Related: max_link_rate is now read after this reset, so it is the full
> source/sink max rather than the rate you pinned. The
> "curr_link_rate == max_link_rate && ... && --retries" spurious-HPD escape
> therefore can never trigger on this path. Not necessarily wrong, but 
> it is a
> behavioural difference from dp-fallback that is worth a comment.
>
>> +    } else {
>> +        i915_dp_reset_link_params(data->drm_fd, data->output);
>> +
>> +        if (!setup_outputs(data, is_mst, outputs,
>> +                   &output_count, modes, fbs,
>> +                   primaries))
>> +            return false;
>> +    }
>>       max_link_rate = i915_dp_get_max_link_rate(data->drm_fd, 
>> data->output);
>>       max_lane_count = i915_dp_get_max_lane_count(data->drm_fd, 
>> data->output);
>>       prev_link_rate = i915_dp_get_current_link_rate(data->drm_fd, 
>> data->output);
>> @@ -390,7 +485,7 @@ static void test_fallback(data_t *data, bool is_mst)
>>           if (i915_dp_get_link_retrain_disabled(data->drm_fd,
>>                                 data->output)) {
>>               igt_reset_connectors();
>> -            return;
>> +            return false;
>>           }
>> igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
>> @@ -421,9 +516,32 @@ static void test_fallback(data_t *data, bool 
>> is_mst)
>>                    ((curr_link_rate == max_link_rate && 
>> curr_lane_count == max_lane_count) && --retries),
>>                    "Fallback unsuccessful\n");
>>   +        /*
>> +         * This subtest only cares about the single UHBR -> HBR
>> +         * transition (128b/132b to 8b/10b encoding). Stop as soon as
>> +         * we've dropped below UHBR10, instead of cascading all the
>> +         * way down through the legacy HBR/HBR2/HBR3 rates, which is
>> +         * already covered by dp-fallback.
>> +         */
>> +        if (force_uhbr && curr_link_rate < UHBR10_LINK_RATE) {
>> +            igt_info("UHBR to HBR fallback confirmed on %s: %d kbps 
>> -> %d kbps\n",
>> +                 igt_output_name(data->output),
>> +                 prev_link_rate, curr_link_rate);
>> +            return true;
>> +        }
> This early return leaves the link in the reduced state and skips the
> igt_reset_connectors() that the retrain-disabled path does. Combined 
> with [X] in
> my comment on the max_link_rate read, that is what makes the next 
> output on the
> same intel_dp mis-detect its UHBR capability. Resetting the link 
> params before
> returning would make each output's run self-contained.
>> +
>>           prev_link_rate = curr_link_rate;
>>           prev_lane_count = curr_lane_count;
>>       }
>> +
>> +    /* force_uhbr: fallback not confirmed, don't count this run. */
>> +    if (force_uhbr) {
>> +        igt_info("UHBR to HBR fallback not reached on %s(last link 
>> rate %d kbps)\n",
>> +             igt_output_name(data->output),prev_link_rate);
>> +        return false;
>> +    }
> "capable output, trained at UHBR,
> forced failures until retrain was disabled, and it never dropped below 
> UHBR10"
> is a failure, not a skip. As written it returns false, run_*() leaves 
> ran ==
> false, and igt_require_f() turns the whole thing into SKIP.
>
> Please separate the two verdicts. Keep "return false" for the genuinely
> skippable cases (no UHBR support, output already covered as an MST 
> sibling,
> setup_outputs() bailed), and make this one fail. Replacing the whole 
> if-block
> with an unconditional assert on the way out of the loop reads well:
>> +
>> +    return true;
>>   }
>>     static bool run_lt_fallback_test(data_t *data)
>> @@ -431,6 +549,8 @@ static bool run_lt_fallback_test(data_t *data)
>>       bool ran = false;
>>       igt_output_t *output;
>>   +    traversed_mst_output_count = 0;
>> +
> traversed_mst_output_count is file-static and never reset,
> so a full-binary run leaks MST traversal state between subtests - but 
> it is
> independent of the new subtest. Please split it out as a prep patch 
> with its own
> justification.
>> for_each_connected_output(&data->display, output) {
>>           data->output = output;
>>   @@ -454,11 +574,11 @@ static bool run_lt_fallback_test(data_t *data)
>>           if (igt_check_output_is_dp_mst(data->output)) {
>>               igt_info("Testing MST output %s\n",
>>                    igt_output_name(data->output));
>> -            test_fallback(data, true);
>> +            test_fallback(data, true, false);
>>           } else {
>>               igt_info("Testing DP output %s\n",
>>                    igt_output_name(data->output));
>> -            test_fallback(data, false);
>> +            test_fallback(data, false, false);
>>           }
>>       }
>>       return ran;
>> @@ -574,11 +694,63 @@ static void test_dsc_sst_fallback(data_t *data)
>>       igt_assert_f(dsc_fallback_successful, "DSC fallback 
>> unsuccessful\n");
>>   }
>>   +static bool run_uhbr_to_hbr_fallback_test(data_t *data)
>> +{
>> +    bool ran = false;
>> +    igt_output_t *output;
>> +
>> +    traversed_mst_output_count = 0;
>> +
>> +    for_each_connected_output(&data->display, output) {
>> +        data->output = output;
>> +
>> +        if 
>> (!i915_dp_has_force_link_training_failure_debugfs(data->drm_fd,
>> +                                     data->output)) {
>> +            igt_info("Output %s doesn't support forcing link 
>> training failure\n",
>> +                 igt_output_name(data->output));
>> +            continue;
>> +        }
>> +
>> +        if (output->config.connector->connector_type != 
>> DRM_MODE_CONNECTOR_DisplayPort) {
>> +            igt_info("Skipping output %s as it's not DP\n", 
>> output->name);
>> +            continue;
>> +        }
>> +
>> +        if (i915_dp_get_max_supported_rate(data->drm_fd, 
>> data->output) < UHBR10_LINK_RATE) {
>> +            igt_info("Skipping output %s: does not support UHBR\n",
>> +                 igt_output_name(data->output));
>> +            continue;
>> +        }
> This gate uses i915_dp_get_max_supported_rate() (source rates) while
> test_fallback() gates on i915_dp_get_max_link_rate() (currently 
> allowed max),
> so the two disagree and an output can be "UHBR capable" here and "not 
> UHBR
> capable" fifteen lines later. Pick one - I would gate here on
> i915_dp_get_max_link_rate() after a reset, and drop the duplicate 
> check inside
> test_fallback(), so there is exactly one skip reason and one message.
>
>> +
>> +        /*
>> +         * MST siblings share the same physical DP link, so UHBR->HBR
>> +         * fallback applies to MST too. Reuse the same is_mst branching
>> +         * as dp-fallback so the whole topology is driven while the
>> +         * shared link is retrained.
>> +         */
>> +        if (igt_check_output_is_dp_mst(data->output)) {
>> +            igt_info("Testing UHBR-to-HBR fallback on MST output %s\n",
>> +                 igt_output_name(data->output));
>> +            if (test_fallback(data, true, true))
>> +                ran = true;
>> +        } else {
>> +            igt_info("Testing UHBR-to-HBR fallback on DP output %s\n",
>> +                 igt_output_name(data->output));
>> +            if (test_fallback(data, false, true))
>> +                ran = true;
>> +        }
>> +    }
>> +
>> +    return ran;
>> +}
> This function is run_lt_fallback_test() with one extra gate and a 
> return value.
> ~45 duplicated lines is a lot to maintain in parallel - the next 
> person to fix
> the output-iteration logic will fix one copy and not the other. Since you
> already threaded force_uhbr through test_fallback(), please do the 
> same here.
>
>> +
>>   static bool run_dsc_sst_fallaback_test(data_t *data)
>>   {
>>       bool ran = false;
>>       igt_output_t *output;
>>   +    traversed_mst_output_count = 0;
>> +
> Unrelated and dead: the DSC path never reaches
> setup_mst_outputs(), so traversed_mst_output_count is not consulted 
> anywhere
> below this line. Please drop it, or if it is defensive, say so in a 
> comment.
>
>
> Thanks and Regards
> Kunal Joshi
>>       if (!is_dsc_supported_by_source(data->drm_fd)) {
>>           igt_info("DSC not supported by source.\n");
>>           return ran;
>> @@ -646,6 +818,11 @@ int igt_main()
>>                     "Skipping test as DSC fallback conditions not 
>> met.\n");
>>       }
>>   +    igt_subtest("uhbr-to-hbr-fallback") {
>> +        igt_require_f(run_uhbr_to_hbr_fallback_test(&data),
>> +                  "Skipping test: no UHBR-capable DP output found or 
>> fallback not reached\n");
>> +    }
>> +
>>       igt_fixture() {
>>           igt_remove_fb(data.drm_fd, &data.fb);
>>           igt_display_fini(&data.display);
