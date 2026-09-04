Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8B0C624DE
	for <igt-dev@archiver.kernel.org>; Fri,  4 Sep 2026 08:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF1910E011;
	Fri,  4 Sep 2026 08:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L002J/FP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B74710E011
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2026 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788509864; x=1820045864;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=P9sAfgw2YE4AMndHmanFunSkEN//G0sgIay9c75qjdU=;
 b=L002J/FPahOTE9f4dShDEavFeGkiPwZRQzIwM2zxEAWIXieb0WBe5dXw
 /v2PM6dBRvhaN7koCY73evQEAPp1OPwatjQ6eqL7AIL5hqcmIBpG2wmmt
 YsSD6eOMU+RFBZwEaIj+oTzlHzMn/xA4xQ+D7I+XKl3cdCsrLIyo0uZIz
 kSBQU5QEvfm8lP6JjndF9C4bX+TveP+r4fP2XHtq189AtGqKgzhBRX4QD
 F6p/7wFGcqHmdxhjHiEGnWnsfERfNUaWpEDlyhKYUvXDKh1PAXxsEtSh5
 3vBLVnSHycvyDkcLpielTSEbZB04MFMYneAKlaBA6OLfqp3vxrM0nuKAM g==;
X-CSE-ConnectionGUID: HNxVRx9fQt6mb3wXC9kg+g==
X-CSE-MsgGUID: jA1knPOEQPOMxuCjeldLog==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87946081"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208,217";a="87946081"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:17:44 -0700
X-CSE-ConnectionGUID: O4W7nji1Sj2JQZ9GonAlGA==
X-CSE-MsgGUID: JKiU0tb6SjuIpzESro5reg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
 d="scan'208,217";a="263778775"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:17:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 01:17:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 01:17:42 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 01:17:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUZejrhMTQEHNtObrA0oPPifa517mIp/UbIaIQgE7Dhj1LOYvOIy84bvPORxuh1Kj+WjO5809t7h1JMg32yB7Tfe9s+dwwmzHwCIs98SBUTqjydOzqURiuQVRLXj8hLxbMaxFQHo+KifQlOAknoC3UusvFsmR1jhzIQe3GqfpuahIPWRwzU+Z5VcYxo8S884XR3+bGAY1YXE42Rn1WCw/o35F4LAwEOB1BHQTBF0W4zkdunauwfLTrEjBCcJ3qK2/sqoeNtDov41/QIwUzMYD0t5MMsdEBSMuLtOV3ri0YGwmOCTnPg6u7161w678jYN3mZ+9aEAmU5gz1xPHhzTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpArwNFvc7q+EiOUdK93OytavplyYJhob7ozqcwtdXo=;
 b=Z1gyC3mBg4KJTGw3NFZdXbH0N+b8oh2ijy0T7UP65r/1m7/H1UYM5EQ5FhrM4smoydVL9j5MTmCWloxHUkQElErnRwhw+NMUwWku9nYqu5QzRo3NRY9VIifYMBb7yfKoZC+tMZyqPo/GI+GX3/Lt6vOT18V1l3Qa0Ulz+tPIcvBRiveDq240TpHw6xhqOfuhcnKW/vbMDfoKclG/mt2KbtnKy8JlTxNtrYDyWTRip+ps38T6aA1kIFEaEaaJb5DfxMNCDYXQqBrCYq13cqtB2d6E1uAVz56apjMEJjhCuAaLsY58EbnG0CkRAZKzVNjPe0N67h2ecAYUUxyVoFyE/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 PH0PR11MB5094.namprd11.prod.outlook.com (2603:10b6:510:3f::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 08:17:20 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 08:17:20 +0000
Content-Type: multipart/alternative;
 boundary="------------8BACty28ZPnNL3SGikrjNqMM"
Message-ID: <4c55e918-52cd-4c18-8431-458b6edb667c@intel.com>
Date: Fri, 4 Sep 2026 13:47:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/intel/xe_ras: Introduce error threshold
To: Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <mallesh.koujalagi@intel.com>
References: <20260813080513.254848-1-raag.jadav@intel.com>
 <95dd0231-8023-47ee-8309-9d098280936a@intel.com>
 <apmZCgSTWDtIYWTh@black.igk.intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <apmZCgSTWDtIYWTh@black.igk.intel.com>
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|PH0PR11MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: f3cdd7d9-8091-495f-063b-08df0a5cf0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|3023799007|11063799006|6133799003|10067099003|4143699003|22082099003|18002099003|8096899003|56012099006;
X-Microsoft-Antispam-Message-Info: nbxkjvczxc0fpMz4BNlV6qR3px7v/4M+vbX08oIMnh8pIEHpKrBMJRsMR0loyM+4PCT6tJ9Fkvp1iV2UbTPOsN8/OfSuCXl3RJbRAKiwE3CcxaOnuuFQwTnx3QocMqhTGzaRIgilgsaHf/segmRV+g1+GQyKhiCBmwlBCDe4Oo82AsLKnsIcH45LwEScnUW6kljXUDwOUlB+wVBh8W1kuYEQXLwaruXF6r5in92hXSMc4X/v+uvplQ0reP6k4vRszdctkPyGiWITp7l8/4NUG8JbwtFMDj3UZtp8nqXnaq6x7xfWf1+Nke2wlrV9OlwEOIzBeHjU4aH0reJ4LzZRueiSLWl9R2kmfHavmifoUsyslAYlZbkkL9Z2kCuqpu829ApYFyMBqWMU1zjeair5hSh3cnlxegifszyxl6BlzA3BW8jZtNY7ZPbuecXF5JmrhUFOY+AWzE7uEee4Q/hrpRxDHJByXWlf2UJakeLyE8R3+9Z5Rp1F+j98MAdGYYXlZ0FIjtxpSfa8kwSAye5kb/PH2ifFIsHCM+i8uQ9M3LcZHOLoHpUOfutqs3C22xkH503ZcrLnGWObVS74ZIM8oIWpVrbdXTe5tCaO/1wbBuY+hzb+XYVJHIrqnbweQT/9P88iefzU1dvy6PsQiPn3eM23IfMsSNpcVettNkcIouk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(11063799006)(6133799003)(10067099003)(4143699003)(22082099003)(18002099003)(8096899003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3ROQ0JLcndkbnoxREZxQ0cyaWM4dDBvc1BMYmRpWEd5RHlxQUU2U1lDaFRW?=
 =?utf-8?B?S2E4eStrQ3pRUnpIeXNnSC95WDJPaUFrT0xiNzB5T3hmZE8rc0RITWlOK3lz?=
 =?utf-8?B?MUlLeEQzR0grSUI5UzBIMVJ0amE1SGtVdEF4VWFuL2RqNWtZcUY2N0xZUXNw?=
 =?utf-8?B?NmRlRDc3Szd0OGgxU3BKR2wzOS9TR2ljNmtRWmpwK2huSlpzUWpNRDFmV1l0?=
 =?utf-8?B?TzgyU2NxZzJBdjR0R1hDRGZrS2ZGeU9JVDEwemR4cytJTjcwZG9ST3NnTXBG?=
 =?utf-8?B?Wm1xM25XOGxsQUR4VUNDb0N6TUxCT1hmTXVGemRHdVdSQnRwR3Z4d1RBb3B3?=
 =?utf-8?B?MCtnU3RYdjAzMSthM040UXE0MGtONlI4Rk8ySWJQY1lCQ1Erb3NaZUo4SXln?=
 =?utf-8?B?blJmM2VWbG5yRlZTVnFRcXp4eHRMeTk2TDh0UUJvVnV3YzRiK1RTS0lwMHpO?=
 =?utf-8?B?V29aU3hTTC9pQ0RublhQVldVb3RTK1RISzVTdDMyekJsdXVYWUd3NGJKbkN0?=
 =?utf-8?B?TFhlVWI0S05reDZKVStERko2NjVlR1pYNGZ4dkpTYVJLdzZsdlIxTUtCMTND?=
 =?utf-8?B?YTVURXU5Y3A5MkpIVDNGQk5LQXUyU083WHlCSEhPUjJqc2RkWndlNVRmekkz?=
 =?utf-8?B?S1AxSDJuWDVNb2NuYW5NZWI1cDQvSjNVajZrTHIxQlAwZE83YVo3eXkvMnVo?=
 =?utf-8?B?Tzl6Q2tYbWlmOHZjbnhJV1g1YnNBbXQ0YmR1aElKNzZ6UmpOY0xUTkhBbDVM?=
 =?utf-8?B?d0g4d1J6S3ljSUZpbjF2UW9iM3pZMWFTcStXcnU3WnJucG5ZN0hPSnJaSTIw?=
 =?utf-8?B?SXRCeUlSMTU0SlFqU2dOM2RUT3BWZTlTb1VUbGZuSTgvdURRNTJIZzArR3JX?=
 =?utf-8?B?cHZGSURUNWZjME1CTURPODk3RVU2enZQd0tPUmQzaTV6TmN6NEJncmM3bGll?=
 =?utf-8?B?aXAvbEdQTTdOYWlVUk9zWWN3SUd5bXh6bkJ5QlRzTHZKcVpxandMOHpiN2JG?=
 =?utf-8?B?dnlJbXZWa2JyQkJGTFZtLzV2SWhRU0h5eWZDVVMrREdQUTVTY1IwUmUzOGNu?=
 =?utf-8?B?aEp0aTlURUV1WDlZZFJTMCs2UEtlUXR5MlhzSkpBcmw0U2VoWXVtblVIRDA5?=
 =?utf-8?B?YzVoT1ROL0NTYm1SSUc4OGVVcXZpWDZ2Z3FuTHBSL0hKbXJwZzFsVkxaL2Fa?=
 =?utf-8?B?dXVEYy9KZFEwd2JvUi85dlRoRHkzUGR1SEs0SXVIZ0VGc2RwczgydDEvMjBQ?=
 =?utf-8?B?Q080aDhXSmpYeVhWRlVLVXFCY0dkNndRcnFOUVhqZFVpdkJkV0VjakhIRW1V?=
 =?utf-8?B?SVQzR0p5cmttOWhJaWFPYUs3S1pOUy80ZHpHVWs5OE4ybUwxcC9WMEhTMHM5?=
 =?utf-8?B?SWRGOElDT29yRTMxQWVEN0VuLzZCdTlEZm1ac1J3Z3o0NTNGYk9wbTRDVHRO?=
 =?utf-8?B?akZkYWptZUF6Rm8zM3JXcGk2V2ZSQVEySTNlOE5uZFp0eWJjbTZRN0JEWkNp?=
 =?utf-8?B?Mmtob0VCOFlaY2VWZHBjcWl1Nk52Z3lHaGN3OG1GM08wMXJiU0Z0ZDhaOFR0?=
 =?utf-8?B?Sjh3bFExY2NnSFg2MldrN0VRZE5wUFprZXQwMUhIMFRFOE9KOEdGdDBNVEVL?=
 =?utf-8?B?TEdkaEhPaFdnd1ZCUzZtOGVqaHozejBJUmlOSDBDenNYaWRCRTd4TzQ2Q1BO?=
 =?utf-8?B?YnRvS0ZXbFBzeVozdElRYjE5blY3R1ZZbk9QaWJFL0JsL1JWejJ5dllaRU1u?=
 =?utf-8?B?OTVseU9XQkhqeGJ2V0JmdCsxbEthM1E1dVNXOElkdlNkWS9rVWFtNCtoVzJ2?=
 =?utf-8?B?a1ppMEJaZjFwMXNmTllyWVVxMVdGQmhVeUxHUmJQZkN1RDZyUWQ1enNiTUhy?=
 =?utf-8?B?TVhrNG9rZkZQblFNd3FjNHZyT2NCVzRRc05veTdEMjZ6VXhyUmtQZUpnSTlz?=
 =?utf-8?B?alREYy9MaFZDVHFuVjNVWVpWUGFYcVZaL3pYcFhZdm8xZldoanNLSnRJNGxP?=
 =?utf-8?B?eG9xL25DSnEyc1ZKQnc3U2FqcEZqRW9QdWpTSGtkMllic2h0RTJMT1NiNFJI?=
 =?utf-8?B?R1g4UHBIQWpOZ29tMHdmS3FJYk5KOUdjWm14dHBEUzhkWFBFaE1TQUE5SEZI?=
 =?utf-8?B?YWhBNC9KbnBlSU5CTTNJVGhUZHFkVWpseDdsTTdsdnlkeGgvNDZGZXlLQzdT?=
 =?utf-8?B?MlRKV0hjTkhPRkdwdm1raDE3aUhLTnpqQTRXNXVVQVJVc0cySENieWNrUGdZ?=
 =?utf-8?B?ZXd3QndpaDBKeWFPUUcyQWpMbERFMkh5LytyTGJQNHVRZzh3YjV6NEZOT3dY?=
 =?utf-8?B?VEtteC95a3o4QkNIQlJ4R0RMeUpuZW5JYlplREdGeHhHd0dZY1VITE85WThD?=
 =?utf-8?Q?LqvyaVGFgGnET42q/O/v+k/TZGsJbz1ZCfBjK?=
X-Exchange-RoutingPolicyChecked: LcKlEIduetp6tHSsRAWTmCiPE6M8ErbOd1ifyjhd0z4kXleCNlIE6Nv0cDb48a1f08xq8p6bxR8Fs3OktREnv+5hBXADRzQ4K/UeaKdRyoeaXl27IMtzjjNNY3OOjkl7FW+6qj/3wdNF1Q68JNzTINVJnN3haV85DRVJsmP5+2iW+Ed2Y5DAICy1jJmH6A/QfRsKNZkQCOnACcIj6IeQzSVS8224UGbpaVkVBYfAs1Eiu8vB0BDtW/67BRCfrngZdP7PeGNSVUja+AZ+2YmGCglsek39AadOeOqj9fS/5EfQ04d/Z17B3nbdGayXq2chTOBXhWO9A2M/NJMGlFuaCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cdd7d9-8091-495f-063b-08df0a5cf0a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 08:17:20.4558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wsl/xxbKUoG0OFwQj++/bQIhHl/e9AGwPqPnedjpy2IbXSYFtmMiDPQtBGS7j9BnQmI17k/3b3SjrQDtgrW+tbUqHHbmoAQA9BIKNir0s37eE0/uD/JdriOkKUTtIFd4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5094
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

--------------8BACty28ZPnNL3SGikrjNqMM
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Raag,

On 03-09-2026 21:28, Raag Jadav wrote:
> On Thu, Sep 03, 2026 at 07:28:31PM +0530, Tauro, Riana wrote:
>> On 13-08-2026 13:35, Raag Jadav wrote:
>>> Introduce error threshold test as part of xe_ras. This will serve as a
>>> foundation for all RAS related tests moving forward.
>>>
>>> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
>>> ---
>>>    include/drm-uapi/drm_ras.h |  53 ++++++++
>>>    meson.build                |   3 +
>>>    tests/intel/xe_ras.c       | 242 +++++++++++++++++++++++++++++++++++++
>>>    tests/meson.build          |   2 +
>>>    4 files changed, 300 insertions(+)
>>>    create mode 100644 include/drm-uapi/drm_ras.h
>>>    create mode 100644 tests/intel/xe_ras.c
>>>
>>> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
>>> new file mode 100644
>>> index 000000000..27c689564
>>> --- /dev/null
>>> +++ b/include/drm-uapi/drm_ras.h
>>> @@ -0,0 +1,53 @@
>>> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
>>> +/* Do not edit directly, auto-generated from: */
>>> +/*	Documentation/netlink/specs/drm_ras.yaml */
>>> +/* YNL-GEN uapi header */
>>> +/* To regenerate run: tools/net/ynl/ynl-regen.sh */
>>> +
>>> +#ifndef _UAPI_LINUX_DRM_RAS_H
>>> +#define _UAPI_LINUX_DRM_RAS_H
>>> +
>>> +#define DRM_RAS_FAMILY_NAME	"drm-ras"
>>> +#define DRM_RAS_FAMILY_VERSION	1
>>> +
>>> +/*
>>> + * Type of the node. Currently, only error-counter nodes are supported, which
>>> + * expose reliability counters for a hardware/software component.
>>> + */
>>> +enum drm_ras_node_type {
>>> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
>>> +};
>>> +
>>> +enum {
>>> +	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
>>> +	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
>>> +	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
>>> +	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
>>> +
>>> +	__DRM_RAS_A_NODE_ATTRS_MAX,
>>> +	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
>>> +};
>>> +
>>> +enum {
>>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
>>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
>>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
>>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
>>> +
>>> +	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
>>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
>>> +};
>>> +
>>> +enum {
>>> +	DRM_RAS_CMD_LIST_NODES = 1,
>>> +	DRM_RAS_CMD_GET_ERROR_COUNTER,
>>> +	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
>>> +	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
>>> +	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
>>> +
>>> +	__DRM_RAS_CMD_MAX,
>>> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
>>> +};
>>> +
>>> +#endif /* _UAPI_LINUX_DRM_RAS_H */
>> This should be split into a seperate patch and should either be generated
>> using ynl tool
>> or copied from kernel directly.
> I'll update to latest.

Latest UAPI header has the below command set

enum {
     DRM_RAS_CMD_LIST_NODES = 1,
     DRM_RAS_CMD_GET_ERROR_COUNTER,
     DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
*    DRM_RAS_CMD_ERROR_EVENT,*
     DRM_RAS_CMD_GET_ERROR_THRESHOLD,
     DRM_RAS_CMD_SET_ERROR_THRESHOLD,

     __DRM_RAS_CMD_MAX,
     DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
};

If kernel has the latest command set, then command numbers will get 
mismatched with IGT and it breaks the functionality. Update to the 
latest to fix this.

>
>>> diff --git a/meson.build b/meson.build
>>> index 980fb6421..5ef0b4edf 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -153,6 +153,9 @@ libpci = dependency('libpci', required : true)
>>>    libudev = dependency('libudev', required : true)
>>>    glib = dependency('glib-2.0', required : true)
>>> +libnl = dependency('libnl-3.0', required: true)
>>> +libnl_genl = dependency('libnl-genl-3.0', required: true)
>>> +
>>>    libtsi = cc.find_library('TSI', required : false)
>>>    if libtsi.found()
>>> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
>>> new file mode 100644
>>> index 000000000..91f624d9f
>>> --- /dev/null
>>> +++ b/tests/intel/xe_ras.c
>>> @@ -0,0 +1,242 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +/**
>>> + * TEST: Check Reliability Availability Serviceability
>>> + * Category: Core
>>> + * Mega feature: RAS
>>> + * Sub-category: Error handling tests
>>> + * Test category: functionality test
>>> + */
>>> +
>>> +#include <limits.h>
>>> +#include <netlink/socket.h>
>>> +#include <netlink/genl/ctrl.h>
>>> +#include <netlink/genl/genl.h>
>>> +
>>> +#include "igt.h"
>>> +#include "lib/igt_device.h"
>>> +#include "lib/igt_sysfs.h"
>>> +
>>> +#include "xe_drm.h"
>>> +#include "drm_ras.h"
>>> +
>>> +static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>> +
>>> +typedef struct {
>>> +	int fd_xe;
>>> +	int sysfs_fd;
>>> +	struct pci_device *pci_xe;
>>> +	struct nl_sock *sock;
>>> +	struct nl_cb *cb;
struct nl_cb *cb; is not used anywhere and modifying the default cb 
which is associated with netlink socket by using nl_socket_modify_cb().
>>> +	int family_id;
>>> +	uint32_t node_id;
>>> +	uint32_t error_id;
>>> +	uint32_t threshold;
>>> +} xe_ras_t;
>>> +
>>> +static void init_ras_ctx(xe_ras_t *ctx)
>>> +{
>>> +	int ret;
>>> +
>>> +	ctx->fd_xe = drm_open_driver(DRIVER_XE);
>>> +	ctx->sysfs_fd = igt_sysfs_open(ctx->fd_xe);
>>> +	ctx->pci_xe = igt_device_get_pci_device(ctx->fd_xe);
>>> +
>>> +	ctx->sock = nl_socket_alloc();
>>> +	igt_assert_f(ctx->sock, "Failed to allocate nl_sock");
>>> +
>>> +	ret = genl_connect(ctx->sock);
>>> +	igt_assert_f(!ret, "Failed to connect nl_sock: %s\n", nl_geterror(ret));
>>> +
>>> +	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
>>> +	igt_require_f(ctx->family_id >= 0, "drm-ras family not found\n");
>>> +}
>>> +
>>> +static void cleanup_ras_ctx(xe_ras_t *ctx)
>>> +{
>>> +	nl_close(ctx->sock);
>>> +	nl_socket_free(ctx->sock);
>>> +
>>> +	close(ctx->sysfs_fd);
>>> +	drm_close_driver(ctx->fd_xe);
>>> +}
>>> +
>>> +static uint32_t nlattr_max(uint32_t cmd)
>>> +{
>>> +	if (cmd == DRM_RAS_CMD_LIST_NODES)
>>> +		return DRM_RAS_A_NODE_ATTRS_MAX;
>>> +	else
>>> +		return DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX;
>>> +}
>>> +
>>> +static int nl_cb(struct nl_msg *msg, void *arg)
>>> +{
>>> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
>>> +	struct genlmsghdr *gnlh = nlmsg_data(nlh);
>>> +	struct nlattr *attrs[UCHAR_MAX];
>>> +	int ret, cmd = gnlh->cmd;
>>> +	xe_ras_t *ctx = arg;
>>> +
>>> +	ret = genlmsg_parse(nlh, 0, attrs, nlattr_max(cmd), NULL);
>>> +	if (ret) {
>>> +		igt_warn("Failed to parse nl msg: %s\n", nl_geterror(ret));
>>> +		return NL_SKIP;
>>> +	}
>>> +
>>> +	switch (cmd) {
>>> +	case DRM_RAS_CMD_LIST_NODES: {
>>> +		char *device_name, *node_name, pci_name[UCHAR_MAX];
>>> +		struct pci_device *pci = ctx->pci_xe;
>>> +
>>> +		if (!attrs[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME]) {
>>> +			igt_warn("Device name attribute not found\n");
>>> +			return NL_SKIP;
>>> +		}
>>> +
>>> +		if (!attrs[DRM_RAS_A_NODE_ATTRS_NODE_NAME]) {
>>> +			igt_warn("Node name attribute not found\n");
>>> +			return NL_SKIP;
>>> +		}
>>> +
>>> +		if (!attrs[DRM_RAS_A_NODE_ATTRS_NODE_ID]) {
>>> +			igt_warn("Node id attribute not found\n");
>>> +			return NL_SKIP;
>>> +		}
>>> +
>>> +		device_name = nla_get_string(attrs[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME]);
>>> +		node_name = nla_get_string(attrs[DRM_RAS_A_NODE_ATTRS_NODE_NAME]);
>>> +
>>> +		snprintf(pci_name, UCHAR_MAX, "%04x:%02x:%02x.%01x",
>>> +			 pci->domain, pci->bus, pci->dev, pci->func);
>>> +
>>> +		if (strcmp(node_name, error_severity[DRM_XE_RAS_ERR_SEV_CORRECTABLE]) ||
>>> +		    strcmp(device_name, pci_name))
>>> +			return NL_SKIP;
>>> +
>>> +		ctx->node_id = nla_get_u32(attrs[DRM_RAS_A_NODE_ATTRS_NODE_ID]);
>>> +		return NL_OK;
>>> +	}
>>> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>>> +		return NL_OK;
>>> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>>> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]) {
>>> +			igt_warn("Error threshold attribute not found\n");
>>> +			return NL_SKIP;
>>> +		}
>>> +
>>> +		ctx->threshold = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
>>> +		return NL_OK;
>>> +	default:
>>> +		return NL_SKIP;
>>> +	}
>>> +}
>> We should have this part of lib so other tests can re-use.
> I tried to keep it generic enough so that we can get away with simply
> adding switch cases for new commands here but sure, if having a lib
> makes more sense I'll wait for Ravi's series to merge.
>
>>> +static void prepare_nl_msg(xe_ras_t *ctx, struct nl_msg *msg, uint32_t cmd)
>>> +{
>>> +	int ret;
>>> +
>>> +	switch (cmd) {
>>> +	case DRM_RAS_CMD_LIST_NODES:
>>> +		break;
>>> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>>> +		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD, ctx->threshold);
>>> +		igt_assert_f(!ret, "Failed to put error threshold: %s\n", nl_geterror(ret));
>>> +		/* fallthrough */
>>> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>>> +		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID, ctx->node_id);
>>> +		igt_assert_f(!ret, "Failed to put node id: %s\n", nl_geterror(ret));
>>> +
>>> +		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID, ctx->error_id);
>>> +		igt_assert_f(!ret, "Failed to put error id: %s\n", nl_geterror(ret));
>>> +		break;
>>> +	default:
>>> +		igt_assert_f(0, "Invalid command: %u\n", cmd);
>>> +	}
>>> +}
>>> +
>>> +static uint32_t nlmsg_flags(uint32_t cmd)
>>> +{
>>> +	uint32_t flags = NLM_F_REQUEST | NLM_F_ACK;
>>> +
>>> +	if (cmd == DRM_RAS_CMD_LIST_NODES)
>>> +		flags |= NLM_F_DUMP;
>>> +
>>> +	return flags;
>>> +}
>>> +
>>> +static void test_cmd(xe_ras_t *ctx, uint32_t cmd)
>>> +{
>>> +	struct nl_msg *msg;
>>> +	void *msg_head;
>>> +	int ret;
>>> +
>>> +	msg = nlmsg_alloc();
>>> +	igt_assert_f(msg, "Failed to allocate nl_msg\n");
>>> +
>>> +	msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, ctx->family_id, 0,
>>> +			       nlmsg_flags(cmd), cmd, DRM_RAS_FAMILY_VERSION);
>>> +	igt_require_f(msg_head, "Failed to add nl msg header\n");
>>> +
>>> +	prepare_nl_msg(ctx, msg, cmd);
>>> +
>>> +	ret = nl_socket_modify_cb(ctx->sock, NL_CB_VALID, NL_CB_CUSTOM, nl_cb, ctx);
>>> +	igt_assert_f(!ret, "Failed to modify cb: %s\n", nl_geterror(ret));
>>> +
>>> +	ret = nl_send_auto(ctx->sock, msg);
>>> +	igt_assert_f(ret > 0, "Failed to send nl msg: %s\n", nl_geterror(ret));
>>> +
>>> +	ret = nl_recvmsgs_default(ctx->sock);
>>> +	igt_assert_f(!ret, "Failed to receive nl msg: %s\n", nl_geterror(ret));

