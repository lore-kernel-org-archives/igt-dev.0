Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08ACC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 11:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01AC10E6CC;
	Wed, 22 Jan 2025 11:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdxROgaU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0AA10E6CC
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 11:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737545913; x=1769081913;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=WhY3B9QoitepqLeRucqaA71xzdLMHBkz6BlYJXBMhZ0=;
 b=RdxROgaUURsyZ/WMma4bWO7cveYaARvoI3eh/HInn+oJtyLRSAwFn/hi
 0R8pIHp443wwA/QMXhqUqXL0ivg1ABuecDZJH0T8nI/fwVq1zP0NPGQNV
 19Uic94XPm1q371jMbNH3GSQCe2jFbwAFiDrHn7cCubb5zTnFw1JF6Uki
 NN3PPAl/JsxyYKDlI458KqqCcqHIg/fWm0sUZQvU6cJ22SDMG4TtgZ4Ml
 V0UnNXBTtyFQD7rSQwRroKrsqL9X6Mfn6uA3/wlR5FhqVPdVRNwFdqEE5
 4RzIvRob7fxxElqGjVlIEX7KfpiGvGH1S4g+Vwm+1p+a9veI62kFcCwsV w==;
X-CSE-ConnectionGUID: L6SlJYGsSrSCS39SJhYDnw==
X-CSE-MsgGUID: RGL1bjvxSgqvkC9COfMIxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48594120"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48594120"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 03:38:32 -0800
X-CSE-ConnectionGUID: OUM9ZIoKTOqQBJeOr8YJwg==
X-CSE-MsgGUID: 17g+P32sTA2d9f6lw3mt1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111145507"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 03:38:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 03:38:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 03:38:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 03:38:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dv1K7aESWNghsalO4KUCw7UUy/+NLSLVK4zcCaHxAG1LKI6bDRSfdyr5GlkSgJW+mTSDaobnIoADjpZv+ajv2ZzREVb1rbGLIRUImaJ7aegTs3bV/+tFtWSO8AS6MYgKC+lgvowTmfHCd0K+EOhc64iV5ywnaVT0tnjgHg0fnFEjAIM/TT+3dLdzMXaQJE0vCP1KakQZaFtEw/OtVJivnxiAzTtLCW3WGvoIA/XQQueBmekmYhmTj4qQ80c4cqAgZAf1xPz0jHjK+TGZKoOW2w7SLzeNzgmjOLxdZGRtLueM3djvYQ2npDpAu6h9wPGZV+pt/yqF0Fp0MBLWtC9KaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGpWZWM1BEbrN+bSPPT9qzeX7hWH5ZvodckZFMU3nJw=;
 b=AoXkZoxOJyBRtRtp0JXTOkphCLVnMu1VxozphVEUgihJ8kyIr4aJ2+fEJf72h+z3wtxG7DyITaLSqbPyKaDzLW8nKlXo2DYfTlbtyXLCzPvNmlb3h/hI3D8luoI4kUaXELKO5rdxwFZm3kzXVjJcfRzWcOhRWxDETuBuTMmEGaN03qJc/RoOdTGkuHWw0bw5G4fE/z3+Dd7VxVEHAetzL6qtWPR14BFIkn4mOHmBgx65f3b2PTkB5ItRD/Ddr6sL2+8cBQiaE9SZ7m78G51RNeoTXm/xYmoqwTl6TLf2q1wmC0qAaTQ9gA3gPhBz0Opo9pTEhMCmX6lJozVq0J7pSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 11:37:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 11:37:56 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250121225733.808978-5-lucas.demarchi@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-5-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 4/7] runner/settings: Fix code_coverage_script
 leak
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Jan 2025 08:37:52 -0300
Message-ID: <173754587225.5500.1182733749364345922@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0340.namprd04.prod.outlook.com
 (2603:10b6:303:8a::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 75524c27-e4f2-4dbc-4192-08dd3ad93726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDY0eTBLRWc2QU53VmdHU0dCUzliK09EWGxRNURQeDdjdmVXekJJT1RtbUV0?=
 =?utf-8?B?NUhNS1hxMXc1RUJud0Q3WkxnOXNqWWQwMzMwL2ZOd2Y2NUd0VERKU1VxZjBa?=
 =?utf-8?B?NWhjenI2VFJFc1AzUUxwUmZEUHIvUUQrQXdpOHNZOVc0dk5WV05TdUREam5R?=
 =?utf-8?B?Q0NhNzlwcG1Oa2tnWktyV3MzcTZvT0drWXcrYTZKcDlxM0ZUUzhtZ2pqWG50?=
 =?utf-8?B?TmhvNnlTTWVSdFduWEhEWUtjWkw1MnczRXVrYzExajNjNGV0a2hJNEYzS2lx?=
 =?utf-8?B?cW9FSm1ob05UYUc4Tmp0MFQxS3pOdlI1b2dTank1K3BkeXRvdE9YQm9CbTRZ?=
 =?utf-8?B?ZVlUekpudnZJMGJ2OUhCTW5PNHdveUxHUDN0allzRjhpajBwaUwzQWw5cktZ?=
 =?utf-8?B?YWx0MDNzQWtmT3VUZTlLclZEb09RZVF2anlaYTZyLzdQRE1sQkNyMUlscXY1?=
 =?utf-8?B?UTNSaWNVczBybWpBVjlqbUsrYlp1eWx5N3FvRlBOMzdIV3UvbG83cFk2bEtG?=
 =?utf-8?B?Z05SVG1HRmVwNUhuTlJkdW0zZkhZTHpSU3U4dm5lb1JJRHhoQUJobU5qRlFj?=
 =?utf-8?B?N1VQdGtrYUNQVTBWZlhQZ09hanZxYmZMZnROSi9oMzZ2eXJTalp5cHBwMEla?=
 =?utf-8?B?a3Jib3lhOWNOVklzSlhkb0pPa2Z2VEFqMmFrSHNDU1RUMStnbGhOU3JQYWdp?=
 =?utf-8?B?eUNqMzViZFRpUmRiWUJJQXB0eVVNcnFhdGtiaG1rQkVyT3phMmxZME42SlNI?=
 =?utf-8?B?bTg2M0I5aUFWdTU5WWZialZGcy9NMGM1T2FHbEx4NmtHUXJITWdRbjQ2cEpj?=
 =?utf-8?B?M213YWZTTUp5RUFGOWZzTDNlZElLMVpOd041cW81Q2VBNG5ybCtORnhTRFd4?=
 =?utf-8?B?MVJINXBJTVhsT0pqTjROT1FZUWwzZlBIUjJwaEZhc0w4STB1SHczaVNpdGJP?=
 =?utf-8?B?MmRhNi92K1VaelhQNXRiNzFLZjdibWt6WE9PcG1DVXZ6eDlSY2JWSlJ2VXIw?=
 =?utf-8?B?UmtNTW1QMWJrUExRd1N2cUdwVVhFVEhEbUR2WVAwWC9WZGtzOFF1dWlqbzAr?=
 =?utf-8?B?YjdHd1FOeURsOTVTc2RlL2RoZHdHa2NIQ0o3Z05xRkZHUWNFSlJjN2I5Vi9X?=
 =?utf-8?B?YlRvWlkyS2N6eG1weEVwYWZlTjNiSTVOTFZHbFBLbWM5b2hTVFU0MjRYTDMx?=
 =?utf-8?B?SHdPY0J4YkNBMVBCdjBRQnNOek02T3RBcGJPTy9BSkd6aEtJWEhldGlCei9D?=
 =?utf-8?B?WUppTVlCWE5HMHFWK2d1TEU5ZW9BNGVTVWU4QmtNbnlveVhrWE1tdFMyTFk3?=
 =?utf-8?B?dnQ1OFpuUkhMb1lpa3l3N3ZtTXZJeFJVdkxFWWdmY05vTXJaRGdYL0VBM0FU?=
 =?utf-8?B?aXU0UzlON0Q4ZFB6cTJCYjFoNDNHVFlIRnYzTlpsei9YbmJrMTNHUk1mQnFO?=
 =?utf-8?B?UDBRM2xSZ2ZhVitsNWlwcU11U0Mrdmc2NlpiNFE2ajIwTUl2dVVoaHBmcW1V?=
 =?utf-8?B?Y3VFNG9VajhSNW0rek5nUGNwMXBVS3kvMjJEZ3lQbVBTVlpjQnlHTWFGTjFl?=
 =?utf-8?B?Q211Qm16bkZoUWlOdDNWaDgrZENsZ3lubjg0WFFLbUVVMU5oSGxOL0VNcGxs?=
 =?utf-8?B?WnV0Z1hTU1k2TmFqMWVZZjlRdHh0MTRYdzdmeUlZYjNGa2FubUVseWdCT0hq?=
 =?utf-8?B?a2JlWFI5R25hYjVWL2p4TzJEQmxPN0ExMDFuVU9FSm9LbnF0WGJQVUJEQy9y?=
 =?utf-8?B?Wmh3MEo0enhISXJUbEVTdmwxVG9wdzV6Y2Uxb1BsWnRlcHppVVQwaWpTbzZj?=
 =?utf-8?B?d0hYdEl4bkhxZnVURWprL2RxV2p5djEwR0Y1WjVaTWdGVFdHUHgxMzhIMEp6?=
 =?utf-8?Q?RX4rcEUZeDVqu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUxZUEtTaGVWZ3hNMitVbWxrYWxTSENITFVyMkgzZEl1ZEZhdUE4V2NFaVht?=
 =?utf-8?B?NXhnci9DQlZwYlEzcUp1QW1ndnBiSkgrN2NmVXJvVWhidGcwNlgxbmVING1u?=
 =?utf-8?B?UTVyOG0ybFlIY3pUVDl6d1EzN0w0RERWS2NHRGdCNnJDcVZ1N0RaQTI5bGlm?=
 =?utf-8?B?aXdzTnU1VXg1K3JpRXFXWVBSOE5ZL1hFQjBiL0NnNjR2L0x6eXZNTURTVTMv?=
 =?utf-8?B?bGZDV1JkampwNVloMjlRVm1DL29ZU1dBUlFBRmxsQTBleFdydEFoeUZtcG5V?=
 =?utf-8?B?V3lRRUVZMzBTZzJRL2Q3Ym8zU1VJakEvekN4RmNtZ2xQcUFJcm9rbGpQK2NM?=
 =?utf-8?B?VEtDTGxvZ2pQZU1UNHJnTHRvK3EzWjk3K09HWnY0QkZKTU1sbTg3Zi9PS3Uv?=
 =?utf-8?B?WWpma1JwUnB1c2JWemo4ZmVmUkF2SjV2SWM3aSs5OVlxS2paNWMvQUFTUUpY?=
 =?utf-8?B?YTA1L1RDaGFoUjIxWXVzVlMvY2FDQVBiTHBPc1paWkhqMXVQU21tb0Q3Ylhz?=
 =?utf-8?B?Q2dCMzJsVXQ3S3NPUHd4c0FQOTRYd0s5OUNuL1kxQ2h3M25SYVJGZGR4enl5?=
 =?utf-8?B?ZGp2Qzh5NGNxMm4vNzR2cGVWNWppRmtOQzFYa2VkdXAvSnF0Q3BVWktLOFlQ?=
 =?utf-8?B?N2d5YzZQSmFDZTl5ak1Hd2YxWGlCRzVWVDFTVkZ5ZUY5RTk0VXRVNmEybDha?=
 =?utf-8?B?TTJyWitoTFpNQk9NbHhuazRTTExXNFhTNjg5YjBsRTcxR24rQUxUOVkwTnBS?=
 =?utf-8?B?WTZUYzRhNzhGOEwxOWExQXlZODM3Yk9VQk9OaFdod3lRRkFISVNEUEUrK3Z3?=
 =?utf-8?B?OFpiYmxBVE5oQ09kN1Y1Qk5nYVJ1ZUwyTlVnZy9yeGtLRklnMzh5cGwwYUJV?=
 =?utf-8?B?ZG51YjJNTXRIbUpWWFhoTDN2dWxVNmdGODgrMVJyTmRpSW00NTFyUzE4akZU?=
 =?utf-8?B?b1dpbm5CeERxcjJaN1pXdkRDQnd2RFg2NklZc2xUVWVORXRrSkdyVmpDN3VZ?=
 =?utf-8?B?dTNoSFg3YU1XMTN1VGxMU0ZkdkcyQnpTdUo3cVFXdTRsNDQvSjBFakVZVXpq?=
 =?utf-8?B?M0J6VGxUbmRmODZ1Q25takhmMGllVnBYVUJnbzhUKzVtemlUcG5lN1p1Uy8x?=
 =?utf-8?B?bUNsSlgvRmJ6bVlmRzRDbDJLWFhFbyt6d1VIdlpDWjhwSmJNU3lnaE0xM25N?=
 =?utf-8?B?NnlOZFVRTHM3ZU5JVzFXLzFHZTRVbkRncWNWakRSSU5nZ1QvYndPNmRKWVk1?=
 =?utf-8?B?cXJqZU5VUFRuYlA4eWF6S0JUWWhicFNFSVBDZy9NWVNvejI0TW85SXRERnhq?=
 =?utf-8?B?Y1FEU0lQYmwvd0xzMUMzdm00ck5FMUdieFRyVzBadEJRR3Q3anlTWUJSbmNj?=
 =?utf-8?B?emo3WFU5aEdWcW1CYS9uR1Z1dmxtTUMyWVBKU29ndjNIN2E3TytSMkQxSUYz?=
 =?utf-8?B?Vks4VXdac3lkQkFIMUROekZjQW9wSGdOWDJFeU1zWHhEL1FCaUNoVG8rMEhL?=
 =?utf-8?B?MHJMWFRWZ3Y2dUo5K3h5Yk53RkFrOVV4QzV3MFoxbTZnYVZYYmZSV1lZRnV2?=
 =?utf-8?B?SDhGOWlmd3Y3dHZpbGUwNEJuYWZ4RnIzcTVxaHJXVERjb29CUjRydjZLdDNQ?=
 =?utf-8?B?TmhHZjk5TURwb3JKUzg0TFU4V0toZXM1aklLNDFyU3Q3Nk5PU21RdkdBZXJG?=
 =?utf-8?B?bm1zOUtkWitET0t0S2ppcXB0ZEJaVkR2NWFxMDV3S25HRks2Z0JBazdPbTJ0?=
 =?utf-8?B?Q3lKU2V5R0hqZkZFejlyR1NGU2h5U05sOW1XNEtJZmsvVXZqMnhra0pZOWNi?=
 =?utf-8?B?em53cDhuVnpnTjZndElnTUh3b292Ny9nVjAyMlZpWnZ0MmpyNFhxSmRmRlNE?=
 =?utf-8?B?bDJ0Wmlra3NPRFpwS0M2djkxQzFTcHlDQ1A3VjFhWlRrWjE1RTFwa2hFNEJX?=
 =?utf-8?B?alEzZ0lNMGthbE1uNWZPOUUyRGlBZzYzSEZZWVppSld6UXpndHZoWm8yUmlh?=
 =?utf-8?B?OVJsMS95YWh3cEJEVFBrZkZORW80dFJONUg5dWZ2RE5CVVRVc0NoUnFnWEhh?=
 =?utf-8?B?Ry9SK2txTUhsbS9uZUZJakwvNlRPbTZRUjErNDZ5ekJTT0IwWE9TQnNuZ2U2?=
 =?utf-8?B?SWxBdWNwQ1JrZnVRdlRQTVQra1FIN0xHLzF3V0V3MHR0ZWpYUUsrMHJYK2ZD?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75524c27-e4f2-4dbc-4192-08dd3ad93726
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 11:37:56.5034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMCyjkFGGTdn0z5yQ2BYXW6mAw0YBO7CBN/tASI4gS1XUEnKZY3SuOeEvXXtd2IAjAf/XDjpMP7LvQaD+8RWSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
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

Quoting Lucas De Marchi (2025-01-21 19:57:30-03:00)
>Make sure to free it when clearing settings.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> runner/settings.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/runner/settings.c b/runner/settings.c
>index 96377f1de..2787869ee 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -640,6 +640,7 @@ void clear_settings(struct settings *settings)
>         free(settings->name);
>         free(settings->test_root);
>         free(settings->results_path);
>+        free(settings->code_coverage_script);
>=20
>         free_regexes(&settings->include_regexes);
>         free_regexes(&settings->exclude_regexes);
>--=20
>2.48.0
>
