Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12394C7EE2A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 06:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6E010E315;
	Fri, 27 Jun 2025 06:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6PUSyTT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05F810E315
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 06:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751005596; x=1782541596;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=9UjM6fcOHYEJnR+nEn7bs345J7eJcglqI91pItiZnko=;
 b=E6PUSyTTa7i9A5HeMWU00ALqPijpWDWOIdvowxmyIgj84vXdyqDwN7oo
 3xAhv+/BIbmQG3lhWZlzc9NR4ZMkLNpP3TcMdU3GaDuyvKXAxxrgn4q2J
 ZDdpkrbLfm76rE7Qj0hYyBwxs0N55rhKfbuS5gn0velSt99RD9+vTgHHZ
 c1V+QirFdARtWLgyR9vwYAXu8MiDkTA8DdYGb4yL41mzb9aBhjhw50elc
 l3zLWym64GaawGEoAJ/4D/n9E9ko+AriC5yR7CtnY+ytK0LdmtM9ZIpQq
 Die1gsIFtmXkSSKdqaOQSMOawTd4vSf5tCqOsrdWBgD1AhgyCJNsT9ckr w==;
X-CSE-ConnectionGUID: Id5ZlwZtQTO3UWHf7oUruQ==
X-CSE-MsgGUID: 1lEHGUh3QAmFvDhc5UDbGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53410394"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="53410394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 23:26:36 -0700
X-CSE-ConnectionGUID: Oem7IA0vQ6qZIdtsxTpc0g==
X-CSE-MsgGUID: T2YWzrLrSbiqCIbWENZjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="158203326"
Received: from lmannoor-mobl.gar.corp.intel.com (HELO [10.247.224.99])
 ([10.247.224.99])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 23:26:34 -0700
Message-ID: <1364ab20-bb81-4307-a0fb-cb5c37d5b862@intel.com>
Date: Fri, 27 Jun 2025 11:56:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/pciids: Sync pciid's with kernel commit 9b779ff
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20250623133257.3807750-1-kunal1.joshi@intel.com>
 <20250623180009.rixfzijs5yll3xuk@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250623180009.rixfzijs5yll3xuk@kamilkon-DESK.igk.intel.com>
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

Hello Kamil,

On 23-06-2025 23:30, Kamil Konieczny wrote:
> Hi Kunal,
> On 2025-06-23 at 19:02:57 +0530, Kunal Joshi wrote:
>
> few nits about this for future, as this was merged already.
>
> imho subject could be short, instead of:
>
> [PATCH i-g-t] lib/pciids: Sync pciid's with kernel commit 9b779ff
>
> simple one:
> [PATCH i-g-t] lib/pciids: Sync with kernel
>
> or little more explanatory when only few changed:
>
> [PATCH i-g-t] lib/pciids: Update BMG and PTL pci ids
>
> Reason for this short subject is that you will write details
> in patch description.
>
>> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> imho this should be your 'From:' as you are porting this
> into IGT, especially when there will be more changes
> from different authors.
>
>> As per updated Bspec, Sync PCI IDs
>>
>> Sync with the following kernel commits:
>> 9b779ff ("drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg")
>> 49c6dc7 ("drm/xe/ptl: Update the PTL pci id table")
> Please use more chars for SHA1 sum, at least 12 for now, as
> suggested by checkpatch.pl script from Linux kernel source.
>
>> v1: Sync with kernel commit (Jani/Tejas)
>> v2: Specify both kernel commits in subject (Tejas)
>>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> Where is your s-o-b?
>
>> Link: https://lore.kernel.org/r/20250605190804.1287289-2-dnyaneshwar.bhadane@intel.com
>> Link: https://lore.kernel.org/r/20250520195749.371748-1-matthew.s.atwood@intel.com
> Nice, thank you for providing links to lore.
>
> Regards,
> Kamil
Thanks for feedback even after merge,
Have noted all the points will take care from next time.

Thanks and Regards
Kunal Joshi
>> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>   lib/pciids.h | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/pciids.h b/lib/pciids.h
>> index d212848d0..129c3172a 100644
>> --- a/lib/pciids.h
>> +++ b/lib/pciids.h
>> @@ -852,8 +852,11 @@
>>   	MACRO__(0xE210, ## __VA_ARGS__), \
>>   	MACRO__(0xE211, ## __VA_ARGS__), \
>>   	MACRO__(0xE212, ## __VA_ARGS__), \
>> -	MACRO__(0xE215, ## __VA_ARGS__), \
>> -	MACRO__(0xE216, ## __VA_ARGS__)
>> +	MACRO__(0xE216, ## __VA_ARGS__), \
>> +	MACRO__(0xE220, ## __VA_ARGS__), \
>> +	MACRO__(0xE221, ## __VA_ARGS__), \
>> +	MACRO__(0xE222, ## __VA_ARGS__), \
>> +	MACRO__(0xE223, ## __VA_ARGS__)
>>   
>>   /* PTL */
>>   #define INTEL_PTL_IDS(MACRO__, ...) \
>> @@ -861,6 +864,10 @@
>>   	MACRO__(0xB081, ## __VA_ARGS__), \
>>   	MACRO__(0xB082, ## __VA_ARGS__), \
>>   	MACRO__(0xB083, ## __VA_ARGS__), \
>> +	MACRO__(0xB084, ## __VA_ARGS__), \
>> +	MACRO__(0xB085, ## __VA_ARGS__), \
>> +	MACRO__(0xB086, ## __VA_ARGS__), \
>> +	MACRO__(0xB087, ## __VA_ARGS__), \
>>   	MACRO__(0xB08F, ## __VA_ARGS__), \
>>   	MACRO__(0xB090, ## __VA_ARGS__), \
>>   	MACRO__(0xB0A0, ## __VA_ARGS__), \
>> -- 
>> 2.25.1
>>
