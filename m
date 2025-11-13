Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0475ACD5BCB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 11:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B307F10E6D8;
	Thu, 13 Nov 2025 11:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="entBMCtK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB6F10E6D8
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 11:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763034546; x=1794570546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vvjL2TjceMsFvdTRLO7+tm41WxSDChN2Fdpetzor8Y4=;
 b=entBMCtKfbLYX0BFGCaJdlT1ZtTGXtTpoIDnS4nwdD4yfz6ReqFxZRUH
 fibwy9N/ZVaSk6B0KQePqr/kA6jg330b1hDnj4mlL6JutO7eX1mSCN15R
 0X3KmkUNMh9QVpYO7Silp7i7nhVjTD05Nb1bKxezuJsjKacH+p7i7xGUh
 NOHfMRG5cL7x1hHIBdSjaUutyRZOqTqy8C1x9LPFWbPl1rhefzwJiChwb
 3yubOaV/OxjkhGYGe9gpwvKPu/eAMDpok1L5br8qpHLshBEHDBA7ckBXT
 QwvrasQM5YGbHcLFdG308oKLD4gnY0+xKSxDY0qJpVTgo3zOmUdaPiFKe Q==;
X-CSE-ConnectionGUID: BYo42pKsRbS1yvRHskhhgA==
X-CSE-MsgGUID: lcnrq0FLSj2I033x/pAP/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64819497"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64819497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:49:06 -0800
X-CSE-ConnectionGUID: T/QLfc7wT9KSSDjIwrDUTg==
X-CSE-MsgGUID: 42LNEgshTXOOPagt8mlJ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193733064"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:49:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:49:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 03:49:06 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:49:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRDyISNPvtPBe83ISK60OVhUmVBxDaLjqAcR3g5M4kO8cIPdIZ5WjAhQbgoEYPIaH7k+p1fnKKiLM9831eEvKYgS1q7FUZks0dbS87ULUiX3rDtD66bAiNb5FpDjzHbKOI2tHv9dqn/o6iPU5btVXb06uNsnu8LsfUX0ChHR3pkA2j0J2UNEWNNfkCCZYla09fgvztvkI8J0zT51fHvzaTA4yFdAUDLDjqIOvMJr03x20lxV/MdlTyEzXLtoMnK4gc3vFb9IrvObWKfziObl7v0MHbJwCbH4J9HpgTPGB6iHdxcg2HmN7Y7KYou4YDT1e5+ceJdvER69x4pIzZznpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRUS1bH32H6m5TXl9CC4r2L2EA15OaTciAKxJLOVJv8=;
 b=aN1CYOqZ+gAQA2bp56TefxgWZ3Pn9VVpxT5vflViKVun4gtLiYgYqJVUCMIWws6RGeKdwnU5ZvrRIxdI2Tcj+LZPX+KCfpac0QzAO45aWE2PdVzBr6/zsXK3FZU2q7n+h/fXS/MSJQeqImPC6BUQdqquSKXZ8jXRDLwoFhkyb+i63o5WyIMoauU+0/D+GhFKWtN3grwHoymTsYRFSr2C4QyttRZPfyLiliqaobU01WkIVzlnDUALTC9eCGGipI7mEM2GuLHT3/emG62AzlOHr/yTFy9rwab8Mnx39UA4Cvmx6/wLflILrGng429oeTuzDm/jxX3RXxYbSiOrIrzpdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 11:49:04 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 11:49:04 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>
Subject: [PATCH v1 5/5] tests/intel/debugfs: Move VRAM MM checks from root to
 tile-dir validation
