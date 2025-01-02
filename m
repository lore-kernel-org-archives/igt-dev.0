Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C337E77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 08:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C2A10E3AB;
	Thu,  2 Jan 2025 08:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHi2b+aN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AE610E3AB
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2025 08:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735805718; x=1767341718;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0yyI++x26K09pwc4sM6WRb7NWsapeNWWwMXb7hz2eBg=;
 b=ZHi2b+aNIWCnZi+Z1eV0gMQaiF+P8S+hP5YYykC4dUgZTZGq3K8ivOhv
 DNkZYHLkk//u1S2Qdq8HPMWx14EChWT87D9Sj57D64LvKJTpP82+q70Fj
 H5okTggNcSb+LsriNbaQChHLcHkW7uOJj8srPd3lSBWz5h4FONTa0fgXS
 GDqhMy7iyo6+3T4SU9aRsA1TevKMKOyB9T6X6J6MklR3Shxc4mow2HK1b
 l8AggnsidprVRQln1mwhiIDux69EwlaAaa9F6jF5rvHMZ730LB7JyyQDf
 bqstJTXAcEbcJSU2OzT7m1mG23IifV9tsFuuG/66ug+04/MLxRJhUV5OX g==;
X-CSE-ConnectionGUID: qd1cSfAFTm2SETd0GOWUrQ==
X-CSE-MsgGUID: QR3LccF3QmKT4pNXMPMo9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36260778"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="36260778"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 00:15:15 -0800
X-CSE-ConnectionGUID: nWUDuVU2TVq1eljaTIC2ng==
X-CSE-MsgGUID: mSEi36XOSHSMNCLJXtUjLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="101288250"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2025 00:15:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 00:15:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 00:15:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 00:15:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXM3VW0z/xByUOQ8EO0o7xbFeDX68BQLUwDvrdSyUrVzG/x+mcMnCkJED4nDVeyfZLdpaz/8NtfT/1Niios0q/n1WwZymOdSBwmqs1HIUcSaJ9SXP092urYvygM2Cgtod3stovlZBObbhtwOs3uI37QZGrw+/Pba+e7/lzNJ3jgzhnjMXe+zsUnGWhkOgbjIkUxXnfY4bWzDtEJoj8U3VaYrDJVi3ewvkOmbJG7E2lENqXA7+D6rhnf87e467w2NO63ojghpLEDOnhEyfu7L09SYe1O/Xzhi97g/BGthgGv8X3XQeL9Y9EmtU+xCE8qObnkfLYlizz4AiGx/MLs57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDS6e2R61Uzg9mR7hsUk2uTJTKFJ2fO2+6RY/BsTqdA=;
 b=dQF2KlMg6qa841MqkbUONcDbqOTVVD5vK/jiuGjnA2Krq9S5Wcw+7agLYjLaRjLNxpvUN0qfQgdaD6r8nPWAohgb9OZW3gsRAqOzI4TyYmDsGQgH/sgRVidlgPj6IRB2xAS1wyFxsTOrYh3FmvggdszvIqhCqI/jnHACzERPEV8pgQF2cZniNIv4yiGW01VuAUu38KQIa6KT1lQBSwU83WjeY9gGhGGJLrug2SQGUUDXJDY2m5YEqxAjm6QHNv/P0UjaTO0wkPiE52NMXddDuNyp8gmbTrz+/EvC776psiDS1b7Jzu8Q3H4b0ikVgwp1m9S4CVetOCYY2/KFmF4PQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 08:14:25 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8293.000; Thu, 2 Jan 2025
 08:14:25 +0000
