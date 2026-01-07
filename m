Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E62CF6C18
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 09:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328F710E574;
	Wed,  7 Jan 2026 09:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/cV1swR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F7810E574
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767777307; x=1799313307;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=7Kst777+yCjMwEB2oNuLcJ0GIjKnMw+wuKnv+EuVfuA=;
 b=T/cV1swRlxDZep8BLSjVOwRpaHIkdr6g+oz9pJc8J4vP1wsowtW5wCdb
 ++Rv8YQkah/9uZhe26kaCw/X/5Mp5RNHUx2nrot1uIVOo4isOgnH9E3rc
 xAb2Y1X6HwEhwNGRotJ4mS1QYeyU1dPMNAX1Mpb4BNby73iKsKyFNddS4
 EGeYalxTg+qI95DUUTPIyVBnW+1rHvLJBlJegSuxVlqOGoEoL+lwAYe1b
 LifdtcMgldZN7jMxsJ6u2ZUIKRir9cCyhPnTuSyOx1XKmeG7ubZXBJ3el
 WrI+JLnr/tAnYHgBj6t3xQJDDBS8OWXkHd4KBYiK3B8nK5pEvxsLRCviO g==;
X-CSE-ConnectionGUID: NlVjVRPEQuimE9S2k6DFXQ==
X-CSE-MsgGUID: +00hfrlNSk+yFLnyw+zozQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68882138"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208,217";a="68882138"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:15:06 -0800
X-CSE-ConnectionGUID: oM1BmKYRRZmxfk53rNCjkQ==
X-CSE-MsgGUID: TDdDRa1lSbS5M1VWTktXFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
 d="scan'208,217";a="202782510"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:15:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 01:15:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 01:15:05 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 01:15:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hruVoLhkcrE8O4PsH//9qDEYggwjgbkHJiHmeWU6xcVpo+2Wtepz7Q8lV55G7xA0AvymKlYq6Jcc4ES0ceseyYsJs+AsTodNqnJxexYBNinNkw2Y20oHpFvIgky7dhntQxCVR13YaLuP0PklxUi7MO9mCD1ceFCDqBMZkyCPeKhEiIx3VwYeoZ61ZlbvxaYpi5slqfOggjUA73FSr6fQbXq5fSP4pDz5iXgKDC0sMghmvXvnXTpeJvophIxNF/2lgNB2zRsgsjnLsQpR/8j6/nAvEHv8dcIS2OZB7x1EHkbCbHkUGnkaJ0HYGgVf4iC5AAbKoF+oOTBcnXxbh/f/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDUCsRVItB4HvItVKmm5XjaC/IGuf0lLqldMQk8ihM8=;
 b=S9bDJdCHQo8ahc/kK4/hHb7QGu5kPDfCaX1GG/NgA8E+Aln15yXasYLA8lUIaHhI5uqvOwgBqHMh8ujwNnriDBKWAeGSO+PsdH5olEhSDPGVT9HZewWp/M9yqokTp3oFyHv2F+UJ+374rFBmveeFkWSYYhQ0Ac+77Wx0vDTiMue9dn2CXu2SYdg03dhNRAznTPa7E5PZsyFq9/guQfOoBG7Ugeg2T8jdjjHF/+Jbowowellq0u3Uqaw+DXkP+8BrKZGdHJPvap1Bn2PUyyCciTZfTG3gbIkZvde+lCTOH74hWMxkWkgXyOWf/Gvqb06rUA8anCFQ/gTXOpR6cdEMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by MW4PR11MB6936.namprd11.prod.outlook.com (2603:10b6:303:226::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 7 Jan
 2026 09:14:57 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::13d7:d295:64e0:273c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::13d7:d295:64e0:273c%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:14:57 +0000
Content-Type: multipart/alternative;
 boundary="------------rULC9K0ggAlmR1wjKtl0mPMx"
Message-ID: <be7eb924-055c-4524-a626-5b767c359430@intel.com>
Date: Wed, 7 Jan 2026 14:44:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_content_protection: Split
 dp-mst-suspend-resume tests
Content-Language: en-GB
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20260107051104.108824-1-santhosh.reddy.guddati@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260107051104.108824-1-santhosh.reddy.guddati@intel.com>
X-ClientProxiedBy: MA5PR01CA0201.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::9) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|MW4PR11MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: 9539764f-2f58-4092-c0c0-08de4dcd3a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2dGQllJRndkR3lua0ExcFRkZUdQZVZzUFlsSmpMSE9GbjRhbExoYlBVcHpp?=
 =?utf-8?B?VklxbFhGTHVxS3laNDBLL3c3MlROR3Y2bDF5LzNDQlFGcy9lY2g3emJUTUNU?=
 =?utf-8?B?S1BhQWdSVTF6R2V6eXNFdGF4cTB3YnRtc3BNNkFlNGpHYUY4TWlEeTVzTWpP?=
 =?utf-8?B?K3hmeHVoNWZPdVptdUM1STByaW1DbGg2a1JULytMN1l0UklZbzB3dlNPa3lO?=
 =?utf-8?B?ejdDeUVkTklDa1VzNWR5RjdCWUFjd3puUys1a2lFRTFMN2RFZmlSZ2FTSFcv?=
 =?utf-8?B?V3JOcXo0QzZzcVZFRHF4VmpZcXZUMFNUZkhhdXgwYWlNTEFLSXl3bDBXcmdU?=
 =?utf-8?B?YnExaHI2Qms2ZzZHUXRTNUEzZ21EZ05jM1FtTTVEcXpOUlF2ejF3MDRuNVdH?=
 =?utf-8?B?ZXZYU3F0VjlFTnhRYWk1djBYNk5mVHB0R3BkdTQveTVjK0NxUWwzdTBwdnN4?=
 =?utf-8?B?dWpocVNCVjJINVlPNkZYQnFCam4waGVsOVR5ejJZZHhwK29BN2Q0d1FnWktw?=
 =?utf-8?B?TTRqSHY0Wm0ycm52QlFwaS81S2dPU1BQaE45bENZdG9LT1hlNzNnWHd1S2hT?=
 =?utf-8?B?b0o1MDhPaFFXVmhXd0FaNm5MV1RESTdxanZqZHc1YkJxK2preCtKbEJpN0lL?=
 =?utf-8?B?bnlJWjQyMVFYZTlpSFVyOGJoWFdlaHA1eWFJTmxQb0dvTHZJdU5md2lGZ2x0?=
 =?utf-8?B?T1JGdFNKRGFlS1RlTElNVnljV1ozVkxBSkFZb3pzNFJBUERqUmFaa1pyV211?=
 =?utf-8?B?N2JsQjNTb1NUSzVRZnFhRTV6MW5mcW9uc29zRmMzeVE4TFprcm5LNVEwbGhw?=
 =?utf-8?B?UDVzR1pHRFN3TzE2QXJIdlA3NnFDLzdJODRzVGpKK0d3RXJ1NFVZME5FSFZv?=
 =?utf-8?B?WDhLeE0zNHpxMXdpUGtoeXJMRFdYbFR0RXAwdFhPVllGLzhaYlV5WjRrWW1Y?=
 =?utf-8?B?RjdYTTZxblRodkpFdFBmSmVjSG15cEd1eitkSTBjbVlCOUtUZExBT3lwNzU0?=
 =?utf-8?B?VnEvdEtZMS8vNFJNSDA0enNXMisvYWZoM0dDOXdLNkJsSlpMd1hEelRiSEoz?=
 =?utf-8?B?cFpaVGdhZmNJcTdGZ2tNVzFDc2htWEhSSzVIRDlYdG9mMUZzYjNteXNBRzZF?=
 =?utf-8?B?b3ZXNmZ2eDZjWVdFWUkyMkVGR2VwZkEvaTFnU1d0bDFzOStWU2pmcFFTb3c0?=
 =?utf-8?B?QXVXN0lSS0Z2bXJLYXJYdCtOOVpUV1RBZEg3U2MwS1d2NFhxS0xpanE2VTRT?=
 =?utf-8?B?MERPUGkvQ3laWm1XbCtML2c4UlErai92b0lhemRCWVpvT2hpRU1pNXRRNUV5?=
 =?utf-8?B?Wkl6QmdSNm14QTVFdTlGaWQzUVI5OHhTWjQrQkdPUHcwM1V6aG56RDVNQ28z?=
 =?utf-8?B?d1NWMVU0Y0ZGOENnU3ZXWk54elRtK0xsYTVZQmUrVHlsSzIwd0Q1bXptTm9j?=
 =?utf-8?B?RnRadWp4VWMyVWpoSngwYkVjV1ZTNTJqNU1VZi9sZUh4ZFBYSDI5dmpOb21D?=
 =?utf-8?B?dWpEcFhheWdTeFRycyt0aUM0YWJ5TmJrRHA3V0FpczJRdEpIcnNjNDhFZFRB?=
 =?utf-8?B?SmJ0QXppNlJTVEpTNUhoR2E5VmYvcE5oS280cTNVTXVxM3FzTDRzSDQyV3J6?=
 =?utf-8?B?eHNQSFpqUnlVbFBTeDRncXluOTJjaXlXQU1zUFBuYWdGZkhrc1F6M3hLUHM0?=
 =?utf-8?B?YmRqejdtdTlEcEY3S1YzTkFLbXJZSTVGaEtJWjRqQjJIKy94OER6N0lUNVgv?=
 =?utf-8?B?OHA2Y1FXZXpuKzlhQ3hIN1JWemtQZm1ncnZLUElleUVhRjF3Q29GSnpPYjI3?=
 =?utf-8?B?b2xRQi9zb1VyMW1zVTRXcVd2QlRLVml1ZFRieDNES0ZORUUzR29vKzVBK2ZS?=
 =?utf-8?B?MkxiZ0FrOTljY0wvWkx1U3VEYkN4OFo1M3BtUy9tbnpuY2FhdUdlcCtxWVVP?=
 =?utf-8?Q?Ggc5k1639mccqBL3RaU2fhoylzd7RkcF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGRUQzJyRTV0YkpFWnJOUXE1b04wY1NDVVFocTIzSjRlZm9GOVN2MjlIRHNk?=
 =?utf-8?B?RittUTdHR2VpNTlyLzVVeEJTbTJyQ3NBK2hNUFBESWtmamwweHpKSHhSQzFE?=
 =?utf-8?B?UUZ5TC8yUnU1VGJxOGtIL1l5SjR1MzVFelA4NTZTTjIwR3h2Rk9xcm9DNUVZ?=
 =?utf-8?B?cE9qL3VmUGF5NFNpR2FBK0lXbk05cnBNbXdTNEliYmgrTUtSVFNKQzRDYVg1?=
 =?utf-8?B?cVA1VGgvR3Y2eUJPWS9ObFRXY205V3RNVGx5WlcraWdVZUdZL2F5RExSZ3FC?=
 =?utf-8?B?MDZSNHFSTFBhNit2T0grVFR3NVBhdWlpSFZQRFdKTUxhTTlnV2YxNXVzUjZP?=
 =?utf-8?B?ZE44U2I2V1dydUplMTJhb0xjTmNKajRnc2N3UzZKc3VuVy9MZzZPTzJaQjVk?=
 =?utf-8?B?b1p4UTc5OVdoa1hSZjQ3ZGovUC9ZSkF1Rlg3NHZiU0JBOXlpaG5YSFpEMk5X?=
 =?utf-8?B?a2ZIZThPZUd3QzdsdE14T0pBSmFRTjVPRUhLb3lCOXlTMlBpZTQ3SW5XSGF5?=
 =?utf-8?B?RFF5V0pwQlRMQUFFQXlLV1lmTXdBZm1qeGtFb1FWSnNNM3JIUHJORjI4QjFJ?=
 =?utf-8?B?Y1B6dnZhWS9QdHJDZGhrSXpqdzFIQU9ER05MeURUbGJxcjh6bktxSVZIMWZI?=
 =?utf-8?B?WWhqNHFOdDRKaFlHVFBKbytZS0dXVXVHYzZTc2dkMmZHYWJJSXlSSTVKSkd3?=
 =?utf-8?B?YVQwM1JjeU9WbFRHWnlTL0QxYmRXWE5XakZLd3dGRjJuNFhMT2xLT1dMTUJ2?=
 =?utf-8?B?VlZMRVQrM3VWQ1lyL0FUbXk1R0V1R2RVWXMwNW1nNWVzY04zZ2hRdU1GT3kx?=
 =?utf-8?B?dDdBLzVnM2RERHdyb2R4RkxxV25rbTVBcjBnKytkMnk1Yy9VbFkxYmUwNkJ1?=
 =?utf-8?B?enVYdlgxenJxRGJvWGtaY0U1RUJ5Q2dndTlkNDI5NDhwNjFiSTJteHJwelJj?=
 =?utf-8?B?d0VxZkxhVjBaUjZtL25HY1pXK20zVU9TNFlBd21sbVdiM3hRNmg4b1lxWmgy?=
 =?utf-8?B?TEtzSGJUVjdWTjlTVlhJNFU2R0svc0tMTXAzS2NGd1loOVVkMy93bnRkb3dV?=
 =?utf-8?B?NVVxOGRxUGJUOEMvVmo3TVdwcXJsQThERHZVelFyKzhJblZtQmhtcS9hamw1?=
 =?utf-8?B?MjZtZktOQ2M4ZFZENnppSGxueFVnazY1YW1rVlFKSG0xWVRvU042ajlLa015?=
 =?utf-8?B?UWlHTlc2NWFUaU91TmRWTWxCVDd3bHN4TWd6clZzVGd2UURsUVpCdy81c1h4?=
 =?utf-8?B?K0FHbmwydkczcDl0azRVaUJ5R2VQYnpYKzNMZHd0cU41c25EdlZJbzZ4Uk44?=
 =?utf-8?B?bVlmMm9nVGtDaFVhNzdkS2UyK05qZGxyRU9QN1hEdjFzdjVEQXVYSEdUdVdt?=
 =?utf-8?B?TlVFNUdUazJpUzlKT3BMSTBSQTNzVVZvSlk2Nit6Ulk0OVh4Q2ZGL2FKQVE1?=
 =?utf-8?B?UC9IRUJNcS9iVHlZTURHR2RDUTNFZjU4K21JcEZaeTEyVGhNRlZCMWxQa2U5?=
 =?utf-8?B?cFJTMEE5YXAwNW11SWFuT2c5OWp2bm1acitLVnd4YkxLWTN2d3JXbm5ZY2pN?=
 =?utf-8?B?WkY0OUljYmVJRldzaUUxaWlnMU04YzRNTytOQ01ZS3B5S2xqN1dpRE9nOWFh?=
 =?utf-8?B?MGNTZ0VTeCs4d3pSZzdzbVQ5K2lJVDhMRjRJNnBtN3VvcEkwOHhkOHhXc1NN?=
 =?utf-8?B?MmhaR3U5RVlJRXRocmUySk03L0N0RVFodmlORkVMS1RIc2dwYXBEaEMzd1NI?=
 =?utf-8?B?Rm5CTndXNnRhVGtmZEhQZGtJM0pNUHNHditSajZsWXo3L1ExU2svMXhtV0ls?=
 =?utf-8?B?aTRpeXVsWFliU3FqNVF4ZTI4VWNLVEQ2SWM4MllaTTl3Y04xR2NWb1p2eTl3?=
 =?utf-8?B?M1ZBNk04NXFuV01rUk9zUGxxbWZhaUhTT3FzTHY2OE9VbnFhZXhPMG9xdkdN?=
 =?utf-8?B?YzFKdG5SQ1Uvc1RpUWMrS1pwMElBbGxKcmxsQ1VJbG4xRFdlS0NWU1c2VGlz?=
 =?utf-8?B?WFlubHpLTUhia29uM3g3UEV3Q1JUSTZseWJEbmJaTjNjL2RSeG5oNVNvbzZr?=
 =?utf-8?B?d2pMQjhJN0FBa0toUWI3SmRtL2FYWlBMTUg4a2x2TG5BR2w4K25oaCtpOG9a?=
 =?utf-8?B?eWpKTUMwR2NPWktWZWxlTnJjbTg4anRqNHpRWEY1azQyRlZMQmJCb1Nsdzc3?=
 =?utf-8?B?YW5FRE5LN204dmJQYlJnR0o1OVNwK3pEZ0xrb3ZlNDhrV2N5K1dxUE1tME42?=
 =?utf-8?B?NXc0eTM2YjJJVUtqb3Q3YnFMRU1PMWIxL2YzS3JJNG0vOHZSRTh5SDNjcGR5?=
 =?utf-8?B?b3B0alZFL09vVUhxVk5aQ1JGeDlRaVpDVG9rc2p3dEdXZy9FaUdFUFZUWG5U?=
 =?utf-8?Q?pvvKpPM3VuDo2NsY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9539764f-2f58-4092-c0c0-08de4dcd3a15
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:14:57.5152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEUc5WN//7IolAzqiJuG4grIEuG6vEEDnHU9/6qHKfAg5WoH23rTON00dcd1/Dm/wZEwg4/dLif4tzBAPAirNJPCgezGP88A9INPhnIakJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6936
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

