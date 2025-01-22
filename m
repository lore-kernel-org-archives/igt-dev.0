Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320D6C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 12:22:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA58810E1BA;
	Wed, 22 Jan 2025 12:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNNIXmsA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF4910E1BA
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 12:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737548561; x=1769084561;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k3PhXpYqaQH0Do96/+ogIIGR03l6cgi8qh4bWeImQgo=;
 b=fNNIXmsAREEp4KAJWae6I0FyRg2hey3flMMapRK4OlRCFfCVDhDSnaqN
 sgrKt0gWj+bpfxRcSDkYt4zBMlZ9hRapChyuxluW+xr43tGieSuBkoi5Y
 4sAVsb+OzP1HDF6iIYDXiMt2iaVKwiZDRO1glHbJ5n7pqRTOtl1MVuN1N
 exu0+MIDcQJ03YiLTMi/ixuubUw5POiQXGsiMqLuumMyJDBtR5O/sEFgT
 U08SLh6alCu2ants1AV2hoifqkM0INHv7oryTaH0mX0W70LEVJ0AkLN+w
 d2Un0hN0B7WDUompch8Qk/vVD5ubNeSuwkon4jbusrEmW8hm2muBHGRU1 g==;
X-CSE-ConnectionGUID: +hGn7e7ISe+s95clEKW83Q==
X-CSE-MsgGUID: ju1eRB1oT62+ah34K9AsGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48987903"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48987903"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:22:34 -0800
X-CSE-ConnectionGUID: qJwaHcjsR/On/LCWA+a/SQ==
X-CSE-MsgGUID: XBewJ8eeRaqA9TIOJBI27Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="106939368"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:22:33 -0800
Message-ID: <59daca59-8ebd-498e-95d4-40f41e74fd98@linux.intel.com>
Date: Wed, 22 Jan 2025 13:22:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/7] runner/settings: Deduplicate cleanup
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-2-lucas.demarchi@intel.com>
 <173754304942.5500.13428996844401248383@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173754304942.5500.13428996844401248383@intel.com>
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



On 22.01.2025 11:50, Gustavo Sousa wrote:
> Quoting Lucas De Marchi (2025-01-21 19:57:27-03:00)
>> Deduplicate cleanup so it's also easy to parse the line in a different
>> way.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> 
>> ---
>> runner/settings.c | 13 ++++++-------
>> 1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/runner/settings.c b/runner/settings.c
>> index 92fd42ea6..80d95be5b 100644
>> --- a/runner/settings.c
>> +++ b/runner/settings.c
>> @@ -1154,13 +1154,10 @@ bool serialize_settings(struct settings *settings)
>>
>> bool read_settings_from_file(struct settings *settings, FILE *f)
>> {
>> -#define PARSE_LINE(s, name, val, field, write) \
>> -        if (!strcmp(name, #field)) {               \
>> -                s->field = write;               \
>> -                free(name);                       \
>> -                free(val);                       \
>> -                name = val = NULL;               \
>> -                continue;                       \
>> +#define PARSE_LINE(s, name, val, field, write)        \
>> +        if (!strcmp(name, #field)) {                \
>> +                s->field = write;                \
>> +                goto cleanup;                        \
>>         }
>>
>>         char *name = NULL, *val = NULL;
>> @@ -1195,6 +1192,8 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
>>
>>                 printf("Warning: Unknown field in settings file: %s = %s\n",
>>                        name, val);
>> +
>> +cleanup:
>>                 free(name);
>>                 free(val);
>>                 name = val = NULL;
>> -- 
>> 2.48.0
>>

