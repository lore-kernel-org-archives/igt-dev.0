Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A4EC36010
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 07:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC72810EB17;
	Fri, 11 Apr 2025 07:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFlFFFjD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EBC10EB16
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 07:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744356436; x=1775892436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/HCUG12L6SgeKX8YGVntakHWTv5MR6/QynfrEnP2Lsk=;
 b=lFlFFFjDrIIwRkbwkhlTjxYu+MaDkCHGEtJRWyK//QQ3XI4+Ep+pHgA2
 vNTZzGVUcaemRT1zJf5lOhIyzn8W89gjPiFQ9sQIj/P0PPP8k8Q20rQ/1
 4iU/23QLYJBNmgJ6Fc26JcJ38ngGCMp7Hafq7Flqt/RqJ4N4OmHBoNq7g
 tjCTa1W2U6vxjst6kOD5sAkCWU/rFV/ovRZgZL3AT22gPtybMY/WuuJrJ
 6XAJKhd2SV2Q+nMV3iUQ8DmQqeVu9G45y79sNSr+8cbZh5O+XxR6E7d/z
 khS6nHVamAUM9nE58T15TGQocqUg9TwJ1uTalmUf0oyOXV5ED6+40RwXs g==;
X-CSE-ConnectionGUID: CC0svI2DSuqaeP4m5asMlA==
X-CSE-MsgGUID: 5tR028GZQUaEy464D3e59w==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56545047"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="56545047"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 00:27:10 -0700
X-CSE-ConnectionGUID: csuF25SLTda3tIb1nx1K2w==
X-CSE-MsgGUID: MWs8MT97RPiD9aPsIyCfvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="128894113"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 00:27:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 00:27:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 00:27:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 00:27:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pobnDJWtPht2qKRQGgmvxVGl4ml0SlEjgwjc7I5ztujcesi9jPJq5v76pzlINuJ57neNWiC8na7mdF7/ibaKRz9+Hpca0S4i8YHmDb05ZFm5KwIEh7zzva/VOnkUKQcUJT7pjb7oLE+rLfloe0yS4dAe/W6IjlmwFiuMG6zzXgpbbUCvM+NdR670kuRTTuvT89W6WikTDWC7juAUYWEgV5cskxFlvVKcVSmP6CMxzkjf7RiC3OMnN7hTFWQ7hECZ6KdsWoSvcfwU3jRvhpnwYB56yonPgh9Bc+DWPCliRiOFhK7fn5mkNXIKQtanZ2plgn+kVkGY89o1wOj+kOtC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqbPU6JfPeb3D58DLupHIhQVv+DJg0QBf1l7QcFLlWA=;
 b=oVB9yXdnb/YcSqxMnMsPPh6gGY45+ApnN2q6k7eiQO6/tiBcvrc7THuReup2U87iBaP9IUsfGb3C9FqmJXNz4H1GgJ4ZY8CQp0XD1CYQZsUBbgAVqj/ZnzWUpD9z1okK31xYslBXZ3ILufhIIw5hOSp1rWpuB6TBkGsVvfw8MgtpYB/PNjtzeVp9kaCLapoi08PU32ebsrHyReyTHn5o9HnZLvQObzeTtxz2yuZRSz/iBPMthZLpBq2NTVzMRG/rdY9xSfwUY6yKCOQNGPVjA5nSPyH1W8G63bCvWC0YlwV6WN4BSwR+K8d+6CRdzzTD5H6z3Vtoey5MMDNx4Af4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Fri, 11 Apr
 2025 07:26:26 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%6]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 07:26:26 +0000
