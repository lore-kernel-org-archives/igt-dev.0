Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0B8C44501
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 07:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A67410E304;
	Thu, 16 Jul 2026 07:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SrUi4EwP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D963010E304
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 07:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784188008; x=1815724008;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cVBgg8rWkIKtaO5YEQjpM3ewrlXmpGpFohegiuVlMEY=;
 b=SrUi4EwPoIq3U4SBQzkturGLYoJCyKNPgimzvE9k72pF+Mb0XQRg7Qri
 ejP8/o0YftBiEsIUCeaWHnjrXMTVZMpQF4u0kNJgnmuXvBcAcK7W8TArb
 jGI5qKnbCUwGLTOiTJKUB3o4vRweYCRRPTI4tGVYOixT68DcqIVB/MUll
 YiFKmrX+//3q0e7VkK69iwfU4AbzbeG9s+2zBgVT2CurOtwEW0sFl0stY
 9j+xyzB2nBfieP1ZcDRb2O/ukeYDuIT0nOUaUqUCPeR63lUjWJLV8S0w9
 Z1J/hbChtYjqSvz7mAPgMWQVkASDK0DPckkaQAHmiAUioGRI0kFe3vbQS w==;
X-CSE-ConnectionGUID: TQ4l8DyHSCC/QaBd/L6dew==
X-CSE-MsgGUID: NsS7BRDyS0eEdQyVHddWcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84693914"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84693914"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:46:48 -0700
X-CSE-ConnectionGUID: OfyDslFZQniQxym3LbcriQ==
X-CSE-MsgGUID: eKqPWToYQwCm7zLp9f83Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="280869446"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:46:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:46:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 00:46:46 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:46:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrcg8Yr+iBMgOy0P5yUiPfG88l4P5B/2UnQPJ93YBDLzsPirp/KfD3ABKgyV+0QplEFdl74BYHOzg+sJq8AlI+xqni1ra67Lv28uyNWmjdz3vbWPNl/BI8ohAatVwIlFa2ReJJ6oF/vZyP4KUJVk9bLa8pWtJ28rrh0462zvV372L/ptcvXRg7W4jUDbIyjNImJfrYBweGt86skThb39i/XhcCzQn9eOLxa7djNqC40goKXi47n3w1hju2k1MDoPCdjvTaRdszvtP3gOZbr+zF3rrLeFOkUuBdktnmLvjbQd1Ja5PLboJGNzUqYfVxhul/5QYN6IbaGw0N0H1OxQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YarZr9nqpvN2UR7v7OEK08bk7L85veFr1UJlAVg8oQ=;
 b=Su9zdXveuFf4HqwdZEY+zdaeT/o9gCNZeiEJrdI1YEYSMXT8udI1Z4hrwJCBi8gJuZl3wvPc/uGs0c3WHFt6NQi4UdfeTBg7x0L/qMX/tKNysmmYawrm/j2yG+OgPT23xDqxMbVyINcqyfr5yl5iBTbAnf73ikP8j/iJEk6ngJ5/jSs8AD6DJpZ88NXN1TRd8/KnmZjlfO/53jQvGIyp5lFl04p3zSXgGxGngsW5nECXmK4rfYhIWGnUoazdmyD1CDjCOlu/eD0/SyvS98dv8MPlUU8L6TuBBr2rtapbIyQLwzmfO9Z8wnorFcKU7LIxVTyVLMB5FaTIA0sPdkHoHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 MN2PR11MB4727.namprd11.prod.outlook.com (2603:10b6:208:26f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 07:46:44 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0202.014; Thu, 16 Jul 2026
 07:46:44 +0000
Message-ID: <66a266aa-73ee-439b-a3a5-304643cdfdd1@intel.com>
Date: Thu, 16 Jul 2026 13:16:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 11/12] tests/intel/kms_fbcon_fbt: use common
 routine to skip tests on fbc status
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
 <20260601204407.39934-12-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260601204407.39934-12-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0200.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::17) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|MN2PR11MB4727:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0a49f3-35b8-4597-fb41-08dee30e61f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WU4xYQFQOqq4w9izJE/qbaL/jTSTepx1spuiSwfoSbVR3BVF0PhYUgAW92ZH21PAQLAB3WkOKpT1Lc8DiAO1gOlY9hKFS1crefts0XKP7yKoJZWj0oQc9kUB0xzFb4TjpW+KcYlw+6z9wfh/9vJtiN2+dFqvdPOZ7DRWNI9Hw2pc3sEzuEKSoY4/7VSp5l+/tyVz5JhVCcni8SbCG4aVsGICYZBD2RyKvhDXuLCfQyBJ1HnWF29UK6BMOIjTvFK3TAUpFie8KvaaIJLGi6mse5ztjKI2W0pg8WGDywqFKyZh+95A4cIWDD7gsMqK00Wwl1+GIn2dlCKS42H1s0XGRTD0YNkSgY11VD6JWGluUtJMy6CR7WnlUfSGb7vB/AZesYWUoPIOtj8JLzxfFQK/sde2hYrRV1uIvfWHOBBiQptYhX1wFCrnLctfvjg7PJls/+aZ5gLAudj6Rpj2K8olmoVN1Klr8YZpL1aZPnKcI+7IZNVjlEP6ioebI8MbG9NuUrhoCDsIdpmqtBC+Q5RETIwQw2yM8bx0iCfSHD3oiJOfaAvuXWw/yHMKefbfkbJMozRxfhp0SE6Fl0RdpLn5IdH33MXVkkdCxYYt+MywfAwv5fumuBQzmeAbT27AGbGXNKfbyA99vSxS51AZJB+EdM9r1aFQw6DfGeRQ1vmqUXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDJ1ZlRMU0NFNWt0YVdpZTNiK0ZKb3NuYjdiZk1FVzhhZ1hYVTA1OCsvNmho?=
 =?utf-8?B?UVBoVEF5ZEpvOWF3T2dwQVFRbjRvOG1BMGxzdUpVSXJwMDYrdTBnYXJrSmxh?=
 =?utf-8?B?RFNDQzNvdy9pOTJyVEJSdU81VjBqV3pWNThxQnVmbG9tZ1A0dnlxeUQ4a1lJ?=
 =?utf-8?B?V2tRK0FWSTkwbzNBWFkwa1ArOUFjcE1qb3BWUEZZYjZ2NEppMStCb3JjNVRk?=
 =?utf-8?B?c2owaE5QaHRLN1NGRUhEWkIwTHlLSEZiVjZpSzZIRWxxUTFlWDRQMS84eGdS?=
 =?utf-8?B?TWdGMTNwUzVYV3Bad3JXZDl5ZVpFeitjSzhIaUYyd2JycmdDWktmcTZka2tq?=
 =?utf-8?B?eWlWS1preER6ZkVjb3BHcjVrUldPc1VObzBoRy9QQUlVeGJqM0x5eVBnVS80?=
 =?utf-8?B?dG05OGZGcEVncWhGZGVhOTFxNlROcU9KaStrL015UzdFNmRCUE1wMVBBU2J2?=
 =?utf-8?B?UzhKOUZBL2VSRFUzbHRNWkxXMkZrNXE1YVYyZVZTSCt6QUR3MXQ3OWRpU1Bz?=
 =?utf-8?B?UGtyQk50VndsWGtHVTBsb3AycXZqSlhrR05haWhDZDRWL2xDVkw3VXE4VE1W?=
 =?utf-8?B?SUhkZisvemJ3MUxjWjJKOEdXcnhWTlRldjNVa29JY05lQkt4U1JFb3ZrdUtZ?=
 =?utf-8?B?S1NSdXpFa0JFcjZZWUVFSlpZTmNOU25yTTdOSGFoMDIzNnpLWmdOODlHT0ZE?=
 =?utf-8?B?a0hlTkJqaDloR050dWpZWnZnbW1rdm5hNEdZbUdIR01ZeVF2bGFXZUJROUUz?=
 =?utf-8?B?bjU2eFljUVZQSWxIRHNpdnVzVlVhRStXQnVZUWR0S2Ira29Cck1NL2lTMHpj?=
 =?utf-8?B?RFJIYk1YUXBiMXpGMERYRkljMDlUb3U4OUc2MDRNeU5TSHdtMStjYitTaVdV?=
 =?utf-8?B?Vnd4NDJHeXRoNTdwcjV5Z1ZoNnZlVzlEclVuR0lvQTdibTlldkdvUGMyVW0w?=
 =?utf-8?B?bkxQbHB2Y0M5WVFiVURycFdsNHg0eEVpdk1VUTZXa2dBV01FSSs3TG5YK205?=
 =?utf-8?B?NGR6RysvQU5HODRrbjBrNzMrSDVTNnUrL1N2R05qQ1JtSEt2WkdPRXJjZkNq?=
 =?utf-8?B?QTU3K05GZWJNRnM2Z0ZhYkFDNXJnY25UbGVvaWxmaTNYZDNjNyt0UVNFTC8w?=
 =?utf-8?B?bXVIeENSV3k4SDJwMlFzU1NWempRK1VrczdrdXpNOXZWT1RKVkJ5M2pzTnVj?=
 =?utf-8?B?VDlBcGVJQ1JORlNWVnB1MkxLZEZPRmNBYkZpb1FIUUI4VDNTWG15N3NrOW5M?=
 =?utf-8?B?VEJIcStNQUJUbjlydnRKMlhhekhxcCtkU2V0SHhDT1ZoUjNlMjJVb29SMjEr?=
 =?utf-8?B?WFc3U1E5Y3NHSHU0dFpNWUhmd09kSGljV3BwMFNaejZRMHIwb2tmaHg0Tm53?=
 =?utf-8?B?WGRxTkpNZDVsdEJoWGswcFJRNjkxQmRWT3JnZmFzVTB4WkJReWh1NUNQSG1O?=
 =?utf-8?B?ZGg5eld1SlBuZnNldTdVeExCWWptbVFKRFpPOXliZ1Y0Rk9MZ3lkMi95QzFO?=
 =?utf-8?B?ekV1VVhRUnBqQ0xDVkpDRVpPQkhwdDZ4S3ZraEpWWnhDZWdCR0grOE5aTkVV?=
 =?utf-8?B?RlJYN2tjakZvNElqWGxjOUJXMmJMVW1sSUg5Q3Z0MmRJK0ZFN2dIRWMyMXVu?=
 =?utf-8?B?VzBseHNBZStDenVUVUF4YXNTdkswb21zRU01RTNzaU4xUDY1eC9EaVRkTmF4?=
 =?utf-8?B?NnBkREVJZU9aanBTNnpPYUYrRDNNTjdwdWhkY2VqR25JcHRxVUhYYWFBYTRS?=
 =?utf-8?B?Tldlb05tbGtFSWc4TEI0cm5DeHRWNXFaWUlSM0gzd2FDN2R1dVhrOGRrUWdT?=
 =?utf-8?B?M2tac2U0VW5zR0lBQjQ0U0pHMGFJNXlKNkZrbUJja2dZeG9mZ0w3SzFHNEFP?=
 =?utf-8?B?em9rRHcyRWRJS3VLWm5Gd0grUGZndlRGaG5XMW1qcE9ZOE5wK0hVbUkvb3lR?=
 =?utf-8?B?VEt1OVhyZDJxekcvdHpCNTZWdno2dmF5OHUrVHl6U1YxZmVqUy9iejM2ZWFZ?=
 =?utf-8?B?MWdJQStJa1pRcVRBMVNqdmM1dCtTWXphbG9LZURDbjZ2YSs0Tm1GdHo5SmVI?=
 =?utf-8?B?ZmNmMTdyRDlZbWtzNkoyalVEcE9TZFRSVlJsejVpWjNWVGg2WlpXSHB6bExZ?=
 =?utf-8?B?SnZzUTl5UG9RMVFSNFdoNEtGNTJqQXFBZWsyL2lsV0tKUUhlZiswYlhQeVlW?=
 =?utf-8?B?R1dTWlVwZlJGY2loSnJYWU1nQTRyZkd6anAvVzVwaEwyZ1owMjhEM0s4SndU?=
 =?utf-8?B?M2hnaWQ5Uk1la0RCNTFEZ3NVa1VNWXpSWnViUUpnNXA3ajQrZGNGVERDallQ?=
 =?utf-8?B?SWgveWRFQmlMMnBwR0lFV3FhWTd1SnprWHVtRHlsdWZiYlFzT3ZFRFZVV1F2?=
 =?utf-8?Q?DaPwE2D5hIYKAshk=3D?=
