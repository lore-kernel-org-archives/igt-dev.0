Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A37C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 16:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0DF10E8D1;
	Thu,  1 Aug 2024 16:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sw+Ek5Tk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FD610E8D1
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722528013; x=1754064013;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bkCeMURosR6nTi3qIuGXfs23NFS7KUPnXbaA8bBVJwo=;
 b=Sw+Ek5TkUFICcCBComN1cqO5/ZRI+qxUX8zzA34KbVxy4Rm5fuC/fM6Y
 r+CB0dN8w7c7HIqJjCVq4UfzWTrrk4dhT6knGRDw7xjQ+Eb30c2cX+iw6
 yDbwVSmzC1y0E1ajvL+Tkv1odtyQf9t2NOmOwVGkpouvYC3Njn3v/3vGc
 Y67aisnv2Gvyn4IvnK97I/vmdyNH2/bDiImjYfO/6Ue/8A/FZU8LVyCar
 iqp5OuyBEcOd/5HKt/Q46pNtqoyGjzCcEcOUsNP25LOY9jTSRKpYC0msE
 7e8F9t1d6q1rf2R/riWZT/gUB4zDVGumTfT5Ma9xWLaOI5xLzOOntDCtM g==;
X-CSE-ConnectionGUID: a7Vzo0saQdStYTzcL0hp3Q==
X-CSE-MsgGUID: 5AnTl9tPRzmCw/DxGDdKsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="12832137"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="12832137"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 09:00:13 -0700
X-CSE-ConnectionGUID: q3f8n248S4WdxFnBgKSO1w==
X-CSE-MsgGUID: WhBQNoFJTyqFrifU3J8AIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="60117031"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 09:00:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 09:00:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 09:00:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 09:00:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 09:00:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHvXF0qPMtzVEOigB9RZsSN+C+Lf2QZgqUWlw4R2Pu/zGeURUZhHYl+x1NGFQ45xdV+reWpxoJqW8leIAE50fnAIUfwu4p7mbKyv3byrBIUVtfY0ndQjwjPEJPHJqgx6QC/cW0HFHYxoBqaoqBJHBpMXR69RDGlI9skFJGdTJLAPb3mGiVv7PwXbczRnx4+pYT4f2Od2vpYBmArp0g2hKD/3pKpwmQeoedx9SLt6LkPPOkRoAag/9E3sLaeHK8uq7Kqw3p6a/onteVk5Jz/cv5TWV1NzP7av70bNRiRCopFvc5LdGh40GYwUkXTLvbZKBV1Bh2ijjKo2yIrFX3mLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7ykRh+Sx3659AiGgmuWFP6HGoVUS2ZquWLMGqkhqwU=;
 b=XCMkc/NY0nk7BN4PKI2y+cE8jzXeSDznNuM1YQfn+BeL44mOaee8O8PJZFrbzVnbdyTTlgxqUZgr9dhEyrptSZXncEy2Qnz4EhDwe8isy4/akqHcO7+RxZPPtmXB19Pxys7FwkYLeqWBwmRzQmBSxbv7Qk7pEmFkmu2Paq/xHGriGO90e5pLQD3NtaUsKKfSX25hIi2ll4qOU4W5mNsD2xFirWJYvhEO1V770kKzfCpkS9E4t+LjnvKIC7Db3kLllvxTDGf/XuKUac6/04Kj5z1QPRB39QtfVLQgBoHHEL/be5e9HKVqErmHMDYnrXGRxf9jnjeJ/digMVlm2lSEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 by SA1PR11MB7063.namprd11.prod.outlook.com (2603:10b6:806:2b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.30; Thu, 1 Aug
 2024 16:00:08 +0000
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d]) by SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d%3]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 16:00:08 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Piecielska,
 Katarzyna" <katarzyna.piecielska@intel.com>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v4 i-g-t] tests/intel-ci/xe-sriov-vf.blocklist.txt:
 Blocklist for SR-IOV VF runs
Thread-Topic: [PATCH v4 i-g-t] tests/intel-ci/xe-sriov-vf.blocklist.txt:
 Blocklist for SR-IOV VF runs
