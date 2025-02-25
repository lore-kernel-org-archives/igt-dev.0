Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425B7C021A4
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 00:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF05A10E503;
	Tue, 25 Feb 2025 00:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djXACbft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4AF10E503
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 00:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740441751; x=1771977751;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=P2f5fvVHR7FuZ10PDRMyVcyApAivmwJ2JZEvRKh5Dbs=;
 b=djXACbftBEIBANabF2hKe5a0h5hqZaD6eeeFC3ut4SsjiIQqMmt5yBCZ
 cD9WyEmzIQKiSEVb8QAnr+YwDyrE5pW6kZgxhgPLLyWiNOmLXiNWP+uwH
 OHOkJugIstUTdLMGo+STJUeqj3arxO1nqJlgCwrq0Y9z6EErzwS0Hdd37
 mzqnVqVL3azBlbrfnk3hvgMm0zN4aNQXMwTXW3wehwBcqLUV2+I5bh6HS
 NnrEkWuS4LlG6SV3lAgPekkIwhIlc6y11GeT95n2ElU6bcNZclbIKUhDb
 uhyqIJsS+XjpOSyzcku7ertpko7/Zu0gbpDM2NK5TgCWe9vVmgEqLlgXc g==;
X-CSE-ConnectionGUID: deANbsdEQ2qFHfHr+dFqBQ==
X-CSE-MsgGUID: Cug3uz+VT/m5fQKK2EEJdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58641207"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58641207"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 16:02:31 -0800
X-CSE-ConnectionGUID: 8RO+RUz4TliSn4lBdC6R9Q==
X-CSE-MsgGUID: +M86Dq92SyywCAHdlsR3dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="116414613"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 16:02:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 16:02:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 16:02:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 16:02:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqFJfXuo1HfkJ10EzylmEgEzTO4B9EAQoKmFkV9rBSrto373EdgSkttTG2YSV61y6xLhSloPloWDMYflYYWTVy4yjBbYXWyOrC7P3yOTHKC0sKoxmbF5Y5twNHa20AkvsZbBWyEuF1/yFWfKOn9ixoIEZo6t471XK7MuxgiCsB9v/bi0bJfUaAEs4KtSFrz4/8fHdPQBjE1IQrc5VX+aiP+QNr8VcBCDQWMFeHC9olM0OqrOQ4m10KcjUMHxgmv1HqSCHDDGBu63Cqp7eVTGWgfNpDDo0TEa0pIRJv6tt3mG98QvMghFbIgl1Qcizr/5IZPoet3t/zwcZntlF84ksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXloPFS+AkHl7vxAxWnh06iWZyxK1yasK/F12yKgM1Y=;
 b=DOvDzBS9sSn1oswK4g4fl5zFpsDMPeCAr0b51n2KikatCrMXN5KW0jGvMTVdI1r9OcfxXkRrRqws7MPXxBudPzgomt9NAJsrt11/5mPEdxSP0X3qHdnsnUmmVoMG6HWRrkvTdBjW+kE277ViXz8wUt4dXxp94TQ4sa/tWihJquHZmcvSY2HakxqO5WzodxbK5jyfi9vU+7hN71FPQQDPnRknHSsD/MGETjLWhqUBgIv3gOWNCZgOdrds79568/OMBSOOGnrHXLta/Py1Qtlb+bUXgTo4DkmMmPiEtVimKnV1V6yMdL1a/yI5l1OtohEAYUYjTryx/gXO+aMqOtC6LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 00:02:08 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 00:02:08 +0000
Date: Mon, 24 Feb 2025 16:02:05 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t CI run 06/14] tests/intel/xe_oa: Rewrite the
 polling small buf test
