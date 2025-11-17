Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF90CEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 12:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30DA10E38E;
	Mon, 17 Nov 2025 12:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hjj1hA39";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB9A10E38E
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 12:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763383096; x=1794919096;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=OZ+Urh0M1Br0GaxJp6Ayqf8zGoQXEzneM4DUcdLCRNQ=;
 b=Hjj1hA39boSRS9/W+IJZoXJTs4ICIXdrymg2FgSGRUcUtf5MQhls12CZ
 2HpLKg4dH/OlbITZWTTI5sxt0HE9SkcJ9M+sso8RnSHIil4lQIFs9bier
 AjO5AWzTxYuDUhdhSeUJoHK1iLdQlmOEVX+DFE0dxjGCk9DZO4QzJALUB
 WWUSl5Plu9j4suphRu/mBDS3BqAyHh16XoqHxZRPzE6v5M2wL2QsSlyQp
 2JV2RzDOEiayprvqRn4r/WGP6Z+5kZ+/5w87RmV0YMsi8jdtbjDkXL2Gf
 4zjwpwuc9nJJDvfO++Nhc9SAHUjoMvopkgQNz5gonXVDcBOJ4f6LVaZx7 Q==;
X-CSE-ConnectionGUID: bpWC/ET3S2uHbtQSO8gbXQ==
X-CSE-MsgGUID: 3wvINnWLRGCU78fCtM44sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83005504"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="83005504"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 04:38:16 -0800
X-CSE-ConnectionGUID: RUh0iokjT3e1Lj4eClWPTQ==
X-CSE-MsgGUID: 4MvxoLGPQxSqasrZ+unhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="189738524"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 04:38:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 04:38:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 04:38:15 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 04:38:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm8dD0G8AyesH2Qd5EobH/JzzqcDyLBCnU1vCp9YZYgh9AapzIpaGgENFHVVLpuFA1VT4wD++ZwbvgGhY04l2CJpaerzWo6u8j603qN7Mi4rF02mQs2seyPcZdf8tukbE09T+6QRTO4UoMEp7Xg9z++/mwliR+tNUhKH1dZKG9N+Bt9LOmICrNeyBCDbRGGvFamauMk4SWsjFROgRxyUuREWqxynzDlcFz8hyMq4YQbv9ADRHDQx2Ej6vbX+vQvmhw12InhfmDZynA4Lth4UZupNy7erNVGdR2jgOweIsEfevbYNHOh66qJMhouhsuG77pvRFxdjrKB5smcc9kFNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ+Urh0M1Br0GaxJp6Ayqf8zGoQXEzneM4DUcdLCRNQ=;
 b=A+ayolXBKI+40oZY/PL12D+bi59HdQRgpCXzGxxfsw+9hsYskkPjtw3kfNCM+fVEzJnsZ4LPcjE4I3nxVtl3zqm5d7aG4LRFVODuDOyCKwxthwJc/96nSxI0O5tmexyrWlzUrkmbLDaYjVOTZOsjGikT55kRbttkbZJ+x3a8RM29anrA9cArmpMJ0WY7yhiB0W44n61/e2zI/gEf5VrS7c6WEaIBxgWUg83OPJ6nSQ1LiAeovEdhZ4V5+TxpvqZDtuqwlG6RgoRf0ryf6ue1jBgAy7y5AUglC0xYViTSRMLwMlIEl1MUWkSufoZv5Bt8EAzPDvdDc0q06CjbkoETLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.22; Mon, 17 Nov 2025 12:38:11 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 12:38:11 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 02/10] tests/intel/xe_exec_system_allocator: Add
 parameter in madvise call
Thread-Topic: [PATCH i-g-t v7 02/10] tests/intel/xe_exec_system_allocator: Add
 parameter in madvise call