Message-ID: <c68c117b-345b-4bf7-8231-1c44adf9d72c@intel.com>
Date: Fri, 11 Apr 2025 12:56:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 01/10] lib/igt_kmod: Fix leaking dir
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-1-84b1ad0b8075@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250410-lib-kmod-v1-1-84b1ad0b8075@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::20) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|LV2PR11MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: 26321c07-f22e-405f-1922-08dd78ca2b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjZnNWxJNUFpOUtpVnpsRVFQYmJHTDFtaFkvcVZoWGpuU0tUNEI3MmdoTEIx?=
 =?utf-8?B?ZjlPTHByTUtCdVR1WWdqaEF4eFM4RnRxbExUM0oyOTlLaW5pVVFzZHFPcDFj?=
 =?utf-8?B?djI1TytHMEF2N2Z4TWs2ZTZwamczK1NWaUVKUzJrMndCTkNjZkpNaXRUbHpq?=
 =?utf-8?B?Z3k3MVoxTDd0K1NzTk9YN3FSSE8zbkJBZWRYc05Kc2dBUzhEdzFqcW5vQm83?=
 =?utf-8?B?bGxvR1JBbGwwMGt2TEpzUFhBZEVtS2loZUFvcGVWT1Y4WWRLQ09nSGtINXZJ?=
 =?utf-8?B?ckJib2JxWEI3ckVkVEpFUzBnR05xaTlQQmYwaGRxQVI4emY4b2E3VDg0UEc2?=
 =?utf-8?B?bXd0SW5WaHAxdVZyZVJRYTFUVjE2cGsrWUJDa2lmZkZxakRPSTdvdjBNcGNV?=
 =?utf-8?B?N1lYTG81WEJZRG9hSGpDVmhjV0dDb0U1NXFJUGJScHozVGQxTUp5QUV6Njl0?=
 =?utf-8?B?NFowY3djclRBQXlXTGVnMHZPRmVPVTY4bVowKzBoQThXRkMrbTltZGttT1pz?=
 =?utf-8?B?cGlBa0sxU3k2cXY0SUxZYXVHVVZNT3cxQTJRSFhybnlYdmpxeEQ4Z0kyRFJy?=
 =?utf-8?B?MnJrWDc2aTB3NElyczUrTkx4SEZzb2pqeU1MM3B5SE9pbUVEbVdITTROcXVB?=
 =?utf-8?B?WEhWMTdkZE8zRW0zUWt1bTA5OFUyTUdLcFlsZWR4NU84cVhwSTFWQWt3cUJW?=
 =?utf-8?B?VkZFOTEyU0FDYVV1YlZsOUk4ZDRIalgwN0lQWkhKcUcvNDB6cC8xc3pDOXE4?=
 =?utf-8?B?d3g1cHNGU2E5eC8rL0tDWmt2MEZDWXBrWDUxRWVycDZVWjRXbjZrZ0NCclBP?=
 =?utf-8?B?dXBGdWFIUGFsaUI5RHRFYldxZTNVQ0UzV0J4ZVZDelF0R1NjVG4rK1JWaXpi?=
 =?utf-8?B?cVljQTJsT2dsQWRiaWtvYUNRenVwaGFSOGNyQS9jTTlkb0VoU0pKS1g5Mks0?=
 =?utf-8?B?a1Q1OGc3Q0ZLZm9wT0dPRDY3bVpNNlRCYTJHcEZXS2FCdDdBZ0FJMjdJN00z?=
 =?utf-8?B?VnNnVVVBR1F4RllobXFXUVFNS0dOU09lMlJPMk9sanh5cEdZNTYxbm9WVGcz?=
 =?utf-8?B?SzJvZVp1b0o0WmUyczUvTG9FWHFOKzNvZ0tIRlV0N1Eyb3pua3Y1bzBZeU9R?=
 =?utf-8?B?Z1JMR2JoY2o3VTg4NGExSjFUaFVpVHd3VkZ2VXA4RVZHd0VxYTU2cUpiajd0?=
 =?utf-8?B?ckxiWXh2Y0JLZjFZVWZ6Q0lMNVhscVYxVnNzZE1UenRTZkJGU1piQnI2U0Np?=
 =?utf-8?B?QlZ2aW5NVzlnYW5DallJTUs2THBnS2EyKzByNTFUVUN6YXFJYU1nWnVGQWlP?=
 =?utf-8?B?OC8zeWJQMnl0K21ZcUtSUXBnSlZYb2pkdkN5cFB5RmhUQUFYUXMraE9xTlJr?=
 =?utf-8?B?eHVzTVhiQ01qaTNaUUpKNkxNZENWV2hRcVpKR1ZaNmg1ZDF5aGRkS2ZSanpm?=
 =?utf-8?B?UkJtY1ZGOEljZFZ5aU1ydjB6MTBLYi8ydU82a3dVYWtmN0xQQ1dZRFJUWlZW?=
 =?utf-8?B?TkRkWnBwUWFxeVNKdVF1d3V1RUZlSGFVRjZKbnRzSDdITC94Y041MjZhSG9B?=
 =?utf-8?B?TWlURWQ0V3pPVUQxS3MxSlEvSStVYjJLMzU2aHE1cUtHdm5TcUpUUjlXeitx?=
 =?utf-8?B?YWlPUzlOSXNBTmhLcXNVQ0ljMlhNVW82SUpjN2lUdkxNeDk4M1NOVFNDNFM3?=
 =?utf-8?B?OHJ1MkgxU29hS3BoeTJkTFZOa2NJajBlcFRteUpXQ2RGZkkweTVlYW1sdWhx?=
 =?utf-8?B?VkVwR0tTZzlzcFFOSVZGRGJCeUZjY213TlJ5ZGUzQmVJVkpkRVFNbUNNR1R2?=
 =?utf-8?B?eGZPcHd1SGxUeG5lQnFKYXFBS2I4QmtRbG01VVllTVV0WitWcFRiQTFpdEUr?=
 =?utf-8?B?VWF2dlI4MTg0a1hLczliS2lxUlZHcnJjbjE0R0l2WjRDM0J0RU9iL2hrYndn?=
 =?utf-8?Q?j3htjLNa4Qg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0xIUjFoWmkxVnp1K2FFK1dINU9WUFMzVlJOSVY0NE5nalEzZG56R0xNSVVr?=
 =?utf-8?B?bVVtQlQ1ajNtV1VMTzBpemNDa3NEU0hyOHh4VGlKQ2h3NE9hTVJENGZGdWwy?=
 =?utf-8?B?TzlOU2gyZGU3Q0Y1WEpxRVkxU3BnWGlFR25JU2xjZUowUDlTd012U2R0d2pz?=
 =?utf-8?B?bHlCZnlBT283YWtnTU9uenJYamxMWUVRTWhGL055SVFpbUxTc09nZDRtZm1j?=
 =?utf-8?B?L3AyOXZyU2dvRGxXMDNwTGhBcWxiLzdsSFpOQm52bFF4UDZja0FORmVsTS9Q?=
 =?utf-8?B?RFhKZmkyTFJNbEMvQ2JqMHAzWXhjN2RUbGFlNGs5SncvanRLQ3o4WFdOU2E2?=
 =?utf-8?B?TGFiWFMzNERta0YvQmNoVUdGUG5saHBOdE80M0k3aTZ1aXcxSk1EZlZXTmU1?=
 =?utf-8?B?TEE0UUlSVlZLQmJBa3RzRHZybmIvN3M3M2RSc1BERW96V04zclFyZFpCaWgw?=
 =?utf-8?B?TnQ5cVVnMjhSVjJzbzlnbGxnT01NdXlxYkptRjdkRXBwOVV5WVNqZFZyeSto?=
 =?utf-8?B?am12Mi9iYjBxcXhHbk0rSXByZ0hkMEwrQ3pObjBydkh4azRxOThld3NLSmhk?=
 =?utf-8?B?NWViQXBMeFJOR05ybWlRTU4wNnhxb2tzYThKQW91NmJMTEc0QUNmS2duNXph?=
 =?utf-8?B?V0pEU0xaRmJCNVFmQ0FZS0ZjT253N1RSKytuSWd6Um1ucWdXaC84QkQ3UUFS?=
 =?utf-8?B?d0kvTjJSdGtXbHlOWHJ3K1VwNzBXYWVmZERIQlQ1VUdjYnFQZWFKTkZBbmxY?=
 =?utf-8?B?bDVBZnJZaUZhNnMrcmxhcXNkbzJCM2QrWWFHL05Pc1lKK2Z2VGs0VHFGc3ZD?=
 =?utf-8?B?bXlhbzlSeUJxMmU4S2pFSEpIUG5neVFtUVZ1R2xFaGJSZ2xhUzVhcmNGQjBK?=
 =?utf-8?B?OUJGZ3ErZkdLd1F1aVA4aTBDMHRZR1c3N0Joamg1UEVnWHZMRkhuNGtnb0Ro?=
 =?utf-8?B?OFd2Nmg2bTdzTkQyZ2k0T1BFOWUxSzRVNFluMnhvYjhvTGVhN25WQkdFRkp6?=
 =?utf-8?B?Uko1Vjl6VG5mUjhWUjdlSnNGLyt2dXI2RU9vckVEU2V3NStFY0x2cDI1UnMv?=
 =?utf-8?B?Z0QxeXJ1VWNUcEplTlBGWlZuZEVxemhVbzh0TGhLMEl4SjUvZHlMRWVSdlpr?=
 =?utf-8?B?Sk5abkViYVM4MGtsOHlQVXEweHpEVXdJQkpsbGkxdGpnUnJrc3Nlc2hMaTAz?=
 =?utf-8?B?Yy9xS1QrSm43K1dGQkl2WEY0enQ1RHREb1c5VHNVbE9TK3NiczZOSkhUbXpm?=
 =?utf-8?B?Yi8zYVNDQmQ0YkJuZWRvVFh0bEQxVGovUDFWQ3Q3QzkxQ2JXdHFUMml0UDRW?=
 =?utf-8?B?R1NEdUoveG94V1pML0RTM0tCK0ZTcmF4bVI1Y1Iwb3JPRzNHc2h6emprWDZE?=
 =?utf-8?B?L3NXR0MxOUFNOUlTbXNLbklDRXhpcVowTjlmbWFzY2tML3lYMHNSdmNuOEg2?=
 =?utf-8?B?b09YZ1FzSkIxei9TV3FpQ3FxZXcyTE9xdlVUUDFMYXlzeEtLSlB1Y3lvVmVx?=
 =?utf-8?B?Nk9ZaTQ5YkdUallVWGdJYXJsS1A4MUdiZWdLRzB4aElmTkpFb0Z6a2NaWXhE?=
 =?utf-8?B?TzFDcnJYdmF0TEc1cmFvVENCMm92OWRUVjNYT2hPK2JnQ1RIaGF1S1ZDQXVT?=
 =?utf-8?B?bWhJMVMrbm1tczM3ZUtXM1hsQVY0cFFjOXVyVHpEcjZUbEFzNGNOb1NmQlRa?=
 =?utf-8?B?U0NMVUIvdWVndW9RcHBnSTBXTi9ISlEyS1o0VkNhb1hVNFJrR1RWbk9SSXlJ?=
 =?utf-8?B?U1Y4aHR2RDVRcVJsK1hUYnlSbC9mcnpYVUJCL2JTRXAxb2gxaUZPQzhpWEtI?=
 =?utf-8?B?a1UzN3BxVElJMk1IWWgzQStaWi8zcHRrWlhEaGxDbHpLL2p5UmRNTmdCQThk?=
 =?utf-8?B?anZ5R0I4MTZyckJYM0ZLQXFscGhFalpMSlRvQTdUVDNNelBlcCttZ1crbXdV?=
 =?utf-8?B?YnhmVStvM0JONWJwU3NHeUJqZWFzb0plR2N5ZFFkU3ArZDBpSG5yTWMyL1VH?=
 =?utf-8?B?YjJWcUpPY0IvRmJQMnJheDY5endvRjVLL2tmWXBBSDhWV2xaTDc4QXA4NUFH?=
 =?utf-8?B?ZTU1MnYvZDYyN216ZXYrZmM3TGhMTWNUZW4wY1orUU1MZTlqTXhnZ3JwSXFN?=
 =?utf-8?Q?SZfcL/02pleSxu8/b+W10J0Vo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26321c07-f22e-405f-1922-08dd78ca2b4a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 07:26:26.5389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7isXzqgV36Xm7VZczQQNDFt9G8DVSD/zI/57bMp52qxRHr06T0YJMP8/ALyDy3wSQfHlBQeeW8/w7MDvY+RqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
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



On 4/11/2025 4:18 AM, Lucas De Marchi wrote:
> Close the dir before returning to avoid leaking the object.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>> ---
>   lib/igt_kmod.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 2cf2e7894..4e1a3d42d 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -690,6 +690,8 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>   		close(devfd);
>   	}
>   
> +	closedir(dir);
> +
>   	return 0;
>   }
>   
> 

