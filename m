Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012C9C3ABB2
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 05:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7247710E0C7;
	Wed, 28 May 2025 05:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJhIcdVg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8960D10E0C7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 05:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748409025; x=1779945025;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HpK/et+UgR9lcydRtriWTTolW9K/f2NL42Vy7uvvxX4=;
 b=lJhIcdVgkTw62cnssbLNPSIqkW8r7BY2HBIAOLdiacA5myG3aiSEMblj
 mBx5rx++nTmIOLj0Clzi2dql4aSiQpn6UlIk0/E1SJIlZ1lvB2yNDTsJU
 upzhk36cLp3/IHu/SQL6Al9389pkxY0Y1tILIm/48PJ8HAyorRQ7DzzBO
 MP16jQUK8zrHitBqq4dPxflEYLcjoDSzCUaVhCdxKNPyO6PmTgkDYnB6w
 7FY2CPt94VblYPNl/bKtqAx6rbk5lFM6FE5bzsCsqyk8UbB5SXSSICMQM
 BIIQc/NC7Pl6L7IToec1iDUzczaOA5J55wX2WiYI5Uc6IKzetHWOcbYne Q==;
X-CSE-ConnectionGUID: awG57tnAQ9+LXdSf1Ldbrw==
X-CSE-MsgGUID: JnpWirFrRxuux079fVgnyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50527327"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50527327"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 22:10:23 -0700
X-CSE-ConnectionGUID: PkxGLSWuQRGMDTIE8BVJKA==
X-CSE-MsgGUID: 2HvPXPf8T7aiBhnayjxCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="144094202"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 22:10:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 22:10:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 22:10:22 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.57)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 22:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhwgL3a6FUzgMoVKWq7TN/DhFzNMPegeH76dboSseCOAi8JX/FddsM9cb0B+ICSFBpv290AqOK46MJM4u0J88QGxmvsxFo1BjB4ReB8hRnBI87DrCl9v+06ZtJ4FCgSEQ51H2rCQB+ZJD3f8li/+VWQJ5MNla3BtqQ/GlNSbaLONegEPEDNF6xksLbxFdFdAanzY2DKGt5DZn14f+KXLOBKD8ZqU4+9B4cggBR6QBAkCWvXnaoAg3rPDo0hD+4g2OLj4MaD+hiEaVPoXBJklQow845EcGrvQTcEaNpFPiBcWFvUIWKV2O5s3Xv2TAq75PxAFjmzlscgpRuCW+tZusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xONiRtYLdOlqXHRh8poYhEW5tOpSWGAXQF3CX6A3EzQ=;
 b=eZAZgyMR8hdQ7pqIenXdTB6SSQoAfwh8qyhwrwVL9w1qDUg6PoXdQlIKF7hgzas6Qzv0LsDG8wH2bTWzSUtVwSE3ZWUVXa0fdSmFh74ea0Z8pDXYeycufMop4PG135Od2NqzSYIl+peDMjBXnGfNjm+mgMCP/Bfb9h+BEeINxTFOxfe3L57UchrCsgw+u/HZBz8MPRgSWXUZvZtQtAxAiLYSdxRxbqPu1zysk+HYXp+mID1uWtzrQG+wYwfQPC2BSt3wYn0alEz8DduHacQikHpIWuXOJLP5MQYyXNywRfn3W+hR59FpbLOz/SuON4nciTEnLLMKitKLB0j3o/Amrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPF867D7FF5E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 05:10:20 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 05:10:20 +0000
Message-ID: <c58eee88-f5db-4a19-b78a-7422c3ed4f65@intel.com>
Date: Wed, 28 May 2025 10:40:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/2] tests/i915/pm_rc6_residency: Use sysfs to achieve
 peak frequency
