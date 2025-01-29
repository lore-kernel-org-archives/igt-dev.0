Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F132FC0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 14:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27A610E0E2;
	Wed, 29 Jan 2025 14:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fD8GwFGZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E38610E0E2
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 14:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738160084; x=1769696084;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=hhg+fCQu3TiOm5Oih5jE1p3uzoHaZP91a0My6O9EmQM=;
 b=fD8GwFGZCdHDtBRUPApq+LrIRn9+ktBVn33yOiZX9lzyDUwH0BxwZuxY
 Ve9azixZ0/10Wr+sXVDit3pGpue8sENLOPccoVUbmv0z6m6Lg9WpP/pGP
 7bqlcDTwpSt08NbiFIhyFoUjQpc33ZHlLRqxg0QIkcv1ivo+8qoVYwa6/
 QyTiHck/UFQUWT7GMqbPNV9opu3T9cd8XaL7TnPeX8hcDbyEqVf8kHjaI
 v3r6N3VKizkLIX/F5FAZPfkFVfmeiQNs1xO+1NIJoAo8tCw4qZE7bTFOY
 aqbo0MKpNwUhvp4sPrDZRR/XFjkuab65qhuAq7Q/ubdjutg/Masp+rtn3 A==;
X-CSE-ConnectionGUID: VEy4RFqqQ2+Nc55Ht+qFag==
X-CSE-MsgGUID: wn/hMX8OQyapLjjIn2lXAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="37918294"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208,217";a="37918294"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 06:14:44 -0800
X-CSE-ConnectionGUID: SHYntd5hTpiaSSY0evXcIg==
X-CSE-MsgGUID: uEXgFS1fRhusUQKgS2RMAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
 d="scan'208,217";a="109019199"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 06:14:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 06:14:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 06:14:43 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 06:14:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJCTMJd1BH6pRcKholb64M7L/xpstJJRnU9J8k4K6Oac7+LSgyxbFY+0M7qTFkgMwToPtpH7h1N+GiXHNgvtpVqs3zigZ/sDsiV7EwyIHCLieJKy+/KcKBg7EF0YuRIUSA0j7IW1YTXcqH0BkofPJZhlM3zE3Zjv3XvfJi1rrQye3tXYGZmozhxQxKf6fm7wfxFjxUlovAbTEyrKNR9SCpue7spEro4RCzOG0D2ufQM7tNyzfRCt9I8B+YQate9J3crB8KywgTPjdSTyLwXsd6rSxIg3uCws8/OQv/Ojs+icqLgs0otZcZvj5tqhLRwtUJ/w3g1JSilfjUO3YEi30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9HmOm8PE4UwJw8kknNEApbOIFR4nthG76JwiHQnNkU=;
 b=iiDxuF4HsMzvBcyN5xtNht1hbBDfK7GS4GJM0relTOthgs6BaKmnZxx0WurORFghj/e6/2oVIvcgn8K21+Puk3PCDKdcBaW5YyTUMMpXUmKla16/WDonc+cuNiAjdQdJsWOGmM30sw5dF9DCOOqB8G2T0pWa18zW3LVJf301bQGFvCZkxB6Udu/jQA6J6mEuBOyTWYyBhJtaA8WXi7XqMhzj1AV3yQ89spBqd3sWWBNIhM9R4VUIJy96k0aVVGxvm/rrbrhS90Uxa/RNh33roup3S058ActULqqG2/g6CdQmgLgvtecniyGfvqfEI3+nBZaj858AyKLNsapsfRwdDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CH3PR11MB8659.namprd11.prod.outlook.com (2603:10b6:610:1cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 14:14:41 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 14:14:40 +0000
Content-Type: multipart/alternative;
 boundary="------------43OYDQLY4gGRQPzBlKXxx10p"
Message-ID: <ff456783-b83d-4e59-af48-de2cf292e618@intel.com>
Date: Wed, 29 Jan 2025 15:14:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] lib/xe/xe_sriov_provisioning: Add helper to
 check default scheduling attributes
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250120203445.16285-1-marcin.bernatowicz@linux.intel.com>
 <20250120203445.16285-3-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20250120203445.16285-3-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: MI1P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::18) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CH3PR11MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a2837e-1c5e-4a31-02b6-08dd406f4562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlBzWGlHa3hhY2J3SU9zSlZlRlRjakh5WUlUdENucTNPSE04WEVVUjhVSzU0?=
 =?utf-8?B?ZzdPR25Fc2pLcjZaL21HQTIrbmswUVVSdGlHRWJRVWJ5KzloUERnbjVSdTdG?=
 =?utf-8?B?RUQveVdtZnVscUJaYkVhZVB0c2Vab2dnaHlMb1I3Q0RPS0Q1QVlyMUl3eWVq?=
 =?utf-8?B?aXZrb2N5ZXZpL29IVVRWMEsyeHI3ZmFTSXowRzBMWnRLNGxtZ250R2tQYVE0?=
 =?utf-8?B?OFEvQ0JJU1RzYUw1UGJYTTU3aTRxbTkrbTlOSzhzNTd6RlBkL08yM0J5SVYr?=
 =?utf-8?B?SkhVNGdLNXZkYURtelIzTlozS1pYcEtQTFgxUmFUVWpCb0kvWUhHZWE1UWFw?=
 =?utf-8?B?VURRc1Q3TmRhc25YZkRzdjh6MGhFdjZsbmM3aVA2Skt3dXpFS3BQeVhweDZS?=
 =?utf-8?B?VTJ1eWhVSjdNTkNwcWlEVWRPTGxqbEhZa0hzWWRUWXR0YjBLc3V6T2xVTVV4?=
 =?utf-8?B?KzZac3l1RHZHQ1psaGc1SERNUzNGdlh5c2ZQaGc1dkFSL3FCVjdCK3VaWjNW?=
 =?utf-8?B?ZkhmbzQ0c0JVVGhRT1R4REdraXVNQXU2S0hzbFdBbzQ0aHhReXhUMEFsZEpx?=
 =?utf-8?B?Qy9oZEorSzY5RXlQUUs2a3daZGg0ZHQ2NWVjSzlrbW5FczUwcjZkYnRlQXZD?=
 =?utf-8?B?YjNwUENrYzJOakNlZldvSWpraC9ZQ2d3UnFNY21INnlBK3hLcGlTVWw4UTZn?=
 =?utf-8?B?bUFjellaNkxoOFFhcG5LMFVNaGpxZ2dqaDVYNU1GbWt3RXp1UkJWT0xVQTNX?=
 =?utf-8?B?TktlTkh6d0t4Q0FIRHZwUkYwZ2E1MnM5RDJ0ejYwTHNNT1lyeERrd2NkdXpM?=
 =?utf-8?B?Z0FqV1JOS0JyMXhMNFRQRzkxZTAxSGhkcFJnM2dDNXpwUXIvVWI2bEtlNlNs?=
 =?utf-8?B?OTNhamZzZUduMUJzWGdlRlN5eW1OQ3ZCUGYyWXlSWFNQaDVONU1xK2h1SlFJ?=
 =?utf-8?B?ck1WVUFEVDRsY0R5T0hpUGRHV1FiL3JVN3l6M3l2YXZkeVg4cTN2QjQ4dU44?=
 =?utf-8?B?cS8wclF2dGZFdFpPYmlkNWxZVnFyU3RiV2NWdWFCMVRkVTd3UEtlazRlWEsz?=
 =?utf-8?B?NFRxcmZmRGtob3RRRDlaOFE4a2Y1L0xHWUlEZ1o1VTZuc2FtVDVxMGNqdFhP?=
 =?utf-8?B?N05LV1Uyd1lzTHhVZ1Nqd2VWa05DSEkrN3BiT0xSVTlvQ2RJUVl3aUZYemha?=
 =?utf-8?B?VFVWYjVZTE9iNzNqMTJjTEVpSUlrVkFjZDNkaFlsVjduRkUwKzlOZkNLcktZ?=
 =?utf-8?B?MGgzQThnQkFwNXJZZ0xtcWgyd0ZaM1FHUFFldnVFeVNUS1dWUDd3VGcyKzV2?=
 =?utf-8?B?V3Z5U1JpM2N1TXc5NHVVblVzeU9VTklxblZWYjZJY044cjBHWXNmUk9GQlRV?=
 =?utf-8?B?L2N3ZE00b1hwYi9VOTl5TmlSNmFPSDFFaWRVcUxhWlVaZDZlTWFoSm5sa1g2?=
 =?utf-8?B?dmhFUUZUMm82SG1NQzBtVW92eFUvcDVsa1hoNVRacm9OcXpIdis4NHJDNWRi?=
 =?utf-8?B?UzJYK050Tnpwam5aWWpkTXF3ejE3UkxOYTdhWHUzemF5TWpCM2JHbkZaeFF2?=
 =?utf-8?B?eU8yYzFaQ1VZaW55SFRYTVpwN0lFSm5pVHJxZU9PRVBxUEZrN0FUUDhlYm9Z?=
 =?utf-8?B?Mis2b1R1QzFjNnZqV1FYNVN4YWFUU3c1VDQwWHYzbEU3SU9GT1FHK3QyMElw?=
 =?utf-8?B?blErbEF2ODVtNUtYZExlcUxQT3JJa1ZURlduVVluSkI5Z0dKbytzRnUzcWlH?=
 =?utf-8?B?Wjg3SDBpWWZlTUxQTkdFMW5JQUcyTzE3SEc4ejdlakQvOFhXelpNcWxkREU0?=
 =?utf-8?B?T0o1WUZ0ZVMxYVFmNHdoemlHYkFIWnpON3Q2UEdSM2tGRmM1WEYrVkNsdU9W?=
 =?utf-8?Q?ejopsuuuaJYDB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm5JKzkxWXYzQncwSktaVVNtcXFTSjNLQkhvT2h3SjUzUzdLOHdVL0JjMHZS?=
 =?utf-8?B?SmVIVnoyZXc1NXgxaThFaTJGa3A0L3h4WVQwc25wV0tGUEQ0VmZ0MTAxT3I2?=
 =?utf-8?B?R3ZPb2hvQy91RGUwL0pZWTVLQ3k1YjdrU2ZUcG5SNHpYYTlyL3BBdzBTTDhQ?=
 =?utf-8?B?dW8rbG1HTEMvcmZybTVPZkowaWRhcTl6a04wYXBGRWlMamRZdjlRcExldkFl?=
 =?utf-8?B?R21hUjJubXBOZkVHTXF5aTk0ZE9BdEthdVdmbVRXd3BkNWFRZm9SOVhNZHpF?=
 =?utf-8?B?MnlUY0g3Z3dYaldiUVNqeEMzaHc4L251OE5kaHo3THZmcVNjcmpVb0VGSHBw?=
 =?utf-8?B?UVVwTFlDaGhDWEI3SnFLNzkvdnNiUDUwYlJhNk9JaVhZcWJBYnF0aXE3TWZQ?=
 =?utf-8?B?WVhUV2FFVHZjRDZreEs4WnNDN2FieG5NQk81VWR0dUY1NlNsOThsWE9TZjlt?=
 =?utf-8?B?cXpJL2dnNi85VnJlQUtSanhHaXBMU2d3dDRqL3NSMnljSGpaOU1vbUJqT2RQ?=
 =?utf-8?B?QzVYSXFsNE1iZ3J4eW1qYW8rOHJjTWxlcGVuL2JwaG93Vk5wZ09XTXZNUzdm?=
 =?utf-8?B?TkJjY2REVTl0dGdld1U5Zlg2aVhkUUgyUnA4d3E0N3NES3dBeDc2SHVPTmtI?=
 =?utf-8?B?YllnTmlROEVORG9qN3F5NXJHUzdkdDdKM0ptQm5UYXJwVEVYK3NxenEySFVh?=
 =?utf-8?B?aU1VamtqRTRVSENjc3pMK3JtZ1NOcVViQ3BqWEMyUWRkZGxDNTdZSjlmVytQ?=
 =?utf-8?B?OFdhS3BsdDlWQy9ZK2xmcFE3TFNmK1lZcEdyd2plVWEvamtpU2UvQXBSZzdG?=
 =?utf-8?B?eWZUZ2MzbktiVlliaWdJZ1hPTURqMEJkMHlqelg3WXQ5MklzZ3BuQUQwMkVF?=
 =?utf-8?B?a1ZLKzhkbkxQWWVyWUdHRjB2RDJaYlNkaVRJSG1NaGxHdlovdmJPNjg0dmlL?=
 =?utf-8?B?MExtaWdmd2xRLytxcDRjby9hOHF3b3M4YmFDM1huSnpGemZ2USs4d3cwK25y?=
 =?utf-8?B?MkF0eVk5aHRZbmZaOXVHcFkycXprR2dVc2ptcnkyN0QzMmVDSUNYV3RaT2RG?=
 =?utf-8?B?cnlSWWMrY3JBVDZJSHV6RU5VOXF4T1U4TUxrY0g5U1ZFanU3cFA2M0VCMEds?=
 =?utf-8?B?Nnd3SEhmem91SG0zekFSMllZVm9GQkYxWGFCaTNBRlMwaFdjaDJub1FPb1kv?=
 =?utf-8?B?NFBpRTlmcjNyVnJqWEhxaGZBMXQ1WEtzTVdmS21WWFN5aEUzajQ1T2RjZytj?=
 =?utf-8?B?VERvcXNNTUExMnRBQ0k0TTZIQzFJbG9JaVlpLzdYMzVkY1htQXlaVzJ4NE5k?=
 =?utf-8?B?MXhKS04xNWJJeTZQczRqb2cxeUNNRlBsd1U4djc0Q09EQm1JQUhra3A0OTJz?=
 =?utf-8?B?ajh3dzBDN3pzOFRWMWloREl1SWRjYlVzRkx2WWtTWnhLNUdNMTZmT0NsZzgx?=
 =?utf-8?B?WkFFRm51R1hMdzBuVFptelZTSkk3WGFTdHkvVXFZZDFVM3hyRzNTcTVmS0pL?=
 =?utf-8?B?d1dXUmtYVjg2MXc5dEtIcjY5L1g2bTBiaDduNDg2MUJkL0RxVS84VVBkNnlW?=
 =?utf-8?B?NUZad2IwZXpqUnFjdzQrRDVTMTNIeGJTYVZvNHdaVlBzbmw3Nk5QQzdxODdL?=
 =?utf-8?B?R1RNTm5BWWhDb2hJRENhWG9xUkU0dGRrclFGWFRvUXNoemg2WVVGa0pNN3ZU?=
 =?utf-8?B?OUV3dWJxNlE3QzNNZ3NYQm5MSVVNTnYwbER5KzhFaTYxVG5iejg2WktKVC9W?=
 =?utf-8?B?RlQ3RFRlMHJHRDFoWGltd1p1YlM1NlZ2WWxmbUxyaUNuejcxOGFudG5nbngv?=
 =?utf-8?B?UUNxTmlZaVpVcHJUUW90V0R3SWsrNWg4RVhuRHNIMnZCQ2lqbDQ2bjhjOGMy?=
 =?utf-8?B?S3ltb3JoQ0ZxOXh1MUx2dmxjdUlxRm9Gc0pGSjlwaTJjcFVBcUh3TTRIbEhN?=
 =?utf-8?B?SWdEdG1KUGxEbU9kQ3dYMDF1QkhwSW1sVlU5bWs4K1FNM29zV28vYTVmSmZJ?=
 =?utf-8?B?SE1FQjZyR3VGNVo5VExXMEJ0NENVcy9zaDVESHJQWWFaTHJKNEhmMEVYTkV3?=
 =?utf-8?B?WWVHVDZmNnlJbmRlVm5WelNDOTFDT2xpUXNFN25jcXlYQ2sveFJCejVnWGVZ?=
 =?utf-8?B?cmpxd1ZGMm01elhKcUcvLzB0NU5iYVJqSmtSNkg4bzZOWnE4OFp6SHdydmRN?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a2837e-1c5e-4a31-02b6-08dd406f4562
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 14:14:40.8628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVnbpN2L+YXG2Zt7ItiIznao8sKTdG5Opp+vZFym5It0MgSNWvdx59492YeA+jvS6OfP41/yJUSnv8Ax5FIrxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8659
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

