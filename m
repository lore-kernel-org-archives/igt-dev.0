Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D599EC61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 05:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBD310E188;
	Thu, 12 Jun 2025 05:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hf6LsYli";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC62C10E188
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 05:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749705241; x=1781241241;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EVUxu4M/sXtBDcfF5MXFSWo1mf2x2wItCU74/pRTTLY=;
 b=hf6LsYlis03S0pbXqoEUHoFja7FbN186BSjkcEWzkeX8kJKPgY91CCt8
 LcWl4IDSL5Qd3Huc4wpR661AMZQ5ymrhqoxD/k0gaM2ZwOVARHRBnmWZd
 96BHA1ZFpyPOuH1K4x4erGgSeG96DVqaNWmub2LJLuek9r9vI6t1OwaXt
 KQlDmsMWqtpwHIsovYbpoSqcoi217JI15A11pXZqmcgSg4y7tgh/SUQpJ
 cbY/SHejMd+/uCH6heN3khDlURGxta2i4uXL+a1Ed2PmUcMWs0/RlQS6e
 qKhmWOHf2lgTUamL6gvuDa7Ra1GqqRS9bNTufC+KxbeUEe5CF17ARrdE9 Q==;
X-CSE-ConnectionGUID: gw/Ca4RKTDSek7QJWbYxaw==
X-CSE-MsgGUID: V8bPnsjpQKyghBk/5FEGJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="39478842"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="39478842"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:14:00 -0700
X-CSE-ConnectionGUID: GxryRqF/SI+CbNQXK0AuMw==
X-CSE-MsgGUID: cyh+fMTOSzOoKuuxAb0zew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="178311434"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:14:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:13:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 22:13:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:13:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2icQyS6GMeGSsiDxyC1oHZSgnzyaGlF5I7nAdIZZ7Tz+DcMCpXdcrFjVEfTNzpwa5qQnCa9Ty+YXT5dReiXnqS6MfoiHZ+GOh3f9xBN90eAYq+q95+vLEYU4BxF1pFZntTzDr24a4ljUFIOTJdHCgdQPj3kUI3s9mWo0ziWZmC0+qa9EseS39BDul/tm2lVz2N0y7OBCJWx2CAuMH1nxXMVB0uIdNuML7UYm8QbjFkN6R3SXEGxL5DH6oeG75rRHPDk0tyomDFmVZ09q+NcHagbacA3Mk1ovmFo7yJxWY2gP6asZbP6tCcyvRiEG1aaJrpb0m3k2GoqZgJ523LK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9kpHqsYxDeTt/CO6WLKpErtRERKzHwgRCwybO+0KZE=;
 b=Q6aMkLnJpp1kmx0rH1APY56fEwu1pWGVKqIWv9YnhAxlkF5mEVoZ3ueF3yMIzBWBd7sAd5I+5OTTGOar0R/MxL07hZgqntY9jxExac66sN84OcPVve/htKDaHE5vyDZcACtAZHSUAMAl9N9Tb6RdXOKn7HdOzF2SlAGj4o26g64nedSk20DtEgqaXgNT4ozz5rsFnMVGwue330ApuuFc3AuUnFuKolqEHrohkJuO9zNT4ajbvxZ5R11yOmpsBo67+q2z/UpgMa2p6tJKq5Jzc3sGAzFrUx3OOstBWrK+MfoQ3eF/TeXYhg66vQAbrKIW+3O4a9/6mo0V64zJlD8Ymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS4PPF7A0031045.namprd11.prod.outlook.com (2603:10b6:f:fc02::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 12 Jun
 2025 05:13:30 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.8769.029; Thu, 12 Jun 2025
 05:13:30 +0000
Message-ID: <6b03e210-b162-440a-82da-9510a6dd6584@intel.com>
Date: Thu, 12 Jun 2025 10:43:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/amdgpu: Fix compilation warnings for USERQ
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Sunil Khatri <sunil.khatri@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>
References: <20250611212500.1940399-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250611212500.1940399-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS4PPF7A0031045:EE_
X-MS-Office365-Filtering-Correlation-Id: 068ad920-b866-4a07-e4eb-08dda96fde5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHJwZXNvMFIyQXFmNU1HbUU2dVBkUWZTbHp0RFFQd1hFK3lGclI0SmtNV1pv?=
 =?utf-8?B?cTFTeEVHaUtVc1p0amdVK003TEtyT2h3SU5jWXJqeHJOVDAyV3VqNjE3cnNV?=
 =?utf-8?B?ZG5LdEVJc0YvVHNEOW5QVktvaHFuVnEwSzlGVHB6NUo0em5tdjJJSDRaNENi?=
 =?utf-8?B?K3NIMUtwdkRJaDJTUGZZcUduSndobUVmQkpHajhvNldRaHVKSWxEdnQ2Z1Rn?=
 =?utf-8?B?L2x6UjRtanpmc0RkQjI0aWRteU5Jc0ViQ3QvSnZJWStOVFNyZlBmb0dwTmUx?=
 =?utf-8?B?ZWlXajdqVU1qc2pDT3pjRlVNY3NiVXRDR0pXMGVKSGhnR0hxb2N2WGYzdXVw?=
 =?utf-8?B?MXRodThJRy9TL0RMRk5yWkdwNGpCQ2x3ZmxoaTZWQjcySEJlYUZ6K0tleEx5?=
 =?utf-8?B?bDQrZFVwaGZVNGQ2UHVHeXpTNzlPNm81NUpZOWNpVkpjd3ZXTXQzcUNzNlQ4?=
 =?utf-8?B?ZDdzQ0daUFc0RDZ4dDgrMGNZTDQ3UUozcmx0eHZrdG5YY3Znc3hMaWRKalJz?=
 =?utf-8?B?dUZnbGE4Ym5QU241Z2prS3pHK2pnY2VSeVg3bDVLYjdtNFdCTUhLRHJBMU90?=
 =?utf-8?B?bUFBSm9oVGZCNHdBbVBmaExGN3o3NXRNVGoxdHJ3bTFoVk5rbndxQ21CVTBm?=
 =?utf-8?B?NDZoMk5JTXRYa1NsaDBrRkhCRzU1MG9COXAzYkF0KzJ1N3JYQkdkQk5wZldQ?=
 =?utf-8?B?QzNxVis2VFd3T0wxcENlWjRiTDhoVWRqN0tCWmpmVG1HazZYMTVVTW9xa0hM?=
 =?utf-8?B?YmNHSXFsVForWW5CVEZHVlJFMmZFbkFUK3JTN0c5cGsxaXhRU2dVaWc4YUxU?=
 =?utf-8?B?WXFGeUcwNTJHNU45N3NpdlBMT1RVODBtcFl4Ti95UDV1Rlp4d1djNUtrdnRw?=
 =?utf-8?B?YzRvTHB4RE1FT01NbGtuZDA3MzFIR1RPczIwZjNLaU5lOGZLUWRydkZncDd1?=
 =?utf-8?B?S21Tbmw1WHV6RkUyREVreThuN0gxWlhSNFp6OWFNeUtWVExLdUpJU3BpVUtR?=
 =?utf-8?B?MzFZdUk0RWRJZEpmZDlzSjJGTkJ1azRMdGJEM3BPamxieDJpY1NEd3pSVm5D?=
 =?utf-8?B?V3hQMVQ5cU5wMXdQS0lLMlRkUWZaR1ZIS0xaN016eE96WmhoYmxodG90ZmNR?=
 =?utf-8?B?eTE3QVVxOVkyRDZXWXQvemk3NEtWbU16NGFLeThHVGxGYjFpYUxBN2Jjakxx?=
 =?utf-8?B?VmNqdmFXWXQ3aG5NWUJWZE1HMDN4MnlxN0tXR1dQK2MrVGFjRlN5V3pxMTNZ?=
 =?utf-8?B?VTJ0ZnQ3SGwzRlhIRmc0bUd4eno0MXBtVW9OM1R3Vk9xZ0d4NHVEeHBuVWtw?=
 =?utf-8?B?M1lVeHhtY2tsWWdZOFZuSnpGYkd2dWt3WkpJeVBjcGxXNWpvOHpwUDAvNUpq?=
 =?utf-8?B?UmNxZVY3eUFHVUYyakJUUkl4SGNGZ3JReU5EaHczQTVHdDR1TS9KSUVieGU4?=
 =?utf-8?B?QVdoTHNKZTNwRm5jdjlwSGJ4b1JPOVR5ckNsM3hpakRySVZHR3ExYTJMb3k4?=
 =?utf-8?B?NWtOQWY5TzBkem14TUNoUFphN3VsUmRmMTRwVTU4NHUzRUw1U045WDRScG1u?=
 =?utf-8?B?TWxyUGNnU0hGVUE1Vzd3SGQvSmxyWXpZL1lDRWZFTHZ1S0pad1M1TWZIUlRU?=
 =?utf-8?B?anhsNGlXQXAxNjVIL1ExN3U4aXF6VVJRS3RyZ3lwazFZTnJiaGhSTEdXR2l1?=
 =?utf-8?B?M2dFdnA3S2xaQVlxaUVJeXVxWldHRXo5Y01XNk9uSVRONVdCSUlrdHoweCtD?=
 =?utf-8?B?VFIvbm4vNEJuNUhFd2ZBNk1NS3RaL2JNQWdqakJNY1ZLUi9xd1VBeEs5akds?=
 =?utf-8?B?UTlDbmhVZWZ1ZmQwVlVYSjlJbkdRaWdCKzhRT1Jud0hJSnN0L29mOU1reXpB?=
 =?utf-8?B?ZlVRQS92MFMyMVFSTWNUWnFrQWdRNmdWRXZEZFcyMm5yMzJCN2hWYWhwOFB3?=
 =?utf-8?Q?KMgCOqU8i1o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHl4aHh2VVgwVnptcVIvU04rNkF4SkhjNThkTzFJcmk2cWIzRCt1M0Q1bjR2?=
 =?utf-8?B?ODlIUitJLzNpczNIR2NEZUFkVUJEVkxUR0RPMTlPeWtuemdnQlRrV1piMUNG?=
 =?utf-8?B?T2FkVklzdmJyRnUvelJ1Y1o2ZnA5ZzY1YlpONC8zeDlqTVBRNHQyQ3JnbS9H?=
 =?utf-8?B?RGFpZVZCR1ZDOHBEalZGaFg3RHc2QUx1MmF4TGlGTnRxcCtVbXo1ZFFHWjBQ?=
 =?utf-8?B?bnROUXgrVHRCSzMxWmVhN21ScitWVlM4RGNZcTZ1cVRvZmVlbU1Eb0tEREZM?=
 =?utf-8?B?V2ovKzJPV3FHTGFSRDFtNzZvTytLR3M5VEpqMy9wVmpIaXVzeVkyRXVmaHBo?=
 =?utf-8?B?MEFGUThpUEY1VWFoRkhkK2FOM2NicGoxeDFmbXRnejVSdUt6ZW1MQXY5Nmlz?=
 =?utf-8?B?SlRWZXRXZU9uL3BWR3VMb2M5NnQxYStGSXZuREh1aC9keEUvTXhOMGhrVkZF?=
 =?utf-8?B?cFBwZTZOZDdzSSttRU9pV2RkZGlmOUlQaE9Gbkc3QVQwLzkrSmRITlU1c1Uw?=
 =?utf-8?B?SXpOMjVVL2pvajdOYzYvU0hMYmFMWlRlNlNMOStPczZRRXVUaXNwaW1DV2RC?=
 =?utf-8?B?NldvVjR5cGZsaTZvVW1RaVdoRkcwYldZektVUndUUlhEVWN6TnBaeXR3ZmV6?=
 =?utf-8?B?dFlNaHBIVGFSa0YxdzluRkl2SmpXNzRoTnVMeksyb3A5TStlNS9GdGlZalQw?=
 =?utf-8?B?Q1RIUUU4aHN5NGk4UndhZXpYZzFjQ3UwbHQrTml3a1NDVE55NWs4b2VrRDcy?=
 =?utf-8?B?bkFQczBzNFIzcXF0QWkyb1Z6TzNhSkVuK0UxcDEwZy80eThWNmRlT2YrVnJh?=
 =?utf-8?B?aTAvUHAyREhmUW9qU2lzcWNveE5zTDFURWc5MDhIdkJLYk4zRzRrbVArNzdo?=
 =?utf-8?B?WVV6TnIzU204TU9EKzNQdlVJYUpiYkJTZkc5U1VwTml5MFJURzRJK21FbUNy?=
 =?utf-8?B?Y3ZkOXlESFJkOTBQcmF1THlhVitOWk5FZmlkRVoyR21CUnNtUTNMa1dYeWY3?=
 =?utf-8?B?Q3FmTEpYUWs0a081YTVkT1dtc2hKT2JzbGEwV0FPb2xFTWx3WjRkUDFNQVlj?=
 =?utf-8?B?QTExNEVUYUs1MWxXMklRMGpDUUdBbFhZaVRZVS9aLzF1QSswUE0waVdtcCtr?=
 =?utf-8?B?dG5COGZOYy9JUGhXTnhDSmV0QnJFVXF3R29ZMUE0YnpNOUh3S2hwVzdjOURn?=
 =?utf-8?B?MTQwbVJ3Y1J4SDFTNnFCY28vcWpVcFJkWCtJWm1RYUtSUnZJa0tDRHJSdVpw?=
 =?utf-8?B?bXM2dVNSeE8reDFIeVdTU21VRW81ZDNvMnNoN0dIdXpsa2s4aDk2ZjVrMnR6?=
 =?utf-8?B?NEd4VFJyZ3JUYmFtUHV1d3BzSGdsLzkxMmR3N2xyY1doT2xwRU9BOW56TXdD?=
 =?utf-8?B?Wmx4cjJaVVdZYlM1Y080VTZmMmo2ekdIaTE2T2p1V0RrUTZGK1lCRE1KaG11?=
 =?utf-8?B?ZHN3czB3bDRpclQ5anV5c0ZsdDRwSnpSVS9NOG1sN3JUUDVmS1BiL21kUFY0?=
 =?utf-8?B?eWwrYlNIMVNlRXBJVjQyVXZaVVZ5K3RLeFFRSGJFbE5mMnpuWlF5NzZwUTJh?=
 =?utf-8?B?N0gxMGxYa0wxby8yVEtmTHdObC9ZemlEWkdQaEZRVE9BRXN0TkJJNklLdTlN?=
 =?utf-8?B?ejI2YWZQVnkzL043OFErY21xZGVnNVNESjE1eFlqdGdTR2c4QUN5R25tK1Iy?=
 =?utf-8?B?WndsRFpBNnh0QU5HRllyS2JYL0RucjBvZ2QrdERqVi9EVk5vM3FjZE9SYkFC?=
 =?utf-8?B?ZGU5RVdSc3JGa1ZGeFFRa1RoWmIvMjVDUCtDUXpONGk1NXlVSUgwaDg4UFFT?=
 =?utf-8?B?UXczQ281ZGE5YmtvdDlRaHoxckd5TkVPNDNtK25NWFdmdytLUlBpT2RXcDFP?=
 =?utf-8?B?L1ZHWk9LS1FaS0RJV0JpK2h4emZvcm9EZUk4dGd3eExlR0RoTnpuQm5Fdk82?=
 =?utf-8?B?VVA0QnZvY1V1cjJoMUxXZTF3dWZqOU5Ca3FGL3ErN0RBZ2JZZy84WVZOYUhh?=
 =?utf-8?B?ZktGZVhYSCs5V3dadTB2VWhCRkZXZ05QZ3BHWHJFc2xwTDhVK1RMZkMyL1FS?=
 =?utf-8?B?WHM0ZllrTURqS29Nd2dOK2Z3dEJraEZ3NVlBNmU0Z1VncDh1c3NvLzhvUGNO?=
 =?utf-8?B?bVF6cGNDU0Q3VGFTSmtiZk0zejNGTWZTUWNnYkVKVkRHR1dzdHpDOEVVZXJL?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 068ad920-b866-4a07-e4eb-08dda96fde5f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 05:13:29.9484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMyVqMgeqvWlB5YlgKSnS2pqeofka51kYpzmrHhZ9MZcU0IufsI8dBqRuCRHopRaFPxkhr/EuU9B5gCsLYvSzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7A0031045
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


On 6/12/2025 2:55 AM, Kamil Konieczny wrote:
> Recent change brings compilation warnings when
> AMDGPU_USERQ_ENABLED was not defined, for example:
>
> ../tests/amdgpu/amd_security.c: In function '__igt_unique____real_main311':
> ../tests/amdgpu/amd_security.c:319:14: warning: variable 'enable_test' set but not used [-Wunused-but-set-variable]
>    319 |         bool enable_test = false;
>
> Fix this.
>
> v2: removed additional vars and prints (Sunil)
> v3: correcting description, moved var setting back (Kamil)
>
> Cc: Sunil Khatri <sunil.khatri@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Fixes: dad4b2bb9e5a ("tests/amdgpu: add environment variable to enable tests")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/amdgpu/amd_cs_nop.c   | 2 ++
>   tests/amdgpu/amd_deadlock.c | 2 ++
>   tests/amdgpu/amd_security.c | 2 ++
>   3 files changed, 6 insertions(+)
>
> diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
> index 644016d5d..c406f2fc5 100644
> --- a/tests/amdgpu/amd_cs_nop.c
> +++ b/tests/amdgpu/amd_cs_nop.c
> @@ -171,10 +171,12 @@ igt_main
>   	int fd = -1;
>   	bool arr_cap[AMD_IP_MAX] = {0};
>   	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +#ifdef AMDGPU_USERQ_ENABLED
>   	bool enable_test;
>   	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
>   
>   	enable_test = env && atoi(env);
> +#endif
>   
>   	igt_fixture {
>   		uint32_t major, minor;
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 45a864feb..2330b2955 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -43,10 +43,12 @@ igt_main
>   	bool arr_cap[AMD_IP_MAX] = {0};
>   	bool userq_arr_cap[AMD_IP_MAX] = {0};
>   	struct pci_addr pci;
> +#ifdef AMDGPU_USERQ_ENABLED
>   	bool enable_test = false;
>   	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
>   
>   	enable_test = env && atoi(env);
> +#endif
>   
>   	igt_fixture {
>   		uint32_t major, minor;
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index 45bd7e771..4f38ee04e 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -316,10 +316,12 @@ igt_main
>   	int r, fd = -1;
>   	bool is_secure = true;
>   	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +#ifdef AMDGPU_USERQ_ENABLED
>   	bool enable_test = false;
>   	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
>   
>   	enable_test = env && atoi(env);
> +#endif
>   
>   	igt_fixture {
>   		uint32_t major, minor;
