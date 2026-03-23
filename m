Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ECCD58CDC
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 05:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7CB10E08C;
	Mon, 23 Mar 2026 05:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3N70XdY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5E210E03A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 05:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774244881; x=1805780881;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P2d6V71o3mc/bz+lPSiVkSaZH2eQ6zcz7cwM8A3+OyA=;
 b=k3N70XdYh6K7a/VL/KHU0Tt7HSZP/t1HcCcDrmMW53WTFP3hsjWYmOfM
 VBBNI7c/d+soVox3Ojkby45RFm3OpTfutcdW7GvTd29RhvfRcax2aVP01
 eng3wmGA4s8BNhsDOZ5jbEB+t0pxxLVXFIornf6HRj8Hpa9aBiZXQm1hg
 SrnSZBXsybw1JJFGTMJFJyGOw1D2sktEX60HEVlbCXDhMe3Wvw+bNev7S
 1sU9vPAkcC2i+Ohcn4wYYX4YFqZALnVZcdVsDxx4ssZy2A9PIlvd9UeBL
 4F0XcT3ZRpe+dfDgkTc02NYQKDpvK992zDeAOB+d9RioVxbThELAPlInw g==;
X-CSE-ConnectionGUID: s2d8WMZGRS6bi+lMoYgXpQ==
X-CSE-MsgGUID: CJwe+aUFRK+0shNsZLhCzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86712197"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="86712197"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 22:48:00 -0700
X-CSE-ConnectionGUID: /aRkTKYoTkO9iw5nc6FRxw==
X-CSE-MsgGUID: G/4D06pIQZOYsjKnNDD06w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="254394638"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 22:48:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 22:48:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 22:48:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.64)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 22:47:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVmuyDwvXdgty0vR2uuxXqnuEYi016U1Tk27fqePNclo3BaFfKRvyBzVRa+3qaf9r0ZIR/Hv8TU7EZtITDedEzB/QJvlbzKdH0RqJaqiaSLE35+0e5Pfv0z0gMJzR3hbUIq9KKyovdBhI4+7JxoDIHeOo77AP9Wya6sD83D0o72JDWILK1FrtjHcgQ5w/erhFFkzU45S4FVreylMnSK7lT6jsFDHJyioCAK9DW2Ze7SE5ei+tTFe8A7blaDqy0J/13/NPG7DP4IlZklVNgTzWctNLdBitCmrn9pvbJJEdJDBmnZ8ci3cPC8wKpZXeOsEaDghCJv+B94EK06+trrKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2d6V71o3mc/bz+lPSiVkSaZH2eQ6zcz7cwM8A3+OyA=;
 b=AWLj7fLgkHdsdoo2RI2GM9otd51TFr8SVm+xDKxtKLOjGmrTOzhMs5RsRQ9NWhJYRGfCjL5mhDvZMdU8YEhmz3tJInvY4K7k7NcrIJdxVYTs6x1Aj/PHeXC38bh/A4ylbNQvEummHldqSzBAeXdn3hvgSLCQLVhHCFoKP468Hj18jCPRXEO20YHIYj7kgoeePC6F1JWpn+wcCVetv2ClVneR4B8+kYvfq1AGBF76hMWrgVDCPixxgNeKKeFIhUrD05n+buSDz0sFTMYYz/h0YG+Amn+6l0P9UQ5+IN68LGI2rgnMSsA5X0aBWaCIVNKu/UC2smDFn/9Ux0uTgvu7VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by SA1PR11MB8542.namprd11.prod.outlook.com (2603:10b6:806:3a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.19; Mon, 23 Mar
 2026 05:47:54 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 05:47:54 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH v3 4/5] intel-ci: Add *-planes-random chamelium test to Xe
 blocklist
Thread-Topic: [PATCH v3 4/5] intel-ci: Add *-planes-random chamelium test to
 Xe blocklist
Thread-Index: AQHctRrQ834Y8/NfnUW7yYUlS11izrW0nb2AgAcIjdA=
Date: Mon, 23 Mar 2026 05:47:54 +0000
Message-ID: <MN0PR11MB60344FA8391C234D42690D89814BA@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260316075611.3333142-1-mohammed.bilal@intel.com>
 <20260316075611.3333142-5-mohammed.bilal@intel.com>
 <81623037-95a2-4fd2-84ac-ac952363b50c@intel.com>
