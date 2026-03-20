Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A928108B8E1
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 09:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38ECF10EAB3;
	Fri, 20 Mar 2026 09:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chodYkil";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F8810EAB3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773999657; x=1805535657;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SWgFE8PP9bPpx4tt0hvJ69dQsdgIgknJtJJ/8m8jfcc=;
 b=chodYkild2toIUmaZtueFJ3gHxPt+CV534jRm4aEhSeFGAlLLc974GIQ
 G1kbvsngrk6Q2JeNpbAvt/ZgQ4NF3702OGOb19MczC5VIPovSgpM53CAz
 f1odIh08qbrVKbkE4J6KxJMlF9i4TK3qNocbSQmhtsSHihqy3YEOYqNgw
 Ycs5nDRN9PKnwQ+7ofhoHhLuMdAZXTvaJhtLMybsA4DlBWo+1Q4TpwPec
 tKIw6nK6R7RPd4Za78SOiLasT+S2F3lnrZSu7FT5o7NktXOH3kzN4JZA8
 Vn+HTRLn1qUt4OGeJLVO05nAqlIbhP6SAzoMPAe45RzHN5LWS6shWkV1Q w==;
X-CSE-ConnectionGUID: tbtBbI0pTZaCyhl/yF0Rag==
X-CSE-MsgGUID: mzrIosZ0QbqS1gcg4zOfXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92656080"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="92656080"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:40:57 -0700
X-CSE-ConnectionGUID: r2HX5GY5RH++0cBDy6ZJyA==
X-CSE-MsgGUID: GBNuQ/TvRj2Nskq+bKglbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="261140224"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:40:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 02:40:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 02:40:55 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 02:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFJIYOtU14f+6LJOfsFgY5R/IBRE+ASj4OW+hRVy1VTp5MzNV32muvJx7IUopN2fTtDi0J52U9+D3s76qgwwwtfRhfgl6H6qvNq5LhJuWcjo+qcryzCAwwUwjHVReR7mVdcxrMq0PnmK3yWSOkEPL6UEvvK9Mzuq5FobqnAGlQvWlRH+/V9z+rBZScUm3qUzMw6B4MykqKCk/KbyiuxtEWr+a603QYJTOcOc7rNPygVZVw2cQDfyEOvE3utXZ4Ee6lWKm3xKbMngolEWko2VwcsWpM6aJA5QhhDniGXnH5ntGet/xmklSTdCMO0swEobhBBFHBhsg7JRJVHjL1niMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTX6ZhpOMpeSZIrbGcFrNDDxLxfnCcbETsnLvaJJOS8=;
 b=O0OQt1Q/86AzwACNl6U5Fhp8uul5XxmqzHzObihiZhoX7Fm3BK6AJSr6ISGxTxuTaVHp2drM3y5V9LVWBZj25vuvcS2Wil+BDbjpLfPlBGa23/k1zUo2QMin8SJEudyD/IO4qNNNWPZiXfgJchpZ/SfcQ1Yws0t0CkmupScNX2laVCqLJZySBr9peo4Ny6jd4aYPnfyjgbKNqfsK0h0lorI+ObxI7Na6mb+KGI12sHWKb7PSEVv/a7xHWeP7eFGr8BvOsvvC31ACf9hjaBiGhdDARD6PT7g7VSZ65bS0Vzqi7bKgNxHBi/G1r0bj5OOZ5XlDOLZqosxqogyDEBENDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA4PR11MB8915.namprd11.prod.outlook.com (2603:10b6:208:560::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 09:40:50 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 09:40:50 +0000
Message-ID: <38f6a42e-bfc6-4fc9-ba55-d56ff0807ab6@intel.com>
Date: Fri, 20 Mar 2026 15:10:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 0/2] Skip intel unsupported downscale tests
To: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>
References: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
 <3bca96e1-994a-4984-9088-eaf3f7569638@intel.com>
 <c25692c3-6896-462c-b4d1-36f0df20ee94@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <c25692c3-6896-462c-b4d1-36f0df20ee94@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA4PR11MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: cc0cadf4-d444-4031-2786-08de8664c5b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: kEyrEMmH7PSv/i0VcyJmjvdFQwrM0t5MeLQZAy+3xLjt2IGV72Z4+Rjmdw5LNJnAEwVkH3S9L9IaYfH3ZJLLNY135QEHsw6LyN4lg9sujrqNpknManvL5IKVoqJBa8pCmRyB3oF5bWUIx3XABsZFrF4czFK3A9ndJQAdsjuoXgjGUAJ0WWpJmxhge3jdJj/cd15SviWLUaoQ3TywjhFGjNsbufrqBP8og4nRjalzLMIY9JNTXbr+5BW+shHOLR1pvtuSH/rqVYuPQtHOsZqWCgQAnEoqpUlNiUQNzDFVegbspvliw4UQRSzDucuO+Qeu6yA3V0+tm00AFHroWqreyOTyfibFZovEwV6Mkx3+J/N2Nca8Zg3d1ozSaSnU0l+bhjy2bE1RaeSVqYFQbamwx1Co6gXo7tBOQEkQUI89rBEE+d3D6btVKLYS9RjkX7fOO99u5roArtD5i9igzmTQcYx3S9ObAW+qhiCiYdJRKUpLcgwQsv8hlv48xOkm14xyOKi3Yy+euZwZGiMY1p3eWG3PMFWoFnKj18RfNDAxyJfRZA1kN081npvVYxkipBdxdQ/Um5tyrvotfcGoO0078AqQKozPqkYSnJsDCA1fLzTDoAm0gRfvddQxnk+nYPf/92Dfamn3Pub8pF7In94KVtaE55MfRrGrlsLUn6N+JGtYpLa9wEAT3wbW7ByKmvBydP5h/qXDC2ZdBti2fILo7PRhm8/2Q0QAdr3vspP0Qhs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3lsVlVpK01hMTJjREs4NFU1UmlsakIwYzhJbWxEMm9FRkR2SXhkS01SaTFi?=
 =?utf-8?B?Mmc3QXdZN3BHc0JtaFUzekxJQWpsWUhTUFdQQlVVd2F6M3hvalUvTGhBS0hs?=
 =?utf-8?B?R2FoVUhpM1RraTh5Tmw3M1ZLZ210TXoxZm9yRU4wb3YyaU9mT2pGNncxWGtx?=
 =?utf-8?B?dkdGVXB1RkNqKy9LK3AwTG1lZHNUMXFLeFAyNXE0V0k4TlAwNVJNLzBMbmxs?=
 =?utf-8?B?emllNkRDVkZORzVyaVZpcVBtN1B5aFRHdE9rQzZQbjBqUExzbnFQT1JkMmcy?=
 =?utf-8?B?dklRNlhSNjdvUkhieGc2WE9HMjl2VmdyNjZ4NUFOSzI3TVNpTWZCdFRDOFpE?=
 =?utf-8?B?dmIzMmh5bTVXWTJhZGx0QmJqREVxdVMvL1Rwb2tKTnRUSmluOHJBZDFkQkJj?=
 =?utf-8?B?bzl1a2x3SkFJaUdtaThsTEpFQ1ZCZ2tDWXkyK2c3MDN2cjJRT2gvbXRRemY4?=
 =?utf-8?B?ZnJVSmYvMWFNekxUZFp0YWFzQzRGSWVMbjM0bW5MQVFrL3pKUnlVTzZHRTZP?=
 =?utf-8?B?ampHVzJnVXpPVlFNSGxuT05pTm05Z0NmVU9IL003L0RHem41NmFDWmE2ekc2?=
 =?utf-8?B?b3VicFlCa0VGN1NsSCs3NTVVbElnMzVmbHRLanRBeENvQWE3Zm52elRPNUtP?=
 =?utf-8?B?Q0FOQ3VoR0RJRFBROGpWRnN4L1pYZHhrOWtjSkpXT3NOS0RYUC96MW5EcGhP?=
 =?utf-8?B?aW5PUHBoYU8vK0ZEME5FOWs2RldjeTUvU1NFNTVkc2JWdGlndkpabXhtbnhj?=
 =?utf-8?B?NWZjeFRJVVczVUxnQnNqc29YeFRMbXg1QkJrbCthR0hnc1RNNyszZ3R2cnA1?=
 =?utf-8?B?Wm9EakNJSUQrWVQ0YWpmRVVMMXRsQUNqS3NMc2dxQnZZYW9lZ2tpREJjTUJF?=
 =?utf-8?B?TG1TdVRHdG5tVndVNUpPWTR5SVlVejZNN0dYSWhGWlBPeHl0RTBmb3NEc2x0?=
 =?utf-8?B?UkVlbGR0eDVNbTlKU0dTYWVXYnFTMCsxWjhKSHhUQ3VzY3JKL1JPSll4Z29G?=
 =?utf-8?B?djA2MVdFcmFtYXNZbXI0dVE3TXhYc0w3czI3SThsUzdTdG4yZXRmMUFIUUdS?=
 =?utf-8?B?YTROZ3V2cjU5bHBYZ0kzRXJzK2tvNmdLK0taRlFScHF6aWlQc2R4emwvdS9o?=
 =?utf-8?B?UnJORnVSY09EMXNZazcxL3FuM0xoTW15dFAwMVJyK3BIcUs0RVVLb09qRHMv?=
 =?utf-8?B?dno4bUtHTi94bEVkeWZ5UURVZnRpVG1KMUN4ajQwY3E1dHZteU9jM3JMSFpB?=
 =?utf-8?B?VVhJRjh3RlBDV3U1UmdkMTlXWFhDZzFKeVVJSzkrUzJMeUd3aFFnTVFndmJm?=
 =?utf-8?B?MiswUExRZHc0OUYxUytLZFJGeUI1d1R1dkxMMjBwR2VXbzgyY2NobWNscHlD?=
 =?utf-8?B?SHozdkNEcjZ1UXU1RlNCWU9lNWZaclJoN1V6QWplZ1YvZU1mWmNUYnY0Z08y?=
 =?utf-8?B?cFk4TWJzSWtxR0V6VklSV3ZXVmR4c1VVMGpGYUFHSU5icXRacFpERm80QlNv?=
 =?utf-8?B?Qk1GNmtNSU82UHBSek5UUUtlWVpGTUxxcDU1NkN4TFdYNGhVTWg3ZlVjK1FT?=
 =?utf-8?B?TzU5QlN2WHNBZ2NvWWxjMWJJYWVFdmU0VnRram0yY2tYNHlDcll3QU1SQUc1?=
 =?utf-8?B?MFhxVnBVeEhqOVh2RlFvWi94OEYzaXJqV0VyRHhibUY2ZTYweHpaY0VET0Q4?=
 =?utf-8?B?NVhCWUZ4R3B3dzdJZlUvZjFBbGtsN0VxYit2SldkeVgzTnljTG9LNDlVQ1RV?=
 =?utf-8?B?M3oxUGpOOEJoblFvdEpYNzh3OGpIMGtWaVc1MkM2b3l2TWh3eEhVcVcvZGdS?=
 =?utf-8?B?YnZWTUFoTi8zRHZzbGxKVkNqWjZtR2Zud0NKK2JtckUwYVVZQkxCWEcrdmUw?=
 =?utf-8?B?aFVxQllaV3hlUi9td3JVY0RyWXhDVVEzL0hiTDMwNnc5MGRrdVo0NytGaVQv?=
 =?utf-8?B?S2pGbjlNRlJwWDlvYWxPUDFXdktHcm13OVdOblNYclUrRllDQktVamdTdm56?=
 =?utf-8?B?WkowdTNva3QwUU9pODFuZzRRR0JDb29PMlBOYUJTUUorS1RiV0paY3lTdUEx?=
 =?utf-8?B?V0MxR3Bab1Q5dFAvd3VNeTJLZjZGS1pQZGpqQ1lLalF2cWgzT25wNDFKTE5Q?=
 =?utf-8?B?UmY1V3I2VysvQkI1SU8rVlFMUmlJcFdLQ2hqTDhjOGFYL1ZpV2N4eGJDemQ2?=
 =?utf-8?B?Y050aURFVm5ueUExY29hNVRha3grNFlsVTA3TGd3ajRrQmZ5NXI5Q2d3NkdK?=
 =?utf-8?B?V0lqaU1ORFFhc1RhNlJWVWhBZW5PbE9Ib2lxVXIzSmxrVnlwa0IvRk4rOXR3?=
 =?utf-8?B?UnROTXNubXcyems0enRpSFIrbzliZTkrTGd6WXhKOHFFWEZTeEtxdz09?=
