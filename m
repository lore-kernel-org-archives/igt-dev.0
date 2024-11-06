Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DC3D1CA17
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 05:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE9310E62A;
	Wed,  6 Nov 2024 05:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/UiYOiM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FA510E62A
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 05:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730870479; x=1762406479;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PoJWwUUjbh8nImGhx8xG/uB5/AFNN4yuGEghU9YFNaY=;
 b=c/UiYOiMm34GH+XDM9a+0yRBt0v7bYC5zVIgVeR0pHIdYsgGVqUQW9IN
 jyU4ETbH8pkv5obiWwxUdUonT9dVX9oDfAOff/5tAnr5Uuh+AnMypofms
 qY+1mVO5AvyBGiet157HDbESVsEd3sgUXdPTgyk9DbmkNGtpW4PH7bXW7
 6671TZog2+Exny4atmM6hEA8I8wpXsxGN/C1nzxBL3XM+xUh4kC9ZQx5E
 +426dLpXfMp6iAejlmb8wx69O+oeV2/FXiH5ZWLCGXxw56GoUwysEmTpm
 yN4mbqkh1TN8lLY2YAAv65qH3MIRPMPR/tD8VGUTdxzweJ0gue/3Iyx2k A==;
X-CSE-ConnectionGUID: 7V3/M7tYTNaF8WUlCKBukQ==
X-CSE-MsgGUID: nx3bY62IT5C1bxm25rhqEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41277347"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="41277347"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 21:21:19 -0800
X-CSE-ConnectionGUID: GgQVRE9/QDmtK0g5t2tpAw==
X-CSE-MsgGUID: g5rUxHlXTnCk63MXfwR2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="107663677"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 21:21:18 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 21:21:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 21:21:18 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 21:21:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZLb7tCjkSFEcNBPBLw8Nm6AIySEKGjtTnicofP4d+f5ZjGWJFRM15bHDe6Z5i2ZNUH5Jzb3F1DEW8blW+xYKeZOCm5bNIESK9DfkG+yXDPqOUb4EtBAo/8ULrU8qD2ue741zbL9UiPeZuyeKg/b6St8QsxxlyJsD9FAtBliDGzDC4gK6TDB1v9blNNnmkC6L6avlnan6EYtWMefBg0Fa+nih8KzJfSoR9XHKvp4KSNGj0BqqGNTPrNP8Ew7PuQQsXmrz0Rl25Ls0SFaf2TVyeiRhSmtBjBFi3n/wCTWzBS9xZQ9o8pEM6+1w/aErEzOD3M4KdIws5Xgh+20ywQ7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zx1JWNOoYxbN5npG4InGMHiZ+QL543sdFEDbwcCi+M=;
 b=KScWN8Zd4YPrnS0YZcMEwLyCx9xoiNQDoRVK3DKd5CfkQ0NVy6dulvvwZxN1TUfren9viC+67aVPLkYImdPuDb4zaPTMhX0f1WrEt819HqcBPco5nEszUHyK18o+uVs6sO2o30CUGEQORGYF30uhG9FpEcZtqDlD3aPcExLzKOqAQXjxVuy53VS6X5Vplsx6PRFW6Iueiyj3CHqw0bLeDmrAWkYrmKo1zSIV1ep+4CUFkZahPUH5+0E+ftvHjgXjP8B8jFaU8RdxS83zBjO1/f43hjT9cbVDFOUW/bGT3cqmWVX4Tn8nbDYY87hK0DZSXxG0eF8s6XsZ1Loq3TQfng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7200.namprd11.prod.outlook.com (2603:10b6:208:42f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 05:21:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 05:21:03 +0000
Message-ID: <68b4a4b4-3496-4200-8396-e1b87a9f9924@intel.com>
Date: Wed, 6 Nov 2024 10:50:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel/xe_gt_freq: Change basic throttle
 API test criteria
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <John.C.Harrison@intel.com>,
 <sujaritha.sundaresan@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20241105063228.452559-1-raag.jadav@intel.com>
 <ZypDRUBurYJBd9eo@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZypDRUBurYJBd9eo@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PEPF000001AC.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: 104703c7-aed6-4c05-97ee-08dcfe22cea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFlrNEhjWlJqa3MrQ2tobTQyVUYxL2doQjE2S2RYbnlhdThIUFEvNU93WUtH?=
 =?utf-8?B?ejVSUngzdlorMDBJNUdZYythMmRVOWFLbVcvWlhtSGdWYnBidDBERWlMZ0kz?=
 =?utf-8?B?Ymp5dXVTMlZhNHQ5M1lKNmdTWXZyTU0zOFpITUdyNTJ1VzN2NFdPRFNPTWVQ?=
 =?utf-8?B?R0VlSTd3a3cwcmxDb0xmUXB3NU1GKzBUeXJlMmd3MW9UQWpYMDlYNHhVWVc4?=
 =?utf-8?B?STVSMXljMjJwMVhsK0M5Mm9uZmNPa1JYOUZsVFB4dnVPb3duNTNzK0FwMStn?=
 =?utf-8?B?L25iTzlSdTJ0VGlqY2RQU1ltemVxV1Ftd3ZETXAxcjhOeXBqeGRLaTA0MmY2?=
 =?utf-8?B?VjFmL0RxK1dSdlloNmtLWFlxb1cvdVY4aVhJMXpCVHVVM0lkU3B6K3R5RlNR?=
 =?utf-8?B?bk5maGpjOHB5QUI2SzZwL2FGV0Y5ZHZPc0dGck0rRFQ0OUhYU2FGZjlBZE9v?=
 =?utf-8?B?dFpJV0Q2YnVxaHhjaFd2Q1RVdHBrbE56VGNWSktSaFl1SGNseENkd0xSenUx?=
 =?utf-8?B?Vld6YjhMSFRaTkZMK3RZYmNaRVcxb1VaRTQvYnVEaXMyMi9yQVhTb2pGeU9x?=
 =?utf-8?B?Rld5aXVPcUkvRkVIMmhsWkE1UFI0MjhtdVNobURMYTV0UGl6U0doNkN2ZUZx?=
 =?utf-8?B?TXhuS3BHRVZ5c0lTdTZpczMxRnliVDQweGxJWEx6c2VBQjdrUGY1TUJsSmpM?=
 =?utf-8?B?VFQweGI0RlhlOTRDbzVjcTRJaFhlTWVjKzlFY2pTcXhVbFlsUlg1RklkMWJx?=
 =?utf-8?B?U1cvNUlPOGdjSDcrZFhtOWhhZmUyWGFLdWFUVmJ4a2oxYkV1Q1NEOG8vVHk1?=
 =?utf-8?B?QUlOME9EWnloS1U3WGtBQ2dCRjlYOVBOZzZlU3doTEJIc2ozdVhzMTdGWERS?=
 =?utf-8?B?OUxEZUlySHdmUk12S2dXdXMxMnBuRDVhZCt2QWRJNmJQK2VrZ01YcSszRUVR?=
 =?utf-8?B?WnZQeGlZUzQvNjVwY3hEN3h1VnlvMkdIem9GNlk0ZVpwUEVPcDZCeThjYmNj?=
 =?utf-8?B?Y2hjcDh0VldSMjJsZVpvR0lPY0swWGkrL2hmd1BqaWdLcDFMVXZCdDQyV0JB?=
 =?utf-8?B?YWNvazZpYW1xWkpYdVUycE9FQktPbHZpbG9lSWNZZnJJY25uSlk1cXJ2aWpa?=
 =?utf-8?B?L051NjdlK1AxKzlSZlRDUTlJUjFXWWgwRUFrT2hDRU1ZdmR4RDltNGVtbG1q?=
 =?utf-8?B?d29LbTB6d1JycXBvMEdYU3I5SUdGN3NLVHRGT2l3aXpmWUdCU3RFdmxPeWlU?=
 =?utf-8?B?dzc5TFpsWElNOWV6cTZKVXJtNDZuKzIrMEpyMkVlVW0wMHNnUEpQYnpkOGZS?=
 =?utf-8?B?dStIK0Q4aTVIWW5qNVhCcURYZk5GTU5uTit4VDgzZ0w0VHFMWjhyR2RaR21m?=
 =?utf-8?B?U2lCR0pXWUNBakFZNWxUQ1NuSmNWUTFzbi9MTGxKaW9yaEgxdFVPYXpYN2tJ?=
 =?utf-8?B?MzBtanladDZOZU5KZS9qL3pxNnJ2T2wvRTRaL2JJZkVsc3BxY05OUjVRNmpP?=
 =?utf-8?B?cEZieDhFZjg3d1RyVzF1N3hHRzZzbGw2clJsK0tlU0NmTXlyVEROY3dHQ3lU?=
 =?utf-8?B?UkpVSytlZGIycDhTdEtIOXlGZm5FR2ZJVS9XbWo3Zk0zcVd1NFdyTk5Sb0lr?=
 =?utf-8?B?RXJ5M0gzTzdGcXJkYnY5K3ZNS0x0MU9BMTVxUTh5YUp1QlcyelZmWHdlSHhk?=
 =?utf-8?B?TTJ3Z3VBd3ZNV0dLSWVyKzhiMkdQdEI0MmZhR3VGaGpQK3RNTnlXY0tBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmdjZlFZRmRwZGlNQ1AzYXY3Zkl3WkVxMEFjWHVsZ2ovR0pPcUl2Nkl5YjhB?=
 =?utf-8?B?dEJobU95YVA1Z2hndzdPb050NzRzc3RUSzFTUS9DNEtLTTRia3pFQWNkSGcx?=
 =?utf-8?B?M3cxR0dleWpPM2pvRDdKUk10dzhWSzNqRFJLY3NPeHBYS3VqWk0rV3RjNTZs?=
 =?utf-8?B?K0JGRnM4ZHpVOU0rSVk1WWJaS0szWU9CWVliVFJIWTJ1OTJVa3FFKzdTdjFS?=
 =?utf-8?B?dU42bTRhT2tEbTQzU2Q5WlhhS2p2Zm0xc3dBalNWdjBudm8xeGNmVUczaFQ0?=
 =?utf-8?B?c2p0cGdtbUJQK245MmJHcklxWWFjVnZFZUYxT1JOdzY2RE4zb1JvNGJMaXp3?=
 =?utf-8?B?Y2NsZGpGa3ZqWVRIL0FqVlJDeU1JR0NXMWFPYW9uT05jaE1TbGFHSnpHeWpl?=
 =?utf-8?B?RkdYdlBmL3VjQUg3WHB1MHpQWHRBYnZjMHhaVVBwaENRKzhiQVRoSGpPSW96?=
 =?utf-8?B?OTRibzM2K0xDLzdPeEVYNVRZSDNUdVluZDllWlo5NXZ4Z2pDbzdVZHpHcWpP?=
 =?utf-8?B?K1pqam14VkE0TERQUzYzZnpIS0FnVmQ3RWhyQU9OVGJFNDd6b0xidHNPa3lU?=
 =?utf-8?B?ZEpuY3JlZ1F6ZHpjKzhjUDRVMEZhSVA2aDc3Q1N6ZmdxVGNyYytqOVJSK0Z1?=
 =?utf-8?B?T3REREJrMzg5TTlpcTJPODZFczErNjdUbVkyT00yWUxtRWQ5S0paRldoTCtx?=
 =?utf-8?B?ZkEvUFVlR1Fmb1dlMVd3VzdHQWhtczl2MnBEOUVJT283WnVWeHhpQjk1bTM5?=
 =?utf-8?B?ZE5jZlQyS1lacVNSYUR3bW9BdkRFMXJieXJ6eStGN0JBbitXa3NZL1E4ZjlD?=
 =?utf-8?B?NHllVkJJZzJET083WTZUeXE2Qnl0ekdEV0M1OFV2QWpqalEvN0E4d1BzanVD?=
 =?utf-8?B?UGNxUTE3QkozWS9wUmFEakQ2TGlqQ3BLVGpERzI2YkVFTy9BNlJMT05vY3dL?=
 =?utf-8?B?OFZnZ0N4OCtwTnFsR0dNbTZvdUIyekdrd1ZVSG0yNHFycGNONEtNY0htUkZE?=
 =?utf-8?B?OGx6UlRRRzdrVUgxUUVpd25EcStFN1F1MkNJcjdNYXphckxydFF2dzcyb1hT?=
 =?utf-8?B?R21OV1ZkRFlVTDNWSjd2UmExN1ZhLyt0S2tqVHFCdlo1Qmx2QWN2TEJEYmJh?=
 =?utf-8?B?UUx2K0xHTEZkSXBNZ0Z3WFdVTTJIdTFDMTBWY3RoTWltZk9pV080TGV3RkV1?=
 =?utf-8?B?SW9ENWN4cnpmMGcxcHp4aThvTENlZXM3ZXYvWUlXekppQnhDYXlhQ0svdVNT?=
 =?utf-8?B?K1VONzlweVZmdjVOcTI0MEVaZUFJS1hDQkNTb1JySnpVWmRZZUwzdkxRb0FL?=
 =?utf-8?B?dzY5bFFwWEZKQnhsaFhiMmdEK3JBMXdPeURJUjV5d3Z0MHN3REdjN0NYd0pE?=
 =?utf-8?B?TDVuOTIxd0ljS1FVenpiRnZRNk9WT1FybnA2ak54b2tuOTg2ZysvYzhWQVdw?=
 =?utf-8?B?L0Y3My9yVUU3eS9OcUVCVzhHSEQrd1pWMWhOQXk5cWJLTDlreEZKQTdVbWVG?=
 =?utf-8?B?Wm93QWZRcTEvYktSQnNpZTM5dHJEWkJzeUlYelBzV1BvanZjaVJQdzlNTXNu?=
 =?utf-8?B?N05ZM1YwUm4vT3I4bVJHZXFKS2FSNjlRQUlpRkJwNWhRQnFPYU1lbWtIblN4?=
 =?utf-8?B?YXZ4T203Ry9Mb0dqS0hVbVBKeUFWbTJTbmN6OFJabUxTdnNmSE9JQUhZZ25W?=
 =?utf-8?B?T2lnZFZMZUkxOC9WN0J2cm5renk1MjlnMGZtY0FFRk04bC9NcXlKdWpWNFpF?=
 =?utf-8?B?WWpkWStMVEVTd0psaUdOM0pXVnA3bW1vQ21jUmhNaE9DenljZWsxdFMza1k4?=
 =?utf-8?B?RkxYUStZZ2EraFFFYjUxM3IwMXNNTExZcG13SlJoRndJWWNuRExia1d1MHhG?=
 =?utf-8?B?dXl0MSs2a1RNSWNmVTlEN2JKdVBwZlE2b3hvR2lIR1UvN3U5VzFNeWxuaUUz?=
 =?utf-8?B?R05IWDdydytRejU4TUQ1K0JaNnd0SkNDNVdERm9qZE5oUm9UNzJBUW1LclY5?=
 =?utf-8?B?bW95eGZzeXc2R2M3MEl3SkVhV0hSQVBMSUVQRDJNMUdTK1lXbEVIM004RGNK?=
 =?utf-8?B?TjZnRHJBQUgxRHN6QWR4b0VTMm5XT095bXNqamYwWWlFYi95NkVHQVN6L0ZM?=
 =?utf-8?Q?rXsCGBiqMiPgMMcMb7Dej2O4Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 104703c7-aed6-4c05-97ee-08dcfe22cea0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 05:21:03.2579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVC8IgBmxmY9pDccBmY1HBqylKH9MHH7+srK/18hVZr9jPGXE8S0R7j8KBzw6Da6sjzEROoDTZcSAeEqTL/hMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7200
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

Hi Raag

On 11/5/2024 9:39 PM, Rodrigo Vivi wrote:
> On Tue, Nov 05, 2024 at 12:02:28PM +0530, Raag Jadav wrote:
>> Basic throttle API test is implemented in a way that expects multiple
>> sysfs reads to provide atomic results. Since atomicity is never guaranteed
>> between multiple sysfs reads, this is an incorrect expection from the test.
>> Change the test criteria to check for boolean value from throttle status
>> and throttle reasons sysfs entries.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3254
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3147
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810
> 
> There's clear something wrong with the 'status'....
> 
> look at this tool: https://github.com/ulissesf/qmassa
> look at the recorded example in the readme... status is poping up so much.
> that is not normal. I noticed this here as well. status is flipping to 1
> so many times while we have absolutely no one of the real reasons flipping
> to 1 as well. This is the problem that needs to be solved.
> 
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> ---
>>   tests/intel/xe_gt_freq.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
>> index de4d111ea..632415d33 100644
>> --- a/tests/intel/xe_gt_freq.c
>> +++ b/tests/intel/xe_gt_freq.c
>> @@ -121,10 +121,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
>>   	reasons |= get_throttle(fd, gt_id, "reason_vr_tdc");
>>   	reasons |= get_throttle(fd, gt_id, "reason_vr_thermalert");
>>   
>> -	if (status)
>> -		igt_assert(reasons);
>> -	else
>> -		igt_assert(!reasons);
>> +	igt_assert(status == true || status == false);
>> +	igt_assert(reasons == true || reasons == false);
Why not fail the test only if both status and reasons are set to true.
That would indicate there is throttling and also be a valid failure.


Thanks
Riana
> 
> This would be the same as deleting the test case...
> 
>>   }
>>   
>>   /**
>> -- 
>> 2.34.1
>>

