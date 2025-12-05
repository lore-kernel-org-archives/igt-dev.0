Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230DBD37497
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 20:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB09E10EBA2;
	Fri,  5 Dec 2025 20:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IyuL4q/K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5226310EBA2
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 20:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764966115; x=1796502115;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W/cVKOLaVGgDWX31FCmWgJlz/Q8qO+vI4Z6MYJee6ak=;
 b=IyuL4q/KkrcS5MYZMdq8FVt4Kq0c4CVlUDASQB0kEu1xE/98rN2Og0MT
 gahbZLiDB1wFWhTN/t3SsiVG5Nokd2V3oZGgIIWImLRJRLuLalZxNT8qU
 man/kAy7hpHMQo+BL94qI8IvbVSuv/a+CXZLLJW+0BFlDEVJ4nOPkEaiz
 Jk4WRk2abwX7luZKyy/WJHYIfmIkT/ZAUe0XjrXbsfZAu3IQtQwPa2KlW
 aYBXkJYMQ71zdDezo+pyRmjD3zSnODTMTUu3Xf4XmvZsxQ3zZkQW3Ej+L
 lajlKFWgijYWF1DouIvL0jjcyyjujdkXmuZuptHPUXJ4Lvpx8UixqFLYk Q==;
X-CSE-ConnectionGUID: yBOt9ezDRWGqeVyEvwqOkg==
X-CSE-MsgGUID: nrR1Da6xQB2MISHWsgCY0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67045160"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67045160"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:21:54 -0800
X-CSE-ConnectionGUID: VzYP+fw5R6Gr33K1Tgu+3g==
X-CSE-MsgGUID: obGmpORSR7qPPKH2nGlVSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="199815450"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:21:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:21:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 12:21:53 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.50)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:21:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmTZsqzdIeEKrEAw7EziIbrRmJTAUtezOiAPAbZse3LOuBbTzfyjCFTKxMR4XizsmM3MXP43/iXhKC0DvimsAqcthr27DsWJzhjag4gIiTVRad66Najt4T+s94WAdbSwdwQQCqUA53vPnOwPKtMYA8ACUuXfCuznjVmJa3xJJe9+c4dLfMWu7As6yPJRH075HM7azU0dyNcSbX6kiQcIinI3RA2FTvWkDlZ9/4gimxScSSrRwKGr31qIUZ+mncLTN5RK4O8kuDSRNKbX0ZNCwOhnlEhbYtXRUmvqbF8b3qnUO54MpJWs5Vo1gnLM2lozxXHgBy+ccoTxmL973YAr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugkZ211vnchldk/zxgX58wf1sAfi9upEA8WGeXAdlsc=;
 b=hXmqoCEde8ZuO8WV24L5Ct1jkhPAAHwtCl4HexOxqOF/gJsVRA3hy1oAKB2LlrPQOaZvFXUxyfS0dEjh6p2hM52S1XahpKIngDx/ocEuZ2Ym8ombBQOvkT2Fw/OyMLXnRsKGadc/h5XQSWYUQTgEV7wPIDRYd4idbFhosyJnApw0MNu0q63PLURiFsdIKkXIJ1ynAswWgM/fTQC+QlPgHV0hyOlMDvxR32FZbllkKan0g/XxNVlN5TB1LIZ5YUOPcaplcsN4ej/i7haPbwLKOJlhpvxD7oh/tdH4f8CHZahE08+cAt3X/iROz5KOA3VU9PetltjnGTQVpA7mbCoTqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 20:21:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 20:21:50 +0000
Date: Fri, 5 Dec 2025 12:21:48 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/4] drm-uapi/xe: Sync with
 DRM_XE_OA_CAPS_OA_UNIT_GT_ID definition
