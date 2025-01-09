Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F30E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 08:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE6210ED2F;
	Thu,  9 Jan 2025 08:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgKlmwvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04CB10ED2A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736412046; x=1767948046;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=goYg3j0Examp3L2yZYCQaQgz1L5PH1VJau4wxv99WVA=;
 b=UgKlmwvTyx4GbDFl58z2ZSsiBZnz4nC3KuUEh1Sr0XsS2nOskNJI75P5
 suV7ViR8DRPzyuJhY417mY0CBxzWv+vbUqXzNspF5wBfpPMXYYt2QEDGi
 4SorpTevAEauSz2+falirwLT4AQSFiFSyH2K9XaqCixwD8OFmVTNDgNEe
 uhC+ru6jgSCHrqdMTtDQDsNH18ojAV1qwSm/KPgdgjUEnppWYp11YMOnd
 00RW/S0AW/n0vsVfQk6CTIAxrDEBfZt/sfb7Lvq43faUwvGw2cl9HayV2
 FyL7DEfYfbkiu5tcLvMllBMcMPw00SsPkH0hwYG9RYV13MbkPTY3K2nrI g==;
X-CSE-ConnectionGUID: 51t0r/n6SH+UN4zUJc8EFA==
X-CSE-MsgGUID: mu22FPVFR0Kwuys35sIESQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35948584"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="35948584"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:40:45 -0800
X-CSE-ConnectionGUID: hf+FlxhTQ7qFrwY1nc7NLw==
X-CSE-MsgGUID: 47RmsW2KTaad22NZ9+t8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="103537411"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 00:40:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 00:40:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 00:40:41 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 00:40:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lj2k8GksUGHiLLwgQ5ekc4Y2RGfgxZ0DhpLLQ/hBGkISgZMWqyRH5cluulf+s6+izbvWwfXkwwtPHecHsJX2TA/wR1QgfJwrm7KEVqzWDi0jwKgQoOsDHiGZiDZAqm2+cfdPGH/T3mMS+xET5POV6Ojo0+p9nNWy183oUvdb/7QSXf1Cg+hwSr4G+vj5a2dORpuMEr8IVtvq8nhlvTADaps6Tdxrws2NLi2YoFNOFC32tYQlkpF0DkNp+MMAUR8nu6cdIuzRBerp/5l2KLyQRaczpzGjdq4BG+akJXe+aG5CIZLHwm3v6wuy7BEf3iV4MACNQOi0i5W9unIlNPEojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goYg3j0Examp3L2yZYCQaQgz1L5PH1VJau4wxv99WVA=;
 b=DYhVhJZD6e5jKK/cBfshYGkX6+AB5ZrGx3/Kwv5kCxqHBQk/LQS+9srO/LbFkxRESMrbmglAENjYU+plN+3vxXy0r08q9jBdGTCS3zBDwFJni3n9dmk3n/KlOSzqf0tlV9jbbFpJSzIZaT5C0lnKrhw8ccw/Gd7ah9EMGrxHDkurkKee8PCi8P4lPNDyoyEdmaIgK086kZ0TpDEeZ7Af+z0b2Yg2D8QPF/mP8Oc7iwUjLMjOWL8e9bYNa8kqA6bly7q0aXnUUolt0Or44/Qf59dmFm5upsvSmtbGZ3mnq2eND2HVghcWtzMilkxx5yxqnLnkz09j1ql6B3wZECNGWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by MN0PR11MB6136.namprd11.prod.outlook.com (2603:10b6:208:3c8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 08:40:39 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%7]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 08:40:38 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2] tests/intel/xe_vm: Fixed documentation
