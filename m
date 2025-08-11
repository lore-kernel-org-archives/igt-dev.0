Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EE2CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 21:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0987310E315;
	Mon, 11 Aug 2025 21:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJYAhdyO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD6210E315
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 21:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754947357; x=1786483357;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5/CfD/5Imqx9E3i7qosZKMPfVohq528y0/ygJ5ca5uY=;
 b=RJYAhdyOjzd9FBiruTVx4D/tRR39y+8ajPqbpXuqAQrZZiuGPpEFd5mz
 chwpBgX+1CbfV5UII6ylUN8EOgcdTeNzSMZ6nxk3++oyl/+RfyalkhfYT
 65KG9Y3EsGpPEiNMMXG0kaM0OtUzhFJmYw98Gusy8v+paJJUv+DYPQdyl
 MwaYouV4NICDmLAH3KUQG+XgrfunuG0BaZHoJrYDk8hWPoSuZUBh7TZRE
 kPb19kW5NOG/N/JLrCjIRByxMrjJbVTk61nmR8LwOPOY+8hSp2zRSwTk0
 dNhI7jdefFZXowbK4U5xZXbG+N0YKIa7NwASSqTVqYyv0YDDRYV+Qz+93 w==;
X-CSE-ConnectionGUID: 3vdDw5b6Q2ekv/nkDzw7mg==
X-CSE-MsgGUID: fN+VutudR1KRhBXrsjqUVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="79778138"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="79778138"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 14:22:36 -0700
X-CSE-ConnectionGUID: RBiUSA+oRoOdiJ0BJQC5Yg==
X-CSE-MsgGUID: K3dlfPdFR1O1giWk5fluqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170459064"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 14:22:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 14:22:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 14:22:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.72) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 14:22:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjhCTIcTzXXDu8Ye2TFC5X31s6prxz0PM+X2EZSl/RcjxBOr1HYDYz41y+0Fo4ioOt7lVqqlr3zZS/VpddNm0nJuuqQHUVyXioTW43deTBnpjilBSq0IPWCaDcxbseMG7G0ZSS5LlieaLC+RbahOaOFTNjcwYiNmpbnRxfvdUQmGPdBbmBI/J6jLveL84UYzxGi3vqM5APiY4zBUDgXXc8wFDO8b7VnQr+ie0NnW0KhPLBd8YB64OuUrdhAOxj9l/vMTamvoR9vbMUU8AzQiXINaWboQ8FOvZ6SkZJ3/1gQrHW3aPB2st5W/TDoXXKXRMT0jh5Muwi0cu+gcd5NoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ip6grC2l2jgiaJLHs5CTwknxA0MO7nxNyrkRX84C0Tk=;
 b=JEc+gXf8DlmMlF2boRWjckg0qtTIe+Q6AE1GrMGHyNF8ta+A17JT5vIxprfREGjh0AZgmre4FPJlfhNBomVzk5DwKUlK7T1XydQbmcUk5WLKS4K3iFS/aKvJeNiXw8hkm3sp1MgNGbmclhJMoWHsO9IbFSkId+5+5FMsSQG02kvzJgf1X2FVMp2o5mWr8V42+UPkTrUePZ/iFLwUlNofXh8oXoARkyGgKzr8ZoaDlb/FPcbJebviDXfwZf2XzHt4NGjdtWvk+NvDdyIdn321Xaxcc59yff946YPDNAllO57mWjrwDzu+Z0ynwvW4nhFQwbjler+k2/q4Ca8hsEaklA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by SA1PR11MB8524.namprd11.prod.outlook.com (2603:10b6:806:3a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 21:22:28 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::ffee:f7f6:649e:9599]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::ffee:f7f6:649e:9599%4]) with mapi id 15.20.9009.017; Mon, 11 Aug 2025
 21:22:28 +0000