--------------43OYDQLY4gGRQPzBlKXxx10p
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 1/20/2025 21:34, Marcin Bernatowicz wrote:
> Introduce a function to validate default SR-IOV scheduling attributes
> for VFs and PF. This function skips the test if non-default attributes
> are detected. The default attributes verified include:
>
> - exec_quantum_ms set to 0 (infinite execution quantum)
> - preempt_timeout_us set to 0 (infinite preemption timeout)
> - sched_if_idle set to false
> - reset_engine set to false
> - sched_priority set to XE_SRIOV_SCHED_PRIORITY_LOW
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Narasimha C V<narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c | 42 ++++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_provisioning.h |  1 +
>   2 files changed, 43 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index 4e3fbaae2..da580144d 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -663,3 +663,45 @@ void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_nu
>   {
>   	igt_fail_on(__xe_sriov_set_sched_priority(pf, vf_num, gt_num, value));
>   }
> +
> +/**
> + * xe_sriov_require_default_scheduling_attributes - Ensure default SR-IOV scheduling attributes
> + * @pf_fd: PF device file descriptor
> + *
> + * Skips the current test if non-default SR-IOV scheduling attributes are set.
> + *
> + * Default scheduling attributes are as follows for each VF and PF:
> + * - exec_quantum_ms equals zero (meaning infinity)
> + * - preempt_timeout_us equals zero (meaning infinity)
> + * - sched_if_idle equals false
> + * - reset_engine equals false
> + * - sched_priority equals XE_SRIOV_SCHED_PRIORITY_LOW
> + */
> +void xe_sriov_require_default_scheduling_attributes(int pf)
> +{
> +	unsigned int totalvfs = igt_sriov_get_total_vfs(pf);
> +	enum xe_sriov_sched_priority sched_priority;
> +	bool sched_if_idle, reset_engine;
> +	uint32_t eq, pt;
> +	unsigned int gt;
> +
> +	xe_for_each_gt(pf, gt) {
> +		igt_skip_on(__xe_sriov_get_sched_if_idle(pf, gt, &sched_if_idle));
> +		igt_require_f(!sched_if_idle, "sched_if_idle != false on gt%u\n", gt);
> +		igt_skip_on(__xe_sriov_get_engine_reset(pf, gt, &reset_engine));
> +		igt_require_f(!reset_engine, "reset_engine != false on gt%u\n", gt);
> +
> +		for (unsigned int vf_num = 0; vf_num <= totalvfs; ++vf_num) {
> +			igt_skip_on(__xe_sriov_get_exec_quantum_ms(pf, vf_num, gt, &eq));
> +			igt_require_f(eq == 0, "exec_quantum_ms != 0 on gt%u/VF%u\n", gt, vf_num);
> +
> +			igt_skip_on(__xe_sriov_get_preempt_timeout_us(pf, vf_num, gt, &pt));
> +			igt_require_f(pt == 0, "preempt_timeout_us != 0 on gt%u/VF%u\n",
> +				      gt, vf_num);
> +
> +			igt_skip_on(__xe_sriov_get_sched_priority(pf, vf_num, gt, &sched_priority));
> +			igt_require_f(sched_priority == XE_SRIOV_SCHED_PRIORITY_LOW,
> +				      "sched_priority != LOW on gt%u/VF%u\n", gt, vf_num);
> +		}
> +	}
> +}
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index b22f96d88..4382f528f 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -142,5 +142,6 @@ int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_n
>   				  enum xe_sriov_sched_priority value);
>   void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
>   				 enum xe_sriov_sched_priority value);
> +void xe_sriov_require_default_scheduling_attributes(int pf);
>   
>   #endif /* __XE_SRIOV_PROVISIONING_H__ */

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>


