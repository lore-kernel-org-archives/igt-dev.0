Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DD9C02193
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 08:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDD110E299;
	Tue,  4 Feb 2025 08:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kkj06aNT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E56510E299
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 08:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738659562; x=1770195562;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eCrMBgIcqY1RW7XajzYauS/ycM6JhGaP0KDCsNH1u4g=;
 b=Kkj06aNTg19+LibAjvK2J/fHul6ZepHm1aKPPPQBru2EarE7MFQ8xDEa
 15l8TFk4SdVu8xv7RzdoSQ4pN7plZiP3EjNrwg96naTuU57YP9xdfjm4r
 KqjeHCxVekwHkai1j/WGmD5Uk5MNW+8jSfgMLdcPLU+GIauh9KVG5boU/
 0n/FEWFcyzOhq+Lzp+hs40CJ6p70V57shBY+6NcQMJOiZCuD9EiFnbaKK
 jja16AVPRf/sFO8/C00U1zenur/PtnVQmAxp/twJIk226WHtvS/K5Gq6m
 TpayfQhhtGryC4bioM54iK+ZWHd+rq1qfRVDZhs1yhZB3z19etfGmvBz7 g==;
X-CSE-ConnectionGUID: j2KR6iAKRf2gbolxo9O0dg==
X-CSE-MsgGUID: AgOPvKyETX2d711E8iubpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38406020"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="38406020"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:59:22 -0800
X-CSE-ConnectionGUID: OMHZqHMbRYm1rxef49IQCg==
X-CSE-MsgGUID: erFsbIdjRg6mQldubIprTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="141392906"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 00:59:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 00:59:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 00:59:19 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 00:59:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDLeqzi3gOvO+dp5pSr56fD+WFrDgm3SxXq3xywdsD+5546UkP8KsiGnKTpz0zP4WBoDOxraQQsG49Mtqw5s1i0N70XZCAJhR/38Vg0uaEjh3AL++C36muaMNv8TF04ModBjzVgpsaHi8yfpV40gQeNyX5ZslxzxS10Cv72HUZHnrnHIAwaY7ucbEtvOQtbY3DirkAdzBp/AqMrprTg3uz1wsr5j5pTwWv6KFDMbUGXcV7kNwMvpLxISOVPumq/Xp2OjKXKBoItQM2kHf9LJROuEEl45pTic0hsESGI6o51zRcQifH8ccsKD7M2DjHAqV5n7NjOjAj9/orZ2ImBOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nH2jstUXNll6OF1K5rvLDiNxsJ4w3jDkgM0SC+cJyso=;
 b=ebux5/eWw3oVkNFekQz/UfyER7c+gaQx4P99tJq98omFQg5nQOUCGf+Krq5OjxR3ViIhBXTpudX3SU6SeugRb6sOUzD7ektCs7J5HmDNwPrj7ZvVFH9fvqvVF82Krbv8F6XNZwwUBtaLDgXyXbNZCFcWUMyzPIJV2SjPXgeoC2PtVSKdF/7BUC4hoK4cIC6t02v6eo1lsuRDI+p86P/OcYtN/BFfxdXUgroGJ894kl+XUmkAwzWsdqClFvhs6HQ09nrdox9NK7ph2M6/6aqhBU0GkY7u2iy1Yox8nkWSP65wlC/4LIf9FRfzqLGLR7f+AbFGnuHgUr439gMRPWCUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 08:58:31 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 08:58:31 +0000
Date: Tue, 4 Feb 2025 09:58:22 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/3] lib/intel_compute: Align objects on 64K for xehp
Message-ID: <Z6HWrtfy-EGLQ0vE@fdugast-desk>
References: <20250203133916.843931-1-francois.dugast@intel.com>
 <20250203133916.843931-2-francois.dugast@intel.com>
 <20250204055531.njw5xxuaybfiobqx@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204055531.njw5xxuaybfiobqx@zkempczy-mobl2>
