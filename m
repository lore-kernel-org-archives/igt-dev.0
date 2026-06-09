Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE75CD8CAC
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 07:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C966010E154;
	Tue,  9 Jun 2026 07:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bx9rjkir";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C76110E154
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 07:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780991674; x=1812527674;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PSRCbFU36cUIkWO4CWgcZkdqcShxafZURGWteN2TQ9k=;
 b=bx9rjkirJbvAb/iL5+s7uqc4jIprDE8ZSBjNWX7opM6XsKZGMvyDP7pI
 uvqQdaIgWQcZ286mOCMpEqhOrTIbf6ZBq7pL0nXQP3ICSdmb6bHnOIS6z
 EdzsPrWbQI76s7uvxrLnJturJnlecKeLnOmWHjgm76R1gkoMbMICg2SZr
 4zJzF8rC+S2j3m9svUASu507Ogbw9MUSSPE9ut7houbQitSPBpEvvyPJv
 qRbxBPQb1L0tf5mbjGJkU/4zc/9W3wS0RPl1MKAgkNPS6X+IpMXdoNXcY
 v3pXRyGL08QWSr4XjoW4PE/1ByNP+2c/pQNSEO5HVdCZIXA8bphyh0hCO g==;
X-CSE-ConnectionGUID: UuWYYCM7SEiZJUK6+0UrNw==
X-CSE-MsgGUID: +DY7piOsQu++dpvMhpaZow==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="84312416"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="84312416"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 00:54:33 -0700
X-CSE-ConnectionGUID: yLAxdTmkROaTZwZbYhG56w==
X-CSE-MsgGUID: pg21FxZcTSCabShhrkdWzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="242845209"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 00:54:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 00:54:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 00:54:29 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 00:54:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EM6kBwc9R9iaNj+oOaPXRKyR3eJWnpVK+EkgVBNrKNcVulyOKk/L2f2ncmVgE+X7LG57IbPUxNndqtvnmbfLhQBLttOuZ3SoHpp8SEg2JO5utOitScVyG1QCDhPbq4wv9xhDDJBZGUqWrBcrNDLlB8+QeKtqOcnh+IwoUUsDnovZUrNeS7Qk3+SBoWrc93+QFsg9oxL/Y0EBUD52OP0LvsIhdb0MOQTcZOR6jSZ1Z/0R1SlsN9kp2I1ZEvcYu6N0P7GY4MnLjrXkPH4skxZzAD2OEsRT6WfN+JVDrw9qeq2vQqBzBM9rMjT4uzYFd7hGkZEumYoaJfre4NHmxX364A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXWkMG7kIlMBRWefU8B82WQzbefDBd9DbSIe2xiXsm4=;
 b=NOVJqF4e00rEj+/qaIFoTE6+dDfS//eNivKLY8AV3sZPjVucq+rf1VHjyhff5crMt49wClYn3bK4/CFbj8CCHQqRie5JBICrHcbnML83dyj5U1wB/FYnxvpJX4ib55vjNpw+duQNj0oMdOxJHcvw5DriUzg4QqCvHYbJ8ZtuO1+3DeypgyrBJFKVuLeboloE0acVi9+OrIJ+94Q/mYOGZpAYbtH8Isjo+kvcfSfuGGsBIieRcZ3yah9Jo5u/FqX+kzNd6YzHe9mBhyw6Ea2aw0uViN/WRUUjPK83ZTCsPl4sox4TBO6m2t+eBvAOTutd5I9UmWkvQWmkmcy/bNud2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7614.namprd11.prod.outlook.com (2603:10b6:510:28f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 07:54:22 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 07:54:22 +0000
