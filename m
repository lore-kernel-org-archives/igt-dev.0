Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF08CDE001
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 04:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79EC10E9A2;
	Fri, 14 Nov 2025 04:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XS7bKy1j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0DC10E221;
 Fri, 14 Nov 2025 04:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763095957; x=1794631957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fz8xk8BjyVWAD4PY4aBSCWG3CxkqOOO7NwL68iwEiUM=;
 b=XS7bKy1j9m0OIgmV0OxbWc9Qna0Ztv7uzMmdUcmorU5wJTgE57Cm7aPY
 zux7Esx00NpqoDVHvF/YrUYz6mOgK2jSri5CK2kBGmYoraMDgAOZgyymg
 FFAdDXMPwLxDPn6dAbQmm9yphTS5/UKnowB0p8AucnoUZlO8zx/iclGx2
 OVVlUFhCADKJcyi7Gv+wjqij92UCyijK+prQqF6KDmjGDy8YN238POZGI
 FNKIwfncEz2W4GRqF9kdEJP1cBsDD8n9XrwMr6311zcGrIM5uqQCQU3jz
 +6BsfJ3cAIUEt1WFmhpgyT/kdaFaS/w+55UdXF3Yjxa5f4QISrAhAdWQk w==;
X-CSE-ConnectionGUID: xA1zkBMVRsW4kE8l7c6KqQ==
X-CSE-MsgGUID: VaR59alERgCFFErf3MCbow==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75504992"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="75504992"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 20:52:36 -0800
X-CSE-ConnectionGUID: AZIgq01XQJKZHZpYvT1TsA==
X-CSE-MsgGUID: VUks1gwPTASdWbyEN1nKrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="188974646"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 20:52:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 20:52:35 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 20:52:35 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 20:52:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQvfZC1S9N8H7r457bJLbwEMVWyAEosydvfUatp/HG8YmJNDMooA0Ug3mNPBiH98l2/P63geJ4vCTSUylk8ddpqIiOMcQE67WYwqOxvw/Hi21FvX7RqFrb26/V/qqGvJQmxNZDdF5hMuxhv4HKAnloyrMCEHmbSyaTx3yO/VoDPA55GLlxlDu1Lw8RQV7YUvkEEfLxgEM5UTv8bW+05PkOPLFOFHvHS6kD20pEyIIHDv9zonHvn7/MJijBrd6eyrhZZSNIXXRN73oh/NmHEtoRQqwiNM0Q2f6GIivze9aUsXafIr8YmytKl23VcTvnSfWOA4dORSY/DLKJZDpKJ7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz8xk8BjyVWAD4PY4aBSCWG3CxkqOOO7NwL68iwEiUM=;
 b=JqJRuya09USkHPRloqUTvySfaFyPMiXpYdBC0zjbkMlYncQRFuev1PakctSfsOxGvb9wXx14DX6SlZEv/95Br79UVDsPG6UuCGeHLooDFp9r7u8FLqXtsbD5Ak29eTvfGXOFJNKCVPgGYCXEiK7b9nNFymWUntliqXWb6BDD6ZgZp6zX+HMl/QLAkb3rj45RTXnlRih5RG3bQm8ppwF8RQBywSUGcH3F8tvIU5UAUICnfYNDHz0qaMegC4+aGWeATAIMkhr2MprqEFYW3fsHCICGI2YONYlLpQ4aWW9ktD5EMxLfFq1c01xOIvUeoIGyyoW11C2J0DBI1Vj0uOgVuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 04:52:32 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 04:52:32 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2dlbV9s?=
 =?utf-8?B?bWVtX3N3YXBwaW5nOiBSdW4gc21lbS1vb20gaGVscGVyIGxvb3AgaW4gYmFj?=
 =?utf-8?Q?kground?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvZ2VtX2xtZW1f?=
 =?utf-8?B?c3dhcHBpbmc6IFJ1biBzbWVtLW9vbSBoZWxwZXIgbG9vcCBpbiBiYWNrZ3Jv?=
 =?utf-8?Q?und?=
Thread-Index: AQHcVIycadyNfz3khk6ND6cv5+hU1LTwg6bw
Date: Fri, 14 Nov 2025 04:52:32 +0000
Message-ID: <CH0PR11MB5491BF68539E64584DA99B5FEFCAA@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20251112104913.701052-2-janusz.krzysztofik@linux.intel.com>
 <176302360206.48346.2771500328291882681@10055242dc62>
 <13158851.VsHLxoZxqI@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <13158851.VsHLxoZxqI@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|MW5PR11MB5907:EE_
