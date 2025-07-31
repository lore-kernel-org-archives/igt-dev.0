Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5D9C83F17
	for <igt-dev@archiver.kernel.org>; Thu, 31 Jul 2025 09:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2262010E73D;
	Thu, 31 Jul 2025 09:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANgI3mlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA5710E73D
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jul 2025 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753952848; x=1785488848;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HkhLz+O215Nnww3Zdx8fjbn2pUBykYNO+AHDZ4nbzuo=;
 b=ANgI3mlwfBAePr1IO/leKShMiypyyDZa4DTNEvH8yaS9NE5GOShV3fyv
 fgYbIZAxhrCPOcBYmEH9wsiAyuc4/X9kzK3xo//Ig7UbkOzyLbnpyU1f/
 XXmB56j0Fab1Iy3b0h2ovxIAzovUOQoa1WIFYbb0qOXhd8WoiR4vdtb7w
 Q8h+38om5TP/jWeRut7nEyyQp/KV5kPi3f1t4XVrK/28ajG2oGinLObTk
 IAMSAXeJ2YKR+J3eXPxm1xse9IIkoayG/1sshKhd+djBhoTEO4ssPdb9Q
 WnrLbXqccn50S8f0/blUMoWS+hi9vCLhBmGwN2oXdls6ERueGTDVd+Okp w==;
X-CSE-ConnectionGUID: DD8PJ6f6Q0Wgjqu+E3FVhA==
X-CSE-MsgGUID: CzUoq0LcQVeqELRzTLsRFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55337399"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="55337399"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:07:27 -0700
X-CSE-ConnectionGUID: rmvMJGN+SdWqboODKx2FnA==
X-CSE-MsgGUID: +N9fq2FERfeNNYQp+vy30A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="200381761"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:07:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 02:07:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 02:07:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 02:07:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YV58DamWEElGBYlIoReqW4FRZIK43qp72v6nFd/3ecoFY48minfPFd00UwbPr53lzN/jQYJf7BMKro3jnVUgkSOwQ1yC5DyoKcHHjdMKV3wmQVMXv/YGbeZN3WaQaqPhKKGlA6sadHFAMS5/RZOItRcBdVimne7NLcXROdqrwdVm3zKZO5K0U/fbGnxxhklQxowsCJ2UJ3FgbEX1TisBDXv1R7D0HaEo97mxUDxv7p9S4JpEDucmDzBBvH2QYv0OAMhMd6yM+aDQ6sW9Ze70XR7lqC7GwrgZrzYq4O+N8yyWvtdEpcyyizAdbm8hswM534/U/G0Z2q3o6MQFajH07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krRN0oor28Qb17BvEU4HdM6tWE4Vf42GG0Hl4GOPXNU=;
 b=FEDc2V4Ng8pIx8MKYqqrUYvFsFA1ustZ4VBVvPvUe4I9G/f5f+yEXoVdSGfgJVrkOkyFsv3qSC8YhS5xSEJ+6GDDCFrcIUoElfhS1lYJj/AQhT/jUj+mJ2Xgp/h4dWc//Qm/S8+IJdKYGTzlG7KwviHmMylHOXu5HpQRER3kTZjZauXPdeQONtlmh74oqJdHyEEUgDxP/F2Eds2Z1fNp+LgXPm+uhvmtZQ6hgdxqbKXDb7MIT0ygvfwg03L1+vRW70Jr+UyWl7FQo24qdSX51lBIpPDgBBwU11IwGQuFSMxVwoqCXHPR47rO3y/e/drU7f+PjYxWGGZ59ic8spTfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB6617.namprd11.prod.outlook.com (2603:10b6:303:20d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.27; Thu, 31 Jul 2025 09:07:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 09:07:04 +0000
