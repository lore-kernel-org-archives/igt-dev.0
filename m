Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DC4CDB466
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 03:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0FA10E912;
	Tue, 23 Jun 2026 03:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5nUD141";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F4E10E912
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 03:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782185628; x=1813721628;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KgoTJHJ15mAUnjlXzzVaAhv8UqHyiP7e/DNu1OXSEFo=;
 b=i5nUD14192kRSjpWlzXKHVXrqTWYOmKSapVuK9/8M8kV1EF/QraKgRlA
 p37+PbKB/PLXfK72oIRlASKJq6u5HS29ODYHHJ5Chwfy7e5p+IaCqYeXJ
 yshjw+d9qsyShIWeZIDVqVb6lIGtKtniRamO6JTJ6/w0xyIF/lS8g9/Rm
 FwibvGloQ4SxvqjLMSP2BC4TCD+HW6Fib9NwCkLm7g/5dv9+mVZCnqEvI
 zghoo8F0jm2BW7/kVTdKOPmLa7Z1l3DZ/5jOclR8zdqPxkGy+1j4JUoDG
 Kld42wPAAQQGlGbkK/l9dTpXcl/ACDN2WhKw/s1R2EbakhyI4nqorv4hM Q==;
X-CSE-ConnectionGUID: BrVgG8R7SmaR1ne7cJRG/Q==
X-CSE-MsgGUID: gp4qlyNfT3im9IXW3yTXAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100348518"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="100348518"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 20:33:47 -0700
X-CSE-ConnectionGUID: r35eEISVQN2U4Pw2yhM3vA==
X-CSE-MsgGUID: Fk7pWp4ISSmUjB6na7WkcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="246479992"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 20:33:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 20:33:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 20:33:46 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 20:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjbgLTo3hNFfa4nHcGEIKd+rM5mqCU5MLzSGEENl01dIRDSz9yFYfef1jFQhLFFgylgNuYXLBwAgsqK6Hr3RFOqJYjPcfGKzm+8SpkGAFfIxoqYaIYgeamhuc8p/80sqs/tWbHzd0YW4YLV8maQmFCeHP5UQ0zKVbR619kChwpz7g9/BS1zPcRIMcmk9DuFd+JFHyk3rYv+/XlAEmC41HCvJxsnXfj4MaRqgp09BH66uC+e83x7LNS9Sm/6E5FTKMheCX/Bc38v0YcEBODQ0VPmUZxJ/uc2YZTnztnGOC9/21F0m6V3rC0CcZ7cZoZT79rnYAcXZTu+Ui6jImvalHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ng2QzUZ4wKsQsrr+SAnLdnWTfkNhc2dox5DPE3rk2zo=;
 b=R152nq/nRK3H7sNzH74vozlyMmgYcPLm0NfEiUz/glH5g81vdDGGCwWhsunndR1PY4MW/LPNtcAl5/q0SSntsD9w45suvMLNW9alKe5fT/o0vqDyOoZkPaYw1vl24bPYI6PakkyR/FG0tIDNZvy7j6llF0T/ZERJY5g9dZyuAqhFmilnu0ywmmkxvh5ITtS15GT74LjmOBJHVY/1IC+i7U9NQ8HBSso+o1s9gQ1S8se/SQQpzM3b2V4vOufYQPtRx1LZRpzV8Cn03umgR2ihO7lQWQPkmBAVsWksukk010xcRDYbwuzEomzcaxlufgEMHejFwDcWQEYCdgp+oAy6Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Tue, 23 Jun
 2026 03:33:44 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%7]) with mapi id 15.21.0139.009; Tue, 23 Jun 2026
 03:33:43 +0000
Message-ID: <86db47e9-b2ab-450c-bf8c-1998a8cbebe9@intel.com>
Date: Tue, 23 Jun 2026 09:03:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t] tests/intel: Enable survivability tests on
 discrete platforms >= BMG
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Girotra, Himanshu"
 <himanshu.girotra@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <Ramadevi.Gandi@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Anirban, Sk" <sk.anirban@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
