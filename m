Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5442BCD37AE
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 06:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C772F10E671;
	Wed,  4 Sep 2024 06:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmH5PTVP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088BB10E671
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 06:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725432209; x=1756968209;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ngmQT6cOFOpnm2vvs+/rb4ozLOygof7tgFrfQlJ6bX0=;
 b=CmH5PTVPjpzL8rIEO31mUPSUBXFsgZIwLxrPeu+Qfb8VUBb3RsAl+RQW
 p6S6Kj1Rovu6rDdC4aE/TIjqLN2JycMr0yLM+rWnsPywxJlgLFfxDMew7
 zMD6F11uWlY8LXgErsFdDH8G5P+WD6Ub6xuKE8h/hqHUvufmAEIEyYLoe
 KN8qBGJkDke2kBphg/e8bXDRGna7C4LiPjj/YU9BS1qk4tE/xyVmnY3RE
 zZq4S9xFEOX26RIZPMHcoLcAlYfl1pAIYY25fcmSQ5pAGFHOPDbxZgGz5
 GW4hZu1hpzoPl1OUBviEDhdTxOHGwYmPUg3iwv4E/PaaxpNuPGfyZJa2Y Q==;
X-CSE-ConnectionGUID: 0PezhhhdTzSn2kMcLNDt3g==
X-CSE-MsgGUID: f1+k01lkRcCLaqFNJP6W2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41568325"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="41568325"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 23:43:28 -0700
X-CSE-ConnectionGUID: IoRDX/cUSRCtErjJ/vqt4w==
X-CSE-MsgGUID: GRklZKndQXOZdpSx70MKhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="69328973"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 23:43:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 23:43:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 23:43:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 23:43:27 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 23:43:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYwIafEcT/pLe67ql+nvTWeYeEgxDKhC7ZjGm9R3So/BsDsekKi2TbFUTuJ077Uoj21sbNUmpTmBbjkQ9A/EBhj0wPHl5Ki70PjEa1aslPRmDzux9s8lgJA79v0IOY9MmW34Ji+OsS/WfoiVQw7NnOcyC2KxHodwsInKDxLNL4Eq7qaj+o5TqlfLqJ7FRfSOPLndydTiD7N17GD3nINloT7Ag9RUS/bvmjN6ylvR42m6WhhuNVAC+KXFZg0ZDA2YHriTU8bAVmrp2dJge1SqrkwVBCtjii5X1O2e/ujhlKCGeiWJvaRxJAKHqoUyhq3ZGI0AULpgqy/Iu3JT9yV+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngmQT6cOFOpnm2vvs+/rb4ozLOygof7tgFrfQlJ6bX0=;
 b=hGut+Yf0pNLLjmLTWRXmrKXa11ZT1V/YH2zz3eWLGeR7abeYSNJKCAiR6r3deZNDWGMLOCEJeC1HuKbqjnuF50X0kBR3XShAq+DYySvR3OZXHh+3DbOMPMPMmjZP2B8bWxt1CoB1Fk9DNiF9FTsMTim0jFYjpL7HOE+5+q5kRoy24v4ha1Q76T/ro2CQ9uOsfdIO5gjHWZB8DodJ2jp09tnIHi7cNzsO9B57jdyywLGC9/Win07IV4py1KXoENajcjA5DKJDZAKTlgdz5eNI8T7CK0s4azy/j3oCn0BH5fF/RbyM/2Zs64Gap/KrKKIGMH7pus8dNw8n6Uu0EC+T5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.25; Wed, 4 Sep 2024 06:43:24 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:43:24 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/kms_psr: Add condition to check for
 eDP output before asserting PSR update
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/kms_psr: Add condition to check
 for eDP output before asserting PSR update
Thread-Index: AQHa/jvbCj0Xuu1+pUeEdDZ3jCprI7JHLwAA
Date: Wed, 4 Sep 2024 06:43:24 +0000
Message-ID: <05514e2b77b05de55cb253ef729227a0cfcb22d0.camel@intel.com>
References: <20240903195917.1527829-1-ramanaidu.naladala@intel.com>
 <20240903195917.1527829-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20240903195917.1527829-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MN0PR11MB6057:EE_
