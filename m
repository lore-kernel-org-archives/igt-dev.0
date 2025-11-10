Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4E1CD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 04:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C72F10E079;
	Mon, 10 Nov 2025 04:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VovB0MfS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D455110E079
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 04:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762750630; x=1794286630;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FMxmUjcuJOMi7cLU9SwwcI+wuTNUgftuCafEqF0h7gE=;
 b=VovB0MfSwQQGxskIVB8xROhpuDqQEwv4X9p23C/IHCYtCfDW6BxDmhuT
 RakMsH6h3uc4TL6oYtO4MdZ4oxfyMa7lVQKcMkVjXnp0K9uHVrCAOUtjP
 GIT3e+QbGx7Jxo0Ak8YF0g4/F8jdWsdeso4Xmf0BzNjgWTcKVgtWJ6mH5
 wcwgZOL0OOEIJK8rMQdyIdhKaA7OdFSJzN+0D4i5BXDH+xQzqTSvE9vph
 VJLlh3qMuD7KDTK5WQf3gRtNxoua+QZxqWFbInUBrTBaIzymuVFE6mc67
 20eFkfRgf2BNdzPQQN1x9fWCUJ4A8X9Q846u1+p/jh8G47xtxnnefSi2z Q==;
X-CSE-ConnectionGUID: gkPEE44xTcS+AcW6tZ7Vcg==
X-CSE-MsgGUID: Qoh/UR5+RU24p5LiKINgNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="67404116"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; d="scan'208";a="67404116"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 20:57:09 -0800
X-CSE-ConnectionGUID: nYVRzMGqSPiF6obgIucuOg==
X-CSE-MsgGUID: +HIq8XLXTVyQtTJdJr78Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; d="scan'208";a="188320131"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 20:57:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 20:57:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 9 Nov 2025 20:57:08 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 20:57:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpb20ElmBK6cT/51R1bql3z9yaAXrecP/KyL+ut6TZu1pHGoksFP9D59xCKJPRXMCDPwoj9DAAXgMNAM7az8l7Weh83XnlfCj2nO9C/Xx9RGOarnrNdk/UzWlw+IVCcJ2Dr3CYoEU7S16Kk9uJSqics/5cqSyMef+OpWtsZgZEh9AIOoXJq+Wnd+RtvQi/3FpBarhG9+C4SmHuK9GW7t4o+mZT5pRtTluA5nbLnS0J5LO1odfXikdluE30o5bPEEtaGlkBFKvi9xxSFHtLogn6W1LbLyUYFnOdpNbGVyDW72aPHi/IDCp7Z+5RQLhoyAWDmSiSD7qUkJCPNbHzCASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Atb8uUWCA0s4YbFageomT9er50FHM44QouN7CiNJvGQ=;
 b=SG9dmIesS1UNN8RGtSewes61EB7sdeEbcIEQVY6s3TD+ijcNauAVOJMOlAM5x3xVxmlUUP1sR/DaurXTeZoe2ZAjaeGjK0wRGQC61ioDsBinGrc6+9OE6RESDQuJKErx9KZ1/dUebM2xZmv1BMjYLLfaR4ENPjxmqu+p0p6WYvjhnVa0P+AjBbIeFZuDdufTb8e+y8uUZZoY0hlzIbP5zTe3ky0rWMrpgndd7Ukz8Zst9948fdQMWeH7+6Lxkb5IEy48HtDi89PaABk635RKk2Alm5kEo3YAAw2ffxiY/266+cO/BiuLGLXZ+a2wU41V8Te8ABpHZg+ioY7ynKzgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH3PPF9E162731D.namprd11.prod.outlook.com (2603:10b6:518:1::d3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 04:57:05 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 04:57:05 +0000
Message-ID: <3400e699-69d5-4e23-97b8-abebbb961da4@intel.com>
Date: Mon, 10 Nov 2025 10:26:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v4,1/2] tests/intel/gem_ctx_freq: Fix frequency
 restoration in exit handler
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20251105140029.1796233-4-sk.anirban@intel.com>
 <20251105140029.1796233-5-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251105140029.1796233-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH3PPF9E162731D:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b5f29d-ac29-4e95-6d87-08de2015980e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW9oak9Wd055bU1Bb3d0Wldnd2I4bFFpU2ZRZ2ZFQTdsM1JEeml4SFpxZTBY?=
 =?utf-8?B?MEZvVXF6dThJQldmblpKUWs3cE5LK3RiWTlsQUFFMUh0QTVQSlpRNkFWbnFW?=
 =?utf-8?B?NnNtcmhpcU5NbTl2ZHdMTkZyOGZMZTYyUlcrSkptNGx2YzV0RGRFSnU5b3N1?=
 =?utf-8?B?eE1ENm5FVHBIeEo0bi8vcnBqNjlvenNGMVNVM1dCN2JoZFluMWlTV0Z1RFNQ?=
 =?utf-8?B?bGNYeldxamI2M0VvS0hyK1VaSzJUZWNSRTlxY2EzbHVsdFdOT3RvSkVTZVlz?=
 =?utf-8?B?eFFRVVdWeWVYUXlqSndlVy81SUJmWnZoejUxV3hvTTNUaFZDckduRUhrQTRL?=
 =?utf-8?B?ekdpWVpFbVdxNWJyMGI4WG1vRWlBWlgycFlEQy90RkFWa2E4TmcxNE5INEhJ?=
 =?utf-8?B?MmxUZzY2dlVEV2pwS0MrZkJJV1VFMlM0aHY0OHp4MHRvWHRuMXJJZVcxT1Rr?=
 =?utf-8?B?dUVhL0ZjeENDZzJ6OHdHQzY2RDlFaVQzbEFwVlowT0xrWmFIVXZFL1J0OXRP?=
 =?utf-8?B?VUtIcWVtWnplYmhvcHowQ3ZGNTRqMkRRcUQ5QStneGt3QS9iR1ZHWWt4VXVi?=
 =?utf-8?B?V1dCQTNqeDl4ckMvZTduSVphMWRKbGRqbHgzSGx0a014RnlwTm9Cam9jU3E0?=
 =?utf-8?B?VTR6Z25NTGZMb2pFanFHNVJoLzNMQW4yNjdLVVFqRkdJQi83T044WTdkN1Br?=
 =?utf-8?B?VHZLOHRqR2E0THM5Yi8wd3NVSEM3ZjNlZk5ESGhBZDBBQWk5cS9LLy9OS1Vt?=
 =?utf-8?B?d2FSZU52VWh2UDVNUFZEbFlEVmpDZXFqU1VrYnl5K0xCY3ZpMkZrUnBqNkVt?=
 =?utf-8?B?aVoyZ0JWckQ0SklISC8rNFdjNGtHWDE0bFJybVBVQSt6T1IzT1lvc2xiY3B3?=
 =?utf-8?B?ZHpoQmEwTVd5ZGFManRDajhoKy9OdzdIWlhKYUhBK3lucnRnSVZxclV2NThK?=
 =?utf-8?B?RWhLQjJkNVN5ZHlXYmZReGU4UUk5dHBZUUFLUGdRWlIyWTREbnRwSEFvYy9Y?=
 =?utf-8?B?aXJLVFJHN284cTJKbXdLT2xLSnJSUFgvR0trZ1oxK3JoMTY1MXcrcFlGWCtJ?=
 =?utf-8?B?K3VZKzBTK3RRZVo0NVI0OXJMcHFlbE9TVkdiWk1NbmFabWdXcVF1YnR4L0dF?=
 =?utf-8?B?Q0VzTkIzY0FOVFEwcjFMMk52TmFWZC9uTWQ1eEFhbXRhR2FhWmsxenkwSVQ1?=
 =?utf-8?B?bk1XT2dVNkl0NGkycnJsbVlzMTJHb1lDS1VCakRoU3orWnArT3E5eGFXRStq?=
 =?utf-8?B?Q3R1bEpVV3NOQ2czakhrcWRQcTVtb05hQjdwQ0l6Sit2L0lDOUxCLzhUM3Bp?=
 =?utf-8?B?NHo3ZWtneURYSDE2L3JoSGloa3JsSzlkeFlETERBQ25kUFpMc3FLVGpjaGFC?=
 =?utf-8?B?S3IyYld2b21KSUxJVklZSE82eko2R1lQTHpOMVd6M0VqUkpwaFlVNkFPQm9X?=
 =?utf-8?B?a0x1SFU3ZzBldzFjN2NTS0U4OWc3WFhZVFJ2N0RjM0Z0MWdxN092Uk9kNWZQ?=
 =?utf-8?B?blJzRHhOS1EybVNaQnFIQWh5SWQ1WnFJTi9WbWl6cVF4aHdUU1Y5eXpoTXBZ?=
 =?utf-8?B?bXkyZTUwU21scGt3RytQV1ljNW5uNlBYaENvSzBrcHp0aHFvRmNFc09wVTA0?=
 =?utf-8?B?aW9jZUhPZUlPSFI0djZrb3h0NnRZTGVSTWtsMS9hdHZCc21KN1l0bkZoaWc5?=
 =?utf-8?B?bjZpcUhMSVhQZmJzeU5CNWNWZUlBN0lOVGNieHJ1NkpNREx3RVdjZTNWUHBo?=
 =?utf-8?B?OEpSTS9VeUxBamlxRVFUNUZXclFnZUVQbTU3cWlWUkFwNXAvQ0V0QUMvWjdU?=
 =?utf-8?B?d0RJQTFIVjBBUEtYYTFiR3d0TkxqejdZb3VMRWJrNXFKTG92YVlqK25DUGYw?=
 =?utf-8?B?UVNsZlJQS2FVb1VLTmdFSU1mUnBxUjVPVWRGcDYxQTFWdnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVN6YmhKeEs2YTdqYkkzYU05UlEwdlc2bmdHM2dtaFVweStCcTU1WUVEcm9k?=
 =?utf-8?B?eERVeWh5bGMwSzRZMDVYb2JkZHhYNE5zUmMycndxeXgyOVdwUzdkSEltUDlz?=
 =?utf-8?B?UTYraTFYRjh6OTBYNDhIQUVwNVFzbWdaa2hBZ2U4bFByN1hzMFNWc1BIbGtI?=
 =?utf-8?B?SVYvaDdIVUlyT3BZZWRrc3VKcVg2d1pSMnBXbjcxbVpFelNsYkZhRmxkcTlZ?=
 =?utf-8?B?MWlrZjdzZmo5ZUtyRys1QzR5RmI3ZHExaGtsQ3MwMjM0TU5SMU1WZFdTbnVt?=
 =?utf-8?B?NVBITEl5NWdkWkhSckJLV0hyelUxQnhPUzBWa0Rlb1l3cXdhRENoNEFIQlVG?=
 =?utf-8?B?NFBCQnliM0FqeU03bzN4RGduQjRDN0tUU3hQOGRFREE1UTNLTG1qR1VOY0Z0?=
 =?utf-8?B?L2FhVjRZK2pEKzlUSGx3R3hWTjIvd2drQjlXWHFwVFgzRVZHVkxsQW9zdHBw?=
 =?utf-8?B?c0dieDFpTUd6OXBvQm9MbzZwdzdMRjQvL3RYNHVrSDQxeTNXRFZuaUxuY0th?=
 =?utf-8?B?MS8rUmwyTkFGbWhaRjltS3BLQ2VEZGZ6WCt0OHMwT3V5dTkrdXlsMllaOGp4?=
 =?utf-8?B?OFRmUlhrQXNka0FTdWY3UDJ2b2pqT3RndFdlODNVWWRyTUZsaWYyMlZwTmo1?=
 =?utf-8?B?VWZHcnBNSTZHdW5mTnY4WmNjTFppbXNqdjF3dzJKLytlMk9hby9FTTkwdDJw?=
 =?utf-8?B?c0I3amZTbkpLaThrQkRIMS8vUDRXUGMxOXJZUWpYVTd0WG5hbUVIb2JPalkv?=
 =?utf-8?B?eCs3V1I5VFRSa1NhZUVMZzgvL1JYWmZSUHk0N3NjMm1ld0hyZkY5NTFIV3Bz?=
 =?utf-8?B?VWpzQkUrekx1MTM3c3FETG1JMGZNVFFBUXlTSDVzcldqRklrUFRsaUNERjRi?=
 =?utf-8?B?T2RNNmRXNEIvajdNNTA0dnRmaDFsWE9JKzhlbWRydUdqcDZKcTl5T2xLUDRh?=
 =?utf-8?B?WEZVM0Q5Y0VtSlVJT1hPK0syTWFVTUxlVmxFMW5wQlc3ektqSnhCWHVtdEI2?=
 =?utf-8?B?UzA1ekorVXdjbE00bXhzRUlha2R1WnBUZ05xYklsNlZkMnY2WHV4T0p0YXBw?=
 =?utf-8?B?czJEeWE3VGZYVGxtOFkzTlVGcUNQTUxVNjZlUC96cVY5Z1B0WCtHL3lMMjZK?=
 =?utf-8?B?Q3pGWEpyOUJ1RWdOOHhVeE44UFcza2VlNC9xRmlaZWUzN0U1V3VIdDM0N2Jk?=
 =?utf-8?B?bHFvNXdFTEpUM3NtUHJSVmp2bHpkQnU2THZWMGpKNFFOK0lub0dNWDYrV2dW?=
 =?utf-8?B?ckdsVW9SbjMzTmlqdHFVNlZzY1FRVFVQZHNqWnFmZExRSUJyN3RvWmtqTCty?=
 =?utf-8?B?TmU2bkR4N1JudTVZc2w0QlhYZ1ZjdEVCOWdPZGduWmlpUTVZRXlJSTcrSjJK?=
 =?utf-8?B?dmJJTFkyYzJWdjUyNDhDbGdCejhLY2JEUEt4Y2ViTVNhaHBjMGRKV2N2N0FD?=
 =?utf-8?B?aDdTS2hXYkg2bkN4cWVhNWhvUkg0TFAvbUxOcEFIZGJZSVNFRnlsZ1VwTlQ4?=
 =?utf-8?B?K1VpZnFWN0t4cHduemJidkRPNDdCUFplVENobkprMjFEaSs1amJYOWxzYUxy?=
 =?utf-8?B?YnUwSVJBa2w1Tmt0YUlYNHo5OHp5dWNGd0MzUzFBcS9nTzh0MnNLS0krSFcy?=
 =?utf-8?B?YnBKSDVBRzV6OGJtOWxQV1lDZmU5RitRNXdyM09jMVZvVUNQUU01cmdzcFdP?=
 =?utf-8?B?VTFPS1lqNFdNNW1qSkZZaTVXSGU2ckFlV01CZzFpYXZ6R3M2WWZjZW5EZnhW?=
 =?utf-8?B?cGJXTGFiTjQ5RlF6T1MrK2J2V3dRclZGcTVPYVFWSVlQWGN6V25XdnhZSDRu?=
 =?utf-8?B?UmM5d2ludHF6bVl5R3pmd2tTU25aVVRRa1pjSEVDejkxSk1ya2txTHp4Ry9r?=
 =?utf-8?B?K1NNeklqcU9xS1IxdTJTQWxsaG5jQ0R2WFVLU0RGZC9uZXFPWTM5TGZ2OG1q?=
 =?utf-8?B?NzhOY09mZ3luSEJMd3paZVRhcWJ0ZHNYcHVQZEpZdkRLN3lYYVFhT2dEOXZG?=
 =?utf-8?B?NEdwRU5vSkNNQ0krVDZiWTNST25kTm80K1ZGM3lTamh3ajROSGVYZGRzdVJF?=
 =?utf-8?B?TlQ3aTRueFBGR2FkQUNIOEZwNk9rcTkvVEpabVJzT05jb2ZHdG56ZEVDQm9z?=
 =?utf-8?Q?u5hX/59ovH6C699TabAi8UZrT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b5f29d-ac29-4e95-6d87-08de2015980e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 04:57:05.5208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /AWWE+IvwQAk3qyZbzbWZqqW/bIMHhP7B4HTfHywpwP+LSQyxtZE9NiUf9q0bIUK+5YXVbC1Cf7nrn392SNTDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF9E162731D
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



