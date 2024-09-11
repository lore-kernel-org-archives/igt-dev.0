Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3969CEDE998
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 07:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7259910EA16;
	Wed, 11 Sep 2024 07:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="See5AqDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434A810EA11
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 07:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726038463; x=1757574463;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Lew2fWrqSO3M4KXuB4HYBW2CbZCXJuQBljPl8ycOl74=;
 b=See5AqDmcUxwjwW5uXs3sY0J5qUHuDvZ6G3CYgBx+eo7HDfPFEO0ITrV
 X/KpDZhIjv6PaaweOD+3iCpJBoB9BUeP5lKW4/Hyex8ZEEREo+9jvZ4jD
 MWhgCa/8Q+/s+OdobbucIGhQ0Auo8oBpALnk5jt+nNWnIm0EgAWFBChS1
 Sr/SmMhQ1WHGgazQrE82vBpNykiam1iqXExl8KK6x+UerM4tHBjOM/8vR
 bJDaTneY9gba1Iei9YKwAurxdSS99pVtmc74jznpVK/SUFj4a777Ajjvj
 OGShDNvrP6bYrazUhMNlIik3HiTI63GjY3vaec0+VpeQXzgUV91fJ4R0O A==;
X-CSE-ConnectionGUID: AfzQorDPQU+XMAkxgtcvJg==
X-CSE-MsgGUID: b3TVDQaMQJuENFuNaCSnBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42339773"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="42339773"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 00:07:42 -0700
X-CSE-ConnectionGUID: l2MYTtlXQ8+8GibNVabQvA==
X-CSE-MsgGUID: SiHWY/5lTYCI9MJ2LppzAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67558253"
Received: from mjaroshe-mobl1.ger.corp.intel.com (HELO [10.246.0.112])
 ([10.246.0.112])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 00:07:41 -0700
Message-ID: <da9e03fa-1ecf-49eb-84ef-66aeee6bd99d@linux.intel.com>
Date: Wed, 11 Sep 2024 09:06:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5] runner/executor: Detect when child process is
 killed by a signal
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>
References: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
 <4c126777-6899-407c-911f-27e25ca8191e@linux.intel.com>
 <20240910155814.jq2og45xf7apwb64@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20240910155814.jq2og45xf7apwb64@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Kamil,

Thank you for your review.

On 10.09.2024 17:58, Kamil Konieczny wrote:
> Hi Peter,
> On 2024-09-03 at 14:05:05 +0200, Peter Senna Tschudin wrote:
>> Make igt-runner aware about tests being killed by signals. Before this
>> patch, manually killing a test process would result in igt-runner silently
>> marking the test as incomplete.
>>
>> Now igt-runner aborts the run verbosely. As an example the following was
>> extracted from results.json:
>>  This test caused an abort condition: Test terminated by a signal Killed (-9).
>>
>>  v5: do not use sigdescr_np() as it seems to be a fairly new lib function that does
>>      not compile on older Ubuntu
>>  v4: improve abort code path to not interfere with igt-runner timeouts
>>  v3: do not interfere with igt-runner killing tests due to timeout and diskspace
>>  v2: fix race condition
>>
>> Cc: Petri Latvala <adrinael@adrinael.net>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>
> 
> Your signed-off-by is different from your e-mail:
> Peter Senna Tschudin <peter.senna@linux.intel.com>

That was a feature, not a bug.

> 
> checkpatch.pl script warns:
> 
> 100: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Peter Senna Tschudin <peter.senna@linux.intel.com>' != 'Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>'

Will fix and not repeat.

> 
>> ---
>>  runner/executor.c | 38 +++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/runner/executor.c b/runner/executor.c
>> index ac73e1dde..990d932f3 100644
>> --- a/runner/executor.c
>> +++ b/runner/executor.c
>> @@ -888,6 +888,8 @@ static int monitor_output(pid_t child,
>>  	const int interval_length = 1;
>>  	int wd_timeout;
>>  	int killed = 0; /* 0 if not killed, signal number otherwise */
>> +	bool child_reaped = false;
>> +	bool child_killed_by_signal = false;
>>  	struct timespec time_beg, time_now, time_last_activity, time_last_subtest, time_killed;
>>  	unsigned long taints = 0;
>>  	bool aborting = false;
>> @@ -960,6 +962,25 @@ static int monitor_output(pid_t child,
>>  
>>  		igt_gettime(&time_now);
>>  
>> +		/* Testing for !killed to prevent aborting too early after igt-runner
>> +		 * decides to kill a process.
>> +		 */
>> +		if (!killed && (child == waitpid(child, &status, WNOHANG))) {
>> +			child_reaped = true;
>> +			if (WIFSIGNALED(status)) {
>> +				child_killed_by_signal = true;
>> +				killed = WTERMSIG(status);
>> +
>> +				/*
>> +				 * Do not abort just yet, because igt-runner can kill the test
>> +				 * due to a timeout for example. Aborting here prevents
>> +				 * igt-runner from reporting a timeout. The code that aborts
>> +				 * the run after the test was killed is at the end of the
>> +				 * while() loop.
>> +				 */
>> +			}
>> +		}
>> +
> 
> Why is it here? Imho better place it at second hunk.

Please notice that the problem is that igt-runner does not check if a child ended due to a signal, but it notices when a child ends. The problem with your suggestion is that the loop _may_ decide to exercise the old behavior and simply mark the test as incomplete.

My proposal is to always check for child termination due to a signal, and hence unconditional detection before all other logic inside the loop. However there are corner cases, such as excessive disk space consumption by a test, in which igt-runner will signal a test, and will check for the child being signaled. To not interfere with these corner cases, the detection of a signal and taking the action of aborting the run are at different places.

> 
>>  		/* TODO: Refactor these handlers to their own functions */
>>  		if (outfd >= 0 && FD_ISSET(outfd, &set)) {
>>  			char *newline;
>> @@ -1241,7 +1262,11 @@ static int monitor_output(pid_t child,
>>  				errf("Error reading from signalfd: %m\n");
>>  				continue;
>>  			} else if (siginfo.ssi_signo == SIGCHLD) {
>> -				if (child != waitpid(child, &status, WNOHANG)) {
> 
> This code here do what you wrote at first hunk:
> 	if (child != waitpid(child, &status, WNOHANG)) {
> 		// fatal err, set status=9999
> 	} else { // all 'else if' checks 'child == '
> 	}
> 
> The only difference is that your code calls waitpid() unconditionally
> before loop. Could you write some testing code in one simple test

Exactly. Calling waitpid() unconditionally, and early enough to catch all signals.

> and make checks on trybot? e.g. to not rely that your code will
> catch such scenarios if they are rarly seen but to test them in
> predictable way. You could also add here some debugs.

I did not understand what you want to test. The "condition" here is igt-runner itself killing a test due to excessive disk space consumption for example.

Please let me know how to proceed.

Thank you!

[...]
