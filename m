Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160F0CAC5B0
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 09:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7C510E5C6;
	Tue, 23 Sep 2025 09:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eL/xzm2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB7810E5C6
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758619294; x=1790155294;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=PqD1aWzb+j1302ZNCJn1GR9wfEcH52yjnnNMuO8Ql+A=;
 b=eL/xzm2Lrq5D5cEkq5pLsZzySn0QjPqLYhLX56OrINLoZwiLUwyB4dIT
 0Vm6m/qDVtxyO1fyn5w7K/MI16WIk6FfKEnOmLJZmJ6pQiNJQ6LbhBZhX
 YkLA0hYs6cyS2/9rhZ6SV6n2dPgTMQleWOpZDxhteQq0DHQXX+JbL+hLI
 vZ/24gBr154PooCbYF9Bzm/snI4AarXr9R/DhIfr56IPLq/y29HQDH5St
 W3JgsEGL8ma0OqZ9XAQIqgID7L24X2iC/VbCY9EJ1YVMhZ/yAJq/UPb9a
 2O1FLffa75uhPUoPFUM4g1L05vsoJSd4aYaT2C/X6ib9Dix3OsXtmhb6p Q==;
X-CSE-ConnectionGUID: 6s00Qg5PTOy7tPnUg0FasA==
X-CSE-MsgGUID: ueVsHyGeRHSh46pQzPaJYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60783607"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="60783607"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 02:21:34 -0700
X-CSE-ConnectionGUID: r6n50trPRKisrCg14MgRGQ==
X-CSE-MsgGUID: Tro+vvntTxeiC4XbW5/Vsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="176008657"
Received: from dstepnow-mobl.amr.corp.intel.com (HELO [10.246.0.32])
 ([10.246.0.32])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 02:21:31 -0700
Message-ID: <f750c914-c68e-4fe6-9ecd-9cf1731c502e@linux.intel.com>
Date: Tue, 23 Sep 2025 11:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_list: igt_list_empty() Detect uninitialized
 list
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20250922162340.20034-1-peter.senna@linux.intel.com>
 <0a1dc4a1-a910-43c5-b078-4e9cf3cc3f91@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <0a1dc4a1-a910-43c5-b078-4e9cf3cc3f91@intel.com>
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

Hi Christoph,

On 9/23/2025 10:14 AM, Manszewski, Christoph wrote:
> Hi Peter,
> 
> On 22.09.2025 18:23, Peter Senna Tschudin wrote:
>> Add a check to igt_list_empty() to return true if the list head pointer
>> or its next/prev pointers are NULL, preventing segfaults when operating
>> on uninitialized or potentially broken lists.
>>
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>>   lib/igt_list.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/lib/igt_list.c b/lib/igt_list.c
>> index 37ae139c4..f77aef7dd 100644
>> --- a/lib/igt_list.c
>> +++ b/lib/igt_list.c
>> @@ -79,5 +79,9 @@ int igt_list_length(const struct igt_list_head *head)
>>     bool igt_list_empty(const struct igt_list_head *head)
>>   {
>> +    /* Detect uninitialized / potentially broken list */
>> +    if (!head || !head->next || !head->prev)
>> +        return true;
>> +
> 
> Without this change:
> 1. Passing an uninitialized list is a bug
> 2. The function doesn't check any condition and returns 'normally'
> regardless
> 
> With this change:
> 1. Passing an uninitialized list is a bug (still)
> 2. The function *may* detect an uninitialized list which is a bug but
> returns 'normally' regardless
> 
> If we are adding a check that catches some invalid/buggy condition the
> reasonable thing to do would be to assert/abort.

I agree with you. I would say that even more concerning is to distance
our implementation from the kernel implementation. I suggest we nack
this change. If you are ok with it

Nacked-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> 
> Regards,
> Christoph
> 
> 
>>       return head->next == head;
>>   }
> 

