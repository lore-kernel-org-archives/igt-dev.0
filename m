Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC27FC25B4F
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 20:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC1410E308;
	Mon,  6 May 2024 20:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ly9KTAkY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB29010E308
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 20:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715027323; x=1746563323;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HEng51KOfFySQxGEExlIDhxi+J4dN5PEBTiGRj0p49E=;
 b=Ly9KTAkYGMTyMexNw6OThDJQ/QJ1dSsu7pAPJVbC6R29LJrxiChN0xzK
 o0NUJWMetzlRtFo5lTC8KVHGG85CAtkkGQ7PSP7e817hX+mlUH7mWZAFg
 nh3LSJCYgbgG8HEC93tTNdLX+FjksIeJqDSJNc5/IKcZ8RvVH/+wA5R8s
 8ispVtdM3yxQ6KCiMDfdl86Qcthi6Vx39EoMM5bZVwto0jK+0wLC/VAWB
 IX31HgeTkgRUU88zOiWQ+SD43kyLBVawcYKOEjkNOQ7Ks3bc6Rr/RHL8J
 0YlzAQFhD8bDVp8yM4gQybni2Kkh57r6v5pH97wyW9PxQOa3EN4Ppi0gZ w==;
X-CSE-ConnectionGUID: F7sTyxBRRzuKWJFP/1KLFA==
X-CSE-MsgGUID: PNZ2TYcjTOCp74fgywucmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21345725"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="21345725"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:28:42 -0700
X-CSE-ConnectionGUID: BalYMseyTZ2+zz3hk73Cng==
X-CSE-MsgGUID: 8gLJYZj4TOOQ5dH1DipyZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="28363110"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 13:28:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 13:28:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 13:28:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 13:28:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 13:28:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rjh9jylqPhVNyUK2d/iWcIBPwxF6t4pC/NtVqenB3PJQNUhIYh4GvFnHAACOEJxFACZ3FrlJ6qigqV3OctKSIaCASbbl4flUbT1bv2X2pd4Y/XPVCL3lz2T3xJOvfymuS4gE5GO/eWtyyvnmCe42oQKKpyxb/WwXwnqRfDIx1iA8q+gzXceSQipBkMwwvfclLFLCTTRNwOjXb/v7jEO+KeUd8IQHv3VqjbwdmvilY0ccePduAHNRYnWKdznWsjJORbklrs2qkTHcSYHBIwCYgma1AzQK8oDGYO+KY2GSNpBNrhQSZ2jKgM8m112lEOWMY2wiTAfaLBcfsRuXrVwVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miPhxr7V3FgOizOtmOCT7JiGcq7NbeRaW4vzvAjB0Pw=;
 b=VI57QDvTxmCdkyULcm6MYA28l+XKFC9HnZiMEUTUj9UndRkZZZZKVFT6Pu7gS4bpGzDOeptTjPrNn4QTMzEN4WTP5w5igKWhTi/+OL98ym73HvSsnp4cLobah7o5RRrNzRMuHpFd1UDsF8r2EfrGVqDK36GzojwHq9u55bbIdGrpr2j17/E3qJ1wBZ8iRb7v7fDVqbiz2Hqa62mHsEwtagDuGaqHYvGo8EyOwea8AJtX0jY3hukXOYCanpSFXF6pXkCDXUHxcGoMgy/wxm9y/ewpC+wqp8LVCZ1K083whSv2ComY8y8QGiO/YlABM7rxjlmgcEMFYyFjPOEkDkYisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.25; Mon, 6 May
 2024 20:28:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 20:28:35 +0000
Date: Mon, 6 May 2024 13:28:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 02/13] lib/igt_drm_fdinfo: Allow any number of
 spaces before unit
