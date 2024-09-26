Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCED9CDE00E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 14:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C19610E05F;
	Thu, 26 Sep 2024 14:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGR+WSDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F8C10E05F
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727361503; x=1758897503;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=uWFbaW1WJPMTvjB+UFjlC43m1AucrmJ/H1+AJqQ1p0k=;
 b=KGR+WSDsLsQcGiQI63pnSJC1aJGPQfd5N45RTmU99cfqNxhve905NcNo
 9UuTsdt4jLEt72ndzcnHvsvcJEXVf7DXuDX4DsBN2Vx99fvjZZypRtUMH
 XHLZbsoAG5TXqK3hT3qsgtdT2pqYZAlmwE35XoaC2yolU0mny3STkbL8d
 ZuMK/DKIDPA+SbmHd6ToliVqOHATHoLXsSnBQ9w900YZCjrBvwBRFnrJR
 SLiXLpKuIP4Qapd4BYreM0BiwnUwyCtK0Exyyn+ves3X9mUI/6+DKHs0M
 GTsn/SJwFmKSZl/AoLknYmSnW08NoaF/iHc6GhhrAmx8GZmdzkDBNibqz w==;
X-CSE-ConnectionGUID: H7ofjv3CS0a4Wkyk1oVnmQ==
X-CSE-MsgGUID: oz0oljWqTzmraVfvYy8C+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="48992703"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="48992703"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:38:23 -0700
X-CSE-ConnectionGUID: kJ6oGjwfT4qdHYGwjeC1XQ==
X-CSE-MsgGUID: Nm2M5Sn+RhaktsvjnjrGXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="76261666"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 07:38:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 07:38:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 07:38:22 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 07:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvqiXH6p3sSOit5fTaT9utGeep6pPlJbmF29i9hECJTMAk0CHwRC20LBBlrIRXc4817Isz19YdWq/PIyLdov9byLrfM+Ud4oj1muxCiKRNfXXi/aIjsikBygPPD4QUTZGnY5xfcA+a6GWvvo+/O3pKOhi3wQzpahxGkBKKMc9a1yxRvZ8JhYaccffLqbJ4pxjW/nSQyuuGb73x2VnBLe/iDOIoDqWdH2HleNq96JVHcCrFXnQ90nu5Arr1gifhHyLn6Ua//VuI/ng/6AbldKUK1Rm6qMggPJ8sBpTJFpbP1CfK6sTTd5PnFsCKhk3hXqQd1JV5UGOfQ8lVXwLBtbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWFbaW1WJPMTvjB+UFjlC43m1AucrmJ/H1+AJqQ1p0k=;
 b=Y/F2K77DxXGz43f8XA9AwwRBbUvNzs1UDNzUrYPmpKiobVT45cVrsCb7wJEaz7eRdrNOp86Pe2U+rFpz2aG0pag5PDAuDIIrNT72JhooWJMWALDzqOllet/dxMPSjGnrKDghmMod4Rk9h40zU1uXCjVjGxQAgT+3dXRe1TDgAEesgyh9Mo3IDDwArFPt+RxcRE/9D2oj1hMX3uJ0n1gnaV7OZRF8fQsMbJZLqQYEg/aPi2q3JicXOC39JzmXSJYQsucnetPiQGDEAlMwu8EPrsEksGZNM3YMvCHDdhjNc4vCJTjVM2f4HnFZBQ3UU0BEfU9vmzMZKnP4epzcJHMX9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Thu, 26 Sep
 2024 14:38:18 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%6]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 14:38:18 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "mika.kuoppala@linux.intel.com" <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/3] lib/xe_eudebug: Warn on pipe timeouts
Thread-Topic: [PATCH i-g-t 3/3] lib/xe_eudebug: Warn on pipe timeouts
Thread-Index: AQHbEAHqcKCH97cDnU24P+4FVUTPOLJqI2+A
Date: Thu, 26 Sep 2024 14:38:18 +0000
Message-ID: <4d97d08eb406295eeaec4b027320db5488008a74.camel@intel.com>
References: <20240926103939.550907-1-mika.kuoppala@linux.intel.com>
 <20240926103939.550907-3-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240926103939.550907-3-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SA2PR11MB4985:EE_
