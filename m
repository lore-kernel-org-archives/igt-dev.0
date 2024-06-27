Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F93C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D9910EA1A;
	Thu, 27 Jun 2024 07:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzdiJYC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3124F10EA1A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 07:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719471899; x=1751007899;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cqG+5Owph/+F6KPFzo/T4JNpgaaVM7HE7wj8PJKTSx8=;
 b=dzdiJYC8E9iGNRqgRYRF1wEeXGRCiBsspompcM9mD88X3woX5bffz9V5
 /fQ4v4+ZK3bW4KVojsw0f/3cnQ2r28Psn+WK1Dz20ibcS5iuAhk3jw8JK
 oKVwLBUb+kezp7hyoMvHG/qySZAKzvrCpdf+3d21rLGU1YK9R6HGIk9wY
 MzNuOWwgj/4O0G2XRAsCG7ZT7lV9Z0HcICFR2t/leV5faEUQMfnUVvCdz
 dqp2HgKSvQzRf9HP75h32mLZe9h3afCZJWndOVjnXjyTj/+lyk1Swf++T
 WEGgXmRtq/KHAB93LTkUjMj3RiMThiZi028PXgWx2FuCLRd7VsLaMmvQC w==;
X-CSE-ConnectionGUID: pMsT9KATSFCRHlwWJbjc7w==
X-CSE-MsgGUID: AShxHXYdS2u23xbHGhazbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27171251"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="27171251"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:04:59 -0700
X-CSE-ConnectionGUID: eUkFzLgNTAerDGnajhz/GQ==
X-CSE-MsgGUID: NDm2AEU+Q0uCrZT2ZMSsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="44115467"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 00:04:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 00:04:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 00:04:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 00:04:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 00:04:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRb7V2zx/NYrzM69ArN/bpuQzca91cCFi2iZG0x4yFrshXVJzso537ZuEVUDrNciza8A6isXbulOiCDYymimLNu8zscC7JBecjl2WyqAwul5eWq+Lollscplt+gBnHi4DxoX6b0JbNTSZxhFC4MLIlvT9nWOl6h8oZPYZS2QvUTG6SEBmDr4SZiLKAvn37WxCpjK+0oxKLWHTtaJMRZMnuGKodxI0pnK9hY4DkdYsZk/6uMhZv1jyc3Y0msjO4y1HtZn3ELEQzfUeZ46ROq329uVKJ0sqkmQAd+XN5+iOcx3zme3W0fWJ//PAfiOk0Iay1LInSAyY1MhVhvjXpnmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXhe/PRBt3d0mcg01My6UiQ7fbBFJCzig6yYfc3w5Jo=;
 b=Ea3qi1u3DE22j3DqEJ4VZLnuGbLdJ/IK6M9+kjf/O0+enryGEkk+vKLzAnbVy8FW9tY2Gj697eFBG/XVfeBrb7R2qWdP3qo9i2wJcFkgc5zYPqU0xsNaDAO+ecRI7cL6iNIBtl56EyYzO6btGxqSoANoVwOei/zVPIzAI/wvrFMbQexROAGcAn7k6i8GxHVg3EAkvcOAX98vQ1Kk2w0xitt1bstYpRk2nW1a3fvUUTnXzVBC5iOu3M82wzCmB0dIvLowhw+LAOkUenCcfUseA+B4HpAezQd2g2qEaw4wmlMgMqrutxSwMso7hgzORhnJGFm7vvxkP9UTz7s/cdFSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Thu, 27 Jun 2024 07:04:45 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 07:04:45 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [i-g-t V6 6/8] tests/kms_flip: Force joiner support in bigjoiner
 checks
Thread-Topic: [i-g-t V6 6/8] tests/kms_flip: Force joiner support in bigjoiner
 checks
Thread-Index: AQHawVnikEfuEWbdIEGpRgNNbtXBIbHbPb6Q
Date: Thu, 27 Jun 2024 07:04:44 +0000
Message-ID: <DM4PR11MB63127477EE32B49DEA29C12090D72@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
 <20240618082248.4070611-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20240618082248.4070611-7-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW5PR11MB5859:EE_
