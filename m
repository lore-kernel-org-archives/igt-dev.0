Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05DECD5BD0
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 13:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA2410E356;
	Tue, 26 May 2026 13:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQFvS23m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868AA10E356
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779801617; x=1811337617;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=J49WKhL4q+JIlJ6kZx0AAEc8EQITZiT5SU117UelYG8=;
 b=PQFvS23mnwFiBn0SYcce9DmZULKv24njAJ7qIEXrAhR4ReomwWxBi8s6
 C6H6Fegc85GkFPP5syYb5MYPJEx9DHqE1Mgzo/M+Qw3qrzAcIQV/EPci8
 lTjGbGI8ybxmkohfLf9zoqBbvlQbe31fw6Tu3R1O0beJw1WtygEoG6xUu
 ILAI//OSgBRWkiB6iT0qD/ZqQel4DyM9vXd3oNUA8X7h+HSCqUMpYNfsK
 6tmftRhXkACM0dwt6onnnonRKclsYYWp6B+CPYQObWtfSKKv1qzehxm0p
 AsoJup7a2Q1zUELvPdAwhbPW/dZA7lD68B3GCI39nI2QhLby4KQROAGJA g==;
X-CSE-ConnectionGUID: TIQSxCtWQk+3yVUH82ihkw==
X-CSE-MsgGUID: MIEEKjnnTUqdItrAT3mkcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84468170"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84468170"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 06:20:17 -0700
X-CSE-ConnectionGUID: VLNWAxv+RiGE0I0n8Nq8GQ==
X-CSE-MsgGUID: Umm6ItdlTRq4alfMyFNrNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="238905741"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 06:20:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 06:20:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 06:20:16 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 06:20:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeciybrGzzrCSZuzWzdY//QEEN4CigQm1x9URYAhp3poo/++taWY9bo8IzmTFVdJQNrRXJi5T1p6S2gMeEcNXh5lX7NrZop1IStyvD8mFumFbotODF/3Q2xr+gwlzfpKOWCvdy2ZtO22XgFZhWJyNvr8FoKXgH7arVOLowSonNMD/n8hrjZ4rVq018JmZbEpxpnWwmhztb3k0zC+B2Lw5g7eoRF5Iyh+27CacD0c1aJENutNyYvYEQbUv/9qpgPFIjzvvu1a/tGFdDNcQgYvuWKvl1pfm/Pk6dI6qFmJrw30IflaKYLBYotBDnQH0GVs2+mxz4onKDRvV3KNEtch6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J49WKhL4q+JIlJ6kZx0AAEc8EQITZiT5SU117UelYG8=;
 b=cXe/NlfUXbAU/9Yi2ry68WhSdWeHNDb0vQl2Exk2Ofd9iqOdp1hwQSVLIMmztyTf07Mm6hqEQiW0dTOQi4uxoYqWyrfw3p+MNYOW2KgrqwfBtT4p5BLSe/fChR4Fq1OmDRkUnkHUe1H5Pc3NbHwGZgazFyTpWvH83fYx/WHKyufOTkGo/OQJbcfVOTy4VpyB4eIMvGniuEsJntUYX9B8gmz6liQRvUCepuPUyXZmyApVIoMPBGid51TLwwsW1j+345BFp4DUTx9yzHNCBb0jGPfhuUiqY7ACu5kg4DTD2WgwC5ko2zrYA1ybvkEPTl7aAitoLZ2iSJZ+E0qQYQCMcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by MN2PR11MB4677.namprd11.prod.outlook.com (2603:10b6:208:24e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 13:20:08 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%3]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 13:20:08 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Karas, Krzysztof" <krzysztof.karas@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [i-g-t,v2,1/4] runner: Rename dirfd to avoid clash with dirfd()
