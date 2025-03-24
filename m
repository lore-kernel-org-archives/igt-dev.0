Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C997AC36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 09:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F1E10E095;
	Mon, 24 Mar 2025 09:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/wXoF0S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E347210E095
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742808100; x=1774344100;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/gZW1KnlRGCIS3ak96hmyeJqTs3y7HB5D02FCgv1/jI=;
 b=j/wXoF0SrJJJvCg/FOoQIuhe0HIkaeREBAGMwWkts/VyTHnLIX+uML8/
 iMsj5fsH2cToKS4VvqTzD0AEZAP8DCvYeB2lLErS1cxa3aw0PXEicmh1a
 Cvvh/2/kYQ4HXvb32UFcp5/uYBztcgU/GOmdtJcn9I8E9hjDnzwJ//jQt
 S5hVmPeeXVEM0A3vrq4UHClK4+BFWTqQsH30dv/XllEVc6YPeUNyoa+kA
 2mOtIIRqxjxVwFB83tbUld2z8fux8T6+K4WkprNG0zOIuqwK5gwNa8b7J
 8Bj4YIZjhzexzKhzEjBUHvdkwMCe3DW/vLyUM/DfbzNX4eSnLYLOqUulm g==;
X-CSE-ConnectionGUID: 8uSZjtP+RNOyoXVZf5R8IA==
X-CSE-MsgGUID: 0SbzluPdQiyITVHDhGk06g==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="47876536"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="47876536"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:21:39 -0700
X-CSE-ConnectionGUID: 3UTCOCQUSIusUFx2rjF7YQ==
X-CSE-MsgGUID: wFZr5pXTQz2CuFqLdfOASQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="129185651"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Mar 2025 02:21:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Mar 2025 02:21:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 02:21:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 02:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ps6UKfhgZ7nKGnvW37E1O6qkbDRBctVUMSzUYkP65Se1LeiHKQesCkBF9jRWTpDp3EQaGlu684GXCfMSTqpU7OyDaEgUtRoqZpCCNtMTjBz5AF/3Vu9R81WIgzyNx9VYqPANtnA9HjCUytX5Fq0ALdvQF8SXyGF0sipDgfHn4my/UiKe5OMFw4446584aWUJgCMcqa5xyhmxsxMSA6lhryZubmso6L0Siw7O2twhJdUP+zHk1B3WR2g1gi8WJrPNgGDVmRHDoOnh7pjBhvc+UUarzbSX0XvwAxlSP0GXIYRpIiZbMocPFKdnm8Pv32GzVyjmQu1e1Z46g6ns5n3Owg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk0eMD1jB3F466vglGXfyO8RRxLDHl+9hQCHXNzd0WM=;
 b=ZdoI6o7rV2jpV+nNLPfKc7dWPBwuDDWwht5dnv5m/zX9yAV1nycENUTCAtLD9Cqx2Jh5oxKnM4dUm/qiMtxigkhDuVpTVHQxzKyOtUQvD71Tsm70mMUVE9qBI+xdcTyohpUN2G7m9dy6OJUZNF0x9r71xQg5Sgkp318sSla8lbSBy5YZNUbS2geaCMEcxyysik18BeLebkSG5L7iq4sbtAR/2WguFA0XlcJz6ZvoUzUaL7m0sMn44cu5urh3ubC/GcaSjR3A8jyEMzahFQ/5c0KW0Hhlq2Wzkm2YmydmmOV7+YTWLHcR0g6aZWktZn0BZ26cNLuydlZDGDsUMou44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by SJ2PR11MB7575.namprd11.prod.outlook.com (2603:10b6:a03:4ce::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 09:21:09 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 09:21:08 +0000
Message-ID: <8500d363-541a-4706-8040-82860134f333@intel.com>
Date: Mon, 24 Mar 2025 14:51:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 i-g-t] tests/intel/xe_fault_injection: Inject errors
 during observation IOCTL
To: <nakshtra.goyal@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
CC: <francois.dugast@intel.com>, <ashutosh.dixit@intel.com>,
 <umesh.nerlige.ramappa@intel.com>
