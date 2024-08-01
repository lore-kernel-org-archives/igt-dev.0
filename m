Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF07C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 07:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E9010E8A4;
	Thu,  1 Aug 2024 07:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4Casyte";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A282910E8A4
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 07:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722496973; x=1754032973;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IXC+aodzbi1Nv6lTxOg/8VXZ+lBhLghGSobYO8UiYPs=;
 b=P4CasyteQtpx5tR8m5yBZZtQglTcx4CxYclfGt+LDBKvLQDgdZstjD6B
 KTdfQ4XE13SmzSAERyHaPzZ4GKD1CoqWHWDUJB4zCJ3ViRsxoyX8iBjq6
 FbTEpRaryF7TVa/uo8pP1a3zI4e2D11Nne8/dGMuFI4k6WEI3xuUj5Pvp
 2GEOlIvhZKOV0+dQYxKM5Pt7Ai6DvF9QtEFQMkm6fvqsOxZ1ujfi0lR5l
 s40/3niUomtGgxcdHncHXEHXdmp0wb4SLj341bILjk3u9DyvLHN2C9pIS
 Y8K2c7lJbwlWajmpP3vuqUSLZosVruIbJFqmhUfQkAkl4RewwKuMZQdqt Q==;
X-CSE-ConnectionGUID: rywry9z/S+qHxuosri9KWQ==
X-CSE-MsgGUID: UwSLkAQeSv2Exm2rIf4Ehg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24288860"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="24288860"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 00:22:53 -0700
X-CSE-ConnectionGUID: 4PW+9+6zRH6fJCbINtN7QA==
X-CSE-MsgGUID: YElSZZEVQsi8kqz7yuavZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="59788112"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 00:22:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 00:22:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 00:22:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 00:22:52 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 00:22:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCniPznjlHXmaKmogH7XBY1jJMYjXHhcLzYYU+EtZOLrpvSVWWsptN2+dR6+tjHjgy5pKJsTZjskrKmOg0cf2UpR1tI9zRN8ugk/0OobuOjOS1GKj06E/6d5ReMBK5rYCwQQthHWR8obmfY/UhpAFgx2KRqYtt9mQzVs8wdB7rx7+nKTjJduo+gzRAb+PfafBR2BJqqkm63p63A/U2BxSXDOtwrUFpfWTqKolVp29Fe+Pd+OuEF7O9Nh6ytjCOORs/4irkRtCL03P8+T1UhmNNfF4nnPbznOHyYJhsZYZ15mPD2kKyhFnApc7fmonjw6yrWQ8Fu9Q77YgUldNKMtyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4l8lgF1g7ry5cIuIg535SKGU8Jv6PNMm8IC+ib+R3c=;
 b=YlqVcT7Mwwpb/UMku4+vpRqNavx3TyEBSc2x334PGgqUbx9WZQYLOeycI3D/+ZmS8xTZPk3bkYtdsI7hjeMi9MR5XzD0UITLFRxyO8bNVGd2k1j8jDCOafRXwuclfLFmeUUJ6A4IXVc1xm2sr8mwrS0vrJFV8EEYS/TTrQB8tF8wuunx4v4NKns+KvN1/fUi+CNs1A2NejxXyF+QO0jJBT95aMU9lhM1++bVOvXGGp4m+C3kW+kUqgP4ge0WTaC8j4Jw+FduN8CZvvIO6NNQhtGL/d7aAkNdshNMN3GdXeHwwOdbafFs9b3i9R14xJgX9zwXf1stHJ0TA7htHMbMiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6606.namprd11.prod.outlook.com (2603:10b6:510:1b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 07:22:50 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 07:22:49 +0000
Message-ID: <eb061354-afbd-4aa1-8cd6-5f238ab582fa@intel.com>
Date: Thu, 1 Aug 2024 12:52:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_gt_freq: Add a wait after gt reset
To: "Poosa, Karthik" <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20240730115058.1104767-1-karthik.poosa@intel.com>
 <122f5ae7-9b39-4e8b-9fe5-2ea57f72cc4f@intel.com>
 <90a2332e-5920-469b-820c-9c477b59b7c9@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <90a2332e-5920-469b-820c-9c477b59b7c9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b93bd79-c3f7-4e44-d16b-08dcb1fabfa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGExSWZVa1JjVk95S0NtRi9XOXVOMjRIRzc4d3BMMnlmcEU1YyttRFg0UjdI?=
 =?utf-8?B?L0tMeFdDN0FrTnF2eWFGZzI4dXREd1V3dVo1ZTNyS0hRaCtHU3o2NktLTlZt?=
 =?utf-8?B?aUpITmF0ZlZBWXdoM1UxNnRKbWNVUE5QWU1SWXVYZVpNcUtkak1oaG81My9h?=
 =?utf-8?B?M0xvWnRDOWJ5QzVIN3c5dUhhNk5DcGZ2VFFsQnJCYVAyNTJhRUcxSi8rRXV5?=
 =?utf-8?B?a2g0TlRuUzduYlB4UWoyM1l0cUNqN3c0NmM0Qm0rdWdDWFVuTXc1WGZueXA1?=
 =?utf-8?B?b2dZS1FMdjFFUVh0aHQ2UmtDMVlRdG9jRmFqTU9BOE5ZekF0c0ZCL3F2MC80?=
 =?utf-8?B?WnpDQjRDWlAyQTIzYmwvLzNMVGw3dGZZbXBaSXBieDkvNmlJK1h6NXYwUXR1?=
 =?utf-8?B?MCtYYWlydnRJd1JmWm1xZGVDS3E2bWhkNXE3dXpLbGZLVFlSSmsvTFJDNzlu?=
 =?utf-8?B?cXUvbHRSd3Qrc29ZZHN3RnNSZ0FNYmMxLzJUand4RE1HVlFEdGJzTXlUbGJT?=
 =?utf-8?B?eGltSVZIVGgzOVh2KzJML3pFYk5rc1BQN2NhNGEvZUFWYnE1TTRGNFJoVzBI?=
 =?utf-8?B?QzFkL2NwWlFGZmRVOUUveEtjWndVMXV4Z3htZ1JsZlJ0WHdXbGtVYTdpUDZF?=
 =?utf-8?B?Y01FaEZHaDAyNWsxNy9GT3VBNHpQM2IxY1ZXMGZaajZOTS9YZEk3akd1UHAz?=
 =?utf-8?B?d1ZoTXM2UjZualhCZFdhZnpBWVE3d2NreWQyeUpySHVmeWJmeHZvNFBXSTlO?=
 =?utf-8?B?eXlWV0xTZ1NPY3BHS0V1bVZOSUV2VlJ3bHBqdXNYMVl5d0lRaERYSWFZeDM2?=
 =?utf-8?B?YmxhMmhYUmwvMTA2TU5aVUFERExROFhIRlcrUXpFMjZQNVJiS3FwUHBNekxW?=
 =?utf-8?B?Mm1KT0JGN1NCSGJYNGtqQktCaytrMTQvcGNEMUthZVQ3QVVZOHROMHUvMjBn?=
 =?utf-8?B?UU1lcDY1bk9jZ0Z4cVAyby9KVytHVWFjaHJHOTlHNEk1ekYxcEdLK0FQL2d5?=
 =?utf-8?B?aTVmZUFoTTBCaU5pQnFoOXV1UHNCV3dBdVE1bXdjdTZpaEp5VTlpSFBRQ2Ez?=
 =?utf-8?B?aGs0cElSU3pqdnZSK1ozRzk0MGVJZW9BNjJscTI5NFYxNStpQVpWWHFXSXlk?=
 =?utf-8?B?bVhXaXRRZ3NzY3B2UVlwWisxT0tIRWh5dVBpdCtaNE1rZU9UekFjeDhDdFdR?=
 =?utf-8?B?WDJDVzgyVHhHNElieTZrclZZN2hHNUhrcU84MiszeGtCQzdaUGxVRVNrenFq?=
 =?utf-8?B?aTltYzhhZjZjRXBicU5aMTREM1Fab1JrMER2bDdDcW5XM0s5VlMxRWhyVXBN?=
 =?utf-8?B?TFliZWxBaTY1YmhONExhRHY1TnRYOVpEeUtTM2o3cVFYZjE5Y0ZrRk1Qb1JP?=
 =?utf-8?B?L1AzbmV4UDM4QXVvNnMzZnh5elpFdGFwQkxXSHh5c3Q1YkhkRWRRalVyQUFP?=
 =?utf-8?B?V1ZjMklMb1R5QWVHNzVmNG5XcGxiamtPSUlNeHIxbnROU3MzakJNQTFHRzJS?=
 =?utf-8?B?OVdmeUt1OHR6c0lFMmc1Q2g2WUpic2NPc1NoNTV5MkdoMXpUSVdkRDlsNlc0?=
 =?utf-8?B?cDBBZWtVVFJNU1J6T09jaHJrR1hpZ2ttNVlNODUwMnREUjVxTUtZbDZYK28z?=
 =?utf-8?B?OWNsOXhCZ3hWcnBMZTFzMWtENVF2dkwvcEtNWXVaN01CcXJFOE52VEN5bUVN?=
 =?utf-8?B?dTVmYXZ3MEFvM2JtU002QUhpSlFGOHFpUUtzWEFBV3krak1CSEFCQ0Q5eG03?=
 =?utf-8?B?ajR2K05XRU5INEhycXVkK1B3a0o1My8rbHVlbVJYUitlTWxOQzd3cEoxS3Jh?=
 =?utf-8?B?RGFBODJ5VGZpMSthaitZdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXhFbjJpaEQwaVN3R0hVcGNReENTaXRDK0Z2RThWU3pjVktJUzF6bzVsZUEx?=
 =?utf-8?B?RDJMWXpqZFlzdk9iRVpQVmZ2OTRGTDZUd0VxZDFsQks3ZDdXMXpXQkR2MkQx?=
 =?utf-8?B?bGlzT1RvOU5Zalp6VFV5dGFZcW00cWJKU0h6M2gwYXBNa0xvK3Y4M1hxQUtu?=
 =?utf-8?B?YnJTOHZhd21HUzJEOENJNmZPNVlyUWlDY1lIZzY5WTkxVGVjSmJZVENiSWY0?=
 =?utf-8?B?WkFwUzVvd3Y4SFB4MFZweTJCREFPS2MwMGtIQWt6aUM3elNuZWZHWkpFdXpp?=
 =?utf-8?B?V2RsYlJublRLVEVUc2VYNGZCbGlobC9va2NLNzNjelZob1J6cEt4bWtFTnFi?=
 =?utf-8?B?S25MRG9ickJIeHJzMGdZWUpHVzVwYmdCd2daclhZYzc3amhlSmFRaHFtQm9G?=
 =?utf-8?B?dkErUlNBeGs1YUt1VkVCeHJjUjlWcEVoNWI2U1YzMHk5aGxraFhvSHJCNkRj?=
 =?utf-8?B?cTcwd3FSbnQrS0hoU0UyQUttN2hQVUJDV0VlZmNQV3JTNUw3ZXNPSXR1TUYw?=
 =?utf-8?B?WmV2UjdBNjdEZW9SWEhYV3hOajcxZ1ZRTjFoQ0J6TkVVUXRoaFpVR2JCblpU?=
 =?utf-8?B?TW9qZjMway9FV0hvdzNjcVBJR0g4NEl2S05CZE5JQ05Gdi8wTm1LdjBYZ0hs?=
 =?utf-8?B?bVUrRHdyQ1poelJick44YXBYUU5vMVhGKzJQMkw2ZHFYUjN1Zm1iYlI1MGRZ?=
 =?utf-8?B?OFluTEdZRnlVVDAzdGlKNEJLTFlFZ0pydzhMbnZLbzNCdTdWcWlTbUx3Rzhm?=
 =?utf-8?B?TkQyUXNheDFla1VTbENCelVrL2x6eEx3U2QwZkVKSTE1V3hXUzdFVzN6TUlk?=
 =?utf-8?B?S2dPZGxncGo3RFFYRVgzbWsyR3RZRmk0dTBHNzBsNHpSRnVPOHpXM3dMd2FG?=
 =?utf-8?B?cXBxWmJTVTJNVmFFQ2QxWWZoaTdweGZTVWZVcnRkLzIxRmlhMlVqNjRORUNl?=
 =?utf-8?B?cERPUDBEREFza0hWNDk0NG51bWg4Nno3aVFqaWQreU5IQ0Rzd2JKS2JCMXFq?=
 =?utf-8?B?N29tejljZmNINE1xZ1VrWEhpL3JxaEFnbEZWK1lYS1dBUzc2SWR3TThFSU9y?=
 =?utf-8?B?WGJ2dFd2d2J6REtvM1dmdDFHeDFMOFdMaDFtakpKMkZsS0oxcW9NbTBTTnhM?=
 =?utf-8?B?OUpvczFyT1VFN1hiTHNtNkpSbVl3Z3JtN2NBaHZTME5JWkluSXgwVCt4bXFq?=
 =?utf-8?B?clpwcGE4RkdSYWpBSThDQ2hjVXJTR3k4VVVjbm9RSExJa1B3ZHVNTldWNkRW?=
 =?utf-8?B?U3krU2dhYWJhaXVNRExFRTdkMG5rNXF5ZEw2N2RHM1RFK004RTAzdXVzcjFR?=
 =?utf-8?B?KythZlYyQ3VOdFlHaTdjT3B6amRrc25sQjhBRmVxRFZISkdNL3hScTJzUldh?=
 =?utf-8?B?MkpkOEk2SHdENmlqbUw1b25xZEJHKzBCM3h6UGVSdUgzOTFkaDc3UVVtZkZt?=
 =?utf-8?B?UVFlWmlUdWlzVXVnRW16Y2hmWXkrREVPWDEvRnE4M3dpMXRjOExZVWt3aDdW?=
 =?utf-8?B?WkhvRWo1cUs4N2UreGc1RWFLTkNNcXFkdm1UTXJtaFpvbGFyR2N1MFNqNVB5?=
 =?utf-8?B?cHBwWjNYT3dyaEZnZFdpQWg5NmVsYmlSQTY5bFJpUDRyTEc0L2tFUzFhaDZF?=
 =?utf-8?B?RHBUUmJqbHh1UnRjQ2FzSkNvK3FUUWhQQUIwZDlIVkRGMys1czhsSVBoZDBx?=
 =?utf-8?B?Y0pkeklwMzBjR3AwQVVRTzlRM0laQUtHd3FIWVk0NktTbTFNcU42cmlmSXZL?=
 =?utf-8?B?d2crcno3bjlpWk9iK3hpVzhIK1p0RjVrYnJEVzhRTkt6ZzNwNy9pcXJDQzM1?=
 =?utf-8?B?M1JZM3VGUEZLRlVyYXFYb2p4Q1Q4d010cTRZS0tSeFBkak91TmJnUkdwOXVp?=
 =?utf-8?B?Yi92VzgvbzZtZzA4T0g2UTBoRDQ2cFJxajVwcWlEd1loWkZCYjNWUU1hOEp1?=
 =?utf-8?B?M3hFanhCVmFEdlVyUFZvYVdiUXFNQjRXSUpPTmpOYnkyOHhJSEFDYjc3Vk41?=
 =?utf-8?B?QlNXOEQ4RDJCa3ljRlZ6ZU5HTk43NDdsTzV2TDc5cEg3bDVpSXhOZzV5SWRy?=
 =?utf-8?B?UHVvOEJjQ2ZYVG9tV3dPNHJtWDNqYVJGVU8vWlF3RVFRSGwwdHFyaXV1RC8r?=
 =?utf-8?Q?GpS1F45W32RhERSPoEojqvGVQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b93bd79-c3f7-4e44-d16b-08dcb1fabfa3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 07:22:49.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m66dOk3OwYn3koD9eNn0qkudmb8I7F+UbcP5cq4HjuaN+80zcvrmfeZFBOU4BIRemkJLxtRkcHOwMAzy8kHSvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6606
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

Hi Karthik

On 8/1/2024 11:50 AM, Poosa, Karthik wrote:
> 
> On 31-07-2024 16:06, Riana Tauro wrote:
>> Hi Karthik
>>
>> On 7/30/2024 5:20 PM, Karthik Poosa wrote:
>>> After reset min and max takes sometime to get set to rpn.
>>> So add a wait of 100ms after gt reset before reading
>>> min and max frequencies.
>>>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> ---
>>>   tests/intel/xe_gt_freq.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
>>> index 93ebb5ed0..718f720c0 100644
>>> --- a/tests/intel/xe_gt_freq.c
>>> +++ b/tests/intel/xe_gt_freq.c
>>> @@ -33,6 +33,12 @@
>>>    */
>>>   #define ACT_FREQ_LATENCY_US 100000
>>>   +/*
>>> + * After gt reset, min and max freq may take sometime to set to rpn.
>>> + * So adding a wait of 100ms after reset.
>>> + */
>>> +#define GT_RESET_FREQ_LATENCY_US 100000
>>
>> Both ACT_FREQ_LATENCY_US  and  GT_RESET_FREQ_LATENCY_US  are same values.
>>
>> Why not rename ACT_FREQ_LATENCY_US to LATENCY_US and use that instead?
> 
> ACT_FREQ_LATENCY_US is used between set_freq and get freq without gt 
> reset in between.
> 
> GT_RESET_FREQ_LATENCY_US is delay after reset, so kept it as a separate 
> macro.

Value in both cases is same. Can have a generic name and use it
in both cases.
> 
>>
>> Thanks,
>> Riana
>>> +
>>>   static int set_freq(int fd, int gt_id, const char *freq_name, 
>>> uint32_t freq)
>>>   {
>>>       int ret = -EAGAIN;
>>> @@ -318,6 +324,7 @@ static void test_reset(int fd, int gt_id, int 
>>> cycles)
>>>                    "Failed after %d good cycles\n", i);
>>>             xe_force_gt_reset_async(fd, gt_id);
>>> +        usleep(GT_RESET_FREQ_LATENCY_US);
>>>             igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
>>>                    "Failed after %d good cycles\n", i);
