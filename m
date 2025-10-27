Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B795CCF9E0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 04:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA9610E097;
	Mon, 27 Oct 2025 04:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LODAny6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB9D10E097
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 04:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761539213; x=1793075213;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G8gnxpwKRri8Ltb9+Rt2YqEj85TxRSfl6cNOslmh0dA=;
 b=LODAny6NdtJQQ4UiuDLybrXgbfu/3shZ0JulC0uHmCN9qlCRklpXfuRj
 4TJ2Z374GCEQ+BePQ49XjFDp2MoNeiqqqQtKF9NOXdJ1gSjg7fPsEM9Ms
 9PIUY/7dXPFMmwC43ay9T+NjAK0Ri8nUmdqlh8yrZND1sMcYf/sjTIa+X
 Gj0nNe8TxP5XZSYzVgfXH6ofi7qfKRjpWMp4zhU+KQkTTLVvkJ10BLmw3
 e9rw+MS49gFR/x6nNp+F0QCPsWhLfZWh49Mm/ZpitQn93BHQYOqXIWtoG
 XITCpWHbRASVvAFVbdJ9DB7y3CKu4aO/4skLfugV9HSS8zIo8aP39lNCH Q==;
X-CSE-ConnectionGUID: uEDrCtH5QpSSg1BHBJEriA==
X-CSE-MsgGUID: 4Yypbi6US+aAb/ZB32dddg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67479547"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="67479547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:26:53 -0700
X-CSE-ConnectionGUID: sji9gMC9QnyrvDW80jT1DA==
X-CSE-MsgGUID: R6cNLVITTCC5d1nqfE2xoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184833844"
Received: from nkwan-mobl.amr.corp.intel.com (HELO [10.125.216.40])
 ([10.125.216.40])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:26:53 -0700
Message-ID: <e04acac9-abf0-4dc3-94c6-4e800902bf6a@linux.intel.com>
Date: Sun, 26 Oct 2025 21:26:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_atomic_transition: Add info meassages
 for skipped subtest
To: "S, Sowmiya" <sowmiya.s@intel.com>, "B, Jeevan" <jeevan.b@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "B S, Karthik" <karthik.b.s@intel.com>,
 "Samala, Pranay" <pranay.samala@intel.com>
References: <20251017121055.2960836-1-sowmiya.s@intel.com>
 <DM4PR11MB6312E9297975D96AB1365DFC90FCA@DM4PR11MB6312.namprd11.prod.outlook.com>
 <PH7PR11MB6796EAC3A4CE045DCCEA91BDE5FCA@PH7PR11MB6796.namprd11.prod.outlook.com>
Content-Language: en-US
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
In-Reply-To: <PH7PR11MB6796EAC3A4CE045DCCEA91BDE5FCA@PH7PR11MB6796.namprd11.prod.outlook.com>
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

On 2025-10-26 21:17, S, Sowmiya wrote:
> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: 27 October 2025 09:32
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Samala, Pranay <pranay.samala@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: RE: [PATCH i-g-t v2] tests/kms_atomic_transition: Add info meassages for skipped subtest
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Sowmiya S
>> Sent: Friday, October 17, 2025 5:41 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Samala, Pranay
>> <pranay.samala@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
>> Subject: [PATCH i-g-t v2] tests/kms_atomic_transition: Add info
>> meassages for skipped subtest
>>
>> From: sowmiya <sowmiya.s@intel.com>
>>
>> Add info messages for subtests that are skipped without having proper
>> info messages. This provides clearer insight into the reason for skipping.
>>
>> v2: Add switch case instead of if conditions
>>      Also changed the flag name.
>>
>> Signed-off-by: sowmiya <sowmiya.s@intel.com>
>> ---
>>   tests/kms_atomic_transition.c | 22 ++++++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_atomic_transition.c
>> b/tests/kms_atomic_transition.c index a13830965..032abf54b 100644
>> --- a/tests/kms_atomic_transition.c
>> +++ b/tests/kms_atomic_transition.c
>> @@ -1172,6 +1172,7 @@ igt_main_args("", long_opts, help_str,
>> opt_handler, &data)
>>   	};
>>   	int i, j, count = 0;
>>   	int pipe_count = 0;
>> +	bool info_flag = false;
>>
>>   	igt_fixture {
>>   		unsigned int debug_mask_if_ci = DRM_UT_KMS; @@ -1216,6
>> +1217,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   		igt_describe(transition_tests[i].desc);
>>   		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
>>   			pipe_count = 0;
>> +			info_flag = false;
>>
>>   			for_each_pipe_with_valid_output(&data.display,
>> pipe, output) {
>>   				/*
>> @@ -1224,12 +1226,16 @@ igt_main_args("", long_opts, help_str,
>> opt_handler, &data)
>>   				 * panels with long power cycle delays.
>>   				 */
>>   				if ((transition_tests[i].type ==
>> TRANSITION_MODESET) &&
>> -				    output_is_internal_panel(output))
>> +				    output_is_internal_panel(output)) {
>> +					info_flag = true;
>>   					continue;
>> +				}
>>
>>   				if ((transition_tests[i].type ==
>> TRANSITION_MODESET_FAST) &&
>> -				    !output_is_internal_panel(output))
>> +				    !output_is_internal_panel(output)) {
>> +					info_flag = true;
>>   					continue;
>> +				}
>>
>>   				if (pipe_count == 2 * count &&
>> !data.extended)
>>   					break;
>> @@ -1249,6 +1255,18 @@ igt_main_args("", long_opts, help_str,
>> opt_handler, &data)
>>   				test_cleanup(&data, pipe, output,
>>   					     transition_tests[i].fencing);
>>   			}
>> +			if (info_flag && !pipe_count) {
>> +				switch (transition_tests[i].type) {
>> +				case TRANSITION_MODESET:
>> +					igt_info("Invalid test for internal
>> panel\n");
>> +					break;
>> +				case TRANSITION_MODESET_FAST:
>> +					igt_info("Invalid test for external
>> panel\n");
>> Suggest to change the skip message for clarity.
>> igt_info("Skipping test: invalid for internal panel\n"); igt_info("Skipping test: invalid for external panel\n");
>> with this change code looks good to me.
> Sure, Jeevan. I will update the patch.
Also a slight change to the Patch's subject line:
     meassages -> messages
>> +					break;
>> +				default:
>> +					break;
>> +				}
>> +			}
>>   		}
>>   	}
>>
>> --
>> 2.43.0

