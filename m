Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D238CA0EEB
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 09:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E63410E904;
	Thu, 21 Aug 2025 09:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZil8rKr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0542710E8F3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755769877; x=1787305877;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MRSaCzxSx4nc1FRALqdOsEJkP7KyQO0AA1gkxRg0/fg=;
 b=RZil8rKrmlwBmURZwGZuY33XdhIjnkjZi0mp+JnVbp7263sIUI8RNu0o
 RAMnxxsd7cO2HheDXcKhpob8/f8Nk1KhDCYlTsvCG7BUcvEYlNAAYegcf
 JibgTFpUEVOZ7AeblY6GfDzDPzsnol8lIFvh/Fp1Ny7EnNPM3d1m7y9hl
 94DH9206Q0D2AZRJlUQY4dUbVAYWcCPk0KSOaCVW9QZLvmSJ+9G5HdcRD
 ZB8MUkK+ipo6YaOj1VjGx/G63Yp2WIqVFMjzSdcVG+hAJ6mSwzbMB1wFd
 PC3vnYn6ThDbvJxRM/Drutb263ukqaJaV/9azICtLAvZ8W8Fy26jW/Nis A==;
X-CSE-ConnectionGUID: SiMb3pa2Tgem3kFo/lnpzw==
X-CSE-MsgGUID: dXYzDhMzTiqkOaFES8uMMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75503133"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="75503133"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:51:17 -0700
X-CSE-ConnectionGUID: K84a1WwHSUal73UVMz2FeQ==
X-CSE-MsgGUID: nmAr063sT/GqUCB1cZ8+LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="199247083"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:51:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 02:51:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 02:51:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.50)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 02:51:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvoexTTgY+Yo2Q5h9axl3u40RH0VDI38jZ+94NkPEFt/HV25pA1EsyrjFpCmslLfBxXZfn4QmTwMENXN/COnjoluwInyNG+HTYY9BPOmfekgj/TjDMH33Ao9LzF/OZ57BhYDS5pyxm3uL10aazbbshg8GNIgQ+kwLCe6mMVjZJxYsDIYRyiwhP/qlBo+BldFXJGZ+kDqGTF63CtDk9DEZ0p6j6ztQMGt1QeJuEGG+BzUkAUgkQba44dQEDvkc/ncgEQ7x1hnQ0fwjuWRiztnkVuSlG9X6HDju3viFFpsFAAkZu1loJDyOk6UcuSv+UvkCUUPiCETOVeKnfghrkeR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FY+kNxDirfiZF4AyTHkEOa6R4CpiMHY0U24iS1NFHRM=;
 b=b4lO0kxuu4IZw6KTsHtwnUNq2lsRwfMChiOzL7cRmdwT1cAc8mj+KUS8MTHJq+OFQ4gOSKb2ZIGBAg6n2F7SdTBpT8+o5FdrZLGcPHiBB3ZiU3hX5zz2Gv8PwVhNuKNEtdWEsilbTKCr9dRWyyx/a/C3HB9IJC5/5PHYEewuxFK1JUYanwzVFfEn7AEqcCRzdeu1wy09n9pMGxg3l1YoO2n9PZi2lmmt5/DpBsvy/KleNcQYu0p6UWfrLTyRjNA0T4ppa8mMt0bW+Q74aUh9AopPxDRTr+bT8SXjGJ/5k6Xe9CKuK0TppZUUBmEBAU6GxhgR3b3FnHnOQ+HML6rrVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Thu, 21 Aug
 2025 09:51:13 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 09:51:13 +0000
