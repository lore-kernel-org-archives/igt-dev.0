Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA6ACD37AC
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 01:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C4510E401;
	Fri, 15 May 2026 01:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/f82gNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF6F10E068
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 01:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778810162; x=1810346162;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5lBMpK98XDgg2cVGS7z4ixEVJGtQDf+XZ0TmkkWlR3Q=;
 b=L/f82gNEcQu+LdWlP8ghA5jdrxyT+YfYLjWkIyzWzp0O6qtAsbD0H52A
 irHfK+CdBetiAWWsca59c2f7iZ0r4T4OH7HPIpidOsy8CbFb4f0ZSbasd
 JJai1XToP7uNA8dt6pzWaDWe/ChRFXvPdPtmqagiK5UwJ7dzg8mwRDDAF
 LCzbimufGdY5PP5ET9xt0Ffy467xh00z0AiJmxlNJzg05zhvxKxQp96qx
 95QxrLH/LjViH3k8rsgUGXWoKNooeRHtMekn7Thq60on0AnrAfH56Og6N
 JL44XT7JbPiFZthIwKrQk5sZGC2p+0cPtmHhSKNOpOMDYSThUn9kR66tZ g==;
X-CSE-ConnectionGUID: Z1dvyAYcT92zyRFcciv2og==
X-CSE-MsgGUID: dhMjGTGjQYa015E8mM2lnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="102437997"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="102437997"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 18:56:02 -0700
X-CSE-ConnectionGUID: 9Va+oGOOTvm6ID9LRHWzMg==
X-CSE-MsgGUID: Tf2+9FIzTJ+U7WXaN6LR6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="232157724"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 18:55:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 18:55:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 18:55:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 18:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXQ3IaS9/UYC57z0p5DRpg+xBwjo9Pwqrch9b+45+92J3Ey5PY1Olb3rvcZcPR52j6mU1ezzvnRi46byRQLtNqpbRiVVXXQYKHLp+LxzLp5aU1qeze4sM5hT7imbaY38XuRooQox+etsIAcljKTUz3JQ/+bFO6mlV8d+64oUvaKc3pBHV8mYTmvgjmbxy/gp7IEnRb1ntBL0W2j8+6zEzAsdIJvFwwj1W1ZLj73FRu+ezl8FDmXoqeRnRCbe1mfGUXm37Us9NaHTVBumnF4fVtWrIk5D4VgK9MB5a9YRCsMB+s5swiNPBYcGS7mxqehyt9XETBNyZrl1SpwmJvDy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lBMpK98XDgg2cVGS7z4ixEVJGtQDf+XZ0TmkkWlR3Q=;
 b=R8uG4iE5B8HyYnP3s7GlGXbOZHRFbtnuyW/bDqi7wG2duMDDdziGY6IwI2iH0vv4rzuf1c7kmrIZzMGPCrXvmF5bdc6RaZ2vkSeeub5iwiiHej5J1jNw19fvobUYe4B+uZMdLYQsIR1xWW0eH0PuPlbHIQRnkTYabY4hQiMV691bS21GRQTajqNqelIQcXZ3hz2zw/up4aRjFsx6TeFsssT8ScOVnSbPcIFiJm+7TENj+WRis8q9yy3hDeeQtTF+wojkUt5tfOv+nUTOQEqs9qF/KWUpIwsiPmSGKwY5gVjexj+5QlRZIrhB3dOtw86DPMxlUvCov+DPmhlVeCupLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH8PR11MB9608.namprd11.prod.outlook.com (2603:10b6:510:3a0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 01:55:40 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 01:55:40 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "Purkait, Soham" <soham.purkait@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tools/gputop: Fix zero output when stdout is not a
 terminal
Thread-Topic: [PATCH] tools/gputop: Fix zero output when stdout is not a
 terminal
Thread-Index: AQHcwqewLJGx1IHYZkuGKgamtvxxWLXToqgAgDo7pwCAALgUQA==
Date: Fri, 15 May 2026 01:55:40 +0000
Message-ID: <PH7PR11MB82521EA8BE16ACEF4580B1EB89042@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20260402134522.108322-1-vidya.srinivas@intel.com>
 <20260407133940.134931-1-vidya.srinivas@intel.com>
 <20260514145614.t3nrjqyyi2t2oxcz@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260514145614.t3nrjqyyi2t2oxcz@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|PH8PR11MB9608:EE_
x-ms-office365-filtering-correlation-id: 558e3476-5b55-4384-74aa-08deb2251144
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|4143699003|38070700021|18002099003|3023799003|11063799003|22082099003|56012099003;
x-microsoft-antispam-message-info: takyDbkcTAJu+K4BHaqcX0tCuOP0rLYBiG/32RrBKEmMswPtbQ+Hy06d6/T6t5B7+XRwBbGnZHjszU64Snzs5hKJHSyoXcfV0rLk7xx4qYPX7enEFc4HsK926+3NSsiV1VFsWvi6Y3nl/QO0MZ5KmisG+RrTq2UBP9nqh3Fr0x+KH9Apf3NCoe1LSe1JCUyWcevxidWgI5E5v9XSmrKp3X2wx8kZ2IpecopRS6tmddbhQyPWE6gGhGkpcZldQEIDVOlgAWYtJvRhzCDXcSNYAXQAqEQML/GcdvKSUl/4ESIUV7LrWTDZ6auXmUcBersmmTJt8lIAguWnuluilShvn5LLMEWChpmrVhn/glzJUnkV6W3LiQVjtcD/hCiVgydDGbefgXCQu0sOuBzjbvIVhhi54LvLtOEW4ZTuDoGygFHUiG2gaQ5KQgWD5P2beUzYtfpSbR922az/ddRGe/oEZv68EQ7z9dSsjF+PE6KgVgiHQE1Ro4b+bbFfmK0Sdw9JLnazp2KLVouEddZQu3SfJmQlMI70YtVfaUlOmNUJw66Pzmd5I2Ljiry870zWVVY3H4AgD4VW05mcmbG/Pom2vrIY/oZKGkNgFTm8/pKa193eoGOtku+HzcIYxbWSSctVE13nFgbs3FqAfmpJOYNPtqaClFRAs3Q8TmC6MSMYoH5TZm+o/Ucce6lHhbU41C3gOhQa/o2LgAEOSl0VTNk7JgJFI7+awWaXsrCBcJyqW0Dsf508uurQ7mJ/z72tebfD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(4143699003)(38070700021)(18002099003)(3023799003)(11063799003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDVlK2puMTdEYjVzd0pnVlczczdUd2h2bjgxdUZNcEUrYnJISnozOFROUnJq?=
 =?utf-8?B?ZDlUQkV3YVgrcUQ0dm9iYS9nbGs0UUdsUVRVdTJlT0FLUjJQaXBPQTcwWWpp?=
 =?utf-8?B?a1MyMDQwZ3FVc3JOUVIyaExnRTJsTmRLUEROSUVjZnNxNS93d3RDMWIvQkFV?=
 =?utf-8?B?T1k5TE9zTkIvcmFFamhENW8xd3I0VmNPNUgzZUxEYlg4MWczTXFMRDdyTVM2?=
 =?utf-8?B?cDEydHZwOUVkdEV3V1lqOTM1aU5PME81dVg0ZUNnWlI3djcwelVnanBMbW4r?=
 =?utf-8?B?NzdhUXBvME5tdTFXQjduMCtvS1M5QTFObXdzaDFDL3dueERBTExyT3oxRHBq?=
 =?utf-8?B?WFc2ZjNWZ0ZjbjZGckREOEFCNENNZzVrYjUwZmRRb1A5V2VxYzZ0REU4Qnoy?=
 =?utf-8?B?QmxLU1AvZ0JSMVNTUHR3Ykw1bnhOVmxtSFZYcTF4WFRtbDFYdkE4T01pS0F0?=
 =?utf-8?B?UUdqaXQ1d1BkQVROUmVxbjlwKysvQXFLUndKUGVETjV2cjVmMExoSVZIbFFm?=
 =?utf-8?B?TERoR0Z5U0ZJcFJQTWJER3dEV2duREZ2UG91d25heTZBbDVyUm5aMVJPUjZG?=
 =?utf-8?B?M1BJelhWeHl5cDFOTFBrT3BmUTQ3Zm1tc01rZ1pGZkJhK1N5WXBLaURvU09B?=
 =?utf-8?B?NlFoUFJHZStuMGYxSjU1dUJTY1JoT2pWUitxMkxtM2lrZ2RneU83clozY3hx?=
 =?utf-8?B?MmY5L1pRTUx3bnk2aWIzRjZrS2NlU3pDZmNwT3Q0MGk0dkIrQy9yaWNxZTh0?=
 =?utf-8?B?U082aCtWejdpMFc3d2FYSUVFY0l5eWYyQWU1c0l2ZURKdk1HRytxcm5WVEpX?=
 =?utf-8?B?a2FWUEpnaDhLS09SS1BqU0lIdTJaTmtwN2JONUxiMVZmVm1hMEZIYzV5d0kv?=
 =?utf-8?B?cUVLYkl4RUxlaklxcFVEdG5HTXdxcUpTWDl3QnNlUHBxdkE0UVROTVBNZGhP?=
 =?utf-8?B?VjV3UG1rQmQzODR0S1REaW5BckxOMm5MRHpUOGZFU1Z3OUVpWitnMks5SnFQ?=
 =?utf-8?B?WTlrcXlPZGc1c0wwNHhZYW9mWDh2SUdkM1h5SndMRVRHZWoySll3NUIxSVBx?=
 =?utf-8?B?Z1M5VWxDa1p4Q3EzaW4vdWlHQkZrVUhweWkxSnFWVjN6Y3hmZHNrWGprQkVs?=
 =?utf-8?B?eEYrd2VySGgwNHRRVXBYZll1MkNZK0ZLaUMvd2E5Qk1pb21GVFF0MkdOMGJ4?=
 =?utf-8?B?aFpjbjIrZDBlSW1za3FSTEJ6YXRvS1g4eHZSQUNiRDZLdHRzTCtEd2RtNklM?=
 =?utf-8?B?d0xodEtsK2lDeng1UFg5V2dUUkh6VlRKVGw4TlVrTlJRMldvTlJWeC9kUS9v?=
 =?utf-8?B?RU40c3pSVmJCTXZTWWo1dlQxQWpnaERrY0tiNURMWUQrdHJ0V1Z3bzVtYjhk?=
 =?utf-8?B?OWFBeG52OVZ4c1NuNmluV0hTZDhkRHppQVZPOWNwanhFQjIyWEk3bHdwMm5X?=
 =?utf-8?B?OVBYZjJxTUFGdVh2aG1DZGpVaVczQXJIZzN4My9ONVEzZE4wZmIxOFlHS1h2?=
 =?utf-8?B?TjBjR2NrRU5nNWNJaERTZXB4ZnlWaGtINmdCOFZIN3FkUVltYS9Cek42Tk1E?=
 =?utf-8?B?dnlpeVBlWHZ0UkZDcGxTRlZqVnM2QkkzSG1jenZqNnhBQm9aNWhzb2duWHNp?=
 =?utf-8?B?T1NJdFhOamRLRWF4RlpqejE0ak5sbTRyUk9IeXRobkhXSDZxZHJONmdBZUt3?=
 =?utf-8?B?KzB2YVVCWU5IaW50b3pmcDBSNmVGQWhEeVBoTTVIdTJXMHZnQ2lCVUxnaW5h?=
 =?utf-8?B?T09FNHRqbjNBaU8yUXhsaFdzMk94QjVQS1JpMEtwcHdZNnFtcU1MTkdqSVBL?=
 =?utf-8?B?WmRka0k1YjFZakI2TnhMM0NGbEhhRWxoNGplVHhUS0FGZHBUQ1YrZldtamJS?=
 =?utf-8?B?Rktidk9nOUtKL1pldDREeUxxWmM3UmJ3TXljYkZvRU1kWVplSCtmNUYzR29y?=
 =?utf-8?B?RXFodDNFMEZ5djdPN3ZTYlZFbmwxYTZRTTBKMGFsOXltWE5XTGd5TkZ1UWF0?=
 =?utf-8?B?MDVMYkZLdFg4RFlRNWt3elZtelJsaGZPS2c2NTFidkRoZENBbGY2WXN2cXht?=
 =?utf-8?B?bFdGU2NZYzBWWllaTFRFWjNibWxHMDRLTUNkS3QxaHBZZnEzTHRwOHBHUGVv?=
 =?utf-8?B?OVIyZjU5OGRWTHd3cGNnK09yeHNXVGF5YVNnRXBrWHJZbSt5Wlg1dmdWU1VH?=
 =?utf-8?B?R1pnUnZGSWZjS1BUQnRSMjY0a1ZoRzJWTEQzMHV4WDJ6S2pPb01Pakd5UG9N?=
 =?utf-8?B?c3MxbTFXK3crdnpaNEJvU29MZzYwcVltVzE3d2xiZC9tRUlvVEcxTDBCdCts?=
 =?utf-8?B?aWVwVHhyMHY3KzdTZFVadk0rSlFCYXdMUDZleXN3VUh5cHpnYU94eTYxUlds?=
 =?utf-8?Q?3zvI5Oxbxu2qtvrKRYZFh+WcfXl9jjgicfDf2ynUhwiap?=
x-ms-exchange-antispam-messagedata-1: XZAvHrnj8Y2Awg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kN0D4EDu/wsekZNynxRwhPUqMO0/2aSznMl5o4WuIBwTSCNlwXJhCmSK7z3kdoQknZKbHMtJq2O0JxdVfpdPCD1zp+dXGvFUaBS4aPtCMb+N5vC+GV4uSdoHn4WV18/IaTPjIPj0PpcuSzUO5vc5thGkONE7fUAbjlZpcQjyiGtfMqWVcwjBfP8HZAn5Bm0ESV7LAycG3EAGOHoy4VytixyUZ8MrWvaiIhIgbG4zGqGxaY17taNq8vphQJu41cZ/l4Mn0ZOfM9U2excBkiVxnJK+WZLzbAf59U/baa0G6qLpv20M1wGN3GvCj5cEALrq65O5g7bFgqskw8w4csKW2w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 558e3476-5b55-4384-74aa-08deb2251144
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 01:55:40.6323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iwtgmV80XFFcokwtlhhKrUPzKxfzL8w0I8UbhdCP0Wb+Nwr1g5vmdlIArEU1eoMLGOTRAnyuv3p/V2gJBpSrVitzHpUvW4Ux505YR4ine+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9608
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
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAxNCBNYXkgMjAyNiAy
MDoyNg0KPiBUbzogU3Jpbml2YXMsIFZpZHlhIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5jb20+DQo+
IENjOiBQdXJrYWl0LCBTb2hhbSA8c29oYW0ucHVya2FpdEBpbnRlbC5jb20+OyBpZ3QtDQo+IGRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gdG9vbHMvZ3B1
dG9wOiBGaXggemVybyBvdXRwdXQgd2hlbiBzdGRvdXQgaXMgbm90IGENCj4gdGVybWluYWwNCj4g
DQo+IEhpIFZpZHlhLA0KPiBPbiAyMDI2LTA0LTA3IGF0IDE5OjA5OjQwICswNTMwLCBWaWR5YSBT
cmluaXZhcyB3cm90ZToNCj4gPiBXaGVuIGdwdXRvcCBvdXRwdXQgaXMgcmVkaXJlY3RlZCB0byBh
IGZpbGUgb3IgcnVuIHZpYSBhZGIgc2hlbGwgKGUuZy4sDQo+ID4gb24gQW5kcm9pZCksIHVwZGF0
ZV9jb25zb2xlX3NpemUoKSBjYWxscyBpb2N0bCgwLCBUSU9DR1dJTlNaKSBvbiBzdGRpbg0KPiA+
IHdoaWNoIG1heSBub3QgYmUgYSB0ZXJtaW5hbC4gSWYgc3RkaW4gaXMgYSBwaXBlIG9yIHJlZGly
ZWN0ZWQsIHRoZQ0KPiA+IGlvY3RsIHJldHVybnMgLTEgYW5kIGNvbl93L2Nvbl9oIHJlbWFpbiBh
dCB0aGVpciBpbml0aWFsIHZhbHVlIG9mIC0xLg0KPiA+DQo+ID4gVGhpcyBjYXVzZXMgdGhlIG1h
aW4gZGlzcGxheSBsb29wIHRvIGltbWVkaWF0ZWx5IGJyZWFrIHNpbmNlIGxpbmVzID49DQo+ID4g
Y29uX2ggZXZhbHVhdGVzIHRvIHRydWUgKDAgPj0gLTEpLCByZXN1bHRpbmcgaW4gemVybyBvdXRw
dXQgYmVpbmcNCj4gPiBwcm9kdWNlZC4NCj4gPg0KPiA+IEZpeCB0aGlzIGJ5IGluaXRpYWxpemlu
ZyBjb25fdyBhbmQgY29uX2ggdG8gZGVmYXVsdCB2YWx1ZXMgb2YNCj4gPiA4MCBhbmQgNTAgcmVz
cGVjdGl2ZWx5LCBzbyB0aGF0IHdoZW4gaW9jdGwgZmFpbHMgdGhlIGRpc3BsYXkgbG9vcA0KPiA+
IHN0aWxsIHByb2R1Y2VzIG91dHB1dCB3aXRoIHNlbnNpYmxlIGRpbWVuc2lvbnMuDQo+ID4NCj4g
PiB2MjogVHJ5IHN0ZG91dCwgc3RkaW4sIGFuZCBzdGRlcnIgZm9yIHRlcm1pbmFsIHNpemUgYmVm
b3JlIGZhbGxpbmcNCj4gPiAgICAgYmFjayB0byBkZWZhdWx0cyAoU29oYW0gUHVya2FpdCkNCj4g
Pg0KPiA+IHYzOiBJbml0aWFsaXplIGRlZmF1bHRzIGluIG1haW4oKSBpbnN0ZWFkIG9mIGFkZGlu
ZyBmYWxsYmFjayBsb2dpYw0KPiA+ICAgICBpbiB1cGRhdGVfY29uc29sZV9zaXplKCkgKFNvaGFt
IFB1cmthaXQpDQo+IA0KPiBUaGFuayB5b3UgYWxsIG9uIHdvcmtpbmcgb24gdGhpcywgSSBtZXJn
ZWQgdGhpcyB3aXRoIHJld29yZGVkIGRlc2NyaXB0aW9uLg0KDQpUaGFuayB5b3UgYWxsIHZlcnkg
bXVjaC4NCg0KUmVnYXJkcw0KVmlkeWENCg0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaWR5YSBTcmluaXZhcyA8dmlkeWEuc3Jpbml2YXNAaW50
ZWwuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pu
eUBsaW51eC5pbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogVmlkeWEgU3Jpbml2YXMgPHZp
ZHlhLnNyaW5pdmFzQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgdG9vbHMvZ3B1dG9wLmMgfCAy
ICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dwdXRvcC5jIGIvdG9vbHMvZ3B1dG9wLmMgaW5k
ZXgNCj4gPiA5YjJlOGNiNmYuLjBlZDVhZjQ1NiAxMDA2NDQNCj4gPiAtLS0gYS90b29scy9ncHV0
b3AuYw0KPiA+ICsrKyBiL3Rvb2xzL2dwdXRvcC5jDQo+ID4gQEAgLTYwOSw3ICs2MDksNyBAQCBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+ID4gIAl1bnNpZ25lZCBpbnQgcGVyaW9k
X3VzOw0KPiA+ICAJc3RydWN0IGlndF9wcm9maWxlZF9kZXZpY2UgKnByb2ZpbGVkX2RldmljZXMg
PSBOVUxMOw0KPiA+ICAJc3RydWN0IGlndF9kcm1fY2xpZW50cyAqY2xpZW50cyA9IE5VTEw7DQo+
ID4gLQlpbnQgY29uX3cgPSAtMSwgY29uX2ggPSAtMTsNCj4gPiArCWludCBjb25fdyA9IDgwLCBj
b25faCA9IDUwOw0KPiA+ICAJaW50IHJldDsNCj4gPiAgCWxvbmcgbjsNCj4gPg0KPiA+IC0tDQo+
ID4gMi40NS4yDQo+ID4NCg==
