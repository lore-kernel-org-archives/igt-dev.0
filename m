Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6E5109318B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 08:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BF410EAAB;
	Fri, 20 Mar 2026 08:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kc7AQWT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5717510EAB0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773995557; x=1805531557;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Xh5c8WojUqLTC2/u2ONyeAih6N8xHQ2ilJrzpBzizQ0=;
 b=kc7AQWT6Xyx2564A4q4iOqk7sZw7jaobrGsq8zXGA6RHetVQc9MMM/ji
 ASeWdzZGDuP1HeMUobm3OhMzyGItQ30RTPJMY3RWnFg9IFt2ry4ze2FnR
 0n/HffFNYSb44ZLC/D1TnRVqST4gYXejUNH2XfUMqx1YeRC7uJRsRrYYm
 /bj7qhIH3FuNkvb7jWpWkbeuxvFIEXGAU7/fqer3Lab2piBVfS5WAffLq
 duhZiY2agwME/zN1gZe8rBv4wAz7nKNwaxGWd/Qv8xM9AIkXSmEbs5wBa
 EUNf9PGkCfS6d/+eE3bQeDR8KjYNx3306kvXgG/h9egACGv2M9NSqfuqq g==;
X-CSE-ConnectionGUID: wcwrZuXCSBin4ej5uGNfWQ==
X-CSE-MsgGUID: yXk+4sN9TEKU2pC5LZsCvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74968163"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74968163"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 01:32:37 -0700
X-CSE-ConnectionGUID: 8AYjlLpuQ+S3jCnJ7zjXXw==
X-CSE-MsgGUID: x6wNoGlhQNa7XGQJrGOveg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223249293"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 01:32:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 01:32:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 01:32:35 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 01:32:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZPOtz+ZrxWZtqRBfgXR+cW+9V3t7FLvroZqQjCkAyu3q/mMMfdrVkF+qa8SQJnJ7lbmMqV+6j9PrKHIn1oGiY54dVoV3i794VEtcbmverApKU9DBUcL7qJGLlIm0RwfCXc+OHhw4YI3I0HUJftMGNHLQrvAj7x2r8kMGwgr6Eoo7Y/T61Hx5rlOBQCzZ0imn09m9x4EUbFZarkg/TYRmZC9uptCVkZYQvgYMm2xfkwVXO+In/MrSndTPerDIeADJLLSGVeJmrfre0ulL59f0LoOMrcj3zy6Klgo6R8/5UG+MH5ro0iS7aXx22AlmIVRTlnnfQvC9/QE0a/GhGuamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWU89aqWGqieCe4zUoUxUbfb1FLCmonCtq7W1n3+u70=;
 b=VUsO8zzEa5Bqg5Jv14vXAoiUCBd7IBJsby3jaZ+/uIGb4wmLq/6v8hzk/yBw32Edwx12B+E+hbADT/L2VqfdYwhMFiXZSDeZN2Wn9ulgMIbp06Navx5pljVmc0Z6k7RgAYTjmNaz8ZeinA0QrBseMQARmfnMtuGnAsuGuVQsToun9PJg5SbkK3HzreeestE7KzM4Tooy/CK5+CsdFRkoVfevRJ0zObnuhx/Lf/VZ3yCKZKQhWCI4Np+pSonw3wzTqI3PhXGcUT7iFOKnE0MWs4ezgZ9uxD0xgFiNES5jlOXdIDpQneInw6oJkcvn6Ck2XIrKYND0Wsu3K0kL3KClww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Fri, 20 Mar
 2026 08:32:32 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 08:32:32 +0000
