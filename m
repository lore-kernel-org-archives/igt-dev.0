Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA477C5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 16:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7F910E17F;
	Fri, 14 Aug 2026 16:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muB44rH5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F3510E17F
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 16:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786726032; x=1818262032;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TYKZsvYRTm+tpf2Fvo0k6/kkc25iU6ePsR5remhjE4s=;
 b=muB44rH5TZ2t/n0j2nmuhmZcZOBCUYAyee0MCLlcm64YqS39GsfgxZWz
 /lnQ/Z0HCAJ7ddXsggAItcPu9Z3BPvj3+LPsE6xKgGBVWC9+glu4/FKew
 ONoLZAtU8M330Jadx3YvDmMG6z0gfCJUWximwbitnEhuka83/h8rpO0Ab
 BLCajUplOjP5bu+s0p/48B5KF7cdDn11u0DKOzOGpHsG+eVEHWd5jWMpS
 dKcbO/JFJ5EcOeLAGjSTtjpnR25W/gXpR4KBkwq7c4jl6ZLSRtXOnISde
 LRsaDFLBakYRfoTyXqHZV0sR62JUN0n+v5LY5TJGqYwMt2ioWSt4YIlKA A==;
X-CSE-ConnectionGUID: RGkUUy/3TPWzHsesVvgJ0A==
X-CSE-MsgGUID: 8uBa9h3IRIG2egvqRwP4UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97970492"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97970492"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 09:47:12 -0700
X-CSE-ConnectionGUID: 5AEv7YJuSxWSp8FOT+xKpQ==
X-CSE-MsgGUID: pefA4l+KSA6f42dY4cwDHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="260482546"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 09:47:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 09:47:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 09:47:11 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 09:47:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6C+AlARfSuzd0HmIxRyOyH0lQLh72DkkPUX/Qw79MOlF3qw6viDAcjIkszEASs0mlwmTB8F86n4Epmg/oGxIygiaHZfVQazhepM9VlCAyNrQdbShy9iYr5G+MZy3gbFr4/E1ovcIdS6xX5xNcZh+KO3vo+QPiET8H3kmzz7XU1GpvBncB/p5WEZ2yNAbUhfl8NF/TudXUzuoMBnQtcvWsoNsfSNeA4luh/WlaY2QOh4YgiXjfNieS9eDWJ706IxjFHpUbRHy9OTrtF4nUvp3Pf91avZHMHbJBPHRSWJsltsg0f0y08rGyNyt/0CkwsVUveCBD20Dwdl7Z7RQ5MYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYKZsvYRTm+tpf2Fvo0k6/kkc25iU6ePsR5remhjE4s=;
 b=zQIfY/tx8kh0xLZTYVE84yluo6BWYa/76kzzeG385lzquZxIXu0DIzkI/zzHvgRzSTzLegpP6WLYMrZBlo2jj9hJYTRtIQNUmQPB+ncScacV8xtEjcVaMuBT5V9pAnY0v2WTNr3MCz1tnZ9nArjjJteFPkGFRAu8opNOQRhYxM+e8RVz7Ihgq4yNwo65khz6DIpNYUuNIKjClOPnOlFQDZmfokLGjRfugzhwv4CZcKRN7wabA7+76+PeoP8UEIc2N2CriecXOVEvBFZ5EMtEiiAA4/L8qn72QR2lOhIyWhAULMXz/P3oABQ6qIdyKnI3QiLndJShe3Q16yWj7mmOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by DM4PR11MB5996.namprd11.prod.outlook.com (2603:10b6:8:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 14 Aug
 2026 16:47:03 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 16:47:03 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] intel-ci: Add CRI core blocklist
Thread-Topic: [PATCH i-g-t 1/2] intel-ci: Add CRI core blocklist
Thread-Index: AQHdLAbx9dtXyPM+hkaNFLX/LshAy7adwPmg
Date: Fri, 14 Aug 2026 16:47:03 +0000
Message-ID: <IA3PR11MB9013AF463BF0B0D22F1AE31A85DA2@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20260814160648.19715-1-himanshu.girotra@intel.com>
 <20260814160648.19715-2-himanshu.girotra@intel.com>
