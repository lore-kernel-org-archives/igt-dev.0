Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADE5CCA462
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 06:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ECE88D18;
	Fri, 16 Oct 2026 06:12:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D1410E1EE
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 06:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792131068; x=1823667068;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TJ7VqO4XAVBc7rh3KVK3aLItaASMRxZ95d5BQrqZswY=;
 b=ec/F99TvjcZ7rVIHdSn76qb/QlmizA8z9RmD/2p9dVzQW0wdeb9sk2kQ
 /uwlRWAc+gBZS7dmUudwYH9Ad42jp8IJH6xrH5j7Z2SQjy3HDpx4x+XE/
 k58G+ZloDg508y5aXjHpY14Rool3nmtTVhI8hfNVvRzkYAm5ezYR1LRvT
 mr/ABB25ty6Cb2r3gMELWlrPfI2jO+sfWi0WElYETrkNlGpx3GWkgd6Za
 IW20zwbitkWTvo81MjKLI5aQT9917uD/jymagInc6TCt5lCDq6ncEp4lf
 2cGEd1OpyC6VWlB6BmJb38vU2uUeVknFUX0xY+MUtSzH2pcwPuz1TKsNn g==;
X-CSE-ConnectionGUID: wwuf5CO0QU+jv9fDYxKd5Q==
X-CSE-MsgGUID: 6cp8iuryTISgsHUbDaslnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="808236"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="808236"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 23:11:08 -0700
X-CSE-ConnectionGUID: qrdVIhg2Tgu0E2NaqWtUQQ==
X-CSE-MsgGUID: n2Rq/XJFR/2wmU/7tzzQGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1779659"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 23:11:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 23:11:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 23:11:07 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 23:11:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PECcElUplhYjSRCSUbUlbysPiWY0q8GZZIwRyzCCMPmhGtp1WPsmMz1Sj9GSzfYFJ6fw8Sau1Qvf/Royg1ylP4UlkznM1dDDqzQLZXH1ZedXMcQbSGjKoHcU0LyrgvpCf/OxfKDLPdMChU0FvCyT73gn8JTfspcuh20eqKWd0OeTMxC0rBAo1ieIaJRMO52rqrSF/ex8hXAoQGQIiyYo7SDfmv0h6zEooGeZogF0zOZWAz1zLc/ZBT2rSOOlFLV4015AI7xPMLWdMLqmYMfwMmxPP3BFgUNN58Hfscuk6jlkMuyc3psu2Xcu1w+qUJa5gsEjmG/wZyPukAV2M/MgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAanByR+RvmXDvoASuU/XG5cG3wrjzkKNh1XVV4zUlY=;
 b=NnxAQxQLs10a+Fls67XCaf0lmVOa8I611MKRaG5/2/ZKSOGheGsSS8ZREmjJ8XfAzezQxViwun+JujWFAigbmxYiOe9KI342aaWOZQJ0P9TL6CdIsrRx7a2AE0IypKsAd54iVMDevf1mtwelyJnuLb8BbFpXewAfrrOXYfQ/9cKMXBkBWYBP8q/isNwVbB2k/ZjxltwTwos5f9Ak+aqxQKROKmp5NM45hsvZMWauNyiQxAH96j/dN+0ZEQk+fU6DEeMUCTuN7BCALEl8PNjYydP/uEThXvgzB8R8YoSSw+VzgYoS0yjKii+3llwJ63KQAPzsjQyxIpxzq2Hljsr8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA0PR11MB4720.namprd11.prod.outlook.com (2603:10b6:806:72::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.14; Fri, 16 Oct 2026 06:11:00 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Fri, 16 Oct 2026
 06:11:00 +0000
Message-ID: <c362564d-d846-43af-9cef-4a91062ea3d1@intel.com>
Date: Fri, 16 Oct 2026 11:40:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tests/intel/xe_wedged: Add cold-reset wedge test
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20261016054808.306372-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261016054808.306372-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0118.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA0PR11MB4720:EE_
X-MS-Office365-Filtering-Correlation-Id: acbbbfdb-62da-446c-79f0-08df2b4c3ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: VHk3/J8jQCVVLOf4oztldDclGOIpBx9j+E5omjBbnANg/N0HSvQVDcjg6OY2bOhlkjBTWvyzFe7Tl/hKLXARqTJThA3giqJL9TWhi2fp3vzvS2jMG2f2Y6CCszsus3E+T5IJK3XxNC1C4j+ammJY35EwB16qD6ZkUNMIk2MvELeSb8KHTKdkovqeIWa1lOIj807HTsWrh9uLq4Ub79vmSzY+i3YeZwWd+KWBKoQQmkpCDLst/F6EFpAQySglDD+8BOww7bT8co+dkQrnmE7AvxNWCHrBU81OAMYgQnuyu+D68/GT9hHcBOXui/Pevxl18/kez/ORsO8iJnLdnH7TSMSD7aV6kRbmYxD8fRP1iKWBSWMNfZJkt0A87jcbnIXe5Namq70XvJRnMDv2orYBeXLzOylFjdkxnckalM40YsdTOdHS5XowoApwFu9V5IqCoMaJAwjWLWLP3pObEdcKuNrOdnWUfqwg9tTPXUYLBVljh9MSKkJzTvnZxq4Wx3hNiR9Z1CLi2zKOs7JDnTyuRL3DqHqBq033xPJtTuGVGpEw4E81BslCK3yJp15YpiPz7H+Az03gi8oDxBdPif4x4KiNswHCMVyvpsp4LUkeOQwWliTarLDRc3BpweBb/1cn+BG/NtosB76Svwf80jYogtQ11HHgVtu+NiruvMmwOpI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG1HR3BhQXNub01aNGY3c2lIeElSOC9ZMDJORTNUYUlaVHpUN3lBVTh5V09F?=
 =?utf-8?B?YjJPQUlCdmJ6VEhJTjlUZ245QWFYU3M5ekxOdjR0ZjlkcGxqNnJmdnEvbHRm?=
 =?utf-8?B?VHB6azdjQnlZMTg1cGJjV24zMGZ5Vk1wMTRTM0JaQzJTWEJuOTV4Uy94ZENQ?=
 =?utf-8?B?M3lwR1hTb1Q5aERKZURqcVZQMHBxRm80LzVJbUVFV1dUNUFweUdxSlN4QVZJ?=
 =?utf-8?B?N2d2NjFxdmRzRTdpTkJTUy9JMmxOL1JTTkFKU0hLMnVYRUcyVGNBTTFMdm43?=
 =?utf-8?B?VENZdXRRQWttbGowQXpEZUo5QUE3ZmJuYWxPOUtoc0dLbHlqWHhEaW1HZmdI?=
 =?utf-8?B?WlRZZ0ZwYmU1RURsR2drKzdYWCtub2VNZXp5NVJuQ2ZJb01XRWtOVGdvaDh4?=
 =?utf-8?B?S0I4dk5XRDFreVBQK2pDeFh5eFlFZ0FtdGFtRkdwUWhKeVVDV1VvbjV4c2Fk?=
 =?utf-8?B?TFhGTXlySDkyYnpHZWlzUnYxSUlnWHp5QWQ1MGp2WEtFdytTVHpUMkN6bGdM?=
 =?utf-8?B?UzU2WThaaWxWcDZ1Wk9BcFdCV3RWT0hpOFo1Mk50UjFnZWN3YVIya204cmtE?=
 =?utf-8?B?QkdtRU54K1U3dVQyNm1hMHFYbm9JSmpMMWlsQUQzNUhHV0ZLTVhFOGdRWTFZ?=
 =?utf-8?B?WGkwKzlIM3ZrRzBmMjRIYmx6STZtNXVxenYrU2VHS2VIb0tpd0toMkdrVHI0?=
 =?utf-8?B?aEFLcHp2VkhaMzJXUjd1Q2hNcERJUjBhQUlRajRoNkFCQUxCV3JNa2hIbkFO?=
 =?utf-8?B?QVpLUGdaTFpFNlRlejk1STVTVXVXdlVmdmxqKzArYXpSUnZWOUlaSUhnK24y?=
 =?utf-8?B?TXFpUjhaVnlJalZFRU1Od2JZT0V2ZTZmOG5YMFMra1hhRDZmYWlncnhFLzFR?=
 =?utf-8?B?YUV3WGVkZVkrdkNCc1pYT1crUXJXNzk5b3B5d2ZKQjlHNWpYeEhBa1BoWUFi?=
 =?utf-8?B?SnZ4cXlac2svOGtPTE1TeUtGSGVpclhRRjZmVk0xRkpTY3pyKytwb2cwcjZh?=
 =?utf-8?B?bWxYWWRIUjF0YlcwUFB6d3VzeFdqay9DbWpXTjVvbGdVNHhGR29oTmhYbGJP?=
 =?utf-8?B?bmtVeDc5TDRsM3VwL3pFTlZxdG1PYm1sN3hINXFvUlk2OUdtSkFCZ1QyazZq?=
 =?utf-8?B?aGpVQUVJSlRveWlGOWg1QUtwVGZsVWdxcHlhUlhRV005UWNKTDl3RHd2Qi9z?=
 =?utf-8?B?Ynd6MTNwS2F0a09PRy94MVQrNm5YbC9uNkhvUjJYTm5maUVidHNJVGVBNlRh?=
 =?utf-8?B?ek4vZ1cwblZqN0dBZFkxNkxKM2Q0NXR5SndaVVpTUS9xUjRISFkyNXpjT05K?=
 =?utf-8?B?WVJxOFV0K292Zncza0JBa2RsQzY2cTgrWFpWeWFYMlF5dW5xdk1BUWlvU3U5?=
 =?utf-8?B?a25XNXBkM1ljTm9vU0tGSEVyalUvQzl5RUlXY3ZBa2UwdVhxV0w3d3E3OFg5?=
 =?utf-8?B?TWJWWnVVV1djTEhTL0p6eUZJbUxwYlFwZzlqaTIwL2tna2U1ajZ1S3MvbWwv?=
 =?utf-8?B?T0pwd1Z1RmVjWGRYR0lLT0dsUGlEQnJjRndhM0VoYjJrRlpZVSs5cGd2Ty9r?=
 =?utf-8?B?UHVtMi9FTVRialR6RFpFV0hhTThVNDlmVUxmWGJyQitaa3BGd3c1VXdaQTN3?=
 =?utf-8?B?MTJPWTVOUVpHV2pzYU9JYzFLbVVodkQrMG9sWGFYN3ZTa0ltREZsTnF2d0lk?=
 =?utf-8?B?VDd5YzNmTXY2d1lCOEhlaEYzcVVXdDgvbUE0YUNxaXZoblFLcEk3UDFHa2dE?=
 =?utf-8?B?UHJML2FrQ3BlUXc0WUN5MWdZOFZ4SU1tRFBzbDFLWDBxa3dLcTROellxSmxq?=
 =?utf-8?B?U0cyNGZuTzNBQWIxcEl5K2JjN2s5MDA4dlhYdFNENGM5VllnamlQS0RQbzVJ?=
 =?utf-8?B?a2ZNTTVWaHpYaGttUnArRFlJMnRkbWVnVllEUDZCekVNQmxGNlV3VlBzQzFl?=
 =?utf-8?B?MjVmOWE0WWxJOGJDOW1rNzdiUXdmcG1JMEdzZVMrZm03WkpxT1JDckRqeUpk?=
 =?utf-8?B?Snl1d1JLNmMwYWl4UzlUTGR3ZnJIUTZZaWFJU2tkUkdwK2FFUWxZMW1BZTls?=
 =?utf-8?B?aWdvK0pCQksvUE52NnBTcUxxQ3lGZE8zamVTSUJQbGRQRm10aVJUYm1KbmRa?=
 =?utf-8?B?MU5hdlN6QTM0NUo1aG5CZGQyN29FMXRyS1k0ejhHOE51Q0J5ekJOYStkYVhE?=
 =?utf-8?B?L2pDTEdETG45dUZYZytDSE1VaFJBQ0lFTjFTaGZvVzlSM1FiVDVnbTZsK1V3?=
 =?utf-8?B?bjRqWW1nRDJNejQzZWtFQWRMZFEvMmJsMWorU3VaVStNUlQ5dVZlOEZHRWRu?=
 =?utf-8?B?TWRWVEtFcnhzSkVwOGZGbW9RMGJ4UDVwNE9pSUlSaFhrR1A4OGhBQT09?=
X-Exchange-RoutingPolicyChecked: ifhkbRybpZbXkmQTJv6tfI+yF6vWTcDCeIBEiIQ3hoBXVdeu2nANMnUbMtXNmzokoZ2OIWGFeOOOv9dWFOp2WNvyovFuCzxO3fb18o3kjgXAKSgjbkCqVziYDQ6qbp4pzu2v0xE7rWrKmG1pINdxdjke+wUPB7LT4W117hMednBY1fRT9bhq9l1Wn2H/ZLajBqeYuOVvuA8kEOdjjDeh4DkLVl4uB5667OlWCtVUNP/XQ7pxVKFQlsHVcab/c4MhsQfqvX8suoMpr/dsG3Mm9/GGuFhhr5eN6mKHh0p5WhK6iszXrMqo19tuXAxuv6Ou7gcrIeE4DAf3EwBYKuYogQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: acbbbfdb-62da-446c-79f0-08df2b4c3ce3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 06:11:00.0044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PLfDoaeMflDF39m7VO80PoTADijhzzcxFrWEA7Hu1zzl8PD7Y3XgDZTp4HPIJyHIMUFizrQUK4u4qhkCGy06A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4720
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


On 16-10-2026 11:18, Sk Anirban wrote:
> Inject cold-reset at probe, validate the WEDGED=cold-reset
> notification, and verify the device is functional after driver
> recovery/rebinding.

When does cold-reset get triggered? i see a unbind rebind in this test.

>
> v2: Fix restore flow (Mallesh)
>      Cosmetic changes (Mallesh)
> v3: Fix verbose and dmesg regex
>
> Tested-by: Sk Anirban <sk.anirban@intel.com>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   tests/intel/xe_wedged.c | 116 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 114 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index fe8ea6969..afc248b96 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -14,6 +14,8 @@
>   
>   #include <limits.h>
>   #include <dirent.h>
> +#include <libudev.h>
> +#include <poll.h>
>   
>   #include "igt.h"
>   #include "igt_device.h"
> @@ -28,6 +30,25 @@
>   #include "xe/xe_query.h"
>   #include "xe/xe_spin.h"
>   
> +static char pci_slot[NAME_MAX];
> +
> +static void cold_reset_restore(int sig)
> +{
> +	char path[PATH_MAX];
> +	int dir;
> +
> +	snprintf(path, sizeof(path), "/sys/kernel/debug/dri/%s", pci_slot);
> +	dir = open(path, O_RDONLY);
> +	if (dir >= 0) {
> +		igt_sysfs_write(dir, "wedge_cold_reset/probability", "0", 1);
> +		igt_sysfs_write(dir, "wedge_cold_reset/times", "1", 1);
> +		igt_debugfs_write(dir, "wedge_cold_reset/verbose", "2");
> +		close(dir);
> +	}
> +
> +	igt_kmod_rebind("xe", pci_slot);
> +}
> +
>   static void ignore_wedged_in_dmesg(void)
>   {
>   	/*
> @@ -55,7 +76,14 @@ static void ignore_wedged_in_dmesg(void)
>   				    "|EngineInstance: [0-9]+"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
> -				    "|SIGID=203");
> +				    "|SIGID=203"
> +				    "|class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+"
> +				    "|cold-reset wedge injected"
> +				    "|GT[0-9A-Fa-f]*: Invalid gsc header in proxy reply"
> +				    "|device wedged, needs recovery"
> +				    "|IOCTLs and executions are now blocked"
> +				    "|SIGID=[0-9]+ .*GT: reset failed"
> +				    "|SIGID=102");
>   }
>   
>   static void force_wedged(int fd)
> @@ -67,6 +95,60 @@ static void force_wedged(int fd)
>   	sleep(1);
>   }
>   
> +static void wait_for_wedged_uevent(struct udev_monitor *mon)
> +{
> +	struct udev_device *dev;
> +	const char *prop_val;
> +	const char *dev_path;
> +	struct pollfd poll_fd = {
> +		.fd = udev_monitor_get_fd(mon),
> +		.events = POLLIN
> +	};
> +	bool event_received = false;
> +	int timeout_secs = 30;
> +
> +	igt_until_timeout(timeout_secs) {
> +		if (poll(&poll_fd, 1, 1000) <= 0)
> +			continue;
> +
> +		dev = udev_monitor_receive_device(mon);
> +		if (!dev)
> +			continue;
> +
> +		prop_val = udev_device_get_property_value(dev, "WEDGED");
> +		dev_path = udev_device_get_property_value(dev, "DEVPATH");
> +
> +		if (prop_val && !strcmp(prop_val, "cold-reset")) {
> +			event_received = true;
> +			igt_assert_f(dev_path && strstr(dev_path, pci_slot),
> +				     "Expected bus address '%s' to be part of DEVPATH '%s'",
> +				     pci_slot, dev_path);
> +			udev_device_unref(dev);
> +			break;
> +		}
> +
> +		udev_device_unref(dev);
> +	}
> +
> +	igt_cleanup_uevents(mon);
> +
> +	igt_assert_f(event_received,
> +		     "Timeout waiting for cold-reset-wedged event after %d seconds",
> +		     timeout_secs);
> +}
> +
> +static void test_spinner_after_recovery(int fd)
> +{
> +	uint64_t ahnd;
> +	igt_spin_t *spin;
> +
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin = igt_spin_new(fd, .ahnd = ahnd);
> +
> +	igt_spin_free(fd, spin);
> +	put_ahnd(ahnd);
> +}
> +
>   static int simple_ioctl(int fd)
>   {
>   	int ret;
> @@ -229,11 +311,14 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>    * SUBTEST: basic-wedged-read
>    * Description: Read wedged_mode debugfs
>    */
> +/**
> + * SUBTEST: cold-reset-wedged
> + * Description: Inject a cold reset wedge and validate cold-reset uevent
> + */
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
>   	int fd;
> -	char pci_slot[NAME_MAX];
>   
>   	igt_fixture() {
>   		fd = drm_open_driver(DRIVER_XE);
> @@ -330,12 +415,39 @@ int igt_main()
>   		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
>   	}
>   
> +	igt_subtest_f("cold-reset-wedged") {
> +		struct udev_monitor *mon;
> +
> +		igt_require(igt_debugfs_exists(fd, "wedge_cold_reset/probability",
> +					       O_RDWR));
> +		igt_install_exit_handler(cold_reset_restore);
> +
> +		igt_debugfs_write(fd, "wedge_cold_reset/verbose", "1");
> +		igt_debugfs_write(fd, "wedge_cold_reset/probability", "100");
> +		igt_debugfs_write(fd, "wedge_cold_reset/times", "1");
> +
> +		ignore_wedged_in_dmesg();
> +		mon = igt_watch_uevents();
> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
> +		wait_for_wedged_uevent(mon);

This is not right. once you unbind/rebind device specific values will be 
reset
Am i missing something?

Thanks
Riana

> +		igt_kmod_rebind("xe", pci_slot);
> +		fd = drm_open_driver(DRIVER_XE);
> +		test_spinner_after_recovery(fd);
> +	}
> +
>   	igt_fixture() {
>   		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
>   			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
>   			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
>   		}
>   
> +		if (igt_debugfs_exists(fd, "wedge_cold_reset/probability", O_RDWR)) {
> +			igt_debugfs_write(fd, "wedge_cold_reset/probability", "0");
> +			igt_debugfs_write(fd, "wedge_cold_reset/times", "1");
> +		}
> +
>   		/* Tests might have failed, force a rebind before exiting */
>   		drm_close_driver(fd);
>   		igt_kmod_rebind("xe", pci_slot);