Thread-Topic: [i-g-t,v2,1/4] runner: Rename dirfd to avoid clash with dirfd()
Thread-Index: AQHc7Q0UyEOrvVp8fE2mIW2ff2wZlLYgSqIA
Date: Tue, 26 May 2026 13:20:08 +0000
Message-ID: <5e6059444b43b74e0450e44182efce2bc37be71d.camel@intel.com>
References: <20260423105514.175870-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260423105514.175870-7-zbigniew.kempczynski@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|MN2PR11MB4677:EE_
x-ms-office365-filtering-correlation-id: 3470f14d-cd0c-4528-9ed7-08debb2981fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|6133799003|22082099003|11063799006|5023799004|3023799007;
x-microsoft-antispam-message-info: uLkIMKtt2EGvKRDoB5rAnrOPuJkMFdkqdg74LZgW3EwQplCDnXA0Lhe7MO1K36ErDo2jrAf3Omax375ycSNx4SJCucu81DZ9UhGemVprjHaFkKkWuNSp7Zr9obxjKbJ19BqQUuPwqD5XRrJP8TWgKYpotJmB3F/15zzbycglvcHZooocnB5o4lyehYzuqmU2YYgcFQeZGj0JEoDF1u54FJUkLjF3lMyEHPwCnmKWpmWbMfaak1fEIvcM7tGu9eaIOe4goOrsiBMvJrCtI6BR8zARX0LJUv+vib5sSvxGa0wUYVKcJBllHpnGFOZb9FB4OByuqymhL4mvsHB7m18p8MSM2FX1Tf814TsTyrLEx8SVo6iKeA44w7Yqw8oyddX3QZLF9NQW39cApm8NtlkybkFmlfCK1FF4a9D3PVlZRFTuOSRJZfao10HRTF/71VLaszwj7yc1i3tXNea3FRG+vUVqbSHlTTYy5+KKy9pBZJKerEvRISCwVf2OzszVnYMecS8lBAPu5/pM73T6NYZwwbJ4ybRa9GYQEOFl89sHL7pviqe/CaMy7kK1ovCgSowXJVkQ1ZJrU4dBymORz4+Ll1SDHVS5hPIp3AVpy4EnygUOkOJZnzdFw7Cj7N4H3XEyyLsRdvWXeMeRRYS9WgNwiCb2/mzaGa0jIDwM1PBn7TLDvKTQhh0dnhzQIV97F9hGufd+mKyUvqaoNSZDW0JPbDI3Tg3GZTyOJfGWe7wdJA0tmjYwfXQwM1mMzTEx9K22
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(6133799003)(22082099003)(11063799006)(5023799004)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmlYeUNXWk5GK2xSY2QrTjhGVmZQMSt2S2NWUWtIbll3bVUwK2o1ejVUMUJl?=
 =?utf-8?B?UVVSRGJHK0JsUnc1RUlld1ppclM1cFZibC9qcllPQlZpN0V5b0J5NXpzZjRt?=
 =?utf-8?B?QlJtL1JpaEp6L0N1TTlwMVRxVlIwSVpxbWpOU0dwdDhKam51NkJZVmhXYUdE?=
 =?utf-8?B?M0xXZjExdTJsNUIrL2dtdzlFMS84SVU5OUFJK2JaTUJsTmpwbWZaem54akpJ?=
 =?utf-8?B?VDFCQ04zUFRFUW94N2VlNFJxYzNMbDVjOXJGMFl3bVZ0eHhzL0t3WE9ZRUZu?=
 =?utf-8?B?cGZXRmNlSkQ4aERuMHFFcERUWnp2S2dtNytpN2xubTZVUngwemJZWDU0bDAv?=
 =?utf-8?B?S3FYTjlJbDJUMnNGdjlMajVnbVlmL3RyZHhGL0Z6MnkrSlBxUDdkcnZ1UXlM?=
 =?utf-8?B?R29BdTAyWndIQVRwSUlSUitPMFVNd0MvZ3l1UE9LMUJPa1hGR0h4azNqNWV1?=
 =?utf-8?B?VEtnYU9YNjNtdHI4NW9uNTMxeWF6eTVnQUU5cE5qWHpmaWZZeHJTVnJYZ0lM?=
 =?utf-8?B?Yk5tbWFIR2JuNVdBMTd6Snp5TDEydzQyYndCL0ZQVEs0N2RQZmJzZWErNW05?=
 =?utf-8?B?dkF1OXllT0ZFWVNRMTk4Wk5jS1Iyd2RUWnI4d1N0aWdqVFk0Q0laVitYN0Zt?=
 =?utf-8?B?d1pmNTJ6UW5TTlRobU1vU0NtOUU1dm1xQ1pnSzhwekhiQjhnTGdnVit4UmVZ?=
 =?utf-8?B?NUhRTDF4VmJKOURkZ2licXZPc3REbkpGL21EZmF4WFBWYlRqSzNaNU0zbWEz?=
 =?utf-8?B?UWxHd3hxYkpKdk03VTV3blVkNXM1SXlpeDN1ODN6azEyeThIL09zc2cyT1NL?=
 =?utf-8?B?Sm5taGIzczZWKzdMRC8xNzNtRjhBUUhlbkNOU1ZRV3hIbU1UQzM5dHpUYWdX?=
 =?utf-8?B?bjFXUllNa1ZabEgyMWNjdVdCaEViU1hSUzhSYXJ3ZGJuRTNWcTdrbEFFMi85?=
 =?utf-8?B?bEJmRmY4UTRHTXNteTFISk9nNTRST2dwejM2QnU3QXlmbHVLa3BIZVlMQ1d1?=
 =?utf-8?B?bE9HcjZKWjJqRHQ0N201eW1sRWh3UHBqY0g1YW5PbE9LLzdSQ2lZZExaeTF0?=
 =?utf-8?B?RU9mSXBXUGNTQVlhcStqQ2V5d2k3Zm9ZRHh4TUtyUFh1NVJXc2dockxSblc2?=
 =?utf-8?B?cUNONU1zenUrZFNTZkZkVDI0cHBldWFldVJOTmhQRmJDejlJVE1NcWpXelZr?=
 =?utf-8?B?ZGJSQW4wR1RzODZaNWJaK0hlRmdGZzVHSGt1S1V1cVZtelFIZTBhaHJIRHo2?=
 =?utf-8?B?blp4Wm1yYy80QmZOYVhEaGdOV1d4SUxhbmZOd1FVY1R1dXREYUFmMEYwSVNQ?=
 =?utf-8?B?bEJ0R2JKanczYXhKVU01VmcyVzV1MHVuRDlROFFERXJLMkJwWnlycUFHOGQv?=
 =?utf-8?B?V0x2ejlSQ1U2U1RKS0ZUUzl1VUxMWkVUbTlxRitYa3JqR09SdnNQWmFVSUxU?=
 =?utf-8?B?eVowS2NaWVp0eGtWZGdKQm15SVh1Sm9BbU9DZFVmZ3h0SXBodjV2QlBoN2k3?=
 =?utf-8?B?UmFXYU9XczNaWDVLa2hzUTNCQTQzNGJBM0hhZDBxK3g2cXp6di81NlBpQWlq?=
 =?utf-8?B?MDViWFdSSTlaRlNXK2VzWXdIWEY0OVZkWG51a0tMMjFJcW5Pc2FKUDVuZlBt?=
 =?utf-8?B?OVQyVnBYS205V0FHUks1Q2RNbkR3Wm1HcjFQdXRDUGl6c0J0VFEzTFB0OSs4?=
 =?utf-8?B?SDU5eWJYS2UxTlBDYURCbXplWmo3ekljNitQRmRZZVNIMnNrS0wwMUZZUDQz?=
 =?utf-8?B?ZmJqd2pSQzJ6VS9xeDhTdmc2U3lhVEE0Y0dxU1Z6c1FBWmxSelN3K25YT2tt?=
 =?utf-8?B?Szc1TVNBYzlRcTU3T0FWR0FOQWxRQmk5Wk9kRmovTXpHNkNtQU94TDkvMjJR?=
 =?utf-8?B?V0ZCTDE0b3lJZzlucUNpWGxGNmdIU21zT1IyL3lFWk96WW5LOXdJMnMzejE5?=
 =?utf-8?B?T01GQ0ZNeTJZOXZNMTYwbThDL1U4ODRPQzVSWFIxamlUQ25YWW1hV0ErY3ZF?=
 =?utf-8?B?ZlRhYlN2UVZwQU1DcTIvWW5qU3U5NDM5T0l4Uis3SGNkVm1hM3p0TXJwUHFt?=
 =?utf-8?B?T2NCYk1LL2pHRTZkMm1MdGd3K1hPRWFwMElESFRudHV5NDVKaUgxNU1PNkJZ?=
 =?utf-8?B?KzV3WUZMblZ2T2VnRjFObDA4dUpjb2JLVmFheFc2eWN4WnRiSzdxTDlORUNj?=
 =?utf-8?B?bWJBQ2tOS1BuS2d0WWtIbDhDUDdEeDV2QTlMekhhRkZqY2FMWWhNbjVGMkd3?=
 =?utf-8?B?MVgvNlNLSWRaQURWbVJWMFBaS25ueFNhanRPRFRkaTRjR3VBT1RtNnJxYzhB?=
 =?utf-8?B?c0MvcHM0WjArcy9PUmNKbzE5TXZqTW1rQW5Ob2dXTHRqeGtxaC8rdzUybWtw?=
 =?utf-8?Q?Ws4sYYJfABnUda6k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B6A4231A2BB4F4785ACB33A97D070F2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FVlH2ejNbVTe1jTPK0BA9sSwXjNx4GNUSjtuqkv9cfasnvestyw+lwB+fFMCj7ZoJOQdqkqjGN6Q3esq73wtIxK0nns/hdmcD78I3RPlprLaNsazpws6Gq8rHrG8hdX++LIK7BNRFmDuEWDE/YkumS/ljbF6jut00VN0JhrALAuLNYryDdkd7y+UG8Eh+BSNzi052BXa/543Scm3yN/Ulq79zcHkgZUQa64TLWE9tc3PTtaDPbX2my6XwoZLQ8ih2buYYct6VkNOcfW3STKhS93/HirN58LeWLAyd65GAGFRQ+Omap4q9zNnOOvtZiG3M/13+xTTFYxqa6yz6kdFXg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3470f14d-cd0c-4528-9ed7-08debb2981fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 13:20:08.1154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uwS/+gWPvGpntTWJV1mfY7ISHAQZybP01s3KDU23w/J8uSM0N8WtAqaEGfaxaICULkdIfHtfx32gy8gviBaaHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4677
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