In-Reply-To: <20260814160648.19715-2-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|DM4PR11MB5996:EE_
x-ms-office365-filtering-correlation-id: fb86c535-93d3-4e6b-3c4b-08defa23ab30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|4143699003|11063799006|38070700021|10067099003|6133799003;
x-microsoft-antispam-message-info: rKj4P1dHYKtHwO0fgfnMEZJAC2o8l/A3puctY9jluoMoTN/Oi3ExaKNgyhcuV78koYuQ1/qx6qWGKvnSDmBGLCIq4vpdQVah9ZvD+oi4pIDz5us1eksdEA8LPLUqilB4YGSb1tYuxEnsh4pb5+Dn23m5fBrrWXeISAn4WsfKobUXv81k3KLH9KQlL0Q8L6sJEbfl0eqMGHbZF9SXtHDOs/F6O3qQf/IYEMRTYJjIHgfz+NfP47E2rb4zNCY/u6LSX64VqQ4mgYAoC1ffLQAmwt/bN937B1XP5JiOrHyS688OTZLLPYfmazXIljfm916YbHYkUncHVlavED1yMReia3sfDyx6/gFBJpAW7PSryaMLy3v71gEQ31bVAkZlutOUxtSAKEP/WEpw6GLzj18BzLLCu2iqKhlfLoXHMIrCvwzoGGU9hK/5x/o2xrTabgeKa0rUhSipGSz2Kc1x56RlngOJULwhrRLwAlpTtBWRUnKl+kWBxtPJ2v3R9ujNP4dH3Bzfw/UozR55PnAxawzw//m40yR12TJ5sTuo2RTnN1HFKqYy1UD+MlrBiwaxPSSkdAtT7HrLh4VFfFu2E6oZay2HWUdDZo/ZT2hMWMWrPhrIitbTLbFr/Ltmp9/W1FdXKiGkn/8P0pcv4YSFkFH+W0robt1X3ffco2QdDw6iBAiILgNh3U2tnjbVwkG/MT6yx8GR9V7vuYx5OgaedZRfzCDgjPRSv+uNwgoBsRSWP08=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(38070700021)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWdqbTNsTkJRckJYcG9TaFRlWDE0V3doYmIrZUpoK3hVSEZ3QkE3TkRwVGhP?=
 =?utf-8?B?dnZDeEJiTVBHVExXZWRyT3FMU1FOcmFqTmdRYi8wbzZ3OUd3WkI1Q1VRVy8x?=
 =?utf-8?B?STdiSjNpWlVkdEtaMDJoeTEzWHpnMmlOWFpKdk9GWkg3bFVFKzhBU1F5ajU0?=
 =?utf-8?B?MWg1bXJhZjdwWjBjMG4rNXMyWlk3NVE0cDRTYmhPTThJQkdUdzJnWjBTQSth?=
 =?utf-8?B?NFV4Z0ZRN01sTXRaNDMyYlA0NUlLVHFGb1l2MVBEejYwQWJlbkl0Z0hsaUE1?=
 =?utf-8?B?THBGTHJwSG9PRHM3Q0pZT1dhSENkT1Q3MUVLT1BFaU9XNHpSUVpCOVJkNmM0?=
 =?utf-8?B?aWRTRzhybk9yR2kyaTh4cGxhZmRqN21pOFdkYnhWSDgrMXJ3UWxVNjVsaEl6?=
 =?utf-8?B?VE1mUVRkNW56NDh0elhFbkRGWWpkZVYrb0lDYUd2ZHVHN0NmWjg0a2VmOHps?=
 =?utf-8?B?VDFPd0FrZXRZbzdKdFF6OUtOV3JZVEtNU2dlcXFHVCt6RmZESW1LN2cvMEJz?=
 =?utf-8?B?ZUxQSWVyOEFwc0ZRbE1EK0FUb2ZYY2VjbjZEQVhPQjNiNmJZY2F4L0JMSS9T?=
 =?utf-8?B?a2k0OHFDWlQzTTlVd3kzUUkrWEdmMDVsYzQyaWZuT01kVXJaeHVDVENVYy9p?=
 =?utf-8?B?SFc3VEpaa3MzVmNEMUY1WTVGNVpacEx6VXM0UWZBRENxZ0RMcElWMWxPOGtM?=
 =?utf-8?B?MkZrREphVlRVbi9ia3BjZkp6TWpFdDFvaHhhMERoUjNJSTZ1ZE5aWndNYUl5?=
 =?utf-8?B?WDJ1cTFlTVdyMnl6RGR6WkJvMjMrZE9wYkprektrYlJ5QzN5TXR0YldNL25p?=
 =?utf-8?B?UG10TXJla3lTcWtNQ0UyUUtCWHNzUUtvdC9oVkdLOE1UVGp1MHZWQXRYSWtQ?=
 =?utf-8?B?WnNUT094bmQ2cGdBZEcyYW1WdnQ5VWNEdS85cHNmemxaRnVTL1VMYk9SZ09U?=
 =?utf-8?B?cVdBWWtMOVVFQlMrd0lOOUU1bEJSaThQVzZPUHYrMUpoaUFOTGpXUFRiTkQ4?=
 =?utf-8?B?Zm5lb0FNODZyQ0hiRGlZbWQvbzVaeE51V05TdUNha3BXT1VjbmRCWnZWamJU?=
 =?utf-8?B?bjJyK0xyMEtiM1NPcE5IVW5jWmw4dWtISGc3V1JVdm5WQmhBRlU4M01rZDkw?=
 =?utf-8?B?TjR5MkZVaVkzMEtqNVpWeXNsMm1rRFh3cDZBMWxSRFdXdWNpbDB0SXNLUXE0?=
 =?utf-8?B?eXFBQXhUb3NhZXZGR1hRbGhnT0xnTG54M0krRVBuSm10MVZkeWgvUFJnTEU5?=
 =?utf-8?B?OGpYRm1DejAvd0U3TFB2MjNhR2FPZEhERUFVam91N2VjeFEwbEd3SHlvWi85?=
 =?utf-8?B?NWw4Y2pGK2tya1UyWXlzWSsyRjh2NUhpRTNhL09xMWwyb3pSVnlGcm1jbm1W?=
 =?utf-8?B?ZUJ3dUp1eDBsb29wV2ZubDBucTdYNEZNVXU5RTB6ZW0zL2dLdGdJb3pTTWRs?=
 =?utf-8?B?clBKSkxjQXBvZkpPU0ZqUUFRVXlvZFJjQll3TzFaTm1TOHZ6YUtlSFd3amsr?=
 =?utf-8?B?QmRuK0ZCRWNpb2FkZ3VhRzlaK3NWZzFuajgrRU5IZnZCTVVkVlJkbStkTVVL?=
 =?utf-8?B?T09xU2lWVmlpTkJKdTNOMWloUWZHWGJEczI4ZWFBNXdHTEtQaGNzYTdhWXVY?=
 =?utf-8?B?a2pKUnNML1lsNjd5RmVBamo0TzNFQVhtYnJSQWQ0U0hWVnBpSVdtbnUxeHlN?=
 =?utf-8?B?R0Q4N1BQRGJrSXBUc1lwTitMWlBIRTBkNTdodWNFVXRDd2tVdEdjY05pM3I5?=
 =?utf-8?B?VHZsT1l6OXhUUG5hQU5jYnpnUVRnV3I2T1M2L2UxdVhVcEZ5MGovVUcwNjFY?=
 =?utf-8?B?RUxDK2J5VEtMb1hzQjlPQ0ptb1FNb0srRktBZS9GeWZhYUc5aWRlSUhZbnhG?=
 =?utf-8?B?bXFFbjRYTVFvd1pFUlJPZk85bkllZEYrU0l4Zi9iRnhmZkdRbmhIMWJWenE4?=
 =?utf-8?B?V3ZWc0lIM1UyVktwNWRkNFdYQ2RXaFcwdWhBL0VaanFQYzd4WFdmY25XR3B2?=
 =?utf-8?B?cGl2S0lhSHNjUzB6NWQ4OFZIWGR6VnNWODVJUkNGN3lmYnp1cW1EK3FkR3Yr?=
 =?utf-8?B?OWhVT0ViNUphenRwS2tmMmJyejltNTgrZ0ZPNys2ZUpsU0hoVWdNeXp2KzhK?=
 =?utf-8?B?OHFwYmFkUG9JbUxCby9CKzFhenFONHJ1YzlOc050b0FYU0o2MHdNTnY5ZXN6?=
 =?utf-8?B?NGRaTmswc1I3V0FMckhKQ0YvNy9JUWpJSk04M29RWTRnUUVmWkVGa3JkRmI4?=
 =?utf-8?B?UU5aZGtSY1hKcXFSdEZrUll5MUQ5dVZTZEF3K1haWDV2MTdjNkJGN0l1N3Bs?=
 =?utf-8?B?WnpDZURXaGp0aXNRTWZRNHcrZEhSc2JnaEJVUzFUc0ppSmV1cDVWQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Kla7L5wA9V8Dl5jBcZ7D1ZJNg0V3bczZMo1OQ1fVYb1sWO2j8Ba/KKPMmjOeMFN6aPcwM8e0YWO3HwWxVjuCY5tMDMbh6PZ9qwzmYT23TVdtPUMPWRr+1KxCrWqsUo1k890ImILq+/nJwzvctBy4xM2W+/tAWD/BLXtYexRleqGYGpnykE5e6wCLcaYLzylXmCG09xnHHN9BSMA5g3hywzEUrksLTeLCtq7Muo5J8G5fQVtIJo6k9gJhxluWLF7svmu2os6ztkpjFlnaitWwTa36wrPK1Ne2EAunaHZS5SYpFe43pzOHtoVPjZPAz83vY8N7O6noJJph5ThpPJ7wQw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb86c535-93d3-4e6b-3c4b-08defa23ab30
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 16:47:03.5836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SucmkDR30M2RLQAqvItUXOHYxhSzdPiHYRPUnHxdNxx7mnHs1v3wsrod+PMGAicddD/aSateDHiKAE3slDnjCF9krt4O+vc+uXyRkDB0Tmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5996
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

