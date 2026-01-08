Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3731AD148A0
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 05:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D172010E27B;
	Thu,  8 Jan 2026 05:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mohA+eHq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C1D10E27B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 05:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767849989; x=1799385989;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VMRKH2qGSJNzxYMPcydqKrDxVHnBEBVtl4eQqVjs8yM=;
 b=mohA+eHqBnIKVwrfsFnsS1L7Ji79oExlhRsZTi3VbhnbnrgGvZsdq+V3
 4T4O9XlptjiiuDPSq3DVQsGZlQ7ZPcwj/xQIHkT6PWUp41w2RIrd4ByRR
 SPzXt4nOHm47OPgzQtwv22Vk85q1kA8u2qs7MQRFoUPUibV7A44YLcOxK
 8gscDSqwMwKZx3X7L6pF5ppySFvHiem6eJc5XFHth7jSAn9/G8jK3XgAx
 v3mfL0VpHYjPjf9+gyAHUbXQcK0J7zEX+FkxPIMAn+jRZaq/8pUUBF3ja
 N7XXAEP7EgC/bdtFEUOO/EsHZBckPx1Bs6uztcyF3FPb7RGDjE0L7uvIu Q==;
X-CSE-ConnectionGUID: z2NnzyhmQv+RBWCsfBO+GA==
X-CSE-MsgGUID: QJ/n3OERSDu/d3o+blQ8jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72859159"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="72859159"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:25:57 -0800
X-CSE-ConnectionGUID: xK0AvjqlQ4q/ANNNkOqSAA==
X-CSE-MsgGUID: EiMfWV1QTFyzSrejeV8NSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="240597153"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:25:57 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:25:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 21:25:56 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:25:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shemgPNPKt8qK57r6MNMCyaxPymaJX4i2UOB9GFDAeZl6DeruC6sJwSdv3uEerj4JtygJT+3GNHyPoloppFwubNj2QgCCg/Ce13PdJe9iVOWtxpgNY6mJXpQJ6Rpq/bEBaCopth44WZ60S7gt1sdTqC10lKAVJ+rXMfT3L5jfCnVnBsnnJIz22LimxFvyadFDgIetjO2y5WTXvPKEbDf465t7CbiwFhlBy0J79+KwV+w4zUaEhzdVagERFe5zRXzy7tt/tWdyBX21SnLDNWK0sAMVeqqUYhNWd8dvPJMtmhttVmR3uuUxfNQ/+juYGXYdzUZzDUwPQu29HIEv1AZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVYuzJciO7WQk+UZKtCa2SaHBW3qoHSj8AXpBCiGoIU=;
 b=l3IEE4VtPD3jwwDvakYtJAlMsIBrGzgB9tEflVi+I2v+zEOpvqZr8Gb4xOfU2Kzt+Qkmjb/XFestr5Q/JXSaGyNx9CQSeQxRIu9WJ7G4tzlJf6+3cqlIx62ZInkpj5lFp7Yrwli5CfGbN07oits3gwzRuY0VMhwuV/cX5pJ8TqC3SHv1/zCnHHuOxp4Zfy1S+/ZLXgaKGagCLETaxE1nUIDVvR0QgLVihQxpBnKVGZbPv/nz1l5QbfawJDXQ9g/vjiktLs9RBtFFVSbls4JhQYp41k/pfBB91bbyemaEkH0p2gYs5CXohy7VAGgyRC8WjW39IX7f7klC8n5AgNCm9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 05:25:53 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:25:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v4 5/6] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v4 5/6] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHcZDa3nE268GW2+EOkldY7K6TAtrVH9X4A
Date: Thu, 8 Jan 2026 05:25:53 +0000
Message-ID: <DM3PPF208195D8D9F95EB529CAFADE9389EE385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
 <20251203094307.3187669-6-sowmiya.s@intel.com>