Thread-Index: AQHcVLs5b/KkA8t9NEeyrToCYRLrfLT21JkA
Date: Mon, 17 Nov 2025 12:38:11 +0000
Message-ID: <2a8afcd14ec6e32e9481fd703f64e77ce672f833.camel@intel.com>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-3-nishit.sharma@intel.com>
In-Reply-To: <20251113163308.633818-3-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DS7PR11MB6127:EE_
x-ms-office365-filtering-correlation-id: 2dd1c878-7270-4b37-9cdb-08de25d62b4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dERnK0FkNmJoZFRzNkdaWUU1SVpSV1NQc3lYVy8vYS9uWU5RMWRpMmZhajdG?=
 =?utf-8?B?THg5ZmtWMW5nVWhBWFZuNGxWd0xUc3JLSkw4NXdsbURFNGhQT1hQZUQ0R3JH?=
 =?utf-8?B?WGo0S2h1VTNMYkxoL2hpNWwybnFGYWQyNXFWeDI1Q0JTV2JPNUUxbnVMdjdv?=
 =?utf-8?B?RVUwbFRQU3hYd0FYb1VxWXpzUVNqZnVNNzYxU0ZXcFVDdXg4Y3NWRjhBRUVm?=
 =?utf-8?B?bTFxTTEvVDN1TFdCRjhQNnJOYkNJdWhTMnhoY1dDNjVUZE45MGtUdENpdVk3?=
 =?utf-8?B?NUhTd3RYZTJncTBBd0ErRnhJZjhld01MazJ2VGZXSFBIbDB3L1NjajB3UXE1?=
 =?utf-8?B?RFBqcXNiWUw3WGhsb2FvVlV6dEg5bEJ0ZGxNT1pJODM3bUZVdEt4SGRlRUtr?=
 =?utf-8?B?R1g4aXhjZFdOUy9ENGM2TVdtdEQzQ3BnNDdLdld1b1dmdlcyd3FTSTRYeHds?=
 =?utf-8?B?czdxK1gwMXo0Ykc2NjdoR2k1VUdhbi9BbkZkNDJnVFFrZEtHa3FjZ1hXV2Zr?=
 =?utf-8?B?TUFHNDFrRlNweHhFWlpNYTJoeW1udExTNE1IbHc3SnNnOHdXN01rb0VEeEkx?=
 =?utf-8?B?VGl2Si9zdkRVaHkzaloyME9PZkdtSU9waWpsaHU1T0J4VGFwbTFPVmpqSDls?=
 =?utf-8?B?ejNoc3MzNXJieUM2aHYyQ0lGdTkxTmErQkdOY3dWb0FhQTRKTlFLQzl2Mmls?=
 =?utf-8?B?dXVLOXZZTnNCYVdIalFsWHBGbnVsdmFna2FxMVFLeHRoMmxYL0o0a1ZUbGJO?=
 =?utf-8?B?bUdhMXVIaVRjSGZFeHAwNU1qeHYrUzJ1UlNTUzVYYm5rc0VVZ25LNnl4TVdF?=
 =?utf-8?B?TmdxQlB5MjBnRUNjNFc4aWh4S3FaLzN0am15OG9hNjAwbW1IUXhQUXEzNWxo?=
 =?utf-8?B?OFkvNC9RRnQ0TXppSVFLOHRDeWJidUNqUGJpbGY4SW02M3FuOTJDR3dpUnN3?=
 =?utf-8?B?dkRXRGtzS1Zqa25qb2VNUnZGZDFUL0xqelAyRWdhYTFyRDVqY3g3ZTBRYW4z?=
 =?utf-8?B?ZXo5WVUrOVRsWFY5NjRRRThhL1c2cnRMVXlyelNtYk9ONmZGcG5hYkl3LzJB?=
 =?utf-8?B?TmJoY0xjZkNFUnNFMUhxVzNNMVdyWGxOd2doS3V1QW95Ny9FMDBhckJ1ZmF4?=
 =?utf-8?B?R2ROR1kwTWxpa3VkVndWYTR6d1QzenJyVGdvaGFBeS80UUFSVGV4V21MRVYy?=
 =?utf-8?B?cG1rWUdXNkpLTjZTWTVWSTVQU0dwUVJYTFYyLzRYdUdwaEdsbTFrWVZrUldF?=
 =?utf-8?B?NElYTUZIMCtRdk94Vjk2TE5DZU1HbkRnWHlYWlF3aFRIM2Z5UE5FLzkxY2dW?=
 =?utf-8?B?dU1BNVpzTGxmU2N0ZlNKSElWSWJZc1gvREljcFIvcWpIMXVUc001d1k1YTk4?=
 =?utf-8?B?d2NJc2dRRzllY3FJZnAvQTVucXFydXNKbklzTVB6Q3hmQVV0ckl0cEJpK3Fj?=
 =?utf-8?B?bDkzYkh5RUxGNXZVTXAxN0RURWUrSGtxTUovY3BkOTd4b1ZJSTQ5TENWWGFj?=
 =?utf-8?B?YzdEdWp0d0l3WERrdTNGZEx6TnFnN0tHUW0rUmorNWNZV1dkT3R0aXlCUmtQ?=
 =?utf-8?B?QW4wNG90T1hOSXIxSkhaY29WNjRpTjV4UXQwMyt0R2hNaWU3Rk9PbmNkVk8z?=
 =?utf-8?B?bi91OVBjVWhvQzFzNzg3bTd4NWkyUjhjUS9IZjVMUThOVjNGL1RwaW1WaFAv?=
 =?utf-8?B?L2Rrd3ZsSkVMWC9UQ21EcVdOMktLUmlNRkM3RGU2SFQ2YkZibTVmQVpiTnJG?=
 =?utf-8?B?a2d4UjZkN2loWit3VWdva0s5eGRLNk00Rk50ZDN5NXBUemNYeTg2SDBDaWRi?=
 =?utf-8?B?MnZObU5nekhwR21rQVlxR0pDMURDNWk5cGRmTEdtVHY4SURjajkxclpZUWFT?=
 =?utf-8?B?a3ZBTUxlT1dhQXBPTndIbklhVGs3L1lkbzlsYjgwakEwNzNTRU92VzVpc0dv?=
 =?utf-8?B?WDVmc0VQWTVkWU5MbmE0dkt3WW9McXNGeDBuRFNNQlhxbUl3RCtQUXluRXA1?=
 =?utf-8?B?eE9LOUwxSFFvem1KeEZyZ3VEZkhHdzVNUU90RklhRCt6R1p2SHJwbWRCdFA1?=
 =?utf-8?Q?ZT79Aj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzhGK3kyTm9vejFUR2VCbnVKNTA4K2dDUDBQUjg3TFhTSW8yVjJ3M092TUpJ?=
 =?utf-8?B?eGVFc2YxV3JDaGpCV1VXZFFrMzJsWkRmNndHdkVlOVpsTzdKd2oyNXhvN0Mw?=
 =?utf-8?B?c2RqcWZWdTlnaWhlOVZ5aTc2Z3F4RzZZZmxnYkpNdHhDMlp0dXVhQnRVZE9V?=
 =?utf-8?B?VE5sSUJvVDE4TlBDRitRK0ZCai9tbVZ6UEE1NHoxWU92K0RVV0lmRGhpcHEv?=
 =?utf-8?B?VS9hNXBNRHQ4RXBrQUpFRDE5VGgzekVnUWVXanR2NVRaSDZoK284UWwwR2Vh?=
 =?utf-8?B?WGJtSVZuemh1dnJtVVJmUFZ6cmozQnhCZW1TOXFsQ0s2aExDWmIydTVmZ1l3?=
 =?utf-8?B?ejBIZ3BMdnJ4cFczbUdPU3d0Wlgvamo3elBlRnpJS1dQNTRrR2V4aktsS1FH?=
 =?utf-8?B?S0tCTjB4WVZpWkRQOHFhbmlyU1YwcW1aUUgwYlg5azB1OXhWSTFtM04vaDB3?=
 =?utf-8?B?aXdWN2d2dXlhK3hrbDJxZ0tqOFUwQmVOemNETzNtb2ErUzFOYWZ4bHljSmZB?=
 =?utf-8?B?TTB5Qk1UenRjaHZCbkNpc0FUOXVqcWlDQWRUdTUyaGtWUktHdnVBMDVPU2lw?=
 =?utf-8?B?ZHRKbHY1ME0yL0FqSnA5RjNncW9sR0RrbjlIVHdEOXRDT0h4aVB0N1NyL29w?=
 =?utf-8?B?U3E3MzNNR0lUdUtIZ0hWY2hYSWYxQmtkMitqQmk5ZWMwbGhzUDlUWUdDVzUx?=
 =?utf-8?B?MGtDY05Qb29xdFc1MXBnRDV0RUJPakkxdHFhVzNzeDFkMWF0aExERkgvc3dO?=
 =?utf-8?B?Q2tUOFoxS3JWTTNSMWFkdUNMZUFNRkdWK3Z2ajM4TDd6dlBsVHduTmRnT05v?=
 =?utf-8?B?MUl5Z0ljNmdXZTFDa2lQc3N3SEtNRGFNYnI3Qnp4Y2VRZFk1Sm1rQ3NCQlFt?=
 =?utf-8?B?NWVxRHVURzVLaGxVNTFuMzYvdXFOdE5DUS8wb3AzaStMRXR2SXk2c3pwcWwz?=
 =?utf-8?B?NSs2alE0YWE2V2Fadk45MisyK0lRbm1rRHNlMHl4d2dLbTRSclh0RzVTOFNm?=
 =?utf-8?B?SEtPMTFBNE9GUmRralV2SmE5N3lWakRhZWRyTlFOUk9FNUwrM1NwWXpJVVpN?=
 =?utf-8?B?SWFZVUJaM1hmUkFEdldSbzB0alJzWXNBT0dUMjB5R2NuVHdta1RPbXUwWFpX?=
 =?utf-8?B?cUhlb1R6dDdJWEVEdkVrcXZMeDdSTHdwUjNxUmpRKytraExvYXlhbmxzcURZ?=
 =?utf-8?B?NzVacDdBSDI0eFNIN2RsaEVPYzhNaWc3Q3ptUDI2dWZNbVRMRnRiNlhTbHJp?=
 =?utf-8?B?TXNZZ24wWjd0VUlmdURGWEtWT1NUc2lHeFdDaEl2SlFVaXBvMHR6NCsrWVpq?=
 =?utf-8?B?RjZ3dENDYVFkdldFZ2d4V242WWRScVdrV1RIaHlZUy9rZXNFM3kxQ0pSRzky?=
 =?utf-8?B?ekdxM1pUV0RRNFZPUDhjTSt4MFhXeGtXL3ZyeVZGZ2ZyVmo0SHBRdHp1c2Rn?=
 =?utf-8?B?NmNzWHJQTGt1MFhsNCtiUlMyVUJTd3VJeU5JbHB0aUxvWjNvTFMxY3JUdHFP?=
 =?utf-8?B?c0ZHRFpMMG05ZXN4NzA3UWVna0xwM0lqYTl0M0FHQnkvL3RQdHM2WC9OVlBQ?=
 =?utf-8?B?bDJaQXgybTg4dllNS1VkZUdYV3psRXV3UWlGQnRzTXJ2Z2RRRjFsV2xyRHp3?=
 =?utf-8?B?WWt4b0tqOVhtUGp5TmRHaFFIZnpzWUppc3h2blovbGcvamVrS1djY3lNL3Ir?=
 =?utf-8?B?aTdYeCt6TDNOTk5QUk5IOWZyVEZQRGhLZDdiUTloOVVCM2JGSjBabmpSckxi?=
 =?utf-8?B?Nmowb0x4TjZHTEUzK0wxLzViU3RpNlI5bkI5T3lRR3RyWDlQcVlZK1BYQjdL?=
 =?utf-8?B?RUhadE5VN0JGVkpCOGZjSmFZRjhpaVhEekFCMWZjMVc0Y2FDckdraUIvb0Jm?=
 =?utf-8?B?bGY2VXRkUzFISS96alR0dUgzdW9hZ1l4dHFpYXFkKzBnMC9DN0k4bHBVeUlk?=
 =?utf-8?B?aGw4R1RZb3U2VWpJbDN5cy9kV25adEVKYm9zUUpjeCtEaGU5M1pZRzBNcFFw?=
 =?utf-8?B?eVJwZVdXSTVLTTMvK1VReHV5WGVmNEE2a2MzMTY3elZkQkNZQVZSaGVJNjc0?=
 =?utf-8?B?WXBON3FmRDBlNmhRZVFjdDVFdUUyc3UyVjkrektYOXpKQmM2ZUJUWVNYWXVR?=
 =?utf-8?B?aysrdGh4dC9LZjh5UG03UjlUVlRveWwyekxiTGQyNzNYSjBLMjUzYjIxVWJa?=
 =?utf-8?Q?zZQzDPGOxmekOPFIihLhaIJ6c9WsYLzlwVO9pMQn9Utp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01EDA74ED44F794EAD00B2D51B766E69@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd1c878-7270-4b37-9cdb-08de25d62b4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 12:38:11.2990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I4mNBFL8UlNeAiI8GWB0Wn3v0IOt39hMT/GdJf8ViE6XfZ5+AHfu+Osk6VbTea++4JPa5C/IDuQd3qN/ngqj9cdDYAssrpzwKh1WGuKyTX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
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

