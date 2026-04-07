Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7ACEDB7D4
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 08:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A2610E379;
	Tue,  7 Apr 2026 08:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABzYhhet";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF55B10E058
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775552077; x=1807088077;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=txhB051uU5RAZ/bBfLds/5cCb83P/hxx1P1uqro69+w=;
 b=ABzYhhet66ym4ZYWp7+hoemDlQGvMlzBuv7//iKvGJo/DRXUNyKqoA3o
 mMJ6pC7Pkb4yGK2PI8nydPOLV9/EfL0QjgdCGJ+QxinQ0V7i5dDVNHuYv
 XCF1YNW+4VLbpSu96BGKs+A04iE6THK7yjHRnNauu1xQV4Iyu9Rm0OmnY
 USRGMvlTDsm09xuADbQvKfXDtPF9xpvG7hFnW/nSdddieYXYRTfgDPKI0
 fCDPMEcP1XxD+XHcKWEbQkIAFWQntfK+UipvzdKunpLDSz7BfTSsodMCl
 KWIWehGoqKDK99iNuRlulpLYhIJIYH26FnB6+s7kQRKsTIqKVw4rBCNFi Q==;
X-CSE-ConnectionGUID: QV9uMs5tQfilkk1OFsr28g==
X-CSE-MsgGUID: iRxzEI9wQvmCpqmx/e/awQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76581781"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76581781"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 01:54:37 -0700
X-CSE-ConnectionGUID: lcZv+jNUTKGgMcCPhc/9Dw==
X-CSE-MsgGUID: MzxlYYIJS9quhHlCJXd0PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="227117111"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 01:54:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 01:54:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 01:54:36 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 01:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBwU2OiZRp8YT7HW6Iywp7J7RzXorvrecnYj2snKCrGBtVZamsEJKZyojBokrDl/vd4ljVmrs0GgXWvMC3/N392A9jJbCTE2LHj7brQB96GzDe1WVbIi9qhJInx2fzcQy8KBfN30nerVIPq9MbLiZCKmhev1XieEqaUgCPlcZwrUi1OILPUIW8ygireeTNJno/PBp7JIZarBh2PHX6byc7jrpAQEBq/0mj80l+HyZO8ATr0BbZobq+5aqUICaSJZgLbiZaAcnJOvwTmbi0fogW9gKku7mXH5oDjB6PSmhTaOJJ0h5hGQp2d56KAysSaJezgiCC5zWnLCQpg63qo0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DM8urqlfv7F6NpWvfRzE65hbgRVzGPuIIutFTmp9abM=;
 b=An9+2HbgWgBzPPutyi3LyylzHKJTb3ve6WGVHO9/sevTUEi1mEjgVJpKk1+zy+Q5urIYlyvsT1poTnDogvND2Pr6oI1+nC4OZfa44suGtkObq9wXRcpuu2BIh5/UYYJp0iclzU50jj8ZR9d4z077uhXzL4aKATUxeJbyz48qkYOJUJxruSqjUNdsV7DlAjG5t/XU8KUj1ZOjFFR8bFLg8RwDSwpW+d1vonyErhGpr2j0373XBarExD9KJ+8IonZbPKDXJrOJoYj0DCbjqijOI1Y7OPvB3oEOWaBMCe27qMbuncv1eOgPhUegPvJcNGOUTjhDjUHeZUo08vU82jwZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DM3PPF1FCD3EAF0.namprd11.prod.outlook.com (2603:10b6:f:fc00::f12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 08:54:33 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 08:54:33 +0000
Message-ID: <2f672e45-93f8-494d-b230-130338335a61@intel.com>
Date: Tue, 7 Apr 2026 14:24:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 9/9] tests/intel/xe_madvise: Add
 per-vma-protection subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-10-arvind.yadav@intel.com>
 <d5a5b692-bda3-47bc-9696-9d2d3ef00eaf@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <d5a5b692-bda3-47bc-9696-9d2d3ef00eaf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::17) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DM3PPF1FCD3EAF0:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a6565e-5e6f-45fc-2707-08de948349ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: sYQR7yeKg4xf5DVx5/RuGDCktA/DGfgUUrbnw2ro2kNSZEEkmhe+DxLIXe2iZRo82JMzSsw7H4skNK9pNox+WiQ2lDXh7IBOy/GfBQyI3OVsn5XOtRnIlyb/uVDkoP1UF36QuqD7c0L7NKyUqIQjFvJ2sh/wrl/xndUo9sk/qUc5fH+Ndqdtj8vdsB69LnkU8ZTvXakSYho69hqKHbG9Abs5Kz657DBBOitcvva0sFzZQ70+1Q6nvKCjZSWWdGEaL2CSCEvHAx2gjYYvawvqIJo6GHVK3k1883ihuuBVUy4kUlB74iWiQP7tEpqAcODuSG5jWfnb8pvqVd5qyUiFCaMv1oFrX4qaOdzqcszqVuq/Uuq6+V/CAyVE0OTCuWMP5gvk3riBWCVWR2trOrAERfQpUXEsKRRkQyNcqXTKqSc1NHDIyc2q3mFI9trCtqFe0eVdOPFMtbzchRuMJDfQI7L/vL/sSUK/hHdJc0aqGwmQN1j21EANqDsMOAX3npTN0dhApw6vh0mLYVhFBh3iXMldWNQL5qOSqXavWcWqffKtm+y3Z3SqUb4j1OvnCvEk3ffwTAbc2T2QQgjL6HAU3hKXpUTyvYO9hvm7opAe4GDEtEfOw8ot8X+yUDQQ4DYPVNvZMY86oPqRmnSSgpJ8zHAYRZvy18+tR0q6PFIQxWk4Ldjr5d+ELZV6SaaDNwFiDQXbzLwCyWkyO4WqYozCeiNJTmGOJLRTCAsEbFgoCZ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm1Zc1VOdloydEZwVGtCMDRJSWZ1Q2RuTTd1K1U3SjJ4dHhzMzE0czdGMFJa?=
 =?utf-8?B?a0RiUU5QNUVHSzVGcEwwbmgycTVISVY1Y3VSV3VmeEpLMFpENmhyWTgxdnFT?=
 =?utf-8?B?eGo5dFlYZUF1WEVEeUVESFNhZ0RCNFQzK0xKanpPS1U3TDFQZHpCdFV5NHpw?=
 =?utf-8?B?M2JGb1pXTkphd1ZDK1Y1MHd0c0VLaG00QVAzeXJ2Z3pIelFTT1kvcDFRR2pN?=
 =?utf-8?B?TFZoMmJlN2FxSFlNWmFJUFdlSUc1V0VLQ2xnS0g5M2habm51V3l5UkRpaU9I?=
 =?utf-8?B?SVR1Nmk1MUgzRkplSVdFSFZuNC9YSjFFYUxUUWZlcjcwdld4UTN1VDZHaEVt?=
 =?utf-8?B?N1MzZFVVaFh3WkdLSG0vaG9xYmc0RUw3WVVudEtCNDBoeXRQYVkxLzk4MCtJ?=
 =?utf-8?B?cFZPVTlNRGZ5bWkxWnUvTDdWQ3JyTVpJRlpES1FLQXorQjRaT2pCd2VkNFQy?=
 =?utf-8?B?MVdJZmZvYnZGRitpQUQ0NGE5TVVxSnhvbmdYUlc2dDZBRXord1FjVFRXa0VC?=
 =?utf-8?B?Uk5qbUMweFY0YjIvellVVHJibWxFOXVnRTdsMThxR3M1V0JaNlFLbVdzMVI1?=
 =?utf-8?B?L25DSkFyTmdaajhZZC82ekVhQWRHdFAvZFY1Q1JMU0pveXlnTkdPd2REbStK?=
 =?utf-8?B?TTEyc0RiZ3pDaWkzenVSZXRQMXluQ1NnSCtGcTBmN2dOcS9zQ2IwZEZHa1lP?=
 =?utf-8?B?L2cydE5OVUpadzA2Nk41TXRQeFhrK1VFSjhFd2xPSVpnRGxrRkplMFdBeTlK?=
 =?utf-8?B?QVY2eU9Mc1o1czZHaEh6UURQSlROZ1d0WElYZFp1Z0FrME9seUZMS3ByMFFh?=
 =?utf-8?B?QXFCaGIrdHdpY1hyUVl4dzVSVWZUcU9iMGNwWkpRM0tJY3Bield1aEFaSHND?=
 =?utf-8?B?T1NVb005Nm04alZFU1RwOHNYSWJ3UFpMcjVMdzNTMTh2bjFNK1VieVlSQ0ht?=
 =?utf-8?B?eGdDOG8yK2M2YnJLbnNRaTJSdWpMQWhoaFRHazhHREFOMDFZQVg0WGYvSlVh?=
 =?utf-8?B?N0pBM1ZBUVNaMkkvSUlaTnd5ZTZpcENjN1h3bFZLa2ZjOXQwa2M0YTNaYlFM?=
 =?utf-8?B?MjFHMCtWMURmRWlKcHlhdXp4WHJGMU00eUowTkl2WjVZRkZzNUgxYTVraFVR?=
 =?utf-8?B?ZFVqd2tqdzJWdUk1VUNwNDJBWXB5dXhRWmtDdUFyOVBQQitlQS9DWGlycmNI?=
 =?utf-8?B?Zy9uYUtLYUxmQ3U3dGhvaTlrd1lrZGQ4dDV1ZmhWeHowRjdQSVlLT2hKb0Nx?=
 =?utf-8?B?ZzBMaXdhS1owb05Kemlnd2tSYUwxeTF6NXRXM1dFTHY0UnZyKzBYMTB3M3Nx?=
 =?utf-8?B?aFVOS3hENks1cUgydU5mSmMyUm1XN05ibEVIVlBjSUhDWjdEdzV1WjRzUS90?=
 =?utf-8?B?NFhPOWw1Lzh2YWxaci95ZjBtMWp2S1czdG1IdGlxMGoxalhOTVQ3S1FaU1FL?=
 =?utf-8?B?Vm5OcTA3Z0E2WTVjUDh1UHZhTUNRR2xZK09zYzRrSTllNUREY2lpR08zUG84?=
 =?utf-8?B?U1JHNTFaNEQ3aDZIRjRGeEplWmtmMWtwYWF3VnZ0ZVBuTWN5Ni8xOEh4VUtx?=
 =?utf-8?B?Sk9zMjRRUUtLcllOaUF4WTZraGlGME1aKzlsYmZYYzBkNXN0eUhyOHMyb0pV?=
 =?utf-8?B?dUQ5WDZtSURxMUJCRFdxeTNkUXIzVXhTUWZpdGh2K0VGVnF4MGw0S2hDSTB2?=
 =?utf-8?B?dkZHRE1TREozNU5QUmhhR0FNZjJxNkR1MzQySUowQ0lPMnN4MlRCdDVVOHlr?=
 =?utf-8?B?MFdSSVpvVlFlZzJXQ0xFWlNMVzZNQUYvRGg0UjRPOUVoeFNIaVFaaTRCNlBU?=
 =?utf-8?B?eE9JL0RGT3p0WVQxSVRENEhxQUlvWlc0b3pTNU1MMXkrOHB2VER0MzBhL0tS?=
 =?utf-8?B?aDhHYmQ1TnJqSGdHSGZxN3hGK1FFemlMRlZFYjZkbEdaZ1lDZFFnVnRMVFQ1?=
 =?utf-8?B?VkxTUzlLNkRNNUNXa3JQQjUxWmZLVjh4azJzZVZnL1ZYVWZCbU1RMVpmMzZK?=
 =?utf-8?B?bk9vNklBL291TWx0ZGgvUXVGU1FscnFUbXo4d3hxN0N3MW5yL1dGVEpJbzY1?=
 =?utf-8?B?dVRGZ3ozYmtacDVSdkxBNW5UZXlmK3lsclJvd3FVNWx6T1UyMW9seE9KaXpn?=
 =?utf-8?B?RUhYeHBZNXhCclN3bU9PYTVZd1g0QndkbnRKcmNFOU1hRmxtVml0Qm80ZnR0?=
 =?utf-8?B?NklZYmx3SlBrTjd6bUR0YlRZTHhrbHVNU3VucmJEQnRNeEJxMHNDdjIwQXp1?=
 =?utf-8?B?VnVnV0YrN2g4bGVwUXpHZ28zNnNUanpXYVFyZmdUcER0ckwyVmcyZmY1dSsy?=
 =?utf-8?B?K2RnNi9HWkk0bDgyMk5ocW5lU2tLYXVXMHJFdHpjOTdzZGI5Zk9mQT09?=
