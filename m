Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F617CD37A7
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 02:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157F089343;
	Fri,  8 May 2026 02:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCNU5tNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44CF10E2D6
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 02:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778207048; x=1809743048;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UB5ZpjsVLpt8wmsPJPllGH51RJjWbiJcjRxgI0gjMbA=;
 b=FCNU5tNHzWtDSwY5bLJ642tTohYsH76qgLPbFHZc5hQF+nGd0MQ064Gt
 XpS0B97hjRqeyIxKxQSv5aaWZUG3AurjPK5Bf/+tRjjdEtVriY/HO6Ctz
 XI3eAwSG3CS1SpYp+sdAseiNFGEFV+wKev4BjF2z3BuKFHfEfh+sbBmic
 0eAaItyxmHv0leT8L5AA0qXBHV0HqlVnY4D/X4OAtxTwd6Hkczd+mW906
 XRlVAkzvInfHFsdbwDt6kFl4KcWLyvpMI42s8+4FuAVmROGQ0qPdmEKIt
 kLg9jPJ/J67AqlDuBu3LCYFCctmbuowPgkEp2y6wGMNiE9fgcWcUWEIeH g==;
X-CSE-ConnectionGUID: 3kpt8GSxR92hHYxDfWWMgw==
X-CSE-MsgGUID: q1n4MI8rQ5iVM1mmwziGnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79024863"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="79024863"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 19:24:08 -0700
X-CSE-ConnectionGUID: 2nXBg6t4TLqj+nN+muVhxg==
X-CSE-MsgGUID: Bn60g7NHSi6K//QsKYv0IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="260352312"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 19:24:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 19:24:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 19:24:07 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 19:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlLEYIuhp3dr4M6VNo9cCiiDhNbwbLB8ftPV0//5xIjQ4ayKyAB+9GHlloH73qiMjlAfDTkUkYg9rSF7u5gbsan54NxnD1IfJ6vINFs+HE7zhqPFL8q98WK9rmR/bPA2nBrcdoJI1ph8GrafZFeIC6nSLGGtmn63iC6Jjr4N2k0+gVOg1woKOZmj1cP26O49q9WRcmnEdgBDg0aSB8I39UFNGXpQwl97XABRj4vKE+ufoWFb41M1pSmGjHLxktUxVYT33AqWoUYFgcot//dzV9sprRhjeV7sQ5x96+zER4pF5ggAe3BJpF1ENxaMldSKeo9jBSASwphiOsaPUDepxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiFmEoJBB6bgTgBL2ul3CjEOuFC0VdAYFt3iPAcELzY=;
 b=awS4ZvllPhDpklbSApEwV4u+x54uRKV+v58o+jzEx3aTJ/nFu3A298rAMU5jUrOvPEyHneLHAhu6JYSpm+bvdtTSdGqY9MImYNM40m7h1pODaFeClFYjs7AIhOzaMuq+JegQ1Vwnn0tSEM3lknowG8VdaOhpm2hhaqwRP4+2tNl3LYHHLIR4znQ3ETRgAMLsvOWQsxWVx1Kg8qbErhtOlHsBDy4s8gNYVWxemaP8ZS9mc6JhIY+qlFK1+21g19Xyemv5PnRMwt4xO+7P+9PHalqwBvlpwCPfpf8NbqIF1EXpv4wbT27DBVbZAEjui0aLJXAcOALNEvVwFbuJHkNIUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SAVPR11MB9576.namprd11.prod.outlook.com (2603:10b6:806:4e6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 02:24:05 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 02:24:04 +0000
Message-ID: <5c7b5c05-c4f5-4347-b551-36a6bdead026@intel.com>
Date: Fri, 8 May 2026 07:53:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] tests/intel/xe_oa: Wa_14026633728
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20260507053459.766300-1-shekhar.chauhan@intel.com>
 <20260507053459.766300-3-shekhar.chauhan@intel.com>
 <87bjergsq0.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <87bjergsq0.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::13) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SAVPR11MB9576:EE_
