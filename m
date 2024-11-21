Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF416D6ED0E
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8019010E3FB;
	Thu, 21 Nov 2024 12:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myh1Re1C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD2110E3FB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732190652; x=1763726652;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0uTsae6PA14AJYT7FAXD0xyDtJYvRqupT1KOOehePMc=;
 b=myh1Re1C+64j5ZAQZdBBEv4nXbQBGVBZqyFdDn8IoX99KoyU6Az9/ouJ
 x69KP7lbPi2r2D6s3aDkIr3SiTPDTxw+5k0EVwMcydE5JiQiEDL1IPEOU
 yNUJWM5IX2AG1WttYPUaxRr54KV4NXrZL70zxvL34AcNRopXIZ/KYuEoZ
 +g1PPDsm+sVyw7byCK0UMW/Bwfc8XC0PIOzShN2H4VpPfvLnFu2Fx7vZ5
 JFtjlPkm8xKVfRu+R89978cEgmiw8YgRLPGcQRrPa6E4huIKUYZhXyMSy
 leF/QqFMA7bYXb4ttutJULHClaEi7sYNsTgoc8GtLSzGxW5sRxd9cg5q5 Q==;
X-CSE-ConnectionGUID: NBhv70juSXO1wiMN6Xh4nw==
X-CSE-MsgGUID: qXuqj8eaQ6e8HbMnkaKBwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42941458"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="42941458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:04:12 -0800
X-CSE-ConnectionGUID: 8bnd/d8bRGSeTPaggoSkAg==
X-CSE-MsgGUID: 7FmeeSAgSjOHWxl2xzzfqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="95038329"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 04:04:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 04:04:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 04:04:11 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 04:04:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpWNxbdg5Yd/iO7JZmbL5XqJ3OP6XBj209qS/LybWpXExxVLLXlvKAACo805UXqCdBZ2D/Wa1Pb4UYm2OctFzADg2Gc5fsgmvMuYvfa3inr71h/pmhPjuGaZp4gl1Mk6s0uGRYr+UsuNpVGtf6qNmRpyMO0zfQOUpAGQbxZoHTBYBnoJXdwCLG7L7ZKNEpq0WFmyq/9PL6G/deuIe//eHcotY9gRNjwfqE6wrQRuruGGNrKDDt7QmqTc+CBFjBD1+WCW8JRKdGtwH4Wgt3+piDdDypGm5H6doUXKuouGLfKpmirghzhVkHY2yPH8mNN1mbskN9yjwWrxNCx/F0rz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPh+zKrY7ZIloHgu4zKddvOmh11BRx67aiYreNyiUlk=;
 b=lczi+wI6Pft6YeQ6jnDE5Y//pKZ6GGHhSPBQEWo/YJ5MovcgJdMVglxEdmrNb+vUIKvn6dDGKNXv3stIKQ1cM4oX1d3niuSVu7q0EEtAo48DBPTL6IBzAMGmw1zukjDD/la5Y8kYYEpIZgNSDtJRFuqaC7VpFoeEpbBaUD3HKTmdIkOsGdxaCpx3WOGNV2HIPl28Sw4NyxPYUwMys/efvZG/uO+1D5KTJfrSmmrN2vgk55X6RVcW4LawEKz9Y6+p9ALGT8Ko4gicEqT1qk3NVDaP9obnYOxnUFpDIRPtLr+mmn75sMx3k7QJegia3/YZVVOoFgw+ARwNB9sWXKFH7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 12:04:06 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 12:04:06 +0000
