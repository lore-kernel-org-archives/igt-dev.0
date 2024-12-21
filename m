Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6D4E77188
	for <igt-dev@archiver.kernel.org>; Sat, 21 Dec 2024 00:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BDD10E032;
	Sat, 21 Dec 2024 00:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlkUpc9f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417BD10E032
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Dec 2024 00:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734742578; x=1766278578;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Kt/QIBjuQSIOeLhahY/TqGzDLx9PI+tkW1zNdGqHk0M=;
 b=PlkUpc9fPacGPsjqR5ehfjOdC6wNj8As3E/3H7XjZWex5TEC2UpCX1xq
 SKPa1QwcIeZDnA5ShR6T4jGGrlJMjXqDkvMul+Xi6GYjD1hfuUcg0gNqa
 BHp4sq95heMF7v/EWjradoVTm1sSXmYrtSMNl5CGrJ98yqB8k/ftwQmkx
 DAKuRDuXkoUrcz31/nbmMsZLb0a4jQprQTIGe+DJdwjdBjNKzHMNYCBG8
 5Ijsm8sbk3M0hhFZEllfU8/gZy5wdf3+twPYu/1KUAF9HDIEAusIsEJcu
 rH/+nd2cdZaeGzMzVevcIt7zXz1HnF1qsCZVdqQY/yhY4FstNeEEX4eCv g==;
X-CSE-ConnectionGUID: 8XmrmjZST/+ze/HXQQcVpA==
X-CSE-MsgGUID: zSaVFBCZQVuc7v2C/MifFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35519488"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="35519488"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 16:56:17 -0800
X-CSE-ConnectionGUID: 66M1D45JRUG34I4hMvQCkA==
X-CSE-MsgGUID: 4L1oLaynTOWWDISE55VNWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129608646"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 16:56:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 16:56:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 16:56:13 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 16:56:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMClsF0mB2DBhj4ATZpyqFj4/FyrkRtdDoUS+6rHkfk4DlQj3Zp7pudMWXF5QujbnB00n3JQZz3f8qP0xhEbsov1hThFW1mYjJ8wpG0nr2DGN9o2tY/hpxkjXlFOuJlcx7ZDMphwOhlQ7tIn2ySC+aSJF0hPO7Mg9AU81jIq4489Su6IViPT6V4Rn2MvCYeIsPVB4luydBs4XNvkZ0shcDq2NeI58ANSiVokQW2osoIE5Dg53jWPLgzqlzB97QTQXWL/g4qOvgTh1x+QxS2jkNycycJDu3ErEnceD4/eiu4RMb6Lq41+L2CC1Yhjb382BfV76KezN35fDcsbX+BpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVdEGqPkmSoSKwa2tZc7va/GgAAW5JCy2mw7X1DEd5Q=;
 b=PVPAkUBrCfrN74GbVoTxYiku9dAtG/miYlK4eT/uanYAA68AuocmXQzmWHT3WKr2CpF2GeCRLb9fluoweiAkaYM8puhOZQrOWOUts/q35DqtrY6Lyj/pAky6U6UFIWZlONEN5r1YNFnSBvhFQnbOstcDRO3RhPa3+hRgKvOV6mCrUYAJxsduhLQZLjF/nED/hHyFBzzgR9RXEPm5/JN9ynoIeoehSdIGSUe5EP+3sJks3VaU/u4Yig00u6SHRq4vVN+NHMF4pA+cKVAWRwSzPdDZEJnVqW/uUUK55cyQ/JMh0Cu4PIMgAE15wUwZANBEnipUUw5uFMGiDczFUnyBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Sat, 21 Dec
 2024 00:56:06 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 00:56:06 +0000