TEdUTS4NClJldmlld2VkLWJ5OiBHYW5kaSBSYW1hZGV2aSA8cmFtYWRldmkuZ2FuZGlAaW50ZWwu
Y29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEdpcm90cmEsIEhp
bWFuc2h1IDxoaW1hbnNodS5naXJvdHJhQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBBdWd1
c3QgMTQsIDIwMjYgOTozNyBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IEdhbmRpLCBSYW1hZGV2aQ0KPiA8cmFtYWRldmkuZ2FuZGlAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggaS1nLXQgMS8yXSBpbnRlbC1jaTogQWRkIENSSSBjb3JlIGJsb2NrbGlzdA0KPiAN
Cj4gRnJvbTogSGltYW5zaHUgR2lyb3RyYSA8aGltYW5zaHUuZ2lyb3RyYUBpbnRlbC5jb20+DQo+
IA0KPiBJbnRyb2R1Y2UgY29yZSBibG9ja2xpc3QgZm9yIHRoZSBDUkkgcGxhdGZvcm0gY29udGFp
bmluZyBDUkktc3BlY2lmaWMgY29yZSB0ZXN0DQo+IGV4Y2x1c2lvbnMuIEFsc28gYWRkIHRoaXMg
YmxvY2tsaXN0IGZpbGUgdG8gbWVzb24uYnVpbGQgc28gdGhhdCB0aGlzIGNhbiBiZSB1c2VkIGlu
DQo+IGV4ZWN1dGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhpbWFuc2h1IEdpcm90cmEgPGhp
bWFuc2h1Lmdpcm90cmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsLWNpL21lc29u
LmJ1aWxkICAgICAgICAgICAgICAgfCAgMSArDQo+ICB0ZXN0cy9pbnRlbC1jaS94ZS5jcmkuY29y
ZS5ibG9ja2xpc3QudHh0IHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9p
bnRlbC1jaS94ZS5jcmkuY29yZS5ibG9ja2xpc3QudHh0DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvaW50ZWwtY2kvbWVzb24uYnVpbGQgYi90ZXN0cy9pbnRlbC1jaS9tZXNvbi5idWlsZCBpbmRl
eA0KPiAzZGFiNDE4OTguLmM0NDZiMTNhOCAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwtY2kv
bWVzb24uYnVpbGQNCj4gKysrIGIvdGVzdHMvaW50ZWwtY2kvbWVzb24uYnVpbGQNCj4gQEAgLTE0
LDYgKzE0LDcgQEAgaW50ZWxjaV9maWxlcyA9IFsNCj4gICAgJ3hlLmJtZy5jb3JlLmJsb2NrbGlz
dC50eHQnLA0KPiAgICAneGUuYm1nLmRpc3BsYXkuYmxvY2tsaXN0LnR4dCcsDQo+ICAgICd4ZS5i
bWcuZXVkZWJ1Zy5ibG9ja2xpc3QudHh0JywNCj4gKyAgJ3hlLmNyaS5jb3JlLmJsb2NrbGlzdC50
eHQnLA0KPiAgICAneGUuZXVkZWJ1Zy5ibG9ja2xpc3QudHh0JywNCj4gICAgJ3hlLmZhc3QtZmVl
ZGJhY2sudGVzdGxpc3QnLA0KPiAgICAneGUtZmFzdC1mZWVkYmFjay50ZXN0bGlzdCcsDQo+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS94ZS5jcmkuY29yZS5ibG9ja2xpc3QudHh0IGIvdGVz
dHMvaW50ZWwtDQo+IGNpL3hlLmNyaS5jb3JlLmJsb2NrbGlzdC50eHQNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwLi4xY2ZiMWQ1ODcNCj4gLS0tIC9kZXYvbnVsbA0K
PiArKysgYi90ZXN0cy9pbnRlbC1jaS94ZS5jcmkuY29yZS5ibG9ja2xpc3QudHh0DQo+IEBAIC0w
LDAgKzEsNTMgQEANCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiArIyBWYWxpZCBza2lwOiBEaXNwbGF5IHRlc3Rz
IG5vdCB2YWxpZCBmb3IgaGVhZGxlc3MgY29uZmlndXJhdGlvbg0KPiArIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICtp
Z3RALiprbXMuKg0KPiAraWd0QHRlc3RkaXNwbGF5DQo+ICtpZ3RAeGVfcGF0QGRpc3BsYXktdnMt
d2ItdHJhbnNpZW50DQo+ICtpZ3RAZmJkZXZALioNCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiArIyBWYWxpZCBz
a2lwOiBGZWF0dXJlcyAvIGhhcmR3YXJlIGJsb2NrcyBub3QgcHJlc2VudCBvbiBDUkkNCj4gKyMg
ICAtIHhlX2h1Y19jb3B5QDogTm8gSHVDIHN1cHBvcnQgb24gQ1JJLg0KPiArIyAgIC0geGVfb2FA
b2EtdGxiLWludmFsaWRhdGU6IHZhbGlkIG9ubHkgZm9yIG9sZGVyIGdlbjEyIHBsYXRmb3Jtcy4N
Cj4gKyMgICAtIHhlX3B4cEAuKjogTm8gUFhQIChQcm90ZWN0ZWQgWGUgUGF0aCkgc3VwcG9ydCBv
biBDUkkuDQo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gK2lndEB4ZV9odWNfY29weUAuKg0KPiAraWd0QHhlX29h
QG9hLXRsYi1pbnZhbGlkYXRlDQo+ICtpZ3RAeGVfcHhwQC4qDQo+ICsjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gKyMg
VmFsaWQgc2tpcDogbXVsdGlncHUgcnVucyBpbiBzZXBhcmF0ZSBjb25maWcNCj4gKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iw0KPiAraWd0QC4qQC4qbXVsdGlncHUuKg0KPiAraWd0QHhlX3BlZXIycGVlckAuKg0KPiArIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMNCj4gKyMgVmFsaWQgc2tpcDogTm8gcmVuZGVyIGVuZ2luZSBzdXBwb3J0IG9uIENSSQ0K
PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjDQo+ICtpZ3RALipyZW5kZXIuKg0KPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICsjIFZhbGlk
IHNraXA6IFBBVCBpbmRleCB0ZXN0cyB0YXJnZXRpbmcgb2xkZXIvZGlmZmVyZW50IHBsYXRmb3Jt
cw0KPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjDQo+ICtpZ3RAeGVfcGF0QHBhdC1pbmRleC14ZWhwYw0KPiAraWd0QHhl
X3BhdEBwYXQtaW5kZXgteGVscA0KPiAraWd0QHhlX3BhdEBwYXQtaW5kZXgteGVscGcNCj4gK2ln
dEB4ZV9wYXRAcGF0LWluZGV4LXhlMg0KPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICsjIFZhbGlkIHNraXA6IFBv
c3QgREcyIHRoZXJlIGlzIG5vIG1lZGlhIHBpcGVsaW5lDQo+ICsjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gK2lndEB4
ZV9tZWRpYV9maWxsQG1lZGlhLWZpbGwNCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiArIyBWYWxpZCBza2lwOiBO
byBzdXBwb3J0IGZvciBDb21wcmVzc2lvbiBvbiBDUkkNCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiAraWd0QHhl
X2Njc0AuKg0KPiAraWd0QHhlX2V2aWN0X2Njc0AuKg0KPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICsjIFZhbGlk
IHNraXA6IFRocmVhZGdyb3VwLXByZWVtcHRpb24gbm90IHN1cHBvcnRlZCBvbiBDUkkNCj4gKyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIw0KPiAraWd0QHhlX2NvbXB1dGVfcHJlZW1wdEBjb21wdXRlLXRocmVhZGdyb3VwLXBy
ZWVtcHQNCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIw0KPiArIyBWYWxpZCBza2lwOiBUZXN0cyByZXF1aXJpbmcgbXVs
dGlwbGUgQ0NTIChDb21wdXRlIENvbW1hbmQgIw0KPiArU3RyZWFtZXJzKSBlbmdpbmVzIOKAlCBD
UkkgZXhwb3NlcyBvbmx5IGEgc2luZ2xlIENDUyBlbmdpbmUuDQo+ICsjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gK2ln
dEB4ZV9jb21wdXRlQGNjcy1tb2RlLWJhc2ljDQo+ICtpZ3RAeGVfY29tcHV0ZUBjY3MtbW9kZS1j
b21wdXRlLWtlcm5lbA0KPiAraWd0QHhlX2NvbXB1dGVAZXUtYnVzeS0xMHMNCj4gKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iw0KPiAtLQ0KPiAyLjUwLjENCg0K
