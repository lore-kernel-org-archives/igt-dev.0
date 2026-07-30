Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997E4C54FD2
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 10:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4084810E66A;
	Thu, 30 Jul 2026 10:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfTT8FO0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242F910E66A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785405931; x=1816941931;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ul5RwVdCAj+xjlJ1WtBFmeSEjqO2wIKSRjaH9N1YnrQ=;
 b=JfTT8FO0OnR7klzfHkzGBH+427zMLVKWPb0CJzKcTndJ8y5kNuZFKSNT
 rRMeMyqF3MR0NfI8J8vwo0j3FXhYmmCphLlOYGunvOypS2RHjKMcGL2bv
 UgF2siu5NCIuTZfFVF95MIeqoi9MNTo+UvOliF7ZlelEl+RvKXtZfjcu+
 RMNI8ZRTGSQqwuxdRJaTRIihPQ6I4ggkPOIDq9GLQV4i5Uffud17Ks+Fu
 N1RNGNMr6ZWi3MNTHskMi0Mo//qAd06KF5pFjI5bPGTENbZWakK+OCQ4k
 J0Pkp0StnqfEwYV6QsjTgk4mfuDakrQg5Q8eycrwgepitrKiSFWkMT8qp w==;
X-CSE-ConnectionGUID: v3IfNDRsSayBCU8x6usG+g==
X-CSE-MsgGUID: BM1HOov+RkW3+oqkyysI2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85784096"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="85784096"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 03:05:30 -0700
X-CSE-ConnectionGUID: zY0b3mazS3GvJA6+7WOwXw==
X-CSE-MsgGUID: TetpikJySzmoHhPxjqyT4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="284833061"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.68])
 ([172.28.182.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 03:05:28 -0700
Message-ID: <a3771498-6f76-4355-98af-d4c1f623d13e@linux.intel.com>
Date: Thu, 30 Jul 2026 12:05:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_spin: initialize ticks_delta to ~0u
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, adam.miszczak@linux.intel.com,
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com
References: <20260728102659.316861-1-marcin.bernatowicz@linux.intel.com>
 <20260728102659.316861-2-marcin.bernatowicz@linux.intel.com>
 <p5dtghxjmq72gubqeydls5spgmtlonwlb5rdhs2iaapsubxqfr@ucwnjmu3diio>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <p5dtghxjmq72gubqeydls5spgmtlonwlb5rdhs2iaapsubxqfr@ucwnjmu3diio>
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


On 7/29/2026 11:42 AM, Zbigniew Kempczyński wrote:
> On Tue, Jul 28, 2026 at 12:26:58PM +0200, Marcin Bernatowicz wrote:
>> Initialize ticks_delta to ~0u instead of 0. This value does not satisfy
>> the COND_BBE exit condition and prevents false batch termination.
> May you elaborate? Does it mean STORE-DWORD (loop) is not visible in the memory
> before COND_BBE is executed? IIUC with ~0 we could also drop this loop.
The issue is not about the STORE-DWORDs (loop) visibility within a 
single batch; that's what the pad is for and that path works fine.
The problem is a cross-iteration potential stale cache read: when the 
same BO is re-submitted, COND_BBE can read the ticks_delta value leftover
from the previous batch execution - which is <= ctx_ticks (since that's 
the exit condition) - and immediately exit before the new SRM write 
propagates.

With ticks_delta = 0 (or any value <= ctx_ticks at prev-iteration exit), 
a stale read satisfies COND_BBE.
With ~0u, even a stale read of the sentinel gives 0xFFFFFFFF <= 
ctx_ticks -> false -> batch continues safely.

To reproduce: each gem_wsim invocation does 4000 submit/wait cycles on 
the same BO (5 engines × 5ms each).
The failure appears only after many outer iterations under sustained load:

i=1; while true; do
     echo "Iteration: $i"
     gem_wsim -w 
"1.RCS.5000.0.0,1.BCS.5000.0.0,1.CCS.5000.0.1,1.VCS.5000.0.0,1.VECS.5000.0.0" 
-VV -r 4000 || break
     ((i++))
done

Typical failure after ~60 outer iterations:

CRITICAL: Failed assertion: w->duration.requested_ticks <= 
~w->xe.data->spin.ticks_delta
CRITICAL: error: 96000 > 2 (sometimes 0, 1)

With the sentinel reset before each submission, ran two days without 
failure.

--

Marcin

>
> --
> Zbigniew
>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   lib/xe/xe_spin.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>> index 874310789..331bed1d2 100644
>> --- a/lib/xe/xe_spin.c
>> +++ b/lib/xe/xe_spin.c
>> @@ -60,7 +60,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>>   	spin->start = 0;
>>   	spin->end = 0xffffffff;
>>   	spin->wait_cond = 0;
>> -	spin->ticks_delta = 0;
>> +	spin->ticks_delta = ~0u;
>>   
>>   	if (opts->ctx_ticks) {
>>   		/* store start timestamp */
>> -- 
>> 2.43.0
>>
