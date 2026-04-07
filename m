Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5B0FB5180
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 03:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F349F10E34D;
	Tue,  7 Apr 2026 03:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUwPpznj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3727F10E34D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 03:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775531935; x=1807067935;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O3Yxs71LA6TL5+TSMYjLWXJ0rercNkGlPLqL0ceXyfs=;
 b=SUwPpznj3vRkUgn0H/EynJLhSuCEIs65ZbPQnJnY+QLgRS7jHVVtmPqX
 3opEyfPqUC8Un9jJ2Kz4gZNLHl5/B/WxUa8NI2ZHzXWSxUVkwQyi6Kvk3
 KE+vX5mSsQiVn0iqWMgVebql1Krg/MvvBjQwoTrVHw5tacFyeMpxuLMm4
 F8oNLe6hhDNDQA6py3quhy/bJHS8wb0Y43GnvszIhqAfwpiPw//EBdujw
 mXQKWpWTS6vvP23NghwOcsAGOi+ucUbdWupir37uHIwymphNdAaZGAD2V
 7rV14ftW/j6YUNV9dqvENophEnWWzg6n17wa5glgZZ+4Z3ki1k87tH6ia g==;
X-CSE-ConnectionGUID: kLEVb1KjQ1Okm6NXXg3zZQ==
X-CSE-MsgGUID: kIBK3hWZQDqBBiYKB25xGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80079050"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80079050"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:18:55 -0700
X-CSE-ConnectionGUID: esxZzn2ASD6P5KLMYBxFow==
X-CSE-MsgGUID: Ljk7NJunTNieKWckOtuYKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227210315"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:18:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 20:18:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 20:18:54 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 20:18:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALTx2V1/nY2gAG3rNa0rp8SHHiwtZKKHo/Vfpb9XBcNek4MDmB/nArp23fY/8YreDisWM0Yk3eEwCrDOU/lDqG7NU4hAf4mgNvMVOLl0gcI0wUA8bSjBtDjGRIR/pcl7k7pgOtbIr+Ggl0cZXxeVtkdZkfP+iS2jtkVmrzGtiW2FSal5juK2DQfH2jUHpnJ2T3n3AGPJCtXDvZirIvUH9QYih1MPT46DndV98pVayibamI9C/xzC24XfTnCuv35nhUt2BmAYBi9xi6FazL4JrIyJz56aYSlssZdynDGnudM9HZpw4X/D8aVzo+bHgVRMHI/D+HejHcBYJ+jMliJo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhyhLjbvCX69bs/5qsGa2fKF3oKJs16UGX4fypal7yQ=;
 b=mtnx5Qd4ZMU+C5MJjzzo1JPjoTpo5RWkf7N5ZYa2hJ42SM63LLxkUDotdHrjTbsJdO7OPVVR6z9BYIQ9Ey3tjn5bhT2Uy7WYB0YE1SBVPeYJckmGd5vAt7DvTk1cppdcUo4yOc5BIFZlpIj01k2Dc9grDsnBIEcVzu9KyYRAyEHlGgwHByLsb2fuWwGOqOP47Arg2e9/5GET4WFs2W3gzVxoq5VJWoBAaInwR+nSBPgV2HD3QyW5gWDrC3aKt5BG15YTg8Kq9GKbRC+m8ExJTkmZmwIQZ5wzx1vuQp7ZoLd8K5OJ28qPUgJ6JqXIUiSLgEAmFD81sPgxOHA8WEeQ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CY5PR11MB6212.namprd11.prod.outlook.com (2603:10b6:930:24::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 03:18:50 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 03:18:50 +0000
Message-ID: <c1b4be6a-ae65-4bd4-ba3f-1e5a66981a2b@intel.com>
Date: Tue, 7 Apr 2026 08:48:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 2/9] lib/xe: Add purgeable memory ioctl support
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-3-arvind.yadav@intel.com>
 <642f2bae-ec32-4071-962f-e5281f85b706@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <642f2bae-ec32-4071-962f-e5281f85b706@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CY5PR11MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8aff79-10f6-4c81-49d1-08de9454635d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: GvXCqBdUZdoGG9aRjexds/EvUf2Cf+y8jZmA95gxXvmb8TOHTE6OiwoXZL9aIXXe0JZzqE5klviEelx4G0oevPBjwOH6s4BBPgzbBYZd+iCVFE7snlbyoIIBYJ8hoMJaTJaAS6zFk8Sp+8/EKfiR3FYcVBgYgLZFiGjWFUiYVeK2XkFQ2EpSGhnepn8U67V6d+haZcdh9ssz3C2C/WQeyW+3LFhNVUpmlYiVj45Gu5mVsMHFMCTCk30SmERDaFEQE5RZBlOEER2JsaLFpmoxQFL1yjPLWSXU2ZKcjcPeT1glS12Sz3aFe+nEvXonAR5D+CRlcOmENdrWrf/19vqzjAwKkBOnDYNgP3D4pX24H0tSWGXTIh9pLy3BnAdHst4javpVM9wjKhjWNWfRYlVNaV+vviF5Ff3iSbvLjyu9pb701Xs3Z2W6NEiU1iOC5yFfLCSALil11gyjlge6u2T3eHk2Xr6CM66yepoi3cTyfH0j62YFRjBXgEeuyPyEp7iy3BHvruGufmGAp+/7JV6i2mwfLcEt0hmFhrGTm9ppgQSKdt1ztCnK4bHkcA3MZ38HYfYT6SCoFxbt2KqyW0TZrha5Z16XsXK4P1Vyi1NaNZhUbDDtF98EKwLzmbPAlfmH5ZADhNVAR8drVc+p6LKRlZQtKBiCQdQvkZ8gBVp3jvp+2CdJB8owSrGZXSKikZsGF9/krO7Aoeoz+jpP3dLAjWnynuV5kC8Oucx/L3ZeGSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWt0VngvaTZjUGo2bVByaC9hNWlhR3lmVWVOMWxQL2tEMmdpV2U0MHd1V3J6?=
 =?utf-8?B?U2M1N25xQXZ5MU10ajh3anFLNTgvVTFiTE8xM3hNRC9SOHBmMVFISlZYUHJD?=
 =?utf-8?B?ZGo2VjNWL1ZGV3BSc01pZjBDQ05iT3h4NWdhMTNJT2ZTNU51dFdhU3NGOVdS?=
 =?utf-8?B?cEQwdmw5eHZZbS81WVFJclZLVjloUWUzV01qR3EzUFJZK2xwVDl4alNHZE92?=
 =?utf-8?B?emwyN1VSeE1MK1FubTJaMUpaN3RCUDU2RXplcGJ5bElDVVlZMTI5Ym1RbzNC?=
 =?utf-8?B?QldRaHBWbDdmanJrRUlSQXlVazV4bG5NV1A4UW9YYm5jK0Z1bkpPZW9DaVcy?=
 =?utf-8?B?THIxZUw4WG9Ra3FpTWViQllrbGpzSkJuV056Y3hPNFdDQmpqWGorUnlqWEZi?=
 =?utf-8?B?ZHh2YXZkNk9aNlM0UzJsRHN6dEVQZFRPbHVqMmNxcW15ck5NenRxdlVmMTVl?=
 =?utf-8?B?MDhOaHg4TGNUemxNakRWa041N0kweVNXWmdselp1aU5hRndWN01yMzlIMFhT?=
 =?utf-8?B?cVlON0FUNXp2SGNGOFplU3NKVHZZNkpPbFNRYnNCWEFoLzhJdDR4eE9XeFgw?=
 =?utf-8?B?YjQvanR5RTFRWlNsNXJoK3pJREFoZThFeUpXc2dpbHdjTFdBVnFhWFgvblYw?=
 =?utf-8?B?U1pRbGdzU2tzWXB1RWVLcVAvTWp4SHVtdzU2bElTU3RTOC9rRXpwWjY1U3VZ?=
 =?utf-8?B?Kzd5OVRRanI1U1B1bGFnczZIOU9xdkFjSytIUzd0U21ES1JNbWJYeFI2Q3Fw?=
 =?utf-8?B?ekt1RWxDd2ppS0k2c0dmYi9JQm51bSs4ZWw2WFk2YnBabHd6VFUreUREa2g5?=
 =?utf-8?B?dUJXc3BiOUJHLzFNZEFPNm1VL0tranYyazZWczBXVXNpTDJGRXo3Q3NyM004?=
 =?utf-8?B?Z1pBdUw4ejdWSEZBL00wOURhT3VqaWxsWGpueXgyUFZtWnV4LytrV3BiYi9Q?=
 =?utf-8?B?d0VDdFR3M0ZNeHhQU1R6TG1NY1NENHlBTENqa2Z2d3V3eUloQ1NQczVJWFcv?=
 =?utf-8?B?dGxNem1jMEVlRExYZy9lZWVKNlZ6ZnlmYmtCeGZxSTJnVEczcTQ1T3BSM3RB?=
 =?utf-8?B?d2w3cHk1Zmp6VHhtVDlidWdOYTNQWWFtZFBhb1k1RUpDanpPaHlRS2cyQ3VG?=
 =?utf-8?B?VnFMdVd1U0Zxam9icTl2UTNMd2Z4MGpZVDBjaEtGTnRnSnFMbkp3ODlNME5q?=
 =?utf-8?B?YWVQZmJYckpEQXJreXBVeCt1SXJza3BUNHdWRzZsalJibHNxMm1VYTJxQzl5?=
 =?utf-8?B?TS9leVJLSEM0Nk9BRVM5encyYzZUTUtzZW0zb3RZK0lwK2Nyb2p6R3IzUEQ4?=
 =?utf-8?B?SkVzY05xQTZ3RHRPd3FkNTMxOUdBNFMrTEthY0g2TlkwYmQxbkhrTnZpM3pu?=
 =?utf-8?B?QzB4NHNyTDNzV1E2STM4akd1OXZ3b0pSZlF1dGs5RjJwaWdDdnZRL1BGeHZy?=
 =?utf-8?B?TDMxbzQzOXRLL0xCbmVPVjRNbHNMTEdCN3J4VXBQN0FnSDg2YzRFang2ZUh2?=
 =?utf-8?B?bEwyYWhvL3lCVzE0eGEycHNPTjFOZVVHN0psS2FiejRWdGdxOGlWbUZUMVBj?=
 =?utf-8?B?RlpkYk03WXJiazkrZUhDdTFHdVdtWTNHQ2hKMHBWMlIwRUdTbG5CampGb2oz?=
 =?utf-8?B?YzV3T2tqOFlwU3ZKSDE5QXVBK3pyaDNRb3IvS3JVQUZreEI0UWk4UFVEOUxE?=
 =?utf-8?B?S0ZNR00vQ3B5NTRsb3ArOXNqOVYwZ08xeUx6Y09jbGFsUzlHaEV6bGpKbWU0?=
 =?utf-8?B?MEVDcUl1eGVnanJ6KzFaVTNWZU1FaFNGUUhIMVJheTBuMTkxQzJhNUs2Rmhh?=
 =?utf-8?B?TVlYcmVOeXNER0FyNmdzWHJhNExqQW84WE5wb21obnE0R1UvcHpkTy84NXhM?=
 =?utf-8?B?WGxVZHlBOEkwejF0NWNIdnYxNXVQbzdsWmFFbjBJaTBLb3o3WUY1MEdCc1da?=
 =?utf-8?B?VEVxdkxiNDIyRHYxekcrdzJONmorUWVwQU9sL3hLM2NtTXNqL3JkSlZwSktu?=
 =?utf-8?B?RHRhODJsUldMZnFGT0g3ajVWUHFONGtWMWQ2YnlESGhRZU43R3RlcHNuVGlY?=
 =?utf-8?B?RkdFMFl3NXdNZkREQjlnNFBQYnNnOFFKdXF5bUVSQXZreVZCVkw1TVNMMkJL?=
 =?utf-8?B?YTdQQVU2MnZZNXdnOHN0VWQzZ0dnNzdmS2dmaEFVSlJVc2NzK1FjMU50Wkx6?=
 =?utf-8?B?UzJBN0poZGxTVkNvVE14czdaOUtrMFFrcEJPbGRmRmloUldKYmErUlBMOWhx?=
 =?utf-8?B?OWtaWCtlb1pPaHBwNmpxb1RZNmZ1bTdWQzErWWYySnRHOTRQSjFlWGhFRzRn?=
 =?utf-8?B?VWpJRWRhMmFCWFdDMnJYNkVOamxibHpadnQySjgyKzZEcjFJRFZPUT09?=
