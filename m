Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A5ECAC5B8
	for <igt-dev@archiver.kernel.org>; Mon,  6 Oct 2025 07:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC7F10E15A;
	Mon,  6 Oct 2025 07:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPGoZmAl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B30610E15A
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Oct 2025 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759737219; x=1791273219;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mcv8yJP2P6ZzmqI0nDGoyTRJI0zS2wRxPp1uCAd1ikY=;
 b=dPGoZmAlaBfJl+t2XGdFnAJk+6y4Rj5dY8Lno7C+bv+/oKbKUiNxCsEx
 vMvfVE9nl7fWWCfwdXExVrvL/djkCi+kejPruhBLT3s4JVwCjRoSTdYR3
 wJ85S/awROy5Lct7N0TDemm6LlRYG665yrZx1XBai/Urk6iKZOjHnEMOz
 /x8LndrE1ORNBUNsOFLAY2CjY+LEAqMZeOQm28A+Crl6W/1xRI9Y1AAhp
 HOCNMO3AFi9NZ46T4oUprYeALbcDKd6ChRTi/M9ymGQT0tK/Y3Ys9GD6Q
 FmiI1kIyiMOnB3AlbFj7P+CixfUKp/9F2EtDt9tUuRKBc7YHZPwAaiYWn g==;
X-CSE-ConnectionGUID: 2pRoK9GsTyGzlAWHp+Fd5Q==
X-CSE-MsgGUID: k1xOfS7VSO6eQ62HxRS+wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73262642"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73262642"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:53:37 -0700
X-CSE-ConnectionGUID: 72W40UsATKOQ0GiLzk8n2A==
X-CSE-MsgGUID: nVPXj6flSGeEW7YrsPWPoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="179854110"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:53:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 00:53:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 00:53:35 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 00:53:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dx3NCinp3ag6XmZ/snKFzLWrELNXqO5OjhjmhbePg9nT2hC2vFjl+pJhGSiLwHEq+ud4LhN8MD0vdlZeL9TF+0kmA6fXuqEr2eulmYMowrH0PKWgPnMKk7AuwV+5NBieRWsKt5JZ4X9Uo/PxGSDRNriUBiaaC/Y39xeaYgT71mri/AyKSTAgaBUjD7Hq5L1/CGQvgNE6dk+KKQ5drxOSAtQgOeD5bcr0uX2/NOi/3P2RKwhvYXpUHN7xg4fe4+Cn5YHS8hbY3GmQD0IH+stPx/lYT6r96lB1DRn4GY9RZhaoMDqapCR1PDJovy7zVo9x8bA6T6xWGl/8OvuRv9p2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mcv8yJP2P6ZzmqI0nDGoyTRJI0zS2wRxPp1uCAd1ikY=;
 b=kYnSV0XNbQtK/w3Mv/oqVrmwipwbQZupoLO0UIRZGx4jb1BNwoaZH3akBuSoMHMlM+rAhX5C1z/+A+YeqebHgWdCh2oakN1Ytw8HTV/zJXeyLuPuHjRR+tC03QOsH1XLTf/ZjS4LvqmCF3LcpyRmkb8qYmXjNVYRTDm0WzMnLJEIskA0eWV//VHajVHTkLakPMBZ9B0Z7qPEeE7Emy+RXRwzu6rItI6KU+Hg1oG09PC0b9aB4lEW1zNaqeESe5LsdA4Ldl/FCpA68Ff13UEFPTYSVn5C2LBmuiiZqdhE1zke4k+OvkehSorkpHGEWSkDH2al+k+rIfUtBQXe10ouKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB7735.namprd11.prod.outlook.com (2603:10b6:8:dd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Mon, 6 Oct 2025 07:53:33 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 07:53:33 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Uttamchand,
 Gajendra" <gajendra.uttamchand@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>
Subject: RE: [PATCH v4 i-g-t 4/6] benchmarks/intel_latency:Add
 xe_vm_create_destroy test