References: <20260622122431.11139-1-himanshu.girotra@intel.com>
 <20260622150056.ueb7a3uvvbucqlu5@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260622150056.ueb7a3uvvbucqlu5@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0207.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::6) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4be02e-20e5-415c-ecc7-08ded0d839ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: U7mLAjir4O6ni9Q4oBtign8xwm4eMprzQkSv6kGKqJVAOpbHvhDRUDK+Bb/Zvc8xWvyi7T9ErI4atlH/NRth349qFDIF6dk+eTYFH4tiycGFHX5te/B7we1nQwQIz3+kJ1rZtmAQzfLF1x5bgsVUZMecdyHQCfFUWvt8u4yg+CCYOwD9ar6V7E77y3fQhOC2XG/4E3wk2i6A9YKIjJc+ua/yBXbEGr+RHMRNdQRaZ4K73Oy3aYh8YiifLtGBXjU5jrKTg30aVZ7WWgEm6z+5XtZLRjVSqC50mVHnuou4sttqk9UzJ/Z9wkscDoOG8CoPbVleIUZi1ow4PCbRy7TvPZqxGWgw8jum7teXHelUIQqP8b3dTJN0ShdW4IzHS7Q0o4Zie5UK7YqQAw6FDAUSr/RkXQStMghXhhM+3Jv8MZEHTZl7Zj5ZLmjpKBqhXGKBIMIynIVuiU4uxGns7OmwJtOBUPHFxLhv87dhF+XlUykY0U8E0Me3u7lU+lTKrO5ml4YUKAosYsiBIqcOzHKDdlY3LUFfWOzEVX9nnEHLH0C0wdJZEnU41XdbTFK0KOGnz8cC/7IMdPtIcgiF6/8cBGFMas9ANF7gD9lli34pyJLAL/7vGMEcqVPfcKG5elpaUtHvAmqd66HRDYoNT7aI3M+0R6BmRJEaoc7v1sVhRwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVozK0hHS2p6VmFOMVB5bURtanlJSXpxR2ZmeXFwaWg2Y1liUjJRTHU1R2tL?=
 =?utf-8?B?OGRYMGkxMDR1R1A4aWpvSXRWMk9YY0ZsYnJzVkg5QVBpT0dodXVHaktUSzVr?=
 =?utf-8?B?SzhMYkYxMmI0V3l5SDYrNGlIWnZFQmxjbUx5L1dGVVFVdm9kaVJucll2ZTFI?=
 =?utf-8?B?NTJsRVpielhvSGVRZVZtSURRK3ZweFFoNzdXeEpLWDdlQStadGlIK2tRQnRx?=
 =?utf-8?B?QUM4bUY5V0dhT0hvdFJvVkRYUEhvYnBoME9TUmVqMWFMRlorc2ZCYS9XeGJt?=
 =?utf-8?B?RzJUM0N1OTRKdklESEtnTDl3VzN0TUQzdjJqVDJ2NVVtWHU0bWYzNTZWcDZG?=
 =?utf-8?B?WGpMRC82cldwSVdYOWV6Zmh1VEJuVVhkRkJRaGM4V1NrbWhaejVYK1o1STRV?=
 =?utf-8?B?MkZUcXBzRzA5YUNGOE52VUlibm95Tk9LYVFSd1pEV0FlZHZ2ZC9wazR4RHND?=
 =?utf-8?B?RUtnZGN6VlJpbUV1QU9rMmU5Zkx3Ym1SK1QwOFFLMXoydnFlcEhTOGpXQURG?=
 =?utf-8?B?SkRMcDlhSnRmUkFENHVhN09Ib3RpTkJIbUY2ODkxejlEQzBGdTZoVnY5aXlF?=
 =?utf-8?B?L0VUZjBneUxLTFJ6eEc0MkZZSFhpT2pqU2padlVCZG1BVm1FZ1JzaTk5Qnp4?=
 =?utf-8?B?d0hrVDR3cjNrcHJVUVhaQmNSVjJ2aExWa21jRXE0NWRudnNMcWhOdTZFVVla?=
 =?utf-8?B?MEI2Y1l0MzBHZklEc3QyTVU0UlBHSFF2dElMM1FmVDRjNm9UZ2dTWjlJWjU0?=
 =?utf-8?B?ZW5sWkQxMldjUEY2SUNBMEdMTHl3aTFyTktOSVNWeWp5eTlqRWJBK2tEMW5W?=
 =?utf-8?B?eHM0UVkxYnk1MkZPbkhVK0RhcVpsQW9BNXBqZEhwMG5hRStKYnAxS3czSlhx?=
 =?utf-8?B?VnBadm1JU3R5TDgwd1hsSjQza3ZVN3YyUWQyWGJJRTBjQU9xMlNQcGplSmN4?=
 =?utf-8?B?MFFGOXRncWFRSU5WTlV5WFdyQU1ZNUsyNEhJeXlWWlM2WXk3N29teCsvbnhD?=
 =?utf-8?B?M2FneFl4OE1YNFFBQ1FIanRQb2J0b0ExTFNIdTN0aG5uUitDd2ZWenhPejBG?=
 =?utf-8?B?L1dwRFVqc2ZWbGJvell2c3g1UjVqcVM2VXVyZmVqd0Q3aEN5VnFFbW1nWEY2?=
 =?utf-8?B?SHdyODBZaG9FWDdHbjBVM3NqdGJ2NFp4QzQ5citOb21POWhzSGppR3hTUENG?=
 =?utf-8?B?c1AwbTE2Njc4OXBoM0NLMUpudHRqMStZbURtclEwM1hySVVPUDhXUXdPU21y?=
 =?utf-8?B?VktoTGs0dVNQR1piOTdUaHRHMFZSY1o0SFdZSFdUSGlUTWlmZEt6K0x5SnZj?=
 =?utf-8?B?QWhESjJlRTJXbG1WYlBWRXdhZHRybndwOStYWXJyZUNNWElRTFFiSlB2VlBl?=
 =?utf-8?B?NnM5c2lDbHd0YXdWVWdCRDg5N1FLbUxiZWQ4S3A2YjVGeXBuc2pQU0JhTlUx?=
 =?utf-8?B?Z0YwMjNCaExWaXdJQnFEZjFHY2tScDhnRWJhN2hUL0xsZU4rS0U2NjE4WFRm?=
 =?utf-8?B?eDRhWDIzNG9NR25IU2VGWU5NMW5YRytxV2QxOHZGcTlrcXFHY3BZbFFEckdX?=
 =?utf-8?B?UnB2ck1wcGQ0SXl1THV1RWh4T29SdGNaSWR2SGZYdUdlVStqVGFZRElzS3BG?=
 =?utf-8?B?M2MyejUxTXZXejJ1MWtUK1JFVTZmZE4xYmlWT0Uya0ExOVFHa1AzWW5ua2I0?=
 =?utf-8?B?cGx5bHlkcmZTRVM5ay9wL3A1dGxMRDlDQ3pFaXlYdUtUOVIwUlR5NDEvdFVr?=
 =?utf-8?B?NUZsd0xwWmZHQTNuWGZQcDdkR2d4SERuamt6emN6TitWUGQwWm52S1h3K25L?=
 =?utf-8?B?QVVpeERRNFRIMWs1cjVXT0ZCM2RMRzhOd2YzT2tFN2lobXhTMURSZEdldmdH?=
 =?utf-8?B?czVUenpFcENkcGp1eFBRQnhGbnVPK1BBSmNqa0pHRHdQT3ZzRVNDMG94bTZ1?=
 =?utf-8?B?c1NEYlBNa1BaVm9SVU00bDVpdjRNbFd6UnFoUGtIU2Qrc0N4endhUDAranpF?=
 =?utf-8?B?am0wcTErN1lLTTJtYy8wQ1dRajQ2NUxES29CZ2tHS0thRDhJLzByL3o4eThu?=
 =?utf-8?B?eXB5SHJYMFNFbDRxaGE4Y3FNNzhYSmFMNldicVZpRjVsSTNVRDlkU3YwSU8y?=
 =?utf-8?B?TkdGTnY3OVBhMFJsaHkzaXBGbVEwYVpOVitaYXRsbWNLT3pHN0xwRzJueE1N?=
 =?utf-8?B?azJ5aU9wcHRNSWV1d3U4RzgrcklSWlE4cHJIV1dyVk5lcGZNUUJiUXpCWXdE?=
 =?utf-8?B?VnIvU2hUcktBQXcvQXV4ZWhCVXVEY0lEYWw4NWdjWm1JK3paby9iWTRqdXJ1?=
 =?utf-8?B?aHRlRVZRbE9WWXNMUllJY2YrSE4yOXIwbkJUWStXRnJSdEJWRndlUT09?=
