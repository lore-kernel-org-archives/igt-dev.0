Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222BBC0219E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 05:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B28C10E417;
	Tue, 11 Feb 2025 05:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxAOCqHT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC4810E417
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 05:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739250268; x=1770786268;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DjwvNrsidN6ZHL1FYaNTuMqBRYubOdo65PEgxU4y4Vw=;
 b=VxAOCqHTkrqVIeuOPmXHdB4dxKBfJJTi1pbVNn+aAJb2WOWTzewpbpqD
 i7GgiEEc6PGQI2vtH8JvSrwa/WeOAgKQeKQpP104uclDg61trYGXZqaxP
 2sqExHV+w8hHTqhwgCqcnVw00booyyd26R06rzwSBi05jbWfAdn1mbw4l
 oi+QUf3wYiMeaQpFZ8p69QQ83t0Iq4F76329YbgO7jgrzTtuQz2IHQT9U
 XSzc/uFQj6VdHKYRghrhgixQFAZBLBhVk7OK7NcWajlmX7yODabS3m7WP
 KkTbNfsIIaxceJjS8rIVPeoJyw38qt4lwXBEVOH0dhku1jI8mUWBZAS1S g==;
X-CSE-ConnectionGUID: 805by59NQ+em3PxKiTmbPA==
X-CSE-MsgGUID: dtpOi/S1R4K1o19H0Df5yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39718706"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="39718706"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 21:04:27 -0800
X-CSE-ConnectionGUID: lqjJf2MWSTOEVhmPMpIIMQ==
X-CSE-MsgGUID: Tx6JZzQNTGWUhoObZJtGqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117597426"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 21:04:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 21:04:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 21:04:26 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 21:04:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOvrQcXcSwe7gFp8Zv5c5cWeXxAe9mw9aE1BJLRfwWMXsGQKqDD4C0Kmi0a0+odvS1VT4BXutjR6RJ6YZbL33anURUVR6RJQZCJF3vlqmFRKiU0YatLVdrSW8B3lGa6jWZnGSGInmkefEf01vUf1WasyNIXhcvuEJ8tKw5n9GUSeimkm40gfP//9lNzLNr8o/bPTV1qgrxboJv4ZQ0O3Z2aoHK1PA/rNn2AKb6HknRqFw7deTBtzcLFsb1WqGE1QnOMypd+vtFyGQpa6/uNIwO4wX665+AhcMPX61Pk139uQWQ0mO6lRIWUA8s0H2EbHarBz2MR9l2LKWtmReJHx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSJI3RIOt+UdQ6aHhToKMS5/IRc3nCPMHKUwNRpy3Fo=;
 b=H+sOsq1NTaf7w0YUsQYhtJsgO//1EGepd9ZZmDqsRoGMynr7L+1x4lopktgFrHOU/zqDlKuHTabdMQKEevQFxv2egvipF48dDxLIJMvAIMa7Jv6j2tT1es/NXaOZ6k8PT7LG7pcdaiUKyqNPTPl664oEfn9hAep0g4r7W5ynTNuyvy7/xAxCpIJj0ybTgONkySo7JqGMwEockVU78FF0gV7RsCgiU/kgs/un076OQv5hh2+rk3G7HQ9jEt1AIsv1oXthpU1uLNM8umNDx+GBXgsmV/xIMxo4zAY3Ag4X3O6iafWsQhkA3pzRiwPvRTJ1X1tFltU9HFpg5uzqxfNKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB6613.namprd11.prod.outlook.com (2603:10b6:806:254::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 05:04:24 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 05:04:23 +0000