X-Exchange-RoutingPolicyChecked: DF6VjSnbeKfLbGpu5PPa+0jUd2EpJ6Bp9ra5I44P4hRhWnIY4fXdbXSFyX6hG5IDhsI3IJBM9LVDW7nHYw71MiG1yoGAWzwmt9gBVndwlGFH2AbGCS79FgLm4lxwdXBHMNrE+rS1j2rRObP6A6KQ2BkJqGysTYPbUStYvhboEDMWaE67hcJjBYOLqP2fae8QJVqnWRnRKZTtECtEyDQbXwKgZJ7T7XeGBvN2TNS1Q9VJYT1mkT1bIkuMQdXF69yynYIxYQLEcqzAgzVP3uPHeH5Ey0e9ldSXYz3TE3tBYCuNm7aiU/pT1es1Ku2QpYpDMOsWH7VGlw7CQVCyfUdTKg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0a49f3-35b8-4597-fb41-08dee30e61f2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:46:44.7689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKvFGVL4lff/Ij1QbjSJZrLUHzfnGCZt1oYBqe2T9hnHM7+yzXpOMFKUvAmNPw8wUNRClkO9iBo/Od8SN8lpAOXdq6dZGxj4yXiw3emSc63pYAJs0Odz+wbWr1EdrU4l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4727
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