Message-ID: <f7786f2e-045b-4700-8ee3-77714244b2fb@intel.com>
Date: Mon, 11 Aug 2025 14:22:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe_compute_preempt: remove WMTP check in
 multiprocess tests
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250811054650.37114-2-zbigniew.kempczynski@intel.com>
 <20250811103136.cmmcleqlqdduutaj@kamilkon-DESK.igk.intel.com>
 <hq3btmoytyqwgvvux5snaozq7g3uux52uqygt7k5ew3276nxnd@lpy7kbiymexj>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <hq3btmoytyqwgvvux5snaozq7g3uux52uqygt7k5ew3276nxnd@lpy7kbiymexj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::17) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|SA1PR11MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ecfa5e-015c-43fe-8b20-08ddd91d2cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amczWVplb21xNUJPb2hoRUcxYkk0TW5GdkNNM24ySDNFcXo1Umgwb2NsODVV?=
 =?utf-8?B?VWxMTkdPQ0YyaEE1emdmZFZzRjJXWWVSTEo3cTlJd0FpcGVxSEZzRTJnbjM5?=
 =?utf-8?B?TTRudHhJUVNuSDh0a0pJUEZZdkloV0diV08xNjd6UHl4ZVo3Q0x6dXJ3Z25I?=
 =?utf-8?B?VWxVN0M5UytKeUkzSWpCOSszNkZxRjVCb3ZkVkpRRHYwUEFId2RLWHlsSW95?=
 =?utf-8?B?dENuRkx6WWVkcTlrVFkxbnh5NWxJNUxELzVLQlJXcWtVY3dlV09ucWdjYkZL?=
 =?utf-8?B?VC9PT3RDWXdsbHkrVlJ0MmFWdzBlNUZMYnFDbUYyRkZaMFhrSWt4blduUU1R?=
 =?utf-8?B?V2RWV0ZlZ1hBWit6ZDVtWG5hN0xlMXpxUk9Cc2JGL0hWVy9oVE9sVnhuMFhD?=
 =?utf-8?B?eExDamNJUUJ5N2RyUitkbVd0RlF0SmZIUmtnWVdqSEpCUzhVWDlPajVydVYw?=
 =?utf-8?B?TnJnNFJzdDRvNnVUQlV4TTg2N0EraFh6Q2F1d0IzZDNmaHZ5WmtiVTNrNWVR?=
 =?utf-8?B?OW9ramE3WGI0bmZEUDZYZW42eWhNZXNGT0MxSzRNUG1jVWZhL2s2cHNhem9E?=
 =?utf-8?B?NlU3QUZIY2sreGdMdGU2dUNTa1dkUFFXNEhSRlltZFNDckVZSHpaOUUyVUZX?=
 =?utf-8?B?WVptKytta0JraUUwN1lCY0JvN3BhcXdxMlNuL1dRQzIxb1BNZmhVL3ozMjh3?=
 =?utf-8?B?YzJSNEU1aTVVaGJhenlwQmp3US9kcEp1cGVGZ0taRno1RnZoemErd29nZVJG?=
 =?utf-8?B?WDBRMUFUNk05eTl1TVlhNmwyei9MZ0wvenBNeVdJblB1UHBGUnBGbHpneXZw?=
 =?utf-8?B?TUJPMFhkd2YwSitab1B2L3R1YnJySU03TDBIUHdYNEx4Q0MzNG54bnlxVWRW?=
 =?utf-8?B?ZjlOQVc3VzBLMUNvRFB6emM5S1RmOFg0NE10ZkFhVC82T3pzRUFsYTM4MkM2?=
 =?utf-8?B?TmhqOGFYWlJiN3pQbVFPSmZ5WHQ5Z1VFdVNVLzVpS1hjRTk4V1crbUkxSEYz?=
 =?utf-8?B?WVQwbkpGbExlWTFvR1lMYVJaejFhMXQ0YTdrUXpVMHBRRG9teHQvYlBiU2NY?=
 =?utf-8?B?YW11L3lEbGZ5OFpwdkdGcWJVNDZmVkpNMkF4QlZpU2syMDE0TVJCNXBGK1lz?=
 =?utf-8?B?MjJrZzIrc0lBVW9Rd3RVWkxIWU9rMzFydzVEcGV5ZEpjNTF2emZSMUJoWUNO?=
 =?utf-8?B?VXY3SDNhTExiajdHRFNzbmY3eW1OWDdLcEpxVmhIOVV6dmkzclpJYnM1RnFH?=
 =?utf-8?B?RFlmYU1JcHFrSE9KVndKNGdQWlFGUGxvNEdMUXJsSjhKb2FCWE5GWlJWUzhZ?=
 =?utf-8?B?a1cwOTJrcjNWdlhWYnkzMGJ6WjlyaXkvdjZJemFLaVMyWERBU3oybGxOZ2pQ?=
 =?utf-8?B?eVRXUG80Ni9ycTByWTNCcHZRclh2elhQRDZaMmN1TSt6MlJ6Q0I0RUg1UXF4?=
 =?utf-8?B?MEc3NlNLRFdxMUYrb3JRVVRhR3M1NXFTeGQrUExKQlVldkpRbG5UV2Z0YW8z?=
 =?utf-8?B?QkMzV0NadFNYUWorUW1XN2t1MXZwV011ZUQyc0hiK0VGWEZZTzFHNVRNSXlG?=
 =?utf-8?B?a3JSUmhXOHowUzhnMmVCQWdUY090M1RtMGRzK0hsWDFTd0o4dUU5VEs5V1pW?=
 =?utf-8?B?Sm5CZ3E5blZvaDZ0RjVOSFY4Y3Q3MlVYMWdmdFZuckdSalVrSXdmaGZwbGkz?=
 =?utf-8?B?ZjVRRTdtNnR5SDlYU0lXUXZwcGo2SCtkZ1BHU3NTUGVxU2VEaXU2SityTkZt?=
 =?utf-8?B?UDM1S3F3clNCOUNnaHBoVGNKZ2F3Z1FkZTNrOGZGei83TE9TUFZVRTJOdmZX?=
 =?utf-8?B?VmtvWFFWUW82bHZFU0JhNHduZVdJNjhVbHZpcjJtdEp3OUlKayt6OVpzRk1u?=
 =?utf-8?B?RXB5ckRmUUpHdThVcitaeDBISm9GM1VnQUdFc1czK3c4ZCtENEVOdFNBQ2Rp?=
 =?utf-8?Q?p17mIuZrggA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGR1ZWhDWCtWd1BobTd5NjQ2Y0RDd1ByRnJmd3RMKzAyem8xMHozdmx3Y1VP?=
 =?utf-8?B?blp0bkhsVWhFMU1zcjJYazVjZGZ4RE55ZHBBK1N4dTlkQjY4TG40S3cydHht?=
 =?utf-8?B?S09wazVTeVk4YkxDbHB0Rk9sVUs4dk5GZ1hVSno5TXIvRXBZMWE0eUZiOGhU?=
 =?utf-8?B?aFdGa2wzVWc2UloxYXNINGY3UE1sbGQ5TUk4dldjZkZRTEh1SFZxS0x2UU0w?=
 =?utf-8?B?REltbEFwNWtaUEQvSEZUNkVFVm51N3h5UFMvSU1sY2JWbjRqVEYwNXhPank2?=
 =?utf-8?B?SWVBSDBndUJvZXFlQS9mdE9MNXpWa0tuZGkwWDFiUkoydEFRK2ZNOFdkdXZq?=
 =?utf-8?B?YUFhdUlZL0NRT1I1YWlMSVdxNHhxTVUrU0E4aFNkdm9GUXYzNkJDU25qdG92?=
 =?utf-8?B?d3Z6a2JxS1VqN2d0NWU2N0xHSmJWTm8vdHJkUGtrN2ZraG9sY0hsVytYSkNP?=
 =?utf-8?B?a1lBSHQzWG1jUEF0V2pIL21IakVjK1BJblZUVDlVMnM1NDkwdFJ4RTE3VjlT?=
 =?utf-8?B?Ui9MbVB4TW1QblI2STRvY0RzYUJGakRudHpLa0xicFcrYUpBZGNBN3dITEFB?=
 =?utf-8?B?OHRsbzQzdDE4K3pYbjdLVXpBNW9kLzJEMS9SRVFjNUp1TFJQOHNvL3pzYnNs?=
 =?utf-8?B?Q3NaNnlCekpITUNCM0cvZS82b3JUNmJxVDM4czA5VGtMUTBxKzZtR3VveEtZ?=
 =?utf-8?B?cDcyeXVJdWVjeVVKOVdDa3ZlZS9rUGJ1RVFXamVudDJUcG1KR1J0dCtFbnh1?=
 =?utf-8?B?dGlKMlZQS1RPa05jQitIV1JYL082b2tZQ3FmWVM0ekFiaHJTQTA2ajlKUXM0?=
 =?utf-8?B?NS9sYzFHN3FaRURJcjl3Wk5CaGMrQnR3dkRFcVFuaWlESmVOU2F6N01rdDdn?=
 =?utf-8?B?RUpKS1RsWS9pNUJmYU5YRE14ZVNjNStWdmhHbGtlekRYVmZNdys0dkVZL0di?=
 =?utf-8?B?NUx5bE5WZTE5WjVaY0d2L210VWE0Q0FWeG1CTmVKVTVaeTl3R1QyVjY5Ullj?=
 =?utf-8?B?K2YrYXBHSjB4TERkL0dTei9VOWtWY1NsMzd1TmVxQnBUUW9lR2F3NlNDL09z?=
 =?utf-8?B?OEhicXcvWVgxVWovV21jWi96Q0FNVy9qL0o5NUVuMHRzbnVnOWkxS0hhYWRz?=
 =?utf-8?B?U2hHV3JzeGxmVjhFUnpDd0xLZDZPVkRRbmFGTWZnTU12WFIybTZDNWdIZEE0?=
 =?utf-8?B?dU1QMVg1ejM1OVJWS05nYXVMZXBaZXZpeEptTUZYMTlzYjVYSGg3WTVXNVlm?=
 =?utf-8?B?KzN1YzhMZjJqSWI1VW00d0kwQUMyZE1UWlpPSkNDb1JxMHJ0Z0tOV1B6TllN?=
 =?utf-8?B?bEV4UGdMQUVxZlVNSjhvZEYxd2I2QUhpSWFsTmpYWFI4Y0R5U0R6dGd0dzhj?=
 =?utf-8?B?ZkJjOTVZV05IWUNVaEF4VFRrV3R0bmNNY3NOUWVzWDdvTmJHK0VsdkNpSDZa?=
 =?utf-8?B?MUhHazFiWmx0aHFSV3NXL0c5S2xEUWJwTURvdzlUMXd1T3NHWHFRNG1IaHdl?=
 =?utf-8?B?VWtQaFRJb09Fc1VRUEVUOUNJdExkQ1BiTTk3WXlpMzkzbFhrT21wcW9XSDBH?=
 =?utf-8?B?OXVPU1hsRXdPSzVBaXE2a3loOHNuejNab0ZOc3pjMTBIQ09jQ1JlWnZwWlhH?=
 =?utf-8?B?cmN4YStwM1lDY2xGanNuOHRvTXVXRlIyc0tWQllydGoyUjRFUVJkbmo1TmJn?=
 =?utf-8?B?TlowdW9hK2pSYmQrcmVob0hFYS9iNFNkeEFCMUJyL1lYM3JydU1qRmRQWEVw?=
 =?utf-8?B?WENNbWY3V0pOSDIxUERVQU41SE5DTHNZS2NGYWRFSFFGTEI0anV5d2NURGZ6?=
 =?utf-8?B?bFFlYU9pZlFpWVJFQkpNN0E5ZDRBb3F3MDlLWVdUNUZrTzdieXFEcFNackhX?=
 =?utf-8?B?L2pPVHY1S3BiL2pVZ0Ivd1VHaExBYTdsakFSSTlSWmFOK3J0U1NBbzZ0M0o0?=
 =?utf-8?B?SERIRWlFVmZUVG9xZnlCNEJIdzlPMytFVVM4R1dXenhEMmhzZDA5OFJmZ2pi?=
 =?utf-8?B?SDBKVU91T1ExOGY3d0dRMkVQUHA3Vm9zeHp5REF0YWNpbnQ2dVpGdDNVMms4?=
 =?utf-8?B?L1hSMDNoUHRReEJBdU1QK2tZL3g4QlV0czQ3aWFlS2cyclgzTEt2Q3pVTStS?=
 =?utf-8?B?cVE4RlEzaFBwc2llN1pFNW1uVnBSYWVRMkt5ME1zRFFTNllUZE9iUE1OMUF5?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ecfa5e-015c-43fe-8b20-08ddd91d2cb1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 21:22:28.5732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XiCpsKzfOzYwgC7QYbZw3Co6/46zN1h4i71OStoYtpgH6axpKtzR+alkelbiytsxzXvxctQ3Rz4ULNgIgALL1TDJuhmM2N5eRZr03Ajfww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8524
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


