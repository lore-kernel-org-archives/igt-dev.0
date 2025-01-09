Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621CFE77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 04:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A2010ECDC;
	Thu,  9 Jan 2025 04:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DICQuUI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B750910ECDC
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 04:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736396790; x=1767932790;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1JbP1Du4F2W9upx0W1P0yHQD9SuC88Zmf00w3tZfMB0=;
 b=DICQuUI2ugt8ANO+qRyYJrruy50XgJg/wxgDQEk4dY18/0hw1nwKOdy8
 KWrWKBQl6ELqgncO7RSfu17k+ReWuMfQN9Tqy1lZFELAjP/FFQwXu6t11
 dK2W6jKEPf2u0fwljTvuM4NBiJHXU5kfZF5TF87uuF771akup5uhLAg5U
 ydgB+ZpfqEvIm31T3MZ15d+ypPtJvUMS8ccGRIeqm6c/gzBYb/u1NRkvp
 NwwkNCkuAulCrqMXBk+/U1LjuTWdLBglI/o4RG+eYWSCabYwkrAnsvGQD
 OzoKzW75FjXBh9rGVvjM/gupMOm8FlZJdo/O9kQQmJ209v1s91T2mIwov A==;
X-CSE-ConnectionGUID: 1IgCM2WNT4uB4MVd2sRTQg==
X-CSE-MsgGUID: TR2XIWaORkica+EF2zyOcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36756755"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36756755"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 20:26:30 -0800
X-CSE-ConnectionGUID: wLgHAHUgRViGKbrvjRTT8w==
X-CSE-MsgGUID: ibBkAFtHQ+GEatMZVyy1tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107332703"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 20:26:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 20:26:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 20:26:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 20:26:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQYUs9V9CyYlj6KMjIXMZWTYV82YUXnpPVDGPt7VrrK6eSBNCg31NHrjHi3xeU+o5rC01lbtYjnz+aobXhlwpoEJh/QoWe8lYXo8bPZofj42AHXvIX5RanAHyKzHzAYh5rDad27/sof21MO3Vi13iWkx715udyE0EdDuxccTGIEPX/FEe3yYn0Ez4lQTwbFHkOCXRzMwU0OOc+P3zWVxDSoHAnpCMa2RLuyne187U96phdPp3vkIbLMClyFA1C4WnvQjgVTBEsaaSGRX6sOef0n37iTqUJu4b2ztY9PYOUM+ij8wgolL3/GMosgjc0HmKFpNhN+q34jSe5lqJBA3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmlyeZJB96W8lFJQlssXiBJuXCGUKxv02N5839+UInw=;
 b=rIetQfFMA4t6t+wey1c7kvkxTu/KIW1OWdHtBnVdrlqS7xqtV0K8d235yeI84Xd0khLHB6uTiS55v1GNN96paUuwk31qkTspbtgxG6KqpySKJSgpJwKRHKsG/mk1xPRZ/1g0vPOAKHUj9YhMIZdDKKnm+ooBeIkjcs5hjSpCycMfXe+qlQ+y+04qjLsCT/MTNLV+th5pR+QsO3qiHRwDDOf9qTF0CIOxOpU5s7dzLKDqZYkzErxs5fG30mNL9kJJmF0EosFpoiE3SGn/9adIhq03o9rx9cBNGPBM6n4vyJsacYS23WbN6Auf2rIdFVsOHkDm9JV3NapGeWHNsperPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 04:26:25 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8314.019; Thu, 9 Jan 2025
 04:26:25 +0000
