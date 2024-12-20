Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A40CE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 10:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD55410E37E;
	Fri, 20 Dec 2024 10:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCHMyyky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDCC10E135;
 Fri, 20 Dec 2024 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734690992; x=1766226992;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LzoLxUgFvoRTyUCb/lnZCVK4qwKmcVedvp+WQ+f6Nrs=;
 b=CCHMyykyaK9lWHOu7+bnh0/iAGVFeIfIwPj7BDoPH72Q5cY7u1A0tifu
 YYEaHFYh2610hAT10p2JU0t0+X2llRYjgnNQ7DHg2muk8ES3CaEfdCpFK
 o30MUnAef7l2XJLOY+QCCPHuDoQ6n+uiJr2N8Y/UXwef5lIaZXHZjoBsc
 voQEyICO8pGAwsSwz5LoZM6FsFQqV1cuNvmBIBHLlI1jE1Qv9/dowdBYZ
 aUbGV5sg5ryBLnKEAC7rbsPvSsmrUsv7BrEhVS9AKuf0T5NAfqjA/MiPq
 xvOm7KSHiZChOjfHgwjB1bDsNjgZr6k6ISGbEOZt3xsHfqyljj3X8qfOh w==;
X-CSE-ConnectionGUID: zhcmPk0aTc+U5xeaffff6A==
X-CSE-MsgGUID: OaJEnOpYQf+Vq7uvQfoieQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35269117"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="35269117"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 02:36:32 -0800
X-CSE-ConnectionGUID: XfrIoHQVThi5vR/gPPBGAw==
X-CSE-MsgGUID: 9xx/Bq8LTmebIwxo+Knm0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="98306672"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 02:36:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 02:36:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 02:36:31 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 02:36:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvpZvch1IpUsJ7MPSQYx26ViTcB2MOyQVZdVgyfXmNahM1KNgWUVX9Glp0XXJBtj78P1PIPu2jClGK0TqihuAHNvfarCPiNNp9JoawYm1G0FR6kKtwnhSzVM1zNlc0D0IRJ31N2c+/SOwHSlj917L7wjxtR0TrnKcUFcevlno3m3VQu6xBhLL4vZnFsLMGb4BUR6ds5frrHc9y/4fZxr1NzZ544eZ/JInWnWAimXR9CADDv8Jtq8rEcLB51wl65aVACGlLsaSLEOtk+5ZhsTdLgYJ4pYby55x0ckn/hOyxTvElpDFNmvBIuLbjrN0UrQ6yxiKdF6XyUQgifaJMZFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/LKI/y5gp4CEU4uYp7nzS53M+Ch3OM+G5UGF1oh7u8=;
 b=ea940muWt51J3KK5PzgnypdX6FPJIa5+qG5wKUl4dta4zPY/QV2hrchHNVcoau1eJMXBv3X0GwNv878q8Oh0yDrY0lKiWN7RUtl9e78CYyCm7qjQfwcIMAeCbIhWcCr/XuOQwXGfQfQZ9CBv0L8NfFRekrn8agLMQ6tD1xgNp6Zdm6rrunR4kM7NIFQ+zy+PNuPWlAuNy/SP8e4Qyz2XykMKQSU5k8S/YD4OL6oDfyNXTPq81/nFnrxvxRU+Q+QrGjCX9WdNAIadEN0zx8JJ42S21nNS0e+BgGIbzItFjW1yLvoG+dcjItOeHzzH4Sudcm6XHPZ/HeacSWQgcfa+bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Fri, 20 Dec 2024 10:36:28 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%6]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 10:36:28 +0000
Date: Fri, 20 Dec 2024 10:36:23 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <i915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests=2Fi?=
 =?utf-8?Q?ntel=2Fgem=5Fexec=5Fbalancer?= =?utf-8?Q?=3A?= Decrease required
 load in `full` test
Message-ID: <ubvcocnm4cpxgp2vszjsposstlt7mvn6goqqsytxaqsldjwiul@fi2r6muxx2xe>
References: <uupn5abwcptf6p4zdaz4ozl5utjcwij2sjlebrlgkqw3xupxma@nvacr67vd6tf>
 <173459519840.350813.12374231105564545373@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173459519840.350813.12374231105564545373@b555e5b46a47>