Message-ID: <Z70IfY6tpJkNJiuf@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z7z5BV5HbeWP9+CV@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 19dfb267-6e24-4133-3884-08dd552fa4f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlA5L2pvYkhoTlh3Zm9rbm5HaFZwbkRUNldOYjZNb3Fia05oZHhJZ3RVQVpi?=
 =?utf-8?B?SElYa2Q2ZmVHaXpleXBQa2xrbS9acUlGZTZ6NXlUSUcxVkMwWmZKelhkY2Jj?=
 =?utf-8?B?aFdGNE8wc3ZIL1JEZ0VkZFM4V3JwN3VpSm1GN1h4ZWFuN0dTamtuSE9hRHdx?=
 =?utf-8?B?WmY2OVFwRi92Rjg0clFsRjVrT3ArcmphYzUyQzVXR2JxblBJdDI1T3N5amcv?=
 =?utf-8?B?akJrUDN2RU1wS1IxOTdDdTUvWGprMktYRnJ1N0FWSDF3WFIzVU84cjFFSTJP?=
 =?utf-8?B?MDlKa2VqdGl6K1ZOMm11VEhQaTByb0x6TkgvVlZONXV2bHFxWDYwMkNSaTYr?=
 =?utf-8?B?dnFFMThkQ1V3Ky84aXc4RHdseUI2Zzh3eVpOZ1hzYlJIYUc1RHBEbzk1WjFi?=
 =?utf-8?B?Sk1LVlJFWlJCUUJpTm5OdmQyamlWYmZ0cnFkaUpDZExEMXBpRkJPYm0vQWpZ?=
 =?utf-8?B?Y3htMGJwQXQrK0dPYitOekJYREtxcHV4Ny9TK0VPL3lxWk1PeldvMDM3eDA5?=
 =?utf-8?B?Q0VDRWJGSk1HU0dzZVlzOTVmSWVYR3lHc2gzUkRvV0N6ZUI3QnpvQitzMnVV?=
 =?utf-8?B?OHZFOVZSbTV5QjVMQlJIWXUxRU5icWRHdGtlZXgvYk5tY3NwRWh4eGlTb2lV?=
 =?utf-8?B?MFhwcW1aNU9YbnhrblBmYnA3RU5YNkdidTd3UUduUmFDUFlodHo2OG9aRm5y?=
 =?utf-8?B?WFlRNis1ejlsVlZ3czdxbVZRMVFjNm5Td0VWamJNMU91V2o4TU9qUWxlb0R1?=
 =?utf-8?B?UGVUNkpCb3VZUXJqYTJGOGZNOTBXYmNPU2RFTDRTNWhZbk03T2VzRVJrS2dU?=
 =?utf-8?B?K3Z3NlZWaEhkMHhBK1RNajBVZnhKRlE2ZEJmcCtFdWpEbE4zYWtWOEhjVGts?=
 =?utf-8?B?WnpUNEdiNExsZXVmOTN2d0c2M0FLdmJpTmwzc1RLek9zOXZGelE1b2J5c2g0?=
 =?utf-8?B?a29JNnJxc2NsZ1ROVldhczRUREg5SFA4dWM5cDdVaGpPMm01Q2tiSkI2K05w?=
 =?utf-8?B?WkhZcWJxK0R2bmlNSVh4MWZqL3ZIeTAvcnBSV0x2UmkvU0RockVRSjVnQUJB?=
 =?utf-8?B?MDFUU0JlalJYQTQyR0RSWUxJTmVsS2dJcDlUeEZRUHpiWjJ5cTFScDBUZXND?=
 =?utf-8?B?Y1dWZXhteVhtejdwbTdQMUd5blBKY3dHNW5OSHVxVnpqTTlNQXY1d1RoREto?=
 =?utf-8?B?cjRlc3BHYVF6eWpZdVZQYlVqQ2llWmNObWVadUE0T0V5U3Joc1lYTWpMd3hi?=
 =?utf-8?B?WFpNK01RK3NFeFR1VHB2RkVIVHlKdVk2Vkh4U2xtekJUM0lXWU1CdUh5T1hy?=
 =?utf-8?B?MUVFVWJSbU9jZDBaSUxWUndCaU1EOHp4R3ZxN2NEdmtXZFFQVkZsamlNZm1v?=
 =?utf-8?B?c0l4S1MrNHJXZHhaQnJmeWU4ZGFsb0NFK1FQT1laamJZVk1OOFNseHlJTzN5?=
 =?utf-8?B?aEJsdG9qMllVN0pCMTVhcWtNS0ZyRGNta2JhZDM3TmtQQWZJRWNZVEF1K2I5?=
 =?utf-8?B?cWhaTmRmdzNra2lWZUowTEhPZ1BRTDc1RmVHSFZmNHZyUnZkbWZpTDlrRGNk?=
 =?utf-8?B?bmZWeEMrNS9BNkRzOHl4QmtlRVAyU0VjK2R4cDdYTmRRS2lseS9LOHZ3VnlO?=
 =?utf-8?B?SzdRR3lRYnBnczFybGpZcVRNU05SVWdtQTFiNzN0ZWtoZnY4VEw5YkdONXYx?=
 =?utf-8?B?a2lNRElJVnJINDhaOE4zTWtQQjNySzNkRjlNczZoTExnSTZPMnplKzB6YW9R?=
 =?utf-8?B?eEE1M0JrYUJjRlo0S2QzbnpQc2p3b1M2V0ZjWDVuaVF2cjBibFRUdVJOaUNP?=
 =?utf-8?B?UE1KRjJ2TFdVRk82Mm5zRTByYS9CUW10RklVdi9sS1dzWmkwcTc0cSsvSU1v?=
 =?utf-8?Q?AicT+VXZe8mLW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2FFMXhUR2ZJRzJzTjhJTlBURURxS21oMTNyZ2Y0dFRrYThlMWxLRlVVMVBn?=
 =?utf-8?B?RzArRzZyb1BIc0lJNHkxWXBvcWhmdmxWZ0dnQUhBaERKK25Ra2tONTgxZDUr?=
 =?utf-8?B?NE5RZWUvYUpPZEhmUGpUYmFobjJ4Mld0QXdRakpRYWJOWUo0Tm9yM0xCa0Ft?=
 =?utf-8?B?N3J0N3AzUW16eXMwQWE0UFppdkFEVWlJTVVIVXJPeXR5Z1B6UElFSmRUd2lY?=
 =?utf-8?B?MzlGSEpLa0c0cUFxOUxSeTlLbmhja3VjUWs2ajZZVk1wT1c4eUx4Wnc2cmRB?=
 =?utf-8?B?L2paYUdYVHc3Sm1BYWRDMVVRSEQvWDVMQVJuVmtNQVYxcGtQQ3dSZlRUVnY0?=
 =?utf-8?B?YUVSK2ZJS05DV2M0OHFaOGNvL2E0d1ZXUXFuZ3dacWZzMHFLL0x0QUhlV0Q5?=
 =?utf-8?B?UzBmM0EySHl0WDA4c3g4d21WVjlxVkNhLzMrMW1hWldZdG1GdW1tcHN1N21M?=
 =?utf-8?B?VzQwbGJWTHM3Q3h5ano2ckRpYnBmcmhEZktST1RDNlNGNit6RWZ1dCtlaVli?=
 =?utf-8?B?aEhEelJYQzN0NHhTVFBORFdPaVdDTlBZYkVqYUlzRXJpQ1VjS2RnOWJUVHd4?=
 =?utf-8?B?RmdWRU5SVi9QN01YMEl4LzVFV0NOOHd3bFQ5NWFwSWdCTk5jY2tjeVZxdmZP?=
 =?utf-8?B?TTQrMVZqNFhHZnB5ZjllODhtUXNlK3pFeTEwcDllYmtqQy8vK2ZXMHdsOEl5?=
 =?utf-8?B?V1F1ZVFFcVo4VHI3a3JHVi96VFZRV1I2aUlJYUJWVkRQOGtFK3pQSHBKR21a?=
 =?utf-8?B?dllrSWU1SUt4SllaVThTQWZtRWVwb01VQ01SZHhiMTBGMGdlRnE0ekJQVFdR?=
 =?utf-8?B?MkRhRTM2akFnU1RRaUJ1UGxTQUd5NEtLeCsyVWIrOVo3eGQrRGRRbUlvWmpV?=
 =?utf-8?B?NFk1cnB0MGpzMGRkczFEQzBmYmlybENJTVU2NExUY3MvUlpDcFRVWEQ3Z0VZ?=
 =?utf-8?B?aUdHMjJiYmtnSWt0bEswdmRzczdxbVlLWXhIU2lreGR3K0VCT0p1MFlIMXZi?=
 =?utf-8?B?MHozU1k5RGluT1hmK2wwcFVXMSsyRGk3TFl6MHVSWEY0U0hDWFJlWVQ2SGRp?=
 =?utf-8?B?OUx2S2NIdzdKRWsrUVRwS2RxNFBoZStiaTNyOEZHajR4OEJWaytRaUVWZ25i?=
 =?utf-8?B?cVBNTEVYTWVBTGVwWGkvamMrWSt1VzlUQzRIelBJQ2t1cWt6dFhVNkJzMSsx?=
 =?utf-8?B?RlE5NlZIWHh3Um9WVCt0dDErSDFoZlErSkRGdzU0cjk2VFFlZ3BuaS9xMEtj?=
 =?utf-8?B?d09IcWlKc3ZWN3k5L3lkeFRteXJQME54NDZUa2l1bVFFVnlobndEYld3NUZR?=
 =?utf-8?B?QTBzL2ZoK2FQaE56bmtZUGNkMlFhaUJmZlNHaGlOSVZkZmxmeWdtOFdnQkdV?=
 =?utf-8?B?RWhJYW9JODJ4aUQvY3JqZ294Ri9ZaTVQWFlENVNpa1MrcllLUjJuc3V3RlR0?=
 =?utf-8?B?bHJSTEp6TllaVjBQNGJNRXptQ1VpZ3kva0tOVTNxQlFiOGllZm04d2ZBR2ZM?=
 =?utf-8?B?M1hCUlZHb2lOZWRIUFRhaWZKRThjUEVUOU5BakdsTUR4VUR4YXZhdUo3NzVa?=
 =?utf-8?B?dlVHelVObWJmSS9URkV1eGNsLzVKaEgzSjhBZTNmZTRZWklxZGJaSThmUThj?=
 =?utf-8?B?UWszcHZFNjNqWUNVaW5ud1h5bEdDQVVOWFg4OU1RejJ2Q3FzQnc1bDBHcXVJ?=
 =?utf-8?B?dTFsSktvL1c4SC9mMW5jS21RSndVeTIwNVZBbGdMWUlmSW8yU1hoVi9uT28w?=
 =?utf-8?B?Z012aE5SdGRuaVBDNHpnZmtqV291eThrZ0VJSWE1c2Y2OG9CclhhcnFIYy83?=
 =?utf-8?B?N3hvT1BkNDNjSU1pRWF3OFNDdDAvVng4aUtrNS84em5YSE1ML3V5UVB2NDZp?=
 =?utf-8?B?eTFoR3Azam01NXZaWm9mY0RGVnBXV1JVcWxFK3F4OVlvZUJ4RFIyMVcxclRN?=
 =?utf-8?B?ZVI2QVFRZHQ3RVRwUUczeGJWR0pxL2M4Q3o0Y3ZjakdZNUdMQmxGbXhoZjdE?=
 =?utf-8?B?YVVSelRxaktGN2FVK3ZSQVUzZWhWZGF5blhjVTFpZklzdXFQMVBQMTB3L1FY?=
 =?utf-8?B?dElPakVsT3FLODA4U29QdTJjOFlsaVhqRnpkT2loeER6dVVESm5XeUN6T3Qv?=
 =?utf-8?B?T0FyM2hjSHVSVU1aVUJrVmpOS0pVVElZNlRtbkU2VUpsb1hUZDRnRVJEeXd6?=
 =?utf-8?Q?SPfO/jxDVsQr1Qow6ybKpU8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19dfb267-6e24-4133-3884-08dd552fa4f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 00:02:07.8312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZC2jJ8XI1IeBCnnsQda68etyBzRwmrm0zYTszO7+kjervfcAZhEe4wk7qSHMtuZwnedACNG+LPbdi5itgjSIzY0kkBfjFvTUQFyZp2Pq/TE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
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

