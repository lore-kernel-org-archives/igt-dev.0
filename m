Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E54FD6407C
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 06:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4F810E287;
	Wed, 17 Dec 2025 06:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcY6fsl8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D5410E287
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 06:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765954521; x=1797490521;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a7lgP/8bhfL2IQvfLEH4Nf5okt99sILBpuqAnfxZk3c=;
 b=QcY6fsl83/iezngDXS/bocv8i7JcpdQEgkGHPMxarzIa+kGJ0TzQOGnR
 pzoFJCqwqMZf9aXE7XZ2JiJwnRK7tHtdHmiU3gzbX0OHjjBV6R+wPADkR
 XxUyvHilKOkTosYIHCC19i9aNEkp3mDJlq72CnKXndDzJ5kV9Q/9zlJkR
 wfc1dOTlCv7hjgfuHpjSM2pgGJAavA5kD5t3IBq+8ldAH5B/MXL4azIDc
 0ZGTN1SuyvpoNkkYLIq2F5XYhfSVgs19slJbZOx99p8effh/L0Alw0che
 nqSTLRjm4EKlLAhLe1Glern+8aFgM0wSQ5agGO94o/usaQioDaAFWSPDw Q==;
X-CSE-ConnectionGUID: bjSikaFEQr+vQZpQowEQ7A==
X-CSE-MsgGUID: McvJmycpSTaZZ5wWMcEALg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78194529"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="78194529"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:55:19 -0800
X-CSE-ConnectionGUID: I5q70fk4S12F0JdGYjKfgQ==
X-CSE-MsgGUID: S/HsbP2rScSW+AXwzgNpWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="202610267"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:55:17 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 22:55:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 22:55:17 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 22:55:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBVQA04iipod0TmhyHWk6vcLXN8MA6t+Qs+2xASA3ETiq3M2Px1fWRGKTCHKFIq9vqq5vizSqHKMi/C1ftVHl1cJ0B6g34/cyW6udXi/SWXPo/LWMEbokfWIKfJabxyLWDJychM5oDTGjEESxN6CMgQvUc2qy9Ug5DgUi0QS4cIP1Mw9HhXiNU9/Ne2sEn9O8is/xehokaTJMzzuF9ZT7k8JH8s69Pkcqme6b9I+CT1dGCV7JQv7z5pavK2jpL3PDNI2ws2lEmMv/DDL1imoS+TYNmQWJv/2ht62Tdws3vI8bLKgWRScm+sW+bgoeGVv5RLFVs5mae5kvRxg9XUeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRjnyIMpkMEh7uyNFPZVLijayV2zwOGD1RhXtuCkcgg=;
 b=Yw8BcqflN5k6UHkrAevu9I8tp6vCpWqLdprL4e+i2L15ybmcbfC23hYnfCcV5e4Y227aPyOVay8ofXTrf0IF44lqRFMKn/qQBtwXzGsbfOxSKhvrN2YWUdV78R5TINnfpMcOg0ETqYVuNWfUVCfYUHL/bJV21+vdHb6dUqi/FagBvATzC/czGSgTrTcvcgjx6MVNlA5h3B1dyaegBVJyYur5o39JxeWtgkI4H3mxMl3ihvwXiPkN2A7zDEpg8rwCu+WxEIEVbwr5TOsL6CQOWZcVmfhVW511RWznHbM2Sc9rCxixU+neumnyJgjtVuRs98YM69ThrRa+bPk2FUuAuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7896.namprd11.prod.outlook.com (2603:10b6:610:131::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Wed, 17 Dec 2025 06:55:15 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 06:55:15 +0000
Message-ID: <df7a74a3-c375-4485-b2d6-9cd4fb2aa5e5@intel.com>
Date: Wed, 17 Dec 2025 12:25:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/i915_pm_rps: Improve error reporting for
 sysfs write failures
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>, 
 <raag.jadav@intel.com>
References: <20251215132132.1195570-3-mallesh.koujalagi@intel.com>
 <20251215132132.1195570-4-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251215132132.1195570-4-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: a1180fe3-4630-4c8d-79b8-08de3d393b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2prZ1phM2ZCbXl1SHJXYzN3MTdRSDZnL2tyaXNSbkdxaWNlQ2dyVDkrZEkr?=
 =?utf-8?B?bk55N2JHYVdVbHkvcTNlWE8xUnByeUluKzdzTENiajR3Y2kwczg4SHd0R2lt?=
 =?utf-8?B?WUl1L0hmWG44VmJKNFlVakJpdGRlOGVOaXRTQ2wrM1E1OXAyOFF0d2k2Vksv?=
 =?utf-8?B?T0tyTmgwMHJ6RnBPbkNqMWtRSHNwbWdzSkZYVUJnbVg0bDg1clhZeTQ1Y2JH?=
 =?utf-8?B?ek13anB4ZHM5a3NFakNlejFnQ0xtQ1gyTDNQVWx5bTROVUFvSDZNdm8wTVlQ?=
 =?utf-8?B?TjRiaGJqd3EzRjZBeVdQMkg5WUtQOFVEYUJjdkh1Qm1YQkpxSmNnRzk0ekhL?=
 =?utf-8?B?c2ZMREh6SUt4MmZUUHNSZXVaQ0JKMkRuRktjWmJZd3pDU0FyNmx0RDNDc1VQ?=
 =?utf-8?B?dEZSdXZram9JdFdiQTBheGszVEV0ZFFDU3JQZE9TZENVK3NKbGl3eHZXWVUw?=
 =?utf-8?B?L29aMCtkRHM5dFFRZHlYbzdjeHBYZVRseUpSaXpTcDRpQ0c1SytLMEN0VU5T?=
 =?utf-8?B?emFkYk85dll6TFVqQVFRQzhtU3pESFdhR2hrcVZ1RER3OGNndEhDc1hydTQw?=
 =?utf-8?B?NkVpS09neEZIN3ZSRFl0cnVMSyt2TXdiYS9kT0krWFhBQUgrV0NlSHkvMllM?=
 =?utf-8?B?NXV6czNpRGR3eDhSWHQvS3hybHVqZllFR01HeWJkMHVjSExHZDdxYlBQQ21u?=
 =?utf-8?B?M2gwd2N4Wk5ieE1JVWxMbWJSMDlUMlhVR1MyMmRlaTR4ZjhvS0NTUUx5NG5M?=
 =?utf-8?B?VFBUU2FmT21OY1RsUVVIUjhBRHBNMXlQekFaRm5lZUVPVUdVMktlc1ZtY2VY?=
 =?utf-8?B?aE5NUmluS3F5VkQ0OXBnSFdRSDVMRVRveHpYbm1IZTVGME80Ri9keHVDeHVL?=
 =?utf-8?B?a3dibVJLbGJJVVdsdXJZdFNtWi9tWERkNUFoVW92dDdJb3BwKzVnTjJjR002?=
 =?utf-8?B?RWNCOE1RR2lJb0Zpa28wazQxSmkxTGVjKzVVSUdzeUpWUnM5T2FlSk41Szdt?=
 =?utf-8?B?aUo4aElqWkhyOVBYdS9BT1FRczdnc1loSjk5MVdGYzJ2VmV3S2MxdlU2amZ2?=
 =?utf-8?B?NTlYVjhTMU41UnVxUEdiSEZqZG5sVDRHdnNuYTkxckRFWHVKWXRlZysyNSt2?=
 =?utf-8?B?V3hzNlFoajQzZnplUitZWXhOcTBNT214RTVvMm1JazlIM2E5dkVVbTE0WW43?=
 =?utf-8?B?UFpMMkpmMGljZzlPN1lIc1VoRm9aRHFNS0taYjNkaW5iTHUwWW9MUDRaM0th?=
 =?utf-8?B?ZWs2NUJpVFp6MGFtcGdWM2VFRXdhcER2Zys1bnpncUYrUW1aMUV6dVpjd1Jy?=
 =?utf-8?B?V2l4WEk2Q09JN2VRRUIycGovU3N0R1JuVWE0SW02Qmk5Wk1yVkhOcHV2VC80?=
 =?utf-8?B?Q2xobmdFWjJMdDhIbE05eGxKZ1UrQ3BJcStkYTdtOHVYamVBdGU2NGhHYkFu?=
 =?utf-8?B?bXJBWnkrOUovaXkwYWVWaWhvL1dGWmdVWDJUU3ByaFVibDJlcFBsS0VuVmwv?=
 =?utf-8?B?T0RYYndrTng5SFF3VEJ2VmtoZnBvdW4rZk1ScG9pS01KL1A4dTdqN2w2NXdk?=
 =?utf-8?B?L3VvbkJmOVFBR2UzSnlrQjU3Q1IzbkIrbFpyWXljcGVTVU0vRWV0YURuUWFr?=
 =?utf-8?B?RVBrbkQrbHFZY1BMczdTMHovQWgrR2E1aW9oVWNqSjhqaC9wOWlwS2JFRHhM?=
 =?utf-8?B?SE9LTlRPS1ByeUxSRmFLaUhZcEhVeW5oOWtyai9yeCtqRmpVVjVmUGZVZHB4?=
 =?utf-8?B?V3FXcnJFQ3NnRlRMandCTVBLZmVid2RzY3RRYjkxU2puU3NrOGk1cU9XeUlT?=
 =?utf-8?B?dDROQmhIekcxYS9hOXdKQUgyUXFOa3pkOU1aWTZpeUFWNWpoamNGK2ozUlJX?=
 =?utf-8?B?OWo4d0UydTlBRTcvdmswTzBBME1JTzQzbVlEUFMxb3A5SWt1WE9ZZ0pDZ2tI?=
 =?utf-8?Q?jMuj+m7ZCSHP5IvWIGp/EMnC9GnYqqoB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDFIRXFlTkxmOXVBTTZ1OERUcWtlVDUvSllSc3QzRVUwUVZVTDRuQjdvRXJJ?=
 =?utf-8?B?cUNzeTFjbWYzWlpkZlpLMEFtVktseTZCSkpWUGs5OExiNTMwNjVlYStSeFg5?=
 =?utf-8?B?OGFEaWxpamxJR2xneTJCVFZUNTZrUitYZUlsMnN2a0cxcHRxa1kwdHo4Zk1H?=
 =?utf-8?B?aDE1ZmlZeFI0VGZzWllTT1MzS1JmVnlERTdNK1UrbkUza05TNHhDRkQ0UnlO?=
 =?utf-8?B?VkQzNTZLSmdDZVYycmdFUHNvQlo2c1FtQmFpY1FMdHNCQ1hoV1g5L212ZWhq?=
 =?utf-8?B?MjZHVEtRdGkxZEkvSDJwV1MvMnlpeEcvZjRrbitGQ2tINnhjT1U5cGJUcG5O?=
 =?utf-8?B?YnV1ZDhTMkQwU1hqbzBoTktSUWczRkZpR1Z4L1lyc0Q5SGg5OU14Mkw2NzRF?=
 =?utf-8?B?a2NCamdENUtYMEJLaFZseFR2RnVEOW5IdUUzQ1dKUkV6ZEVVczRoWEZuOThK?=
 =?utf-8?B?U1FoYll1SVE4NEx5am5BWU9ad3UzdEFHSnlHWXJtMXdzY3daSW9BbXMycVZQ?=
 =?utf-8?B?RlFNTTMyUW5YV0JTU2wzeFhRdnNJUUZWTmxRSW9zSnorVDlySUlXblV0QUU4?=
 =?utf-8?B?L0pYbUNteWNONG9EaStCSkhNYWZ4ZVpCMjAwN1d6bE1rMUtPazZxaTZSMjRr?=
 =?utf-8?B?alV3dnR2R2FTVWxVcmVmQW9Dd3pyc2NhR3BYQlhHYnJidzFhTUZpVGo0YzZY?=
 =?utf-8?B?M1lEelFHaGFzZERENlFZd1I2Vm00eW1oR01LY2ZXaTZZM25WQWs3VWhNRE1I?=
 =?utf-8?B?REhxVnNsWEdwY2dCQ3lDSEN2Vk1lSUJTZkluUExDdG9abjZrMnU2YnRQQ2Qv?=
 =?utf-8?B?NUE1SnNLV2lxVndtSU9PdkMzNmJJeGJQMFBpOGloczFYZUgxVE11WFB5TDJS?=
 =?utf-8?B?cDRYM01BZUNKTjhmSjQ1VTZlNmRpamlzcHNGTTdaRFR3VWxjcUlRKzdQazcz?=
 =?utf-8?B?MjdEYVFUbUhVbmZmNDU3QVUrS0xUV1ZtRUZ2dTdTU2F2bDQzbk9lNmxDbEpK?=
 =?utf-8?B?Z1F1QkJUcU91N1ozc1ZoZG1TSEZ0MEJQR21zYmR2NmVJejRMUHFCVGhTQ2hH?=
 =?utf-8?B?T3FJalZSdVVoV2dqY280WlEwUm96T3RKeVNKQU1rRXF1M0w3bEcwclRWdFF4?=
 =?utf-8?B?TWhEb3RiSk9zU2dFZW8rWTBHcTdYV3plZnQ0R0dyTW1lMEJFcmR5Y0cvOG4z?=
 =?utf-8?B?T0xYWkM1ekRMcVhvM3BOL1RMZHBUeGJyaHM3VSs3NDMra0owa3ByNVUrMVZ6?=
 =?utf-8?B?UDN5TFlRL2JRM2FMQk9XbktwcWFKb1J5QUFHVHRqUi82K0s4aEZVbkJSRWND?=
 =?utf-8?B?Z3NXSEFuMDFqbVd4Tk50WmdXVmtxaUR0QUd1eEMyKzN5SFhtUVF4eE5lZU1a?=
 =?utf-8?B?U3U4T3dMczcveUlrV3JWOCtYdUlYY01yd2NtU3N4MldOcHliN0s3QnF5YWUr?=
 =?utf-8?B?ekU1b01zOXlvR2F1SVgxVk9tak1MdE1hSS9KWVk5STN2c3hESEhpSThSZFgy?=
 =?utf-8?B?QWV3MUdWZnNadnRIYnRWWE8rb1crTEdQYWIydVRFckZxRnp6S1E2dHkzMXFs?=
 =?utf-8?B?VHBuQlYzSWEzdkJSWlYzaWVNQVpkL01EajBiWHRDWlRaRytXKzRvYmtVUnBP?=
 =?utf-8?B?RlUzcFhhT2lvUllHSXFSdE5oVXpKdWhqd1hmYVRKalNVWEpMOE1UNHZQUllQ?=
 =?utf-8?B?Mm5lWVhYdGVzVjI4K2hDYVpaUEU5MVdkYjkvVHNUMFlVblNuVzZtbERuOEk0?=
 =?utf-8?B?dzc0Z2xJVEhxUngrQ0NxNE5CdFhHR0JqYWxNOXFVcVlxbGdYalJoVHJ0K2ll?=
 =?utf-8?B?VHA2VzNiWEs0YnJTTjM5a3dqZzZDVlhQM2FLQWo4YnR1bW5meVRTdUdlS0NK?=
 =?utf-8?B?MmRtNjVVeG9vUEhKMGhIQkRnSksvd1FKdXU0RmhNVDM2cWZZMjBMb25nSGxI?=
 =?utf-8?B?aVNidGRRKzFXdTBoOXpxU2pCVkNQbnd5MGVqOVplZzdUWlFDMjR6RVNXRlg0?=
 =?utf-8?B?cTJ6N0d0K1pybUNRRjlPZVdrbHVCVGNVdmVIT2xwRjQvY3RpUisyTmVwMFZ4?=
 =?utf-8?B?L0MwUHpCZ255b3ZUTlZlMlVpYmF3MnB4eTQxV2l4NjJnRzFNdjU4RXBGYm1T?=
 =?utf-8?Q?7zjgmACMsRE0GVdUAF/2p4xzu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1180fe3-4630-4c8d-79b8-08de3d393b20
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:55:15.0802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/IcOt3G2Zgn9I0w3V7QQpyMz1/32fngzdWZQV3vJyI/EXnOXfq1v6duaT1taioZXuoqwvqtKcLwH4W4txxIhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7896
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

Hi Mallesh

You can send a single patch directly, you do not need a cover letter.

On 12/15/2025 6:51 PM, Mallesh Koujalagi wrote:
> Add detailed error logging when writing to RPS sysfs files fails.
> This helps diagnose issues where frequency writes are rejected by
> the kernel, particularly after events like GPU resets or during
> frequency transistions.

This looks like a debug patch. Should this be for trybot?

> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   tests/intel/i915_pm_rps.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index f97a716be..02c807399 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -201,6 +201,15 @@ static void wait_freq_settle(int gt_id)
>   	}
>   }
>   
> +static const char *get_sysfs_filename(FILE *filp, int gt_id)
> +{
> +	for (int i = 0; i < NUMFREQ; i++) {
> +		if (sysfs_files[gt_id][i].filp == filp)
> +			return sysfs_files[gt_id][i].name;
> +	}
> +	return "unknown";
> +}

This seems unnecessary. It's better to add a single debug log a line 
above the writeval similar to the function "min_max_config" in the same 
file.

igt_debug("\nSet min=RPn and max=RP0...\n")

If you want to add it in do_writeval, add a parameter name instead of 
searching the name again.

Thanks
Riana

> +
>   static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check, int gt_id)
>   {
>   	int ret, orig;
> @@ -217,7 +226,10 @@ static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check, int
>   	} else {
>   		if (ret < 0) {
>   			int freqs[NUMFREQ];
> +			const char *filename = get_sysfs_filename(filp, gt_id);
>   
> +			igt_warn("GT%d: Failed to write rps_%s_freq_mhz with value %d, errno=%d (%s)\n",
> +				 gt_id, filename, val, errno, strerror(errno));
>   			read_freqs(freqs, gt_id);
>   			dump(freqs, gt_id);
>   		}

