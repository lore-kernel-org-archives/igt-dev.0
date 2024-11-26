Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF42BD3B987
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 12:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7668010E1A3;
	Tue, 26 Nov 2024 12:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpYunL/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C036D10E1A3
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 12:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732622527; x=1764158527;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BElbTztRSv3EEn8m9qjjfsp0dsNVLGA4Tp2MS2P1Ddc=;
 b=hpYunL/Q/8itusuFnCmfwFtOlPa97QJznt+fiNUEX7F7ApyhROowuWTT
 Bp9HYSpuQBQBUBR8nIsmUwm/v/WSzQGDIuI465DiBpSjwNWIHWTgEfWyN
 JoA6mfXS0h6BOnnqVY/LfH198B4+g8W3kTeqK63NXtBru26JcwRJLGvp8
 8JTg5pXKTLPFzhdwQf3RjqhjYixCWQ+aiec2yTxhu6EBzkbPH0qexq2FW
 UW27PrpyKi8s2vjposR9K7Jygd9kW9D3Ok0ulUMIzsFvcDSALPDLH43JX
 9eHIvE2Qfp0H6/THtfURgwT/DySb0X2f3gdsKfb/7pKpeWikDLkQ4gQTu w==;
X-CSE-ConnectionGUID: lEtux4rWSeeNsxONPGiUTA==
X-CSE-MsgGUID: NtwLdVctQk+ucJAiX8PUWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32635375"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="32635375"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 04:02:07 -0800
X-CSE-ConnectionGUID: LzJpqwNERj+GI7Ovs/fKbQ==
X-CSE-MsgGUID: d9dql33ATuiszdwt5eROdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="96518918"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 04:02:07 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 04:02:06 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 04:02:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 04:02:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrQpFVZdea3A44AzD49fgBWpF9HUgUVnHMzr59FQ6jkfV1xU4e2wKoDS/0kakc7zu2F0IjIE50wV5lrBTk8REJ4HkLd4LyRcHBzpT7dfRolqmJYjjE7k/HotNUUM2k9xrIGeJwe4NGT3oB3IKKBjjBinZv1mcF4vTVtEiSNl7u5lg7LjVhu4i9I5jGFoCByMJiaXpqJh19dOr+ytu/OFrrR6hbh1amvKKnQnbRxK8fMNywxCwzZGtb/zcKzQvM7+I/0eOg0bqCQkmq9mwJ3tVFeBrU00EnDUoBjChlElmjlyxoc2UVmwwmhwfSkE62Yfemu68S3uVOBwAmlWRBclCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2UI9Hcch6gtmk/L3KUrAw+DEAHGzm7CIR8LyIDoOes=;
 b=rUJwmtP29owYUNu5etWBGPumFvqxtSOO+mFF3/tR9buCirTQE+7rrRT9cGEUBpokjlREfQkGu4tHlNEXZSw79etHzKEvLaz79TZkfWw21yHBoFtEpTDVNDXH42+sY4D7P+lgiRehOk9FUd9EAbsUX2MBOBLvYgWMhWoJgSvlGpAbbvrXhsS9zWKlK8sp1yL5uuo3HduNs4SqClpGDuNER/EDMiCzKobvHVZsAdlkwUrOvBOttcIGZNwvh4BO4JBfiHt94x9IxsS/SaTnRtDkGnrscUfbZ3du7xtl8GQh8lN/CVfUiHWqnU42zNoMjsWURRilt+GFy93fLL9AEDcy7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 12:01:57 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 12:01:57 +0000
