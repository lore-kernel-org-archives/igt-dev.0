Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBF4C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 07:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1420F10E081;
	Fri, 14 Mar 2025 07:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4KtyAyV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE8510E081
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 07:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741938795; x=1773474795;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Cp0GUr3hz4wwX/Pn9vAWR7ZoTV0RvasFOBQ9GVhh70=;
 b=I4KtyAyVt9drehPS0tNHD34XUZI3UjfH1QO2sodxX6pb0C+nCBvGnVSQ
 vj8dahECFJfLAFMAqT+bSH9BlN6dYXouA2iktTgYtS6G+CG+pbN5aFmCb
 euJdXbPzpquw70wJXQOx3cbRR0456/+p6bklBT7KO54SeFUfI/uiuZ5Wk
 9tnNrd+3auT5DiRd2sZd0tK5SBDN0VZ9GSLTJCfPheqQ73cuS5XS7SMuP
 72BKwHQP7U4i0Xy2LgHrB4VUPofsiAW41Y97bkEVmhGi/+hDuxoFLIt2m
 Yy8tAsBqw2/XgHd4kRXkHpsGmd7d8fU3SejGmV2TUL1ZtMpUDIIx2VDyM A==;
X-CSE-ConnectionGUID: gRwhma5nQaCPDGVLCjFiVA==
X-CSE-MsgGUID: XR5dBmL4R0Kd4V9wrbGTqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42329217"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="42329217"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:53:15 -0700
X-CSE-ConnectionGUID: 9xN2VbffRcqAMMqcfnG8CA==
X-CSE-MsgGUID: a9ZE4yfDSCKW9z/+iSaSFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121146814"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:53:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 00:53:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 00:53:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 00:53:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZr8KY0hjptVLuJQtRCWhAosr4zIJaXMyzcIr6E/iEGbgPPxs7iGeEUbWu18mM7J8X5K4gEFGntU8XXO8fubhpvE/smmkqGTZqkCRmb+7yf7lUb69cEkA9JyaPxIcE3sXb8SaqW5DLoG7GyO2ylXGtrl+aKBiXExen9jOQvrmc1IBOPY8VDX1msME2Ix+k9kehA+jHBieIPwa5BsyBtz7XWlcGTsMFw2BbaX1tyZxCWTFtIC8er6GpY6ol8K/ZvwRAd+iKJ9FXSnwjgFNFBkpitp2fuv2u/cj8HNqBf5+cI58CtDSDGodIGbO1OOMVJ5JmJ+YeGpLC4qJqwFJEJrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkTn1CaMd+vLbGlLyLhLtpOgd5OJO8IarqbVEExomug=;
 b=ewVe60s7bWRczMKARwThqfmVoPnAeAEN5hNm8ZtV4iojDS1eOms+w+Pluw6BkspQctla1Pu8O5yifzKXHntUnODE/1+b/qEB5qBWksdZbAv9g5QJmScpDk2uBHziEyesm1M5cgWthGfmi3kb5Ai/Dq0LrvwNdC+x+8uhME2xZqKH2d9CaX6YVc4BeMkfJr1UpKsf79HwQUZo9a7nE5cawesF9IlqXUxkFcHbmpQcehQFe5Jehmx/EDXuLRx5j5AJ779QnKqKJsJtOySNpDNCuknhp+9a3jql/3qNsf6ExeenyMdwlRuvzWZS3FdN3aZcY7ooDvEWeAgVFWXRZF22QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 07:52:57 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 07:52:56 +0000
Message-ID: <5daa25b2-bc5f-4155-8f01-aac4373cce3c@intel.com>
Date: Fri, 14 Mar 2025 13:22:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t] tests/intel/xe_fault_injection: Inject errors
 during observation IOCTL
To: <nakshtra.goyal@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
CC: <francois.dugast@intel.com>, <ashutosh.dixit@intel.com>,
 <umesh.nerlige.ramappa@intel.com>