Organization: Intel Corporation
X-ClientProxiedBy: ZR2P278CA0088.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e1bdab-1f0b-4c81-b86c-08dd44fa1908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnJ1Q2FSRURhNG9pTGEzbk5jZDU4N29pMmRkL3d0Vmw0VStSZVBkcVg0bkFE?=
 =?utf-8?B?YkxuZW52R3E3c3E0SnIxRHZBY3l0cmQ0K2tHMFl4UHU2c0c4VnZMRVhaRE5h?=
 =?utf-8?B?WEo3ZEhDaUNZWHgyQ2NaMW9wbUNxR0Z0Y1M2dUZlcWIzbm93VVhGVkNZWlBC?=
 =?utf-8?B?NzlDUGkyUkgyaUlUSm8xWlkyblhhVXpPTFhHRzlvelRBZmhuaUlmeVp1NHJV?=
 =?utf-8?B?aFpaQzRtWmxaUE1seng2a0xZdDZXRWpOYi9PR1JkY1hmNXpjQWhFcXdvRU1z?=
 =?utf-8?B?ZmdiWGEwa05IYktTQWJ0NXJEd1I0Mmp1ZERyN2NTKzhpZ09nL1VUa3NGdHVi?=
 =?utf-8?B?aVVXVFBMNFhuUWxKRkZsUm9JcXVpSGtmUDlSL3hIZ3J6UzAyMDMwRXE4alFC?=
 =?utf-8?B?TXUvWi9wNUFGVndaa0FNT3phUHpJNjZJeTl2Z2U0ZHZSdU9iSzdNOExGMFoy?=
 =?utf-8?B?SWhoY2tmUjM2cWdGMXlWcEs1ejBnMkRyWEdvWmxVV2JRa1VkUlc3aUVnU1R1?=
 =?utf-8?B?bWViVVlvOFJsNU5IYkhaTU9lZmJwNnltOStrSVY0dVdYZzNZZm1GY01UOFVj?=
 =?utf-8?B?N3p6bld6WnpQdkxSTDNmbnZHbHZDcmxBb0R3enVaeCtqc2crc2F3NHdPbXJL?=
 =?utf-8?B?Q1k3NzluMFExTlFydHY3UXUySFBBb003SHU5eVVKMS9IYkc3S3J2WDFrZlZt?=
 =?utf-8?B?V3Vldy9ycEdDSUNMKzNKZEhNN1NIbXBJb1hPdWhacllOem94TzFTNVM2T1pp?=
 =?utf-8?B?NXVtanZnN0NWQ1JLaHVSR2d1LzZlZk9jNkNSbVJZdDVOZ1hucXF5Q3lyL0Z0?=
 =?utf-8?B?Zk93bGQ4d2dadFlBVng3S0IzQXowZzI5MUdwRmFFMzdOWnpKYTY4eVFNMjJ4?=
 =?utf-8?B?TTBGVG4waWhXRXdrZzNScFF1bnhBOE90NGE0dVZuZDJlRzNrc2hTK2hJbDBM?=
 =?utf-8?B?MlIvZlU0Q1hZS0poVTk1ZzVXR0o2d1dTeEZqVlJ3eTl6K2ZtNForVmlnWkJM?=
 =?utf-8?B?YkQ0TlVZS0paWCthbVpDRDVMejRUaFNWWmgzMXFOZ01sem9VU1FYVy9abXFR?=
 =?utf-8?B?aHlybTBjaHVmc3JydHhIK2QxZGpXWXVOSEFEc1EwQ2lTWU1aY0pUbTArempT?=
 =?utf-8?B?ajZ2NzJyRldPaEFhaVVLVmxsTW8xeVhvMDQvZXROZmlnd1l0VE1USW9GcDJO?=
 =?utf-8?B?a0wycVFuSjNFaW5oWmVOaXpZQVVqakFacjRKL1Z4TDRSYVd5NVVFTGcvZ0Vx?=
 =?utf-8?B?Zklack9IdnY2ZHlUSWRTTXVoeWd0YklIamt5d0w4K3BMOWNaODRrNG1CQkRy?=
 =?utf-8?B?b3psNkVrSnVmTnB3enZIYXlDMXVxWlp5WDJId0Z4L2pla1NSZnZiVlpHZzhv?=
 =?utf-8?B?MVdWOCt1aE40WWxWNWJxK1I5QjJHUkx3N0k1aHRFSVBDdjd3RHM2U2JBTzZL?=
 =?utf-8?B?R0NrRlhuQldNQXhFOGw2d251dWg0RWFESkV6YlNyOWNJSDNCb1FnTVEydGtB?=
 =?utf-8?B?WVAxdTB6K2xIRHlYSEZpbzBKYXlielJYdUhoaWdueE5xdWtUbGZ3N0greitv?=
 =?utf-8?B?cVczQWd6UHBvMDRheHZHczlMRjZITlBDN0tOditMTnd1MGlWMmxpUG9jU1RP?=
 =?utf-8?B?TzY1d25FSlBuRG8zaW1heEY2Q1I0dmpsWDc4cFRvejZaQXVuUFdpT1dhSEZU?=
 =?utf-8?B?U2tJQmo0aHRjbDc3YU14WENDaUUrTmI3NUpvK0xTc0VBR1p6bmtqVzQ2NnVJ?=
 =?utf-8?B?MVkzOUI3RG1ZdWhxTU1ZYUxvRTdoamlQczNFcktkdTI0WnJHUVZVN1I1QkxI?=
 =?utf-8?B?REsxSUlwcWlLT2JtUFF4WlRWbkpGbDVMWXpUdzRFMlhBM2FQV0xUazRIZ3FM?=
 =?utf-8?Q?OiaZpqqoKZV8h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1Rrc3ZPcVMvZEZmRmZYN0h1dk56Q01Ia3JZeFpnR3dqQmVpWDZiZmxla1N2?=
 =?utf-8?B?R1kxQ2NlbW9DYzl2MGlONys2NHpjUGRMWGxIZGkvZWhXTlRRRy8zeDlvOTNx?=
 =?utf-8?B?U3pQdktZdTkrdWNRQXBvR2JrNlFkZDlTL1pzOVBoemtkelNZNnR0VjNJcFBq?=
 =?utf-8?B?NHFkYktpZVY5Z0lpM0FiYWFZNERGV3NCWWxvdnVreEQrUUFwaWRiZmd3djdK?=
 =?utf-8?B?K2dDM3h2U3BzWEg3dlpzZzZxdm1GT3NoeVRpLzl4WkdWUWlhK1ZkaDUvU3Ro?=
 =?utf-8?B?WTJMZ2FkUFpnNktwQlVqZ2lmRDJCYitJTVVMV2JZdVVNRXB5QUdNbndVWkdF?=
 =?utf-8?B?UjRtVEI4ZndGRzdGMUNvNG5td1FlTVBWS2ludkNORmMxMVBpSHliUkNHN0RT?=
 =?utf-8?B?NWVzdkIvSUZWWm5iYnpzcnRyeGZVL21LVWcvVjlNS01IQ1l0cDhNcHV3TDFV?=
 =?utf-8?B?S3dPSW92NzJKemhQbDcxY1Z2UW55M1c5bEdvaEE2aVV1YkhkVEFiZGRNVUpS?=
 =?utf-8?B?YXA0MUtRV3BITEI1dW5idVlERllGbGFyZDlzT1VpTWpuTVN5YmhLRE4xS0ZG?=
 =?utf-8?B?dVhjUHNCdmlMUmxjZ3F6UHpXSjNMK0JtWDZqRmhHSkZVeUVpZlN3Rkl5Uk1a?=
 =?utf-8?B?V1N6bHNJOXN2VjdhWUVDZmtMSFVkQjZlUDRQYUM5MzRyakY5VkZoaW1PUWdl?=
 =?utf-8?B?VFJQZ3laTUpwVlRvYlp5UmIrdTV3S1V1Si81MHV5dmI5SnRyWlYzdWZsbUx3?=
 =?utf-8?B?VHpTUEw3Q3RIcVJGcGNReDVHUE1pM01Ob1Y0WjFmaGJCbkhnRTNaTjkzT0Nv?=
 =?utf-8?B?MWh4WkJqdVpPU3cwMldCNjVnNEZvTFliL1FoVnVtb1l1UUt4MjlEc2ZUWk5n?=
 =?utf-8?B?dHJqT2lQa0Zmb2MzWVRqckNBanIrQXc1VUlsRURJOXM3SGpMalJhd054VFpk?=
 =?utf-8?B?YWR5ZG04bzZRaERSZmJPTlhaRHBpbHFaMk05TkRVTlNydzY2a1ZBeVgrVDQr?=
 =?utf-8?B?bUtvKzNFb2Z3RXh6VFdvaTNtNWFCY1NyRkVFK0tidEhyVGYyS0FZZ1duRVdL?=
 =?utf-8?B?SEZKWDdzMEdCd09sUm16RzQ0OE5PNlhzOFArTXREd0xEQ1crWjQrNjdYMUt0?=
 =?utf-8?B?WmMzRnM2NXBIVVdOZTNyV3YzUG9qZmRUdVBSbU40RkFURnMyUWVqalZGcVRT?=
 =?utf-8?B?bnd5eWJDdkp2RnpzbVVzaDhQaFBUM2dRdkMwTlZyc2xGQkFKKytpb1ZVc1RZ?=
 =?utf-8?B?MWh4bXljYkljSlJFNVordzBCVnVGdU1TM0JuZ2lZYUs3cnY4anZyc0Nvay91?=
 =?utf-8?B?U3I3aXhVVGNzNW5OK085WDJrTlRRU2hVNnE3SEdza0tLVVZ1QzY1NU9nTVRX?=
 =?utf-8?B?a3U0Yytia21uSHZKa2JPR0lBTUlNTEZOWW9WdkRyalEvTWFGVGNSc0p5c0lL?=
 =?utf-8?B?MDg1REtSc0lkTmwzSDVmRWpLLytpMmtwcjZKT1ZMYTU3Z1owejkvbW51bTlG?=
 =?utf-8?B?bHhORVJVRDEySmdpdFpidjNZMnpUMzFDbzZOdXF1ZjhmRDh3MDJSMFg4UWI0?=
 =?utf-8?B?dVdWekxuZzNaakd2OWVWOHhYUDQvMWtYUXU1VzM1TndrUFlSSndXZ05sUnZM?=
 =?utf-8?B?aTB1Nlk5QW5ya0RJRXNQaHFLQkxRa05zSjVUell6UEFQWU10bTgzVVRFSnl4?=
 =?utf-8?B?WjBFdGxCRlhoTmVaMWFscGlTbmRRNTV2R2dob3NIVGo2YTJYN1lhS1psV2or?=
 =?utf-8?B?Z0NvcHByV2VlMml1OE5zN3REV2puUTR5TUpQZlhBbUZVR1I4engrUkFZcXRE?=
 =?utf-8?B?bUJ4RXlQbTF4U000eW1VdlRhbjlLWmZYL3c4dmVOeVR0c2VzY3BYRy80bW9F?=
 =?utf-8?B?WFpBZmR2T1FzVXVjRjNFaVZDS2luVHptcFBYaktra29ETHpxeWpTZ0lvT0JW?=
 =?utf-8?B?MnhNMldjUDNtN25rQzM1czc1YzdkTGpOeTZuMDRNTFhlUXk1YVl6WlVGK1F3?=
 =?utf-8?B?VU9LaXRINTF5VjlQb3duNW0wcS85UE1QVDdWUXE2Skp4YXgwWktQZjF3QWdq?=
 =?utf-8?B?aTFoMUpxbENNNDZtYzlEODhGVm9LTzBZS3g3a0o5YkZpMTVjdFR4REpubkty?=
 =?utf-8?B?ZXI1N1phb2VNRzZmZkk1V0VJaEU0a29KOWk0OFpRZHM4QWcySnZwYzJJbUE4?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e1bdab-1f0b-4c81-b86c-08dd44fa1908
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 08:58:30.9985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPRF/cEY82YcIzVDi6MesQzd6fzVwunA/qC6qfVyXwXF+9lYGDL9d58/107Y4szyghjq6xkVz65eVzMNJYPqKfBoWgpBsnp8PErewdSfv4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