Message-ID: <0d7e5838-0852-4284-9caf-980688d6ef2e@intel.com>
Date: Thu, 31 Jul 2025 14:36:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pmu: Skip tests if the
 engine-active-ticks event is not present
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>
CC: <lucas.demarchi@intel.com>, <jakub1.kolakowski@intel.com>
References: <20250731074309.3227163-1-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250731074309.3227163-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: e5134264-a6a0-4ca1-47db-08ddd0119e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eE01ZWtGd1pPVVhRTlR2Q0NGMHhPUmhHYUlqQVdxZFBhdU54b3IvRmJ3NVdk?=
 =?utf-8?B?bUUyVFhQejlCTlVUU1ZtaG9Ka2UwRmhQWE9tMjVJcHcybDFhWXU1QWk2aktq?=
 =?utf-8?B?cUpHN0hTdEg3WndNRVk4cE5RVnVVR25aSmQ5TE5Fc2IwdFduNkhwR1AwUUlR?=
 =?utf-8?B?NXhDN2w0a3pFNGdpaFNaUE0vZ2N6aHpCa0RBV0RNdXJCUDBod3RmemFIVVpr?=
 =?utf-8?B?K0pBOER1bHRvOGhJSGhIbHRRSVhObDdaelhBSVBQQ1laK3Z5eVZ4VmV2RFpZ?=
 =?utf-8?B?Z2x0VFZ1eEN5b2phc3dhcHhsZUNBUnJpSjJBWHQvOEtGOWhiaWkzQXo1Z2tj?=
 =?utf-8?B?M0o1VXo4dHRyaHMwWjNWNjBkeHVvUTBiWjFsM1dyUEY1S0FSWC83R2xFVmt4?=
 =?utf-8?B?bndzbEVxaUlqQklHMUgxT0tyVlIwMm5wSG8yOEZ1a2RGL0l1czBtSWRURmJN?=
 =?utf-8?B?Ulg5WU1oUkEyQU5GbkNiTWZmaXQwbDhSRDZpdzVKdXdDbU5xTDI3dnlLMk1q?=
 =?utf-8?B?bHQ3U1NXM3B4QVlVUUtaZzdOYStjcXdZNGpyemthUExsdDV6bUtiQitmTE40?=
 =?utf-8?B?MVowWC8wdDRkVVlhTXZqVFNuZkxrZE1NQlloTG1Kek1qbmpOWVYzdzdKaW5y?=
 =?utf-8?B?eGJ2NmZ6NVozRmE3dGwrU0JYL1pHWnhHbVlLNWtHRy9KT2xKUHlWckpIdlJS?=
 =?utf-8?B?STg2YTdYMHhlemp5NEd0YW14dlhhNkxzT0xldVNzVndRM1lRYlR1dnBwTEg0?=
 =?utf-8?B?cXZDVU9xQ09uQUE0VHVURmRmdVQ2VzdyY0dGQ3RXRE1DaFROeGRaNmxNYWR6?=
 =?utf-8?B?YU5ZVW1RUXZlMlZXdDJveDJzZUhMVkNlekkySDdnRlJzc2xsTVVIS01xdjU0?=
 =?utf-8?B?cjFTMlNvUWVyN2tZdE5qeW5XN2cwdWxPWlg3aFpGV1VaL1U1ZUxkNmRVcml1?=
 =?utf-8?B?VzBmYmhzbGh6Vy9tSFEzaWdZZTdFZTRBeVY3dExlSmhVWTJGMXEvVTEyVmlt?=
 =?utf-8?B?UWdncHdLdloyTFUvRkNUWDlvZ3g0V0hKU2tsaUFVb0JWWFB3ZC81SnJnSm4y?=
 =?utf-8?B?NnNpOEYyTHY0Y2lSVmdMSWtsVnhIYktrZ1VsVnNBaysxaGJtYXFVWjBOZ2Fj?=
 =?utf-8?B?ZUc5dGs4WFppcTRhSjBndnBFV2lDcEpDTTVjVTJkSi9tRDAreG5QcnFlTGps?=
 =?utf-8?B?MEpHVXg0dDlKYUQySzBXOGxjQVdVY2dVYWliUy9TVlY3M2NkV2pMSFdFbFh4?=
 =?utf-8?B?bGlKSTFKSlZoMVhXbERVd0U3dE1oMG1MdWZkaEF6K2tzYkdCMVpIVHVTYlFt?=
 =?utf-8?B?SEhuamlJVzUxdHhGMUM1VUxLNXpIem9CTFh5ZzdlWlVoSFhvSGZoVTh3bWJm?=
 =?utf-8?B?REpnOHQyMFpKRkUrWTJlR1hQV0ZIVXF1eWdQQzlxVnJrTmtUbmZaWWM5cFVa?=
 =?utf-8?B?UWJkTS9jTTR3RlNTUElCWWtzQko2THorUEpZWFMzaFhNWUx5QjJyb2VXM2FB?=
 =?utf-8?B?ZENoaWJXdnFZUlJCbHdOU1pUc2RDcDMwa0U2enBxbjZ3T2xvYWJjN2w0U3Y2?=
 =?utf-8?B?MFRxa05aRThjTDBjdVA4NlF6WUk5b2k4SE1QVHRrRlpWZnlNVmx5S3gwUXhT?=
 =?utf-8?B?b3g4VWlWYW9lY1dWaTNGMVVnQk51OTNiUXIxbVRleStkbG1lemhLYW45Qzkx?=
 =?utf-8?B?R05yVEV1alFPaTdTYW5ZTHdFZ2srK2tWL3hEWWkwUzdpV1cxN3dBOFRGR1Ny?=
 =?utf-8?B?dUNDVmNEWXNLKzlxZmpWazZxSktlVHFqeWV3VlcwdXZoMDBhTEliZW5vVjQy?=
 =?utf-8?B?TE1QSnB1YnU0V3R3OEJObkpQNHo2S3VJQzJ5Vkg4NVVpb3diN2lzK3dqOW9J?=
 =?utf-8?B?TlVORUFaekphaHlOeTNyQk5XR3RoUXRuaURUanprL2FTVDhrNEpOV2xuK3pG?=
 =?utf-8?Q?tnvG7ppksWo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWlCMG83aEVwMzlHelNMckZoa3RpcXo1U2dSTjlyUnBPM25MOVJJdG80R296?=
 =?utf-8?B?YXlDWWM2aVBBaHdxRlJpRkV4M2pNUzVubzlkcktQMWQwcVVVSUcxN2tzM0pC?=
 =?utf-8?B?VHZOajZBSnN6RzZROEw3cklCWDhvcGhKU3NDemQ4MHlJWGdNR2FHV0NxYmFO?=
 =?utf-8?B?L3dmTlRMSUw0WWhDR0hUN2ZTWkZMS0paQncrV0drOEo5ZjlMc3JUalBabEhT?=
 =?utf-8?B?OWNBLzBvWXQ4TzRRdGRxZHpJSmYxYlRiYVE3MUZqN1hHZy9QWE56NnlGZ1BZ?=
 =?utf-8?B?bTBtSEFacHF0NE1DS0k0WnhIRHlKYXI0TW52ejM2NEowYnBjbjY1eURUQ0o3?=
 =?utf-8?B?NXgyVlBWTlBtbkl0ZXhzNXdDTmluODF2WFV4Yko1NXlDeUNUYUEzOHhmS201?=
 =?utf-8?B?ZmYxVENDbi92V25jQ21vVXRFaVgxaDhCUG5qeUdnb3hzWXVqUlJHOHRxWEND?=
 =?utf-8?B?VG9FTlRpWGxCUW5qdmhVTHgxNTdSdlJwekkrT0tPa0daZU9yTXUyVEloNFBu?=
 =?utf-8?B?UWM4aXZOTWlBUHArKzg4Q0FzK1lDaTRjMjYxd1Y5K2lCZlZHb1RJR3N4cXQx?=
 =?utf-8?B?V1BXZ2Q2WUVSbVk1dGFmaWNVT1NHRlZReDhTMUZnR01DTUFLQ1VqcElxMzh2?=
 =?utf-8?B?TElNbEpzMURocitOYjA5UkVLdEswU1VDci9hem0xa3UyUkVwOGFIc0tYMlNy?=
 =?utf-8?B?RWNITE1oZEdBNFI4QW1UeFMyd1ozZ2ZFR1VHb0lGU0JISy81MTR0dkpHU21J?=
 =?utf-8?B?b0FxRS9wdUNZVDV6MWFUc25kcXM5dXMzaDFPYUhKelhtYnJYcXZYcHVWd3Vz?=
 =?utf-8?B?T1BERFlxeVNzNHAwdlMyUzZOSHJvTVNKQnM4cGZpVWFqTUswVm5pdHhDTFBu?=
 =?utf-8?B?NFpMYnJid05KaG92RmkzVlo4ajlMUDdYZkVQdXhYeGNlRkxvd2ZBQ096UWJH?=
 =?utf-8?B?S2J4QW0vekRMa2lPUDZXMk8xbWgwM2ZIQXoxbTB0SzZCRzVFS0M1UVFBRG50?=
 =?utf-8?B?RWZaY2dxOFR1amduc2N2NkZ5c3VlbVZFbmgyRTd6Nk9tK0wzb3Y4KzlqOUZN?=
 =?utf-8?B?cnpmeGhROEUrQ2pkYW1XL1NUQVB5ZVdBaU9SQkZIT0ZZMmc4RXhSTmM5K0cz?=
 =?utf-8?B?M29KMzNNS3dkQi9LMkttd0NURlVibkZ4K2RHcTNZaFAzM1c5VU1kRHVnOFBG?=
 =?utf-8?B?ZmsyMnFuMjRPcjAwOUVuZXBqUWM2NzljR3d2NGNwSnAycDExaGVpeUdCMHN0?=
 =?utf-8?B?d3Bock9YdmZxQ3NVT3N6Q0VXdjRDWTk5bU9HK1grL2s2L0VBallCb01vS2VG?=
 =?utf-8?B?WGNlS2M4N1RHMnFtc3F0elhnU0VqY0doMlJ6MFRSYk82MGk4WlVRQ1h0VzFI?=
 =?utf-8?B?VisvNjlFeHlTWTNsK1Nic2VTZEdPelJ0Wm9weDJ1L2RXajdnQmZUOXp3eEtp?=
 =?utf-8?B?R1Q3OG1Ya2hGcXZUcStSZ3E5R0JpUTZXOEVORlpBT0toWHMzd0RoWXdzWDJn?=
 =?utf-8?B?VU83a2xzbWZScFYxbHRPdUp6cTJXUnc0Slk5VVo0WVJINnVrOTg1RFhoZnBq?=
 =?utf-8?B?QzhpVTFFM09PbGRWejExcldKWjl0Q2dvZ2VjelpCK3p0a0tXWDZNOExKd1Zv?=
 =?utf-8?B?ZG5qclc1eWM0U3BRcTN6Z0JyWmlyNEhCbHlSVHhEaEZ3UnhEU25yY25XaUxk?=
 =?utf-8?B?U0IxWWxCbFp3ZWFrMW9ORUtEWGhibGgyTktmeDl2Myt6eHJsRC9EWnZoVDBk?=
 =?utf-8?B?aFJlS2FudHZ4KzhkNWlOMEJvYWZ3K2xWYlJ5aHRBS0lBekVCNWdwZGpucUNT?=
 =?utf-8?B?ZVpYRU1ZemQwV2xwQzh5U0JaTGQySU1wUnFWZG1YZE4wdnVEMEI2cERwSlBi?=
 =?utf-8?B?MmdjbDNqMTNRSUMvSlVvMUxoQ0ZyMGhYekcvbWxKL1Z6NXdpd2U3cVZ0MjZE?=
 =?utf-8?B?eWR5OVlxNEY2d2pXMGdqUXBDSHI0dEFoMHcrVjhxQ2ZFa3FzQVNHckZLUkpH?=
 =?utf-8?B?a2hFTzRsMDd2MWgxaWtraE5RNXBqNmtlS1F2Q0YzVDN4eUE2T3V1QURTb2d1?=
 =?utf-8?B?NDd3TDltOTNrUDByVDJrSDFXaExNWXZtOWk2OUpMTVNWaEZpSUpQV05JVGxP?=
 =?utf-8?Q?NSNJ+QGhmC6hEorwIRLKqLdLJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5134264-a6a0-4ca1-47db-08ddd0119e59
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 09:07:04.7721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQZEepgnbSYkI1l9gclCnMDYjpEZDvz+/KdSqCFg0qVywW8BX7kFPftGiix+xvpTQRgSHctw6WzAsXkYP6qo2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6617
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