--------------43OYDQLY4gGRQPzBlKXxx10p
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/20/2025 21:34, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250120203445.16285-3-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Introduce a function to validate default SR-IOV scheduling attributes
for VFs and PF. This function skips the test if non-default attributes
are detected. The default attributes verified include:

- exec_quantum_ms set to 0 (infinite execution quantum)
- preempt_timeout_us set to 0 (infinite preemption timeout)
- sched_if_idle set to false
- reset_engine set to false
- sched_priority set to XE_SRIOV_SCHED_PRIORITY_LOW

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Narasimha C V <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 lib/xe/xe_sriov_provisioning.c | 42 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  1 +
 2 files changed, 43 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 4e3fbaae2..da580144d 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -663,3 +663,45 @@ void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_nu
 {
 	igt_fail_on(__xe_sriov_set_sched_priority(pf, vf_num, gt_num, value));
 }
+
+/**
+ * xe_sriov_require_default_scheduling_attributes - Ensure default SR-IOV scheduling attributes
+ * @pf_fd: PF device file descriptor
+ *
+ * Skips the current test if non-default SR-IOV scheduling attributes are set.
+ *
+ * Default scheduling attributes are as follows for each VF and PF:
+ * - exec_quantum_ms equals zero (meaning infinity)
+ * - preempt_timeout_us equals zero (meaning infinity)
+ * - sched_if_idle equals false
+ * - reset_engine equals false
+ * - sched_priority equals XE_SRIOV_SCHED_PRIORITY_LOW
+ */
+void xe_sriov_require_default_scheduling_attributes(int pf)
+{
+	unsigned int totalvfs = igt_sriov_get_total_vfs(pf);
+	enum xe_sriov_sched_priority sched_priority;
+	bool sched_if_idle, reset_engine;
+	uint32_t eq, pt;
+	unsigned int gt;
+
+	xe_for_each_gt(pf, gt) {
+		igt_skip_on(__xe_sriov_get_sched_if_idle(pf, gt, &amp;sched_if_idle));
+		igt_require_f(!sched_if_idle, &quot;sched_if_idle != false on gt%u\n&quot;, gt);
+		igt_skip_on(__xe_sriov_get_engine_reset(pf, gt, &amp;reset_engine));
+		igt_require_f(!reset_engine, &quot;reset_engine != false on gt%u\n&quot;, gt);
+
+		for (unsigned int vf_num = 0; vf_num &lt;= totalvfs; ++vf_num) {
+			igt_skip_on(__xe_sriov_get_exec_quantum_ms(pf, vf_num, gt, &amp;eq));
+			igt_require_f(eq == 0, &quot;exec_quantum_ms != 0 on gt%u/VF%u\n&quot;, gt, vf_num);
+
+			igt_skip_on(__xe_sriov_get_preempt_timeout_us(pf, vf_num, gt, &amp;pt));
+			igt_require_f(pt == 0, &quot;preempt_timeout_us != 0 on gt%u/VF%u\n&quot;,
+				      gt, vf_num);
+
+			igt_skip_on(__xe_sriov_get_sched_priority(pf, vf_num, gt, &amp;sched_priority));
+			igt_require_f(sched_priority == XE_SRIOV_SCHED_PRIORITY_LOW,
+				      &quot;sched_priority != LOW on gt%u/VF%u\n&quot;, gt, vf_num);
+		}
+	}
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index b22f96d88..4382f528f 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -142,5 +142,6 @@ int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_n
 				  enum xe_sriov_sched_priority value);
 void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
 				 enum xe_sriov_sched_priority value);
+void xe_sriov_require_default_scheduling_attributes(int pf);
 
 #endif /* __XE_SRIOV_PROVISIONING_H__ */</pre>
    </blockquote>
    <br>
    LGTM,<br>
    Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
    <br>
    <br>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------43OYDQLY4gGRQPzBlKXxx10p--
