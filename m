Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BB6CD6E43
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 12:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07CE10FE08;
	Fri, 29 May 2026 12:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YP1wPMRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618EA10FE08
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780056401; x=1811592401;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FX3UdnRm5O5Mw6kEUO4sH6fg6nUBE3lUhJyI/0MCbPc=;
 b=YP1wPMRPN319qAH7zBUlMHwGOHWwBJMB+2IBBUYcLwIIWO57QA2oBn6I
 J61DBl7FxI9IhevTR+5tS3OJ4gRPEKk65TT/yvhnNtoWXKV38TyZwIiGH
 fgj1/MW4U6R32AkymCn7DDNiOMrSDWAmBEKFbEifWx6Pmb2ePJZunnW4J
 tX2pUXGloqj8GBCzN9/ugF9lC5UxXoLTuorbnoi2SvbcZSHAth0406iWz
 8mzC+oKIUS4P+RPQIPKTTrjjkIkYPrOP7XShW9WvpGwj1fjJktNoXVTiL
 ggZmowdDX7kPMWKgb+Vuw5Bkup6yHCbOrbsXB52e3q0frL1wWvykjpCY1 A==;
X-CSE-ConnectionGUID: oepGGrOfSbm8owbDMRJuVQ==
X-CSE-MsgGUID: bgGU3xAJT52UxwsZmTCabA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="68443195"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="68443195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 05:06:41 -0700
X-CSE-ConnectionGUID: mjA4Qa4vQVKlwobCxbo4ag==
X-CSE-MsgGUID: UYZ8U/o8S7amDM2pZMMO8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="238431814"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 05:06:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 05:06:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 05:06:37 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 05:06:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leBRsq/W85dW/BkfXnmFyMP1EpOjqmPOVOUBURqKRrugn2HOVyhvPTfhFls1uWzPluUCcHRJpu8TLvsUeyKC5wSW9a9/lmOGvhOw2H8OALA1O0FeOiOs5xorfzKM4LLQBxoHBBypsuL3A0Ouy4+qbuKFnJfz00DApyr0bUnC88MeOBE3Kkfj6OKwpmdJ8UI+vCI72ztdkB4es7vUQgrjsjY3j2yF+xHWBVyt0r2WD71pL7ZOKun/lk8lvW5l9dDdhGIRsAIe+KAh/qtOJejkhrxLqlMppddIZiwy+Seo8k1nZTEWQEinxQXkNnSAGK4qB6C1z9ldbudWCZH8RX+vuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FX3UdnRm5O5Mw6kEUO4sH6fg6nUBE3lUhJyI/0MCbPc=;
 b=NCndvBVNP2VpEHscWljud/pr70hzpT0AGmBmWER9qwpKRAXzZJdCYC4j1n/ucv4ZJn8Az+CU6RuGMu5++kmJYWUfxdCDwsMER7/h5fIANK7OF8znRC6G1CGjql8ERFLFaEaAKTKIwr136Fm+h/rlPXg20psezM0Gyzgg1xiTgHUG7DecH7MYVFl28t04iHlwL5gJYQx1e4sPNi86zpxENeabbJL1VV0z67d9sVDRh78SjgteUT8LwNJJZ7u3Rq53QFsRRqndg4yR75L6Yx9bVJCBW//sXQnQWNM034YaO8xqMf/p3vgXaSOsmtGZpZuAq6u1xGxZXkXSIeEsMBgp/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Fri, 29 May 2026 12:06:35 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%3]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 12:06:34 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Thomas, Sobin"
 <sobin.thomas@intel.com>
