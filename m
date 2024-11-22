Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78406D75E58
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 14:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C5710EB96;
	Fri, 22 Nov 2024 14:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aj9NJdbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F81410EB96
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 14:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732286044; x=1763822044;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dUEJCSQzb6/XbyP/LF711lRESchQFShgezb+4vdTWxM=;
 b=aj9NJdboMA0I+9BTBpc3Bb09l0lJPmsdrCHSxGllmLfrWmnDhPoS1xj1
 g7BPiO5Di12RRbpqbVVAQn8W+AMxKAdTU+9xJAJPQ+vDzux0ySVWMPwuk
 Fzmv+B13uHGs7lyXB0CwpS6ybvv7Dvk/FUmfIY8dKxpUSMLD6Eia64gCw
 Nrd+qXCb5/JLoG8bY6lVUiAoTMq/vqWFjz6LpDyfFwA2DE7CDaUEEpCke
 LR5Eu68NAg+SzxMA7NFp9jJ+uFbmBxx2ycgio/dyrPnoggJLL3sSKpCvj
 RwimXPYxaTt2Tk0zDmPULYuAm25aDBWkxskurNxZrD2/CL3WERDIJfSiu g==;
X-CSE-ConnectionGUID: uJRro/F0Shqb533K8WZl7A==
X-CSE-MsgGUID: XP4vtelASJSmIWLO06/IuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43092574"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="43092574"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:34:04 -0800
X-CSE-ConnectionGUID: 4H2MoE0rTT+v+6UpNHb+Zg==
X-CSE-MsgGUID: +78mUkitQwO/WAFfWxYXyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="128107386"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 06:34:04 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 06:34:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 06:34:03 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 06:34:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLDwQKVbpR2OV4rCqY5mxJgifzFH6dZAX16Bo5xLXzk9x2CkCBSWGz+Ny8sK61Ah5yh2XFyx1msuZvil+VxXFEyrGDB056iREkR3aSDfnNl7d4xpcYECmFl4dmfZnY3IISZL/ztfzlKwrHHZ/r7HNgqnoS3AXiCRmSmS/mHaukiN++LAXK4kmdxzdjnImPln5owIg0ujyqGvrvbNsHSvv9HYATZvxVEnggLiSBplXyR7KvhjXGhxEQdnHr4vofrQltUml7P7JA0+rTAqjDQj3hijzqJblOObdokR9rvrLgbi6bacO2urAz7l9abgOgZRWngkd5lJQWTL0OATQ4cdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r4OI9WjVpLrFG9bf9PX3zQJiwAEdVR7smieMc3jL08=;
 b=YDJ0nQo/KgeSQhb94Fym3TdytLQGPWdQF1Zh2tUol0FBeH/zTk+6H7z+NdZn17/Lqq0qvgMbNLKuQHvutdn7lQ65hmKw38TFG7p4mkdqSYTOfVVjzBqlxpni80KA/Iiq5N3OaYA9Cn/H06BCXxRKl3o1vHUrr43v3u7T9whgemxp304sHUDESIXe7jtE+4/AP68PSnBbo4xAf5B5Sc6eipu+do9dl+MUpbJKMIg9x8tYVR7EH1/WilkawkzjFpA9dW7/XxmeMF957nQNwMkxCiMUsx1A3cQ3dUvfRsDT6xbCxFqs/Q7JskRjY7FBZrUlOU2ydpUFsQgZEw/4WlDVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 14:33:59 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 14:33:59 +0000