Message-ID: <58a0f9e6-0d4e-49be-ae1f-0d6457b6e326@intel.com>
Date: Tue, 11 Feb 2025 10:34:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/6] tests/intel/kms_dp_linktrain_fallback: refactor
 dp-fallback subtest
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
 <20250210185606.1327892-4-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250210185606.1327892-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: c20cfc7d-aa8e-4a17-a8c5-08dd4a598d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVlYa1lSL0tITENKUU10RlBJK1ovRko3b0hwK2JrZWtRaCt3aWVpVUFTY0tn?=
 =?utf-8?B?N0tEdUxVSkkyTWFyOEJ4amJQUkIvWXNHdnlhRitIb0QzR0JlVW1uSkdoRWtk?=
 =?utf-8?B?ZkFFaDk4VHg5RWFMYlMzbG1WWG5veG9CSkhPUmtmTkxSYmZ1aHE0dEtUT3JO?=
 =?utf-8?B?VlNHY3RCcUdwMFY4NFdlSHhaUTBSek9zSnRQMDc4TGlTV0laaXNsZnhteXlk?=
 =?utf-8?B?Wm5VTjVtUEdOQmdLMUx2d0QvVk56azFMZ2JtU3cydENJamV4VVZEQytIWW02?=
 =?utf-8?B?U0h0Q3NOVXRoSDZOTzBJRy84aVhLUnh0L3hWL09OZS9hSlU5cC96QXU4S0JG?=
 =?utf-8?B?Z1RSUHNnSnplVlI5UEZKcE8yWFhmZzl1cCs2ckRxN2phMXlsVXVaN3hlR2lP?=
 =?utf-8?B?YkV6RW1iR3lESEJ5SUpMWlYzeFkyREdybnVPRzZhMWsrK01oSEhCT2VFbHdN?=
 =?utf-8?B?N3BxenZXeXVjTDBZSzg3VUVFcGZ5Sm9BNU9jZVFlTEp0Y2hxbW5qRXBvMi9D?=
 =?utf-8?B?SmpYS1VzbnZUak9FMkFnc0RQcnR0WDhObHllWjBnaWVjWHMzRzNtWDNvRFpw?=
 =?utf-8?B?ZmVFZWh3SFFCM2Y3WE1WNEtsM1ZZMENmU0xURmoxaTlITitvRC9ZbDk2RVFH?=
 =?utf-8?B?V25qTGdWbGgrcFBjaFhZSXBvMjV5aGpCa2dUMjJHWGs2NCtsUEhlNTRYMjk0?=
 =?utf-8?B?dk92UzZ4Q0d5UC9iTDBQYmtrLys1UlJzVlNXZWUzYmVtSzhzaEl0aTZUMzhW?=
 =?utf-8?B?VkUyYk91KzNiYUdRSUh0d3B4SytEODJQcXJlVGVYQ0k5Qys1eEMvVnduK2RM?=
 =?utf-8?B?UjNDaThGUWtZVjU1cjJUVlVEbEN5S2ZnWWRyeHBKV3RqRExVS0Y3UnptMHFx?=
 =?utf-8?B?d1VLRGRaME5NN1FuK2dISjRvWWhJWGVRZlI5TVVGODQ4OWpqL1pWWHNWbkZp?=
 =?utf-8?B?dWl1K1hUT3hZMVBOaE4xR2ZKNCtReGdvcWs4bjBWVDlERnkxdEZwZmc1ZkdS?=
 =?utf-8?B?WEpFL0JXZS9xRWlhbFM3Q1ZKZUVxbmVyc3d3aWdIcUwreWQrT2VrSHRPZnc5?=
 =?utf-8?B?RXYvQjJnejZ2NzVvVXZNajhORXlqdlB4ekFQYUFoVGdiaTR5SVc2VkcxdHJt?=
 =?utf-8?B?dEVoZldGNnNrQSsxY2lmZmRIZGZRRkttQW5nOVFVMVo3VFlQK3FrNG1KeVU0?=
 =?utf-8?B?Nm1VOVFyTVRZRzVodmwrZ2c3VjBFNzFYNTRIelRGV1dmMjJWNG1OOFRtU0NY?=
 =?utf-8?B?K3doN2U3LytCQS92a2xnUkdFQUFjRmZpVVBEdDBHRVdPK0V6NXp4d2RpalRS?=
 =?utf-8?B?azFrdGZPODg4RHhqUjd0V3lzU3lXM3JGeVZCWFovaGFySlZWbnBGQ1dvcENK?=
 =?utf-8?B?andHUWtxbWtYNGdCSFBsWXdBZDA5NThMS3RmTDlHZy9TZ2JQR1dXZVA5K3RU?=
 =?utf-8?B?YUJqemJTMHBram9yRmlRaVYzOUphR0xlWERheG5mMVZKblBHWDJGbWwvdG9G?=
 =?utf-8?B?Ukl1UTkrTFFTRUxFZmVEeEM0WGZrTWVVWjJjWUNjeFdYTWVBNllnS0JwZ0kv?=
 =?utf-8?B?VHRQS3lFTGNuRVhSVUpiZk5rbzIwT2hDSzJodEVkY1NnOGFnQzhOSVUxemFT?=
 =?utf-8?B?Q2FOS21YekNObWtmMGxCelRUUHhaTlZJUnliNksvcjRYM1lvTm5ENVVqTUZV?=
 =?utf-8?B?bHdwNWRBbW9tZ1VkbmJWSmhzQUp3Y0tyamlIM2hwcE0zUHIzcjhEKzFFYTFL?=
 =?utf-8?B?L0x1YTg4WVZtVTRRTmw2dHVFMW5zZ1RhTC9hRCtRLzJWTmhINjBqR2VuMkV2?=
 =?utf-8?B?akpiTXNTVlZRbWw5R1k4Mk5jNmhwcGxXQm1hUTNXdlhub0dWWGI2QUJHZ1hR?=
 =?utf-8?Q?KOuHgFbuv5xYf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0VPQkJUa2dCSy8vZjJPWHJIektxdGJCT2tMMnFOWlhXNGovUUFxWHd6QytT?=
 =?utf-8?B?M0hDc2N3LzRLaXp6VnZZNmc1YVl2L3J6UkpqcXJCaUpPckVEV1ZvQTZFS2dS?=
 =?utf-8?B?anVkZ3V6U0FYbzZXMG9TZmNZRk5Ldlh5aHo5cVlqbjZYUEVnbXN6c0xrNDFx?=
 =?utf-8?B?YVlyOHFRemcxSzc0b0Jxc1lrL1V5Sm0zTlhlaUl2YzBta2JkQ0JsZis4bzlC?=
 =?utf-8?B?MGhQZmpQSVJhZS9ZdU5ZeTJXZmZsbSt0SVpWamZnZDFYZ2MxbjlzUUxsZjY0?=
 =?utf-8?B?ZHM2Mk1YYnZ6N3NMN3huZ2Uxa0dyR0NZSzNPS3dZeFNXS0FYRUpTL3dDaEFO?=
 =?utf-8?B?Vmc5UVp2SFM2bXg4c0N6d0ZMT01aUDd1M0pDdG5MUnFTSnFLM3I3c2hKc2Q1?=
 =?utf-8?B?OTZ2UE54RlVXckFhaHo4c21CQVk4dDR4dkdvZk1IN3pqd25ON0tydWhLblkx?=
 =?utf-8?B?UTNSaTNuTjljcjZFbi9zc3ZJVVhrZWhYeTNNLzl2V2FzMmVPWmtJYUNSV1JF?=
 =?utf-8?B?eVhTUUtlT3NHV1lMVU1VVXMxTk16djludDZGd2VzNnZBMDJpMjlwNHFpbkJL?=
 =?utf-8?B?QlcvaE1URVlzcXpLTWhPMUMzQ1l6NHlvNHduZG93VGo0MW14MUQ4ZHZzaVYr?=
 =?utf-8?B?ZXVTalVhUUlNb3B5NEFUNEd2N1dSNmsxdWlTZ00xazVNODByM04yamMwamVr?=
 =?utf-8?B?RTNneVh0akFOZUpieGMyRFRveUVQUjE0dmswR2JqcW9SeUZYUXFmRXFMeExF?=
 =?utf-8?B?OXgzMU9aTXdhb3RhVERFQ1pidnJjZFhyd003a1hNOXRFVHl3MlhBMGk4Mit2?=
 =?utf-8?B?QXJjZ2NZUi94NmR6K2lGSmlTejlUWEp6UDRCMzAzZnVuTEVqZytPbjlSMXNa?=
 =?utf-8?B?Vzc4MHhOSkRiRkY0VVBrSDdlZHVNM2JhSFpPOWlQckxqMURkZDVWWHR3dmpR?=
 =?utf-8?B?NGtLamkvOGZLa3VkUFdmdWxHbGV4QlloV25pL0s4eG5rK0paNnd1L3N4Z0hs?=
 =?utf-8?B?QTV4UUVrKy91OUZsL1lnNmtLS003UFRNRkgwN3VnQTFHSTkwRzlnZGU1eFJT?=
 =?utf-8?B?aGdpRElySVdyaVVCVTV3NjVkYlozbDhmcDNBaG90VWZmUXdFYUxtWDBLKzhC?=
 =?utf-8?B?YkYvb0FQc240eTJOSkx3RWhCT2FWekxVNlVSam5KR2NhL0g0RnVQSEI5cVFp?=
 =?utf-8?B?MlFzWmRCK0puUGp6L2VLakR2ZTJZOVhBV1NpaXJxVU9ER1ZwL2tibHFlZm1D?=
 =?utf-8?B?ZmRsUnJVQktWYnlyWjRvd0dtUzdJUTJENGxhV0RvRDhJaHJlUnZna29mUjFn?=
 =?utf-8?B?SGlOdmFGV085Z1RvYm1iVTltVnA2UXBzQW82M1Q3NGdXek8yYVRmUjgyYS9o?=
 =?utf-8?B?VE9ieFdvdzI3eU9ISTVOam8rWWJCWlZYY2JnU01yb3UyVGlEM1FqeDZxMFdV?=
 =?utf-8?B?V2NSYUpvVFUwYktTNDNnYkpKZVZ2Zk1YVUtmdmNMbC9QNjBpOCtsTWlSNkV0?=
 =?utf-8?B?WnQzV2F2WEIxMXk4TWRvM3ZVVlZ0YTlQbEpEanBZZ1RyWkphZWN1Sm1jVytC?=
 =?utf-8?B?WGtQZ09GSmRSMTJFRFB0cTdNS0wwbmt5eWxJb2lkTWI4ZlRBNUN2RkREQ0Fz?=
 =?utf-8?B?TW1LZjhCOTBYa3llazZBOStLTWEvUDNYeGNTTmU3czlxbzVGOXRNaUdvY1RX?=
 =?utf-8?B?eUp4YzVYVWtqdjR2b1QrQ0N5bkUzbHhiaksxbFpENDZad1VFcCsrMTU0WjNV?=
 =?utf-8?B?MWlONXhxWFlmNGJuQ1NGN2w3cjc1ZTFOVGhLUG0zVkN5YWwrdEE3TmNld0Jp?=
 =?utf-8?B?VUY4WTdMcGI4RkF0V2ZoUE9Cem1WQ2NvWXZIOU94SVN1YS8xT3ZiSkg5R01w?=
 =?utf-8?B?RUNialFGYy9pb1JDOWZ2T3cvV29DcHUvY0NneUdRRXZLa2RhOFUvSmh4aXZo?=
 =?utf-8?B?ZklkQTROWGp3MCtrSU15VFFuMElPK2hpZUtxbE9FbEdlZjNPZVdMdzh1OEli?=
 =?utf-8?B?OEEySEd0VWM2Z1d0c1paUnhIaFFJVGt1ZHMvM2dwZjVCeXVyZDh4eUJoQk1m?=
 =?utf-8?B?dDdlT3NDN3NrWnlFRFIxenIzNVFQTWV6NDRwTjBvUUxCQ3hmMGlKeVlEYkF4?=
 =?utf-8?B?UzFWZFVWdHNiSGQwQzJlcVRKeG84T25keC9mUzZGS0VHa2FmcmJBNFRvQmJG?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c20cfc7d-aa8e-4a17-a8c5-08dd4a598d0b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 05:04:23.8900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vi8BfP6J8trkUB/c9qgjjwHj5ddsOyeNo9+h/hpvBESFh8REBN7/X0fljA7vzCEdZXH80oRaw9GknhYBh/ihn6tDuN5llwPQnV2Or5ra4Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6613
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