Message-ID: <e048720d-ab17-4c7e-bcdc-acdadc201f69@intel.com>
Date: Tue, 9 Jun 2026 13:24:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3] tests/kms_chamelium_color_pipeline: Add plane
 color pipeline validation
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260605113019.2597500-1-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260605113019.2597500-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::17) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bff8670-d048-4d12-5cfb-08dec5fc515c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799006|56012099006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: fcYqRq2F8DdY8nDcuyLJtiQLICG4/DsLZ/advpWj4U+g6LpqqQk7kPj1SMLSg+FxpdYdOO8UYuk503fG3uKge2Mv8G8eUxD8mx0flpElirhyv6GTS/D1uWQ2G0DwoJUn5WMMFscVI03w3qx1pCLQtTbE6/Zpqq/LtuAWnuDCZNW072lW2LHFVSyF86oBK54BnNM7n/+UBCo1oiisqCjaharJKjDBxv75MswaghWhvYdf5CCTioku1R//aDk7xV4memkZaXMj+eo5iDO4OOGzCa9o8aypyrPy8rHP5CcBKqFvmcPdo+StYtKqZnjlWTDclP2LYQuK3vLI8RPGxVAOvTC8ak+2D3LCM/ZShJa3/VA6r43Qj264z64Oc8A0vVz3H+8jfJjvbXZ0cR/rlivasM9+nYE6WLKoU7xwzBaAtyjgHM/y5JsmF03LoFg22EwMFhOOE9V49vf//3TWu3CDZsLnnFHpY84Gy76SiLH3P7yPMUkV0Dqb5AF8109fQxbq5pvssx1+cXkgWfFJLOg3L+ifZhRkkG+cPp69y/sqktYE+f7MZHcCTFW+UxS1sge2tXxnUDP+3rjNRE0Vg7IfGI1cpTpTzRjh3oC0AhmlYzUgOo4mKrW7U4nL2sJcUt3Q8bJyFC66r91oxBSNNgTeDtzzg/4S49jzsZ40TqR8EQlpXZ5RP343/uXHPdboOsQz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXNBOUE0V2lkTHU4L2wwdy8zNVppZWhuNWlRUXg1aFJESUt5aGxaVnpOb3FN?=
 =?utf-8?B?NTFpOFduSWQ4RmUrWG5PUWgxeDB2VlZyZERqVDdkNFVKYkpUUE1oWUJFVXdL?=
 =?utf-8?B?VkU1UkZ5c1NKSnpXamR6WmRENC84emp0U0tVTlNRRThZY0RGVU9XVjBBTWky?=
 =?utf-8?B?U3lQSTBTNFhCQmI3WDVLZWVpWXZ1Z1ZLa1lvbTI3cVFwQk16c0RldFgvUVh1?=
 =?utf-8?B?VEJla2h4TFVseHZldzFwcWQ4Y0JuL0ZUM2FaYzhXNEhXditESXUyTTRLZXZT?=
 =?utf-8?B?ZUdJcTQ2a3A4eE0rYkhVaVZVOU9SMCtzMUVQbmdjVmR5NHRzVGF5c2xzQUZv?=
 =?utf-8?B?ZHZoOW9XcXlJVWM2cFNXbUU3bnRocUp6bGZjR0sxWDR0Rmw1M25HU2V0QldM?=
 =?utf-8?B?ZTRMUFdWRFMrdTl6QWJYT1Z5VXRkN0piUGdqSC9raWI1bHdNM2VRbFNOTm1Z?=
 =?utf-8?B?Q3BTLzhKWHN0RFlWUVd6LzFlQ3gzQ29qWmtuaTZweFoxSVZRQXB0QUFPYmI0?=
 =?utf-8?B?WU5ESWRML3ZGemFSZStsNEZ5S1U4dXhaaThNazJldFVyekkxb2wyUGoyY3d5?=
 =?utf-8?B?Qkk5Myt4Y3cwNnhudXpLSWtyak5Hc2xpU0NrWXdhZDI2b1RqSzJ0YmRKWFY2?=
 =?utf-8?B?RWFvcE5HTTB3dk5ya1pyWStGMGMwREtic053NUJNYTduUDBZTDdHN05oSHpJ?=
 =?utf-8?B?RE50TWNtMWpHR2p6NXJlWFdXQUcrckpWVXB0YTlIU28vS0ZTZFJweE9rUkJY?=
 =?utf-8?B?NjhWSTFlY1hSdlNsVG42TlpwVUJJZEhnTTR0S3p6ODRpWUIxUTFUb2RKdWZQ?=
 =?utf-8?B?bWVVRm9IcG1KSkdSRjJpbnoxNlBQOWNoV2VLaitJSXpjSTJuUHdVLzlkUVpy?=
 =?utf-8?B?TzZzK2QxNnFzczVZdjlORGxpTElBMzlNb2hGTEh2WDNSL2pGaWNlTmIwdWZh?=
 =?utf-8?B?WkJkYVNtRGZMRW51YjJEK2syQW1FYXJPQnhQV3NsRVZ3Rk13eDhpd3pPYVFk?=
 =?utf-8?B?aDJYam9LaE90Vk9Md283SXIxV1Ryd0g4aFhCTXphaUtabmZPc3B0aUJvMUI4?=
 =?utf-8?B?T0psck1pY1JkT2ZxR3BrZk9kZnlyVXJ1bWE5UW16cDBQQjlwK2ZJQk1JbjNB?=
 =?utf-8?B?Rmoyd2ZaZHc5SEVkWlUwMDhJTTRQT3hOd05RMmVQM1JYd1RqYWkwMHJOM0Rh?=
 =?utf-8?B?cko2MHdMMGZYZWx6alZaSDFjYkdiOHg2RXE3NldPbUtZWm9OVDFOT3U0S0Ux?=
 =?utf-8?B?dzNJaXE5SzJKL3IvN3VWVkE0Mnc4SWRxUkh2dGlTVmVGT2hpa1A0Zzd5UWZa?=
 =?utf-8?B?RWhDOU9SOTBabGV2TlAyRVdoSXc3Y21mNWZwZTBSNUV3dWpBZlBVbHZsMW1z?=
 =?utf-8?B?ZjFXdjFUR2t6b2syNlBnc0M1OU00NnBEcUUxRUdYT2Qvc2dxQUdZWUhGb0JG?=
 =?utf-8?B?QUZCMEhvS0dKaTZWUzBvTkxybERzcXp5YnFBUVgrcWZWSks3R3BaQ3JhdWlm?=
 =?utf-8?B?TjA1bVdYd2FVaHZmNnR3cnFTK3M5cU0zUkZSMm82WXhxUWNUd3A3SXU5cWd2?=
 =?utf-8?B?eHV1c3NSRmJhTFZveFBNWmVaSytubklxYS9DWWUwd3FEc2RkTFliOGVlYzZ5?=
 =?utf-8?B?NXd3Z3UrYUVSdXhxNkxNdmV3ZWVCbm10UFJUT3pFa1YyVEd3SmF3ckpLTHVP?=
 =?utf-8?B?cE9xaXZtT0N2Qm9Wck1FWDMxa0prTHMxckI5VE1ZclZFRmtyUHJDK2UzN09o?=
 =?utf-8?B?N3NNTXJ6Y21FSlBjQm1ES1Z1Um5CUEpLZndwdE1ncnQ5TFAwalI0T09rbkV5?=
 =?utf-8?B?TVNnWkJSN08vQWxnWG5nSVo4eHBCc25vVEtQZEtUQTZLTG9wcXRRWlZSa21a?=
 =?utf-8?B?ZWsrRlpoSHd2Q1BjWUFmN0EyOEQ5SFdYUDNGTEVjUDBmNmJucEUrd0kyVThX?=
 =?utf-8?B?Ukw0MDVDSWc5M3N2a2hKWDNLWGxTelhEWUt0UzZZckZwdXQrSDVlTDBodVAy?=
 =?utf-8?B?UjB0dnVrcS9LN2JzTnQ3Mk9pSHc4Y2tadUthS3hjQ1pVbzFpZGlJTkFndzZ6?=
 =?utf-8?B?U295bXpWYnZwd0V1WU9xMWM2UFR5US90c3NjNXZ4TXZJdkhkckZQM2hZVEpL?=
 =?utf-8?B?bUc3TE9VSjV3U0NOcVNFVERGYzBXdWJzUWJGb0pHQ0lselBLczdML1RKUm9k?=
 =?utf-8?B?UlRVQkk1QytOUHJBWWVpR1YzaFVxVWNJY1F2NmVqbC8zMjVvZk5EbWxzdW1t?=
 =?utf-8?B?a2dNWnp0bHc0dU5uWVdEQ21MTXhQUmJFRmN0N3dVQVBMTE1ZbW5hQUI2V0VK?=
 =?utf-8?B?SUZEZ3pOOVVFWTg1dGpuS0lLaWJ6cWJsZGE2VDVFcFJ1RTZQQzJvR0pOalBy?=
 =?utf-8?Q?g+rXphPlQRxzO+vc=3D?=