To: "Anirban, Sk" <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20250513183726.2118105-1-sk.anirban@intel.com>
 <20250513183726.2118105-2-sk.anirban@intel.com>
 <a2a6c9d7-ba95-4553-9f72-e76491ef1c5c@intel.com>
 <795d88b4-2d5c-4e17-b021-b5d88e3d3a0c@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <795d88b4-2d5c-4e17-b021-b5d88e3d3a0c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPF867D7FF5E:EE_
X-MS-Office365-Filtering-Correlation-Id: 651500bc-8a55-4eb3-eed9-08dd9da5f120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDBxL1N3T2xEL3B3QzdGSzU0VXRkL1VNNmtrVVRsQnNLQ21WNmVERU1ycDRn?=
 =?utf-8?B?SmZEQzE1dTB3Q2NZbGg0MDduZWplWmsvY3RicXovOTBBZlQzejlValBEaVNh?=
 =?utf-8?B?UURrbnNCKzRJbEZxT1F4ak1VTWVVZFNSeXBFUWNyelNFSXZNTDROUm9XSU12?=
 =?utf-8?B?K2FFZWpiU3J2bzNnMEJZWU9IbFRtWkdUazdDSGxzZUxkeldmWHg4aTl1amlj?=
 =?utf-8?B?Q1RrNXNFZ0JaSHJLcExKUjhKMUhVdjBWNVkvQUc5VERnMlNheWl2bXpvVVpZ?=
 =?utf-8?B?ZFRmcG1UckdxSDcyajJTS1pzMzlIaVRUbElSRDNNSnA1ZG5vVlFnT0VJYXRh?=
 =?utf-8?B?c2ZDby9PV2hwZGprL2RKdFlyR09oemh6OENLYk5wbkEvOHNkNDFtTTFvSzhQ?=
 =?utf-8?B?QVBkWVBJU2JiVjRFdVA1cjZTelVBS2FBanVtaVJLUmJHMWkwVDZLYVRzdEJY?=
 =?utf-8?B?NUFXSDh3RVdMY3RTYTBIN3pxWDlIVWJBMWZQN0NqcnkveUZCOWtWd3NqRkkv?=
 =?utf-8?B?QzNtRWMrYzIzR1dRQnNSeDQwOTArS3ExWkhYL3ZPeHRXKzlYcVdzdkhSMWZV?=
 =?utf-8?B?QzlVYWlpWkwrRHBlR2FLWkNVbjg2Y3FHMU9XUkpJdVJyNks2V05IMzZMeGYx?=
 =?utf-8?B?cGJXRFBLRnZPelIrTjd3OWhRcFJDa1JYY2JjUUc0NE5EL0QvdmxPQ2F2RTVu?=
 =?utf-8?B?Mzdyb2lkOG96UVFlaDg1WnRrdnZ4c25OQ2k3Tlc0K2w2bVJhZHFLTS9jUDh4?=
 =?utf-8?B?bW04MHV5VmxvTzZhMFlKNW9EYVFpaFdxL1IvR3U1Qkk0M0FqNHBBdnJFRXNm?=
 =?utf-8?B?Zkh5V3gxelF1N0d5RVBFL3h6VzdiM1NINHlRYitQSVNKallyU0tLLzUrdlRE?=
 =?utf-8?B?TkFWbmxuUWJwSmpzMVpwODR6bmRCTlI4MXNaR2ZBMHIwbzlka1NnR09XZ0VF?=
 =?utf-8?B?WVJOWU41Rzd3WWtZc2R0VHh3Ykg4TUJCQnJIVVAraTBpT1hsZzdFbFlZOHhl?=
 =?utf-8?B?S3NVRXN0UlpqeVpjNlo2d3ZXWmtXNUczUzlpdGkxb2pGTEpGc0tFUGlxYVFi?=
 =?utf-8?B?ZFVYWjByNVFieGp6cU5FbWxId2ZSbnFZbXZ2WFFDaDFxQkJnY3FnUXE5ZkQw?=
 =?utf-8?B?VUM4SHgxMU4reGdaZHd3MDdOemtteDh0MGdHc3drVi9FWVBJL0x0cUMrS1ZZ?=
 =?utf-8?B?Z3B6ZjJXdHZVL01tdWU4ZEt3YUFsU2tjc20zQlAyQlQvK09RUDJqS2ZVOHJo?=
 =?utf-8?B?dXhOMmdpUjJBbFJaQVhGRFY5eTdoaXlwOVlKaXVDUWdwUGtoUTRpeXY0RVpI?=
 =?utf-8?B?RDFnRjNheEw4SFNpU0xMenBTN0ppeHIwVkVDQm9uanlsQWpzU0c3Z2FpUVdE?=
 =?utf-8?B?OTVMV3JFbGZRa01TT3h1eFduK2E4VVQweTZLVnhFTkNrenFUSFNPc0RYbFlh?=
 =?utf-8?B?bEVPd3U0TW11OEhNT0tVL0RPODNoSlp4V1J0cXllZWxyenRKUVhTTHNLT1pt?=
 =?utf-8?B?YzFKK3M4N3hzOXl1bDJEeGpXVUV6R1VMa1NLQnZvMDVwZE5leUtQbFdTUWFl?=
 =?utf-8?B?VFEwVHpsZE1lZDNMaFF4WkMrbENCU3QzRURnOE1FOTZBQlk4YmkrMUp6Y0h5?=
 =?utf-8?B?TWZuUXZmdlI1UVhWSnJDb2RaV2VEeFpEaURnM3dQTStiVHRLT3BralFZcloy?=
 =?utf-8?B?Nk5UKzNZWVpUY0xURHh3R1VIRG4xN1BpOWM4V0MzaHdpMXR3L0FIY0RlaDRj?=
 =?utf-8?B?NTBvR3lRZk9hTTlOQXNHUlVYK3hPZUthYklPV0dYaFY2akF4OTN5S01OdmVH?=
 =?utf-8?B?M3NDb2Y1ZElabGQrSHFEWmdxWlhlakdlUllKb1B1TEdidjJlTGdvVE84UzZw?=
 =?utf-8?B?MGFqcWxFSUJRTWlVdlIzMzI4UnM1WVRqbjFRUmVlOERadml3UUpZQWVwQlRC?=
 =?utf-8?Q?0rzStbaiOAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGpyWG5wRXVKVmd3TDMyckFwaDU5Ulpmb1NVN2EyYTJhZDNyYkhpdlBNdzlK?=
 =?utf-8?B?WlN5aGpaYk9uYkFaZGpkZFZPNVJHTnpGVG82cURsb3lvV1VJTERBdERPOGM1?=
 =?utf-8?B?Yk5nY09kSnV5bGhjY3JBd0gvWDJRQUVIdWlyNXBQZVF2SkkyNk9OMTBqVGds?=
 =?utf-8?B?MVpTQytnYVNWVVEwejlrQi8vSS96cUxiUTJCM3JRRmtNTlh0d0xjVVp0Q3JZ?=
 =?utf-8?B?b1BabEpkcEpTV1lNcGFod2FGVmZWZHVSQWwyUFRreExkei9RZEZDS0ZVWG9H?=
 =?utf-8?B?TXNFNUFkNVFCbGQxN0RTT0p1ME9XS2plSWFpdVF3cXJBdXhtTlFDeHlWdXdt?=
 =?utf-8?B?Yys5Mis2bXpqdjVpNmZCMUorZkhGc0trRUwyeVpuNG5XazRWTjNMNGQzQzFU?=
 =?utf-8?B?U2pZNVpaaUNLZEZKa1dZV0FYWFVGdUFRWFlUYlhCYnI3UXp2RU1ScllKbDVP?=
 =?utf-8?B?TGIzYUtUV0NESWMyNnNJQVhNYVYwTUdZdzV5bHVPcnlCL2cyV25Tdy9JbVhp?=
 =?utf-8?B?WkdFQm1DMVdVUWRoODhWSlA2QzhFcnEvYzdsTDZSdkpIVTB0cW0yYlZub3ZJ?=
 =?utf-8?B?UEJEV3pPRnZmSHBHbUZWVjVZdG5RNm9haHF2NUx4NkRsdnJwMENiOUsxVjJy?=
 =?utf-8?B?bFhWaUVZZktTVWFsUWZaeWZkc1gxSDRWbnlzME8rYlN3U1hWc2pCNWpnK2pP?=
 =?utf-8?B?aXBoZSsvczU1ZWdoUFNuYjl5QjNXRlR5UjhxT0tDWFlXcFJvZmFtbDhmNER3?=
 =?utf-8?B?a0dQTWR0TDVyaUFLcm9RV09jMEROakJrdEVQNDgxS2VEcTJOYmdvLzYwN2R0?=
 =?utf-8?B?SzY0NGtJMHVZZ3N2aG5xMkIwRWxaQ3FSNEF0dVVITWRJQmtqV1ovdWNuUUFX?=
 =?utf-8?B?OXJBdGdCS1JNM0NEeDdPd1ZoVFFGUDZEOTdWdjd3ZzM3VUJvQmtuNHpXOEtj?=
 =?utf-8?B?VSsyNHIzRHltTHBHMnYzTFl3aTFKbS9FdXAzYTRCdStrZDZiMTFtYndLM2Y5?=
 =?utf-8?B?c0I1V1BqQkUybFJxTW5hL2pKNCs3NCtvU3dnVTVHKys5ck9FTTlFWkxySlBq?=
 =?utf-8?B?eWViRjRWWTR0R0UvS1FCYzZQNGhiNVBlbzlOME5zdWNFRkR6dlc3RFNQajZn?=
 =?utf-8?B?VFRBMGwzZjFQWkpkZERvTzBNUDFIaTdBT1IvQ2dZMzlCeHd3elpqeVBSUnFD?=
 =?utf-8?B?U1d2QkF4MkIxd0h5U01SSEp0YUkrdEJYeU9BUURXSWVCSE55M01SSWFqMnIx?=
 =?utf-8?B?alc5MUNIOW9rMjc0dTE2Mm5YcVJ0Q3Jpb1hSUzlOMFhhZ1p4UzZuK0RtTnNx?=
 =?utf-8?B?TGFBOTBsZDlGQzd0TUE5THRiTEdCRU9TOVZuZzdsOHp1cUlMd05nTHBkUzlH?=
 =?utf-8?B?c0x6VEdvclQ4M01ReDFNQnEyNnJmS1c1ZUpNeStScE1uazlxVEZCaU45RFBx?=
 =?utf-8?B?b2RUZFZZNjAvQWdMT2ltVEtvYzRZZHV6Z2xyVFhteEE2TGZ6dHpXbVRYSUZy?=
 =?utf-8?B?Z3hVeDlMWng1emtZNHVycGwvM1BKc1VROWw0NEhjMHRrOXQ3U2pUNFZPeU13?=
 =?utf-8?B?OUlYZXAwUkdZQkc4d21vUGJlWjVnR0NxZmZWalYrdTIvSXpXWHJXdGFIMWVq?=
 =?utf-8?B?MmtrYUhEd1VWSEtmbElBd1RKWjl1Zm9LNDBVeEhNOWI5cU5ZdVhpZ2ZYUVkr?=
 =?utf-8?B?NndVWHhmTVNTV2N3TGVuZHVkY0ZBV2JXNDBkbm9iaDVDbVlIQ3JDOUQ2c0pN?=
 =?utf-8?B?eWtNODM2OUZ6OXlFMVdkYTBUbjBLZDlNRmoxVTVKZ2w1TWRCVFRKSkQ2bGZq?=
 =?utf-8?B?bFZXOFVYdjVmMXpCbzJoUFcvVVBDUlZ0b1paa3hucjNwVUgxRmFnb0hNT01r?=
 =?utf-8?B?STNTNTFick5VS1NzNDZLVnVidm1Cc3NqWE5yUncwY3NzaCtQU29DdWJWZllB?=
 =?utf-8?B?NVNOeCtIdCt5K1hjTWhYYkpjUytYM3FVMlJ0ZzJtVVY5T010L2VnOW53blZE?=
 =?utf-8?B?ZXgzTW5LYVg2alNmcTNCQThxSm1iQXNMMVRuUzhqaG1rR25QSWl1enA4UDlx?=
 =?utf-8?B?SXRyQUVFcDZXdGtNVE42b0NGVERhalFybzVNYnZxQURRd1RjcDRQVy9vMG9J?=
 =?utf-8?Q?Dv7sd+ShZ6/t1gEUHazN+FPSa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 651500bc-8a55-4eb3-eed9-08dd9da5f120
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 05:10:20.1475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0V0LLZ0k7W2ivaW9t+JbiU3JErpEosVMHf1Xfa0cdHyGO6zo0QasHUjNngQtvgCs/RYuyRGO8kqTmBK1l8W/xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF867D7FF5E
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

