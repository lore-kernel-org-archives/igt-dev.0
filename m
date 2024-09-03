Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5122CD13CF
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 08:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABCB10E34C;
	Tue,  3 Sep 2024 08:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAJEtvQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2104B10E34C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 08:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725352324; x=1756888324;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+DFxOc5L/d1d2L+IM1k9nmBcnBAJOznohO/j+u782AE=;
 b=JAJEtvQJnDoKGZObjmA/RRrYDVuKbb4L4OqHAnyfJ2nh0WdpBSUzuucb
 WXjQvDMBtn22ysDKm+ssDBSyndUZkOYpjam7ZncLPvnqzYmnFpXCuA5Uf
 LsxQjrmp0SXPjxY9No8UYu+/80sBmdjFDHBrTMXDmvc9eaNXPhd1aPAbY
 bxr0SJbZEBYf3hyUZLv/93eorJmN7B04UfUEbMgKLn/HQjomCspz3znx6
 eYRtF4cjGHj1N86ymjSDiYjhYpmA3ueDH+qrM5gdvfO1g5RQauHP+WbkA
 ehDu8x0ivqtQgngCU/6sy9h73oXmY4SnXFs+/yH9YNATJEDEnxBeIVGIQ g==;
X-CSE-ConnectionGUID: h3fVLv2FQ2WyRWRgfxNeSg==
X-CSE-MsgGUID: hyz4vmmAQr2+xwGpKdWMbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24073737"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="24073737"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 01:32:03 -0700
X-CSE-ConnectionGUID: L3s0J7LdSOuH6FuRQEaaDQ==
X-CSE-MsgGUID: CNAFSlyJRSCw7NcYwAnXGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="64464061"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 01:32:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 01:32:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 01:32:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 01:32:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 01:32:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFPcVNWEMhFvaT804MYViJr2YZeEQ+lvkCUhAwRCXgJPES3+eTAVRTYgBUt/dJFd4cKBVUK5v3IjF2N2OQUl6iZLMrm7ytNSSAg266PBzLx5WZjd+rWbPiDIostp6eXBAJGLTFCgEJeN9gpQ4Q73mc4VuloimK6Hs7itMWRN/hEjoEj7827bWcv3gXmYHzsWPr/CAbXWZkJDZ3naFXld9B3I1xm7lqBAWWRHm9oBGawUBAV2RdBLpTtil1cff9wZbjejRRkUqHsQrGRJByjummIN+t2UC7E48k8d/vyPIIDu9UoCVUwggcckYSzXezoHAXkeviaTU/0f1j481CZ0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DFxOc5L/d1d2L+IM1k9nmBcnBAJOznohO/j+u782AE=;
 b=df0ehglxMOCe1uwuBKFWrBC7hauPNeqIc1E79AFYZZ1B04vxOs/dDYam5gNab+z5s+yjvtyZL81wzDtSaOMAIUANfpEw7CU6imwBWoSw7EnBRhjPjAcGgaupbdROsFWTRml9v2kfWFL4QGxtHrRcBJNosydafWt83NdPLfIoXdAVZcCqee67DYAZt/wGTD1XVT6JGninpdc35CwEIm5UbmJc9oHUbNvI2eCrnx5KT4nau/qTgiLdgim7AJIU83cIIDOIU59b4EY3o0ZubG15JE5oOxcpon6lNOtNlA5z2uDM5RQobLR3vF3S4VegzJisAueDx0s0Gr3erRv8YRsBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:32:00 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:32:00 +0000
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Emil Velikov <emil.l.velikov@gmail.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] tests/core_setmaster: Handle the test even if cards are
 non-continuous
Thread-Topic: [PATCH] tests/core_setmaster: Handle the test even if cards are
 non-continuous
Thread-Index: AQHa7HmNOHyC0Moaw0+57cY6Mi7ZNbIzjLaAgBJQ0VA=
Date: Tue, 3 Sep 2024 08:32:00 +0000
Message-ID: <DM4PR11MB529380A7C3015E03F8D1B59C9D932@DM4PR11MB5293.namprd11.prod.outlook.com>
References: <20240812052443.12856-1-krishnaiah.bommu@intel.com>
 <20240822164627.byk7ffdpjwpwb5tw@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240822164627.byk7ffdpjwpwb5tw@kamilkon-DESK.igk.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_|DS0PR11MB7312:EE_