On 2/11/2025 12:26 AM, Kunal Joshi wrote:
> Extract some of the logic into below function for better reuse.
>    - force_failure_and_wait()
>    - wait_for_hotplug_and_check_bad()
>    - fix_link_status_and_recommit()
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 160 +++++++++++++++++++-----
>   1 file changed, 130 insertions(+), 30 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 95aa7eee4..284e6b9aa 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -238,16 +238,124 @@ static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
>   	}
>   }
>   
> +/*
> + * Force a link training failure followed by link retrain, then
> + * block until the driver has no further pending retrain/failure.
> + * Returns false if we time out waiting.
> + */
> +static bool force_failure_and_wait(data_t *data,
> +                                   igt_output_t *output,
> +                                   int failure_type,
> +                                   int retrain_count,
> +                                   double interval,
> +                                   double timeout)
> +{
> +        igt_force_lt_failure(data->drm_fd, output, failure_type);
> +        igt_force_link_retrain(data->drm_fd, output, retrain_count);
> +
> +        /* Wait until there's no pending retrain */
> +        if (check_condition_with_timeout(data->drm_fd, output,
> +                                         igt_get_dp_pending_retrain,
> +                                         interval, timeout)) {
> +                igt_info("Timed out waiting for pending retrain.\n");

Generally debug msgs do not have full stop/period, so should remove this 
from here and in other places below.


> +                return false;
> +        }
> +
> +        /* Wait until there's no pending LT failures */
> +        if (check_condition_with_timeout(data->drm_fd, output,
> +                                         igt_get_dp_pending_lt_failures,
> +                                         interval, timeout)) {
> +                igt_info("Timed out waiting for pending LT failures.\n");
> +                return false;
> +        }
> +
> +        return true;
> +}
> +
> +/*
> + * Waits for a hotplug event, then checks that the link-status is BAD.
> + * Returns false if the link-status isn't BAD or no hotplug arrives in time.
> + */
> +static bool wait_for_hotplug_and_check_bad(int drm_fd,
> +                                           data_t *data,
> +                                           igt_output_t *output,
> +                                           struct udev_monitor *mon,
> +                                           double hotplug_timeout)
> +{
> +        uint32_t link_status_prop_id;
> +        uint64_t link_status_value;
> +        drmModePropertyPtr link_status_prop;
> +
> +        if (!igt_hotplug_detected(mon, hotplug_timeout)) {
> +                igt_info("No hotplug event within %.2f seconds.\n", hotplug_timeout);
> +                return false;
> +        }
> +
> +        kmstest_get_property(drm_fd,
> +                             output->config.connector->connector_id,
> +                             DRM_MODE_OBJECT_CONNECTOR,
> +                             "link-status",
> +                             &link_status_prop_id, &link_status_value,
> +                             &link_status_prop);
> +
> +        if (link_status_value != DRM_MODE_LINK_STATUS_BAD) {
> +                igt_info("Expected link-status=BAD but got %" PRIu64 "\n",
> +                         link_status_value);
> +                return false;
> +        }
> +
> +        return true;
> +}
> +
> +/*
> + * Sets link status=GOOD for the specified outputs, then calls
> + * validate_modeset_for_outputs() to re-commit. Returns false
> + * if the re-commit fails.
> + */
> +static bool fix_link_status_and_recommit(data_t *data,
> +                                         igt_output_t *outputs[],
> +                                         int *output_count,
> +                                         drmModeModeInfo * modes[],
> +                                         struct igt_fb fbs[],
> +                                         struct igt_plane *primarys[])