On Tue, Feb 04, 2025 at 06:55:31AM +0100, Zbigniew Kempczyński wrote:
> On Mon, Feb 03, 2025 at 02:38:46PM +0100, Francois Dugast wrote:
> > Some of the buffers are aligned on 4K. Ensure 64K alignment
> > in preparation for a switch to using xe_bo_create() during
> > buffers creation.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/intel_compute.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index f1520aad4..983b2e2c3 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -24,9 +24,9 @@
> >  #define MEDIA_STATE_FLUSH		0x0
> >  #define MAX(X, Y)			(((X) > (Y)) ? (X) : (Y))
> >  #define SIZE_DATA			64
> > -#define SIZE_BATCH			0x1000
> > -#define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
> > -#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
> > +#define SIZE_BATCH			0x10000
> > +#define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
> > +#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
> >  #define ADDR_BATCH			0x100000ULL
> >  #define ADDR_INPUT			0x200000ULL
> >  #define ADDR_OUTPUT			0x300000ULL
> > @@ -38,7 +38,7 @@
> >  
> >  #define ADDR_GENERAL_STATE_BASE		0x80000000ULL
> >  #define ADDR_INSTRUCTION_STATE_BASE	0x90000000ULL
> > -#define OFFSET_BINDING_TABLE		0x1000
> > +#define OFFSET_BINDING_TABLE		0x10000
> >  
> >  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
> >  #define OFFSET_STATE_SIP			0xFFFF0000
> > @@ -746,8 +746,8 @@ static void xehp_create_surface_state(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  
> > -	addr_bo_buffer_batch[b++] = 0x00001000;
> > -	addr_bo_buffer_batch[b++] = 0x00001040;
> > +	addr_bo_buffer_batch[b++] = 0x00010000;
> > +	addr_bo_buffer_batch[b++] = 0x00010040;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > @@ -825,7 +825,7 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = GEN8_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2;
> >  	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x6;
> >  	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
> > -	addr_bo_buffer_batch[b++] = 0x00002000;
> > +	addr_bo_buffer_batch[b++] = 0x00012000;
> 
> I've checked this and it seems this line should be removed
> (0x001ff000 is enough and pool alloc has 4 and not 5 dwords).
> I mean this dword stays here by accident during reversing.
> Rest looks good to me. With this nit:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Thanks, made that change as well as using xe_get_default_alignment()
as suggested in the next patch review. Retested on DG2.

Francois

> 
> --
> Zbigniew
> 
> >  	addr_bo_buffer_batch[b++] = 0x001ff000;
> >  
> >  	addr_bo_buffer_batch[b++] = XEHP_COMPUTE_WALKER | 0x25;
> > @@ -852,7 +852,7 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00180000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > -	addr_bo_buffer_batch[b++] = 0x00001080;
> > +	addr_bo_buffer_batch[b++] = 0x00010080;
> >  	addr_bo_buffer_batch[b++] = 0x0c000002;
> >  
> >  	addr_bo_buffer_batch[b++] = 0x00000008;
> > @@ -895,10 +895,10 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
> >  		  .size = 0x100000,
> >  		  .name = "dynamic state base"},
> >  		{ .addr = ADDR_SURFACE_STATE_BASE,
> > -		  .size = 0x1000,
> > +		  .size = 0x10000,
> >  		  .name = "surface state base"},
> >  		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
> > -		  .size =  0x1000,
> > +		  .size =  0x10000,
> >  		  .name = "indirect object base"},
> >  		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
> >  		  .name = "addr input"},
> > @@ -907,7 +907,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
> >  		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
> >  		  .name = "general state base" },
> >  		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
> > -		  .size = 0x1000,
> > +		  .size = 0x10000,
> >  		  .name = "binding table" },
> >  		{ .addr = ADDR_BATCH, .size = SIZE_BATCH,
> >  		  .name = "batch" },
> > @@ -918,7 +918,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
> >  	bo_execenv_create(fd, &execenv, eci);
> >  
> >  	/* Sets Kernel size */
> > -	bo_dict[0].size = ALIGN(size, 0x1000);
> > +	bo_dict[0].size = ALIGN(size, 0x10000);
> >  
> >  	bo_execenv_bind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
> >  
> > -- 
> > 2.43.0
> > 
