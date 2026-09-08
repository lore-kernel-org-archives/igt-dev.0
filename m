Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA84C79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 05:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE1110E03C;
	Tue,  8 Sep 2026 05:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZ3WOMbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DBE10E03C
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 05:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788844890; x=1820380890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=trNRAJnGEt9cyVmDPPmS1fCJeHWJ4UcdbuogKvrmjKU=;
 b=CZ3WOMboWtxHfFNI26lD3KXJP2QfWkQH5vgQBChUIp1yATmy7tZzGTY7
 ZCsPYoVxRKGEsUAnNg7jX5dwVMS1G0ouo/yZx0/M979esa6HE8wlZf2gR
 C7EXQrKRJbcXHpCG8JAoQBWq14HfWowhPImfmcBU5YrXT1XbIrvCJnn3C
 pe3SKYea214wMh5mJyNwrBHe5aI8yjwr2MrcPB+FY4w36mlfwoTiXT/bQ
 +pqJH6oYNUHTVF3FJB9z6dgfYuyEEhHK/uuL4zW1wjO4/uyVg8TyvF2wN
 vNxIvwlyzy9+Ky56UJTglpSyynDlDxNODuRdrdUxVH1plvKlmjT8XChxy A==;
X-CSE-ConnectionGUID: taVlVwHWRl+APUnkyB58nw==
X-CSE-MsgGUID: qAuKe89mTOu7OUIg9h8+UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93056183"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93056183"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 22:21:30 -0700
X-CSE-ConnectionGUID: la3XeMOxSy2dD2plpRnuEw==
X-CSE-MsgGUID: Ma4s2FUkRauHJqP7QKoLJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="309109608"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 22:21:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 22:21:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 22:21:29 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 22:21:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sO7adxH7sgZCkIRpCyas6OqKb3MShC1dCaf9N+3SueqfGBKb+KF+7fxtmCZTV7hf3UfyFh/9d59HOwQfv2zE2VRec1C3zjky/UklXge5deNdMiTX/Gi1qFlQmneaegedMcZdwq2YsSlHtbEohPH7TtUz2i6soUYMCrZ3Nde+FBy6O9eiexx6IKOhnslphNJTGIvrr04A5rBMYvR+1AbHS38wI3OND6i++q7jJengpHpT5MmEhirb2XHyDY3Vca1wM3k4D0JickahHgDoNtFlW4K8Q1ZuEjAvg0k9K3obh2L1sNCAw1LO2mvi46V8FFGwJGpr9h+4uUL5kzZrhG0Zog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmS5aXM7fnvPM95bxsWSRjjknWG5i9choUf2UwOoSC8=;
 b=uHnEyNKaMOGmwqbtOn02mvea5+0SFZSvnIY+7VQjoLx36ypwelizTI1zUHmEwTneqYu+SAQVgEPd/cg2gM0EcPCzhO8eDSb2ziLiK0oqc3uwzzJsAxee+oRjEAj4cpxwl5yCl1SY5IG1uKIh6O/hMj4kHVAVLRSoozVXsYY1wYJq1rRqCA6sPpEILK0Ik/BJl+reL6dRqkrlcbvxCks5SMf4TOMQOnLvBbvM5JPuBHiHeLZGa5F4AlUJkMbokTzNqy3Op+5sYACvMV1+v74UDTmxN+ZkltMbLTbppjdWiCxpWpqC2ak9yJ/H5MqgXDiUf2E90ixbrD8ao/5RqaYkmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 05:21:26 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 05:21:26 +0000
Message-ID: <6cd89b8f-08e2-4fb9-bb70-e8cbd968d756@intel.com>
Date: Tue, 8 Sep 2026 10:51:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_ras: Add test for GPU health
 indicator