Date: Fri, 20 Dec 2024 16:56:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] lib/core: Let ftrace know when the test started
Message-ID: <Z2YSJP82hWaTp2vS@orsosgc001>
References: <20241217183910.1855657-1-umesh.nerlige.ramappa@intel.com>
 <8534il3nj4.wl-ashutosh.dixit@intel.com>
 <20241218191340.b4h6fflpjyys67m7@kamilkon-desk.igk.intel.com>
 <85zfks23i1.wl-ashutosh.dixit@intel.com>
 <85y10c23gr.wl-ashutosh.dixit@intel.com>
 <20241220183117.kkka7sphjjfosv2v@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241220183117.kkka7sphjjfosv2v@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: MW4PR04CA0133.namprd04.prod.outlook.com
 (2603:10b6:303:84::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 33cf6729-c5bc-477c-e2db-08dd215a400a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVBZVThINlVqV2NRRGkwemozSytVNUlOb3NNOUZ5K2JQRm1ieHJlbENlbHdG?=
 =?utf-8?B?bm84OWxsUVdDS0xucm1jdHZHbUdkVElqT3dGV1BoZGg5K0hqOGZ6YUNINEdW?=
 =?utf-8?B?TFN0MjlRWTN3WEFxK0VIbmdhNVVLeXhkT29hV1NiWi8vNTNpMXM3YmRHNEts?=
 =?utf-8?B?VWplaU5TYVZwa2k5ci9tM1JCdTlISmxsdW04MjRoRmpiang4NVpRZ0JBU3Q4?=
 =?utf-8?B?ZHg3amJpay9IR0VZd3ZqOWREelNoZkFmcjJGUSswTU5HRldmWXVSRjEzL0VQ?=
 =?utf-8?B?Rk1CWUpabVJyemgyL09iRFc2eUtQRWVReEloT29YVmVjd0pveUh4b0pVc1V6?=
 =?utf-8?B?SUYxLzg2L08zVE81ME0zbGFUTDZtYVNOT2VKOWp0MlVxUDB4cHQ1NjRTR0RT?=
 =?utf-8?B?SjFWZ3B6d2duclpyRXhnSVNxR2piQWFoTmdIZWZ4V201UEF0QTdsdXdIR050?=
 =?utf-8?B?S2RrTzN2VnJXMFZVd0pmMzl0dU5UQkE1Z0Vlek03OWRMV2dSM3hoS0prZGVF?=
 =?utf-8?B?b2tvTS9mT3lpanM4TkQ4MEl5Zng2WUlnUzNuVFhaOTFlTXg3ZHNQUUQ0MlB2?=
 =?utf-8?B?Z1U1RElsV0hsKzlTRENaeXU5VGRwWGRTbHBqSkVnQmxTNER5QmhoKy9yVFZE?=
 =?utf-8?B?TS9iakR1Z0FNS0lyQTQxaTgrdVdXSVMxTXprek9ldk9relBWdnZOYW9LcG80?=
 =?utf-8?B?cndWakhvbWt0QmpLdjExa1ozZ2pkYkE0aEMxN1E5UCtFVmhQWGVXUHNNSHps?=
 =?utf-8?B?b2J1VmxsWHBVVFhEZ2J2bDZJL29YNkxDYnlQQXBOUzhtdWZ2d09CTVRGZjZx?=
 =?utf-8?B?TkY2bktsUUZBYm1XTGRrZ1drazRuU2UwZ25PTjFTaTJuT3NCRjlzVDZDUGRK?=
 =?utf-8?B?UWZsOC9aQVViSExEbkFURnRFM2hheUJtMHJJV3VlLzNYQVhzWmJJTTdxSld5?=
 =?utf-8?B?NWM1ZUVJa1o5V0cweWJwN3dDM1BRamM0ZG5zdFA3RldhMERuUUpKU2pCaTJt?=
 =?utf-8?B?dHR0MHozNVZLMm5sb3BTZEViL1grVjhtK1hoVGZkWlpXZVNwOWUyWjlQdk9J?=
 =?utf-8?B?anBVeHMwdXpJTzdGV2JXU1JYNnJ4citYR3J1enJvNFBsYmhLaW1CNWdrM1BV?=
 =?utf-8?B?YklJUFYzUThsb2prQ2xXaVdsQktjS2VTUXVhNUJxR2hDdnNaTVh0KzJFNFRo?=
 =?utf-8?B?OFlRdDZ6TDd4azJ6MHIxNUV5elVkSlV5ZVVoZ3R2WEE0MzVzZWIyaGQ4b2ox?=
 =?utf-8?B?S04yVG41Sy9ka1JsR01aL2M2NkhXckM4ejNqQTh5MzdISlZzeXY5UkZiWnRw?=
 =?utf-8?B?ODM3by9VV3Q4L0F0SkF1U0lhNWhtRG5YanZyQ011bWQrUmRWOWtaTFlINTQx?=
 =?utf-8?B?NEVnVkxweE0raVhDK0RyZ3oxN0ptQ1IwWU9Rc0E3czdXOTI2cDJFeE1lZ05Q?=
 =?utf-8?B?dk5OZ05EVjFHNC9OUm5VRE1NRU5ldkFmTEVDMUlZcmE5WENNQ0xwcjlZeXRv?=
 =?utf-8?B?b0RCMWtHR3VKTkk5bGZjandUZkovcm5qUXZ6WGEyYk00a2wzRVAwTWNIaUJi?=
 =?utf-8?B?a1UzLzkvV2FJa2Y0dGxyTFVKT254U09yaXduL1BEU1Q2VGd4QUNiVHlaQWhX?=
 =?utf-8?B?NThYNnR4QXl5MTBZUG5Bd3lrZWFMc1ZjM3JlRFBHR2xBdlVtOXhUbEI0MVBH?=
 =?utf-8?B?TmQxcWVseVpmSGNxejlRRHdzdFdJZWhYaFFiTHhYeXF3blhEb1Brb0h2WHJx?=
 =?utf-8?B?Z2FnWlZxQkt4QnZvQlJBUVhQV1NGS1JVSmZ2eGk3Y2JmTXVUY1pkWVdETmdJ?=
 =?utf-8?B?b1dneTJFVDVFbVFhVkwvdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RldjbjdxVGE0Q21jRHZoRSt5Y0F3LzRJbHQ4YjEzdS9zQWNiZ3BodTZJN094?=
 =?utf-8?B?T24vQjltWlRwRXpKY0pwYnNBaGZQeU5ZMk5QOGJZTHNpTUpsQTN5RGg1UDJ0?=
 =?utf-8?B?dzJPbExnOTJTeEdmWnZSaUFQYnNQTFpGbE8yUVQ2aFBLZk9sbk93WWhjMHpa?=
 =?utf-8?B?ek82QnlCdm40V0g2MHlkMlNWOFNSdTZtZkJIWHo2SFZ6QjRBZHdremFGUHVq?=
 =?utf-8?B?amFjSzRTcGdpQmN5L2hPTVd1Y2JLQmU3Qk5vdG0wencrODNZdXk1NzIrUEZ1?=
 =?utf-8?B?V3QyaEIxT2NwS2J5QzBmUjVWeTNlcFNrdHZSc25IVkRTc3UzS1pkTytSSXVU?=
 =?utf-8?B?b3ZUUitPQS9idk5abHNCVzhyaWNCaUt3UEhoYVRmUnplaVFqcXRvbTU3a0Rp?=
 =?utf-8?B?NVhlUkxnaWY4eU5IczE4bTFBMnFoVnFldnFNdUhpYW85dEpRNzJtQUVsZzVJ?=
 =?utf-8?B?cklkeldab3Fmcm5uUFUzQ2dlL0V2Ly8vcCszOG1lZ0tBd2V1OXE5bFhuSWZR?=
 =?utf-8?B?ejVVSHJZcmJWTzhRLzJqR2dyYklIUVNYb2JzSGpobzhVQ2FiRm92ZFJoTTgw?=
 =?utf-8?B?cXpNOGFQNDVnWlFRLzlQN3RCS2g1N2NNcjRqVHJSdEhBRVBVWTdIQXVOUk8v?=
 =?utf-8?B?d2Rha2RpMUdHOEswbGJLRzI4QlZqNXNkMXhWSm5ZblJIUDFxd3g2OTRsaHFI?=
 =?utf-8?B?ZVZYSDhydDkrc2EyVncvNlBMN29mU3J5VXYxSUVreXY5Mm10aUNBdnpwSzF3?=
 =?utf-8?B?K3d5bG8rS3pqNGpUS3A2SHdzNEdIRDRGWjhoa1pLcmkxbWthelc2eSt6UGJw?=
 =?utf-8?B?eUo3NTBYWEJaN2RmTjVUSVMrajRTa3EvVzV1eEtwV1ZQaU0yTUx6MHZXZkMv?=
 =?utf-8?B?OGQ3VmxEeWRlbVZHTXhoT2YyQ1JWWkRFVDNidWIxOVpOTDhlQmFuOUI4RzRu?=
 =?utf-8?B?bkdlWjhZR211b090TEdBOGxmMFdjaVpaSkRBWHJhWW1tNDFHRVpTN08rL0xi?=
 =?utf-8?B?QkV5YmpzaW1PNDMyOXdMeEt2aDRkL1RmUnM5QjJKR09UcFJuNWxQY01JY3VP?=
 =?utf-8?B?d3Z3aUJvMHc4T2pxdlkxbW5qbmsvQzJjOHY1Z0pRTlRmNU5tM1hYNTQ4dkpV?=
 =?utf-8?B?a0ovRHVNeVNOOS94QnQrOGM3dktMZlNOWmtRZE5HWUoxMDZNb3FwcCtoa0Zk?=
 =?utf-8?B?MGdIZVRFQVd4MVRvSStMaWxtMzZCa1JrWEdVb3dkb1VBUHZJai9GSUROMUtv?=
 =?utf-8?B?WXNWZlRKeEFyNXU1cHE1b0kxUlFtTlUzd3ZmQllKdUFlSElGV3lGTkVKRG5u?=
 =?utf-8?B?OXM1bHVtUHVsQWluSEY5MVdydWM2YWxYb1dEd3R1RUpYTitIWUk2WGdmd2R0?=
 =?utf-8?B?bEhVNkkvOWx2aFNiTGQ2eWROZW9oVmV2TzU4ZjcrNVF3WGNCQkR4ZkRvdks3?=
 =?utf-8?B?eDlzT0h0dlBVbzJ3WlNJN1F3Y1NKdVZpaUtFdk9BL1Y0NXdxenFuNThOZlZW?=
 =?utf-8?B?dEx4bFlwT1haZnVjT2Rlb0JNclo4MGlMOEp5NGhVdEt5dDZ6QzV0NUZRb1hz?=
 =?utf-8?B?OEd4TFhGZS9WTzBCY25vditVWHYva1Y4WUo0M0ROYTBmRjVmRXEwZElabzRI?=
 =?utf-8?B?dnUvdzJPaDlhWDM3Ykhkb1lrbDlKVWlMdENldHFna3BHY0FpY1RJbm9DNERs?=
 =?utf-8?B?MjRwMUdlRHlOUUVzeVdMMkNCTEpFMkVULzFpVTlqb1JQZkdSWmtvQjlSWmo1?=
 =?utf-8?B?WGUrRjZBSUsxRmhmUWRrWWcxSUU4MVJKR2RyRnZGWjAwSkg1b3RjcitXOFBP?=
 =?utf-8?B?NHIySWtNVzArd3hRMkVxWGkyT0RqUkN1am83Y0NLL3FRZVFkTktjZmRkaW44?=
 =?utf-8?B?UGI4aXhyaHZMbnA2YjFrcVdTZEh1VSsxWEpyaEE0cEZGVmp4U0RHWFRzTXBX?=
 =?utf-8?B?NjRaVEZiVUNOU2JSemE2bjBucXBvU2N1S3REcWdSeUVrUTNzVkludU5rYi9N?=
 =?utf-8?B?SWdnQlhaS3AvNWJ5V1FZbjFPcWx0UnRRUFBQbUlWN2psNzV4STFxSXRJQ2x6?=
 =?utf-8?B?c0V1cm1POC9KZHluYnkyb092emxxcXdmUWdsZlU4ZXg4cEU3bzNOSk56ekpE?=
 =?utf-8?B?Z0RWc2F3M3FkdFJGM2MwTjc3UDlzRXJsVUNrVWVMWU1WZ0t1cVAxdFQvNHNr?=
 =?utf-8?Q?wLwzsz36diHMSDQZJ7aCIYQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cf6729-c5bc-477c-e2db-08dd215a400a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 00:56:06.2763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8kB8i8+FdRU6jwnrr1YzQWjhw9G7GNL48XstQe5N/WMKOMgDCZJBEvF+aK4RPYvd+2MPyaa47kcwePEcqAnJEGBoL4vGkq5M+0I/DH9RYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6945
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

On Fri, Dec 20, 2024 at 07:31:17PM +0100, Kamil Konieczny wrote:
>Hi Dixit,,
>On 2024-12-18 at 11:31:00 -0800, Dixit, Ashutosh wrote:
>> On Wed, 18 Dec 2024 11:30:14 -0800, Dixit, Ashutosh wrote:
>> >
>> > On Wed, 18 Dec 2024 11:13:40 -0800, Kamil Konieczny wrote:
>> > >
>> > > Hi Dixit,,
>> > > On 2024-12-17 at 15:19:59 -0800, Dixit, Ashutosh wrote:
>> > > > On Tue, 17 Dec 2024 10:39:10 -0800, Umesh Nerlige Ramappa wrote:
>> > > > >
>> > > > > It's useful to know the start and end of the test in ftrace to be able
>> > > > > to debug some issues. Not sure where to add igt_trace for end, so
>> > > > > posting this patch to get some comments.
>> > > >
>> > > > Isn't it this (at least looking at dmesg):
>> > > >
>> > > > __noreturn static void exit_subtest(const char *result)
>> > > > {
>> > > >	...
>> > > >	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
>> > > >		 command_str, *subtest_name, result);
>> > >
>> > > I also think it is already printed in logs.
>> > > Umesh if you find out cases where it is not please drop a link
>> > > to CI log(s) to look into.
>> > >
>> > > Now that I look at it again the only diff is a place when it is
>> > > printed, this one is after (dynamic) subtest ends but I still
>> > > think it is also printed in dmesg before a dynamic subtest starts.
>> > >
>> > > For example look into this log:
>> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12333/shard-snb5/igt@kms_flip@flip-vs-fences@a-vga1.html
>> > >
>> > > there is:
>> > > <7> [377.462024] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:75:DP-1] disconnected
>> > > <6> [377.463784] [IGT] kms_flip: starting subtest flip-vs-fences
>> > > <6> [377.465812] [IGT] kms_flip: starting dynamic subtest A-VGA1
>> >
>> > Umesh wants to print in ftrace not dmesg.
>>
>> Sorry, better to say ftrace as well as dmesg.
>
>Ah, sorry, I misunderstood it, it is ok for me so
>
>Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>Btw one more question before merge, is it safe to call it
>even without actual trace enabled? Could it slow down testing?

generic ftrace is enabled by default in linux, but may not be turned on.  
If it is not turned on, then the log is just discarded, so it should not 
affect IGT.

Note that my intent is to have the user turn on ftrace when needed and 
not to turn it on in IGT library.

When the user does turn it on, we would also see the IGT start and end 
messages for a test in ftrace.

>
>Or maybe we should add an option to igt for it?
>
>+cc Petri and Lucas.
>
>Also please restart testing for it in our CI if you plan on
>merging this change.

I need to post another revision with the log added to the test end like 
Ashutosh is suggesting. I will try that out and repost.

Thanks,
Umesh
>
>Regards,
>Kamil
>
