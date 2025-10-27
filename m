Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A18CCF9E0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 17:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139DA10E4F1;
	Mon, 27 Oct 2025 17:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+s7sFQf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D0A10E523
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 17:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761584484; x=1793120484;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=rk7ywtHAgrDRAauSZU5/rAZzYwipvfd6YNwJmjHswDQ=;
 b=Y+s7sFQflTihfPxdPZF/qDPg7GVZY8jgbfX2htKBp7JTbkZvDNFEt2Vm
 9cEbZmymQSd967rn4q6pkhYSo2u8eJQNGHTDw5ImXSuRtpArX5dD7A/jW
 IDVD74DE/r7G9pmocMb+a6a2W9bUtvK7rsi+gEpPJn648X22R+qQhkrOj
 pZBPJJr9irVb9k8lUZAMZbnrXUjOac+YBMfMnruIkZ1sGS0EPy0VIn/DH
 vEVO9ye/9/txWnxV8vUjuoXdRwHwGQtvjOwAz/29ev8Y6DeSlAg65nRDk
 i1R5qnxWtoN5HVrsD6XKKKyeHpdclxNKeIfmnH/SLzGYllNBtET46zdH2 Q==;
X-CSE-ConnectionGUID: vIAOWOBKRhmdWtxEE9nCng==
X-CSE-MsgGUID: 84P51DWyRF2IMpft6AX/Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63598563"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63598563"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:01:23 -0700
X-CSE-ConnectionGUID: kElJPG6OSNyxzWo8enXk/w==
X-CSE-MsgGUID: aW3u98PAToysV/GqsBcdwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185864937"
Received: from unknown (HELO [10.241.242.71]) ([10.241.242.71])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:01:23 -0700
Message-ID: <a313477e-4ee6-460b-937c-420fb37114bb@linux.intel.com>
Date: Mon, 27 Oct 2025 10:01:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_atomic_transition: Fix dynamic subtest
To: Gustavo Sousa <gustavo.sousa@intel.com>, igt-dev@lists.freedesktop.org
References: <20251024233732.55832-1-ngai-mint.kwan@linux.intel.com>
 <176157451100.3407.12104950322254043568@intel.com>
Content-Language: en-US
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
In-Reply-To: <176157451100.3407.12104950322254043568@intel.com>
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

Hi Gustavo,

On 2025-10-27 07:15, Gustavo Sousa wrote:
> Quoting Ngai-Mint Kwan (2025-10-24 20:37:28-03:00)
>> Fix Segmentation Fault when calling igt_pipe_crc_free() due to double-freeing a
>> dangling pointer.
>>
>> This occurs when a system connected to multiple displays executes a test with
>> "1x-outputs" dynamic subtest.
>>
>> Example:
>> kms_atomic_transition --run-subtest modeset-transition --dynamic-subtest 1x-outputs
>>
>> Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
>> ---
>> tests/kms_atomic_transition.c | 10 +++++-----
>> 1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
>> index a13830965..a7d8d88b4 100644
>> --- a/tests/kms_atomic_transition.c
>> +++ b/tests/kms_atomic_transition.c
>> @@ -1065,8 +1065,7 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
>>                  return;
>>          }
>>
>> -        igt_dynamic_f("%ix-outputs", requested_outputs)
>> -                run_modeset_tests(data, requested_outputs, nonblocking, fencing);
>> +        run_modeset_tests(data, requested_outputs, nonblocking, fencing);
>>
>>          /* Cleanup */
>>          unset_output_pipe(&data->display);
>> @@ -1259,9 +1258,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>                  igt_describe_f("%s", modeset_tests[i].desc);
>>                  igt_subtest_with_dynamic_f("%s", modeset_tests[i].name) {
>>                          for (j = 1; j <= count; j++) {
>> -                                run_modeset_transition(&data, j,
>> -                                                       modeset_tests[i].nonblocking,
>> -                                                       modeset_tests[i].fencing);
>> +                                igt_dynamic_f("%ix-outputs", j)
>> +                                        run_modeset_transition(&data, j,
>> +                                                               modeset_tests[i].nonblocking,
>> +                                                               modeset_tests[i].fencing);
> I believe one possible problem here is that we might end up creating a
> dynamic subtest that ends not not getting exercised, when (num_outputs <
> requested_outputs) evaluates to true inside run_modeset_transition().
I looked at run_modeset_transition() and it looks more like an exit 
criteria
rather than a valid subtest when it is checking for (num_outputs < 
requested_outputs)?

Kwan
>
> Maybe we should rather move the cleanup code to be contained inside
> run_modeset_tests()?
>
> --
> Gustavo Sousa
>
>>                          }
>>                  }
>>          }
>> -- 
>> 2.43.0
>>