References: <20250324090801.3121551-1-nakshtra.goyal@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250324090801.3121551-1-nakshtra.goyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|SJ2PR11MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 378f19c5-c2bf-4a4e-3099-08dd6ab53607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWZ3MEh4aVNBZmhtbG91L0J4R2xrcjVSNTY5ZDE4TDRxdnBxT0MvNEN5YWxP?=
 =?utf-8?B?U2xDT25ZcE5sanhFOFA2VFJGL1BVbWpCZEd3MjA5MTFWMi9SaTB4OHRvUnlR?=
 =?utf-8?B?Y2JiOEhxeDIyemRselpHRjBGbWcwbTlxUkJZTFNwVnhWTGIvZ3Z0Z28xMlBO?=
 =?utf-8?B?YzRod0FFdndLWloxZlZ4U0lrNXRLN1BFWnpFWS9uWVY5a2lTWE5Nd1lsY2JN?=
 =?utf-8?B?TFIyOXpkZkFPVW8vMmxYRHNORWYzR2x1Lyt4NFdLRFpkdXFnRUpPMi8yYnRY?=
 =?utf-8?B?MUw5akRzSTdXOUEvY2R2N1F5TlpJa3ZOOTdpN0xVc01nTjIwdnVObFUvQ1VU?=
 =?utf-8?B?eEdWRjEwR1pVNXM0dllpQ3dkYzJXTURRZDh2bkpPMjZqQzdGUzZIZDNJVy9i?=
 =?utf-8?B?VytaeVNYU3p0a3RkeFB5bkpyODM1eTFETW0vV3N1RXBaV3Y0WGd6bDNYZlNJ?=
 =?utf-8?B?WnEyNUYxV0oyVkp4eU1zdlRDTGJuZDRrdzA2TDM5a3NVZVdJMWJmMjFaVUdC?=
 =?utf-8?B?VzRlVnA4RVdxVGZTeTVmLzY5MjhpVWhvTEhTU3h5cXJjQStONzltNHNYeVlm?=
 =?utf-8?B?ZnRTdUlhRWl4WnRWWnlhMmNjZXNFSzNmbDc0SmJhQmdiT0hXMEFQQnFVcFNN?=
 =?utf-8?B?dzdqdHA5WkdGdExFVmlkU25jWW1UNEI4VE8wVklZbWVNVVVySHl5bXdESk9j?=
 =?utf-8?B?b3pNbS85NnUrcklPck5QK3FWTys2SVFpeGRZckNVOHBUWWdlYm5CWEFpTmVT?=
 =?utf-8?B?L3FNOXpVVlVzYlVibkx1bnFkeHB6eGZSMS9TZkU2WUFOblo4Y1JNdHpaMHBj?=
 =?utf-8?B?RGk1eGV3c0h2ZUx4aHFlemNZMU54RzJLMjhVUG9VZlYvSy9EYkpRZ2E1UnJv?=
 =?utf-8?B?SVpVR3RlS21WNEt3eGdFUVFNU08xYTNPZEFWK2xqR2szZ0dWbC9wZVRSVjNK?=
 =?utf-8?B?Vk0yaVJkOC9MakMvVlJXNTkwWnVxcWZ0aDVzdjliZHozS1dJaG1pWExXVHVt?=
 =?utf-8?B?UTduQURzZVF4UlVlL1R3WUQ3UnJTRjNtV3h2MlVidkZrLzl2U24vYTk0ZGho?=
 =?utf-8?B?bnJGSmZtcklUS2Rzdkw3R0lDU051d29nd1hlWXBzcWUwc1NPMWFMcnZ3c1Er?=
 =?utf-8?B?dVMrdlZ1anJBM29tQlRJbCtXMGNramtDZzd0RTV0djdVbit0dGpudGhoZGlm?=
 =?utf-8?B?a0tvaXdLUHl2QW8wWlBJK0huUHY2bGdaQ3A3SW8xaFcrdzJqWS9BbU9pekVN?=
 =?utf-8?B?OGM5RnVBWWs4b1pCTHhtYlhHQnJCU0sybjhhVGNxbU0va2UzY1preHk5UUxj?=
 =?utf-8?B?eW1YcXo1Yk5pWVpWakJOVWRKUDBRbHYvOFBuay9lY1pVS1puSEVBRDhSSTE4?=
 =?utf-8?B?TmE3OTdOZ05ZVkl3azYrdUVlQVV6UmdVMmo0Z2h1T2JNejl0dEMwSFBQNkJL?=
 =?utf-8?B?Y0g5MGVvd3Rrc1hwS1hTMUZQRGhXVEgrcFpFZGlvMW5XQjh3UVZzQjJ0VFBn?=
 =?utf-8?B?OEQyT24yM3oyeENKTUJLWmZuT08vYVpab0pnRjA5TW1kNlExaHJPWW1TVm9l?=
 =?utf-8?B?czJKOThkVEhGUVJPS0hZMVJXNGI2dENWRHRPZnQ4cC9qaTJNZUg3NFF5Tjhi?=
 =?utf-8?B?RlhHaUY2Z3FPTk9FTUJKb3VCQWRCN0xHRDFLcytvRS9mSDFGTnlwMU5QODha?=
 =?utf-8?B?MmwzSHFzamtmdk1vZVdsNktKSmtWZHZ3K0FzU2hLM2ZvOHRjUEU5Vk5EVHVC?=
 =?utf-8?B?UDZiRkx1aHpkc2ZuZW0rVVRaMUp3OGpFM2J3cUlHU3lDZXlYd1pEZWRxb2tI?=
 =?utf-8?B?V2tBV2FaSEJsbUEyb3h5anY2bURreWFlVmEzREdUK2NMWm9IK1p5dFpuZERk?=
 =?utf-8?Q?Abn/Pk21CGnY4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVZERHYrcTIrUE9WK2Z4SDBBR2kxdWxyKy85M2IrMWdBNFcvV2hEalY3MGFL?=
 =?utf-8?B?QjNSNE5IYkljRkFHV3pmS2o0bmZ4aEVuc2ZXdGZmVE9ybC96ekgxcEQ5SUND?=
 =?utf-8?B?ODZaYmtOMDRvdjJYRW9CSXkrNkppSDliUjFTNzd4N3BhOEpFRkJtMVh6a0hq?=
 =?utf-8?B?U3NCYTY2YWFpQ2cyRURKVGIxMDlTTURCSXYzSnlEUCtER3QwR29mc3ZObDQ1?=
 =?utf-8?B?Mk9sZzdjMFRYaFFZT0l4ajJuQTlNTExYY0JNdWE0U1NtM1d4ckpvMWdFZzYw?=
 =?utf-8?B?VlJIOTNqaU05K09PblI5bUhNVk1FdzE2Y3lwR3JHSFVrWm8zbEJoZUhWNlU2?=
 =?utf-8?B?enZVVTF4S05OaFlVdWFWaS8rQW84OFh5VndZVmM5ZHhFZ0l6K0VJem5qc1NX?=
 =?utf-8?B?Zkk3RW1wcUZVa2IwMzkyM2NXTXRCMk9DY043b3RUVDlEMWhmbVFjcXBIQk9R?=
 =?utf-8?B?QS9jY090OTdhUXpudy8ra2VwTUM1Rm93OSt5WXcrK2V4OU1pZWxNZWNtRUFS?=
 =?utf-8?B?NVlmTWhrRXAzWXZveFY4TVJWQUFwZ01DQjNlTDlzTHBDaEtLNVluKzU3SXVl?=
 =?utf-8?B?Tm9ndFJJd1I4SUE3L3JtM1hhUmRGUFh6Nk05TVUwNEo4N1BoNDB0V3BSQXQ0?=
 =?utf-8?B?M3V5MmlyZzNHUzA2OVJiMWNpTHc5WEFhMUlKdXQrVWIwTTVmWWovVjAzQURX?=
 =?utf-8?B?YTRTcHcveW5hS0xvaEJ3Zldnc0ppNTRPNG5EazNtRTlFTnZLenN3V3Z0d1Vj?=
 =?utf-8?B?Q0NzU2ZLdTkwbkxuU1BaWWdUSGk0aXBrYzZlbFh0NE9ZYTFOVWw3Ujk4REdX?=
 =?utf-8?B?V2VyLzlyOXBHeDI4SE9QQnFvTWNCY25aaWphdDNJUS9kRisxMktBRnBCVkZn?=
 =?utf-8?B?dVh1Ly84b1lKbEpONERGbGRQdXh2clQ3TFQyUFhLL3c0L054SlI3VWZjRGlS?=
 =?utf-8?B?RlRxdUkxVnpKS04zRTJtbGJWNkZRdWZtU1J1UFhzb1llRUpjTFJvZUhkLzV2?=
 =?utf-8?B?YmpodXZ6SW5LODNEK203d0pKUHl1YWNnVHR3ejIzcWVQT2N4UEpkbzArbW1Z?=
 =?utf-8?B?MzhETXMrTXhWai8ydE9DcEJvZ1R1UzlYcnBsMlhFdWEvNDljZFlBWFJYaEx4?=
 =?utf-8?B?Zk9sRE1xQ1FpZTVVZGZVQ3loV3EvbFVGT0NXVzRUTWY2ZVllZUViZWdnaXdU?=
 =?utf-8?B?bm9rQW10TFg1c3dBYlJmclRGeDlyNU9FbXFBeFA0MVFJaGJSM3dOMnVYaFdp?=
 =?utf-8?B?T2FFZ1FMaWlGU2Q0U0RCU3YyTFpBcWQ1aXo4bGdoL0ZNQk0zS1Z4TmRnVFp3?=
 =?utf-8?B?KzBvbk9xM1ZEaW5lellGSklPRFZtYk1WdHlGWGNNUDJXa1Z0RnlmSGxjS1ln?=
 =?utf-8?B?SFNubmY2N2lMZ1hROXN5a2x2bUlVaTFET0xobzBIb0FjVTFaSDk1NStDclp1?=
 =?utf-8?B?bE85am5kSDhGS0daZ0dLVTJ0Mm5mYjZjaEhmSXNlekhBZWZXMVNZdzZmenFw?=
 =?utf-8?B?VU92UnhxWmZGR1llYnJuaWNGZWY1MmY5anRyTmNNZEoxNC90S1BScEoyaGdI?=
 =?utf-8?B?VEgrWmhKa2FkVEFPazZpVWlaNk5udENXb0NzNzJISUhKR1BrcVhncUpOQ0NT?=
 =?utf-8?B?MWx1ckNHN3gyNlNyQUpOdkNnN04wK2lHNVY2aTQzUEZvSDVBR3pnZWN6T2Ex?=
 =?utf-8?B?TTErblZZb2hBcFZsWnYvYi9oTEVVbEpCazFrMUkzaHBvYWZDU012YW14Wnp6?=
 =?utf-8?B?eGZYSUhXMmVYaFhZSVhNNlFjN2NpZmNHT3VxQnZacHhaNHJOdm5MRmU1cGln?=
 =?utf-8?B?ZWQxRWpMWWlYYmdia2RRWEVldEZWZDFHclVIbm05QnpMcS8wUkZ6RXpNQXlL?=
 =?utf-8?B?WG0xL1BFYWFlNmRReE5LS3h6bnJ3Ync0MDZ5cWhhK1RkNHM0a0tRY0JocE52?=
 =?utf-8?B?bzQwTmlTWTRJT3FkdlBvRWpDRUZ6S1Mra2ZqY1Y2Y2MrMy9NU0w5d0g2dlRN?=
 =?utf-8?B?cXJoL1JsQUJBRnIrTTIzNTRtRm1hcEdqN0ZkUDFzSlVVYktlWUIwSGxaaFVs?=
 =?utf-8?B?SStjTTdGSnZuc2lwU3QvOS9BZmtxVkhlTGlvZFVGU1NpeElabk9jbi8xallt?=
 =?utf-8?B?S1FhMEQ4NUp2ZnVaa0pwcTdsQlJCSER5RVRBV0Q3Y2ZjY3cvdmhoa2hGVVdo?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 378f19c5-c2bf-4a4e-3099-08dd6ab53607
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 09:21:08.8699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbmHoVxB73JvOtqywLiDU4M6xgd1W02memtiqDFlb00fDf84eDvFvtdf7Ke4yv02J273CBqYG4ktNPb39aOps3qURU2b7vIQMJkUtLyZ1u8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7575
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