Message-ID: <296536c1-a5db-4baf-8813-56e67e87dd0b@intel.com>
Date: Fri, 22 Nov 2024 16:33:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/4] tests/intel/xe_eudebug_online: Add
 read/write pagefault online tests
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <andrzej.hajda@intel.com>, <jonathan.cavitt@intel.com>,
 <mika.kuoppala@intel.com>, <dominik.grzegorzek@intel.com>
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
 <20241121122230.451423-5-gwan-gyeong.mun@intel.com>
 <5d6d89aa-8bd7-407a-ab68-351c7ce87bcf@intel.com>
 <dcd791b0-72d9-4209-a992-ce159290263c@intel.com>
 <f354ed67-11ae-489e-a76f-758a68f52a2a@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <f354ed67-11ae-489e-a76f-758a68f52a2a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0217.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::15) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 7346e337-7dd9-479d-351d-08dd0b02b393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3dVa1JHL3dzbGc4S1ZvYkNyU003WlpHU0Y4SjVhUHowZkRmV2dOQWhkcEJv?=
 =?utf-8?B?MEZNZ2p3NnZyQ0NWanptMWY2V2wwTXNUT20vaGRtemVRWmVzbmxPbHdQVFdL?=
 =?utf-8?B?SUtkZlhrOUpZNjBpN09JT1BTeFVuSktueHNEVWZWdEJrcmRHYmVPUk5LYXRS?=
 =?utf-8?B?WnRWSlBvVHBwMUNKckJTNXh0Smlva2dIbU1NcStqd0xVYm1iSG54c2RGdjBG?=
 =?utf-8?B?UlNIQlZ3M2V6eWRlSk1wMUVBcUpLZWlveHl4Q2Y3NEMxb3haQTdtQU84bmRV?=
 =?utf-8?B?Mk5HUmpEUlcvc2dxbE1QS21Qa2pqdUZJbnpWaGc0T0NkaEhJdWNEVm02Nmoz?=
 =?utf-8?B?RU1qTFBVS0hWS3NxOGlWMy90RllnTWo1MGRFUFlTVVZCWTc0TnlIaTJiSzBR?=
 =?utf-8?B?REJTZ2h4TXZyVXlxelorUFR0TDlCdzNNS3V0NS8wd1hEeWtLVTZZYTBQOVZE?=
 =?utf-8?B?THBjb29BZDBxQTAwUmJCNWtpRE9FcXVmRlMxK01SSSs1SmRtUC9jZndCNk9K?=
 =?utf-8?B?cktKd1ZBdm5YWXFsbjhPM0JWOUNQZ2FCNGVKWWo1ZzBFNTFWdnhSeFg5R0pH?=
 =?utf-8?B?aG9lVkZRaGNwRkJZM3NCcThFSk1yUm9EQzBZZmJGRVlhWG14Q3dQS2VlVkd6?=
 =?utf-8?B?ZmRETlcwcnE4MWVhU1pCMExLZGtTaVR0aXhLYjBxMXRucXNnZnVJa2txU1VT?=
 =?utf-8?B?V1MrV3hGYmNZQTFrdlRSZGtKOXFGWlJlTUZrdWpCbitVUWt2VTBkTlRYbndr?=
 =?utf-8?B?eWVxZW9BVXZ1N1kzKzEya05laXBzQlVLTE8wTWN4SUpTQ3BLVVVzNFZPU09G?=
 =?utf-8?B?d21jb0s4RjllYWk2QkFnNWpOSUNzMHp1b01uZ1Z5TWtjSTdpWmE5OTZmR2g1?=
 =?utf-8?B?NXFTQ0duNUpkV005anFxLzhvUDJXSDFDaEovL1VkZ09zL0pjdkpob1VYL3Nm?=
 =?utf-8?B?QTU2Qkp4aXhRcWp3cnNyRWoyM1ZQSnJzTWxZT2Nrd0t5Y3ZTdm5aMVVXN29z?=
 =?utf-8?B?NE5GS3g4VzBpR1hWY1UyUEQ3bEp4R1k2a3ZHaFlmRjBUMWx3VVc0TTRiTjlq?=
 =?utf-8?B?dXQ2WkU1ejFHTUg3TmJ0SFh3RUpmVkZMdjExSTBVdGZIbmNQeVlFSFIyTld6?=
 =?utf-8?B?UUtsWlVnMm5ETWpJRlJNSTducWlLbGxUanRZVEtRbzgxbWJmcnlvS2dZUW15?=
 =?utf-8?B?VWQ2WU1UYzJ4WVRRNmoxZUJ0c0MzZGx0dXpWMk1ycnNzR0RYMnRPbjdOVGZ4?=
 =?utf-8?B?T3NhNW0wMERVZEE2VHdVTS9UVHpXcDVkc054cjcydHYwU2dyR1N3N1kxVWNG?=
 =?utf-8?B?czNQUFVjV1UrYWlabVBLUjJiUFBVL3o2OVdPQ2UrMmdEUURJamJhV2dBZjBP?=
 =?utf-8?B?eHR3K2pYY0NLNjhLVkFOR1F5cGlKai9QbWlxZFUveklQWDJmc0pta29tVS9m?=
 =?utf-8?B?bTRKZ1MvNk9kOGpqNHBZU2c4YWtPaXlHaVV5MVBiNnlRcVVZSGdaKytzOEhw?=
 =?utf-8?B?eXhqL0FVTWZUYkNkcWhoQVNQRElxWFFpRldNNzVGeXBOU2hGaG01VTdTUkkz?=
 =?utf-8?B?R3JFdUh3Rmp0dm5JTnNaU0RlYjhtcXVPUTlZSWxFZzZ4UFllR3BiSndRMVFK?=
 =?utf-8?B?dzlXWkhyQllvWWNTL3A5YTRNRjlWK2paaEV6WlRyNkg5MHUxMUZUNFFLQjdK?=
 =?utf-8?B?QWNPdHhldVNoUzZRSmU4Wit3STlYUzFNR3JCMzdwSytvOHF5N1NCOUZLWURx?=
 =?utf-8?B?VjVjWm1NYnpjUi9kSWdUeVhEcU1haXY2RnpHVi9DbVRDdEN3ZVhlNEphYkJN?=
 =?utf-8?B?T2VDZjFDcTliamtmeDVXZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS8vRXQrZnVPZUtTOEduSVhFZ3lWTy9aYnJpZmtLYnZDM1pxVU56bVhLQWV1?=
 =?utf-8?B?bUJzZjJ0STVTaVF6MHZpZjFtQmdXMkxaSVJqSC9IQ3dzVzR1ek1TTFpXWHhN?=
 =?utf-8?B?ZGdrT0V1VWhKczNyMVNnckdqUHhmblgxMHcwSml5Q3IrUnBBaU1KOHRJR3J0?=
 =?utf-8?B?NEU3d0RGczYxV1ovdVR4WXhuWVNybEN2dWpYQ1ozN1BPMHFWWmExOUFPK0kw?=
 =?utf-8?B?T20ydmQwLzY5YS9BOFdLZVRwNnM1Z1RHbnRyMnhGNWpmREdORHBydmVJc25Z?=
 =?utf-8?B?V3oxcnJmZ1BQY3R5NjQwK25VbGZORnBEeUl4a2IzUGNBbUJlMGNJeEVnUDUy?=
 =?utf-8?B?UkdyYllZRElkeGVvaEFKWkRQN2ExK0FkT1grZWlhYWlvSUlBNHp0ckQ1Uk02?=
 =?utf-8?B?eWo3NmJESlB3L1RHbFBmREo2SzFLcmNieVVSWUJ4ekkxTWkxcXRuY3Y5NGsz?=
 =?utf-8?B?U1U4NUN3UlJzQ1ZtUS94dllKOThOMGc2eWVOUnptbU5jcGk4VldTK3ltOUtI?=
 =?utf-8?B?NjJZZXFHeERLNVluaE43SEtEekhEeHE4bytrWmxoM2ZWTnltbFJpcDRZWDZW?=
 =?utf-8?B?UGYzbjQ4eWRmVkV6dDM4ZTlicGRKQjBmazVTako3Qzg4Uy9wNFhqWU9vTGdv?=
 =?utf-8?B?cWR2V2Zrd09la1RrdVdkd1NqYjRZemtML2RaM1dHMSsvZHN2cm9mSW5iTkRh?=
 =?utf-8?B?d21kTHh2TTJTTG9wYkFMQTI5ZVFFRm9IVWlISlp1U0V1WWN2M0F4M0UzdXkx?=
 =?utf-8?B?VlZoOExxUkdFVFhBWEFpcC95c1BGbUxWeDNRSEdodlRxZ2gxbm1zUVlieWhn?=
 =?utf-8?B?QUxYeU8xdkZmVk44aWsrbUFWOGJwaWxzczlWYXRJcHlkTEhMUnVUU25YVFV2?=
 =?utf-8?B?dU1NaGVJNlpMTUtTWlh6VUNYeXRENWdJSm15ZWp6L2RUNVhJbk9ld2k0VTky?=
 =?utf-8?B?dVNYMy9JNlUvRVpYOENxQnRsbUpCVHpzUVBFai9ZcCsvdjh5d2NsU1puWm9Q?=
 =?utf-8?B?YUpYb2hyQW5QcS9HNG94N01hb0d6UVRQZlF6MG9KdHhtK2FKQ21ueXRCQUdX?=
 =?utf-8?B?UDE2MWtRdlEyNk9VRGRKMlJvekhqUUE0RGJvWXB6bkZnZFF2NFp1ZkEwMWhG?=
 =?utf-8?B?d1RtMU53NjkwamFzeEcyeW1uWnNkVFBBS1VGT0VXSExVSVJYWEZpZEUzdXBP?=
 =?utf-8?B?cUExK1c1bjJIN21uSVlwL3FFR3RWN2dubmVSUTN3NlM5bDdkN1VUbVIrejRI?=
 =?utf-8?B?VjIydE5ieVJpUk5ldldwbytucXBNT2tNdHdqL1lKcXNIMHQwVVpDVkdnQ0hO?=
 =?utf-8?B?ZGd0NDh6Z2JWRGE4VkRIMWRVS1I5SVkwVkwyZkttVTd0Y3VpZ3pFcTVyblVj?=
 =?utf-8?B?TGkzTE8wZm9OVFlQMkFjN2Z4c2I0b1NyUDVWVWwrMXd1cHNOcU9rMTNkY21X?=
 =?utf-8?B?a3hvREt5NzZyYjYvQitlMGQxbzhtRjNWbUM5ZElJQmp5b3pORDE0QzZuaEVn?=
 =?utf-8?B?RFFXejFBNi9jOGNBSHV4SUtnRW4xTUQvQlZyZ1NLeEhKNUlscjVnekFKU2VQ?=
 =?utf-8?B?NDNNZEM5bSt2UDF5MGZhelRRQXY4S2o3MFdqYmVoNmFSaWVzelBHUnM1alZy?=
 =?utf-8?B?ck12YzExWWtuTVl1bGM4RUdMc0tmQ2pMWGk3TVoyb3NTUnpUc0VFaXFpQkJm?=
 =?utf-8?B?N0RrRU1Wa0ZoUDA2NzJpRXJLUGVXd0Vkc0ZGUnpHUWh5dXlLYU9Za3dKZVlW?=
 =?utf-8?B?T3RubkNZaDVya041VGY3bWMwbTBBc1BzdFJBd2pXVXBpVVlZYjY2cC9aekdk?=
 =?utf-8?B?dGEzUWM1ZWYxTU5YTVlxbDVwRnByekR4dFpVdFFKekJYS3k0YW5ZVDVuelpq?=
 =?utf-8?B?NnIrY0tRUFNKYVdrQjA1QlExMG04ek1jMUtqUlpVMEEwYk5NbVNBSlB3UWp3?=
 =?utf-8?B?a1JtTGh4ZTdFdy9LZm9Na2IvdENyZmQvWmcxRTZVYm9WUFBmUm5mYnMyNFA1?=
 =?utf-8?B?NXhLRTdCSFpBc2l3UzF3bGpqZ0JITU95M2ZBR0piNHc2b2x4UXdBSzd4QXpm?=
 =?utf-8?B?dktEVSswN05LbGdocDlXMG13TElZL3EyTXhMb3ozVGh4MnV5NHErYWJ1UjJh?=
 =?utf-8?B?Q0pQc1VaZFcyZEgwVDNYekRJUWQ2ajdsS0U4aisyWG00K2FXNFdRV2U5TFVY?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7346e337-7dd9-479d-351d-08dd0b02b393
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 14:33:58.8729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeEtUP2wHaB/X9bdobWqC9T9SKHmvxsnKfaot2aa94RmX6KDZwBFz5adUlC534R8bAeFLcpAmc3C8RfV1f181RbzQdYokUEKhuCqATCKzVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
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



