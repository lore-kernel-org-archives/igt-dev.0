Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D191C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 08:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A0D10E97E;
	Fri, 14 Mar 2025 08:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKff/hj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB88D10E115
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741942135; x=1773478135;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l7eFO9UTxpvJATQOSARx4ZMSQOSzROh0xOnoIp701oY=;
 b=RKff/hj+cT8WmuDGi9FZokaDJbAGAJibIrYf+ivAQy4Xjb4u5s0sKKBO
 1TlMTaiTSEdA9P2HAkjN6bLzbARU3CI+TVMmX1Y+QIiphb08evV70ORZ6
 4BQyVcd0D9fisS36jQZSh6vXhOhjRIbKXF/h/R69Ao5ewB2GqOsErqHUm
 XuHA9k6xr84uk1YDsVlscl6eEAYbMs7m147twaQHoRd02HomN0PXWMxeD
 VBvtT5AqiFdhiiaUGKhx0F9fvGU6rC0Li+KaWcEyQH6HkD9O10qwmhTfr
 4AthEEesd3ulLq6Klm83BBtXFK9Q+6bWNmO5wG+c+rXZhljdMQps7lLHn Q==;
X-CSE-ConnectionGUID: 1IJtNODzTxiSmEC5FeqKLA==
X-CSE-MsgGUID: /whingHGRPChprL/zjhLRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68452740"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68452740"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 01:48:55 -0700
X-CSE-ConnectionGUID: BO6qlRb6SAaERGSmu0RH8g==
X-CSE-MsgGUID: uVXmjNQ0TmCIVTEmTxFD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121206815"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2025 01:48:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Mar 2025 01:48:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 01:48:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 01:48:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfGyXf80PrFdCNM614wX1y7DvyJeIFJRI2klEcCIkPKGXZAPyaMsRTfCB0CRI12Xd+W9npjOHHAO5Rt1L4kUKdqxt3C6thdPHuPXEnmFQPLE7DbURoz5wLWIBOInNHAUnSPIshN1AuA4sdiPdRkZhJft/hTuNdUBe7ulzFza7LqdcDqAXMdNEfx4xCofMGXlQZxy20FNr7AjOXAoe9KwunZVGb8BtpxZjm14n2nMzIKI8NvrSj2Krak/8R3TkFYvcf0xwh1ewrrYoluqDDHotayTPeqv+O4ZFONzeuNy4LCYmF+23FiFbmehHHY1ztsiptdr165IgjH/AC0plh2wVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaFZra+uD/nn7x7pPboeAmcGh2D+k653GBiBz5aey8A=;
 b=NM1n4lXNFwzebX74WYmftBLP+XmR4n6qRYPtBuKmXuKYpEJZU2Ca0mZ3XRHVZNL8iIwMzKnGP+uT137QRl6WqMPfwzqVaScj88Vo9i25X9/y/aGLAg2Ua3uasdsIGSGRSBKDCoCpiKrDHwrgIBI4bYgu1xVqyf3mUOc6qhWR4Gcr7zaEx8e+coaFrZz+Or3+ITz8AhsIM9G81NBs1pWYKB4uQnk4gi9MtO3MiE6MZfZpM79Xp5NLIBwGe6Y7gM5EiUQtQlEy7kdbQrGx8hmRz2LWgx9udKSo0InvECkz8LMaEKaMlljTJWQF0a+E3r/PPXX1+DcTPUttKgNRV/7p6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB5765.namprd11.prod.outlook.com (2603:10b6:510:139::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 08:48:10 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 08:48:10 +0000
Message-ID: <c93beaf8-f888-4473-82da-7e956346e3e9@intel.com>
Date: Fri, 14 Mar 2025 14:18:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms: Align test documentation
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250312092654.567154-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250312092654.567154-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::24) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e0d417-a71e-4dce-740e-08dd62d4f29d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0NwUFdOdDgyU1BaRUZTZTR5SEdrNEFhaFI4ZFJhZEZoZGxDM3I4L1YybmQy?=
 =?utf-8?B?TGVSV0t0OVZ5NmVqdDltTW5XWVpzK201alR4cC9FWGN0c2pLSlNCZ0dJQjdw?=
 =?utf-8?B?ZTZuSHI3RWRneFllOUlEOGw0RVQ2UklzeXM3OTh0MEhicnpmRVVLZ3U0MUJS?=
 =?utf-8?B?TzZqMHU1d0tJa0xNd3VnUHZWYnlKcklCMzNnUkR4OEhFNlNpVThtQ29VejF2?=
 =?utf-8?B?MTV1YTd1U0NCdkJNWVV5QUpzbmp3cTB0R3JDT2RQMk05a0JOelQvVU85UjUr?=
 =?utf-8?B?ZklwMWRScmhhbXF1a0p3SXlaNGFJVklkQkNuVmg2QnZjNy9iUEsvVkxJZS9K?=
 =?utf-8?B?bi9RQ3Fkc0FzN1p0V2dHanlaSFo4RGtYOTFGSENuMWZsN2x3d3hiMXVpdUhl?=
 =?utf-8?B?Qm5KZUQ3NWxxZ2g2SVZ3R3Vpa0xxMmxRL09nN09EdUN1UzlUaDFkcldhaXcv?=
 =?utf-8?B?bVNoT1F1cS9zdCt0MFlGRlQvbFhQOUk5akc0Y1ovZi96TUdtZXoraTZ1VVp1?=
 =?utf-8?B?cUhBY0R4aCt4V2Z1NVpqMjVFQUQ2TDZlTmxGZW5mUmxobEFXa2RiZUMvQVBa?=
 =?utf-8?B?dmVSYmdzQlo0d3E1RHRLRFFnSDdTQjdpVk5BMjRiclFJQkR2amlXZWZJK2Nw?=
 =?utf-8?B?aHQwOGpCdDBXbStCazNmMjdSRlU2SHpIZktSV1V2dlZ4b0dyTDNnZHYwM2Mv?=
 =?utf-8?B?dGg3UVd4bEV2V0J4K1pKSHNkeHFRTU00RWVwWTB1L2luU1FTdEhMRmMxalpi?=
 =?utf-8?B?aUdvZzgxSHU4eXZ2OUVkSTR2eTB4NUFpWGdWS0Izbm9rYzVzeHVGbDdmSWtL?=
 =?utf-8?B?Z25WNThGb2lQMVo3S256Q0lSSHp6dENETHlPK20wUTd1QXVaOWd1eEJPZ3pm?=
 =?utf-8?B?MDRid1ZzUkp1d25lVFlHcU1IU3RRMWVmWTZSN0pIR3Rkak5vRVljdWRod3Ra?=
 =?utf-8?B?OU5KelVEUEZnTUNaU2J4S3pHdmJNcTFnaDVsdVhJOG5XRE1nMVZxMzhKTW5x?=
 =?utf-8?B?UXZmU1M5TTRrMHFoZlJiWjJNTXI1Y3RGTzc4VFFyRnZCVzgzaFFiK3FWT2x6?=
 =?utf-8?B?bUNnWDZvS2JPTEdOMlZXRjU1bzdvTkNBdG9oSnRBa0NBUWZKdXhDd25TdmtU?=
 =?utf-8?B?d0grais4cmRrWkl6V3BWaDk2aUkwNFJ2MWhVNVZMMHhwMGEycU9JaU93c0d2?=
 =?utf-8?B?ZElUTjlXcmFndXpJU1NrSVRBQXduU3BJNm8vbnhpVkVmcGFYZnlNQ0ZTdVlV?=
 =?utf-8?B?UnNzWlRHVVRRdExHZ01GZDEvak5Qd05MNkNXaERVc2R4aXBEZi83YXZIeHRr?=
 =?utf-8?B?K0tnUmhzS3BMZnNhOVhhYkFuZ1hqakcweWZ6YW5FbGpmeEVsMWY1Zzdib2dr?=
 =?utf-8?B?djNTRnZxNEN0T05VTVB4Y2VjZWpDVUFOWDJvdnVOTHdISkJMcWdXQ3llYjNZ?=
 =?utf-8?B?c1UwSzFLNFdBS3BQWElpb2FmTi9yczZSNGlBTitwdUZWcGQ4eCtMcU5KYy95?=
 =?utf-8?B?bUZ3OGtVL3NqRFpBbmNoSHpXM1FrQmsvbTdOVEMrZm0wMGFRMmZ2RUM5VFBm?=
 =?utf-8?B?a0VaYS9OeS84L2VaZ1BQY2sxYUpWU0RuQXlWc3lWK0Y3L3FZamM1Y0lvbXdN?=
 =?utf-8?B?Q1QxZjVmc1NkN2FOWXZSamhPYkYzbmFtLzIraUFUeDR5VndwaUtEVHR1bTdk?=
 =?utf-8?B?OVNsMkFSaDdOVWY5Q09MNEZJOTlrMlptaytMaUg0MmNCVmFCNTVXOVE0bFlY?=
 =?utf-8?B?eVplUU0yL0dvU2FJR2ZzUlUxMk5BN0F3TG1mcGtSR1dxanlSOXhyL0VaRllJ?=
 =?utf-8?B?aFRlbmpPUVZQc1F1SmZleElxNVNLdzBsZFhCZ0xQUWdQVTByc1h2RjgwM001?=
 =?utf-8?Q?x7ZGgynDpjauP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1BGcUhGTmY0aWNDenlHYWorNzhBUVNQamtiV3JweGxBcTZiQTFURGdCSGNQ?=
 =?utf-8?B?cVo4TmpRUk80WFpzeGowQ1FCRTc4bmVCbTlJQUdQejZzSDNubitQUGJ2NzZ0?=
 =?utf-8?B?Y2grTG40UEw5czAxczJVSHRYWUtwbjBiRnlaU3YvZVBDWTNzcjF6MlNCc0hB?=
 =?utf-8?B?S0Q2eGtuTnYwNjhJR1RRUk90L3JEVTZMTUY3OVhFTXlOOEIxeXR4bFpUSExX?=
 =?utf-8?B?Z2huOTVONTRBN1hnWTlBQVlMTisxS04zYkNaN1VsYStTK2R1VGhQdmhqYi9H?=
 =?utf-8?B?SDdRN2tjdnozN2krSGFaTXpVTWVlSnlOZWg0cll1Q0VZREp2aGxROFFKMXNo?=
 =?utf-8?B?UXlTc2Q2VWc5eGdhdnlPQjh6d1grVWNUY1JKVUJWa1UxY3hQYmxxSHNMR0ky?=
 =?utf-8?B?Q1ZCYzFkcDdjUjd3bkZGTFBWZ3FkQ0VjQnplVmRyYytDNHBOcHM0ODBlWmpo?=
 =?utf-8?B?b2c4MEF5djMza05zT2NGck9va29CMnFFek1aa0RWeXJud1VtcnhRTGwxTHJK?=
 =?utf-8?B?a2c4RDdMZzZKQ3B5TFZwN3F0RzV6OCtlaXU5VWRRL2hxU1E3QmVkK3ljZFFi?=
 =?utf-8?B?ZkpuODkrdWJEb0RKK2c2THZkaGdOeHdqcUpjSkQzWmpIeWs2REJpOGlucUVn?=
 =?utf-8?B?TzNqVTVLNmlrTWNHRmQ5SUc2SFZvVXQzcTJjRmp6VVNKWGtFK2k1aUVPU0Zk?=
 =?utf-8?B?WUhKajdJQUZ0dUg1bkNKR2E4QlFwODdYU0RrNmpvQVEvVVZ6TEhCSHJRb3Q3?=
 =?utf-8?B?M3ZSZk9TdXZGWWtSZHg5aTVZYTJSNGhpbFhRSllFSW5mSGR6eHA4SEZYL2ll?=
 =?utf-8?B?a0l3eWZQQUdxQ3pqdXVyaHg5UGRXZ1g1WkZ2b01oSWkrbWN1citFbGp1UWc4?=
 =?utf-8?B?V0RQNGV2R0tGZWhRQnIyaHNLYlpWaHFJYjI1RjA5ZmMvekpjSkRRWWhZZGsx?=
 =?utf-8?B?NWwvSDB5TGRsclFWclZFRTVEWUEzTHRXeWczcER0azNYVlBxRjUwc3YrZGpI?=
 =?utf-8?B?UEV0eHRVbERKQlB5SnJhNVlSeVc5Y0JNY21jcGNyRkViTnl3NXJMeEhNUUx0?=
 =?utf-8?B?eXRjeVQwa1ZnWFl6QkNFeW5iRmZzdmpTU28vb0pTN3BMY3o3YzI0Qy9DeGts?=
 =?utf-8?B?d0IxUXJaZ0Q4cnN6eVZaUjFSeXk3cFZRNG9ndGZZczljS1F2MVhtWE0wQkRT?=
 =?utf-8?B?N2o2QVQ4Q21wVUlBTTI3TWU4VGdVWC93R1RZYTZFajM1ZHNwbkhHcW1henI1?=
 =?utf-8?B?R2NSd2t4SlpXb09YZ3FJdVUwSEZPOGF1cjdCQm82c3pjS1NJcG1kOU5oa3hi?=
 =?utf-8?B?YVJoUWc3VU81aXJHT2ZJWUVsdEVieW8yQ20wbkU3L0VhSHRrWEtSSlJFRjhj?=
 =?utf-8?B?Vm9vSDNhT1d6SnBvYncwQzVMK0tWSklCUUpzb3VrL01QU3JLUlhvWW1hWXh4?=
 =?utf-8?B?cHNVRXVXdGdLdjd1a3N3bjd2QTRETWRRWjNpb3RoblozbmlFSUFDTmR1Sjlu?=
 =?utf-8?B?QTlpTTMwOGJ0YVBOcVZzZVNYOG9FRk41Y0NHV1dOZnhnRzY2RG0vSkdWNzlt?=
 =?utf-8?B?WXpsUkZSd3I3d0h5bW1oM3RMQ05vZUFIM09ENDNmZ0pqR0RHUWc4MVBlb2gz?=
 =?utf-8?B?eDhhN1pGV0w2eUY5UmNWLzVmd0w1c2hDcUdselUzSW55N0VCQ0wxSDlMTFdK?=
 =?utf-8?B?UStHSUpCOVpPaDRxQU9JL2VnZ28yU3lrcndjVDlkMG9TTUUyN2kxMldGMXZ3?=
 =?utf-8?B?SmZWMGpFOXFHR3k5WWhpa29wSDA4emlrZEdqRDlXNkRnbkp1VkdJRnRRMVVP?=
 =?utf-8?B?UDh3Vy9yU1RjMFFmVGxLbVE0QlpHcHBaRllpVGtjajM5SllRMmI4MFJZLytI?=
 =?utf-8?B?WDlxRjYrbTNUR0VDUHlDUTNIb0F2THBuUlVVZWtpSGVtcUMrUWRiS0tyYXJx?=
 =?utf-8?B?L1M2aEdYdGh1NEI4V3lXTFZQT2RPUVlXL2ZoYjFrSkx1NWJGOTBqcHI4eVZR?=
 =?utf-8?B?QUUxb1dtamlycHJpUmNyQTRiZWxLc1g4RDB2bTY4WWEzODRXMnM5UCtmZkI3?=
 =?utf-8?B?RkppUW5xWGRnWFI5T1EyVFMzZlZKWm90RDU4eUh5V0ZldDU0Y3IrbkNxRTZN?=
 =?utf-8?Q?WEd5oOKw1lQ25fmgoUtTbdRNk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e0d417-a71e-4dce-740e-08dd62d4f29d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:48:10.3522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6P2r6txQW9sagnIUELKESSh7Kt5UZWUw1tbi9fvaWLB6oGI8hJ8KtOHpPJhivxYPOSclZxG1Ki3DfzsYNErN2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5765
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


