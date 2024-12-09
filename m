Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D31E77173
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 08:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16C110E4AD;
	Mon,  9 Dec 2024 08:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mS3Mdhqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E3F10E4A0;
 Mon,  9 Dec 2024 08:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733731695; x=1765267695;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aGEx/oWbcwnsXBs/9ddhDV6euPy0q55inmCCk9lZBXg=;
 b=mS3MdhqjB19QGsA2jrr8MZSxE4SKiBkktGZnjD4/FDAEFc0PTup8vNQ6
 ZApYHDDdyoeZAnaCvOl5rngbIO3JPtiR5wWWMa6O7UzK3O61xIicKNmI0
 9rzb4F1nsnr2zJPAvrsf3bONyBuYuVLbwLvrp/STFEjoAeQjf2DXfqSgG
 5Nf+i8YHNxcP8m47pSqDueeZ2NhZvjhTIFNuz11RLY7sJZyXqACmDCSrt
 A0Vmaqn38gNKWrGIiphzWXI1AS5j8xdhm4E1LU53pqNhLzwPwKcwGkTW2
 VQ7szi6Q1w+Bfcu8eKfoVNI4E+RsTmplXls/iAs3kfLQoxPm/tQUQOh7O A==;
X-CSE-ConnectionGUID: hf0OoR/RQLGdTXCqp4ArXQ==
X-CSE-MsgGUID: E/aZyl9yQ6m8g1kiY9wQsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33929897"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="33929897"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:08:15 -0800
X-CSE-ConnectionGUID: UqB1+pUURUquZWVGavpfmw==
X-CSE-MsgGUID: 4vJNXcoxRES6dzcq0p4iFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="95790047"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 00:08:15 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 00:08:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 00:08:14 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 00:08:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtS5ucITf66uN5A7Pzzsv2DN2c9d7b5YIR9ncGxOsT7T5gG6jrwxW0Km9P2JgUiiGRKkPNskZqCSoC7mjGdm65yfVqmoIbWwj48aYWyzSyNAyLwDCAj4lJffGacjVWd47esE1q7M/hLo/jUgMgRGfmNgugPaJIRwZtEdlV2KFZeZxJD30dIYxT/0fVkZ3ZkF3Wx0xTxrsJ863h9i9uPqpc7DQ7glfWW83rHL3kkQNCYnMZDlH/d1t0NinmXG3x8ISCAEPy/QpBaLx1bQ/UvdeQRHL/MrYU7ZPSf4vqGnMeQOnNsM+WJl3qC98mg3t4rIAl6JFxCOXom8vVP51Dak3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+JyCGzfW60wIwqUrCnrDqJYo+RgS7xk/G31uAM3XpA=;
 b=tLKJk+Ni63jGPKd2PdyNExKSxOD+n3wCV26ELwCU6ec79l3OAEFrBgtXNUUw1/sS/CBW/Pva8UVFdwRGTP+TE13Z6MA4jXw2KZ5UdUMKrSPKkYnH1Ypa+ccjnoG1rYSEmBY4MjOboZpDU07jyEKzvXSVMvrwPCScAwHbKfWQb7BMO2ez5yJcV/lg5J+GOb9YPzgg08ZhicBAZAuiFkfFwBunkOjInnjvN4lDkRxUP/0jyNT3GqfU4QwXe3FaoHPTTRuKlKOF/n1FuhJZPIkUf4r9bo9HzHygY4zw0VqMUR0elGtewxeqejm8+wB15NcCUtjlhI2lgtLUUl3Ejfevbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Mon, 9 Dec
 2024 08:08:11 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 08:08:11 +0000
