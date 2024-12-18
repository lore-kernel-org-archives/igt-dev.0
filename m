Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214C0E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 09:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62D710E24B;
	Wed, 18 Dec 2024 09:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FkyrFxFy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF6B10E24B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 09:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734514593; x=1766050593;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=7ZXUfa5IVy5FVCjhGwCJ9qgi12b2eOCKiuG33WvViWk=;
 b=FkyrFxFyMukiJcuUP8YiwN991HIHui5VcX3hFwGaVemK1Oe9JJ3ZQuWT
 8xrghcNjVGfWvWreXNaLfQsatwbN/NWtXBYHN8lu544ce0fxxybChMB6E
 JnksT7MFWvYb6fYiRH8ay/gN4fdmaUCFL65bbH6y5cvvvsNdn0bV4EBOR
 YSlz5KuJ4qzicDky9BJUPZZ5jlnRC3c/Q3GO/eX3QcWdrFSQyyy9/jzhT
 jsI/U1RmPNepbURxD49T6LLvbfV4ArsxO7AQF3Q2gVii56vwluwP1aULH
 9P89fQ1JhMt1PjxDND+KzQQoiBvgD37pmHYF8MHUstol3yS/AZPP9927O A==;
X-CSE-ConnectionGUID: jZcKXTohR2CMAQVF+DiU5w==
X-CSE-MsgGUID: KPeMbTeFTJ6CO6FqnWOToA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34862796"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="34862796"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 01:36:33 -0800
X-CSE-ConnectionGUID: tnNr2pTYTqWjrDGT6aswjw==
X-CSE-MsgGUID: hT1RcV8bSgmKeQ0w3UtR7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="102642602"
Received: from sshkruni-mobl2.ger.corp.intel.com (HELO [10.213.202.48])
 ([10.213.202.48])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 01:36:32 -0800
Message-ID: <17f7620a-c797-447a-8eea-f9120e8af98f@linux.intel.com>
Date: Wed, 18 Dec 2024 10:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241217135659.673564-1-pravalika.gurram@intel.com>
 <55894817-9c88-4e95-b648-72e3f031e10c@linux.intel.com>
Content-Language: en-US
In-Reply-To: <55894817-9c88-4e95-b648-72e3f031e10c@linux.intel.com>
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

Hi Pravalika,

Two more cents.

On 18.12.2024 09:56, Peter Senna Tschudin wrote:
> Hi Pravalika,
> 
> Please see my comment below.
> 
> On 17.12.2024 14:56, Pravalika Gurram wrote:
>> Read and dump  below debugfs entries.
>> ggtt
>> register-save-restore
>> workarounds
>> default_lrc_rcs
>> default_lrc_ccs
>> default_lrc_bcs
>> default_lrc_vcs
>> default_lrc_vecs
>> hwconfig"
>>
>> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
>> ---
>>  tests/intel/xe_debugfs.c | 46 ++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>
>> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
>> index 700575031..bcbb5036a 100644
>> --- a/tests/intel/xe_debugfs.c
>> +++ b/tests/intel/xe_debugfs.c
>> @@ -162,6 +162,16 @@ test_gt(int fd, int gt_id)
>>  		"pat",
>>  		"mocs",
>>  //		"force_reset"
>> +		"ggtt",
>> +		"register-save-restore",
>> +		"workarounds",
>> +		"default_lrc_rcs",
>> +		"default_lrc_ccs",
>> +		"default_lrc_bcs",
>> +		"default_lrc_vcs",
>> +		"default_lrc_vecs",
>> +		"hwconfig"
>> +

1. Are we confident that these will always be present? I am asking because
   of the igt_assert() that will abort when an entry is not found.

2. Why don't we simply scan for available files instead of hard coding
   expected files?

Thanks
