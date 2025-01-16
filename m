Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CAFC02187
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 22:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CF810E39C;
	Thu, 16 Jan 2025 22:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zf7zHaLQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F0D10E39C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 22:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737065238; x=1768601238;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=asNYUcwnyZ6BdDmX7UmvheYWTEViR5bVqBsTjVbXNRY=;
 b=Zf7zHaLQ/BwW6B7GNsY2V2irH1ORpvBP/OXBBMEq5Ws4D7IdlPMa6HfH
 OOPOcoBiT4MW7XG+OEHdSGqP/wRe99AV98hSwLmbIjGystnz7fIK6tngW
 LaTR/nExRbp7PkJvmBHHHu63kW4pIZCf+r4adIA6nogIfSS+EhcNDPvIP
 ql/uSbYlkzOFPZVFIC9NjWjUb/539fff3a4hHRhdzua9jHFOgQmmpL6U8
 AJI0Lh6M9ZDvAb4sudrG9LsE7IQwX8hAiDDPp5O1xzoGto5nIF815oZVg
 raKXeTEer39ilym/O47iJ/sBVGN7lIxucKuhP3IIBlAnTz6wJToiD+VnA A==;
X-CSE-ConnectionGUID: VHa9wpyxRWWMvHUE95YBLQ==
X-CSE-MsgGUID: 3CXTJ2NKQTiG3DHPnChamg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37359362"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37359362"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 14:07:14 -0800
X-CSE-ConnectionGUID: Y7UqmU3OTwaNDQ6aw8+ETw==
X-CSE-MsgGUID: vI6r8g4NRAaF1lN+bkpXMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110612866"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 14:07:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 14:07:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 14:07:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 14:07:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4cxM/OCMiZoynM2tuIyFxbbK0h/XkSaTZieMBTd86BTO0j2aevfvCYQe7+VsOGFx6XAMMW8xQ6uOGFn/x4+JXwqQzGWrFMOqPibudWfBubkbQvLs+6r+X7PRswxtFSmT41eRBVzKbN5Qhxg103GgF3Fg60DVYd2E++V1jI0fmEJIDBjslqY4XR3BD/xzmBD/ZhhdHaNstAPtZchmPNiYWmkYVjpelcSlBqwAuFO9rxniF5dfOLG4Dtb3nGi9EL7Ea9l5MBm2DtWSm1MXYNJp4Yo+9Mc8FHhDni9zRlSDXxCjSpY+5LWGt/Flxi6WcAft4N2vONO2NNdBxoNgge3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asNYUcwnyZ6BdDmX7UmvheYWTEViR5bVqBsTjVbXNRY=;
 b=NFIJHP0Fpp8RzklAh8XqKfWlKrpmC3KWxjquLCXj4gw8P34wFFF5mj2TDYODNeyMnI6RXOs6f2OnfxAyVj2QLteMgOPKOpxWBWSnLlSLAFUGWVAEw1mz2mYN8sdq273OQAXLhTR+4qlD5LmYk2jNZkFNqKkPXWfFZwQJjS9SD7kUXA1URQWYw/yGuoQzH2MUS2zw/AJy3dRCKL7DTG7rksyin3zgl608HqZaMcIhMzxZeQx7DYMzzgBSZnyl2oj7zXoD99ccM7/hs6qJ6NdEZBEkJgSfJhD7o0Je1ifLjcfyYVamlcREA+zyC8n+dk+iVEdZjPe5XS7bBHjeIRWRsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by DM3PR11MB8681.namprd11.prod.outlook.com (2603:10b6:0:49::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Thu, 16 Jan 2025 22:06:28 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%3]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 22:06:28 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t v2 5/9] tests/intel/xe_exec_queue_property: Update
 first invalid property value
Thread-Topic: [PATCH i-g-t v2 5/9] tests/intel/xe_exec_queue_property: Update
 first invalid property value