x-ms-office365-filtering-correlation-id: 898ea346-b8cd-42d0-e493-08dcccacdfcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RUxTeWFpMFRZTGUrZkdISzF4MEZWS0RYK2lBdmhUTkFsRmxiQTFPRkpjRVA0?=
 =?utf-8?B?WHU0eTFYZmw4b2ZLK0VLWEluVTFmT1IxSFNld3FIRCsxSWg2aHlTNXRvdXpH?=
 =?utf-8?B?NzNEeTQ0L1Y3Q1grc2MxYVJiR3YvalVKdTNrZ1hhaUtMa0g1YWdrRVZ5cUlE?=
 =?utf-8?B?V3JVYlA0ZmhjcnNKS0lOVmhQU3JId09mbUhyTkQ0Mm5RenF5VmZzZ3c1UEJE?=
 =?utf-8?B?Vjg0a1N0d3ZRYTZSQ2JoWTg3dlc2U2xYdVE0a2xmNENHMngrOXNBVndQbmhI?=
 =?utf-8?B?bU9LZiszMjVVK2UzWVZob000c1pITEVjbVVUQkltZ3cxaDh3NjVkaTlwMDRp?=
 =?utf-8?B?d2xOQzRkTXYvNC9xTzFRQWZTWnBNV05UV3phWjFzNzJXM1BmcUtZZ0NqSEFZ?=
 =?utf-8?B?Z3VWWEx2a0FXZFlnbFVZZ0locVpCUmNXczhraHZvVGtpSDJuNkUxL2czSUlV?=
 =?utf-8?B?dlNjdndzVjd4TkJ0eFNxeEFBU0llS201SEFjOTM4VGN6QkhwL2RYaDgzTVVy?=
 =?utf-8?B?U0NmN21ObW0vYXRoY1EybU05dk0wNGdtalk4SkFYM0Yzd3RYa3VQOXlEWFpY?=
 =?utf-8?B?TVdmYnA2OWU5dGNsMkg2VjVSbUZXZUlZc01QbFJ1UXk0Z3JwT005ejRuS2Y5?=
 =?utf-8?B?YjdlU0ZiTE9lNlhmUEp5QS91WG91bHZEaXc5OC9uTmxmSnlLSFdyTVhvNW9K?=
 =?utf-8?B?TDMxQzNNQzA5ZkR5UFdXbXNoaDVXS3NrZ043UTA0M01pQWpwNUl1OXJzbG9Q?=
 =?utf-8?B?TVJoZTlFczZaUy8yOWlzZEdncDRtVkNndUZ5YkFRY1h6b0MwbVg5UVB0OXI1?=
 =?utf-8?B?SUtxOXpBMHhSV3ByZnVKYmoveTBCcVNzMXFtUTBlT0ZZa2ZJQVAzd21UQjk1?=
 =?utf-8?B?c2txZDJiVzkxQm9RRWNsZDB2OWc0MGNiOUloOVM5QkNNTmxtQVFyOVQrT2VV?=
 =?utf-8?B?Nm0rb2dPT3dRQUF2T0RIQ0V3MTNlbWJ1RmFkYWNxb21GYVJCcWtFTEM0c0dX?=
 =?utf-8?B?RUxLUGN0anJ4cFFZaXpQR0VyaXdnZGNQL0NJZ3BZaXJZbG1MUmR2NDQ5Undy?=
 =?utf-8?B?eDJ4MWtBbmNKWFM5RnFYaDBDMnpWbEt3U0lKZ2F6MjNpRDdwdUk1ZHYzd1Z4?=
 =?utf-8?B?S3YxK0pDRXFRUjkzUGlHUTdPb2tOZ2VDMjJCNEl1Y3F6ajJFa0hSTHpUcnYr?=
 =?utf-8?B?STdaY1JvTjhpMWJxRHpwbVQrNGVITDlXaERFRUN1TUZlQlRwVjJiVHZ3NVU4?=
 =?utf-8?B?aEJHMWRvQWlnS1cxRmZIdVE2VkJVcHVyY2dQeTJhNTRjSm1iMjNiMUlCMjRn?=
 =?utf-8?B?TW9vOGhISE5BenVFbmhsdFlPVGZxS2QzRjEzampyemU5Ky9IVm0vYWNlR0xp?=
 =?utf-8?B?VFMvK2w4S0NZbCtsamNwRDJVTWxXc1VvTHZiRkRRVGVzOEUrQ25PamplK1h0?=
 =?utf-8?B?dlZldk1LczRRL2I1RU5jdEFvTVFoLy84eFQxVkpyMHlZWkJHcE90UVRvK29C?=
 =?utf-8?B?bHo3VjF5cDhtVEFkQm1sUnNrR093N2xJUWU5SU9iaWlxcVg2VWRQOHNPR3M0?=
 =?utf-8?B?OGpRekhObUVGb0FPUjNuL0ZVMU9pNmdubGRzVHA0Z21USUMzMGtyeUk2U1Az?=
 =?utf-8?B?dUk0NStwRXp3dTA5M3F2d2VSbmRjNUpqb2pVR1VFQVFadE9BZzZBbnhYWU5G?=
 =?utf-8?B?a0VreVd0VWFOZDFaNVdiWTF6Vlk2aHhhbTBoa0llUnRTQTV3emw4bHRmUkpW?=
 =?utf-8?B?TVB0MzRuZzdUMGVxSEUvV21iVmZhZlpWZ2xyOXpXMm42bzdkbzNZdm90Q3FK?=
 =?utf-8?B?WHJwdmZoUFNMTHNZNHJDdHJFMVh5VWdxd3M3M0FpNmNzV0lQdjdBc1I2YUdX?=
 =?utf-8?B?eUx3UWZ4MEVOMzRQMEdjdjQ1UTQ5dGp5dVJ1TDFmVUNvTmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkZ3UUIwV3FQNHc2cHZvUFlJNG1iTm5QRHc3RlVsODBGaGplT2J2MVM4YzZX?=
 =?utf-8?B?aUFVK2ozZmZzRXRUMW5DYnlUY0JGbmFtdlhzNmk4dUxyRVZsZDFuRE9ScGg2?=
 =?utf-8?B?RVRJNkdDVjRhU1JyU0ptckZ4RUcrNm8zdGVSaHNTMG1lMWNzQVdnblNERnJN?=
 =?utf-8?B?c3JoNjcxYmdWeGVybDhRdGl6M3NCNUFQNm5aeFlwYVJpMjBHM2g2Q0FJTG1Q?=
 =?utf-8?B?NkVFK0MxWG9UNUVpR0FiT2dwNlpTRjAwc0FWU1pSU2FYVTBoTnU5djVsZStR?=
 =?utf-8?B?ZC82RlhRMitoWGZ4T2hCK0RJU3piMXRiYnBnZGs4RVN1SDJxbENwS2wxdHE5?=
 =?utf-8?B?L0xpdGtLM3NKRFZtaVhzUnZGWGl3WXJsTi93Z2Z5akJpN2VYQWJPM3RMN2Y2?=
 =?utf-8?B?dFJaNXNtRnp2eEk2SG0yREpMVjBFTDVsOS9QUzNveENoVEZRWFZIL3h0TkNr?=
 =?utf-8?B?Z0UreUFXRTdvUTY4d1NMS3pYZkVyMncveFQzbFBLdFg0ZlhCTXVmeGNlRDh5?=
 =?utf-8?B?WWVpclVGSHRkQk1xSlU5ZCs2cHkyWUlyZVJISTNWSURGV1VUQ2VKUE5UTkdE?=
 =?utf-8?B?TG1FeTA4cjMvQUxDa1kxZWltRThGaHEzZUhLcjFFRjh3WnRSTVd0TFpEa1VM?=
 =?utf-8?B?emdUYWFROGU2bnFidDJIVDVjbUVRSzBycnRDdjkrOHJ5K09CYmRWYmw2S3NY?=
 =?utf-8?B?YU1KbU15cUpMNElxSHloQ0NWdkZpckhmM3NrZktLbGtVUndkN3d4YU1FbDls?=
 =?utf-8?B?QkNiUEhBUG9BL1hNaSt1dHBzdU1tanVqbkpPdmZueVBnTkR0aThyOXBxRjZw?=
 =?utf-8?B?dEUzcDVLRlROdUZhVGZ2VExWaXFwQVMzV2xreGhNc3NubVJrMzNSaUd4UGlL?=
 =?utf-8?B?QXE0U3V6VlBUOVNZOW5MaFZ2L0hySmptRVVVa0hHbUJodnRoOFIxMnFzYUpC?=
 =?utf-8?B?Uy9zVnBUOGhLdG1RV2c2SzVzM2lxZDFZWVZQVXF3bGs4WDlhTG1xUmZQZWlu?=
 =?utf-8?B?ZC9RUnd4TkRxeFB0aW9aRWNpQmdQT3BIWTZFWXVweHd0d3QyOTdWU2U1QmFt?=
 =?utf-8?B?ZGgzcVovRFpMK1ROY3F3czg0RythNnh4d0hWUHNHVVJNTWlLVGY5b1hqV1oz?=
 =?utf-8?B?TlpPYjZ5Q0FIbkxBYXllZ0VORGhTRkJTcytES2U0SkJnbWNldTl1ZEk5N1dh?=
 =?utf-8?B?R3RtS01SaDlrdmtDVmh3VUFHcjhPRjM3UjByYkQ3RUNMQ29DanJhQ21zTFoz?=
 =?utf-8?B?Nnd5dkI2bWVybDcwc1NmazAzQXo1cnE4WXQ2V0oyUnc2bEEyV0Q4U2RjTG9r?=
 =?utf-8?B?SFE1R25pdDEwdlVsT1pFVmt3RDVRdU5iN2dmK0F0V0QrL0dua0t0KzZMcytp?=
 =?utf-8?B?NVh3YzBBbzBVTlZkU1V4MXlXNDNsQjVtVGNWbjZnKzliY2ZQcGRHTy84SHZW?=
 =?utf-8?B?U1hTOEg3N1dFWWtqdXN5bkNQVjZDRDhGdFNQdm5RdmpxbzJwTzFyVk04dFlZ?=
 =?utf-8?B?T2Npc3gxNnR4U1dVbi9LMExHRE9IZm5Gb0Z5NFRMLzNaV2xzSnpDZE8rdHBQ?=
 =?utf-8?B?SUFMZ3FOenJFQmhMWFhNbG9WQ3YvSjBrWnpMemJCSThtZC8wdW1ZMGFoeWJF?=
 =?utf-8?B?UVhuRDljbWZzbDFETWk0dU5lZEtZUElRUE00TlJpU25OVldITGVUbW4vQUFz?=
 =?utf-8?B?S3dIY3RFVmQzVm5YOFVzWDdFT05QNjVzWUh2bnFRcjFsaktub1k1ekQyVzUy?=
 =?utf-8?B?Tjl4YmY5ZnQwQnQvRi9aOGVrT0QvSURua3gwTFhwUy93Y1J3ZWFyYmVBYVJ3?=
 =?utf-8?B?UFduN0kreHhVV2N6T1NmUHBLcXFKV3pNVVo5cjNlWTBxUXNlWG04dEJ4a1p3?=
 =?utf-8?B?d0pjeHVWVGJiMExhTXZuSjNHbVlBOGhQOXRZajdGYUJWMjQyTk5JSHZFOWFP?=
 =?utf-8?B?TllzVUJ2dFFJTGlEdzZNa3lMRjYxUHR2bEp4Y3RkNjFhc09waWR2NGRycE5B?=
 =?utf-8?B?MHUzNmh0K0VoRHoxR3dpV05tR2ZSbUNsWm1uYjllektKQnhZRWZ3OEVVcTkw?=
 =?utf-8?B?Y3JvN2NRNkFWYk9TTkRpNCsxQmxQZjB4VnBST0dlN3BJd0l3U3k2WE16VGJl?=
 =?utf-8?B?MmtLa1BpeW9aRGEzdFJLLzEwdXo2eXc3cXJpL01aNXZyV2VSbkNKMFNlazZv?=
 =?utf-8?B?Vmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F40274EC3848DD49BC43FC987AC22C7A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 898ea346-b8cd-42d0-e493-08dcccacdfcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 06:43:24.0836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mHfuMX0ea+W8KKZ5fJaophPYyOSrxVcvR1CbEWccR7a/6i6g+5EX3KGKG0fVxC0S8gz+rTqeU++sK5Gm//X/cEcLXX0/XfhUcqcJQkzsp9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
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

