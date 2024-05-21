Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2285C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 05:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916AA10E647;
	Tue, 21 May 2024 05:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fu46Yl6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C9B10E647
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 05:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716268983; x=1747804983;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uhVe8LzGie6/jO6E90wX/dzHEWLQWO+t5cA8VNiSdx4=;
 b=Fu46Yl6+MKLcb4nRz/k0C7OAIjO3nUNVjsDWbFDmn+kEmIAcqxs1JsYg
 CGJlIK2OFDR91BbF+MoIp3qtGlCuBv1zDeB79e3k9TfyuTuEPa8JvF6bp
 KhdWyrIhuHqucV748a3p16tTT8rCvVUi8qkm/8o+P2PeXdq7TIPXZURng
 rEyX+iECCSRuUyjqMpO/FozlauI3jEdJOms6Af91QQ8ZNEyZUUEJYLYRu
 7nlMyuTEOpzJC/LFbm8+qBre221K2u3vcgemXZKCMTO3VFV0XOC65oqGK
 Icp1W5WuOz1QTw6Qt0fnryIB8+mjsfTD4pRY5vIJGxModjAr1jq+yWzpX g==;
X-CSE-ConnectionGUID: J3Ni3r69S46MwXDJ5tgLjg==
X-CSE-MsgGUID: n12m+guCQQeFOA9BAUYfsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12281038"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="12281038"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 22:23:02 -0700
X-CSE-ConnectionGUID: mzhBUxRNSa2YQbSIAll9yw==
X-CSE-MsgGUID: Ut3enbIjS+2HY6IugSn5pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="32809718"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 22:23:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 22:23:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 22:23:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 22:23:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 22:23:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MapD5/Atb0crPxrn9T03pDbCu3i5VAYmLHyqfgQ9xDe+jToEh8dkKJaL7jpmX7JgZiHT+Ex3mqnwLyhbaSBaT5jVT2xYw7cG6C33XpWnBYMatYvxaXxbEAvrddcY0kTWDLBJ/us/yOR/MMWcTqhk1annx4igJyodXZ8OAGpBQ2fTns8xAuCXzqeLareGtqvGk0o6kdRgw8wQVypGftdaRiKDzF4YNQQCAwh8y9WuT8KDajOlJ++iXCt94w/eyM4eF1mHZdi2EV0F0Qw7N2VPjNEPcvjQgQBFNPVfztev8lUtyzJPdAAlvQQs03Twb7t38APyZWwJDd/sXPgiTLMwwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAGs/jnR8fuFt6HARu/v2dMlebSHvDHDEziSJ5IeOuE=;
 b=Qi5MxMTXnamm6XUQxuX0/8y62Gu82R5rSGyVx0IJF6BdaCXhCwdFylgiqm/APyWEGghEDpgF/50wLxMgSiQhxtBv0+2L2V9C5e530S6u+iORMFy66Hd4OBKKNK6I80T+m1M+g8yNVNvFZQqRaY1bBEoVvDWdzeywdEQ3XWP/O9M8xyzs36ahtm8GzcQvTuWzxilN0ZtmEanOcz/l6M4Dbz/HtqaYbpz0+zQh2DhihdzMX9Ei9E3vWP0kc0fkAxpIuTbMvS5Db7FCEnibMhB5JGobK8Q39yRNNjVXXyFRsaNlzdBGWPoN1WPL5/QuDD2dVTFq6z8Wi+D0UyXhMVVmzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DM4PR11MB8091.namprd11.prod.outlook.com (2603:10b6:8:182::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.35; Tue, 21 May 2024 05:22:59 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 05:22:59 +0000
Message-ID: <f7b85a6d-45cc-4d94-a8b2-9785f69b11cd@intel.com>
Date: Tue, 21 May 2024 10:52:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless modeset
 to a virtual LRR mode
To: Manasi Navare <navaremanasi@chromium.org>
CC: "Saarinen, Jani" <jani.saarinen@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Drew
 Davenport" <ddavenport@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
References: <20240424201344.783935-1-navaremanasi@chromium.org>
 <64cef3df-1610-4d53-a44c-905220e09b76@intel.com>
 <CAE72mNmRsA-KcZ61F6d4Pg5_OQnpifO7AmivE2AkhN_0WT=eTw@mail.gmail.com>
 <682dccc4-c788-4bfd-b8ef-b24d60b488d6@intel.com>
 <DM8PR11MB565517E06CDBA9B389BA86BCE0162@DM8PR11MB5655.namprd11.prod.outlook.com>
 <CAE72mNkYFsViPR18xcT=WZyjNrMSJ6Gq14MUbMzUVHarDfDb6Q@mail.gmail.com>
 <6ca5030f-005f-446d-a49a-be08cc8e6e0f@intel.com>
 <CAE72mNm6UuTO=PBhdOcCngMGoE1+6Qbku0RkaPuDetiaRPWEcA@mail.gmail.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <CAE72mNm6UuTO=PBhdOcCngMGoE1+6Qbku0RkaPuDetiaRPWEcA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::6) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DM4PR11MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 333b01b1-2469-4a7d-b1e9-08dc79561472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djdScTVxRVhOY1hkZGR3aTk3QlNVTHFneVpGRmhlMnd0dTNiUzhIMElqWWhK?=
 =?utf-8?B?M1dMY0RHcHBwUEtGWlRtQ2tKamIzb2p6WHJWRGZ0aFZic3dHUEptbHB1NFla?=
 =?utf-8?B?OW85T3UyeHpmV0kvamgyQURUdVFGSWxBdjB0bFJBTlBTYngwYkZ0UlZTM29a?=
 =?utf-8?B?T241NFI4emI1SnV3OVl3eTJ4b25rbDUvK2dzR1BGMzBOaWZXdXVaeS9rck5a?=
 =?utf-8?B?S2JNWXdORkkzSGI3Y3Uxb1hhZGV1VStLY1Jad3ZLUzRQSEU1TUpXT0RDYlVS?=
 =?utf-8?B?T2FaTkJwUXhkVm5UUmdUQXpHS2xsa1FtZmdtVkc5QUlmN05GUDZJdkIwcGpr?=
 =?utf-8?B?MlRaN0xMN2pmMXM3NGlGSTNRclJMdGVzTXUyaS9QTnFFVTZEQWZOUllYZkpS?=
 =?utf-8?B?eUdGek1JSXA0SlBsSWQ2ZnMxQy8rbVBkZFRQZzBKdGN4YW9Ha0VMdkZhUHRm?=
 =?utf-8?B?MnN2TTkvdFUvc2J1SDZDenFYK3JRcGtLVHEwUjlCcXZxVWVJaHp0dG9lVmFq?=
 =?utf-8?B?c2FKajVvOUFKbjQvVEN0NEt5SGI1cWZzMlVwREtLUGNuaTlIUVJTb2hRdTlm?=
 =?utf-8?B?WG01bXdGT05NbGdjSk1CanZiREJINlNxZ0kzVXFCLzJYM1RNMEh5U3AwaDJN?=
 =?utf-8?B?aGNLYXNFZjRIa0IzNjVyZ2dyREFsU3Z5QTRwRmdub1ZCMk9iNXRaNGRKenZE?=
 =?utf-8?B?L0h2dE44L0ZjM2JoNUJwYkZBMkpZdlc0czdFSFAwOG9ibXIzYmhHZUNLVkJR?=
 =?utf-8?B?Q3EwNVB4SzlocDNSNkZZSFVuSExCOHN1WURRMklkNndxWE9yNWpDcVFTRkNu?=
 =?utf-8?B?Y05WNXZOelo4VzFEM29JVUFMM0U1akw2eWdSSllvejdhODhHNEF6bGFjemx3?=
 =?utf-8?B?eEFLQ2R1amU0Tkh4cCt6MmFTcnpkQUJnYytLT09nN2p2SWE5cHpnb2xTM0V6?=
 =?utf-8?B?L2k5OUZ2ak5GQ0JFeUlLYlBRamFIS3dHb2xNa2oxVTV1NHFTaGFiRlBxUms3?=
 =?utf-8?B?U0l2RG5nT1Vvc0M0RTEwQkdzaVh4Z0gwQkM4ZUdvUFkvZHM1Q2NZcTMyazVV?=
 =?utf-8?B?MVRsdjFaajlrR0prUEZrb2NOS1l5L2V6dm9NY3ZsaGpEekJMYXh3OXhnUmRJ?=
 =?utf-8?B?aFd5V1dIOFJQeVBXUCtDeVhGVWRRV3BOejVVWjJLUVRjZHFBUnd0Q3ZhQ0NY?=
 =?utf-8?B?OEtwRkdOdkdTUzVjbXRvUlg2MnNBZWJuZkNRai9wa3RhYUxldjNxQVZuRnpt?=
 =?utf-8?B?b1RSMkhwbEd2VWJ3SXFManpYRnJ6b3RaVXJ6MU0zMnplbi9EWlJvcmx4Q20y?=
 =?utf-8?B?eXFCMmhWMVd0UFB2a2tFamtlSW1YRUFoM0h2TTZzcUJybzR3QnhyOTZsU3Vl?=
 =?utf-8?B?ME5mWmdmcVVsVm4wTXdzZTl1SEdNTXJVTXFzb3ZXajNZTU9KTEpyNmFOWmhw?=
 =?utf-8?B?S1BHb1BCWkJTWGx6TDI5d3BTSi95Z0t5RGx1TEFMa0ZNeTUwdXlLODk5N2Q4?=
 =?utf-8?B?bnJEeVhmOWcxUWM4WkVnbmdlem1MZS9BRkdabE5OTHJhVnZzMEFHNVBzNUV0?=
 =?utf-8?B?a2pqN2dYV2FrWDdxdWRTNjBSYmxUN0hRcnBFQ1h5cE9NMkRzRVB6amlKSW0v?=
 =?utf-8?Q?9+T9HGLf0IJpMpyQHKNjur0us4Te16jamte68uSQrBdM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djluWmlPVHFKNEJ6dXdlSk40Uk42bWh2LzZQajhOd0pldThReGgwNEp3Rmxy?=
 =?utf-8?B?c0JUZzRvaFh3bExrSGlLNjAzTUl6c2twRWFnTlpSdFVNdDZWVS9oWmNZL1R6?=
 =?utf-8?B?Y0phVEVBaG94VVVDVkM5ZWw4T3RHamVGTDY1VHYvVTAwTzlGWGY1SWJzQXdW?=
 =?utf-8?B?TXJNQUxSWCsxTlYvNGRXQWNKbnAycWRDbVhqbWV0RXp6MTlObEp3cDA4T3VF?=
 =?utf-8?B?S0o5TGVtcnhFSTNONlFET1E2Tktla2YyZzFaTlBncnR1RHBGL3c2cTFoQVUw?=
 =?utf-8?B?RWlSN2xvdG8wYW9VQ1hXUU5xWFEzYyt4UGpZZmF2ajU1UGhUdXZIOThIWTFR?=
 =?utf-8?B?L3RmcTFDK3RKUkhveTl6SEIyb1RZbzJGSHdISG1vUTdKSU9oOGFXRjllbWg0?=
 =?utf-8?B?ZkxMbXJFYUVwbUtLeW90Skg1aUdleEdMMTJudVVFTU8vQ3YrUnlma3RnbW9C?=
 =?utf-8?B?NVBON2FzVGhaanZyMXN0TWdLeUF3WEFTWHQxVmtiVjJraGROSzNBS1Z1RGo2?=
 =?utf-8?B?Q29LRjB1QlB2YzR2dUcrUXg1VTNod25BQmRiSjI2Vm9GMVFIdVZuMVluQ0lP?=
 =?utf-8?B?bHdoeVZoVHJ4TCttZWNIdjBIUmRYQzZBOCtpdnJIR1BjaVRCT1pLaXNkOENp?=
 =?utf-8?B?cDFMVVZuMTQ4S2lkVFRKRHR4ZjJxTTJJUytKTWg1WE5WcmZlQ2FpdkRXQzIx?=
 =?utf-8?B?WVQwVkZOck01U3g0VEF5ZG42WGlqMlY3V0szZnkxdWJneVNhaUlYNzdzaU5F?=
 =?utf-8?B?ZUpMNng1M0JiVXZsUTlXb2dhVVI4cnk0czhkR3ZaTTlTRDRqekhEWDN2c09P?=
 =?utf-8?B?a3ZtUzJWODBPK0FIdlhWVTlNZ2lKTjdiM0FXczVKbjlYeUFJR25GK1c1MW9F?=
 =?utf-8?B?alBENHdiM1pEZGxCcTJMYkhaZVgwZUxPd0VvR0E5K0lWZzl0VGw4NVh1U2NM?=
 =?utf-8?B?ZXAwNkNvNHRoMUpPNlQzVGxwSEpUNVFBdk1ac0drL1NuaGpkZzVMQnR3NS8v?=
 =?utf-8?B?QXJKMVZOcEd1OHR0ak1OT1F6WHFvTDRiNlVKdUp5VkxXZDZEMmk4dGwxbUZu?=
 =?utf-8?B?bzZMZXE1OWhoVncvSzdPd1lpQzJBelFTdy9LY1NlS2hXUVVmd045a0ljRHNx?=
 =?utf-8?B?VWpWUm9Cdzd6a2xycFhSK1dWVG1kVVpNa1JIWStFTkZsYjdkRjh1Zkpkc1lJ?=
 =?utf-8?B?R1B5M2FNVHJ4cWZXNEpELzNBSnVwT0I0dTV2UXZYZWgxeUQ3L0ZGcXhyc1V6?=
 =?utf-8?B?Sk9aUTNOUTJQNWFCVHQrZXI4SlNVWktKaWtVd2FlKzBqZWFQanVnV0xXYk1V?=
 =?utf-8?B?SjQ2NkNVUVdDdHFackU3aTI1UGFDRWwyM0tRcVE4eVc3MW9Jck1uTkNPMGwv?=
 =?utf-8?B?UzdkU0p3dk5Ra1JtaFdLVHV1ditlQ2NnQ2JtQUUvQ05ITmVaeDJjTy9VdDBu?=
 =?utf-8?B?Zjc4UUJqai84UE9OQVZiZE1DQXhDT2E5MzRDSDZpbisxLzczSDNjbW51Qm8y?=
 =?utf-8?B?OThJWUFqNHkyRlorcGRselRpSmJBQ3hIbDdmNjdRbU5ZMnRUK2tMdWF5UGtX?=
 =?utf-8?B?L2VqOEpKazNXSnBFSG5zQm1RUTU3Z2RwZWlXcW93UmtPZ3pQdFpBbG9NWERz?=
 =?utf-8?B?bkpjbkRIclJjaHVsek1iTE96VHhXaWtPQjFjSnJTT1ZKUjRRNWtDV1FPc0xV?=
 =?utf-8?B?NWVKY095dlJrSHY4OXA0d2xUZ29mOHU0SEhDUVlTV0hXK3NyZk1QY2NJK0Vl?=
 =?utf-8?B?Mk5WYXNqMlo3OGJTMSt6S1R3NVBpVHEvTTI1TjBYVlFYS2g0YituMUtaeEha?=
 =?utf-8?B?alVrWUhCNTBFUVdBTVpLM3B1ckRmZC9SVWo5aDk3SmZDb3FVaGxVYlQ0ZzZx?=
 =?utf-8?B?SjlIcWVLcEM1WVFZQ2xrNU1OUFFPWEUzWmF2R08yVi9XYnhzbzdObEF0NXUw?=
 =?utf-8?B?c2liNVN3UnYwWlVmRlJmSnRSeWR3Ry9Ob25sMHVTU1JzVWJ2K1lwZ1Q2WC9Z?=
 =?utf-8?B?OEEraElBVktpanNaaHZpTk9jUGNoR0MraWVsUkFsK3ZPbWRrOENITUFCZG8x?=
 =?utf-8?B?VGJuR1RMejV3V2hGUzk5UXZVU24wZWwxbWR3RllHNnVzRS9jeDFDbTUrQWVw?=
 =?utf-8?B?aWZDS1FLRXJzQUNtWWpEM3dnUTAvcmNvVWYxbUJyZW5HeWJYM3FiREZqdjhY?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 333b01b1-2469-4a7d-b1e9-08dc79561472
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 05:22:59.8013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqaV84h3HDTPpJdeXtTPW/Zk9kBU3roJUhZgsH/XXs6kklkyC2VuFH4ixm9IfvAG+0qooUbhgMlW2A/ITkYEiHX0HbheQGwTM+RC5efzEIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8091
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


