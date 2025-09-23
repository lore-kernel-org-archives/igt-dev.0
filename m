Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57C8CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 09:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7B910E091;
	Tue, 23 Sep 2025 09:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njiINggU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226D910E091
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 09:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758619975; x=1790155975;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=PGeUB4pGqbPfeYzRmohqberFIgtTfptBechqrLhfQa8=;
 b=njiINggUH7beM5GS2+QpBGCBRy21WnCpdWug9yeHAliFWGitaB7KFUjt
 7mxBXWU/83pzZBbe6fwF/CyXlMOxb1Bu5T6FMpbv5ZsWABXp8pHNOZkb2
 KeWU7rZa1fi2xKzfZD0sa0eGy4cY+RhX4SgYjRPIsWyDfpe/BVAzRByp6
 Emyi6eDwN/rc2Gt2ozFTcfDZZk9Jt3PyfgyXMrd7BeTTHUuxHL2iX8rNa
 uXADVcbAPbjrZvmdk1szhkTMY0kcZFw6fRZHA9Hpnk3PXmXryDCTzUkhz
 RRucbxZTmvjPS00th9+jOrhXhDL+7Y9DEyzTHVzwwtRlAjR+oCpt+Nx0q w==;
X-CSE-ConnectionGUID: FJc2+6myQzOrGXoQJgMBLw==
X-CSE-MsgGUID: uSy/bH8zQKi+qb0vnvRY7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78500439"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="78500439"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 02:32:55 -0700
X-CSE-ConnectionGUID: wwR4Z5WbRNa5AqmM56wvwQ==
X-CSE-MsgGUID: 4wg37PTRQ/W7owEcXmESmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="207472433"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.190])
 ([172.28.180.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 02:32:54 -0700
Message-ID: <00a31b63-b1ae-43cc-9679-3c307fcdc7a0@intel.com>
Date: Tue, 23 Sep 2025 11:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_list: igt_list_empty() Detect uninitialized
 list
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20250922162340.20034-1-peter.senna@linux.intel.com>
 <0a1dc4a1-a910-43c5-b078-4e9cf3cc3f91@intel.com>
 <f750c914-c68e-4fe6-9ecd-9cf1731c502e@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <f750c914-c68e-4fe6-9ecd-9cf1731c502e@linux.intel.com>
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

Hi Peter,

On 23.09.2025 11:20, Peter Senna Tschudin wrote:
> Hi Christoph,
> 
> On 9/23/2025 10:14 AM, Manszewski, Christoph wrote:
>> Hi Peter,
>>
>> On 22.09.2025 18:23, Peter Senna Tschudin wrote:
>>> Add a check to igt_list_empty() to return true if the list head pointer
>>> or its next/prev pointers are NULL, preventing segfaults when operating
>>> on uninitialized or potentially broken lists.
>>>
>>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>>> ---
>>>    lib/igt_list.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/lib/igt_list.c b/lib/igt_list.c
>>> index 37ae139c4..f77aef7dd 100644
>>> --- a/lib/igt_list.c
>>> +++ b/lib/igt_list.c
>>> @@ -79,5 +79,9 @@ int igt_list_length(const struct igt_list_head *head)
>>>      bool igt_list_empty(const struct igt_list_head *head)
>>>    {
>>> +    /* Detect uninitialized / potentially broken list */
>>> +    if (!head || !head->next || !head->prev)
>>> +        return true;
>>> +
>>
>> Without this change:
>> 1. Passing an uninitialized list is a bug
>> 2. The function doesn't check any condition and returns 'normally'
>> regardless
>>
>> With this change:
>> 1. Passing an uninitialized list is a bug (still)
>> 2. The function *may* detect an uninitialized list which is a bug but
>> returns 'normally' regardless
>>
>> If we are adding a check that catches some invalid/buggy condition the
>> reasonable thing to do would be to assert/abort.
> 
> I agree with you. I would say that even more concerning is to distance
> our implementation from the kernel implementation. I suggest we nack
> this change. If you are ok with it

Well either way is fine with by me. I just wanted to make a point that 
when we add a check that catches a bug it makes sense to alarm the 
developer right away.

Regards,
Christoph

> 
> Nacked-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> 
>>
>> Regards,
>> Christoph
>>
>>
>>>        return head->next == head;
>>>    }
>>
> 