To: "Tauro, Riana" <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20260902025813.1795134-2-soham.purkait@intel.com>
 <1b4d63c3-bef7-4576-9947-49931878353c@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <1b4d63c3-bef7-4576-9947-49931878353c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::13) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA1PR11MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: b88d0cc1-04f0-4eb0-1175-08df0d690795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: Qlxp0UAx0wCwbY4xkdDI9OmjRYWtpsMIJUtn7ROaB0A/t9aVag8hCwDZwAa9t4y6zDpYI9ZQcd/iSjjn+e23DLWArm+P7r7HySdHr5TVu7dqdWOEHVwGq81GWPduvBNMGchyFq0CSJ0iuRSyf6aMcqpTViANbpXAxPQ4NMquNgY15aws0jrbiC88flZz0HkRSsQ9GvEthG1a4lBG3Ye+reS8MrLBtFKLJ3JFrewiEj3MvdAOWCy69AhochjQ8uHQU0xr9kFu6vlA9hrT/26e7tlaf/JIVC79pK3PSwB5ilusuTNJigyxi0bBo0OKwNCFvrIwLcgbw4AwXEKyYxB7qbiMqmr1wZLvKeuXmvcIEL4nf+t82oNMJLuMIwEkQqTWJxL7/oQp5Q1gpLAXOTJm9ohn6+e5zdTMUd7gflPPo4UZ/sn7BfVASG24PyQ8M6W8H4PjHBq6o/dyh83M6dBxyHHVC7SSZiIZTNG2QOh9W5A4KE4qebr+5hf+76YG1D/q8EexFA9KQub/g370nF6uigNrPVhzniENX8CV/ndF2oZeItov2HAyy6nrUYwhYS3sdrieJPd01O2faeoSDYnTlEhDUj4MyjxIuJHZ9w4nLs8ifaQb+mpoO/cngqH8mNPL0pusJTUZdjheeHliCYOr7kFPNrlbJ5ugIJJIJUP/0vw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2ZzdTRzKzlpbVlJR1R6eHA4bStteS82bWF3dEJ3dTU3M1BacU9FcVJucXZq?=
 =?utf-8?B?WGMzSWwvd1RNSEVDWUFjOXFvK2tteXZRSGNRZ1NGSllrVmhWcDVZM2dUV3M3?=
 =?utf-8?B?R2JweXd1ZXZoRjlRVDFlemUvek5IZ1ZPRFRoZnU3eml0TVRBZGJwUHFPMkMr?=
 =?utf-8?B?QmZNQzEydFV3a3JrL2dTS1BsY1k2SXJKL1pRS1hyUEM1NUl3WGlBRWVad1RN?=
 =?utf-8?B?M0NkQnNiZlBQbkV6RTZVLzhPajBxbGdHVmNKTXExUlFKdGV5NU1RNnBSSWlR?=
 =?utf-8?B?bVFMVTA0cngrbmVvYSszZE1QWjN0ZDZtaituN3laK2hLWlZDWVVkd1lZV1lE?=
 =?utf-8?B?T0JhelRJcm5PaTIvTlFTU0hCOHFUVnhrK0FlV2dIVFNES0ZBWEJyQm1ucHZl?=
 =?utf-8?B?NWZmSFlKYWl5MWJVTkt1aElsQkxzb2p5RjBtUno3dmlIY3NHQm82dUtlMmpZ?=
 =?utf-8?B?OU1JWkRJendRTW4wZStkUHhxL3hQVlJBSjZJMFFXSVc2VWoyb29rZzVkZCtw?=
 =?utf-8?B?RkVoWWlwdmUwckZWT1g3MHNYWUwrQmxNZFV6bXdEOElUZVlBY1Q2OGtSQzAv?=
 =?utf-8?B?VFd3QWtmOFFDQjVLWHNYSE4vZk5xeTVua0RaOW9UMzY2TmpaT0JISDA0NzhP?=
 =?utf-8?B?UGJydFFYWlNWNDZScTUyWko3dnZSa2R6TzdvRC9wdnJnUSs4elJBS3Zpamg5?=
 =?utf-8?B?SDdSRkNUaHRhVkhxZ3M2V0lteExveU15aGlTUVppanV5VTI2Yjl4Y0twVmhu?=
 =?utf-8?B?eHBXQVpHbHBqQ1RRVTBtY3JDYnZaMzc3azU1NzJSTCtJMjVYT0t3a2QvQTBK?=
 =?utf-8?B?OExSV0VOUlZ1OTRqWXFvZlR4WWhMMmNvWGFOb2F1Q3F3dlZ0NC9FbEdheXJk?=
 =?utf-8?B?N2VoU0lIeHBoYkVGUUlSNzkxNjlrV09UVVUwYVVFWGZJNllicHVuMXowNWRh?=
 =?utf-8?B?QTNUWHpvTnh2azV4ckNIL3BYYzRVb2N3Z3VscEt1TnN1dmFWWlgxZFpLdndo?=
 =?utf-8?B?SUs4b29EcEFlcXhIZmJDOHdrV3h1U0pBaTBCN1RiYUl3NmhXM3NLVGNWdzR5?=
 =?utf-8?B?Q2JsbFdFdEYwT0lObExFUnVpZUIrckNCblZLWEdseGY4a21TcWt1NTVveGw4?=
 =?utf-8?B?Uyt3d2ptRzJ4VVJ2UkE2S29GbFQ1MC9qMnJhSGJlZGF3T1dyMjRzVVNuYUxw?=
 =?utf-8?B?NGIwTkFyelJxeFhNYXNha0UreEo5Q0U0cHRsckVxYTJRWDdSdWtxTmMwN0E0?=
 =?utf-8?B?WXdiU3hGdnFWbFNITzFtaFRPczVxQ0hUMGV6WmlKTHJlK3VGVFh0VFJhZU9s?=
 =?utf-8?B?L3BpU1lhZzNnVjE2dUpSclUwV0IyV1dQMEw1YnBucmg4aER0STdDd3ZlUUdV?=
 =?utf-8?B?WHVMYy83SzhLZStLdEVibFpCNWllcmNaVHVQRklCU3F3RlNhV2pHOEowTGht?=
 =?utf-8?B?VEQ0U2dRdklDdkVLazVxcjhLMGZocUNUL0dsUldOSTJHUkF1VEUyUUk5bnZv?=
 =?utf-8?B?Q1BGNkNBT0RzSXhoaWRaZmkvK1l4eFlreVE1OUwvMVYrMld1RmxUWk1ub0NY?=
 =?utf-8?B?Y0N6a3M4Y29IVUk0RzhpcVNiY0JNZzZlTEo5NWZFSHpNSHN6RVpja2NmbFoz?=
 =?utf-8?B?a1NPMHZpdThDZEhlSW1RZHp1Qnc4YVFjSTFoY0Z4ekNYTm5Ha1hzSEhvZ3Jl?=
 =?utf-8?B?N2daSDFZWHJIQmNxaS83WGVzYXlQcXoxY1pBRFU2emdNVmRDYnF0WldQSlJJ?=
 =?utf-8?B?RFpic2hPSENhcjVRUWxPam9McmtVWnQvMUJiL05tbXNaMklYbzE5cC9KNzNk?=
 =?utf-8?B?NXJiaktjVTA0enpTZmhDUmJQcE9aUUdibVNyRHI1UmJkaDhXL0VzNlJJVEhP?=
 =?utf-8?B?RVVLRnZqSHh0UjJsaWRCQ3NzN0lUT3BucVNXY0NleTNJbGZCclB0M1V0YnhH?=
 =?utf-8?B?dVBwK2JlRDFqRXkySWVWblFWeURNVWRwZ2tTd2c5VG16TDRydTNYTGlsTHB2?=
 =?utf-8?B?bGkyS250aDlnYjJUbjljc0VBNUI4c2VidnQydWNKMmF4YmJ5cWRpbmdjK0Jo?=
 =?utf-8?B?M0FERGJ2N25zMUtpYUEzNTA1WU1PckRFVXVKTDhXemU0TVN0WEs4dTh4OXF3?=
 =?utf-8?B?Q1ZGV3o5b3pPNHM0RXJ6aFVSQ2lhVUlER0N2a0JKR292MkpGZmxpNmN3TnB4?=
 =?utf-8?B?c1JCeUVMb21abXAyWklocU52b3FiS01zTVBvSnQxTjN6UTdhQ1dOU2V3V1FS?=
 =?utf-8?B?QXVtcmF4WVQyOVlKTzdMTFV3UldZMnd2bXdubFE1MVZQSEZTcWtBMnQ2ZEcw?=
 =?utf-8?B?Qk5Dbm1YR1N4Wm8zTTN2R0pRcUtPQXlWTG9Qb0hpbTFSWFRHaytXRFA1Njdt?=
 =?utf-8?Q?nCK/tW6Zyb+Ojkbs=3D?=