References: <20250313094035.3073996-1-nakshtra.goyal@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250313094035.3073996-1-nakshtra.goyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f20c862-a0dc-4894-330c-08dd62cd3b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUYvUWlieUdvYjQyZzl1Q1ZtcGc0SGY4K2tSaTZLNHo4RklwU3hVTFJKZGtQ?=
 =?utf-8?B?cWpxMzNGYVFVcDJvVHQxZ0xlZitlMS9veHBYRkxEZzRYRU1VTEE1SVpuTjdV?=
 =?utf-8?B?Vy9IUXd6MWxlaERxeVlKSE0wb2Qxek9IR25MM2cvK3hPN2Q5REE3TFFmY3do?=
 =?utf-8?B?dDRRT29uajNrbllzaVVRb1ptUVEvb2pxWHlqYlIrSDk5SnJ5VUMwY1RBN3Vw?=
 =?utf-8?B?Zzd4Z2FQdGxnOEUvaW9jUFRUUHRPUGRjM3I3cW9wMXRUbmtvUndtdTBmcldj?=
 =?utf-8?B?R0lSNDlRRktIVjErTWpRcGdITUV4WWt0dDJSRmlCc0dETjkzV2ZjK3VyR004?=
 =?utf-8?B?L2lUY1lvL1AyT1czZEw2SjQveUN5dWh4eXE2Y1l4K3RnWDRlRFNyWmhwTHRZ?=
 =?utf-8?B?T3hvZCtnTWR3K01nZmZNUmcrN3ZuS3FHaTBsNWk0eGpXeXlZN0RETkVYNm5T?=
 =?utf-8?B?d05lV3kvVk9ma092RUpWTWJWNHNNUk5FWW5ldmVzeEUxcDFESDFjVUw1bWRN?=
 =?utf-8?B?dThycHY0Y25pMTVnbWQ1dU11YkorZEZVYldiU0ROcUVNRmJuQmlVa3BWQ05z?=
 =?utf-8?B?YUJrcTRxaVRObDVVZ0hHV3I4b1M3ZkdmMklXbllldFdPSDUra1dWU1JTRUFv?=
 =?utf-8?B?UUJUWnFMOUhLZDFhQVRhN2RzdUFaRlJXcTZQdFhmUUI2dTNVVDJHemVBRnVE?=
 =?utf-8?B?eEpKcVJFYjN5QzFEb1h4czlscmpWWTRwWXpnbXdCTm41aVQzWm1qREE1c0RU?=
 =?utf-8?B?OUdWa3V2NnhOYkRXZGhLNlU2Vkl3Z0pvdjFKeFpySklub3BmcTBBQTBLMDA5?=
 =?utf-8?B?YjBFMllwS2czMzdrQ3RLZnplMGVIOWtOR3BEaldqV3hKam0vUW5FUUV0QStI?=
 =?utf-8?B?eVVKbzRjZlF3VTNhMGtDVDRVU25jV1I0QmE0bVBQdHNQSHV0T1VLelRUVXRL?=
 =?utf-8?B?OE1GMkZoQ2Z1RG54ZUlMTUpkQ0dKaWt3T20raDVqcUpNT1Q5aXV5c2pvVjVs?=
 =?utf-8?B?eU9oRHFRTy9GaHlwS1ZYWklncDk1NVJOQ3p2YXRUZGhwUmFJNEF3elZqcHBi?=
 =?utf-8?B?T3k1ZENjZTR0S1BwTnltVkNVTFVHSWMrVmpUQ1JsRWNtNWo0RWFxVDZVWmtq?=
 =?utf-8?B?bW5sRG81cGZWNFJoaTZFR1J5ZUNQSm1uaGlWYTRlbEhkbm9OYmZvVTBtU29O?=
 =?utf-8?B?RzIzRHc2OW04cHBqR1JWMm5qQTlVWDk1OXFWK3dFRnZ6MFhlQUVZcElJUFdP?=
 =?utf-8?B?MlovYWgzYXk1b1RNSWJiNlZsbndob0xaYytITEZaT3lZaGkzdWlTL0F6UGxV?=
 =?utf-8?B?T3dnaWRMU1VxS2lMWFBUdG05TkFMYTVNN2QreXRiTjlIZjZON1A0NVFnMUYz?=
 =?utf-8?B?eW8zRHNtSXZEdGdCdnk1aytGL29UNThOVldjYlZDd2FUVXlZUnZkcnoxQTky?=
 =?utf-8?B?ZHo5amE4dzBJbmRma2tiRExmeFVlRnE0bHJDL0pwVTkvVFBlSDNIbWV0WUFT?=
 =?utf-8?B?NFlMNXlVQWhNRTRaeWNDOXJKNUJJQkpSazU0VlVWbXhiQVRKNTZaYWtvWTdh?=
 =?utf-8?B?TGwxK05ZUlVQSk9zOW1iUHZ1amUrZFdkT3lRY20rek5iM1JadVU1b3pCdzYz?=
 =?utf-8?B?bit1aVkxcC9JSTVWUExjcmtkNkZPR1lqeUc1MmtPak80UUQ1NG5DOHBoQ04v?=
 =?utf-8?B?Qk55NnQ2cmxTaE1DMVZZUGZGblM2OW9aRllMOFlRT1BWQWRKRFE3NTI5aFM3?=
 =?utf-8?B?NldjZ0lHWCtpUWdmdDBCalo5aWc5cEdUUE5TU0tMdkMwNXkzMVlyRU5rWkhJ?=
 =?utf-8?B?SjBGb2wxbGszeEliZlJSMTZKNmRraTlQc2RodUV0eVJ2VTBuVCtqN0U1KzFa?=
 =?utf-8?Q?lNq6tVm631zRD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkVMUTVqa1NEeWZEUE9maWYzOFJLQ3lxM2ZCb2Vxa21CaTRsbDJOajR6Znd2?=
 =?utf-8?B?NFM5Ni95Z093KzJzcnZrV3dFaytSVFBRbkxGQ3VnRFdHMEI5bTloVHBoY0gx?=
 =?utf-8?B?VCtjeGgxNHpnMEw5WE9sSm9yd2xrM1pxTER1RUJoRHVXRm5NQS9LT3R1NGJx?=
 =?utf-8?B?T2R3OUFNdDhFdlorVnFkYUFHYmRoalhnemtBeHFYNkg3VjkzV3NLOGhoVEt3?=
 =?utf-8?B?NUFHOGhCNEdTcEM0MWkxM05xR0xrU3JDNXJnbk41bEN3RTFsYVhjS0t4SmpE?=
 =?utf-8?B?V2c4R0g0UEZyUUpkSnFKOW1pRXF3NCt2b2dVTUVqQ3ZhdFQwRU9jY0pINi9U?=
 =?utf-8?B?VXBKSE5PWTd1MkpLcXBMd1dqLytKeXhpMVQ0ayszdFZTMXhXVnAxeE8yTlBW?=
 =?utf-8?B?aEIwOHEvMjZ1cUIxY1RKVEI5YVNTZlV3aXF2MEpsL0hOS1JSc0RvNGVSbWlE?=
 =?utf-8?B?OHNCcDl0NW1uM2pwZUhhN1lVTVhaaEZzYmJqYmN2U2J6VkxLRm8vbVRGUzIr?=
 =?utf-8?B?SGhrbm5UdjJNMlB1M2syNDhrYlpDUGQrVGtnamxkS1h4M3Yzc2ROYXNnTTlt?=
 =?utf-8?B?RnFXNGRKamt6V0t3OVdwQXBlUC9yZVlnNUl0TUYrWFpuVDNhTlQyMTJVeGp0?=
 =?utf-8?B?V0RYckhZdHJoQWJZenJKeEVMNzlpQVU0aEhOUVFMQjBIVWEvMXNMb2pNZjFs?=
 =?utf-8?B?alIvT01BdXNIL0w0QS9PcHJaTTNwS1JBODdkaGlraTJuZ3o0djNOaXcvNkh1?=
 =?utf-8?B?OE5Db0xWUHkwZTV4cUxwNnNrSXVoeWNYbUJ2V2FkZTUwV2tBWTFGTlpLaUh4?=
 =?utf-8?B?Yy8rcTZhNERKd1NwZlEya3hUUnQrb2U3azI2RGpiZ2dMVktaUnRLZ0FMQkZa?=
 =?utf-8?B?M1BWeHVZT3VRUktWNUtXNkZGRVh4ZG55NFhvNTZUK1l1cG5wc2l2MTBYZkhF?=
 =?utf-8?B?cjN5bzVVOWt4bEhINjlrYTNPRUJKd25TRzhPejBkNzhkemdzNWx4V0JPUXZW?=
 =?utf-8?B?YitESjZkWmRjeXVoSnhPZGI4d3d2eFhxZll1U1lIcVFrazRBWkx3MjJKQmtm?=
 =?utf-8?B?OUs5bVhsZyswNlN0eElRS0RVamlHWXUrODZjbWMrdm1BWi9GT0VlN2lGcko2?=
 =?utf-8?B?WXI4aHZIUlczcWlKNFROZFc0ZHhCWXlpL3cvVDJCR0JFMkFOd1RnL2FRdHVP?=
 =?utf-8?B?ZWJGWVFkL3hhbUJyTWRTVHZpR0lzU2lIOXBZVzlTUzU4Kyt4eG9SdzFQU3Vs?=
 =?utf-8?B?TGt0cDJGeE9OZ3NsMThIYWdNRWs2M0FNb294SXZvbmx5Qk1icWJleml6ZzYy?=
 =?utf-8?B?SkZFRUR6QklyNkx1V3RSTWVKZ0o2VExpd2FXaEI2cHo3QkpzZzVIYklZZ25z?=
 =?utf-8?B?TGYyWjdXOTdmdjdscXlDYVprbTRydnpCZzMrR3BXTUdmZ0RBL3dGaXpsSXlt?=
 =?utf-8?B?N2sya2YyaC9ESm00SUg2QzVVdVk3cS9teUpqN0VWZDM0VVl4bkcxSlkxR1I2?=
 =?utf-8?B?UnY4ZUcyL0tOSWp4QXQyZGhHeWFGVU5pMDgySldOaEp6SnZZdmwvanRHd3N2?=
 =?utf-8?B?ZXdSRmdMem1FWkF5ZDFIRmN3c2xNTTFydzFMYlRsSjI0ZVkxQWFsenp3bUdl?=
 =?utf-8?B?aW45cUo5MHJUTGhOaHRCZkRSMFAyVmRXVEZmT2xPWFM1THh3Q0dmaElEc09a?=
 =?utf-8?B?WUZ1Q1VTN01XOWU4aDFwVkp2Z2lhMXBWdzdudi9iMStIcUJwa2x4dnBRaEhu?=
 =?utf-8?B?dVBhdGlEb2p3a1BDbzhONVhXTVdVZVR6d3lkNDdsalN1eVVkWVlDK0dQT09a?=
 =?utf-8?B?dGlkZWUzbzZXODlQaHdkWllJQllCVWVLVU93cjdsb3FwY3daOHVFZFlXUlR2?=
 =?utf-8?B?UVZrd2lTSlJ2SEkwTFRnckRtUlk4UmF5OWJnZTBaem5MaVd6UFdjenBhZ3h6?=
 =?utf-8?B?ZnhJZ25CcG5IaUFZWGJnVGNQbk1wQWtTRzNmaXlTN3N2aWo1TXE0TWxVMHEw?=
 =?utf-8?B?RnB6UUdaSDF0c3M3UWFPTUhtbjF4MXZVOTNvUXRTNXNPYWplU2p1Yyt6bW5i?=
 =?utf-8?B?aVVLSmFDSVRIL3Vaall3T0gyZ28yd0ZGL3NxOHhhZWU0RHg1YXUwUnFzNjNn?=
 =?utf-8?B?N1pHanpONCt5cHdWZm1qd3lZNEU4Q2VhSUJJNGx1UG9OcWtYS0F5OHhTZlE1?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f20c862-a0dc-4894-330c-08dd62cd3b9d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 07:52:56.8277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ctue3Oss7MCHYyCa/SzzkAZySbRoehPwMXxNpgcly7CHf4ZH3TLaDyzBxLX/ZL8VTAgSOeNZVyP6KsMLKBV0fPVQXbVwMJaMExJ89Vx9V/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

