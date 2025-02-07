Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FDDC02192
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 04:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B7510E14A;
	Fri,  7 Feb 2025 04:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nffnAOGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD5610E14A
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 04:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738902931; x=1770438931;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EnybIovY2Whw9OyQLy57v+mxPkz9E2x3AeigamDBICg=;
 b=nffnAOGgMBZO5R4rBj+yZ6ikH61NGONVsrm9JdWFr1C7PrQhNYAZsq3H
 g+cZeCQZdDkQn4JlSnu8fJRLjAxdn/t5DaxpvyJEzWwySI1XJrDgwrQav
 YxZ2Boj/pY/Ug2+c3pcwfrQSjJYR9r1yitNgya+4Q33D6kFLHhJbXl8Xp
 TaF6cZNyiH4tg+qvoDZpPsMdegsrtQOhHcAmXGkjP8qrlazaoygaihztb
 0iZcF1LaPin/w6mwO3TlZfLXSh8emeXKNWQrIfet6lGmtoMxJwQPQ5R4x
 ZBlHipjHR3GOKoyo928stmeJU2+3tShtJKPbfGyA0Zf0zOToFcvZPXEym A==;
X-CSE-ConnectionGUID: DmZygooWRm2hAcZRUAFE0Q==
X-CSE-MsgGUID: 8Eu+EmMXRRWROfDEYw3+4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39650676"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39650676"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 20:35:31 -0800
X-CSE-ConnectionGUID: QxCfvnB2RzmMuwZ/GTt9QQ==
X-CSE-MsgGUID: Ug7Nngo2QqS4kpWFaEXxQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="148638398"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 20:35:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 20:35:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 20:35:30 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 20:35:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSOnzK+IF5WmESdL0O3NeGptbdAZ4fJ20SZwfJM+lL+0niNPgygV4l7131QEnd/DUvgt54Fl/tNCrGTVb3R+WaLSOMu204BlRNH9vs4S2dlgLvGiYD7Jsx4ooli/ihk+LjE1soobkV4e5nyT7dnOQgWq9rez2awzc5y94PJkf4CoBr58NwmvRqMJcT+a7uNz7XGrNSPOv2v5c+NkAzP7xx1wDQy43rowcoI2xQyn2muEKYvbDSph0VLL5Yt6hcXy5rxP+9/YTjoJdFmK2203N3aGR6C44gWrjmgPUu1qdQQcEWMNeA73wC7Ybr/hWen4/4/oVp3r3xunZTtVApnTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDb5Xt3WfajEH98knEMi69OaXXoJuGbhNMS7AlW0mRc=;
 b=AH94pHZEmVBQO3CPp8Q6mJcrd0lvGbDV8SspM/fFPjZqgqKitdgna6dmFIw4XveYLhiWfO/xGYyq6J7tsBjhY/jyfv55r8KztVBQfZa5qtHUpE2Tsd+Yk++FidTzihfuTR5M8JW3tBXVEl7+ko7CG07VbdCCwtSIjODA9soJZ9sPv3oQ+kAWZZ4gW4GG1rjSFTnJ6cDqQjNrtpeTP6d1jX65qgZG9p/A4kPk5aRT14L2qlC6ejzlVc/l0thciklVVh2V7SoVeitd+Ox/3hewEv9NOeVbLMNgKNQno59gs9ycSdQ+HxbKX6eaL8hRYTigHagFYRxSffk+OxyAzshfkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 04:35:21 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 04:35:21 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_dc: Ensure eDP detection before
 skipping test
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_dc: Ensure eDP detection before
 skipping test