T24gV2VkLCAyMDI0LTA5LTA0IGF0IDAxOjI5ICswNTMwLCBOYWxhZGFsYSBSYW1hbmFpZHUgd3Jv
dGU6DQo+IFdlIGRvIG5vdCBoYXZlIEFMUE0gb24gdGhlIERQMi4xIFBhbmVsIFJlcGxheS4gRHVl
IHRvIHRoaXMsIHRoZQ0KPiBTUkRfU1RBVFVTIFtTUkQgU3RhdGVdIGRvZXNuJ3QgY2hhbmdlIGZy
b20gU1JERU5UX09OIGFmdGVyIFBhbmVsDQo+IFJlcGxheSBpcyBlbmFibGVkIHVudGlsIGl0IGdl
dHMgZGlzYWJsZWQuIEFzIGEgcmVzdWx0LCB0aGUgaWd0DQo+IHRlc3RzIGZhaWwuIFRvIHJlc29s
dmUgdGhpcyBpc3N1ZSwgYWRkIGEgY29uZGl0aW9uIHRvIHNraXAgdGhlDQo+IGNoZWNrIGluIHRo
ZSAncHNyX3dhaXRfdXBkYXRlX2lmX2VuYWJsZWQnIGZ1bmN0aW9uIGZvciBEUDIuMSBQUi4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE5hbGFkYWxhIFJhbWFuYWlkdSA8cmFtYW5haWR1Lm5hbGFkYWxh
QGludGVsLmNvbT4NCj4gLS0tDQo+IMKgdGVzdHMvaW50ZWwva21zX3Bzci5jIHwgMyArKy0NCj4g
wqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX3Bzci5jIGIvdGVzdHMvaW50ZWwva21zX3Bzci5j
DQo+IGluZGV4IGNmMGNlNGJiOC4uODY3MWYzM2VhIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRl
bC9rbXNfcHNyLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwva21zX3Bzci5jDQo+IEBAIC02NDIsNyAr
NjQyLDggQEAgc3RhdGljIHZvaWQgcnVuX3Rlc3QoZGF0YV90ICpkYXRhKQ0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGV4cGVjdGVkID0gInNjcmVlbiBHUkVFTiI7DQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7DQo+IMKgwqDCoMKgwqDCoMKgwqB9DQo+
IC3CoMKgwqDCoMKgwqDCoGlndF9hc3NlcnQocHNyX3dhaXRfdXBkYXRlX2lmX2VuYWJsZWQoZGF0
YSkpOw0KPiArwqDCoMKgwqDCoMKgwqBpZiAoc3Ryc3RyKGRhdGEtPm91dHB1dC0+bmFtZSwgImVE
UC0iKSAhPSBOVUxMKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2Vy
dChwc3Jfd2FpdF91cGRhdGVfaWZfZW5hYmxlZChkYXRhKSk7DQoNCkkgdGhpbmsgYmV0dGVyIHNv
bHV0aW9uIHdvdWxkIGJlIHRvIHNvbHZlIHRoaXMgZm9yIGFsbCB1c2VycyBvZg0KcHNyX3dhaXRf
dXBkYXRlL3Bzcl9sb25nX3dhaXRfdXBkYXRlLiBJLmUuIGluIGlndF9wc3IuYy4gUGxlYXNlIGFs
c28NCmFkZCBUT0RPIGRpc2NsYWltZXIgdGhlcmUuDQoNCkFub3RoZXIgdGhpbmc6IEkgdGhpbmsg
YmV0dGVyIHRvIHVzZSAgb3V0cHV0LT5jb25maWcuY29ubmVjdG9yLQ0KPmNvbm5lY3Rvcl90eXBl
IHJhdGhlciB0aGFuIG91dHB1dC0+bmFtZS4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+
IMKgwqDCoMKgwqDCoMKgwqBtYW51YWwoZXhwZWN0ZWQpOw0KPiDCoH0NCj4gwqANCg0K
