Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F94D65C42
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 06:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA79A10E33E;
	Thu, 14 Nov 2024 06:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYIom3dJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E03110E33E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 06:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731564391; x=1763100391;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0nT+gpxUzDq7AaLyRvTh0eov6VNS8WGE7Nhm5OgDV6Q=;
 b=iYIom3dJjpe08ZRkuvjkQ3Xe0nlvnunBE/fcEktC/B9ZNBCq2RRKkbRQ
 bNixQOlfNzDuWaiB+JZk+iGW9LASsvSbtgtYfhkeCLiEsKGGTijzQwIm7
 0wdzhsmAh1jrN/4WPlO2/TOTZdtKdt70jaTjMjvUS4aagf0suu0BKEToY
 G9sdJKLH+OnS/v/esCSKTMwMHAWWv1hH5uNXOHa0XC5xIGRIexcBkqdWT
 D+wwaMQWIsjDjiOQvJIuf4Un2vp6lCeNp8XhX9lBRm8MTrvfgiVROUFNj
 ubrT+rGAJimUXIhcCSEbGUv7dxxEqJAD+CCtkm4zCSIYGKS3cXEqHOZ66 A==;
X-CSE-ConnectionGUID: IahGcP7ETyWcNmPu7bDnFQ==
X-CSE-MsgGUID: cCOM6p9SRK2vRRzKAh25NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30892103"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="30892103"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 22:06:31 -0800
X-CSE-ConnectionGUID: IH3RriPQTJaOQwGMXarzdg==
X-CSE-MsgGUID: EolC88fjTBuln/k2t2oF4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88079869"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 22:06:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 22:06:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 22:06:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 22:06:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbDKqIhSVw1w6V6TE83K1IJo3ycdE/2LAPbo0eukVHTPIgW+uauUpPQSPympPpyQCQIUhzFpZcTOl25wueZZC4T6LFogrdxFatzPTM7/tD69uJv/GplddlUoI0AWQ72dP+iSYxwHlEpw32PYktyfflAXGrLM/snAPJOlZrF2Rv5w9SmBatRzKyh8qSVO9SgO4X2ZEQN6ZZ5XDR6iMb4Rxs2vea/OKEZ8GNmvcpJdnrHg4JBdRmA0Rl+mBSWtyq746sdSyTaDGtq/yeTUne7x22COkI3Ur7k/96L76+lkH29Hub3+M+Orn8EQW2P/fog9ezglIWfQBcDDCPUfYDUpZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irIpvr0TppGo/nYps/2/2MUVMkWEPW87f9WzHo0s0rk=;
 b=xIm1jgP1Zi+Qvy4RdcW8EFHYf9JowTdIYil0xFcQ71Q3NBUNQ+mDlHBhyG8mG9XlNYkIxjMekeQQjXZoO2eiHYYduWgC1UfAamMpB1DwbsYZDP5pTb+hHMY/L4wfi/bGUEmmYtDe0ssFEp04QKzl19a40oTrLeFhNGTTE5c2n10PJ4bMB+ctaSxlu3p5EzQmEBQdTBRnf8xcENLcrcNWiVY8b6aeg6DbsRRsdZupr+eLSgUPDmKrEpJAc1PUGhyI3AV1HhjzBXARuIpezcl1LqbJp+utR0dgtiJB639J8lqvQwr9Z3Zg6+KKa6ecUW7cS10bHVY/rlD/NfWbzdI+Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 06:06:24 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:06:24 +0000
