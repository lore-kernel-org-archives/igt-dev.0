Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31788CAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 06:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA20210E02C;
	Fri, 19 Sep 2025 06:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUFCcuw+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DC210E02C
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 06:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758262836; x=1789798836;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OL2OoadSJltoai2uw73ohLEuczj8v9Wmd1SAxQ7TagI=;
 b=iUFCcuw+7ZgYUcrbk1KqCF4+aMC8LjwCymx9jGbs9QyI9LiK+dW30SAX
 n11/W5njKGTl0UqG/FnsXu5HLQ4sz18dXNKLd7GBMlAamnwBRyQJ+nExH
 nsm4FXpJaDs4WpKVMbGHzgl9hUEjHSuzIfsyt4yvXAEGcMhkYCrlkkTIi
 sxN0WuztaUlp7vXINT0x0upNP23IiMPPqH8XcBD6y4BtUdftN7cnKBnl0
 T2eexsGVH6pIzS6nkKoz8Zhn36RNL6xJLgovnFMPKl/uViImwWX/f45z7
 ujz93ebkktco1mFQwQg/7U8KHcbbS53HaZXxihtsfMAQFSkFSlVDF3iMF w==;
X-CSE-ConnectionGUID: N3UOs0PyT9G8sxY+xbnxJg==
X-CSE-MsgGUID: p0JwZgLfQ76b/TCUc0QsOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="64245348"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="64245348"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 23:20:35 -0700
X-CSE-ConnectionGUID: Lkb5xUApQNe4c1Kg2LN5bQ==
X-CSE-MsgGUID: rlCAupTESAKZh+EJHZodyw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 23:20:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 23:20:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 23:20:34 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 23:20:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJSTjip4h6xu3yJQLtMSpveQJkEP3BmIs2KIDfXUpfy5uz5ltlt8LVX6msjjsLRLpIcIaQbS2q/K45hgm9lzYu/erH4Wfptpy1snwFNwJ/U9ABGCsfBU1EwTBfIYz2SaVLzEHuNhjl25IAOFuw7a9e1j6p320fFFIH5kperp1SxpS0ZDY8afiAQdx7/+AOIwF91vt+JwdOzTV5zX+l/LNyF6H4OUG+8CXnZ9NumM/lIy8TL29CynjE/TlyllbrOu1UOCYg2+fcgNDV8DQvyD58cy7jUFNqp44K0cUxHCLrOh9cAdxkkLZrYLNpr0o9WGT+oYuGnRHdkMFMR47MTqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viSGDvmm4u+3P17uWunDX8PB/JiwQzW4KsC3eV4F+cs=;
 b=drJXi9qYu6cyFslvVrU/IXL7dwGVlDvS7Esv0Y7GdVa19RvwTwtSqM8GE9pgfavgPTrv9djbsqi8KrXapKTYYV6fXC0XOlpRHYH4s4ME0R2aeCSqr1Vi9XC2rMpShpsoBOHJxNe8heKRR0ODNfRfrNlk35iakFCVa4EUcn030WykRvZoNbLnyyVpf4Muf6OC/FuAlQ1Gf3JwDycNc3E1QZI6F3pOHS9VU56PJl53ZC3eSxlbJAot6OA8dsmZYbbrSX6kVbX736A4YmNdJjB9AoEBH5I4QedSMzJDCwlG4TFQvlJw/gh6naRPtf+Ek7eZJ5WAUpV/BEZnZ5upLVlFWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 06:20:32 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 06:20:32 +0000
