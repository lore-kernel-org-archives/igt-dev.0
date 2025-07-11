Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE3FC83F20
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 07:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2464A10E9BA;
	Fri, 11 Jul 2025 07:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEnLu2vE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC96B10E9BA
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752219185; x=1783755185;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=DQv7OAmoiqPsvp//j5mHSq5sRq2O7roSZQI4bvmzM1k=;
 b=oEnLu2vEpwOEyedm7zZYX5cMbVfltzrZTOtfvcmCsaiAM7+/7HNz3fgi
 zt6zPsCKDFO8FStBbmrQitH4BJqd3QMFN6VxOQGgc8b6+8DGQhdMTNY6C
 kwvJqCkycR7LmfN+hKn28kGutUB9pH2oAEDpKU26MiU7XiCvbMoHPKeFX
 SizLXOG8J5aLjk5fg46ALdlYG/ZdTQHVPH9zMty+iFhPzc1cpKoaTbYFE
 F4v/H0Mc3n99rhjPJkcC4MrL8RChQ08/rQ7HzeDYlUYgxwEwyYxRNvQu8
 hgaet69M6eSup41yru2BL83PErQAJiJpBP/k0RBKvBxXij9SEOqEPJA2v w==;
X-CSE-ConnectionGUID: b4F3gw1cQMSxyGssbDxlWw==
X-CSE-MsgGUID: 9wlQBJ9DQSa/IKs1r2jKmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54599475"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54599475"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 00:33:04 -0700
X-CSE-ConnectionGUID: WxahCzNVRQyWKxMDWja1lQ==
X-CSE-MsgGUID: G7ZXaHTST76fQBL6IxDntw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="193508563"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 00:33:01 -0700
Message-ID: <881f929d-49bf-44ff-b8cb-302eb6537e96@linux.intel.com>
Date: Fri, 11 Jul 2025 09:32:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5,resend i-g-t 3/6] tests: Add kms_debugfs
To: Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
 <20250708144039.53482-4-peter.senna@linux.intel.com>
 <20250710101339.mobt7uyicfm7webf@kamilkon-DESK.igk.intel.com>
 <71154125-b7e0-43a4-8732-607ff2ac82f5@intel.com>
 <afe3c7b1-f326-4b76-9e79-165bd5da3da3@linux.intel.com>
 <76607229-60f0-45b9-b3aa-ab2c9da549af@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <76607229-60f0-45b9-b3aa-ab2c9da549af@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Karthik,

On 7/10/2025 9:30 PM, Karthik B S wrote:

[...]

>>>>> +
>>>>> +    if (ret) {
>>>>> +        igt_output_t *output;
>>>>> +
>>>>> +        for_each_connected_output(display, output)
>>>>> +            igt_output_set_pipe(output, PIPE_NONE);
>>>>> +
>>>> Please add some counter and abort on reaching max_retry
>>>> to prevent infinite loop here. Something like:
>>>>
>>>>          ++cnt_retry;
>>>>          igt_assert_f(cnt_retry < MAX_IGT_PIPES, "Too much retries
>>>> %d\n", cnt_retry);
>>>>
>>>> Karthik or Swati: I am not sure if this is needed, could you comment
>>>> on this here?
>>> |I think we don't need a retry at all here. If there is a fail with the
>>> first commit just try if we're able to go ahead after using
>>> 'igt_fit_modes_in_bw' and if it doesn't allow just skip the test here.
>>> That was my motivation to suggest to use the wrapper on the previous
>>> revision of the patch.|
>>>
>>> |The only issue currently I see(that I just observed) is in
>>> 'igt_fit_modes_in_bw' the try_commit we're doing is using atomic commit
>>> by default, although there is no reason to have this restriction. So
>>> ideally we would want to fix that in lib and then just have something
>>> like below in this test.|
>> This is getting a bit out of hand for me because I don't know much about
>> displays. First you asked me to use a wrapper, now you want me to fix
>> the wrapper. I will pass fixing the wrapper as this may lead to yet more
>> unrelated work.
>>
>> Should I revert back to not using igt_fit_modes_in_bw()?
> For the lib part I can send out a patch, should be a quick fix and be
> independent of this series. Would that be fine?

Yes! Please CC me in the patch if you want me to test it for you.

>>
>>> |if (atomic)|
>>>
>>> |    ret = igt_display_try_atomic_commit|
>>>
>>> |else|
>>>
>>> |    ret = igt_display_try_commit2(legacy)|
>>>
>>> |if (ret)|
>>>
>>> |    igt_require(||igt_fit_modes_in_bw(display))|
>>>
>>> |igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC :
>>> COMMIT_;LEGACY);|
>> I am not sure I follow what you are suggesting here.
> 
> Ah my bad, if we actually fix/update the igt_fit_modes_in_bw even these
> changes are not required as these would be handled internally in the
> wrapper. So we would just need something like below.
> 
> igt_require_f(igt_fit_modes_in_bw,"No valid mode combo found.\n");
> 
> igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC :
> COMMIT_LEGACY);

The test is going to be much cleaner after the change.

Thank you!

[...]