Message-ID: <c25692c3-6896-462c-b4d1-36f0df20ee94@intel.com>
Date: Fri, 20 Mar 2026 14:02:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 0/2] Skip intel unsupported downscale tests
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>
References: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
 <3bca96e1-994a-4984-9088-eaf3f7569638@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <3bca96e1-994a-4984-9088-eaf3f7569638@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::20) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 3001087a-3778-4d43-3155-08de865b3abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: bxo77jWyywEjGWNu4mEs+TWhLtdcR4ieMjHzvh9lflS6kZ6YSK5FT67EyRMkeOxq9K4aRwv169fYYIaOLv/ZwzXpWtKQJpe3BvBeI8l1CmukxMvDYTT2g141X6uWZlvxSvs0pp1SkryxnpwRC/jzZAHg5ruXodtuCKBAW4Vxpi5A9c+P5Rue4CEn7Qro0qP27NeO1RaKYbGSv4qsV+3dTxpF/qgCTxl/H8JNRCyJgDfEpmfYrRmOWIb58IS+w7VE+6u9xkekcp4hDM8XHnoYIWBUNA8FDRGU8zbCEnxQKOTfa0xdFtfLV+vTfLsMrFXXXbm5RuCeGlgwg5RUWo+SzZ9ETiJBCX47I84HXiAR3ntkLlfyIr9LWRnoF9ABOEkwuE0hEasGLx3Bv1ZIT0PIW4NH4D8KLGTE8/BjZUqv0pyJGLJRs5jFKNk1RgYfCp/D9A5IRMI25PMHYG5E35126Vf9odooup2SiKvcjZj7oiervUM9HHlw1c5mWIYBq+zhinKHDRp5RU51XC7Zvdqr+KmgSvCjn3BT0MifW4JnwqlN4W7GgQn4h+9BRQJOjQILLKV5aGovoG2ahoGi77txBRlPkdVFu5q5Uz91MzoMGW3y8uHIiZcrVeIrjCPePEskFQFooPwBz6xWIR6bfjCO0VOkCf9USlsfLv6O9wJmSDnDwa756k35TpLEpkqmts/U5H8YwuyO5kK9cFI5HteB8cXh+7/pKjrHYq/Wc20tkho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDEwMnVHWXd2MFYrWFF4KzI2L3NoNlBKb2Z4VkZ6OHYweU94aTZKbUtMcXRF?=
 =?utf-8?B?SzcwNFBIajhxOE1GaXpZKytDNlArTEdjVENFUjBDWC9XZlFuS1BRZUJ2amhn?=
 =?utf-8?B?WUJKdTcyelNFVmlFd3JNb21CTCthVmMyVWpFQ3BKSzRwM0NRdUVveFhxVkVa?=
 =?utf-8?B?OGwzOUoyd3c0YnVnT1J6R1BwZHUrbTJkRHBXSHBVYkN2bkxSMVpXM2RkUU42?=
 =?utf-8?B?Y2xmRjZOdDZTek9RblFIU2RlR3Nad1VWN3FoWmpwZEVEUzhYNXpTRnQ4NUJa?=
 =?utf-8?B?K2d6eXRHelhNdjBXcVRGWGlUQkVGTXVySkdQU3dJc3dwQWs0YTU3Q3p4d2dz?=
 =?utf-8?B?NU1ucVFRN3haNlJPbkp4RHlyNkJhSXNyRXJVUFJUVGNWd2V0NzdVRks5dUFJ?=
 =?utf-8?B?UWNQdjVyWW5ZYmRnT1hWQVk3eHh0emFYb2t2eHJJR052dDNRcUN2dFRvUDJu?=
 =?utf-8?B?eTRhYXZ0K1NEU3V6R3IzblA3VkRaRjRQdEZVUEg3U1d6NjRTNVBBWlBsKzkv?=
 =?utf-8?B?czh2MFM2L3l3Y1h5aE1hOCsyUjNzTGlGYUxLSmYybEVhUlNmZ3cxbXpVcXZJ?=
 =?utf-8?B?WUtnSkYxZXJMOWRTcUJoK2NvK0k3QnUxanF2cllzcEJ2U01KejVNOFlIQUY3?=
 =?utf-8?B?QWNhTlp3a1Y3bjdIRWxZU0VwdHRLNEFmQ2lKS012QWZzelpGQmIxYjh0ZWJ5?=
 =?utf-8?B?ZVpQL2hFWHh4ZW1mOTN0ZHJvVXRscEgzMElPTElvUGErSXdPNE1hMFZRR0hL?=
 =?utf-8?B?dGZ6UEhRLzBuWlFCSDIrQUd5aHVRbWs5djNkUVVlbWkwZXZXYUNWL1MreHBO?=
 =?utf-8?B?QVBNaXdrKzFLSVB3d1VXcDM1VER3OE9hQXZNNWhLWU9WQWc1bGoxOFpJYWhw?=
 =?utf-8?B?aHFvK09kMHkzMHNHRG1WMTZTc1lhaTE3MEhMMVFiWFR3Q2hjMDhXZUNPOFd4?=
 =?utf-8?B?OTRrenM3dDJBY1U0V1Vxcks3L1BveDZiM2Y1K2txb0U3d0NPRTNQMFZ6eW9H?=
 =?utf-8?B?UzlXZXF6c3d2WGYvYzFKWU91YStwZk1rb2NuUkJ6bjFSMUJkUk44VVhFcC9I?=
 =?utf-8?B?TjBpMkZickNSbFZWU3dtazBPcy9aeUNndEVPVFJHeHh2dFZqM3NEeit0TXda?=
 =?utf-8?B?SmZxYk5CamFFeEx3akxQNTU2UmhxYnZGdWs0QXB2alNNZHIxeUR4U0J6TWNC?=
 =?utf-8?B?NGJ4VzQwcnBoVlFMQzRwamRybDRHTnA3cENTOHpmMGZmK0U0Vzc5OFJRdHRB?=
 =?utf-8?B?akg2c0VCL1dYdFV2Sm81a2Z6NFVjSUsvTms0UDZndGFMbkFxZEJObDRlY1pM?=
 =?utf-8?B?KzF4c3VkQ0JSR1FsQTRiMUFzNURaaG96TFlzN0hkakZSRzhvSFB1eEFzcnJr?=
 =?utf-8?B?YjcrN2kvVldVTkZpcDlQOTBsRU1rd05UQ2pZWnhNMDR5UXY4SW5xc0xPNXJZ?=
 =?utf-8?B?SWo2RHlRTXBPeHZMVHBITVc3UDdGWG05eGVuMFcwc3lkWE1lVnI3S0pXaldm?=
 =?utf-8?B?a0pteVE3Q0hSVGRJV01TT05JcnZEVW1yWWtWZy9odXZZUWJldGF5M0tZQ1k1?=
 =?utf-8?B?V25YSjZ6cWJ2UWQ0elF4Zmcxc2lscnRqdnJtdVNBSWZjQVFZZ2pnSGxORENF?=
 =?utf-8?B?UXR2c0hNcmZQUEN6RWkyL043cHc3ZG1XR0xXRWFZaFNmODZENy95THJ5cWJx?=
 =?utf-8?B?elBJd05nTHdkVDNYR0xpSXY5c1NtUFZwKzc3SmFkaURNYndiK08xTG91R1l5?=
 =?utf-8?B?Um1XeFRSb0NBcmpwTjRFV3pJcVEzWEtXdHA2dXFVdFFmd003aGVLVnE2c0lR?=
 =?utf-8?B?TUEyVlJHRGZIRjErUkdGb1o1T2UxTklkZnVkKy9HNWpJeURHU3dySWplbTFp?=
 =?utf-8?B?a0NrYnF3bEZQNW9sV0N6aTR1OTcwaXROVFQ1TU9TMEhuSDVpbVVyaTBWL0Mv?=
 =?utf-8?B?Uk83UFlFM2JzbjEvay9aTGtmUkpETVY0VXhNV1R4Zk8xaUwwUWFtWHVpV1ZO?=
 =?utf-8?B?OEhBM1M3aStKVDBrT0JHVk82QjhRNmUyMHlJTU1NN3p1OXZQZldqeXhmYjh4?=
 =?utf-8?B?UkhtT3kyeVo5M050ZjRQMXFSQ2pmS1R6d1BvUXcwL3dyWFJ1VS9wMEFhNE5h?=
 =?utf-8?B?Ylkvdi9vZys1RTgrRzM3R2dFdEY3QmtqNGtTcmM4RmR1NUpiNk9aZ3RSY2pX?=
 =?utf-8?B?L3Nta2lCYzVWS0E0TndXK05NRlZaRUxpc3RqVk1Md254NVNCbk1hQW15bzdJ?=
 =?utf-8?B?NWFkYW1QbFNWQURZR3ArK3hRa2tuYTlaQlNhWEh4MHlLTHhNMUhoQWwvWGhy?=
 =?utf-8?B?YWl2OFpDdmVZWkhSUHJDazRKTEZpRitUSVJ4UXJGbDBxcVprYlJMS2MwK3dx?=
 =?utf-8?Q?buvtBTJSooY46twA=3D?=