x-ms-office365-filtering-correlation-id: 272ceed4-6e05-4873-6e97-08dcde38dcfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RkMvd2FjUU9DeW9MeEZheU4xWHlRYXN2SnM5T3lnMTdteUY0Qnlmd28zd3BB?=
 =?utf-8?B?ZUh5OXdtK3MveXRRSmtVd05pL0tzdEp3MVVtREwrS1VkTUdvUCtOQzZ3ZGJo?=
 =?utf-8?B?MGpiTkhoanBsaStOSHhwRG9QeTdBOWcxaTJEYllUTldyei84RVF1VDZwWDdn?=
 =?utf-8?B?RXA4bnpMN1ArRWZOSVdsYUtJUjA5d0hGSmJOK3BzbGIxTjFIeXZlQ00xWGhT?=
 =?utf-8?B?WENCRHhMUFU1VkRmTnZyUm1FS2Y0K1p1dW1oRFB4UjJpVEpXNElpbkV1UWpi?=
 =?utf-8?B?bEM4TC9GWHZJdGdsWXlGOUo2S29NdUg1dFROcDBENjNNeXE1RXg2dVAzWXhX?=
 =?utf-8?B?andMbHBTa3VRQ2NLQjdXdkg0SkM3ZjdMQ3Y1cWF6blZQV0hoT1JmOXFGelJ4?=
 =?utf-8?B?dXJ3THd6T3VrQ0swanJnVGNXRUNJaWFnT2Fwbko0ZXpsSTZaUzNIbHRyVkx4?=
 =?utf-8?B?NFFpN2pXR1h6UENZTC82amgwQWx0djdBbC9WZkM2aUxPL1lROTdEQm4wbnZo?=
 =?utf-8?B?M1g5R3RuSUhGV3BZUzc5K2xORVo1cDBxVElQVnV2Y1Q1UXBMTUtvSnZPRkpo?=
 =?utf-8?B?T3FYamUwL0tDR3FIendhZ3lVVDBRdVpLZTh4YWdQL0JycFY5Q0tKblZOSWtL?=
 =?utf-8?B?YWNLdDBKR0dpYkRSWTNlV01GWXo0ZktXZzB6OVQ2elhpNmNDNHVncGdNT00v?=
 =?utf-8?B?NG1Xcy90Y0duSm8rZkhyaTE2cnJGNlI5WlJjZlFrSGdCOFhNYWtKVm4reTFN?=
 =?utf-8?B?UjJVRHdFM0pDRTc0T3FFeXNaZjVjc08vYm80MnhyM1NTNVpKc0QrbkRQTU9n?=
 =?utf-8?B?Mzl5dlcxeXFJaG5BZFJYUitmbk9Hbk0zZ21lNkhNNnNRcVFxSGpFM25UV09B?=
 =?utf-8?B?VDJJdGRmQnlYVDZYUmgvZlVyMUhnTFVybzhENkU3eDR4NWV3bUl1Q3dQOEhl?=
 =?utf-8?B?allObnRTNGxUVk1PS2p4bEl3Z1Y4R1cyc0xMU2U1TWduNm16UXRKR3FOUHRz?=
 =?utf-8?B?cnppSUoxNmhMOTcxNVlUVjJ2MU5DWWx2dXdLanc2S3p2WktiTkhTczRXT1RC?=
 =?utf-8?B?L2NOMXloY2o3QjVCY2ZCT0w5RGJHWG8xQW1CQTc3c2NUa2ZhK2hjOW5WdVo3?=
 =?utf-8?B?VUo3TUROVGVsMmtSazdrRVphQ0VuWlBQODB1dzBSWERKdFByRDQ3ZzhZenJY?=
 =?utf-8?B?RS9qNlJHdnRpek41V3V6a2I3U0hWWGg5VkhaYVR3VW1nNEI2Wnd1czhyVGZv?=
 =?utf-8?B?RTBKem45eElMZkFpcXVFYmxVS3dVK0RDdDNvTkhMWmlleTJxZm9TeGJ4eWdi?=
 =?utf-8?B?WmM0dTArV2ZYZWpMUm1nQWZ4dWZiZUdkMDRpT0h4d0xwb092cU50cG4wVlZK?=
 =?utf-8?B?QXAvVkdzT2QzWTNiTU1adVhVM0lWSjRQdGhjVSttWDFOdUxIUmV1ck8zaDZF?=
 =?utf-8?B?dURXVm5lUUlFQlpMbStISjl2dm9HVHVEa0psWGY5L2NQUjM5SWtGdVhwSHh6?=
 =?utf-8?B?RnBnbEJwTDlFWnlRS1UvWi93aFE1dDYrRVkzQmRQaGp5K2JvbE0xeEg4NUxq?=
 =?utf-8?B?N0EvVnpLc1RMTU9JWWxMVlFkRHhpTU9JZngwS2xIV3FmVmxaTVNSMWNSUDA2?=
 =?utf-8?B?SWZ5Tm1LbzhxdWViV2hUb2VEYURqVGVVbTd6WHNRR0xVUjR5OUNYZldxMTFK?=
 =?utf-8?B?WnJwSithMk12VzVlTm9GKzIwWFhjZW9vaEdyeW9wajlvK0Z5T2JKUDJZTnlx?=
 =?utf-8?B?L1FNbkpubk9ST09lckJobkRFRlExZk1SSlcrNlF6ZkpkeEVHU2h6NU1SZXYy?=
 =?utf-8?B?Z2JraW0veENBZ3NsMlBRZXFyUkRvTlNKMU9Gd2dmNTJQa2hVejR1MkR0bHFB?=
 =?utf-8?B?UVBsM2JFREdiK3BDSVo3NmpsdXA3YlEvRVlMNFk1aDJ2aGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHJ1QlJZT0RHZlFiVTVxa0grRjZweC85eEFRcWg0dFhVZlRYL1YyYzR4K0xm?=
 =?utf-8?B?Q2ZmUlM1UC9tclZEcThJckZzTW9vWk9PcWtobE1JM0puekRRZEpvellISk5B?=
 =?utf-8?B?eVBabHBBTmFzdER4cEJtd1lBd1ZKd3J1a2NLbTlidEpXaG1yQW1lMzRHTmta?=
 =?utf-8?B?S2dlM0x2cC8wVVZzR0ZiSGdjRjJ0NVhKeWxQeFMrZEZQZnZ0Q2ZUQzU1RVpx?=
 =?utf-8?B?R3dBenN4aW52a3c0VVJUMXJqdFRaTnBGUjJLSWFIaXVOaTZRZXc2R2dncEdR?=
 =?utf-8?B?NVR2Mk9uSXZQUXIveUxRYzZUNG1YOHpDenFSTTd2dHNzaHhQbDNid0FtZUFs?=
 =?utf-8?B?RVl5bGIzZXpQWHFQL0k4elFWbFpLdmpXRGViQytGZlhhZFl5WkNDTE9sZFQ1?=
 =?utf-8?B?UEtwRmZnVzJkZG9ObnlzaXJGOFhYdUs1TFZSUUp5ekk1K3p0eVZEWVpDMGNM?=
 =?utf-8?B?c3lFNVZNeW84bXJIUGxwU24wNUQ0Z28yS0hiZDR0dytva3pJZW1Tc0E5b3Js?=
 =?utf-8?B?WGFjM2RHemhUZ3pBRkVTWk1weGxmU0tYQkZkMUZveHc3a3IwTm9aRE84MDlH?=
 =?utf-8?B?aDBRTzlhc05JL0kyZ0VEcHZYM1lyK1AybnRZWTdEckRQTGtENE9NakdVVDVp?=
 =?utf-8?B?b0xMbDhjU1pQa3BXcWR5MnZQay9IKzRHY1VYSDJkSzNzTnVkM0laYndlM2E0?=
 =?utf-8?B?NTBOaUFLdzdHdXdpdGFuK0x6aTdqRFpPMmhtYU5VeE1BeEZUaE9UVnJwbXlo?=
 =?utf-8?B?WGF1UU4wZnBsNzZpRjFORmlEam55TldvTVAvWlg0dk1VMnVCS1F0U1Fob2Y0?=
 =?utf-8?B?UTY4SGp5SXIzK25qcEUwQ1haR2w3VEdsRnFKZTJGRDRadkhqVE53NmtMa1p0?=
 =?utf-8?B?MnNxNnFib2YrQzEyYkE0MjViZk1PYUppNm1ES2h4U0ZlQXEvdWJ0TnkzbzhE?=
 =?utf-8?B?UXJkMUJ2djBpdTdMOGJmd09oS2d4OUFhczd2UDFWQy9PSFNSRTlJRTVtTDB5?=
 =?utf-8?B?QnRRblVxRnZDN2RxSklSTkV1cWgyaEt6dVY4ODE1K1h2K0RPQ1orNCs0L3pR?=
 =?utf-8?B?STZWT05vbE92bndJbXBKd3VWSUM2RnFLaHRBZDZqa1ZmWmVPVUhCY2M1NFpz?=
 =?utf-8?B?U0pZblN5Q0FKcXo3YXhDMjNWM3lYUzVhVjNVOUl0U3c0aFBPQ3NheDQ1NUdB?=
 =?utf-8?B?TzQwREVCOXA4YW9VN3VZSzRZeGNuSWRYV05XQkVwWloxYUhBVXRrQ1pNRWdD?=
 =?utf-8?B?OHpJUWVCalhva2ViZmY3bWFvelEzUE1KMHhBMXN2bnE4T3RuM3NpK0ovZzU1?=
 =?utf-8?B?d1hjekFqYjdjb3dXKzBBZ3dqU2tiVzVhNHhvMzRnT1hmZVQ3MmcvdHU0Qm9I?=
 =?utf-8?B?b0E2SWZGQkZqdkpqWDRrZGRUS2dzb1hTbWlaUCtpQ2g2bjdSb1JzMXVVMjda?=
 =?utf-8?B?ZTJGamZZTGtnTFAzditDRDZWU3liM2MrcGlXQXBJNEhaRm9DN1lVcmVxVGRU?=
 =?utf-8?B?NlljWlFaczFEY1kwSDJONUpFQjVEL3kybko5cTV4OWJzeGlBUFcwS1NDL0U5?=
 =?utf-8?B?WkxCUktaUENHZGlhTUFNNWVWVUhBYmxoZHJEZDlwOVlmSjdlRTMxQzdxSHoy?=
 =?utf-8?B?OCtlV1VjWFhLOTBtL3V6a2l0a0QzVUdKeXNUUmMxeU1Da3kwTVBXclVrTmk3?=
 =?utf-8?B?UDlaZ3VjUzFaUG4rd2NoRlM1b1ZzSEhTeG44R2hOQ0g1VExUdTRwalFMVS82?=
 =?utf-8?B?d21zMkhya0JmVEdqc1Vjd0taa2V0aDJtQWw5bGtKWjRySS84MjhtbUFDdE1a?=
 =?utf-8?B?OUtPaHJYd3M1VlFCVlhDSkxmYkFWN2lpRzVMdTFaakhLVkFDM084OWxGcW1h?=
 =?utf-8?B?UFN5UzBrb2trMjRiMEQzQXgrZzVVZ2JYVW1SV2g0NEhTQ0NyTWdSWGg2K2U1?=
 =?utf-8?B?NDM4SysxTlpYUU9ObHhGVFVkWXc0S2VkZkhxL1pSWitUQTFNNjA5Rm5mWGdZ?=
 =?utf-8?B?T0VZeFduUUkyUXB4YVVqT1VaUXJFdnFYUS9ZWXpoWmkyazdLa1QzU1lvamx0?=
 =?utf-8?B?WTkwU0l0OENPc0wvYnVPSUNUTDI2NGdrc3FTcTlwVmNpUFRqYmZEYThBUDRK?=
 =?utf-8?B?RmpDL3lySkcrK3RBK0Z4Z0xrbEpMdCtTTVNBakNGVHpRYXpvVXFHNUo0cmN3?=
 =?utf-8?Q?eVhP8hCgDa/tpFgWnZ4qZ2M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B587FDE7AC981D4DA9FDC311899470FB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272ceed4-6e05-4873-6e97-08dcde38dcfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 14:38:18.6158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SKOrEEFdagn1HvRKzo1IaPqze1qOxSKf6OJK2m4Yo8W7cpOIwxmlbcDQ9prTztnL1TK1L8ocAZyd2ujmOZuXU+VRax0HG/MOd0TzJDKAv/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4985
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

