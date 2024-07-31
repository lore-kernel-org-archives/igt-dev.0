Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9739C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 13:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2B710E618;
	Wed, 31 Jul 2024 13:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nu2ARa3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA8210E617
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722430884; x=1753966884;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1bxmJgdOqa97pd+Hg+RlWW8+WEq12p8gWWYcqJcp6FU=;
 b=Nu2ARa3f094xwJt3sCeYxRhnj8CKfrPuzd0gkzvC5dTN8ghZAAX3v5+l
 jfh20KrmDq0E2kiG2hbx52h6rOs8CrXH7Idhc9bOenz/Ymudw67liSboA
 4LcFOcmmT23fozNkeZahkbt2VYMCO1N6Qefu0yIt6m/o78248E8FqSFId
 AwmQ6mOK4M+z6yRR2VldG/57CtGliZgLyFm+NBaQzrZp0arpxJPVOnLxY
 VZu3NWdxn2oOe1ZHsJZGDdCcjkq6smg4vnyDY7Ipnd/oDZQO/JkKhsVjm
 LyZaaHQXkM+3pe28rkyIPQYm+pPAPbjXfcRuVC1WNq3FjNrZaxOLI93Pi A==;
X-CSE-ConnectionGUID: gWhPmeNVQqm7iss8YTqOIw==
X-CSE-MsgGUID: iGZigBrdRyOpEfZLlN2mBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20430655"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20430655"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 06:01:23 -0700
X-CSE-ConnectionGUID: yfNDsDpDTeORivwhjdPQiQ==
X-CSE-MsgGUID: LVgm3OAZSF+v3bdHAJVFlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59317168"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 06:01:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 06:01:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 06:01:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 06:01:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k62GoTcR4Uxpn7rfq52hhf0/lC1IeeDWyS1ec0hGO9UYX/LLpKju81rRHcBNvffK0WX9mHRmU8Lg3NDIdwOs884E6xFlvzE7HJegrVOyvyvMXGJgbMYJbWHWa+4FsnNz1m32t3YmpA7sDlYggkK0XXKuLFiwDtdiCfbZ0kib8qyXfTGIlF/G8qa94HtMN2CnCpwoTOcvPmop2CWnhHK7qJHg8ViwcEMaPh8x6PDDbZs71bCcxxIZUNwD4t37i9EVUgddMBVDtAUO69ioOOEadwC1Q9Uqy1bnHLvp2pfcU5ngCnc7t+RgBDvRQMkVOJ9tthwtM6cikE8xL1/+bHaJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WV1ZHJTaI5fGNuUwR+Km4AT41+KipkCoIxxBu6OPH4=;
 b=Oo39ovpYxvgzzq5m52oSS4j1pCfCqRCWKSwQYsu6Bw23bm0OE2i+I/HZc7pPvZfDki3BJEN0wJnL78XPZbYxGC1UlVkuwcjWK7VwUUUuz01tq2KNA+VuLmgLn5CtU1GOnQWvMzRF/TZ2IWfp3JwZr6WFFjU/CKmRQMAP6ZleKWP5rI3Tu9YAU3zYUeVwnx8fN9mZkDvrwUMG46F02cq258TK2AWFTyDcQy/dFaqO62vF++uIQp1eb/pwblbVRjBRy+TTU5rB/rRY5w61CpuiEHTa7mc84oxjPM1Ho1ovMfGzxKccUeYDOWE/kHo5j0w8n2LgaB2Hki2GptVkbpG/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 13:01:16 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 13:01:16 +0000