Date: Thu, 13 Nov 2025 12:46:15 +0100
Message-ID: <20251113114615.3736269-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
References: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 53062dfe-b8d6-47a5-998c-08de22aaa4ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R250NUhnRTh5T1dTVklZZWU2dWIxamo2U0c3b3RVd2FObDJEN2ZublhKQ1p6?=
 =?utf-8?B?YzkxbHY0cEFQNjkrZ2ZSamc3NWhZc2R2R3JLZi9nVE9hZkNrYzRRdFNLenJ5?=
 =?utf-8?B?T0x1SkpCU2tiU1p1TFo1WXpLOC9XdmcyTUh4ZXZQY21Bb1I5Y0J3eXJNYlRl?=
 =?utf-8?B?Q2s2UEgrcVlJRVNWeEdJTE1WUHhBTHhSTVdFbCtEQkJaU3cxSzhQaHJ5TkE0?=
 =?utf-8?B?VEhCYVlHa0tNME82VE5MUFdEWGprWFphZWNiOTA3eTdZM0xLMlZsREZ5QlZ3?=
 =?utf-8?B?Q1d5bmZFYVhnRkdkc3pVTlJldFFpb2pvWjM2NkhRbXE4dUEwenVxVUJ3QUhP?=
 =?utf-8?B?RUttQUlKdnJGc3VhdFdTZ3VuYkovYzIwTWlUZlNDVkpxd0xmdW9FOFMxT1di?=
 =?utf-8?B?U0lkeGRXTkd4bGdZaXZuVTRpNnBlMEpRUzhTRjEwU2h6Y1l0LzdZRjdYekRV?=
 =?utf-8?B?ZXJMdUxYNHBwN2tBaW5LRkZvK2V2RXd5cWhxVC9MWUFnTnlNUkt4eCs2Yk1M?=
 =?utf-8?B?cFRFeGhINkNtTVozdW5SbkNrZHNQaTR5dHpJYTR4T1A2NFNxT25zcFN2Y1Vw?=
 =?utf-8?B?ZEZaN0FiZUdxR2NIbDNnTGRnOFVRcW56UC9kcXZTY1FLMjUxRFh4d0tMQno3?=
 =?utf-8?B?aGNISHVZaWN0NEUvQVdldzZkbndNUDJvQkxmTkRtL0huVi9CU2RWK2lWcUxr?=
 =?utf-8?B?MzUxZG1JOVFNalN1Rk5iSGY1eGpGRGxEcWMzYSsxOFhzS2VUYU9BbGZ3Nkxz?=
 =?utf-8?B?UFhMQ0VYUGRqT0psaWlRaGFMZzRmcC9NWG1PK0RwL25GMUhDN2F2VW05bDZJ?=
 =?utf-8?B?Q3ZQUktTbGpkbXRYYzJSMlc2eHlIQjVvd3Z5WGdWY000Sk54eTFYZmQ3YXpB?=
 =?utf-8?B?WXdYUlVDSEQ3UTk1LzFEQnBHVTEvNnB2ZHFiQUdZSVJtUWxadGxYTVlTNUR2?=
 =?utf-8?B?L0hzWWxzWS9TUTJBNytWQVNzaVVPeHV3Y2RNZXdEL3BWTWpsZlQ1Q3RIaEMv?=
 =?utf-8?B?cUcyZTZscndNT2w0SXJZSTBPUGtJUk40VTloaks2WGliVzdRM3laYlVrQ2p5?=
 =?utf-8?B?dmtRZStJbFM3MTh1bG1qR05xZ25HSlFGVXp6VDIxaGRqMzlEU1NZaUFXMFps?=
 =?utf-8?B?WER4TWJHR3QwT1FveFBVVEp0c3hDaTJQSzhRWkNqSWF4RVlOMk1VOVdlYXVj?=
 =?utf-8?B?cHovZEdqcjdYMUdDL2NMb2MwSGJJYlpNMURJWHhXbEtZRmVqbk9PcWNUQ3N3?=
 =?utf-8?B?eGdKQXVQby80VGF0ZSt4TjVBaFkycmgxY3p6a1Zvd0xSc1NFR0VUSXViQlhP?=
 =?utf-8?B?TjVtZmhaV0s4eUhSRStjaStFTnRsNDJDZUhjRm9VSFRNM2RGNDlKMHhxdE1j?=
 =?utf-8?B?cTJWQ1BvRXo2V2cybmkzOVgvTDdOeFB0TkpFcytXMStYUTdyV3VhaklPRjNo?=
 =?utf-8?B?QkEwMGdiTmdmY0QvMWJRZnNlZXlzc3QzTG4wZHJiKzRnSnhwTUlnMEdrS0Nt?=
 =?utf-8?B?bjJXS3d1bUROMFZHZktVT1NLZ3RqcWsreEFEblo3VHoxZlVvTE5XcFFQUHNL?=
 =?utf-8?B?SXNORGhUWEVwWGQ4OWMwbE9URkdwL3dDRmowUzdsbC9IaFk4bUluWW1oVTFW?=
 =?utf-8?B?RmVYVUdzMzNsME1DVlJwMVZqbTJ6Tms5QnRLM1NhT0F0aEpuMllxemRDczdy?=
 =?utf-8?B?amxGY1MyUitEeFM4V2FhWVZjaTVTR2J0aGVqQVhZNlpGeVVCbzl3ajBCN2hj?=
 =?utf-8?B?VTF0Q1dOczZ1T005dWhxV0ZBcFc5dVVJMDB4KzAyUE4yVnkxUGhVQU5pcldJ?=
 =?utf-8?B?NkJvUGhQdS9sU2dwTmJLdUg0YkZwcUpNK2F6RXNWNmd5WGpmNjdLbUY0QnQz?=
 =?utf-8?B?UFRSSE14QmVuWmREVlFkelZOVmZlWXlrZkcySUJVa2gzb0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V29aeEVmQTUwck11WTM1YzluTU54dncxUDQwWG10S0M3MktySndqOU8xZmhS?=
 =?utf-8?B?emxjRDYzNVptOE5mQXlMOEdBYkRYNzdaRC9vc2FNTW13YzRxbnR0Ni9TSis2?=
 =?utf-8?B?ajVweGYyTjBNUUhIRGNldW1iMmdvVEdPV1pJUks4eHQrUjN2ejJQK3NPeFI5?=
 =?utf-8?B?ZElCQ1BObE1IancrdVptWFF3QW9ncldUZmxLWWNBVTJ1dEN2ZE1ybWNuMFlF?=
 =?utf-8?B?QWJnZ1hyWmJTbnQ1aGllRzc2ckVMdForamRwb3lIZUphYitHRXozZWxPaWhD?=
 =?utf-8?B?dUFOL1VZbmNQcXVTMGxkaTBOVzlDL0FqMmE5N2swWmk1SXlhT0s1Y3o5Tm91?=
 =?utf-8?B?NzhMQTFmQ2JNQ3B5cWR5QVJObWVhZTl2Z0xMNC8wWlI3Tmk1aVo2QmVuUDhR?=
 =?utf-8?B?R3VySHExOUNzQmkxd2dQY3lmcjBnamZUWCtjVDVwd0VxRXJucTF0dXpCZFRT?=
 =?utf-8?B?QWJ5M1J4cmREcjJxSk55RXVGa0JSeStFMmtKSkhXQzVoYTA0Q0tIS1ZNS3Zy?=
 =?utf-8?B?U0Q0Ym5nb3hRNmZSL2VBNnQyOTNDbDQzc1I0Y250RWxkYm1iTW4xZHpWUS9k?=
 =?utf-8?B?eDBTQVNpZitJN0psWW1sdENyNzN4VFVjSVpvVHp1NDI1VldINnlZdGY4RWhZ?=
 =?utf-8?B?SnYwemdiR3FzdWFmK1dTbHpYemY2Q0pyVUZtSnMxR2ZOSzhOZzExdkxXNlA0?=
 =?utf-8?B?T2w2YUdJcjdVaDl6WERxSFhtcFd1WXU0eHRxdXhwSmpRbDBqZ1MvTXJiK0F5?=
 =?utf-8?B?OHdWWFBPL0VhaGFDeFlpUXd6TUUvdDUrekYvZWZYTFd3VUlkcUJaTnBDODVx?=
 =?utf-8?B?MUM0REFJdHU2cjhlK25rc09DTEtUdFkrSWNiaTZvam81ZGVQbXBsRzk1Mm50?=
 =?utf-8?B?dGxEOTVnMVQrL3VkUHFveFNvSWVYV1R2SUM5ci9YMTJmdVBlNDNiMjJjS1hQ?=
 =?utf-8?B?N0NTZ1BYOEEySzd6dXJtSnFLejRWVzVQRGpSNXVydUNqZjdMM3RXbEVVRFVm?=
 =?utf-8?B?UFhKdS9oTUFWR0ZYTDc2YXN4ZGh2cWplTy9lbGdyc3JHbUdQZXIraEttSEVx?=
 =?utf-8?B?bDA5NmlTR0x3N00yNVlGYkZ3dkc0MStsZGpkTysvYUFkeWdqZUZSM3p3NVZq?=
 =?utf-8?B?YkRHSHJ1a0ZkOXFKUE1JMXpacHVZYVdZTGtPcCsxT1NyZGFteXJXRGRBRDl5?=
 =?utf-8?B?UXkwcmI4bm9PZXVYU2NwczUxTmU2cWQwT3A4QzgvMHVLZm0xcjZaSG5aN0Zh?=
 =?utf-8?B?S0dTOExEZjVXdDc2cUY2bG1HT0tNSUFCbmRqVFVxNlE3MTRLTkx3Y2cydERv?=
 =?utf-8?B?Q1dFejNkZExvYXhoRGVuY2Fqcnl3ZjRKbUEzNEpGNmh1SFNyZ3RTSVVvbEd2?=
 =?utf-8?B?aWNDdituTFhWNVp5S0hzSGk1RVVxczBEZ2R5WmlRbjl0OHJXK01VN3pqTzBW?=
 =?utf-8?B?aWJTL3ZNOVpHWVRMUEJKMXNFdmdZVmpUZ1AyZ1hBWWx4Rzl2Y081ejJvajQv?=
 =?utf-8?B?OWJ1UWVPbE9NUW1RRE1rRjNwNWRRdDJacUZFSFpsRnpnVTQxTHZTTFBRN3ZU?=
 =?utf-8?B?RkwzeVdGcWZ6WENrTG16VnAzNVBvSUcvYWxNTlBBenkyeGc3N3FGN0xPWjhB?=
 =?utf-8?B?VWc4VkxjR2JCV2d2bStZZzFsMFVSTHl2Ukt1RmhYU2oyWk41QlRSQzBDeTBl?=
 =?utf-8?B?ZDAyWUxicFpna0VpK2I1ZG1udFNQK2NuakRFMHM2dUYzMk4vNkU4V2VyRVQz?=
 =?utf-8?B?Z2txNlAyd005TFhOc3NVQ1V1bktONkpGZS9TekFXRGhmY2NCemtveUF1YitX?=
 =?utf-8?B?elFYWGcyRlJtZXRzb051RUhtdjFTblpCZG43bk1rWkM0VE5OeWd1eTJVUEJh?=
 =?utf-8?B?bHcyMkJzTFRYaWJIQjNPSE8xWjdnREIvaHBQR0xTTFJ0U08wKytZalRianpk?=
 =?utf-8?B?dlpwS0RocXlQbWw3VGR1ZS9QU0tXSk5UL1JxRGxvL0hTQUJ5VC9DRWtUaVVF?=
 =?utf-8?B?N1ZKTy9TZlBjZUpYbnFkMGFRalc1TC92UTVrMk9FUmUyT0ltSlcwT200ZmRp?=
 =?utf-8?B?eFBKdUZQdlNWWnRtV2JmVFdUdzZWOVZPY0g3OG5RMmxJVm01Z2VVZGErU1dj?=
 =?utf-8?B?ekpmU0dKWGJ5OTM3dTVVamtoendmdS9iSUdsUEI2eTIvSFBoUTNmYVBWVkx5?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53062dfe-b8d6-47a5-998c-08de22aaa4ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 11:49:04.0043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOG8hc9eRCQC5ziRzlUutdZK+2zeGUdnwi6G+XNo9Sk8uEa+Ked5jZslAuv2x2QwLtFP4WfR6UMYoGyT0Y7QyoZIgr9btoZrmLbOOCfM1rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's adjust VRAM MM debugfs validation to match the changes from [1],
which move the this debugfs from the root level into the per-tile
directory.

[1]: https://patchwork.freedesktop.org/series/157089/

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 2824a48fa2..54501e63c2 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -245,7 +245,6 @@ static void test_root_dir(struct xe_device *xe_dev)
 		{ "info", O_RDONLY },
 		{ "name", O_RDONLY },
 		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
-		{ "vram%u_mm", O_RDONLY, has_vram, tile_iter_mask }, /* vram0_mm, vram1_mm, ... */
 	};
 	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
 	int missing_count;
@@ -275,6 +274,7 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
 	const struct check_entry expected_files[] = {
 		{ "ggtt", O_RDONLY },
 		{ "sa_info", O_RDONLY },
+		{ "vram_mm", O_RDONLY, has_vram },
 	};
 	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
 	int missing_count;
-- 
2.34.1