On 13-03-2025 15:10, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Use the fault injection infrastructure to make targeted internal KMD
> functions fail when executing xe_observation_ioctl()
> so that more code paths are tested, such as error handling and unwinding.
> 
> v1: Adding remove config at end of test , Adding igt_sysfs into igt_assert
> so test fails if sysfs read fails (Sai Teja)
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 56 +++++++++++++++++++++++++++++++-
>   tests/meson.build                |  1 +
>   2 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 5409d19a6..1f150fbb0 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -21,6 +21,7 @@
>   #include "lib/intel_pat.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> +#include "xe/xe_oa.h"
>   
>   #define INJECT_ERRNO	-ENOMEM
>   #define BO_ADDR		0x1a0000
> @@ -314,10 +315,51 @@ vm_bind_fail(int fd, const char function_name[])
>   	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>   }
>   
> +/**
> + * SUBTEST: oa-add-config-fail-%s
> + * Description: inject an error in function %arg[1] used in oa add config IOCTL to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_oa_alloc_regs:		xe_oa_alloc_regs
> + */
> +static void
> +oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
> +{
> +	char path[512];
> +	uint64_t config_id;
> +#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
> +			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
> +
> +	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
> +	struct drm_xe_oa_config config;
> +	const char *uuid = "01234567-0123-0123-0123-0123456789ab";

Looking at other oa tests, I think its a good practice to make sure that 
we don't have a config with that uuid already and if its there, we will 
have to remove it before proceeding.

> +
> +	memset(&config, 0, sizeof(config));
> +	memcpy(config.uuid, uuid, sizeof(config.uuid));
> +	config.n_regs = 1;
> +	config.regs_ptr = to_user_pointer(mux_regs);
> +	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
> +
> +	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
> +	igt_assert(igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1);

Looks like instead of reading sysfs we can do something like this as 
well here,

int ret;
ret = intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config);
igt_assert_lt(0, ret);
igt_assert_eq(intel_xe_perf_ioctl(fd, 
DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &ret), 0);