Message-ID: <aTM+3OtRZUrhbiJZ@soc-5CG1426VCC.clients.intel.com>
References: <20251205000528.720706-1-ashutosh.dixit@intel.com>
 <20251205000528.720706-2-ashutosh.dixit@intel.com>
 <aTIxXnBjmxGzvj0d@soc-5CG1426VCC.clients.intel.com>
 <87pl8tprzs.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87pl8tprzs.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0148.namprd04.prod.outlook.com
 (2603:10b6:303:84::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a06158-aa3b-4813-a687-08de343bec32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVFpVlpJVEJHZzgrMjhCcU1sWS9sOGZQRkJOV0JmejhDQnZma3JSUnFSWE9Z?=
 =?utf-8?B?OFBXcW9DQ0FhVmxtRUx3SWRwczFHYXJjU3NCYU1KSnZvcWFib2Y1a2NZNUtW?=
 =?utf-8?B?eldPQnNaWjNYdEtMay8rS2dENERoV3Fid0NDRzNGcnlQalBhdGR6OUJkclZJ?=
 =?utf-8?B?VnV5bXpnNFM5czFYbEw2OFA2aUZmdGRvV0dxUVZqQjNYL0lTVDVDY1FyeEhu?=
 =?utf-8?B?NkNkM3JHbzZKTXRyTWxyb3kyNTVLMVc0UklOa1B5Z0RpYkVaZWFCVUYzMURh?=
 =?utf-8?B?RnZaMFczZ1BxNzllOElabDFZOVR5UExKeUVFd0VhZjRUNENpY0pCR3JObzFq?=
 =?utf-8?B?bzBZK2VQbFZJd1ZUWGtQQ0ZQV2Z0VG05bWtlNTc0T250bW5kaXhFU1kwSkph?=
 =?utf-8?B?cFVuRHBZak56dDZKanAxek9IajNuQVJNUjFHQkVCNnIzRWdwSHMvTFhZOFdH?=
 =?utf-8?B?TVBPWTR5QkZnT0VuM1BOZklBYi85bW1YcDllWER5dy9PTUVLck9pUmtVdlhh?=
 =?utf-8?B?TXA5UlIwdDJsdUI0Q2FhQjQ2eWVyOGNHNURvdk1IdkNNVUcxYTE2U1laYjRD?=
 =?utf-8?B?N2FDYm9PSmNocnFEaG93ZHMxY0pZeGhyYnQ0d20vWm9Lbzk4eEg2RXF5VWN5?=
 =?utf-8?B?L0p6ODdoWjNmYXVrREJkNUZpY2VPZGRpK1F1MmxMakxYdUNtSkF2ZlMxRU1p?=
 =?utf-8?B?NFUzS2sxUkF6VEVsRjBnWlJ4RHIzbzRYWDl4UjlmK1pLWjNWWGxYb2t3TlZq?=
 =?utf-8?B?Q3R4dGpBMGxQS3pGVHlORURRZFJTZFZhNmNmbXhBeDc1MUxRS2RrbnZWWVln?=
 =?utf-8?B?SWRLbUFFVGpuaEg2a0FsdHJsWkYwcjFCVDhaOXNVdnFBbk5ZSXNqVS84Z3BH?=
 =?utf-8?B?OTRWTmhuc21oUFpOU0V6cjZIYmJCMTJoQTNPZlJMNU9qY09sUXZlL1RSWm5o?=
 =?utf-8?B?azhZSythZWNtZUs0YkJyOFF4QWo5ZWhta3JSUCtrWStyV0lMU0ZsZkFBTGFT?=
 =?utf-8?B?VHZpSkY0a1ZEbTdvUVlTMDltZUVRNExKNFQ1RForamxBTVgzRlJRM0NDQk8r?=
 =?utf-8?B?QWcrSVdzc291T2ZsUGM4VmxRNEJPaU9Ed241QkZkcU5DcEtWV0EvblI4SS9R?=
 =?utf-8?B?eFlYd2h4dC82YjFKMTlEMytmd0JDanJlRWNHZUV6Y1p0MEszMTVrc1pGYlhm?=
 =?utf-8?B?SVIxNmZUbnRSVHFmQ1h0MVg5UU0rdnFkL3VmTjFBSURNZ3pwSUI3dzgyU09x?=
 =?utf-8?B?anpXTFNkMHhOTUdwMFRQd1MyT0trdmIxS0JRczgxUnlLczNia0FqS1FBSThm?=
 =?utf-8?B?MGpGSThadlB6dnhkcENBaDAyamtZZmtmanY1SUx2UnlFL3orQWI5NUNDdFg0?=
 =?utf-8?B?Y3Z2QlpaQU4xNmpsZmhLWDM0UjBGS3JPZE4vaGNOdlVTTm9kMXBxbE9DVHZ6?=
 =?utf-8?B?d3VNVWw2RHFmTkd0UDU1bm9uSC9sSVVGdTcwNW5kZHpZbVpORWRxNWFLUzJj?=
 =?utf-8?B?dW12VERORXJybitjSVA3aGtLeFphamE5eHlRY2w1aWJva2pUYXpGcVU1c2h4?=
 =?utf-8?B?cE5PK0l2ZTJLRnd6Q2xPdzlqWHBQajZ4cDhtU1VzRFpoTlZmV21oZWp1VjlT?=
 =?utf-8?B?UTFOMGhQVnBnUU1icTRNZmh4UmdCZFV3cGJFbC9xRStYd3ZpNklTTXVIT01k?=
 =?utf-8?B?ajIxUlVzaHlJZW5ENEFuY0FSeFB5VVFCU0hwaXQ4ckU5a0NNYWRYbWtHUlBm?=
 =?utf-8?B?aE1VVXVyUjhZR2tpYUhvYlJYRXZ2Y0p0Y1BoQUtOdW9HSnBBeERBbGltRFFE?=
 =?utf-8?B?amx0Ujl0QmVZT3RVK2NpcDZZN05rdFhPd3BRYW8zMEJvNXY1blIya3owNWR0?=
 =?utf-8?B?ZEMwSHBqcFphUXlXZThDL2s0MzJEVzdReFZtVkRCZ0E4aVFLT21LeDAyMWhp?=
 =?utf-8?Q?jBwFGBfNc/1O/IX+1oNl8rgeH8F72fMt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUJneHoxZzlndVkwaEYxUnRYNUFpTjZ6SWJsaWFBMGpkYjJPR2FSaWwwK1Yy?=
 =?utf-8?B?dUx4cC9zWitrUjVucXNoak9WYjVwdTlmNUZTRUFaSEg2OTNPSEpQNzBVTVR6?=
 =?utf-8?B?L1pDMzN1MjhEWWx2VVZqdkhZVjlXOUNTeFIxRnMySnRNRWxpdFpvL2JESUZs?=
 =?utf-8?B?aVhEQW5LSUs2YUpLSzU4eFg1bWhETWpVcENEa2d5L3NxWURPT0VOUUE1ZmFI?=
 =?utf-8?B?LzdwaEoyOW5tcjRxcFRWQWd1dDQ0VERwZjFYc2JEQ0FiZnA5RFMxV0ZYbldN?=
 =?utf-8?B?SUZkcHp0Y1NmOVoxSXRtV0xFN2lTWlE3RHRyS1VKNmtoaVZ3MWZ1dTFXaVNN?=
 =?utf-8?B?emhNd0VlT0tFR3hDb3lQR2JIWDR5L21CR3hQc2Q3VjlMWjgvMy92RzdBVUdT?=
 =?utf-8?B?UEdUcjlyRjlEN2FSYXQ5ZTFjODVKSWdrdnZKRUpOeDFJeXpZWjFXTUZUZE44?=
 =?utf-8?B?Zld4RzZKTk95WEhoUVdpVVR2S0dIdU8rYzk1bHg0b0JIQUNmeFB3ZERBdlhr?=
 =?utf-8?B?NDZYbFJ2REtOeUsyenFkdlA3SEYzSEFlM1hHcUR3RE0reHg5N2JBZ21UdnJ5?=
 =?utf-8?B?NHFNdFI4cUxiOGdrYTAvSTZtVHF3Z3JaNGFKYzlXaklTSm91K3NMUkVXVFNu?=
 =?utf-8?B?UElvcldaSUExakxwbS9sRkVUSnJLWi9PSXBtcXhEQzRPMGx4VkdyeWN1L3Zw?=
 =?utf-8?B?TCtmTTRNREd1K0tDNkpGclBNSjNmTmw5aGJoZ0o3ZHVYT3hTYWVTeGJwcWdG?=
 =?utf-8?B?WHBYbkdaZzQ2S055SVBUSkxkdDgxdVJNUXdEQktzUmpHaDh3WnJHd1BlZnA2?=
 =?utf-8?B?VVdiWTJ2emR4aSt4bEc1RG9Cd3VXRU5GWXhGTE9HWFJ2Tkh4N2hlVGd1RlVN?=
 =?utf-8?B?TmNlckRuenFVeVNkeDNibGtPa0tqZFZ6Y2ovS21zRTk3dy85ajZ2RCtvVDVm?=
 =?utf-8?B?Lyt6aHR2NDRMZ0xScGJxUXFlenZDY3o5aklOREtrMGYwMG1WZ3BrYmE1SUJN?=
 =?utf-8?B?ejZSanNMaUN6UFRuNlJ4R1FCSTZ0TTBCWGZpMlM5TzFMS0ZUYklMWnZGWHhL?=
 =?utf-8?B?amFQamJpdHdsU05lN3ZrK0xWamxHbVRsRm82L1d2ZVNCMHN2TXgvNGNVbUdN?=
 =?utf-8?B?enk3VkNFeTh5eTJZTmJHSjkxWEVCUW1Vc3NNS1V4TDlSS28rdFlncG5VdDFJ?=
 =?utf-8?B?SE1yYzMyUGlvM1k5bUpYdkpVeTlKb3RCZFI0VGtGNmRuZHlGWThRUi9qc0dE?=
 =?utf-8?B?eHU5MmxRUXFwSWNEU2dnbkdiODlaMmZVRkZ5NUNHOXVwQkRWTUNXb3RkellJ?=
 =?utf-8?B?WmFpNGdrelFqQXVUdUdUS1YwWk1yMGF3SFhOaWE2c3lFSExOOUkyQnZMMUNP?=
 =?utf-8?B?V2NGK2JZSzk5QUxtcjg2N21DM1FYd2h0YStRY0JKSDhBdHZnclVZMytOaUt3?=
 =?utf-8?B?T0w2Rzk1eElNNVg4bVlhTlZDWlFVOHh6SSttSWJTUTAwNjVRRWd2Rm01VFdi?=
 =?utf-8?B?UTdiWGJqNktJYkhwWEd0TWZWMThCd1c4RVk2WjdUWDlqaW5lT0FIa1JmQkQ3?=
 =?utf-8?B?d2RIMTVkZVRzU2RiemJyRGpVOUg0MXdoTlM1aXpEOU50UzN2amdZNXRBa1RS?=
 =?utf-8?B?RXE0c3UrUVR2Sm9UUmIyenhxOGxHUmpQekVyK3paZEdmbGJJME9NSUVYazYr?=
 =?utf-8?B?TDZVNTY4YXFBSzA2L1pDMmE5dG5JQ3BtSlNSenYyRUkyV2wwQ21uU2hWTE8z?=
 =?utf-8?B?YU1VUUFpSlNXQ3E1d0tnaEVCSWtkSmYzSWxZREFKdGNpSWFZS1Iyd2dKVW04?=
 =?utf-8?B?aWpjVTQ5eXhyRm51RURxbnU0NTlmd3dSSjJjMXpEaVRlVVhKMWtLaGQ3djd4?=
 =?utf-8?B?TVYySFlQTkphdzd6U1lWdFBtbVRUQmxsMlZFdVpvRFlkM1FZd1VPeUdjYUx2?=
 =?utf-8?B?T1E5MjJqYU9TblY1amFsdVkwVHA0MGFES05CQjA3YnJwMlJQSXRJTCswcytL?=
 =?utf-8?B?ZjZGQ0NmZFBXWFNCa3NydlgxRmVLUzFiaUZOYTM2OUlSbkhQVERUemw5RVM1?=
 =?utf-8?B?VStoVTkwZ1ZRcG95V1g5WnN1aHJxTzRPenlhajRRcm1UZjQwM0NNTzlTU1dy?=
 =?utf-8?B?Tk8zMHNYMVhjNzZITEpqWHVEUUs3TGhpSlR1US9XU1F4dHVpeHNXcEUrOE9G?=
 =?utf-8?Q?0McJeK8gAXa3A1WBxktLQoc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a06158-aa3b-4813-a687-08de343bec32
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 20:21:50.5841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2r8FKrbYDbiHrPe3cuBiQnZmOMv2VBnW41owE0wLmTbUv3j4OQG6+2WBVN6k2qxtWCpJc6W8OaSbr8eOENPn5rjp3T4NlIssFJEMoBvZF+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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

On Thu, Dec 04, 2025 at 06:44:23PM -0800, Dixit, Ashutosh wrote:
>On Thu, 04 Dec 2025 17:11:58 -0800, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> On Thu, Dec 04, 2025 at 04:05:25PM -0800, Ashutosh Dixit wrote:
>> > Align with kernel commit 16e076b03658 ("drm/xe/oa/uapi: Add gt_id to struct
>> > drm_xe_oa_unit") to bring in DRM_XE_OA_CAPS_OA_UNIT_GT_ID definition.
>> >
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>
>> Is the intention also to bring non-OA changes in this commit?
>
>It's just a sync with kernel xe_drm.h at the commit (latest one) mentioned
>above. So yes it will pull in all the changes till that commit.
>
>> Then you may want to change the commit message to sync header file or
>> something.
>
>It already says sync. Otherwise I just titled the commit as the last change
>that went into the header file. I think anything is ok, but if you or
>anyone else has any suggestions, I will change the title to that one.
>
>Also, if anyone else merges their changes to the header file first (I have
>seen several pending merges on the mail list), this commit will change. But
>it will always be a sync with the kernel header at the mentioned commit.

I'd recommend - "Sync with kernel header".

With that,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
>Thanks.
>--
>Ashutosh
>
>
>> > ---
>> > include/drm-uapi/xe_drm.h | 55 ++++++++++++++++++++++++++++++++++++---
>> > 1 file changed, 51 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>> > index 89ab549354..62e3221f59 100644
>> > --- a/include/drm-uapi/xe_drm.h
>> > +++ b/include/drm-uapi/xe_drm.h
>> > @@ -210,8 +210,12 @@ struct drm_xe_ext_set_property {
>> >	/** @pad: MBZ */
>> >	__u32 pad;
>> >
>> > -	/** @value: property value */
>> > -	__u64 value;
>> > +	union {
>> > +		/** @value: property value */
>> > +		__u64 value;
>> > +		/** @ptr: pointer to user value */
>> > +		__u64 ptr;
>> > +	};
>> >
>> >	/** @reserved: Reserved */
>> >	__u64 reserved[2];
>> > @@ -403,6 +407,9 @@ struct drm_xe_query_mem_regions {
>> >  *      has low latency hint support
>> >  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
>> >  *      device has CPU address mirroring support
>> > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
>> > + *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>> > + *      This is exposed only on Xe2+.
>> >  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>> >  *    required by this device, typically SZ_4K or SZ_64K
>> >  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>> > @@ -421,6 +428,7 @@ struct drm_xe_query_config {
>> >	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>> >	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>> >	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>> > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
>> > #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>> > #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>> > #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>> > @@ -771,7 +779,11 @@ struct drm_xe_device_query {
>> >  *    until the object is either bound to a virtual memory region via
>> >  *    VM_BIND or accessed by the CPU. As a result, no backing memory is
>> >  *    reserved at the time of GEM object creation.
>> > - *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
>> > + *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT - Indicates that the GEM object is
>> > + *    intended for scanout via the display engine. When set, kernel ensures
>> > + *    that the allocation is placed in a memory region compatible with the
>> > + *    display engine requirements. This may impose restrictions on tiling,
>> > + *    alignment, and memory placement to guarantee proper display functionality.
>> >  *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
>> >  *    possible placement, ensure that the corresponding VRAM allocation
>> >  *    will always use the CPU accessible part of VRAM. This is important
>> > @@ -787,6 +799,17 @@ struct drm_xe_device_query {
>> >  *    need to use VRAM for display surfaces, therefore the kernel requires
>> >  *    setting this flag for such objects, otherwise an error is thrown on
>> >  *    small-bar systems.
>> > + *  - %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION - Allows userspace to
>> > + *    hint that compression (CCS) should be disabled for the buffer being
>> > + *    created. This can avoid unnecessary memory operations and CCS state
>> > + *    management.
>> > + *    On pre-Xe2 platforms, this flag is currently rejected as compression
>> > + *    control is not supported via PAT index. On Xe2+ platforms, compression
>> > + *    is controlled via PAT entries. If this flag is set, the driver will reject
>> > + *    any VM bind that requests a PAT index enabling compression for this BO.
>> > + *    Note: On dGPU platforms, there is currently no change in behavior with
>> > + *    this flag, but future improvements may leverage it. The current benefit is
>> > + *    primarily applicable to iGPU platforms.
>> >  *
>> >  * @cpu_caching supports the following values:
>> >  *  - %DRM_XE_GEM_CPU_CACHING_WB - Allocate the pages with write-back
>> > @@ -833,6 +856,7 @@ struct drm_xe_gem_create {
>> > #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
>> > #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
>> > #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
>> > +#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION		(1 << 3)
>> >	/**
>> >	 * @flags: Flags, currently a mask of memory instances of where BO can
>> >	 * be placed
>> > @@ -1013,6 +1037,20 @@ struct drm_xe_vm_destroy {
>> >  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
>> >  *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>> >  *    handle MBZ, and the BO offset MBZ.
>> > + *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in combination with
>> > + *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises when the underlying
>> > + *    CPU address space range is unmapped (typically with munmap(2) or brk(2)).
>> > + *    The madvise values set with &DRM_IOCTL_XE_MADVISE are reset to the values
>> > + *    that were present immediately after the &DRM_IOCTL_XE_VM_BIND.
>> > + *    The reset GPU virtual address range is the intersection of the range bound
>> > + *    using &DRM_IOCTL_XE_VM_BIND and the virtual CPU address space range
>> > + *    unmapped.
>> > + *    This functionality is present to mimic the behaviour of CPU address space
>> > + *    madvises set using madvise(2), which are typically reset on unmap.
>> > + *    Note: free(3) may or may not call munmap(2) and/or brk(2), and may thus
>> > + *    not invoke autoreset. Neither will stack variables going out of scope.
>> > + *    Therefore it's recommended to always explicitly reset the madvises when
>> > + *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
>> >  *
>> >  * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
>> >  *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
>> > @@ -1119,6 +1157,7 @@ struct drm_xe_vm_bind_op {
>> > #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>> > #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>> > #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
>> > +#define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
>> >	/** @flags: Bind flags */
>> >	__u32 flags;
>> >
>> > @@ -1273,6 +1312,7 @@ struct drm_xe_exec_queue_create {
>> > #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>> > #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>> > #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>> > +#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
>> >	/** @extensions: Pointer to the first extension struct, if any */
>> >	__u64 extensions;
>> >
>> > @@ -1657,12 +1697,19 @@ struct drm_xe_oa_unit {
>> > #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
>> > #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
>> > #define DRM_XE_OA_CAPS_OAM		(1 << 4)
>> > +#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
>> >
>> >	/** @oa_timestamp_freq: OA timestamp freq */
>> >	__u64 oa_timestamp_freq;
>> >
>> > +	/** @gt_id: gt id for this OA unit */
>> > +	__u16 gt_id;
>> > +
>> > +	/** @reserved1: MBZ */
>> > +	__u16 reserved1[3];
>> > +
>> >	/** @reserved: MBZ */
>> > -	__u64 reserved[4];
>> > +	__u64 reserved[3];
>> >
>> >	/** @num_engines: number of engines in @eci array */
>> >	__u64 num_engines;
>> > --
>> > 2.48.1
>> >