X-Exchange-RoutingPolicyChecked: L4Msq+O42DU1mtUGtBJ+iqtiEnZ9MgB6mftxyzsPaKn306AtQxALxElajHL6pXLqO6H6SJwlL+DP1K2FAJLT7Qjy8VjT0MaMAg7N32uxm/wICwq5dBL/Xsd6eYO5Yg8FML5BkbZWG1AFoHeggG3oOkPSB+V+WV+iVHz/ruSmLhmlopoj4embOYxUdosNcZPe/pLf3weVrncJibtOxcC26DeJWcbVMEBoc5AxbqWCuWoQqY/GX64PmDfZdeuXDJuhm7Hdfu40KpvJbrVcqMeeYoQRRcZ0jjGCofiOpBM8d3WExCYeDdnem7IDn1zHS6ehx//mIzZGoJgAmNtK7hgTSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bff8670-d048-4d12-5cfb-08dec5fc515c
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:54:22.4539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkwLNakSUgX20lB1UQ7XSLaR95SWJR/W54UIDuw7SiOfDMWPOMYCSnnKxcg4FkZXGm9OkH3+cuwy7/7zupyGaNcSQ1pHDRxhCHBuBbNDtPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7614
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



On 6/5/2026 5:00 PM, Swati Sharma wrote:
> Add a Chamelium-backed test to validate DRM plane colorops
> using frame capture instead of pipe CRC comparison.
> 
> The test generates a software reference framebuffer by
> applying the expected color transformation in bypass mode.
> It then enables the plane color pipeline in hardware,
> renders the input framebuffer, and captures the output
> signal using Chamelium.
> 
> The test passes if the captured frame matches the
> software reference framebuffer within the allowed tolerance.
> 
> The test fails if the captured frame differs from the
> reference, indicating incorrect color transformation,
> pipeline misconfiguration, or hardware output mismatch.
> 
> v2:
>   - Fix build error: pipe_output_combo_valid() -> crtc_output_combo_valid()
>   - Fix memory leak: add chamelium_destroy_frame_dump(frame) after use
>   - Replace igt_require(port_idx >= 0) with continue to avoid skipping
>     all crtc/output combos; add test_cleanup() before continue
>   - Fix misleading indentation in test_setup() port matching loop
>   - Remove unused data->primary assignment (planes iterated separately)
>   - Remove unnecessary data.display.is_atomic assignment
>     (igt_display_require() reinitializes it)
>   - Add igt_require(has_plane_color_pipeline) for early fail-fast
>   - Disable automatic FSM handling (igt_chamelium_allow_fsm_handling = false)
>   - Prefer HDMI over DP in test_setup() to avoid DP FSM failures
>     during chamelium capture; add chamelium_port_wait_video_input_stable()
>     before capture
>   - Fix test description
> 
> v3:
>   - Remove unused data->color_depth and data->drm_format assignments
>   - Remove no-op set_color_pipeline_bypass() call before painting
>     software reference (pipeline is already in bypass by default)
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> ---
>   .../chamelium/kms_chamelium_color_pipeline.c  | 411 ++++++++++++++++++
>   tests/meson.build                             |   2 +
>   2 files changed, 413 insertions(+)
>   create mode 100644 tests/chamelium/kms_chamelium_color_pipeline.c
> 
> diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
> new file mode 100644
> index 000000000..db6107221
> --- /dev/null
> +++ b/tests/chamelium/kms_chamelium_color_pipeline.c
> @@ -0,0 +1,411 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms chamelium color pipeline
> + * Category: Display
> + * Description: Test to validate DRM plane color pipeline using Chamelium frame capture instead of pipe CRC
> + * Driver requirement: i915, xe
> + * Mega feature: Color Management
> + */
> +
> +#include "kms_chamelium_helper.h"
> +#include "kms_color_helper.h"
> +#include "kms_colorop_helper.h"
> +
> +#define MAX_COLOROPS	5
> +
> +/**
> + * SUBTEST: plane-%s
> + * Description: Test plane color pipeline with colorops: %arg[1].
> + *
> + * arg[1]:
> + *
> + * @lut1d:			1D LUT
> + * @lut1d-pre-ctm3x4:		1D LUT PRE CTM 3x4
> + * @lut1d-post-ctm3x4:		1D LUT POST CTM 3x4
> + * @ctm3x4:			3X4 CTM
> + * @lut1d-ctm3x4:		1D LUT --> 3X4 CTM
> + * @ctm3x4-lut1d:		3X4 CTM --> 1D LUT
> + * @lut1d-lut1d:		1D LUT --> 1D LUT
> + * @lut1d-ctm3x4-lut1d:		1D LUT --> 3X4 CTM --> 1D LUT
> + * @lut3d-green-only:		3D LUT
> + */
> +
> +IGT_TEST_DESCRIPTION("Test to validate DRM plane color pipeline using Chamelium frame capture instead of pipe CRC");
> +
> +static void test_cleanup(data_t *data)
> +{
> +	igt_output_set_crtc(data->output, NULL);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +}
> +
> +static int test_setup(data_t *data, igt_crtc_t *crtc)
> +{
> +	int i;
> +
> +	igt_require(crtc);
> +	igt_require(crtc->n_planes > 0);
> +
> +	igt_output_set_crtc(data->output, crtc);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_require(data->mode);
> +
> +	/* Disable pipe color props. */
> +	disable_ctm(crtc);
> +	disable_degamma(crtc);
> +	disable_gamma(crtc);
> +
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	/*
> +	 * Prefer HDMI over DP to avoid DP FSM issues
> +	 * during chamelium capture.
> +	 */
> +	for (i = 0; i < data->port_count; i++) {
> +		if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +		     data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
> +		    !strcmp(data->output->name,
> +			    chamelium_port_get_name(data->ports[i])))
> +			return i;
> +	}
> +
> +	/* Fall back to any matching port */
> +	for (i = 0; i < data->port_count; i++) {
> +		if (!strcmp(data->output->name,
> +			    chamelium_port_get_name(data->ports[i])))
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static bool ctm_colorop_only(kms_colorop_t *colorops[])
> +{
> +	int i;
> +
> +	if (!colorops[0])
> +		return false;
> +
> +	for (i = 0; colorops[i]; i++) {
> +		if (colorops[i]->type != KMS_COLOROP_CTM_3X4)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void _test_plane_colorops(data_t *data,
> +				 igt_plane_t *plane,
> +				 const color_t *fb_colors,
> +				 const color_t *exp_colors,
> +				 kms_colorop_t *colorops[],
> +				 struct chamelium_port *port)
> +{
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode = data->mode;
> +	igt_colorop_t *color_pipeline;
> +	struct igt_fb fb, fbref;
> +	struct chamelium_frame_dump *frame;
> +	bool ret;
> +
> +	color_pipeline = get_color_pipeline(display, plane, colorops);
> +	igt_skip_on(!color_pipeline);
> +
> +	/* Create HW framebuffer */
> +	igt_assert(igt_create_fb(data->drm_fd,
> +				 mode->hdisplay,
> +				 mode->vdisplay,
> +				 DRM_FORMAT_XRGB8888,
> +				 DRM_FORMAT_MOD_LINEAR,
> +				 &fb));
> +
> +	/* Create reference framebuffer */
> +	igt_assert(igt_create_fb(data->drm_fd,
> +				 mode->hdisplay,
> +				 mode->vdisplay,
> +				 DRM_FORMAT_XRGB8888,
> +				 DRM_FORMAT_MOD_LINEAR,
> +				 &fbref));
> +
> +	/* ---- Software reference ---- */
> +	paint_rectangles(data, mode, exp_colors, &fbref);
> +
> +	/* ---- Hardware path ---- */
> +	set_color_pipeline(display, plane, colorops, color_pipeline);
> +
> +	if (ctm_colorop_only(colorops))
> +		paint_rectangles(data, mode, fb_colors, &fb);
> +	else
> +		paint_gradient_rectangles(data, mode, fb_colors, &fb);
> +
> +	igt_plane_set_fb(plane, &fb);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	chamelium_port_wait_video_input_stable(data->chamelium, port, 5);
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +
> +	frame = chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	ret = chamelium_frame_match_or_dump(data->chamelium,
> +					    port,
> +					    frame,
> +					    &fbref,
> +					    CHAMELIUM_CHECK_ANALOG);
> +
> +	igt_assert(ret);
> +
> +	chamelium_destroy_frame_dump(frame);
> +
> +	/* Cleanup */
> +	set_color_pipeline_bypass(plane);
> +	reset_colorops(colorops);
> +
> +	igt_plane_set_fb(plane, NULL);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_remove_fb(data->drm_fd, &fbref);
> +}
> +
> +static void
> +test_plane_colorops(data_t *data, igt_crtc_t *crtc,
> +		    const color_t *fb_colors,
> +		    const color_t *exp_colors,
> +		    kms_colorop_t *colorops[],
> +		    int port_idx)
> +{
> +	int n_planes = crtc->n_planes;
> +	igt_output_t *output = data->output;
> +	igt_plane_t *plane;
> +
> +	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
> +		plane = igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
> +			_test_plane_colorops(data, plane, fb_colors,
> +					     exp_colors, colorops,
> +					     data->ports[port_idx]);
> +	}
> +}
> +
> +static void
> +run_tests_for_plane(data_t *data)
> +{
> +	igt_crtc_t *crtc;
> +	igt_output_t *output = NULL;
> +	int port_idx = 0;
> +	static const color_t colors_rgb[] = {
> +	        { 1.0, 0.0, 0.0 },
> +	        { 0.0, 1.0, 0.0 },
> +	        { 0.0, 0.0, 1.0 },
> +	};
> +	static const color_t colors_red_to_blue[] = {
> +		{ 0.0, 0.0, 1.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 },
> +	};
> +	static const color_t colors_red_and_green[] = {
> +		{ 1.0, 1.0, 0.0 },
> +		{ 1.0, 1.0, 0.0 },
> +		{ 1.0, 1.0, 0.0 }
> +	};
> +	static const color_t colors_only_green[] = {
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 }
> +	};
> +	const igt_matrix_3x4_t ctm_red_to_blue = { {
> +		0.0, 0.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0, 0.0,
> +		1.0, 0.0, 1.0, 0.0,
> +	} };
> +	const igt_matrix_3x4_t ctm_linear = { {
> +		1.0, 0.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0, 0.0,
> +		0.0, 0.0, 1.0, 0.0,
> +	} };
> +	kms_colorop_t lut1d_linear = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.name = "Pre/Post CSC GAMMA (linear LUT)",
> +		.lut1d = &igt_1dlut_linear,
> +		.transform = &igt_color_linear,
> +	};
> +	kms_colorop_t lut1d_max = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.lut1d = &igt_1dlut_max,
> +		.name = "Pre/Post CSC GAMMA (max LUT)",
> +		.transform = &igt_color_max,
> +	};
> +	kms_colorop_t lut3d = {
> +		.type = KMS_COLOROP_LUT3D,
> +		.lut3d = &igt_3dlut_17_green_only,
> +		.lut3d_info = {
> +			.size = 17,
> +			.interpolation = DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
> +		},
> +		.name = "3dlut passing only green channel (RGB order)",
> +		.transform = NULL,
> +	};
> +	kms_colorop_t ctm_3x4 = {
> +		.type = KMS_COLOROP_CTM_3X4,
> +		.name = "CTM 3X4 (red to blue)",
> +		.matrix_3x4 = &ctm_red_to_blue,
> +	};
> +	kms_colorop_t ctm_3x4_linear = {
> +		.type = KMS_COLOROP_CTM_3X4,
> +		.name = "CTM 3X4 (linear)",
> +		.matrix_3x4 = &ctm_linear,
> +	};
> +
> +	struct {
> +		const char *name;
> +		const color_t *fb_colors;
> +		const color_t *exp_colors;
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +	} plane_colorops_tests[] = {
> +		{ .name = "lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-pre-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_max, &ctm_3x4_linear, NULL },
> +		},
> +		{ .name = "lut1d-post-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &ctm_3x4_linear, &lut1d_max, NULL },
> +		},
> +		{ .name = "ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &ctm_3x4, NULL },
> +		},
> +		{ .name = "lut1d-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &lut1d_max, &ctm_3x4, NULL },
> +		},
> +		{ .name = "ctm3x4-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &ctm_3x4, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_linear, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-ctm3x4-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &lut1d_linear, &ctm_3x4, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut3d-green-only",
> +		  .fb_colors = colors_red_and_green,
> +		  .exp_colors = colors_only_green,
> +		  .colorops = { &lut3d, NULL },
> +		},
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
> +		igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
> +		igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name) {
> +			for_each_crtc_with_single_output(&data->display, crtc,
> +							 output) {
> +				data->output = output;
> +
> +				if (!crtc_output_combo_valid(data, crtc))
> +					continue;
> +
> +				port_idx = test_setup(data, crtc);
> +				if (port_idx < 0) {
> +					test_cleanup(data);
> +					continue;
> +				}
> +
> +				test_plane_colorops(data, crtc,
> +						    plane_colorops_tests[i].fb_colors,
> +						    plane_colorops_tests[i].exp_colors,
> +						    plane_colorops_tests[i].colorops,
> +						    port_idx);
> +
> +				test_cleanup(data);
> +			}
> +		}
> +	}
> +}
> +
> +int igt_main()
> +{
> +	int i;
> +	int has_plane_color_pipeline = 0;
> +	data_t data = {};
> +
> +	igt_fixture() {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1);
> +
> +		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +			has_plane_color_pipeline = 1;
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
> +		igt_require(data.display.is_atomic);
> +		igt_require(has_plane_color_pipeline);
> +
> +		igt_chamelium_allow_fsm_handling = false;
> +
> +		/* Chamelium init */
> +		data.chamelium = chamelium_init(data.drm_fd, &data.display);
> +		igt_require(data.chamelium);
> +
> +		data.ports = chamelium_get_ports(data.chamelium,
> +						 &data.port_count);
> +
> +		if (!data.port_count)
> +			igt_skip("No ports connected\n");
> +
> +		/*
> +		 * The behavior differs based on the availability of port mappings:
> +		 * - When using port mappings (chamelium_read_port_mappings),
> +		 *   ports are not plugged
> +		 * - During autodiscovery, all ports are plugged at the end.
> +		 *
> +		 * This quick workaround (unplug, plug, and re-probe the connectors)
> +		 * prevents any ports from being unintentionally skipped in test_setup.
> +		 */
> +		for (i = 0; i < data.port_count; i++) {
> +			chamelium_unplug(data.chamelium, data.ports[i]);
> +			chamelium_plug(data.chamelium, data.ports[i]);
> +			chamelium_wait_for_conn_status_change(&data.display,
> +							      data.chamelium,
> +							      data.ports[i],
> +							      DRM_MODE_CONNECTED);
> +			igt_assert_f(chamelium_reprobe_connector(&data.display,
> +								 data.chamelium,
> +								 data.ports[i]) == DRM_MODE_CONNECTED,
> +								 "Output not connected\n");
> +		}
> +	}
> +
> +	igt_subtest_group()
> +		run_tests_for_plane(&data);
> +
> +	igt_fixture() {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index deaa4ac5b..311a2b52f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -367,6 +367,7 @@ endif
>   chamelium_progs = [
>   	'kms_chamelium_audio',
>   	'kms_chamelium_color',
> +	'kms_chamelium_color_pipeline',
>   	'kms_chamelium_edid',
>   	'kms_chamelium_frames',
>   	'kms_chamelium_hpd',
> @@ -395,6 +396,7 @@ extra_sources = {
>   	'kms_colorop':  [ 'kms_colorop_helper.c' ],
>   	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_chamelium_color_pipeline': [ 'kms_color_helper.c', 'kms_colorop_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],