X-Exchange-RoutingPolicyChecked: IHVk6YJhHdrqSBQA4p9lVpG4dtSmNN67MwTrLCey2gVYctsZ5Pv7Ef5u/Prpf3DXTg88NG/Eq71pDNh7LE6XUYovl2PTncIBVcZT3oLRbEiPPxRSbquzIuzZPNjGQ0la/v8y0Jszn4umzmiMUSCd+K/TRTlSmvyLyNJZzst9m7k9iheN5szCM8lz7vOottqR9Rhdsc5tEkzaQbXEISjKhErgXfCc8YDE5/6EdmXtffRaf7EiVwVO3jOXOmwj36Er7iAv+8Zi0F7WPSONJqYqpJUosPzXGkC3xp0dT/d1gtQbgCvAcH8QBidbNnitkVhYiAryPV3yb1FkVXGlHe4KKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4be02e-20e5-415c-ecc7-08ded0d839ce
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 03:33:43.8163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaAK1iF2SCm/FTZ/7OsG65ENYve6+e7i8P/UctHt8tk6LihuS5eH5M9SXRhtyJvYfFb3SwtHjHI5Ca3oXi5XXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
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


On 6/22/2026 8:30 PM, Kamil Konieczny wrote:
> Hi himanshu.girotra,
> On 2026-06-22 at 17:54:31 +0530, himanshu.girotra@intel.com wrote:
>> From: Himanshu Girotra <himanshu.girotra@intel.com>
>>
>> The survivability mode tests in xe_survivability and xe_configfs were
>> initially developed for Battlemage (BMG) and gated with IS_BATTLEMAGE.
>> Survivability mode is, however, supported by the KMD on all discrete
>> platforms from BMG onwards.
>>
>> Mirror this on the IGT side by replacing the BMG-only check with a
>> runtime discrete check combined with a graphics version check
>> of at least BMG (IP_VER(20, 1)).
>>
>> v2: use is_intel_dgfx() (Jani Nikula)
>> v3: add xe_has_survivability() helper in lib/xe/xe_query (Kamil Konieczny)
>>
>> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
>
>> ---
>>   lib/xe/xe_query.c              | 14 ++++++++++++++
>>   lib/xe/xe_query.h              |  1 +
>>   tests/intel/xe_configfs.c      |  6 +++---
>>   tests/intel/xe_survivability.c |  2 +-
>>   4 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> index f0799f268..68e60ddc7 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -23,6 +23,7 @@
>>   #include "igt_debugfs.h"
>>   #include "ioctl_wrappers.h"
>>   #include "igt_map.h"
>> +#include "intel_common.h"
>>   #include "intel_pat.h"
>>   
>>   #include "xe_query.h"
>> @@ -813,6 +814,19 @@ xe_dev_FN(xe_number_engines, engines->num_engines, unsigned int);
>>    */
>>   xe_dev_FN(xe_has_vram, has_vram, bool);
>>   
>> +/**
>> + * xe_has_survivability:
>> + * @fd: xe device fd
>> + *
>> + * Returns true if xe device @fd supports survivability mode. Survivability
>> + * mode is supported on discrete platforms from Battlemage (BMG) onwards.
>> + */
>> +bool xe_has_survivability(int fd)
>> +{
>> +	return is_intel_dgfx(fd) &&
>> +	       intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(20, 1);
>> +}
>> +
>>   /**
>>    * xe_vram_size:
>>    * @fd: xe device fd
>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>> index 9f04a7422..59330d80f 100644
>> --- a/lib/xe/xe_query.h
>> +++ b/lib/xe/xe_query.h
>> @@ -153,6 +153,7 @@ struct drm_xe_query_gt_list *xe_gt_list(int fd);
>>   struct drm_xe_query_oa_units *xe_oa_units(int fd);
>>   unsigned int xe_number_engines(int fd);
>>   bool xe_has_vram(int fd);
>> +bool xe_has_survivability(int fd);
>>   uint64_t xe_vram_size(int fd, int gt);
>>   uint64_t xe_visible_vram_size(int fd, int gt);
>>   uint64_t xe_available_vram_size(int fd, int gt);
>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>> index e7c797eb7..450c0a119 100644
>> --- a/tests/intel/xe_configfs.c
>> +++ b/tests/intel/xe_configfs.c
>> @@ -377,16 +377,16 @@ static void close_configfs_group(int configfs_fd, int configfs_device_fd)
>>   int igt_main()
>>   {
>>   	int fd, configfs_fd, configfs_device_fd;
>> -	uint32_t devid;
>>   	bool is_vf_device;
>> +	bool has_survivability;
>>   	const char *engine = NULL;
>>   
>>   	igt_fixture() {
>>   		struct drm_xe_engine_class_instance *hwe;
>>   
>>   		fd = drm_open_driver(DRIVER_XE);
>> -		devid = intel_get_drm_devid(fd);
>>   		is_vf_device = intel_is_vf_device(fd);
>> +		has_survivability = xe_has_survivability(fd);
>>   		set_bus_addr(fd);
>>   
>>   		xe_for_each_engine(fd, hwe) {
>> @@ -410,7 +410,7 @@ int igt_main()
>>   
>>   	igt_describe("Validate survivability mode");
>>   	igt_subtest("survivability-mode") {
>> -		igt_require(IS_BATTLEMAGE(devid));
>> +		igt_require(has_survivability);
>>   		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
>>   		configfs_device_fd = create_device_configfs_group(configfs_fd);
>>   		test_survivability_mode(configfs_device_fd);
>> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
>> index d5d7e048c..74488bbea 100644
>> --- a/tests/intel/xe_survivability.c
>> +++ b/tests/intel/xe_survivability.c
>> @@ -217,7 +217,7 @@ int igt_main()
>>   
>>   	igt_fixture() {
>>   		fd = drm_open_driver(DRIVER_XE);
>> -		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
>> +		igt_require(xe_has_survivability(fd));
>>   		vf_device = intel_is_vf_device(fd);
>>   		igt_require_f(!vf_device, "survivability mode not supported in VF\n");
>>   		pci_xe = igt_device_get_pci_device(fd);
>> -- 
>> 2.50.1

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