Thread-Topic: [PATCH v2] tests/intel/xe_vm: Fixed documentation
Thread-Index: AQHbYmoRqOPN8UxWREagLilZvG3ZyLMOHyyA
Date: Thu, 9 Jan 2025 08:40:38 +0000
Message-ID: <IA1PR11MB609785F52B5D791CB584665F86132@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20250109073929.913205-1-pravalika.gurram@intel.com>
In-Reply-To: <20250109073929.913205-1-pravalika.gurram@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|MN0PR11MB6136:EE_
x-ms-office365-filtering-correlation-id: c86de812-1c07-41d2-f149-08dd30894b53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RXRqTWM2a2ZNZFRWV2JaenVWZ013aU1QbmlpbmQ3RXp6N1B6RUpxWkVDUHBt?=
 =?utf-8?B?V3dtcTRlOUk4QjNyQk9wVTB1TDI4TkU2WjFkRDZ5ODF1ZHdXdHNvVnBNYnor?=
 =?utf-8?B?UHpCcjFEbTc5ckFVWGdhTHVvVkRqVjJQYS9MTWJ4VUt6aGNDc3JGbk93QkhV?=
 =?utf-8?B?Y3daYXAwOTZsaDlEd0syZktBTG9lRWpPdVdRY0NDOUlGaUZkalplaFc1Z3hr?=
 =?utf-8?B?MlVZYlhyNTNxc29XaGNkMVhZNUJNNThpb0E2TWh0cVZ1UzV4N1lmTE0veUxo?=
 =?utf-8?B?anF5RG5CRllTVUpaUTk3WUIrVEVMVGczdDNoekx6dTcwSjE3bmZWVXFROTdw?=
 =?utf-8?B?dHlqZE12cjBXdDN6Y2IyT3FaNzJ2OTFzb2ttZkhnbHFYV0g2QUhCSXB3ampT?=
 =?utf-8?B?QXdDRlVhcUQrMDNXWDIrelE0RkM4cFJmR0tNRmR4cnFPT0l3cW9OSnNQOGk3?=
 =?utf-8?B?aVEvbzJwQ2JZSU4vZFRrRGc4VHNGWFlFTTBpV0phbE5lb3V0cHZDVGtpeEhD?=
 =?utf-8?B?dkpYNGdRTS8vNmhmNVRnSkRxQ0x6TEVXZ2E3dmRITVFITUxUamI0ajNFVTdS?=
 =?utf-8?B?TjZKdzBiemlrdlIxMkVEdGV5Mm4vczhxVE5Zek5yTWQ5cWQzZlRlemJsOWhE?=
 =?utf-8?B?dTVUZFpiNkFVbUxoU1N1TWt1dmVFNjNSRzRlcER0N0RSRWR4RkR6c25MWjdB?=
 =?utf-8?B?dWt0S0xyYisvYjAyZWk4WEx0V05Ub0lFOWc0SUhLNERkUmJaSEI2MUhzaDRU?=
 =?utf-8?B?aHZtcEM3R0lMakk2Z0Fid3FvU0FrSFJYbW00ZjNtYWgzeGJFM0k2VnErci9L?=
 =?utf-8?B?WWZUcHBhWWNjZzJtbDJZWFowZlk1Tkl6SVZRL25JR0M5UnV5WGFZY0dKYWFS?=
 =?utf-8?B?YnRUTVAyVS8yWS9ZdEJJdkRyOVNSa1Z4Zy9sNzl2MnhZSWVrMmFCbGZ3USta?=
 =?utf-8?B?RG1EeVFYREIxcWpOWWxUYm9vaUk3UHRrRElEYUo0czkxREdCUlh3OHAxZms5?=
 =?utf-8?B?a2RGTXl2eXVtR3NTNDl4MWlRRWlNcjhULzdNblpjZi9NM1Fka1R1Q0NWd3U4?=
 =?utf-8?B?UkJIczlVcUxlalY3NWwwWGJ6b2tRUzR6SUZRMFY3eG5YMXF6clBic0U0aUNG?=
 =?utf-8?B?Sm1LUms4ZEJ1TXF3OU9veU5rRFdhZVhxU01IZzA1S0VCaVE0TDF1cys2L3pw?=
 =?utf-8?B?Uy9RYlVENDh1RUJreWZKU0xLZ2pXT0lIVkhsOGdPL1RkdDh5eXNhanUrdGIx?=
 =?utf-8?B?RUxCWFVMMk5YZG9UZkc1RG0rY2kxMFFxS2lzUzlpdU5GWEpSdXR4dndmclBS?=
 =?utf-8?B?VkU4bksyQU9FZmpMQzkzbndvY1o4YitSOWlEUzlEUnZ5Qkp3NlMxb2xRYWdM?=
 =?utf-8?B?QytYZkRXSGh5N1lhZXpDdThXM0hQSGoxdlFxOHVPK1F5R0FWVWhSYnVmbC9Y?=
 =?utf-8?B?MGlwbWJ2anMwRkd2N3FpbnBtYTBTWGYrM2JRRzhoZWFITDVMNXMxczdFMm1k?=
 =?utf-8?B?cVB0Sk9NR0VKODN6QlY5ZS9leTJBSVdGUUFGQmpoZlc5QmMxWDhMTU5nR1lm?=
 =?utf-8?B?QW5oL01iclFMTzRtaDMybWpPbDFNT0RDdW44TWRiRlMyMzFoemFTUmFlNG1p?=
 =?utf-8?B?V2thUGl4NzUvM3NZMzlRODJSWUZkVW9PUDZ4djdGbFR5Q1ppWUpyelJZS004?=
 =?utf-8?B?Vk0yUDVWZ1drdjBWOHU4cjFBZmpjMTY4RUtnM28rRTgrT0dJcHlPZGdWRm9H?=
 =?utf-8?B?bnZsMnR6Y2Y1V3VVMElVZnBCekRUQkJySUE5M1pNeUZmNDJJSnpDcXpOUHhS?=
 =?utf-8?B?MGJvbnFEVTU4S0w3MEhpV0Myenk3Y3lkMll6emQxOUI2eE5wcFF5SUtLeEo3?=
 =?utf-8?B?YWxHbjJ5b3BtSnZVSkJTbTZ5SkZwK0NqMVJ6UWNLL21BRFpmb3o4MU9vbEZh?=
 =?utf-8?Q?iGcR5vHaqMGj3kwdSPNYJqnExEhjC836?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEpGZ2pBRTZwc3pUTDlUODRoTjR0ZEtIUVVJa3o2KzRGN2dwamIwRmdaMkVn?=
 =?utf-8?B?RWJKUkJmVWxjc3o5NFRZM2tDNUQ2Uzd0ZUZVUk1xMmhWTzJDWGVnRmliQnFr?=
 =?utf-8?B?Y01pclI3Y0o2aEhTSHczaVhnZTlwajYyMGFDMGxGVTFNa2NhMkRnd2wzckNC?=
 =?utf-8?B?QzVIT0tEVlZPT0ZIWG9vaTR1YUZvNFNBQm42MWNXYmd2RGFUbmNSUFF3WGQ3?=
 =?utf-8?B?amFGa0JXa3VLcG1LS1MrUXc1eXFwTWczRmNMYTMzUkZjdDlIUXFicDI0SVBz?=
 =?utf-8?B?ZWJHcVlqdVM4UU1BQkhLdWZHMUhTdWQvcXhPejRJZVJQbFd3TTVvVEZraUV0?=
 =?utf-8?B?M0dPNnBEYVBod1VuaFdxQnhOZnQ3Wll3MFZYY2FTR2d2Q045WmgrODI5ZzZl?=
 =?utf-8?B?NHM2Y1JxNU9ZbUoxZlBIU0NwbDRvNEpsMU9xZCtPKzk0Z1pBclcwdXdxY21M?=
 =?utf-8?B?MmhycU16VUVKM2dOV052aHl2aDAzVWxyaUdWMW9QYXYxSHVpcEd5OXV5aFIw?=
 =?utf-8?B?eW1WYWszMWpVVEhrbUs0MW9xSmJoem1SV1EyVUNuMCtoMXRHWEZ1Tmp4Z2lG?=
 =?utf-8?B?aHNIR3ZSTWRYejQyZmp6STdFS2FEeGlaNXF6S1ZwU1FNS1g3dUc4ekh6Mzk2?=
 =?utf-8?B?N0ZtaXNwYUZySTBOQ0k1d0Z6YzBrMy96OHZvNUpHSzNWUTYyVGZXVFBUSjlE?=
 =?utf-8?B?citqZmc2QjFZSzJuN2VzUThPNitzQjY1Rnh0NWpaRmN2em1TdlFmQjB0RHRF?=
 =?utf-8?B?b2k0R1N3ekh1RnYxSWx0WFJCVit5TWgrY0kzcDNyOHhuYWpkRjI5eklld3N6?=
 =?utf-8?B?NDJ2QUVzTnJONWFkOWNhMU5NNytDSmxLa3JWWEc1WEJBZmJQdG9paGZOWUJZ?=
 =?utf-8?B?YmROc3YvcTN2T2E2NERLb054UmV5MnA0YXI0MHRUb3JFL1o1cFR4UXJTTDZL?=
 =?utf-8?B?VklQb0tyb3haWjRNMDdEcm8rWFZwN1hNY1ZmQUxPK1RvR3hzUUM0ZE9NektF?=
 =?utf-8?B?b1ZZNXhVM2dhRlcyTTU0Sm54R2N3bzJPMlZJZ1VpSDBGUTMvSkNtTXFtM1Jz?=
 =?utf-8?B?Q3hXSUZ1aCtFR3FhdDlxK243elg5OUM2K0pkQXpxVVBtT3VENytoYk45ZnZm?=
 =?utf-8?B?YmRWY2ZsaFVxWS9vZTRLMll0QTdrS1R5bXk1Z2ZHeCtId0hpYmlnbHAzREUr?=
 =?utf-8?B?WklNdzRTRVZ1T0JzQmE5bWdlRTNqWjMxL3NKaTN6aEVYVkl0bzJ5T3VvWjQw?=
 =?utf-8?B?VjRSblB4eFBBNnVIeVBnRzBrZTRzaWpQNCtrVVpqZjNWckttNEJUbTgwdXFW?=
 =?utf-8?B?UFNEVWI5bmtnb1h5VHo5a2MrWnhDZVc5U2FjenMyZDZIWC9aOG1RWXhuYnZu?=
 =?utf-8?B?ejl6WWVNQnlqa2hKSktpbHlkRE5Rb3IwQU5rMXJGVm5EalhCcnp6T2dtUFdX?=
 =?utf-8?B?aFVWZmRwVTZnZGsyeUozelhlUXVoN1JWQWk2S1dlZ0tMb1hzb3dNNUdjcDcr?=
 =?utf-8?B?THQyMWdnT3hmQjBzT1pJZUZXdytwRmpRcGlzVExWUTU0blViYW53cnBEdUdR?=
 =?utf-8?B?bkVSdWlpZlBGVWpZdTNTMURzYXgzeDZDcU5hd1JqOGVWRlh6SDM0UmNmR2Q1?=
 =?utf-8?B?Q25LM2JZOWJFZytIUkpTbWtVYWRkRW9MZDJkdVU4ZFMzMm9qWFhNL2hZN1RU?=
 =?utf-8?B?UXYxZVFiM3RiOXJ1bkF2eGY3TlFUV2plMVM0Q0xRVzZITWFyVjY3SGRvNW5F?=
 =?utf-8?B?b3JSWGhTM2FZU0NETk14L0hKUU91T2J2TG52MlZnZEpGRnBjeWFYZE1KVTYz?=
 =?utf-8?B?T1h4bW1JbHljKytQcFI2cmtmRCt6c1M5KzJBa2VmM2ErcWJEWmxVUmlEZEhQ?=
 =?utf-8?B?a2trSTJ5TUZ2WnZjc1ljSm9ZZElteURMTW1TY2thRXVENVFIK2xYUjd5YnBS?=
 =?utf-8?B?RmJtOFRCRDV2SSszNzg1SUFLL0JUVkNZMlJ4SlJUbUVPRVFpQVk0MkoyK0hQ?=
 =?utf-8?B?QlBDZlluY3lGT2J0NUVlY1VZQVFxMXVVT0ZXaC9vem0ySVZlNWhTMWFEMFZN?=
 =?utf-8?B?TTRZdU4yUGt6UHNraUtKQjRTMXFRUHFGOWI3SjMySlVmcTltQjVuc0FlSVlZ?=
 =?utf-8?B?NHA2N29XNlk3anA5ZXk3WWRpMHV0bkZ3YlNvWUZtcUFDWnZhYjdpZTBuSHZv?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c86de812-1c07-41d2-f149-08dd30894b53
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 08:40:38.8555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oUYh7euBfK/eIc2E810MJuohx1535VA1xnJoWTl/+L7Dnq3sgSrlZ9QsF7qf2My4yXGe1dwI2UnZTbzv78M9OYo43ZsYjvsgnlD5QCHFqOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6136
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