T24gVGh1LCAyMDI1LTExLTEzIGF0IDE2OjMzICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBQYXJhbWV0ZXIgaW5zdGFuY2UgYWRkZWQgaW4geGVfdm1fbWFkdmlzZSgpIGNhbGwu
IFRoaXMgcGFyYW1ldGVyDQo+IGFkZGl0aW9uIGNhdXNlIGNvbXBpbGF0aW9uIGlzc3VlIGluIHN5
c3RlbV9hbGxvY2F0b3IgdGVzdC4gQXMgYSBmaXgNCj4gMCBhcyBpbnN0YW5jZSBwYXJhbWV0ZXIg
cGFzc2VkIGluIHhlX3ZtX21hZHZpc2UoKSBjYWxscy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5p
c2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KDQpTaG91bGRuJ3QgdGhpcyBi
ZSBtZXJnZWQgd2l0aCBwcmV2aW91cyBwYXRjaCwgd2l0aCB0aGUgZ29hbCB0aGF0IGVhY2gNCmNv
bW1pdCBzaG91bGQgbGVhdmUgdGhlIHRyZWUgaW4gYSBzdGF0ZSB0aGF0IGNvbXBpbGVzLg0KDQov
VGhvbWFzDQoNCg0KDQo+IC0tLQ0KPiDCoHRlc3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2FsbG9j
YXRvci5jIHwgOCArKysrLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19z
eXN0ZW1fYWxsb2NhdG9yLmMNCj4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0
b3IuYw0KPiBpbmRleCBiODg5NjdlNTguLjFlNzE3NTA2MSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMv
aW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVf
ZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMNCj4gQEAgLTExNjQsNyArMTE2NCw3IEBAIG1hZHZpc2Vf
c3dpenpsZV9vcF9leGVjKGludCBmZCwgdWludDMyX3Qgdm0sDQo+IHN0cnVjdCB0ZXN0X2V4ZWNf
ZGF0YSAqZGF0YSwNCj4gwqAJeGVfdm1fbWFkdmlzZShmZCwgdm0sIHRvX3VzZXJfcG9pbnRlcihk
YXRhKSwgYm9fc2l6ZSwgMCwNCj4gwqAJCcKgwqDCoMKgwqAgRFJNX1hFX01FTV9SQU5HRV9BVFRS
X1BSRUZFUlJFRF9MT0MsDQo+IMKgCQnCoMKgwqDCoMKgIHByZWZlcnJlZF9sb2MsDQo+IC0JCcKg
wqDCoMKgwqAgMCk7DQo+ICsJCcKgwqDCoMKgwqAgMCwgMCk7DQo+IMKgfQ0KPiDCoA0KPiDCoHN0
YXRpYyB2b2lkDQo+IEBAIC0xMTcyLDcgKzExNzIsNyBAQCB4ZV92bV9tYWR2aXhlX3BhdF9hdHRy
KGludCBmZCwgdWludDMyX3Qgdm0sDQo+IHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHJhbmdlLA0K
PiDCoAkJwqDCoMKgwqDCoMKgIGludCBwYXRfaW5kZXgpDQo+IMKgew0KPiDCoAl4ZV92bV9tYWR2
aXNlKGZkLCB2bSwgYWRkciwgcmFuZ2UsIDAsDQo+IC0JCcKgwqDCoMKgwqAgRFJNX1hFX01FTV9S
QU5HRV9BVFRSX1BBVCwgcGF0X2luZGV4LCAwKTsNCj4gKwkJwqDCoMKgwqDCoCBEUk1fWEVfTUVN
X1JBTkdFX0FUVFJfUEFULCBwYXRfaW5kZXgsIDAsIDApOw0KPiDCoH0NCj4gwqANCj4gwqBzdGF0
aWMgdm9pZA0KPiBAQCAtMTE4MSw3ICsxMTgxLDcgQEAgeGVfdm1fbWFkdmlzZV9hdG9taWNfYXR0
cihpbnQgZmQsIHVpbnQzMl90IHZtLA0KPiB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCByYW5nZSwN
Cj4gwqB7DQo+IMKgCXhlX3ZtX21hZHZpc2UoZmQsIHZtLCBhZGRyLCByYW5nZSwgMCwNCj4gwqAJ
CcKgwqDCoMKgwqAgRFJNX1hFX01FTV9SQU5HRV9BVFRSX0FUT01JQywNCj4gLQkJwqDCoMKgwqDC
oCBtZW1fYXR0ciwgMCk7DQo+ICsJCcKgwqDCoMKgwqAgbWVtX2F0dHIsIDAsIDApOw0KPiDCoH0N
Cj4gwqANCj4gwqBzdGF0aWMgdm9pZA0KPiBAQCAtMTE5MCw3ICsxMTkwLDcgQEAgeGVfdm1fbWFk
dmlzZV9taWdyYXRlX3BhZ2VzKGludCBmZCwgdWludDMyX3QNCj4gdm0sIHVpbnQ2NF90IGFkZHIs
IHVpbnQ2NF90IHJhbmdlKQ0KPiDCoAl4ZV92bV9tYWR2aXNlKGZkLCB2bSwgYWRkciwgcmFuZ2Us
IDAsDQo+IMKgCQnCoMKgwqDCoMKgIERSTV9YRV9NRU1fUkFOR0VfQVRUUl9QUkVGRVJSRURfTE9D
LA0KPiDCoAkJwqDCoMKgwqDCoCBEUk1fWEVfUFJFRkVSUkVEX0xPQ19ERUZBVUxUX1NZU1RFTSwN
Cj4gLQkJwqDCoMKgwqDCoCBEUk1fWEVfTUlHUkFURV9BTExfUEFHRVMpOw0KPiArCQnCoMKgwqDC
oMKgIERSTV9YRV9NSUdSQVRFX0FMTF9QQUdFUywgMCk7DQo+IMKgfQ0KPiDCoA0KPiDCoHN0YXRp
YyB2b2lkDQoNCg==
