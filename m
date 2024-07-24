Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DF7C3DA61
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 13:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E364110E384;
	Wed, 24 Jul 2024 13:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmXKfqLR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D2110E384
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jul 2024 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721829178; x=1753365178;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3f0gsOBkXUR2E6jZP/I8KrXPLJCoKLNXuBYDnVWzif4=;
 b=DmXKfqLRcto3sPSGfZCzP+HbTPecYN+wr6fFlH6pB44w9Ddx7i4IxNaz
 6jnWa4yGJ0MPCE3CWZoQdhOZO6uLCk9pS4bJ/23COP/GOGvVtaomahT2b
 9icPmT8mWzX2hkmV6nlclGF5bXqBhQEvv//1+CvP2lw9Z9p6RVVpNdROy
 jz+Fg62l4u66EhGT0PMQ7OYiCzmoiH1riwkNVyVGXmSOBQ0MpiKONhNVI
 hCwY8TcFW8DvUJ+m4VGWMbVobpo4q+LOylhCBriqpMDkf/THDXuomriVP
 Do4iM1bGcQ99zfg4vJLYn5lLb+YhTjdthhJ9HTyJ/QMkZVqWNKjAK1zVW g==;
X-CSE-ConnectionGUID: elIsyYmKR42KRY7fquDNIQ==
X-CSE-MsgGUID: ZwUt1rSERU2E6nsOjq3tBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30898802"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="30898802"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 06:52:58 -0700
X-CSE-ConnectionGUID: TzVwEtoKT7+gZwPz2ylFTg==
X-CSE-MsgGUID: ysJcKAu2S+SHjdzfF8A8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="52286031"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 06:52:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 06:52:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 06:52:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 06:52:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 06:52:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsWWv+AlbiZga6jAFUd3LPRXY6J0fySuvm0HjK2sN/IdkS38Xiwseilb5TIoKON8Z/NLelMIpH8A84WOj2Z7lnOJh9C7ELPRLodF8zm0OrEnlEFGrjjCkADRvPfC1Iit0C7q1Zyp46t2SAZV8TLfsDk9iEVnoDUNPA9uEwT8v+XKaNhR8rFa3JjBKC0Obb/i8Dl6yG2P5qGCjip6ENah6vx6yEYTBfaR/M8UGCsnPrb4W5IzQjG6lAtlnDsXJAOhZaB7cos1o6EmJGtR7/AQQulDf+Y20t1jf3k2K1oKn3al86nab3Clege84yIFBRCTBHLlqO2ru41xdrjouStZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgY976qqez7egRBXAvshws2lrZ7WuSkNUbdTr5XW6+c=;
 b=CkxMCv8kTwlJTecuNc3hRoDza5kyo9AzCbs7txmtaD04i5PBJKIZp0PzMhQJ+4IC4qSdMIBpaL1+VBcB9UONJPaTCNaOmdz7bsQlOeBm8TKndg+v3bX7AFHJJe2Fj5zSZ6uQJfs8nMJ6PLI0+uRKEyBslCjhi4xficSRBAb+MUZTLNQI99sW2hCRfTc1JkSoWMPfGdFXl6f4NQOyjDDs+PMQPvLrpW84AxizydVv5SefoMcFx6ry0VOVaKVkbLBZvHiw3jy8qSHCcMCN4lxuE2A6V9YtmdVApcechI/L/SPsgfpkTUILnN6ZFSpUJrVKSZXNRZ/vm1KvqNzTzoRVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7550.namprd11.prod.outlook.com (2603:10b6:510:27d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 24 Jul
 2024 13:52:54 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 13:52:54 +0000
Message-ID: <0a30139b-c62d-4146-81ca-8aef51069a92@intel.com>
Date: Wed, 24 Jul 2024 19:22:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/i915_pm_rps: Disable subtest
 thresholds-park when SLPC is enabled
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
CC: <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>
References: <20240724124919.87566-1-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240724124919.87566-1-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 192a16cf-ecb9-4584-067b-08dcabe7ead8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVJTY1RyTzZHVjY4TG13ZDB2cXUvTEllYTFuK1Q2NjV0eWo5cEtMZ29BL2po?=
 =?utf-8?B?WTBOOEd3b1RnMDhVMDZNYmFSK1ZydzFlNzExNEtLKzNFUTZxRTd1L25tOFpS?=
 =?utf-8?B?Z2FXM0g5bUU0TW5Tc0ttYmY3S2oxd0NTa0VjWmhaMjE2a3ZET3RzMUtZc0tw?=
 =?utf-8?B?MjBPRURmdHVtdzBMNjRqWkt1Q01zdVE3MGhYVEdpMGFWV3ZlN0szRE5lNXJ3?=
 =?utf-8?B?blR3eitCZThDbXJYeUVsbmV4bkgvNkFDMlltMkorU0FKRTUzNEdFK2JkM3k3?=
 =?utf-8?B?V1NYRCt3WEV4Z2RBVWcyMFVCWkF5dXF4UHdScVduZk9aTXJhT2VWaENnVnRi?=
 =?utf-8?B?dVlaM0ZTcWVNVEFPZG5xd1U1WStDQU9OMi9PeFArWXFPWUF0elB6R0htaXRE?=
 =?utf-8?B?THlsWHNwOVRjSHFCK3QxcCtwZUNNdnpzYkVkVlIxYndXME8vamQ2UGdyR3Vv?=
 =?utf-8?B?MmhkeDlFcXBFRDRBb05MWlo1MC9SbkhiL0tEVjByT3MydEdmMkVWWTdqeENS?=
 =?utf-8?B?Tk01TEZWdXhCN3l0ZFRMWlk3MUh6bS9HdWFBMEZXWWN6Z1lXUzZ6RWhLMW5L?=
 =?utf-8?B?cDVNVWN0M1c3YW9KTjc4WTloaHJ6dXZFR2lMSUtMVWpMNk5OZXVWc01sRzRI?=
 =?utf-8?B?TWw2VlczbytYYWNVZlJDQ0ZFR0VaR0hCVHhQMzdEY3JGNUc0QStLYm9kbW5U?=
 =?utf-8?B?OWVoRVlJa25pUFhqSEh4bitjbXFEclhQMm90dnVlSDZDTUh2K1R0RUNZYzc0?=
 =?utf-8?B?ZjY5L093YkthYTZreHVMdk5BRGQxZk84TGpBYXo0L2V6VGpaSHpkcCtmV25m?=
 =?utf-8?B?RTZvNW53VnhhbEZ4SmF2cko0eG04TmhZVEt2OEIzcXRmRnFjMkpVcit6Nmo3?=
 =?utf-8?B?MSs2VUlYOXhYUEVzSDlVdDlKNWIvYS96OGYyamJib25pQlNWcVlHUzdTMXJs?=
 =?utf-8?B?a3J0a1hVc0NjZ0RrYnpGa1NTaUsvaGRkSktBNFU3OWVSSE9uY2liQ1A2UTU4?=
 =?utf-8?B?VGdWYjJlb2cyOUdyUzFTNDU0cGhjOHkvU3pRVmJ2dGF6bUpXMFNlaVNUdXNL?=
 =?utf-8?B?QnRPajNETUVzaWpTeDV5NGFlN2ZsbU40UHB4YnFYV01uOVFjZDhpZ3NTSzBJ?=
 =?utf-8?B?Wkd5WDJhTDlPS0RGYXI1V3lJM3ZqdG9aOVlSQ2x4S1lyZ3RwaVJlQWJ6SkhQ?=
 =?utf-8?B?SjZpdDJOWEY2VHoxaGlsNHdnN2ZDT3hVTmFJQXBNQVZYOElRaTBYU1FvamhS?=
 =?utf-8?B?cGJ2OEN4dnF0M2F5OTNwMzVvOU5TNVRocTU5NHd4R1hPTWhyNmN2MFNKQ1Nv?=
 =?utf-8?B?ek9BbGIvd1ozcG5oaXFlTWhOTUpTU2h4WXE3Sll2SElzK2pKTklabmlXZkcx?=
 =?utf-8?B?ZGJKeklFaTl2V3BmeS8wRWF6U3RseFY3Nnk0REVBQ2Z4bXhyMElFZGZ2SFRp?=
 =?utf-8?B?NlF4Z3lsTms5dVdnb2dNK1N3bEE3WCtocmkweXI5MGw3T1VuNms0bU9qYlIv?=
 =?utf-8?B?NWVQUzBkT1J2S29UVXVIdlBTRUlsUUYrcVVRK0lZb1J3Q0VvVTFOUzFUTGZR?=
 =?utf-8?B?VEhQTTBtSFBIeFVnbUk0clNWcnBoQVMxVXp4MEdTeXVZR1VCbVhiMkdHUkxS?=
 =?utf-8?B?NzUyRElJcW5jUExldkRaSVN3OXp6ekNPUVJrYlVGKzJtVW5JQnhJcDI3WlBr?=
 =?utf-8?B?S0FHRmtHNXgvYTlEV0RIRDlVa2FQRWpmdXR3ZGF0VVhQRDZESW5nQ2JFUVZF?=
 =?utf-8?Q?JZeqCbXwo2OPeDKlsE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWVPN0tuVEQzZGM3WUxydG5vOUF4c0dkS1RtVmhtcVVkcWVKMVl0RjhNb3BE?=
 =?utf-8?B?ZEE0VUlranl2ZHlVWEROM3M3LytOcHF0UnZyN3pnZFA3YkhoYmd2eWoxeXEy?=
 =?utf-8?B?aU5SQnFzNDMxbHhSME4wV3JxWURhcERPc0owQ3ZsTTNkN01pV1J4ZlBzY2da?=
 =?utf-8?B?UVhNOVhCRWRCS0NuWUJxR2NlVXp6b3RoNlUwWnlidFczOGZmcWFQTzhUQU5T?=
 =?utf-8?B?QmhQUW9vUE1MUnJ0dHFIbk9BSkkreUYzb3ZydUllM0xIREg4UU5FcFlVOU42?=
 =?utf-8?B?b3M0bnozeXFhTmJRRmVNWFNzV1pqU2JzZG9XU1FQN0FqTjh2VHNKc3lEbU1U?=
 =?utf-8?B?dlc2STIwSmFvcWtLTnE0RnpKdDAzNE9EZldUaFdITDRNWnNQeTE5QVVyVHNh?=
 =?utf-8?B?b1FmNzdOY1drSlYxdFZaRFJOaVp6cWd3L0JZVmRsb2FNdENlVFZpcEEvekNl?=
 =?utf-8?B?SFg2Ylkza2RCUWF3TGpxQzhJVWhaR3oxZndlUzBsWlZDcGo1OHlSRkZHRy8y?=
 =?utf-8?B?MnU1akVvUUZqUXVRQkh0VmZENk9ZbHdTUUxaWCtVSFBWalpPYjdkcXR0WFpR?=
 =?utf-8?B?c3czd3R3NTlydlAwL3ZLYS84SW92UzJ4Rmt0UHJhQWdTaXNuUGNUR2VEUGt0?=
 =?utf-8?B?WnVQTUFab3liOVc5ZGxySWh0R2RnbXJkc29HZU5BZHdrR2tHclJ2L0JicUpE?=
 =?utf-8?B?Umc0czJNVXZkL2NzYUdkaW9aUXljQjdBQkNkTTlrVm51bnVlWXZMMDlQZTBE?=
 =?utf-8?B?WW0vOUs3My9DQVFjcEM5dFdUOFFpMVdldnN0YmtpUFR1ZmtnWkowWHQwUDFJ?=
 =?utf-8?B?cW1SMVp2b29TUlNLak92clc5aU51Y2FiMmhTSlV0K1MrYzBaVEc5T1lJSWNl?=
 =?utf-8?B?OXpyempObUhyVit5b2xxQURIMlJnaVl1dWdFVHU4ODZwUXc2VUFvT3ArVG1j?=
 =?utf-8?B?MXhZaS9rcElTeGV4YmFBbjRjckV1U3Rjdm9iOTRpd29Fd3pBeTd0bjZOejRQ?=
 =?utf-8?B?Y3d0VXFXZlhxRFU2Q2RtTHpDdUJ1YzdYQTFuUVBTVjBXZDh1SDUxR3FQYWNp?=
 =?utf-8?B?YmxrOEVrMmlGUENvelR6VWcyN2d4VFhzT3c4aDR1MkJPTG1mTWxNdTIvOW9n?=
 =?utf-8?B?YXdHeUg4ZVZlZGlwd2lLNURFN1E4eGczc2pSQkljcDViSnNBK1RVVmM0bzRG?=
 =?utf-8?B?Zld5NTdLdFdpekUyaFBGanBjbFJnVGdGcWh0QWJjKzJyVTQ3WXpRNEQ4TlBj?=
 =?utf-8?B?NHh6NFJXQmxleFBBTks1UWRiKy9neEZIR05leXBmTDFIUTVVL3R4UVhHYm93?=
 =?utf-8?B?cy9jZzBEdm5CY1VuQ29lMStneVAzQm1KY0lUams1VzhhY3FocUIwRUdTNE4z?=
 =?utf-8?B?eEJ2OTZyeHAvQVJpQWR3cG5RcVhsa21lRXB5dXh2U3dWWWJDZlpyempJQ000?=
 =?utf-8?B?UHIvd205WTZKOU9Id21yTlpqZFNUa1NLNXBPenRHcWFxcDVuRmxvVTF1cndh?=
 =?utf-8?B?MUw3cXRsN2NINFBwZU1TcnFheTg5NW93WG9ZakVrQ2Zmd2tSU2xoMTJPQU15?=
 =?utf-8?B?ZzJuM2c5YTVlQlQvWGl3d3hVSTd5RXFrRFZ6alBDQTJXRWt4SFArRzdnNUlq?=
 =?utf-8?B?QWp0OXhZZ1JVTHlGWjNSUGx0TWl3dEowVUpBMVZnRkVMVW8rSVBwT0VQVkpi?=
 =?utf-8?B?OWQ1OHNPY0lrZ3ZxaXRZYXN0akhNOG5vbS80dE8xSHRFekIwVHhabVlXc1VZ?=
 =?utf-8?B?MnNubWlITTVaOHNadUIwT2VnV0NrL003VC9mZG1BS3pGN2dTR202ZzVuOHhH?=
 =?utf-8?B?WlZoUE0rb283SGVuYVgrSExvRFhmaktOK2NCeFhnRXlDSm5PcDZmMmxZZThL?=
 =?utf-8?B?WURLWEZ4bEVsQkNQOE82cHd1b1o2eTc1bU1JOWY0ZHpzbVZDZnhqL0htM0hJ?=
 =?utf-8?B?VHptVEVyTlloSTJmU3hYWEJQcFRGMkdodm5DTmRnOFRoa3c2b0pLb0s1QlVq?=
 =?utf-8?B?V1prTmowSWo3cUd2Y3F5RjNkakI4UEpIdjZDNStDR2pzTnhkRTgyM2RXWFE5?=
 =?utf-8?B?Vzh5NFNEQ055aEdhcGN1RyttVHU2WEhTNldhcStXY3puT2w2bmpOR1EzQThy?=
 =?utf-8?Q?T7mAthr/SHZYjyRFung6aXH1h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 192a16cf-ecb9-4584-067b-08dcabe7ead8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 13:52:54.7161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qusfgdMf7sBF/QXzLe5+Wn7X5EL1EHbY7U05Hh1tIZ1EabBewFazCvYPaSPAoA7hegYyoL108KYYIQxBICOL7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7550
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

Hi Anirban

On 7/24/2024 6:19 PM, sk.anirban@intel.com wrote:
> From: Sk Anirban <sk.anirban@intel.com>
> 
> Skip the test when SLPC is enabled as it fails frequently.
Provide reason for failure.
> 
> Bug: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11455
closes?
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/i915_pm_rps.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index 99b83f315..e1489b446 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -1179,7 +1179,8 @@ igt_main
>   
>   	igt_subtest_with_dynamic("thresholds-park") {
>   		int tmp, gt;
> -
> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
> +			      "This subtest is not supported when SLPC is enabled\n");
Don't we need this for all threshold tests?

Thanks,
Riana
>   		i915_for_each_gt(drm_fd, tmp, gt) {
>   			igt_dynamic_f("gt%u", gt)
>   				test_thresholds(drm_fd, gt, TEST_PARK);
