Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E8FC4828C
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152D110EDF1;
	Thu,  1 Feb 2024 13:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOWptXs0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC4C10EDF1
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 13:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706795498; x=1738331498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L0OupjayAMjqJcyF7A8KR2O/1ZM5iYMB3RCYBmBjVjc=;
 b=XOWptXs0iOWZye8Ze5iyyFtYF8ewfI2cuJa938M5hlHCgzBfZ6usTHJX
 LAfecZRTbZklAA4vM9Nj3Og9lExC26KLsBrgRzxeWk0wZSyn8ofKTxBmy
 KovrWVZOk4RM2SyaBphBOvNyzcjqbMlz1aYO3Lj1J0R02MQXDeDfqv37O
 vtWYCtC5LaZ8cLZvHCZEMmOGxM5wVB121ZQ6pRBU8wAPhfdrLL2dVPuy9
 eF3gViFlgY2IyIF6njeSsobJKwuCXUAklJG+31mSR83jRLw3bJVxbFkAf
 RNsW2ttOchg87O6LsOKfVUABuqjd7dvs0njBfCC0Fc0PbI2tVSOYeAbHk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="22395818"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="22395818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4509268"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 05:51:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 05:51:35 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 05:51:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 05:51:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 05:51:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gb8d3RI/NVjcaPBXWbzpaktYD+/IXrMMiELPk5IAjD19ycbwXAuBM+1biv6tlDPEv9DajuKEW7y80gY73fLw6l2oBZuXnfAH/8oqAq1IjKqFCpv0itLvqpvPXbPJT16lJh34AMZSa5vEkSO4ppiiF3MGrZIxydxRAgOsdOOqSPgIVH14A22Pp21zNsUnQaB8qbeYKcOZXbe7u2LJwJlrZ/cIGKkRgYX0KJMqdbzTnx1auuYqTUWy1LUrIWERqMcjTirg8nQrCTQmEonXPQZkHkn66z3L5aMpixpFf1r/l5WNOcAil8GxHmqdLwBEMcm6W6akuKUWl3AB2zaOEi3bZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbqRukBPRbXUMXdTu6bcjl97b8KjvtFasgLxFKROrgQ=;
 b=MDRc2yxC54nbSkipPV4l7fGYL9R3hvpXd5y68WV/HsSLfubUGNymhqaFKDS79sqqN3CslDezEBaA0Oc8qw283BSGjOFtuof9kMbxVr+blXvt5Ov0BaJo30QwsRLqbp+BFY5gc52vs9zxndwmb0ASvp55K2euTQQfc76gaWa5lcO9Dgy45Z1RsNalcLPTt/k7s+Q6k4X0eGaEjTNN0NSdCeqLUfGv0kUxVEtlfBYcvXAFPKvC0AJcQ/RpuYkMs8xGKkqz7Yfaq+sg7PY0NC31DKS0f8tSU4obxXeu2WkuoOaHsUOas7ui9cOySxefAjMD4o3ZkXtdh0nYA95p4L07iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Thu, 1 Feb
 2024 13:51:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 13:51:28 +0000
Date: Thu, 1 Feb 2024 07:51:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: Re: [PATCH i-g-t 2/3] lib/igt_sysfs: make sure to write empty
 strings