Message-ID: <e0b680c7-c7d4-45e5-9dbc-52f7cf83b9e1@intel.com>
Date: Thu, 2 Jan 2025 13:44:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v2 7/9] tests/kms_sharpness_filter: Add scaler
 subtests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241231130241.69689-1-swati2.sharma@intel.com>
 <20241231130241.69689-8-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241231130241.69689-8-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::22) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a404458-b893-4906-a1ff-08dd2b05784c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1FpdWN2U2ZlSUJGR1JpZGdocDBGNWI0b25xdHNycHU2bU9KR2c5Z1Q4WVls?=
 =?utf-8?B?Z0NDUGdtS2RwY1RHREZPWUNta3lWWUpGd0w1OEo4VnIvTnc4QXpTS0V6c2dK?=
 =?utf-8?B?MDVLMkhvc2s0Z3U2VHlLYmM0dEt2V0tLbUI5MWFjZHQzWXVQaDZYMFZDUlc5?=
 =?utf-8?B?KzgwVUJsNVlSR2Eya2t6V3A1R2VSS2k5VDRCR2tKQ3RlckpnaHp1YzlpbW56?=
 =?utf-8?B?SGtPM1BrT2FnSFE0aUZPYUg3clMzLzFPZjUvaE9XeDZZRGFLNFVpTXd3Ukd6?=
 =?utf-8?B?dXZMN21pQ2p5cXhKeTlXa1oxOFVPNjA5QTdyd1JFSzJwd1o0RTA0YzVIVTU4?=
 =?utf-8?B?RnRFZWhjQ1d2RTVNVkY4UW5TNmpodE5IZjE3QkF5ZXYyUzlGNC9Nc0F6MXhj?=
 =?utf-8?B?dmN2dUh5MDhrUmV6bzNWREJuaEdoYmp6Z21wdnBWQ3NsTng0a2tpaGtJdnBJ?=
 =?utf-8?B?WXRRSVdhWmlsV0RhNXlLYng3R2k5bVg4bzJsUktUR0cxNEttdHJxekgrV0RM?=
 =?utf-8?B?TlNGZEdBdEgrdFFnbjVrYWxWK2dMUWtZYkhYU09taVRpNHBud0tNc1R3K0Iv?=
 =?utf-8?B?cGZQSWdSeUw5d0lHSnlaQzZzdkZ2a3pIMlVBZzJCTjlBVk1peHZmWm5oVk1D?=
 =?utf-8?B?SnBsN3MyZjJleWZKeUVYYmc1a3hCRDF2a3pCL0Y0Yi9xRjBsSXd3dENWWEhM?=
 =?utf-8?B?STRpVzFyVjAxN280RUd3VmNlTFVGeVBvK2RuVG5FeUl2WTZrODZpM3lTRU5q?=
 =?utf-8?B?YlQyRXRoZzJVeVRZVUswQUxaRGVOSlZGQ2FoRUc1YUtGY3RaY0NGWUUreWZz?=
 =?utf-8?B?V3Z5TFMyZEgweEdFUzNYeTlnWTVyTVc1VVhCeFRNUEdTYkJOYXFIcmlIQS94?=
 =?utf-8?B?c3d0UWhobGlmVDlDRVd6Z29NYm9nOENwR21GZ1pLL2ZlaUpUQmd5ejNDZTNT?=
 =?utf-8?B?cDBHemtYa3paVmNEanZLTjRoVU1sb083WDdDbjZYUWtlOU9OdXF6SGVjeGo0?=
 =?utf-8?B?STdlYmpUL3RsMlNpb1AraEh0ZDdOVXR3dGgxTk9uYkRQeENneUpRYUc1Uzl2?=
 =?utf-8?B?Yy9Zc1hWUmYwR05SekFxalNRdzhMMUFtcjJWL3d6OHIvUzFzc1pMWVhmanV3?=
 =?utf-8?B?RG1CQ3dOdndOVCtWY1FIellRSzIwNFV5ZDFqamYrR3JlLzJHcjQzM0M2TFhx?=
 =?utf-8?B?OEJibEE0U3FRKzFhWlduUkk5NW9zaHZ4TzY4bTJPSTAvMGNPMTFRK0pOd05H?=
 =?utf-8?B?aEt1QXlGSWxEeFNkUktXWnFmTWRFSDkzNzh1djBkaDNqZGdHTHV0MU9ueFFB?=
 =?utf-8?B?dXoyMDNza0RRamRwR3o4d1JNOVEwbnNENWgzVHU3NXdGT3h5QU1kZVloeHdl?=
 =?utf-8?B?eE9mRThLNHBFNEdzM29qZHM5cHlsWmxRa3hVU3JzRG5sb2cwVzVBS3BIT005?=
 =?utf-8?B?NUE2VDliYitIR1J4YUIwUlJTK0FlY0NQM1hRLzJINzBCaGQ0cTJJUWpFTTN3?=
 =?utf-8?B?WVZrMkwyVngzYUk5WU5NQm1FeWJ5K3M0bGwvOTRKUGl0MUtpUWl4eVFza1Zm?=
 =?utf-8?B?TTB5NGwxUFZyVjdaNEh0Uno4QzFDR0VCRTMvNUJaTVdvVEVsQys0dnFwNTlN?=
 =?utf-8?B?NVNHNzQ2V0ZiWG9WUmFkWVlSZEdZTVUyZytIQlB3MmZOZHRocnJXTkEvLytq?=
 =?utf-8?B?eFpZdlNCOVU1KzFWbmlwSzJBVzBneVRPbGFUeVJ3RFBtQ3NKelp1Vkdpelgz?=
 =?utf-8?B?cDhwUTFYL01NOGwxTlptQ01ITmVyQlJWY1dwMDdOeTVPcldteEtTYWgvWXpV?=
 =?utf-8?B?YnRVWGZaVGg5TjlYVUN5TUlMZEV4VjBOMHZIQTNiMjR5aDByUkx0Y0VmOFpj?=
 =?utf-8?Q?NBlgDj6SlI4WF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K214NTFWQUVQM1IyV1ZxMjdIV2dlTHBPL3lIOEViZXRhall2bVkzUWJaSTVt?=
 =?utf-8?B?QXJVMSs4VmhLUzYwUTR3TUFKcFYweEVNeUxnc0hYcWFmd3Q5a2V6dnVSd1I3?=
 =?utf-8?B?SW5KN3JhU3VsRVdlb1Z6Z0VDY2czZ2x6V3p4QkFuWUNzcHRJajRvK3pOL2Q2?=
 =?utf-8?B?Q3BucmN2Qm9iOStsY1lZKytVczFwaVB2dkNkNFNwOVRsZi9seWN1TVVEUFo3?=
 =?utf-8?B?cjhEakU4MlhIeEhUNERQM0ZuSDRZVTBreCs1ZUxtOXRwWWY4dzdjRU9TMldr?=
 =?utf-8?B?b2ZtREwvSXlYREVOOTlSb1pUNyt1c0l0QzhDVEY4V1VnenVDMjB4bmMybGxa?=
 =?utf-8?B?SEcrZEpxblpxOVk5aVYzZjBoM3hvd1F3bVFjSlNSU1lYZGlYUXN6b3dEQTJZ?=
 =?utf-8?B?SDBiOUVxeDVlTnM4dnk1bWNZd0xabzdXalFvazRyUDRvTEtsbHFMM3BtYkI0?=
 =?utf-8?B?ekhyR1lpL2tjTnM3ZEl6OVl0NVpUZ3VzQ3llU1NUeDY3TVdiYnU1VUovYWdY?=
 =?utf-8?B?Sjd6dEw4ZnJ3d0R4Sm9tQmRRMm54c0cwQ0FTTFFJSUZHaVpLVXVKVXJodnp2?=
 =?utf-8?B?WWl5QXRKTXJreGxkUkRFVXo5TjA2TFUrem00VXI2ZlVvZXBUNXF5UjZwSlIz?=
 =?utf-8?B?RkFjTkQ2VEM4YXZPRDFGU3B5aTV3eVh5Y29HYUJIc3Q3c05kdDBYelBGOHY0?=
 =?utf-8?B?T3NDNzlyVHlOWCtuT1k2OGxFdkY4ZjNwL21zNTRnOXhKS0R5VFFqV2I1aUZ2?=
 =?utf-8?B?dU1SL3pRMjh0TGZaeUsvSlFVN1BNeUt2aEVMWHJmNTZjM3NLL2hFUDhuNHpx?=
 =?utf-8?B?cnlQbnVyM25DSUVtNWlJaEt1ZFFaWHNWajdPeEpvSXZFSjFsQTFNendkcitE?=
 =?utf-8?B?d1BXQzF1K2UwTG9qdVc4aXAzZkFvdEg5aktrbmJXT0RFNkRxNERGazNhVU51?=
 =?utf-8?B?eHJEa3dEcTJod1J5K0JreThpdCtPSlFrbnpvRmhldklTYWJETVJiOHBNclRm?=
 =?utf-8?B?ajhGdWV4QWZPdEpYT1hkNlZvUjRsaFFUT3N5TUtpK3RsMWprMmZnL0JPM0o2?=
 =?utf-8?B?c2dvSlh5NjhuTmZQeFhNbkt1cXZGaStJKzFsbllKYlFnUFBWUjRXd3dDS01R?=
 =?utf-8?B?b2ZsYXl2b2YwMi9leDFURFlKZjE0dFVSRFllWDFEc0dlcmhMN3E1bTNaUDI1?=
 =?utf-8?B?allqRVJDclNyK3J6VVFiVGtEVHp1QXJXQ1pQZGZOQkFhNDdycnZ5VXFhYkVW?=
 =?utf-8?B?cTZROHEzV3V6WUZ4d0xka3I4VnhqcFFtRHM4UnRVWUpxRVlZN1ZZaDIwWTBU?=
 =?utf-8?B?V1dTaHg5QTV1eE84c3Z0eFVpcEdZOFNmbHUyZjRnZVBKUkZ6WGRKdEtlMnl6?=
 =?utf-8?B?eGZuR3BObXcyU09TMCtYZDk1T1Y4STZaTkV2bGpMWS9JYmxmTFZGY1gxYUlP?=
 =?utf-8?B?WUtvaHU1RTRHZHhHNGtRSnNadUtUdmp1OGhBMjVUeUJJbkFPQjlzVEV4aWlY?=
 =?utf-8?B?YXoyNTRndmR4VWNHSUZBMEFpQXNwc1dLWG43MS9IZU9YRFdIS3NyYWZ6Z2RQ?=
 =?utf-8?B?L3RzSm1TM2dIYkFtZTY3Z3NtNnV3a2twdE5BYUd0cXdxTmhZN1UvN3R1bTRR?=
 =?utf-8?B?a3ptbGRtQ0FKNHhiRnJpaE1mdkRLVFRGeU42QzY5QWkzRW80eTZLakgxK3l3?=
 =?utf-8?B?eFpneTdwWWxWR0dJcXVZdVVLN0I0ZndhMUNzRGNmdVNETkdUUFJ4eFFKNlBv?=
 =?utf-8?B?TXRNSXAxaElvRzRlNkl2RGgwSHBoajZaZXYrNFQ0TkdYN2MySDhrRG84d2Jt?=
 =?utf-8?B?dEhMSlhNR09oVFlKSUFQeFNwSUJzdmljbFptYnZCbFBjdXJNMzlCSXpERFMx?=
 =?utf-8?B?TGVVdks4cXFyR2p6MWtkdEZnTTdYNXZJeU1nblIwN0wvb3VXQk1MYittYlVC?=
 =?utf-8?B?VjZIUGVzN256UDU5WlN5emIxQWZHZE53UkZpeE5GR0xRckZIRUo2U3R0amZp?=
 =?utf-8?B?Rnd0N0hrbiszVHZJZmRDM0Fwc2lNdURVOG9oYmdXRmRpSUVDZURHR3E0Ymx5?=
 =?utf-8?B?a3V5Qi9CSWRhMGtEUnVNNHdtTmt0a1lsN0l3dzhwSm40MGFQeWRoNzVaRk9h?=
 =?utf-8?B?dS9CZ2h1ZDZlV2lhSmRlbEVyb0lkYlZxTFdrNHkvbUs5YXdtLy9VQmtRZGZT?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a404458-b893-4906-a1ff-08dd2b05784c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 08:14:25.3171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bSan09be1qB4bKAGEk4fzZYLcvBQgFOFctabo5h5XS0ZEPxcXAiJZzJtlo3XwwSd47mHLJSSQ0KEcMYMCLzvQtrGYabsrol621Q2hUpVMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
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