x-ms-office365-filtering-correlation-id: c4987359-d96d-4a6d-947b-08dc96776cc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3mVcAiCTcNcygiJxY7Z/vH2ZXJYF3+BXxgz+nEkMg1VaqEWaD9mjza+Y1JM/?=
 =?us-ascii?Q?UbYy9QQN4KwAcfjKrv5h5f4rY/dWQj92NDN7dajiFZCnDHPtR2KObVE4HDOA?=
 =?us-ascii?Q?onp5x7zm/h61t/Rpr3MNiwZ/gwDazalfY7PNrebbBapJdGd+quRKRu3jUNmr?=
 =?us-ascii?Q?z4TGKiIEnHnOjXSCVDfznUs6dx8RfePTqlJ9RP3y38EfwJgOoSFM04wF0OVR?=
 =?us-ascii?Q?6ewvShl5thS+deSWzrNEwutFnXtq3VzT5FG4JSakk8WA5PiZZHdq9rLsgRh8?=
 =?us-ascii?Q?mqr2VTZAciKZTze2PfFrB65tLUReByyw81N3EPZZLiDOyTD8k34x/eMkcZr2?=
 =?us-ascii?Q?JmmF/PjB0J/0ANVywuir5BKpsGdTARyO7mzPbVw12fo3s0yF9h5n6ljLFEXQ?=
 =?us-ascii?Q?1cdRfy+QepxtXThtJ6EmuCJw+GI+Qd7plAkIfDfqT7xInDCwcpe1UC2MpBNS?=
 =?us-ascii?Q?zDSujui/szVYij/cFm0I80RxoFfesAbD+AI0HBrQvvR13QO884msrLqV8a24?=
 =?us-ascii?Q?cKlFEPiB6jQ84ZIrsZ/+RH8xu95eVtzry4N7Mpd69RdBYJOdgodKw0dLV0P4?=
 =?us-ascii?Q?5kTK8SlcfQ/Q35PeOERYAufLaDbumYc0Y7PzQ40AtblRGIB4yJF9nJZcdII5?=
 =?us-ascii?Q?/dMihCPzhdquvZEmn6gTpjgl/JvUwzdrCVeI52/KwT52iYufdkJt2xgcK7Bj?=
 =?us-ascii?Q?Hee3fpb9SxsZBCW2vI6fD0vKk0/79IdMJiPbiDqfyRS1qZeL3LOlL8UJgg1z?=
 =?us-ascii?Q?52MCKfbGcmc3CQ5KPKt9FZ25GQp4IECG1X19Y0ZLg5fsevymOOx2GeG5odLC?=
 =?us-ascii?Q?h4HEadC2v7lW9MVhUtGBmcWP25yrkwAjNFvApijYQhlABYXuvN3n8ljgSJKo?=
 =?us-ascii?Q?dotHIHkTiHVRtLCa6A7TqyyrTpL/9yo3+yYXFS283rG007sWG9mjNCnFTOmS?=
 =?us-ascii?Q?9FJavwLah0hbBExFZeDPkCJ2XwPDxRaGwoI2pdAx64DHM6mFngK2sQ/uEt0P?=
 =?us-ascii?Q?oTzf6MJg5PRD89BCUerElM+vEj7z2doPKnjGBrk8k7CS0TZVH5Yhuqfr4xKi?=
 =?us-ascii?Q?+1YNAZodKZ9dZ0tYHnOHJbnIzsnejXIzjk7Ly0mYb7MOQNfunTBqfX5ds/q5?=
 =?us-ascii?Q?AjZRhxadzpcy4Oc4DzfXMhy4eglyZt3gYPtbFqy1fOdFrnLihvawuaX93cFm?=
 =?us-ascii?Q?MC8r1y2M8joSsFJw6Y7uX1wisF5NBCVqBuP24DpQwor1dEHksvABnV2nTDi7?=
 =?us-ascii?Q?epHAc9gdvptXlTP1in/5Ncilu0mu274RrOPchMYd8eC7g0XWwmT8SETnRPRe?=
 =?us-ascii?Q?3un3uOyzoit/wAWNScSpJMAlSSFyv5R28/XxSS/DGj6o9rq4fo0Ezz1nFMWl?=
 =?us-ascii?Q?IfetCwSb8lOHnxqdGsrPiKNAicqZlGMXjyhDv8POZjN1z8RHow=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6X9cwVhKW3ndiorMtugigyEXDxviMBfnqyqxEyzY5EwzBCQxzASO8+CL7n+Z?=
 =?us-ascii?Q?3F0daEcFLmWkP23vgM6h4JHzNxXx4/thMuyy9PZZBNF9YQzB1RtvsWVIofsa?=
 =?us-ascii?Q?58WWCqO5XIZylGbYeF3PfSBVdYQCZmuScCoqTGUvvApb3JyDrKKRDZwrVuyg?=
 =?us-ascii?Q?7yVOxOCEkNVSI5MgtTUBDhXr/KDLZhyd8nBetwu2PKCnkfO4W0A8H1MXXkZZ?=
 =?us-ascii?Q?AnOjbvWOR3GxyiBag0nyiSbSi4h42OsF6ABE4M/VgpKbQBTCgfxKoO3Y7j+T?=
 =?us-ascii?Q?Z80qWFL8dNUei1sH3MH2ZWdXljUu/FDwTdUbYP8MMC0/YkPxTPHoYwuuARhn?=
 =?us-ascii?Q?jMASDyMXWkxSFjTKGZ/PDCLNEQI4xsIWzJ+n7ioIy4yxpR7aGovcCX57503i?=
 =?us-ascii?Q?9PbYVunFNWAduOWfYo9KRSVSENLQwJYitc8OTXfkj1NzK+ipQnkZc5klRt9o?=
 =?us-ascii?Q?9755EMRmDlKTOFTem0Zk4B2HW+H5cVQNEuLJQOB3guj9BnhW09hjF4zPLWT8?=
 =?us-ascii?Q?FlDubX4r+u/HOncl/x3Ia45xRrsalWrLEafXC2NjGHOY+v4fz1ZFEfnN2oj6?=
 =?us-ascii?Q?eNI7pDnnXpq3wxjV6zqqMYDewtDl1mGWC8JyUfrIP94CODQ8wVUqyTjBe5l1?=
 =?us-ascii?Q?cCFEU7spNowynwXU65tqPHpyAJgulJj2PEWvPC+D47gKcA2z4Wi1HqMFMcr/?=
 =?us-ascii?Q?9fcr3Br49l8gYb8+ucvW5ijihesEEpsZzWonVGSLUX1AQdLXzyp9UjbeSZ9y?=
 =?us-ascii?Q?5yn3QiVbrntklEaHh6Q7SOKSnpfjvFlqTF+Z1Zb2nuRGVBfYTwCLgWHziJUz?=
 =?us-ascii?Q?aCmCvDYdsYreOEE4F9MgMoR0jmUs8zkJsgMr+1JDi6GL9rJQVBaBBPhWNQRo?=
 =?us-ascii?Q?xBApwpPiAN3rgvp1CqfCUHsoxu9XF5A4k5KOjFcjAEQ/uyGQ1AhbttEG7Qoh?=
 =?us-ascii?Q?+RmkHZ+4jDZD7Ehz0dSlqMxSmCQxvIuVjdwjrK1z6s2WRqigMSxFU6KFtIQV?=
 =?us-ascii?Q?0rq6BLf1eI/0ENnlch+LdRpaSY0Syuusav2a0198QrxQRRkBVsIz+qfWzqlA?=
 =?us-ascii?Q?9sUw944sQLKtdDO8dHE5mlSQUk/8XBMnyHEs5ibHcSC9AsRHqzUSaQHPIUxz?=
 =?us-ascii?Q?HUHoQyKBpHFrgKb1DDSYSc+ip7cCh5Ywv3X473C+wAXqyiYs2Fc3bEMWM91r?=
 =?us-ascii?Q?+0+M4O/tJXmnTSw5XzLSo5OpyrZ35njMai7Fv8m3vqa8jX/mczKPvrPs1MrP?=
 =?us-ascii?Q?HQFBaahCgKRCqF5hdmx88QCXiZBvXgeokqRWf96a3G617sWKnSq9svNXxi8K?=
 =?us-ascii?Q?CdsUjBCDbkNYKIyzbky2rGFyJoqkjkswO1nY1IYa+NGmHELn7vyswRG4tvNm?=
 =?us-ascii?Q?ZRlFa8kgxd0EJwR/GRs0oTakZ3KE8SU3JVzeGY7FhvFKRc/5nW1ubIMi4cxs?=
 =?us-ascii?Q?t0eN/r4NCqrsCxPEsk2emqkmkqXigOBvr1UdLVCxhgOkBNNC8jgLnNCTKDMQ?=
 =?us-ascii?Q?ypy19M3vlOOTgHrdnOjPirpbeJGBpTk57HGOjTIwvPIuESsoRTF28rZKJ50Q?=
 =?us-ascii?Q?ebp4M0m/B8r67S0sjZY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4987359-d96d-4a6d-947b-08dc96776cc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 07:04:44.9797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGQwwr54+KJ6Ttjkks5z02RCpO8LINtLy5Ob6FaOwZbnbfNICWTfCWwHTEP+WMterluJCY/YcEzhqLDO1F9f6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
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



> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 18, 2024 1:53 PM
> To: igt-dev@lists.freedesktop.org; B, Jeevan <jeevan.b@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>
> Subject: [i-g-t V6 6/8] tests/kms_flip: Force joiner support in bigjoiner=
 checks
>=20
> As we recently introduced the option (through debugfs) to force the bigjo=
iner,
> needs to extend the support in bigjoiner checks to handle the force joine=
r.
>=20
> V2: - Fix connector name
>=20
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_flip.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c index d352ee14c..cbabbe7=
4f
> 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1730,22 +1730,37 @@ static void run_test_on_crtc_set(struct
> test_output *o, int *crtc_idxs,
>  	/*
>  	 * Handle BW limitations on intel hardware:
>  	 *
> -	 * if mode resolution > 5K (or) mode clock > max_dotclock, then ignore
> +	 * if force joiner (or) mode resolution > 5K (or) mode clock >
> +max_dotclock, then ignore
>  	 *  - last crtc in single/multi-connector config
>  	 *  - consecutive crtcs in multi-connector config
>  	 *
>  	 * in multi-connector config ignore if
> -	 *  - previous crtc (mode resolution > 5K or mode clock > max_dotclock)
> and
> +	 *  - previous crtc (force joiner or mode resolution > 5K or mode
> +clock > max_dotclock) and
>  	 *  - current & previous crtcs are consecutive
>  	 */
>  	if (!is_intel_device(drm_fd))
>  		goto test;
>=20
>  	for (i =3D 0; i < crtc_count; i++) {
> -		if ((igt_bigjoiner_possible(&o->kmode[i], max_dotclock) &&
> +		char conn_name[24], prev_conn_name[24];
> +
> +		snprintf(conn_name, sizeof(conn_name),
> +			 "%s-%d",
> +			 kmstest_connector_type_str(o->kconnector[i]-
> >connector_type),
> +			 o->kconnector[i]->connector_type_id);
> +
> +		if (i > 0)
> +			snprintf(prev_conn_name, sizeof(prev_conn_name),
> +				 "%s-%d",
> +				 kmstest_connector_type_str(o->kconnector[i -
> 1]->connector_type),
> +				 o->kconnector[i - 1]->connector_type_id);
Is printing this necessary ??=20
> +
> +		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> +		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
>  		     ((crtc_idxs[i] >=3D (total_crtcs - 1)) ||
>  		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i])
> <=3D 1)))) ||
> -		    ((i > 0) && igt_bigjoiner_possible(&o->kmode[i - 1],
> max_dotclock) &&
> +		    ((i > 0) && (igt_check_force_joiner_status(drm_fd,
> prev_conn_name) ||
> +				 igt_bigjoiner_possible(&o->kmode[i - 1],
> max_dotclock)) &&
>  		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <=3D 1))) {
>=20
>  			igt_debug("Combo: %s is not possible with selected
> mode(s).\n", test_name);
> --
> 2.43.2

