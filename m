Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2C5C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 12:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0DF10E1BA;
	Wed, 22 Jan 2025 12:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WpC3+g1s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C0B10E300
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737548597; x=1769084597;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tIc6BEZcPXgTGNzhbYdvOocD5okZX9SkmYv/4aDp/uc=;
 b=WpC3+g1sek/QFJispHCSNQP5R7dQlDKB9Ko/evys5OinvedOj6q4VDdk
 DIFBoQ4gDLrPClhirtgitl6fGE7OluRMJ4zPEMrqXIgPm4xEMSYbRu3DM
 Oexh83lDcScKp3TrqWZTuBhf0efeZ0vcQrv3oVtPdmSwUrr0G1DFdQ+Cl
 Iz2MNPPAo5SWxqKbsSSU9bHgW8Q5EYR6jH7Qw4pynhd10/1MbDirq+Q4X
 lzZi+MG7qH7bAp2JDOMcJWkHBP15pxoUfbvg/D2auBUXUA3iiorGrQZ2s
 ByNe3NHbLltEY5iJZ3FSPMG20FkcDdXPfPwlowWt+q0lOqDKd1fpeGQro g==;
X-CSE-ConnectionGUID: TQPJ4+QDRD+3azrYOSRsbQ==
X-CSE-MsgGUID: FRdqCOY+TB+Q06hCXpYkJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48988011"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48988011"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:23:17 -0800
X-CSE-ConnectionGUID: 8UH2pJU2QkuZH7mA1CYxsQ==
X-CSE-MsgGUID: Fwfk5JmNR9GB+Nm+0/vmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144380577"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:23:15 -0800
Message-ID: <49adad36-8f4c-499c-9f2f-7034e1a8f420@linux.intel.com>
Date: Wed, 22 Jan 2025 13:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/7] runner/settings: Fix code_coverage_script
 leak
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-5-lucas.demarchi@intel.com>
 <173754587225.5500.1182733749364345922@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173754587225.5500.1182733749364345922@intel.com>
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



On 22.01.2025 12:37, Gustavo Sousa wrote:
> Quoting Lucas De Marchi (2025-01-21 19:57:30-03:00)
>> Make sure to free it when clearing settings.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> 
>> ---
>> runner/settings.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/runner/settings.c b/runner/settings.c
>> index 96377f1de..2787869ee 100644
>> --- a/runner/settings.c
>> +++ b/runner/settings.c
>> @@ -640,6 +640,7 @@ void clear_settings(struct settings *settings)
>>         free(settings->name);
>>         free(settings->test_root);
>>         free(settings->results_path);
>> +        free(settings->code_coverage_script);
>>
>>         free_regexes(&settings->include_regexes);
>>         free_regexes(&settings->exclude_regexes);
>> -- 
>> 2.48.0
>>