Message-ID: <d7e44ce0-d11b-4fe5-bc8a-19f7c5e671eb@intel.com>
Date: Thu, 14 Nov 2024 11:36:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Add skip
 condition for bmg platform
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241113175219.162926-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241113175219.162926-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::9) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CY8PR11MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe47963-de1e-4014-2743-08dd04727821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlhTN1Rnbk9qSnBaSzd5RTZOUUMwSG9JWUV5bzRtWUloOGFQby9IK0ZFNStD?=
 =?utf-8?B?RmdJeVlxN3NpNklkR2dSUkJuWnNEeHIycGtUQ0JueGppRzVoV1RxUDJGZmVL?=
 =?utf-8?B?UTNXWjQ3RFhPTEVDempqQktaeFZlYXIzd0p1WG5maGtLNmpxYkEydXlFNWdN?=
 =?utf-8?B?UzBWa3dwU0F6cGc2N1dDYTJ5YU9VNU53eDAvcHRUWTM4M1N5SkdIVWNScHds?=
 =?utf-8?B?S1lBQjhHMnZLWHhkWDEycklueEw1dVkwNTBCekJHblIwZFB6Wld0UVBRRVhT?=
 =?utf-8?B?UjZldWJYb25OT1pralRlc0JSZnhJWXRQcGZQdU1TbmNmQ2lFcjJDdXg4cWcx?=
 =?utf-8?B?QWhyZXhUcVY5alhHKzFEZm5RakdHalVVNW5DUXJOeFI3bzZLRW13K2JDK3gz?=
 =?utf-8?B?WlM2ZEs0eDVmVkNRK3B1MzFodGd4RmpSamlaeUpLbTMzZlhWSWcvcVZmaklE?=
 =?utf-8?B?dlZ5eGFPVFl4cXJ0ejg4L2ZBMjZ6ZjF3YkEwcWpsa0tqdm0xU0src1ZDNEhk?=
 =?utf-8?B?NitibXZmSW9rcDUzVFBLd0tBNS9sblpxMTZTa2dOVlZqM1V6UFkzQjBXVkNk?=
 =?utf-8?B?UFVXMzM2NjNiajRlV2tlOWY4OFozdHZzMExHQ1J0MngzNzZNb3BVUUVpT0JX?=
 =?utf-8?B?V25rQVRncXNOUGdXQ3I4U29Mc3B3dnNsQy9TY1dlVE90R1hxN29IZmRrQkc0?=
 =?utf-8?B?NVM3enN4T3FPQWY0dzRhK2o3c2h5bkVXWS9JZ2gxWnptRmNvamVDZGNKMWla?=
 =?utf-8?B?R3k1V3piVXhnSzVTUlpGbFppVkRia1JMTW9CZjJFTCtkL0lNeG5xR3BOeFVR?=
 =?utf-8?B?QkNsV1hNVndQVmhHZ3RJcTdjWm5wKytKZEVZZnNvRHQ1K0pnaExvU1RwMW5S?=
 =?utf-8?B?WHBCdkdQdGRGMEovYUpvMC9hdGJla1o5NFo2Vk1lOXQ5YUVpRWUyMmJQbWNr?=
 =?utf-8?B?TVFlZFlzVFNSVDZBN2lqb1VQbnkzckdhbEQ4MkZ5MXBmT3hPOEUrcjU1aUFY?=
 =?utf-8?B?WGI2N1JVRXFtK3ZUSzVDdnV1UlF1aUJFd1RYT2VjUk9NUWhxQzJ2WHpkVHpR?=
 =?utf-8?B?SXJCVTg4UVNxZ0dqOVRpQjRwem83dXZ0c2J0NWZ4ZXIwVVBlY1J1WEpuRWFQ?=
 =?utf-8?B?SXY3UGJpR0szaFR4NzhwdGlKaVA1RVJpL0ZXWExFclFQMi9qSWVTSzFveWtX?=
 =?utf-8?B?SkxxNWY2bHM0SjhVRFV1NEgyTkxqVldsRTROUlNEWlZQckNwMmRPOGVMdHFR?=
 =?utf-8?B?ZGZNL3FkZVhaSVdKaFc3YU1HRlBlL1FHSTZWMkh1bWJBejlsZzZPK3ZzUHhu?=
 =?utf-8?B?MlEwU2VBbm9PUGpLaC9tNHkwc2hXQUVjanVlV0p1N08vT3liTFUwbk5aYytm?=
 =?utf-8?B?cGU5cEcybE9UUmhaYVpjRW82WlBMUEVNd29VcnM2MlVnOGpVZ1FCQzVRdUNK?=
 =?utf-8?B?TmVoQ29zb1Nhb3dRWjVSQlpUdUptN2Z6ZEd5T1M3dXVuVkJBdVBvNVdUNFJM?=
 =?utf-8?B?RWdlSmYyaEYwS0lJOXhKR1BZd09CZ3JzMFRXcUt0Zlk3bUs2em43cWhjNHBY?=
 =?utf-8?B?SWxhSUh6cVNKTGhLVUJ6M3hlY3FYUzV1bHpHaXZvanY5bktHbzdoa3JJNW9V?=
 =?utf-8?B?eWhNcG9XSnJiaEM4bnoyRTF6L2thTzRSOUxhKzNjc3R1M0dGU1pwYytPbDJp?=
 =?utf-8?B?emlCQlJDejN0Z2s5YUNvc21YMm5Ka3RaSm51VDkxZTMrczJKZWVnL3V6bm9U?=
 =?utf-8?Q?TLaGOj8EszF4YxMkWqCk2urCltNf7hMq2xVv9ai?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXdKaWI1aUNlaUtkOTAyYWI2QXJEdzd1RmZPZjJNRXFRUERLNHZHVElnNFNx?=
 =?utf-8?B?L0JUcDgvMmcwT0pBMktNZjZjUjhyS2ZrbFU1M3VUZE5vOHEzRENUb0paN1Fo?=
 =?utf-8?B?THlOZDM2eWZrTTRXb2NaZ3I5K1U0czlVQXZSa2ZJQ2NjczBsa1ptUEhZQnBE?=
 =?utf-8?B?cURMK3ErRk05UzJHaDdGdWNaTEpxcUdkckltT3JXcGlHVmEzSFg1NExiTXFs?=
 =?utf-8?B?ZVpkOGpJS2VNaWV6d2ZTSnpGTHhFOXg3OUM4SGFwUS9NclFqZklycTZSVWQ4?=
 =?utf-8?B?ekNCQzdyUndDYVFLaGM2eDRyNlNCVHR5MGszVVpveVExNTBVaWF3U0JRM2Fm?=
 =?utf-8?B?ak4vMHoyVVdKVTBzY01FS0ZmWi9pbnJSYzBNd1VaSHdPdEhENzAxbHNJc2Ir?=
 =?utf-8?B?b1g0RGFna0dyNFJTNmlwUTNsWm1sdWUyWStXc0dnbGhMbjdRbDltczJ2YjRa?=
 =?utf-8?B?cHltY3FoZlIwN1hNTmh3UllSS2VibC9qVXZwYWpzM04yUjVZaFFpVUFPaFpi?=
 =?utf-8?B?OWNRKzRmMVhYRzdLVjN3MHNhUmQ5OVVENTNnc3pzNUxjWnRhcmlEQnFYc2Vk?=
 =?utf-8?B?YnAwOWk2MFBiZGVKUGl1OHJDRFVtWWY2VFdCYmllQWhYY1pjLzFGYURJZitX?=
 =?utf-8?B?NnVxVmVFWW04d1pGTXhteW5DKzBwb1F5b1dCdy85ZFcvV3JzYmVEUXhVSHFt?=
 =?utf-8?B?Q1FCZ2hiczBaMjRoZUw5cnB5UkZlNEVFT21ZcG5NLzM2WVV4cGJ1OEFhcFNr?=
 =?utf-8?B?NjFNd0QxRGhVcmw5SmRFbDk4TUtoMUoyeld2N0dkaUdwM2ZOZld3SE5ldDZR?=
 =?utf-8?B?TEZXYjFEM1Z6RVkvUHhlVjE4cWp4U1hNOG5jV0tLWFBqVUNycGNBLzVoeVhI?=
 =?utf-8?B?MWYyNlVSOERpcFdsT1NLU09kK2dXWDJQNFFCUHZ2SEp3ai80cUtaV0tHVDEr?=
 =?utf-8?B?dE1yb2d2dGpJaituVDVVZHdnQXBWZ24rdnN3Smw3YUVhR1pDc0tSS2VjUkM2?=
 =?utf-8?B?SlJEUzhheVhqaTY4b3FyVnNxYnluZ1A0MDI1aHE5T0t2Q3RIQzJ6L285Rmlo?=
 =?utf-8?B?bWR6N2NhU2RBMEpObHMrWjJwVWhjNnZJRkZkbWlKVXNWdlBRUkhrK0NiNnVV?=
 =?utf-8?B?MkI5M1VpbE1KNjh1a0JxM2U1MzRBQVQybGdTNUZ0SE1mMEFMVU5JRXI3V3lF?=
 =?utf-8?B?dkVqQTJBS0ZtNy9LV1FXYnNBQ3NFSDk3bmd1T3dkWFozQU11RmRQTGZSeVBs?=
 =?utf-8?B?NkxSdHFWL2RLV0w3N1lKNE9rSEhFRkNsMnJscHkwaWpkWlRFemRGLysremEx?=
 =?utf-8?B?WStVeTJGZWk5ZGFGR1Y4MVI4Y01ZaFJ2K2VEL0xISERqekJiSkcwcndQTGRn?=
 =?utf-8?B?UktFU0xPSktMM2hGQlNURktPNXJkQVh2WVNVTFhvTmlWdkZEMEMzQmlXV09k?=
 =?utf-8?B?VFlYYTI3K1BGUzYzMWkwZ0FYY2QzeWI3RmN4OStyM1hBdkZ2amVwOG94NVRW?=
 =?utf-8?B?enNhT0Y0aDNSK3cxTjd4TlN5NmZrRHFYT2laZThwbitQeFprN1JQU2NJbEtB?=
 =?utf-8?B?UkdnSVErS1dNNXNnQ3Y5T081aEtYcmE5ZDZDL2VuMFJjOHpGR0x4NmUwbG1G?=
 =?utf-8?B?L3BMVGIxQjBuaVVzc211K0U0cElEMFBhVEN0bjVFdmhtbjFFVkR2blJ4Y25r?=
 =?utf-8?B?V2VEb005OHBLczc1Y0h2SW9CalA4dHh3YUdReEMzeUhBRWFVWEFCVGFIUnZs?=
 =?utf-8?B?SWFHTzBscUxndnhFRzFlcnRwZk5kaS9oTVhsK1A2Q3hROVNQU3YxV2NLQlIy?=
 =?utf-8?B?U3J1TzFOclI0S2t5dHJxSTJ3L3IrZWJ3OUVzNTlsSlNYeDRDTXdmTHhzWGht?=
 =?utf-8?B?RUlwRkM5MlI5NEFCdXFYWGE2QmcyZjVwVGRuU2lSNmRzK1Y5ZGh2SFVLNUlG?=
 =?utf-8?B?RlJGTTB5aWh4VlIyMFV3QWh2NnF4cDBJTVkvTFJaTGQ3U2ZrZk1YdkVMbG9I?=
 =?utf-8?B?ZnBUZWl4WlRIOTQ4dEhlbUFnenR6YmVBOHJpVDJVMmFFZkJiaUpJSWViWVJ0?=
 =?utf-8?B?dFlJZzBxby9hUEpSdnc4ZkxpbEQvbnFMNnpKeEozN1V5VlVGRGplZGg4OU9O?=
 =?utf-8?B?UWptVXpsS1E5RERWQkhWUlZYeWhadm1nbjRPWi9QY0FSUjFaRDRFNm5kRlNF?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe47963-de1e-4014-2743-08dd04727821
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:06:24.7508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qb4QEPGdZ/KICdTK7lvHoNcdW95lN6mVi34w0Bb9pRMjUCcdPL8CA7kuRQJtysNRCoPN/NaP78GpyKxuk03yDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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

Hi Thasleem,

Add bspec id. in commit message.

On 13-11-2024 11:22 pm, Mohammed Thasleem wrote:
> FBC test isn't supported on bmg, skip the test on this platform.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index b7e3f7379..8ba1faf69 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -4471,6 +4471,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		setup_environment();
>   		drm.devid = intel_get_drm_devid(drm.fd);
>   		drm.display_ver = intel_display_ver(drm.devid);
> +		igt_require_f(drm.display_ver != 14,
> +			      "FBC isn't supported on BMG\n");
>   	}
>   
>   	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
