Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A65FCFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 07:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FA110E1D4;
	Mon, 24 Nov 2025 07:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCuRJXKa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E8C10E1D4
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 07:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763969264; x=1795505264;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=smZSemUwK7d4E693/851sbyJVz5Yw6hk1HWz3fub9g4=;
 b=iCuRJXKaIi9E78FTup+XqdwZdILkWZ23gOzEH3+MH1eO0wCSirblR+SF
 wHaArv+eEVKQkjrI8LGlCblXYP89QX1X4Aq0W33xWfFkvwOnMgjODwyKm
 CE/JgI3icb7dIl9KzrrlflFzdrLM3xgJV6x+xdCBKBBuZv69FQHHsd0jx
 9YLsejJdo5BIfYAa12LutZ1IbqC6WmGw3i/a18yWRQxYlR3UbZ9+Dn80h
 pEELhW9gDbFGMZM8wJ9ABlhssgT6JV6Hl4S2/EaP6ZA7w66Q2HOrYRM+5
 YOmsYqGPnAclp6h0V00OqKcisV4Ciuhy+NR2X7/ptlmb8WaJsRoEx9CiL Q==;
X-CSE-ConnectionGUID: jHJKIwNXRuifXulz5jjqQw==
X-CSE-MsgGUID: pMBUOQ7+SZqhe0YxOp4qIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69824537"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="69824537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 23:27:44 -0800
X-CSE-ConnectionGUID: AvhRM+oJTjixqIsVzMxW6Q==
X-CSE-MsgGUID: xEeIuUmHREmAKQSfjK5SIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="222908409"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 23:27:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 23 Nov 2025 23:27:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 23 Nov 2025 23:27:43 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 23 Nov 2025 23:27:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTqIwJTO9KTkm1rdtgTHPrDLdxq321r4EyedSGeMCsmbcXhrAbcfgcpTkyFlDLMndW2y/jBn+xDk0mCaLZa21pCSFVZT+E8+zEAIREsfQabo7angFS/rzO90fbB1CTyN6wo/HE3RNfxK9Hwo6oWLhfgDt1WKetkRp1HHoqAKm6JW/+RvcCAhLgwL6tdzQCz2xlkz+A4XewinM3L5Ml5O5eId6DHPt+OnT1r7UBSq7i2OXeffGvZIz+UzN1xPCYwAVqvSY5nCCli1NY9WTjNo7pbsB5LHbmwn2bhsnN4hF9XumxgS28OOpZ5F88V/nR+OXIpA1tbcglxgt6i9yggObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaXlNXFlRPA9kyTLPSWn2UxxPI8pG9wC1g9h70jowgc=;
 b=cwpw84QOJw+T/t5H9nJ+n8uI2t8unNcWlKZqNP77B3yG06PvplWyTa22RB+aGEeRUUW8qI99GTJW3TjCnX1WxwJ7GLSRzP388AOkl1m1Ql7phJygDksyzayaCM9vR0s/BteVz/QW0nH/wUiJCZIxVuzSUNHN0U/FWoamTROnq/wdod9MF151UqmjsIhG0heyfj7iOnJF7vXJUrxpv7XvW5g6cIbbk5NihkV8yhnjyXkhmWeaxQHaRp6lBxVRdzO/xM2ltzFrvlEkiFdJlR/ky/kPu7Mafm39KJFvOeN/Uaf5Guvdy7MgN58y+YgQ6Nj8eju2B1SqQbGzDycjMiBhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 07:27:36 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9343.009; Mon, 24 Nov 2025
 07:27:36 +0000