X-ClientProxiedBy: VI1P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::36) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 946bd71d-3057-4acc-047f-08dd20e22982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmpHbjZiaVJrU3lVMVU3LzhSUE9FM1lRdGRuVlRyNDhEZ0dUSUZQUUNUUm15?=
 =?utf-8?B?T2t0ZlBzOGFXdGcvaSsxQnVTV2hOc0dWMmdJNFdCZndUZ0NmaVNpd3B3eUMv?=
 =?utf-8?B?UHp4YlV0TUNuVGNDUWk1UFpSN1QxazRwVk5rZFpGQ0xpY3pCMkJwODJpOG9W?=
 =?utf-8?B?M2JuTTNIdXFMbHdiYkYwcThoQmFyaDlxaGdDWGVmK2JPWllZYkNCOXNxek1G?=
 =?utf-8?B?UWhZTExhOUVkSzFkdTZac2VhZ0J5WkY1NTgrZHBzMU56Sm84SVQvK3JtTXJx?=
 =?utf-8?B?T1JzNVhvYzhuOFJSM1JEb2JaOTdBOGsySEpSalo3QnFJWEdCazhGV001M21F?=
 =?utf-8?B?QnZVdllGKzVzaUJMbCtLK2QvcUR4UGNtSEtIczRENGt0T1d4ZC9tWjdiR1NQ?=
 =?utf-8?B?YllET09kcFpYZWNTNWdYbFZkK3N1TzVkdkNkZ0Frc2ZBbG5OdU9rQ2RtQnR1?=
 =?utf-8?B?RGRxVmRBV0ZFTWd4M0x0b2ttUVlsUXZCUmc0ZzBUQkJabURUampyR2tkZ05j?=
 =?utf-8?B?WUp0UnVJSFhQT2xNa1FuMFZmZ1hyL0IyOGtkaTRuc1lqekVSNmhncnEycU41?=
 =?utf-8?B?dEhLeGV6bWl2RTJBVld5M0pJY0lzWU9wNTR5UXJNOGdxWGFSMmNaYXdUR1Jx?=
 =?utf-8?B?dThScDhBd3l0b0hGLytaVXBSdU5HTjQrczI2NWswYTZiaDhTWitZTytWSGMx?=
 =?utf-8?B?aWlUb2JkU2tZbmc3Q3BnWFd0R2pnMExteFdXVGo2Z1JUMFBQK25heUM4MVhi?=
 =?utf-8?B?eEl6YlphaXJKTU1VdHlXOUMrN2xqdndmNUFFVk1nOUVzSjVobTBFLzF4SFFM?=
 =?utf-8?B?V1pYSlZYbDFHdVRxSE0zUU1lN1lUZGorcUFzWTVhdEhlMmhnbG1sclVjM0Nq?=
 =?utf-8?B?OVZCREdEMTFYM0dMSDRlTjJ3UmtOWndlTGpJZ3VYcWlOYXk0bjNpcG1LT0ZE?=
 =?utf-8?B?cEhPay9SOGNncUNSMFdsUGpRN05teVdyWFlDc1oybGFVNk4yUW5yNnZhM2dH?=
 =?utf-8?B?SmcydXl0RUtPTFlaNTJjZTREMTA1M0NzRzhIaWxmNkpNMUVjK3RQK20zeDY4?=
 =?utf-8?B?bzdKSG5SZHZYc3FxWkRQa0RtV2NpdlYvcVVaMFJXcXhSMGIzOFpZK0pTK0pF?=
 =?utf-8?B?bTdYR0dxNHg3KzRoemNoMWVMbkdLRVNaQnZRSk9IT09vTnZwR2MyVkhZZDF5?=
 =?utf-8?B?dGJTZXFEYTdJUEptQVpWVERIcDZMQlJHbnNXazl2ekRsSmFFWXdJa2l4MTcr?=
 =?utf-8?B?ZUZVZm10YU1PRy9FYkxuQW43ckJMTkdVUENNV0k1RTQ1UExLRmEyNWhzYlJo?=
 =?utf-8?B?dTBSRld5R1lNQ1JEc01RZVhBZWlkdVczTCtRa2RRL2NCUVg1dC8zUlVMQjVB?=
 =?utf-8?B?d01ralU0QThGUm5qYnNoZDBhTnE2bUR6WmdQVlgvclFLOTg5cmQ3WHdWaDQr?=
 =?utf-8?B?OHN4NjNnZkwxWEE4b1dFQUZ6cnRYSzFmaUVuUGJaUUpkcjFiM2FXZDRwWkVT?=
 =?utf-8?B?VC9LWFpmb25qTU5sSXVjZi9BeEZjRTRwNGhsNktyUmJnc1BXQ29ZSjhtcmlp?=
 =?utf-8?B?SWd1WUdsUGJSYy9oRHZTenRsV3ZMRk51bDN5OFQyVGxyOVhOdENKTno1Wmxu?=
 =?utf-8?B?d3BVdzBiV000U1poVlVwN1RlcExDUEIybUY5dHRhdm9MaWgwa2NHanBaMVVr?=
 =?utf-8?B?UGR0QXB2MHhWM2ZoRko3MkVkTFQ5OVBkaGR4VTJ5ODJXb0NxYlJyNGZHVXpj?=
 =?utf-8?B?ZUoyU1hVNThwYTRjYlMvSDduWG1DZVZqQ1QyYmRrTU1xMldFb2dwV0dHK1Ey?=
 =?utf-8?B?cGpNUXRSSXhWUU5jWUdCQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHdHS2ZVS2dJVnEvcHVJSDJqN2FuaXVIT1ZNT1IxVEh3RjFUZEY3Y2MrQ1d3?=
 =?utf-8?B?eVc5V0YvLy81c0FFRnlzKy9sZmZXTFB4QXA5akQwaU1zRUk5S3hsL3RHRFFB?=
 =?utf-8?B?TEs0c3krSmxZRWRURkxvWXBkQy8xb1d1aGIwS0hUaVg1R2NlNkZZOEl2SE1M?=
 =?utf-8?B?Znk5VGhGOXYwajZZYllmWGx0ZHBrVElvQkdzMy85ZURCcUx5bHM3Tmt4UzMx?=
 =?utf-8?B?bXdReW1MbFVWeHZIWTdYbnlzVEN6TzMvb2hDN1pleU1IU0ZpOC8xRjkvdGFm?=
 =?utf-8?B?ZktOTWh3U0FHZWNtTFg0SGMvT1ZyYzMyZFB0MHp0ZERRUDdxb1JlaThtNmxh?=
 =?utf-8?B?Q0kvaHpVaXhKS1JWU3R5VDIyU0w4KzVwNnRKTjRvUGcwWWcwZk1pNis3WUJw?=
 =?utf-8?B?QW83WEdnR1NlNGpKN0JYaFg3YS9jaUh5cndRbmpBVXN0RFlKYUsxa1pBZ01K?=
 =?utf-8?B?TVV4aTQ1YnRyalRLcDNDWktCMnBXbjNtTS9lem9EMUczbEpTN1ZDdDgwYzEz?=
 =?utf-8?B?MFd4aGw5aFFIZ0tJSVRsaFhQT3QyM0R3dmpEOGZmMlFDdkg1UldxMDRQL3FE?=
 =?utf-8?B?R09pb1R6WUI4NnQ0NXNHZnZrL2dnOGxPbVpTVFdDVlNmbHM0ZHY5bHZjMitp?=
 =?utf-8?B?T1o4UnBMQTBBMTV4d2MyQUMrZHV0UEdCUnF4MlkxYnNJS2JURHpsV2tlVXNJ?=
 =?utf-8?B?YVA4R2Z1NVZwZitVUkkwMVQ4MFlndG5odDNsMTNyd2NZUzNNZS8rQStUazc2?=
 =?utf-8?B?c25XTzM3dnVRTmRoZi9JZGx6dkdQWCtiWGNHZVdKcHFuVEhkVldsWlBkNmJN?=
 =?utf-8?B?OTBMWTZzRmluWXJ3YzFKNitHQTdES0VBV2MvNnQvZ2xLdEY5YnNENDFTMWUr?=
 =?utf-8?B?UlE4ZUZTRXVncWhrYVlkWjdOODlXU0wyS0tlOVBwbCtoNzEwSUlGZ0lIcmc5?=
 =?utf-8?B?TEsrTVBsQ1l4cUR3bjdTVG01L0tCZ3E1K2tzYkZjOXc1eFU3THZHaXRENWVz?=
 =?utf-8?B?enBMK3JHV1RjL2tRbjdJYmFaZ0ZTb3JXZm5mUDdRZ0J2R1VxSHgzN1V0VzdU?=
 =?utf-8?B?SkJYeENEdXdVbjJUN0tJZGZaOW1wajV2YmZZQ0s0TTNoY0M5UTFLVHpRdllj?=
 =?utf-8?B?dndmcWN2OWJ1aWVaSVVGT2YzM2NhTkZlUzBSRHdLaVRhTFp3dWkxSkJpRTls?=
 =?utf-8?B?L3dYdzJveHphTUUzbjZwZnkvUDJqWWwyRFNjSWdEbFpXaitFSGt4SWhOOUE4?=
 =?utf-8?B?c2twMlNhS01NUHFoTW01SktDYmk1SG5FaVc3TFNMWFhQWE5VTmZJblYwSzNp?=
 =?utf-8?B?YXk1b2dqUUNYRXFYVTFNWEk5YVJSd0FQTmtRbkVYWUQrQ2IrMk04d1F6eGpz?=
 =?utf-8?B?UnZEOXI5cG1zZVhHUGdDc0UwaXhwK0M1MDhaYkNKZkNHK282cExKK245a3ZT?=
 =?utf-8?B?Yy9LYjJXZEhyMkUwVzlxc3lLdll1K2xJSkNYSXorSFlKbmhqemRUQXZTVDZS?=
 =?utf-8?B?UlJ4dklxWXFvMHJOVTV5WnFNY25wRlFNUFd0ODRtUzh1WU95VUxtYlYzZ2o3?=
 =?utf-8?B?Zm44R01Gc1JiSDhKdXNMRG16OFNqYlA1SXNYRStTSmlqajVRTUk0Y283eURG?=
 =?utf-8?B?d3pHYWxXZ2srZjN2WjVSZy8zYlRDTnQzK1Z1M2srMUtzRFcySm9MbUFRUEto?=
 =?utf-8?B?bkJReHlROVArYm9MaFlpcnd5bXVVRWltZVB3Mm9Ud015TldKY0w2RGZkaGRt?=
 =?utf-8?B?TkRpSHNacS9zNCsrMDE4TzJyeUJxcjBnRWU5dnJUSjZFVG9KSmhQZ3lKVlFC?=
 =?utf-8?B?Q3cvNWxuNnNueUhsUTNzTVhPUnJaNFNUTjZPVUp3RzFUWjc2anlUK0pvWGdK?=
 =?utf-8?B?Z09CdlFTazBvQWczYzVsS2FHQjRXclowcktOdkdlMUV4SXpmVXh6cU1WQmxz?=
 =?utf-8?B?eVdVTTloTUo3T2Vqd1BUNWxsS20xdkg0QjhOTENVVXp5bC80RGdSb3R5dHIy?=
 =?utf-8?B?SHZueWl0cE9NQXR1dHZUeGlaQURqbWh0cUNVdk5UUUxmeDAwaFMvSGpFU2Fr?=
 =?utf-8?B?cGJ3Unpza1QzeG5xMzlWRXZTbkcxWm4veVNWYW8ySGVmS1J4VUZhSDFwWUxv?=
 =?utf-8?B?QnhyZ081U05uZTMwTDVmaFhNd205WHNzb3pBTEhsUldHM21GUlZLb3ZxdlZw?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 946bd71d-3057-4acc-047f-08dd20e22982
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:36:28.8818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eykRwNzMnBli2DTnAx5ZFTI/N7sh6Sw7UQaat0cTn58Ep7kp2sydxgk2TseAgIuhFkJppMQ7aJ9OFcRrfNqFDBNOxi+4eQO8EWZLQwKrFcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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

On 2024-12-19 at 07:59:58 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_balancer: Decrease required load in `full` test
> URL   : https://patchwork.freedesktop.org/series/142734/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15865_full -> IGTPW_12338_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12338_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12338_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12338_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-glk2/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_balancer@full-late:
>     - shard-dg2:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-1/igt@gem_exec_balancer@full-late.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-dg2-6/igt@gem_exec_balancer@full-late.html
>     - shard-dg1:          [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@gem_exec_balancer@full-late.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-dg1-17/igt@gem_exec_balancer@full-late.html
> 
>   * igt@gem_exec_schedule@wide:
>     - shard-tglu:         [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-4/igt@gem_exec_schedule@wide.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-tglu-2/igt@gem_exec_schedule@wide.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-tglu:         NOTRUN -> [FAIL][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-tglu-3/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@i915_pm_rpm@debugfs-forcewake-user:
>     - shard-rkl:          NOTRUN -> [SKIP][9] +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-rkl-4/igt@i915_pm_rpm@debugfs-forcewake-user.html
> 
>   

These are not related to my change, Please re-run.
Thank you.

-- 
Best regards,
Sebastian Brzezinka