Message-ID: <8af2561a-2b0d-4c69-8f01-3012e3db8ab8@intel.com>
Date: Tue, 26 Nov 2024 17:31:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/kms_pm_rpm: Update cursor_fb3 framebuffer
 creation format
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jeevan B <jeevan.b@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20241125171028.383914-1-jeevan.b@intel.com>
 <Z0TAXl62KunlTuxl@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <Z0TAXl62KunlTuxl@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::21) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA1PR11MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: e1fd5235-712e-4225-ac52-08dd0e122044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUlNTElDcS84aUN2UkhxMXRYK0ZoK2JiKzBhU2ZlQlpST0tFaFZ3V3RjMnZ1?=
 =?utf-8?B?ckE1QmNndUdpZjI4K1ptd0hQYjBUVzFtdkRXT2JEZ2szcm01VTJvUmJBeHhr?=
 =?utf-8?B?c05VNE1TRFdKMnp1UlBvYks2QjVNT0EydFJZdFdjQlQ1UTJsUi9vR3lBbFlS?=
 =?utf-8?B?Tk05NWdlS1lMeUt0TkVJcjk0S0xRK3JzNGFlYUhuRFZ4YjVzMVVURStETDB4?=
 =?utf-8?B?K1dVNUcvUTI1b3NHQlFwclJQQzEvelpmSkMvUlBOTGg5dHRZTUN2MExHVFNL?=
 =?utf-8?B?RFN5bWc4amFvcVcxMVhJNWtXRElQUU1wVEFrUjRLNEJHdHhGV2s0ZmN1SnJj?=
 =?utf-8?B?L0VLYkNuK3hoWGsvTkcrby9wLzlJNHBNT0VZZEZZZDVLYW1IZnNMcnBVTkg1?=
 =?utf-8?B?YUoxby9jRHVpcGlTY0t4WUxVTkFvK21vTDVWb2R4VG5FR1UzMFE5S1lXRTJ0?=
 =?utf-8?B?d1dtZXFobi9tT0hLSzJsS243bEpPUS85dzNuMXdYRkZ6Y0VzTjRLQy90ZUo1?=
 =?utf-8?B?TnozRktQZVRQWTRGWHRCQVRrMnlZb2dSR3NCdGxlbkFaUVJUUnpFV0pMeWJy?=
 =?utf-8?B?VnpLck5HNSs2R0xTMVdzWnpVQXdjaXA1WlZMMlM2ZC94NEMwT08rUENLc2xQ?=
 =?utf-8?B?YlVmQThISXZHY2lBVEZ6bEZZUmw0c3pRK2tFanN2TzAwZG9WZ3JZKzRZelRT?=
 =?utf-8?B?cUV1eFdJWEk1SkpSamVCWEZRdElucDFOSm9Dc2pJVGFpcFRqQTdvYXRLZmRV?=
 =?utf-8?B?VEZUL01FOGEzOSs1U0ZYWkQvZ2drQ0x2c2hPZU5renVWVzNEcVJkemJuL2sv?=
 =?utf-8?B?c0lGZVluMll2TVV2SlcvR0Y0OFRaS2VVakxIZzg2OU82c3FQYm1vOXRFMGxj?=
 =?utf-8?B?NEN0SFZIanlJNTVDWTRKWEh5UXZ4ajJzeTZFSjhlTVJUZkJCZUNyRVNBQUtC?=
 =?utf-8?B?aGZUd0FXTmJpNHIrcW1hVytMK01BNS9jM1RSSkV0a2gzWFNWc3JZS3pHRW5y?=
 =?utf-8?B?ZzhiNDU1Z2NsR0k1OUdXeWV5SmVxOVlFUnhsSjc3dlZJSmV3R0FUVHZVUTZt?=
 =?utf-8?B?YVdkTHJNc1BvalpRK0ZGSXZvckdIUXNmU2gycU4zTXJnM0tOKzJDWnkvL2c2?=
 =?utf-8?B?TjBidysyWmZLbkFTY2hOcXpqcndadW5BKzhZM2Fhelp3SWVZL1hJdEdnSCt0?=
 =?utf-8?B?L3dScmlKT3R1MFE4V2N0WnlkOWN2NVNtNGhId1FsRnRDa3dzeGxKejJnbFpr?=
 =?utf-8?B?TlVQbklCMFNQOFArWVA0YWVSWFE0RUY0ZXFPUDk4d09HNlk2cS9zbXNrNDVO?=
 =?utf-8?B?U2JQOWJxcXBIWkEwcXI1M2JZM0daUDZCR3ljTjIrN3JhN2ZUTWVCMk9YYk1t?=
 =?utf-8?B?Wnd5a1F0NTNFZUdyb2tHMFJySS9TTE80S1hjM0w3WFdPS2hJVlRSbFlibUkw?=
 =?utf-8?B?TjEwR3pXcnFEVDJwNHR0dU12cDcxcXBoR2tsNnZRMzJzMy9Sa3ZQaWxOdWxZ?=
 =?utf-8?B?TDl5Z25oM2Yra3BSN1NsbWFFK0I0dEt5L3FzTXlieFltSEEvTEdCaTRXakpu?=
 =?utf-8?B?cGNhUjJIVzlONEFBbUxmSlRxQ2RpMVdVUlhNUDdXSXFvZXU5U2IrOGFvU3Ni?=
 =?utf-8?B?dUJkNmIvSTlsZTArZjMxUXZ5TjhiNHloWHo5WGZ0ejdMT3BXNVcwRWtFMTJ6?=
 =?utf-8?B?SlJDRjNZTDBFblJKV2FOaFFicU5iVVB1SzBnTlNhNUZLait5SzY5RWFEMG5v?=
 =?utf-8?B?V05Ya1JLNDVEaW5yTS8xcm9YTWVGSjgrNFY5ODUvQUFUUklaQmF0enNEcWVR?=
 =?utf-8?B?MWdvWit5cCt0cGFSLzQzZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1FqN2NMUUdPaEdQNzJ2RXdVdHBlWjBsVGE5d2lsRWtpT1RDcTF6VXhlTWts?=
 =?utf-8?B?VU5IdzRkcEFNRWtzTzYzSFdmUmwvS1Nyb202TGFwOFAxYzBkWlExTkR3cHl5?=
 =?utf-8?B?OU1jbEJoazZNR3l5cnlMd21FTFNiSE9UaFJ0UllPbEFNbnZIamlIcFgrQm55?=
 =?utf-8?B?Vys5TUo5cDBOMm9KRWJHVDZnSFVrKzduYUczNzZXRnBJZFBOS1hZMk5lZEcz?=
 =?utf-8?B?WWFDbFpwNU1VVWIraldOcWZPekdJbkpIc0RoenNFektHTWFPMVNPLzFmdGlZ?=
 =?utf-8?B?OFRvU3FIUFUxcTJCYStMTUduSmlxQjM3TGlMSEZGNnhnRnlQS1dlMm1zWDd1?=
 =?utf-8?B?RTZVaTZiVjJJSnBLRzgzem8vZVF0QUF0TGEyN2lweHBBT1lpdldHQWtlbFpN?=
 =?utf-8?B?Z2hKQ09laTl6cXgzQlVhWEU2N0ZtR092NmFZaGJsTnAvMkZKb3QyRnJiWHA5?=
 =?utf-8?B?STdWRkExcDBsWFhiVVEvUndkMkVhMmZ2ZzR2MWt2Q3dzM24xbzJBbWZmNDRk?=
 =?utf-8?B?RXYzRU5SSEh0aE1mUFAyNTJyTzZuS3JHZnRDSU1Pc0MyTTBoS2hXVy9WUEZW?=
 =?utf-8?B?UWxDL2N0MytmTzd3b3dOS09tMnlZKzl2dWlueGJYVlhqNWhrclptU3JWdWJR?=
 =?utf-8?B?N3gyUDV0dGdmaC9Sa3dmUEpYNDhvaXVtSlVpYXFvOHRRUEpwUmdIYzZPSUNR?=
 =?utf-8?B?RjlZY1FuTTdRMFl1a2RvdGhyQ0ZMVmtIZWVLNjZ6RWc4ZkNDaE5sVitlZTh0?=
 =?utf-8?B?OEZyOHRwbEliSVVvM2wyOHRuMGxleWI1cGFRbUtzS2FkQ2ZGQmVDNGZGelFo?=
 =?utf-8?B?a3gya3BueGVPQ1QxRjIrT3UzOTVJejZVOUlYdEkxSWRhOVVxZmR3NXFKbjYz?=
 =?utf-8?B?Q25Nalp2NDBYQW05U2g1eGd0R3orTkFiZzBaMDB2WFI2dm5PaEc3VG04ZFEv?=
 =?utf-8?B?dEpzWXRpNWVKQTZkQWlKQVZwcWMwaWsyRHp2eWFUTjQ3RGFTNjFuYllqMWF0?=
 =?utf-8?B?SldYVG9DSTMwbVRVOWxrM2ZhNEhQWVFyWGZXY2taK2VkU2NZdjZWZzl5WTJW?=
 =?utf-8?B?WGZNSVJWcWtjMGdrNjg1Rm51RjNBcm1mWWc3QVVmMjl5Q3Q5RkVVaVNoWndl?=
 =?utf-8?B?akY1WFdnQmh4MjczamJJcWlnQVJWeFdzRDhTdmw2TmI3c2xXWTBkUW1NcGJu?=
 =?utf-8?B?WkNIWDlnUkRNZFR3OW1CeGJKWVNPTm45UkFPeno1MXQ0Wk0zdysranBNOVVB?=
 =?utf-8?B?Z0FHaWFZZkFHOExtdjJVem1PQU1Cd1FmeHhzcEpsRTlUTUFBZndhbjVCYkNa?=
 =?utf-8?B?YlNmeDVtQmhVREt3SmZqdHlyZjBrWHpOSWhLRTMzOWxkY0lMRTJBYWpWU2Nh?=
 =?utf-8?B?Z1BUVGxsSkN6S0JYQWIxc3hKMjRMSm9VVkpwTlhLYnZ5WGg2OGlaTFpFaVov?=
 =?utf-8?B?elJJRkVudXo4a1FVYUwyeUdvMDd6UWM2a3hCcERnWU5uVVArSERnUklYWis2?=
 =?utf-8?B?YW52a2xrUnNFcGpxTXVvTUN6b2pXS0Q1Y3FZUTNGTjJRNXNpTHBndm40SUFR?=
 =?utf-8?B?SDBHZGRkR2xIVGNscnpEcmhlWXdFVXlJelN0VXRFOTc0emEyZ2JXYnRCSm50?=
 =?utf-8?B?clZsQ2M2VzZvazBBa0Ztd0hzVXFBeDQ4QXhjL29ZZGNKS3YvL2VLajRlUW1H?=
 =?utf-8?B?Njd1U0dSTlhUSGwzMjVkWEFsMkxIUUloSldaS1ZIZGdydmZhRXFiZ2VJS25t?=
 =?utf-8?B?cGdNS1dCTk52ay9ORmlSaVZNR0NVclJvR1ZoT3JUZW0zSGg2TjhMQTZjNmcz?=
 =?utf-8?B?bzZGWjV6VGYzTzNndElWMlB3bzRORFVBczA0NDFVNjh4M245VHVqVDl3MVNM?=
 =?utf-8?B?TzhCeUhaTkdXWDF1V1ZKTnZiK0lyT20xU1Rta3hYdEx0Yy9JRjd2M2kzQlV3?=
 =?utf-8?B?eXE5ZTRCU1h6Ti9IOGFhM2JSeTROcmlnd2ltVTZxNlJZeVVkQ25Hd2Exb0ZX?=
 =?utf-8?B?MURIeVhUY0tPeVdOeWtjWTcwb3hnbUN0eUZ6SzdEZU4reXZEQW5saVlpZTdB?=
 =?utf-8?B?TElYUGY2cDF6emlHaVJmNm8xT3dRUEoyWDA3bkF4Z1VDSk9UMjY5UG5FeVlX?=
 =?utf-8?B?ZGZNS2c0WFFVN0JKcXdTbERnTnNwZElDUy9wWkQ4STgrdFVmS3BmY2hBeUQ0?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fd5235-712e-4225-ac52-08dd0e122044
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 12:01:57.3211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4N2N0VmNAUJWXhG9icbqU3oGFAI8x21TmaA9jwvgi1bNIOyELBusYu6/oIfwJdQU4LIOEOj1zD4bK9QwxMFwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
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

Hi Rodrigo,

On 25-11-2024 11:52 pm, Rodrigo Vivi wrote:
> On Mon, Nov 25, 2024 at 10:40:28PM +0530, Jeevan B wrote:
>> Updated cursor_fb3 framebuffer creation in the cursor subtest function
>> to use linear tiling instead of x-tile. As x-tile is no longer supported
>> on latest platforms.
> Shouldn't we then add a new format without removing the old ones?
> Otherwise it looks like you are removing coverage on old platforms.
Is there any specific reason why x tiling was used initially? Any idea?
Isn't linear tiling common across all platforms?
>> Signed-off-by: Jeevan B <jeevan.b@intel.com>
>> ---
>>   tests/intel/kms_pm_rpm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
>> index 990c50915..aeeaf69f7 100644
>> --- a/tests/intel/kms_pm_rpm.c
>> +++ b/tests/intel/kms_pm_rpm.c
>> @@ -1199,7 +1199,7 @@ static void cursor_subtest(bool dpms)
>>   	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
>>   		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
>>   	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
>> -		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
>> +		      DRM_FORMAT_MOD_LINEAR, &cursor_fb3);
>>   
>>   	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
>>   	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
>> -- 
>> 2.25.1
>>
