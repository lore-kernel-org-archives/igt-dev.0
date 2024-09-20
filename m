Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DF2CF58CB
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 05:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CD910E2D6;
	Fri, 20 Sep 2024 05:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHP8QFFj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FC010E2D6
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 05:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726809040; x=1758345040;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yeJ7VcAxrMpxKNMhpHDKyjiOmRkyWgtHpg5TDV2PiJY=;
 b=YHP8QFFjNbk4ahrJ0Lrg579ETYQlFI6LLZ2XYqTpMKLf2+NeL8PjJSd6
 jw/1LfHdvxwBosrkltjLO/gKidpChe4cqynjjexH35JHRDTUbPVtHR5QB
 tx1OfarjCYHIpeyv6tgtJSlGMAQ636b6impISrt/0mBVx9OiO4WSLkrj7
 VCY29lQfVM0iXlY3Y8WOeI5V47OVVKvwSa9fBnBpkAO/mHxX41tu2EpMz
 wkG5Kd/FHg8VK9QEK0qlxmmepaqEc59PIV/26Qwb3w3e5z5+VE/oVf4wy
 BHAqR+fb29rsgEUJ1NS8ITuY7TS++YtnAjLGFeKkRA4eYUzX1Kks+4byd g==;
X-CSE-ConnectionGUID: vPnW4O5YRxq6cs5V6U8nCA==
X-CSE-MsgGUID: OZRzv4r6TVSL8Npc/j2mWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25324842"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25324842"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 22:10:39 -0700
X-CSE-ConnectionGUID: xvfAQ3b5QgKbfV8A5sE/fA==
X-CSE-MsgGUID: Wa3fSTuAR/GW3VIf74V6vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="75133904"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 22:10:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 22:10:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 22:10:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 22:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvTJcABHa1RLO2thTkdMGJASSJmxwlCRF+ycOGu/h2nAN+mPisw7UgwsybuOvX8knCRlsipTiTU0aHvZPlgZUgf5xPt9wGTtlVQbPT469cQeDSxk2VRU3xIy7CqAzLkSqxKmSiRyj55c5JR8+GXlgQPUQZnzNV3QOWvBys/PwLkh7fVN+zrq69oumUtrMeBXcDIb72qT6+MLH0SR35zv82zPEqHaNB6BHFK217Utc7CU2pmxcR/RyiA+FI7MYsJKSXvDvT6404gMRzDJYxiy173JArJQ4YX26xXX/dCTRABXgGGyILfmwslx4mY858uR8Dwb30QuldUtp2yb2bOVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4Zy2SvLopOqPIupiTynURV0IEZs4Zn4gn4pBOfF5xs=;
 b=W2Zql79HX8pmcclFO2JSA7vlo20nmjhjQJIuxw29gnheGeltXv21Rcd6Fr1SWDhvTudMn0M1d09h+su9eQFjRbqUtikB3egqwCI5xLOnrQNOUFcjJHY9BEwBLFwAFkuwUiLHKWL558ju9EnFzZmPVOsreVeFUDiCUMGvrfDvErkjWGC0rSYaNKHv7Zf7Z0UYmnkZSRAB5R5VzTNfOjHcK9Ya+S7XIq/B2vf5v11l87U7QzX46NmW90hIG0/X9MeRYT2+FvzfoCxru7A4eh33S8Lf9ZzwIWuAhHbpHmQr71PhZFC+5L4NtoseCuFPRTa6v1RCZwhv10x5ntsmh6hi6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM4PR11MB6192.namprd11.prod.outlook.com (2603:10b6:8:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 05:10:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.7982.016; Fri, 20 Sep 2024
 05:10:35 +0000
Message-ID: <f05b3cbe-c596-4cf8-a289-9cc3f5b24f0c@intel.com>
Date: Fri, 20 Sep 2024 10:40:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_async_flips: subtests to validate
 async flips on atomic path
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <vandita.kulkarni@intel.com>
References: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
 <20240827061111.472460-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20240827061111.472460-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM4PR11MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 325c20eb-d936-4f6e-1f09-08dcd9328ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bldjaUIrTGpUL0FCanZmS01Ya3kwR3ZNSzhYWFcvUGVVamJlLytCS2RqcXps?=
 =?utf-8?B?ME94MktzajQrOXFtZUVjV09SWlk1dDZoYUNLT08yRktjajhWTlhJc0dwSy9P?=
 =?utf-8?B?VG9Xd3BrbmNrL3JDeGpHamV4Qm5XNnNpWmJaR0lkbGtNY051aElKQWVrdnJv?=
 =?utf-8?B?aHZuY3NsWEx5ZjR3bWFGNklJS2drOU1TNm15UmZ4VDVtMWQvcVpwYld1YitP?=
 =?utf-8?B?TEFjdXkzaTNiQXdxeFlYMW1MekFBV1ovSHlBTno4WEVZR3BRZStuV0p5S3hH?=
 =?utf-8?B?SHlOb1N4RFVOZUorTkpFTG9VRjB4cSt5RmJUTEIyQW5Hdm5oTnJWYUFwY1c0?=
 =?utf-8?B?Tjk0emI5YnozZDhza1JxSE1nMHoxdEE5cmI3bDNVc1BaWm1RK1loQzdFQThN?=
 =?utf-8?B?M2RDNENacTVCM2pIMmZ2UzFnNGJSY3V4WHRPUHhOMERIZGNnRlVnQXpITDlp?=
 =?utf-8?B?aFE1OHgwUjNRVVBYTWpZR1N5VXVHWnV6djM0eWVPdzBXa2VTS1FPVGM2YjlD?=
 =?utf-8?B?WktOckhhMjJLcDZLZ3lQajVkcm4wK0tlUmpxS3B4Z1FQLy90STd1NitlUmlw?=
 =?utf-8?B?NHdZWnhkU0NFUFJxMlV6aUs3aE5pTEwyQ29mcEdpNzE0cGh1YWQ2UVdZdnNZ?=
 =?utf-8?B?dnFaRzV2WTJnbnU4UFNVVFJEZnRxNVdkdEticWtSUlh5TXEycGlESzNrYmtE?=
 =?utf-8?B?QW9LZzFpVG1kdzBQZE9pT0V6MnNPYy84VUp3K2pKeWNlUG56SFFvVCs0RUpw?=
 =?utf-8?B?Y29pMnFaWnFUOVY4ckRHdWdNcWZPbVlwVm5XanJBRkxmb0JHMGxsQ01oM29C?=
 =?utf-8?B?dTBvM3JWYXFOWk81NFdLb3N3WWYxT1VQcDVuOXh3OXl6UzkrbW9hRXdSSlZs?=
 =?utf-8?B?czYvdktXOVdFeWpnbHc3cTZHSXJlMklMbDFBTjJPWjg3cjRNRWhPT2NPb2RJ?=
 =?utf-8?B?dytkTWJ0UEFqR003bjhxb0dwb0hSM2dic0ZVSWFrZkVLaWN6bGptTUV6WFhW?=
 =?utf-8?B?Mmk3bDlXTEc5WmFUK1hENXQ2NG5rZzFJMU9Jd1NmVGdQcU9KWUFVK2FqRThh?=
 =?utf-8?B?RDRpbHBWQnQraWZjd3Rna1psTVgyTVJHSkZ4ZjJUYWtEQjZZOEs3SWN1SUlj?=
 =?utf-8?B?MSt5QUwzSXBleE9TWThZWmhUb09YWUxJVmZsTkw1WVorYkpjNFlHL3NIYm43?=
 =?utf-8?B?L1hacHUrclRCUVlwQlJFYWNrangxRTl0djg2ZmMvOWsxY2d2MUNydm1meFo0?=
 =?utf-8?B?emFDeERvUWJmdldKdW9vZ000Tm9yRTRJVWJnMWRmd3dDNXBCZmpsejc2a2s3?=
 =?utf-8?B?UVVBUkhXL0l4S01sbWtvTjU1SEtrUk11VDNNN2VZQ3RZS1VvdDhQQlUrbjkw?=
 =?utf-8?B?bW9MSWJRa2lOSFBqU0Q3dlN6OXhibmg5aHlFejhPcmN5T08xekN1U1R3Smsr?=
 =?utf-8?B?UjVtQlJXRlBjNU03OWxFeTV4U2cyaS9kejRINitJWGdEWTdFWDZ5Q1N0MjV1?=
 =?utf-8?B?a25UcUdjVWlSckphUnJXVnUvZnIxMkFBV3g2T0NqSjZQdWFQRGtkZ3dQWjJQ?=
 =?utf-8?B?enhzRXdxZy9tS2c4VG9aanUvbDB5blpmYTJXSG1aRktjemw5Y0hxVlZrdnA1?=
 =?utf-8?B?VzlXczN4S2s4OEh1aE0xM1E3dHpaVjlQOG5GTEhMQnpkdkVjSkE5MXZROFly?=
 =?utf-8?B?MS9mRCtOcGdOeFlteEJIeWVuMjhrUldhcGtaU0lNUzcwWVdDRW53TEVvTEcw?=
 =?utf-8?B?RXdTZ0ZKVDc3dTRVcEhlU2RWQzBQZFZYVjN3TTBEanphU1BjT3RJV1NabHFV?=
 =?utf-8?B?TU5sVFdxSHp3VGRheHZjUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2VGRDFSZE9nSXg1QjQ0dDU0VFpkRXhsSXY1bUZ4Tm5XbThaMVllRUtQdTBw?=
 =?utf-8?B?QjNDN29lQWxiWlM1OGptMkZnS2NrblQyYUpLcVlrSGorRTMwNEY5T3p4UXZm?=
 =?utf-8?B?OWN4U1cyT2tQSFp3QlpIVUNYaXdIbkdSNEdBdFBqcWdRRUZmK0Vjd1pRQkd0?=
 =?utf-8?B?WFM4WlZTOFYxZVpEZ1hWODRjR3oxUmxnamdPdEhJQ25RN3phcnA5bnVscUVp?=
 =?utf-8?B?UGZPNngwRzdLTUJYVGwvMHlzVUs4MGhDYmlxVFJIQ2J2RUtyaWpHK2wxQkh0?=
 =?utf-8?B?REhUMHl0aENKanhPMDhUT2NzT1BQb2pVWlVxenhkZGpRQjBPb2hKQWpaU0hC?=
 =?utf-8?B?MHlITTRnK1JJa08wSXp5TlJHa3JKc2x1ZVlUeDJtbjV4WUYzMlk0djhSbXA5?=
 =?utf-8?B?S0JHVzIxWVNMcWVkSDNad0NUK1Q0T1JCUkdZa2RnV2o2YnZ3Z1FqTjBlMGgz?=
 =?utf-8?B?Mzc3ZFl0akVGdDZ6c0h0L1FNWG8raXpBK1c2ZC9yZ21XbWhEK2NKOHVyVGV4?=
 =?utf-8?B?MDZVazQweWlWTkcxcXpQZHBqOU9WbUtvNzBXOWp1QzdOK3JZQmsvYjE4a3Z0?=
 =?utf-8?B?d0QzdENFT2doeFNMVnFpdFVaUWJZU3QyOXZ1Zmc2dGJZVXFEbXdrTGZaaElC?=
 =?utf-8?B?NktRN1FxVjJBTSsvaFQ3YmVZeXJ5QXdpdFJVRnhnQ0FmcXUwWExEQW1aeVVZ?=
 =?utf-8?B?OS9pU05hcFh1eDh2SDkwM2dKYmdBMkpmT1BjajVhSFMzMmRXYzlURmNoV0Ru?=
 =?utf-8?B?d2h3K2VqTHloT0VMeWo2MDhKaFpUQlBJdmVXaVk1OThzRkZWUTVwT0g1aDF5?=
 =?utf-8?B?UHNGNTl6YlVnWklYRTgycG4zcXIxQU55aGtZcHo5U3ZkcjBFNjJSM3J6eVhU?=
 =?utf-8?B?dURhcU4vd0V6VzVIZlJvbzRTRnpzNjJKbnFZVWtHSkQxOWRLZTB1TDJGenIz?=
 =?utf-8?B?Tnl4aFNPWjIwczFwWnVOT2JvcHJldTJDREZHMXduQjRqTnlMRUttZWU4U0NH?=
 =?utf-8?B?U2MrS2lsZ3lyNVJDM1E4R05DNG53dGc2d1ZKSUdMK1BiY0Jwd1lsQ1krdDlB?=
 =?utf-8?B?YnFXT2EyMFlsVmVGNXZsYXFpeVRNYXI4dC9wUDNYSmM1bGhlV0UvdWplYjJX?=
 =?utf-8?B?S0tmQ0dBRlZnWTIvbTZseDJ5RE1hcGtNazQrbDVPVGx3emJYZWNRcnlNcDZT?=
 =?utf-8?B?KzJuS0FmN2ptbEF5anBWempIeXMzZzJ5RkNlT3hiWFltOHVTRmdoMktIZDZj?=
 =?utf-8?B?bEN3TWdmVGNMamgya2h3OXpldlREdHRMZlk5YldiL1loYzJvbW1ya3Q3TXA4?=
 =?utf-8?B?eXJ3eVhkdXZaRkFNU2w0TUQ0eXp4aFhWSVdackZEV1N6NnRBQ2pCTHg1K0VQ?=
 =?utf-8?B?dUllZndHUndwcnQ1K0FGdk1YNndqNGd0dVVHRTkzME1OQnJwRDVNN0FIMUty?=
 =?utf-8?B?WnFlbnRoWXBHbzFjSnp5SC91SytUNFU3eXAySVo1WTJLbEtoVC9tWjZCYWtx?=
 =?utf-8?B?SzNCLzhVZlJaNzhtYUhBckd0a2FlZ2ptMjdIc1U0Y0JCNnZPa0NCbGpseGtH?=
 =?utf-8?B?dmRQdHU0WlAyWHBjMTN3NGx5VCtaajgyWThJVDAwZEtYSTdidzRyQk9XNktl?=
 =?utf-8?B?VFBmcnZKMVpIK3hzb2MxYnR1OWc5LzFPNnRjNGhGYWtUdFNlQlhQTVAwaW5F?=
 =?utf-8?B?L2pvbzBOKzlTSG5BOXBaTHEyV2JpZlMxT01FeHdxQzB6eERRYkpJb2xUY3F1?=
 =?utf-8?B?ZU9LZTZ5Nk5NTnpIL05vMnY5NVFydkJuRDdPb3pabmEzeGJ0bmE0QWVwM09C?=
 =?utf-8?B?WkR3QUpVclRIM2tYekdlTGp6TEF2akhQZkNDYnBRNC9qenV3eFJmQXE0amt6?=
 =?utf-8?B?NGNEQzBZM041MmovY2ZPNlQzdTZjL1liWEJrOGR4K3hxTDVpMTgxL2xiaERD?=
 =?utf-8?B?MG81TmVJM3ZycnJUWFRMTGZ2UE1iV1A2c3JiSW5BT2g4dEtaL1FJdi9NazhF?=
 =?utf-8?B?RHdsSzRzSDhaRkg2SVcwYnV6eGxYSFdqNHdnWkl4aGtMY3lITGcvTm5JTm01?=
 =?utf-8?B?V2w1TWszblA3SmJEL21NdGQwVE5lOXZKNGdwVXh6ZExNYnNLM3dXdGRGSnUx?=
 =?utf-8?Q?amwsJfKTxDH9GKbmnBP1O134V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 325c20eb-d936-4f6e-1f09-08dcd9328ed5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 05:10:35.1387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5tJJQDHkOstowupyoMmfA6SZMie0Ei8gtN17fpwFxVT3XxuRXRan46R5wg20yihNNfrAMsvApgwFykZVqUKgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6192
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


On 8/27/2024 11:41 AM, Santhosh Reddy Guddati wrote:
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 154 ++++++++++++++++++++++++++++++++++++----
>   1 file changed, 141 insertions(+), 13 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5b70c4033..21cf0d302 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -66,6 +66,25 @@
>    *
>    * SUBTEST: invalid-async-flip
>    * Description: Negative case to verify if changes in fb are rejected from kernel as expected
> + *
> + * SUBTEST: alternate-sync-async-flip-atomic
> + * Description: Verify the async flip functionality and the fps during async flips using atomic path
> + *
> + * SUBTEST: async-flip-with-page-flip-events-atomic
> + * Description: Wait for page flip events in between successive asynchronous flips using atomic path
> + *
> + * SUBTEST: test-time-stamp-atomic
> + * Description: Verify that the async flip timestamp does not coincide with either previous or next vblank
> + * 				when async flip is done using atomic path
> + *
> + * SUBTEST: test-cursor-atomic
> + * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip with atomic commit
> + *
> + * SUBTEST: invalid-async-flip-atomic
> + * Description: Negative case to verify if changes in fb are rejected from kernel as expected when async flip is done using atomic path
> + *
> + * SUBTEST: crc-atomic
> + * Description: Use CRC to verify async flip scans out the correct framebuffer with atomic commit
>    */
>   
>   #define CURSOR_POS 128
> @@ -101,6 +120,7 @@ typedef struct {
>   	bool alternate_sync_async;
>   	bool allow_fail;
>   	struct buf_ops *bops;
> +	bool atomic_path;
>   } data_t;
>   
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -271,9 +291,14 @@ static void test_async_flip(data_t *data)
>   		if (data->alternate_sync_async) {
>   			flags &= ~DRM_MODE_PAGE_FLIP_ASYNC;
>   
> -			ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> +			if (!data->atomic_path) {
> +				ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>   					      data->bufs[frame % NUM_FBS].fb_id,
>   					      flags, data);
> +			} else {
> +				igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
> +				ret = igt_display_try_commit_atomic(&data->display, flags, data);
> +			}

Hi Santhosh,

Could we have this piece of code in a separate function as it is called 
in multiple places?

>   
>   			igt_assert_eq(ret, 0);
>   
> @@ -282,19 +307,30 @@ static void test_async_flip(data_t *data)
>   			flags |= DRM_MODE_PAGE_FLIP_ASYNC;
>   
>   			if (async_flip_needs_extra_frame(data)) {
> -				ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> +				if (!data->atomic_path) {
> +					ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>   						      data->bufs[frame % NUM_FBS].fb_id,
>   						      flags, data);
> -
> +				} else {
> +					igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
> +					ret = igt_display_try_commit_atomic(&data->display, flags, data);
> +				}
>   				igt_assert_eq(ret, 0);
>   
>   				wait_flip_event(data);
>   			}
>   		}
>   
> -		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> +		if (!data->atomic_path) {
> +			ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>   				      data->bufs[frame % NUM_FBS].fb_id,
>   				      flags, data);
> +		} else {
> +			igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
> +			ret = igt_display_try_commit_atomic(&data->display, flags, data);
> +			igt_skip_on(ret == -EINVAL);
> +		}
> +
>   		if (frame == 1 && data->allow_fail)
>   			igt_skip_on(ret == -EINVAL);
>   		else
> @@ -419,9 +455,14 @@ static void test_cursor(data_t *data)
>   
>   	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_CURSOR, &cur);
>   
> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -			      data->bufs[0].fb_id,
> -			      flags, data);
> +	if (!data->atomic_path) {
> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> +				      data->bufs[0].fb_id,
> +				      flags, data);
> +	} else {
> +		igt_plane_set_fb(data->plane, &data->bufs[0]);
> +		ret = igt_display_try_commit_atomic(&data->display, flags, data);
> +	}
>   
>   	igt_assert_eq(ret, 0);
>   
> @@ -457,14 +498,24 @@ static void test_invalid(data_t *data)
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	/* first async flip is expected to allow modifier changes */
> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id,
> -			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> +	if(!data->atomic_path) {
> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id,
> +				      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> +	} else {
> +		igt_plane_set_fb(data->plane, &fb[1]);
> +		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_ASYNC, data);
> +	}
>   	igt_assert_eq(ret, 0);
>   	wait_flip_event(data);
>   
>   	/* subsequent async flips should reject modifier changes */
> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id,
> -			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> +	if(!data->atomic_path) {
> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id,
> +				      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> +	} else {
> +		igt_plane_set_fb(data->plane, &fb[0]);
> +		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_ASYNC, data);
> +	}
>   	igt_assert(ret == -EINVAL);
>   
>   	/* TODO: Add verification for changes in stride, pixel format */
> @@ -611,8 +662,26 @@ static void test_crc(data_t *data)
>   		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
>   
>   		data->flip_pending = true;
> -		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
> -				      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> +
> +		if (!data->atomic_path) {
> +			ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
> +					      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> +		} else {
> +			 // TODO: Check if the first frame modeset is required.
> +			 // Atomic commit is failing with invalid parameter when async flip with atomic is done
> +			 // for crc test. So, skipping the first frame modeset.
> +			if (data->frame_count == 0) {
Could we wove this first commit outside of the while loop, as we only 
need this once and doesn't need to be checked everytime.
> +				igt_plane_set_fb(data->plane, &data->bufs[frame]);
> +				igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET , data);
> +				data->frame_count++;
> +				continue;
> +			} else {
> +				igt_plane_set_fb(data->plane, &data->bufs[frame]);
> +				ret = igt_display_try_commit_atomic(&data->display,
> +						DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> +			}
> +		}
> +
>   		igt_assert_eq(ret, 0);
>   
>   		wait_events_crc(data);
> @@ -705,15 +774,38 @@ igt_main
>   				run_test(&data, test_async_flip);
>   		}
>   
> +		igt_describe("Wait for page flip events in between successive asynchronous flips using atomic path");
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
> +			data.alternate_sync_async = false;
> +			data.atomic_path = true;
> +			if (is_intel_device(data.drm_fd))
> +				run_test_with_modifiers(&data, test_async_flip);
> +			else
> +				run_test(&data, test_async_flip);
> +		}
> +
>   		igt_describe("Alternate between sync and async flips");
>   		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>   			data.alternate_sync_async = true;
>   			run_test(&data, test_async_flip);
>   		}
>   
> +		igt_describe("Alternate between sync and async flips using atomic path");
> +		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
> +			data.alternate_sync_async = true;
> +			data.atomic_path = true;