Thread-Index: AQHbeK4vUb8UBwaGEEqufhDS2WLPebM7QEmg
Date: Fri, 7 Feb 2025 04:35:21 +0000
Message-ID: <PH7PR11MB605305D39B8935AC4B047801E7F12@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250206155947.973010-1-jeevan.b@intel.com>
In-Reply-To: <20250206155947.973010-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|BL1PR11MB5223:EE_
x-ms-office365-filtering-correlation-id: a4e5d66d-eb71-4bdb-b6be-08dd4730d536
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0tqGa4/Wu0nFgKC08dt78zcbWRA3t2F0t8tBjPvZIG2lcnJ5+sVQj7FWFog5?=
 =?us-ascii?Q?Yh7aG++hSb4tuXmyiqxoZkqEQ44AJc/IrrTB5IgsTwiAuWzhbyB/n1PMiybu?=
 =?us-ascii?Q?yJvFQCtFIWFLn7zCdi+Z7NBmMggWLdwAOv6j8dLjdEh3arI5A50hQNA2Oz4A?=
 =?us-ascii?Q?7DD3G/KJJgdS7/vLsjdNq/eiCIPDOq2ldGOJZhTCapbp7MmtXhwDvZnQTSEj?=
 =?us-ascii?Q?6wcJy4JvbMleiZlRANH4JnLfMU8A/KRZV6hd7AViR8ufrrrByiNaDoGDYSUA?=
 =?us-ascii?Q?qQEQYq0xjtwx5ulaIE4sxYECF55SQ4BbrIY1TufCsPLG8hnnEb8bjdByH4zm?=
 =?us-ascii?Q?vQupy40GBsWWngUPj2EB8JjfJUEhcbcOPz5yoXWrk7z/s0SzbUY7LPbVdznS?=
 =?us-ascii?Q?dO/Z9PxL1OFjlobGVyRIUclO3be2XthmIZGSS31pw60Nx5KITsqCok1Fc89G?=
 =?us-ascii?Q?iEhc9fLZ9b8WXxh64d1BgJM7443EgITAdfZ2aqTDgzwNFkiC334I4U3Uigv+?=
 =?us-ascii?Q?IAo1F01VFpK/QwhEBModX7V0n6WWiJC7EFGUy+gk16WnAAJc3getvLtgLA2E?=
 =?us-ascii?Q?ZaiJpErqJCApsU0hfouN2iQbWxSxtFUDEVbebCAUgUmCzAq4cJYl/CIZFOdm?=
 =?us-ascii?Q?CDvXvbR/aYMz8kwCWpScKvEM1zgFUTcq+o5aDFkW5ZG3f298GDnd2Wwhwc9q?=
 =?us-ascii?Q?sKYHzr+WjxPtOmFH6VrtQlIjUSL5ESm9U/YIEmlc4xqE3j3ycT/Jmnq+3JCm?=
 =?us-ascii?Q?KTw2QMlo15FF7vG/HIzQ+5tgADanKQ85gIDBrkP+4xzhJrK8iZiWyfPUAu/e?=
 =?us-ascii?Q?c/MKcQfigWiVRNwQT5XT1domevirumsw9BiuDXeqsL5dNlLX3COIZ86ZyWhh?=
 =?us-ascii?Q?HRgri6Hx4bA0SMG2AoUEUccbbQ3xCfSi1yW2bo2Z0jJjtFm3YjZClT4riqk1?=
 =?us-ascii?Q?31UPmWLPVrOPZhVSBS1ZvWX0AEHG793eGyJ3dfbq+Ao44co+0T+bPIbFcyLX?=
 =?us-ascii?Q?1Cg9EcLZmIisQ1b1mzTvPlHlwfPA3l0UyqIi9agjZoVduCO8/Y/qBaFMVoqx?=
 =?us-ascii?Q?Gc68rdvKmUMASeE9+e2HG9lHyQuMNp6ZhmjmlJShgjGLodaoIKPErvA+peJr?=
 =?us-ascii?Q?P4JXpUuhhUWZWIsxbMl4QAN5L5ElzsOEgOf+L/eQUVWTu0SFtiT6JKzVpBup?=
 =?us-ascii?Q?HRPrEJfbdekfKAvEDC7OYOB5l06epTFzls16oEwHBUJ8SyLHkUg/DiYU6X+z?=
 =?us-ascii?Q?r606gtgHiJ57ydnIFj74REmxO4/Miyw9FJFws8CdvvyPLAQN4DAKuSfTw/H/?=
 =?us-ascii?Q?4ZpCmfnGO74K4+wfpn9euwzaKRRIRv52Uylg8TQD2F4bZDzpxzsA4jGOKdR5?=
 =?us-ascii?Q?e0swCoy7XkpdqCMujC2BG63I3CUyUiJIMwD39m3CMZpKGKQv4L5E3x4PTPrs?=
 =?us-ascii?Q?J2+pSQo7yctaiQlRxRH2p4VWJkMpRGm/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CC2m4qPVDa0+8FuMAirucqahczbbFSYqBPi8/Q49BHXU8iMPytJRVWvSZ7vA?=
 =?us-ascii?Q?doSFR3TFLdrLfjooABaeCmDZJS5mW8q/o1SFKYexYGs/fQRgfdliY1+T+dwj?=
 =?us-ascii?Q?UprP9bKjFyRZzsvNR8D3RfEWIHQ8idc/Tebc89wIWgmftiWQPZ2PAaGSbldM?=
 =?us-ascii?Q?vJKv4zAeC3xJ/Fp9EeHUJqMRiKzq5B8J7vmc9VMrJuncr/7/G0yBB156WxCN?=
 =?us-ascii?Q?M9Tf1NJb76kLQudEcuusLPGL/kkhQFbWgkIUMIw4P8LaV7JRhUyID6PWeXUy?=
 =?us-ascii?Q?FzSi0un+WOOr53tDBF5Brx6NT+1iKc/vaijyl9q7qzoVfyDqXwgOL3BDZz9g?=
 =?us-ascii?Q?bd2yJs6iDEkuYL6IntnfPUoRkPx3rAGAlY/CS053T5QWUgV0sKrPfXlHFBDz?=
 =?us-ascii?Q?7GKWIv7ZakjnZlnhEEP57d6RV4j2UIUhG2Si//wrL+jjS87v+yVifi+Fi7lp?=
 =?us-ascii?Q?h5q0ejBieoBk50mg6GfrU3eokF/iK1G24gFqVs1476sUdja7WrJP1K0xbbbJ?=
 =?us-ascii?Q?x60ov2+Rw9LlKtukqQpaQKc1cI3cpUqNSRqpaXCc3XuZHytzrVjW2rFrtv6y?=
 =?us-ascii?Q?Vht4bfya/jEuemvQ8H/nzaMv/Jhy/0UwGPCvZkihb3KRFAQsSrdqtpCBgLKD?=
 =?us-ascii?Q?vi6qFQ3KZC1Vg53UwqJN42KQC0U7+eCbDGhyksAJuU2+NWatC7YhJ1dBRNLd?=
 =?us-ascii?Q?R5dqy2KlPBw1eq5h3P68t4aLakulyGdzvq0bXcppOfDRx1wjgO0sPpMaguE0?=
 =?us-ascii?Q?uJ9ExFkD3sXLk1vYKmv+DZhTEU2BTPrAXEXSEl7q4Ie3BCVzukkJyWwjheRi?=
 =?us-ascii?Q?ZrEHGtlqm8CThmb+gBGpDlxwqA9wOy7jbSXX02lDFJ2DygDzcTwQ9UcA3ulM?=
 =?us-ascii?Q?E1dK988Bne3jA0HX8AynI7+wOxJezjoOmwyLYqCUgx43pOn2GoAjFSXTqHks?=
 =?us-ascii?Q?x4iKxFOv0jW0S8mdwDC0YnU1gFS0KbbWJWjpXzccUVHz98Xq0qsZhIpBSHwD?=
 =?us-ascii?Q?VzB8KRF6KFZ/g9HVF20ook54r0W++ZkF/Go7p/hfCoFu6/KizuCI0xcfsHgp?=
 =?us-ascii?Q?pg28DyUailrVhVdfFrGxvmKLXbyylWFw0O3BU0veJvHeuCI3g2eZUI+V27Zn?=
 =?us-ascii?Q?Q3UIpxQHzZNsLKsr5j13FLfEoNo5mZ8YJQQ4jNSIwRxr1T2BIb5276vy542G?=
 =?us-ascii?Q?bBFtlM/AyySX1WussAOwm8mY4rAjHT2C670ROoKraucrJ77VNtXhRWGBqxEu?=
 =?us-ascii?Q?lH360UrsFzqBRp2MNZgqaqrgOmdu2B8AEAlwdoumDIYrvG/8uT5oZket17BM?=
 =?us-ascii?Q?PjmpEH/DBX9uenAh3Y0SUii/Y7N/eaVBs9vhi0/vIOCYkNszi+kJ8/aEQlSF?=
 =?us-ascii?Q?rCc5suTFvkkOiWOQTSI8VOCCyQBQL+SIhMJjWwxPu9LtW+Xp+DVP+Il9fiV6?=
 =?us-ascii?Q?9zIrkY1I0sTpj0BW/6gEvY3oCiYuYqV6zx8/z0U3tKAk1ToTYXi0+xyZgaS+?=
 =?us-ascii?Q?PJ4pC930PsQ8gvQ7eNhoBu0kw2cE4R4PhfEP4S/QlEmjMP0mSh35lMmnCQh0?=
 =?us-ascii?Q?U4pIKQNrg+F/KS7r7s2fhlHbJGJIjKHT6IrJYI07?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e5d66d-eb71-4bdb-b6be-08dd4730d536
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 04:35:21.7244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wx15ZXNRpSGCsLE266YFW3seIYcAWHk4+pdMe4bp6EAnbGuV6PlGHZzFMrAvchZwRBKYIbz0VDCQSsEw5GW+hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
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