On 7/31/2025 1:13 PM, Soham Purkait wrote:
> Skip the tests and subtests involving the engine activity if the
> engine-active-ticks event is not present for the respective
> device.
> 
> v1:
>   - Add a variable has_engine_active_ticks to check for the
>     existence of engine-active-ticks event. (Riana)
> v2:
>   - Refactor commit title. (Jakub)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_pmu.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 0e5a7360f..b0bd235e6 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -106,6 +106,7 @@ const double tolerance = 0.1;
>   static char xe_device[NAME_MAX];
>   static bool autoprobe;
>   static int total_exec_quantum;
> +static bool has_engine_active_ticks;
>   
>   #define test_each_engine(test, fd, hwe) \
>   	igt_subtest_with_dynamic(test) \
> @@ -113,6 +114,17 @@ static int total_exec_quantum;
>   			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>   				      hwe->engine_instance)
>   
> +static bool _has_engine_active_ticks(const char *device)

use a generic function supports_event or has_event with event name as 
parameter. Can be reused for other events too

Thanks
Riana
> +{
> +	char buf[512];
> +
> +	snprintf(buf, sizeof(buf),
> +		 "/sys/bus/event_source/devices/%s/events/%s",
> +		 device,
> +		 "engine-active-ticks");
> +	return (!!access(buf, F_OK));
> +}
> +
>   static int open_pmu(int xe, uint64_t config)
>   {
>   	int fd;
> @@ -191,6 +203,8 @@ static uint64_t get_event_config(unsigned int gt, struct drm_xe_engine_class_ins
>   	uint64_t pmu_config = 0;
>   	int ret;
>   
> +	igt_skip_on(has_engine_active_ticks);
> +
>   	ret = perf_event_config(xe_device, event, &pmu_config);
>   	igt_assert(ret >= 0);
>   	pmu_config |= add_format_config("gt", gt);
> @@ -907,6 +921,7 @@ igt_main
>   		fd = drm_open_driver(DRIVER_XE);
>   		xe_perf_device(fd, xe_device, sizeof(xe_device));
>   		num_engines = xe_number_engines(fd);
> +		has_engine_active_ticks = _has_engine_active_ticks(xe_device);
>   	}
>   
>   	igt_describe("Validate PMU gt-c6 residency counters when idle");