Please check if the atomic_path variable needs to be reset for legacy tests?

Thanks,
Karthik.B.S
> +			run_test(&data, test_async_flip);
> +		}
> +
>   		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
>   		igt_subtest_with_dynamic("test-time-stamp")
>   			run_test(&data, test_timestamp);
> +
> +		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank with atomic path");
> +		igt_subtest_with_dynamic("test-time-stamp-atomic") {
> +			data.atomic_path = true;
> +			run_test(&data, test_timestamp);
> +		}
>   	}
>   
>   	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
> @@ -730,6 +822,20 @@ igt_main
>   		run_test(&data, test_cursor);
>   	}
>   
> +	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip with atomic commit");
> +	igt_subtest_with_dynamic("test-cursor-atomic") {
> +		/*
> +		 * Intel's PSR2 selective fetch adds other planes to state when
> +		 * necessary, causing the async flip to fail because async flip is not
> +		 * supported in cursor plane.
> +		 */
> +		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
> +			      "PSR2 sel fetch causes cursor to be added to primary plane " \
> +			      "pages flips and async flip is not supported in cursor\n");
> +		data.atomic_path = true;
> +		run_test(&data, test_cursor);
> +	}
> +
>   	igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
>   	igt_subtest_with_dynamic("invalid-async-flip") {
>   		/* TODO: support more vendors */
> @@ -742,6 +848,19 @@ igt_main
>   		run_test(&data, test_invalid);
>   	}
>   
> +	igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected when async flip is done using atomic path");
> +	igt_subtest_with_dynamic("invalid-async-flip-atomic") {
> +		data.atomic_path = true;
> +		/* TODO: support more vendors */
> +		igt_require(is_intel_device(data.drm_fd));
> +		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> +						       I915_FORMAT_MOD_X_TILED));
> +		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> +						       I915_FORMAT_MOD_Y_TILED));
> +
> +		run_test(&data, test_invalid);
> +	}
> +
>   	igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
>   	igt_subtest_with_dynamic("crc") {
>   		/* Devices without CRC can't run this test */
> @@ -750,6 +869,15 @@ igt_main
>   		run_test(&data, test_crc);
>   	}
>   
> +	igt_describe("Use CRC to verify async flip scans out the correct framebuffer with atomic commit");
> +	igt_subtest_with_dynamic("crc-atomic") {
> +		/* Devices without CRC can't run this test */
> +		igt_require_pipe_crc(data.drm_fd);
> +
> +		data.atomic_path = true;
> +		run_test(&data, test_crc);
> +	}
> +
>   	igt_fixture {
>   		for (i = 0; i < NUM_FBS; i++)
>   			igt_remove_fb(data.drm_fd, &data.bufs[i]);