x-ms-office365-filtering-correlation-id: 7c46bd14-6219-4f7b-1b52-08de23399f18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|38070700021|7053199007|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?a1FhSmJwUG9qaHFnNmdwd2ZWcENjMUc4NVFkWmRNNDFJcDg0elhybmlEb0o4?=
 =?utf-8?B?RjJqUmJIUjZDZHZTL1lPc2VwZUNEUVJmRXlxWjZtYkZRL3ZYSnBiZ3Z5bzVC?=
 =?utf-8?B?cy9sWXAxWlk1YWJvT3pIVmRJYlAxZXpOcFB1cUg1Qi9UbS9Wa1puOFZNVXR5?=
 =?utf-8?B?M09mSkwvMGIwZXF3ejhQZDNIM2pOYkNLemNlcStIWDRhTFE3aHc2ZUVmODN3?=
 =?utf-8?B?a0daemtnZU9XaFJleHJpZmduL2VvVndPdlhBZ1VXdmdJbkpMT0R4ME5LV0VQ?=
 =?utf-8?B?NTJJVHZGa0w4dXlBbWRWVU9RbHdXZmxtWUhyY240anVUcFkreDlrOWJ6eVBP?=
 =?utf-8?B?SVFMOFRpeHdYL1BDZXphVEQvVlIrSi9ENjgxN0R2R0ZubEp6MEh2SXBUZmxL?=
 =?utf-8?B?RjZKRHp3M3I2cFVJZHhvUmFFSkI3RHJrUlpaR21YZXlpNm93K3VqaDNYaERG?=
 =?utf-8?B?STZTR3didFMyWDlVdTR4YTIybFFvdWtGYk9kV2N0Zk8zQ0hEaS9BUm84bnFY?=
 =?utf-8?B?VXpLbG5DQkZuZitaNjdaSnJTY2NBTVl3N2t5U3ZvNzExSC92dk9zNkI2bVNa?=
 =?utf-8?B?M1R4UFErQTZaemdaSmRzZ1Jvd1MzaG96SEZ1RlBzSlUvK1dKQzg1SE0vWDRN?=
 =?utf-8?B?WWZ6dGVZeHdYSTBzZjFEbkZIeVE1U2dLR1R3WXRYMmt5Nld0MGZBM0xWVm9i?=
 =?utf-8?B?bmlweWxNaTR3eC8zNTA4bkl5NjhnL1dGd0NVRzhMZHdlaTA0QVVwMzdyb3Zz?=
 =?utf-8?B?c1I1U1JWbUZRNHNhRnFVRFlLbE9tNEFtakZaVlI0K0xTTmlCYTYvZ2d1STlQ?=
 =?utf-8?B?cnNXekhvRi9sUE9BL05xc1VBWGhnWnlVdk5xMmsyNHg1RW80SS8rTHgwK053?=
 =?utf-8?B?U2g4eXpRclZUTWlaL2V5QysrWGFjWnh1WTVaOGc5azc0VTdPT0UwWkx6U3Ny?=
 =?utf-8?B?aWZ1ZmtHT2s2eTh2ZTB3QUFHKzl5b0pQaExaSjI5NXhGbTV6SnljSWJuVi8v?=
 =?utf-8?B?KzcrWTBCVVIxR3Z0aWxKR2owZlZiSHc1aWxwWDBwMEFYK3V2RUcrSmptWS93?=
 =?utf-8?B?Q1hPVnhEUldHT3AzeE5YUXNLNk83WlE0bjdFbHJsUDV5bWthanNGelJJRFh3?=
 =?utf-8?B?aVFMeFc2QXZJK2M2VVE4Mkw1QjYyUlhEbThrOGFCaEIvMFBzNmEyd3FSQzVP?=
 =?utf-8?B?K0hJYmtqQmxuamdRRmZ2SWxFZGxjRm84VkdudFpyT0xUVVYySC9DWitjTUpB?=
 =?utf-8?B?cjRQaXdvNS96OG1lOHlabVJPZUlMdlExTytjRGRYY0x5MkRadzdNRW9sU0Z3?=
 =?utf-8?B?bk5LTXJnU0VZMVJ5ZFI4OE8zeVd3eGc1UW5RdXdHNTdsdkYxUngvd1RUR0FO?=
 =?utf-8?B?Wk1DY0FjUXNqZll1WXgrUTVPVGhvRTBFVURVbU1lK2I5eUtYcGk5d2p0azhq?=
 =?utf-8?B?RWZ3c1BzM1NZZHAycmZ4UFlFamE4TGo0dmU3NDU2bTJyblZyZ0pGM2F0a0l6?=
 =?utf-8?B?Uzl0ZldVWEZGK3lwS0tQQVZEZDl3Y2N4M0NOUUZoTk56K2Q5MnBMOEtRRW13?=
 =?utf-8?B?eEVkaVZidlZ5djBUNnVhZUhiQTBZYjJFYzdIbDRvSkFrbGVBdkRrN2c2OVlq?=
 =?utf-8?B?OUQrUlNkZkZNY0ZFc3owOVNMWTg4aUFkOS9hNG56eVlYWG5Pb2k5bitIcEJ5?=
 =?utf-8?B?STNpYU1veDFVU3pTYmErZmQyUUZ0ejAzOEpoOWJ5aHR0QTFrdXJYOU52T1VX?=
 =?utf-8?B?TnBQVVdtMHFmc0YzdjRrS3FGWFdEUW9WeWlwLzZwWkFvc1BHZGxtY3BHNTB1?=
 =?utf-8?B?UkwyL0pKeFdGN1Q4dEEzMWtGdGw4cEE0eHRZZzAvY0haTXFYZ1VpSGtZd3o5?=
 =?utf-8?B?d0d5WEZQV25ERnN1ek5lZzRjQVBPWExvUko2S1luWkx6WGp6bEZGbkF4RWts?=
 =?utf-8?B?NExnTmpVMnlVUXVWY0NuazdrWUpwNVdINnBkMWs4T0dwdWR0dHdXTkQ5TWpy?=
 =?utf-8?B?a25hUlpQSDZRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700021)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cU1WVWNhanlmQmt3azBmbG13Q3JLajl3U0RMbXJvM1lNTUtFcHNuTHRySmhN?=
 =?utf-8?B?UXBqOG9ZYUZBNHpPYXdEZ2xuUFRIMkVZc25YalVGcDh4a1NoV2RhYXVzR29B?=
 =?utf-8?B?MGh0VU1TWDFCSS9ZQXpLd0pjaHpGLzNmMXl0MHlweURkcU1IeUIwb0ZyTGth?=
 =?utf-8?B?a0JtUGtCcGtvejBiQVlVbGJUY1NkaVdWU2JaMk1JbTNNNXRNeGZhWUtKWG1v?=
 =?utf-8?B?U0pJVW9qb1N0a1NpSGE4TU1mNTM1OCt0V1RIT0JkV3pseEc2MmZEWDQ5V2I2?=
 =?utf-8?B?NzMzZ1MySjVidmlkVzNKQUVOaWErRm8xTm56SnZaa1Y2Nm1mL0kzdWk2NW9m?=
 =?utf-8?B?dExzc1hjQSs0em5BWlJhSXlSc0RLS2ZjTlpFNkJtY2VKOGhKUU96UkhtNS9D?=
 =?utf-8?B?K0w3SkIrUGZlb1pkSlBjVXpjdzlsNkdUaS9kT3JwckNzZGsxOTNvVGNsV1FU?=
 =?utf-8?B?MHM0WlVORUFLRzZ5ZDZRTk5hc0lpK2FmZE16eGZHNFpUVEkxLy8rVWVLckx6?=
 =?utf-8?B?RlNLbjhIbzdEaTNDeWdCT2tkM0Z3dlhhbFJKN1NvMXU2TnZkbk5uMWdNK3ZE?=
 =?utf-8?B?dHcvdDgrWWtaR3pJLy9lUUhVZDdSZjhvSjBVZklIZHZZOU95YnhMOHNrSi9R?=
 =?utf-8?B?Y0YvMzlWQXc5Zmp0d1ZIMXFYYmV4UnNTNEpmbU5nelhKcWVzUnczR2VTWTJn?=
 =?utf-8?B?S0djejY3NFd4YjNaakRYcG8zVWU0enVuQ3ZGbkJ0QSs2VDFZd2RnTUh5Zkls?=
 =?utf-8?B?N0YzMks2N0VtTkJVVmtaV2JhNHJZajAzZU5NUVhrNXZvZE5rOGNKc2xidUNV?=
 =?utf-8?B?TENzbU04VlRCR2diMk83S3g2Unc3OUwvVyt4VEpmRWxzMlB2ZVB4dXFZKzNw?=
 =?utf-8?B?NUVvcmcyNDk0blh4OGswSjd6ZXExSmtZVUFubUxpZXg5bTc5Q2JROW5yS0NI?=
 =?utf-8?B?UURiM0hvQ2JkUmpSdk9rYjZMRW9STjN2SlU5cXJqdlJ5V21RWDVSMXl3TnlF?=
 =?utf-8?B?QVJTSnJXOU5mc0hWK1BuRnZLRGc5T3QzS2ZXTUw2UWkzams3ODNRYlIwV2ts?=
 =?utf-8?B?Wk9mVk5SYVY5bWgrSEtSLzNIQmZ3S3JiZnZhM3IzZlJMMHpHWk96czRHdHhq?=
 =?utf-8?B?Tkp2cXU1VFBJMzNGT3owVEU3N1pnajcrcXR0dzRoMVd2dzJ2OFVJV0t5QVBq?=
 =?utf-8?B?cVlMRlFDcXNmSDA2WEJ1ci9QMVM0aGM2RGlOUnh5Z2hOWGVVcS9WcGI1aW9u?=
 =?utf-8?B?Nm9Nbm1SeW1KM25qTitDYjVlRzNjd1I3emxJQVNZaG1TUC85Nm1kclpFZElv?=
 =?utf-8?B?WUtpZDUwQmRmK0k1OXVaeitZVml1SFF3azgxV1lXbitoSC9OL2lLbHhXUzlI?=
 =?utf-8?B?b0NBV1RxMGdRQ3Fnc01pQjVEYkljeGVBSFFTL2ttaFFMY1lwL3BULzQwUkow?=
 =?utf-8?B?ZzYzR3poOXowRzZDYTN2d1ZyQWthWFFmbURIV0UzYUNwWUtYcVE4WDhDa1J2?=
 =?utf-8?B?UVg3aGdHWVdhNXNtbUxBSjN5MzcvSWhCNDFHQUZMMTdtOEkvV2NqMWVDT3hF?=
 =?utf-8?B?dWRZeUdrL0FHSktLNUFUL05uN0ZDR3NOb3UwN3NaaUdMMXRZQnd5aVgwMWVq?=
 =?utf-8?B?bUR4eC9MS3MxSHhyV0VDTkpPZ3dYYkpjbUxEYjVEUWU1c0wrRnlMRHZpZ3h6?=
 =?utf-8?B?djE2NjBqd0hnNWhNd1NsZnN4b0pieWxkOTJMeWhaZG5sdjdGb1R6ejJZYWVt?=
 =?utf-8?B?UVpSei9vMEtsdlFLQ0wvcEJQcS92MTl3elJDc3ZCa0dKYTNneFZrVGh5WlFV?=
 =?utf-8?B?T2NvRWVPS3o5S2N2a3A3ajkzRVZFRmUzSXdDa1Q0OXhnWnhRMWtySlRuc0lW?=
 =?utf-8?B?RHQzUjFuNWpRaklHVEloTGJlUEFpVnh6QzJCQTQzeFpNMnc0dDhIQmxKZ3Zi?=
 =?utf-8?B?a3dRQUtmeVZTdkRWLzludkhOcFZUc1pFa1VZSmtRVG5vY0Q0VU9FMkZTNlFC?=
 =?utf-8?B?Y3o5TmlVWHN4TmtZZGNXYXR3S0xJL1VudTgxTzdkekNOTXVGdlBLVUpEa0tE?=
 =?utf-8?B?QlVUVCtVYVp1dFFxUm5Hb1hUd2Y3Q0dTNld4cXB6RXdmdG50RUVCK0lNSlZ2?=
 =?utf-8?B?NDVhZkhTV2QzL3hnT3NNRG93dmJvWERpNHJtUmNlaUpoamt4elpGRGtzbmJL?=
 =?utf-8?Q?yw5sds4f7009p2uF9Aol2hSJD1wJRRwUxu7aRApGPwZz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c46bd14-6219-4f7b-1b52-08de23399f18
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 04:52:32.1811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGjnpT7DufcSwPBxrqj/BfQDn4c4NMy72TE3YxesxxiopiA15QUcRWGTsJ7uixSXlP7+pDbgRDEH6NUJPM19KtF25/NRXoEyxWOmqZSWWkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU3NDI5Lw0K
aTkxNS5DSS5GVUxMIC0gUmUtcmVwb3J0ZWQuDQoNClRoYW5rcywNClJhdmFsaS4NCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKYW51c3ogS3J6eXN6
dG9maWsNClNlbnQ6IDEzIE5vdmVtYmVyIDIwMjUgMTY6MjkNClRvOiBJOTE1LWNpLWluZnJhQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpT
dWJqZWN0OiBSZTog4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvZ2VtX2xtZW1f
c3dhcHBpbmc6IFJ1biBzbWVtLW9vbSBoZWxwZXIgbG9vcCBpbiBiYWNrZ3JvdW5kDQoNCkhpIEk5
MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnLA0KDQpPbiBUaHVyc2RheSwgMTMgTm92
ZW1iZXIgMjAyNSAwOTo0Njo0MiBDRVQgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0
YWlscyA9PQ0KPiANCj4gU2VyaWVzOiB0ZXN0cy9nZW1fbG1lbV9zd2FwcGluZzogUnVuIHNtZW0t
b29tIGhlbHBlciBsb29wIGluIGJhY2tncm91bmQNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1NzQyOS8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0K
PiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIENJX0RSTV8x
NzUzMV9mdWxsIC0+IElHVFBXXzE0MDQ0X2Z1bGwgDQo+ID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0K
PiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21p
bmcgd2l0aCBJR1RQV18xNDA0NF9mdWxsIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlm
aWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdl
cyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4g
SUdUUFdfMTQwNDRfZnVsbCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWlu
ZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50
IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVz
IGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0MDQ0L2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lw
YXRpbmcgaG9zdHMgKDEwIC0+IDEwKQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gDQo+ICAgTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IA0KPiBQb3NzaWJs
ZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhl
IHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18x
NDA0NF9mdWxsOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJs
ZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGttc19hZGRmYl9iYXNpY0BsZWdhY3kt
Zm9ybWF0Og0KPiAgICAgLSBzaGFyZC1kZzE6ICAgICAgICAgIFtQQVNTXVsxXSAtPiBbRE1FU0ct
V0FSTl1bMl0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0t
dGlwL0NJX0RSTV8xNzUzMS9zaGFyZC1kZzEtMTgvaWd0QGttc19hZGRmYl9iYXNpY0BsZWdhY3kt
Zm9ybWF0Lmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xNDA0NC9zaGFyZC1kZzEtMTMvaWd0QA0KPiBrbXNfYWRkZmJfYmFz
aWNAbGVnYWN5LWZvcm1hdC5odG1sDQo+IA0KPiAgICogaWd0QGttc19wbGFuZUBwbGFuZS1wYW5u
aW5nLXRvcC1sZWZ0QHBpcGUtYToNCj4gICAgIC0gc2hhcmQtbXRscDogICAgICAgICBbUEFTU11b
M10gLT4gW0ZBSUxdWzRdICsyIG90aGVyIHRlc3RzIGZhaWwNCj4gICAgWzNdOiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNzUzMS9zaGFyZC1tdGxwLTMv
aWd0QGttc19wbGFuZUBwbGFuZS1wYW5uaW5nLXRvcC1sZWZ0QHBpcGUtYS5odG1sDQo+ICAgIFs0
XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQw
NDQvc2hhcmQtbXRscC02L2lndEANCj4ga21zX3BsYW5lQHBsYW5lLXBhbm5pbmctdG9wLWxlZnRA
cGlwZS1hLmh0bWwNCg0KVGhlIGFib3ZlIHR3byB0ZXN0cyBhcmUgaW4gYW55IHdheSByZWxhdGVk
IHRvIHRoZSBjaGFuZ2UgdW5kZXIgdGhpcyBwcmUtbWVyZ2UgdGVzdGluZywgd2hpY2ggY2FuIG9u
bHkgYWZmZWN0IGdlbV9sbWVtX3N3YXBwaW5nIHRlc3QsIG5vdGhpbmcgbW9yZS4gIFBsZWFzZSB1
cGRhdGUgQ0JMIGZpbHRlcnMgYW5kIHJlLXJlcG9ydC4NCg0KVGhhbmtzLA0KSmFudXN6DQoNCj4g
DQo+ICAgDQo+IE5ldyB0ZXN0cw0KPiAtLS0tLS0tLS0NCi4uLg0KDQoNCg==
