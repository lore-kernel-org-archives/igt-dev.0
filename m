Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F32C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 12:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B7F10E300;
	Wed, 22 Jan 2025 12:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCJskyfT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558C910E300
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737548582; x=1769084582;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3gkBlJb6tNxbI8Hb5GXin1wOvU2CgeuCaaBCEjfpo14=;
 b=cCJskyfTsEI/LOTAGpQ5c7dLZNp0Ufogds+VORnhy1loFEJTA1DhAAZm
 LVc+gDRViYa7gqEi+0Zj7y8RaCzPnF2EDEuWm9IT1NHGLdAGF7jGwWvch
 mxfWldElHbzYoPTC37/pttP7FFhAIfOB7IEu7EVe/Xb8h84oqVLnnu0AW
 E+2GLXFsReB4gMesNKlkw3Ae4StZfz8ut0B7fXJoYK3dewlIdzrs1NfBU
 5sq/+0NxXTQFZBkWye6k0fOi7Oe2fjJ3iot1YwzjPFgeJQe9chLzNYMCn
 vzvfz3O7wc+5cZylqPaYUbrYBQjmSSduIsoAvrddyD7btzzZJiIYUf5P+ Q==;
X-CSE-ConnectionGUID: v81ACoE+Sd2Pu6OZoa92rQ==
X-CSE-MsgGUID: IbZSGHZRQD+Dw6JZO9MOPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48987968"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48987968"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:23:02 -0800
X-CSE-ConnectionGUID: XQtBX7fgSyqBVoYLoO6E9Q==
X-CSE-MsgGUID: R5Rj349aQy2TIZgX9OzYWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144380562"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:23:00 -0800
Message-ID: <8e2f2226-99c0-47d6-af3d-6a5532238418@linux.intel.com>
Date: Wed, 22 Jan 2025 13:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/7] runner/settings: Drop extra strdup
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-4-lucas.demarchi@intel.com>
 <173754566148.5500.17173352214428899355@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173754566148.5500.17173352214428899355@intel.com>
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



On 22.01.2025 12:34, Gustavo Sousa wrote:
> Quoting Lucas De Marchi (2025-01-21 19:57:29-03:00)
>> No need to strdup() again since the fscanf() function is already
>> allocating the variable. Just set the pointer to NULL so we "leak" our
>> variable to be saved in the settings.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> runner/settings.c | 6 +++++-
>> 1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/runner/settings.c b/runner/settings.c
>> index 13694a51c..96377f1de 100644
>> --- a/runner/settings.c
>> +++ b/runner/settings.c
>> @@ -1164,7 +1164,11 @@ static unsigned long parse_ul(char **pval)
>>
>> static char *parse_str(char **pval)
>> {
>> -        return *pval ? strdup(*pval) : NULL;
>> +        char *ret = *pval;
>> +
>> +        *pval = NULL;
> 
> Okay. This explains the need for char **pval in the previous patch.
> Maybe a heads up in #2's commit message would clarify things :-)
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> 
>> +
>> +        return ret;
>> }
>>
>> #define PARSE_LINE(s, name, val, field, _f)        \
>> -- 
>> 2.48.0
>>