Thread-Index: AQHa5CS3P4V2r2ZnBkmKlOXTrMh8UrISjAQw
Date: Thu, 1 Aug 2024 16:00:08 +0000
Message-ID: <SJ0PR11MB6696814462026735E4D95C8DACB22@SJ0PR11MB6696.namprd11.prod.outlook.com>
References: <20240801150635.512586-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240801150635.512586-1-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6696:EE_|SA1PR11MB7063:EE_
x-ms-office365-filtering-correlation-id: 5ee08a0c-70b2-4a75-4f18-08dcb2430426
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QgRLrHgYqBaaTFX5I/p52I7V3vQx1E1qwJahWRuWuB0cheMllhnGj0DVZIse?=
 =?us-ascii?Q?kTOIwCxTJMlChm5xMy9AeIlfCAnq+Ub1Y+w4pMh5ZZuvxD7bUHB2ulTlYLhe?=
 =?us-ascii?Q?0Vbmc1l2EtVrbcEg8AgDFl0HnQ2Og4fYRXySQy15Vs59hFhiJO2B3HW2jnli?=
 =?us-ascii?Q?t/5cdJXRizHlLNpj2QAvRRv+dod+crXIiGrPP/Ko0chjVnFR/yTZBZCa5vbQ?=
 =?us-ascii?Q?LBDC0WnkBHLn0scItnB16XyVFrpV2Rzs+iEciPeEklKQYhWD11v5uEIIdCNN?=
 =?us-ascii?Q?Y20hsvJIrFAX2ogIMfM97hXktn57vBncm7jYyYLgdn4tDfc6LhyPST9UKNJI?=
 =?us-ascii?Q?qry567mgFUyO1wDx8H2xxTrCVS3acjl/quGUPkydUqLwDJDIzyRbJU57Erri?=
 =?us-ascii?Q?6ZUPXbxKf7C6+bZuEhQcFFBd9rCmNtGAK8zSStbSKSwi6e4rFF/p/D3yL873?=
 =?us-ascii?Q?NXKQgvandhqx+ClYK6dxO8Sxv9FRIhg7hnkgoEvDnhzu5LI7AAgnlcMxM7Li?=
 =?us-ascii?Q?fcmUl1NfuQ49RhqPfo4OhIrbWDVJGX88gJ2HBlMIiTGHY5iFIlJrml+k57Xn?=
 =?us-ascii?Q?y4L9vsj7J/ALQIFJctlga+jllmsW5Q9W8u9TcQTJaCn3MQ48EhuyYGFT2dz8?=
 =?us-ascii?Q?St4jr0FaSNi3FP/zOx1XH1w8V5fUVRLzFhFUc86ifp2c/OT7CToCWy73uB+X?=
 =?us-ascii?Q?k/I+SK0S6DZ9RY9IWQy8bt5v0mS1MUgRQlww367aRfM3hMS5lXyougpz7ySs?=
 =?us-ascii?Q?QHFE2VEk6hpG4FwkZ4Wg3SUpIOaHhH0YM+z37A3b9+YVqYTTq1liqMsNx/sh?=
 =?us-ascii?Q?27oXEO64rGIm7ZreSD9BXJVrlIXxnH37IVGUrmmlOdzwuNe1xJIILYKS67UJ?=
 =?us-ascii?Q?Ekiwt5cpqip+hv1amkRFw//e+TCOF3qmWH8iL7eudNJYV66qHnGclhyBqYIJ?=
 =?us-ascii?Q?5sg8FD7gTvQwgD6BtTvUgXE+UHGEp3ls0eOyFtje5+gCzBC4QiIs8fL8D1Y+?=
 =?us-ascii?Q?8m4MscWfZ1H/i67CuFV7vbhpdooTy/m9w2Wq3/hVOLAZrpAXemQS7ZFq/eX3?=
 =?us-ascii?Q?j+WYdD/R/kLHz6D00meanq0LztTmZnOV6gvzBuxhxXhnOCOGoHVI/VobU/fN?=
 =?us-ascii?Q?CGoc2sZMGJafJFJXmKxxf3I/5Sj5BkHONLYXyWgF8FLdvobrukQg3pdOeCro?=
 =?us-ascii?Q?TrZwaa8iuq4jBRinNCm81CNEGgGQGUp6mUT8BWSR+eUJJG3Ptqx3tuGJt/V0?=
 =?us-ascii?Q?Z9A1/PBteWN9TNX4ZBzmBJsagXXTSu7lbbpf/YefKRI4L/fdSXm1dLYcjlMa?=
 =?us-ascii?Q?UN4uuAnty7I5ARhGb3LdrEucSgi89uv4tW0uk5ruT+3fFeQ3Gu4oYMSOuJWm?=
 =?us-ascii?Q?xXDWpv3JGFkQE191clzt48lGuRDFx6/xoL+U2fPxGoavUOJ+yQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6696.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1Q+oNuTVIzCI9+nJjIJ6VvZ0sBhx1/RDwPqqmzycAkJ4kDSE5vcblpTXh0AK?=
 =?us-ascii?Q?06cDqELw6XON5FcukN+vnBaZzq/CIysbdm3vUzoV5VFbk18KUfPOtKGaETLS?=
 =?us-ascii?Q?UFBvE/H12UyyfrRdOdDgZaFpWRBBb4hrU42rJF0Ah3s3EAippimMyKvLeRIz?=
 =?us-ascii?Q?i5GlSRS6ROUnrw6o7QhCsZ4PfA31gxXc6qAHMiDxs/DH1jz0xaDwhxKr1gDm?=
 =?us-ascii?Q?AlnoxWuAUqgRXaI31AhPmojYG5FjrmoJNKDx2yOf4Arph6tvMVH8MoY4wAVF?=
 =?us-ascii?Q?DAWPQlyqbGgV43kDbFNYJ0rJ/L72r/FCT776bvnQjxsMyYEAFPCsk6ZP6aXW?=
 =?us-ascii?Q?hC2CE6PL1U+HzNFDTnzTtFiD95Idi3OvxMPQxvkW5EPWsVpzesiq48C1BCHk?=
 =?us-ascii?Q?lQvi89jAPk0vVFNzDzjhQkPLNNvWxpcu1svODOan5TmtGtZ0EIFOJzI2hgu7?=
 =?us-ascii?Q?eOQWNFqy47FsRAjNeAFOcfWJWUmImD6OYXOGGLmgOXZdgKe4G9qzrQezwPek?=
 =?us-ascii?Q?4mLZD1GmHdfF0Du637wSRXzN5AsMfs6+vYDlOri+i6oBtbxW/83r4E4Ztfrp?=
 =?us-ascii?Q?65Z/ni/D+YXaQc4cC84GsSFaqDuoLAxvqrrrYCmaKiZXbYeGf2jPHFxNgbYF?=
 =?us-ascii?Q?XEqCYnoEHYYRuZ5IaYY7yJxpdXniErqnXeaRGI8mhjsJkgabiUytr4Z0aCTm?=
 =?us-ascii?Q?fUyG15Jqyit08lJHG8KrfT284CgBPDhkACxgnKCe5VzuQk+goWnvSk2quYq2?=
 =?us-ascii?Q?s5mWNaVDHLDt0TKznjokYEAl+B365vMMi5iTNN5Jt2oxvjimFD6YSuIMzcfQ?=
 =?us-ascii?Q?+IfBViGdI+BxyZH8AQQx48/Fux2UcEjawRlbxBIHrSGcsKW3FjPdppSnYI1i?=
 =?us-ascii?Q?htHzohmc9jpdiZpaHfCb40XzAEnwSlcuY4A1l+0IhKwuLwKqQbBPIq4TCPnb?=
 =?us-ascii?Q?Xlls9vX0seQqtTlZoVwvOxJjtzcA1CDQro81J9gmzycwHGgJMt9N16o5x42U?=
 =?us-ascii?Q?1cC6vCT+fAFPdeU5ASoS4jSQEDtfEZiRUN9CF9xm/pAqlvMBEy7FBZt3KzaE?=
 =?us-ascii?Q?SjWqnV4xmSmb2ZYwRvZ4S0llJpK98TRr3Cr9CDX6g3vIWJ+bByDF8C2W/pOP?=
 =?us-ascii?Q?3JpgY3VZOuS7NWPG4lKCvsJRMkA8HfMolLdsFiVujqAivDjjmEx+l40yp42C?=
 =?us-ascii?Q?4FdDnE7do75EB1iscfPwyZzBsr9vKoqtbrWp7PXtCuJegawn+X+vDOrzinGJ?=
 =?us-ascii?Q?+kVfPzlacthiU+Vzz7feIy7DzZnTK0aqcuI507ozLnNOh5beRC1Ao8m2PI3y?=
 =?us-ascii?Q?tOQbA7UaYPX/EV3nNiI4Ya1bJZwMO4Oay4X4MKpaNfdCacTZevr93v7q99JR?=
 =?us-ascii?Q?5XkJgYuITVLkKtKf2eK6PC4S8dHqkPAOWez0bbn440O+8uLDirGSyA484WU4?=
 =?us-ascii?Q?D8n7ldYM4dj7lWEaI+C2YVdJfWHZKse2X6uFlU9rEof3+UxRSj5BHxgDfpD2?=
 =?us-ascii?Q?293EOLXjScsefwPlXPbiddN3AO0J3/aUDVSFaajmcEZhVhRMggJtUlNzuX7N?=
 =?us-ascii?Q?tkBiFrhsU5+mAkBPAOgmdL26IH2i8WM5pypwDSSM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6696.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee08a0c-70b2-4a75-4f18-08dcb2430426
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 16:00:08.1654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ct+HtEoGiEfjZOIvGal5zCs8iVQmkk9HIke8JDsPrw1giUflJBPdWAt4jX8pS6I1lgTMVexCXhITHvNNYBopaeQH6G65G267YuNU/ltw25E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7063
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