Message-ID: <9f0fb410-f5ec-4ac7-a73e-43379f1bc974@intel.com>
Date: Mon, 9 Dec 2024 09:08:07 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL3hlX2V4?=
 =?UTF-8?Q?ec=5Fsip=3A_increase_timeout_margin_for_tests_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20241206-xe_exec_sip_eudebug_increase_timeout_for_devcoredump-v1-1-6736edd67447@intel.com>
 <173347647747.3262721.3363965532552159085@b555e5b46a47>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <173347647747.3262721.3363965532552159085@b555e5b46a47>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0037.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::12) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: c046c066-6910-444b-be28-08dd18289f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUhUUTN0WXhkYXVkWEtVem1XMGFlU0lkYXNnVFdrdDJyVmlzSHR5cWJXN2ZD?=
 =?utf-8?B?WjZBcGdPU2lwNThXaGp6dGFENUpSaWhCZmtFWXJUNFFaQU1zdDNsV05KV3J1?=
 =?utf-8?B?VmR4L1hrVHp5THI0eDBBTmFyemNYUjFwd0JMeDN2aGlxb3JwajV5Q0NCTkQr?=
 =?utf-8?B?QVdwTVUzU0V4ZE51Ly9rMXpUWU80cnJxK0FJaFQ5S3VHMzJJalFvRUdNK3VQ?=
 =?utf-8?B?d2NUMTlwMnhQYzViVlRtV1M2aktkMGtKNUovVkZIa0Nxd091ZlhTR0pKUG5o?=
 =?utf-8?B?dXlvUG1vODFaQmYrSnRSS28wb2Y0Z3p4WkZlcE1oWVdibk5CR2ptME5XL2pa?=
 =?utf-8?B?Qy9RUkFkL1BIOGs5bVpPR2pYVjh5QkJxaDZCQ0dIb3NnS0t5djJ1MEQvb0NM?=
 =?utf-8?B?TEFlNTEwazN3VENDSHRRZnBWdllZREZMVUNaay9WbjFzZVd5MVptck1jUmJV?=
 =?utf-8?B?bW1qVkJyQmRRU20raXNqeFRDcHdzKzVjN1BZZTNiZXRScG5rNUkrbHBwRkpZ?=
 =?utf-8?B?bjBMcUpCQ0FUZ3NmeXNlaTNPZDJVWkFtTDFJREZXY0VBbDE1L2ZKU1ZVK3pl?=
 =?utf-8?B?Vyt6c21FL3NEL2xaVlZqd255K25xSE5pbzNKY0lXY0FqUlc0Tk5zL3YzMzhI?=
 =?utf-8?B?TjJKZ1NieHkraXF5a1FYcU9JaVpkVDJ4WjB3c0JpQUllUEl6aGMrWVJnT2xy?=
 =?utf-8?B?WVlFdXhGWUJNVjBOL2xJTzdZM0lxUTFOY1ZPdGorWlMwRDZQaHgxS2dLbnZ5?=
 =?utf-8?B?WUR5MkNEWURkOFR3TWNIdS9vOS81UE5PbERwTnc5TmhmV1k0cDdQMjk1L0dO?=
 =?utf-8?B?RWxIbXM3SHlkckRwVVNsb3dDSkpUOWQvZ1VOcmpFdzJoOVIzNzZsS0JwbVlu?=
 =?utf-8?B?OGtDTzVya2hNRXVVTE9lOUhUbHRwRnRzeWtiTnJRaTJGY0VVcHYxQUFLR2xp?=
 =?utf-8?B?eUhuM1ZrVGhjS2p2NW95QmNITW9KYjlSWm9reVBWZFl3NzdlZTdGanlpVzh1?=
 =?utf-8?B?U3FJa2dNRTh0N2IzQkl5eE54UkhITXI0TEhVRVNBYk1qaDVodjBiOEZjZ3F5?=
 =?utf-8?B?Y1JTZ3hlS0hGM1U3TWRieHVFUjE5VXBFM1JJejdSVFlpWFpIQjBUVTZOU2ln?=
 =?utf-8?B?MmhhS3ZmdkdGY3JiL3JXUDJuKzFNN1J4bFNLMVM0QUdiV3duOHFvNnduaXZL?=
 =?utf-8?B?K0ZmdG4rRzRVVktuZUJidUs5SW51a3NPWGp5TERIZ1Q0S1FYSmtWdzZVOVFa?=
 =?utf-8?B?N3V5bGE5NEJnUFV4MkdycnVsL2hGemVQR1ZwTjhQcHIzbzY5dzVWQlBhM0lo?=
 =?utf-8?B?QjA1aldvQzcxNnF1SFNrdFBkNVlyTUlteFRqemhQRUltRVF4WGNFd2F6eElw?=
 =?utf-8?B?Y1p1MkRSQXJCV1JHNVVwVkRRS0psODhKKzY1clZzU3dBaUNVdjQrc1VyNU1i?=
 =?utf-8?B?bnlBbUkwbmxneUIxeVhxUW4vaUFxb1E3RWF5VEZiMDVmV0Z0dCtNVnRhVTBx?=
 =?utf-8?B?SUJkLzIxa1NhOU1DOVNFSzZSc0d2WU1pYTF0b254Y3BkTTRMM0VvZkYzWkJx?=
 =?utf-8?B?M1lvcmI0N3EydkhiWjRUeFpzckswaUJISDZpOGRKTmVMQldUU29xU0R5WGsw?=
 =?utf-8?B?cUNFaVk0OFVoclVBYW4wcjNRSThzUlg0dWRhMUw4Z01NbHZpajIrRUNVTkpR?=
 =?utf-8?B?azJNR2ZaNUQ2WmRYcklWV1orQ3E4cWlwbVF3TFpwZTJGbjNUQ05RRVgrSFY4?=
 =?utf-8?Q?onRGR/zjk2wISSq72s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eitTY1VOM01xSStaSDZyRHJzY0xYdUlrQXV3SHFxUXVnTjM5Mms1UUlSWHJP?=
 =?utf-8?B?SnNGTHF0Wlh0bjdWaitKSGxDdXJJd2gwZ2UrM3J2RGkvMFY1OTRZMlNhNE5m?=
 =?utf-8?B?OGY5alpOVk9kZXFML0RUNzVFcmhNNlBrMnU4WDNZTm0xRGhLd2tTZVc4MkE4?=
 =?utf-8?B?b21CQmpoU1hXYWgwV09xTEZBY2craXovbmtwMkk5NlNLdkJQZURZYndEenE3?=
 =?utf-8?B?Zkk4YTRsQ0V5cGNEMHRlNEtuUm5wOXJkczVBMTFoVVU2SUd0bnpzZFFadXBO?=
 =?utf-8?B?VXZxUGozZWpBVUxKbWIrZUdpbllSOU1jSzlNbWVxTHBNMXlUQzk2Z0xrR2Rj?=
 =?utf-8?B?enhGOW0xRDNUQzBiRlJpMzQyM3k5Z29ERm9OS1YwUEpEM0o0c1VRNkJoNmxj?=
 =?utf-8?B?YThKaUdWNS9DU2cwRzdFK3lhL0VncThuWFdSSzZYb2NnYzZHNVpNYXBieTZP?=
 =?utf-8?B?a3BmTzVHUkZsUWFoVVFVRnVaSnE0c0NEc2E4Tml1V0NzOWp3U05FZVA4ank3?=
 =?utf-8?B?OHhuWTl1WHRQTVJPbHlTNjlrTjFmYllIT2NzUnlkREhpVzV3SkxlQUc1Yk1X?=
 =?utf-8?B?cEFrcGVtMmc4SFlVU29qRWx2RWxoc1NKUlBEVnRUZ0wzeW4vdmNHUFQvbHZ5?=
 =?utf-8?B?MndxOUttek9VS1NkR2lDc0k4T2QvRjFCMmxRUS9lRVR3VHk5ZDMvRUcyeHc1?=
 =?utf-8?B?bGVTYTd2ZjBLY0ViaWYzVHdNRzBmendNSTl1QUlWMWtUaTFOcEoxd1pBZVlv?=
 =?utf-8?B?R1FWNXRIb0lIcmJ6WG1GaUVaZlExa0tRUTBHYXAyU0FET0MxSlgrWFhzVmpB?=
 =?utf-8?B?WkdDNFh6bFk3OTRKd2h2ZElpaWE4QmFtY2FGUHFLNlZKUFp4UmZ4TDRLZnRa?=
 =?utf-8?B?Sm4rZ0IzT2krNGhHVVBRNDNhOG9yT2MwcDAyaUM3SFo5V0ZjUm1pUkc3Vkww?=
 =?utf-8?B?QlU0RExWSkFtYmtOSHVoNG9nWUVMNU93OVdFZ0xzMmdwMnlpQ3FLcWg5Z2VT?=
 =?utf-8?B?MlRJQllZTmZoRmdNVVhaT1diWXBCQzhGZnduYXYyYmk1QzRXWlFOZlhEcUJH?=
 =?utf-8?B?UjVQSEtwYnIxRzBxL1JWRVNtMUdwV1NGcHlHTnU3NkFqQlVOSEN4QUJTTWNj?=
 =?utf-8?B?ZTNBZkxXTS9JbTBCWCtKU3VVaTRxaFdQQ1dMWGJselprTUFLcUJ6dE84UE5U?=
 =?utf-8?B?L0EvakVpcnRZa2JETWNscHlueWFsWjIyK0xOYTVFQnFtbmoyU0h3VFZhY0Ex?=
 =?utf-8?B?WElMYkw4ZE5GcGhyby9GdXQ2MVZhVlNzUUhoY25mTzUxZE56ZlYyTzQvdHZN?=
 =?utf-8?B?MVh4WTlVNk1sRXQ4VkgvM1NJbzhBaTR4RktVRDc1V25zWU1SNW1kQjVIa0F4?=
 =?utf-8?B?MllNNGZ5SnVmcCsvaW1SdXA3UUoyd3dLNVg5TzgzbGhmUkJiMWxwMUxFcUdG?=
 =?utf-8?B?OHhQMHptVks5Vmxtb0JLYkIrT0hSZmJqK0w0WHZBVFU2TlVYa09QR3ppaGZq?=
 =?utf-8?B?a0p4R2hlSHc5V1NSRXlaRnNmRGtRZ3FyK2VDdzd0V3lKQVd2eEY1dG0xVExS?=
 =?utf-8?B?TXRvMG9ic1RlSnk1aDNpMkxtc1Q0d3U2VjNOVVBVZnNGbTl2c0ZTNnd1bWk5?=
 =?utf-8?B?ZHQzOFFBMC96VkQ5bCtRNysyamtXcXBhajBIeUt1UW13emVacFl2akdlZnRm?=
 =?utf-8?B?OWllNkJGSUlOcHE3d3BKVmdPd083M2U1UERHWW5YM3luVHlCUmFIUmltbGI0?=
 =?utf-8?B?MG9tMlhEZzVaZVdvUGExdkJSZUVhYzhpT0xGd0V3eTZlZyt0V0s1ckJYZWNV?=
 =?utf-8?B?aEp2Mkh0WHEvNUc0YWdMLzJuSk5PYlUra0tRQy92NWZVWDlPOTBSNHU0a3l6?=
 =?utf-8?B?NGNhVUxBN09PYXg3NlpRYy9nMmlPWEJNNkpMcjY1cnRwTXJ3QUhURXgzanYr?=
 =?utf-8?B?bFR2eWdqcDE2RFlPODczSTRRL2Y3RWFER3hZREVxY3VwTm9vL1JqWnB5anNG?=
 =?utf-8?B?NmhIQWpqRGpuMHN6WjlHdTl2ODZ2MUxWbU1sVDI4QnFLYU9FRkdQYzdpbTlL?=
 =?utf-8?B?UFl6RjhpaDZSZ3VCaDVaUXY5WVJGSlhFRERHWGlWMUIzcXpjM3FTYVFUOVJB?=
 =?utf-8?B?QmJOazUvbXpwVmdNdEI0ZDNaWlNQd1VqUDYvOVZraVdIR1hhSDFUaFR1aFdH?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c046c066-6910-444b-be28-08dd18289f8a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 08:08:11.3332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBewlVn1LjL0BsyRLVPp8A5Se4b8xxxBcaV9qtVouxRFatwLJKac32J5eF7O5leTidVmEUmYrJ73jTs6BKzWBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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


W dniu 06.12.2024 o 10:14, Patchwork pisze:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe_exec_sip: increase timeout margin for tests (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/139889/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12264/index.html
>
>
>   CI Bug Log - changes from XEIGT_8141_BAT -> XEIGTPW_12264_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_12264_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12264_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (8 -> 8)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12264_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
>       o bat-lnl-1: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12264/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html>
>         +1 other test dmesg-warn
>

All regressions (this and next emails) reported for this patch are 
obviously not related - the patch touches only xe_exec_sip_eudebug tests.


Regards

Andrzej


>  *
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_12264_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Possible fixes
>
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>       o bat-lnl-1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12264/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html>
>
>
>     Build changes
>
>   * IGT: IGT_8141 -> IGTPW_12264
>   * Linux: xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422 ->
>     xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02
>
> IGTPW_12264: 60a3c62fe2c882953d9a9f1da6d66a3c0c9c1baf @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422: 
> e57b4b7cd137e0ae00d2601b4b55ab7f504da422
> xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02: 
> 2e90353f058f2487798ad9236f0926df4ea54f02
>