X-MS-Office365-Filtering-Correlation-Id: ea650c49-fdb3-40f5-08d0-08deaca8dfa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: skvC2+3OWkfM5N4F2R6HLVutfnf0VJobc8XHSQjqma7t1S0K3r2TN4Dxe1XqpMgmD3/TeBRQcdjDxJ5/kYU/g9jIdn0wJOuPrNE+4PTGAUjABt0PENSdGTrz//CQPArw42SuSjmtHPXBKDSTYXzfxUWnhzrraLCWWn/8tWF4nHMBvL4WPGftbrp0qXBTkb0AQNn5R2Z7Ps48gHDxK3UGCf4UIwZabSphYb9PHpg4aDNcv4yV/G+bZiHckfCWKy4PByyKNe0wX6JY5uCXSnqq+KR9Dee9Yq15t28PC3nxcqwYag4l8bSb/e7Q5nekITGVuxxHwDZxRbUqcTWXjVpMUO2/KUmFwu1iyF31HFFd2e36LNBQzUegmoT34AOlYS6jMj+pDgkIxF19bbdhizlPS1DOl5A/ccyu5v1kOrIoeVk9W3w7xjGemK6HXDx3zYo5iCOIrrRvJSnOKRGF7XwpMNZSF//lAeowykC3jn5MUZt8hpYPkB9vqK/kmKZenAotNv/i+nfjV+kVCrQCP0wOgarf4OdmhLO149zK/+AU9ggia+2U+c0etZU17mrcdRBAu1Zj3BqMwjGPC0gxeMUkvT1iWr5R41pGXPraKdQsdpFowq43iS0OuwhDBJryeC6BR8MTg8bHKbF8cUZQBTcC1cPYOGMI37gBsD/2TywU4cavqP/aYPRLsHN7u40uPm/e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zno1eU9ocElmRlZOakpvM2hzNzRLTXM1K0orZ1BjWkdoVGNMMjRyYVlRNmdn?=
 =?utf-8?B?eG9nbTlRSVQ0dW9vWS9IRkFCaThDazQ0cHRJWEVybE1oWTQxS3l6dXZDUlVJ?=
 =?utf-8?B?MkVUR0V4TXpIZVViYnROblArVTVGSCs2amhhYVdSNlFRWnpCelgrRDlUZC9s?=
 =?utf-8?B?N2xHcXpyY1U0RHJtVm92Z25KM1lzY3YxSUVIYVM3Zkp5S3d6MWw4K0tNZVB1?=
 =?utf-8?B?amhKWUltYWFsQzFXVkdQMEtqTTVCRDBOWG5McWllYjN5bkM5cXEvaXJVVFA3?=
 =?utf-8?B?cjBWa1R6UW1VMEFNU2dRbUhxcFRTWVFuMGxaSWoyQ2hDaVNwNC83ZENweTVG?=
 =?utf-8?B?OTZHSC8rQnNBK2NHWmtrYUkwNWRIOXJQK05mSnlOZGdJbmppd2pUd2JicFlz?=
 =?utf-8?B?UDM1SnYrUDdGVkNpRzZBMzdTTjQ2amU5eDFmZFA3NEJpWTJoYm83TVVTaDhL?=
 =?utf-8?B?ZTZTSFh5dGFBYnhRbE5SME4yamVZYWtoVHVaeGE1UEVjaGVSUWNPNGRKdHFa?=
 =?utf-8?B?cTkxdWZVdFNqcndmdFRZamVZZDZCeURyWVFQblZUMW1nNGYyOUExL0JhT2Fy?=
 =?utf-8?B?R0x0YUVvU1JJQk1ocFdwZnA2NFowdStoTm9pK25saGpEQjhvbVBmWDhuM01T?=
 =?utf-8?B?a2hxTXVOcW1oVGlnSHhVWmVKajJzR1B3MVFCM0RsMVFmOTA5R2owd0Q2Q1JV?=
 =?utf-8?B?SHZOaWNhMld1eUdWRjBDYis1TEdEVVJ1Vml0Q0J6NjVlTkFvR3NlWmFUTU9h?=
 =?utf-8?B?S0twQ1FrVkJKajg0Umd0bGR2aDZqZU02WEFzVXpYWWFXd3EwWWV3Z29nTzhL?=
 =?utf-8?B?MGoxTUdtajdQUlZSZFRJQU8wa0FFUHZrU045SVpxbnZjZ29yTXEyRkZkZG1C?=
 =?utf-8?B?dG82U01OdC8yUEZZZ2t4Qi94K0RmUjFXVktxcmg3cEdDM2lXUFlieDhlek9h?=
 =?utf-8?B?QTAyZkRzZmNBQ21wbXBIOXRMRkhEbWF4SVVha3l1eWlRT3JaRGFocDhaYUlI?=
 =?utf-8?B?VDFidXVKaktiWjBFaldsQWEvQnpYYXB0UXZlQy91Z3dwTm04b2FjTlZEcE8w?=
 =?utf-8?B?NFJpcFlCa3hPN0RHKzZaZHp4bXE1NnBjNkZaQVBiTVEyYjJUR2d3YWlpMlE3?=
 =?utf-8?B?amFLZVRSUzVQUHpHUkl1c1VCc0YvcmVvMVJCL3lBcDBBYjllc0VnY3l2dStP?=
 =?utf-8?B?OEdFVWIrd0FVTUtZSEMvMHJINWFXSWtHWVFXWVNLMDNRM1Y1YWh3eGxxRllM?=
 =?utf-8?B?RTA5ZW1UMTlOQndybWRFSnJhSkx1ZmFQeWpNZHdZbzdwR2o3SlEwUlRMT3JU?=
 =?utf-8?B?aElteXNqeUl6aU5QZFg0QUFFT0Nqcm1QckhBUDUybldCNkhsZXBzdWNhSVQ5?=
 =?utf-8?B?NXJnM0xLTUVRM0syckd6V3FzR0g3R1luNUFBVWNJRXBXZmVzUjU5Y0tqb0tJ?=
 =?utf-8?B?blVGWFg1R2JSYnhVNGU4QXAzV2owb2VKb1k3aTZ0U25qTzYzazZ3VktXU2pr?=
 =?utf-8?B?akJHYVlERDVpMlRPcllkelJnMk9DZS80bXFRd1p2WmJRZ2R6YTd1ZnQxSHk5?=
 =?utf-8?B?SHpCeVg1Y1pLS2JxN2xHdXFDdXRLWEwyTFBpdDNod1BiQVZLRStZVHoremJw?=
 =?utf-8?B?SVdCY0Yzckx6N3N4TWVSaUhYa2xMemZaa296VmlvOElpdjIwRHJWaWZ3Q2NR?=
 =?utf-8?B?NGpZNDlWaDh0VCtnS2lOY2JKVTZXRkdVZjRqZVVNeVd6TUZ4UWhLUE55ejNW?=
 =?utf-8?B?aGlJS1kzMTlGVVZvQUxVMm9pbU04c29oOW9Oci94N1Rqd21ZMUdCZTdMZFVr?=
 =?utf-8?B?c2xVV2t2VWYrNHpRaFQ2U3hWdEFYbDNOQ1B2YnZjakVlOTdXVG16NUVhTG5j?=
 =?utf-8?B?RkVXMWhtcGtlV2FTakN2RThSZVFhSVhRN1JkSi9wRFBwb2tucEozdkllMExE?=
 =?utf-8?B?Si8yVmdCdzhrRzU2Q21YZzZJb3RaNGhJL09ZL3ltaGRNKzFZUjFpOGhveTFo?=
 =?utf-8?B?NXNRemdxbml4aEIzZVMzYkJ3SHg3M3lRaEY2MkVMaENEUXV1dmRoaVZhdDln?=
 =?utf-8?B?ckRNUk1uUDBOcWxDVXVwWVpKaUVTdWVhbUgvQ1c5cWxPQjg3ZGdXUGN3MmJs?=
 =?utf-8?B?YWV4SWdWYnp2bmF3ay91VDZPR3hJdWgzWkhHbHF5M2FwNW04S2VTWDVodlhW?=
 =?utf-8?B?WW84aTlob0RlS2l6VU5OT29oL0pDVW5PM2VKSDAvSjQ3TzdrYjFuQS9tSkJZ?=
 =?utf-8?B?OTR4SEo4cS94dWdEMTJsaXl1ZW1aMlV1RWJ3Rm10VWJkNUIzNlhnYXluOWVz?=
 =?utf-8?B?RDBiZ25zRTVhQS83Yk01UzNacDBRMXBvb1ErS0JkSXlPUThxNVVvUXRmVGkv?=
 =?utf-8?Q?SYkLyHyVEYXhX4n0=3D?=