Do you think sysfs read gives any advantage here?

> +	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
> +
> +	ignore_faults_in_dmesg(function_name);
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);

Maybe it would be better to do assert_eq to INJECT_ERRNO instead of just 
saying that return value should be less than 0?

> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
> +	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);

The config_id here can be different I think. We need to get the new 
config_id.

Sorry for not observing these while reviewing v1.

Thanks,
Sai Teja

> +}
> +
>   igt_main
>   {
> -	int fd;
> +	int fd, sysfs;
>   	struct drm_xe_engine_class_instance *hwe;
> +	static uint32_t devid;
>   	char pci_slot[NAME_MAX];
>   	const struct section {
>   		const char *name;
> @@ -366,9 +408,16 @@ igt_main
>   		{ }
>   	};
>   
> +	const struct section oa_add_config_fail_functions[] = {
> +		{ "xe_oa_alloc_regs"},
> +		{ }
> +	};
> +
>   	igt_fixture {
>   		igt_require(fail_function_injection_enabled());
>   		fd = drm_open_driver(DRIVER_XE);
> +		devid = intel_get_drm_devid(fd);
> +		sysfs = igt_sysfs_open(fd);
>   		igt_device_get_pci_slot_name(fd, pci_slot);
>   		setup_injection_fault();
>   	}
> @@ -393,6 +442,10 @@ igt_main
>   				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VM_BIND)
>   					exec_queue_create_fail(fd, hwe, s->name, s->flags);
>   
> +	for (const struct section *s = oa_add_config_fail_functions; s->name; s++)
> +		igt_subtest_f("oa-add-config-fail-%s", s->name)
> +			oa_add_config_fail(fd, sysfs, devid, s->name);
> +
>   	igt_fixture {
>   		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>   	}
> @@ -402,6 +455,7 @@ igt_main
>   			inject_fault_probe(fd, pci_slot, s->name);
>   
>   	igt_fixture {
> +		close(sysfs);
>   		drm_close_driver(fd);
>   		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
>   	}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2f5406523..c4a9093c4 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -401,6 +401,7 @@ extra_dependencies = {
>   	'perf_pmu':  [ lib_igt_perf ],
>   	'sw_sync': [ libatomic ],
>   	'xe_oa': [ lib_igt_xe_oa ],
> +	'xe_fault_injection': [ lib_igt_xe_oa ],
>   }
>   
>   test_executables = []