In-Reply-To: <81623037-95a2-4fd2-84ac-ac952363b50c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|SA1PR11MB8542:EE_
x-ms-office365-filtering-correlation-id: bb5b9a7d-633b-49e8-6dcb-08de889fba96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: XLM0yFCepTRcEFjs5t205cklreIP+vjrhyj9xQoifKJNQ046GmklNAUq79JVZFWKOYdJpbaj//amOLnoNbA+vM8c/fSUvenSv8gJk9Ar+BH9Hx5dL66fLsCTTTkIf8ZiW5pOvcxvSe/b7LryLnY7Lka0Jl3RCo0QYhRuvzUqA6QLZ8n4IbCBDzLVNilwS2QZx8jP7Z2be634oFc59MYVMn7vNnp1geY9g/TcrTpBi/YPizuRDY0OMNWxPcgo/y3aUSvceKkT/E+aj5I+4OMmbz0DaXDPRL6eoMl+rk1GrwNNWvAOw3+AH/SjE9HjGEwblzkkekxE9210LOf/6TD8NffOJ3bbtolN2z7Cqqj0/N3NelZqD1+77cHR0hihgU10ZW2n0rYTINOYCzA5YE+vJLzE1nPApm9ZiGDXqvmaQCBt40LKSNdrvme8QbSdRDJeIJhglETKyGYs+LoU7J5++PWb+/87COR0GyB9C4JMnLBcKpN46SOZ7JB/QQeAIKNvB67vuAK0mm6O4EKd5y/UoyUkbHdv5KztYXiyq9CyF8rlTG0WrCK0O6JKswO6xAxzVwnBRLWTwsYku2L4hHWWkhCCTo6KcT9TM/ZP3yKyQRvR/LBG3LtFpKjY+efJicOvlc4KgXKueUzQEv5iiph3dBq3zgIWO2d/WywLo+N2vvqwJOtBNG6LbQOzDux3Aq/A/CsBS/hkbU0gdrDtgHD0bBu0WrpQ6vtHKTU2gqoswBkBhdSx8STIPTA2HRgN7ftW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3VBaGpJVFllczBuNWdyeU1IR2NJYXl2YkcwZFAxOVhKUGlzQ1NjTnVacmRT?=
 =?utf-8?B?OHhIMGdGU1F3OFpiRlZBcVNaQXlCMWZYd2lJUHZSemhCalFHTm9IVmpKaGJC?=
 =?utf-8?B?NGkvNXZ6TkJ6aTNhL1ZrSndZWkE5KzJNUnZyQ1U2eG5GYkhuK2dDNDhYbzYy?=
 =?utf-8?B?U1hMYVZaNlpyd1RtSGNTVEJyRFVLeUpQYW1XRGtNaFhzakE5T1JEemdHeGpL?=
 =?utf-8?B?VytxRnJMR0k5ZHorNWlSWGxiOVBJOGlBV2FleVVLZGxFYVNTY0JmMmRwMUdx?=
 =?utf-8?B?SHpwbEJHRWR1dVhJdVVmUkFIS2pGRWJMR0xSVXpZMnVvRitkS1JjRS8wa1BJ?=
 =?utf-8?B?VitUVjMxcTdWbW9nb0lRQXA0MURPTk9KU2NCY3VSNjZ4c3QySENTYUxneGlm?=
 =?utf-8?B?aXNmSHUwQUJYazN0cUJ3R1lkYk9VRFRMSUxhdWM1Nk1iTGdGM2tKbW1jdWJU?=
 =?utf-8?B?aE9DN0JKZXM3Sis3czFpSXJvUlVydmpmdEhha3p1dVY3ZnZabit5R2ZUenpG?=
 =?utf-8?B?RDc1Y1pkY3VUT0dka2FhT2dEOCtaQzZIMTBTSGNhUU9lZ0M2dVp5NkdLMDUy?=
 =?utf-8?B?QUZxWFQ1WE8rOFNCTE51bnNNa24rNk5DS1JWd2l4N0x4UUlpd0daazZ0RXJy?=
 =?utf-8?B?UnhybTduQUI5MEhjWWREelhVTWo0Nng2ekNoMDFlSFdweVJ3WWtiUEl1WUJ4?=
 =?utf-8?B?K0xEK3IxU3VUZmNZM3JIMm5veHpDcFo4Tm5XWG1RK0c0ZjZFQ3p2WVNVWlls?=
 =?utf-8?B?VFZpM29ZcUFQdW5oK3ZDZmo3aTUwelRkejk2MjA0REdkZWVUL0lTb0h4WlQz?=
 =?utf-8?B?VDlVYVdBRzg5eVhRN1RUOE9LaUFyYXVIeis4WjFQZmlNZ1gwZWpBTWFpaU11?=
 =?utf-8?B?dnhCaENJeTdVQXlYRUZUbHBFYk0vQmQ4NmtvQjQyNXRBN2J0a0gzVjAxYzFO?=
 =?utf-8?B?WGdSMjh4Z1Z5ZEhqbEVTZ0s0UVJZQWhIOGtrVHNoR3ZrT2tjOEZQdFZzbVZ6?=
 =?utf-8?B?WHV6MnNMdHhZSzBYWWJ2MW9BZVRuSDV5dkxjcm5PVmRIeU92YzlOMjY0WEZz?=
 =?utf-8?B?Q3VCUDcwODFBcTFGQkxDZmdJZStxTVliNTdwSmhBOUtXYjkyNlo0cVV2S01s?=
 =?utf-8?B?dW9UWkdxVTNKY3p1eW1ia0VHVGM2MytSMkU5d3BPV2FveTB6Vm9QenQ2aXdk?=
 =?utf-8?B?WjlWWEVxQ1owY0VMOFlTd2xHc2xBUG1STDV3aS95SGlnVlVhVkxCMWRiQWdm?=
 =?utf-8?B?MjZrUEl6TDloRUhvM1FNS3RsYnQrWGczYzNoQ0xsVW1YcHFnQ2UyOEdxT2Nr?=
 =?utf-8?B?RWZTSTFZZ2dwM2lYQjV2ajVOb1dWSVlEU29mZ1ZGbTBZWVBJV0FCd1FWSytB?=
 =?utf-8?B?NWNDb3c5cXVmZ2ZHdXBjRmc4US9sVDFqRWdTQ1duS1Axa1dsNjFtK2pOcmIy?=
 =?utf-8?B?a0NxUitaQlJiQnRjREgrRlN1MUZYdzgvMEJRREdSZGhNdm5CUDBkYnQyamhw?=
 =?utf-8?B?Yk1nVUc4WjJpMENTTW4yZmR5NlpXdm1TeG55TENEeVZYUDFvcklpRjB2akdz?=
 =?utf-8?B?cXNDTXdkVWhybG12SE5RMmpPZlFiTjN6SDMwazEvTzViUEZzcWF3U1FnSzZU?=
 =?utf-8?B?blUwdkFZeXlyd2RnQnhBM0Q3RG1lQU92aXFWSEEvZkF5MHlKZ3psOCtOZitT?=
 =?utf-8?B?Ykt2Z0kwWUNUd2F5N2xjTm5RSTlTdXlVUFBRRkEvYnpGNlZ1WDZvUUNlSU5C?=
 =?utf-8?B?cEJYL1ZBY0lBejcxUnNXUkFNRXBlb040MFpHVjZ0WjdGWk5OWFJyN1dZU01p?=
 =?utf-8?B?OGxMU0Y3cU43VzBQK2hwWTJrQTJZUXFhRlZvRWZEUnNjWjRMNS9yd0JncTFM?=
 =?utf-8?B?Mit2eEJHVmNRS2x5eUNKRlpOZkNaMy9YWDJJTkhqVE5pNVRPNTN4bG9XQlVI?=
 =?utf-8?B?VDJ3SGFkSE9idnMwK05XcWR0RGZyVFk2OEUzcTYyZVdQZk5rRXlyaW4zOTZv?=
 =?utf-8?B?SFM3cTBpSThPeENGT2NmNnZxckVTOVNiYjVxQjlmQ0J0amFUOHg5L0Z6NWpM?=
 =?utf-8?B?eWNBSHpmUVZ4MStsMUkxREtLSjRuRlNwUHdmbWZTa3J0QmVEaTZnYUd4WVBs?=
 =?utf-8?B?NjZFdzBrSTRNam1RR0crWkRjcWxaUitpVWJESEJieXdPVlFteEUvOEtkWC8r?=
 =?utf-8?B?eG1Td1labFI0VGZ5TjZ0Y3UzOWRveUFvK0ZvQ1FXOU94aFArTUZJRW44OWQ1?=
 =?utf-8?B?a3hvNm0zTjFYdVk4azVxcGZ3cFprUnBXYS9CWllZbVUxNDBHZ1NvNzFoUTZL?=
 =?utf-8?B?Y3A1b3d2WUpyRHo0S1JRY3dLUzEzbFVnVVpJd20vSzlWYnlXaldUZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: J36HwkSaz11++aKIfPCIz6ziAdNdACD7ZxSV2g3nlJK8c4lBic81XdRezBmU71ETqr6AxU1rtdTcBWN75gAeds7D1VJVEHze4X9wJJNvJi4W2fmIFtbJjLhBWsKM01jEPj6yZDYVKy6z8cxZPt/3CKgPjRLfNOLa2Ba4Z2n3XFGkIMyJ1oWoazT3r0B3008pkJHeGywahzWiWRYaapZO+oQfROdTHOF9HLnkn3oWbm1MhAsXiihEu9zoANQowW3GugNwPArrrqwAxAQGNOsPVH1xRsoaxb0At5hEXDYvFDxvfGx7hgQxs+pYwgbGvvP3MFWoccurpO0xUR2xRJuMrw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5b9a7d-633b-49e8-6dcb-08de889fba96
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 05:47:54.4654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6VbmE1pGwzBlFjy+eIUHgrvypx5vVJ3clx+yHSMsnpGumB0oBEyctRNyymptwpDpzCsl6fQCrrYY2UGjUsCH0P+fdvo0dqar8m1889TcLoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8542
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