Message-ID: <Zjk9cSpBdzyTcz54@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240504064643.25863-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:303:b8::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN0PR11MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a98d99-8015-41dd-edff-08dc6e0b1aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MW52dStxdTBScjRETUhoTTZqUXViZEtnVFVPL2gzMmxJZEFqdmF1Q2lIZG9s?=
 =?utf-8?B?Vk50cEhSeEpmZDR5RmFUaVZ6aHFaTHJIcU14RkU5cVZyeCtGUGNRZlZKanJn?=
 =?utf-8?B?SE5HMWE1NkZOd0t5aGRkeFFkYUFtVmFaYXIrV1FMS01Ec09ZMnFWNVZnNUtp?=
 =?utf-8?B?RDZRNm90dThuWHVUMXFyM2tQWUpxM1d1M3J3THRpUnNqSGVJd21JOHB4MEkz?=
 =?utf-8?B?YmJOZEpzZGwycERNS2FuNUI3NVR0aUlqSzFWL2xCK2dwQkVyVFEvVHN6aU1N?=
 =?utf-8?B?MXhzSHJlbVo4Wkt3TU9HcEVVV1RaSzlUaS9uQnp5cmpNM2xnL0s3Z0RSYlNs?=
 =?utf-8?B?YnlReFNpVlpVUThGNEpCY0pDQUxmajVnUHQwZkhXMktJcmY2bGs3MDEwTGMw?=
 =?utf-8?B?Y1VSNlBCYnk3K2hUTWx3RlpUeExlektWc2E0c0J0WVdYYWNnSUQ2eDh4N2FF?=
 =?utf-8?B?QzduRlllS2lpdTBsalppSGRmYTlNYWdndVZDS085ZXFyRWc4VFB4T2xtL2hi?=
 =?utf-8?B?QVR6OFZTMGhSbDJDV3VpNENsbUFmMVpGOW9DRklLVFhpMTJyK3luaHB0ei9r?=
 =?utf-8?B?ZXlWTEpTWVBpMlJRNzR5alpDS3pERitOeTgwbXJEY2xEdTdtNkhqVVoybWlD?=
 =?utf-8?B?bG9XTVFReEdOYWc3bFJLbXZublBlelUwd04wSlNKVExwSUZhd1YyeTFPalRH?=
 =?utf-8?B?a3c2d1BCckQ4ZUw0bTdvS2hTVmphdkllUzZDZW1GZTJOL2pJUGNjQVIrOVZh?=
 =?utf-8?B?blByTTVFakhIYXV5T0E2NVo0MURGdkJweGNPMVlDWTE4R3B3UUpnc25CK3BF?=
 =?utf-8?B?aW5BVWNvTEJYVU1JMys5WkhIbkxnNm9GbkV5ZjVpYU90elhLY2c1TUJFM2F3?=
 =?utf-8?B?V0dGMU5xWk9Pd3lMSzRGeDFVN1VuLzRWUFljb2xhMGhKZkp5bm1MRTVTRzF2?=
 =?utf-8?B?eHErdC8rUXN5MzJZcS9rdTBGTjUrRERrcGJENFJuYkZkd2k0QVIwaUV5SzF4?=
 =?utf-8?B?NnNRL2dtWG05YVcwUzdpbW9DY0M0b3h4QjllN0hEOUhVME5YbmtFSjh2TEdZ?=
 =?utf-8?B?MzRoaGUyQW50T000WlVIS3hwaXpzNlFIbVU5Q20wVmtXUHp0dTFxNHFKUTVq?=
 =?utf-8?B?ajJnS2FKWkZmai9iUHE0cFNpTFBSb2U0OHNUYXd3elZFbjNRTEZZMkN6Nit2?=
 =?utf-8?B?dHBiMXIwdTNHZFBhNnFENzRzNmZYWkRPYlB5eFlmbTRLcE96N2J6V0h6cUIv?=
 =?utf-8?B?UUEwM2U5QVgwQW0rR0t4WjJvbDVmcVZIMGMzb1ZwQk5oVEh2OVhwZUpPbkZl?=
 =?utf-8?B?eWNQT050bjgzU0RIK0R2cHYwYzE0d0lXRC9jQXdJcVZXTnZSUW9iUE5NS003?=
 =?utf-8?B?UXR3cFlVWVJkdDYxR3VxK1F4N1FWS2VJWTEzYjZJMWZqVXQvaWlpRE1uTWFV?=
 =?utf-8?B?YW5ENXNWTkEyNHlTU2hQcXJJekJzNXlZUzBoNjZib0FRaDhEY1g5MzVPNnY1?=
 =?utf-8?B?RzFDUnVZNnVKL3dTZXY5NzRsSHp6ZE91dEI4Mktib29VTHhneWhMVk9vQlJm?=
 =?utf-8?B?OTZUZWlFdGpwUmtCTlRobnNtVkdMWmpjVkVhRFRZZy9CRDNXUlRLa2JXa21B?=
 =?utf-8?B?emQwMkFld1pVNjV2ZndFZVFobHg4aGxUSUdwY21Xd1FWRHl6eFJHemJtK0Rw?=
 =?utf-8?B?ekxyWkxMaENxT0NVZk5yRzdEOTVSM25UcXNRWUxXSUNIdWVLTjF3OUVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXdUd25oR0VNM0NPUkQ0RkR4MTBPQjBkczc2VWtTdWpPZlUreVBFdVUxVklk?=
 =?utf-8?B?WS80ckR3Q2ZwRWJUZXE4Y05tQTcwakM3b043cDl0TFF1NWdza25UOVpVUlNF?=
 =?utf-8?B?SlFWYkF3eGNvLzNidmRRZURxa1JXeXZWTVFoY25iemVaeUZ6Rkc1Y2c0eW1z?=
 =?utf-8?B?RFd1Y1psaTBYc3BhMytUNmp5NlljSjlpaFVQaGlJcmM0NTRRQmZ6YnFDVWZF?=
 =?utf-8?B?ZStCei9TUVVwdEJ5aC9ObFhNd3VOSzRXd0loNXUxOWhSTlhaVzVvbG41cmp4?=
 =?utf-8?B?UXBtZ29HaUIwWjI3VkN1clRlMHRVWU1jSnNwRVB0TkgveFFMSDVUd3VOYksy?=
 =?utf-8?B?SG5WV0c2TnZBTU0rM1NRekl2NnBMd1RYZ0pVMGJYSE41Ui9OUk5WQ3pXQ0pK?=
 =?utf-8?B?eCtMVEppMkM5eFZTMW5WNXlsaXlSdUZEbmJONEZxQTg3NlJqSmZ5OElJV1Fi?=
 =?utf-8?B?cERqWlp2bnZmdHN0cVVQcXRsQWhIVnU4eFZNR21OakNnY0RRbjZ6dVVpc1dC?=
 =?utf-8?B?TTVtRkh4QXhIaUdtQlo1TTA3RkJqdHdpdklJcUJoWXdwbVJmTHdaelU4Vm1W?=
 =?utf-8?B?eWEvUElURzAyL2k1L1BhUE1aYmI2KzJGSndqekN0RnpGZmthcXA1WmNreEZJ?=
 =?utf-8?B?WDVrR3hqNjg3NHNHdDlta0JxMHZXNWxoVUplRFdKazBsdWppbFVVZWZaa3pO?=
 =?utf-8?B?N3FVa1dXZWpmYTkxVVlKT2pEVmplNUNTMnF6d1JNRUZPZGFhTGtRN0drZ2Zm?=
 =?utf-8?B?SEtjcjRDOUVlNXFnZmVPRGJaQXNKUkV5QWFhMHdCbVVjR1J2MU1jSy9abzRO?=
 =?utf-8?B?RWdqNGRNTHFDcWhGcTJ2bUxNNXIwMDc1cUl1cXlIdlFkVHhhWmp2N0t3cEdZ?=
 =?utf-8?B?dDVtSVBBSjFKQUtVbTE3TDM4QXFQa2JTQ0xXWUg2c0dZT0wvdURYbkRWTVVk?=
 =?utf-8?B?bnlUK2VPUjFpQmY1c2puYmFsZTZLK1R2SHdQSEZzVVZXTXU3MVlESmFDd0U4?=
 =?utf-8?B?bER6dDJTbVZDNThSY0JlWGZMSmNvY2tSTGZQbWVLbTU0TXFIdVBNczh3Y1Av?=
 =?utf-8?B?bUFpRkJIaklsZHN3YVF5YUt4cWh3bVMzbVpWVHZmOTNvZ0FtNEUzRmZtdFFq?=
 =?utf-8?B?N2UxZmhtRVdMZFdYcEZuSllXdHhQcUFkTzJHdDh2LzFveGNzYU9zWE9tS2Zo?=
 =?utf-8?B?NEptMDR3VHRaTEVveDRjTXcvbXBIRklEVUlSZnFEWmkxYzlZSC9IOG4xYnpj?=
 =?utf-8?B?VjlPSHNKZk96Y3V6cGdMNDJDOWgveVJ3SjhXbXhJKzlMYnQwSFJ3dHpQcGxK?=
 =?utf-8?B?Rk02TGlyZzdiSWdEL2NiRFNGVk9KTjhJcnFHdDRJaEJ2RlYwZGNpcHdGZDhD?=
 =?utf-8?B?VXdkNzdSSHZldmpYR2NJODFJRHRJY20wVlZYa296aE9zQ2gwQ3ZHMDM1blkx?=
 =?utf-8?B?bVYyMzg2VCtESTdHSUNyN29VZ1RHTCtFa0JHUXN6RnFYSklVa2Z5RHNBVGNR?=
 =?utf-8?B?S3dzcC8wOHJWbjljZlZsWFFPSm5WZ2xmK3FHWEJVUTh5TUhYbTVsT1FQMHRD?=
 =?utf-8?B?cFl4TSsvYUZoOVJBMGl3ajN6R0U0dzhqbElEdldsUUdQVzhIY2FvWlpDRDh4?=
 =?utf-8?B?OFZGNHBXaWdkU2h0NiswQTcxaFZuWURLZ1VaRjk5eHluZUlEaHorTXpXRFpG?=
 =?utf-8?B?RGdneWNLZmF6UFBSdTQ5S1RidEJKZ29vUDNkVzltTFRhMzFkU1hpL2ZOQ09i?=
 =?utf-8?B?ZlNGVjZ0NC8vckpyMWc0WlhUOWhmL0J2MGNMbENhMVB5VnlPV1g5SFJPUHUv?=
 =?utf-8?B?Q0JSVlcvdUVPMFJGR3E5VkRGZGVLSmpJMFdVSS8vUlp2NFZReWJ2a1J2Q21x?=
 =?utf-8?B?NmV5VkhwVFFMOGoybHpSV2kvWjZ5YXEwVjNFS3ZqeFZabmtuYkN3eXpHYVpJ?=
 =?utf-8?B?dmhpRDlwdzdBS1hvRVVzNk5DN3pMRDIrVEd1RmdZKy8yeThuTjR0dGlSaHJn?=
 =?utf-8?B?dGxlZFl1ai9jNUNaTDlESUVhd2wzcVhEanA4emN2ZUpjakFjUEtlR1Jnc1Ft?=
 =?utf-8?B?WSs3NjhneFY2YW8xMzRzSXk5R1R1OXVMQWpnOG9NdVJrYStjb2tJdlhLYllU?=
 =?utf-8?B?eGNlMldLTHd1NVlVS3NKV1U2Ni9XcHdUbm8zZk9WOGFCSFhNY1laYXV3N2lL?=
 =?utf-8?Q?Vxzv7ZbUy5XYE0ofjC8yC/k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a98d99-8015-41dd-edff-08dc6e0b1aee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 20:28:35.6396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmHNRoruobAg1szyxheAGsPmqkw2RWI2C3EL7SGLe1rtdAZwxMLx74OXdzZydNKlqKfh9xkurn+yG3f7eqAl+1AlxnbxQe0e66dVaNb6TpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
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

On Fri, May 03, 2024 at 11:46:32PM -0700, Lucas De Marchi wrote:
>When parsing memory region, allow any number of spaces between value and
>unit by using ignore_space() and adjusting constness of the variables.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_drm_fdinfo.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index b3f6fc35a..3b2778eee 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -134,7 +134,8 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
> 			const char **region_map, unsigned int region_entries,
> 			uint64_t *val)
> {
>-	char *name, *p, *unit = NULL;
>+	const char *name, *p, *unit = NULL;
>+	char *end_ptr;
> 	ssize_t name_len;
> 	int found = -1;
> 	unsigned int i;
>@@ -180,9 +181,9 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
> 		goto out;
>
> 	p++;
>-	*val = strtoull(p, &p, 10);
>+	*val = strtoull(p, &end_ptr, 10);
>
>-	p = index(p, ' ');
>+	p = ignore_space(end_ptr);
> 	if (!p)
> 		goto out;

I think the next line of code here is 

	unit = ++p;

but p should already be pointing to the unit after ignoring the spaces.

Regards,
Umesh
>
>-- 
>2.43.0
>