Hi Vinod,

On 02-06-2026 02:14, Vinod Govindapillai wrote:
> Use the common intel_fbc_found_skip_reason() defined as part of the fbc
> library functions to check and assess the fbc skip reasons. The "no fbc
> reasons" are appended based on the reasons defined in the kms_fbcon_fbt
> tests.
> 
> v2: update the missing coma (Santhosh)
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   lib/i915/intel_fbc.c        |  9 ++++++++-
>   tests/intel/kms_fbcon_fbt.c | 26 ++------------------------
>   2 files changed, 10 insertions(+), 25 deletions(-)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index ccd7f411c..45791a72b 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -77,10 +77,17 @@ bool intel_fbc_found_skip_reason(int device, int crtc_index)
>   {
>   	const char *const no_fbc_reasons[] = {
>   		"FBC disabled: not enough stolen memory",
> +		"FBC disabled: pixel format not supported",
> +		"FBC disabled: tiling not supported",
> +		"FBC disabled: rotation not supported",
>   		"FBC disabled: stride not supported",
> +		"FBC disabled: per-pixel alpha not supported",
>   		"FBC disabled: plane size too big",
>   		"FBC disabled: surface size too big",
> -		"FBC disabled: PSR1 enabled (Wa_14016291713)"
> +		"FBC disabled: PSR1 enabled (Wa_14016291713)",
> +		"FBC disabled: plane start Y offset misaligned",
> +		"FBC disabled: plane end Y offset misaligned",
> +		"FBC disabled: pixel rate too high"
>   	};
>   	bool found_reason = false;
>   	char fbc_status[FBC_STATUS_BUF_LEN];
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index fdd8515cc..378d0ea8a 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -297,30 +297,8 @@ static inline void psr_debugfs_enable(struct drm_info *drm)
>   
>   static void fbc_skips_on_fbcon(struct drm_info *drm)
>   {
> -	const char *reasons[] = {
> -		"pixel format not supported",
> -		"tiling not supported",
> -		"rotation not supported",
> -		"stride not supported",
> -		"per-pixel alpha not supported",
> -		"plane size too big",
> -		"surface size too big",
> -		"plane start Y offset misaligned",
> -		"plane end Y offset misaligned",
> -		"pixel rate too high"
> -	};
> -	bool skip = false;
> -	char buf[FBC_STATUS_BUF_LEN];
> -	int i;
> -
> -	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf, sizeof(buf));
> -	if (strstr(buf, "FBC enabled\n"))
> -		return;
> -
> -	for (i = 0; skip == false && i < ARRAY_SIZE(reasons); i++)
> -		skip = strstr(buf, reasons[i]);
> -
> -	igt_skip_on_f(skip, "fbcon modeset is not compatible with FBC\n");
> +	igt_skip_on_f(intel_fbc_found_skip_reason(drm->fd, drm->crtc_index),
> +		      "fbcon modeset is not compatible with FBC\n");
>   }
>   
>   static void psr_skips_on_fbcon(struct drm_info *drm)