Message-ID: <kb62dcczkzw4jg7prn3gx4dk2hzuvcd2gc4uk7ml33j7u5ec26@bd5zugzastmi>
References: <20240201005115.352192-1-lucas.demarchi@intel.com>
 <20240201005115.352192-3-lucas.demarchi@intel.com>
 <7831979.gsGJI6kyIV@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <7831979.gsGJI6kyIV@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: eb94539d-6d1c-4066-e9e8-08dc232ce368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KMRa+9Wawt3KDsIdb6qXBpk/omh451/7fdnL4/HSSlhjoAvKoXrthH1okBsAxeaPsiX/QsbYvIEs1J7Vpg1AEsdTIRRO9dFCp+OS0GnOz+xw/vbDfg8PCquWa+2MAfidZk51eY2RhPN/O58vRuLCTqu6APwA30MOL3nVSZUR9KJnY+jM5MmTtx4lq785rqpNBfvpVEIk5ew172v4B6OAMHUXPmFHRE2Y254rMU2pI38OcxVBsWRB+cr1H4lC6Zlg220ZTZ/MU4e7LIZHWLmzzlgG/OnlJcidxvf3gLZdW1ffpdRfZGdI2VXm4e5XVHmnijGkrhsVEQBXw9FRLmlzPu3R2VSf4bHCGN6viNrC9JIOhPiTXK9EFFrmSTCgtpcTYdPLVjjEaDTYBTJ+5jHv8shI0M33C5exBC3cDquLgUgR4pgv9wObJkV92zTOJk2rXA1GUTfwoMPZjrd2MrDZ6AfpuclerwAV2aIK6zMM/usnwpLi4+1F+1xNxH1hA7XYdJ7GJ63RLmmV8huQBlkbVe7Fka8SEzWIJeXp8WwJZZKgUzuZXtpECnb/+RAHMbzi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(376002)(346002)(366004)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(66899024)(83380400001)(86362001)(82960400001)(41300700001)(26005)(38100700002)(33716001)(9686003)(6512007)(6486002)(6506007)(2906002)(478600001)(6916009)(66946007)(66556008)(316002)(66476007)(4326008)(5660300002)(8936002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TwNhbWLtQzLREKpI2VLt0CT8r5q+IVA9Iucu/XTfogmi6b243212OfkTcmbn?=
 =?us-ascii?Q?RgLy+JM6sAiS+IzPq7dywBXS+gHla/jnfnBxO3Nc5axeJ0qzgbdFAzvhfm0l?=
 =?us-ascii?Q?E1a4KP7R51C/xeKcE0YGDP+eoyrxzNrXN6hnEh/pjCGFrC3yTnhoRdTtbctI?=
 =?us-ascii?Q?GHCpz4+83V2r0efr/cKVTMmMUSqwECScQydYV+sLUlJCmQ0fLU9BLP9fsfCQ?=
 =?us-ascii?Q?e/zzlf7wsxNQterNZD90bAtQj/aQRoZuAlP9ujiofIszarQdfKXSTr8WnW/C?=
 =?us-ascii?Q?NNEjtQ3eJaWBm4qXe3evz+CpkRS1hk+WMqbgGyWM2kK+B88BhIr+wQK7sCdG?=
 =?us-ascii?Q?kyIZWWzw7iYIH26Ldj1lYkOqaGALDcC2k8WDJ8H7UIhyzdal40cPzlMvsgcr?=
 =?us-ascii?Q?DVShwe/x8y96aSFNjeK2RLobV7F24qeEXdQJIM8OB5n9+H64NfHur4PAHnNk?=
 =?us-ascii?Q?fgLbxEufmTE4Ak0uQFA9SejiyAv1T13U183xb4K+0bXPZJQli87MxbY5mqOQ?=
 =?us-ascii?Q?HzRadEkS7T8w2yBUK4gxO5zOEI/NOQiTkd67GGEf+TkJ8nWDP1+JTMHRCuX5?=
 =?us-ascii?Q?CLMT+pwTRbI/2xXX3tXMTG9h9nGm6tluYb2CH7Paa+5dPnfYzBzR+nsT54Yg?=
 =?us-ascii?Q?k4YeyiSO23krxGqaMqgktFwn1RSJIkgkM53djZha8fzqdDkE0yebGMMIWMAc?=
 =?us-ascii?Q?Gs0AfwlioteHMBQ9PjgM7mGx9nb34NbuXp3RuVZ5Th+DzIMtOGL9ygLYYy5+?=
 =?us-ascii?Q?BiF+6XTK7xCgAdxYqH5F6YUxDSsRM/3fx4lfQvx93gvtu/wqCd0Oz55Uwxjv?=
 =?us-ascii?Q?F99nWnvjs/PMtOlHnH+k5Fc/9TMpLaJ5abx80YjD30JAHWsc5z5+VEaFWSTn?=
 =?us-ascii?Q?CiNXpWd+AIkN406KpnwdyTeY9MHtPmWPjHrDNkFl5bowDd4pHN4sPcaVJdqi?=
 =?us-ascii?Q?E3Yv+BKgAmwYYNbwoa2rp6QyJQxLgX5oNwq7oZfkYSJ+LWYJnCSlQCmV8eex?=
 =?us-ascii?Q?OCjWmEWkCLzays+dStIThsyE0GptBAL9MABy7eQkg9pPQ0Zl343jicD40Mwu?=
 =?us-ascii?Q?KAzKzFT6Lgug3TB6xwDU50emSNb6a1J3NoGGPRRy46glTt8GPv+u2qjegk3U?=
 =?us-ascii?Q?H+MtZm72+j0Q8T6zrCTFgYYbuCmw+THFU00ahO+NRMGeZZ2f9G+mDiNB3uXL?=
 =?us-ascii?Q?Sj6ATNnDakqiEcHrCKxAOEPnP200mU2hIuev3iEIb/krLN/5wPToUzV+Awt9?=
 =?us-ascii?Q?u4h6cmkrlxmkswmQkBbtA6tDiOYiHg8CYv07igGa12VigiBhLpYT6v9b3H/I?=
 =?us-ascii?Q?UClf/HU+GZ+SHSu/18Gplj7ZfQMqFKzyG+XuvBXVoxoqE4z3eF1DZbs4q7yF?=
 =?us-ascii?Q?PaFFGorekipJfI3sBFq5xSa25cBCwnc1KSLKYZwH6MO84dL+6Onprnaw/CkL?=
 =?us-ascii?Q?8wvMv5iAQj6N9JTLCJiHXuujG01W1jYVaEfTlC2k/jjs9S6yN3xAOJcF1FWM?=
 =?us-ascii?Q?PzqhKd2ouXLFHJSZpzOPW1xlpvKIKwChChhQx7fjSRQVAz6WzoSK3o0tIW//?=
 =?us-ascii?Q?6x8Kw0KWSJiJpM26Zpv1+6v8c29Ql0JMamXZeO+k4ram4ro1jq9h7H4M+bwM?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb94539d-6d1c-4066-e9e8-08dc232ce368
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 13:51:28.2049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IsZrD+rJFp0ocMAx60m9mbxKSTIW+PXzhKBAzkr2xFMxvYxH4G8pWkUSvEhYbLPgvxBA+ouseKepkbX7PbErv6xHXFhOr4An9c96l3rMR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
X-OriginatorOrg: intel.com
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

On Thu, Feb 01, 2024 at 02:15:53PM +0100, Janusz Krzysztofik wrote:
>On Thursday, 1 February 2024 01:50:29 CET Lucas De Marchi wrote:
>> 	echo -n "" > /sys/module/<modulename>/parameters/<param>
>>
>> doesn't really work as it will just create a open() + close() expecting
>> the file to be truncated. The same issue happens with igt as it will
>> stop writing when there are 0 chars to write. Special case the empty
>> string so it always write a '\0' and make sure igt_sysfs_set() accounts
>> for the extra null char.
>>
>> Shell example:
>> 	# echo -n "/foo" > /sys/module/firmware_class/parameters/path
>> 	# cat /sys/module/firmware_class/parameters/path
>> 	/foo
>> 	# echo -n "" > /sys/module/firmware_class/parameters/path
>> 	/foo
>> 	# # make sure to actually write a \0:
>> 	echo -ne "\0" > /sys/module/firmware_class/parameters/path
>> 	# cat /sys/module/firmware_class/parameters/path
>> 	/foo
>
>Still not overwritten?  Isn't that a mistake?

in the commit message. Yes. It was supposed to be show the real effect
of that, i.e. we do write  "".


>
>>
>> Same thing happens when testing igt_sysfs_set():
>>        int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
>>        igt_sysfs_set(dirfd, "path", "");
>>
>> Previously it was not really setting the param.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_sysfs.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> index 567b4f6d5..814220ddb 100644
>> --- a/lib/igt_sysfs.c
>> +++ b/lib/igt_sysfs.c
>> @@ -406,7 +406,7 @@ int igt_sysfs_read(int dir, const char *attr, void
>*data, int len)
>>   */
>>  bool igt_sysfs_set(int dir, const char *attr, const char *value)
>>  {
>> -	int len = strlen(value);
>> +	int len = strlen(value) + 1;
>>  	return igt_sysfs_write(dir, attr, value, len) == len;
>>  }
>>
>> @@ -513,8 +513,16 @@ int igt_sysfs_vprintf(int dir, const char *attr, const
>char *fmt, va_list ap)
>>  		return -errno;
>>
>>  	va_copy(tmp, ap);
>> -	ret = vsnprintf(buf, sizeof(stack), fmt, tmp);
>> +	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
>
>Looks not related.

I will add a line in the commit message for this sneaking in.

>
>>  	va_end(tmp);
>> +
>> +	/*
>> +	 * make sure to always issue a write() syscall, even if writing an
>empty string,
>> +	 * otherwise values in sysfs like module parameters don't really get
>overwritten
>> +	 */
>> +	if (igt_debug_on(ret = 0))
>> +		return igt_writen(fd, "", 1);
>
>I think users may know that an empty string is going to be written, then may
>expect return value of 0, not 1.  Also, what value should we return to the
>user if (unlikely) we got 0 from igt_writen()?  write(2) says: "If count is
>zero and fd refers to a file other than a regular file, the results are not
>specified."

we are passing 1 so we don't fall in the case of passing 0 that write(2)
refers to. If the return value is 0, then we return whatever write()
returned and the user deals with it like it had done before.

>
>While resolving two instances of one and the same issue, you use two different
>approaches:
>1) always increase the number of characters to be written by 1 when writing
>   strings, so at least the terminating null byte is always written,
>2) divert to a separate call to igt_writen() that writes just the terminating
>   null byte when the string to be written is empty.

if you look with a different angle, both are actually passing len + 1.
One goes directly to igt_written() vs igt_sysfs_write() because of the
arguments it has at hand and is consistent with the layer the specific
function is operating on.

	if (igt_debug_on(ret == 0))
		return igt_writen(fd, stack, ret + 1);

to be similar would equally work, but slightly harder to understand
what's going on.

Lucas De Marchi

>While both methods can work correctly, I think it would be more clear if you
>selected one of them and stuck to it, or provide a justification if not.


>
>Thanks,
>Janusz
>
>
>> +
>>  	if (igt_debug_on(ret < 0))
>>  		return -EINVAL;
>>
>>
>
>
>
>