Message-ID: <426b57bc-b158-4818-b699-26fdf64bf5d5@intel.com>
Date: Wed, 31 Jul 2024 18:30:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_vrr: Add new test to validate LOBF
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <animesh.manna@intel.com>
References: <20240731120215.2946412-1-jeevan.b@intel.com>
 <20240731120215.2946412-3-jeevan.b@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240731120215.2946412-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::17) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH7PR11MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7d0b12-753a-4023-4130-08dcb160dcf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWhTK3ZaWHcxUVNZVFM2cDVQT2xtNXBZMVJacGZQcUk3S2JyRldGSjhFODNB?=
 =?utf-8?B?eWhZQldDS3Y0OVA0ai90ZXJYUkl5MVdUWFRYTkxuaENreXVXeld3MEhDZWpu?=
 =?utf-8?B?WjJIMG9HNTZORzFSWUxWK1JiTkFqcUc4aDJFNEp1REgwOEVxMy9wNURNdDZX?=
 =?utf-8?B?dVdyUHkyOWpEdE5QU0trZHE3TjBOa2JnNnQ2VGQxQkQzREQwM0Z3bW9HclVE?=
 =?utf-8?B?dzdyMXhvajY5NFVkTWxWRFhqbUFaaENjWVNnMWlySHVxaXNIOWNSejllbjBW?=
 =?utf-8?B?ZFN0NzZBZGNIOGFmbFFoMVVSbW9aSGdnZjh3cDJDYVZwWjVnRW1PSGdVZmhQ?=
 =?utf-8?B?NGNyeWFQdmtOOXd6NDA4Z1M5Rm05cllnL3dORjF3a3R1cWFVRGJKaEwvYUdl?=
 =?utf-8?B?QTR0UEFVSkJOQTJGc1FUZ3JOYy8vckd4b29DanVPcklXYVR0dVVIc0FNMUxH?=
 =?utf-8?B?MklzZVpQTy9iZ2NrcHdITWlidlVML1pDbnZTOWJnbVVCNXpQbjl0RTY0dlhX?=
 =?utf-8?B?enZTNG9sOTZlSk9QSlRoVGtLVzBnL3I0bHVTR1RyQmdhUW9GRS9QSElZVTZU?=
 =?utf-8?B?U2tTanlQbUsyTXNjTEV2WVA0bFN2MEJTZFc0S3V3eW8yanBtSDd1dFdSa21a?=
 =?utf-8?B?a3R3QmVxeG8vNnh3TkdHWmJrMGUyNi94dHFWcEl3OXZoUUpUdkFZcEJRT1Bk?=
 =?utf-8?B?amt2NXFHb3QxbzBWR2dwUGRuak9BZE5tZU5IN0FIWWdTZ05KR0ZRQy84UXl1?=
 =?utf-8?B?VWlXVERLSFlhYjFFVGMxNGx4QXVRRkpVWHN0b25YekUrTk9SNUhXUExVUFAv?=
 =?utf-8?B?R0g4OUZMS3Q3RHZzTTlZTEpSa0YwTHFOSU5VOXFLbW1oVnFrOEc4ZmlxbC81?=
 =?utf-8?B?dnEzN0trQmZENFNPMXJoYnBqNEtOSUVhK3M2UFRONmJzMXB6emg5ZVhNTG83?=
 =?utf-8?B?M1lnM0VQRmN4bWNqMVdLRWlUMnFoWEZNdENHSW1wSXk3dlMxZlV0eG9IZFgy?=
 =?utf-8?B?a3Q5SHNLVkRjb0RGY1hUTkN3QjlsYnNTMy9YUGhXY291ZFFjRTZDQVI3eW9T?=
 =?utf-8?B?bUVSNUVVd0NrTnFzU29nMEN3aC95b1JGUy9WQVY0cmNJTTU1VEc1ZTNJaFBJ?=
 =?utf-8?B?UlNLUkdpMXNxUW9oWGxwamJ3Yld0Ly9ZdHlvcnVmYWNCanlMdUJLeVJXNWg5?=
 =?utf-8?B?VlFqaGlyRE1xUXNSbldOcjRtWDFScmRzZWZ4RTNpdzlucUV5S3E0VHR1Y3hW?=
 =?utf-8?B?czZuZGJNamlXWDd2MXJ6OW9PMEF0OFpXWngrUloyRnhqTmxIU2xiRjh3aGZl?=
 =?utf-8?B?cWkvKyt3NUF1U1R5N3hrVXdaTVNFaWFYMTZsWSszWEx6eEZUUkVOTldNSTJ6?=
 =?utf-8?B?MDdZUFJMODZZZ3h3TGovb0hDTVlKYmkxNzFIWUJDbjkrNmNvRm9TcmNwTFFG?=
 =?utf-8?B?SlM4YXVoQUdPT0NiZnR5QnFQV001Z0JOSzhpMVN4MjdoMjZKZ2hQc2NUQlFm?=
 =?utf-8?B?ZE0wei9oWHpnSytqei8vRDltbkt6V3I4TmRBaHFLMGJXSllPQzdUdjRaaFN3?=
 =?utf-8?B?ZUpxdGIxQTZ5M3Q5ajU2SHhZc1FHQVBGTjhPVGVqWGVPajFmT2JReUN4N0Nn?=
 =?utf-8?B?SEw5SDRXanVMeHlKNlY3NFYxemo1Mkd2RUwwc3VPamRDejAyVXIrVzdzTXMz?=
 =?utf-8?B?SEJlMmtyWGtIVEJaa3doOVdQN2RUWTNRa3pibEFLUjk0UzJUam8xemtsVlhX?=
 =?utf-8?B?RCt5Vlk0cjZSb0lKZ2xubU8xV0VpdDZxc2UvRWpxSU52YjFJUGR6ZWI2NXlT?=
 =?utf-8?B?Z1M2VHJmVFNuN0p4T09vdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2VVeTJrVWxuVjdIWjJuMXcrMU5KNkNoNG9qQy9sSFd0cU9Ja25ZNjVmaGJP?=
 =?utf-8?B?TmVkR3NqVnRWRzZLeGdlbHpmaldNc1V6TkpORzBlNkJyOGQwSXFYMm02TmVM?=
 =?utf-8?B?OFdhOENhb1lJcTFqMERBWEZuY2JzRU5nMDRIVk0xbHBVWnRsSDBEK1BlM3Uv?=
 =?utf-8?B?VXBPU20yUE4wSllHbG54Zms0d3VXWGRadVBaSGFxeXhYcmVkQ21wbExXRDBo?=
 =?utf-8?B?NlhpUkF3RlhCam1pZ0FtdzU4NWxPRTlyaVpDbk03ZytXcWowUmZ2THd1RUN5?=
 =?utf-8?B?djhpOW93VEpQd2x2eFlMVStseVM2N3JCcnFsUVBnQlNZWUN5NVlXMWZhallI?=
 =?utf-8?B?cmNKeWJtNmk4SkltYUpvTEpGRkZ2SmJ3b2VMTEhJRDZHRWVrZGtiSWpDTlhR?=
 =?utf-8?B?K1NUS2NyQlpGZUZyVzdQSHFxMG9FcHV1VVlQMXlKVGRFMlZNeGFuNkJaMC9Q?=
 =?utf-8?B?MUxJOG5pL3NjSFpObjR0NVVIQ3ZDS1NwcHBEend6SHpuVEo2QjJYT1RoZVZ4?=
 =?utf-8?B?UVBWY29FTnFJM2N4elBlVHFCZm52MkxOZ3hqWCtHS1Rpc2w4RG4xeXVNNSto?=
 =?utf-8?B?dXJuVmlra284NmszbGZvOVRFaHE3SGFLcloyVlkvQXpCaGF2ODArN210RkxD?=
 =?utf-8?B?S0FaRHduMVJNM2xGdmdwL0MwNkNVKzlGNzJmejFabUk1VGxPWm83Um1VUGRS?=
 =?utf-8?B?VGlWMEE1SGFuYjd2aTg4bk95TVRvdC9HcVpML1g4OXQ5bFIyV3RBaml2cEly?=
 =?utf-8?B?WENBM0ZKRWR4Y2taeWdnNjZKcGlRTVRKNVIyTlVQd1I1a1BoUWYrVTQvSFB6?=
 =?utf-8?B?NEtLMlF2dTV2TWtUZEQreS96RHV3djcxekxxc1lFZ2VRRk5ZN1Y4cUJ2ejZ6?=
 =?utf-8?B?K09wbXpPMnpQNG1kcmo1OFZSeDlpRWtyb2Ewajl4U3Fxb09hOU9nRU5rMG4y?=
 =?utf-8?B?R21YSkUraE1uQ29haENZV0M5ckhkc25jM1hmMnhEMmJlRWRRZ0ZUbmtNRThI?=
 =?utf-8?B?UmU1SnhzU2dqVXByMWZrL1JZZ3JvZmhEek5kd1U1L0F1SWtsckdGNkxmL0ZM?=
 =?utf-8?B?VDF4NXZ5NTdFeitidzAvdXBlSUJxUU96N1ExQlAvMk5VdjBNVTArWUhyMVRx?=
 =?utf-8?B?ck5CQkkvNENKVStBcHNraEtoRU4xWGcwcEE1VmJ6M1hwQ1lFYWtuaUI4T3JN?=
 =?utf-8?B?LzRLTy9yRUpza3ZMZzJyZy9tS21TbVhCc1JWVXZuN1BCTlA0M2ZIUjVDTEZM?=
 =?utf-8?B?NEJFK1hIZm1Ud241RW5SajFhdXk2bUJGUGFLSElVNnIzNnR6aFNFbUZYdm00?=
 =?utf-8?B?WlNhVDhRWjV4T0Z6N0oxNDU2bllCZG5GNXFBZGlzejNUS3Nja3V4RlBQWUg1?=
 =?utf-8?B?NEN2c0lMYUxzcjJFcnY1c0ErSlNqbGc4K3F5OEgyYWRQL2xTdVJZczkxLzFi?=
 =?utf-8?B?VjRMaEFMWEpZNHJ0ZjNwWXIraEc4UjVWanJMTGpld1pnaTgrM3ZnWXBDdnpW?=
 =?utf-8?B?UnZ2V1Y4YnNqcVNTei9XSkhJQUEzWHI3Y2ZRTXh0b2N6WjdYemxaUGhyQS9K?=
 =?utf-8?B?RkFqUDNzUkZ0bUV1bFdYVm1qZ2VvY2VEamJIN3VBUVI0bk9kSVZ3NThpb3pn?=
 =?utf-8?B?QVFvbmVQUmMzMFB3eUpqQ003K1B6OU5wM1BpVjlsVjQrS1J5RThtWVBvSU5i?=
 =?utf-8?B?dWRDRmpnWXJVdkVhZUdjRlNqRnF5R08vWWZRcVV6VDdRdVBGZG5lT2w3MUtr?=
 =?utf-8?B?WW8ySWJPWi9TbzA0YXBLcFp2OXZoYU5NblZYMncwcVBBVlJ4NFNjUFNyaHhK?=
 =?utf-8?B?YWFZYnQ0eHYzaGhMZ0R3YWVjTDhyeXQvL1NERTFzbWlvRlRTN2xVeTFKUzE0?=
 =?utf-8?B?bzFiWlZuRmc5c0xFdDZZRWFFTnJKZ1dheFNyeXNpOXBCZGRCRGhGTGxoMEpS?=
 =?utf-8?B?OXVDV2JzczNSV21iMkVXQ3Y2aVI1azlNU0xaR0VWOThMTGQyRTlwbkpiZXZP?=
 =?utf-8?B?bEp3aHAxM0YrdENGTW1zY0VOeHg4cDR4dTd5OE1wZjRsc3o2eDBDZGhDTjkz?=
 =?utf-8?B?Rk1hT1hkbVRQK3RteTNvRS9uN2ZyVHpsRFd3Y3B0eGRUdWg2NHJyR3pHWVJO?=
 =?utf-8?B?aW11azVOeWVibUJHZjdCZmdydTlnNDJ4UkxQRjBRTTY5dzFiWmNXMXBRSUNN?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7d0b12-753a-4023-4130-08dcb160dcf2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 13:01:16.2873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEUpt9bYtyVuBL9gE6CQo0vYcbsAA0SNWUT/+3xE+wRiHmRtxGhTYrYmTESmfiiwhYh2ppnKt0UxIbw022qimYKE++FYjBs0d01EoQ3CnPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
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