SGkgU3dhdGkgLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNoYXJt
YSwgU3dhdGkyIDxzd2F0aTIuc2hhcm1hQGludGVsLmNvbT4NCj4gU2VudDogMTggTWFyY2ggMjAy
NiAyMzo1MQ0KPiBUbzogQmlsYWwsIE1vaGFtbWVkIDxtb2hhbW1lZC5iaWxhbEBpbnRlbC5jb20+
OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEpvc2hpLCBLdW5hbDEg
PGt1bmFsMS5qb3NoaUBpbnRlbC5jb20+OyBLb25pZWN6bnksIEthbWlsDQo+IDxrYW1pbC5rb25p
ZWN6bnlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDQvNV0gaW50ZWwtY2k6
IEFkZCAqLXBsYW5lcy1yYW5kb20gY2hhbWVsaXVtIHRlc3QgdG8gWGUNCj4gYmxvY2tsaXN0DQo+
IA0KPiBIaSBCaWxhbCwNCj4gDQo+IFNpbmNlIHdlIGhhdmUgZml4IGZvciB0aGlzDQo+IA0KPiBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE2MzI5Ni8NCj4gDQo+IGxl
dHMgZHJvcCB0aGlzIHBhdGNoLg0KPiANCg0KVGhlIHRlc3QgaXMgYWxyZWFkeSBibG9ja2xpc3Rl
ZCBpbiBpOTE1LmJsb2NrbGlzdC50eHQuIFNob3VsZCB3ZSB1bmJsb2NrIGl0IG5vdyB0aGF0IHdl
IGhhdmUgYSBmaXg/DQoNCj4gT24gMTYtMDMtMjAyNiAwMToyNiBwbSwgTW9oYW1tZWQgQmlsYWwg
d3JvdGU6DQo+ID4gVGVzdHMgYXJlIGV4aGF1c3RpdmUgYW5kIHBpY2sgcmFuZG9tIGNvbmZpZ3Vy
YXRpb25zLCByZXN1bHRzIGFyZQ0KPiA+IG5vbi1kZXRlcm1pbmlzdGljIG9uIGVhY2ggcnVuLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTW9oYW1tZWQgQmlsYWwgPG1vaGFtbWVkLmJpbGFsQGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHRlc3RzL2ludGVsLWNpL3hlLmJsb2NrbGlzdC50eHQg
fCAxMSArKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS94ZS5ibG9ja2xpc3QudHh0DQo+
ID4gYi90ZXN0cy9pbnRlbC1jaS94ZS5ibG9ja2xpc3QudHh0IGluZGV4IDgwYTBlZTkwNC4uODBj
Yzk4NjA4IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsLWNpL3hlLmJsb2NrbGlzdC50eHQN
Cj4gPiArKysgYi90ZXN0cy9pbnRlbC1jaS94ZS5ibG9ja2xpc3QudHh0DQo+ID4gQEAgLTEzMiwz
ICsxMzIsMTQgQEAgaWd0QGttc19hc3luY19mbGlwc0Bhc3luYy1mbGlwLXdpdGgtcGFnZS1mbGlw
LQ0KPiBldmVudHMtbGluZWFyLioNCj4gPiAgICMgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgVkdB
IGNvbm5lY3RvciB0eXBlcy4NCj4gPg0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiAjDQo+ID4gICBpZ3RAa21zX2No
YW1lbGl1bS4qQC4qdmdhLioNCj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMNCj4gPiArIyBUZW5kcyB0byBnZW5lcmF0ZSBpbnZhbGlkIGNvbmZpZ3Vy
YXRpb25zICMgdXNpbmcgQ0NTIHBsYW5lcyBvcg0KPiA+ICtjb25maWd1cmF0aW9ucyB0aGF0ICMg
ZXhjZWVkIEhXIGNhcGFiaWxpdGllcyByZXN1bHRpbmcgaW4gc3BvcmFkaWMgIw0KPiA+ICtmYWls
dXJlIHdpdGggLUVJTlZBTC4NCj4gPiArIw0KPiA+ICsjIE1haW50YWluaW5nIGV4dHJhIGNvbnN0
cmFpbnRzIGZvciBJbnRlbCdzIEhXICMgaXMgdG9vIGNvc3RseSBpbg0KPiA+ICtjb21wYXJpc29u
IHRvIHRoZSB2YWx1ZSAjIHByb3ZpZGVkLg0KPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+ICtpZ3RAa21zX2NoYW1lbGl1bV9mcmFtZXNAaGRt
aS0uKi1wbGFuZXMtcmFuZG9tDQo=