This should be changed to `primaries` or `primary_planes`, perhaps in a 
separate patch.


> +{
> +        int i;
> +        igt_output_t *out;
> +
> +        /* Set link-status=GOOD on each tested output */
> +        for_each_connected_output(&data->display, out) {
> +                for (i = 0; i < *output_count; i++) {
> +                        if (out->id == outputs[i]->id) {
> +                                igt_output_set_prop_value(
> +                                        out, IGT_CONNECTOR_LINK_STATUS,
> +                                        DRM_MODE_LINK_STATUS_GOOD);
> +                        }
> +                }
> +        }
> +
> +        if (!validate_modeset_for_outputs(data, outputs, output_count,
> +                                          modes, fbs, primarys)) {
> +                igt_info("Modeset validation failed after forcing link-status=GOOD.\n");
> +                return false;
> +        }
> +
> +        if (igt_display_try_commit_atomic(&data->display,
> +                                          DRM_MODE_ATOMIC_ALLOW_MODESET,
> +                                          NULL) != 0) {
> +                igt_info("Commit failed after restoring link-status=GOOD.\n");
> +                return false;
> +        }
> +
> +        return true;
> +}
> +
>   static void test_fallback(data_t *data, bool is_mst)
>   {
>   	int output_count, retries;
>   	int max_link_rate, curr_link_rate, prev_link_rate;
>   	int max_lane_count, curr_lane_count, prev_lane_count;
>   	igt_output_t *outputs[IGT_MAX_PIPES];
> -	uint32_t link_status_prop_id;
> -	uint64_t link_status_value;
> -	drmModeModeInfo *modes[IGT_MAX_PIPES];
> -	drmModePropertyPtr link_status_prop;
> +	drmModeModeInfo * modes[IGT_MAX_PIPES];
>   	struct igt_fb fbs[IGT_MAX_PIPES];
>   	struct igt_plane *primarys[IGT_MAX_PIPES];
>   	struct udev_monitor *mon;
> @@ -274,19 +382,16 @@ static void test_fallback(data_t *data, bool is_mst)
>   			 prev_link_rate,
>   			 prev_lane_count);
>   		mon = igt_watch_uevents();
> -		igt_force_lt_failure(data->drm_fd, data->output,
> -				     LT_FAILURE_REDUCED_CAPS);
> -		igt_force_link_retrain(data->drm_fd, data->output,
> -				       RETRAIN_COUNT);
> -
> -		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
> -							   data->output,
> -							   igt_get_dp_pending_retrain,
> -							   1.0, 20.0), 0);
> -		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
> -							   data->output,
> -							   igt_get_dp_pending_lt_failures,
> -							   1.0, 20.0), 0);
> +
> +		/*
> +		 * Force link failure and retrain also wait for
> +		 * force_lf_failure/retrain status to be cleared
> +		 */