Hi Marcin,

-----Original Message-----
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>=20
Sent: Thursday, August 1, 2024 5:07 PM
To: igt-dev@lists.freedesktop.org
Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Piecielska, Kat=
arzyna <katarzyna.piecielska@intel.com>; Marcin Bernatowicz <marcin.bernato=
wicz@linux.intel.com>; Adam Miszczak <adam.miszczak@linux.intel.com>; Lagun=
a, Lukasz <lukasz.laguna@intel.com>; Kolakowski, Jakub1 <jakub1.kolakowski@=
intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH v4 i-g-t] tests/intel-ci/xe-sriov-vf.blocklist.txt: Blockli=
st for SR-IOV VF runs

> Blocklist tests not applicable for Virtual Function (VF) runs.
> The list extends xe.blocklist.txt to enable execution on VF device, with =
BAT (xe-fast-feedback.testlist) runs to be enabled first.
>=20
> V2:
> - Reduce blocklist to minimal, favoring SKIPs.
> - Demonstrated minimal time impact on ADLP with increased skips.
>=20
> V3:
> - Update comment to reflect blocklist not restricted to BAT runs (Michal)
> - Move summary results after --- mark (Michal)
> - Removed igt@sriov_basic from the list (Michal)
> - Reduce decorations in blocklist file (Michal)
>=20
> V4:
> - Removed igt@xe_gt_freq and igt@xe_pm_residency tests,
>   corrected to SKIP.
>=20
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/intel-ci/meson.build               |  1 +
>  tests/intel-ci/xe-sriov-vf.blocklist.txt | 11 +++++++++++
>  2 files changed, 12 insertions(+)
>  create mode 100644 tests/intel-ci/xe-sriov-vf.blocklist.txt
>=20
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build inde=
x f16243cbb..59323eda9 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -11,6 +11,7 @@ intelci_files =3D [
>    'xe.blocklist.txt',
>    'xe-fast-feedback.testlist',
>    'xe-fast-feedback-chamelium-only.testlist',
> +  'xe-sriov-vf.blocklist.txt',
>  ]
> =20
>  install_data(sources : intelci_files, install_dir : datadir) diff --git =
a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blo=
cklist.txt
> new file mode 100644
> index 000000000..0c5bc631a
> --- /dev/null
> +++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> @@ -0,0 +1,11 @@
> +##################################################################
> +# Block list for VF runs
> +##################################################################
> +#
> +# Prevent potential module reloads during tests # igt@xe_module_load #=20
> +# Blocked because of abort # igt@xe_debugfs@gt
> --
> 2.31.1

Acked-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