X-Exchange-RoutingPolicyChecked: MdRVFYfH+ocROYvVlVcKpEAZvFqddbqGbONzHeuLlgYqkxRfVeb+VWjn/GIpm3XbJhpZ6rhfTnrOGbsMpU7o8sxvb5ry02OsVZtKirpZAjjcvMY1ydfmFGprhYrQzdb9m/Ombv9w8ZynPqhILGpiUu4zH+9B5rNC6CbOAL2rJjGH5vWgVekd5AMbFfcEuQ0CYfXndjD0FH4E0TALFZWqvt0TvTSoHPLX1L3LEf4KOV6W41NwxnZr5ckxzR8oOzJuayk1bDcOOT2AvNUCgJ2+LtvA0+OgTQ9C5QEC8uiaGkhJ2FL0nQIbuq9dKVmrifGFIZfr6rEVS8sjCCMDDaMw9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3001087a-3778-4d43-3155-08de865b3abf
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 08:32:32.2295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ri1fJAdZU87p2aLe+Kv1wSIDF3BYrJRE/7jCW0sGiut3y8XsB6/JJKyED9w9xvQuy5yIoBKxrgOWDPtJKU4j9s/L9RGQw3VU4TdsIL3lGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

++ Karthik

Hi Swati,

On 3/20/2026 1:11 PM, Sharma, Swati2 wrote:
> Hi Ramanaidu,
>
> On 11-03-2026 01:10 pm, Naladala Ramanaidu wrote:
>> Some scaling tests are expected to be skipped, but they still iterate 
>> over
>> all display modes, which generates excessive logging and eventually hits
>> CI disk‑usage limits. To address this, early skip logic is added 
>> before the
>> dynamic tests begin, preventing unnecessary mode iterations and 
>> reducing CI
>> load.
> Why can't we handle this in blocklists? 

The tests are already blocklisted, but they continue to run. To address 
this limitation, I sent a patch.

  According to Karthik, platform blocklisted tests are only excluded in 
Grafana queries, not during execution. CI intends to generate 
per‑platform testlists from the blocklists, but it doesn’t seem to be 
active yet.

>>
>> Naladala Ramanaidu (2):
>>    tests/kms_plane_scaling: Skip unsupported scaling scenarios
>>    HAX patch do not merge
>>
>>   tests/intel-ci/i915.fast-feedback.testlist | 216 +++-----------
>>   tests/intel-ci/xe.fast-feedback.testlist   | 323 +++------------------
>>   tests/kms_plane_scaling.c                  |  38 +++
>>   3 files changed, 128 insertions(+), 449 deletions(-)
>>