In-Reply-To: <20251203094307.3187669-6-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA0PR11MB8399:EE_
x-ms-office365-filtering-correlation-id: 0af647e5-c41e-4acc-6a02-08de4e7664ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Aqhhzj23ZUgLcpgKxRzNMgzvfbz1CMHdx7fLkJ0EE7/xlUgkavmmyHHX3/uu?=
 =?us-ascii?Q?v+JhFaCnu3fGFsSzS1EMTENhrJ12NzDhfk0lsPKFrRXI9bOwFlSaUFNCJNMO?=
 =?us-ascii?Q?H/TWX2rISsTnJeFP0pEEKYzwnVp6jlbjR1SSKjKRrBAhqd57w4C68GPcQCXM?=
 =?us-ascii?Q?gTuqFVgY5OeFwMMmAes2y1hMlwbHOWR1umzMer0jjOGhdHmfRtrPVsQzCCA+?=
 =?us-ascii?Q?0vgCa13lfMXQD3BysqjV5SaWMVbr67IYFfBgzCNr1nogMRg9LKxR/mi2sXLc?=
 =?us-ascii?Q?rHDRx+glWPJDAG4gStaj1OW2CALcXEPC/EufZ7KcKQGTMrCcQIShm0texpWv?=
 =?us-ascii?Q?gffowdx2XkowFr9ERBNIdXYJccmdJxchmHvN5nlFqxGtfSIp42SWJCZ6DX0t?=
 =?us-ascii?Q?3QjfQJdFjSZ2tnHXMBNkBuXJlOS9IQci/9PWB+uSJ62BbTipghlbakxKqRp3?=
 =?us-ascii?Q?wJ9HyrnAhZ18f9DFNjpIAfpvKfnH2/O/aBteIIqyKDqbgHJXrsCyz3NDkSvO?=
 =?us-ascii?Q?zF/YcS5ZSeIFzFEImkq0uOv83dOkK2PcZKAvqKDhtg6bcScmFl1ifOdDqv5r?=
 =?us-ascii?Q?N7aBMgXeJ63mKegEkT1tgZtphjtncjmZ7vGOCtydEFGGgd3nx2/Q5XOgbsfL?=
 =?us-ascii?Q?xLx3xwj9dl7xI8yZwnsPWnL+2hsQgAGAiz2FkwerR7boJPB8V4ssjlx5y/HT?=
 =?us-ascii?Q?ZrnFutsu9SOwNAIR2gGYQ/6fFRZZ45w557lJVRTF5zVbxSAyH0XZVBq6bYlx?=
 =?us-ascii?Q?ayNtfuUGF96hJz1VpuKKuQT/FYeTAmGXdzG/Sn0RbgpBREI6GO4JFPbQdXys?=
 =?us-ascii?Q?qWeYJf8Uq0xQUNaMnmDtFENFWaa4YV2hfav98a6kK4xbdJw4IlbGW2ReDAhL?=
 =?us-ascii?Q?+ja58MFVx5yNdjxw+nk8twpAzs9L6iw7ZclgwM89ap1lLGt+iU8jHTArCI+6?=
 =?us-ascii?Q?kU+YOO3eehKoJMQqXAtNTsBciQlDkig10fesnAGX7RgBUq/OvYjDHoQJuYQw?=
 =?us-ascii?Q?/WGpkf1Cf/i8L+CPrUzfXUC/R1eAq5HkXqBcBEaZ7MXvoAj47e6WodNKF96p?=
 =?us-ascii?Q?Q6v7VP8wVhmJShTzkq9PAl1KfjlvfWNRIMpLph5EfgCJwMNx7pXcbhRRf4pu?=
 =?us-ascii?Q?B7CTUg/m4s4bVexg5VubQCOJ1vPY6/sgQSXX+UvYkrjg37tVGVd3XavFt9Ae?=
 =?us-ascii?Q?yBWz5DWmxESx9JMWDS7tOJdN8ir5xf78RIl+W/bnSL6+ur0dHo2Md/LJne/G?=
 =?us-ascii?Q?vfXD1rJxgvAXzL5a36PNM8uJhBbH4u3QdlVYJ4X4/zMm3mIeB8BoBpnCsGhO?=
 =?us-ascii?Q?m3OXpaG1OLpGhhmmSQz1138Akb20nZZ5Db/l802nX0F2msrshCfhsGkaAJko?=
 =?us-ascii?Q?z8gsQgiXJCa5RN0RaBpusSowtyQhmGo57oowIEcS4hqP1rLXWSWgL9RtPIk3?=
 =?us-ascii?Q?iABIitFliXGaX7LV2ziapURPTCqS1IFGa31itNDj2H3WN1l+sCXcSPqG1cB9?=
 =?us-ascii?Q?0UvsvVZv4I0HuyYiQt9lEE6GjWmFU8q2HWyX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jiTZbTFhH/QorQZ97F8bW38SERNEaKyoMZ3hhmtG6BMoYLVOhb42ztRMLXjJ?=
 =?us-ascii?Q?jlwDxLCTPdoSCTmUag2/0hGqPtIHG6LbHJY1s3mDyIRwsfztUlVyT0UvbTYF?=
 =?us-ascii?Q?rQfx8t2Pxsi7zP1GVAaj5Vv4e6JgEvjw/TAIXpclYLOe1hmHhPgMRpIxSUMF?=
 =?us-ascii?Q?dWiAqV9aEtiXd+s7GpfpCu5CySx+OKTeQV0egaP2sj3G6YEPL0amkMk/FXKh?=
 =?us-ascii?Q?jHMlTaTo55pRrzroM0hffjLJtAHfYPFFSBHHjdvfXcfPIW3Hp1Dfu30SjubI?=
 =?us-ascii?Q?1tq/JWh33BwS0sBjpKHSP/SGRoMqrBvsql1HS/zUsDjHysC9W0af9HT5WLuF?=
 =?us-ascii?Q?BeOLltDe5NxS64u1g4Yhwg0iUG00xDg0McosTk6sO4tPfSRHEq/kqCXKylZ9?=
 =?us-ascii?Q?XKy2wlVcs4F7WHZgG5B94G7bWG2ZxpP6fv8xfB8S6kUN2XPKaKkBSUjP9Zs/?=
 =?us-ascii?Q?GVlYzLqQqi2vI0A2Mf8BTO5Q2UJs+w3MLdt7wWxfkc3Fb4qrQTMLU/xQRY9T?=
 =?us-ascii?Q?SNrdwLaBv352/xIKnF9/XBlcv+eakjeOGREtZuhhIc7IaqDbq+ToxtzkAS72?=
 =?us-ascii?Q?7wZlVrjIlZFcdDFuI4JRTh3M3Hb3ISnC1ZM6GVAtT8Odsw0csrizr+BGDn/G?=
 =?us-ascii?Q?1GUCgLRPmBosCG3ayGhltVRvx9fMeGgI2pBZSsFXiSX8rfJg7QfDJ++EktPW?=
 =?us-ascii?Q?b9U8jP6EGTmpgDrp8FcpH6lDawnKJB6BY6rNdpiJtbh7mBF1U6j+A4yrqAMG?=
 =?us-ascii?Q?EVcHxan/Hpw+rCMo06wyZEpH95syb/6gpZJTFCaReTLDv1naWsvoIsOvbISz?=
 =?us-ascii?Q?kFRyQxjl1zm41e6dh03P8kAfMh0Td4KXsukzlIpr/3/BtSlV9wL6Zx7C8fEi?=
 =?us-ascii?Q?pE8Ls2fCMEiIbejtXKWyIJ+GfZ1EFnk01iSmraqH5RE3DwznFLtHElRCbeAb?=
 =?us-ascii?Q?EUd1Dfk/kzOpCrmtFnEeBhPQL2FZnByWS2VvZgQgVnPOl8dTKlU1xccht0A5?=
 =?us-ascii?Q?e3SgqLVEdDBXeLfsyMWuxhRrXnuzHHvlsryod8UnYcEHIXhT8Gc2qkvCJn/Z?=
 =?us-ascii?Q?IRZWHPmo38h37f/12tJMgm5d1S0OryEiY0v1uwbBfKVN+y/LMolevanp3cJ+?=
 =?us-ascii?Q?uV0SVtjiYIjr7uCZj3yyv8kor6eT8MQ9eJCcXEFLZYDXYN0neB/oPrKg5Qpo?=
 =?us-ascii?Q?wfTOna3K0vjZFUh/mHc3eKsGASqn46VzRq/bbEPpaEzgB/JjlT4+MqGRmPBC?=
 =?us-ascii?Q?hiKZW5g2uhNe95irhHAbOB04LyLMG5bZKqTUIcAsrKh09TtfBDcQE7ZUAFGp?=
 =?us-ascii?Q?lFuZIA+sWJldAFuUh6tf/lvPI+taGw2JPVg3IVA5YVajJ+HtCnkK6fhWNCqk?=
 =?us-ascii?Q?NHrev9EYla8UgmfN0nW/MR4DRrIlE9xlRm7slDJ2CXZde4qtjP/g4YWuiyTs?=
 =?us-ascii?Q?VBwEWgVrRcxlJpWw5V+BJQsbps6pEI5NuNIu2KzzkZll4tblioHB1pOfxMIN?=
 =?us-ascii?Q?nejxMN2AlZGaWsKoaLBzUecktGpiO8sz5kiicJaJOmm+IUcDKlU4LmYSXiJB?=
 =?us-ascii?Q?mLt0HwDg5CTn05B+hsLX5mgHtBasWqjcRsO+dCzGx8gDaVvDLUU3xgrlsFWq?=
 =?us-ascii?Q?IAZSN/J5ODudIM5PyDQ/53rLy2lSYMUXRj5fujxig0bQkVPU9gWdKaMXbrFN?=
 =?us-ascii?Q?I9mzLAVR8R06y7SOd4lZ7Mys/AdgQKeyF/DEb3IYlA7wMLb4qyXdnv2bfwB0?=
 =?us-ascii?Q?GdIVc7fGzg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af647e5-c41e-4acc-6a02-08de4e7664ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 05:25:53.7232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R9lUS3OSGvF1GylmyKLwYRfNvrbKFjk7z67513F9TtX3xkJ6ZJEK4PisQzu7QqypCAabK7Xo9iNyBQJrLGP35Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8399
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