On 8/11/2025 3:45 AM, Zbigniew Kempczyński wrote:
> On Mon, Aug 11, 2025 at 12:31:36PM +0200, Kamil Konieczny wrote:
>> Hi Zbigniew,
>> On 2025-08-11 at 07:46:51 +0200, Zbigniew Kempczyński wrote:
>>> Before forking we test WMTP preemption in test_compute_preempt()
>>> which is synchronous. Remove this check as it is redundant, there's
>>> dedicated 'compute-preempt' subtest which does it.
>> I do not see a dedicated VRAM test, only SYSTEM_RAM?
>> Something like: compute-preempt-vram?
> Generally on the beginning we just need to check if WMTP preemption
> is supported, memory doesn't matter. Tests which -vram are testing
> this functionality more thoroughly so adding compute-preempt-vram
> is not increasing our coverage.

Technically the tests changed from *-many to *-twice, nit-pick but it 
can avoid confusions later

in any case, it looks good to me

-- 

Daniel.

>> I do not think it is a blocker so
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Thanks for the review.
>
> --
> Zbigniew
>
>>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> Cc: Daniel Charles <daniel.charles@intel.com>
>>> ---
>>>   tests/intel/xe_compute_preempt.c | 4 ----
>>>   1 file changed, 4 deletions(-)
>>>
>>> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
>>> index 7a468e7426..c9b194869c 100644
>>> --- a/tests/intel/xe_compute_preempt.c
>>> +++ b/tests/intel/xe_compute_preempt.c
>>> @@ -102,7 +102,6 @@ igt_main
>>>   				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
>>>   					  ram_mb, child_count);
>>>   
>>> -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>>>   				igt_fork(child, child_count)
>>>   					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>>>   				igt_waitchildren();
>>> @@ -129,7 +128,6 @@ igt_main
>>>   				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
>>>   					  ram_mb, child_count);
>>>   
>>> -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>>>   				igt_fork(child, child_count)
>>>   					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>>>   				igt_waitchildren();
>>> @@ -156,7 +154,6 @@ igt_main
>>>   				igt_debug("VRAM: %" PRIu64 ", child count: %d\n",
>>>   					  vram_mb, child_count);
>>>   
>>> -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
>>>   				igt_fork(child, child_count)
>>>   					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
>>>   				igt_waitchildren();
>>> @@ -183,7 +180,6 @@ igt_main
>>>   				igt_debug("VRAM: %" PRIu64 ", child count: %d\n",
>>>   					  vram_mb, child_count);
>>>   
>>> -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
>>>   				igt_fork(child, child_count)
>>>   					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
>>>   				igt_waitchildren();
>>> -- 
>>> 2.43.0
>>>
