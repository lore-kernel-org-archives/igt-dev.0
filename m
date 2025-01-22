Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877B2C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 12:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB2B10E300;
	Wed, 22 Jan 2025 12:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IjOF4jvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B534810E300
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 12:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737548625; x=1769084625;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wf8Z4vN9sbZ0cJkcHtb8vs1PPACoZwH2l8rW5Sah4Yw=;
 b=IjOF4jvB3MXECn0PTAOLnO94n5JWYIqgo0Uyvmtl+1ZwwGovENLIOZob
 pyI3GdeL/EypXhJ1HO2m+50luVjXiKY+rC9W3vOlzVyqrZTUTAinhwZB3
 JayMmG956m58nuyp/m/NR1stiVv0ttWtlcYqn9xEjYVM9VnHfOOpwDJdb
 fsJt8Q1pxjVLIt8kHZ9AZ4bv8N/KOrCQsxCfmqIWRnO4KoP8r/lPqH/Q7
 gazkFdNjvIA38JROQk0BRf3Kuv18eWMA0KEmElFbSqF5PhsxaeAbVnuR1
 tNn2LhKkxvhQAqhxDK99xeieIPAfl52eNeqy6dYusqhrS9qt2IqsRd9rm w==;
X-CSE-ConnectionGUID: Z97q2/bzShCpNUr3/ieSEg==
X-CSE-MsgGUID: UVL3XGAgTwq4WkyPtcyBUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48988063"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48988063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:23:45 -0800
X-CSE-ConnectionGUID: jzSUMcsdQXyVv6uoJgwDnQ==
X-CSE-MsgGUID: +0wBraKyS0as6pDFB4ucew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144380618"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:23:43 -0800
Message-ID: <6fc646e3-1094-4f8b-805f-4d0450d49b45@linux.intel.com>
Date: Wed, 22 Jan 2025 13:23:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 5/7] runner: Free settings at the end
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-6-lucas.demarchi@intel.com>
 <173754639369.5500.6720737629497603639@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173754639369.5500.6720737629497603639@intel.com>
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



On 22.01.2025 12:46, Gustavo Sousa wrote:
> Quoting Lucas De Marchi (2025-01-21 19:57:31-03:00)
>> Keep valgrind happy with the normal allocations so we can find the real
>> leaks. Avoid this kind of leak:
>>
>>        ==806592== 8 bytes in 1 blocks are definitely lost in loss record 46 of 188
>>        ==806592==    at 0x4846828: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
>>        ==806592==    by 0x4BD534E: strdup (strdup.c:42)
>>        ==806592==    by 0x10E6AA: parse_options (settings.c:863)
>>        ==806592==    by 0x10D2DD: main (runner.c:19)
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> This looks correct, so:
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> 
> , but it seems we also need to make initialize_execute_state() and
> initialize_execute_state_from_resume() properly clear_settings() when
> things go wrong internally.
> 
> --
> Gustavo Sousa
> 
>> ---
>> runner/resume.c | 2 ++
>> runner/runner.c | 2 ++
>> 2 files changed, 4 insertions(+)
>>
>> diff --git a/runner/resume.c b/runner/resume.c
>> index 0f4e42bfa..ed17351c6 100644
>> --- a/runner/resume.c
>> +++ b/runner/resume.c
>> @@ -55,6 +55,8 @@ int main(int argc, char **argv)
>>                 exitcode = 3;
>>         }
>>
>> +        clear_settings(&settings);
>> +
>>         printf("Done.\n");
>>         return exitcode;
>> }
>> diff --git a/runner/runner.c b/runner/runner.c
>> index 4855ad641..258b30b36 100644
>> --- a/runner/runner.c
>> +++ b/runner/runner.c
>> @@ -49,6 +49,8 @@ int main(int argc, char **argv)
>>                 exitcode = 1;
>>         }
>>
>> +        clear_settings(&settings);
>> +
>>         printf("Done.\n");
>>         return exitcode;
>> }
>> -- 
>> 2.48.0
>>

