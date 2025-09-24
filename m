Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABD7CAC5AE
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 13:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A942E10E23A;
	Wed, 24 Sep 2025 13:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwEg7tL3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2872510E23A
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758722249; x=1790258249;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yFrIym9VhxCFQaZIGyvh+bEdj9MZGo38p8HmA4H+Gzs=;
 b=dwEg7tL3d4S+iI4GpZ2aBTpDs8hPGf5Mc+8su9XA4JrErwuy/tR6gWbT
 vgPuefGkA73k6ql3ETH2yWl5+MiPEPBZfqIwzPFOhpR+Kf5r3roJiA1JH
 wlWQlGWenrhC2JSkowjAfnyYYc/ZEHFm9p0gDFx5C7ihgobaLkJjYSL1x
 rtUmEZPvixYVKF0v7pgxNcT3DNQCwgrQ9/hkMLWuuY62t4oiGncZIOS9P
 Twfj51FNFmcOQabeUsoUsQdah7uD8zO4zXubA+rPMOSUOWHQusaqs+IQs
 sSLV8/0vTjldjQiHeXl7j8frBrNtqlD+yJJHA/wKK33Vp0ZsntmFKA23G A==;
X-CSE-ConnectionGUID: CYEoSQwhTWKaRJNci3OVCw==
X-CSE-MsgGUID: rJSoTaQ0RJmtGm996GPQLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60933032"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60933032"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:57:29 -0700
X-CSE-ConnectionGUID: oqZp+OpOT/efLlTEGjq29w==
X-CSE-MsgGUID: JxYY4sIwRFyNL4OZE6Yy3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181327731"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.190])
 ([172.28.180.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:57:28 -0700
Message-ID: <49cdd67d-fb90-4cb3-8cf4-c9f39fea5bcb@intel.com>
Date: Wed, 24 Sep 2025 15:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-5-dominik.karol.piatkowski@intel.com>
 <411a13c9-cb01-4d30-aad7-970497b3e571@intel.com>
 <DS0PR11MB7264F93764F29BBDCCCBA17DD91CA@DS0PR11MB7264.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <DS0PR11MB7264F93764F29BBDCCCBA17DD91CA@DS0PR11MB7264.namprd11.prod.outlook.com>
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

Hi Dominik,

On 24.09.2025 14:38, Piatkowski, Dominik Karol wrote:
> Hi Christoph,
> 
>> -----Original Message-----
>> From: Manszewski, Christoph <christoph.manszewski@intel.com>
>> Sent: Wednesday, September 24, 2025 1:43 PM
>> To: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Mika
>> Kuoppala <mika.kuoppala@linux.intel.com>
>> Subject: Re: [PATCH v4 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
>>
>> Hi Dominik,
>>
>> On 23.09.2025 15:10, Dominik Karol Piątkowski wrote:
>>> Rewrite SIGINT signal handler to toggle a variable instead of calling
>>> pthread_exit instantly, as the thread could be in critical section,
>>> causing a deadlock on the attempt of next entry into that critical
>>> section.
>>>
>>> Introduce received_signal, received_sigint and handled_sigint variables
>>> to help with coordination of handling SIGINT and other signals.
>>>
>>> Use the received_sigint variable in debugger_worker_loop to safely kill
>>> the thread, set handled_sigint to help with coordination outside the
>>> debugger loop.
>>>
>>> Rename terminate_debugger to debugger_signal_handler to describe its
>>> new function better. Add SIGTERM to signals that are handled by
>>> debugger_signal_handler.
>>>
>>> Don't kill debugger thread on non-SIGINT signals. Don't break on poll
>>> failure if signal was received.
>>>
>>> Signed-off-by: Dominik Karol Piątkowski
>> <dominik.karol.piatkowski@intel.com>
>>> ---
>>>    lib/xe/xe_eudebug.c | 26 ++++++++++++++++++++++----
>>>    lib/xe/xe_eudebug.h |  4 ++++
>>>    2 files changed, 26 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
>>> index deaea25cd..647da7b32 100644
>>> --- a/lib/xe/xe_eudebug.c
>>> +++ b/lib/xe/xe_eudebug.c
>>> @@ -1072,9 +1072,14 @@ xe_eudebug_read_event(int fd, struct
>> drm_xe_eudebug_event *event)
>>>    	return ret;
>>>    }
>>>
>>> -static void terminate_debugger(int sig)
>>> +static void debugger_signal_handler(int sig, siginfo_t *info, void *context)
>>>    {
>>> -	pthread_exit(NULL);
>>> +	struct xe_eudebug_debugger *d = info->si_ptr;
>>> +
>>> +	d->received_signal = true;
>>
>> If I understand correctly, without the two commits that follow, this is
>> a NULL pointer dereference. But even after combining those commits,
>> won't this cause a NULL pointer dereference if a IGT user presses 'CTRL-C'?
> 
> True, without these commits it is a NULL pointer dereference.

While it is not a critical issue, it would make sense to not have 
commits that are buggy the same way as we want to have commits that 
compile without commits that follow. It's one thing to have some tests 
that no longer pass after a commit and another to have undefined 
behavior or non-compiling code.


> 
> Regarding the ctrl-C pressed by IGT user - I just checked and indeed it will
> cause a NULL pointer dereference. I can add the check for that, but the
> question is if this is a scenario we need to defend from. If yes - I'll
> happily add such check.

I think it's good practice to have programs that exit cleanly. Imagine 
doing some debugging/repro with a test that hangs for whatever reason 
and seeing a SIGSEGV after ctrl-c. The suspicion would go towards some 
invalid memory handling just to find that this is an unrelated issue.

Regards,
Christoph
> 
>>> +
>>> +	if (sig == SIGINT)
>>> +		d->received_sigint = true;
>>>    }
>>>
>>>    static void *debugger_worker_loop(void *data)
>>> @@ -1092,14 +1097,24 @@ static void *debugger_worker_loop(void
>> *data)
>>>    	igt_assert(d->master_fd >= 0);
>>>
>>>    	igt_assert_eq(sigaction(SIGINT, NULL, &sa), 0);
>>> -	sa.sa_handler = terminate_debugger;
>>> +	sa.sa_sigaction = debugger_signal_handler;
>>> +	sa.sa_flags |= SA_SIGINFO;
>>>    	igt_assert_eq(sigaction(SIGINT, &sa, NULL), 0);
>>>
>>> +	igt_assert_eq(sigaction(SIGTERM, NULL, &sa), 0);
>>> +	sa.sa_sigaction = debugger_signal_handler;
>>> +	sa.sa_flags |= SA_SIGINFO;
>>> +	igt_assert_eq(sigaction(SIGTERM, &sa, NULL), 0);
>>> +
>>>    	do {
>>>    		p.fd = d->fd;
>>>    		ret = poll(&p, 1, timeout_ms);
>>> +		if (d->received_sigint) {
>>> +			d->handled_sigint = true;
>>> +			pthread_exit(NULL);
>>> +		}
>>>
>>> -		if (ret == -1) {
>>> +		if (!d->received_signal && ret == -1) {
>>
>> I am not sure I understand what the SIGTERM handling is supposed to
>> influence here? From patch 6/6 I gather that it is supposed to maximize
>> the chance of hitting the read IOCTL but I don't see how.
> 
> The SIGTERM handling here is stopping the loop from breaking and being unable
> to reach `if (d->received_sigint)`. I'll shortly send a v5 that has this part
> a bit improved from Zbigniew's suggestions.
> 
> Thanks,
> Dominik Karol
> 
>>
>> Regards,
>> Christoph
>>
>>
>>>    			igt_info("poll failed with errno %d\n", errno);
>>>    			break;
>>>    		}
>>> @@ -1168,6 +1183,9 @@ xe_eudebug_debugger_create(int master_fd,
>> uint64_t flags, void *data)
>>>    	d->fd = -1;
>>>    	d->master_fd = master_fd;
>>>    	d->ptr = data;
>>> +	d->received_signal = false;
>>> +	d->received_sigint = false;
>>> +	d->handled_sigint = false;
>>>
>>>    	return d;
>>>    }
>>> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
>>> index 8f7f66220..46cd3463e 100644
>>> --- a/lib/xe/xe_eudebug.h
>>> +++ b/lib/xe/xe_eudebug.h
>>> @@ -44,6 +44,10 @@ struct xe_eudebug_debugger {
>>>    	pthread_t worker_thread;
>>>    	enum xe_eudebug_debugger_worker_state worker_state;
>>>
>>> +	bool received_signal;
>>> +	bool received_sigint;
>>> +	bool handled_sigint;
>>> +
>>>    	int p_client[2];
>>>    };
>>>
> 