RWFjaCB0ZXN0IHNob3VsZCBjb250YWluIG9ubHkgb25lIFRFU1QgZmllbGQuDQpBZGQgdGhlIEZ1
bmN0aW9uYWxpdHkgZmllbGQgaW4gdGhlIHN1YnRlc3Qgc2VjdGlvbiB0byBmaXggdGhlIHdhcm5p
bmdzIGR1cmluZyB0aGUgYWRkaXRpb24gb2Ygc3VidGVzdHMuDQoNCkZpeGVzOiA0ZDYzMGRiOGI4
Y2YgKCJDaGVjayBuZWdhdGl2ZSBjYXNlcyBmb3Igdm1fY3JlYXRlL2Rlc3Ryb3kgaW9jdGwiKQ0K
DQpDYzogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFyenluYS5waWVjaWVsc2thQGludGVsLmNv
bT4NClNpZ25lZC1vZmYtYnk6IFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50
ZWwuY29tPg0KLS0tDQogdGVzdHMvaW50ZWwveGVfdm0uYyB8IDE1ICsrKysrKy0tLS0tLS0tLQ0K
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC94ZV92bS5jIGIvdGVzdHMvaW50ZWwveGVfdm0uYyBpbmRleCBi
MTAyNjkxOTEuLjQyYTQ3Y2VhYyAxMDA2NDQNCi0tLSBhL3Rlc3RzL2ludGVsL3hlX3ZtLmMNCisr
KyBiL3Rlc3RzL2ludGVsL3hlX3ZtLmMNCkBAIC0yMjQ3LDE4ICsyMjQ3LDEwIEBAIHN0YXRpYyB2
b2lkIGJpbmRfZmxhZ19pbnZhbGlkKGludCBmZCkNCiAJeGVfdm1fZGVzdHJveShmZCwgdm0pOw0K
IH0NCiANCi0vKioNCi0gKiBURVNUOiBOZWdhdGl2ZSB0ZXN0IGZvciB2bSBjcmVhdGUvZGVzdHJv
eSBpb2N0bA0KLSAqIENhdGVnb3J5OiBDb3JlDQotICogTWVnYSBmZWF0dXJlOiBHZW5lcmFsIENv
cmUgZmVhdHVyZXMNCi0gKiBTdWItY2F0ZWdvcnk6IFN5bmNocm9uaXphdGlvbg0KLSAqIEZ1bmN0
aW9uYWxpdHk6IHZtIGNyZWF0ZQ0KLSAqIFRlc3QgY2F0ZWdvcnk6IG5lZ2F0aXZlIHRlc3QNCi0g
Ki8NCi0NCiAvKioNCiAgKiBTVUJURVNUOiBpbnZhbGlkLWZsYWctJXMNCiAgKiBEZXNjcmlwdGlv
bjogIGZ1bmN0aW9uICVhcmdbMV0gdXNlZCBpbiB2bSBjcmVhdGUgSU9DVEwgdG8gbWFrZSBpdCBm
YWlsDQorICogRnVuY3Rpb25hbGl0eTogaW9jdGxfaW5wdXRfdmFsaWRhdGlvbg0KICAqIEZ1bmN0
aW9uYWxpdHk6IGZhdWx0DQpeXl4gWW91IGhhdmUgZG91YmxlIGZ1bmN0aW9uYWxpdHkgaGVyZS4g
UGxlYXNlIHJlbW92ZSBsaW5lIHdpdGggJ2ZhdWx0Jw0KV2l0aCB0aGF0IGZpeGVkOg0KUmV2aWV3
ZWQtYnk6IEthdGFyenluYSBQaWVjaWVsc2thIDxrYXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5j
b20+DQoNCkthc2lhIPCfmIoNCg0KICAqDQogICogYXJnWzFdOg0KQEAgLTIyNzksOSArMjI3MSwx
MSBAQCBzdGF0aWMgdm9pZCBpbnZhbGlkX2ZsYWcoaW50IGZkLCBfX3UzMiBmbGFncykNCiAvKioN
CiAgKiBTVUJURVNUOiBpbnZhbGlkLWV4dGVuc2lvbnMNCiAgKiBEZXNjcmlwdGlvbjogQ2hlY2sg
cXVlcnkgd2l0aCBpbnZhbGlkIGV4dGVuc2lvbnMgcmV0dXJucyBleHBlY3RlZCBlcnJvciBjb2Rl
DQorICogRnVuY3Rpb25hbGl0eTogaW9jdGxfaW5wdXRfdmFsaWRhdGlvbg0KICAqDQogICogU1VC
VEVTVDogdm0tY3JlYXRlLWludmFsaWQtcmVzZXJ2ZWQNCiAgKiBEZXNjcmlwdGlvbjogU2VuZCBx
dWVyeSB3aXRoIGludmFsaWQgcmVzZXJ2ZWQgdmFsdWUgZm9yIHZtX2NyZWF0ZSBpb2N0bA0KKyAq
IEZ1bmN0aW9uYWxpdHk6IGlvY3RsX2lucHV0X3ZhbGlkYXRpb24NCiAgKi8NCiANCiBzdGF0aWMg
dm9pZCBpbnZhbGlkX2V4dGVuc2lvbnMoaW50IGZkKQ0KQEAgLTIzMDksMTIgKzIzMDMsMTUgQEAg
c3RhdGljIHZvaWQgdm1fY3JlYXRlX2ludmFsaWRfcmVzZXJ2ZWQoaW50IGZkKQ0KIC8qKg0KICAq
IFNVQlRFU1Q6IHZtLWRlc3Ryb3ktaW52YWxpZC1yZXNlcnZlZA0KICAqIERlc2NyaXB0aW9uOiBT
ZW5kIHF1ZXJ5IHdpdGggaW52YWxpZCByZXNlcnZlZCB2YWx1ZSBmb3Igdm1fZGVzdHJveSBpb2N0
bA0KKyAqIEZ1bmN0aW9uYWxpdHk6IGlvY3RsX2lucHV0X3ZhbGlkYXRpb24NCiAgKg0KICAqIFNV
QlRFU1Q6IGludmFsaWQtcGFkDQogICogRGVzY3JpcHRpb246IENoZWNrIHF1ZXJ5IHdpdGggaW52
YWxpZCBwYWQgcmV0dXJucyBleHBlY3RlZCBlcnJvciBjb2RlDQorICogRnVuY3Rpb25hbGl0eTog
aW9jdGxfaW5wdXRfdmFsaWRhdGlvbg0KICAqDQogICogU1VCVEVTVDogaW52YWxpZC12bS1pZA0K
ICAqIERlc2NyaXB0aW9uOiBDaGVjayBxdWVyeSB3aXRoIGludmFsaWQgdm1faWQgcmV0dXJucyBl
eHBlY3RlZCBlcnJvciBjb2RlDQorICogRnVuY3Rpb25hbGl0eTogaW9jdGxfaW5wdXRfdmFsaWRh
dGlvbg0KICAqLw0KIA0KIHN0YXRpYyB2b2lkIHZtX2Rlc3Ryb3lfaW52YWxpZF9yZXNlcnZlZChp
bnQgZmQpDQotLQ0KMi4zNC4xDQoNCg==