Message-ID: <e2383642-a613-4aff-99e2-c3dc84bd6ab6@intel.com>
Date: Mon, 24 Nov 2025 12:57:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/8] lib/kms: Nuke unused kmstest_{crtc,plane}
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
 <20251121190633.24522-4-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251121190633.24522-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::20) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0dfb46-417e-411f-1dcb-08de2b2af0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXR6ZFRWTUNQZjcrUVVhbzF5RCtoWk9rb3FsSGRqY2ZtOEtvRTFubVJrSjRI?=
 =?utf-8?B?L3FkNmtYS0VqZFdjL09zNWxESmFnZHIrWm1PUStFNDdFOW9na1Y0UStRUS82?=
 =?utf-8?B?WmxLcEpkNmk3TEJGK2t2eG1QMGZRbklJb2VOQ1B0d0UzVUVwaVRuSmZKNXgx?=
 =?utf-8?B?NzNpNkt0WVhoZFhsd1lCRnFjaHYrN3l1YnZucXErV2cwR2dKcTRLUjhoZHh0?=
 =?utf-8?B?c3lVYkw1cTBNc1RQVmtLekdwMlJKUlBPcnZtNTlJMWVsNE81K25nVWJ2ZHls?=
 =?utf-8?B?N0FnUXlMZWVLa1BPSGdJdHduejBFNXdPWGgxL2w2L3lvRWJoY1E5V2k1Rm84?=
 =?utf-8?B?VTF2azZReWdpYzhNSVFjb0VjYmNWRUZMYyt6MFRmWTh2Y29wT1YyR25xR2lK?=
 =?utf-8?B?TVZWakVMTm1DbjRQdDJCaC93K0ZkdWU3V2Y1NzFBSkpkdDdJcUdnRkRSbmVQ?=
 =?utf-8?B?bTVtSTRrOWxWdEU5SW1CNVRCTFNZSnVsRjh3d0NyZjlpWHdDS3N6VHNFVTNS?=
 =?utf-8?B?T293SnI5WnpWNzNsLytMRlNWY1A5QmJqUWdXaHBnNVlDMzJGZTZmSnJVQnlU?=
 =?utf-8?B?Tzk0enZqQTNMVWtReFJHT3N0TDBGelZkNkNrN2R2ZHZkSkI4WW9Vd3VpTlh0?=
 =?utf-8?B?S1ZsM2RXdkN4Nm5QMDZjNVlCYll5RDlFWEFvV0FkNFJRT25sd1NYVUxtWUlI?=
 =?utf-8?B?NjlSL0VxdTNxWXBrd2JralhPUTJHc0VXRzRiL0VienB1QWdVc3VLWU4vbWVR?=
 =?utf-8?B?dHdkWnZUQ3NVbmFZenJPMGpMQkFaQ0NDdXFTK0tjeXRFM0dIRTlhaWR6L3VV?=
 =?utf-8?B?TEt3TVd3RDRFOEtFUzN3TldETXFHcTFrTjJZT0xUMVFQNTBkTW8wMlA0NHdD?=
 =?utf-8?B?eWxHTDZuZ1M5OWowenprYmFrcGdIUTBzUjc5TE43TVpXWXpscEJTb1RiM1ph?=
 =?utf-8?B?QUJuRGFlcml3Sm1CUGlBRSt6L2NiL0xjTXVvdGMwMzhiR3kxdVByTlc2ZlhQ?=
 =?utf-8?B?d2VuQmNOL1plQytTcjJDUzdOZFBsalY5OHU3dGcyZk1BY0U4UnVXL0tNdnF2?=
 =?utf-8?B?MHo1cEhnS2JiNWVkRzJPdlBzL2lON3ZiYWEyeExINDhyVXlEdnlQZ0VTU0RQ?=
 =?utf-8?B?ckNRK2NKMTM4eE9MekUrS3ozM1grZXN2QTVXS3NKUmFPUm1nRDh3RXVNTlVo?=
 =?utf-8?B?WXVXcDNFWjZVNU80WmUwOEhpTFlwNndnSUN2VEQrMlBrZzNPWk5OcmdpcnlF?=
 =?utf-8?B?L2NFYjYwaEZyeUxDQ1M2TE1HaU9mMEhkU2tXOVBpNUZBUG1CQkZUMkVmN3VL?=
 =?utf-8?B?OXFTcElNazdsakU0YXhOaHhWcmRNZmxzdmRUdERaSnJWMmFtTnRTRkJ6cmlS?=
 =?utf-8?B?UWExVTF0eHBGTnBQSTRMYlk0STBweGdhNEdpT09PNUxZSmJHcjl2YUJsb0pI?=
 =?utf-8?B?ZG41VWZydWNZQm5rVW84N1loU0N6VnNRd0RMbGwwaWRuUndERXczRk9LRVFM?=
 =?utf-8?B?OFcxdXpjN1RwN2xWcDRhVGVacVE2aGl0T29LYlhiTE56WExMUE1DeFFKMEhw?=
 =?utf-8?B?NGwzY1haZHJTaHE1UE4vSXovSURYTXVXcjJpck5DbUVDWTRidFMwbk1JS1dV?=
 =?utf-8?B?VGhoazBzT1VxV1VLQUhISWE1VjU5U0ZoUmZ3MXJHZ0NSVTJWaURjcUFJWEtp?=
 =?utf-8?B?ci96ZTBIcnJiYVNRM1g0aVB4ZnFBU1Y5M1ArUnB5cHpRM1J3bHUzOTJQcUxa?=
 =?utf-8?B?UUZYSUE2djFYYVhIYjgzS0Z4MU4xRFNsNVJ0d0lOWmN0L1UrZktpVHIzQ1pn?=
 =?utf-8?B?R0tMQ3VsZW13WEMxU24zbk0yeGt2OFIwT0dENkZNWTVVRmhGSS9EU00vdC9D?=
 =?utf-8?B?MXMvcndvTk53UWhVYmFwSVIxNWhZb1JIclovWmcxRllIOUg5dVF2SmFMWjVD?=
 =?utf-8?Q?mXR0X7SwxY/wxvj2x8aOMO9Vv+H6yvDY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGV2ZEJIdjV5ZEdlOWI4aEVVSXNCNEptNlNyTVpIVzNNUldiRitDZ1NDM3hk?=
 =?utf-8?B?b2l2eVVjM0RybU5Wcm5qMTNTRlNiWlpZcE9VNWx3VkNWS2RCczhXQ2F5MW1C?=
 =?utf-8?B?MFNja2JwK3ZQeE02MlhYT3lnRmJEZFhiVnZ1UXA3eWljVy9rbkhxWUdlelI1?=
 =?utf-8?B?VWtKTVJKUHpqaEpFU25DaGNnT2lRVXpXVUN6YytCdzVXenExRzJsWWRYMHJk?=
 =?utf-8?B?bHc5UTNiS2NxMXRoTzVhN3cxc2VNVThEVFdnVHE5Zm9DTW03N2VGb1psRjJo?=
 =?utf-8?B?VzZnSW5zRFlHaVBFamMwd3FicjJhS2tkdVFOZC9Rc0tUak5qb2NtYnNnN1Zi?=
 =?utf-8?B?Zk5ZbkdHM0pNZldHNTFKb3JsYW9aZ3lPQ0xCMlpzQTVjZkVwRFlXVjJWMnN0?=
 =?utf-8?B?L0c5cFQ4TFNjZXJ5Q1craWFxL3pneGgrR1ZqWktWZHhkSkpHTGt3eEdMMmRQ?=
 =?utf-8?B?ZVVBTFJtVnJKZkljOWV0cHBZOGpzVzBBdzI4akJQWEovRGpZMk1DMmx3MGxB?=
 =?utf-8?B?ZFNtOE9uc1BUWU1qUlV3U1Fsbk5XVVBCTTJ3TmVaOGMvOGU5NzliYk1hNTU2?=
 =?utf-8?B?TFlGazBqZ3gybHFpL2hsY01CbTVKY2ZvL1UzYmNsWXRiTDUrMDJjK2hudmlE?=
 =?utf-8?B?Q2R4M2QvKzNueXc0aFRZUHZrOFpoN3hNaW43ZDdEMTZrSWRUL0pCb1ZPSjl2?=
 =?utf-8?B?R0I5cTl2OG41eDJyM1RKcit1QUhwUEhGWDdtSmVuVEhHWFhZSGxKK3M5MGJU?=
 =?utf-8?B?d3JkaDJzWHhVV2Z5dzdRTTR3TWh0M1JJbUl1NHZLZ1lWdW5xMFB3TVl6YzdY?=
 =?utf-8?B?eGdoQUtxRDhNbVkvN1lycER5R3M1VTJCS1JMRzZBaEpMeTVHZ3pPdFVha3NR?=
 =?utf-8?B?dU1ESUgrVTAvT05paUhzeVlqYjJ6VHl4dHh5SlliQjh5eW02Qkp6ajM2M3Ja?=
 =?utf-8?B?Y0dVNzNCUjBtc2V2UDNwYnhwRThKYXVnYU5rRlBuOGtZWExFTlFYaHVmdkJt?=
 =?utf-8?B?OUdjWTNkbFJvS09wUWJaZ2FHZmJEVENhS3J0RkwwZVg4S3V0RFE5NVRrWnNL?=
 =?utf-8?B?SytSc1hCU2lrWi9NTmg3ZGtwNlRHTlhwVTdyT0hybDkzUUpEUDBwQ2RqMEFF?=
 =?utf-8?B?aVV4MnZ0cEdQMUxNbkNIU3h0N0s3NG1KRXV3ODRmZWdHODFGK2xwa3lJWnhE?=
 =?utf-8?B?NUlzY1JaeVl2bm43L1gvNmRhNmM5MXF1RHpJRE1uWVdGRDFTUHNxVVhuSnp2?=
 =?utf-8?B?VUZhRFcrN0dWYkRXa3ZZam80bElvTlJUWjhubkl0cVlXZTRZVzhBR1ovSlBO?=
 =?utf-8?B?QkVENWJFaGlPeThlRERySTJkV3Y5YWhwWnBkQjV2bGpDdjVzYVM1RjUxSW54?=
 =?utf-8?B?QkY2UzNtYWs0akJoSFRxK2ZQeUovYS9LNzZXRVk1VXdYM2NBT0NzRGhNUHZF?=
 =?utf-8?B?UHhVNWJidzJzOFIrNHlEdmtiUnM1bWJnRkl3anZjdyt5dSt5bzVaeEpPcEp2?=
 =?utf-8?B?ejNKWEtiWmdGVURmNGMzTVZJdTR3QXkwRmJOeHJsbE9kZVY3WERTa1Y2ZzF6?=
 =?utf-8?B?MFFtUzdlamU2VWowR1YxeElqdFl3NUZvOHhqNUo4OTIyWE1oK1RiajlSOEha?=
 =?utf-8?B?dU9rSlhhVFlFSzdUT0w0ODV4eVZYNHZDZ3IxN0VWWmJyYzN2cDZUS0pFS0d3?=
 =?utf-8?B?RUFTUk1DaWFEcjNweUdnM0pjTGRuNlBET2FyamFiTjNEdU9EQzlEeWEwVUNm?=
 =?utf-8?B?emg5Sk1DR05Na0xlVWhsWW02WWtzUy9UV0ltcng4cU51bkw2U1VNODFQNWJW?=
 =?utf-8?B?ZFF2WVNjdXQ2Q2VHM2lSQ3IxZ3FkNEJBY3RZbHRyalg2MTRxUDdpVWFNTGd6?=
 =?utf-8?B?eGhtdmdzVld6cnAyQmhicmZ6dGxJQ3czWkZYWGVKNWlxSCttSzB2Q2ZGdW9p?=
 =?utf-8?B?aE16N2M4Mm11YmlVem15Vy9kUmJKR0ZrN2FMVjY3bE9QZUw5djBjQ3VDMWhn?=
 =?utf-8?B?TnZSWFc3MVk0cFhJakNGL2lCTXZROVROUWcxUlRrZ3BxSyt1TnBiSFhPVmVr?=
 =?utf-8?B?RExvd2FJdDJxTnowSVJJNDc4OThhSXZsNVpyRmVKV1dNamZ1VkxJTTZkMDB3?=
 =?utf-8?B?Q29aSDY1ek5yakRCdVJTR1Z6bWVEdnJoR0doTWhPQUZ4UFk1ODg0OVBndEMw?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0dfb46-417e-411f-1dcb-08de2b2af0d1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 07:27:36.5257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UA/xCGbKdcuwHeozKt3mSaq8DnZbcUArBYQ8omUHp4RcFM2ZYtCx0JHVb7gCk3eHilxE3Hc8SgV2uFOH7TMyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8025
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

Hi Ville,

On 22-11-2025 12:36 am, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> struct kmstest_plane and struct kmstest_crtc are unused.
> Get rid of them.

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.h | 20 --------------------
>   1 file changed, 20 deletions(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e1241342a0c9..c9216dd5bdbe 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -214,26 +214,6 @@ struct kmstest_connector_config {
>   	char *connector_path;
>   };
>   
> -struct kmstest_plane {
> -	int id;
> -	int index;
> -	int type;
> -	int pos_x;
> -	int pos_y;
> -	int width;
> -	int height;
> -};
> -
> -struct kmstest_crtc {
> -	int id;
> -	int pipe;
> -	bool active;
> -	int width;
> -	int height;
> -	int n_planes;
> -	struct kmstest_plane *planes;
> -};
> -
>   /**
>    * kmstest_force_connector_state:
>    * @FORCE_CONNECTOR_UNSPECIFIED: Unspecified