x-ms-office365-filtering-correlation-id: c24374a0-6eae-4aaa-acba-08dccbf2e14f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b0tvejFwUTZGT3pBeFA2Rm5xY09SY0FueHVTVzNBYTVjWU1MWmc2U3lxNGFZ?=
 =?utf-8?B?U1JyVGliR1NpYitSVjVOUkRaV3ZrTUdoeXNXbGU1NVlLZS8zL1ErdW12cWpM?=
 =?utf-8?B?TTZLZXgwZWhvMlVTL1d6U21vY0d0SmhxYnJ4VXRGbWJJRDhSZGo2QmFJelRP?=
 =?utf-8?B?M2pEbHNGM01qbit4R2crUkdCd2cxT29TL0dNNWJnNlFrNElUZGZWQ1B4akEx?=
 =?utf-8?B?dmFoVUVIanVwbzVvOVJOMDNSd0VBQVFwUHFQRHB1Mm5mRFlYYVcxNjFrTE51?=
 =?utf-8?B?UFpOQWQraTdzYUtoRmZ3YzU1blVQRlFBVmhkb0F4aG9nbUdpQkxjbThhc2l1?=
 =?utf-8?B?K3VFSCtzVkZwUXFCTU9EQXpKSTNsWkUwd1NTWHZubnhaTWQwMDZ6NlBRTXM0?=
 =?utf-8?B?dDlUazh0ZU50cVZ5NWhDOU5WMFR3SGgybFpodFdsaHNnM2JZcjFjazhhekVn?=
 =?utf-8?B?Tlo3WlU2MEdTMEF5RXlWNk51VGhpUVlDanFrMlozWmN1YllSeXU3SDVLZlht?=
 =?utf-8?B?UmNJbnVYZStkaktrWXRyYWxUaDdFbXBoN2I4MkU3L25MNkgwNzBvMDczcVBs?=
 =?utf-8?B?N3d0TDNYNkpiRnVOdnhvT29YQzI1Z2dvZkVDOThMNjFwYVRuaENZOExsampt?=
 =?utf-8?B?cjVSa2w0Yk50bStTNVFKVjc5WTlPS0NRTjJCK2E5UHJMaEpEYXdtS3FHTkFO?=
 =?utf-8?B?R3BEK3lmN1FQaTZuRG1pUGQ2TnVlNFdTU0lZY3JrcHhvV0NIWEJKU3VDTGJL?=
 =?utf-8?B?ZjJibUk5RjFVTFFMV2NrcmRteVNuZzl2M21Jdmg1WXJteUtBQlV4Slg1di9G?=
 =?utf-8?B?VjA4UUVqdEo5YmNsZGVXWnA4ek54NUtjc3ZRVHlxS0RHdzJTbnFpMGpha0p3?=
 =?utf-8?B?M3M2Y2lDVkUvUkw4bW1qczVOS2M5Vy93SS9sVkhDRWNXMjZNRkFDdUhGeVdq?=
 =?utf-8?B?dnFOeXhLV1BzV0dhU0pnV0JkaHpXNjNmL2Z2bzhEUk9nNzV0T2tScCtQK1ky?=
 =?utf-8?B?U3pTZmNicmJ2VkJWNW9Rd1h2M2xFSFRqQ0VoTVpSWWU0WnNTR2FqbEUxVjU3?=
 =?utf-8?B?MFBGZ3dJc0hGQzFLWVJsSHRySEV1QllIVnJPNSs2d0phZWE0QS9yWUNraHlY?=
 =?utf-8?B?NzVCamlwdVRtaHBTZkxkclF0R1k3dFgrRUVSc1pkdHpvVTlDYW5GM0c3ZVZ4?=
 =?utf-8?B?YldvOXBWM1dyUE80dlpqNXN4YnhmSDczclFFNWJGNGdvOTJWVnVqQi9GUXFK?=
 =?utf-8?B?Q2h5Y0xrejcvT3ZDdndjQklaQmJPZEswMHdFMEc0Qit4cXd1K1hKMXFCNzVr?=
 =?utf-8?B?K2h6c2NFNkh1WUkxdjFKcUpTenZ2dTR4bmhlcmpRdHJqWUxaZjBNREovWFAx?=
 =?utf-8?B?cTZwbDdxVW1hdkI0dCtPUHJxdlBHYnhZUnllakQwOXpxVzR4bHVFVGQyem85?=
 =?utf-8?B?UmFzTXBQQ2RKV2hERFRoKzI3NlkyN2huVGRGdXpYb2pkYjhMc2o0YXdlZWV5?=
 =?utf-8?B?OXR2V1Z3R1dyR3NJcWZzY3RJbWxMNW9MRXI0S0xBUnZoNEtuMjVjZ2VKOU1D?=
 =?utf-8?B?YnI5dHJJb2tLbFFqNGswbUd5Yk9CVkt1TDRnYXhQYTBwdGZIWmVjWk1OdHRR?=
 =?utf-8?B?UEVWTG05R0x4WXRTcktic3VCNU5qRzlic3NUalpHcktzQUFXekZJTk5YY21R?=
 =?utf-8?B?OUhaSXlXRytxVWk2NGVDRUIvdXJwRFhDdGJTaW1jZkV6SkdtN1RyVVNWdmhE?=
 =?utf-8?B?VkdTMktPd1V4cUtUbmpEUmZ3eERRUHg4SkJrWmlYNlNaa2hMczVXckozalh2?=
 =?utf-8?B?Q3lsNUxyQkpVbUlBek11dXl4RFc2aFFObVFGVitOYS8ya1RqNnZ3SWVNaisr?=
 =?utf-8?B?N0t3UlVrSThBcHpacUdFSnNVWkZuS2w0NU1OTzZaMVJBNHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2FCNzlWbG9qcENIWVBFeUlOMWZEeUFKWjdObERIbkE3b290YlV6YXdHamo2?=
 =?utf-8?B?SEFRV05lR3czUHF5cXp1VGM1dVdsbDBuRy9tNXhqWGI5UTFRY043enJYVERh?=
 =?utf-8?B?SHVPbCtSWm44Q2NtSDNmNkFQKzI0MFBoenZoQ0RUTWhIbEVVTm1UbWt2TEN4?=
 =?utf-8?B?blErSnZrUytFaXBjMC9jSFBnZnl4RDRkekg5bXlzdnVaTCtLZnNJcndhbVIr?=
 =?utf-8?B?SEwyYmgzaVQrUzN2a1F0N0tsT21SRG9GekUyTWpNWW9BMmpBMkpCQThENW5Q?=
 =?utf-8?B?NzlTSVZ6YnJFZnBsZ3NmM3M3WmtHeEdIMmZ3TlJqZTg3bk9nTm1tVmxqbmJT?=
 =?utf-8?B?T08yVEozTDZaZUxJa3V1czBYY1pIeDVJSjZOSFU2blNVaUY1VEozemV6YjJW?=
 =?utf-8?B?aWE2UlZwV3drbzhCdVdyZGdlWnQ1bHJPTGkwcmFVaWpRMDZsKzJVSzgzWHg5?=
 =?utf-8?B?LzUyTGx1RUliK254Y2VCc0Nobm51dnRCLzNIcE1jSzNPNWlxZGthL29mVzFw?=
 =?utf-8?B?ZTlhcUVyNS9VRmlia0hMMksvRkcra3JRSDBmNGtvTitZd3N0MTRsZm9EMzVQ?=
 =?utf-8?B?WlRya00yOEJ4elVVODJ1N2hxV2hEOEpITlJhVHBlWGo1bmMyeGZuWUVxUGUz?=
 =?utf-8?B?cVZOeE5wRjkzNko1QkZsRjN3VUN1OU5oU1BXNnZDM0x5b0s4V2wxVFBjc2t2?=
 =?utf-8?B?SzJDWE1tZ3JXOUp5akU5NjY5bGZiV0FJRXA0a1V6Mjlhc1JBTnRteVYxdGtv?=
 =?utf-8?B?TTcrNmFJUGd1OWo0MmtyTjBOU3AzeDlBa0RUUHBza0lEemgxOTNibm9tcjVP?=
 =?utf-8?B?TWh1eU1Dc0dWZ3NlbHlOa3BmZXdSSXNud3hCZlZkcnNaUEllTENiK3VjS0tm?=
 =?utf-8?B?SS90bEE1Uk15dktKaU9MMldJY0lhemRvekNjNXh0dlB1THJBSHBFeTRENEVK?=
 =?utf-8?B?a0NGR3VEMnczcVB5ZGpQMUNGQ2c1Zkw3NkZsVzhlZEQyaWNibkhTa2h6Qk9Z?=
 =?utf-8?B?bXlUVk9BWk1oVC9ybDlrdmpiSDlSN1lSTUUwU2xkc25TaWJZYS9lNXFMdjhu?=
 =?utf-8?B?MjFUNFpwNlhVNUdhOWZUTWowRXhzd1pmU2pzdWhMTysrK2t2UFA1K3JMa3h1?=
 =?utf-8?B?SU15WC9HRzNuTGo5RWE3cGFHR3JNSnZZZDNJU3VFUzh4cVE4WDNIMTdXVzRT?=
 =?utf-8?B?endqeTdKVVBrQUR1TjdWd0N0bUpZcjFYNmZZUllMalZDbWIreDNiWUhIS0dj?=
 =?utf-8?B?bGhpZGNtUXBsY2lLT2Y1SjYwdzI3MHA1N3lxUnVwdVFoKzBBWlJlRTNKd2ts?=
 =?utf-8?B?ZEhKUm81ZzNxMGl0bE5CVldETy9STVROR2JIZjJmUC96S1pBeHhNYnd3V1gy?=
 =?utf-8?B?S2VzZW11THIxUGw4ck50RkUzb3R4UVZJRXMwWStpVVNNcWViUWZUbmhDNjhR?=
 =?utf-8?B?UHdLbERPcTFMOEw2VXNxcTd2YngySTRhM3FHMWI1YzRBVDVVcTJwd3NEa0ND?=
 =?utf-8?B?OTg3Q2VESlJmMk90UG9ZNGpaVUZBZmlvMmFtS0NqS21KZ0w1Q0VBWkhmVjdE?=
 =?utf-8?B?MXBBTHB6L2lRNXZ0OFNWeFJVYU9xRmsycFBRVDFqaUZKcFhubFowZFZQejZp?=
 =?utf-8?B?bndXTzZaUlFaUkhsNE43ay9UQlFJTEdrZ3BVZW1tazVRQm90djVST3ZUU0Uw?=
 =?utf-8?B?MmY2Nm9KN1lvamhmM3hXekwwVXA4OTZPa0hFUlJZSEErNWRmMUNWMUY1TkM4?=
 =?utf-8?B?YTJiU2xTaGRwdXpYWXhhSFl6Mzl4U1hGWlBLM1RORS9sKzlOWXIxbjNZcU1H?=
 =?utf-8?B?YTdtWXowNlA0dXFQbTVxd0MvZnVMT0gvcnNJdkhraUpwU2VMcUVTU3ZLZFhI?=
 =?utf-8?B?RXNsOHB3TGlDT0tGaHNKbmpnWGtrb0FyNzV4ZE5rUURWWmNaejFKek5lWTRx?=
 =?utf-8?B?L0ZHc3hpVHR1azRFY1RERFN2K2hVVnVDZFhaamV4bEZqQTVZNGtMYVlUOWpP?=
 =?utf-8?B?UUowMzRZc0pZR055Vk9FYUh2RHJudFUxVGduTFBvZm5PcWhTcU5sdGlneHNG?=
 =?utf-8?B?aE9zMnlab3hscHYzVSt6V3Q3Y3dKdnF5V2c0NlZoa0YvcUswYXZxN2dKVW1Q?=
 =?utf-8?B?RTBxVlY4VXlQTXdaOXYranNUdDlXemJDVDBIRVF3empIUkhVYlBRU2dwMEYv?=
 =?utf-8?B?QlBET3ZXSlAwREEraVlDRG52aG9ONXFVRW5uQkYvaHhtSndJYlpvOEY5OEEv?=
 =?utf-8?B?VFJtWmZwU3lDcW5MemlKN0ZOVDBBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24374a0-6eae-4aaa-acba-08dccbf2e14f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 08:32:00.2196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JA/dHAjqC/cbyKiiJEkQ+KzljzvbK9g5fIqq8h+msy9ARynjpcgzLq3sGXAEht/qzvaC8QImp547OUuV+BiEwsWDsOL6Q7bO00zFLtjJ6EA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7312
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXVn
dXN0IDIyLCAyMDI0IDEwOjE2IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBDYzogQm9tbXUsIEtyaXNobmFpYWggPGtyaXNobmFpYWguYm9tbXVAaW50ZWwuY29tPjsg
RW1pbCBWZWxpa292DQo+IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+OyBHaGltaXJheSwgSGlt
YWwgUHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIXSB0ZXN0cy9jb3JlX3NldG1hc3RlcjogSGFuZGxlIHRoZSB0ZXN0IGV2ZW4g
aWYgY2FyZHMgYXJlDQo+IG5vbi1jb250aW51b3VzDQo+IA0KPiBIaSBCb21tdSwNCj4gT24gMjAy
NC0wOC0xMiBhdCAxMDo1NDo0MyArMDUzMCwgQm9tbXUgS3Jpc2huYWlhaCB3cm90ZToNCj4gPiBB
bHRob3VnaCBtb3N0IG9mIHVzZXJzcGFjZSBhc3N1bWVzIGRybSBjYXJkcyB0byBiZSBwb3B1bGF0
ZWQNCj4gPiBjb250aW5vdXNseSwNCj4gPg0KPiANCj4gUmVtb3ZlIGJsYW5rIGxpbmUuDQpJIHdp
bGwgcmVtb3ZlIA0KPiANCj4gPiB0aGlzIGFzc3VtcHRpb24gbWF5IG5vdCBiZSBhbHdheXMgdHJ1
ZS4gQWZ0ZXIgaG90IHVucGx1Z2luZyBhbmQNCj4gPiByZXBsdWdpbmcgb2YgY2FyZA0KPiA+DQo+
IA0KPiBSZW1vdmUgYmxhbmsuDQpJIHdpbGwgcmVtb3ZlDQo+IA0KPiA+IHRoZSBjYXJkIG1heSBi
ZSBub24tY29udGlub3VzLiAgVG8gYWRkcmVzcyBzdWNoIHNjZW5hcmlvcyB3aGVyZSB0aGUNCj4g
PiBjYXJkcyBjYW4gYmUgbm9uLWNvbnRpbm91cw0KPiA+DQo+IA0KPiBSZW1vdmUgYmxhbmsuDQpJ
IHdpbGwgcmVtb3ZlDQo+IA0KPiA+IG1vZGlmeSB0aGUgdHdlYWtfcGVybSBmdW5jdGlvbiB0byBs
b29wIGFsbCBwb3NzaWJsZQ0KPiA+IGNhcmRudW1iZXJzKGNhcmQwLWNhcmQyNTUpIHRvIGNvbmZp
cm0gYXJlIHRoZXkgcG9wdWxhdGVkIG9yIG5vdC4NCj4gLS0tLS1eDQo+IHMvY2FyZG51bWJlcnMv
Y2FyZCBudW1iZXJzLw0KSSB3aWxsIGNoYW5nZXMgDQo+IA0KPiBpbWhvIHRlc3QgaXMgY2hlY2tp
bmcgb25seSBmaXJzdCBjYXJkIHNvIGxvb3BpbmcgYWxsIGlzIG5vdCBvcHRpbWFsLg0KPiANCj4g
Pg0KPiA+IFByb2JsZW0gRGVzY3JpcHRpb246DQo+ID4gVGhlIHRlc3QgZmFpbHMgYWZ0ZXIgcnVu
bmluZyB0aGUgYGNvcmVfaG90dW5wbHVnQGhvdCpgIHN1YnRlc3QsIHdoZXJlDQo+ID4gY2FyZDAg
aXMgbWlzc2luZy4NCkhlcmUgY2FyZDAgaXMgcG9wdWxhdGVkIGFzIGNhcmQxDQo+IA0KPiBpbWhv
IHRoaXMgY291bGQgYmUgZGlzY3Vzc2VkIGlmIHRoYXQgaXMgb2sgb3IgZHJpdmVyIGVycm9yLCBp
bWhvIHZhbGlkIGNhc2Ugd291bGQNCj4gYmUgdG8gaGF2ZSBtdWx0aS1jYXJkIGFuZCB1bnBsdWdp
bmcgZmlyc3QuDQo+IA0KPiA+IFRoaXMgbGVhZHMgdG8gYSBmYWlsdXJlIGluIHRoZSBzdWJzZXF1
ZW50IGBtYXN0ZXItZHJvcC1zZXQtdXNlcmAgdGVzdC4NCj4gPg0KPiA+IENvbW1hbmQgc2VxdWVu
Y2UgZm9yIHJlcHJvZHVjaW5nIHRoZSBpc3N1ZToNCj4gPiAtIENoZWNrIGF2YWlsYWJsZSBjYXJk
czogYGxzIC9kZXYvZHJpL2ANCj4gPiAJLSBPdXRwdXQ6IGJ5LXBhdGggIGNhcmQwICByZW5kZXJE
MTI4DQo+ID4gLSBSdW4gdGhlIHRlc3Q6IGAjIC4vY29yZV9ob3R1bnBsdWcgLS1yIGhvdHJlYmlu
ZC1sYXRlY2xvc2VgDQo+ID4gLSBDaGVjayBhZ2Fpbjog4oCYbHMgL2Rldi9kcmkv4oCZDQo+ID4g
CS0gT3V0cHV0IGFmdGVyIGZhaWx1cmU6IGJ5LXBhdGggIGNhcmQxICByZW5kZXJEMTI5DQo+IA0K
PiBzL2ZhaWx1cmUvY29yZV9ob3R1bnBsdWcgZmFpbHVyZS8NCkkgd2lsbCBjaGFuZ2UgDQo+IA0K
PiA+IC0gUnVuIHRoZSB0ZXN0OiBgIyAuL2NvcmVfc2V0bWFzdGVyIC0tciBtYXN0ZXItZHJvcC1z
ZXQtdXNlcmANCj4gPg0KPiA+IFRoaXMgZmFpbHVyZXMgb24gYm90aCBYRSBhbmQgaTkxNSBmb3Ig
YWJvdmUgc2VxdWVuY2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCb21tdSBLcmlzaG5haWFo
IDxrcmlzaG5haWFoLmJvbW11QGludGVsLmNvbT4NCj4gPiBDYzogRW1pbCBWZWxpa292IDxlbWls
LmwudmVsaWtvdkBnbWFpbC5jb20+DQo+ID4gQ2M6IEhpbWFsIFByYXNhZCBHaGltaXJheSA8aGlt
YWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gPiBDYzogS2FtaWwgS29uaWVjem55IDxr
YW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9jb3Jl
X3NldG1hc3Rlci5jIHwgNSArKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmVfc2V0
bWFzdGVyLmMgYi90ZXN0cy9jb3JlX3NldG1hc3Rlci5jIGluZGV4DQo+ID4gOWMyMDgzZjY2Li5h
Mjc1OGUyZjIgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvY29yZV9zZXRtYXN0ZXIuYw0KPiA+ICsr
KyBiL3Rlc3RzL2NvcmVfc2V0bWFzdGVyLmMNCj4gPiBAQCAtMTE2LDkgKzExNiwxMCBAQCBzdGF0
aWMgdW5zaWduZWQgdHdlYWtfcGVybSh1aW50OF90ICpzYXZlZF9wZXJtLA0KPiB1bnNpZ25lZCBt
YXhfcGVybSwgYm9vbCBzYXZlKQ0KPiA+ICAJZm9yIChpID0gMDsgaSA8IG1heF9wZXJtOyBpKysp
IHsNCj4gPiAgCQlzbnByaW50ZihwYXRoLCBzaXplb2YocGF0aCksICIvZGV2L2RyaS9jYXJkJXUi
LCBpKTsNCj4gPg0KPiA+IC0JCS8qIEV4aXN0aW5nIHVzZXJzcGFjZSBhc3N1bWVzIHRoZXJlJ3Mg
bm8gZ2FwcywgZG8gdGhlIHNhbWUuICovDQo+ID4gKwkJLyogVXNlcnNwYWNlIGNhbm5vdCBhbHdh
eXMgaGF2ZSBjb250aW51b3VzIGNhcmQwLi4uTiBkdWUgdG8NCj4gPiArCQkgKiBkeW5hbWljIHVu
bG9hZGluZyBvciByZW1vdmFsIG9mIGNhcmRzICovDQo+ID4gIAkJaWYgKHN0YXQocGF0aCwgJnN0
KSAhPSAwKQ0KPiA+IC0JCQlicmVhazsNCj4gPiArCQkJY29udGludWU7DQo+IA0KPiBpbWhvIHRo
aXMgaXMgb2sgYnV0IHlvdSBzaG91bGQgYWxzbyBicmVhayBhZnRlciBmaXJzdCBzYXZlL3Jlc3Rv
cmUganVzdCBiZWZvcmUgZW5kDQo+IG9mIGZvciBsb29wLCBzbyBubyBuZWVkIGZvciBzZXR0aW5n
IGFsbCBwZXJtcyB3aGVuIHlvdSB3aWxsIHRlc3Qgb25seSBmaXJzdCBvbmUuDQo+IA0KPiBBbHNv
IGltaG8geW91IHNob3VsZCBmaWxsIGluZm8gaW4gc2F2ZWRfcGVybSBhYm91dCB3aGljaCBjYXJk
IHdhcyBmb3VuZCBhbmQNCj4gdXNlIGl0IGluc3RlYWQgb2YgY2FsbGluZyBfX2RybV9vcGVuX2Ry
aXZlcigpLg0KPiANCg0Ka2JvbW11QGtib21tdS1kZXNrOn4veGVfcHVibGljL2lndC1ncHUtdG9v
bHMkIGdpdCBkaWZmDQpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZV9zZXRtYXN0ZXIuYyBiL3Rlc3Rz
L2NvcmVfc2V0bWFzdGVyLmMNCmluZGV4IGEyNzU4ZTJmMi4uYjBiZjRhNWQzIDEwMDY0NA0KLS0t
IGEvdGVzdHMvY29yZV9zZXRtYXN0ZXIuYw0KKysrIGIvdGVzdHMvY29yZV9zZXRtYXN0ZXIuYw0K
QEAgLTEzOCw2ICsxMzgsOSBAQCBzdGF0aWMgdW5zaWduZWQgdHdlYWtfcGVybSh1aW50OF90ICpz
YXZlZF9wZXJtLCB1bnNpZ25lZCBtYXhfcGVybSwgYm9vbCBzYXZlKQ0KICAgICAgICAgICAgICAg
ICAqIGZhaWx1cmUgbWF5IGJlIGlycmVsZXZhbnQuDQogICAgICAgICAgICAgICAgICovDQogICAg
ICAgICAgICAgICAgY2htb2QocGF0aCwgc3Quc3RfbW9kZSk7DQorDQorICAgICAgICAgICAgICAg
aWYgKHNhdmUpDQorICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gaTsNCiAgICAgICAgfQ0K
ICAgICAgICByZXR1cm4gaTsNCiB9DQprYm9tbXVAa2JvbW11LWRlc2s6fi94ZV9wdWJsaWMvaWd0
LWdwdS10b29scyQNCg0KdGhpcyBpcyB0aGUgY2hhbmdlcyB5b3VyIGV4Y2VwdGluZyByaWdodCA/
DQoNClJlZ2FyZHMsDQpLcmlzaG5hLg0KDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+DQo+
ID4gIAkJaWYgKHNhdmUpIHsNCj4gPiAgCQkJLyogU2F2ZSBhbmQgdG9nZ2xlICovDQo+ID4gLS0N
Cj4gPiAyLjI1LjENCj4gPg0K
