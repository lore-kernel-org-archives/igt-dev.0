Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6490BC71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 14:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D19D10E730;
	Tue, 17 Jun 2025 14:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgfCLS9a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7ADA10E744
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750170614; x=1781706614;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M81H1pMTWi2zrQE/8BFrU+JSRXph9WL0VUD8oJzsxjc=;
 b=HgfCLS9a44P2Jnkm0XG8vkPS1CQHXP1zNhcAOk34pJJwNxfDpkAbi2jq
 nys2fBd5reVqKS2vzNVLR9+moSJz5+wvmeusjdo1lMYwqcalbILYSIWK2
 W92BpJODpj3gCqi0Q2Ih5JgVVpXnL+GlD088il8ZMh2UF9dZvx9UDc5Ib
 kp9SqAxkp5HpJcTIxDuV5UBpKpJT3rSn6bal7h8F0mCpCriveIfjt1LUt
 NaUwG7jWL+zlpSzKzl3TpFgxXTeCFxoBCt4CmEd2x8+HbGWf1OtTlBqyB
 aNl9q1SatwYo3VXHD0U6hH7R2RMynqksDousfS8vyhmGPdppdyyp130m2 w==;
X-CSE-ConnectionGUID: tRAdr0ZUSD6VbHNOOl1hsg==
X-CSE-MsgGUID: GKTqEErnRtOF59mp6qSdFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="54968136"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="54968136"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:30:14 -0700
X-CSE-ConnectionGUID: d/xS+XEvRg6Who1JVYQkJA==
X-CSE-MsgGUID: oRydWLRHQ4SaIGJD2e0czQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148632498"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:30:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 07:30:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 07:30:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 07:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8VwdFc7mfIV55kR3fDAfbZcNS/BrCVPPa/4Bna1n2Sgh4xvLU/dZBmu+P7NiuvtW0sbkkgjVa9bjXUOcryTGb7OQDVcS00Zwx9Jw3AzhE6c8Y+lSLzeOsbesyy6ItqVojnbsL7GJDcOz50Hxglr/npEieBnB6aB8gL5Pr8URIDl1mF1ZTqAsWGpB+E5d1tiQsJvN30omlnhBisdk2TZmR7+EFfTD3Y+wW68p9zn5ZUR7d4R+1UGZw//krbG6phdXHD5Ro5HigL6+ruXAYF1OG60JWFaYUu1n/C1faYeJxBiyM8F5zWUl+0leU45CcAIgYIoQCHjst/4ZCy7+EyPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpyzuXRvB5lX0gI3kuNm+dOLZ+mrn7WH1NJA/o5fnZA=;
 b=nhwGvaUQ2nMFCKftQcEuNBeuLTPVl9AgQIQWZUfMnL3ISMgo9vE+cC1QlLdwDx3gsyP55TYumkRKuOizFPtVTpzVoJ/aGTICI6iYNzHInDZUSyaugq4n4pRvfZ7azyquqQZXdHriDn4AMLUyO3UYn28uH+8WMaqI+dvofmivKmAqAGpA3FMqkuaEh9K4an6eaJJHAgrqbdYAa2ASzLhrigBpWRQVJ0Y66xK7QzSBocbrv1KVMsNpLsI0Xri63zHrAtBx9x4/TIqqN8MKBFeJpECEcfgTROZ3ticTpod4U5CKuhJL/u+DVFubD8pyALaxkufogvQE0n8PTTP8LQXdSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6240.namprd11.prod.outlook.com (2603:10b6:8:a6::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 14:29:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 14:29:44 +0000
Message-ID: <ed23b930-ef66-416d-85dc-4f6a355a0ebb@intel.com>
Date: Tue, 17 Jun 2025 19:59:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2, 3/3] tests/intel/pm_rc6_residency: Ensure that SLPC is
 enabled for test rc6-idle
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20250617064456.3041238-5-sk.anirban@intel.com>
 <20250617064456.3041238-8-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250617064456.3041238-8-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 85480af6-9587-4fb6-fa91-08ddadab66ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3Nuckk2bmVvWnROWnVsc0RNanpWeE0yNjN5c29lMSt4QlBZN0YycHc4a2hV?=
 =?utf-8?B?T0JJTkFHNUpUOTBLSVlVdkJDeEp5UzVOM04xU0d6VWlES2M1UUYxaE1yTlhY?=
 =?utf-8?B?cWM1V2xzSHpxZTV1dnNHRGpMZDRNMGxjOExSOUVUWHp1L2V0MUNYanhHZFBW?=
 =?utf-8?B?Kyt0dHpwLytFQy9zZ3VwR2FKSVhiWEY5Z1I5YW1HbDFsYzZrT1hKODdGYVZp?=
 =?utf-8?B?VG1wcUhrRkN0Qkl1UU9XcFVxbEFHMCtoSytzbyt1eXFZdzBMajBnTEV1RHlX?=
 =?utf-8?B?MDdqYnhnVGFLTFlGcy9ULzBoVnB0RXRkbVd3NUpBbjZ0a1FlR0psN2ZMSmFR?=
 =?utf-8?B?T0NWZG15VEE0VUlRekdMUDZta3Y0d054cVUwOU4wTE8wbVArZU0zblp1eWEr?=
 =?utf-8?B?K0JrRTRSaFppbnF3WUs4WnBaczNNeXZmTmtXV2tVQUI5RWRxYnhUNUhNNHhR?=
 =?utf-8?B?RmJVaHgwL09QMDlXQ3RKVG1OU2d0cFlld3lRL0pkZlBoOHFiSm4zM0ZvN09S?=
 =?utf-8?B?VnBuNjBWNzlKQUZYeFlHYktobDNXYzNuVUs5VEVNM1FKMlJRZFVSVHF1VVYx?=
 =?utf-8?B?Sml3NzN2eGdMNU14bHVpQ1BYK0U2cE5lM014WUFkbERNUmxjUkxGZjliNWxa?=
 =?utf-8?B?b3pzcHVkTU8xekc4d21mUEo3T012Y2wwQ2pSdEFzWmpnaXhGWWhWRGZKYzda?=
 =?utf-8?B?TW14RXhYVnNZVUhzVUxHSUVWaHNWekxIVW5mc1M0N1lhVlNwVG10TWtyMlR4?=
 =?utf-8?B?UHdSVUVybVppSmtKOWZ1L0tjbjhqK0pCT1cwSnI1SHlQT3ZrWHppQ0JjVjkx?=
 =?utf-8?B?MFJMM1BSS2dFUi8ydTZxYkxBcHZpSXE2V0pRRzhEWXhXQ0lJK2JmYTZhenVy?=
 =?utf-8?B?c042TThOZ3JWWUV6VlV6MFVhRjlzRDJNRUdXRVdoN0o5YUhDQUQxcWtlK1lr?=
 =?utf-8?B?Q1lKWXlHMHc2N1ZTNVpJMkQ2SGRCUjU2QStFdnZXalpvdEZoeWkzbWx6Qys2?=
 =?utf-8?B?NEkvd0hkUFRwL0NrU1dYM0l1bGxGMTJmd09vRVdKZEZvVWlvdlpZMXdEcVZt?=
 =?utf-8?B?RXFFdUJtalZJaFBoSDNSZnZ2MzU0aWw2ZHFCV2NiQXZMVzFsSndwZUxsUUNu?=
 =?utf-8?B?YUlGRlhLeEdUcEM0K001R0FaRHpJQjN4ditTOWxncUt6dTRLZFdpdU1GVU5H?=
 =?utf-8?B?UnFDS1VWbXdHUmJod2JxV251K2w0NCtrN1hTRU5QYlpKVENTeFpLTE0xaENt?=
 =?utf-8?B?TWZhYW0rb1lmc2NPSC9rZ3NuYUdIVnlYKzA0R3M3ME5mdWQ0RFpvVkhyZ1JF?=
 =?utf-8?B?bzM2c3ZHN3NBZkpjUXlvVmQxL0RxbGFIejI1WmRSMGxGdU5Fdk9PMmlURFRh?=
 =?utf-8?B?bkJvSEZQNS9jSWdXL3RYL05QNEJNWk12T3k2VEt0TE41WUgrMy8xMWpETHlw?=
 =?utf-8?B?M04rZ0NISHpPQXphZ1hOQnpNa0VkdkpFSnB1NXczR3Y4WG51NGlBZUljOXAx?=
 =?utf-8?B?TUFLeHFqNkR5K09sNmszRCtRWS9zWnVuejdzLzZhZ1BWQzVKY25ac3pVYnRI?=
 =?utf-8?B?dS94SkQ2czVjSXZPRURDS0VtRmlGd1krNUFqN2dKeUtMSisvbFF6aG81RE0z?=
 =?utf-8?B?R3FML2lYYmgzc1lzUXlHcXVQZUI1VnNoQ3pCZHBCam4rOW9ZY0k1cVRmR3VL?=
 =?utf-8?B?b1RPbDV3UnUxVko2bTRKeEd3NTh6WGp4eUwzcXFXL0xmQ09vOGQ5RUVZWkNS?=
 =?utf-8?B?T3JlWis5enZZUytVc1g2RENyMTFyUzJnQjUxTUttYnlmT3BIaWNGclFmVU15?=
 =?utf-8?B?bFBTK1lVMDJLWFg1QjJmdklJNUQrb2laS0V5dmJza050YnNYUkFIcVZDR1kz?=
 =?utf-8?B?VEVJWjMzRFdVV1pNdk9wenZBb28zUjU2Wi9RSlZXUW13QVBwSHNpRFJIWDZ0?=
 =?utf-8?Q?tMl2vF+SYz4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHdzL2ZIRGplSDRoSFZqOEdnWkVtMnM0c0RvaWwvNWdNdTNnTmxFMW4rSDJj?=
 =?utf-8?B?SktTTDM0dTZ5LzFYa2Zra1hhcWZWWmNpL2s4SVJNK1RzTTVqSHJFcWROQWUz?=
 =?utf-8?B?empXeDBjOXE2ZjhRN0pzT0p1ZVN2U205RFlyYzJ4Wi9NTlBrZi83amNoRzVh?=
 =?utf-8?B?TGY3RW5hbkJyU2FlcTRGTlR2dVRNelNmckp4dEpYUW1sNnVsaEZVazEwSFpl?=
 =?utf-8?B?VXVYamQwOVpsd0d1aE5WUXI2MlNMenlLaEVhNW94eWVEdVVGb3FkVTZ0bHFw?=
 =?utf-8?B?MFR1VUpoazF6NkdZY3J5c0dIZkpNUm9QUEp6UEVIbS8zMTZ4dk5PdWlpRUVS?=
 =?utf-8?B?cFFOQTlpQlFNRjhFOEZQZ294MGVNemFCWExUMUZTbFNsVU5hdWk4QUVFeEl2?=
 =?utf-8?B?ODlHRjlmbUczSG1jM1NwczJaMUphSC9RUmJIN3U0dnpEeWFUd1IwazdESU11?=
 =?utf-8?B?NFFDbjZsekFvNmlvaXFWQXlGYmhrTG9HR3MzcXY5K09waC9oTVdIY0gyanBT?=
 =?utf-8?B?RzU4bXBMSU1haDJtZkVSa0ZPWGEvYlJ5a1VYUGZ1ZnJpcVN0K3drYjZyemd3?=
 =?utf-8?B?QzVxMTRvZ2hSWTU0NStMdEhqaGtaZGxlMHBxMUVsL2VOeHRpTkgwdW1SaGlR?=
 =?utf-8?B?R1BaWWt0QUNydDVGZkJwM3d0VFd6NkdlQ1ZTL3YrWkQ0enZzMmRUeWZpMkZZ?=
 =?utf-8?B?VUo1alZuWm1SWWQxQjRETlFNS3hmMHQ1TWdvQXJkd3hmTVptSXhjNVNHU1h2?=
 =?utf-8?B?Ny81eUx4NkFhUkRjbHlZRTBYdTFKbmYyTWpzOWpmOEdiR1FRUHRSOWZwdDIv?=
 =?utf-8?B?ZHpDVGg2TTFkbk1WeFAvcXdDaU96ejJtdFFGUCs5TDIvYlhEcTN3OVIvOTFG?=
 =?utf-8?B?L08wK3lZVVZXVTNiUTV2L282NjFrWXgzS0tXY3NFNHJObFhpb2hsWkNjVlR2?=
 =?utf-8?B?ejcyckZudkxIbEpjbk5lN0UxMFFqNVFwTXhVd0RudTBESjJ0ZVZOWGVqZjRP?=
 =?utf-8?B?NWlJY3R0UW1hMFVhWkdpTDljN2RJSVIxaVBPRFBnYlkzK040MVdCS1Z2WlI2?=
 =?utf-8?B?U3ZXYlRsT243Uzk4WnVuOFJXdHBYRUxJM0hZWSs1SDl0bExtWWVkQ3o1MlZF?=
 =?utf-8?B?ekJPTFF3WUJ6NFZHZWx2bEVOenVqRjFlNmhBZ212TTYyUHV1Z3J5Nnc4dU1U?=
 =?utf-8?B?bGZMTWFpam91N3poUGFjaUlibFlzN29yVHlHRHl2TTJKVWxQYTVXSzFVKzhY?=
 =?utf-8?B?NmdmNFhJTEVBUVJxWXpGM2NMS1d0bXFlSmFTaDNZQzNLT1pZN3dpaEtBRjFD?=
 =?utf-8?B?K3EwUzhpVUJqa2k1RENHU0thVzNCUVhxcEJzN1Rkak9JcnQ0azFSZndEdGZW?=
 =?utf-8?B?UUh5QlcydXg2QzdXTktXR0p3bSs1ZnU1OVBETStPSU5pN2ZqakNqZm5na2Rr?=
 =?utf-8?B?NVREQVNGeTRlREdWK0FpdEIzMjdnT3AxZENEQlNtVDJoWGFzc09lYTZsdmhp?=
 =?utf-8?B?bytid3NFYk5pK1VGY01JNXIvYnNCWThaMGVINEhZUWJkY1hOeFNxUTlOMW45?=
 =?utf-8?B?UHlsRHBVb1IrVW5WNFB1OHYxVW1maklCSkVONWgvVTl2d1JvRUVEaUVJQUtJ?=
 =?utf-8?B?Qi9pZjFCbk1ydmROWFp3NVE2NmprMXlrYjJUclc4ZWd1enVJNTR1YVU4NjZH?=
 =?utf-8?B?RjJMSEIwdUY1b0U3UXBYLzQwR0g4L2xYZXIyRmR4WS9xMEd1RjZkN3FHSHgx?=
 =?utf-8?B?ODRpdGpMTjlYWmJFN3dYK3RIdmNIZ2RRSytEdEFicnhqWHV6eE1zQ09GWGl4?=
 =?utf-8?B?dW93Y0lIOXg1NGtNOWdVMFVTaW9RVllZOUZuOFAzcmdMQ3Z4S01RZnJyL1hK?=
 =?utf-8?B?YjIvQWtRbTNObnhLanlCUDRJZDlEQzFrMElEd28vSzZ6U0F4MmxiLytzOWoz?=
 =?utf-8?B?YjVjdjg3MFhZT0NaNi9SR3Y3U2ZzV1lQY2FGWkFFNXRINC9UVXJ1cUJDcWx3?=
 =?utf-8?B?d3U3MXFUN0pycXpjQStTZXBqK043Mzh6YmRUMVpKZkZDTzlIckxkcytGcTV0?=
 =?utf-8?B?Tk5CZFZMamRIemFuQVE4b1F5M3AzSGhWa2JFUXcvdTJKc0FSUlhYQ3hmbmNs?=
 =?utf-8?Q?IlaqdJNyZzLDx4lWD24KVmznc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85480af6-9587-4fb6-fa91-08ddadab66ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 14:29:43.9692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3DZ4Xz4HHXqN67Snl+9BVHh9eIv7WazjJgKgV48GFUI9u3gomyvFcSiO1HdgFCfHXwB1ks77Tn0KBVK/K819w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6240
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



On 6/17/2025 12:15 PM, Sk Anirban wrote:
> The test currently utilizes sysfs to adjust the RPS minimum frequency
> to RP0 in order to reach peak frequency. Therefore, skip the test on
> older platforms where SLPC is not enabled.
> 
> v2: Remove guc check (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
>   tests/intel/i915_pm_rc6_residency.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index d3fa95423..2236668ce 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -617,6 +617,8 @@ igt_main
>   
>   		igt_require_gem(i915);
>   		gem_quiescent_gpu(i915);
> +		igt_require_f(i915_is_slpc_enabled(i915),
> +			      "This test can only be conducted if SLPC is enabled\n");
>   
>   		s_dirfd = igt_sysfs_gt_open(i915, 0);
>   		stash_min = get_freq(s_dirfd, RPS_MIN_FREQ_MHZ);