Message-ID: <e239be50-bb1e-4fc5-8337-157a8b5acfc7@intel.com>
Date: Fri, 19 Sep 2025 11:50:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20250919031736.1362484-1-jeevan.b@intel.com>
 <20250919031736.1362484-3-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250919031736.1362484-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: eadf175c-766c-4da8-fd6b-08ddf744a2f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a295OVExTkdPRWRTNVAyUytNcjd4b1J4SnErdDJaYXBKQWRza0RoR3hxbWMw?=
 =?utf-8?B?MzBJak03c3IxeUN2cVZTTmpmVXpFSVZ1QzlFQ1oydzJkRDA0OU9yeDRpSEFO?=
 =?utf-8?B?ZlhuZXdRWDY3TEFBSmdWbGFYTTZ0dTBoQW9YK0JkL2ZqTDFVQ3pWZDI5c0Fy?=
 =?utf-8?B?ajUwRWV2dEdjanlTK2JxcFVSTisrVjdxZnMvcExPUkk0eGo2cUc3UHl0UmRm?=
 =?utf-8?B?YUtjVk5qVWUzSUYwMjFLdjZrNms4UE9Tbm9lNlF2eDBJa1pwd0trVFRqN2tU?=
 =?utf-8?B?L0RiSnhBRDNUY01Fb0lEQWlqUnZPK2lCTkQwWU01NzNkMXVzY3NSUWltczh6?=
 =?utf-8?B?cFpYM3ZwK3M0K3RRRTRmVGFMcnQyOFROcXRhV0I5TThtakVLMlVnZEMwbFgw?=
 =?utf-8?B?SXhLZVBQZ1NvK3lyaUYvS3o2MVI2WXQxS3g3WVZHbmQyOVVCeUxKVFVPUkY3?=
 =?utf-8?B?cTNFcGIwTFNUeTdobGhPMHd6aFhUazRUcWR5cU41SE4vQVVZN0NYd1dqbnB0?=
 =?utf-8?B?d2N2a1o5bytDclRHOGE2SmFRWUFmNXk2Mk1xbXFxU1MrcFExRzNKd2QwaGtP?=
 =?utf-8?B?bzBtdFpXVXhkUWFFZFRYcExGdkxlS3BXVVJyaVJ5NHpBMU8rd0tmdy93NDJl?=
 =?utf-8?B?ZG03NjRIaURVWlkyTlVBK0xlb0V3Y0wzMHQ0bWJ0NWpDTXdzVFRhYUZnYUcx?=
 =?utf-8?B?bDYyVWhJK1NURE5MSVRvYWticXVVTk1TamF2MS93cUcyTkt5RWlySllPb1lm?=
 =?utf-8?B?cjVwWmdneFBzU2VSL3JnSzY1bEhXWUpWYXFnNk8rT296dElyaG13V1JZb2hK?=
 =?utf-8?B?ZEpWTEdZcG9wbDBiNlFuakVmMGFzTU1XT1psdzBxbkRwZHFVNXNvaCttTHAr?=
 =?utf-8?B?WlpzVjVEWnRnRGdYeGVSd20zTHFjRDNhbk5OeDVqY3RscUlBWUxuUitpTE1X?=
 =?utf-8?B?VkR3d1o5WUxXUGJPejFWOC9PbFgwWTU0ZHRrZTVQeTlOR3hJMnY1SkF2d2xv?=
 =?utf-8?B?cnM2bWZsQit4L2JqTk1tTmhscFZ1dlU5Q2lHYjNTQ29ZVVRvSjVUWkpwRzNX?=
 =?utf-8?B?NjFHd3NSOEY2MDhiNGNqTXBkU3FkUTkyK0lraUtBZlVNOU5XdkF1UEJLWE1H?=
 =?utf-8?B?a0Z1Y1FNbTJWbldjTDN2L3lSeTU0NGlKU01uaVBrcFhIb1YwWitMbC9aSCtY?=
 =?utf-8?B?RFNuakM5OFBoQ1JuWitpQm9OMU1lb2tjUm5ESEFlV0gvWHFVeHJTYjlOY3Vv?=
 =?utf-8?B?QkhLcGx6L09zWW5uUHNWNGsyRUdTaXJac0MrNzg3TzhnVDMvbHA1Yi9MdU5r?=
 =?utf-8?B?bXlLNjBCQy8zNTZqRWFTMUpIZVZOZms4OHdoUzNMNDVRalcyRTZJcldPNndK?=
 =?utf-8?B?NDhWMUpPK0tBR2twNzJNRUdBc0JZUURmZHI3NW1TWXZ1WFdZNHkxZUdZbW5N?=
 =?utf-8?B?QW9IZGZVU0ZkbUVhRGkzd1BIWTdtUXRuYjhLSTU3ZlpseldYVDJxTGFpYUJy?=
 =?utf-8?B?YkZXQ2c0b3grV0ZjbHVDMVdQeUpjMXNwTnJCS1plWVcwQzY4cFhuSVFFd0ZR?=
 =?utf-8?B?UWlITUdPbjBNSStXamRwNENWQ1RrU2lQdXVoRlhWaUlWZk8rVnNaWHB1WWRR?=
 =?utf-8?B?NnA5ZWlTa0MxQnp5MW5yQ0pYUDNqalppN1pFT0xCTkg2VkJsTmdIWkdXc2ov?=
 =?utf-8?B?c3RtNE5POWVEdWhZZUtVWmYwY2JnelNyQ2NZaHRhbHIxTjBhS2d5UmFMTnZw?=
 =?utf-8?B?aUJVc3NVR1pCRDNXRFpKQzJLVUxyWnMrQlVDSXdacE4wNllBbFl6d1BKeVZQ?=
 =?utf-8?B?UEZvNXRGR051aFZ1ZktWR2ladjByd29xN0NPZlZ2SEYxN0RuM2prczRlUDdp?=
 =?utf-8?B?S1Z1Z2I3eUFoSEhSVXlwVlNOSXZvZmZVM3FXRkI0MFNDeFFqa2pOYTBjTEJz?=
 =?utf-8?Q?KKybRWL9nXQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWtxRVJQS3lYRVJMQTk1b1hBcC9sN0Y1RmIwcVlKT0prT2Y4OEhSc2ltS3ZN?=
 =?utf-8?B?RTlGQXFqR3pUdlZRVE8wdE9aWUNMd1ZCdVI2VGVyR3NkbW1DVWZlejhUQnpC?=
 =?utf-8?B?eXJwZk9oS3FmcFNSTjZNa1lhaWIxK2xOcU5CdVZyTkVEaG5vOFBmVGYwb3R1?=
 =?utf-8?B?Wk9keHhZK3hiOWVGbFR6dEFFR281MEc0YmhiY09zdWRLNmdZSDdrdDBoRnlE?=
 =?utf-8?B?aXdPV1N0WGhpNkpzUVl0NHd6bFd2bFFpaFlpVWNYRFh1dUpWamx3ZHh6a0hL?=
 =?utf-8?B?VTlOeE9MbTJhcGhmTUZHWWNYVG9WQUt2TGNsVUp1aXU4bU1rTXVRSlV3anpi?=
 =?utf-8?B?Wng2eGo1K0tuUHRGQm43MHpOU0RaSUdGQTE1dUJmczdKREZtYi8vcTduV2Z3?=
 =?utf-8?B?UVREZmpneGtxZnBoR01LRlhFUzlWTHV4cGRlSVhWL0p3bkFGWmZ4V1R1cjVh?=
 =?utf-8?B?Q0VLbWw1SlQyY0hvZitVUVd1U1JlREtqcHY0M1RuNkhQc3hDSDROYnZHL25X?=
 =?utf-8?B?TGp3WVROcVU5cE1yZW4zV2lzeUFmSHlROTlPUHA5aEhQeC9vS0lLK1VXRUZx?=
 =?utf-8?B?S20rWVIybVE1V3d1MXFiMTBvMzl6cXFnRFl0THgycUZ1NUd6dUhBL2FleXox?=
 =?utf-8?B?cFFtemhMN3JFVnkxaitYeTROTmRuNWxsTVNVNUh6THowSzhvT09MSVJRejJo?=
 =?utf-8?B?UXVHbEdUTFo0aHVPMy9RdXNJUWZGRVhDNmowTEFmd0RqcC95eEFhQlpOcG1T?=
 =?utf-8?B?dUszL2hEMlhmMEdIOGFpbVhwN2x3bmFvNlNFZnM5MWNNOTNqVFgvZmpSRVdM?=
 =?utf-8?B?TktVUkhsNy9HaUZ3cEJ4ZlY1VWNLZGIrOVdUc2hvazhsOEZvU2dSWVZwTy8r?=
 =?utf-8?B?dUFUSEtIS25lcjQwa0F3cFFueEtoS29hYVRJSzVSbjVYWDZKNzJXVWlsTUZj?=
 =?utf-8?B?OU9MREE0bTd3OU9lMUprTTVzd1FMNnhiTFowL1VlVys4S25hOElveFFUckt1?=
 =?utf-8?B?Y3hCYnpZWUVNSlFMc28rR2g3dFc4aCtNYkNYNXJOSWZQbGNsbVBvZkx1ejZK?=
 =?utf-8?B?a25OMUs0c00rdHpoTlVWTGFSNlBuYWd6Nm8rejJYcFg5OHhOZTdZU20vK2pv?=
 =?utf-8?B?Y1pUTGNkMVNGUVgzUFY0UUI0REp6WlY1d1g2VTBYeit0akQ5U09OektrM2FT?=
 =?utf-8?B?Tm9HajVkZEpCNUdtZE5lbWNMdTRyN0FOQXhVQVpkUHljT2hVLzc4WVZRbjBu?=
 =?utf-8?B?Ky9oUmFtSlhNOWVKSlR1SGF0ODF4b3NZSjZmM0hLbW5wa2trbUhkb2lDL0Ns?=
 =?utf-8?B?dzRzMzIyTUZ1K080bEhkRGNlaEJFTkI5N0NlK3B0ekVweG9vWkpha3grMDBj?=
 =?utf-8?B?TVdScDhhYllSWUpaSkFqdkJCNkV4SlBOQklyUmRwc1lKSmZqdTdCSExvVVhI?=
 =?utf-8?B?bWlWWUx1bHM1SVdtQ1ViMTd4MllWQlVEM1hpZ0t6dEF4djIzZFM4dmJTcnk3?=
 =?utf-8?B?N3dBektOanhKaU1TaGxQdkg4WUs3UnFKaExqNVc5cmlnUVhqMkZuSS90TFpJ?=
 =?utf-8?B?WjArRHAxUU5CUWJWVm0vMWd2aFZCL1dHL05WZGpQMkRQeDhjZ2prbndKUTFy?=
 =?utf-8?B?aDVTWDdGNmVuTVFGTExWcFpiaFpVZ3FNaGlIcUViUDdSUlpkUGNoa0V4aHFS?=
 =?utf-8?B?NHNVeFQvK2dCZDduUk5OUk9zWjI3ZklmRGpXUXZjYWdxdGVZbWovQW83Kzhk?=
 =?utf-8?B?cTdwNXNuVDJoRFB5dWtrSW1xRnFOS0huekVjRFZtL0Z1Y2NxbC9idjNkTS9E?=
 =?utf-8?B?cEl6U1pjN1dyZVcxaWpSTHhXSStza3dUNmdCL0pVSHRab25QVVEvdWZvS1Bm?=
 =?utf-8?B?TEdMcFhRUG5GWEZmMm9hYkUwZ1VxTHpTdDFYWGNQTG5UeERQZEE3aC9uRGRs?=
 =?utf-8?B?SHVBR05lcjg0dlcvYzk4dWtvUitMaG5qTk1CMmljTnZYbU5IWXdKV3M3RWF6?=
 =?utf-8?B?dFJUU3F2RW9DbTdVMmR4S0Fzem13T05kVHR2TTcrb0xCMWpkUXlyT1JSaVEy?=
 =?utf-8?B?UEdzTTYvZm5nbDdKeVc1WFlPNThQRWxsNm80cXlEWDAwVUkrekZzWDRvN0lq?=
 =?utf-8?Q?3EEZpEEflI3yRNt2zNbLgY/AE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eadf175c-766c-4da8-fd6b-08ddf744a2f9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 06:20:32.4578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRDqLkmMHs7xHZoRUmiGXy/LFv+xBtBVrvTOAwVXdMsFHaf5NwQ4DRoG7tCQKP/nsRAMwaSY60h7mQfmfO7xIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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