X-Exchange-RoutingPolicyChecked: uf8Cn525VLMlgtrWxL0usyh24vqKjM+n6J1HSuY6NKHnrrm+EasuzWt8okqxznjhEmPITEwtKeAIQggxPyxoe56O51VkQ/wvIEKDpHi+te6YzvEjcTnMHKgLxbcLmZW5C6Nh75G3mRF5QsKl66zjRjoKT7RtbBaTnHk8F3pHWHh6z0DY7lrIFxBxOi5NACTTz4uuMUF+dCvyf8pI+l14n3E30i5u5seCug2m0vfAP2caHBHovuLu0Q51Ck+6OE1ejRvci02ZkdxOv/qwpxvKjC6bF+pMSIS8g1hByBzgPdCbO9ZvMfg3agIGlmt25Db180pmQdIhZOzOl3teAeeEZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8aff79-10f6-4c81-49d1-08de9454635d
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 03:18:50.5511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xoSLoKBJIIKbmX2SPcJzzWpNFBTHwHF8YaDqFvZCr5rjRox68CYlyc7KNos7glUk3NNcgflEa81iZOBP7eGCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6212
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


On 06-04-2026 12:29, Sharma, Nishit wrote:
>
> On 3/25/2026 6:14 PM, Arvind Yadav wrote:
>> Add xe_vm_madvise_purgeable() helper function to support purgeable
>> memory management through the XE madvise ioctl. This allows applications
>> to hint to the kernel about buffer object usage patterns for better
>> memory management under pressure.
>>
>> The function provides a clean interface to:
>> - Mark buffer objects as DONTNEED (purgeable)
>> - Mark buffer objects as WILLNEED (not purgeable)
>>
>> Returns the retained value directly (1 if backing store exists, 0 if
>> purged).
>>
>> Also update __xe_vm_madvise() to reject purgeable state operations
>> and direct users to the dedicated helper.
>
> Here you can also mention why this new ioctl when __xe_vm_madvise() 
> already available.
>
> You can mention the changes required.