Hi Jeevan,

On 31-07-2024 05:32 pm, Jeevan B wrote:
> Validate refresh rate changes that appear to be stable but actually
> change slightly in the VRR using the fixed refresh rate framework
> for non-PSR scenarios.
> 
> v2: add PR check.
> v3: update commit message and fix code structure.
> v4: update logic using existing code.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_vrr.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 7e8885f16..851b8bbee 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -31,6 +31,7 @@
>    */
>   
>   #include "igt.h"
> +#include "igt_psr.h"
>   #include "i915/intel_drrs.h"
>   #include "sw_sync.h"
>   #include <fcntl.h>
> @@ -76,6 +77,11 @@
>    * 		without a full modeset.
>    * Functionality: LRR
>    *
> + * SUBTEST: lobf
> + * Description: Test to validate link-off between active frames in non-psr
> + *              operation
> + * Functionality: LOBF
> + *
>    * SUBTEST: max-min
>    * Description: Oscillates between highest and lowest refresh each frame for
>    *              manual flicker profiling
> @@ -106,7 +112,8 @@ enum {
>   	TEST_FASTSET = 1 << 7,
>   	TEST_MAXMIN = 1 << 8,
>   	TEST_CMRR = 1 << 9,
> -	TEST_NEGATIVE = 1 << 10,
> +	TEST_LINK_OFF = 1 << 10,
> +	TEST_NEGATIVE = 1 << 11,
>   };
>   
>   enum {
> @@ -129,6 +136,7 @@ typedef struct vtest_ns {
>   typedef struct data {
>   	igt_display_t display;
>   	int drm_fd;
> +	int debugfs_fd;
>   	igt_plane_t *primary;
>   	igt_fb_t fb[2];
>   	range_t range;
> @@ -784,6 +792,27 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>   	}
>   }
>   
> +static void
> +test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> +{
> +	uint64_t rate[] = {0};
> +
> +	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> +	prepare_test(data, output, pipe);
> +	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);

Please drop this redundant initialization as we already initialized in 
output_constgraint().

> +
> +	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
> +		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
> +
> +	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> +	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> +	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
> +	rate[0] = rate_from_refresh(data->switch_modes[LOW_RR_MODE].vrefresh);
> +	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
> +	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
> +		     "LOBF not enabled\n");
> +}
> +
>   static void
>   test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   {
> @@ -843,6 +872,8 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
>   
>   static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
>   {
> +	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);

Don't we need to close this fd on cleanup?

> +
>   	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR)) &&

