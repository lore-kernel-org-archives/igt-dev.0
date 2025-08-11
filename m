Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4BDC87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 14:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520C010E080;
	Mon, 11 Aug 2025 14:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uf0damLR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1F510E080
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754923545; x=1786459545;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L0NB5zIVr1gUlQ1mj1VzALzztmSEXmACFRDX60wcxzU=;
 b=Uf0damLRXE+FebEM51TMobFFUg1xovrOlNW3Zsxz0NxZo2YzM+tvv+T2
 IGiYRchseu+UIx3w1rKNJEDmA5NGsxEwH6LzW4e1p+XoZimfjXgSf18C7
 Oh/EGVqKnUp0NzJiOR1Vr3jVRB32F/RtZN29TkwSLEf+QYyz7zcSDXDbr
 DnO6yL/ghtxVY0U0xgk3HU33GXaksabQIYMEkXvCvndoevAznF6HtKX78
 Jk1QQkeZELKOYCLpqJS3f3MrWkBDcD1QfxemCHo0hvPJy4xMxi66VTW6Z
 datuRT9W/GO9DU+f0U6U2m5kIMbAGbd45phRP5rP+O50ljkoXEX85isWs w==;
X-CSE-ConnectionGUID: WqM/fIU3TE+Wa7v86tYpnw==
X-CSE-MsgGUID: z5GJZs0iT6GtVLpYyOrEjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="59792304"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="59792304"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 07:45:44 -0700
X-CSE-ConnectionGUID: p/6kID8rStmEzjHUH4EZCg==
X-CSE-MsgGUID: RaJU/6oUQ2enU7+Ysn2XXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165140101"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 07:45:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 07:45:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 07:45:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 07:45:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8yX452mXe4oJhxXPdq+SPLFVDbHOF5sv/mXjacjUget34y3R0xunuzNdzmxZHCce3Qb12nFFsAINSaLzFm5O/B1X+uKMjhvs7DeYy+XmBeGwa+SfYDhbL1sGGfdArQwKBF6epaEgcOnAaUFCr8mqucOeZ0jTywQjZJoR6cwZF6O6EQFOT514uMA1J4ZPsNobpExfIeOAfyeRrw5B/g/ofw0uX7hD7gyz7UpqIidznapBrVDTiZZD63RD+P+JGy7uNVYYHSRVXAOCpqcIbzKT2l1VkEZmJCw/98ncbnN5lfYNGBlNIz6ctXPBqJHIYiIRmQ32aLmS26doKxGRg+9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHW8LLKp5BJlj/sUXdgWNOYFTA77XN56DCz8PrTutIM=;
 b=f/ghunxxMMMSZ74DgDOG8JdIFsdLIgAlAriGOWUX7WgTRNHcfvwab18rCyp5G0psOiY2UOrurlN8kaWWrg7PuZzTBllf661DarLpLx+sU+m2Gv61aCfXdG6PrZn0Mi1RlM6zlfnXBlCXGnF5/GEsgzOtaDnDSsJiEojb4450XRe83tteMI4z5NddpI4CmCBDfnZ3YF4IbfJXdBkjp9QteTrSAr26tEUsSfP2RUCOnSLWXSMYLwM1yFMUmCm86rR1+lGM/aEVter0I7lUUbOf95I+VAOCiH3dSc3h/enpXMQMcB+wIc08CSDUkn7lSfoc0HmrLM8UfWyCR7YP6n6MYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CH3PR11MB7674.namprd11.prod.outlook.com (2603:10b6:610:12b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Mon, 11 Aug
 2025 14:45:39 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 14:45:39 +0000
Message-ID: <3392051b-0e36-47fe-afac-fb3b5c55979b@intel.com>
Date: Mon, 11 Aug 2025 20:15:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel/xe_fault_injection.c : Update function name
 for xe_wa_init
To: <himanshu.girotra@intel.com>, <matthew.s.atwood@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250811130137.4006-1-himanshu.girotra@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250811130137.4006-1-himanshu.girotra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::11) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|CH3PR11MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: d80bdc1d-8037-4131-e010-08ddd8e5bd4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3AydjlHVUF2cG92YS9OMVpzZHdFdUNXUTBkTWlHQzJndmsxZzhlVlg5MVZh?=
 =?utf-8?B?b1NNQVgxRVlNbUFXaGM2dmFMMm5Qd2JjQ1pTZ1VEamNJUWs3VFlGd2xSc2FN?=
 =?utf-8?B?blBEMDJnYzZ6dkFYZ2F3eXhRUnlqZ3EvRmI3OXlGYU5IZmIwL2MyaDN4b0Jt?=
 =?utf-8?B?cHdQVWwxb0thUTZkVmlqazZYR3kvbW9kQytZUlFyOE1BTGJpVVZlc3A3bXRB?=
 =?utf-8?B?bTZrL3FDaXlSZ0ZTbWxiWlJsOWw3WFA5dWpVdlI3UHdraXNPejRHTlhSa2pO?=
 =?utf-8?B?dEtZa1lJYjFUWUdHNXNnbVc4Z0dyM1dmdEtYdFRBK2s5enh1ZG8vcWhqcFZx?=
 =?utf-8?B?eldMZ1h4R0I5TTQ1cUFodDZTMWp1QjJQTmF3Ym1YUU5xdjIrNVVLekFicDJ3?=
 =?utf-8?B?N3hHcnpnaVVKSlVuUU5HbjI4dGJWK2l2UENvUDhST2dnbWxHeDAvRStGbW12?=
 =?utf-8?B?Y0VVa0UydjQwNU91dEZOMUJQbDM4U1ZwSkFWMkJCclZhMGFLUXpwSlJkREQ3?=
 =?utf-8?B?SGpURWdvUWNyeWk5dXczRnJNZTMxWjZwWHBCMVYyZmgwa0ViYU94NS94SGl5?=
 =?utf-8?B?R0ZmTG9CNGh1dTREVU11U3RDZFRIeGNMcWpOU00yMUZZQlZXN0N5WWdnd2dy?=
 =?utf-8?B?QnJTL0Fpcld2Y05nNjRySUtTektUbENIaXoyeGVsUE9pbUowRmk1SGw5M01r?=
 =?utf-8?B?NERQMVd6T1lBVDh2UEFqdVJDOGwrcW5qTTQyY1hiMG5ISUhBRWxzWm5DSWk3?=
 =?utf-8?B?WHlPdkMyOFRSWDhuWllsdEVibis5KzhhYVFYcVBiOWNwUEZkNXdscU1nclZq?=
 =?utf-8?B?b2RBcVAxWTZCbUV1MlB2MGY5QzZySi95YW1VTko0eStyalpabitxUFVNTGEv?=
 =?utf-8?B?UDhBQkwvcWQ0N1R3RTh6Z2RzM1UvOUdDUWRESlRQeit1aHNPTEk4MWE1VmNH?=
 =?utf-8?B?QWVWa1gwSEtKWEtCOFA2dTU1TU1DRXVUT0lrVUpWemVLd2dUK2JtcWtoL2ZS?=
 =?utf-8?B?eEJoeXlQcW9UQ0xvY0piWXRrREYvWFBZbnRDVWxlZktaRW55M3o1dDluZ3l5?=
 =?utf-8?B?OHpCMnpncmNZaEN0VzRDUE9RNkdRQ08va1pqdU1PdldJSUl2bC9qWGc0cXhh?=
 =?utf-8?B?bDVYWGlrUWNJeHVWTzZ0TlhLdTZKemg2b0d0OHhqQXZ3SnZTL095d1RPdHQ0?=
 =?utf-8?B?L3JESHhvUHVwYmpKOTE1c0svRU1RVzZDck5GNkhMKzNLODBDQzJFckdVaUZR?=
 =?utf-8?B?ZDVZWTJnbVNPVFc4WjBHT3NvTDVDb2NKQ2M5UFVtb3NVcGZGdDFvbnJTOXlN?=
 =?utf-8?B?UXlGK1E3ZHYvZE45WmpxS1lkQy9aVXlORkpSWEhjMU1ZWkxDMGh2ME94RjY2?=
 =?utf-8?B?SHhqTmF6cVJhdlpVZmtIM1dub29ldkI5TzMrRVV1SUZjYk9RVjdRek5uTVFX?=
 =?utf-8?B?dTZST3ZDU0c5Tm5SOWNMNm56b1VqNkNadFFIZWpNanhmMFZsOWJnSmZ5LzZy?=
 =?utf-8?B?bnpXV1pJc1NMbTdtSXR4dXFXRm85SzZRT3J3WnE0d2NXRkcwelJyZlIrVW5C?=
 =?utf-8?B?Y0lqUnJIZVUrb0tOaUc2eWxWTFh5Q296MDR4RG9sRHNiUFNMTnhFWjJBWi93?=
 =?utf-8?B?Mi93NWxHaW5xTFZmZHlJWDdxVEZzMExNU2gwZjNPMmVidVdVbXRYV1o2c0k5?=
 =?utf-8?B?dERQRW1kRDJZdHVHcXFZTkRuTWpkcG9sK0plUmI4TGk0KzZzbElqS2ZncnZW?=
 =?utf-8?B?dU5PQlp6RzM2RGpObXZ5ZmVsc0NpWjVhOVhqWWg4TDJVTnBqbHFhMGFTVHRV?=
 =?utf-8?Q?kFPKs9i5XBzNnIwaAZQ5VMnY3OEYM4eLN70DY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjJBdDFGT29HQlVidldxN2JwZytSekV0YVlRWk0vNkhTTmpiN21kY0NXVXIz?=
 =?utf-8?B?T2NFSUNLcUlHT2dYb0wrK0JpaGw0VmlWR1FHOWFBc0lzVzU0RXhyVTlOVW1n?=
 =?utf-8?B?Z2lGNlJ6NWxjVEMwQis2STk5Q29UWFlQQUxvSXl5WXdoUlQ1c1VlSzBUK3hL?=
 =?utf-8?B?ZysxNjk5Q21KUXVmVVo0R1NDbnJlTXJOQVJBcXZhMDRlRzdWSk1hTFBoSjRn?=
 =?utf-8?B?YlpEU3NXbElQSzR1bjEvTjNMUytkbVd3YW1zTUdNN243MzI5bzlCL3c1UjY1?=
 =?utf-8?B?WVEvTXloeUNxbnRGNUNxZkNqOWIySVZITkhLbDBMMXMweVRoY29FV3lPMVB6?=
 =?utf-8?B?L3dHajRNSDAwdVJhSjUxaFRaUDQrdjNrcDRBaENlb01udGdkNnJZbU8zYTk4?=
 =?utf-8?B?cXFSNjRiNzIzT1FPWlo4SlIvTHd1OUcxdzlFK3R2VWJJbmt2ckVWZVdNeTI4?=
 =?utf-8?B?d1lLRXhmK3l2MmVMOUJrQzlweU9Bd3Q3bUNOTDNZOG9EbDA3YzBma0tGR3lK?=
 =?utf-8?B?Nks3KzV5akNtK28xS1RTNGUwOFlOaVR6RG95K0Fod21zdkhCY0ozWkVjUmlV?=
 =?utf-8?B?WnMyQVpzTS96akFuQ3JDNGo3NS9DRlEwV0Nxa3FyOGw0WWVaSkE1Y2FkZEtR?=
 =?utf-8?B?VHJxcFZvN1NrQzFLVzRETkFONlpBdHFFcUo5WnZsbm93M0hoN0ZyOXJUazYx?=
 =?utf-8?B?bVlWb0NaSWVPL3FPdENBMlJ4UVFOSkFJRm5YM1U4OTV5N1d6cHRibEoyZS8y?=
 =?utf-8?B?dTNFdU1YbWhPUDVBYTcyd285VGZvc0ZRZDRJTXdUeDBiN0p6L2x4QnJvWUF6?=
 =?utf-8?B?Mm95TU9Tb2JhWmVoVDdNbDAyYWRhdzlOVTc0ZlpjT1czTmVlL2ZuSEVRNGdI?=
 =?utf-8?B?OFhCa1NkVEVjcjNLbXBINGhidVAxR1pESDBiMXhnSmJVNVprMjRNTHBFV0tk?=
 =?utf-8?B?Q3FaTTEwYTdGSC9qc0RuaGxYN3NPdmZxSmdEbXZjR3FjdjhBVUZCcmJIZE9W?=
 =?utf-8?B?cjdkMDd2ckRoSVF1VU5zUHhIWTY1cUlPcXpFNGpXVnlGQks0cU9yeE9Lb0tQ?=
 =?utf-8?B?YWZoelppQnRuT1c1RWdNc3RuT21QbXU0NHFrRXBSaXhJSUc3K0FNRVd3TnhQ?=
 =?utf-8?B?NFZYNHVqRWFQY3JFQUhKbHZMUkswTUdMQ3JiNlUvODhHNTRDd2ZzS3BKdlBz?=
 =?utf-8?B?N3orUGJZejFvZ2dhVHQvOUpvd3hlVHZtY0srdThJTE9Xb0llRmpVRDN5QjA0?=
 =?utf-8?B?OFVBTGk4M201eFV0ZmlHdzBvdE9EdFNZNFJSTzVyVDBPN3JXb1RaQzBJQjJR?=
 =?utf-8?B?V2dZajA2MmVabzJoYThadmlvTFdYWEU2aURoTHdCRUhqY25VYTRkN21vMGl2?=
 =?utf-8?B?YzJabXRLZnRMMTRJa004WHZWMTBPYWI1bUp1ZFh3cG1MbzBrQ3RzUUxKeHdY?=
 =?utf-8?B?MW1uOEh0TTZIM3duZ0w2MUM5TG1sT0RCQjNiTm9KbjhWMzFJTmxiSzRoenZU?=
 =?utf-8?B?VW5vcVl5Z3ZXUVlJZmQ2aFlxVmtqbFczNUNDYUs4YUZ1Y1RabHNNYkhCQW10?=
 =?utf-8?B?SXNhMmlVZ0pjVEJaREl5TGNpWmJNRUpoUk5TK01ncmxmNnNlc2FJR09iMTVX?=
 =?utf-8?B?bzZnRDlnckxFV205RUxnZk92YTNVNDNaMkczNDgyblEwbDkwR1pERlNpTzU4?=
 =?utf-8?B?djZhUUlrMHpTV090Q0lWRGR4Y1lzQyswOG5vWVE5MzJDTDF4cVZQT1plQ1dZ?=
 =?utf-8?B?UXFFOTlsZU9UcTR0OGVhSGpSUGIrRVFES1R0Y3RmZ0pGQmFQcVZ4Nk5OUDFL?=
 =?utf-8?B?MDN5OHk0c3IyK2x2VExzSEdXY3IwR0FzQjlnKzV6cTNOeU5SZEl4dE9MOGVK?=
 =?utf-8?B?ejMzQ1E1VjFPMFlBWHBTREY5eHVRWEZFYlZ6RG1LYllIS1RsbzVXWHhCVXVF?=
 =?utf-8?B?L1o3OWZJOHNYWmlTTmFXU2E4bjFCV3JKTDdPZkMxYVk1WDFudWkwTW9KN3Qz?=
 =?utf-8?B?cFY4Z1RYVlo0eXk1aDVlMW1VNHk1QjV0T2Z3bGc1TE80RXlmWDIrcmNEUk1u?=
 =?utf-8?B?ZUltdndiZ2JSUHl5eVNaSURkWUFoYWdyZTg2YUtKNGY4MzZBcE9VdVEwTlFl?=
 =?utf-8?B?d3BOTW1iN21jRWRkckk1SjdEcHhGMitEdVlhK3NGcGJqK1EyZmlBamZOTmwy?=
 =?utf-8?Q?dezNFEZPAlWYDcD1P8v0bqQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d80bdc1d-8037-4131-e010-08ddd8e5bd4e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 14:45:39.6076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0pm+0dStaGSN7hJvF/gMo6G6kFOZWsqkHuZv8J3yEBmC+dLfTzOuVECVLtpNJHmXuoMNOS8/kgh4UUc5Wxe0OggL/+bhcapj9OUnV2AE6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7674
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


On 11-08-2025 18:31, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
Patch looks good to me. Please remove this statement from the commit 
message. If you can remove this, then

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

-Satya.>
> Update function xe_wa_init to xe_wa_gt_init as per latest kernel changes
> introduced in https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/342d1f84320994ab72a6ca96e18f2985868e1cbd
> 
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 00d045cd8..04de2bfd5 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -256,7 +256,7 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
>    * @xe_sriov_init:			xe_sriov_init
>    * @xe_tile_init_early:			xe_tile_init_early
>    * @xe_uc_fw_init:			xe_uc_fw_init
> - * @xe_wa_init:				xe_wa_init
> + * @xe_wa_gt_init:			xe_wa_gt_init
>    * @xe_wopcm_init:			xe_wopcm_init
>    */
>   static int
> @@ -562,7 +562,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>   		{ "xe_sriov_init" },
>   		{ "xe_tile_init_early" },
>   		{ "xe_uc_fw_init" },
> -		{ "xe_wa_init" },
> +		{ "xe_wa_gt_init" },
>   		{ "xe_wopcm_init", 0, true },
>   		{ }
>   	};