--------------rULC9K0ggAlmR1wjKtl0mPMx
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 07-01-2026 10:41 am, Santhosh Reddy Guddati wrote:
> Split the dp-mst hdcp suspend resume tests to work on sinks that
> supports only HDCP 1.4 as dp-mst-type-0.
>
> For HDCP 2.2 specific, add a new subtest dp-mst-type-1-suspend-resume.
> These changes allow testing s/r on DP mst configs regardless of sink's
> HDCP version.
>
> Signed-off-by: Santhosh Reddy Guddati<santhosh.reddy.guddati@intel.com>

LGTM.

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> ---
>   tests/kms_content_protection.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 377bab9a3..7c459978b 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -87,7 +87,8 @@
>    * @lic-type-1:   Type 1 with LIC.
>    * @type-0:       Type 0
>    * @type-1:       Type 1
> - * @suspend-resume: Suspend and resume the system
> + * @type-0-suspend-resume: Type 0 with suspend and resume the system
> + * @type-1-suspend-resume: Type 1 with suspend and resume the system
>    */
>   
>   IGT_TEST_DESCRIPTION("Test content protection (HDCP)"); @@ -1011,8 +1012,13 @@ static const struct { .cp_tests = CP_LIC, 
> .content_type = HDCP_CONTENT_TYPE_1, }, + { .desc = "Test Content protection(Type 0) over DP MST with suspend resume.",
> +	  .name = "dp-mst-type-0-suspend-resume",
> +	  .cp_tests = SUSPEND_RESUME,
> +	  .content_type = HDCP_CONTENT_TYPE_0,
> +	},
>   	{ .desc = "Test Content protection(Type 1) over DP MST with suspend resume.",
> -	  .name = "dp-mst-suspend-resume",
> +	  .name = "dp-mst-type-1-suspend-resume",
>   	  .cp_tests = SUSPEND_RESUME,
>   	  .content_type = HDCP_CONTENT_TYPE_1,
>   	},
--------------rULC9K0ggAlmR1wjKtl0mPMx
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-01-2026 10:41 am, Santhosh Reddy
      Guddati wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260107051104.108824-1-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">Split the dp-mst hdcp suspend resume tests to work on sinks that