Message-ID: <12685b34-e2a0-4fdb-8237-730a2ebdcb85@intel.com>
Date: Thu, 21 Aug 2025 15:21:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/kms_hdr: Handle HDR panels requiring DSC
Content-Language: en-GB
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250811075850.28146-1-chaitanya.kumar.borah@intel.com>
 <20250811075850.28146-3-chaitanya.kumar.borah@intel.com>
 <10fb758a-30a8-49d3-bdaf-30b4fefe207b@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <10fb758a-30a8-49d3-bdaf-30b4fefe207b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: b5daae4e-f141-411a-dab0-08dde098435e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEg4U2JUbFVLaXRuZkNqOGlLU21jamhucUpHbkppVmh5M0FJckxkTFFCWXE5?=
 =?utf-8?B?djQ0S0pUNm5JMFdVKzdjR2c4QVQ4WG5EZmh2STdqZUhyQ0N4bll4MGkxS29O?=
 =?utf-8?B?b3BVamZJN1ZuNGp2Mk5ib1N5MEtUY1A0TWxXSDBDc1pHZ0hJOFRGaEpHd20z?=
 =?utf-8?B?bjBWL2dQbWZGZnNYTWtpZ0J3eEVKNHVCMHdoTUN4cldqR1QzNDVweFBIZW4w?=
 =?utf-8?B?Ni95VVE1ZEc5UFlZWGlwTytmeExhZ05XWk9QcDBDSlFiWHhRckNjcGdIK3Jx?=
 =?utf-8?B?UkJpTUFpQS9hN281UzFBbTRIbkVIRnVFRXJGRDc1Q2lyUG4vWTJHUzJBMG5z?=
 =?utf-8?B?MDFwTEdtVFk4eUpyWS9VclVZcklYZVZoZ3UrbXErb2s1N1czbEh1N0dXenU2?=
 =?utf-8?B?R2sxYm1tdS81MjVUdDZVN010Nkk4VHBJTkFvczJTbm83WGZKOWVDU2VxQ3FO?=
 =?utf-8?B?S09wcGJFbzVxa1BnR1F6NVRhKy9jemJXOTg2bGNkRUZTZkNZTmlZSlVVY2gx?=
 =?utf-8?B?YTJoQ1huekdXeUJEeEhVUWEzWitORHRVTUYyck1xYmlDdG05RTRxeEhqdTVJ?=
 =?utf-8?B?WFpFRVYyQXNSYlhMTXFURWxKcEUvd2tuZkxjMmpLbm9GbC9mRXppcG42ZUxj?=
 =?utf-8?B?MFJCeGVGMFpjSW1WOUZhNjB1eWRTbFMvUHh0Lyt3WGl6SE8zZ2RxVFN6eFB2?=
 =?utf-8?B?aEIyeVR0SEo0ODBoWUZwa3ljTEpzUCtyTEhWYUtOaitLUXhTSXVkS1BtNUZC?=
 =?utf-8?B?TUIxZ2pXb0JwdzBteURSTmNtYVBwOVEyZ2JYWU4wZXVZQzlVRXdseGs4N0VK?=
 =?utf-8?B?dzRxUzExYlVWK2M1aGtwR2prK3VqS1B2YTIwZUQzQ0ZlQ1RXeHRsWGhCMktD?=
 =?utf-8?B?c1A4MlFGRVIyQ3ROQkY0L3V1SGFCSlhNUlZaYzlPTGZmVm1RZ2ZROW1Va3l4?=
 =?utf-8?B?UXhvRHJSczFaK3lBV1BFTktTKzZpMnpqWHZFSGJpOW4wUFVuTjRvUkVPa3Ji?=
 =?utf-8?B?TTZzMExRcjBKMVBjMUtHWCtjS1hTRHR2NTFwbDhzRWo5VXRKTS9hVzRPQ3hB?=
 =?utf-8?B?VE9sM1lxdFhTV01CWEVMcStCU3o3YVc5aStHT3BZTjRIbjluNEsrcDNkcTc5?=
 =?utf-8?B?QzNCclZrRkV2bkk3Z0ExNkI0SmRFYzZBU0lma3Z4MDNoUDFaSDZ4VHlhTGhQ?=
 =?utf-8?B?WGxMbnUwYXUzdjd6dWNPYzI4eitjbEsxLzNHK1dFL0tIYldwUWowVVp3KytS?=
 =?utf-8?B?VHhZY3p4ZjBLYTNnM1Frb1hrN2dGNWlNK0ltQjhkTWNPd3FZeitMRjVOWExQ?=
 =?utf-8?B?S24yZnhIbDhSOWN1Y1ZQUlhJT3RRdjVXejNoVXYvbWpHVGdsRnJvV2lURTBw?=
 =?utf-8?B?eWpVdkloeHR6OGZQWmVxN1hSNkVtOEFzOG50QXAvSEp4Z2oxb2E2ZlNVVUFq?=
 =?utf-8?B?c3BoSXdlV0t5MmkwRFFPRnJzT3NFaDBuak40Y281RXcweU1aNFJMRVV2YWtI?=
 =?utf-8?B?WEpKRkZxbXJKYnNSOVJDMGJpQnNIcjU0ODhBaGVRNVZaNkI2UTNLQzcyem43?=
 =?utf-8?B?ODFBZ0I3bnFmMCtlRkw2SUU3QVUwak02VXV4WUZaV3FJdXFXcm1MaFI3cFl3?=
 =?utf-8?B?OHBFNHNCRnJEQVh5NGVMa0w1OGNQS1pJdUlyaGo1VXJrQ1k5WDlHODJGdWxH?=
 =?utf-8?B?QklYaXY0VkRnUm9rODZFbVhPUUVRdWtiTnIzZjJ3a1pQREVONUJ3eVduUmhl?=
 =?utf-8?B?M1BoNExNeTRCSjI2dlhQT3RwU05odkY0YWhhMmg2N2ZVT1RxeFZuYm16NkQ3?=
 =?utf-8?B?K01lZlVXczM4UGpOMFg2aUxoV1NmUFZESGZBbDhGR3d4UHB3YVMxQXFRMFR6?=
 =?utf-8?B?SGlBRFdKZHozT0tWRDJrT0F4bWlBa3F5azdxdkl5WWRIbFZhTXRxSnBzOXFT?=
 =?utf-8?Q?ZZEm0VOTsQw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVdCUGVwY2RFL1FQTHAwN01jbnlQc01RZm9JNkROL0NwVk1sOVJXSFpoS25a?=
 =?utf-8?B?dHdMdmk0b0trSFl6ODU3a2pZWDRrWDlrS2tJZUJkNGR2N0pVTjBwbHhaNmd5?=
 =?utf-8?B?c2VEK0s2VGhRdnRlSHQzalM0aCtVcFJDRUJLaEJ6bHpmM1c1dGtmSGNDOWxm?=
 =?utf-8?B?RzljZXl0bjA4WlVpSW9jYUFPQXg2NmUwVkhnbi9nVEV3dDlNdGptNmY3c2dX?=
 =?utf-8?B?YXQ4UTVOOENKREtqRW9hWGZCK2xjSWp4eHI3VXIrQTYrNENsUU1nbHprTXY5?=
 =?utf-8?B?Q2NKQXkxVHExNkNIRThiSHI1Q1p4WDY3a1VyMTd0b1QweExpVEdwZ0pidE5Z?=
 =?utf-8?B?b1RoYmlxeVQ1bHVBcityQmdXa3RVOEVMR0JteW14T2NWUEt4V2REZmo5K0Qz?=
 =?utf-8?B?bGNhdXVsVXpmZWc2ZEl6azJYdW5XbFJGNFhGN3QvYlJxakovTm9KMy9XTm5M?=
 =?utf-8?B?NkhoVmdWTTU1UG1BLyswL2VFZGFzdGxEWWNzbWg0bU1hN2kwZUNQWjZGZVFY?=
 =?utf-8?B?a3BVeVE2M2p1aFdIWFVzNTRPeXZFK21UMEF5a240TVNYYStqTDJtU1F2Z2ZL?=
 =?utf-8?B?dUZPS0dHRmozWElwNkNXaFF4YmY5NVpnK2dzNW5jL05MT0ZESzhhWEtLUktS?=
 =?utf-8?B?RE1RS0dHczI4bUk1dmdPWVJjb0NXWWxEWDd5YUhLdmlJZkxTdTdsR1NiK1g5?=
 =?utf-8?B?TGdGY3BneUVjWjNvbFh6TFNlbHpYNTY3eTFxVjA5dVVpZXhrMmtjUVVob3NS?=
 =?utf-8?B?NlYrTlZYc1VCY2JrVWxkb3MvcDRnNHdlTzZLbFRWUUhFNmIzUXFzaEZWencx?=
 =?utf-8?B?UjlSaWoxT1hYUmdlWi9hb05WZnlST2dDRUx6ZmRxVWVXbHVWeU81aUVpa0ho?=
 =?utf-8?B?LzJpSVF4UFROLzR1TlBGZ3FHNUpJV2k4Tzh1RHU0Zi8zZE00MnQvRHZ4Rnpi?=
 =?utf-8?B?WXBPdTkzei93M0ZaYmJOaXhHUHpJdUkrb3ZpcndnSmc3OGxxcVl0ZUFoelpo?=
 =?utf-8?B?dDZRcEpZam1Hb3NyT1NQRk0xVDhzOENWZXpRSHhoKzFtUzkxbWtEUlAvenJj?=
 =?utf-8?B?UjdmbFRaNkhVUzZzK0luK2NIQ2tzV1RGUzhQcDhVUXA5WmlSc2Ezd2NuanVm?=
 =?utf-8?B?WnBvcWo3c1BqaG0yM3Y2MXFCcWZFYjBoUm9UZ0VicDVWMlRoUWdtSHdkaXZi?=
 =?utf-8?B?YVE2Ukd0QmZWWjMzVTZTOWVWZURXS2tXclRoTTQxaEZJV0JRL1ptcE9CUWl1?=
 =?utf-8?B?T29XaTgzRUtNN2c1YjhNVk13ZXMrdEpoV3dST2JUanFrK2VvNXN0UTlGQUJG?=
 =?utf-8?B?enlXbHk1d2taSXZrcFh5bnhWbmZXSTVUcjZVcGxkWm5MOWh2cXNmb29pY0s3?=
 =?utf-8?B?V0N4RHFTR0gvMlZLcmM3MlVhWE1tVkQ2VlBmOG1kZmx3UWVUZ3RoTjdQbVhs?=
 =?utf-8?B?QjFucVVYUFpCRTdvWmJlQ29uelVrRWJOVDl6MEJPa3RHdlIrOEV6K01YRkk0?=
 =?utf-8?B?ZVpkYnNVS0pPd2dpejYweGtXanByQ3B6RVMzMnUwNUdndWZyYVhWQjJHY0E4?=
 =?utf-8?B?dnZXL0RZbWRWUkZ6TllPamp2TVp4NlNKUm41S0pHeTJFTUpPS2diMnRpYmxv?=
 =?utf-8?B?NkZKbDdNeGxtNWtvWFBSaER4cEV0NXQwaStVbWNEdFlmMHh0OVE1SlRtNlk3?=
 =?utf-8?B?KzdjNkI5WVRiaVQzTEk2YTVaejhNRW4raFdEWjFEVWNrOUVvellYQmdQL21I?=
 =?utf-8?B?UkZneWh4dVdiMURQTm5TSFpsSHhmRnFydnhCN3BFbDlVOHFEdmxOYW83VHZm?=
 =?utf-8?B?bFpHR0wrMVV5WjRLNXZoUDh4dmVoTFJPTjUrRi9ITXpwZlUrM1dnTnUxdjB6?=
 =?utf-8?B?anNVQm05bWhSWHBmaXJvSkNLU0RYUE9BZTFOcDZQUE9VMEJlL2MwUXRHUmJQ?=
 =?utf-8?B?TEFTb1BpWU9yWjNpK3ovZ3FlMzFZMzA5VW9PVE9wKzcyVmJsbllxbkFWVlJD?=
 =?utf-8?B?YnFDZDE4OXdoSW9TQWtINWIyUnRnQklOUklScnh6Y1ZmNThwODNxRU9xQTgw?=
 =?utf-8?B?NkxmdUJERmswQVRRS3I4MTllL0FLbHdBb2Fzc0Eyd2QrM2tuNzNsWDh0dlJP?=
 =?utf-8?B?dDV5M3pORnhPRW1adHRHMm01ZTMySjdZc29kcS96NVZuUDZDM3pYN2cyamNC?=
 =?utf-8?Q?rZoRtAJhyyIg9mxXMJkG39E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5daae4e-f141-411a-dab0-08dde098435e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:51:12.9260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZY3rOwm8NPnihikZGzjIO/CUM3i+zxDoNRFMEBpQ+u/D5gN45PfVgl4naIx2bkxgaD/D2spNHlDNosq29YhEYoK6AIV2PDmutPPLh1RiGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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