Hi Anirban

On 5/26/2025 6:35 PM, Anirban, Sk wrote:
> Hi Riana,
> 
> On 22-05-2025 09:04, Riana Tauro wrote:
>> Hi Anirban
>>
>> On 5/14/2025 12:07 AM, sk.anirban@intel.com wrote:
>>> From: Sk Anirban <sk.anirban@intel.com>
>>>
>>> Leverage IGT spinner to trigger frequency scaling and
>>> set RPS minimum frequency to RP0 for achieving peak frequency.
>>> This method replaces the existing waitboost mechanism used
>>> to reach maximum frequency.
>>>
>>> v2:
>>>   - Disable power consumption check for dgfx
>>>
>>> v3:
>>>   - Implement igt exit handler
>>>
>>> v4:
>>>   - Cosmetic changes (Riana)
>>>
>>> v5:
>>>   - Limit the power consumption test to GT0 only
>>>
>>> v6:
>>>   - Fix frequency restoration (Riana)
>>>
>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>> ---
>>>   tests/intel/i915_pm_rc6_residency.c | 136 +++++++++++++++++++---------
>>>   1 file changed, 91 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/ 
>>> i915_pm_rc6_residency.c
>>> index c9128481d..b400460c7 100644
>>> --- a/tests/intel/i915_pm_rc6_residency.c
>>> +++ b/tests/intel/i915_pm_rc6_residency.c
>>> @@ -264,17 +264,6 @@ static bool __pmu_wait_for_rc6(int fd)
>>>       return false;
>>>   }
>>>   -static uint32_t batch_create(int fd)
>>> -{
>>> -    const uint32_t bbe = MI_BATCH_BUFFER_END;
>>> -    uint32_t handle;
>>> -
>>> -    handle = gem_create(fd, 4096);
>>> -    gem_write(fd, handle, 0, &bbe, sizeof(bbe));
>>> -
>>> -    return handle;
>>> -}
>>> -
>>>   static int open_pmu(int i915, uint64_t config)
>>>   {
>>>       int fd;
>>> @@ -286,45 +275,88 @@ static int open_pmu(int i915, uint64_t config)
>>>       return fd;
>>>   }
>>>   -#define WAITBOOST 0x1
>>> +#define FREQUENT_BOOST 0x1
>>>   #define ONCE 0x2
>>>     static void sighandler(int sig)
>>>   {
>>>   }
>>>   -static void bg_load(int i915, uint32_t ctx_id, uint64_t 
>>> engine_flags, unsigned int flags, unsigned long *ctl)
>>> +static uint32_t get_freq(int dirfd, uint8_t id)
>>> +{
>>> +    uint32_t val;
>>> +
>>> +    igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
>>> +
>>> +    return val;
>>> +}
>>> +
>>> +static int set_freq(int dirfd, uint8_t id, uint32_t val)
>>> +{
>>> +    return igt_sysfs_rps_printf(dirfd, id, "%u", val);
>>> +}
>>> +
>>> +uint32_t stash_min;
>>> +int i915 = -1;
>>> +
>>> +static void restore_freq(int sig)
>>> +{
>>> +    int dirfd;
>>> +    int gt = 0;
>>> +
>>> +    i915 = drm_open_driver(DRIVER_INTEL);
>>
>> Why open again. The reason for making it static was re-use
>> Is i915 not open when exit handler is run?
> The exit handler is getting called after the driver closure so re- 
> opening it to the restore frequency.

you can keep it local like before or remove close in fixture

With the above change
Reviewed-by: Riana Tauro <riana.tauro@intel.com>>>
>> Rest of the code looks good.
>>
>> Also respond on the BAT failures as the test is same and are legacy 
>> issues
> Yeah, testing rev again so that ci team can re-report the BAT failures.
>>
>> Thanks
>> Riana
> Thanks,
> Anirban
>>
>>> +    dirfd = igt_sysfs_gt_open(i915, 0);
>>> +    igt_sysfs_gt_open(i915, gt);
>>> +
>>> +    igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min));
>>> +
>>> +    drm_close_driver(i915);
>>> +    close(dirfd);
>>> +}
>>> +
>>> +static void bg_load(const intel_ctx_t *ctx, int dirfd, uint64_t 
>>> engine_flags,
>>> +            unsigned int flags, unsigned long *ctl, unsigned int gt)
>>>   {
>>>       const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) 
>>> >= 8;
>>> -    struct drm_i915_gem_exec_object2 obj = {
>>> -        .handle = batch_create(i915),
>>> -    };
>>> -    struct drm_i915_gem_execbuffer2 execbuf = {
>>> -        .buffers_ptr = to_user_pointer(&obj),
>>> -        .buffer_count = 1,
>>> -        .flags = engine_flags,
>>> -        .rsvd1 = ctx_id,
>>> -    };
>>>       struct sigaction act = {
>>>           .sa_handler = sighandler
>>>       };
>>> +    int64_t timeout = 1;
>>> +    uint64_t ahnd;
>>> +    int rp0;
>>>   +    ahnd = get_reloc_ahnd(i915, ctx->id);
>>> +    rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>>>       sigaction(SIGINT, &act, NULL);
>>>       do {
>>>           uint64_t submit, wait, elapsed;
>>>           struct timespec tv = {};
>>> +        igt_spin_t *spin;
>>>             igt_nsec_elapsed(&tv);
>>> -
>>> -        gem_execbuf(i915, &execbuf);
>>> +        spin = igt_spin_new(i915,
>>> +                    .ahnd = ahnd,
>>> +                    .ctx = ctx,
>>> +                    .engine = engine_flags);
>>>           submit = igt_nsec_elapsed(&tv);
>>> -        if (flags & WAITBOOST) {
>>> -            gem_sync(i915, obj.handle);
>>> +        if (flags & FREQUENT_BOOST) {
>>> +            /* Set MIN freq to RP0 to achieve the peak freq */
>>> +            igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0));
>>> +            igt_assert(gem_bo_busy(i915, spin->handle));
>>> +            gem_wait(i915, spin->handle, &timeout);
>>> +
>>> +            /* Restore the MIN freq back to default */
>>> +            igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, 
>>> stash_min));
>>> +            igt_spin_end(spin);
>>> +            igt_spin_free(i915, spin);
>>> +            gem_quiescent_gpu(i915);
>>>               if (flags & ONCE)
>>> -                flags &= ~WAITBOOST;
>>> +                flags &= ~FREQUENT_BOOST;
>>>           } else  {
>>> -            while (gem_bo_busy(i915, obj.handle))
>>> -                usleep(0);
>>> +            igt_assert(gem_bo_busy(i915, spin->handle));
>>> +            igt_spin_end(spin);
>>> +            igt_spin_free(i915, spin);
>>> +            gem_quiescent_gpu(i915);
>>>           }
>>>           wait = igt_nsec_elapsed(&tv);
>>>   @@ -350,6 +382,7 @@ static void bg_load(int i915, uint32_t ctx_id, 
>>> uint64_t engine_flags, unsigned i
>>>           /* aim for ~1% busy */
>>>           usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>>>       } while (!READ_ONCE(*ctl));
>>> +    put_ahnd(ahnd);
>>>   }
>>>     static void kill_children(int sig)
>>> @@ -361,9 +394,9 @@ static void kill_children(int sig)
>>>       signal(sig, old);
>>>   }
>>>   -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, 
>>> unsigned int gt)
>>> +static void rc6_idle(const intel_ctx_t *ctx, uint64_t flags, 
>>> unsigned int gt)
>>>   {
>>> -    const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>>> +    const int64_t duration_ns = 2 * SLEEP_DURATION * 
>>> (int64_t)NSEC_PER_SEC;
>>>       const int tolerance = 20; /* Some RC6 is better than none! */
>>>       const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
>>>       struct {
>>> @@ -371,10 +404,11 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>>> uint64_t flags, unsigned int gt)
>>>           unsigned int flags;
>>>           double power;
>>>       } phases[] = {
>>> +        { "once", FREQUENT_BOOST | ONCE },
>>>           { "normal", 0 },
>>> -        { "boost", WAITBOOST },
>>> -        { "once", WAITBOOST | ONCE },
>>> +        { "boost", FREQUENT_BOOST }
>>>       };
>>> +    int dirfd = igt_sysfs_gt_open(i915, gt);
>>>       struct power_sample sample[2];
>>>       unsigned long slept, cycles;
>>>       unsigned long *done;
>>> @@ -407,12 +441,21 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>>> uint64_t flags, unsigned int gt)
>>>         assert_within_epsilon_debug(rc6, ts[1] - ts[0], 5, drpc);
>>>   +    if (gt) {
>>> +        close(fd);
>>> +        close(dirfd);
>>> +        igt_power_close(&gpu);
>>> +        return;
>>> +    }
>>> +
>>>       done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>>>   +    stash_min = get_freq(dirfd, RPS_MIN_FREQ_MHZ);
>>> +
>>>       for (int p = 0; p < ARRAY_SIZE(phases); p++) {
>>>           memset(done, 0, 2 * sizeof(*done));
>>>           igt_fork(child, 1) /* Setup up a very light load */
>>> -            bg_load(i915, ctx_id, flags, phases[p].flags, done);
>>> +            bg_load(ctx, dirfd, flags, phases[p].flags, done, gt);
>>>             igt_power_get_energy(&gpu, &sample[0]);
>>>           cycles = -READ_ONCE(done[1]);
>>> @@ -451,19 +494,20 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>>> uint64_t flags, unsigned int gt)
>>>         munmap(done, 4096);
>>>       close(fd);
>>> +    close(dirfd);
>>>         igt_power_close(&gpu);
>>>   -    if (phases[1].power - phases[0].power > 10) {
>>> -        igt_assert_f(2 * phases[2].power - phases[0].power <= 
>>> phases[1].power,
>>> +    if (phases[2].power - phases[1].power > 20 && ! 
>>> gem_has_lmem(i915)) {
>>> +        igt_assert_f(2 * phases[0].power - phases[1].power <= 
>>> phases[2].power,
>>>                    "Exceeded energy expectations for single busy wait 
>>> load\n"
>>>                    "Used %.1fmW, min %.1fmW, max %.1fmW, expected 
>>> less than %.1fmW\n",
>>> -                 phases[2].power, phases[0].power, phases[1].power,
>>> -                 phases[0].power + (phases[1].power - 
>>> phases[0].power) / 2);
>>> +                 phases[0].power, phases[1].power, phases[2].power,
>>> +                 phases[1].power + (phases[2].power - 
>>> phases[1].power) / 2);
>>>       }
>>>   }
>>>   -static void rc6_fence(int i915, unsigned int gt)
>>> +static void rc6_fence(unsigned int gt)
>>>   {
>>>       const int64_t duration_ns = SLEEP_DURATION * 
>>> (int64_t)NSEC_PER_SEC;
>>>       const int tolerance = 20; /* Some RC6 is better than none! */
>>> @@ -557,7 +601,7 @@ static void rc6_fence(int i915, unsigned int gt)
>>>       close(fd);
>>>   }
>>>   -static unsigned int rc6_enabled_mask(int i915, int dirfd)
>>> +static unsigned int rc6_enabled_mask(int dirfd)
>>>   {
>>>       igt_require(has_rc6_residency(dirfd, RC6_RESIDENCY_MS));
>>>   @@ -570,7 +614,6 @@ static unsigned int rc6_enabled_mask(int i915, 
>>> int dirfd)
>>>     igt_main
>>>   {
>>> -    int i915 = -1;
>>>       unsigned int dirfd, gt;
>>>       const intel_ctx_t *ctx;
>>>   @@ -582,19 +625,22 @@ igt_main
>>>       igt_subtest_with_dynamic("rc6-idle") {
>>>           const struct intel_execution_engine2 *e;
>>>   +        igt_install_exit_handler(restore_freq);
>>>           igt_require_gem(i915);
>>>           gem_quiescent_gpu(i915);
>>> +        intel_allocator_multiprocess_start();
>>>             i915_for_each_gt(i915, dirfd, gt) {
>>>               ctx = intel_ctx_create_for_gt(i915, gt);
>>>               for_each_ctx_engine(i915, ctx, e) {
>>>                   if (e->instance == 0) {
>>>                       igt_dynamic_f("gt%u-%s", gt, e->name)
>>> -                        rc6_idle(i915, ctx->id, e->flags, gt);
>>> +                        rc6_idle(ctx, e->flags, gt);
>>>                   }
>>>               }
>>>               intel_ctx_destroy(i915, ctx);
>>>           }
>>> +        intel_allocator_multiprocess_stop();
>>>       }
>>>         igt_subtest_with_dynamic("rc6-fence") {
>>> @@ -603,7 +649,7 @@ igt_main
>>>             i915_for_each_gt(i915, dirfd, gt)
>>>               igt_dynamic_f("gt%u", gt)
>>> -                rc6_fence(i915, gt);
>>> +                rc6_fence(gt);
>>>       }
>>>         igt_subtest_group {
>>> @@ -621,7 +667,7 @@ igt_main
>>>                   igt_dynamic_f("gt%u", gt) {
>>>                       struct residencies res;
>>>   -                    rc6_enabled = rc6_enabled_mask(i915, dirfd);
>>> +                    rc6_enabled = rc6_enabled_mask(dirfd);
>>>                       igt_require(rc6_enabled & RC6_ENABLED);
>>>                         measure_residencies(devid, dirfd, 
>>> rc6_enabled, &res);
>>> @@ -635,7 +681,7 @@ igt_main
>>>                 igt_require(IS_VALLEYVIEW(devid) || 
>>> IS_CHERRYVIEW(devid));
>>>   -            rc6_enabled = rc6_enabled_mask(i915, sysfs);
>>> +            rc6_enabled = rc6_enabled_mask(sysfs);
>>>               igt_require(rc6_enabled & RC6_ENABLED);
>>>                 measure_residencies(devid, sysfs, rc6_enabled, &res);
>>
> 