As mentioned in previous revisions, please extend this check by oring 
with TEST_LINK_OFF.

>   	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
>   		return false;
> @@ -852,6 +883,20 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>   		igt_info("Selected panel won't support DRRS.\n");
>   		return false;
>   	}
> +	if ((flags & TEST_LINK_OFF) &&
> +	     output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +		return false;

Please read above comment.

> +
> +	if ((flags & TEST_LINK_OFF) &&
> +	    (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL)))
> +		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> +
> +	if ((flags & TEST_LINK_OFF) &&
> +		igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
> +		igt_info("LOBF not supported. \n");
> +		return false;
> +	}

Please combine these two conditions.

Ex:
	if (flags & TEST_LINK_OFF) {
		if (psr check)
			psr_disable();

		if (lobf status)
			return false;
	}

>   
>   	/* Reset output */
>   	igt_display_reset(&data->display);
> @@ -1030,13 +1075,21 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>   			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   
> -		igt_describe("Test to validate the the content rate exactly match with the "
> +		igt_describe("Test to validate the content rate exactly match with the "

As mentioned in previous revisions, this change is not related to this 
patch. Please drop this.

- Bhanu

>   			     "requested rate without any frame drops.");
>   		igt_subtest_with_dynamic("cmrr") {
>   			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
>   
>   			run_vrr_test(&data, test_cmrr, TEST_CMRR);
>   		}
> +
> +		igt_describe("Test to validate the link-off between active frames in "
> +			     "non-PSR operation.");
> +		igt_subtest_with_dynamic("lobf") {
> +			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
> +
> +			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
> +		}
>   	}
>   
>   	igt_fixture {
