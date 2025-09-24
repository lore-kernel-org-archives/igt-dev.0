Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1EECAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 11:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20F610E712;
	Wed, 24 Sep 2025 11:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuiB77Jk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B91910E70E
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 11:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758714538; x=1790250538;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PJQ7vkErrr3GOvpgPaHqmPCf6GThF8zZnqYus12GF3A=;
 b=AuiB77JkdkZgshdH0fZuhrNLVKC6CWEG1bbp08lrqkMriU5JNNwCGzc5
 L1AFIh/DdRfg6yljqr9lLyn7P6WpCPN6Bzg6Jm2YgJtg1BXbc5fAhJiZq
 c4bNP6YnUiww9Y3sePChfJQxtbZVRKpeCASGEHHGvfGHIp4Vth1wSkucc
 NursoVOnJRjwEu9KT/X+YnygXVvHlKrRqxGFE+93ZpNAj2PdHTrpYRXuX
 n1fXZTuPMaeYDNvy01dFRappIFHj8UOYfvZ5RtJTDhLFHnE70ncaC4hlT
 pNR4BXFzDr2Hav4ospSea2iI4MPDRnZ2eS7H5ntt4hmAKvmfDK0Dxds5G Q==;
X-CSE-ConnectionGUID: ia0MADSoSlS7o/LloURb4A==
X-CSE-MsgGUID: aSkZMFPERbSe2EuJjLfCPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72366200"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="72366200"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:48:58 -0700
X-CSE-ConnectionGUID: CicHyToVRYieCav3qqArEw==
X-CSE-MsgGUID: rBb+b+BxQwCQKLXNDUCDfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177789245"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.190])
 ([172.28.180.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:48:57 -0700
Message-ID: <ff659d30-ef6f-4d66-816e-580721beab66@intel.com>
Date: Wed, 24 Sep 2025 13:48:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 6/6] tests/xe_eudebug_online: Improve issuing
 SIGINT in set-breakpoint-sigint-debugger
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-7-dominik.karol.piatkowski@intel.com>
 <rrwptxvacd43d3olx6nvqtodzsjnti3yud3mflvtepdkgsc6xn@dxchujdcwj6p>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <rrwptxvacd43d3olx6nvqtodzsjnti3yud3mflvtepdkgsc6xn@dxchujdcwj6p>
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

On 24.09.2025 08:40, Zbigniew Kempczyński wrote:
> On Tue, Sep 23, 2025 at 03:10:02PM +0200, Dominik Karol Piątkowski wrote:
>> Use xe_eudebug_debugger_kill instead of pthread_kill. Wait for the
>> SIGINT handling to complete before closing the debugger fd to avoid
>> tripping over asserts. Issue some SIGTERM signals in quick succession
>> before SIGINT to raise the odds of hitting the ioctl.

So as stated previously - I don't quite understand how this is supposed 
to work.

>>
>> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
>> ---
>>   tests/intel/xe_eudebug_online.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
>> index aa58e5f99..2db1c5bef 100644
>> --- a/tests/intel/xe_eudebug_online.c
>> +++ b/tests/intel/xe_eudebug_online.c
>> @@ -1600,7 +1600,14 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>>   		else if (event_count > 0 && event_count < events_max)
>>   			sigints_during_test++;
>>   
>> -		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);
> 
> I would add comment about what SIGTERM does in this case.
> I know it is in commit message, but reading it in the code
> instead of digging in commit logs is faster.
> 
>> +		for (int i = 0; i < 50; i++) {
> 
> Define some self-explain macro, like:
> 
> #define SIGTERM_TRIES 50
> 
>> +			xe_eudebug_debugger_kill(s->debugger, SIGTERM);

To me it looks like this is establishing some alternative communication 
between the session thread and worker loop through signals to skip 
waiting on 'poll'. But if we SIGTERM poll, xe_eudebug_read_event won't 
get called anyway. I may be missing something here so I would appreciate 
some explanation.

Regards,
Christoph
>> +			usleep(rand() % 1000);
>> +		}
>> +		xe_eudebug_debugger_kill(s->debugger, SIGINT);
>> +		/* XXX: Don't close debugger fd before it dies */
> 
> Remove XXX, this comment what it does is fine.
> 
> With above nits addressed:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> --
> Zbigniew
> 
>> +		while (!s->debugger->handled_sigint)
>> +			usleep(1000);
>>   		close(s->debugger->fd);
>>   
>>   		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
>> -- 
>> 2.34.1
>>