Message-ID: <dd202ba1-f4bb-4307-b56f-216894e17d87@intel.com>
Date: Thu, 9 Jan 2025 09:56:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] drm-uapi/xe: Sync with OA uapi updates
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250109032331.2774067-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250109032331.2774067-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::18) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 1621e362-936f-4f07-83d4-08dd3065c777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0xja25EcEU3UkJaWGNJbm1ic0pqamVMSURrOE41SjVNeDc0dW9HQUZWMnVw?=
 =?utf-8?B?Z2FvTzlvMXY1cExsWEs3djFCOVJvRU82TkN2VjV4TktWOFRlTGlnaE5jcThL?=
 =?utf-8?B?UHVRRUc4S3lEVjMzV3lOZjZtSVdRbmxOdjFtU3g1bnZ3Vlh3YkdsUlhURGxT?=
 =?utf-8?B?Nzh2eU1SY1NwQVNoNGl4UEVBN3I3V0VNQzMza1F0OXpMV1VWL0loM25iRzEr?=
 =?utf-8?B?OGVTQ29KK1dyYW96a201djErSjh2VlJkOWR5eGpOakNIWUwyWHcvK0piQlBS?=
 =?utf-8?B?bWI4Wmc1bXJSS0V4UTJsam1ROE1TUDRETStrSWZJajFUUU05QWg3b1JBZkMr?=
 =?utf-8?B?SndyWFZVZVBNak4rbXlCTStNQW02dXBmZnFmRWZhMXhORmhYdmpNeXN3b3lT?=
 =?utf-8?B?TWFYT2x2OHVGMnZHMFRvZmVkTDBhVUJhZTEyTVdtV2xzSGhzMUltZnB4NlhF?=
 =?utf-8?B?S1ZVdkY1dWtGSTFYVjA2ZU5xM0tyak92WjNZY2RLZ0VlV0U4RWgxWWpkU3lj?=
 =?utf-8?B?WjE2bXZ6YXdjZ0lJR2Z4T1A5NlZBOUJQbk9iT0F4c1ppM2J6WmFzcFhuWUFX?=
 =?utf-8?B?bXFYZXR6ZHYwbGZMRDZQQUFRZUZvYlNsMm4vTFZCbHp1RldPNUdWYnpsZVpq?=
 =?utf-8?B?U3I0VEs0Ym03WEsvZi9ERTFFYzg4R2VDOXVNVnVheUdUU0U5OWM2Qnk1YzdO?=
 =?utf-8?B?bVNzZWNqTkcyNjZHYjZkSEpNbXI2d2pITmN1Mi80aDdUMmI0UmtyUlVCdE1n?=
 =?utf-8?B?bUdUSFlzVGFZMnZadDBUZjBYWndaUU03RlRXK2liQjJ5R0xSRXJUYUxIb0pF?=
 =?utf-8?B?Z3lzNmk1cjhma09POEI5Qmp5dXhna29qN2tZM0ZnWHU5eS9yRDU0QVIwV3Yw?=
 =?utf-8?B?Z0h3NCs4K0hJT2tiR0l0Rjg3dUJxaXlYQ2x0ZnRiSklsTUd6bnFCZDcvVUwv?=
 =?utf-8?B?RExLVDhMVUVLci9MZ1ZBS01OUWcrYWE2SGd5SmJjSUVSTmxqeFhlRFdFaUNi?=
 =?utf-8?B?ZlpoNlZnQmtCdkhZVUczc09nTnI0QitJWmVHaFEvS3RubkdPNmxrdVNOMms2?=
 =?utf-8?B?a0ZXZlVSRWZwWFliSHZjeUNGei95bzYvcUZvMHJIL1Q3ZTRFbEI5ZStQOW4z?=
 =?utf-8?B?ZEd3WFZLNGJ3N3o0RThTZ1JaU2JHcS9JQVF1bk1jNkJubVM5cGkrZWEvMG9w?=
 =?utf-8?B?UklzdW5wV0pXdjJVL3lCdWY1OE9kTWc1NTI3M25QeWtxWnR3T09qbWpwdGNE?=
 =?utf-8?B?cUZxRUVkZzllaU9kRkdyZFR1eHJDeXNXMTF5aFNIZlFjTEYzVFJ5YkphT3BL?=
 =?utf-8?B?U1NreUtLaDErMWNralQ4ZXN6ejh1c0R2M3R4OGJDZ3dpRmFUSlBwam1yallr?=
 =?utf-8?B?WFZzK1lPRHV4R0tMbms5ejZKaWJIdWloWFpJL2lxNDVGRXRQNDQzblV1YzVt?=
 =?utf-8?B?YXB5V0NUckczVjkxRk5yRThzNjZBNm4rMEZKNzVSbXg1aXlYRDhrdlFjbGR0?=
 =?utf-8?B?a1UvU3o2MlppekJjOFRldHRJdURHU1JQWXQvUk1NVnh4ZWRTSEhsclBIaTVl?=
 =?utf-8?B?ejhTMFRBSHEzdXNJSTY5Zksvd3pmc25heUFidUlabTVUN0dzM054WU8wYVNF?=
 =?utf-8?B?VHBjUC9SdXNzdlRvci85UnBLWUtLM21PRWZETnZFUTBnUWZiN2ZqNit1dU96?=
 =?utf-8?B?VktvWS9WU256bmFmN1BKZjQreHVSdnNrMWRHcmRiSU53MXQ1RzZwVXRXS0Rk?=
 =?utf-8?B?SlRhUms1NnRBODRIUkwzN0tyRlZnNnpYYWlpZ2U2czBWS2k2OVkwTEROc1ZQ?=
 =?utf-8?B?S3lFVVF3dWg0bmY2cEdCUGJUY2ZvZC8zNDI4MkE3eC9LUXc0NTRQd1BGaktz?=
 =?utf-8?Q?f+Ald7WbZk3iv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czBCZm15bFhoc00wYnYxbUU3Z0krU3ROM2tYTzA3V3FDMG5veVl0YUpCM1FT?=
 =?utf-8?B?YXhtTk43a1BSZ1lpK2ZtQ2hpNzFNdFlaTEJNL2IvTy9NZVFHelRBcEZhOUcv?=
 =?utf-8?B?KzJwamVXWDZzQzdkTm5LS25LM1djTkZzbXhTTjFNcEpvSU9mNm9tQ1YyRlhC?=
 =?utf-8?B?SkkzdE1nUzBYRllWdk5mM20rMXpzMXdaS083ZXRibWorL3R3d3ZzM1dhQTl4?=
 =?utf-8?B?ZXdSSElidklJdFZvTlpvaXBwdDlhVGtxRlFBeCt2TTRkcDQxeWU4eEhZendy?=
 =?utf-8?B?ZzZPdVZJQ2VxU3dYdGlpN2pKcXNoS3R1U29EWmw3Mm1UV3hFbEtlaEZNdkJT?=
 =?utf-8?B?TVNiT28xM1NnYTJYWTFNU0l6bTdUeThtMG1zSm5keDhDWXBjeHZSU3R1NFNt?=
 =?utf-8?B?K3U1RzRLMHB2VEE1YTI3Q0FoQTZKTUpkK2VNYTJTaXlFVzBsNTBVYWpoNlRW?=
 =?utf-8?B?dFFpUkFmVDFUWFZhaGNsek9JK201cXpuWlZPSUVKNnNjRHMvOHJ4SlJWRVFh?=
 =?utf-8?B?b2JQM1NmeHdGb1pvZkRZNUJlc1NycFZMSlZjWUpGTnBCd21IODNtYUpBVUNt?=
 =?utf-8?B?eE5YUURTTHQ2TzB2MmdIQUFqM2phT1VTZlhJUDZoWXppVnlscXlVa05wN1I4?=
 =?utf-8?B?UDZIT2NhK2M2NE5uUGNyRkhHcndybGxpUFBwRVJNYnpxVDh2S0xPUzNsTWZY?=
 =?utf-8?B?MWEwVVlMWXU5YllIcSs3WnNjOHB3bEtySERUU25SNXFpbnlpTmFHZEVxbmgv?=
 =?utf-8?B?cmJOV2R2QWhUTkdLTEh3UEhjOVRsMUd6ZEtwQUo5SHZKR0JVTElFbHkrM1Nw?=
 =?utf-8?B?M1FYemtLSzV1ampHRzNhTTlHYXRtekRrM2xhbUNtdENQTGxpNlFwd1h4OTcw?=
 =?utf-8?B?bmhJWEI0c3F2clRJTHVuNEF2TlN2M2NZdzVMM1dYbnVGSURGYXRxUENTTFFu?=
 =?utf-8?B?L0pxZCttWEI4bWxwYWI3c3FDb2Y3NzVJaUV5RURkODd4akptRXdZelNKNlFx?=
 =?utf-8?B?K2lYOFhIVUs5dDZyRkhHWGRISlg0R1Z0cHVLeCtSOUFlNHhTN2h4UDFodTlr?=
 =?utf-8?B?M0NwN3UvQWxnR0RQY0l1ZWVWVnpRSDJFK0ZnS3ZjMVBFdmpDeUNLQmo2b0tK?=
 =?utf-8?B?QmwwditMUitXNzBFVjM3aWlhcFQwemRLSTlFSytUZFhhWTJZM3psV0ZQejcv?=
 =?utf-8?B?cHd5MkRIcll0VWIyOERMclBpMG5lS3ZQbEdNQ2JCZVY2OW9XV1RQTXZCUmFU?=
 =?utf-8?B?a2lOcGdJWk9Dd0FLZmtDMFIzTzgvUldIVGlLS3BKTFBWTll5c0hXZFZSVDkz?=
 =?utf-8?B?QUtUWVJEOW02dXd4MURtUFBpVjE2NUIvajdJdjh0TytPVHNLSCtYa3VNRjJp?=
 =?utf-8?B?TS9ZUXU2a054eGVlMmtYcXZzYys5bndyZnRwOGRJTmVsdUUxUmhoRytkd29M?=
 =?utf-8?B?bFdjNVprNVQxWUFjdFBnUzZDVFc4UTRpMGlJUTZJU0NCcUY0RnY4VmsrckVk?=
 =?utf-8?B?bmlHbHVJWDJsOFdPckpGYkd5d2wyWkdqd2o1SVh5dSs4d0V1WkpoaFlRQ1Fy?=
 =?utf-8?B?WHZzR01KUXpFV0dvTmJLamZPMml2bUhuOERUN1duNmN6ZWV1Vm9WZGI2VWU3?=
 =?utf-8?B?S1BoamkyajNGSEpNQ0VZWVo5UmUxenM5Z1hmbjNsT3VIN0NSdVU4TElSMGUv?=
 =?utf-8?B?VE0yNW5TNllmTE5xM1p6cGRpeVNYa2dMQUJnWW54T1dBamJJMEtJZzZERFY3?=
 =?utf-8?B?c2xSbjB2VWtMNXBZRmpHYjkrUUtZVXFFWjNGeEtGOVBlMSt2YnhWMTluZUgz?=
 =?utf-8?B?Wm9Lbk9hWDR5cFRDOTlFc0xmOHVlUjhoWkxiYWhSTFM1VElmQUlaQU8rbHl5?=
 =?utf-8?B?MUdMeUxPY05RMzBidFdFbnFZd3Jka1RlSEphWFEwRXZoMFAzeFdnb29mRStZ?=
 =?utf-8?B?TjdrNzVWTEhEdDFQV2VQSElTVVBvYW9RKzBBbHA5UlY3bnd2bHI0RmFKUHJY?=
 =?utf-8?B?RU13NXpOZFM4NnpnUWFDS0NidnBaZXUwSXhKbEVwNC9yRzI2bWczTXlNaDV4?=
 =?utf-8?B?dHJNQk1GbS80cUpxVGw2VFlqdFZtY3VLUEh1eXk1Mk9vNXhpdGF6azlMbkx4?=
 =?utf-8?B?SUZMYUp2Z05KMDZsUmdPZzBjNzZSL1RkbU1URG1FSGhzKzU5K0RTTWFqY2JF?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1621e362-936f-4f07-83d4-08dd3065c777
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 04:26:25.4079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RaDVd0JGmID6bIvjKnCNQZikXieCQiWImlsfuDJOdq7e6qejCJrxEAxQdwEGW5eIxZdCKpTLbomSkh4MTK+0NSJR/09VJOAEbKU6UMCGKc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
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

