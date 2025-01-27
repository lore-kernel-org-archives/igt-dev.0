Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB14C0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 08:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FC410E1D9;
	Mon, 27 Jan 2025 08:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9odAjt2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C41510E1D9
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 08:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737965071; x=1769501071;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=VAmAN1StO+A6fH81JgO9h8tWvWXX94pSNQIMw/lnFTk=;
 b=Y9odAjt2x11MG144/R3B7n8tihdlc9cmerObNvNxvYNa+JlB4+uBReDp
 F+AcL0GbwD7tYim+5rfkoXEdtkzG7otQI/VP2WzhwGiukpbaKqmxZ26y8
 R5k17uJI3uKJBWnb3Jyc3mHE9slS6PC6if9JXqbzE1uakcSt9UINDy9Ji
 9kFKZcxRnOUIIBaQ9eeXqkbbXl3Nni0KXiXoqeGUzLX9suPt75GEW+zS6
 o6+oBpWGYEhizSxgZ3rgmGh81T2j44JfiRUtre5Fa1Y4VUNYFMjio4aNo
 uTLjeLo8E5tbWHNkFVjMWVhyvQjBw1OY5RZLxeR68rkaBAEhqevPbGztl A==;
X-CSE-ConnectionGUID: kGkOCc8pSW2PSWaPL82XEA==
X-CSE-MsgGUID: rGlipAb5Q7e18wpwydSWFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="60882712"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="60882712"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 00:04:31 -0800
X-CSE-ConnectionGUID: 2Sf51WdcRIC1yis7LysDvQ==
X-CSE-MsgGUID: Qz4TkKCoSVSmi7Mw502mjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="108339745"
Received: from unknown (HELO [10.66.99.133]) ([10.66.99.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 00:04:30 -0800
Message-ID: <c56aab1a-418f-4834-b4a3-b2f90198109f@intel.com>
Date: Mon, 27 Jan 2025 13:34:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/intel/kms_mst_helper: Add helper for
 MST-related functions
To: "Sharma, Swati2" <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20250123073701.3113428-1-kunal1.joshi@intel.com>
 <20250123073701.3113428-2-kunal1.joshi@intel.com>
 <8ea8a081-453e-43a2-874c-c4f5c3088d32@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <8ea8a081-453e-43a2-874c-c4f5c3088d32@intel.com>
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


On 27-01-2025 12:47, Sharma, Swati2 wrote:
> Hi Kunal,
>
> If new helper is introduced, please move dp-mst related func() from 
> igt_kms.c to
>
> kms_mst_helper.c
Hello Swati,

That is already in plan but will not take that as part of this series.
Will float a separate series for all MST functions to be present in MST 
helper.
Many of them needs modification before integration in the helper.

Thanks and Regards
Kunal Joshi
>
> On 23-01-2025 01:06 pm, Kunal Joshi wrote:
>> This patch introduces kms_mst_helper.c and kms_mst_helper.h
>> to centralize commonly used MST-related logic.
>> The new function igt_find_all_mst_output_in_topology()
>> enumerates MST outputs that share the same root connector,
>> simplifying code reuse across tests needing outputs on
>> same MST topology. The existing MST-related code in
>> kms_dp_linktrain_fallback.c is updated to use the new helper,
>> removing duplication. Additionally, meson.build is modified
>> to include kms_mst_helper.c in the build process.
>>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   tests/intel/kms_dp_linktrain_fallback.c | 28 ++++---------------------
>>   tests/meson.build                       |  1 +
>>   2 files changed, 5 insertions(+), 24 deletions(-)
>>
>> diff --git a/tests/intel/kms_dp_linktrain_fallback.c 
>> b/tests/intel/kms_dp_linktrain_fallback.c
>> index a05e2015f..b10946781 100644
>> --- a/tests/intel/kms_dp_linktrain_fallback.c
>> +++ b/tests/intel/kms_dp_linktrain_fallback.c
>> @@ -16,6 +16,7 @@
>>   #include <sys/types.h>
>>     #include "igt.h"
>> +#include "kms_mst_helper.h"
>>     /**
>>    * SUBTEST: dp-fallback
>> @@ -47,28 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd, 
>> igt_output_t *output);
>>     IGT_TEST_DESCRIPTION("Test link training fallback");
>>   -static void find_mst_outputs(int drm_fd, data_t *data,
>> -                 igt_output_t *output,
>> -                 igt_output_t *mst_outputs[],
>> -                 int *num_mst_outputs)
>> -{
>> -    int output_root_id, root_id;
>> -    igt_output_t *connector_output;
>> -
>> -    output_root_id = igt_get_dp_mst_connector_id(output);
>> -    /*
>> -     * If output is MST check all other connected output which shares
>> -     * same path and fill mst_outputs and num_mst_outputs
>> -     */
>> -    for_each_connected_output(&data->display, connector_output) {
>> -        if (!igt_check_output_is_dp_mst(connector_output))
>> -            continue;
>> -        root_id = igt_get_dp_mst_connector_id(connector_output);
>> -        if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == 
>> output_root_id)
>> -            mst_outputs[(*num_mst_outputs)++] = connector_output;
>> -    }
>> -}
>> -
>>   static bool setup_mst_outputs(data_t *data, igt_output_t 
>> *mst_output[],
>>                     int *output_count)
>>   {
>> @@ -83,8 +62,9 @@ static bool setup_mst_outputs(data_t *data, 
>> igt_output_t *mst_output[],
>>               traversed_mst_outputs[i] == 
>> data->output->config.connector->connector_id)
>>               return false;
>>   -    find_mst_outputs(data->drm_fd, data, data->output,
>> -             mst_output, output_count);
>> + igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, 
>> &data->display, data->output,
>> +                            mst_output, output_count),
>> +            "Unable to find mst outputs\n");
>>         for (i = 0; i < *output_count; i++) {
>>           output = mst_output[i];
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 33dffad31..2cbd21c2a 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -367,6 +367,7 @@ extra_sources = {
>>       'kms_chamelium_frames': [ join_paths ('chamelium', 
>> 'kms_chamelium_helper.c') ],
>>       'kms_chamelium_hpd': [ join_paths ('chamelium', 
>> 'kms_chamelium_helper.c') ],
>>       'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>> +    'kms_dp_linktrain_fallback': [join_paths ('intel', 
>> 'kms_mst_helper.c')],
>>       'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>>   }