X-Exchange-RoutingPolicyChecked: dWaM2+e0z1JPm7BPI1R88FTsH4NcfJCXJG1U2Vfenzp57n32w66VBW2DpTQ9T78uKMnoJGc/gV3Of3VweF6yoRM0XgKXOZ1QJEITAeoJCax+gQ2NdP7TDBWdQjKysT/V6dAX/4hZ/znS0XqItAieLdvOLS7/TfMBaTVOmrAjndqevWQ8BJi6RYaIR2fxJtMVwO+Zff2ekntZVv/0bze3OqNASO6JPvnB5xE6Zdt/6Fm6Pl+yOf1A7gnhUVOySTOSXksY2yCIF4TFmdtCEP3SdZXnHjanlhFZEmCWWDVVg1wGOb81n1Hnus3b+hqjejY011R2qYIbsJbR33+usoQq8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a6565e-5e6f-45fc-2707-08de948349ce
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 08:54:33.6106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdyWYw99gt1lil5YaafJI8bTV4Em5tXl3JvGfUIFETqLLlw3WqOXbl/ToJrfDyep2+BF4p6xPUUlzsUmSFqM2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1FCD3EAF0
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


On 07-04-2026 13:01, Sharma, Nishit wrote:
>
> On 3/25/2026 6:14 PM, Arvind Yadav wrote:
>> This test validates that a WILLNEED VMA protects a shared BO from being
>> purged even when other VMAs are marked DONTNEED. The test creates a BO
>> shared across two VMs, marks VMA1 as DONTNEED while keeping VMA2 as
>> WILLNEED, then triggers memory pressure. The BO should survive and GPU
>> execution should succeed. After marking both VMAs as DONTNEED and
>> triggering pressure again, the BO should be purged, demonstrating that
>> all VMAs must be DONTNEED for the BO to be purgeable.
>>
>> v4:
>>    - Added syncobj_wait() after the second exec. (Nishit)
>>
>> v6:
>>    - Move resource cleanup before igt_skip() to avoid leaking VM and BO
>>      handles on platforms where memory pressure cannot be induced; 
>> replace
>>      igt_assert_eq(retained, 0) with a graceful skip. (Nishit)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 127 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 127 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>> index 6c0a563d8..2375f5475 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -654,6 +654,127 @@ static void test_per_vma_tracking(int fd, 
>> struct drm_xe_engine_class_instance *h
>>     }
>>   +/**
>> + * SUBTEST: per-vma-protection
>> + * Description: WILLNEED VMA protects BO from purging; both DONTNEED 
>> makes BO purgeable
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_protection(int fd, struct 
>> drm_xe_engine_class_instance *hwe)
>> +{
>> +    uint32_t vm1, vm2, exec_queue, bo, batch_bo, bind_engine;
>> +    uint64_t data_addr1 = PURGEABLE_ADDR;
>> +    uint64_t data_addr2 = PURGEABLE_ADDR2;
>> +    uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>> +    size_t data_size = PURGEABLE_BO_SIZE;
>> +    size_t batch_size = PURGEABLE_BO_SIZE;
>> +    struct drm_xe_sync sync[2] = {
>> +        { .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +          .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +          .timeline_value = PURGEABLE_FENCE_VAL },
>> +        { .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +          .flags = DRM_XE_SYNC_FLAG_SIGNAL },
>> +    };
>> +    struct drm_xe_exec exec = {
>> +        .num_batch_buffer = 1,
>> +        .num_syncs = 1,
>> +        .syncs = to_user_pointer(&sync[1]),
>> +    };
>> +    uint32_t *data, *batch;
>> +    uint64_t vm_sync = 0;
>> +    uint32_t retained, syncobj;
>> +    int b, ret;
>> +
>> +    /* Create two VMs and bind shared data BO */
>> +    data = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>> +                         data_addr1, data_addr2,
>> +                         data_size, true);
>> +    memset(data, 0, data_size);
>> +    bind_engine = xe_bind_exec_queue_create(fd, vm2, 0);
>> +
>> +    /* Create and bind batch BO in VM2 */
>> +    batch_bo = xe_bo_create(fd, vm2, batch_size, 
>> vram_if_possible(fd, 0),
>> +                DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +    batch = xe_bo_map(fd, batch_bo, batch_size);
>> +    igt_assert(batch != MAP_FAILED);
>> +
>> +    sync[0].addr = to_user_pointer(&vm_sync);
>> +    vm_sync = 0;
>> +    xe_vm_bind_async(fd, vm2, bind_engine, batch_bo, 0, batch_addr, 
>> batch_size, sync, 1);
>> +    xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
>> +
>> +    /* Mark VMA1 as DONTNEED, VMA2 stays WILLNEED */
>> +    retained = xe_vm_madvise_purgeable(fd, vm1, data_addr1, data_size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +    igt_assert_eq(retained, 1);
>> +
>> +    /* Trigger pressure - BO should survive (VMA2 protects) */
>> +    trigger_memory_pressure(fd, vm1);
>> +
>> +    retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +    igt_assert_eq(retained, 1);
>> +
>> +    /* GPU workload - should succeed */
>> +    b = 0;
>> +    batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +    batch[b++] = data_addr2;
>> +    batch[b++] = data_addr2 >> 32;
>> +    batch[b++] = PURGEABLE_TEST_PATTERN;
>> +    batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +    syncobj = syncobj_create(fd, 0);
>> +    sync[1].handle = syncobj;
>> +    exec_queue = xe_exec_queue_create(fd, vm2, hwe, 0);
>> +    exec.exec_queue_id = exec_queue;
>> +    exec.address = batch_addr;
>> +
>> +    ret = __xe_exec(fd, &exec);
>> +    igt_assert_eq(ret, 0);
>> +    igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>> +
>> +    munmap(data, data_size);
>> +    data = xe_bo_map(fd, bo, data_size);
>> +    igt_assert(data != MAP_FAILED);
>> +    igt_assert_eq(data[0], PURGEABLE_TEST_PATTERN);
>> +
>> +    /* Mark both VMAs DONTNEED */
>> +    retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +    igt_assert_eq(retained, 1);
>> +
>> +    /* Trigger pressure - BO should be purged */
>> +    trigger_memory_pressure(fd, vm1);
>> +
>> +    retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +
>> +    if (retained != 0)
>> +        goto out;
>> +
>> +    /* GPU workload - should fail or succeed with NULL rebind */
>> +    batch[3] = PURGEABLE_DEAD_PATTERN;
>> +
>> +    ret = __xe_exec(fd, &exec);
>> +    if (ret == 0) {
>> +        /* Exec succeeded, wait for completion before cleanup */
>> +        syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL);
>> +    }
>> +
>> +out:
>> +    munmap(data, data_size);
>> +    munmap(batch, batch_size);
>> +    gem_close(fd, bo);
>> +    gem_close(fd, batch_bo);
>> +    syncobj_destroy(fd, syncobj);
>> +    xe_exec_queue_destroy(fd, bind_engine);
>> +    xe_exec_queue_destroy(fd, exec_queue);
>> +    xe_vm_destroy(fd, vm1);
>> +    xe_vm_destroy(fd, vm2);
>> +
>> +    if (retained != 0)
> This condition is not required here, already you have checked above 
> and then jump in goto: 


This also handles the normal case. Without any jumps in the working 
flow, we check after cleanup whether it was purged, and if not, we skip it


Thanks,
Arvind

>> +        igt_skip("Unable to induce purge on this platform/config");
>> +}
>> +
>>   int igt_main()
>>   {
>>       struct drm_xe_engine_class_instance *hwe;
>> @@ -702,6 +823,12 @@ int igt_main()
>>               break;
>>           }
>>   +    igt_subtest("per-vma-protection")
>> +        xe_for_each_engine(fd, hwe) {
>> +            test_per_vma_protection(fd, hwe);
>> +            break;
>> +        }
>> +
>>       igt_fixture() {
>>           xe_device_put(fd);
>>           drm_close_driver(fd);
>
> with above change LGTM:
>
> Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
>