On 21-05-2024 10:16 am, Manasi Navare wrote:
> Hi Bhanu,
> 
> Yes I have verified that, it looks good and I have also been running
> this on my Chromebook with VRR panel and it works fine.
> Could you please review and help get this landed?

Thanks for the confirmation, this patch is already merged by JP.
https://cgit.freedesktop.org/drm/igt-gpu-tools/commit/?id=927fecf906d25e88f19bc245982c022465276528

- Bhanu

> 
> Manasi
> 
> On Mon, May 20, 2024 at 12:54 AM Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com> wrote:
>>
>> Hi Manasi,
>>
>> Sorry for replying late, I was in vacation.
>>
>> On 27-04-2024 12:54 am, Manasi Navare wrote:
>>> Hi Bhanu, Jani,
>>>
>>> I do see that even the other vrr tests : seamless-rr-switch-vrr /drrs/
>>> basic-fastset are getting skipped on BAT, so its not related to this
>>> test. I am able to run it here locally and test.
>>> Could you please take a look and see why all of these would be
>>> skipped? Seems unrelated to this change.
>>
>> In case of seamless-rr-switch-(vrr|drrs), these skips are expected, as
>> we don't have any valid config. These tests are eDP specific & panel
>> should have the modes with different refresh rates & clocks with same
>> resolution.
>>
>> In case of seamless-rr-switch-virtual, it is a connector agnostic test,
>> it should run on one of the BAT machines.
>>
>> Can you please review the helper low_rr_mode_with_same_res() once, as
>> you are using this one to pick the low RR mode?
>>
>>>
>>> Regards
>>> Manasi
>>>
>>> On Fri, Apr 26, 2024 at 12:48 AM Saarinen, Jani <jani.saarinen@intel.com> wrote:
>>>>
>>>> Hi,
>>>>> -----Original Message-----
>>>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Modem,
>>>>> Bhanuprakash
>>>>> Sent: Friday, 26 April 2024 6.44
>>>>> To: Manasi Navare <navaremanasi@chromium.org>
>>>>> Cc: igt-dev@lists.freedesktop.org; Drew Davenport
>>>>> <ddavenport@chromium.org>; Ville Syrjälä <ville.syrjala@linux.intel.com>;
>>>>> Sean Paul <seanpaul@chromium.org>
>>>>> Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless
>>>>> modeset to a virtual LRR mode
>>>>>
>>>>> Hi Manasi,
>>>>>
>>>>> On 25-04-2024 08:50 pm, Manasi Navare wrote:
>>>>>> Hi Bhanu,
>>>>>>
>>>>>> Thanks for the review.
>>>>>> This is not specific to edp, it applies to all connectors.
>>>>>>
>>>>>> If the BAT results look okay and I have your r-b, could we get this merged?
>>>> Did you look those.
>>>>
>>>>>
>>>>> Looks, BAT results are not OK to me.
>>>> Right. To me looks so too.
>>>>
>>>>>
>>>>> The newly added test is getting skip on VRR configs:
>>>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-
>>>>> all.html?testfilter=kms_vrr&hosts=bat-adlp-6%7Cbat-adlp-9%7Cbat-rpls-
>>>>> 4%7Cbat-adls-6
>>>>>
>>>>> - Bhanu
>>>>>
>>>>>>
>>>>>> Regards
>>>>>> Manasi
>>>>>>
>>>>>> On Thu, Apr 25, 2024 at 12:39 AM Modem, Bhanuprakash
>>>>>> <bhanuprakash.modem@intel.com> wrote:
>>>>>>>
>>>>>>> Hi Manasi,
>>>>>>>
>>>>>>> On 25-04-2024 01:43 am, Manasi Navare wrote:
>>>>>>>> This subtest validates LRR fastset functionality by testing seamless
>>>>>>>> switching without full modeset to any of the virtual LRR mode within VRR
>>>>> range.
>>>>>>>> Here we start from highest refresh rate mode and then switch to
>>>>>>>> virtual LRR modes in the steps of 10Hz within the VRR range.
>>>>>>>>
>>>>>>>> This is used to test the LRR fastset functionality of the driver.
>>>>>>>>
>>>>>>>> v5:
>>>>>>>> - Pass a reference to flip_and_measure (bhanu)
>>>>>>>> - Add a new line between between declaration and code logic
>>>>>>>>
>>>>>>>> v4:
>>>>>>>> - Change the test name to align with drrs/vrr tests (Bhanu)
>>>>>>>> - Fix some build warnings due to rebase
>>>>>>>> - Use a local virtual_mode variable
>>>>>>>>
>>>>>>>> v3:
>>>>>>>> - Fix build error due to rebase (Manasi)
>>>>>>>>
>>>>>>>> Cc: Drew Davenport <ddavenport@chromium.org>
>>>>>>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>>>>> Cc: Sean Paul <seanpaul@chromium.org>
>>>>>>>> Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
>>>>>>>> ---
>>>>>>>>      tests/kms_vrr.c | 73
>>>>> ++++++++++++++++++++++++++++++++++++++++++++++---
>>>>>>>>      1 file changed, 69 insertions(+), 4 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index
>>>>>>>> 15c62b34b..7f64d6806 100644
>>>>>>>> --- a/tests/kms_vrr.c
>>>>>>>> +++ b/tests/kms_vrr.c
>>>>>>>> @@ -66,6 +66,11 @@
>>>>>>>>       * Description: Test to switch RR seamlessly without modeset.
>>>>>>>>       * Functionality: adaptive_sync, drrs
>>>>>>>>       *
>>>>>>>> + * SUBTEST: seamless-rr-switch-virtual
>>>>>>>> + * Description: Test to create a Virtual Mode in VRR range and switch to
>>>>> it
>>>>>>>> + *           without a full modeset.
>>>>>>>> + * Functionality: LRR
>>>>>>>> + *
>>>>>>>>       * SUBTEST: max-min
>>>>>>>>       * Description: Oscillates between highest and lowest refresh each
>>>>> frame for
>>>>>>>>       *              manual flicker profiling
>>>>>>>> @@ -89,9 +94,10 @@ enum {
>>>>>>>>          TEST_FLIPLINE = 1 << 3,
>>>>>>>>          TEST_SEAMLESS_VRR = 1 << 4,
>>>>>>>>          TEST_SEAMLESS_DRRS = 1 << 5,
>>>>>>>> -     TEST_FASTSET = 1 << 6,
>>>>>>>> -     TEST_MAXMIN = 1 << 7,
>>>>>>>> -     TEST_NEGATIVE = 1 << 8,
>>>>>>>> +     TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
>>>>>>>> +     TEST_FASTSET = 1 << 7,
>>>>>>>> +     TEST_MAXMIN = 1 << 8,
>>>>>>>> +     TEST_NEGATIVE = 1 << 9,
>>>>>>>>      };
>>>>>>>>
>>>>>>>>      enum {
>>>>>>>> @@ -214,6 +220,18 @@ low_rr_mode_with_same_res(igt_output_t
>>>>> *output, unsigned int vrr_min)
>>>>>>>>          return mode;
>>>>>>>>      }
>>>>>>>>
>>>>>>>> +static drmModeModeInfo
>>>>>>>> +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int
>>>>>>>> +virtual_refresh_rate) {
>>>>>>>> +     drmModeModeInfo mode = *igt_output_get_mode(output);
>>>>>>>> +     uint64_t clock_hz = mode.clock * 1000;
>>>>>>>> +
>>>>>>>> +     mode.vtotal = clock_hz / (mode.htotal * virtual_refresh_rate);
>>>>>>>> +     mode.vrefresh = virtual_refresh_rate;
>>>>>>>> +
>>>>>>>> +     return mode;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>      /* Read min and max vrr range from the connector debugfs. */
>>>>>>>>      static range_t
>>>>>>>>      get_vrr_range(data_t *data, igt_output_t *output) @@ -641,6
>>>>>>>> +659,49 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe,
>>>>> igt_output_t *output, uint3
>>>>>>>>                       vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
>>>>>>>>      }
>>>>>>>>
>>>>>>>> +static void
>>>>>>>> +test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe,
>>>>>>>> +igt_output_t *output, uint32_t flags) {
>>>>>>>> +     uint32_t result;
>>>>>>>> +     unsigned int vrefresh;
>>>>>>>> +     uint64_t rate[] = {0};
>>>>>>>> +
>>>>>>>> +     igt_info("Use HIGH_RR Mode as default\n");
>>>>>>>> +     kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>>>>>>>> +
>>>>>>>> +     prepare_test(data, output, pipe);
>>>>>>>> +     rate[0] =
>>>>>>>> + rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
>>>>>>>> +
>>>>>>>> +     /*
>>>>>>>> +      * Sink with DRR and VRR can be in downclock mode so
>>>>>>>> +      * switch to highest refresh rate mode.
>>>>>>>> +      */
>>>>>>>> +     igt_output_override_mode(output, &data-
>>>>>> switch_modes[HIGH_RR_MODE]);
>>>>>>>> +     igt_assert(igt_display_try_commit_atomic(&data->display,
>>>>>>>> + DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
>>>>>>>> +
>>>>>>>> +     result = flip_and_measure(data, output, pipe, rate, 1,
>>>>> TEST_DURATION_NS);
>>>>>>>> +     igt_assert_f(result > 75,
>>>>>>>> +                  "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not
>>>>> reached, result was %u%%\n",
>>>>>>>> +                  data->switch_modes[HIGH_RR_MODE].vrefresh,
>>>>>>>> + rate[0], result);
>>>>>>>> +
>>>>>>>> +     /* Switch to Virtual RR */
>>>>>>>> +     for (vrefresh = data->range.min + 10; vrefresh < data->range.max;
>>>>> vrefresh += 10) {
>>>>>>>> +             drmModeModeInfo virtual_mode =
>>>>>>>> + virtual_rr_vrr_range_mode(output, vrefresh);
>>>>>>>> +
>>>>>>>> +             igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n",
>>>>> vrefresh);
>>>>>>>> +             kmstest_dump_mode(&virtual_mode);
>>>>>>>> +
>>>>>>>> +             igt_output_override_mode(output, &virtual_mode);
>>>>>>>> +
>>>>>>>> + igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL)
>>>>>>>> + == 0);
>>>>>>>> +
>>>>>>>> +             rate[0] = rate_from_refresh(vrefresh);
>>>>>>>> +             result = flip_and_measure(data, output, pipe, rate, 1,
>>>>> TEST_DURATION_NS);
>>>>>>>> +             igt_assert_f(result > 75,
>>>>>>>> +                          "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not
>>>>> reached, result was %u%%\n",
>>>>>>>> +                          vrefresh, rate[0], result);
>>>>>>>> +     }
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>      static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t
>>>>> *output)
>>>>>>>>      {
>>>>>>>>          if (vrr_capable(output))
>>>>>>>> @@ -686,7 +747,7 @@ static bool output_constraint(data_t *data,
>>>>> igt_output_t *output, uint32_t flags
>>>>>>>>          igt_output_override_mode(output,
>>>>>>>> &data->switch_modes[HIGH_RR_MODE]);
>>>>>>>>
>>>>>>>>          /* Search for a low refresh rate mode. */
>>>>>>>> -     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
>>>>>>>> +     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
>>>>>>>> + TEST_SEAMLESS_VIRTUAL_RR)))
>>>>>>>
>>>>>>> Does this virtual RR applicable to eDP only or supports other
>>>>>>> connector types too? If it is eDP specific [*], then we must add a check for
>>>>> that.
>>>>>>>
>>>>>>> [*]:
>>>>>>> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_vrr.c#n
>>>>>>> 660
>>>>>>>
>>>>>>> With above comment addressed, this patch is
>>>>>>> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>>>
>>>>>>> - Bhanu
>>>>>>>
>>>>>>>>                  return true;
>>>>>>>>
>>>>>>>>          data->switch_modes[LOW_RR_MODE] =
>>>>>>>> low_rr_mode_with_same_res(output, data->range.min); @@ -841,6
>>>>> +902,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>>>>>>>>                               "between flip timestamps converges to the requested
>>>>> rate");
>>>>>>>>                  igt_subtest_with_dynamic("flip-basic-fastset")
>>>>>>>>                          run_vrr_test(&data, test_basic,
>>>>>>>> TEST_FASTSET);
>>>>>>>> +
>>>>>>>> +             igt_describe("Test to switch to any custom virtual mode in VRR
>>>>> range without modeset.");
>>>>>>>> +             igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>>>>>>>> +                     run_vrr_test(&data,
>>>>>>>> + test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>>>>>>>>          }
>>>>>>>>
>>>>>>>>          igt_fixture {