X-Exchange-RoutingPolicyChecked: Xj9GyR8cgZH9IPLMtznZz65NnYgMOSrZT3m8MneZlck14wcMrQvMEzESgUVq1vYB3PNUvMgfPmBCkW4jyLvfcYvkNtdA97VkG6zNobcpTfAF2YOuK2Qds9z7/Lmbb1qSSozZRj+PTwoerO8kDS+aqeGSIInzUNT8HGWS5x92t8W6M1wTQUcjIhdPBR6YbOLUhKYK8hIKDySPRYshIkI/xjjkTrL0BREEOsY+fUBrWqVStdn7rFw2t8IGhrny6DVyDf5HJ37HXvy36W41dGTkiBH2l7ezpodGd7E/5YdYmGUfJMZefF+OwbV+r9OkQiOgJ8oJXOAlTu2brys7sFbRCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b88d0cc1-04f0-4eb0-1175-08df0d690795
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 05:21:26.1081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6oYwudmo7cYMqB3begkZCD4yxV0A2OVyny+Gsp8CSKPAopXqDPogjzXOttd2S/wNnSV5oCY5RCQ1PNm8bSCqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
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


On 04-09-2026 11:54, Tauro, Riana wrote:
>
> On 02-09-2026 08:28, Soham Purkait wrote:
>> Add a new Xe RAS test exercising the gpu_health sysfs attribute
>> exposed by the Xe driver on platforms that provide the system
>> controller. The attribute reports and allows updating the GPU
>> health state.
>>
>> The gpu-health subtest validates each valid state by writing it
>> and reading the value back, and checks that invalid writes are
>> rejected with -EINVAL, guarding against regressions in the
>> implementation.
>>
>> v1:
>>   - Platform-conditional skip w/o fd leak. (Anirban)
>>   - Restore via exit handler. (Anirban)
>>
>> v2:
>>   - Remove dead-code and extra comments. (Anirban)
>>   - Initialize exit handler under igt_subtest. (Anirban)
>>
>> v3:
>>   - Move igt_info to the normal cleanup path when
>>     restoring gpu_health. (Anirban)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> Reviewed-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_ras.c | 131 +++++++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build    |   1 +
>>   2 files changed, 132 insertions(+)
>>   create mode 100644 tests/intel/xe_ras.c
>>
>> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
>> new file mode 100644
>> index 000000000..f3b507ce0
>> --- /dev/null
>> +++ b/tests/intel/xe_ras.c
>> @@ -0,0 +1,131 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <errno.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "igt_sysfs.h"
>> +
>> +/**
>> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) 
>> functionality
>> + * Category: Core
>> + * Mega feature: RAS
>> + * Sub-category: RAS tests
>> + * Functionality: ras
>> + * Test category: Functional tests
>> + *
>> + * SUBTEST: gpu-health
>> + * Description: Verify the gpu_health sysfs attribute accepts each 
>> valid
>> + *        state (ok/warning/critical) and rejects invalid writes
>> + *        with EINVAL.
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
>> +
>> +#define GPU_HEALTH_ATTR    "device/gpu_health"
>> +
>> +static const char * const gpu_health_states[] = {
>> +    "ok",
>> +    "warning",
>> +    "critical",
>> +};
>> +
>> +static struct {
>> +    int sys_fd;
>> +    char *orig_health;
>> +} gpu_health_ctx = { .sys_fd = -1 };
>> +
>> +static void restore_gpu_health(int sig)
>> +{
>> +    if (gpu_health_ctx.sys_fd < 0 || !gpu_health_ctx.orig_health)
>> +        return;
>> +
>> +    igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, 
>> gpu_health_ctx.orig_health);
>> +    close(gpu_health_ctx.sys_fd);
>> +    gpu_health_ctx.sys_fd = -1;
>> +    if (sig)
>> +        return;
>> +    igt_info("Restored initial gpu_health to '%s'\n", 
>> gpu_health_ctx.orig_health);
>> +    free(gpu_health_ctx.orig_health);
>> +    gpu_health_ctx.orig_health = NULL;
>> +}
>> +
>> +static bool valid_gpu_health(const char *s)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++)
>> +        if (!strcmp(s, gpu_health_states[i]))
>> +            return true;
>> +
>> +    return false;
>> +}
>> +
>> +static void test_gpu_health(int xe)
>> +{
>> +    char *health = NULL;
>> +    int ret;
>> +    int i;
>> +
>> +    gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
>> +    igt_assert(gpu_health_ctx.sys_fd >= 0);
>> +
>> +    if (!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR)) {
>> +        close(gpu_health_ctx.sys_fd);
>> +        gpu_health_ctx.sys_fd = -1;
>> +        igt_skip("gpu_health sysfs attribute not exposed by driver\n");
>
> Won't exit handler be called here?
No its the device sysfs for which  gpu-health exit handler does not run.
> Wouldn't it be better to skip on gpu health sysfs open.

Apart from this test technically no one is supposed to open gpu health 
sysfs. If so, should this fail ? skip may not be a right option.

>
>> +    }
>> +
>> +    gpu_health_ctx.orig_health = 
>> igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
>> +    igt_assert_f(gpu_health_ctx.orig_health, "Failed to read %s\n", 
>> GPU_HEALTH_ATTR);
>> +    igt_info("Initial gpu_health: %s\n", gpu_health_ctx.orig_health);
>> +    igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
>> +             "Unexpected initial gpu_health value: '%s'\n",
>> +             gpu_health_ctx.orig_health);
>> +
>> +    ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, 
>> "bogus", strlen("bogus"));
>> +    igt_assert_f(ret == -EINVAL,
>> +             "Write of invalid value to %s returned %d, expected 
>> -EINVAL\n",
>> +             GPU_HEALTH_ATTR, ret);
>> +
>> +    for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++) {
>> +        const char *state = gpu_health_states[i];
>> +
>> +        igt_info("Setting gpu_health to '%s'\n", state);
>> +
>> +        igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, 
>> GPU_HEALTH_ATTR, state),
>> +                 "Failed to write '%s' to %s\n",
>> +                 state, GPU_HEALTH_ATTR);
>> +
>> +        health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
>> +        igt_assert(health);
>> +        igt_assert_f(!strcmp(health, state),
>> +                 "gpu_health readback mismatch: wrote '%s', read 
>> '%s'\n",
>> +                 state, health);
>> +        igt_info("Verified gpu_health state readback for '%s' 
>> successfully\n",
>> +             state);
>> +        free(health);
>> +    }
>> +
>> +    restore_gpu_health(0);
>> +}
>> +
>> +int igt_main()
>> +{
>> +    int xe;
>> +
>> +    igt_fixture()
>> +        xe = drm_open_driver(DRIVER_XE);
>> +
>> +    igt_subtest("gpu-health") {
>> +        igt_install_exit_handler(restore_gpu_health);
>> +        test_gpu_health(xe);
>
> Wouldn't it be better to have dedicated subtests for each value 
> instead of
> adding all testcases in a single function.

What about dynamic subtest for all these 4 cases under gpu-health subtest?

Thanks,
Soham
>
> Would be easier to find during analysis as well
>
> Thanks
> Riana
>
>> +    }
>> +
>> +    igt_fixture()
>> +        drm_close_driver(xe);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 1ac89bab7..3c2d4fdda 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -333,6 +333,7 @@ intel_xe_progs = [
>>       'xe_prime_self_import',
>>       'xe_pxp',
>>       'xe_query',
>> +    'xe_ras',
>>       'xe_render_copy',
>>       'xe_vm',
>>       'xe_userptr_pressure',