Thread-Index: AQHbZ6x9KCts2w+tIUarUNTE7f3CI7MZ9mwA
Date: Thu, 16 Jan 2025 22:06:28 +0000
Message-ID: <eb839036dcf651cfc9276387e5cf498f794cf609.camel@intel.com>
References: <20250116001951.4159243-1-daniele.ceraolospurio@intel.com>
 <20250116001951.4159243-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250116001951.4159243-6-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|DM3PR11MB8681:EE_
x-ms-office365-filtering-correlation-id: 8df322a8-c7b0-4238-bef9-08dd367a06ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c2pFUjFrZHUxK3dkY3VpL1ZUclBkRW5xZW5zOGMyUzl2VHk1ZEhUaDlNTW92?=
 =?utf-8?B?TmdSWlBUREVnVWcwL3RJSUdJakZLa0tRN0h1S0VWNzhpNGlQN2JJOGFndEdE?=
 =?utf-8?B?dzI3dVllR0x6SW9USzhRMm1TcDFnSjBVWUNnT3BGbXhDNytkNVBSZjU3TFRp?=
 =?utf-8?B?KzFxbE5GaWszMVI1L2Rkem83ZllmQWQvcXcxT002ZG12Y0cvaTEzcGc0UitQ?=
 =?utf-8?B?bEcwck55NjNOTnJxWTNtRUtSRkluMkRFUk8vM0V1UGxFblk0ZVBxenpNakZh?=
 =?utf-8?B?M2xSZ21TY2VYR2pGMlNEK2t3c3JiRmRGdzQvTkxERXBuNlpYYTVDaEZQQlNJ?=
 =?utf-8?B?SnlKMUVUdkgzOWloSXdYUTEyd29ZZXdENi9jSFllZUk3VWpsL1hMczFGZTky?=
 =?utf-8?B?WlJMeFBHTjVhVVF4VUllWldKQnVGZTA5VlNRMVQwVXBsUW4zL3A2WkNSQU9w?=
 =?utf-8?B?S3JoUWFUZVJIaHB0V20zTXBrZ1doclUvNXNaVUlVL1NIQ0FFditNTVNQdnFa?=
 =?utf-8?B?a0RKV3pSa2Z6ZHlCcjFNUHRhekJubWJxQ1pQMmk5N0JXanp6WGJPemZYcDFS?=
 =?utf-8?B?YWljdi9aZmN3YkhYL0tncmxISlpKRWlpbnpOdXFkRXUvUDRrOVFUNkhZTG1i?=
 =?utf-8?B?MjBIcExTVTBha1d1YjlaQU1yekpOSDhTc2xvTEg1YjNtbGpwUXBvMHpZMlhH?=
 =?utf-8?B?TmpWbVFXQks3UWI2TmZvS25JbWg0TFEwWnFhbHI0eVB3RGRXaThFYTNpQXIw?=
 =?utf-8?B?dGdydjZMdXQwWjhQTmx3SEVOdldod1RKYkZ6OFI0bWc4QWpNT0FSSEJNZHZO?=
 =?utf-8?B?NjFtZFAxdDEwS1Q2SzRNRjJQdGp0a0piN1VnY29adTNZbkN0NDB0WG9qbWRy?=
 =?utf-8?B?RVNMMUJWaWJFbzBjUVUvWkx6K1ZVQkZ6YUV5L3RyOVRyWEpSYlN4cEh2WEkz?=
 =?utf-8?B?K3JZVm1od0VSRU9UMDl2ZEt6NFdEenpGc3JOZ3BXMlNtM2VxV1BISVgzK0t5?=
 =?utf-8?B?bitoWHhUZVZ5NGE1bTRmUWJlenk2UCtreXRuQVh5RHpXemdWbzlaVzFjREdF?=
 =?utf-8?B?RlUweU5HaXM4cExEOUhCM0VhNlZESjVXQ0hZM0syc0ZyNk8xQlJWVEVhM04y?=
 =?utf-8?B?V1RubW5uTHJzTEtDcmNSbzdBcjdURVBFWDJIeFNOQVRJZmpUUzRXOHM3NHBM?=
 =?utf-8?B?dGRhaHhmd0JSaVBoaWlsOXE4R1d2Q21GUEhWQUgvc3VPbEcxQklwc3pYYWdM?=
 =?utf-8?B?aHdhZm9BTmVpajhUL3JxSWkrL0FWL01zTFhqYkVQb2VoZTBDS3M0K2ZSSDhw?=
 =?utf-8?B?bjd5UWJwSENpeUZuUURJMHJPUWEzN2hBcDFwdFpyRlZncVNhV0dINnR2SU1H?=
 =?utf-8?B?MHVSaGpIWXNYbHJXU0oxRkZnb2FTTE1NbGJRVUd4TFZaYkZDZVlocllhSFQw?=
 =?utf-8?B?VDFXMVNyZGh1VXB2MlRwNDBIelNOK2g0MWxHU1g3WUhlVzZMOFo5a214SElt?=
 =?utf-8?B?WjJxT2FGNFcrYUVGNFcrVitvRlp0MHVIYmF2MkQzYzAyWEJMMXJYTi9wZkY3?=
 =?utf-8?B?YmJiNHI2T2R4aTRTV1F2clJjSmI2WUM3cmJoNUFTNUU1Mi91WktDeDd4WlJq?=
 =?utf-8?B?anYrWHdyUFFnNTMyaTkvRDhHa1R6YzIzRmMvUzRnQkg1MVhhSm51UEpodElu?=
 =?utf-8?B?cWdUZldQdDE1M2xUSWJ6Qmp3Z3ZLSkc0T3lXdThhdlc0ZnVPRHp1bUtGNG40?=
 =?utf-8?B?OTc2bS9DY213N0tnNFBPdGtGOVQ3TTlpR1lmNTBEaUlQT2VQcFZETDA4U3Q5?=
 =?utf-8?B?QnlUK2dveStUcEVlT05mdWRtbWVDVUlrUlNCTnZuNVNiRFplUzIyenJGeitm?=
 =?utf-8?B?WDAvUFE3a1VjZmNuRk1tZEVaZ09JZ3VwV2VXajMrZk05RzBNVldwbHdvTWFY?=
 =?utf-8?Q?b9YhBSrKCUCufeElOcDaB+l6pKEutg8Q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFRtNE1NTFpyK3paS0c4RDBZcU45RytZaVpoek9mUWJWSHRORG15azJBbUVM?=
 =?utf-8?B?Qy85LzJBSDhHRUxvOXJCdWhQU3B2cEM4ZEtmdlY3QldBaEt1MEk3RW1sSk00?=
 =?utf-8?B?L0VpZGpkWVZ1MGRTbkt1YmY1NmwrT2R1NGllZ0pCRjJIbUsyRXl5L1NjV01H?=
 =?utf-8?B?Y1RxTVJtSWVja1JHVUROcDdMa21ZRHdhSzhocFAxU25mdi9CeG1ZNlVJSHF1?=
 =?utf-8?B?eUxScEFiRjBWZUZsdVVvWlRwdzhtM2RIQnY0SUJSTjhSdjQwcEY4WXBLRkc0?=
 =?utf-8?B?RDdpbXhrdUVJUmcxcUpmNmxobWs0SjB0S0lnbk9XaDJBbHdDTDA4M29KRFZI?=
 =?utf-8?B?anNDMW4wK0lUWFJ3dDJCZlRpOWVYQjFoSmdDc3UxeEdnb0xyL3p6ZFpHb05Y?=
 =?utf-8?B?WUlRY1pnNjhJQlpvNS9hSXRzbUxMNVEzNjlDUmFCcVEwcktOZmpBS3pTNUYy?=
 =?utf-8?B?REpvR0g5N2o4Wm9KVnllejlvUGtLb1RldStoSVNNZlY4U3BHY0xOZG5wNTU2?=
 =?utf-8?B?UTFmcU1lSG9tN1MyRWx6VGtBeG9scmIraEVzOUdyV0VWNHVWQmo3KzlUZXpj?=
 =?utf-8?B?VFNBelZxZkJOVVVFTXFlR1BSYzJNZlREQU8zMUxBZTkyQ21hUkZTcmk0YTQ4?=
 =?utf-8?B?M0c4UW1US2F2MkFIcVFZaVgwNlVHYnFMWXRQZ1RoV0t6YVZIZHE3NEQ5WDVy?=
 =?utf-8?B?YUhJYWUxaHpDVWN2aXNId0JUc3RmZUtwODZJd1Vzcll4ZkQ4RVBhMlJWLzl4?=
 =?utf-8?B?SWRza3Mxc250SjByVUhoR3lWRHdZaVYzMy8zUDdtSWdpNE5iQ0NxaXlxRWF1?=
 =?utf-8?B?cVZ2NlRJbjN0WUhiVFZGeWV3N2FaSkRnOEgwQlAwRThtZDRhZVY0eG1peEFW?=
 =?utf-8?B?L20vRFpoaE5MZW1oT21GS21ybTdreDZ4YmJ6aFd4S21OUnZjbjliN0xGeVpq?=
 =?utf-8?B?NmZXd2VEdDFxYnlrbmFUWEx5L1pkK09SUTFDZWd1K3pYNXI0VDZXQ0hPWVJR?=
 =?utf-8?B?NmVDQkY3RFlXV1B3QlhsWlpQYjZsaGhaNEsrT3hNd3lQa0tWMzNGaHMyeUhF?=
 =?utf-8?B?Nm9CUjluN0phdVlNNEhWM1UwQThjU2gydkppNDJSSmhLZWYyQUd4Q3k3TnQ2?=
 =?utf-8?B?OWtDWlBTQW0wc0EvZndWeUJ5MjM5UkdxcDM0S084WWl5bzNaVzQrNENObnVN?=
 =?utf-8?B?enM4MjEzU1NGdDMwTE1DR21oK2lkamVybDNiMGsvYTdWcDJWUFA5d3JWZjBF?=
 =?utf-8?B?TStlQUVuQ2luRzhTUFVrdlk3d1lJZ0hZZFErc1pVTlo1a2tlVmxMVDRRVkFC?=
 =?utf-8?B?T2hQSkVLalFIYkNScTQxaHJ3aUdQbm4xYnVhNmdLTlRNTWN5QmFBMFJ6UnJx?=
 =?utf-8?B?S2lZM29Hd0lQUDUreDh5ZElIQkpKY2hyb25SazFCSjRLZUhEeDJEYjBjeE42?=
 =?utf-8?B?K2hCTVZBSzJrQWlOdnZpeUFmTkl3dGZpRzVNalY4TTFybXdScE8xbFdXd2pD?=
 =?utf-8?B?VmFKWVAveEZnNXpNc24waUxQUXhzaVJ2R3pLTjJ6bWlDL21OZzU0N2tVR05y?=
 =?utf-8?B?aWxRUVlBN3BPSUxFL0t6by94WkpYNkhPd1hNdDNOR2ZwdmN3dkRPVTVWL3Qv?=
 =?utf-8?B?MHRobnNvMnROaXFYL25LMnJYKytWN3F4TENzWWtBV2NiOXlKa2s3Vmdka053?=
 =?utf-8?B?enFsQlNsOGVCVWFhRGNTdVNNQ2VUL0VDUGpjNzlyTlBGNWd0SWg1U295WnAr?=
 =?utf-8?B?MFVZOTM4UE9kbW84LytlSG5QQXVabmpvc2ZMcWVJNXlzeXk0T3RNZ3ZUdmtu?=
 =?utf-8?B?R2Q4Z2Q2U3BLR0RwMHFBdlhmTHpqUW8zSU00djVuL29SNHlidnVFZ2d3UW5t?=
 =?utf-8?B?SlpReE9nYjdqMG1NeHh6TzA0Y0RUMkxEQ1lMcllLeXMxL2FQdFAwTXdpejNi?=
 =?utf-8?B?N00xZUR0NGlRZzJ0TVovVlBKQm14aFFJd01CZGtHbWJCZmZKbDB6UTdwYlRC?=
 =?utf-8?B?clRkeFhWYmgzcG5xVkZJNkhKdGl4Y2NrL2ZreXZnZ0lFbmZFdHhPZ2Q1ZmFB?=
 =?utf-8?B?R2VENUJGd1RQSWNRd0xpSGtWeUkrYXJCVGNVTDhXZVNndEp1RE1ibDQvek1u?=
 =?utf-8?B?Zml6OE5JRjQ4Tm1xQUZzR2J2SnEyK21HM2RSQkpiWTFQTU5FMmRoVG5EVUdG?=
 =?utf-8?Q?XgDnE95eAx9s3mFqArLkvWA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BC60CB22B9DE34884DED08A8283DEA7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df322a8-c7b0-4238-bef9-08dd367a06ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 22:06:28.6238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y9SHa2OpV5wpfFi2ap+Xp9uiqTA0bCc0cIokZmO6mZpI9EQfnJ/zYfo5WHQevBHXMWCXp7Vv94NYzFy/sOwjAnBHI44lDuDJ4K233dbMtY1Pi/BP/ad27My0cIyjxojd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8681
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

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPgoKCk9uIFdlZCwgMjAyNS0wMS0xNSBhdCAxNjoxOSAtMDgwMCwgRGFuaWVsZSBDZXJhb2xv
IFNwdXJpbyB3cm90ZToKPiBBIG5ldyBwcm9wZXJ0eSB3YXMgYWRkZWQgd2l0aCBJRCAyLCBzbyB0
aGUgaW52YWxpZCBwcm9wZXJ0eSB0ZXN0aW5nCj4gc2hvdWxkIHN0YXJ0IGZyb20gSUQgMy4KPiAK
PiBObyBuZXcgdGVzdHMgYXJlIGFkZGVkIHRvIHRlc3QgdGhlIG5ldyBwcm9wZXJ0eSBhcyB0aGF0
IHdpbGwgYmUKPiBjb3ZlcmVkIGJ5IHRoZSBQWFAgdGVzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
RGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4K
PiAtLS0KPiDCoHRlc3RzL2ludGVsL3hlX2V4ZWNfcXVldWVfcHJvcGVydHkuYyB8IDIgKy0KPiDC
oDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC94ZV9leGVjX3F1ZXVlX3Byb3BlcnR5LmMgYi90ZXN0cy9pbnRl
bC94ZV9leGVjX3F1ZXVlX3Byb3BlcnR5LmMKPiBpbmRleCAyNWE3ZTdhYmIuLjg4NWQ1YmNjOSAx
MDA2NDQKPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX3F1ZXVlX3Byb3BlcnR5LmMKPiArKysg
Yi90ZXN0cy9pbnRlbC94ZV9leGVjX3F1ZXVlX3Byb3BlcnR5LmMKPiBAQCAtMTgzLDcgKzE4Myw3
IEBAIHN0YXRpYyB2b2lkIGludmFsaWRfcHJvcGVydHkoaW50IHhlKQo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoC8qIFRoaXMgd2lsbCBmYWlsIGFzIHNvb24gYXMgYSBuZXcgcHJvcGVydHkgaXMgaW50
cm9kdWNlZC4gSXQgaXMKPiDCoMKgwqDCoMKgwqDCoMKgICogZXhwZWN0ZWQgYW5kIHRoZSB0ZXN0
IHdpbGwgaGF2ZSB0byBiZSB1cGRhdGVkLiAqLwo+IC3CoMKgwqDCoMKgwqDCoGZvciAoaW50IGkg
PSAyOyBpIDwgMTY7IGkrKyApIHsKPiArwqDCoMKgwqDCoMKgwqBmb3IgKGludCBpID0gMzsgaSA8
IDE2OyBpKysgKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBleHQucHJvcGVy
dHkgPSBpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydF9lcShf
X3hlX2V4ZWNfcXVldWVfY3JlYXRlKHhlLCB2bSwgMSwgMSwgJmluc3RhbmNlLAo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRvX3VzZXJfcG9pbnRlcigm
ZXh0KSwgJmV4ZWNfcXVldWVfaWQpLCAtRUlOVkFMKTsKCg==