On 9/19/2025 8:47 AM, Jeevan B wrote:
> If an eDP connector is present, prefer selecting its default mode for
> cloning. Some eDP panels support only high refresh rate (HRR) modes,
> which may not be compatible with external displays. To avoid invalid
Please rephrase "which may not be compatible with external displays", 
with something similar to the comment used in the test. As the current 
sentence is slightly misleading IMHO.
> clone configurations and test failures, we choose the default mode
> from the eDP connector when available.
>
> v2: Fix logic for eDP fallback.
> v3: Fix comment to say ‘lowest clock mode selected’ instead of
>      ‘default mode’.

Please add reference to the gitlab issue with closes tag. I assume this 
one? https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13780

Regards,
Karthik.B.S
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_setmode.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 48d0c3e1e..135918007 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -256,6 +256,25 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>   		}
>   	}
>   
> +	/* If an eDP connector is present, iterate through its modes and
> +	 * pick a mode with lowest clock, since internal panels typically
> +	 * dictate the clone mode and may have HRR support, making them
> +	 * incompatible with modes supported by external displays.
> +	 */
> +	for (i = 0; i < crtc->connector_count; i++) {
> +		drmModeConnector *conn = crtc->cconfs[i].connector;
> +
> +		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +			mode = &conn->modes[0];
> +			for (int j = 1; j < conn->count_modes; j++) {
> +				if (conn->modes[j].clock < mode->clock)
> +					mode = &conn->modes[j];
> +			}
> +			*mode_ret = *mode;
> +			return;
> +		}
> +	}
> +
>   	/*
>   	 * If none is found then just pick the default mode from all connectors
>   	 * with the smallest clock, hope the other connectors can support it by
