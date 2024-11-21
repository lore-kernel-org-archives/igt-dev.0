Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152BBD7879B
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 17:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76AC10E9F4;
	Thu, 21 Nov 2024 17:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frPV9wRU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E580E10E9F4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 17:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732209716; x=1763745716;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bNXOOxiL+cF+n2n7IHcgqnCEQO5kLrXSYgFArQIlkZQ=;
 b=frPV9wRUmZ5/1kYSU2wT/2fMuXqnWXpUDx5eyvxOeEhZjpFQLDhfkgCv
 mmymAwg/iigrrdrnPtsF6rKfhZTsNA5xjTq9gAs8xYn+y7SQy7JUzbXCU
 qfuG7+rPlvW/lBQ/6V9v8CtvWkCVKiJV3KxUoA1+eHC1MdzHlU+seH+KW
 24XE5ePOEsPJWClAAEPtJLL1K+LzVNpRALCxAwF9x4x/CH++zK8vxOMDt
 P7q6Zgv2JFOLIWZndmrC0Q5nRlsfh+e1UGRH+oGOtDKgX1SvGAAZEMr9G
 BOvKmgsFxM0jYIe6R+6ll5GXNbhgUOhWNo2W5UU1REkBcOLW7ngwC9urY w==;
X-CSE-ConnectionGUID: 5viHO9iHTMKOSHwprxWQ1A==
X-CSE-MsgGUID: u63ZB1aNTXKHPfLoo389Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32484882"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32484882"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:21:55 -0800
X-CSE-ConnectionGUID: 7m4zkdzLRS+24eHX4AoVzA==
X-CSE-MsgGUID: aZ4xdL0rSrOIk0IqZh5NWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90738336"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 09:21:54 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 09:21:54 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 09:21:54 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 09:21:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKrVaiANcf/c8owL+GKMdUhbOxDReMbvK4zfvtH/NLrX95qI77QES/5twNz7/C10Ipz3GPJWXU3Rmt7RreYR9ZvRZ0+DZCQq8C8H6yCCLqWcEcmNG2rQYb+++kxeyX+XJaVc+hkWiDE9W6kQGHSzOlhSi0NKBtdIfe8aLBw3EnjOnx5Z21FGxAS8nCnJKpqxdTH299BkA6WZmLKnjUbxhZ4GgoNp3YTCtdAH0nAHo4JInqk34PUH7gA9+O4dlR6QGGkiT8pV716mfyoexfU2vNa3Z6027LiOV+MKg81a8MFs8QDa9fIYyBUXuEsEgKHCgHCsAlwiw7Pav5F8kmNuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkVLJp9DtB+6N30FC06cB3/V45z52IWHzhEuQxMT/uo=;
 b=Dace3xF0fQw6KlJwoHOvOvDp85ixAvZ3GWeaPWZiGgRDj2UNbAT0hISST59J3m+Jq+gLTbBbi1KsfSeGuLPpVM6EtMHtG88m9nqWEIUwaNDAp/s8uiq+qjPlfEpfPhmVRDnalsXnU+pFDwsNyVy7gxiW+LFFUz4EeXwZSdWoR7axU7Hqx96ikVXE0C/dka3uiq1tsSXKts2qRGDZC7UuZwhfvd494n8N7cV8OcHksNFsiHQ3QGusks/FWy0nfBfGEiHUTYMSx0yieTL7zeVesUvISm3Q+5pJwKeiLV6B5bTOI6hnJpJ7BitIZ+li60IEmZ57aOKKdRw+aQxKWsukOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 17:21:51 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 17:21:51 +0000