X-Exchange-RoutingPolicyChecked: tPBgf6FjCpTkqrDLBhTHK8KVGjo6R3zLe6FinQSktEVPfzIlDTbO5vHiSpJHIaZUN9el7MhlDE2E1BTwuUHg1sv3QMPSuyZfvoslyXdUKjCQ1M3LDi5BPhmzowz+UVYtTS6dkAWx+Mm311hq+prZz34JsRSRiO51E+PDAP3rb6YKLHaNzVPDPWcNoJsuGFqI+wHMVHdGuEX62QvdhYMcL0zxSSYBzChfrT539Glw8OKyK8Q4hVNq5AjvXnDBZFU9zmkA5mVD2XTM2MzLQnK2c7acbefKGqhedwfBgm3jxOcNYxm8+Cc9KNjxXg2h95gmnwwR6RdCZtkR5CIczqgjLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea650c49-fdb3-40f5-08d0-08deaca8dfa9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 02:24:04.4977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJiLTtfCchOUfstl5HCaR4FzOS1uNMZBEkHT80XsUGVdZ+XuXZvUNBv1A7LoNjNkHofrGm/dlV/KqcVa4J29oDP8MMZEhJtdIu8i6ibGfng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR11MB9576
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


On 5/7/2026 20:41, Dixit, Ashutosh wrote:
> On Wed, 06 May 2026 22:34:59 -0700, Shekhar Chauhan wrote:
>> For MERTOA in CRI, oa buffer can be in device memory. Because of slower
>> device mem access, OA exponent values lower than 8 can result in buffer
>> overflows. Bump the OA exponent value.
>>
>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> ---
>>   tests/intel/xe_oa.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 988c46df6..c464d5a0d 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -24,6 +24,7 @@
>>   #include "igt_device.h"
>>   #include "igt_syncobj.h"
>>   #include "igt_sysfs.h"
>> +#include "intel_wa.h"
>>   #include "xe/xe_ioctl.h"
>>   #include "xe/xe_query.h"
>>   #include "xe/xe_oa.h"
>> @@ -2648,6 +2649,11 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>> 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>> 	uint64_t fmt = test_set->perf_oa_format;
>> 	size_t report_size = get_oa_format(fmt).size;
>> +	/*
>> +	 * If modifying the indices or order of items inside properties[],
>> +	 * ensure that a corresponding change is made for oa_exponent index
>> +	 * in the workaround Wa_14026633728 below as well.
>> +	 */
> Delete this comment, this is not the only place where this is done in this
> file and the function is small enough for someone to check this automatically.
I've sent a new revision based on what you've asked, but I still believe 
that the ternary operator way of doing this was avoiding all this. 
Introducing a magic number below in the workaround isn't a good thing 
that we've done here, is what I believe. As for the comment, I added it 
to ensure that someone modifying this file should have a gentle reminder 
for that as well. I agree on your statement that the ternary operator in 
that scenario was a bit complicated to read and understand, but at least 
we weren't introducing a magic number.
>
>> 	uint64_t properties[] = {
>> 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>>
>> @@ -2671,6 +2677,18 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>> 	int len, check_idx;
>> 	u32 oa_status;
>>
>> +	/*
>> +	 * Wa_14026633728: For MERTOA in CRI, oa buffer can be in device memory.
>> +	 * Because of slower device mem access, OA exponent values lower than 8
>> +	 * can result in buffer overflows. Also, update the value of oa_exponent
>> +	 * in properties[].
>> +	 */
>> +	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
>> +        igt_has_intel_wa(drm_fd, "14026633728")) {
>> +        oa_exponent = max(oa_exponent, 8);
>> +        properties[9] = oa_exponent;
>> +    }
> Hmm, code should use tabs, not spaces. Please fix your editor to do this.

Done in the new revision.

-shekhar

>
>> +
>> 	igt_assert(buf);
>>
>> 	igt_debug("Ready to read about %u bytes\n", buf_size);
>> --
>> 2.53.0
>>
-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