Hi Jeevan,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan=
 B
> Sent: Thursday, February 6, 2025 9:30 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Ensure eDP detection before
> skipping test
>=20
> Ensure all outputs are checked before skipping the test, preventing prema=
ture
> exits when an eDP is available later.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 39 ++++++++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 15 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 9551cc6b9..aaf057b68 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -640,30 +640,39 @@ static void test_deep_pkgc_state(data_t *data)
>  	time_t delay;
>  	enum pipe pipe;
>  	bool pkgc_flag =3D false;
> -	bool flip =3D true;
> +	bool flip =3D true, edp_found =3D false;
>=20
>  	igt_display_t *display =3D &data->display;
>  	igt_plane_t *primary;
>  	igt_output_t *output =3D NULL;
>=20
>  	for_each_pipe_with_valid_output(display, pipe, output) {
> -		if (output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> -			igt_skip("No eDP output found, skipping the test.\n");
> -		/* Check VRR capabilities before setting up */
> -		if (igt_output_has_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE) &&
> -		    igt_output_get_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE)) {
> -			/*
> -			 * TODO: Add check for vmin =3D vmax =3D flipline if VRR
> enabled
> -			 * when KMD allows for such capability.
> -			 */
> -			igt_pipe_set_prop_value(display, pipe,
> -						IGT_CRTC_VRR_ENABLED,
> false);
> -			igt_assert(igt_display_try_commit_atomic(display,
> -
> DRM_MODE_ATOMIC_ALLOW_MODESET,
> -								 NULL) =3D=3D 0);
> +		if (output->config.connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_eDP) {
> +			edp_found =3D true;
>  			break;
>  		}
>  	}
> +
> +	igt_require_f(edp_found, "No eDP output found, skipping the test.\n");
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		if (output->config.connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_eDP) {
> +			/* Check VRR capabilities before setting up */
> +			if (igt_output_has_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE) &&
> +			    igt_output_get_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE)) {
> +				/*
> +				 * TODO: Add check for vmin =3D vmax =3D flipline if
> VRR enabled
> +				 * when KMD allows for such capability.
> +				 */
> +				igt_pipe_set_prop_value(display, pipe,
> +
> 	IGT_CRTC_VRR_ENABLED, false);
> +
> 	igt_assert(igt_display_try_commit_atomic(display,
> +
> DRM_MODE_ATOMIC_ALLOW_MODESET,

Line length is of 103 columns, exceeds 100 columns
Apart from this code LGTM.

Regards,
Pranay
> +
> NULL) =3D=3D 0);
> +				break;
> +			}
> +		}
> +	}
>  	igt_display_reset(display);
>=20
>  	igt_output_set_pipe(output, pipe);
> --
> 2.25.1