Subject: Re: [PATCH i-g-t v1 0/4] RFC: Create smaller dmesg reports for a test
Thread-Topic: [PATCH i-g-t v1 0/4] RFC: Create smaller dmesg reports for a test
Thread-Index: AQHc6HBTYdanRA9ltkWSpYQFKgbRmLYk9jYA
Date: Fri, 29 May 2026 12:06:34 +0000
Message-ID: <5a9494611b1644f3113d6972e55103e3aeead1fa.camel@intel.com>
References: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|DS0PR11MB7902:EE_
x-ms-office365-filtering-correlation-id: fa640f14-3bc0-44fe-360d-08debd7aba87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|3023799007|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Vmir0XubIi8npVlKPI55epJhdMeRUZ+OAouqx8UiBiUo5Teiv/nL11/eSfu+HpLPTPKdIf7HWqYdk36Q1Y3DBFB5bi7gzl/ycof2l1JqISnkhBUIsKF7ZpN73DH5fLIDG5S66nIELwjsZp1SGs7lTgUR4gc800W2aEw/l3zpKzIXD/6hJYrSKpQOTZ1gUfrG0HWdP8H0oeKDJPClw61DscQJM7Zi8leM8tn4644GwCOZr3Plt2MTKZ3FyzT08aBhJLwO/EOBaRrivUFo0IWm4N1l5hFvHHQEyqAfmmQWweAkItYE0i5x2neM3Tzy8wHfbOmQNyoThQURZlyoy+Vu8KyPT7lUewv7WlFMCZrZQ8/OT4TTdBJjmQzfcJ8XVmjtj+SgSIK058+A8JKVxJbb5UpBOy/gJobXI5WytKtD2AOAxHup9XXDGGoYKu5/bOB9ePcJxnp7Xq5BjCXtR4alDv1qgMgDg4pTPvFjiwq3xeXYEcqFA3G/n6vVic+9aK9N3RjZTj2ScnRxIOqU3lTKJr1hlYhnxO42dul9MODvc8hH3RzRCz+dRoCF4fXH3x0ESKUoP9e5cyIAjn/Z8tEshLBBGzo+FlytqSZz1xGzBeIV2d2Ro9oRxVuGa3DLQL84F7Ms63C8x1a9JrSwq2h19a+HWQ0vzrUcgs75vsaCRv/D0XgN+HqdPoydTmA/Zoj467T6ZAXgJ/bn7TQ0iqFrZqI+vsfRziSJJ+GUA0qrAjwPmB83hQ8FzdlCIn0+FULD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dE9zZ2d6anJPdWE0VnpybW9FcFV2dGM4dDNMYjhkMTBKK0dPeWtsNHBZeFhk?=
 =?utf-8?B?Vzl2Nm9jZWlrbDY2YUFIVnFFTEszOUFIeStwQlFXbytZdUx4Q2ZTY2JpV0d3?=
 =?utf-8?B?UTM2TVhVV2s2VWVOclJkM3BGanVpdnorQnIxZ1Qvblc3c0NHdW4xZnAreGxP?=
 =?utf-8?B?UFhDMitXTXNVZ3NpdXZINGlxV2N6VHhaVXlVQnpwQmhZb1lzMGJsNHVMK2pa?=
 =?utf-8?B?anFNQjRlY3RDdmYzZE41b0JQaWVudzBmU01QSTNmSGg0TTdwVG8rZnZpaFk3?=
 =?utf-8?B?RVBmMnRsRWtjSWViM3VrdkVkUDVCMVJlVDBSZWp3K3JjK1U3dnBzdVBxREdV?=
 =?utf-8?B?bWhhQ08yMnhBYjh2eitHb2w5U0h1U1RncTRKUFNRMGpZQS8wejlUeTVhRmxp?=
 =?utf-8?B?YlZrYk1Qa0hwT3lZNi9XQVkxWmZNblVaa0kraGR5SmFMYjZFeHJqSzNCREhH?=
 =?utf-8?B?SVFnV2cySWUweEZnSWthZ0pXNHVMc05wVjArT1BGTmNncWlTODZnMkNhdDFs?=
 =?utf-8?B?aWVtV1QrUlRPcEJxUUdZQ3hPY3VFVysvMVhpaW9qOEpzdHNOTkdEQXZCQUty?=
 =?utf-8?B?R2VrRWhVR1FRbENyVVAwcHZwZ0l5OFU4UUlJRzJFWUxTWno1TXZUZGxaRSt3?=
 =?utf-8?B?M21jUmxJc3oxUHVaR2hkQnkwQ3lzZ1BMTkhLRElrM2lIOFhMVUtLaGZ4aEtT?=
 =?utf-8?B?NmNUYm9ldjNrTGg1QlgvRW1tVFl3aUN2RHVqckppVysyTjlvTmdocGZXcXJF?=
 =?utf-8?B?b1Q5NHBDNFpPS2pZbjFrMXJ0WW5SLzVNcjJabXFIV0thSkR6b1QxSktyWGxN?=
 =?utf-8?B?dEpoRERLaFlCVlcrWUluclo2aSsvMjhGZ2tpaGsvKytBVlcyZnVzMG9PUnEr?=
 =?utf-8?B?M2prKy93aFF5b3YrZTZwUkN5WHBoV0pIbktGKzhwRERFU214WWZMaE9TM3hW?=
 =?utf-8?B?cG5NOWUvRUlIcnArUXJkV0xKVHp0WWJjWEIrTFVhWCtmTFp6NVZ6WlZlamlP?=
 =?utf-8?B?dFo3TlVoSEhKazY3R2N5L1lFS1U4T2dWTmhZT2hXcksyUlpjdzU0bTJiRWlJ?=
 =?utf-8?B?NU1Xc2orTDJGZjdWK055QnNzS0lPMWNvZXNGSlA0OXhuSzJCdGpTeDdMeHR1?=
 =?utf-8?B?YThUbTRTeWt6dnpQTlJpcitsaXBXUnZWREhkMEV2U0hRb1dMZ2pJK0cwaTZu?=
 =?utf-8?B?RmVVTXd3SlB2S25uV3dEYlJFY3RDSnJQSFJNZWhVRnVJb1FtdGtIaEFncXkz?=
 =?utf-8?B?NDZYMTZROStlbExpaVppM2VOREY5MUpLU3YraEIrL0lOT0JXTUtXeW9vTVVW?=
 =?utf-8?B?aXdwYXFPUG9QOTA1SWd5djQyMDk0dFNSM2ZTYktKUUNsYnZoZ2srU01NMWZ5?=
 =?utf-8?B?VWkxV2ViYS9sb1c5Mi9VbVBqUmFrTitGSlJmU295T2NVUUlBQndBOEdLOXNl?=
 =?utf-8?B?OEp0RGRZZzQxb0NKTUZrZi9MMmxrRHpuMGpyYUptekVFMkZKM1FRUGZHMlUy?=
 =?utf-8?B?dWlpNVdWVExlWUVMZitaN3hZcHIzbGpUZGh5aXNrbEJseUJrYkZmeFJ5dzBE?=
 =?utf-8?B?WnBzT21kbkNEYXFxY3JkTkJ5NXRncUFycWsrVitPa1l5SXMweUloNGVLbkNk?=
 =?utf-8?B?YnFGY0xldGZIeVFCMXZrQmdwckVWTXBTRGNXTERRNUxmOUJOUlZEaEhLY1B2?=
 =?utf-8?B?Nlh1YWg5THZSVHUxT3loS0tRUDU0dGF2VWJheU9FK2N1Q1lOV0dZMDJXRVEw?=
 =?utf-8?B?ZzZqb3htYmp4WGd3ektEK3lvMENpQUpQeHdFYXpwNklFYU81WmwwWVgrSUt5?=
 =?utf-8?B?ZHgvQWs3TlN0ZUlWTXpxcENvbXlUUlU4K1pxaG52Sk5adW5RWmJyc250RURT?=
 =?utf-8?B?d3dxRmJqeHBrMHBZUEZTcW51YzBJclVtUGd5bHNnczdQU1RaNk5WcmdlZHEz?=
 =?utf-8?B?WjVlK3FqcDlHbHBjZ3ZDakxwemNMcTFKSUw4TzlXSmVHbTlkei9Ta2NvN2M1?=
 =?utf-8?B?eXRKWDhuYklCSWdncGJSaFRZS3F6djBHeDhES29aVEVRdG9jSndLUnRaY2h6?=
 =?utf-8?B?eDNFbW5hY2pHSGdaTGRGajEvcDBzd2tOK3pEWDlCOXozQ0t0aUhlT21neW9j?=
 =?utf-8?B?a3BiU05DcG1jbnk0MW1CZXZCcFNreXRyVDdxNW5JbUEwUi9ZOTdIdE1ld21I?=
 =?utf-8?B?bTIrZmgxNWZvUDN4cUtiWnBIZzZXeE10a29yZlRCZVNXVExXcWxjcExadWp1?=
 =?utf-8?B?cThJRHZBSzJkeFIwcTQzWnl0TnZqcVdqOUNqSi9UMnA5Z0JiNE5ud0V1Z3FC?=
 =?utf-8?B?TjBTK0l5UVIyMzVPTExBd1ZEc3ZvSUExVEt0Skt4Rnc0TXJKS1ZRTDdIV3dG?=
 =?utf-8?Q?O9xQ05fEqHFflI6I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEEB365104ECEF4DA55CC3E32D79B79A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lfevELeMBZ89n9URHBVXi3SXp/U22PwWWO2Bh/6RWobLLCbz4AbNZ2mtqYpLhXUVXYTc14k4Ds9zYIL4lw1vcVsMxoH44AiSS/ygkBYJVf3nRkyrwrG6IEx2kgsoZKmX+NvCsVXvodszmWab9U1kRFJ1EC2t1dfVCJgEYVSurKgcFzpsvLOnXQNAF27gN9sLHBjwRLWoz3sdm8BwtayWX0PqXh4bpk1NEo/Lb9DOB7dE68GDXV0//+nCQDZ47oh75lwHT21UCqZYwkdaeXvMAiOxw5Qv2ST3zrIPcvqMn5B8QeMMIYFXPncpvyX9GuVaUTvCp1JVs+FwH389E8Injw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa640f14-3bc0-44fe-360d-08debd7aba87
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 12:06:34.6051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EMk5/S4F2jHSx4C0DxZ0qSEj5lgTwmLVf6HDOFw/jnD9Zm2RQWJYb5UfR878XjVyQAvJwIaaaxoyNuBJTrWf8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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