On 24-03-2025 14:38, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Use the fault injection infrastructure to make targeted internal KMD
> functions fail when executing xe_observation_ioctl()
> so that more code paths are tested, such as error handling and unwinding.
> 
> v1: Adding remove config at end of test , Adding igt_sysfs into igt_assert
> so test fails if sysfs read fails (Sai Teja)
> 
> v2: Run sysfs check before creating config to destroy prev. config if
> present, add one check before creating new config after destroying old
> one (Sai Teja)
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 62 +++++++++++++++++++++++++++++++-
>   tests/meson.build                |  1 +
>   2 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 5409d19a6..eaf93a0b2 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -20,6 +20,7 @@
>   #include "lib/igt_syncobj.h"
>   #include "lib/intel_pat.h"
>   #include "xe/xe_ioctl.h"
> +#include "xe/xe_oa.h"
>   #include "xe/xe_query.h"
>   
>   #define INJECT_ERRNO	-ENOMEM
> @@ -314,10 +315,57 @@ vm_bind_fail(int fd, const char function_name[])
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
> +
> +	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
> +	/* Destroy previous configuration if present */
> +	if (igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1)
> +		igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG,
> +							&config_id), 0);
> +
> +	memset(&config, 0, sizeof(config));
> +	memcpy(config.uuid, uuid, sizeof(config.uuid));
> +	config.n_regs = 1;
> +	config.regs_ptr = to_user_pointer(mux_regs);
> +
> +	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
> +	igt_assert(igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1);

We could have dropped these sysfs reads as we get config_id directly as 
the return value of add config ioctl. But this way is also correct I 
guess, I don't see any harm as such.

> +	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
> +
> +	ignore_faults_in_dmesg(function_name);
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);

I still think that it would be better to do an assert_eq to INJECT_ERRNO 
here. But then looking at other fault injection tests, it doesn't seem 
to be very important.

So, LGTM

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
> +	igt_assert(igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1);
> +	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
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
> @@ -366,9 +414,16 @@ igt_main
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
> @@ -393,6 +448,10 @@ igt_main
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
> @@ -402,6 +461,7 @@ igt_main
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