supports only HDCP 1.4 as dp-mst-type-0.

For HDCP 2.2 specific, add a new subtest dp-mst-type-1-suspend-resume.
These changes allow testing s/r on DP mst configs regardless of sink's
HDCP version.

Signed-off-by: Santhosh Reddy Guddati <a class="moz-txt-link-rfc2396E" href="mailto:santhosh.reddy.guddati@intel.com">&lt;santhosh.reddy.guddati@intel.com&gt;</a></pre>
    </blockquote>
    <p class="MsoPlainText">LGTM.</p>
    <p class="MsoPlainText">Reviewed-by: Mohammed Thasleem &lt;<a href="mailto:mohammed.thasleem@intel.com" class="moz-txt-link-freetext">mohammed.thasleem@intel.com</a>&gt;</p>
    <blockquote type="cite" cite="mid:20260107051104.108824-1-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 tests/kms_content_protection.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 377bab9a3..7c459978b 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -87,7 +87,8 @@
  * @lic-type-1:   Type 1 with LIC.
  * @type-0:       Type 0
  * @type-1:       Type 1
- * @suspend-resume: Suspend and resume the system
+ * @type-0-suspend-resume: Type 0 with suspend and resume the system
+ * @type-1-suspend-resume: Type 1 with suspend and resume the system
  */
 
 IGT_TEST_DESCRIPTION(&quot;Test content protection (HDCP)<a class="moz-txt-link-rfc2396E" href="mailto:);@@-1011,8+1012,13@@staticconststruct{.cp_tests=CP_LIC,.content_type=HDCP_CONTENT_TYPE_1,},+{.desc=">&quot;);
@@ -1011,8 +1012,13 @@ static const struct {
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_1,
 	},
+	{ .desc = &quot;</a>Test Content protection(Type 0) over DP MST with suspend resume.&quot;,
+	  .name = &quot;dp-mst-type-0-suspend-resume&quot;,
+	  .cp_tests = SUSPEND_RESUME,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	},
 	{ .desc = &quot;Test Content protection(Type 1) over DP MST with suspend resume.&quot;,
-	  .name = &quot;dp-mst-suspend-resume&quot;,
+	  .name = &quot;dp-mst-type-1-suspend-resume&quot;,
 	  .cp_tests = SUSPEND_RESUME,
 	  .content_type = HDCP_CONTENT_TYPE_1,
 	},
</pre>
    </blockquote>
  </body>
</html>

--------------rULC9K0ggAlmR1wjKtl0mPMx--
