Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F332C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 07:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2045310E2AB;
	Tue, 18 Feb 2025 07:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHwjbc2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA95A10E246
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 07:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739862007; x=1771398007;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YB+1Dw9LgyQoZkjIAr+Fk7thc+Flk2GiZixYzJTaQCY=;
 b=MHwjbc2ElogCktAm741g8Qcz0Qytb8rR6yiVg1YZMDcr9e58QGm1oDww
 vTjygrEIzeHTCuNxqp1/oCGWYekum7AQtIVTHDpffngPMsf7444fhOkHR
 Zof2uuyZ2omOafuvA3hNIr5cS2+bAZ6fcvYGZ2JEbdBrVHv/qP2dCx0d2
 eo6AVfG9HVTuA8LmYOBZDHRRF0LX8mAe8eJEvjmZVjFQMjeuwfW3m6Lhx
 5mBZkYYmYHG1J3Kmtli+1sYqDuhgw/HAaUIBW7Aa82nj/HyHIu850x8lx
 gNuWpx7PXWpWGhFhzbBLAzw4nw+DNthLAXte1fhMU5BZoe87p5V305ULh w==;
X-CSE-ConnectionGUID: /sqpc6XoS0eCCvWDGuoi/A==
X-CSE-MsgGUID: aWBbXCFCQtOOsMXVXNMt9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="58081237"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="58081237"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 23:00:07 -0800
X-CSE-ConnectionGUID: QCj6U0/DRbuGbtLUWRoU8Q==
X-CSE-MsgGUID: 5CCYRFTpQia1VBwGx3lTsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115209520"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Feb 2025 23:00:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Feb 2025 23:00:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 17 Feb 2025 23:00:06 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 23:00:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TiBVHGXYZ0BMHoeuSW84hEhqVH7WFXpbNxVh9eDxw+pZseJHB0ZhpGtITi9zEu0jtwQcIWh7kQM1U1cjZuhW8/NYV6tIV7X2YBqouj1PskM3SMZCtHVVTqwgtJpGiB1ZWDA+HODIEyLimd3sUn4kfPUQek68HKr0ZW7fZ2KVvfPMTjLYTSdg5wMUwP1IxMsuf7fwE6BFyuhbP2ODBQh871cRi80VdfveYbmlKvfE85AcES2vDGOQ4DMbELlPT9X4mVon52huDGtW5mkbV8Ce5O294BxJpVlaccQsHaza5xvSeW3OKVa9ugKl1YgJAiLeLlRXYQRBYbv6o1urOEbwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5GaTiuOLZpE9sAzBkfg2tG+JnVh5MMLZ2i50s5DEm4=;
 b=bMuWmGdHcb/IH6pDyGvf14R/5he66QsW/E5w0sNgQZ6zMImOrArCqC0NckkspRLkyMuqK2+Jpt/9Mp/UIBE9AQMf8Yr/i+77kDC3E/jemKX000SBw2drla1ImiheeZQJ5wihulBV66/GKTQkgfMTy/2Xyf6oNyvMEfcA/Lem3pqhDCyPxA/UIEQQ73X/nVfCVrMxKlGF5jW4IVgbZTKjWvyhqlv30oMy/tXNPAE0FJT/pvcwMRS/NgnqAIUKZcWfB29x0Sdgv2pTpY+i5mnXYQu8r+McDaWj9p5vD0vy6/sg4ddxnFaDaF0GHFSvEvInpIMyIhen1kAujpDZmWErww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA0PR11MB8398.namprd11.prod.outlook.com (2603:10b6:208:487::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 06:59:22 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 06:59:22 +0000
Message-ID: <fb071eb9-fc2a-4bfc-ac5f-d2aad2c0e2b3@intel.com>
Date: Tue, 18 Feb 2025 12:29:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_odd_pan: Add test to validate odd
 panning
To: Nemesa Garg <nemesa.garg@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250217151444.2019299-1-nemesa.garg@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250217151444.2019299-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::11) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA0PR11MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: 95419d04-bcc1-4179-68c3-08dd4fe9c5b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0hVNzVKdGFObC82SWJFeG4rR0JINGZ2ZjR4czFBKzhjL3NRelF6cUxQdEsy?=
 =?utf-8?B?RjdMQUxyaVJUZHp6S1dUS2kvVWtMNWZpSUpQZTBiQ3o4M2d5ajh4NlhYOWJn?=
 =?utf-8?B?bUJ3OVE3VDJybTZ3cWxmeVRxakVkeUpGWDQwNEpoQjZnTTUxUDVQYlBFdjYw?=
 =?utf-8?B?Unp1QmpRaGxtN1Y4SkRnWkwvVVhHMjZaMFVTQzdnLzdvNm9zMk0xYk9UTDFN?=
 =?utf-8?B?THFFTlNVRWpzeFJWb0dhTkViTWhWaWZzcHJXdytjaEhNVG9CcncyaEJGdjBa?=
 =?utf-8?B?RkNoMFZoYi9mUmlwV0gvQnpwR1RuL2o1VGYvZFZhZ0kzNEJIYi9scU43YXpj?=
 =?utf-8?B?NTdiTEhhSW5lZGcxdmVuT1VCb3VZdDEzSVJXL0pIVlU5L1ZzeHljRVpINjNR?=
 =?utf-8?B?YzRsZE1vNmRpMUZNR1M4SjcwdFZQOUxVckE0WXptYzhWUzFIV0RQZGgzVitx?=
 =?utf-8?B?VVc0amNkSUI4ZWhLbnQ4UGFtVDRPd2RlMDRvK1ljb1dwd1RSdDN1MTBWUTNP?=
 =?utf-8?B?VkVlb1lVblVPdEN6bkp2bFZoUXFSVHd3SHgvNXV3MUc5aXVjTzF6cVVOci9l?=
 =?utf-8?B?ekdZc3phd0pYcWhxd25QTWNVWVRPT3RjY0xjdEdpd1BWRzZmVWRBYU1EQVJk?=
 =?utf-8?B?V1JPc1R4TFMrRllhVnZ1YXg3U2tKeHNnT25kWGV1WWFUQXEyWGtZK1ZJcFps?=
 =?utf-8?B?VCtTSGU4SFlzU3VvZWxiWFY5dHphVnA5eFAvaU10Z0pJaFd4bWp1R3Nma2hG?=
 =?utf-8?B?ZXg5VSttQnp6RzFnY0R3M0hzL1pVYWk1Ti9LdUNNU3Q2RHdrZXhwVTlkc0t3?=
 =?utf-8?B?RWE4Y1VwUUFQZnE2cGJ5MnVPUkZDUGtGUXpyaW96NnlscFVtaU1UZzUyTDRI?=
 =?utf-8?B?b1hvcXNpRVZTVUk2cmNsZjl3VU02bldibEF4SHZXTEJsaXI2M0RlSHdXTWUv?=
 =?utf-8?B?d24wQ2ExTlBvc3RWczRXSGRwekxZM0w0SWczL1NZT1BMbnFNa1EwWndzT2Rn?=
 =?utf-8?B?anYxUkNtcHl2VUNWUGRscHI3MmVPTkJqdVk0b2NnKzBuWWJIcmlZWkNWR1po?=
 =?utf-8?B?bWN4cWNjYm56TnZIcklsaXkxakVDQnZ3S0doQ2JwQ2p6YlpERVpwdmM3WTVY?=
 =?utf-8?B?VzBBVHZpcUM3RnpEaEJvSmdnaThqdjdHK3AwVXl0MlRRSFgwb1VRZHZsWDM2?=
 =?utf-8?B?L3JQeWlETEZ6SHBOeTJtTWM4MDNQQ0s3M2VOZ3R0R2JYSnUvSkZGZlBYcDVa?=
 =?utf-8?B?aVlpUk5IcXlTQTlwamk4K3JTRlJra0NoYWVyNWpFRkRxbXJUOXk3SWxCam1B?=
 =?utf-8?B?QWpYUmhLT1FISnpRNGZCQk5ESERqeUU5MjRPK3dwRlEyaE0wUE80citkZmsv?=
 =?utf-8?B?NkhhNGV4WXFIOFBtRTNWKzVpR01OTEc2dTEwdDZYVm45VFdqTi8vMllkS3U4?=
 =?utf-8?B?c2M1cnYrRUxZNmxEMzRDeHE3cmJWK2pUR3pxa1BNMkxhcEk3RGNqQ2VJQVR1?=
 =?utf-8?B?SCtOVlE3TWVLSlhsbjQxMy9mVWIzR0V4TU1La2J0bmE1SFU0a216YlBBYXo5?=
 =?utf-8?B?Tlpwa2ovY05icTZ2TWRLQ3JIUHhDdFowWnFOODlyQmlHQnRDVnVCOW5XRnY3?=
 =?utf-8?B?WFM2MHVNN3N3R0tUU0E4QnNsN0FnOC9ycVpmS2k4aE04b0c1dG9pcDVVLzZE?=
 =?utf-8?B?OHRmakdvcktZbFczQWZScENxSGdYb0RvUytkK0VXOFlqR0wzNlpCck1qa0E0?=
 =?utf-8?B?VmtCaDNlN2t3N1hrWWNwWTVOSlNScmpndlZwUFE5Vm1XU3J6S1JIS2tNZ3dl?=
 =?utf-8?B?NFA4SHJIczBqNENtbTRwWkdqNk5TMXZ1eERRZGtMVitlVmxNUTEvUFhWQ0xi?=
 =?utf-8?Q?B7aHxD+o6Khbi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGlnMitnRkxjM2lOYXV5RERvVnFxWjJjcWNhaEtOWjBpamUrakV0WXBRZDVn?=
 =?utf-8?B?YjBDNFM0VnVTZmZQN2grSk9VT0lxdG96a2VyVzIwZWVSMk5PZlV2RElQOGpY?=
 =?utf-8?B?SzZ0QjZTSStRdGhEWXoyK3hpSzhkQlk5c0d1ODV3NlFERUNWb0RDbXFOTXg1?=
 =?utf-8?B?RUVQb2M2VXZDUkRpemlNT2NtamdnSkJIQzV0WVBJd0loc1R2RXN6a2VnbXBV?=
 =?utf-8?B?MzNxQXdYYjRlUjhoNlhPN3IxOXZFeTlQUW1keFlQSjgydWVGREtMcU9vck9H?=
 =?utf-8?B?dGI2RjFuN1p6K3JaL0lyTUtOYWFqaTFsaEFnMG8yVzdQaWsxYlp0WUNCUW1R?=
 =?utf-8?B?dzlMajhSdFJ0VWpHaUZJVFlyMHVraXcwUUcvcUxSb3JXMjhtU1RCVnBQVGJW?=
 =?utf-8?B?eXpnY3hyak1tVy8rRm55c2U5QTdJWi84emdTRjJ0TzBHOWZuZ2xpRzBLVnFT?=
 =?utf-8?B?YTg3cCtxbUV2a3A4MzJlc0ovRkhSd2VCaGpLeGxiL3RaM2hNaGR5bWF0ZDJQ?=
 =?utf-8?B?NTZuVS9WZHpJeWUrbGU0eHlHWUFFNmFmUEw3V2dHa0orVGtweHpNMlNYMGZ2?=
 =?utf-8?B?WElBaXVXbW5TZDZWOWhQRnpkQ0lvZkJPRUwrUmhJcG5iSkpBU0ZVM3laektl?=
 =?utf-8?B?cGZ1ZlVndm1hS3ZPeUxxMnNZNlhSUDEvenRpMTc5N0ttUFNIWGNLQnlZVWRW?=
 =?utf-8?B?TEZWV1V2QVpCd2dzZ1piaDQrenVJbXNsanFFWFJxM29zMTBnVENkajZET3FZ?=
 =?utf-8?B?MEFLaFRjVmhiT29TYnhBcXprdEZpa3hwcTZqQ092a3AxSzJGV21UdXNMMkJG?=
 =?utf-8?B?SEJMbmRPSGNzMGU3ZE9ZWnBvQ1YrT1RHa09GRzJsZGpEbWFZd2R2THpST1Z6?=
 =?utf-8?B?Q2pFQXE2dnVxVURKdDlJMm9YRjNPYzNENHkxaVIreFVQU1QyZCtlZTBRTU4r?=
 =?utf-8?B?Tm9FLytDVWxuOTNwaVdnb1gyMDZPVFJVTkIyTnM5UE1HSzBhMkMxOWkwRncv?=
 =?utf-8?B?WlFFSkN4aVRmOUdwTE01dlJHT1Q3a29JWVdNQUxnbjd2S1hMUzd4c2pNcDl5?=
 =?utf-8?B?Vi9Nam1KdnExd3FSbTRBVEZxck1KQTd5cGc2ZTJNQVVjdWJnOG5SeWh3cGlL?=
 =?utf-8?B?TGFUUWZrVFJHSzNhTXFmNElRQU5VUWY1YVhrZndTU1A4UnZxYnZqaExqV3pl?=
 =?utf-8?B?dFhwZ1hXV1dHVk56S2RvbEtsQS9odGJiOXBOYkZSV2dEQmhsUmNkR2ozTXRV?=
 =?utf-8?B?M1pMS1VLYXA5YzdxSjNrZTVkM3dtNDhyTUNXbEpIcCswTXRGdklpV05EeWJt?=
 =?utf-8?B?NHVTYzFnSjZFQTRQbE9WKzd5cVJJb1J2TlN4dzdKdnFGdnhVazBDM0gvTlF5?=
 =?utf-8?B?RzJ2NHBqUE5kdnlJaTdDeHJ3cVFQUU9LZElXUWsrZ1hCVXZybGw1d2ZmbmR5?=
 =?utf-8?B?UDk1WjlsekRSSk90RjVMR0IwUmNNVzZkbVBCSWVDOSt5RFBFOER2YkNlZTEx?=
 =?utf-8?B?N1N0OXJQaVc1QVFIY1BKZXdmTWxud2puUGcyY1hFRGZqKytKNlZmVWh0VHB4?=
 =?utf-8?B?MmZYdmIrMUkrSmJlYVFzeUFpV0ZKK3JOWEF4YWRybkZjN09Gc041Zlg1SlIw?=
 =?utf-8?B?R1JUZk5UVXBLNjI3UmZsaWFOcTU3M2Y0SGJwdndrVmFGY2g1Q0psWVlSZUxH?=
 =?utf-8?B?NThadW5hOEludU50elBhM1Z5bGdYWXVVMTlBdFhYOU1uWVpDRVkwbjFkWm9N?=
 =?utf-8?B?MEIxTU1JVjBzTEpyWk5jb2UzaHBlQW11eEZWOGxNbXpXVzR4eTVoNURCcUMx?=
 =?utf-8?B?eDk0RDBvK0Y3YnFXQWVRelo0T3hPTWZSY0dJeHJncitzUUpoTGxRV2JJWC9N?=
 =?utf-8?B?MUR0RkNnTTRPTUxqZjlRQVlUUytSSk1PU1I2b3NzNng2V3VURVNKa2MwT0Uw?=
 =?utf-8?B?cDd2TjFidmVxand5ZWpzY1BNVXVXY3ZNM294WXpKMmY5WmQyYzd0WFVaQk1C?=
 =?utf-8?B?OUlmNUJ6TzlQNzl6c2pGYVJIeS8rdDd0dTByZEJ3d0kwblQ3bGt4TCs4a0RZ?=
 =?utf-8?B?bndnY3JXSktoRnRnVDkrSFZxdHhpVk1IcjB1bTUzcTExOTM2WW9ReUt0Y2N0?=
 =?utf-8?B?ajFDVURxKzFmQkpRQ3pYUkJPdDM0OTNvS3IwbzJQdUtiRmlhZnJpU2Z5NFZw?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95419d04-bcc1-4179-68c3-08dd4fe9c5b6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 06:59:22.2445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PlB2FylbjgxAYKch2qACwYZwS3DPIgQhRUFnnXWHFHc80233NEtX2BmZPjSVFgCY1ArmJBxNJxY7cPk9Syk9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8398
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