On 12/31/2024 6:32 PM, Swati Sharma wrote:
> Add upscale/downscale subtests to apply plane scaler and CASF
> together.
>
> v2: -Improve description (Ankit)
>      -Remove unused var (Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   tests/kms_sharpness_filter.c | 68 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
> index 32ad7a752..3451a9db4 100644
> --- a/tests/kms_sharpness_filter.c
> +++ b/tests/kms_sharpness_filter.c
> @@ -49,6 +49,14 @@
>    * SUBTEST: filter-suspend
>    * Description: Verify content adaptive sharpness filter with suspend.
>    * Functionality: casf, suspend
> + *
> + * SUBTEST: filter-scaler-upscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled during upscaling.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: filter-scaler-downscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled during downscaling.
> + * Functionality: casf, scaling
>   */
>   
>   IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> @@ -70,6 +78,9 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
>   #define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
>   #define NROUNDS				10
>   
> +#define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
> +		||  (type == TEST_FILTER_DOWNSCALE))
> +
>   enum test_type {
>   	TEST_FILTER_BASIC,
>   	TEST_FILTER_MODIFIERS,
> @@ -80,6 +91,8 @@ enum test_type {
>   	TEST_FILTER_TAP,
>   	TEST_FILTER_DPMS,
>   	TEST_FILTER_SUSPEND,
> +	TEST_FILTER_UPSCALE,
> +	TEST_FILTER_DOWNSCALE,
>   };
>   
>   const int filter_strength_list[] = {
> @@ -170,6 +183,26 @@ static void cleanup_fbs(data_t *data)
>   		igt_remove_fb(data->drm_fd, &data->fb[i]);
>   }
>   
> +static void set_planes(data_t *data, enum test_type type)
> +{
> +	drmModeModeInfo *mode = data->mode;
> +	igt_output_t *output = data->output;
> +
> +	data->plane[1] = igt_output_get_plane(output, 1);
> +
> +	if (type == TEST_FILTER_UPSCALE) {
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	if (type == TEST_FILTER_DOWNSCALE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay * 0.75, mode->vdisplay * 0.75);
> +	}
> +}
> +
>   static void cleanup(data_t *data)
>   {
>   	igt_display_reset(&data->display);
> @@ -244,6 +277,9 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   			igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
>   	}
>   
> +	if (SET_PLANES)
> +		set_planes(data, type);
> +
>   	set_filter_strength_on_pipe(data);
>   
>   	if (data->filter_strength != 0)
> @@ -278,6 +314,10 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   	if (type == TEST_FILTER_TOGGLE)
>   		ret |= test_filter_toggle(data);
>   
> +	if (type == TEST_FILTER_DOWNSCALE)
> +		igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +			      "Scaling op not supported, cdclk limits might be exceeded.\n");
> +
>   	igt_assert_eq(ret, 0);
>   
>   	/* clean-up */
> @@ -373,6 +413,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   			case TEST_FILTER_SUSPEND:
>   				snprintf(name, sizeof(name), "-suspend");
>   				break;
> +			case TEST_FILTER_UPSCALE:
> +				snprintf(name, sizeof(name), "-upscale");
> +				break;
> +			case TEST_FILTER_DOWNSCALE:
> +				snprintf(name, sizeof(name), "-downscale");
> +				break;
>   			default:
>   				igt_assert(0);
>   			}
> @@ -529,6 +575,28 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
>   	}
>   
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-upscale") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-downscale") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
