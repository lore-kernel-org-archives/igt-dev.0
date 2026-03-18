Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484C0FCD0D0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 08:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36C010E737;
	Wed, 18 Mar 2026 08:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTyipldn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED7310E737
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 08:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773821939; x=1805357939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yCvE+r2P0l9cxWHCqM+lutAWBN5toxc4c3pQQ6Zho5g=;
 b=YTyipldnypuEw+YXMOz+dhSaz5KuKpZ9jrNGDYkylklpRftE++KYCiOB
 K9Uv0tDf+ZIU0pBRU+csPYcnvC+gIW19dO52ycfaui8kCbNLARXcTWODC
 KuCot/yWnQOJrfViD4opmqOTKUfTqGz0MGxAOsROxCJ+fSJ56vQwtb5oZ
 +WffeFahkiel7FKsHm8WNQyPvcayi7wTsPaGvLkiNkN35FBDf1iOouhvg
 IKpT+dP80pTAB/CCbqGB1auQCfwQA8ZBi9Pr5QNMEp/Ja5jhaahwSmGjY
 eZsSxajRfgrzd42qh2a3Mh2txHC8oIuiQsKYVkcZMht8EU8o7T01YbLBG g==;
X-CSE-ConnectionGUID: hxbrIyx+RZ2WEE07Vee0kg==
X-CSE-MsgGUID: J59+ryN8QPeJC6qHFYuTdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74784405"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74784405"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 01:18:58 -0700
X-CSE-ConnectionGUID: rY0/DphMS3i5P8rov3Af8w==
X-CSE-MsgGUID: Lv3MjMBvT4aLnBRsLKjJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260445150"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 01:18:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 01:18:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 01:18:56 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 01:18:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBBuTEwi4jdG59dQ+777qOWDeE1si03TxD0MmxWgwu/CekggnaY0zxDEIO7hjo8LQ/stVDGosEEhIGOkGSBGPQBk4JoB+jLYt7hdqpLp0m57GmAhaDfR3ber7Hn1sML8UfYpXG5IuNLIMMEUqRew2m3+dHwHdANkWG9A4YbR5CkmnQYynNOP31RZ+c1uHAvXsFIwVBm0ZMp9U6VTUUpJ8sha1+yRAuKqICj4iUKKxzr99x8THd/lE0WYgh4lwweMgY+MzwOE6Gx8+WgI2SytWJEXryYAMeP7g4LSVPe4vE3Wgir/k/OWsoAuO7zdcQzq+PbY9UH0TNyV1mb1b74Xlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCvE+r2P0l9cxWHCqM+lutAWBN5toxc4c3pQQ6Zho5g=;
 b=WFhldX2lTvvHp8OwkSLq72uHunpyi1Ae+S2jLa1154h2DIrOUsBnpnm8zU3u8W41iKNIxYDk32AsvAV8kgmR1lA39OhEjIy1DfUyZDo0OrzbjX4s6bm0DhqzCIyzjWCnsQA2EdSEhgWHGk7XU96nYXUPYgK0nZVNBOn5ZkqBe1hpYwPmCjhVKJuRGZQ5IeKjrWgfQYS8jVymROmaRVMbCGEpm1dIuUeiY7Wz3dsaaK7EVw3c1OLoOBfE5uG98xK3+uyG+8qH2PsunT3hb0Ak1+M/ktmSPFYXqkbOAWh2kk2QNTYnnmQrE6Vz3YouO7QQBicSDLee2eFUL+UbTChvbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH0PR11MB8192.namprd11.prod.outlook.com (2603:10b6:610:191::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 08:18:54 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:18:53 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/igt_psr: Fix Early Transport status handling
Thread-Topic: [PATCH i-g-t v2] lib/igt_psr: Fix Early Transport status handling
Thread-Index: AQHctkSe/o7XMh40VUyQFHdq9M+XfrWz8ywA
Date: Wed, 18 Mar 2026 08:18:53 +0000
Message-ID: <645964eee31a4df3c4fb1cf844f07e8bd9352424.camel@intel.com>
References: <20260226094251.3986123-1-ramanaidu.naladala@intel.com>
 <20260317193058.722290-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260317193058.722290-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH0PR11MB8192:EE_
x-ms-office365-filtering-correlation-id: 2d3e5750-824b-4d6e-6139-08de84c6fe09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: N5fSs/+Md8/rlNdgSWj+B8DGzw9D58TmjFtlzICk3SjWkwefBMtm5EFGpdcsTT5P3yzfN+M2Iu7sOTxmE99qIYtMObNObIuL2l7HmU7wBF58Ovyv4eWsExYAc1Q8Du6qnr72G3AkQfHL2qx0dtki8KPjY1LnK8Z1FKp+Q3y4ddj/R1KnFFbHWND6YRJGUTAossKR507qHDmhDE3wdQOzCB3D4Qd4h65onFBKiVEOlqzgcS6IebIR/srl7XYpuAw7PsOylLV6rhshV2V09chYWHCXjo26qJc6Le0SXAePuYNB7kPu4x/JZBQrCSJiK/vG9uVAj7r+1MLFLreRz3Yl89dfThItBekCbnmYeOfuLO5GowdcGyV08IeEnWQ5cTW+XGIjcryLWwyAJttiGT80d6Xtp/8M2SL3v5UAKa45c9PU9nF2pZINB37iRHubTVrabKACJ+zmrhh3R67kCA+3ypLB/ppZp4NswUwMuNhTgCOGLxerHk+ZKEiIAilkfsmJdl/MWSjkGptkSnRFFzJQu7e25IOWKApy6dfR/sDWMUvG71i7fXGYcQ2jP5NSPuQl15sDSgaBaBPPar+zchSyHpqUIIBgH/RIZx5i9Kquu+cbXrmgbsCrsve1QebgWgU9IFoZx3ZA7GP0bf6h81lqYqZpTJ9ZxKUwK+o0NH+MT2UcWlGhFSU3UMzm2+H6PlBPyAbm4exQmzgDDtrivJpoSyBThdkF+08WtFFNNmuJP3bPuNwuT+CSoa4Qe72Bd0Lul0REhEje7vI4VBeZb332M70EIu3Mf6POnI5L3h1LfUk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkdzcGhleitTNnlXVXhXaERBaHpJck1tcnY5b3duYmtzdGFldXZoK1lPN0R1?=
 =?utf-8?B?KzhCN0VGUHcrZHBKNmNPM3QyNTljYWJyTytDN0QvL3BiSGtxK0hOODROL0No?=
 =?utf-8?B?WXRVV0hWSGZiNU1Ucjh2VithSTZleFFkV0krdHhzUkxUWm9EaG0xenF2eldP?=
 =?utf-8?B?cFk0S0pJQllXWXZ4K3pySzhGaTFrcXdFSUlid3hubW1JZFN0TXJzUWppMDNO?=
 =?utf-8?B?NUwwL0NUaTZ1NHdGb0c4MWgwYVVBUjlKYWFFYTY5d3VSdVkycEl0eGVaa2FG?=
 =?utf-8?B?ZUNmQnNtNlc1NUtPWEVGSkFsVEp1c2tTR0dsM3cxaVVMV3BlUEV5K2xIQUhD?=
 =?utf-8?B?VE43M1J1ODI1TzJsWCs3dzhwbmFCdlpvR3V1clJ3MXdJS0FKWUJBTFQ2T2dt?=
 =?utf-8?B?RGw1dUVIcjN2Z013MHl6Rk02eUFncGlOUDNTYXU3YnI2UnhPd2JwQmNxcG1l?=
 =?utf-8?B?MFpVdHFPSEZUT2R4ZW44RHlIMnh4dHgyZEoxbURQeHFpTlB0anA5cEpXYnF6?=
 =?utf-8?B?TFNJaG9LUDdyQVFGVVpUWmwwUEN3M0dMUTUwZWo3cTQ5YlhXcTV2S05BYzJ3?=
 =?utf-8?B?Qm52VDJIczJhQisweFUzTExhZUVZU29makVaeU9Fai9jeWFCdkdFNWlKOW4x?=
 =?utf-8?B?VWw0Q0s0Y3diSEFLNXpVbmZFTC94VjU2VjRjQlBFK3Q5N3VMVVhzV3BzNVJJ?=
 =?utf-8?B?eTNTcWpLTFRBSkdDQ2RMeFVsSVRLMk5rV2Z6cGlqa0VVQisvT2hSUTRDOHZJ?=
 =?utf-8?B?UmlvcFI0Vlh1dzdpdTdSU3ZITEd4dVBPWWJlWTlmWXpLdzNwUVJ5MUs3bnVK?=
 =?utf-8?B?endPazZtd2lHOG1leFo3UGQ2N25pd3N2NzlGdTFUbzduK2I3UHZ0NGM1UEtp?=
 =?utf-8?B?cXA3dGtGMEtKRkRoMnZxTy9XaDJmckUrM3dYa1RCdUQvb0xwTDhIWEFuWXpH?=
 =?utf-8?B?RFY5S3d6Z2VOczI5eTFMNVQ3WlNrbngxaG5IMHdwQmF1K1lnK0Z4TC9SejV3?=
 =?utf-8?B?TEllZzJaK00xOGc4dGtPV09yUk1SZkkxNGlTWmRLaEtRdDVTdUVmTkdUQUFF?=
 =?utf-8?B?UDVwazYwcUU1WitoczFuVWFJRzd3SWJmSnhPRmZqdzJablVQT0tTM3ZKNzNu?=
 =?utf-8?B?N2VGTHZsSnVBRWF3cDRGT3I5bzJ3RmlRVlFsVUowR295a3A0MDZaY216MEhu?=
 =?utf-8?B?RXhNMmhrN3N2c0UyWk44VkFCbVMvR2hBMGJsbURZWFRSU0lTY05sVUhXZnlr?=
 =?utf-8?B?UXh3aTFVbkk3QURiWEdRTUw0RW16UlZpbS8yV3AvbWtMT25zNHF6Z1JWQWtm?=
 =?utf-8?B?WG1hNHBqbDBWQzNlWkp0akpGWis5QW9MT1pvK21Ec0NkMzE1eXJsS1Nzc2ZN?=
 =?utf-8?B?SHFoVm04eWJJY3QvNjNvdnp2bUd1dmJmeVFKVkFLakZFU0tGc2hNSUo0U1Iv?=
 =?utf-8?B?Y3k1U1dTOGxwOHdCZTZVb1d6SW1YdkN5dGVyQ3p1L1pudHhXUkxqUzFzYStG?=
 =?utf-8?B?WTBLT2NQaVgvejdhMnd4SUF4elkvNE1pcytHU2tFRnlkRHNBWEk1UTVhd3Zw?=
 =?utf-8?B?MWJhQkZYckdROEZnSWhFb2RuanhJV2hubGpONzVhRlV6ZlRJMDRMcWRxeXpq?=
 =?utf-8?B?VFBTNU9jcmVPZkIzT1pmQTZhTFlEM2lhZ2E1ZURkS0RaMVA4cEhreDhDbEp5?=
 =?utf-8?B?OVhVcGJIWHZPNWxEOCtMUkpicEE4YWV0UjB2bmZwUHlOOElLemdPVldvTEY0?=
 =?utf-8?B?T04rSnpIVDZyQ2ZBbnZES2xSaXA5RVVZR3hPYWhqU0ZWbVF6ZnBOMllxR0lQ?=
 =?utf-8?B?aGVSN2F6S2kvTW1DQjJ6bVNuNlFhRWRpSEVoeGg0ZGNReE52ZkxPQXd0QmRF?=
 =?utf-8?B?Yi9lcHZpVFhRYmFqMjlBcWE4ZnhraGxVb29mVUZPNE8vMWlvRVczaThvQ2pC?=
 =?utf-8?B?djJLUDZOWHBUUURwNUVkOFI0N0FQV2FJZGJZYXpiMFBxQmU5NDZOWUtPRDdH?=
 =?utf-8?B?V2ZCYzRsUndFVTJXWmNIdW00R3pwc2ZxUVFuMGdSUnpnTUMvZjhRQlZXVEhF?=
 =?utf-8?B?WGVGWUp2cTI4b2VMZHZCa3g1M0wzdEh1cDZ2K3BNZU15WDF0NmxWTkdaY0lJ?=
 =?utf-8?B?TTEwaVVGcmd1TFNJczQvblJrMm0rdlI2cXpmTlpMM1d0aFEyT0dBRWcvNmZG?=
 =?utf-8?B?YzF3STVoN3NPZW56ZFBiWldCbkZKb0x6a3Z5WkNJVFlldnM3NCs4T2ozTDdy?=
 =?utf-8?B?RXRkWTZZemczSUoraCtTN1M4MWZ2Ly8xKzZKais4RU9paFFoTEljRHJZUk8r?=
 =?utf-8?B?YStlbEtGNFRxWVJ3QjBLTHVSSEJ3RVdIWE8rZnZYYUFKZ3l6UDZJbE01M01D?=
 =?utf-8?Q?dABBzgy2t04QEQScngKsR4RzcgfUSGSyiA/lMGPUOcASD?=
x-ms-exchange-antispam-messagedata-1: p02nbD6iyfCoTJrUq3DV8sIyQ16eoWdq80w=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6CF72138CF4CC488711A2EC9CDE81D5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jWHwQrnGDeSHUH/zTO5RmWZjdJaGtU+LPwCQl37x9YEELEXnl36xlQC/FQwIl44xwG1184QYwVPx4FPVJf7FOd5q5FeTCJtluwvZ/FQ0LO28PiMOJC6mj0c7Kghvp1EfyV1uh96zvBoa0JtpTUdm7HbuCYGuXy0o11kLss690afEMoEGlvy8EouKwku8FwdR9HSpOJBxN2ntQVAxLkZTA4UnnkFw0UOmDpGYOIKkQo9HovUxTxma+a4ZAcnKDffI3KGdkD48pjgzVQpMbHamsfo2ul4AbBbbq3UEJ+DRRdx9unRoYwb+NKSjebbKBDXy/e+AMm0mrU0Y5AIou40oUQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3e5750-824b-4d6e-6139-08de84c6fe09
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 08:18:53.3113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Obe+S3SJic0TjNv8sBUiRLyblpPQQQFyVIIU9sHyIlK7UyNec81X5PQ+o6IFgGiQogBl8XIS8TOyWJLtSBkSCdPmazpkJLRBt0+uvEXhukQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8192
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

T24gV2VkLCAyMDI2LTAzLTE4IGF0IDAxOjAwICswNTMwLCBOYWxhZGFsYSBSYW1hbmFpZHUgd3Jv
dGU6DQo+IFN3aXRjaCBQU1Igc3RhdHVzIHJlYWRzIHRvIHRoZSBjb25uZWN0b3LigJFzcGVjaWZp
YyBkZWJ1Z2ZzIHBhdGgNCj4gdG8gYXZvaWQgYW1iaWd1aXR5IG9uIGR1YWwgZURQIG9yIG11bHRp
4oCRb3V0cHV0IHN5c3RlbXMuIFRoaXMNCj4gZW5zdXJlcyB0aGUgRWFybHkgVHJhbnNwb3J0IHN0
YXRlIGlzIGNoZWNrZWQgZm9yIHRoZSBjb3JyZWN0DQo+IGNvbm5lY3Rvci4NCj4gDQo+IFVwZGF0
ZSB0aGUgRWFybHkgVHJhbnNwb3J0IGRlYnVnZnMgaGFuZGxpbmcgaW4gbGluZSB3aXRoIGNoYW5n
ZXMNCj4gaW50cm9kdWNlZCBpbiBLTUQgKGNvbW1pdCBjMzkwYmYwNzk2MWIsICJkcm0vaTkxNS9k
cDogRml4IHBhbmVsDQo+IHJlcGxheSB3aGVuIERTQyBpcyBlbmFibGVkIikuDQo+IA0KPiB2Mjog
QWRkcmVzc2VkIHJldmlldyBjb21tZW50cy4gKGplZXZhbikNCj4gDQo+IExpbms6DQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTAxNTE2MTkzNC4yNjIxMDgtOC1pbXJlLmRlYWtA
aW50ZWwuY29tLw0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFsYWRhbGEgUmFtYW5haWR1IDxyYW1h
bmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBsaWIvaWd0X3Bzci5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgOCArKysrKy0tLQ0KPiDCoGxpYi9pZ3RfcHNyLmjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAyICstDQo+IMKgdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYyB8
IDIgKy0NCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvaWd0X3Bzci5jIGIvbGliL2lndF9wc3IuYw0KPiBp
bmRleCA3ZTUwYzNkYzYuLjA5YzM0Yzk3ZCAxMDA2NDQNCj4gLS0tIGEvbGliL2lndF9wc3IuYw0K
PiArKysgYi9saWIvaWd0X3Bzci5jDQo+IEBAIC02OSwxNCArNjksMTYgQEAgc3RhdGljIGJvb2wg
cHNyX2FjdGl2ZV9zaW5rX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLA0KPiBpZ3Rfb3V0cHV0X3QgKm91
dHB1dCkNCj4gwqAvKg0KPiDCoCAqIENoZWNrcyBpZiBFYXJseSBUcmFuc3BvcnQgaXMgZW5hYmxl
ZCBpbiBQU1Igc3RhdHVzIGJ5IHJlYWRpbmcgdGhlDQo+IGRlYnVnZnMuDQo+IMKgICovDQo+IC1i
b29sIGVhcmx5X3RyYW5zcG9ydF9jaGVjayhpbnQgZGVidWdmc19mZCkNCj4gK2Jvb2wgZWFybHlf
dHJhbnNwb3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4g
wqB7DQo+IMKgCWNoYXIgYnVmW1BTUl9TVEFUVVNfTUFYX0xFTl07DQo+ICsJY2hhciBkZWJ1Z2Zz
X2ZpbGVbMTI4XSA9IHswfTsNCj4gwqANCj4gLQlpZ3RfZGVidWdmc19zaW1wbGVfcmVhZChkZWJ1
Z2ZzX2ZkLCAiaTkxNV9lZHBfcHNyX3N0YXR1cyIsDQo+IGJ1ZiwNCj4gKwlTRVRfREVCVUdGU19Q
QVRIKG91dHB1dCwgZGVidWdmc19maWxlKTsNCj4gKwlpZ3RfZGVidWdmc19zaW1wbGVfcmVhZChk
ZWJ1Z2ZzX2ZkLCBkZWJ1Z2ZzX2ZpbGUsIGJ1ZiwNCj4gwqAJCSAJCXNpemVvZihidWYpKTsNCj4g
wqANCj4gLQlyZXR1cm4gc3Ryc3RyKGJ1ZiwgImVuYWJsZWQgKEVhcmx5IFRyYW5zcG9ydCkiKTsN
Cj4gKwlyZXR1cm4gc3Ryc3RyKGJ1ZiwgIkVhcmx5IFRyYW5zcG9ydCIpOw0KDQpDaGVja2VkIHRo
aXMgYW5kIHRvIG1lIGl0IGxvb2tzIGxpa2UgaXQgbWF5IGluZGljYXRlIGltcHJvcGVybHkgRVQN
CmJlaW5nIGVuYWJsZWQuIFRoaXMgaXMgd2hhdCBJJ20gc2VlaW5nIGluIGRlYnVnZnMgZW50cnk6
DQoNClNpbmsgc3VwcG9ydDogUFNSID0geWVzIFsweDA0XSAoRWFybHkgVHJhbnNwb3J0KSwgUGFu
ZWwgUmVwbGF5ID0geWVzLA0KUGFuZWwgUmVwbGF5IFNlbGVjdGl2ZSBVcGRhdGUgPSB5ZXMgKEVh
cmx5IFRyYW5zcG9ydCkNClBTUiBtb2RlOiBQYW5lbCBSZXBsYXkgU2VsZWN0aXZlIFVwZGF0ZSBl
bmFibGVkIChFYXJseSBUcmFuc3BvcnQpDQpTb3VyY2UgUFNSL1BhbmVsUmVwbGF5IGN0bDogZW5h
YmxlZCBbMHg0MDAwMDAwMF0NClBTUjJfQ1RMOiAweDA4MDAwMDAwDQpTb3VyY2UgUFNSL1BhbmVs
UmVwbGF5IHN0YXR1czogU0xFRVAgWzB4MzAyMDAwMTFdDQpCdXN5IGZyb250YnVmZmVyIGJpdHM6
IDB4MDAwMDAwMDANClBlcmZvcm1hbmNlIGNvdW50ZXI6IDANCkZyYW1lOglQU1IyIFNVIGJsb2Nr
czoNCjAJMzMNCjEJMjU2DQoyCTUxMg0KMwkwDQo0CTANCjUJMA0KNgkwDQo3CTANClBTUjIgc2Vs
ZWN0aXZlIGZldGNoOiBlbmFibGVkDQoNClNvIEkgdGhpbmsgcGFuZWwgc3RhdGluZyBFVCBzdXBw
b3J0IGFscmVhZHkgcmV0dXJucyB0cnVlIGlmIHVzaW5nIHRoaXMNCmNoZWNrPw0KDQpCUiwNCkpv
dW5pIEjDtmdhbmRlcg0KDQo+IMKgfQ0KPiDCoA0KPiDCoHN0YXRpYyBib29sIHNpbmtfc3RhdHVz
X2NoZWNrcyh2b2lkKQ0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuaCBiL2xpYi9pZ3RfcHNy
LmgNCj4gaW5kZXggNzYzOWY4ZDQ2Li41M2FiMDQ0ODMgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3Rf
cHNyLmgNCj4gKysrIGIvbGliL2lndF9wc3IuaA0KPiBAQCAtNDksNyArNDksNyBAQCBlbnVtIGZi
Y19tb2RlIHsNCj4gwqANCj4gwqBib29sIHBzcl9kaXNhYmxlZF9jaGVjayhpbnQgZGVidWdmc19m
ZCk7DQo+IMKgYm9vbCBzZWxlY3RpdmVfZmV0Y2hfY2hlY2soaW50IGRlYnVnZnNfZmQsIGlndF9v
dXRwdXRfdCAqb3V0cHV0KTsNCj4gLWJvb2wgZWFybHlfdHJhbnNwb3J0X2NoZWNrKGludCBkZWJ1
Z2ZzX2ZkKTsNCj4gK2Jvb2wgZWFybHlfdHJhbnNwb3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBp
Z3Rfb3V0cHV0X3QgKm91dHB1dCk7DQo+IMKgYm9vbCBwc3Jfd2FpdF9lbnRyeShpbnQgZGVidWdm
c19mZCwgZW51bSBwc3JfbW9kZSBtb2RlLCBpZ3Rfb3V0cHV0X3QNCj4gKm91dHB1dCk7DQo+IMKg
Ym9vbCBwc3Jfd2FpdF91cGRhdGUoaW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwN
Cj4gaWd0X291dHB1dF90ICpvdXRwdXQpOw0KPiDCoGJvb2wgcHNyX2xvbmdfd2FpdF91cGRhdGUo
aW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwNCj4gaWd0X291dHB1dF90ICpvdXRw
dXQpOw0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYyBiL3Rlc3RzL2lu
dGVsL2ttc19wc3IyX3NmLmMNCj4gaW5kZXggMWNjNTdhZDM1Li43NTAzYzc2ODIgMTAwNjQ0DQo+
IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19wc3IyX3NmLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwva21z
X3BzcjJfc2YuYw0KPiBAQCAtOTYxLDcgKzk2MSw3IEBAIHN0YXRpYyB2b2lkIHJ1bihkYXRhX3Qg
KmRhdGEpDQo+IMKgCQkJwqDCoMKgwqAgIkZCQyBzdGlsbCBkaXNhYmxlZFxuIik7DQo+IMKgDQo+
IMKgCWlmIChpc19ldF9jaGVja19uZWVkZWQoZGF0YSkpDQo+IC0JCWlndF9hc3NlcnRfZihlYXJs
eV90cmFuc3BvcnRfY2hlY2soZGF0YS0NCj4gPmRlYnVnZnNfZmQpLA0KPiArCQlpZ3RfYXNzZXJ0
X2YoZWFybHlfdHJhbnNwb3J0X2NoZWNrKGRhdGEtPmRlYnVnZnNfZmQsDQo+IGRhdGEtPm91dHB1
dCksDQo+IMKgCQkJwqDCoMKgwqAgIkVhcmx5IFRyYW5zcG9ydCBEaXNhYmxlZFxuIik7DQo+IMKg
DQo+IMKgCWRhdGEtPnNjcmVlbl9jaGFuZ2VzID0gMDsNCg0K