Hi Nemesa,

On 17-02-2025 08:44 pm, Nemesa Garg wrote:
> Add a new test to check whether odd pan is supported or not.
Please elaborate more in the description whats the intention of this 
test, what is this feature
all about?
Also, why do we need to create a new binary to validate this feature? 
Why can't
we add subtest in existing binaries like kms_plane?
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   tests/intel/kms_odd_pan.c | 155 ++++++++++++++++++++++++++++++++++++++
>   tests/meson.build         |   1 +
>   2 files changed, 156 insertions(+)
>   create mode 100644 tests/intel/kms_odd_pan.c
>
> diff --git a/tests/intel/kms_odd_pan.c b/tests/intel/kms_odd_pan.c
> new file mode 100644
> index 000000000..46f9c8fe2
> --- /dev/null
> +++ b/tests/intel/kms_odd_pan.c
> @@ -0,0 +1,155 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms odd pan
> + * Category: Display
> + * Description: Test to validate odd panning for planar format
> + * Driver requirement: xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + * Functionality: panning
> + */
> +
> +#include "igt.h"
> +#include "igt_vec.h"
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include "xe/xe_query.h"
> +
> +/**
> + * SUBTEST: odd-panning
> + * Description: Verify that odd panning in horizontal direction for planar format
> + * Driver requirement: i915, xe
> + * Functionality: kms_odd_pan
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +IGT_TEST_DESCRIPTION("Test to validate odd panning for planar format");
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t **plane;
> +	struct igt_fb *fb;
> +} data_t;
> +
> +#define PLANE_WIDTH 810
> +#define PLANE_HEIGHT 590
> +
> +static void
> +prepare_planes(igt_display_t *display, const enum pipe pipe_id,
> +	       igt_output_t *output)
> +{
> +	igt_plane_t *primary;
> +	struct igt_fb primary_fb_1, primary_fb_2;
> +	unsigned int fb_id_1, fb_id_2;
> +	int j = 0, ret;
> +
> +	igt_output_set_pipe(output, pipe_id);
> +
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	fb_id_1 = igt_create_pattern_fb(display->drm_fd,
> +					800, 590,
> +					DRM_FORMAT_NV12,
> +					DRM_FORMAT_MOD_LINEAR,
> +					&primary_fb_1);
> +
> +	fb_id_2 = igt_create_pattern_fb(display->drm_fd,
> +					800, 590,
> +					DRM_FORMAT_NV12,
> +					DRM_FORMAT_MOD_LINEAR,
> +					&primary_fb_2);
> +
> +	igt_assert(fb_id_1);
> +	igt_assert(fb_id_2);
> +
> +	igt_plane_set_fb(primary, &primary_fb_1);
> +
> +	igt_plane_set_size(primary, PLANE_WIDTH, PLANE_HEIGHT);
> +	igt_plane_set_position(primary, -501, 200);
> +
> +	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	do {
> +		if (j % 2 == 0) {
> +			igt_plane_set_fb(primary, &primary_fb_1);
> +			igt_plane_set_size(primary, PLANE_WIDTH - j, PLANE_HEIGHT);
> +			ret = igt_display_try_commit_atomic(display, 0, NULL);
> +		} else {
> +			igt_plane_set_fb(primary, &primary_fb_2);
> +			igt_plane_set_size(primary, PLANE_WIDTH - j, PLANE_HEIGHT);
> +			ret = igt_display_try_commit_atomic(display, 0, NULL);
> +		}
> +		j++;
> +	} while (j < 20);
> +
> +	igt_assert_eq(ret, -22);
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_try_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_remove_fb(display->drm_fd, &primary_fb_1);
> +	igt_remove_fb(display->drm_fd, &primary_fb_2);
> +}
> +
> +static void run_test_pan(igt_display_t *display, const enum pipe pipe_id,
> +			 igt_output_t *output)
> +{
> +	prepare_planes(display, pipe_id, output);
> +}
> +
> +static void run_test_odd_pan(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	enum pipe pipe;
> +	igt_output_t *output;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		igt_display_reset(display);
> +
> +		igt_output_set_pipe(output, pipe);
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
> +			run_test_pan(display, pipe, output);
> +
> +		if (pipe == 0)
> +			break;
> +	}
> +}
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		igt_require(data.drm_fd >= 0);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Tests odd  panning");
> +	igt_subtest_with_dynamic("odd-panning")
> +		run_test_odd_pan(&data);
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index f8a0ab836..97effb290 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -257,6 +257,7 @@ intel_kms_progs = [
>   	'kms_joiner',
>   	'kms_legacy_colorkey',
>   	'kms_mmap_write_crc',
> +	'kms_odd_pan',
>   	'kms_pipe_b_c_ivb',
>   	'kms_pipe_stress',
>   	'kms_pm_backlight',