Noted, I will update.
The existing __xe_vm_madvise() uses a generic type/op_val pattern that 
maps to a single scalar field (e.g., pat_index.val, atomic.val). 
Purgeable state requires a different ioctl layout — it populates 
purge_state_val.val (the state) and purge_state_val.retained_ptr (an 
output pointer the kernel writes back to), which doesn't fit the generic 
op_val model. so I have added this new one.

Thanks,
Arvind

>
>>
>> v2:
>>    - retained must be initialized to 0(Thomas)
>>
>> v5:
>>    - Rename retained to retained_ptr. (Jose)
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   lib/xe/xe_ioctl.c | 33 +++++++++++++++++++++++++++++++++
>>   lib/xe/xe_ioctl.h |  2 ++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
>> index ea3f2fcaa..955607f93 100644
>> --- a/lib/xe/xe_ioctl.c
>> +++ b/lib/xe/xe_ioctl.c
>> @@ -785,6 +785,9 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t range,
>>       case DRM_XE_MEM_RANGE_ATTR_PAT:
>>           madvise.pat_index.val = op_val;
>>           break;
>> +    case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
>> +        /* Purgeable state handled by xe_vm_madvise_purgeable */
>> +        return -EINVAL;
>>       default:
>>           igt_warn("Unknown attribute\n");
>>           return -EINVAL;
>> @@ -821,6 +824,36 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t range,
>>                         instance), 0);
>>   }
>>   +/**
>> + * xe_vm_madvise_purgeable:
>> + * @fd: xe device fd
>> + * @vm_id: vm_id of the virtual range
>> + * @start: start of the virtual address range
>> + * @range: size of the virtual address range
>> + * @state: purgeable state (DRM_XE_VMA_PURGEABLE_STATE_WILLNEED or 
>> DONTNEED)
>> + *
>> + * Sets the purgeable state for a virtual memory range. This allows 
>> applications
>> + * to hint to the kernel about buffer object usage patterns for 
>> better memory management.
>> + *
>> + * Returns: retained value (1 if backing store exists, 0 if purged)
>> + */
>> +uint32_t xe_vm_madvise_purgeable(int fd, uint32_t vm_id, uint64_t 
>> start,
>> +                 uint64_t range, uint32_t state)
>> +{
>> +    uint32_t retained_val = 0;
>> +    struct drm_xe_madvise madvise = {
>> +        .vm_id = vm_id,
>> +        .start = start,
>> +        .range = range,
>> +        .type = DRM_XE_VMA_ATTR_PURGEABLE_STATE,
>> +        .purge_state_val.val = state,
>> +        .purge_state_val.retained_ptr = 
>> (uint64_t)(uintptr_t)&retained_val,
>> +    };
>> +
>> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise), 0);
>> +    return retained_val;
>> +}
>> +
>>   #define    BIND_SYNC_VAL    0x686868
>>   void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t 
>> offset,
>>               uint64_t addr, uint64_t size, uint32_t flags)
>> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
>> index b62d259fd..a02d68cfe 100644
>> --- a/lib/xe/xe_ioctl.h
>> +++ b/lib/xe/xe_ioctl.h
>> @@ -108,6 +108,8 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t range, uint64_t
>>               uint32_t type, uint32_t op_val, uint16_t policy, 
>> uint16_t instance);
>>   void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t 
>> range, uint64_t ext,
>>              uint32_t type, uint32_t op_val, uint16_t policy, 
>> uint16_t instance);
>> +uint32_t xe_vm_madvise_purgeable(int fd, uint32_t vm_id, uint64_t 
>> start,
>> +                 uint64_t range, uint32_t state);
>>   int xe_vm_number_vmas_in_range(int fd, struct 
>> drm_xe_vm_query_mem_range_attr *vmas_attr);
>>   int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr 
>> *vmas_attr,
>>               struct drm_xe_mem_range_attr *mem_attr);
>
> with above change in commit message LGTM:
>
> Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
>