Message-ID: <d3c10dad-5460-48d2-a9a4-a9d1c78a244a@intel.com>
Date: Thu, 21 Nov 2024 22:51:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] Fix bigjoiner compatibility checks for
 connector modes
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241121104554.65366-1-jeevan.b@intel.com>
 <20241121104554.65366-3-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241121104554.65366-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA0PR11MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8175d1-1a8b-48a3-b241-08dd0a50fc8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmdRaEdnWUpSSEZKcWVsZi8wREZrUUQ0a01BcndGS0FUbEZXN1NRWmdhWVNP?=
 =?utf-8?B?aVc3dHgzK3RETGRPR05lU0xzcG1LdHpWU281akQ3VkZMTUhwSzZkMTdjbWc4?=
 =?utf-8?B?VUNjVERtbXk2WkxsWFZBWm1rR29FSW9PTFY5Z1B5TXZEWUY3WGZBWmx5bDhj?=
 =?utf-8?B?Tmh0YjljV1V3ckdybUk2TFBiNkNvRUN3cnpVd3N2WmFFS21uTE1KOEFzTlVU?=
 =?utf-8?B?Ujk2N1g2OFhHSXVRNWRvTDhRNGIvQ1pyMmRQcWpia0c5S2p6ZGczZkx1SStL?=
 =?utf-8?B?R0o2WlF2YXFiNEMzOUxuM0k3VmdVNmdWQWQ0UUtkYkgyVHVsVFE1UnZEQ3JM?=
 =?utf-8?B?ZkpNcXJBOENjSlVDTFVZSkd4cGdwbmp4SXJSNWVDMUlRTkhxVDFSRzhOb0Mw?=
 =?utf-8?B?YjFHUDNnVCtERmp2ckNqS3Z0Z094aWM2QWVrZmIzVHdMMWcyWndKZU1MTUFl?=
 =?utf-8?B?Q2Zodm5kVjJGalVkNmVDdnFxL1gveGZ0ZXl6TUJnYkdyNW0xUDhLc1d5ZnVY?=
 =?utf-8?B?N2F5cHJoMWw4dnJEQWM3OGRWTEtUSFVhODkvWkM2ZWE3R2JsMXM4UGFHeUhP?=
 =?utf-8?B?UmtvNWg2ckxtakJOeGpVQ2FWbjFHblNTL3c1T1Y5bEY4OHdyOUJPL3p2RE9U?=
 =?utf-8?B?THpWQ2NvaUFvMFFxWHgrYmxCcXc1eUt0cng3cHYyS245dHZLdytwSFAxSjE5?=
 =?utf-8?B?bkJwalFtMmh0SVlDWFRDcUZIRW40bVB3V29hMkhmQU1iMTkyZnI4dlQrOEdS?=
 =?utf-8?B?bnRuL0xvcWdtU1J6THZJa28vQytwK2E3eE1IQ0MyUHdZRTZ5RVZTaVJocWZ5?=
 =?utf-8?B?eE42MHhLc1IvcklxTTlBcWZKQTh5Zit5b29mTFRZRHhHTjJUT3ZHQ1Bwak1o?=
 =?utf-8?B?QU4xNlJ1Q1o3RWZLMWsyTmsvWm1UbkVzdDhoRUZGS090QVhVcTNwcERFRkNM?=
 =?utf-8?B?bmJWVkREQzZKRGlFZEEyMnkzNW1MSHc2aUhpYWU1aVJ3VlNiU3ExVEZiaHFI?=
 =?utf-8?B?UmpXdjEzdkFjTlNNQXFMMUVkSzJNV0NOOElJZDNqdjFiaE1haHBFMnBVYXp4?=
 =?utf-8?B?WjFvUnZ0SkhGN1dhU1EzWDhuRzRlczVORk1OdnZxYmx3SjVONDV6KzRKMXVT?=
 =?utf-8?B?UEwrSTB0MkNodlJyNWpqa0NRTDlrcVpUNVRnaTVEZGFTOXg1TlRZRXFLZ0VE?=
 =?utf-8?B?d2RFS2JoRnJsbFJOVkY1ek9zbG92RTFZWjhoMVZKWkM3QWtvblVpemZaeWhj?=
 =?utf-8?B?eEpyc1JpVkdRL21UT0FraVZ3NHNnRzF1Vng4SDNqQTBLSlJybTBqcytmcS93?=
 =?utf-8?B?LzdDVWVZQUViejA1bVdEcmFNSVpmNWNQZ3dHSVgzckFQU2c5MXk1TXd3UXdZ?=
 =?utf-8?B?djEwZFE1WHVoTW9HY04zOXBUQWFSVzNmTi9NVEhWZ1UvWHc3NzI5ZDJSQ3Z3?=
 =?utf-8?B?aXZrQW5xMXhyZUhHZi9jWjJjelM4dTZtQ3FzRW1jbklSZ3ZMUHJZa0huR1hY?=
 =?utf-8?B?ME9BUmxvN2xYeFp5VHFOYmd2V3E0NFdsSGhjSlBJaVVyQnNpUTRJWkhsdzZZ?=
 =?utf-8?B?a3lpTFRjejRVemxJUUVhY3BkUVJsbHg3ZXFTblRaQjlQMzY1VVhPMGhGRW1U?=
 =?utf-8?B?L0h2d29WV0lrM2dSckk0N1EyTkR1YkEybFkxa2wzL3NCSThSTVZFb2FRb1dF?=
 =?utf-8?B?RzRsR0JaeG5CdDE4WDltejhVaXVnOEZ3ZERIVWRzVytzRjFITmN0UEtZMmJi?=
 =?utf-8?Q?6IC8Glo6mzrTz1dKJoMwe6ZeM+gRTMh037NFXc1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnJIWnltQ1lVd3REanNrczJWOTROcFI2TXh3SFNtSHhuY2lkSy9Valh3QVc2?=
 =?utf-8?B?ZmJjNG12NklpazF4czRSbjJBbVVwbTFFSVpaSEhyUGZ5SFpnVlJEU1hTWnRS?=
 =?utf-8?B?czJIb0Mxb0l6VTVZbjlmUlllZ2NHaGtrc3ZLYXR6V3lTRExzSXBwMXdCVVg2?=
 =?utf-8?B?NW5lQ3h3a25ob0FwQ1RtcHF6cEZRd1QxWDZZRGpMeVlTOS9FRk16QzJuS3Y1?=
 =?utf-8?B?SFJJTUlNSDd1cVVwSEdDNjN2OWJTVHhRcDZWdklVMk4zOGovZ2M0c2JCNnBi?=
 =?utf-8?B?bTEwSXIvSkFBTlhBL041cmx6aFlJNDJIQURHMmtOQzdoSlk3TkgwdU9sMzdu?=
 =?utf-8?B?SWRzdWw2Z3J0ZjFNZUhkTXNtV1Vzc3RNRi9LcVN6bW9WTU12OGFLVzlGU3Ba?=
 =?utf-8?B?d1JFeElPUEZwSVpmMnF5Vkk1MzNqRHF5WURYREpYVzU3S1BQV0Q0ZFcwcm5v?=
 =?utf-8?B?ME5lcEFVZzRIOGgyb1k3bnR4UnRTcVJ5dGJ0QW1tNXpuSlhpUlVrek5qTzF5?=
 =?utf-8?B?TVYyUlJEYzYwcUtKRms2UXZjZXRxaFFicExTZUNtSzc2ZG81RmNndkpMc1JL?=
 =?utf-8?B?Q0dQRHdFUm1hN2RUdUR1VUpBZ0k0ZnN4dDRmb2ZyV2pMZWswd3JWTjlDSjNn?=
 =?utf-8?B?ZE1rZ2E0alBuck5yQmZuZzJ6VUVVQVRRVzBJMzJnNzVySW9EZU1OZzR3ZHV6?=
 =?utf-8?B?NzhBdmdxVW0xTFhMSk0xbEQ5MWVCOUFjaGdIVCtXckh1M1dzdk9STENIcHJK?=
 =?utf-8?B?RWY0Skc2WWZSUkQ0bUF4NXlzVnZIYmtvNElxTGVqZWkxNVVRa3A1YkpPaklL?=
 =?utf-8?B?NkVxWWJNOUhhcGlOSkdVL3pZMWdnYWRPTkMvRnVlYm8rbWNhbDRHTVk1bi82?=
 =?utf-8?B?ZXJlVC92SEZXdmNRL0FKN0E3M3JXRXhORDZrc2d2RFFlbnpRSGFhcFNhV21B?=
 =?utf-8?B?VkZNWllOOTZId3krY01YMWxNT2M5ZzRBYTVxTWNhUC9CdkdpeUs1MjZnbFdH?=
 =?utf-8?B?QVNvaWovYTVqT0NVa1JPSXdkdEd2OFAyaTZDdlY4bXo4WEdLL09Od2phMlFv?=
 =?utf-8?B?aHJINk9kRVk0b2kwN255YThNbmRGQk83eHo3ZjFqajdnNS9UbGhKRURvb2Z5?=
 =?utf-8?B?S2ZlOTNyR0MyNUw1U0d1RGxydnVMd3pGVHp4cE85RHg0NE96ZHRpbjErREdM?=
 =?utf-8?B?ZkdKODdUZE0yQ2pHK0hPNFVkV1UzOGowQ1NWSkVmdENOSGx6NTRubkVMa1k1?=
 =?utf-8?B?dkhoRkZwQ0tRb0xPcEdtMkpuUmlSVlV6ZEdOYmZWQWE3ekRKUFdLay9mMjFU?=
 =?utf-8?B?NkdmdlR6YjFpLzBya0NDQ3R1T1gxclFhYmlTV2w4bHpoODNJN3RRSzN2a3l0?=
 =?utf-8?B?c01rZUJMUmo3c1pBWFNIbzVEYUxUMDMwVUpxYnNFT1FPb2NKOGlTaFhLZUVU?=
 =?utf-8?B?V2N2anEvMHR6eG0vbjRtYkJDSkp2MHQ5K3RJMDdzL2w2Z1BaUlZNckpkWnM4?=
 =?utf-8?B?UWRUT1h4ZWdtS1ZuSW9MSGFZYXBXTTNmN1dnM3lhY0FObmZFYnZDTEtrWTZ2?=
 =?utf-8?B?cTBTWkNkZjZGQWFVQk91b3d4cGdIYzhGN1JBY0puR25raVlubS9oRDJicFd0?=
 =?utf-8?B?YncyWE5QbXFUQ0w4R29zTktsNVExRGZuaWxHazNxMDk1ajZjSWExY2FaUzFD?=
 =?utf-8?B?ZFNMREk5Mm1KbThHeUlMMFVrWFRsUjR0R2EveG5TM3lLUnVKZEordDNWOEEw?=
 =?utf-8?B?bWFNcThPcWxUc3RkOHY4ZldQZGF5ZVZ0elVIZ2EzeU5MMU5ieldnZWhxUHRp?=
 =?utf-8?B?dWg5d2QyR0kwNDdsMnpaczNTRUJiUCtTSVVCWFBHVVdLNGl1dGZ2NWJoMU81?=
 =?utf-8?B?THQ2QlROVVRIQytpbFB1MlgrWHM5NGJtK3JPcjkveGRYeC9ha21DY1NuekMw?=
 =?utf-8?B?aGwvL2R2a0I5bUo2dGgrNXlyVjVyd3RDayswTlBlVTZlc001bUNxdjdnWXBP?=
 =?utf-8?B?UHljeEVnNk8wQnJoN0RGSUd0d1M2QTFGTjQ4UzZidGRoS3E0dXB3aUdHdk5G?=
 =?utf-8?B?VmpiVTVvakJXREJ4bW52NXJxZ2tIOUxBUWpYMUJxTGU2dmFLQU1qRzlzVHJh?=
 =?utf-8?B?dEs5K1lsMFdseUpFV1B5UXo1Uy9Xck5ZdnJ4YURBanpIMEZPSWNIRVB0MHlX?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8175d1-1a8b-48a3-b241-08dd0a50fc8b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 17:21:51.0127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPel3E01YPzh3qkOidIgT4DwqQVhbSOUSR8KF0irYm1TY3toHuGQNgTTdwI5+Dxz/2EfSsN+Vr01aHAeWafU+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
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