On 3/12/2025 2:56 PM, Swati Sharma wrote:
> Formatting of test documentation in few KMS tests differs from
> the established pattern.
>
> 	/**
> 	 * TEST:
> 	 * Category:
> 	 * Description:
> 	 * Driver requirement:
> 	 * Mega feature:
> 	 *
> 	 * SUBTEST:
> 	 * Description:
> 	 */
>
> Also there is no need to duplicate documentation fields in subtests
> if Category/Driver requirement/Mega feature are same for subtest
> as for whole binary.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_fb_coherency.c    | 4 ++--
>   tests/intel/kms_fbcon_fbt.c       | 3 +--
>   tests/intel/kms_fence_pin_leak.c  | 4 ++--
>   tests/intel/kms_flip_tiling.c     | 4 ++--
>   tests/intel/kms_mmap_write_crc.c  | 4 ++--
>   tests/intel/kms_pipe_stress.c     | 3 ++-
>   tests/intel/kms_pm_dc.c           | 1 +
>   tests/intel/kms_pm_lpsp.c         | 2 +-
>   tests/intel/kms_psr_stress_test.c | 3 +++
>   tests/intel/kms_pwrite_crc.c      | 4 ++--
>   tests/kms_3d.c                    | 4 ++--
>   tests/kms_atomic_transition.c     | 3 +++
>   tests/kms_concurrent.c            | 4 ++--
>   tests/kms_dp_aux_dev.c            | 4 ++--
>   tests/kms_flip_event_leak.c       | 4 ++--
>   tests/kms_multipipe_modeset.c     | 4 ++--
>   tests/kms_sysfs_edid_timing.c     | 4 ++--
>   tests/kms_tv_load_detect.c        | 4 ++--
>   tests/testdisplay.c               | 4 ++--
>   19 files changed, 37 insertions(+), 30 deletions(-)
>
> diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
> index c5338568d..573037db1 100644
> --- a/tests/intel/kms_fb_coherency.c
> +++ b/tests/intel/kms_fb_coherency.c
> @@ -7,6 +7,8 @@
>    * TEST: kms_fb_coherency
>    * Category: Display
>    * Description: Exercise coherency of future scanout buffer objects
> + * Mega feature: General Display Features
> + * Driver requirement: i915, xe
>    */
>   
>   #include <errno.h>
> @@ -23,8 +25,6 @@
>    * Description: Use display controller CRC hardware to validate (non)coherency
>    *		of memset operations on future scanout buffer objects
>    *		mmapped with different mmap methods and different caching modes.
> - * Mega feature: General Display Features
> - * Driver requirement: i915, xe
>    */
>   
>   typedef struct {
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index 160f475f2..fedacec94 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -30,6 +30,7 @@
>    * Description: Test the relationship between fbcon and the frontbuffer tracking
>    *              infrastructure.
>    * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    */
>   
>   #include "igt.h"
> @@ -44,12 +45,10 @@
>    * SUBTEST: fbc
>    * Description: Test the relationship between fbcon and the frontbuffer tracking
>    *              infrastructure with fbc enabled.
> - * Mega feature: General Display Features
>    *
>    * SUBTEST: fbc-suspend
>    * Description: Suspend test to validate  the relationship between fbcon and the
>    *              frontbuffer tracking infrastructure with fbc enabled.
> - * Mega feature: General Display Features
>    *
>    * SUBTEST: psr
>    * Description: Test the relationship between fbcon and the frontbuffer tracking
> diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
> index ed064aba0..4c1ac2653 100644
> --- a/tests/intel/kms_fence_pin_leak.c
> +++ b/tests/intel/kms_fence_pin_leak.c
> @@ -26,6 +26,8 @@
>    * TEST: kms fence pin leak
>    * Category: Display
>    * Description: Exercises full ppgtt fence pin_count leak in the kernel.
> + * Driver requirement: i915
> + * Mega feature: General Display Features
>    */
>   
>   #include <errno.h>
> @@ -40,8 +42,6 @@
>   /**
>    * SUBTEST:
>    * Description: Along with the modeset, validate fence pin_count leakage.
> - * Driver requirement: i915
> - * Mega feature: General Display Features
>    */
>   
>   IGT_TEST_DESCRIPTION("Exercises full ppgtt fence pin_count leak in the "
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index 3880534a7..ff9ad1229 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -28,6 +28,8 @@
>    * TEST: kms flip tiling
>    * Category: Display
>    * Description: Test page flips and tiling scenarios
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    */
>   
>   #include <errno.h>
> @@ -40,8 +42,6 @@
>   /**
>    * SUBTEST: flip-change-tiling
>    * Description: Check pageflip between modifiers
> - * Driver requirement: i915, xe
> - * Mega feature: General Display Features
>    */
>   
>   IGT_TEST_DESCRIPTION("Test page flips and tiling scenarios");
> diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
> index 24b5c70f2..ddc5ed63e 100644
> --- a/tests/intel/kms_mmap_write_crc.c
> +++ b/tests/intel/kms_mmap_write_crc.c
> @@ -29,6 +29,8 @@
>    * Category: Display
>    * Description: Use the display CRC support to validate mmap write to an already
>    *              uncached future scanout buffer.
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    */
>   
>   #include <errno.h>
> @@ -48,8 +50,6 @@
>   /**
>    * SUBTEST: main
>    * Description: Tests that caching mode has become UC/WT and flushed using mmap write
> - * Driver requirement: i915, xe
> - * Mega feature: General Display Features
>    */
>   
>   IGT_TEST_DESCRIPTION(
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 5ac3ea7d2..296c93b58 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -21,10 +21,11 @@
>   #include "xe/xe_query.h"
>   /**
>    * TEST: kms pipe stress
> + * Category: Display
>    * Description: Stress test how gpu and cpu behaves if maximum amount of
>    *              planes, cpu and gpu utilization is achieved in order to reveal
>    *              possible bandwidth/watermark and similar problems.
> - * Category: Display
> + * Driver requirement: i915, xe
>    * Mega feature: General Display Features
>    *
>    * SUBTEST: stress-xrgb8888-untiled
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 50473321a..cdac469e4 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -27,6 +27,7 @@
>    * Category: Display
>    * Description: Tests to validate display power DC states.
>    * Driver requirement: i915, xe
> + * Mega feature: Display Power Management
>    */
>   
>   #include <errno.h>
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 7ebff1062..771dc4134 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -28,6 +28,7 @@
>    * TEST: kms pm lpsp
>    * Category: Display
>    * Description: These tests validates display Low Power Single Pipe configurations
> + * Driver requirement: i915, xe
>    * Mega feature: Display Power Management
>    */
>   
> @@ -43,7 +44,6 @@
>   /**
>    * SUBTEST: kms-lpsp
>    * Description: This test validates lpsp on all connected outputs on low power pipes
> - * Driver requirement: i915, xe
>    *
>    * SUBTEST: screens-disabled
>    * Description: This test validates lpsp while all crtc are disabled
> diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
> index 89dd377da..cc8155a75 100644
> --- a/tests/intel/kms_psr_stress_test.c
> +++ b/tests/intel/kms_psr_stress_test.c
> @@ -2,6 +2,9 @@
>   /**
>    * TEST: kms psr stress test
>    * Category: Display
> + * Description: This test mixes page flips and frontbuffer writes in primary and overlay
> + *              planes and expects that PSR stays active after each subtest without
> + *              any warnings or underruns.
>    * Driver requirement: i915, xe
>    * Mega feature: PSR
>    */
> diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
> index b40a423b1..981d7b38e 100644
> --- a/tests/intel/kms_pwrite_crc.c
> +++ b/tests/intel/kms_pwrite_crc.c
> @@ -26,6 +26,8 @@
>    * TEST: kms pwrite crc
>    * Category: Display
>    * Description: Test to validate pwrite buffer using the display CRC
> + * Driver requirement: i915
> + * Mega feature: General Display Features
>    */
>   
>   #include "igt.h"
> @@ -39,8 +41,6 @@
>    * SUBTEST:
>    * Description: Use the display CRC support to validate pwrite to an already
>    *              uncached future scanout buffer.
> - * Driver requirement: i915
> - * Mega feature: General Display Features
>    */
>   
>   IGT_TEST_DESCRIPTION(
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> index bdbf389b4..31242c5f5 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -26,6 +26,8 @@
>    * TEST: kms 3d
>    * Category: Display
>    * Description: Tests 3D mode setting.
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    */
>   
>   #include "igt.h"
> @@ -34,8 +36,6 @@
>   /**
>    * SUBTEST:
>    * Description: Tests 3D mode setting.
> - * Driver requirement: i915, xe
> - * Mega feature: General Display Features
>    */
>   
>   IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 0342af206..2b64424ce 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -24,6 +24,9 @@
>   /**
>    * TEST: kms atomic transition
>    * Category: Display
> + * Description: This is a stress test, to ensure that all combinations of
> + * 		atomic transitions work correctly. For i915/xe this will mainly be a
> + * 		stress test on watermark calculations.
>    * Driver requirement: i915, xe
>    * Mega feature: General Display Features
>    */
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 86e9eae67..4f16f8b89 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -27,6 +27,8 @@
>    * Category: Display
>    * Description: Test atomic mode setting concurrently with multiple planes and
>    *              screen resolution
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    */
>   
>   #include "igt.h"
> @@ -36,8 +38,6 @@
>    * SUBTEST: multi-plane-atomic-lowres
>    * Description: Test atomic mode setting concurrently with multiple planes and
>    *              screen resolution.
> - * Driver requirement: i915, xe
> - * Mega feature: General Display Features
>    */
>   
>   IGT_TEST_DESCRIPTION("Test atomic mode setting concurrently with multiple planes and screen resolution");
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index 24cfdcb68..e74902111 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -26,6 +26,8 @@
>    * TEST: kms dp aux dev
>    * Category: Display
>    * Description: Test that /dev/drm_dp_aux reads work
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    */
>   
>   #include "config.h"
> @@ -41,8 +43,6 @@
>   /**
>    * SUBTEST:
>    * Description: Test that /dev/drm_dp_aux reads work
> - * Driver requirement: i915, xe
> - * Mega feature: General Display Features
>    */
>   
>   IGT_TEST_DESCRIPTION("Test that /dev/drm_dp_aux reads work");
> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
> index 56d5128b8..71b58b4df 100644
> --- a/tests/kms_flip_event_leak.c
> +++ b/tests/kms_flip_event_leak.c
> @@ -26,6 +26,8 @@
>    * TEST: kms flip event leak
>    * Category: Display
>    * Description: Test to validate flip event leak
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    */
>   
>   #include "igt.h"
> @@ -43,8 +45,6 @@
>    *              page flip event when the fd is closed before the flip has
>    *              completed. The test itself won't fail even if the kernel leaks
>    *              the event, but the resulting dmesg WARN will indicate a failure.
> - * Driver requirement: i915, xe
> - * Mega feature: General Display Features
>    */
>   
>   typedef struct {
> diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
> index 84c2c58f8..69dc62e38 100644
> --- a/tests/kms_multipipe_modeset.c
> +++ b/tests/kms_multipipe_modeset.c
> @@ -28,6 +28,8 @@
>    * TEST: kms multipipe modeset
>    * Category: Display
>    * Description: Test simultaneous modeset on all the supported pipes
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    */
>   
>   #include "igt.h"
> @@ -36,8 +38,6 @@
>    * SUBTEST: basic-max-pipe-crc-check
>    * Description: Verify if simultaneous modesets on all the supported pipes is
>    *              successful. Validate using CRC verification
> - * Driver requirement: i915, xe
> - * Mega feature: General Display Features
>    */
>   
>   IGT_TEST_DESCRIPTION("Test simultaneous modeset on all the supported pipes");
> diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
> index b77ebc3d6..bb900d709 100644
> --- a/tests/kms_sysfs_edid_timing.c
> +++ b/tests/kms_sysfs_edid_timing.c
> @@ -25,6 +25,8 @@
>    * TEST: kms sysfs edid timing
>    * Category: Display
>    * Description: Test to check the time it takes to reprobe each connector.
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    */
>   
>   #include "igt.h"
> @@ -41,8 +43,6 @@
>    *              if the mean time it takes to reprobe one connector is too long.
>    *              Additionally, make sure that the mean time for all connectors is
>    *              not too long.
> - * Driver requirement: i915, xe
> - * Mega feature: General Display Features
>    */
>   
>   #define THRESHOLD_PER_CONNECTOR		150
> diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
> index a6dbb8823..03d0729ae 100644
> --- a/tests/kms_tv_load_detect.c
> +++ b/tests/kms_tv_load_detect.c
> @@ -26,6 +26,8 @@
>    * TEST: kms tv load detect
>    * Category: Display
>    * Description: Test to check tv load detection.
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    */
>   
>   #include "igt.h"
> @@ -33,8 +35,6 @@
>   /**
>    * SUBTEST: load-detect
>    * Description: Check tv load detection works correctly.
> - * Driver requirement: i915, xe
> - * Mega feature: General Display Features
>    */
>   
>   IGT_TEST_DESCRIPTION("Check tv load detection works correctly.");
> diff --git a/tests/testdisplay.c b/tests/testdisplay.c
> index d498eb04c..5131750ce 100644
> --- a/tests/testdisplay.c
> +++ b/tests/testdisplay.c
> @@ -50,6 +50,8 @@
>    * TEST: testdisplay
>    * Category: Display
>    * Description: Tests basic display functionality.
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    */
>   
>   #include "config.h"
> @@ -80,8 +82,6 @@
>    * SUBTEST:
>    * Description: This test is intended for testing of display functionality like
>    *              modeset, clone modes, test patterns & pixel generators etc..
> - * Driver requirement: i915, xe
> - * Mega feature: General Display Features
>    */
>   
>   IGT_TEST_DESCRIPTION("Tests basic display functionality.");