As this test uses "NLM_F_REQUEST | NLM_F_ACK" flags for sending the 
request, it receives response payload + ACK for GET commands and only 
ACK for SET command. Order of payload and ACK is not known. so, we 
should process both the responses. in the current scenario, if payload 
is received first then ACK will be in the queue and becomes stale. For 
the next command, stale ACK will be received first and then it will not 
process the actual payload+ACK intended for second command at all.

Also, nl_recvmsgs_default() is a blocking call, either need to use the 
non-blocking call here or set some timeout for it.

>>> +
>>> +	nlmsg_free(msg);
>>> +}
>>> +
>>> +/**
>>> + * SUBTEST: error-threshold
>>> + * Description: test get/set error threshold of the counter
>>> + * Functionality: RAS
>>> + * GPU requirements: DRM RAS feature should be supported
>>> + */
>>> +static void test_error_threshold(xe_ras_t *ctx)
>>> +{
>>> +	ctx->node_id = UINT_MAX;
>>> +
>>> +	test_cmd(ctx, DRM_RAS_CMD_LIST_NODES);
>>> +
>>> +	/* drm_ras is missing */
>>> +	igt_skip_on(ctx->node_id == UINT_MAX);
>>> +	igt_info("node id: %d\n", ctx->node_id);
>>> +
>>> +	ctx->error_id = DRM_XE_RAS_ERR_COMP_CORE_COMPUTE;
>>> +	igt_info("error id: %d\n", ctx->error_id);
>>> +
>>> +	test_cmd(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
>>> +	igt_info("get error threshold: %u\n", ctx->threshold);
>>> +
>>> +	test_cmd(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
>>> +	igt_info("set error threshold: %u\n", ctx->threshold);
>>> +}
>>> +
>>> +int igt_main()
>>> +{
>>> +	xe_ras_t ctx;
>>> +
>>> +	igt_fixture() {
>>> +		memset(&ctx, 0, sizeof(ctx));
>>> +		init_ras_ctx(&ctx);
>>> +
>>> +		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>>> +		update_debug_mask_if_ci(DRM_UT_KMS);
>>> +	}
>>> +
>>> +	igt_subtest_f("error-threshold") {
>>> +		test_error_threshold(&ctx);
>> We are only checking if commands are supported here..
>> Why not set a threshold and check if we get the same back?
>> Is it planned as a follow up?
> I think that's what I did here but it's the other way around, we set
> what we get - which I thought was enough considering that driver is just
> a transport here and we don't care about the values.
>
> Raag

Agree with above thoughts but IMO, it would be good to try setting 
different value for threshold (instead of the get value) and then read 
it back to see whether set threshold worked or not.

Thanks,

Ravi Kishore K.

>>> +	}
>>> +
>>> +	igt_fixture() {
>>> +		cleanup_ras_ctx(&ctx);
>>> +	}
>>> +}
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index a62f447df..2ebdc74da 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -333,6 +333,7 @@ intel_xe_progs = [
>>>    	'xe_prime_self_import',
>>>    	'xe_pxp',
>>>    	'xe_query',
>>> +	'xe_ras',
>>>    	'xe_render_copy',
>>>    	'xe_vm',
>>>    	'xe_userptr_pressure',
>>> @@ -429,6 +430,7 @@ extra_dependencies = {
>>>    	'xe_fault_injection': [ lib_igt_xe_oa ],
>>>    	'xe_oa': [ lib_igt_xe_oa ],
>>>            'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
>>> +	'xe_ras': [ libnl, libnl_genl ],
>>>    }
>>>    test_executables = []
--------------8BACty28ZPnNL3SGikrjNqMM
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Raag,</p>
    <div class="moz-cite-prefix">On 03-09-2026 21:28, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:apmZCgSTWDtIYWTh@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Sep 03, 2026 at 07:28:31PM +0530, Tauro, Riana wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 13-08-2026 13:35, Raag Jadav wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Introduce error threshold test as part of xe_ras. This will serve as a
foundation for all RAS related tests moving forward.

Signed-off-by: Raag Jadav <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com">&lt;raag.jadav@intel.com&gt;</a>
---
  include/drm-uapi/drm_ras.h |  53 ++++++++
  meson.build                |   3 +
  tests/intel/xe_ras.c       | 242 +++++++++++++++++++++++++++++++++++++
  tests/meson.build          |   2 +
  4 files changed, 300 insertions(+)
  create mode 100644 include/drm-uapi/drm_ras.h
  create mode 100644 tests/intel/xe_ras.c

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
new file mode 100644
index 000000000..27c689564
--- /dev/null
+++ b/include/drm-uapi/drm_ras.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN uapi header */
+/* To regenerate run: tools/net/ynl/ynl-regen.sh */
+
+#ifndef _UAPI_LINUX_DRM_RAS_H
+#define _UAPI_LINUX_DRM_RAS_H
+
+#define DRM_RAS_FAMILY_NAME	&quot;drm-ras&quot;
+#define DRM_RAS_FAMILY_VERSION	1
+
+/*
+ * Type of the node. Currently, only error-counter nodes are supported, which
+ * expose reliability counters for a hardware/software component.
+ */
+enum drm_ras_node_type {
+	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
+};
+
+enum {
+	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
+
+	__DRM_RAS_A_NODE_ATTRS_MAX,
+	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
+
+	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_CMD_LIST_NODES = 1,
+	DRM_RAS_CMD_GET_ERROR_COUNTER,
+	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
+	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
+	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
+
+	__DRM_RAS_CMD_MAX,
+	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
+};
+
+#endif /* _UAPI_LINUX_DRM_RAS_H */
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
This should be split into a seperate patch and should either be generated
using ynl tool
or copied from kernel directly.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'll update to latest.</pre>
    </blockquote>
    <p>Latest UAPI header has the below command set&nbsp;</p>
    <p>enum {<br>
      &nbsp; &nbsp; DRM_RAS_CMD_LIST_NODES = 1,<br>
      &nbsp; &nbsp; DRM_RAS_CMD_GET_ERROR_COUNTER,<br>
      &nbsp; &nbsp; DRM_RAS_CMD_CLEAR_ERROR_COUNTER,<br>
      <b>&nbsp; &nbsp; DRM_RAS_CMD_ERROR_EVENT,</b><br>
      &nbsp; &nbsp; DRM_RAS_CMD_GET_ERROR_THRESHOLD,<br>
      &nbsp; &nbsp; DRM_RAS_CMD_SET_ERROR_THRESHOLD,<br>
      <br>
      &nbsp; &nbsp; __DRM_RAS_CMD_MAX,<br>
      &nbsp; &nbsp; DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)<br>
      };</p>
    <p>If kernel has the latest command set, then command numbers will
      get mismatched with IGT and it breaks the functionality. Update to
      the latest to fix this.</p>
    <blockquote type="cite" cite="mid:apmZCgSTWDtIYWTh@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">diff --git a/meson.build b/meson.build
index 980fb6421..5ef0b4edf 100644
--- a/meson.build
+++ b/meson.build
@@ -153,6 +153,9 @@ libpci = dependency('libpci', required : true)
  libudev = dependency('libudev', required : true)
  glib = dependency('glib-2.0', required : true)
+libnl = dependency('libnl-3.0', required: true)
+libnl_genl = dependency('libnl-genl-3.0', required: true)
+
  libtsi = cc.find_library('TSI', required : false)
  if libtsi.found()
diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
new file mode 100644
index 000000000..91f624d9f
--- /dev/null
+++ b/tests/intel/xe_ras.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: Check Reliability Availability Serviceability
+ * Category: Core
+ * Mega feature: RAS
+ * Sub-category: Error handling tests
+ * Test category: functionality test
+ */
+
+#include &lt;limits.h&gt;
+#include &lt;netlink/socket.h&gt;
+#include &lt;netlink/genl/ctrl.h&gt;
+#include &lt;netlink/genl/genl.h&gt;
+
+#include &quot;igt.h&quot;
+#include &quot;lib/igt_device.h&quot;
+#include &quot;lib/igt_sysfs.h&quot;
+
+#include &quot;xe_drm.h&quot;
+#include &quot;drm_ras.h&quot;
+
+static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
+
+typedef struct {
+	int fd_xe;
+	int sysfs_fd;
+	struct pci_device *pci_xe;
+	struct nl_sock *sock;
+	struct nl_cb *cb;</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    struct nl_cb *cb; is not used anywhere and modifying the default cb
    which is associated with netlink socket by using
    nl_socket_modify_cb().
    <blockquote type="cite" cite="mid:apmZCgSTWDtIYWTh@black.igk.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
+	int family_id;
+	uint32_t node_id;
+	uint32_t error_id;
+	uint32_t threshold;
+} xe_ras_t;
+
+static void init_ras_ctx(xe_ras_t *ctx)
+{
+	int ret;
+
+	ctx-&gt;fd_xe = drm_open_driver(DRIVER_XE);
+	ctx-&gt;sysfs_fd = igt_sysfs_open(ctx-&gt;fd_xe);
+	ctx-&gt;pci_xe = igt_device_get_pci_device(ctx-&gt;fd_xe);
+
+	ctx-&gt;sock = nl_socket_alloc();
+	igt_assert_f(ctx-&gt;sock, &quot;Failed to allocate nl_sock&quot;);
+
+	ret = genl_connect(ctx-&gt;sock);
+	igt_assert_f(!ret, &quot;Failed to connect nl_sock: %s\n&quot;, nl_geterror(ret));
+
+	ctx-&gt;family_id = genl_ctrl_resolve(ctx-&gt;sock, DRM_RAS_FAMILY_NAME);
+	igt_require_f(ctx-&gt;family_id &gt;= 0, &quot;drm-ras family not found\n&quot;);
+}
+
+static void cleanup_ras_ctx(xe_ras_t *ctx)
+{
+	nl_close(ctx-&gt;sock);
+	nl_socket_free(ctx-&gt;sock);
+
+	close(ctx-&gt;sysfs_fd);
+	drm_close_driver(ctx-&gt;fd_xe);
+}
+
+static uint32_t nlattr_max(uint32_t cmd)
+{
+	if (cmd == DRM_RAS_CMD_LIST_NODES)
+		return DRM_RAS_A_NODE_ATTRS_MAX;
+	else
+		return DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX;
+}
+
+static int nl_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct genlmsghdr *gnlh = nlmsg_data(nlh);
+	struct nlattr *attrs[UCHAR_MAX];
+	int ret, cmd = gnlh-&gt;cmd;
+	xe_ras_t *ctx = arg;
+
+	ret = genlmsg_parse(nlh, 0, attrs, nlattr_max(cmd), NULL);
+	if (ret) {
+		igt_warn(&quot;Failed to parse nl msg: %s\n&quot;, nl_geterror(ret));
+		return NL_SKIP;
+	}
+
+	switch (cmd) {
+	case DRM_RAS_CMD_LIST_NODES: {
+		char *device_name, *node_name, pci_name[UCHAR_MAX];
+		struct pci_device *pci = ctx-&gt;pci_xe;
+
+		if (!attrs[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME]) {
+			igt_warn(&quot;Device name attribute not found\n&quot;);
+			return NL_SKIP;
+		}
+
+		if (!attrs[DRM_RAS_A_NODE_ATTRS_NODE_NAME]) {
+			igt_warn(&quot;Node name attribute not found\n&quot;);
+			return NL_SKIP;
+		}
+
+		if (!attrs[DRM_RAS_A_NODE_ATTRS_NODE_ID]) {
+			igt_warn(&quot;Node id attribute not found\n&quot;);
+			return NL_SKIP;
+		}
+
+		device_name = nla_get_string(attrs[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME]);
+		node_name = nla_get_string(attrs[DRM_RAS_A_NODE_ATTRS_NODE_NAME]);
+
+		snprintf(pci_name, UCHAR_MAX, &quot;%04x:%02x:%02x.%01x&quot;,
+			 pci-&gt;domain, pci-&gt;bus, pci-&gt;dev, pci-&gt;func);
+
+		if (strcmp(node_name, error_severity[DRM_XE_RAS_ERR_SEV_CORRECTABLE]) ||
+		    strcmp(device_name, pci_name))
+			return NL_SKIP;
+
+		ctx-&gt;node_id = nla_get_u32(attrs[DRM_RAS_A_NODE_ATTRS_NODE_ID]);
+		return NL_OK;
+	}
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
+		return NL_OK;
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
+		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]) {
+			igt_warn(&quot;Error threshold attribute not found\n&quot;);
+			return NL_SKIP;
+		}
+
+		ctx-&gt;threshold = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
+		return NL_OK;
+	default:
+		return NL_SKIP;
+	}
+}
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
We should have this part of lib so other tests can re-use.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I tried to keep it generic enough so that we can get away with simply
adding switch cases for new commands here but sure, if having a lib
makes more sense I'll wait for Ravi's series to merge.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+static void prepare_nl_msg(xe_ras_t *ctx, struct nl_msg *msg, uint32_t cmd)
+{
+	int ret;
+
+	switch (cmd) {
+	case DRM_RAS_CMD_LIST_NODES:
+		break;
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
+		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD, ctx-&gt;threshold);
+		igt_assert_f(!ret, &quot;Failed to put error threshold: %s\n&quot;, nl_geterror(ret));
+		/* fallthrough */
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
+		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID, ctx-&gt;node_id);
+		igt_assert_f(!ret, &quot;Failed to put node id: %s\n&quot;, nl_geterror(ret));
+
+		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID, ctx-&gt;error_id);
+		igt_assert_f(!ret, &quot;Failed to put error id: %s\n&quot;, nl_geterror(ret));
+		break;
+	default:
+		igt_assert_f(0, &quot;Invalid command: %u\n&quot;, cmd);
+	}
+}
+
+static uint32_t nlmsg_flags(uint32_t cmd)
+{
+	uint32_t flags = NLM_F_REQUEST | NLM_F_ACK;
+
+	if (cmd == DRM_RAS_CMD_LIST_NODES)
+		flags |= NLM_F_DUMP;
+
+	return flags;
+}
+
+static void test_cmd(xe_ras_t *ctx, uint32_t cmd)
+{
+	struct nl_msg *msg;
+	void *msg_head;
+	int ret;
+
+	msg = nlmsg_alloc();
+	igt_assert_f(msg, &quot;Failed to allocate nl_msg\n&quot;);
+
+	msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, ctx-&gt;family_id, 0,
+			       nlmsg_flags(cmd), cmd, DRM_RAS_FAMILY_VERSION);
+	igt_require_f(msg_head, &quot;Failed to add nl msg header\n&quot;);
+
+	prepare_nl_msg(ctx, msg, cmd);
+
+	ret = nl_socket_modify_cb(ctx-&gt;sock, NL_CB_VALID, NL_CB_CUSTOM, nl_cb, ctx);
+	igt_assert_f(!ret, &quot;Failed to modify cb: %s\n&quot;, nl_geterror(ret));
+
+	ret = nl_send_auto(ctx-&gt;sock, msg);
+	igt_assert_f(ret &gt; 0, &quot;Failed to send nl msg: %s\n&quot;, nl_geterror(ret));
+
+	ret = nl_recvmsgs_default(ctx-&gt;sock);
+	igt_assert_f(!ret, &quot;Failed to receive nl msg: %s\n&quot;, nl_geterror(ret));</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p>As this test uses &quot;NLM_F_REQUEST | NLM_F_ACK&quot; flags for sending
      the request, it receives response payload + ACK for GET commands
      and only ACK for SET command.&nbsp;Order of payload and ACK is not
      known. so, we should process both the responses.&nbsp;in the current
      scenario, if payload is received first then ACK will be in the
      queue and becomes stale. For the next command, stale ACK will be
      received first and then it will not process the actual payload+ACK
      intended for second command at all.</p>
    <p>Also, nl_recvmsgs_default() is a blocking call, either need to
      use the non-blocking call here or set some timeout for it.</p>
    <blockquote type="cite" cite="mid:apmZCgSTWDtIYWTh@black.igk.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