Thread-Topic: [PATCH v4 i-g-t 4/6] benchmarks/intel_latency:Add
 xe_vm_create_destroy test
Thread-Index: AQHcJ9R9xnsLjo8WdEeTN505uXhHaLS0uX+QgAAjMPA=
Date: Mon, 6 Oct 2025 07:53:33 +0000
Message-ID: <CH3PR11MB843409D0137C9543685BA52A8DE3A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917131003.71762-8-gajendra.uttamchand@intel.com>
 <20250917131003.71762-12-gajendra.uttamchand@intel.com>
 <CH3PR11MB843466D1B77B38362B8B4C0F8DE3A@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB843466D1B77B38362B8B4C0F8DE3A@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB7735:EE_
x-ms-office365-filtering-correlation-id: 1442d2b8-1b4a-4825-28b7-08de04ad728f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ck5SbWdlaHI3aURvSVVqM2VOaGNINWwrZHl5OFFMOTVzM1lhWCswMlBmTUJq?=
 =?utf-8?B?MEhhc3htVVhOQ1VlVktocWdIMXVwWFU4bHRhcmhKQWFKL1U2bkFDd2pFK05j?=
 =?utf-8?B?TGNGOXBwSzZZTjFCSjcxZ3BpYnJYRzJzdUpuT053NnJNSVRzRDF5N0JYcUJs?=
 =?utf-8?B?OE9TNGxWWXdNd3lrYzMxSUN5U0FVZ2pZYVdZeHI3eE50Rk81ZDBIM1JzZmE2?=
 =?utf-8?B?a3BTMkFUYWxFWitBY0crYU5PbCtuRGJwejJwNU8wV1BVUktNTFFxTTVycnVv?=
 =?utf-8?B?ZGJ0YVgxSTNDL3NoTG44a2F6aE0vSXUxbXRvOXdDVHVBM0NzcHB6ZGJNUDgx?=
 =?utf-8?B?d2xPMVM4Z29xYWtiZDNvT1pYeWtnM2VHZWRTMHdzQzlTcitGd1BDTDNMdE5t?=
 =?utf-8?B?eG5TeXBudkcyMmE4cEM3cWI0Z2p1U0xCR2NjaDg4WTZRaXhjSlBxTkwyc0ow?=
 =?utf-8?B?b1FXblB0bVhRemN6a0pOTHFMSkF0bmJWdGpJd2NnSWFidnB1UTc5S0NieGIx?=
 =?utf-8?B?VjFuQlpsOWxnS0R2MyttSUt1TzJQNlFUK0djY0s3VmZlUTZ5bmhZaWx2ejRO?=
 =?utf-8?B?ZEdIN3dCSzgwdkZ5ZjlyOU4wbHVPZGZEZ01FT2wrT3FBZFlLNWNDM0ZkM0NW?=
 =?utf-8?B?Tzc3WWpFYUVyeUZoemFYbGorSEtUK0xLZE5KRVJ6clpiN1BETkNTbndnZ3M4?=
 =?utf-8?B?cUFkYjdTT2NnWUQxOXBGcVdvWGdCL3hLTWhxeFcwdncyMnpZUkxURnRuT3JI?=
 =?utf-8?B?OUtiWHhqRUEwUUQyL1RpNGtPeU1pTkkxNVBLRGhQTkVtTEp5c0JUMVdXdGVi?=
 =?utf-8?B?YXFRTTZWZ1VMaElCQVhZL0tYenhTcS8zblh2Y2tvejQ3MlFPSkVUWURsOTRT?=
 =?utf-8?B?VzNCbVpiVm9BUS84MGd3WDRnVFgxVE5BZ09FcEJnRWdtUzZTVU8wTU9UTE5k?=
 =?utf-8?B?dXIyb0RQSmhGc040MlZIUUNnMjJ0Q3hEd3R6eHVCQkNBd3E1bHZGUllDTlIw?=
 =?utf-8?B?TTNQbzMwYkxka1hKT1NhTUVWaG5adHYwZ0pUMEZpOUpwOWZQWUxWUUtaTjNV?=
 =?utf-8?B?YkJhdDdXNkhuQ21lb1I0L0t4dDd4OXk4TzFib2tZWmV4QmtOcDNmeGE2b1F0?=
 =?utf-8?B?MUwvT1g4Y3pRM24vTTc0THRIRnRBUWxmcWwwZUp4MEFFZkdsdTJZQk16V2Ri?=
 =?utf-8?B?RXI2N3ZjZ2d4RVphV1RhalMxWlhXOVNPK2RkUkdFc05ybklycEFDTW91SXVy?=
 =?utf-8?B?RXY0K3NNQk96UzUyQmd4Z3NyVHdOajdQdW9NN1lEdktCZTQ0a081dEp4dWdk?=
 =?utf-8?B?bWVzNjdFa09BUm1GR0ZhNnlJYjJ6eVpWdDAyUjNmM3hFdjZYakgxMGRoNjIv?=
 =?utf-8?B?MXJRQVAwMjJCWndRbG5KT2J6QlVTUlMzcS9pdS9pVXZYSDVtaTdYa2RhR2wx?=
 =?utf-8?B?TjBka3Zwc09RS3ZsUWhvUkFZOGprcnVuRXJRS1l2MkwrN204UmwvWXUyVUlL?=
 =?utf-8?B?QkZEK21ZdUZ5V0hHb3pxTXFmV0tsY0FvdUVWRmU4djhOOUxERi9sOFZ1VlpZ?=
 =?utf-8?B?K3dhZVVQM3BYN3RZN2dlYzNwYVVqRHRBMWZ1LzAveVVhVnlrMEpmQjhLa2Vj?=
 =?utf-8?B?OW1PaGMwMzczSEN4clZsdzRhVWVuOUFldGs0aFgxOGxGRkxVMWliSXZPNno5?=
 =?utf-8?B?U25Ob3hnQWt1Rm1LVjdQb1ZzVnBNOElGRSs3eWhPdjFEc3hZWkp6a1lDM3Qr?=
 =?utf-8?B?eHF4NEJZVVN5UzNvaTJpa0ZHT0M2TllWSWduOEZXUEJwWWw4dVE3ZTZhTVRu?=
 =?utf-8?B?d25DVVJ1MUJHLzZXdUJJUlJUWlJ5OFpxOHNxWElCL1A2OUwxbUlDcGFZNDVM?=
 =?utf-8?B?Q2dINGtDK1F6b2RPOUhRcXI1VUxXK01WRGdCL3p4NDNJMG1YZjV2Ry9qYmNJ?=
 =?utf-8?B?alNBTXA4SkpONVFhYkFXTXBxWXJ2RExmTHJGdTQ1cmJMWC9zVzNXNHI1Z2lW?=
 =?utf-8?B?bC9IdkVYM2VOcFpweWdWMXlrNWdHZUVJOEdWRlRjQVFIY3BPSEtkalRzbnlQ?=
 =?utf-8?Q?2/8z74?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1JObmFPTXA5SGU5NTlmMlBqanIyQmZoODkyMVdJRnNUbHdEMGRkVkVKZjhh?=
 =?utf-8?B?QmtoakswbXMwbFdQQU5DNk5MUU5BWnc2WHZaZEhvRjk4RDRnWDFRTm9QNFAv?=
 =?utf-8?B?MFRoZzNnVldVUlZZTEJNbVVyczhaQTIvZDU3REtsOXc4a3E2a1FydlcrZDQ5?=
 =?utf-8?B?a0J3eGc2K2JPWVBEeGtqOGxkRFJTT1ROYWx4d0xYOTIwek9CUndFbXFEdFVo?=
 =?utf-8?B?cHpYU3JqbXRKenk2dHFZenF1YkhQU1JDZWd5MnEwTGZ1VW5kSFZya1ExT3V4?=
 =?utf-8?B?cDVWVHcxMndtMHV0dndQaGY5aXdtaCt3eGFadW1yczdaWlF4RWo4YlJNL2ti?=
 =?utf-8?B?RkpneUFCZGNXdEpkK3NtbDk5V1JVMlZTQzRPOUpuelhLVzFpdTRCM2FhdklG?=
 =?utf-8?B?TnRRaU42N2huRTgrOWxuZzBGOXhpTmdvNGh5K1MwRDlyU29sU2x1RkVrLzhT?=
 =?utf-8?B?Q2hUT3JKMzJDc3k3aUo0NXAwS29YT3JieFZSTXlCNlVLYjM4RERienkwT0k5?=
 =?utf-8?B?V21MZ3REcXdPMnJ4TkREMmp6SkZ0a004b05JalBmek9ISDlWQnBqT2J3MjJy?=
 =?utf-8?B?b3ZIZWRhSHc3UXFmYmlTUGVNMXNLOEhFN0hqdFY0YnZaMHhvSmRYY3p6dHhw?=
 =?utf-8?B?cEE4eEdoamd2anRlTk9vSnFpMmQ5WHVDWXhPTk5uR2d3cndBM3licDRnaHJQ?=
 =?utf-8?B?dElsejI5bHZSaTRub1JqQ2xuVWdiZ0Z3U20yU3ZDZVpVYjBYZmdGcmlUUHRJ?=
 =?utf-8?B?WWZmZjdYSGR4OXhPQ1RnZDZsdWoyWkNDZ3VuMURkd3RLdFNpams5cmlIanA2?=
 =?utf-8?B?RWRBRlZrVG9qcFM0eEVvalMzeDBJbmg4YzJMSjc2Y0l5UlVzOXVlU01UUUhD?=
 =?utf-8?B?bXFiWXZwa1JsaE5waWhIc25YUnZpNHBJTWorK1NyR212aTlndklWa3pJSGNS?=
 =?utf-8?B?Z2F0Vk1WU1o5VFhBbktJWlNITUFWcEQ1RW9zT3JYNXVCVWQrR1NCV2lNU2hY?=
 =?utf-8?B?QWhuemNqRFZZQzJkbkFnMjJGeHFzSWNKYTg2Tm1yc2FxUnRyTGpTNG85QVAy?=
 =?utf-8?B?alZPeCtLM0NObzRCNUQvZ1ZpQkdPMEN5ZVBRbFdTWDFINU9HVWxMdTI1V0JG?=
 =?utf-8?B?K2JlNGErKzRNdVJSa0pFWHArWnZJUFpnMzhVcWRMSkpPTGw3a3RKZkVwSG1R?=
 =?utf-8?B?T21kbmJZV3k5RGdrekdPQjcvd3c4bmdPUVpISkl3VFZDTEpGTzFYa1UyY2I0?=
 =?utf-8?B?bFQrTzYrU0ppZUJUdnlaL0VYRm9WeFRwMm8vUTZHTUNuQmpuZ0FPRzZpOXh1?=
 =?utf-8?B?dExaaXJTelB3amlqTHdUTFBGQ3I5Y3F1ZjNUczlsNVY2QkZMa2VwRjF1emlh?=
 =?utf-8?B?QnRKdlJUUDZGK3NMU0lhT1VjTDczaTJMMGEwYUtLNTArZUdxV1RJYzMxaXBG?=
 =?utf-8?B?R0U1RWNmVGJoZ09CYXltdmdlbCsvSGx3R1Y4cGVYdml4cktUUzR4NmxvR1R5?=
 =?utf-8?B?eGF2cFQraEZwbXRvd3FhTDdUdldaNExSK2NtNFhod2pXUEk0OC9EdWtWOWQw?=
 =?utf-8?B?OFRKNUhSeU40NE82a0F1SVVxYXRERCs3bEwxU3NjUHJGdzVHeXFqWXcyU3A3?=
 =?utf-8?B?Nit1ZnI3RTZFVmNOQXJNcStPS0lvNFFmc2JJbklKZXE0elI0SlAyMlNWZHgx?=
 =?utf-8?B?Y2tkTE1NNFVKdUc0WmQwaEV5MTE4S0pneDBBM09TRGZrOWlYOWtMNXdEK3BH?=
 =?utf-8?B?dXE3bHltdXV1bGJqeHN2VDlsQ3poZVVCa2YwaGF6S1JGZjNDMTdYajZGQytJ?=
 =?utf-8?B?T28vUHUrOERab1ozMHVaalBndUI3WmVPUjQ5YU52RkN1NDRZSmZkeVEwM28y?=
 =?utf-8?B?SUMrZlZnOVdoQ2N6US9OR1hMMDVxMGFFRldnb2xMZ0xDeENFWHVtNGE4SDcv?=
 =?utf-8?B?eGwvMmVVMVN3ZldpSEJjcEgvNHErWm5iUnpDT01kYmJiSExkL3hvdVRjL3ln?=
 =?utf-8?B?N0w3ZnAxNU8wOGRWRlcyRlQzMnI3NUpCSlJyejJyc21GQ0s3RlNVZmVBYkp6?=
 =?utf-8?B?d0pXamRFbktMb2NzRTFrV0ZrOXc5TERjYzg4VFVCZDh4b1hEaVpDUVBReC9m?=
 =?utf-8?B?SHpUbjVyTUc0V004dFhKSllaNW9JaEVqK3hUckdiZ2phSWRaOXZhZnhCZGlR?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1442d2b8-1b4a-4825-28b7-08de04ad728f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 07:53:33.0563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YIiqKvnCQfX5Zwfgb5wNDiLoq05AyE/zXPB2OeA9uFu1FpBne8JCo3gTDTMPnUDDFT0gjyr1BWBZu45+HAPE7vKMBfQ40pUJq7orjvb6TY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7735
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IERhbmRhbXVk
aSwgUHJpeWFua2ENCj4gU2VudDogMDYgT2N0b2JlciAyMDI1IDExOjE4IEFNDQo+IFRvOiBVdHRh
bWNoYW5kLCBHYWplbmRyYSA8Z2FqZW5kcmEudXR0YW1jaGFuZEBpbnRlbC5jb20+OyBpZ3QtDQo+
IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFV0dGFtY2hhbmQsIEdhamVuZHJhIDxn
YWplbmRyYS51dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2NCBp
LWctdCA0LzZdIGJlbmNobWFya3MvaW50ZWxfbGF0ZW5jeTpBZGQNCj4geGVfdm1fY3JlYXRlX2Rl
c3Ryb3kgdGVzdA0KPiANCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gRnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4g
T24gQmVoYWxmIE9mDQo+ID4gR2FqZW5kcmEgVXR0YW1jaGFuZA0KPiA+IFNlbnQ6IDE3IFNlcHRl
bWJlciAyMDI1IDA2OjQwIFBNDQo+ID4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+ID4gQ2M6IFV0dGFtY2hhbmQsIEdhamVuZHJhIDxnYWplbmRyYS51dHRhbWNoYW5kQGludGVs
LmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjQgaS1nLXQgNC82XSBiZW5jaG1hcmtzL2ludGVs
X2xhdGVuY3k6QWRkDQo+ID4geGVfdm1fY3JlYXRlX2Rlc3Ryb3kgdGVzdA0KPiA+DQo+ID4gQWRk
IFZNIGxpZmVjeWNsZSBwZXJmb3JtYW5jZSBtZWFzdXJlbWVudCB0ZXN0IGZvciB0aGUgWEUgZHJp
dmVyLg0KPiA+IE1lYXN1cmVzIHZpcnR1YWwgbWVtb3J5IGNvbnRleHQgY3JlYXRpb24gYW5kIGRl
c3RydWN0aW9uIGxhdGVuY3kgdG8NCj4gPiBpZGVudGlmeSBWTSBtYW5hZ2VtZW50IG92ZXJoZWFk
Lg0KPiA+DQo+ID4gRGVmYXVsdHM6IGJ1ZmZlciBzaXplcyBmcm9tIDRLQiB0byA4TUIsIDEzIHJl
cGV0aXRpb25zLCAxMDAwDQo+ID4gaXRlcmF0aW9ucyBwZXIgcmVwZXRpdGlvbiwgMiBzZWNvbmRz
IHBlciBzYW1wbGUsIHNpbmdsZSBDUFUuDQo+ID4gUGFyYWxsZWxpc20gaXMgY29uZmlndXJhYmxl
IHZpYSBjb21tYW5kLWxpbmUgb3B0aW9ucy4NCj4gPg0KPiA+IENyaXRpY2FsIGZvciBhcHBsaWNh
dGlvbnMgd2l0aCBmcmVxdWVudCBWTSBjb250ZXh0IHN3aXRjaGluZyBhbmQgaGVscHMNCj4gPiBv
cHRpbWl6ZSBtZW1vcnkgbWFuYWdlbWVudCBwZXJmb3JtYW5jZSBpbiBjb21wbGV4IGdyYXBoaWNz
DQo+ID4gYXBwbGljYXRpb25zLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogR2FqZW5kcmEgVXR0
YW1jaGFuZCA8Z2FqZW5kcmEudXR0YW1jaGFuZEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIC4u
Li9pbnRlbF9sYXRlbmN5L3hlX3ZtX2NyZWF0ZV9kZXN0cm95LmMgICAgICB8IDEyMiArKysrKysr
KysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyMiBpbnNlcnRpb25zKCspDQo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBiZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kveGVfdm1fY3JlYXRl
X2Rlc3Ryb3kuYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2JlbmNobWFya3MvaW50ZWxfbGF0ZW5j
eS94ZV92bV9jcmVhdGVfZGVzdHJveS5jDQo+ID4gYi9iZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kv
eGVfdm1fY3JlYXRlX2Rlc3Ryb3kuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5k
ZXggMDAwMDAwMDAwLi4xYzA5YjQ4ZGMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYmVu
Y2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX3ZtX2NyZWF0ZV9kZXN0cm95LmMNCj4gPiBAQCAtMCww
ICsxLDEyMiBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ID4gKy8q
DQo+ID4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uICAqLw0KPiA+ICsN
Cj4gPiArI2luY2x1ZGUgImlndC5oIg0KPiA+ICsjaW5jbHVkZSAiaWd0X3N5bmNvYmouaCINCj4g
PiArI2luY2x1ZGUgInhlL3hlX2lvY3RsLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5o
Ig0KPiA+ICsNCj4gPiArI2RlZmluZSBPQkpFQ1RfU0laRSAoMSA8PCAyMykNCj4gPiArDQo+ID4g
K3N0YXRpYyBkb3VibGUgZWxhcHNlZChjb25zdCBzdHJ1Y3QgdGltZXNwZWMgKnN0YXJ0LA0KPiA+
ICsJCQkgIGNvbnN0IHN0cnVjdCB0aW1lc3BlYyAqZW5kKQ0KPiA+ICt7DQo+ID4gKwlyZXR1cm4g
KGVuZC0+dHZfc2VjIC0gc3RhcnQtPnR2X3NlYykgKyAxZS05ICogKGVuZC0+dHZfbnNlYyAtDQo+
ID4gK3N0YXJ0LT50dl9uc2VjKTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgdGVzdF92bV9j
cmVhdGUoaW50IGZkKQ0KPiA+ICt7DQo+ID4gKwl1aW50MzJfdCB2bTsNCj4gPiArDQo+ID4gKwl2
bSA9IHhlX3ZtX2NyZWF0ZShmZCwgMCwgMCk7DQo+ID4gKwl4ZV92bV9kZXN0cm95KGZkLCB2bSk7
DQo+ID4gK30NCj4gPiArDQo+ID4gK2ludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikNCj4g
PiArew0KPiA+ICsJaW50IGZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ID4gKwlp
bnQgc2l6ZSA9IDA7DQo+ID4gKwlpbnQgYnVzeSA9IDA7DQo+ID4gKwlpbnQgcmVwcyA9IDEzOw0K
PiA+ICsJaW50IG5jcHVzID0gMTsNCj4gPiArCWludCBjLCBuLCBzOw0KPiA+ICsNCj4gPiArCXdo
aWxlICgoYyA9IGdldG9wdChhcmdjLCBhcmd2LCAiczpiOnI6ZiIpKSAhPSAtMSkgew0KPiA+ICsJ
CXN3aXRjaCAoYykgew0KPiA+ICsJCWNhc2UgJ3MnOg0KPiA+ICsJCQlzaXplID0gYXRvaShvcHRh
cmcpOw0KPiA+ICsJCQlicmVhazsNCj4gPiArDQo+ID4gKwkJY2FzZSAncic6DQo+ID4gKwkJCXJl
cHMgPSBhdG9pKG9wdGFyZyk7DQo+ID4gKwkJCWlmIChyZXBzIDwgMSkNCj4gPiArCQkJCXJlcHMg
PSAxOw0KPiA+ICsJCQlicmVhazsNCj4gPiArDQo+ID4gKwkJY2FzZSAnZic6DQo+ID4gKwkJCW5j
cHVzID0gc3lzY29uZihfU0NfTlBST0NFU1NPUlNfT05MTik7DQo+ID4gKwkJCWJyZWFrOw0KPiA+
ICsNCj4gPiArCQljYXNlICdiJzoNCj4gPiArCQkJYnVzeSA9IHRydWU7DQo+ID4gKwkJCWJyZWFr
Ow0KPiA+ICsNCj4gc2l6ZSxuY3B1cyxidXN5IGFyZSBub3QgYmVpbmcgdXNlZCBhbnl3aGVyZSwg
dGhlbiBubyBuZWVkIG9mIHRoZXNlIG9wdGlvbnMsIGl0IGNhbiBiZQ0KPiByZW1vdmVkIGFuZCB1
cGRhdGUgdGhlIHdob2xlIGNvZGUgYWNjb3JkaW5nbHkuDQo+ID4gKwkJZGVmYXVsdDoNCj4gPiAr
CQkJYnJlYWs7DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWlmIChzaXplID09IDAp
IHsNCj4gPiArCQlmb3IgKHMgPSA0MDk2OyBzIDw9ICBPQkpFQ1RfU0laRTsgcyA8PD0gMSkgew0K
PiA+ICsJCQlpZ3Rfc3RhdHNfdCBzdGF0czsNCj4gPiArDQo+ID4gKwkJCWlndF9zdGF0c19pbml0
X3dpdGhfc2l6ZSgmc3RhdHMsIHJlcHMpOw0KPiA+ICsNCj4gPiArCQkJZm9yIChuID0gMDsgbiA8
IHJlcHM7IG4rKykgew0KPiA+ICsNCj4gPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5k
Ow0KPiA+ICsJCQkJdWludDY0X3QgY291bnQgPSAwOw0KPiA+ICsNCj4gPiArCQkJCWNsb2NrX2dl
dHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAmc3RhcnQpOw0KPiA+ICsJCQkJZG8gew0KPiA+ICsJCQkJ
CWZvciAoYyA9IDA7IGMgPCAxMDAwOyBjKyspDQo+ID4gKwkJCQkJCXRlc3Rfdm1fY3JlYXRlKGZk
KTsNCj4gPiArDQo+ID4gKwkJCQkJY291bnQgKz0gYzsNCj4gPiArCQkJCQljbG9ja19nZXR0aW1l
KENMT0NLX01PTk9UT05JQywNCj4gPiAmZW5kKTsNCj4gPiArCQkJCX0gd2hpbGUgKGVuZC50dl9z
ZWMgLSBzdGFydC50dl9zZWMgPCAyKTsNCj4gPiArDQo+ID4gKwkJCQlpZ3Rfc3RhdHNfcHVzaF9m
bG9hdCgmc3RhdHMsIGNvdW50IC8NCj4gPiBlbGFwc2VkKCZzdGFydCwgJmVuZCkpOw0KPiA+ICsJ
CQl9DQo+ID4gKwkJCXByaW50ZigiJWZcbiIsIGlndF9zdGF0c19nZXRfdHJpbWVhbigmc3RhdHMp
KTsNCj4gPiArCQkJaWd0X3N0YXRzX2ZpbmkoJnN0YXRzKTsNCj4gPiArCQl9DQo+ID4gKwl9IGVs
c2Ugew0KPiA+ICsJCWRvdWJsZSAqc2hhcmVkOw0KPiA+ICsNCj4gPiArCQlzaGFyZWQgPSBtbWFw
KDAsIDQwOTYsIFBST1RfV1JJVEUsIE1BUF9TSEFSRUQgfA0KPiA+IE1BUF9BTk9OLCAtMSwgMCk7
DQo+ID4gKw0KPiA+ICsJCWZvciAobiA9IDA7IG4gPCByZXBzOyBuKyspIHsNCj4gPiArCQkJbWVt
c2V0KHNoYXJlZCwgMCwgNDA5Nik7DQo+ID4gKw0KPiA+ICsJCQlpZ3RfZm9yayhjaGlsZCwgbmNw
dXMpIHsNCj4gPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5kOw0KPiA+ICsJCQkJdWlu
dDY0X3QgY291bnQgPSAwOw0KPiA+ICsNCj4gPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9O
T1RPTklDLCAmc3RhcnQpOw0KPiA+ICsJCQkJZG8gew0KPiA+ICsJCQkJCWZvciAoYyA9IDA7IGMg
PCAxMDAwOyBjKyspDQo+ID4gKwkJCQkJCXRlc3Rfdm1fY3JlYXRlKGZkKTsNCj4gPiArDQo+ID4g
KwkJCQkJY291bnQgKz0gYzsNCj4gPiArCQkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05J
QywNCj4gPiAmZW5kKTsNCj4gPiArCQkJCX0gd2hpbGUgKGVuZC50dl9zZWMgLSBzdGFydC50dl9z
ZWMgPCAyKTsNCj4gPiArDQo+ID4gKw0KPiA+ICsJCQkJc2hhcmVkW2NoaWxkXSA9IGNvdW50IC8g
ZWxhcHNlZCgmc3RhcnQsICZlbmQpOw0KPiA+ICsJCQl9DQo+ID4gKwkJCWlndF93YWl0Y2hpbGRy
ZW4oKTsNCj4gPiArDQo+ID4gKwkJCWZvciAoaW50IGNoaWxkID0gMDsgY2hpbGQgPCBuY3B1czsg
Y2hpbGQrKykNCj4gPiArCQkJCXNoYXJlZFtuY3B1c10gKz0gc2hhcmVkW2NoaWxkXTsNCj4gPiAr
DQo+ID4gKwkJCXByaW50ZigiJTcuM2ZcbiIsIHNoYXJlZFtuY3B1c10pOw0KPiA+ICsJCX0NCj4g
PiArCQltdW5tYXAoc2hhcmVkLCA0MDk2KTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwljbG9zZShm
ZCk7DQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+IC0tDQo+ID4gMi40My4wDQoNCg==