SU1PIHRoaXMgaXMgZ29pbmcgdG8gZW5kIHVwIGVpdGhlciB1bnVzZWQsIGFuZCBwZW9wbGUgd2ls
bCBrZWVwDQpjb21wbGFpbmluZyB0aGV5IHdhbnQgYSBoaWdoZXIgbGltaXQgYW55d2F5cywgb3Ig
b3ZlcnVzZWQsIGFuZCBwZW9wbGUNCndpbGwgY29tcGxhaW4gd2h5IHNvbWUgb2YgdGhlaXIgbG9n
cyBhcmUgcmFuZG9tbHkgbWlzc2luZyBmcm9tIENJIGxvZ3MuDQoNCkluIGdlbmVyYWwgaXQgc2Vl
bXMgbGlrZSB0aGlzIGRvZXMgbm90IGJyZWFrIHRoZSBDSSBpbmZyYSBkaXJlY3RseSwgc28NCkkg
d29uJ3Qgc2F5IG5vIHRvIGFueXRoaW5nIGhlcmUsIGJ1dCBpdCdzIG9uZSBvZiB0aG9zZSB0aGlu
Z3MgdGhhdCBkaWFsDQp1cCB0aGUgbWFnaWMgYW5kIHdlIHNlZW0gdG8gaGF2ZSBsb3RzIG9mIHRo
YXQgaW4gZGlzayBsaW1pdHMgcmVjZW50bHkuDQoNClJ5c3phcmQNCg0KT24gV2VkLCAyMDI2LTA1
LTIwIGF0IDE3OjQ5ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+ICAgSW5mb3JtIGln
dF9ydW5uZXIgYWJvdXQgc29tZSBsaW5lcyBpbiBkbWVzZyB3aGljaCBjb3VsZCBiZQ0KPiBzYWZl
bHkgc2tpcHBlZCBkdXJpbmcgY3JlYXRpbmcgYSByZXN1bHRzLmpzb24uDQo+IA0KPiAgIFdpdGgg
dGhpcywgcnVubmVyIHdpbGwgYWxzbyBsaWZ0IGRtZXNnIHNpemUgbGltaXQgZm9yIGN1cnJlbnQN
Cj4gdGVzdCBhbmQgd2lsbCBwb3N0cG9uZSBzaXplIGZpdHRpbmcgdG8gbGFzdCBwaGFzZSBvZiBh
IHJ1biB3aGVuDQo+IGl0IHdpbGwgZ2VuZXJhdGUganNvbiByZXBvcnQuDQo+IA0KPiBUT0RPOiBU
aGlzIGlzIGRyYWZ0IHdoaWNoIGltcGxlbWVudHMgb25seSBsaW5lcyBza2lwcGluZywgd2l0aG91
dA0KPiBhbnkgcmVwb3J0aW5nIHdoYXQgd2FzIGRvbmUuIEFsc28sIGltcGxlbWVudGF0aW9uIGZv
ciBhIGZhaWwgcGF0aA0KPiB3aGVuIGFwcGxpZWQgcmVnZXggd2lsbCBub3QgbG93ZXIgcmVzdWx0
aW5nIGRlbXNnIGlzIGxlZnQgZm9yDQo+IGZ1dHVyZS4NCj4gDQo+IENjOiBTb2JpbiBUaG9tYXMg
PHNvYmluLnRob21hc0BpbnRlbC5jb20+DQo+IENjOiBSeXN6YXJkIEtub3AgPHJ5c3phcmQua25v
cEBpbnRlbC5jb20+DQo+IENjOiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBj
enluc2tpQGludGVsLmNvbT4NCj4gDQo+IEthbWlsIEtvbmllY3pueSAoNCk6DQo+ICAgcnVubmVy
L2V4ZWN1dG9yOiBDcmVhdGUgdGVtcG9yYXJ5IHVubGltaXRlZCBkbWVzZyBzYXZlDQo+ICAgbGli
L2lndF9jb3JlOiBDcmVhdGUgbWVzc2FnZSBmb3IgcnVubmVyIHdpdGggdW5saW1pdGluZyBkbWVz
ZyBzaXplDQo+ICAgdGVzdHMvaW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yOiBMb3dlciBk
bWVzZyBzaXplIGNvbGxlY3RlZA0KPiAgIHJ1bm5lci9yZXN1bHRnZW46IENyZWF0ZSBzbWFsbGVy
IGRtZXNnIHJlcG9ydCBieSBkcm9wcGluZyBsaW5lcw0KPiAgICAgbWF0Y2hlZCB3aXRoIHNraXAg
cmVnZXgNCj4gDQo+ICBsaWIvaWd0X2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDMx
ICsrKysrKysrKysrKysrKysrKysNCj4gIGxpYi9pZ3RfY29yZS5oICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKw0KPiAgcnVubmVyL2V4ZWN1dG9yLmMgICAgICAgICAgICAgICAgICAgICAg
fCA0MyArKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgcnVubmVyL291dHB1dF9zdHJpbmdz
LmggICAgICAgICAgICAgICAgfCAgOCArKysrKw0KPiAgcnVubmVyL3Jlc3VsdGdlbi5jICAgICAg
ICAgICAgICAgICAgICAgfCAxNyArKysrKysrKy0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9leGVjX3N5
c3RlbV9hbGxvY2F0b3IuYyB8ICAxICsNCj4gIDYgZmlsZXMgY2hhbmdlZCwgODMgaW5zZXJ0aW9u
cygrKSwgMTggZGVsZXRpb25zKC0pDQo=
