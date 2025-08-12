Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F45CA0EC4
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 15:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF1710E03C;
	Tue, 12 Aug 2025 15:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jra9dXqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE2710E03C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 15:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755013784; x=1786549784;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3nqteJpliyUgUMXzbmszISmkdl5zUAyjRFCdw2zyphE=;
 b=jra9dXqpbDGcdSwwRq3Ua5Noo4gKbDustV3bXsjKRnAMl8tVTM12BHbF
 sMwn15cwdm+MP0CHOb150LfiN9KNE8Db8k7/PL7byi+lX9w7+yiB39+mC
 vDGC0Hw3BXlxKm5rdcoeVMQuSTbznRF9DvIbVukAnvLDJ1ViM1xafZCcQ
 GLZt/B9Cwj1YN0RNi7nDC+iWLZEu7kXe19L0pp0ZaRlWA72s75LU7rQQG
 d5zzRZMkCf6zAv/xjx/wEinw08tsGD01QCfHTZ81marUr3arey+wMedjN
 l831ApG6llsEVcGaxQ7j5Pfy9CgRtLqG1zBxic7n7+w1gP+ICxgKkYqLO A==;
X-CSE-ConnectionGUID: jK8kWksWR0iVWT9OqpZf2w==
X-CSE-MsgGUID: /4J6xhDuQ4irfnodoBlp/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61096793"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="61096793"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 08:49:43 -0700
X-CSE-ConnectionGUID: g8yUueRoSS2iG3M8jtqK9w==
X-CSE-MsgGUID: 8OK4sqtNS7u/4VjqnDhW+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170447669"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 08:49:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ravi Kumar Vodapalli
 <ravi.kumar.vodapalli@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH i-g-t] lib/pciids: sync pciids.h with kernel
In-Reply-To: <20250812115914.chsogn6zvfxd6ugb@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250811130901.288178-1-jani.nikula@intel.com>
 <20250812115914.chsogn6zvfxd6ugb@kamilkon-DESK.igk.intel.com>
Date: Tue, 12 Aug 2025 18:49:38 +0300
Message-ID: <eef2cf9f34025eff3445edb74dcf98eac6d9099b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 12 Aug 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Hi Jani,
> On 2025-08-11 at 16:09:01 +0300, Jani Nikula wrote:
>> Syncing lib/pciids.h with kernel include/drm/intel/pciids.h means there
>> must exist kernel and igt commits where the files are identical,
>> i.e. the file is copied verbatim at some kernel commit to igt.
>> 
>> It does *not* mean syncing the *changes* of a kernel commit to the igt
>> version of the file.
>> 
>> The latest changes to lib/pciids.h have gone out of sync with kernel,
>> completely missing kernel commit 3c0f211bc8fc ("drm/xe: Add Wildcat Lake
>> device IDs to PTL list").
>> 
>> Properly sync PCI IDs with kernel commit ccfb15b8158c ("drm/xe/bmg: Add
>> one additional PCI ID"), including the full file.
>> 
>> Fixes: 26ddb59c1d5f ("lib/pciids: Add one more PCI ID to BMG")
>> Cc: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Thank you for update of pciids, imho subject could be improved,
> something like:
>
> [PATCH i-g-t] lib/pciids: Add Wildcat Lake
>
> so it will be more informative with git log --oneline
>
> No need for resend, this could be done at merge so
>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks, pushed with the subject updated.

BR,
Jani.

>
>> ---
>>  lib/pciids.h | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/lib/pciids.h b/lib/pciids.h
>> index 666265b5f8c8..76f8d26f9cc9 100644
>> --- a/lib/pciids.h
>> +++ b/lib/pciids.h
>> @@ -872,6 +872,8 @@
>>  	MACRO__(0xB08F, ## __VA_ARGS__), \
>>  	MACRO__(0xB090, ## __VA_ARGS__), \
>>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
>> -	MACRO__(0xB0B0, ## __VA_ARGS__)
>> +	MACRO__(0xB0B0, ## __VA_ARGS__), \
>> +	MACRO__(0xFD80, ## __VA_ARGS__), \
>> +	MACRO__(0xFD81, ## __VA_ARGS__)
>>  
>>  #endif /* __PCIIDS_H__ */
>> -- 
>> 2.47.2
>> 

-- 
Jani Nikula, Intel