> Subject: [PATCH i-g-t v4 5/6] tests/kms_writeback: Refactor writeback-fb-=
id
> subtest
>=20
> Remove individual tests for each format for the test writeback-fb-id and
> introduce dynamic subtest generation based on the formats supported.
> Framebuffer creation was now part of the subtest level based on format.
>=20
> v4: squashed the FB creation function with this commit
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 74 +++++++++++++++++++++++--------------------
>  1 file changed, 40 insertions(+), 34 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 6725f5ea3..d54d649b2 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -51,9 +51,6 @@
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
>   *
> - * SUBTEST: writeback-fb-id-XRGB2101010
> - * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> - *
>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options

I think the documentation here is wrong, I don't think this is how its done=
 when dynamic tests come into picture

>   *
> @@ -507,6 +504,25 @@ static void commit_and_dump_fb(igt_display_t
> *display, igt_output_t *output, igt
>  	igt_remove_fb(display->drm_fd, &output_fb);  }
>=20
> +static void create_fbs(igt_display_t *display, igt_fb_t *input_fb, igt_f=
b_t
> *output_fb,
> +		       uint32_t format, drmModeModeInfo *mode) {
> +	int fb_id;
> +
> +	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay,
> +			      mode->vdisplay,
> +			      format,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      input_fb);
> +	igt_assert(fb_id >=3D 0);

Why recreate the input_fb too this should have already been made during igt=
_fixture just use those.

Regards,
Suraj Kandpal

> +
> +	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay, mode-
> >vdisplay,
> +			      format,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      output_fb);
> +	igt_assert(fb_id >=3D 0);
> +}
> +
>  static igt_output_t *list_writeback_modes(igt_display_t *display)  {
>  	for (int i =3D 0; i < display->n_outputs; i++) { @@ -685,37 +701,27 @@
> igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> options");
> -	igt_subtest("writeback-fb-id") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> -
> -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid
> and invalid options");
> -	igt_subtest("writeback-fb-id-XRGB2101010") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
> +
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format), "BGR"))
> +					continue;
> +			igt_dynamic_f("writeback-fb-id-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t in_fb;
> +				igt_fb_t output_fb;
> +
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
> +				create_fbs(&display, &in_fb, &output_fb,
> test_format, &mode);
> +				writeback_fb_id(output, &in_fb, &output_fb);
> +				igt_remove_fb(display.drm_fd, &in_fb);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> --
> 2.43.0