X-Exchange-RoutingPolicyChecked: TS5InXKBfxdjT0RYe3fOPExJS5vmDpNsVI5VRRVXb+29PsfOKxsRCT4c9xSVimKA6jzjkQjqrVa9u5uAwvW1e7tM5VLMVAyBYXaHET5oGemX+o6DMNiJhQd5uEVcv5PBzRrCVKCpi83aSNRH/LHDu3H6vRfFzBX4o4eGj+ZfdvzoQODXq8SMCXO0ehP9qNPnc1Z/TsVxbduAogJutyKlstmUExitZ34g5BHxeSafag6KEWdvf+jsDW8Dk9YKb1UpNE9Dr1otZtGYxRgDCYLHlcmSOJr38EMhxgwP5BmRJV8axMuzFyMRUmtqfQhWMHVi6XYIPa5KXl/u6kxV53yLaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0cadf4-d444-4031-2786-08de8664c5b0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:40:50.7969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOf22N45DXdMHFqIVyZwQyjxTZ4SodeOUp6t1PFv+8CNKFfByveP4GERJEdxwcsg0N0Rbpy/3oB1vvXnnWkM9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8915
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

Hi Ramanaidu,

On 20-03-2026 02:02 pm, Naladala, Ramanaidu wrote:
> ++ Karthik
>
> Hi Swati,
>
> On 3/20/2026 1:11 PM, Sharma, Swati2 wrote:
>> Hi Ramanaidu,
>>
>> On 11-03-2026 01:10 pm, Naladala Ramanaidu wrote:
>>> Some scaling tests are expected to be skipped, but they still 
>>> iterate over
>>> all display modes, which generates excessive logging and eventually 
>>> hits
>>> CI disk‑usage limits. To address this, early skip logic is added 
>>> before the
>>> dynamic tests begin, preventing unnecessary mode iterations and 
>>> reducing CI
>>> load.
>> Why can't we handle this in blocklists? 
>
> The tests are already blocklisted, but they continue to run. To 
> address this limitation, I sent a patch.
>
>  According to Karthik, platform blocklisted tests are only excluded in 
> Grafana queries, not during execution. CI intends to generate 
> per‑platform testlists from the blocklists, but it doesn’t seem to be 
> active yet.
There shouldn't be any blocker to use these blocklists in CI. I have 
requested CI to apply those for NVL, if it works well. Same can be done 
for PTL as a WA until we have platform specific testlists.
>
>>>
>>> Naladala Ramanaidu (2):
>>>    tests/kms_plane_scaling: Skip unsupported scaling scenarios
>>>    HAX patch do not merge
>>>
>>>   tests/intel-ci/i915.fast-feedback.testlist | 216 +++-----------
>>>   tests/intel-ci/xe.fast-feedback.testlist   | 323 
>>> +++------------------
>>>   tests/kms_plane_scaling.c                  |  38 +++
>>>   3 files changed, 128 insertions(+), 449 deletions(-)
>>>