+
+	nlmsg_free(msg);
+}
+
+/**
+ * SUBTEST: error-threshold
+ * Description: test get/set error threshold of the counter
+ * Functionality: RAS
+ * GPU requirements: DRM RAS feature should be supported
+ */
+static void test_error_threshold(xe_ras_t *ctx)
+{
+	ctx-&gt;node_id = UINT_MAX;
+
+	test_cmd(ctx, DRM_RAS_CMD_LIST_NODES);
+
+	/* drm_ras is missing */
+	igt_skip_on(ctx-&gt;node_id == UINT_MAX);
+	igt_info(&quot;node id: %d\n&quot;, ctx-&gt;node_id);
+
+	ctx-&gt;error_id = DRM_XE_RAS_ERR_COMP_CORE_COMPUTE;
+	igt_info(&quot;error id: %d\n&quot;, ctx-&gt;error_id);
+
+	test_cmd(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
+	igt_info(&quot;get error threshold: %u\n&quot;, ctx-&gt;threshold);
+
+	test_cmd(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
+	igt_info(&quot;set error threshold: %u\n&quot;, ctx-&gt;threshold);
+}
+
+int igt_main()
+{
+	xe_ras_t ctx;
+
+	igt_fixture() {
+		memset(&amp;ctx, 0, sizeof(ctx));
+		init_ras_ctx(&amp;ctx);
+
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+		update_debug_mask_if_ci(DRM_UT_KMS);
+	}
+
+	igt_subtest_f(&quot;error-threshold&quot;) {
+		test_error_threshold(&amp;ctx);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
We are only checking if commands are supported here..
Why not set a threshold and check if we get the same back?
Is it planned as a follow up?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think that's what I did here but it's the other way around, we set
what we get - which I thought was enough considering that driver is just
a transport here and we don't care about the values.

Raag
</pre>
    </blockquote>
    <p>Agree with above thoughts but IMO, it would be good to try
      setting different value for threshold (instead of the get value)
      and then read it back to see whether set threshold worked or not.</p>
    <p>Thanks,</p>
    <p>Ravi Kishore K.</p>
    <blockquote type="cite" cite="mid:apmZCgSTWDtIYWTh@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+	}
+
+	igt_fixture() {
+		cleanup_ras_ctx(&amp;ctx);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index a62f447df..2ebdc74da 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -333,6 +333,7 @@ intel_xe_progs = [
  	'xe_prime_self_import',
  	'xe_pxp',
  	'xe_query',
+	'xe_ras',
  	'xe_render_copy',
  	'xe_vm',
  	'xe_userptr_pressure',
@@ -429,6 +430,7 @@ extra_dependencies = {
  	'xe_fault_injection': [ lib_igt_xe_oa ],
  	'xe_oa': [ lib_igt_xe_oa ],
          'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
+	'xe_ras': [ libnl, libnl_genl ],
  }
  test_executables = []
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------8BACty28ZPnNL3SGikrjNqMM--
