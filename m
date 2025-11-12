Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DADCCFA18
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 03:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EB310E17D;
	Wed, 12 Nov 2025 03:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yu/z7Gi1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CF610E17D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 03:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762918245; x=1794454245;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aw0YVt4kLNmAo2HFFCO0llPeC127QNCa1vDEOjmEJBA=;
 b=Yu/z7Gi1lue2DivIziHvcWcTO1tD/ub0WsN0PLUeT6YnmgY2CJDS/ppW
 UWwFaUQNfH8Mqc41DgBmVq9KO4hQxwisgyy6r766+sS8QxKJDSnfOEBkA
 4iXEEITrwxQxHMYYnYeBBsXjVX4c2ZFAVY3Egw2jwi1xpu7Abh0cnqAiM
 mn1Apo6S4y0dSpJEiESlCKsq71I5fS92J6LgTEan2qGeDkS7RNjGXUekl
 n1vNJ4HVOqOdKqTwCc4E268WmS2RwFiErwdLHefViEy/3kM8gynvbq5/9
 H8UgR/xKUilK8xY9QrFgeT8V+Xc+gpMD3AT2VuZGIOZCODTqau2pr1S3v g==;
X-CSE-ConnectionGUID: +vzXkPwgQBubB4Um0gFfxw==
X-CSE-MsgGUID: rXFg8tp1QxmU0cQt2qJg1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="82607616"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="82607616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 19:30:44 -0800
X-CSE-ConnectionGUID: ABbBW2r7SGqxESViqWmHyw==
X-CSE-MsgGUID: rCmMRoySR2+hylQEKFhyEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="188949809"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 19:30:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 19:30:44 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 19:30:44 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 19:30:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9ramCKYJaNX0OMfJLOAufKCDmT0FaC1m+SXPbLPiyIObuEEtyC8SP3Gh97m8Z1XdS5bwwFkxq9j4tHNu4tVhK+HTtHW9D8Zfcu5vtgs1ouzP0F7w3TZPSZNRrF9arRA/mjC6EQLUdVPQeFXBGg519bwowxucfVp5YMKXxyp0X/3XtzbXM3jQroyIdFULkjKhxHzyjDuewDKu3/HQkAWUkyiiIoEp05ilmtFmCW0BHROKmzvKrKhXk/xmvDt29/I+0mXhEgs1ik+QWCSA7NApMJ5WYcantUiL3dK2DvadyWt98Ds5veLhAcZRGWu9Eg381C2dOJtHl5DOM7JceDABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCppYG99wL6HdY0jMTdDpGPRaDoXcyruTYxJjODU06w=;
 b=jU/Ao9qkq/Mw4fv0Lw9LWHup1Hq6qgbc2OjhNT4euS3iuqFJPzMTc6SqX3e6dhbC3bR3uq/JoxesBM4MZyrqVyA6g6c+mTbdNE9utDjsqW4vzDwUFQobfw2ssNz474b8N4VJjA96gUWDkwFOuHVo2n0AlQCCwiovn41R0meZVdG5uPa24e5NnjATeZht+gpPAVjIfy2P8XeWTBCH3HyZPTNJAejVPz6yu4uk8N++cCw2CfhU7oYwi68kKHgm84z7LqY6XI9/Cn1UPoyuZwp6inuC4mkt4s6nA0/c8kSDAfeSfS2rm7cyaHVk8LCUPxQUVvI1oskCAa6q2O8QvzVtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB6990.namprd11.prod.outlook.com (2603:10b6:806:2b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 03:30:41 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 03:30:41 +0000
Message-ID: <4d0e886d-1405-44d1-be71-115842610544@intel.com>
Date: Wed, 12 Nov 2025 09:00:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Cleanup igt_require checks
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251111041505.2438654-1-karthik.b.s@intel.com>
 <fc6e1ecf-cc4a-48ca-9b53-94ddf3d65de8@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <fc6e1ecf-cc4a-48ca-9b53-94ddf3d65de8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0180.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 075e2fe6-7f10-4853-98a4-08de219bdb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|42112799006|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVh3WThxMmY3YjJPR2hqS2c1YTRFbHU3Z1g1bkpENndMRHJXYlplZ1Robkp5?=
 =?utf-8?B?WnFTNitMbXZscHAyUE1wUTI3NHNLa1NSbkV5UlJzenVwTCtRQ3pYL2wrMEc1?=
 =?utf-8?B?Mmx1bzV0SkN5VnB3Q3gvK2FHMHF0WUI5M3NYY0hpL25nOTl2VUdhMWRLdTRL?=
 =?utf-8?B?WlYra2lxeVV4VC83anpacUJCM0RjYWxIZS9OUVBhb3VuOHN4SXplQVBmTVl3?=
 =?utf-8?B?RHBzYW9oWmlVb0ZqN2FJb1k2TTMrOVo2WE9ia1o1NCt6Uk5SWW5SKy9CaTVp?=
 =?utf-8?B?aElJSExveUVHUkx6RmpBL3RMZ2xBQjRxNzkzb2ErckJwK1JOQVJVVmcydHN6?=
 =?utf-8?B?T0k1VEFoekdQNVpUdE9udFhGdWVsV1lSL3owaHorVDdoYkRmd1VxclhZYkFX?=
 =?utf-8?B?SDdiNmQxUGtaRlI3UU1VUVRDQ2M3WFhQd1ZSdWJrUnZYa1A1MlZSV2xtSk5J?=
 =?utf-8?B?YnNaNEo2ak54WXBMN0pYT1J3WE1HWGJXRmIvVU5Wc2FUWHRtT1l5Z0hKVFE0?=
 =?utf-8?B?QkVJMStlTFBvOFVxRHNnN2NjakFGVmsvQktHdnBreWtKQjBiTEVFRk9kRlRF?=
 =?utf-8?B?bE83cXorKzRVYlpGQkZuUjRQTjlUbXlqbUZLM0cyUWgyeGdBQ2dyWkR5TzJJ?=
 =?utf-8?B?R1kyZ3Ezamx4TGl4SUpWeWtXVnF4ZmhvVkJTRDJBSHRmZDMyOHpmRUN4RXYz?=
 =?utf-8?B?d1JoblAyUWhFKzEweU1BcnZyNVQycG5odlpyT0hISGtFcm9CcVJXeFRGTDA0?=
 =?utf-8?B?MFJxSEhxOXYzaWJpbWV5WXg1ekRlcjdiTmxQMWYrNEUvVkhyK2lOYXlaZ1BN?=
 =?utf-8?B?RG0zOXRVUzc3R0JzZVdZM0h2emlTZk12MzBTWXlWNXN4c0NxQ0NrTmJQeDBm?=
 =?utf-8?B?ZUlZaEcwY2E1S3ZVNTRSc0FRV0dJSU1uZ2N4dG82WGJTUXVRTFM3QWZ1b0Jm?=
 =?utf-8?B?WFFaK1ZVdWJXWnlyelFhNHN1OVRMcnhPKytBNjcwS1NCS2RNQUVEUTA5Y3U2?=
 =?utf-8?B?RENHTUcvYk9tU2RWWGd2QmowRGRINTlVTzlsVjQ1TloreFBUcjJiMmxRTzdU?=
 =?utf-8?B?RThVVks4bUxRWldzQVhCL1VacFROdTNmZG4ycGJpSUVOMFlBNTV4V0ZFQVF5?=
 =?utf-8?B?N2tCWEIyN21YaEl2UDZPTHFTYU5YVEVicGRaT1d4VVpxVSt4OWVsSUlwZXAy?=
 =?utf-8?B?T1kwdTFhMUc4RGlnbFZEWTNQaEhKaU1NbDhVSzh5eERDdUdGcWFXZFBWS3Fj?=
 =?utf-8?B?RWdUZVAxVVFZdUlpSytGMi8wdXpaOHc3ZG5ma29sdjNGbzZKYjgycGxBTkxI?=
 =?utf-8?B?elNlMWRHTCtHUVo0QWxPS21qOXhveDF2bkkrdW05cDI4RTVxaEJHQ1k2QzJI?=
 =?utf-8?B?a2g2cnMwMTBKMzFnM2xpeWw3cThoQ3d6SjhhWFVlc2JNUWdRL1B0MVFIbFZG?=
 =?utf-8?B?K1NqREdySTVBSlV4T2NWNkF2QkFpa0l4dzRWTzFNcXFnNnBMcFRwZmxZVnlX?=
 =?utf-8?B?ZnZUeFlTbzNCNjBTSmcxRTRFdVdFRlVRMGV2dlJEeWNyVnNBS3g0a2h3TlZS?=
 =?utf-8?B?S2JYZUlDTndlUjJxc0xKNHNsSnJYQTJpNW9aS3YrNzVzQWtaTmsvbzljSEFY?=
 =?utf-8?B?ekVueHN3cFptaDZObzhBY0t3WmRjZ054a09XVmV1eXJYWkhvQm5wYWM2cDlx?=
 =?utf-8?B?MlFCaWp2MHR6YkRtNDZwbS9lKzdjV1g4V0pJR0psdDJabjBla3RvdDN2QWQw?=
 =?utf-8?B?N1g4VVAvQzNDeDR1bnc5TG5qOWJVTEFDOW9tVitqVlpjOVFLV0JFSWJtN2ha?=
 =?utf-8?B?elRMV0xLWFFFc2hIcjlRSG1qVmpaUk1mYi84NExOWHByUjREWml5a04rUVUx?=
 =?utf-8?B?ZDRxQXlmbXFrRzMvNjljSXpLa3FnYXdZQmdBRXFMZXpnNXZFNzhxUGE5d2xL?=
 =?utf-8?Q?Axvl4ASZiRTM0GNcCBK8/8DQVtM3Igj3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cC9hZVVSek8xYWFibEw1NFhlVHRPS2dqQVdJYlZCbkl1cTV5c292emhLTzBU?=
 =?utf-8?B?TWthMUpiL1BWd2phMWZzQ2FJbEI1Zk5rWExGUUpsTGZ6djRjZU8zekhQamhB?=
 =?utf-8?B?d09VVys0SCtNWGdGeE9UdkpxNks1Tk55MGxkRTk4blA4Vi9GOXJJNk4xbFBZ?=
 =?utf-8?B?SExwNlppeUNpYTRGK016M0doaDhOSEdRSGVKL2Y4WEZsS25TZU9HeDdMQXVU?=
 =?utf-8?B?bi9DS0YxbU56L3NTbEV5N2FsalB2N0F1Z3hvWXJBbk93bkgwZ2hFNHJtaUpp?=
 =?utf-8?B?Z2tVa3F4TDNHZmVxaGo2bVhUSmdUUmJucm1SeUJQeWllWlQwVjNCakQzTUc2?=
 =?utf-8?B?QmI0bEZsSTVoS2VObVVKdU5QbVF5enJoL2MrQk5jTkRJaWwxTzFiYy9Kalc3?=
 =?utf-8?B?a20rcDJlZWhUbFlRVk1zam1kaXAzc0h1UGZRRS8xTHdwa0ZkVUNqdzlEeHNq?=
 =?utf-8?B?VEZMYm9aNlRDUlJ1SXREblJwR2V3K25oNWtQdjgxVjVualh3ZEw0Qm9QZXl6?=
 =?utf-8?B?L1AxR3RQSW5aUnNqQ3VoOFpUenpveTdCT01kN2MwSWtITGFoZCtIYm9TWk1n?=
 =?utf-8?B?QUErUExGaFZWRE5uN0hnb1RWMkI1ZE9DczZybGpxT3Z4T2NvUWJyem55L1Vp?=
 =?utf-8?B?WmlkNi94VUp1OGdxU1daWjVTakwzbzhabWJYQUdUZnpCMGFUTFdQZ21ta1Nq?=
 =?utf-8?B?d3cySzJQd1hIVVlwaHFKUEZHM0NIOFF5N3RWZ1IvYW1aamxYenRGdkZPU1Vq?=
 =?utf-8?B?aUJad3JhL25HelptUkhUSGNJaFhZaTI0YmUyeDc5amdYcDdEeWtpZm5MR2FJ?=
 =?utf-8?B?YVNTNmFRa3NEUGRtTVR0OTM2WUZzdWZEWEhCMGk2T3JVRU1YRVpaNk9WT05r?=
 =?utf-8?B?OE54eHlZVzZSZ1hERWttaFNrd2tqTk5IOWU4K1hRSG1neGNBNFlnNXhWOUZO?=
 =?utf-8?B?MHhJS1Z0OUtUVEJlcHFKNnloTURIL05xNmtlNElzbTFJdWJWbjhkVlNTOG1y?=
 =?utf-8?B?ODlsVzFGdjJwbGtNOGRVQjR4Z0ZCOGM1dmxMcTArTWNFazZsZ1RwWnA5RnZq?=
 =?utf-8?B?bE9Db20wY1hhWUZiUDNxUzR5VEZhNEJKSE1zTGlNdDBNUEdwQ0lDU2VDTWVC?=
 =?utf-8?B?cmE3eGcvdStwYkR2V2J4U043SERQaTN0Mm41Zm5YVGQ3TElOTzNQSmZ1Mjhy?=
 =?utf-8?B?bEJQM3JVaGU1UThKNXBKSyt6anhnbmtaL1BiSVFWQWVrbmtxdk52aVdpK3k4?=
 =?utf-8?B?MHNjRnVaRjA2UTB0UFZjNjlHdnpQb2pjUGdDMXhkLzFjM1U4Szg5bjJZYVhZ?=
 =?utf-8?B?dmpMeGdkdUVvcTFXTVJJMGFRWmxUWmo4UU1HQ0xGMFBtMUhZUkhPR0xoK3p5?=
 =?utf-8?B?Y3NRTG8xZ2FLWThtVDJ3cEJRUE5uVkd6NS9vcWVBOFFHV3hsejZBSFRsU281?=
 =?utf-8?B?K1dkRy9zTUVmQmJnODFDYXZwaHdLeDhZNmVsV09TaWgyZXVsSFFYNWd6M1BO?=
 =?utf-8?B?MXpjMGdvK2ZhckVlTXA5ZjArRlpFLzZBTng4eEVoK1RhbWU3NXRiUnJ6Rno0?=
 =?utf-8?B?V1V5Y3VhQzdob0JTT2NGVXpXL0wzZzBEMkQ0WGpkaXVYUE5WdzNWMEVvR0tU?=
 =?utf-8?B?cCtaVVRXZDJyT3o4N0FPZzJCNTVOdUdXbFNzM3N6bDZ1S3VnMWxSa0w1Qzhw?=
 =?utf-8?B?dEI1UE5UVjNuSWlJSGU0NVc5TTA1ZFBkUXZRU25tT2V3dFhaeXpCVVdQWVY3?=
 =?utf-8?B?V3ZOMHhSdTNueUt5anZLRFNZVjUrUkc4SnpVNWN2Q3hjOVRuY2p0cTB5cHgz?=
 =?utf-8?B?NkRvOWwwQk1CcmNOdDNxbXRmR0FTSkhIRy9xRzQ2dyt1dmdNam9rWUttMjhE?=
 =?utf-8?B?dlE5RWU5NnZmbWNjTnpJa2tnNGtWM3c0ekpZcWtOMnRFWm42b1NVaitJQzJz?=
 =?utf-8?B?N0w1MUsxVHFqTVpxbjVJUFlMd1B5RGk5SllFeGxOSWx2aUxzN2JLcVlIeSsw?=
 =?utf-8?B?d3lWMVdUbURhbW9UZkVHU3c1eEt0RHkrbVFMVVV2WWxEeDY0RXhKZDBHVXNw?=
 =?utf-8?B?L3pnQ0ZrSlBpRUgwRkZ6UWtIbC9CcEJ4SjRZZHFDdFBlMS84MnZCQ1h0SklX?=
 =?utf-8?Q?irtEofIKWkC7nbrkLgT3gnBhg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 075e2fe6-7f10-4853-98a4-08de219bdb43
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 03:30:41.6449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FH8p87Z7+4qpVdvTuDcY8WekhwWYPlswyM16iXnw4GCASDAWx4dM7rljc90rAYbhuVoLTfTs7ah/g2X1wG+Tqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6990
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

Hi Santhosh,

On 11/11/2025 10:08 AM, Reddy Guddati, Santhosh wrote:
> Hi Karthik,
>
> On 11-11-2025 09:45, Karthik B S wrote:
>> Both the main and invalid subtests of each category require the same
>> igt_require checks. Add these into subtests groups.
>>
>> Also, the variable names used in igt_require checks are self
>> explanatory, so remove the duplicate print messages.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel/kms_joiner.c | 225 +++++++++++++++++++--------------------
>>   1 file changed, 108 insertions(+), 117 deletions(-)
>>
>> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
>> index d1ddbeb60..654ff8bed 100644
>> --- a/tests/intel/kms_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -626,160 +626,151 @@ igt_main
>>           }
>>       }
>>   -    igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>> -    igt_subtest_with_dynamic("basic-big-joiner") {
>> -            igt_require_f(data.big_joiner_output_count > 0,
>> -                      "No bigjoiner output found\n");
>> -            igt_require_f(data.n_pipes > 1,
>> -                      "Minimum 2 pipes required\n");
>> +    igt_subtest_group {
>> +        igt_fixture {
>> +            igt_require(data.big_joiner_output_count > 0);
>> +            igt_require(data.n_pipes > 1);
>> +        }
>> +
>> +        igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>> +        igt_subtest_with_dynamic("basic-big-joiner") {
>>               igt_dynamic_f("single-joiner")
>>                   test_single_joiner(&data, 
>> data.big_joiner_output_count, false);
>>               if (data.big_joiner_output_count > 1)
>>                   igt_dynamic_f("multi-joiner")
>>                       test_multi_joiner(&data, 
>> data.big_joiner_output_count, false);
>> -    }
>> -
>> -    igt_describe("Verify the basic modeset on ultra joiner mode on 
>> all pipes");
>> -    igt_subtest_with_dynamic("basic-ultra-joiner") {
>> -            igt_require_f(data.ultra_joiner_output_count > 0,
>> -                      "No ultrajoiner output found\n");
>> -            igt_require_f(data.n_pipes > 3,
>> -                      "Minimum 4 pipes required\n");
>> -            igt_dynamic_f("single-joiner")
>> -                test_ultra_joiner(&data, false, false, false);
>> -    }
>> -
>> -    igt_describe("Verify if the modeset on the adjoining pipe is 
>> rejected "
>> -             "when the pipe is active with a big joiner modeset");
>> -    igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>> -        igt_require_f(data.big_joiner_output_count > 0, "Non big 
>> joiner output not found\n");
>> -        igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are 
>> required\n");
>> -        if (data.big_joiner_output_count >= 1)
>> -            igt_dynamic_f("big_joiner_on_last_pipe")
>> -                test_joiner_on_last_pipe(&data, false);
>> -        if (data.big_joiner_output_count > 1)
>> -            igt_dynamic_f("invalid_combinations")
>> -                test_invalid_modeset_two_joiner(&data, false, false);
>> -        if (data.mixed_output_count)
>> -            igt_dynamic_f("mixed_output")
>> -                test_invalid_modeset_two_joiner(&data, true, false);
>> -    }
>> +        }
>>   -    igt_describe("Verify if the modeset on the other pipes are 
>> rejected "
>> -             "when the pipe A is active with a ultra joiner modeset");
>> -    igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
>> -        igt_require_f(data.ultra_joiner_output_count > 0, "Ultra 
>> joiner output not found\n");
>> -        igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are 
>> required\n");
>> -
>> -        igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>> -            test_ultra_joiner(&data, true, false, false);
>> -        if (data.non_ultra_joiner_output_count > 0) {
>> -            igt_dynamic_f("2x")
>> -                test_ultra_joiner(&data, false, true, false);
>> +        igt_describe("Verify if the modeset on the adjoining pipe is 
>> rejected "
>> +                 "when the pipe is active with a big joiner modeset");
>> +        igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>> +            if (data.big_joiner_output_count >= 1)
>> +                igt_dynamic_f("big_joiner_on_last_pipe")
>> +                    test_joiner_on_last_pipe(&data, false);
>> +            if (data.big_joiner_output_count > 1)
>> +                igt_dynamic_f("invalid_combinations")
>> +                    test_invalid_modeset_two_joiner(&data, false, 
>> false);
>> +            if (data.mixed_output_count)
>> +                igt_dynamic_f("mixed_output")
>> +                    test_invalid_modeset_two_joiner(&data, true, 
>> false);
>>           }
>>       }
>>   -    igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>> -    igt_subtest_with_dynamic("basic-force-big-joiner") {
>> -        igt_require_f(data.non_big_joiner_output_count > 0,
>> -                  "No non big joiner output found\n");
>> -        igt_require_f(data.n_pipes > 1,
>> -                  "Minimum 2 pipes required\n");
>> -        igt_dynamic_f("single") {
>> - enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> -            test_single_joiner(&data, 
>> data.non_big_joiner_output_count, true);
>> -            igt_reset_connectors();
>> +    igt_subtest_group {
>> +        igt_fixture {
>> +            igt_require(data.non_big_joiner_output_count > 0);
>> +            igt_require(data.n_pipes > 1);
>>           }
>> -        if (data.non_big_joiner_output_count > 1) {
>> -            igt_dynamic_f("multi") {
>> +
>> +        igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>
> Please update the description to modeset on force big joiner> +     
> igt_subtest_with_dynamic("basic-force-big-joiner") {
>> +            igt_dynamic_f("single") {
>> enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> -                test_multi_joiner(&data, 
>> data.non_big_joiner_output_count, true);
>> +                test_single_joiner(&data, 
>> data.non_big_joiner_output_count, true);
>>                   igt_reset_connectors();
>>               }
>> -        }
>> -    }
>>   - igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>> -        igt_require_f(data.non_big_joiner_output_count > 0,
>> -                  "Non big joiner output not found\n");
>> -        igt_require_f(data.n_pipes > 1,
>> -                  "Minimum of 2 pipes are required\n");
>> -        if (data.non_big_joiner_output_count >= 1) {
>> -            igt_dynamic_f("big_joiner_on_last_pipe") {
>> - enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> -                test_joiner_on_last_pipe(&data, true);
>> -                igt_reset_connectors();
>> +            if (data.non_big_joiner_output_count > 1) {
>> +                igt_dynamic_f("multi") {
>> + enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> +                    test_multi_joiner(&data, 
>> data.non_big_joiner_output_count, true);
>> +                    igt_reset_connectors();
>> +                }
>>               }
>>           }
>> -        if (data.non_big_joiner_output_count > 1) {
>> -            igt_dynamic_f("invalid_combinations") {
>> - enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> -                test_invalid_modeset_two_joiner(&data, false, true);
>> -                igt_reset_connectors();
>> +
>> + igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>> +            if (data.non_big_joiner_output_count >= 1) {
>> +                igt_dynamic_f("big_joiner_on_last_pipe") {
>> + enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> +                    test_joiner_on_last_pipe(&data, true);
>> +                    igt_reset_connectors();
>> +                }
>> +            }
>> +
>> +            if (data.non_big_joiner_output_count > 1) {
>> +                igt_dynamic_f("invalid_combinations") {
>> + enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> +                    test_invalid_modeset_two_joiner(&data, false, 
>> true);
>> +                    igt_reset_connectors();
>> +                }
>>               }
>>           }
>>       }
>>   -    igt_describe("Verify the basic modeset on ultra joiner mode on 
>> all pipes");
>> -    igt_subtest_with_dynamic("basic-force-ultra-joiner") {
>> -        igt_require_f(ultra_joiner_supported,
>> -                  "Ultra joiner not supported on this platform\n");
>> -        igt_require_f(data.non_ultra_joiner_output_count > 0,
>> -                  "No non ultra joiner output found\n");
>> -        igt_require_f(data.n_pipes > 3,
>> -                  "Minimum 4 pipes required\n");
>> -        igt_dynamic_f("single") {
>> - enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> -            test_ultra_joiner(&data, false, false, true);
>> -            igt_reset_connectors();
>> +    igt_subtest_group {
>> +        igt_fixture {
>> +            igt_require(data.ultra_joiner_output_count > 0);
>> +            igt_require(data.n_pipes > 3);
>>           }
>> -    }
>>   -    igt_describe("Verify modeset switch between ultra joiner and 
>> big joiner");
>> - igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
>> -        igt_require_f(ultra_joiner_supported,
>> -                  "Ultra joiner not supported on this platform\n");
>> -        igt_require_f(data.ultra_joiner_output_count > 0 ||
>> -                  data.non_ultra_joiner_output_count > 0,
>> -                  "No ultra joiner or force ultra joiner output 
>> found\n");
>> -        igt_require_f(data.n_pipes > 3,
>> -                  "Minimum 4 pipes required\n");
>> +        igt_describe("Verify the basic modeset on ultra joiner mode 
>> on all pipes");
>> +        igt_subtest_with_dynamic("basic-ultra-joiner") {
>> +            igt_dynamic_f("single-joiner")
>> +                test_ultra_joiner(&data, false, false, false);
>> +        }
>>   -        for_each_connected_output(&data.display, output) {
>> -            switch_modeset_ultra_joiner_big_joiner(&data, output);
>> +        igt_describe("Verify if the modeset on the other pipes are 
>> rejected "
>> +                 "when the pipe A is active with a ultra joiner 
>> modeset");
>> + igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
>> +            igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>> +                test_ultra_joiner(&data, true, false, false);
>> +            if (data.non_ultra_joiner_output_count > 0) {
>> +                igt_dynamic_f("2x")
>> +                    test_ultra_joiner(&data, false, true, false);
>> +            }
>>           }
>>       }
>>   - igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>> -        igt_require_f(ultra_joiner_supported,
>> -                  "Ultra joiner not supported on this platform\n");
>> -        igt_require_f(data.non_ultra_joiner_output_count > 0,
>> -                  "Non ultra joiner output not found\n");
>> -        igt_require_f(data.n_pipes > 3,
>> -                  "Minimum of 3 pipes are required\n");
>> -
>> -        igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>> - enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> -            test_ultra_joiner(&data, true, false, true);
>> -            igt_reset_connectors();
>> +    igt_subtest_group {
>> +        igt_fixture {
>> +            igt_require(ultra_joiner_supported);
>> +            igt_require(data.non_ultra_joiner_output_count > 0);
>> +            igt_require(data.n_pipes > 3);
>>           }
>>   -        if (data.non_ultra_joiner_output_count >= 1 && 
>> data.output_count > 1) {
>> -            igt_dynamic_f("2x") {
>> +        igt_describe("Verify the basic modeset on ultra joiner mode 
>> on all pipes");
>
> Same here, Please update the description to modeset on force big joiner

Thank you for the RB. Will update the description for the force subtests 
while merging.

Thanks,
Karthik.B.S
>
> With this,
> LGTM,
> Reviewed-by: Santhosh Reddy Guddati 
> <santhosh.reddy.guddati@intel.com>> + 
> igt_subtest_with_dynamic("basic-force-ultra-joiner") {
>> +            igt_dynamic_f("single") {
>> enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> -                test_ultra_joiner(&data, false, true, true);
>> +                test_ultra_joiner(&data, false, false, true);
>>                   igt_reset_connectors();
>>               }
>>           }
>> +
>> + igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>> +            igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>> + enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> +                test_ultra_joiner(&data, true, false, true);
>> +                igt_reset_connectors();
>> +            }
>> +
>> +            if (data.non_ultra_joiner_output_count >= 1 && 
>> data.output_count > 1) {
>> +                igt_dynamic_f("2x") {
>> + enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> +                    test_ultra_joiner(&data, false, true, true);
>> +                    igt_reset_connectors();
>> +                }
>> +            }
>> +        }
>> +    }
>> +
>> +    igt_describe("Verify modeset switch between ultra joiner and big 
>> joiner");
>> + igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
>> +        igt_require(ultra_joiner_supported);
>> +        igt_require(data.ultra_joiner_output_count > 0 ||
>> +                data.non_ultra_joiner_output_count > 0);
>> +        igt_require(data.n_pipes > 3);
>> +
>> +        for_each_connected_output(&data.display, output)
>> +            switch_modeset_ultra_joiner_big_joiner(&data, output);
>>       }
>>         igt_describe("Verify the basic modeset on the maximum 
>> non-joiner mode across "
>>                "all pipes");
>>       igt_subtest_with_dynamic("basic-max-non-joiner") {
>> -        igt_require_f(data.n_pipes >= 1,
>> -                  "At least one pipe is required.\n");
>> -        igt_require_f(data.non_joiner_output_count  > 0,
>> -                  "No suitable non-joiner mode found\n");
>> +        igt_require(data.n_pipes >= 1);
>> +        igt_require(data.non_joiner_output_count  > 0);
>>               test_basic_max_non_joiner(&data);
>>       }
>