UmV2aWV3ZWQtYnk6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCg0KT24g
VGh1LCAyMDI2LTA0LTIzIGF0IDEyOjU1ICswMjAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kgd3Jv
dGU6DQo+IFVwY29taW5nIGNoYW5nZSB3aXRoaW4gZXhlY3V0ZV9uZXh0X2VudHJ5KCkgd2lsbCBj
YWxsIGRpcmZkKCkgc28NCj4gcmVuYW1lIGxvY2FsIGRpcmZkIHZhcmlhYmxlIGlzIG5lY2Vzc2Fy
eS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcu
a2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBDYzogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25p
ZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBDYzogUnlzemFyZCBLbm9wIDxyeXN6YXJkLmtub3BA
aW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6
bnlAbGludXguaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEthcmFzIDxrcnp5
c3p0b2Yua2FyYXNAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHJ1bm5lci9leGVjdXRvci5jIHwgMTIg
KysrKysrLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3J1bm5lci9leGVjdXRvci5jIGIvcnVubmVyL2V4
ZWN1dG9yLmMNCj4gaW5kZXggODQ3YWJlNDgxYS4uMTQ4NWI1OWQxZiAxMDA2NDQNCj4gLS0tIGEv
cnVubmVyL2V4ZWN1dG9yLmMNCj4gKysrIGIvcnVubmVyL2V4ZWN1dG9yLmMNCj4gQEAgLTE3NzIs
NyArMTc3Miw3IEBAIHN0YXRpYyBpbnQgZXhlY3V0ZV9uZXh0X2VudHJ5KHN0cnVjdCBleGVjdXRl
X3N0YXRlICpzdGF0ZSwNCj4gIAkJCSAgICAgIGNoYXIgKiphYm9ydHJlYXNvbiwNCj4gIAkJCSAg
ICAgIGJvb2wgKmFib3J0X2FscmVhZHlfd3JpdHRlbikNCj4gIHsNCj4gLQlpbnQgZGlyZmQ7DQo+
ICsJaW50IGlkaXJmZDsNCj4gIAlpbnQgb3V0cHV0c1tfRl9MQVNUXTsNCj4gIAlpbnQga21zZ2Zk
Ow0KPiAgCWludCBvdXRwaXBlWzJdID0geyAtMSwgLTEgfTsNCj4gQEAgLTE3ODYsMTkgKzE3ODYs
MTkgQEAgc3RhdGljIGludCBleGVjdXRlX25leHRfZW50cnkoc3RydWN0IGV4ZWN1dGVfc3RhdGUg
KnN0YXRlLA0KPiAgDQo+ICAJc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAiJXpkIiwgaWR4
KTsNCj4gIAlta2RpcmF0KHJlc2RpcmZkLCBuYW1lLCAwNzc3KTsNCj4gLQlpZiAoKGRpcmZkID0g
b3BlbmF0KHJlc2RpcmZkLCBuYW1lLCBPX0RJUkVDVE9SWSB8IE9fUkRPTkxZIHwgT19DTE9FWEVD
KSkgPCAwKSB7DQo+ICsJaWYgKChpZGlyZmQgPSBvcGVuYXQocmVzZGlyZmQsIG5hbWUsIE9fRElS
RUNUT1JZIHwgT19SRE9OTFkgfCBPX0NMT0VYRUMpKSA8IDApIHsNCj4gIAkJZXJyZigiRXJyb3Ig
YWNjZXNzaW5nIGluZGl2aWR1YWwgdGVzdCByZXN1bHQgZGlyZWN0b3J5XG4iKTsNCj4gIAkJcmV0
dXJuIC0xOw0KPiAgCX0NCj4gIA0KPiAtCWlmICghb3Blbl9vdXRwdXRfZmlsZXMoZGlyZmQsIG91
dHB1dHMsIHRydWUpKSB7DQo+ICsJaWYgKCFvcGVuX291dHB1dF9maWxlcyhpZGlyZmQsIG91dHB1
dHMsIHRydWUpKSB7DQo+ICAJCWVycmYoIkVycm9yIG9wZW5pbmcgb3V0cHV0IGZpbGVzXG4iKTsN
Cj4gIAkJcmVzdWx0ID0gLTE7DQo+ICAJCWdvdG8gb3V0X2RpcmZkOw0KPiAgCX0NCj4gIA0KPiAg
CWlmIChzZXR0aW5ncy0+c3luYykgew0KPiAtCQlmc3luYyhkaXJmZCk7DQo+ICsJCWZzeW5jKGlk
aXJmZCk7DQo+ICAJCWZzeW5jKHJlc2RpcmZkKTsNCj4gIAl9DQo+ICANCj4gQEAgLTE5MDAsOCAr
MTkwMCw4IEBAIG91dF9waXBlOg0KPiAgCWNsb3NlX291dHB1dHMob3V0cHV0cyk7DQo+ICBvdXRf
ZGlyZmQ6DQo+ICAJaWYgKHNldHRpbmdzLT5zeW5jKQ0KPiAtCQlmc3luYyhkaXJmZCk7DQo+IC0J
Y2xvc2UoZGlyZmQpOw0KPiArCQlmc3luYyhpZGlyZmQpOw0KPiArCWNsb3NlKGlkaXJmZCk7DQo+
ICAJaWYgKHNldHRpbmdzLT5zeW5jKQ0KPiAgCQlmc3luYyhyZXNkaXJmZCk7DQo+ICANCg==