On 11/22/24 11:55 AM, Manszewski, Christoph wrote:
> Hi Gwan-gyeong,
> 
> On 22.11.2024 09:21, Gwan-gyeong Mun wrote:
>>
>>
>> On 11/21/24 7:12 PM, Manszewski, Christoph wrote:
>>> Hi Gwan-gyeong,
>>>
>>> On 21.11.2024 13:22, Gwan-gyeong Mun wrote:
>>>> Add read and write pagefault tests to xe_eudebug_online that checks 
>>>> if a
>>>> pagefault event is submitted by the KMD debugger when a pagefault 
>>>> occurs.
>>>>
>>>> Test that read (load instruction) and write(store instruction) 
>>>> attempt to
>>>> load or store access to unallocated memory, causing a pagefault.
>>>> Examine the address causing the page fault and the number of eu threads
>>>> causing the pagefault.
>>>>
>>>> v2: Refactor of output attention bits on pagefault event handling 
>>>> (Andrzej)
>>>>      remove / update redudant code (Andrzej, Christoph)
>>>>      use igt_container_of() macro (Christoph)
>>>>
>>>> Co-developed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>>> ---
>>>>   tests/intel/xe_eudebug_online.c | 178 ++++++++++++++++++++++++++++ 
>>>> +++-
>>>>   1 file changed, 173 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/ 
>>>> xe_eudebug_online.c
>>>> index 0ef0d8093..a70d18ee4 100644
>>>> --- a/tests/intel/xe_eudebug_online.c
>>>> +++ b/tests/intel/xe_eudebug_online.c
>>>> @@ -36,6 +36,8 @@
>>>>   #define BB_IN_VRAM            (1 << 11)
>>>>   #define TARGET_IN_SRAM            (1 << 12)
>>>>   #define TARGET_IN_VRAM            (1 << 13)
>>>> +#define SHADER_PAGEFAULT_READ        (1 << 14)
>>>> +#define SHADER_PAGEFAULT_WRITE        (1 << 15)
>>>>   #define TRIGGER_UFENCE_SET_BREAKPOINT    (1 << 24)
>>>>   #define TRIGGER_RESUME_SINGLE_WALK    (1 << 25)
>>>>   #define TRIGGER_RESUME_PARALLEL_WALK    (1 << 26)
>>>> @@ -45,6 +47,7 @@
>>>>   #define TRIGGER_RESUME_DSS        (1 << 30)
>>>>   #define TRIGGER_RESUME_ONE        (1 << 31)
>>>> +#define SHADER_PAGEFAULT    (SHADER_PAGEFAULT_READ | 
>>>> SHADER_PAGEFAULT_WRITE)
>>>>   #define BB_REGION_BITMASK    (BB_IN_SRAM | BB_IN_VRAM)
>>>>   #define TARGET_REGION_BITMASK    (TARGET_IN_SRAM | TARGET_IN_VRAM)
>>>> @@ -61,6 +64,8 @@
>>>>   #define CACHING_VALUE(n)    (CACHING_INIT_VALUE + (n))
>>>>   #define SHADER_CANARY 0x01010101
>>>> +#define BAD_CANARY 0xf1f1f1f
>>>> +#define BAD_OFFSET (0x12345678ull << 12)
>>>>   #define WALKER_X_DIM        4
>>>>   #define WALKER_ALIGNMENT    16
>>>> @@ -120,7 +125,7 @@ static struct intel_buf *create_uc_buf(int fd, 
>>>> int width, int height, uint64_t r
>>>>   static int get_number_of_threads(uint64_t flags)
>>>>   {
>>>> -    if (flags & SHADER_MIN_THREADS)
>>>> +    if (flags & (SHADER_MIN_THREADS | SHADER_PAGEFAULT))
>>>>           return 16;
>>>>       if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
>>>> @@ -179,6 +184,16 @@ static struct gpgpu_shader *get_shader(int fd, 
>>>> const unsigned int flags)
>>>>               gpgpu_shader__common_target_write_u32(shader, s_dim.y 
>>>> + i, CACHING_VALUE(i));
>>>>           gpgpu_shader__nop(shader);
>>>>           gpgpu_shader__breakpoint(shader);
>>>> +    } else if (flags & SHADER_PAGEFAULT) {
>>>> +        if (flags & SHADER_PAGEFAULT_READ)
>>>> +            gpgpu_shader__read_a64_dword(shader, BAD_OFFSET);
>>>> +        else
>>>> +            gpgpu_shader__write_a64_dword(shader, BAD_OFFSET, 
>>>> BAD_CANARY);
>>>> +
>>>> +        gpgpu_shader__label(shader, 0);
>>>> +        gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>>>> +        gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
>>>> +        gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>>>
>>> Now that I think about - do we need this to be a loop? Can't we just 
>>> do the read/write instructions? This would simplify the code and I 
>>> don't yet see why we need to loop within the shader. The SHADER_LOOP 
>>> is used for interrupt-all because we want to interrupt the workload 
>>> from the user/main igt thread. But here, similar to the basic- 
>>> breakpoint test, we just submit a workload that will halt because of 
>>> the hardware/kmd intervention.
>>>
>> the pagefault tests also need this concept.
>>
>> When a pagefault happened, KMD sets “Force Exception / Force External 
>> Halt” in TD_CTL to cause the eu threads to enter SIP mode.
>> In the pagefault handling process of eudebug, kmd installs a null page 
>> at the address where the pagefault happened and makes the halted eu 
>> threads resume (make unhalt).
>>
>> It would be ideal if all unhalted eu threads immediately entered SIP 
>> mode due to the FE/FEH settings, but it may not happen immediately.
>> Therefore, the purpose of using a loop is to ensure that the kernel 
>> shader does not terminate until a pagefault event and attention event 
>> occur by adding an additional instruction after the instruction that 
>> causes the page fault.
>> Therefore, a loop is used to ensure that at least one eu thread must 
>> enter SIP mode.
> 
> Yeah if the count of processed instructions before the exception is not 
> defined then indeed the loop has it's place here. But we still may 
> reduce a little bit of code, see below.
> 
>> The attention callback sets to exit this loop, so this code allows the 
>> eu thread to terminate after the sip shader is processed.
>>
>> Br,
>> G.G.
>>>>       }
>>>>       gpgpu_shader__eot(shader);
>>>> @@ -217,6 +232,16 @@ static int count_set_bits(void *ptr, size_t size)
>>>>       return count;
>>>>   }
>>>> +static int eu_attentions_xor_count(const uint32_t *a, const 
>>>> uint32_t *b, uint32_t size)
>>>> +{
>>>> +    int count = 0;
>>>> +
>>>> +    for (int i = 0; i < size / 4 ; i++)
>>>> +        count += igt_hweight(a[i] ^ b[i]);
>>>> +
>>>> +    return count;
>>>> +}
>>>> +
>>>>   static int count_canaries_eq(uint32_t *ptr, struct dim_t w_dim, 
>>>> uint32_t value)
>>>>   {
>>>>       int count = 0;
>>>> @@ -636,7 +661,7 @@ static void eu_attention_resume_trigger(struct 
>>>> xe_eudebug_debugger *d,
>>>>           }
>>>>       }
>>>> -    if (d->flags & SHADER_LOOP) {
>>>> +    if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
>>>
>>> If we drop the loop we can drop also this.
>>>
>>>>           uint32_t threads = get_number_of_threads(d->flags);
>>>>           uint32_t val = STEERING_END_LOOP;
>>>> @@ -746,6 +771,44 @@ static void 
>>>> eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>>>>               data->single_step_bitmask[i] &= ~att->bitmask[i];
>>>>   }
>>>> +static void eu_attention_resume_pagefault_trigger(struct 
>>>> xe_eudebug_debugger *d,
>>>> +                          struct drm_xe_eudebug_event *e)
>>>> +{
>>>> +    struct drm_xe_eudebug_event_eu_attention *att = 
>>>> igt_container_of(e, att, base);
>>>> +    struct online_debug_data *data = d->ptr;
>>>> +    uint32_t bitmask_size = att->bitmask_size;
>>>> +    uint8_t *bitmask;
>>>> +
>>>> +    if (data->last_eu_control_seqno > att->base.seqno)
>>>> +        return;
>>>> +
>>>> +    bitmask = calloc(1, att->bitmask_size);
>>>> +    igt_assert(bitmask);
>>>> +
>>>> +    eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
>>>> +               att->lrc_handle, bitmask, &bitmask_size);
>>>> +    igt_assert(bitmask_size == att->bitmask_size);
>>>> +
>>>> +    pthread_mutex_lock(&data->mutex);
>>>> +
>>>> +    if (d->flags & SHADER_PAGEFAULT) {
>>>> +        uint32_t threads = get_number_of_threads(d->flags);
>>>> +        uint32_t val = STEERING_END_LOOP;
>>>> +
>>>> +        igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
>>>> +                     data->target_offset + steering_offset(threads)),
>>>> +                  sizeof(uint32_t));
>>>> +        fsync(data->vm_fd);
>>>> +    }
>>>
>>> We can also drop this when we remove the loop. Btw. why can't we just 
>>> use 'eu_attention_resume_trigger' instead of this whole function?
> 
> We could remove the 'eu_attention_resume_trigger' like so:
> 
> ```
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/ 
> xe_eudebug_online.c
> index a70d18ee4..c077795ee 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -622,7 +622,10 @@ static void eu_attention_resume_trigger(struct 
> xe_eudebug_debugger *d,
>       eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
>                  att->lrc_handle, bitmask, &bitmask_size);
>       igt_assert(bitmask_size == att->bitmask_size);
> -    igt_assert(memcmp(bitmask, att->bitmask, att->bitmask_size) == 0);
> +
> +    /* No guarantee that all pagefaulting eu threads will raise 
> attention */
> +    if (!(d->flags & SHADER_PAGEFAULT))
> +        igt_assert(memcmp(bitmask, att->bitmask, att->bitmask_size) == 0);
> 
>       pthread_mutex_lock(&data->mutex);
>       if (igt_nsec_elapsed(&data->exception_arrived) < 
> (MAX_PREEMPT_TIMEOUT + 1) * NSEC_PER_SEC &&
> @@ -771,44 +774,6 @@ static void 
> eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>               data->single_step_bitmask[i] &= ~att->bitmask[i];
>   }
> 
> -static void eu_attention_resume_pagefault_trigger(struct 
> xe_eudebug_debugger *d,
> -                          struct drm_xe_eudebug_event *e)
> -{
> -    struct drm_xe_eudebug_event_eu_attention *att = igt_container_of(e, 
> att, base);
> -    struct online_debug_data *data = d->ptr;
> -    uint32_t bitmask_size = att->bitmask_size;
> -    uint8_t *bitmask;
> -
> -    if (data->last_eu_control_seqno > att->base.seqno)
> -        return;
> -
> -    bitmask = calloc(1, att->bitmask_size);
> -    igt_assert(bitmask);
> -
> -    eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
> -               att->lrc_handle, bitmask, &bitmask_size);
> -    igt_assert(bitmask_size == att->bitmask_size);
> -
> -    pthread_mutex_lock(&data->mutex);
> -
> -    if (d->flags & SHADER_PAGEFAULT) {
> -        uint32_t threads = get_number_of_threads(d->flags);
> -        uint32_t val = STEERING_END_LOOP;
> -
> -        igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
> -                     data->target_offset + steering_offset(threads)),
> -                  sizeof(uint32_t));
> -        fsync(data->vm_fd);
> -    }
> -    pthread_mutex_unlock(&data->mutex);
> -
> -    data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, 
> att->client_handle,
> -                            att->exec_queue_handle, att->lrc_handle,
> -                            bitmask, att->bitmask_size);
> -
> -    free(bitmask);
> -}
> -
>   static void open_trigger(struct xe_eudebug_debugger *d,
>                struct drm_xe_eudebug_event *e)
>   {
> @@ -1530,7 +1495,7 @@ static void test_pagefault_online(int fd, struct 
> drm_xe_engine_class_instance *h
>       xe_eudebug_debugger_add_trigger(s->debugger, 
> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
>                       eu_attention_debug_trigger);
>       xe_eudebug_debugger_add_trigger(s->debugger, 
> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> -                    eu_attention_resume_pagefault_trigger);
> +                    eu_attention_resume_trigger);
>       xe_eudebug_debugger_add_trigger(s->debugger, 
> DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
>       xe_eudebug_debugger_add_trigger(s->debugger, 
> DRM_XE_EUDEBUG_EVENT_METADATA,
>                       create_metadata_trigger);
> ```
> 
> Does this look reasonable? I know it adds yet another path to 
> 'eu_attention_resume_trigger' but you partially account for the 
> pagefault shader in your current code anyway.
> 
Yes, right, I added a separate callback (for readability) because I 
didn't need the non-pagefault scenario checking routine of the attention 
callback.
In order to keep the code additions in this patch as small as possible, 
I'll integrate to handle pagefault scenario in 
eu_attention_resume_trigger() callback, as you suggested.

Thanks,
G.G.

> Thanks,
> Christoph
> 