Message-ID: <baab4845-d504-466d-b46c-833ad33eb7d9@intel.com>
Date: Thu, 21 Nov 2024 14:02:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] lib/gpgpu_shader: Add causing a read pagefault
 from the eu thread
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jonathan.cavitt@intel.com>, <mika.kuoppala@intel.com>,
 <dominik.grzegorzek@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-3-gwan-gyeong.mun@intel.com>
 <8e9181aa-1fe6-49c5-bd10-95e89db8754c@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <8e9181aa-1fe6-49c5-bd10-95e89db8754c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::7) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b9fd0f-4344-47dd-b72b-08dd0a2498ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWlib1BhclZxNjBIZExuZHh5LzFNQmYrVkF5Tk5udnY1SDZKR0NFbTRrUmhM?=
 =?utf-8?B?LzVvcy9UY0hIQ3pNaGZiZUhKdGtBWFFWMnNNZmRZbU9CWmw4TTNLZ0hyTGpz?=
 =?utf-8?B?UXIzc1l5QU5QVHllb2ZKWU1MU0VwaGFSZVZ5M1lFNUZDcmpIekUyaWgxaGJw?=
 =?utf-8?B?TjhhaWVxa2RMWmRwVkwrdzdkV2ZPZlBldnZvQWFqOEhiVm40Z3VzcnI2aE5r?=
 =?utf-8?B?WHJjUGRNdHBTL3NLOVN3a28zNldJZTRLRkVRMTI3TTdKeGNsYTI1YnZUTUZ0?=
 =?utf-8?B?T01PWDJ3L1JFWG13VFhhMW0vQ2lGUUduL0F3RjJ6d29uVVBvbnZJWVhyR3hs?=
 =?utf-8?B?bnV0UWhJcURoMTdqMEpGVHlMK1VScFgrd2trdUJMTWxiL1lyMXYzV29IbmpI?=
 =?utf-8?B?elNNSjF3NEw0VkJtNWt3b2t4eGZGUGlZZmdOaXdjcWJpSWQ5cTFOU1Y3UEF1?=
 =?utf-8?B?QTFRM0dveUY5YSs3aHBUbkk5VXR6cTZJZzhiMCtzNnBMbnlMOXA1V2dFbXhF?=
 =?utf-8?B?QkJxa1QyNGdJbkNZUXhiQWNZTG5nU1FDL2NUZjQrVmM2LzFYU0N5T1NPa28y?=
 =?utf-8?B?ZkUzQUk4N2RQYTV0aU9SV0xLVnVlY09MMHFKVURRQmM0cEs5Q1h3QkcrM3Y3?=
 =?utf-8?B?dEtTTnl3UXJDNDNHRlZXUVNxQUFZZTB5OEdBcGhDTXl2Uy8veUxTanN0SXN3?=
 =?utf-8?B?cnF0K3prYkhFZzJXaGxCVlk5NlJmNFV4NklMK3cxTjNvSm9yK3hHOWUxR3pl?=
 =?utf-8?B?b1dTN0FTODNnbHM5UW1HTElFM2FXMFNLQnJUcVpPSkNCN01wUnZlZ2JxMnp4?=
 =?utf-8?B?T1UzY3ljS2laVTcrODhmYnBoSnpBQTZKYm1ON21Qb3N3MngvemtGT0lWUnlP?=
 =?utf-8?B?TnZMcWVhK2RKZk1jN0VKbjdIamdVdTduK2lFVzE0ZkI0MTNVZUg5eGVvZlRk?=
 =?utf-8?B?K3grd0pTWVpoSGtETnlBbDBPa1RBWlUyY1ViM3pZM2I0TkRRQ3hHaHNZaW16?=
 =?utf-8?B?UGVVUDZKMlRzN1BxbmhBbGQ3SUNrMnp5N1B6QzhzSDhOb3J1VDhNc083b0xj?=
 =?utf-8?B?TkwwQm9LRml4QndMZ01qMzc4ZTZpMW5Qak1wR1orYTUwcHVkYzBRbHo4TEsw?=
 =?utf-8?B?dWRiV1prQ2QzTTd3aWpVeDBsclB6UjV5OTd3VEZoNUticXFQN21zQWFIQ3hm?=
 =?utf-8?B?SXNlNEF4QmlGeGJVdnhKcTlxcFAzTjVpemN3aDRZTzB3RjI5YkV5LzZCNGRh?=
 =?utf-8?B?akVjQ2Z2SHphOXVRSUYzUGxUam5mT3puZzVwV1lQZFM3djFBV0ZBaHlxY1hq?=
 =?utf-8?B?U2JvbTZ4eFRnc09oVWQycDlDZkpub2dIYklFd2FNMzB6WXVFVTRUS1dvSEFl?=
 =?utf-8?B?RER1V3Z2TlhURE50L3hnQmRjYkxSOG5CTnBvK2dLditWdUQ0alhhYkJlS0dN?=
 =?utf-8?B?ekl5a3lPcDJvdGhQWmtiVkVGdzRZMEpFZ1FEQ1FpWWZabkc4Z3VYVklDNVI3?=
 =?utf-8?B?Nk03dDE0cU02NUFLYi91QlNGc2tMM1IzVzJqSldwaUdzRnRBRlZJaU9MTnZP?=
 =?utf-8?B?YmJJS24xVVhteVBkZmhWdGxuTE1JOGpWNDd4N3hRYUJ5OEl3T3pqU1RDTExK?=
 =?utf-8?B?UDZKR2lYRzhra1k0Mjhma2hlcXlPYlNQNEM1ZWNYa1A5YlpSTlZVVHRPWlpo?=
 =?utf-8?Q?GHCsuvrQxcRg5Me3V2qT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGN2OVErakpLZkxiOXRPVlFDdWNidzdGL3FsaGF4QTFSRVF4WjhacmhLcUUx?=
 =?utf-8?B?T3N6d1hRbjZ4NU9PTGs2TmFFMTVMREZTdWp5Tm5iaWlyOXkzRk5CbjNFUTBT?=
 =?utf-8?B?OEx2dmsxWlRmSlpmQU4vbTc3RzB3bGdMSmdxOW1Nc0RsUjkvRHZjdlF5MzZn?=
 =?utf-8?B?bzMwaGU0MXhqU3BLWjlDaGNXSEpZallQNzBMek1XR0JkRnc2RUNtRmRZbUhx?=
 =?utf-8?B?a3ZOWXRIRy9lSkttb0gzYkpvRXVhY1BDbXBhcFRiVk5UT1dWaFFWWWlNYzhQ?=
 =?utf-8?B?NzVJVkxsNEc1L2hKbzRPNENpZEh0UHRnNFB2UGlOOFBzalhIQlg5K3ZLeDE0?=
 =?utf-8?B?NzRpMXZpQVF4RmdqMkZzaTdRT3ZWZkVBOVIvRlN2dk5Xa3k4TjlPOFVTWG51?=
 =?utf-8?B?YnZLcVRuVXNSYnBtZ1ljc0NhRVBKSnJGeU9JTmtlc0JsaDFZbEdSV2lPOUQ5?=
 =?utf-8?B?YjVtSXA5TjBUWlF3eFBjVkIza2pGMFQzTG45MENVWTZ2TFpPWFRxeEJmaEp2?=
 =?utf-8?B?Wk5pSVJnTTN2YnM5NmlGL2J3Z2xtMXNhYW1wNkRnc01vcHZJZmVsU0NNbWdN?=
 =?utf-8?B?T0xQSUxhZjdXRzhMaVVvZUNxSCtMeWJ6czcwcDlTNDRHT0llSytoODQ0S0FT?=
 =?utf-8?B?dzNHVGsyazgwclBYUVJ4MkJYTjB2aCtuSWRmMi9SeS9TckJGWldPODl4azRn?=
 =?utf-8?B?RUpTb3pyb1ZKNWZpUU5WSXBKbkp2ZHRpMEtDMytBelMvT2JCdEZHL3FJbGI4?=
 =?utf-8?B?STUxMHUxdDdsaEVUM1JGbis2elJsRmkxOVRJRTRGQjgyRUlzZUpHNnpSeE9R?=
 =?utf-8?B?TS9seGMzSndrUzBZR010VlZQWDRWV1hMT3E4cjlpWHdQYWxTb0I5b0FxUktU?=
 =?utf-8?B?T0dZdGtOODFiT09yNm5NYzBta1ZGWUhVQjJRclM4Y2RnZHpXU3oyYWJpL1Rl?=
 =?utf-8?B?VEtMaGhpczYyUURpdGlQVVhDcUFzRDlwRHcvZytxWTBieGtDeU5iN2JlVVoz?=
 =?utf-8?B?eDJva3IyNUQzanN0ZG1veEZlUU5lME1hSXI1UEtNeGpvb2V4cWFKc1FNQnJs?=
 =?utf-8?B?U0YwckJOZGtmOHdvbW85TGRtMmtKVHZ0WkNCNDVBQk9QMnVsNGJBZnR6djBB?=
 =?utf-8?B?WjFId21yd1ZGR1VlSi9qbUhTTUx0Z21kY1F1dWk3VkNYVHFVOWhlVkpzK3Qy?=
 =?utf-8?B?MGNMVXMxSk0vSnlzS0xEQjFvemRPcWthd0VLZ0JqdFlrVk8xcE15OUpNZGRp?=
 =?utf-8?B?Zk1KWFhkY1N2NXM0YVM1YnlhNVNXb2ZGNXNEeEJRUHBSdDA2V0pBeWdoMG5r?=
 =?utf-8?B?VlQ0bllsbzhNU2Jrd1MybmRQbVNmQ2dSdGJsZ1RHLzRWWnpESHlYY0xCbkF2?=
 =?utf-8?B?RHpDKzlZSHAvYjVYVHBlaC9iQ2hyeFViK3dmRyt3ZlRwMUk1bEc5VzJtTUVx?=
 =?utf-8?B?WkZ4SHdwUG1pUXFVMVZUNUxQWGNuS3VaaXViTjVFNWs0ZTJUM0cwcngyNVNQ?=
 =?utf-8?B?ZVBpVGdNNjBZbDVJb080ZkMwNXQ5dFZINHI3NGFzYUE5VmFvaGg3amF4Z1dy?=
 =?utf-8?B?U3lNVHhpRnBlYzVhYkVGZEFjUFhuYndHd3RIVXFva3VPR1ZCbVNIb09DTHhT?=
 =?utf-8?B?UUpVQkUzWjdFSmN6UHZja3B1V1V4VGFGb2pBcnA3Nk9PaUx3dmQ4RmptNWlq?=
 =?utf-8?B?YzlhcTZGQkRGMFpyQ3hsNGpaZFRtQklsZGlvRVJwM3g4SFFIZ3grMWxGaEZ4?=
 =?utf-8?B?Z0R1dmFlRHg5eVBGek43cys1bXRBOFExVERBUW5JNnJTSStNblVzaXdTZ1J6?=
 =?utf-8?B?TzB3anh6U2Roa1IyV3lDM205Y0hKT3ZCdXUwQjFuL1c0TzBodU9raVdpL2t2?=
 =?utf-8?B?RWlucmhVWW1DRWViY2thYmpVVm5SaFd3K1ZtdjB1S0krandmUWpiZUI5c1k2?=
 =?utf-8?B?cVhVdGd5Q3FOME84RFBMM2Nvbm5xc2x0RG9LempTR3lsR2x5TTdiTEpqSVV2?=
 =?utf-8?B?dFgyczgvNFh5WnR3UDBubTBnVXBEb0pKNWtaMVplYll0RW81TFdsUFhaRWFW?=
 =?utf-8?B?UTJpZ0F4Q1VLK2ZGRC9yMzBkaDJubE5BTDJyRmpGSUhSNHNqOEsyT1VmSnRa?=
 =?utf-8?B?NDNVZE0ybGtjZlkybDRrSGd2d1lHZ3lqUUw0a1NsU3BkczdtNWlBZkFYTVlo?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b9fd0f-4344-47dd-b72b-08dd0a2498ec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 12:04:06.0373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIfO/rYvqs6d7zGJdAi0bzm+JdaRatFAghNiNzGJEb45TxfNXcOJb7K+6RgEJid6Y2OiJUOjsyhCW/l6wp7ztWPxfu3OXBjlOYW2fo3j7NA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
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



