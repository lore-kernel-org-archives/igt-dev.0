Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4972606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 05:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PkMnE6aw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85810E3B8;
	Thu, 22 Oct 2026 05:09:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442BE10E3B8
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 05:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792645702; x=1824181702;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WPep4lYBSReDSxsMwDirZcKA8bBErkHwG6xRQCVrZTw=;
 b=PkMnE6awbX4O8sdAeautbQlGw1ElAGvbcgCCg3DZfnBG4OMEQE21qn5W
 4ZEeHmwM2RlyDJZ/ZEWpvZ7rZnYAlL5fAzvELI3D1Qr/pg313coKPrZ+Q
 bICBXUn4mbGMHgyU7PSIPO3gTGe0UBmuuGCbT/ugfmevU7225RSZ5WFDw
 ktFL0nWYYq7sO7wx7E36pdwLnWDCs5jYUQe8zl4ErYQhwgm0vA2nJeV5r
 AZTnz12tDOMqJ/on2WCPY6eh9IqOvvqmvEg856CqQUvAGK2ycnC+nFpyQ
 HQbgguTRKc5YnsiLUlXCBpBdb5s2GAr75Qddg2lblcgPdWf53NgUzwuYF A==;
X-CSE-ConnectionGUID: V3qkOhTCR1y8P8ZiFOaB+A==
X-CSE-MsgGUID: ZPRDdsz5QC6QE1ijq1ufLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1271560"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1271560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:08:21 -0700
X-CSE-ConnectionGUID: 93HsbjdBTGKt9UhlmyNhvA==
X-CSE-MsgGUID: vV9Nifh5QlCgIiWGCKg1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3673131"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:08:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 22:08:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 22:08:18 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 22:08:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCwuY0i7e2LTvQHVMRoWSqyenJTMl9+/3nxa3lwOnbqMNmynxb1InLEQ48xBTlncDT3t9AWpYcysvKAZlGSIpcjpKR13vxnCjXFeu8b0sv9fRCd/ll4Bafs+LM9DKL34ZMCu+Dwv/WYhpQo3WTANIS/g/vADlmvLYRb/030p2QfnQYqsXtB2nLNZstVyc0kEUigUkDpk1MApJFpzsJsk4pJEqZd/Z/oTXBaz7pgdPrd4I1Z90EYtMXrgMM6ek/lGbEO9BPAyH1KORjo34q07xKEXHnr41lH5iC+1gHtOl6BxVlNfgkcGY5t6/yQ4IDrX7X979jJ2fRoq6B5uhz0E/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAhm99UDLwKBC79+fuPz717NyEukUni1tWUaMwfmiaY=;
 b=HhxHXd7I7A2x9JjcWP4ml64sd7yyQhZIGa2rgrQBhv0mNOwaXufNwoEMp6e4PV/8xrHZXoCN2dwsm03XuXcRFOQ05sV5MQ51qUDWdZlTnVeGW+8Xcqp2Y4IMDwzScKdvJXBQBHUt/IHODcuDIwUOVoD8xec7j38Waf+Peoe13+XFw9+hisjOWv/xG3czxwrOcQYGuwO96yxWkDLRCbBEwF/41gD3yax/UkY9erdkGkgE9s4ybQMvJlfxXMJfi1s8JCRE++7yDaoE886hrOSfBLC4BcnsC6pGNq3YIEnWeJtxioFJq1g0nV3fhVc/MI2hmBsnp0FEMbsV55GAk59YDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by BL4PR11MB8869.namprd11.prod.outlook.com (2603:10b6:208:5a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 05:08:11 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 05:08:11 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_color: Fix simulation check placement
Thread-Topic: [PATCH i-g-t] tests/kms_color: Fix simulation check placement
Thread-Index: AQHdX8vZA7eJ/B6Z10y9lGJ7s+hKyrcJBsLQ
Date: Thu, 22 Oct 2026 05:08:11 +0000
Message-ID: <PH7PR11MB6796319E0B3B1054AC45776BE5652@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20261019131331.722457-1-pranay.samala@intel.com>
In-Reply-To: <20261019131331.722457-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: pranay.samala@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|BL4PR11MB8869:EE_
x-ms-office365-filtering-correlation-id: e8f0391e-c6fc-47db-3625-08df2ffa77ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|261021123027099003|38070700021|56012099006|260925021311599003|260925022911599003|260925021911599003|11063799006|261009223027099003|10067099003|18002099003|22082099003|3023799007|261021121427099003;
x-microsoft-antispam-message-info: /NneqbFYxT856o9th25Swr77sg/rO1VW1iIfJTvHVPiVPcQFMFj56PQn6EooNqX9AQfq2y22LnZd1Iofa2bksNYge9M5Vsyhs5jYs+czOat+xlDfmybbWfhdQvy6MlPHFraRhWO+QECGeNbse8ipT51NdAWcrcdhX0P8EaTWwkzYAxW5rVsJ4vLKUpGnhhWxgF41brpXvKgGIoU12r9Q9OdvrhFaq/fkKBJ/e6dHzi82bLPAgX3JPMCod9LlFYZ08D1mQ7V7OG/+N54U7kkSq1xrChZHVbhZwMQ30nwlJw2huUzw2yeM1OUGUt4v+FlQMycrR4FLjmXMtpO4/RIpCDFOzJRkVXfOypwyJCAuuKEKW0lWH7P6QHyWtPdopRgDqzs1v5SD/C7gNWDEv9MGBCWO2rcV36DUKtd0cHi7Bd84ilggtMAUgwJEV4JPX7kOiEtk6iTdNIbChFljE9zhxwiG//IRgYz+EMDZeUdNgOlt6Sl54+Y0drX4J8M5x9WtfUwJoTtruv/kUq0FS+dA7rAVdnCqpv6gfcYemuqeieNjfOgZp25oHfnRNMPIfgrwiFFWJKqXHP3twGQJRN5F6qp49vOwrXdk4SjL4xdWLDSZKF3OUCjHY8cRTQ/ACEtzjP6Prla6Rf6Om2nLfLkTMPyJiOm3RqU1a/7wwjqnMt0S6WxaEAtCMhRV+cGNFSFcDnmaK7UjV0BKIS8Lo35NiZblJtcukl0P+7PeUUCAU7A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261021123027099003)(38070700021)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v8hbReedvs7mGl6C4OwKKjJkt2HvXp32El8NEJwUdPkeJT1nAJy26PApeR6P?=
 =?us-ascii?Q?ikimJLmeodcUO9LjCt1Drmw/ucxUfM2rm2xo+P8UsHKhn1nN/MpiGNePdKNT?=
 =?us-ascii?Q?lNmDSDDlPjpZVp+UGBvNXSkK2xzODwXxTkoy/YNev5eukM8L25wMXPgXP+/8?=
 =?us-ascii?Q?vLs3M479XWz7LqOuD5kPN0s0Rm82XgR8WbrbOS/sJ3iZ4WIliL/p3/IC2xIz?=
 =?us-ascii?Q?aipxjjQhNCubJwl3VNP5etcBAdBZGHvXxy/kNie/TwxKI30P2OeV3W5+p22a?=
 =?us-ascii?Q?kSjExXXMzKrd4DlyBCrd88bCiPjglOV0xJSiNJA25F+TSggLtjR1WKtqs1CV?=
 =?us-ascii?Q?ydPOc4Pu3z2SLJKa1FKryIKWbk7ze5QYDBJE5zGYsEDlbnweAJw3cVEo6v/N?=
 =?us-ascii?Q?BPmgW6k4ixy1sWfjUJUqv1nqCN7jNFhSAfAwWr9P/YJlCVN0VWDmluZ9OC9/?=
 =?us-ascii?Q?asHq1D3+HDUKph3J/DCjw4sgb/WVj03dLnGJ+ChHXpZ7oTSk73IlWRkEWC7q?=
 =?us-ascii?Q?viWuq5XdQVVE7OyQ55zSsXTfC3cD5mmIWNbFevsCRwyENWIhNA1xRCHS9aAL?=
 =?us-ascii?Q?WesgDkPCXxFMEgvQ9TiusHxIisJ32wWK6eD7C4Oqxrk2th1y8/63gKd/+6OQ?=
 =?us-ascii?Q?mzOK8wpBgtjADu7eLJbY9eMJndrDfNRXpB1HbfNGDFDZkMO8zRMAfp40ldZa?=
 =?us-ascii?Q?UgqeBTGe6GfP+iIHJQtpFQROLdFSenNHDVuqNSoxq5I+SYb5ARo0XxYDX0hK?=
 =?us-ascii?Q?kMxIi8AZIRiUBYLGw/YvsJ7/e7ncDUrzE3jR49PzCkUYEecysu+jj6m7/vY4?=
 =?us-ascii?Q?WbMaFaW/Egc/R8GLimdG/Jg0aaGLwkJRikr7tdg5QcW81Vb+Ftj2tIcMRBS+?=
 =?us-ascii?Q?fIZW3l/EElmVWhgEo8+fg2Z7MxQhTWZVbzioZ4uV+Tb7xJ+Fx/1C6OIYQIdx?=
 =?us-ascii?Q?HHi4rU/CyV5iYMo+PoWp07K5HA+W7uE0Jj9biLgWO2sSFTsPFvhDKkDZz0Df?=
 =?us-ascii?Q?8VcQK42KgL9lPBymR39/AEwzjwg7CsWH1ujgjJ+Yj+5S5521obMTB/JeXX24?=
 =?us-ascii?Q?1e0YR0hq8VwMC8AV6g5rC3AkLMeuYU6QpAUHCyyNWgx5vnMXvPWMtkvBtCmh?=
 =?us-ascii?Q?gxiRToF1KkJj+9UPYsbNCF0k+RNC6k9Qj50CgkgX5Tr0njb7sepXDQtBWel2?=
 =?us-ascii?Q?KXAQUBXu7UcH8bGJTP7tro6lp7vMzhJgOhrV01Rr7iE6UBZCZPxXqhFeP+M4?=
 =?us-ascii?Q?NwTBX0ZwF6ElfDm+L3/cz235ND1FekYoDBL0g+T5gQprga7ITUXYKuMiMByk?=
 =?us-ascii?Q?DmSgUP2NDPBvepNGnEE/O0l9t5/yY4zDcbq5TFFwxChA0rerND/ScA/1j/X8?=
 =?us-ascii?Q?NqzIuF8Kv8RhZLsEtQkY9a/k/ka38mIRpuBDRf0J2Yj+jWq5LjjPOTfnSogb?=
 =?us-ascii?Q?NKYIe1zsTJ2CJFfPTX6Ph59eVK0pdTT5UaPVYr6E9eSiO46/YSG9Jwipo+Rg?=
 =?us-ascii?Q?kRwqShrnA8c0E18L7UIj1VQDYYii1666OjUXVBsVjGyFDd9101YwkWaM/xvb?=
 =?us-ascii?Q?PmGYnphMfCaK9jD3bqKLFofZiqVNQZCNdZAkUSGKD1T/rVWIdd68KIJU4CxT?=
 =?us-ascii?Q?YfIt+ky+YPa+vn1B56N5LJUBGEaaUzZu7MaVBwKiPROzhSl2zNu90khcF8pc?=
 =?us-ascii?Q?UWocLz9jzzaaySHgicwtwidH4mwVcArzJ2XoG1n5s9HjNM6O?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qI1KNanBPI8rF/wU620yaGWD/WDA8yxECtp/Vl9WHj1G831E2Gre+WWk8UPyzFBGuOQwH4t+dy0Ow8Rq9y3/4X9F+0+c2drFTf9d8eeZhu3WpE5zE6uRUjGl5f9EkxX1q5wpbtQuCXUgCAAeLFZ2EMWi23+hzjzZSD4KD0GXGrEDAf3O1XNbT8uvuQX2Ej5VbQTnYe2vMqvXC0V5NpmomOu0Hq7elJwOG6Caf7up6XuE6JWi9m5+/Y2CPjDCDC+iEqrUeJ6aVzKRwG4A+ilm+1uM/NKBgRhlXm604/OSGi0Rth6drHnVXioAjvEkPXgv8kJr3lr6GN5hpN/l/kBnNQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f0391e-c6fc-47db-3625-08df2ffa77ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 05:08:11.0336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppbEN2Dx23GLnw8EmPImJ++CzZ7zSFUizD6JLhxx7Y7B2YhV1/VpegObGj/V4onbRMpBl7B1hFvJTajLzoAIkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8869
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi @Pranay Samala,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: 19 October 2026 18:44
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/kms_color: Fix simulation check placement
>=20
> Move the simulation check out of the dynamic block, so that it stops the =
crtc
> loop after the first pipe on simulation.
>=20
> Fixes: e8695996452f ("tests/kms_color: Add background-color subtest to te=
st
> the BACKGROUND_COLOR property")
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_color.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/kms_color.c b/tests/kms_color.c index fd419489d..c6401=
d38c
> 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -1247,12 +1247,11 @@ run_tests_for_pipe(data_t *data)
>  	igt_describe("Verify that the background color is set correctly");
>  	igt_subtest_with_dynamic("background-color") {
>  		for_each_crtc_with_valid_output(&data->display, crtc, data-
> >output) {
> -			igt_dynamic_f("pipe-%s-background-color",
> igt_crtc_name(crtc)) {
> +			igt_dynamic_f("pipe-%s-background-color",
> igt_crtc_name(crtc))
>  				run_background_color_tests_for_crtc(data,
> crtc, data->output);
>=20
> -				if (igt_run_in_simulation())
> -					break;
> -			}
> +			if (igt_run_in_simulation())
> +				break;
>  		}
>  	}
>  }
> --
> 2.53.0