On 11/5/2025 7:30 PM, Sk Anirban wrote:
> The exit handler was failing to restore frequencies as it was being called
> after the driver was closed. Reopen the driver in the exit handler to
> ensure proper frequency restoration.
> 
> v2: Use global sysfs variable (Riana)
> v3: Remove igt_require_gem (Kamil)
>      Use local sysfs variable (Kamil)
>      Fix subject line (Kamil)
> v4: Fix restore function (Riana)
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15103
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>


Looks good to me

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Please re-run the CI results.

> ---
>   tests/intel/gem_ctx_freq.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
> index 29fdf89cb..bb890d195 100644
> --- a/tests/intel/gem_ctx_freq.c
> +++ b/tests/intel/gem_ctx_freq.c
> @@ -197,13 +197,13 @@ static void sysfs_range(int dirfd, int gt)
>   #undef N_STEPS
>   }
>   
> -static void __restore_sysfs_freq(int dirfd)
> +static void __restore_sysfs_freq(int dirfd, int sysfs_fd, int fd)
>   {
>   	char buf[256];
>   
> -	igt_pm_ignore_slpc_efficient_freq(i915, dirfd, false);
> +	igt_pm_ignore_slpc_efficient_freq(fd, dirfd, false);
>   
> -	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
> +	if (igt_sysfs_read(sysfs_fd, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
>   		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
>   
>   	if (igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf)) > 0) {
> @@ -214,10 +214,17 @@ static void __restore_sysfs_freq(int dirfd)
>   
>   static void restore_sysfs_freq(int sig)
>   {
> -	int dirfd, gt;
> +	int sysfs_fd, dirfd, gt, fd;
>   
> -	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
> -		__restore_sysfs_freq(dirfd);
> +	fd = drm_open_driver(DRIVER_INTEL);
> +	sysfs_fd = igt_sysfs_open(fd);
> +	igt_assert(sysfs_fd != -1);
> +
> +	for_each_sysfs_gt_dirfd(fd, dirfd, gt)
> +		__restore_sysfs_freq(dirfd, sysfs_fd, fd);
> +
> +	close(sysfs_fd);
> +	drm_close_driver(fd);
>   }
>   
>   static void __disable_boost(int dirfd)
> @@ -262,6 +269,8 @@ igt_main
>   				sysfs_range(dirfd, gt);
>   	}
>   
> -	igt_fixture
> +	igt_fixture {
> +		close(sysfs);
>   		drm_close_driver(i915);
> +	}
>   }