On 09-01-2025 08:53, Ashutosh Dixit wrote:
> Align with kernel commit 5637797add2a ("drm/xe/oa/uapi: Expose an unblock
> after N reports OA property").
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   include/drm-uapi/xe_drm.h | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 56163eb913..08e263b3b2 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -134,7 +134,7 @@ extern "C" {
>    * redefine the interface more easily than an ever growing struct of
>    * increasing complexity, and for large parts of that interface to be
>    * entirely optional. The downside is more pointer chasing; chasing across
> - * the __user boundary with pointers encapsulated inside u64.
> + * the boundary with pointers encapsulated inside u64.

I think this line change doesn't exist in kernel. Was it intentionally 
changed here for some reason?

With that addressed,
Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

Thanks,
Sai Teja

>    *
>    * Example chaining:
>    *
> @@ -1486,6 +1486,8 @@ struct drm_xe_oa_unit {
>   	__u64 capabilities;
>   #define DRM_XE_OA_CAPS_BASE		(1 << 0)
>   #define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
> +#define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
> +#define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
>   
>   	/** @oa_timestamp_freq: OA timestamp freq */
>   	__u64 oa_timestamp_freq;
> @@ -1651,6 +1653,20 @@ enum drm_xe_oa_property_id {
>   	 * to the VM bind case.
>   	 */
>   	DRM_XE_OA_PROPERTY_SYNCS,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE: Size of OA buffer to be
> +	 * allocated by the driver in bytes. Supported sizes are powers of
> +	 * 2 from 128 KiB to 128 MiB. When not specified, a 16 MiB OA
> +	 * buffer is allocated by default.
> +	 */
> +	DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS: Number of reports to wait
> +	 * for before unblocking poll or read
> +	 */
> +	DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS,
>   };
>   
>   /**