On 8/14/2025 1:46 PM, Sharma, Swati2 wrote:
> Hi Chaitanya,
> 
> On 11-08-2025 01:28 pm, Chaitanya Kumar Borah wrote:
>> Some panels needs DSC to support HDR (at least in higher modes).
>> In cases like these the output bpc and crc comparison fails if
>> the SDR/non-HDR mode does not require DSC. Therefore, force DSC
>> when in SDR mode so that output bpc and crc can be compared.
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   tests/kms_hdr.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 50 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>> index 76e103ac4..c1123531a 100644
>> --- a/tests/kms_hdr.c
>> +++ b/tests/kms_hdr.c
>> @@ -97,6 +97,7 @@ enum {
>>       TEST_INVALID_METADATA_SIZES = 1 << 4,
>>       TEST_INVALID_HDR = 1 << 5,
>>       TEST_BRIGHTNESS = 1 << 6,
>> +    TEST_NEEDS_DSC = 1 << 7,
>>   };
>>   /* BPC connector state. */
>> @@ -491,9 +492,20 @@ static void test_static_toggle(data_t *data, enum 
>> pipe pipe,
>>       igt_plane_set_size(data->primary, data->w, data->h);
>>       set_hdr_output_metadata(data, NULL);
>>       igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>> +
>> +    if (flags & TEST_NEEDS_DSC) {
>> +        igt_force_dsc_enable(data->fd, output->name);
> Can you add debug prints in lib func() ?

This will cause duplicate logs for force_dsc_enable_bpc().

We should try to converge both the function in a future clean up.

==
Chaitanya

>> +        igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +    }
>> +
>>       igt_display_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>       igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
>> +    if (flags & TEST_NEEDS_DSC) {
>> +        igt_force_dsc_disable(data->fd, output->name);
>> +        igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +    }
>> +
>>       /* Apply HDR metadata and 10bpc. We expect a modeset for 
>> entering. */
>>       set_hdr_output_metadata(data, &hdr);
>>       igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>> @@ -518,11 +530,22 @@ static void test_static_toggle(data_t *data, 
>> enum pipe pipe,
>>       /* Disable HDR metadata and drop back to 8bpc. We expect a 
>> modeset for exiting. */
>>       set_hdr_output_metadata(data, NULL);
>>       igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>> +
>> +    if (flags & TEST_NEEDS_DSC) {
>> +        igt_force_dsc_enable(data->fd, output->name);
>> +        igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +    }
>> +
>>       igt_display_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>       igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
>>       igt_assert_crc_equal(&ref_crc, &new_crc);
>> +    if (flags & TEST_NEEDS_DSC) {
>> +        igt_force_dsc_disable(data->fd, output->name);
>> +        igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +    }
>> +
>>   cleanup:
>>       test_fini(data);
>>       igt_remove_fb(data->fd, &afb);
>> @@ -558,7 +581,7 @@ static void fill_hdr_output_metadata_sdr(struct 
>> hdr_output_metadata *meta)
>>       meta->hdmi_metadata_type1.max_cll = 0;
>>   }
>> -static void test_static_swap(data_t *data, enum pipe pipe, 
>> igt_output_t *output)
>> +static void test_static_swap(data_t *data, enum pipe pipe, 
>> igt_output_t *output, uint32_t flags)
>>   {
>>       igt_display_t *display = &data->display;
>>       igt_crc_t ref_crc, new_crc;
>> @@ -577,9 +600,20 @@ static void test_static_swap(data_t *data, enum 
>> pipe pipe, igt_output_t *output)
>>       igt_plane_set_fb(data->primary, &afb);
>>       igt_plane_set_size(data->primary, data->w, data->h);
>>       igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>> +
>> +    if (flags & TEST_NEEDS_DSC) {
>> +        igt_force_dsc_enable(data->fd, output->name);
>> +        igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +    }
>> +
>>       igt_display_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>       igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
>> +    if (flags & TEST_NEEDS_DSC) {
>> +        igt_force_dsc_disable(data->fd, output->name);
>> +        igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +    }
>> +
>>       /* Enter HDR, a modeset is allowed here. */
>>       fill_hdr_output_metadata_st2048(&hdr);
>>       set_hdr_output_metadata(data, &hdr);
>> @@ -602,6 +636,10 @@ static void test_static_swap(data_t *data, enum 
>> pipe pipe, igt_output_t *output)
>>       else
>>           igt_display_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +    if (flags & TEST_NEEDS_DSC) {
>> +        igt_force_dsc_enable(data->fd, output->name);
>> +        igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +    }
>>       /* Enter SDR via metadata, no modeset allowed for
>>        * amd driver, whereas a modeset is required for
>>        * intel driver. */
>> @@ -623,6 +661,11 @@ static void test_static_swap(data_t *data, enum 
>> pipe pipe, igt_output_t *output)
>>       /* Verify that the CRC didn't change while cycling metadata. */
>>       igt_assert_crc_equal(&ref_crc, &new_crc);
>> +    if (flags & TEST_NEEDS_DSC) {
>> +        igt_force_dsc_disable(data->fd, output->name);
>> +        igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +    }
>> +
>>       test_fini(data);
>>       igt_remove_fb(data->fd, &afb);
>>   }
>> @@ -714,6 +757,11 @@ static void test_hdr(data_t *data, uint32_t flags)
>>                   break;
>>               }
>> +            if (igt_is_dsc_enabled(data->fd, output->name))
>> +                flags |= TEST_NEEDS_DSC;
>> +            else
>> +                flags &= ~TEST_NEEDS_DSC;
>> +
>>               set_hdr_output_metadata(data, NULL);
>>               igt_display_commit2(display, display->is_atomic ?
>>                           COMMIT_ATOMIC : COMMIT_LEGACY);
>> @@ -728,7 +776,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>>                            TEST_INVALID_HDR | TEST_BRIGHTNESS))
>>                       test_static_toggle(data, pipe, output, flags);
>>                   if (flags & TEST_SWAP)
>> -                    test_static_swap(data, pipe, output);
>> +                    test_static_swap(data, pipe, output, flags);
>>                   if (flags & TEST_INVALID_METADATA_SIZES)
>>                       test_invalid_metadata_sizes(data, output);
>>               }
> 