T24gVGh1LCAyMDI0LTA5LTI2IGF0IDEzOjM5ICswMzAwLCBNaWthIEt1b3BwYWxhIHdyb3RlOg0K
PiBldWRlYnVnIHRlc3QgaGVscGVycyB1c2UgcGlwZSBiZXR3ZWVuIGRlYnVnZ2VyL2RlYnVnZ2Vl
DQo+IGNvbW11bmljYXRpb24uIElmIHdlIGV2ZXIgZmFpbCBldmVuIGEgc2luZ2xlIHBpcGUgcmVh
ZA0KPiB0aGUgd2hvbGUgdGVzdCBmcmFtZXdvcmsgc3luYyBpcyBsb3N0LiBTbyBpZiB3ZSBnZXQg
YQ0KPiB0aW1lb3V0IHdlIHNob3VsZCBiZSBxdWl0ZSB2b2NhbCBhYm91dCBpbiBpbnN0ZWFkIG9m
DQo+IGp1c3Qgbm90aWZ5aW5nIHRoYXQgdGhlIHBpcGUgcmVhZCBzaXplIHdhcyBub3QgbWV0Lg0K
PiANCj4gRnVydGhlciB3aXRoIGtlcm5lbCBkZWJ1Z3Mgb24sIHNvbWUgZGlzY292ZXJ5IHRlc3Rz
DQo+IGNhbiBzdGFydmUgc29tZSBvZiB0aGUgZGVidWdnZXIgdGhyZWFkcyBmb3IgcXVpdGUNCj4g
YSBsb25nIHRpbWUgc28gaW5jcmVhc2UgdGhlIGRlZmF1bHQgdGltZW91dCB2YWx1ZS4NCj4gDQo+
IEZ1dHVyZSBpbXByb3ZlbWVudCBjb3VsZCBiZSB0byBwYXJhbWV0cml6ZSB0aGUNCj4gdGltZW91
dCB2YWx1ZSBzbyB0aGF0IHNpbXBsZSB0ZXN0cyB3aXRoIHF1aXRlDQo+IGRldGVybWluaXN0aWMg
cnVudGltZSBjb3VsZCBzcGVjaWZ5IGEgc2hvcnRlcg0KPiB0aW1lb3V0Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+DQo+
IC0tLQ0KPiAgbGliL3hlL3hlX2V1ZGVidWcuYyB8IDQzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0NCj4gIGxpYi94ZS94ZV9ldWRlYnVnLmggfCAgMiArLQ0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9saWIveGUveGVfZXVkZWJ1Zy5jIGIvbGliL3hlL3hlX2V1ZGVidWcuYw0K
PiBpbmRleCAyYzdjZDJhZTEuLmRhOTNlOTc4NSAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX2V1
ZGVidWcuYw0KPiArKysgYi9saWIveGUveGVfZXVkZWJ1Zy5jDQo+IEBAIC00Nyw2ICs0NywyMyBA
QCBzdHJ1Y3QgbWF0Y2hfZHRvIHsNCj4gICNkZWZpbmUgQ0xJRU5UX1NUQUdFIDUNCj4gICNkZWZp
bmUgREVCVUdHRVJfU1RBR0UgNg0KPiAgDQo+ICtzdGF0aWMgY29uc3QgY2hhciAqdG9rZW5fdG9f
c3RyKHVpbnQ2NF90IHRva2VuKQ0KPiArew0KPiArCXN0YXRpYyBjb25zdCBjaGFyICpzW10gPSB7
DQo+ICsJCSJjbGllbnQgcGlkIiwNCj4gKwkJImNsaWVudCBydW4iLA0KPiArCQkiY2xpZW50IGZp
bmkiLA0KPiArCQkiY2xpZW50IHN0b3AiLA0KPiArCQkiY2xpZW50IHN0YWdlIiwNCj4gKwkJImRl
YnVnZ2VyIHN0YWdlIiwNCj4gKwl9Ow0KPiArDQo+ICsJaWYgKHRva2VuID49IEFSUkFZX1NJWkUo
cykpDQo+ICsJCXJldHVybiAidW5rbm93biI7DQo+ICsNCj4gKwlyZXR1cm4gc1t0b2tlbl07DQo+
ICt9DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBjaGFyICp0eXBlX3RvX3N0cih1bnNpZ25lZCBpbnQg
dHlwZSkNCj4gIHsNCj4gIAlzd2l0Y2ggKHR5cGUpIHsNCj4gQEAgLTI0OCwxOCArMjY1LDcgQEAg
c3RhdGljIGludCBzYWZlX3BpcGVfcmVhZChpbnQgcGlwZVsyXSwgdm9pZCAqYnVmLCBpbnQgbmJ5
dGVzLCBpbnQgdGltZW91dF9tcykNCj4gIAlpZiAocmV0ID4gMCkNCj4gIAkJcmV0dXJuIHJlYWQo
cGlwZVswXSwgYnVmLCBuYnl0ZXMpOw0KPiAgDQo+IC0JcmV0dXJuIDA7DQo+IC19DQo+IC0NCj4g
LXN0YXRpYyB1aW50NjRfdCBwaXBlX3JlYWQoaW50IHBpcGVbMl0sIGludCB0aW1lb3V0X21zKQ0K
PiAtew0KPiAtCXVpbnQ2NF90IGluOw0KPiAtCXVpbnQ2NF90IHJldDsNCj4gLQ0KPiAtCXJldCA9
IHNhZmVfcGlwZV9yZWFkKHBpcGUsICZpbiwgc2l6ZW9mKGluKSwgdGltZW91dF9tcyk7DQo+IC0J
aWd0X2Fzc2VydChyZXQgPT0gc2l6ZW9mKGluKSk7DQo+IC0NCj4gLQlyZXR1cm4gaW47DQo+ICsJ
cmV0dXJuIC1FVElNRURPVVQ7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIHBpcGVfc2lnbmFs
KGludCBwaXBlWzJdLCB1aW50NjRfdCB0b2tlbikNCj4gQEAgLTI3OSwxMiArMjg1LDIxIEBAIHN0
YXRpYyB2b2lkIHBpcGVfY2xvc2UoaW50IHBpcGVbMl0pDQo+ICBzdGF0aWMgdWludDY0X3QgX193
YWl0X3Rva2VuKGludCBwaXBlWzJdLCBjb25zdCB1aW50NjRfdCB0b2tlbiwgaW50IHRpbWVvdXRf
bXMpDQo+ICB7DQo+ICAJdWludDY0X3QgaW47DQo+ICsJaW50IHJldDsNCj4gIA0KPiAtCWluID0g
cGlwZV9yZWFkKHBpcGUsIHRpbWVvdXRfbXMpOw0KPiArCXJldCA9IHNhZmVfcGlwZV9yZWFkKHBp
cGUsICZpbiwgc2l6ZW9mKGluKSwgdGltZW91dF9tcyk7DQo+ICsJaWd0X2Fzc2VydF9mKHJldCA+
IDAsDQo+ICsJCSAgICAgIlBpcGUgcmVhZCB0aW1lb3V0IHdhaXRpbmcgZm9yIHRva2VuICclczoo
JWxkKSdcbiIsDQo+ICsJCSAgICAgdG9rZW5fdG9fc3RyKHRva2VuKSwgdG9rZW4pOw0KPiAgDQo+
ICAJaWd0X2Fzc2VydF9lcShpbiwgdG9rZW4pOw0KPiAgDQo+IC0JcmV0dXJuIHBpcGVfcmVhZChw
aXBlLCB0aW1lb3V0X21zKTsNCj4gKwlyZXQgPSBzYWZlX3BpcGVfcmVhZChwaXBlLCAmaW4sIHNp
emVvZihpbiksIHRpbWVvdXRfbXMpOw0KPiArCWlndF9hc3NlcnRfZihyZXQgPiAwLA0KPiArCQkg
ICAgICJQaXBlIHJlYWQgdGltZW91dCB3YWl0aW5nIGZvciB0b2tlbiAnJXM6KCVsZCknXG4iLA0K
PiArCQkgICAgIHRva2VuX3RvX3N0cih0b2tlbiksIHRva2VuKTsNCg0KQ2FuIHdlIGRpZmZlcmVu
dGlhdGUgZGVidWcgcHJpbnRzIGJldHdlZW4gdGhvc2UgdHdvIGFzc2VydHM/IExldCdzIHNheQ0K
IlBpcGUgcmVhZCB0aW1lb3V0IHdhaXRpbmcgZm9yIHRva2VuJ3MgcGF5bG9hZCAnJXM6KCVsZCkn
IiA/IE9yIHN0aCBzaW1taWxhci4NCg0KPiArDQo+ICsJcmV0dXJuIGluOw0KPiAgfQ0KPiAgDQo+
ICBzdGF0aWMgdWludDY0X3QgY2xpZW50X3dhaXRfdG9rZW4oc3RydWN0IHhlX2V1ZGVidWdfY2xp
ZW50ICpjLCBjb25zdCB1aW50NjRfdCB0b2tlbikNCj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9l
dWRlYnVnLmggYi9saWIveGUveGVfZXVkZWJ1Zy5oDQo+IGluZGV4IDI5YWI2OGZlZS4uNmU0NjY2
MzMzIDEwMDY0NA0KPiAtLS0gYS9saWIveGUveGVfZXVkZWJ1Zy5oDQo+ICsrKyBiL2xpYi94ZS94
ZV9ldWRlYnVnLmgNCj4gQEAgLTExMiw3ICsxMTIsNyBAQCB0eXBlZGVmIHZvaWQgKCp4ZV9ldWRl
YnVnX3RyaWdnZXJfZm4pKHN0cnVjdCB4ZV9ldWRlYnVnX2RlYnVnZ2VyICosDQo+ICAgKiBEZWZh
dWx0IGFib3J0IHRpbWVvdXQgdG8gdXNlIGFjcm9zcyB4ZV9ldWRlYnVnIGxpYiBhbmQgdGVzdHMg
aWYgbm8gc3BlY2lmaWMNCj4gICAqIHRpbWVvdXQgdmFsdWUgaXMgcmVxdWlyZWQuDQo+ICAgKi8N
Cj4gLSNkZWZpbmUgWEVfRVVERUJVR19ERUZBVUxUX1RJTUVPVVRfU0VDCQkyNVVMTA0KPiArI2Rl
ZmluZSBYRV9FVURFQlVHX0RFRkFVTFRfVElNRU9VVF9TRUMJCTYwVUxMDQpJIGhhdmUgYSBmZWVs
aW5nIHRoaXMgc2hvdWxkIGdvIGluIGEgc2VwYXJhdGUgcGF0Y2guIA0KQ2FuIHlvdSBzcGxpdCBp
dD8gQWRkIHRvIGJvdGg6DQoNClJldmlld2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWlu
aWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQoNCkNsZWFyIGFzc2VydCBtZXNzYWdlcyBhcmUgYWx3
YXlzIHdlbGNvbWUhDQoNClJlZ2FyZHMsDQpEb21pbmlrDQo+ICANCj4gICNkZWZpbmUgWEVfRVVE
RUJVR19GSUxURVJfRVZFTlRfTk9ORQkJQklUKERSTV9YRV9FVURFQlVHX0VWRU5UX05PTkUpDQo+
ICAjZGVmaW5lIFhFX0VVREVCVUdfRklMVEVSX0VWRU5UX1JFQUQJCUJJVChEUk1fWEVfRVVERUJV
R19FVkVOVF9SRUFEKQ0KDQo=