On Mon, Feb 24, 2025 at 02:56:05PM -0800, Umesh Nerlige Ramappa wrote:
>On Mon, Feb 24, 2025 at 12:11:37PM -0800, Dixit, Ashutosh wrote:
>>On Tue, 18 Feb 2025 12:28:04 -0800, Umesh Nerlige Ramappa wrote:
>>>
>>
>>Hi Umesh,
>>
>>>Use mmio reads as a side-channel to determine if reports are available
>>>and ensure that poll will return with POLLIN set. Then provide a small
>>>buffer to force ENOSPC error. Then poll with a timeout of 0 to check if
>>>POLLIN is still set.
>>
>>Will need a reason for doing this here. But see below.
>>
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>> tests/intel/xe_oa.c | 64 +++++++++++++++++++++++++--------------------
>>> 1 file changed, 35 insertions(+), 29 deletions(-)
>>>
>>>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>>>index aaf92308a..5792ffec2 100644
>>>--- a/tests/intel/xe_oa.c
>>>+++ b/tests/intel/xe_oa.c
>>>@@ -2216,7 +2216,6 @@ static void test_polling(uint64_t requested_oa_period,
>>>  */
>>> static void test_polling_small_buf(void)
>>> {
>>>-	int oa_exponent = max_oa_exponent_for_period_lte(40 * 1000); /* 40us */
>>>	uint64_t properties[] = {
>>>		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>>>
>>>@@ -2226,50 +2225,57 @@ static void test_polling_small_buf(void)
>>>		/* OA unit configuration */
>>>		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>>>		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>>>-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>>>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
>>>		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>>>	};
>>>	struct intel_xe_oa_open_prop param = {
>>>		.num_properties = ARRAY_SIZE(properties) / 2,
>>>		.properties_ptr = to_user_pointer(properties),
>>>	};
>>>-	uint32_t test_duration = 80 * 1000 * 1000;
>>>-	int sample_size = get_oa_format(default_test_set->perf_oa_format).size;
>>>-	int n_expected_reports = test_duration / oa_exponent_to_ns(oa_exponent);
>>>-	int n_expect_read_bytes = n_expected_reports * sample_size;
>>>-	struct timespec ts = {};
>>>-	int n_bytes_read = 0;
>>>-	uint32_t n_polls = 0;
>>>+	int report_size = get_oa_format(default_test_set->perf_oa_format).size;
>>>+	u32 oa_tail, prev_tail;
>>>+	struct pollfd pollfd;
>>>+	uint8_t buf[10];
>>>+	int ret, i = 0;
>>>+
>>>+	intel_register_access_init(&mmio_data,
>>>+				   igt_device_get_pci_device(drm_fd), 0);
>>>
>>>	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>>>	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
>>>-	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>>>-
>>>-	while (igt_nsec_elapsed(&ts) < test_duration) {
>>>-		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
>>>
>>>-		ppoll(&pollfd, 1, NULL, NULL);
>>>-		if (pollfd.revents & POLLIN) {
>>>-			uint8_t buf[1024];
>>>-			int ret;
>>>+#define OAG_OATAILPTR	(0xdb04)
>>>+	/* Save the current tail */
>>>+	prev_tail = oa_tail = intel_register_read(&mmio_data, OAG_OATAILPTR);
>>>
>>>-			ret = read(stream_fd, buf, sizeof(buf));
>>>-			if (ret >= 0)
>>>-				n_bytes_read += ret;
>>>-		}
>>>+	/* Kickstart the capture */
>>>+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>>>
>>>-		n_polls++;
>>>+	/* Wait for 5 reports */
>>
>>Wait for 5 reports or 10 ms ?
>>
>>
>>>+	while ((oa_tail - prev_tail) < (5 * report_size)) {
>>>+		usleep(1000);
>>>+		oa_tail = intel_register_read(&mmio_data, OAG_OATAILPTR);
>>>+		if (i++ > 10)
>>
>>So on slow platforms we might not get any reports in 10 ms? The idea here
>>should be to not have any timing dependence? So if we want to wait for 5
>>reports, just wait for 5 reports?

Oh, I think the loop was stuck while debugging something, so had added a 
counter to bail out in 10 iterations. I will remove that. We only need to 
wait for 5 reports.

>>
>>We tried doing this for the mmap OA buffer: see
>>mmap_wait_for_periodic_reports(), the function waits indefinitely.

You mean this:

while (num_periodic_reports < n) {
	usleep(4 * n * period_us);
	num_periodic_reports = 0;
	for (reports = (uint32_t *)oa_vaddr;
	     reports[0] && oa_timestamp(reports, fmt) && oa_report_is_periodic(reports);
	     reports += get_oa_format(fmt).size) {
		num_periodic_reports++;
	}
}

Well.. if your reports start coming in fast enough, then you would just spin 
in the inner for loop. Maybe break the inner for loop when 
num_periodic_reports >= n;

>>
>>So if this is done I am not sure if the intel_register_read() approach is
>>needed (but I didn't think of doing that :). But I guess we can use it to
>>see when there are N reports available.
>>
>>Longer term it would be nice to have a centralized function
>>wait_for_n_reports(int n) or something like that which different tests can
>>use.

Agree, except that some tests will read the actual reports, while others ust 
want to take a peek at how many reports are available without reading them. 
Since mmap is also a feature under test, I took the easier approach. We can 
always refine it if we find something better.
>
>>
>>>+			break;
>>>	}
>>>
>>>-	igt_info("Read %d expected %d (%.2f%% of the expected number), polls=%u\n",
>>>-		 n_bytes_read, n_expect_read_bytes,
>>>-		 n_bytes_read * 100.0f / n_expect_read_bytes,
>>>-		 n_polls);
>>>+	intel_register_access_fini(&mmio_data);
>>>
>>>-	__perf_close(stream_fd);
>>>+	/* Just read one report and expect ENOSPC */
>>>+	pollfd.fd = stream_fd;
>>>+	pollfd.events = POLLIN;
>>>+	poll(&pollfd, 1, 1000);
>>>+	igt_assert(pollfd.revents & POLLIN);
>>
>>Is the assumption here that the kernel timer is firing every 5 ms (so if
>>we've waited for 10 ms POLLIN must be set since the timer is firing every 5
>>ms)? I am not sure if that 5 ms is uapi. Or is it? Actually I was thinking

But here I am waiting 1000ms in the poll above. That should be sufficient 
for POLLIN  to be set. If not, we could set the timeout to a large value (a 
few seconds).

>>
>>>+	errno = 0;
>>>+	ret = read(stream_fd, buf, sizeof(buf));
>>>+	igt_assert_eq(ret, -1);
>>>+	igt_assert_eq(errno, ENOSPC);
>>
>>This part looks ok, it's uapi.
>>

Note:
ENOSPC is returned only if the buffer is small enough that not even one 
report will fit in. Initially I had a 600 byte buffer, but I did not get 
ENOSPC. Instead I got 576 in ret which I think is the correct behavior.

>>>
>>>-	igt_assert(abs(n_expect_read_bytes - n_bytes_read) <
>>>-		   0.20 * n_expect_read_bytes);
>>>+	/* Poll with 0 timeout and expect POLLIN flag to be set */
>>>+	poll(&pollfd, 1, 0);
>>>+	igt_assert(pollfd.revents & POLLIN);
>>>+
>>>+	__perf_close(stream_fd);
>>
>>How about just reading N reports using a small buffer for this test,
>>however long it takes? N can 5 or 10.

Not sure I understand. You mean at this stage of the test, read 5/10 
reports? OR just alter the entire test somehow to do something 
different?

I thought the test was specifically testing that POLLIN is still set 
after an ENOSPC error, so I have written it for that case alone. The 0 
timeout will bypass the wait in the poll so that we only get the state 
of POLLIN.

Thanks,
Umesh


>>
>>Thanks.
>>--
>>Ashutosh
>>
>>PS: how about separating out the patches which currently have R-b into a
>>separate series and merging them first?