Hi Jeevan,

Please fix the subject. Add tests/kms: in the beginning of subject.

With that fixed, patch LGTM.

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 21-11-2024 04:15 pm, Jeevan B wrote:
> fix bigjoiner compatibility checks by adding drm_fd argument.
> added unsupported config checks for bigjoiner modes in display tests.
>
> v2: remove unrelated change.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_lpsp.c | 4 ++--
>   tests/kms_flip.c          | 4 ++--
>   tests/kms_setmode.c       | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 889da42de..74e9d799a 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -166,11 +166,11 @@ static bool test_constraint(data_t *data)
>   	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
>   		return false;
>   
> -	if (igt_bigjoiner_possible(mode, max_dotclock)) {
> +	if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)) {
>   		for_each_connector_mode(data->output) {
>   			mode = &data->output->config.connector->modes[j__];
>   
> -			if (igt_bigjoiner_possible(mode, max_dotclock))
> +			if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock))
>   				continue;
>   
>   			igt_output_override_mode(data->output, mode);
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 88cd41083..3ad4d0afb 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1756,11 +1756,11 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>   				 o->kconnector[i - 1]->connector_type_id);
>   
>   		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
> +		      igt_bigjoiner_possible(drm_fd, &o->kmode[i], max_dotclock)) &&
>   		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
>   		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
>   		    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -				 igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock)) &&
> +				 igt_bigjoiner_possible(drm_fd, &o->kmode[i - 1], max_dotclock)) &&
>   		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
>   
>   			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index bc7b8fabb..d61cfeb9a 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -736,11 +736,11 @@ static void test_one_combination(const struct test_config *tconf,
>   			 *   - current & previous crtcs are consecutive
>   			 */
>   			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -			      igt_bigjoiner_possible(&crtc->mode, max_dotclock)) &&
> +			      igt_bigjoiner_possible(drm_fd, &crtc->mode, max_dotclock)) &&
>   			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
>   			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
>   			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -					 igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock)) &&
> +					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
>   			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
>   				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
>   				goto out;