These comments can be removed, as we already have comments just above 
the function definition.


> +		igt_assert_f(force_failure_and_wait(data, data->output,
> +						    LT_FAILURE_REDUCED_CAPS,
> +						    RETRAIN_COUNT,
> +						    1.0, 20.0),
> +						    "Link training failure steps timed out\n");
>   
>   		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
>   						     data->output)) {
> @@ -294,26 +399,21 @@ static void test_fallback(data_t *data, bool is_mst)
>   			return;
>   		}
>   
> -		igt_assert_f(igt_hotplug_detected(mon, 20),
> -			     "Didn't get hotplug for force link training failure\n");
> +		/* Wait for hotplug and check link status is BAD */

Same as above, this comment is not required.

With above things addressed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> +		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
> +							    data,
> +							    data->output,
> +							    mon,
> +							    20.0), "Didn't get hotplug or link status != BAD\n");
>   
> -		kmstest_get_property(data->drm_fd,
> -				data->output->config.connector->connector_id,
> -				DRM_MODE_OBJECT_CONNECTOR, "link-status",
> -				&link_status_prop_id, &link_status_value,
> -				&link_status_prop);
> -		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_BAD);
>   		igt_flush_uevents(mon);
>   		set_connector_link_status_good(data, outputs, &output_count);
> -		igt_assert_f(validate_modeset_for_outputs(data,
> +		igt_assert_f(fix_link_status_and_recommit(data,
>   							  outputs,
>   							  &output_count,
>   							  modes,
>   							  fbs,
> -							  primarys),
> -			     "modeset failed\n");
> -		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -
> +							  primarys), "modeset failed\n");
>   		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS], DRM_MODE_LINK_STATUS_GOOD);
>   		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
>   		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