On 11/18/24 3:08 PM, Hajda, Andrzej wrote:
> W dniu 15.11.2024 o 15:11, Gwan-gyeong Mun pisze:
>> Create a function that causing a read pagefault using the eu thread load
>> instruction. If the given ppgtt address points to an unallocated ppgtt
>> virtual address,  this shader can cause a read pagefault.
>> To directly use a 64-bit address as an argument, use the
>> Untyped 2D Block Array Load Instruction.
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> ---
>>   lib/gpgpu_shader.c          | 92 +++++++++++++++++++++++++++++++++++++
>>   lib/gpgpu_shader.h          |  1 +
>>   lib/iga64_generated_codes.c | 21 ++++++++-
>>   3 files changed, 113 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>> index 7a2f0d28d..d7c47be80 100644
>> --- a/lib/gpgpu_shader.c
>> +++ b/lib/gpgpu_shader.c
>> @@ -912,3 +912,95 @@ void 
>> gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>>       ", 0x807fffff, /* leave breakpoint exception */
>>       y_offset, value, 0x7fffff /* clear all exceptions */ );
>>   }
>> +
>> +/**
>> + * gpgpu_shader__read_page_fault:
>> + * @shdr: shader to be modified
>> + * @ppgtt_addr: ppgtt virtual address to raise pagefault
>> + *
>> + * For a given arbitrary ppgtt virtual address, it raises a pagefault 
>> using
>> + * the eu thread load instruction.
>> + */
>> +void gpgpu_shader__read_page_fault(struct gpgpu_shader *shdr, 
>> uint64_t ppgtt_addr)
>> +{
>> +    /* pagefault ppgtt virtual address */
>> +    uint64_t addr = CANONICAL(ppgtt_addr);
>> +
>> +    igt_assert_f((addr & 0x3) == 0, "address must be aligned to 
>> DWord!\n");
>> +
>> +    emit_iga64_code(shdr, read_page_fault, "                \n\
>> +#if GEN_VER >= 2000                                \n\
>> +// Unyped 2D Block Array Load                             \n\
>> +// Instruction_Load2DBlockArray                            \n\
>> +// bspec: 63972                                    \n\
>> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies 
>> both        \n\
>> +//    the block parameters and the 2D Surface parameters.            \n\
>> +// Untyped2DBLOCKAddressPayload                            \n\
>> +// bspec: 63986                                    \n\
>> +// [243:240] Array Length: 0 (length is 1)                    \n\
>> +// [239:232] Block Height: 0 (height is 1)                    \n\
>> +// [231:224] Block Width: 0xf (width is 16)                    \n\
>> +// [223:192] Block Start Y: 0                            \n\
>> +// [191:160] Block Start X: 0                            \n\
>> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 
>> bytes)            \n\
>> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)                
>> \n\
>> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 
>> bytes)            \n\
>> +// [63:0] Untyped 2D Surface Base Address                    \n\
>> +// initialize register                                \n\
>> +(W)    mov (8)            r30.0<1>:uq    0x0:uq                \n\
>> +// [0:31] Untyped 2D Surface Base Address low                    \n\
>> +(W)    mov (1)            r30.0<1>:ud    ARG(0):ud            \n\
>> +// [32:63] Untyped 2D Surface Base Address high                    \n\
>> +(W)    mov (1)            r30.1<1>:ud ARG(1):ud                \n\
>> +// [95:64] Untyped 2D Surface Width: 0x3f                    \n\
>> +//       (Width minus 1 (in bytes) of the 2D surface, it represents 
>> 64)    \n\
>> +(W)    mov (1)         r30.2<1>:ud    0x3f:ud                \n\
>> +// [127:96] Untyped 2D Surface Height: 0x0                    \n\
>> +//        (Height minus 1 (in number of data elements) of            \n\
>> +//        the Untyped 2D surface, it represents 1)                \n\
>> +(W)    mov (1)         r30.3<1>:ud    0x0:ud                \n\
>> +// [159:128] Untyped 2D Surface Pitch: 0x3f                    \n\
>> +//         (Pitch minus 1 (in bytes) of the 2D surface, it represents 
>> 64)    \n\
>> +(W)    mov (1)            r30.4<1>:ud    0x3f:ud                \n\
>> +// [231:224] Block Width: 0xf (15)                        \n\
>> +//         (Specifies the width minus 1 (in number of data elements) 
>> for this    \n\
>> +//         rectangular region, it represents 16)                \n\
>> +// Block width (encoded_value + 1) must be a multiple of DW (4 
>> bytes).        \n\
>> +// [239:232] Block Height: 0                            \n\
>> +//         (Specifies the height minus 1 (in number of data elements) 
>> for    \n\
>> +//         this rectangular region, it represents 1)                \n\
>> +// [243:240] Array Length: 0                            \n\
>> +//         (Specifies Array Length minus 1 for Load2DBlockArray 
>> messages,    \n\
>> +//         must be zero for 2D Block Store messages, it represents 
>> 1)        \n\
>> +(W)    mov (1)            r30.7<1>:ud    0xf:ud                \n\
> 
> It duplicates code from gpgpu_shader__write_offset, could be replaced 
> with macros as in https://patchwork.freedesktop.org/series/141348/ , but 
> no rush :)
> 
Introducing macros will be done in another refactoring patch.
Thanks.
>> +//                                        \n\
>> +// dest data payload format is selected by Data Size.                \n\
>> +// Block Height x Block Width x Data size / GRF Register 
>> size            \n\
>> +//    => 1 x 16 x 32bit / 512bit = 1                        \n\
>> +// data payload format size is 1 GRF Register.                    \n\
>> +//                                        \n\
>> +// send.ugm Untyped 2D Block Array Load                        \n\
>> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc                \n\
>> +// Execution Mask restriction: SIMT1                        \n\
>> +//                                        \n\
>> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D 
>> Block)    \n\
>> +// bspec: 67780                                    \n\
>> +// 0x0 =>                                    \n\
>> +// [32:22] Global Y_offset: 0                            \n\
>> +// [21:12] Global X_offset: 0                            \n\
>> +//                                        \n\
>> +// Message Descriptor                                \n\
>> +// bspec: 63972                                    \n\
>> +// 0x2128403 =>                                    \n\
>> +// [30:29] Address Type: 0 (FLAT)                        \n\
>> +// [28:25] Src0 Length: 1                            \n\
>> +// [24:20] Dest Length: 1                            \n\
>> +// [19:16] Cache : 2 (L1UC_L3UC) 10                        \n\
>> +// [15] Transpose Block: 1                            \n\
>> +// [11:9] Data Size: 2 (D32) 10                            \n\
>> +// [7] VNNI Transform: 0                            \n\
>> +// [5:0] Load Operation: 3 (Load 2D Block) 11                    \n\
>> +(W)    send.ugm (1)        r31    r30    null    0x0    0x2128403    \n\
>> +#endif                                        \n\
>> +    ", lower_32_bits(addr), upper_32_bits(addr));
>> +}
>> \ No newline at end of file
> 
> New line
> 
>> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
>> index 355b128b5..318550c52 100644
>> --- a/lib/gpgpu_shader.h
>> +++ b/lib/gpgpu_shader.h
>> @@ -87,6 +87,7 @@ void gpgpu_shader__write_offset(struct gpgpu_shader 
>> *shdr, uint64_t ppgtt_offset
>>                   uint32_t value);
>>   void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, 
>> uint32_t dw, uint32_t x_offset,
>>                         uint32_t y_offset, uint32_t mask, uint32_t 
>> value);
>> +void gpgpu_shader__read_page_fault(struct gpgpu_shader *shdr, 
>> uint64_t ppgtt_addr);
>>   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>>   void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
>>   void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
>> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
>> index b23613ac4..53a705358 100644
>> --- a/lib/iga64_generated_codes.c
>> +++ b/lib/iga64_generated_codes.c
>> @@ -3,7 +3,7 @@
>>   #include "gpgpu_shader.h"
>> -#define MD5_SUM_IGA64_ASMS 4fcde43dedb9d3212f1d85b5b180b0c1
>> +#define MD5_SUM_IGA64_ASMS 01290b5ecda7a6e765463558d6f59952
>>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>>       { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> @@ -79,6 +79,25 @@ struct iga64_template const iga64_code_gpgpu_fill[] 
>> = {
>>       }}
>>   };
>> +struct iga64_template const iga64_code_read_page_fault[] = {
>> +    { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> +        0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>> +        0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
>> +        0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
>> +        0x80000061, 0x1e354220, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
>> +        0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
>> +        0x80032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
>> +        0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +        0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +        0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +    }},
>> +    { .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
>> +
>> +    }}
>> +};
>> +
>>   struct iga64_template const 
>> iga64_code_end_system_routine_step_if_eq[] = {
>>       { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>>           0x80000966, 0x80018220, 0x02008000, 0x00008000,
> 

