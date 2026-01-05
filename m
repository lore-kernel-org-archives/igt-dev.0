Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4712CC2A062
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 04:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E680910E1FF;
	Mon,  5 Jan 2026 04:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbnNdlDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFC910E1FF
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 04:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585876; x=1799121876;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2DJZ3rv3R8YM6oK8Q/yD1yg4UunGNpO9IGTh9ITZvTI=;
 b=LbnNdlDj97q+jh4XIqpNf2nX8TfwV0ctTKjfzFY14Mfn+4gpsV6cOHE4
 Pvl93l4Ip7oREaTA8YDL7mjEYJ0Uz8boVqiD8m73JqjV1Lfwh9okHyVb5
 9JJQEPc0HprJgHBUZQGn3cvqXjF4bwkoZ4HNtm9t4aIPfLNTrt70HVfSK
 ncnVY0XGPRvxNaQXMSHDz3rma1dut2ewE9QivC/bcWtF8Eia7KhwE5L0W
 iY8+i70h5mGCkp87wGiTyi3GfPJWxDv4MPBIyUdLdBCYYzGbrrEdzEqj4
 DMGmw8B0qP4pYvauuEG5pmZE3ROLZs/Rv9+Y71UyN3V+EfsxqOzOkPFe4 w==;
X-CSE-ConnectionGUID: Cl7pdsWYTRKoxXVhzcoAQA==
X-CSE-MsgGUID: ORE4BXBwR7asfgi3GWLcGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="91604318"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="91604318"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:04:36 -0800
X-CSE-ConnectionGUID: LJgX5HdbQmyYutktBSE1cA==
X-CSE-MsgGUID: lWNH4dc3Tjak99ugDcMsbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="207322778"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:04:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 20:02:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 20:02:48 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.30)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 20:02:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4cIqvoY/ZcgFV42NVfakvX/4ea65alX7EDiLDm5CAbHcQQTDb1ETuu3gv4kUpQ+n0/YGwW53GFx4VeVrCE/H5yz/if4KYYejQr2w6nFcBgBuNZH5fOxnFUaCSQho1eLQKN0sjRxB1ZIoablXlS0URlUSWL9j0DvkWQanttNerLgbykHl5t0UjeylLhADkMeOc3Hpll62gw+tY1JuY5MVZG4wZ8e6iaGr4PBmPjFjEzwALcbjC0s2UY9A2yS4ELJGzMuKT6SxtSaRD3dAaJ7smVdyqTd7ZyJiM5/YsRK/TdJTvPZXKF6qxcjoF+nWQ5A9mbHASw3kZK5uzJHfXKBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReAcUW7qsknAh9WFlx8rdto1OIb79sNGRcBbRC88gdo=;
 b=wnVvxXdGReJM1marQ5vJaUajADiBzO3eLQ2P96KmvEF3pzq9a7EamZXi6oc6fXrSdaD4WqymtA6tbPynjiuYi/GzuAl5CsQ4u5Azj7GMIrTqJLrEjmIBZHeyjm7H5f4wUjGbVqhHL87wJDAzEFPaCNpvWmcDSU/mmoP9MfpEWtSF4S1xvjR9Js7pYdjo8WfDuGhQrCv55E2phC6JiCnZXCnlIc1sYlnrG8YLBT+d7hHqpjSu+17hX++CUlmHpGv9kEqgiITF3nNj9DWKTulIkzECdYhQZXpkWhFyd89kmJm1TXJihRnfMKystq9zaOAfdJFTX/VH6kha7a513XAvRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 04:01:58 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 04:01:58 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [v2 2/4] tests/intel/kms_frontbuffer_tracking: Add HDR feature
 support
Thread-Topic: [v2 2/4] tests/intel/kms_frontbuffer_tracking: Add HDR feature
 support
Thread-Index: AQHce8yz2ZssLj+kXUe2jhy1VXf4CbVC+FNg
Date: Mon, 5 Jan 2026 04:01:58 +0000
Message-ID: <DM3PPF208195D8DB9E21E40E3D7AA361491E386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260102095451.42401-1-swati2.sharma@intel.com>
 <20260102095451.42401-3-swati2.sharma@intel.com>
In-Reply-To: <20260102095451.42401-3-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CO1PR11MB5076:EE_
x-ms-office365-filtering-correlation-id: 8c3fe85c-2312-49e3-b524-08de4c0f2c4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?prd6i1WmzpAj0UY9nN+xgOw1bmxuAdc6QThh4T0138Rn4QCb9mCuDqLmlv3B?=
 =?us-ascii?Q?iahsF7dv0kjyPNAYSVXBLSqb2zZq0mDRt44f+wakNVYjyc5tttgm7lvG8UEy?=
 =?us-ascii?Q?pNESeG9Ii5WOUbi6IpLKsIl72ZYCBxycgzblbhnXU9fKhtwUJPI3KcpekhJR?=
 =?us-ascii?Q?bITzs1o44I8+fFiFpUVJgKqJiN+xTDwSDxuQZgTc0Y2nRbK/x76+nG+9u6yn?=
 =?us-ascii?Q?/DqRmkjjWbe595o0wn2qDr+tkKaJQqTmUTfTBD4zxtPLCHf2L/1MJJChS7TD?=
 =?us-ascii?Q?IupXgicAaBQpmfuApjWJn3jBqGo6F8sQZx6WuE7HJJcZc5uGz1X5mgd+tVD+?=
 =?us-ascii?Q?IMwOaKdcssSLg9SGKwPnwz8ozyIrHmUkGI6YL7MDHrPMWYXMn9dfVpu1Nqzr?=
 =?us-ascii?Q?WMQtylBEjKEPxdLlFpVyXaHG/MQlCyrqOjk6PXDt415K+oKWlLfp9Yl8CoFL?=
 =?us-ascii?Q?DDzps9c/k0DUCE42aO9W0zK5LdOVlr4cxB1HKGszRH1zUkIJPlzZzUBnUs4J?=
 =?us-ascii?Q?LcaRBaUgNLmaig+mDTpZgZFvcn1XfYfo4c3fPQdipL8w/IBlEC30qH6QI9Hp?=
 =?us-ascii?Q?SldP2DAsJuhCtoBmWLLNvGyVjKWtiKByxUMtpSSeeV0ZB9zcUh8EINEhKvUf?=
 =?us-ascii?Q?aR8v/mMRwM14nTWW/IS/yJNsFpyDqWkEzy6Agl7JVftDXs0XfYlyvHVeM3hV?=
 =?us-ascii?Q?wa1ZkanWhu0SZ72yOxODlTK8tS0vsD1I7XVjUpyLWV8rh6zyM3fSE6mGgjLE?=
 =?us-ascii?Q?eKrhvR0s5li7SnQAyLgpRD0eYjojngRpuc+WOalXOx1qcX/k1vMDiC/OtqZ3?=
 =?us-ascii?Q?tEoNKcvu5B+TCmvEXQRK9+9Rz1pKwGmWBpdK6TY5nhliFx7LO/+Cov1HUlCX?=
 =?us-ascii?Q?DtX1HQmGYL4F5Q2T50mTT2kgvq8URk02vOjSTq8a94z/oolKgXDkCaPi22LU?=
 =?us-ascii?Q?LF/WeBEX//kvYpowwJ/yNFAW38A3TVnhgY0YDdRzatjb046rZKeU5VE4tgBb?=
 =?us-ascii?Q?Kun+xxAudFwaKpxFR1oLLd94yExXfHWHLlC2GtIJden7Ufnr8hFCh/2WZ2DP?=
 =?us-ascii?Q?jqeSYhBkZyTBjrs9vDmwHOOCaZoC32qRhG4cnNUdD+rd4GDaa4dJwsXWG4gJ?=
 =?us-ascii?Q?buheLfTmTHolGCK/qnNaFzbibjjpXgI4KkfljTDdy45j6A43Wg7RV1L2vUXW?=
 =?us-ascii?Q?ONqNCI7eio9sFiBmGdVtyrnhCpG1T50MzFFqLOke0q/64JxtSVLfp/BMr2mD?=
 =?us-ascii?Q?JSwdXdTZx/wksiCpeXbJkd4tlHTTMyUNxCMbpTLMfHj4eLUEqsLeoje1r3PC?=
 =?us-ascii?Q?5C6ueQiv8xGpOXJwe+NZo+EteDnfgSNBHRLkEIRchca6pR/T+mAMtlKnWJ1J?=
 =?us-ascii?Q?XfiPGji0u+UXkbZVz3ITbeBoMcYRHxLNzc6JwiUKV7Cl27t2zl4UW+6/DI/W?=
 =?us-ascii?Q?tCzxo9oNuq4sE97Pugz0Nt7kfcKjx9FDp1WEcYvoCgYzzU8GfwwVkVT0vBHa?=
 =?us-ascii?Q?mN+CvC3hd2b5Z7AMFx0PYogx3baiL5VcGMxg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3Mru1w01gS9GBXSIQoP6StLmOpduWYFoXSQKTlU5NGewjiKwkzQB22DO7GyC?=
 =?us-ascii?Q?8SPwfoyIPGEJf60anmFew1b8q0Rt2EgVGnsJXxkByw61onBHG2sK27i0S/bG?=
 =?us-ascii?Q?xHBzUeyHZVFxrNDnJvmmc43oqm6Cn/Gjoe/mbbYkvcWzhLOM1wTPAnt1M4KX?=
 =?us-ascii?Q?uL6V58XpCDSvSdq5HlSDRlVvduBqzLKUl6Zp3qsF6r4PxX7+xvSfSyX/aCmn?=
 =?us-ascii?Q?jk+hWjnKqenOYhxbDPPdqCImPVxtRJVEL3zAFk5uyImIHB3nY6HQDkAlUU4h?=
 =?us-ascii?Q?Kdppcgp//0/IXgCgR/SDfJHXmUAkd1kfAzKjCJw9vqMPRp1nI7RzB4owmYzu?=
 =?us-ascii?Q?8woAY4IgmYOs16M/PZhQ6+rLj86NuYpCBk5gTXDjhGowP/Qq4tNi0i8x0GY7?=
 =?us-ascii?Q?JoE69P6iXIGiU0ilp7kqjQzK1VKh2tpbgh9zeW0o2CDNWyIpZPfe3rUXzf2l?=
 =?us-ascii?Q?fNfVo4YgWEZCG4GfblVoCEmtrvVQtgSMCfNSndmX1GYS/E9Ll+pAiwBSohbg?=
 =?us-ascii?Q?T8T+1IEs4a8Rj31lLNwGpLzeWrVkM533vrtAIXtSPBWISlugg5FfuIrpbngf?=
 =?us-ascii?Q?KvcO8vCwJQGrL6hntCYtSZad90CWCOB1auYEME6owEkBsJnN5WzeZc1ZQXYu?=
 =?us-ascii?Q?5bQtGIZLiJ/fTrb/1ibhxHgsnmwDhWhJcf/1mLY1Jmmf5mMp51Aums+2YHUi?=
 =?us-ascii?Q?wRkHpg+PVCvZKZghwHYwdqXaiwVeoPkUxyOHXwl3FRRxaCNmVfcT5sxbMjxg?=
 =?us-ascii?Q?C5yVe5/QxrAnLJ4FEbEaHK9zHY6JO+JmE9fW32RpFTBnMgyur9sTuA28tzF8?=
 =?us-ascii?Q?4AJceMvBBUt9L66tDXhUDB01oTqW0PNXrsZLlm0Lrn8K5OSW1Fl5hjnaC8VE?=
 =?us-ascii?Q?fZYb7dkPdEJDoKWB5LWIG4z9HLK8wvsX+BzjUE0uGU+RZ8wbn1BO0BP8C8DZ?=
 =?us-ascii?Q?CDGqi+WRlcDdBjYzlIEi9JC5ehpbcngMaaBEJZes1+U+376gcC21GUiETVcH?=
 =?us-ascii?Q?JzzMj+obFhIw3NOdFsdtslRyI+IzC81NATfo9cLNF1x3SkTBdmFVgLA/2DYR?=
 =?us-ascii?Q?EGah5irThXnpnavN2qswr9pNzwuFR0szg+ria7JnIwBGQEY8qBJG/93lVNSm?=
 =?us-ascii?Q?frELQhr5DbjfCAq9XkU+0l3vet8HGoT6W6zg4LHrZPzDgLO9pm3Yt7mPDZE5?=
 =?us-ascii?Q?YlVMfSxVHxZBgqofQ9yHke8JE6vZiYzb1kisx4h5KSUTxZmKACgWwkD2yEed?=
 =?us-ascii?Q?yHw+CB1Abntc7WyI6ZV5IcNpsLqnJm6/KLe/Fsh1v2O1Gf8NCzxy1k2pHCRD?=
 =?us-ascii?Q?UYY7mh+HWcTI5tIamypvtRXPxBB5SruCzT2kZ4BGPbK1zwjKskoKFfBMIeWT?=
 =?us-ascii?Q?xkpuh1RVJZMjIVd7Q2qj9rxkJwJn88gudIDuUSNXwLiJek4MFpYE8F0tz5XN?=
 =?us-ascii?Q?4Gtvz9f4e5KfyqF6gWo2gxya15jYAp1+FW9KOCls1Zl9P86x0LcTYcwDjolv?=
 =?us-ascii?Q?BCV8YtBSK1r801qDOe57Bdndn69dCgLSkfLT1bZobiPz/n/yFQO8I4vh4oXG?=
 =?us-ascii?Q?Tnv77M1k/NADcDE52csIdZt+6JvYQIMO8iV29taX11wrxWCMf2X3rH0gSVWM?=
 =?us-ascii?Q?PJTpnQfsF8Vdu1I3eXPjYqizCHJVF9bc/x1fD2bHdmM0Vbt3Jc2Ndlct3dkQ?=
 =?us-ascii?Q?CWP2XfIlOk3qpiMPZuPZy+nIfCK0lY6DmAffcgEOdJa3YNUS5s/iQL10aOdE?=
 =?us-ascii?Q?gDeXeXemMA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3fe85c-2312-49e3-b524-08de4c0f2c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 04:01:58.3946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OPM8139y1lwGAVaq+VRWHIfopMCfkZVrHeI/sk6lbuNQ+9U+YBezb9zpQab1yiegMdarUrmFVFs97bqXoNUxew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5076
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

> Subject: [v2 2/4] tests/intel/kms_frontbuffer_tracking: Add HDR feature
> support
>=20
> Add FEATURE_HDR and extend feature_str() to cover all feature mask
> combinations.
>=20
> v2: -add documentation
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tests/intel/kms_frontbuffer_tracking.c | 585 ++++++++++++++++++++++++-
>  1 file changed, 580 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/intel/kms_frontbuffer_tracking.c
> b/tests/intel/kms_frontbuffer_tracking.c
> index f2e7c72f6..3447ed298 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -66,12 +66,30 @@
>   * SUBTEST: psr-%dp-rte
>   * Description: Sanity test to enable PSR with %arg[1] panels.
>   *
> + * SUBTEST: hdr-%dp-rte
> + * Description: Sanity test to enable PSR with %arg[1] panels.
> + *
>   * SUBTEST: fbcdrrs-%dp-rte
>   * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
>   *
>   * SUBTEST: fbcpsr-%dp-rte
>   * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
>   *
> + * SUBTEST: fbchdr-%dp-rte
> + * Description: Sanity test to enable FBC & HDR with %arg[1] panels.
> + *
> + * SUBTEST: hdrdrrs-%dp-rte
> + * Description: Sanity test to enable HDR & DRRS with %arg[1] panels.
> + *
> + * SUBTEST: hdrpsr-%dp-rte
> + * Description: Sanity test to enable HDR & PSR with %arg[1] panels.
> + *
> + * SUBTEST: hdrfbcdrrs-%dp-rte
> + * Description: Sanity test to enable HDR, FBC & DRRS with %arg[1] panel=
s.
> + *
> + * SUBTEST: hdrfbcpsr-%dp-rte
> + * Description: Sanity test to enable HDR, FBC & PSR with %arg[1] panels=
.
> + *
>   * arg[1].values:   1, 2
>   */
>=20
> @@ -85,12 +103,30 @@
>   * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
> + * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
>   * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
>   * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
> + * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrdrrs-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrpsr-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcpsr-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcdrrs-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
>   * arg[1]:
>   *
>   * @indfb:          Individual fb
> @@ -116,6 +152,10 @@
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
>   *
> + * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
>   * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
> @@ -124,6 +164,21 @@
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
>   *
> + * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrdrrs-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrpsr-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcdrrs-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcpsr-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
>   * arg[1]:
>   *
>   * @indfb:          Individual fb
> @@ -149,6 +204,10 @@
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
>   *
> + * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
> @@ -157,6 +216,26 @@
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
>   *
> + * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrdrrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrpsr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcpsr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
>   * arg[1].values:   1, 2
>   *
>   * arg[2]:
> @@ -182,12 +261,30 @@
>   * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
> + * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
> + * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrdrrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrpsr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcpsr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
>   * arg[1].values:   1, 2
>   *
>   * arg[2]:
> @@ -213,12 +310,30 @@
>   * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
> + * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
>   * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
> + * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrpsr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
>   * arg[1].values:   1, 2
>   *
>   * arg[2]:
> @@ -241,6 +356,10 @@
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
>   *
> + * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
>   * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
> @@ -249,6 +368,26 @@
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
>   *
> + * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrpsr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
>   * arg[1].values:   1, 2
>   *
>   * arg[2]:
> @@ -268,12 +407,30 @@
>   * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
> + * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
> + * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrdrrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrpsr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcpsr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
>   * arg[1]:
>   *
>   * @cur:            Cursor plane
> @@ -300,6 +457,10 @@
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
>   *
> + * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
> @@ -308,6 +469,26 @@
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
>   *
> + * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrdrrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrpsr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcpsr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
>   * arg[1]:
>   *
>   * @cur:            Cursor plane
> @@ -331,12 +512,30 @@
>   * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
> + * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
>   * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   *
> + * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrpsr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
> + * SUBTEST: hdrfbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + *
>   * arg[1]:
>   *
>   * @blt:            Blitter
> @@ -357,6 +556,10 @@
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
>   *
> + * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
>   * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
> @@ -365,6 +568,26 @@
>   * Description: Draw a set of rectangles on the screen using the provide=
d
> method
>   * Driver requirement: i915
>   *
> + * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrpsr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the
> + provided method
> + * Driver requirement: i915
> + *
>   * arg[1]:
>   *
>   * @mmap-cpu:       MMAP-CPU
> @@ -382,12 +605,30 @@
>   * SUBTEST: psr-%dp-pri-indfb-multidraw
>   * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
>   *
> + * SUBTEST: hdr-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated
> + drawing methods
> + *
>   * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
>   * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
>   *
>   * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
>   * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
>   *
> + * SUBTEST: fbchdr-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated
> + drawing methods
> + *
> + * SUBTEST: hdrdrrs-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated
> + drawing methods
> + *
> + * SUBTEST: hdrpsr-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated
> + drawing methods
> + *
> + * SUBTEST: hdrfbcdrrs-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated
> + drawing methods
> + *
> + * SUBTEST: hdrfbcpsr-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated
> + drawing methods
> + *
>   * arg[1].values:   1, 2
>   */
>=20
> @@ -401,12 +642,30 @@
>   * SUBTEST: psr-%s-draw-%s
>   * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>   *
> + * SUBTEST: hdr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + *
>   * SUBTEST: fbcdrrs-%s-draw-%s
>   * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>   *
>   * SUBTEST: fbcpsr-%s-draw-%s
>   * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>   *
> + * SUBTEST: fbchdr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + *
> + * SUBTEST: hdrdrrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + *
> + * SUBTEST: hdrpsr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + *
> + * SUBTEST: hdrfbcdrrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + *
> + * SUBTEST: hdrfbcpsr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + *
>   * arg[1]:
>   *
>   * @rgb101010:      FORMAT_RGB101010
> @@ -432,6 +691,10 @@
>   * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>   * Driver requirement: i915
>   *
> + * SUBTEST: hdr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + * Driver requirement: i915
> + *
>   * SUBTEST: fbcdrrs-%s-draw-%s
>   * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>   * Driver requirement: i915
> @@ -440,6 +703,26 @@
>   * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>   * Driver requirement: i915
>   *
> + * SUBTEST: fbchdr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrdrrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrpsr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcdrrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcpsr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not
> + FORMAT_DEFAULT
> + * Driver requirement: i915
> + *
>   * arg[1]:
>   *
>   * @rgb101010:      FORMAT_RGB101010
> @@ -464,6 +747,18 @@
>   *
>   * SUBTEST: fbcpsr-slowdraw
>   * Description: Sleep a little bit between drawing operations with FBC &=
 PSR
> + *
> + * SUBTEST: hdrdrrs-slowdraw
> + * Description: Sleep a little bit between drawing operations with DRRS
> + & HDR
> + *
> + * SUBTEST: hdrpsr-slowdraw
> + * Description: Sleep a little bit between drawing operations with PSR
> + & HDR
> + *
> + * SUBTEST: hdrfbcdrrs-slowdraw
> + * Description: Sleep a little bit between drawing operations with
> + DRRS, HDR & FBC
> + *
> + * SUBTEST: hdrfbcpsr-slowdraw
> + * Description: Sleep a little bit between drawing operations with PSR,
> + HDR & FBC
>   */
>=20
>  /**
> @@ -476,12 +771,30 @@
>   * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
>   * Description: Just exercise page flips with the patterns we have
>   *
> + * SUBTEST: hdr-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
>   * Description: Just exercise page flips with the patterns we have
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
>   * Description: Just exercise page flips with the patterns we have
>   *
> + * SUBTEST: fbchdr-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
> + * SUBTEST: hdrdrrs-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
> + * SUBTEST: hdrpsr-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
> + * SUBTEST: hdrfbcdrrs-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
> + * SUBTEST: hdrfbcpsr-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
>   * arg[1].values:   1, 2
>   *
>   * arg[2]:
> @@ -506,12 +819,30 @@
>   * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
>   * Description: Just exercise page flips with the patterns we have
>   *
> + * SUBTEST: hdr-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
>   * Description: Just exercise page flips with the patterns we have
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
>   * Description: Just exercise page flips with the patterns we have
>   *
> + * SUBTEST: fbchdr-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
> + * SUBTEST: hdrdrrs-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
> + * SUBTEST: hdrpsr-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
> + * SUBTEST: hdrfbcdrrs-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
> + * SUBTEST: hdrfbcpsr-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + *
>   * arg[1]:
>   *
>   * @indfb:          Individual fb
> @@ -537,6 +868,18 @@
>   * Description: Check if the hardware tracking works after page flips
>   * Driver requirement: i915
>   *
> + * SUBTEST: fbchdr-%dp-%s-fliptrack-mmap-gtt
> + * Description: Check if the hardware tracking works after page flips
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcdrrs-%dp-%s-fliptrack-mmap-gtt
> + * Description: Check if the hardware tracking works after page flips
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcpsr-%dp-%s-fliptrack-mmap-gtt
> + * Description: Check if the hardware tracking works after page flips
> + * Driver requirement: i915
> + *
>   * arg[1].values:   1, 2
>   *
>   * arg[2]:
> @@ -555,12 +898,30 @@
>   * SUBTEST: psr-%dp-primscrn-%s-indfb-move
>   * Description: Just move the %arg[2] around
>   *
> + * SUBTEST: hdr-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
>   * Description: Just move the %arg[2] around
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
>   * Description: Just move the %arg[2] around
>   *
> + * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + *
> + * SUBTEST: hdrdrrs-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + *
> + * SUBTEST: hdrpsr-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + *
> + * SUBTEST: hdrfbcdrrs-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + *
> + * SUBTEST: hdrfbcpsr-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + *
>   * arg[1].values:   1, 2
>   *
>   * arg[2]:
> @@ -579,12 +940,30 @@
>   * SUBTEST: psr-2p-scndscrn-%s-indfb-move
>   * Description: Just move the %arg[1] around
>   *
> + * SUBTEST: hdr-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
>   * Description: Just move the %arg[1] around
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
>   * Description: Just move the %arg[1] around
>   *
> + * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + *
> + * SUBTEST: hdrdrrs-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + *
> + * SUBTEST: hdrpsr-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + *
> + * SUBTEST: hdrfbcdrrs-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + *
> + * SUBTEST: hdrfbcpsr-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + *
>   * arg[1]:
>   *
>   * @spr:            Sprite plane
> @@ -601,12 +980,30 @@
>   * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
>   * Description: Just enable and disable the %arg[2] a few times
>   *
> + * SUBTEST: hdr-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
>   * Description: Just enable and disable the %arg[2] a few times
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
>   * Description: Just enable and disable the %arg[2] a few times
>   *
> + * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + *
> + * SUBTEST: hdrdrrs-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + *
> + * SUBTEST: hdrpsr-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + *
> + * SUBTEST: hdrfbcdrrs-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + *
> + * SUBTEST: hdrfbcpsr-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + *
>   * arg[1].values:   1, 2
>   *
>   * arg[2]:
> @@ -625,12 +1022,30 @@
>   * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
>   * Description: Just enable and disable the %arg[1] a few times
>   *
> + * SUBTEST: hdr-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
>   * Description: Just enable and disable the %arg[1] a few times
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
>   * Description: Just enable and disable the %arg[1] a few times
>   *
> + * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + *
> + * SUBTEST: hdrdrrs-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + *
> + * SUBTEST: hdrpsr-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + *
> + * SUBTEST: hdrfbcdrrs-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + *
> + * SUBTEST: hdrfbcpsr-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + *
>   * arg[1]:
>   *
>   * @spr:            Sprite plane
> @@ -647,12 +1062,30 @@
>   * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
>   * Description: Put a fullscreen plane covering the whole screen
>   *
> + * SUBTEST: hdr-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
>   * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
>   * Description: Put a fullscreen plane covering the whole screen
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
>   * Description: Put a fullscreen plane covering the whole screen
>   *
> + * SUBTEST: fbchdr-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
> + * SUBTEST: hdrdrrs-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
> + * SUBTEST: hdrpsr-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
> + * SUBTEST: hdrfbcdrrs-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
> + * SUBTEST: hdrfbcpsr-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
>   * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
>   * Description: Put a fullscreen plane covering the whole screen
>   *
> @@ -662,12 +1095,30 @@
>   * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
>   * Description: Put a fullscreen plane covering the whole screen
>   *
> + * SUBTEST: hdr-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
>   * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
>   * Description: Put a fullscreen plane covering the whole screen
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
>   * Description: Put a fullscreen plane covering the whole screen
>   *
> + * SUBTEST: fbchdr-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
> + * SUBTEST: hdrdrrs-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
> + * SUBTEST: hdrpsr-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
> + * SUBTEST: hdrfbcdrrs-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
> + * SUBTEST: hdrfbcpsr-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + *
>   * arg[1].values:   1, 2
>   */
>=20
> @@ -681,12 +1132,30 @@
>   * SUBTEST: psr-%s-scaledprimary
>   * Description: Try different primary plane scaling strategies
>   *
> + * SUBTEST: hdr-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + *
>   * SUBTEST: fbcdrrs-%s-scaledprimary
>   * Description: Try different primary plane scaling strategies
>   *
>   * SUBTEST: fbcpsr-%s-scaledprimary
>   * Description: Try different primary plane scaling strategies
>   *
> + * SUBTEST: fbchdr-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + *
> + * SUBTEST: hdrdrrs-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + *
> + * SUBTEST: hdrpsr-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + *
> + * SUBTEST: hdrfbcdrrs-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + *
> + * SUBTEST: hdrfbcpsr-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + *
>   * arg[1]:
>   *
>   * @indfb:          Individual fb
> @@ -703,11 +1172,29 @@
>   * SUBTEST: psr-modesetfrombusy
>   * Description: Modeset from a busy buffer to a non-busy buffer with PSR
>   *
> + * SUBTEST: hdr-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with
> + HDR
> + *
>   * SUBTEST: fbcdrrs-modesetfrombusy
>   * Description: Modeset from a busy buffer to a non-busy buffer with FBC=
 &
> DRRS
>   *
>   * SUBTEST: fbcpsr-modesetfrombusy
>   * Description: Modeset from a busy buffer to a non-busy buffer with FBC=
 &
> PSR
> + *
> + * SUBTEST: fbchdr-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with
> + FBC & HDR
> + *
> + * SUBTEST: hdrdrrs-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with
> + DRRS & HDR
> + *
> + * SUBTEST: hdrpsr-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with
> + HDR & PSR
> + *
> + * SUBTEST: hdrfbcdrrs-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with
> + DRRS, HDR & FBC
> + *
> + * SUBTEST: hdrfbcpsr-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with
> + HDR, PSR & FBC
>   */
>=20
>  /**
> @@ -720,11 +1207,29 @@
>   * SUBTEST: psr-suspend
>   * Description: Make sure suspend/resume keeps us on the same state of P=
SR
>   *
> + * SUBTEST: hdr-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of
> + HDR
> + *
>   * SUBTEST: fbcdrrs-suspend
>   * Description: Make sure suspend/resume keeps us on the same state of F=
BC
> & DRRS
>   *
>   * SUBTEST: fbcpsr-suspend
>   * Description: Make sure suspend/resume keeps us on the same state of F=
BC
> & PSR
> + *
> + * SUBTEST: fbchdr-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of
> + FBC & HDR
> + *
> + * SUBTEST: hdrdrrs-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of
> + HDR & DRRS
> + *
> + * SUBTEST: hdrpsr-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of
> + HDR & PSR
> + *
> + * SUBTEST: hdrfbcdrrs-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of
> + HDR, DRRS & FBC
> + *
> + * SUBTEST: hdrfbcpsr-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of
> + HDR, PSR & FBC
>   */
>=20
>  /**
> @@ -740,6 +1245,10 @@
>   * Description: Test drawing as far from the fence start as possible
>   * Driver requirement: i915
>   *
> + * SUBTEST: hdr-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + *
>   * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
>   * Description: Test drawing as far from the fence start as possible
>   * Driver requirement: i915
> @@ -747,6 +1256,26 @@
>   * SUBTEST: fbcpsr-farfromfence-mmap-gtt
>   * Description: Test drawing as far from the fence start as possible
>   * Driver requirement: i915
> + *
> + * SUBTEST: fbchdr-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrdrrs-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrpsr-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcdrrs-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + *
> + * SUBTEST: hdrfbcpsr-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
>   */
>=20
>  /**
> @@ -758,6 +1287,15 @@
>   *
>   * SUBTEST: fbcpsr-stridechange
>   * Description: Change the frontbuffer stride by doing a modeset
> + *
> + * SUBTEST: fbchdr-stridechange
> + * Description: Change the frontbuffer stride by doing a modeset
> + *
> + * SUBTEST: hdrfbcdrrs-stridechange
> + * Description: Change the frontbuffer stride by doing a modeset
> + *
> + * SUBTEST: hdrfbcpsr-stridechange
> + * Description: Change the frontbuffer stride by doing a modeset
>   */
>=20
>  /**
> @@ -773,6 +1311,18 @@
>   * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
>   *              basic drawing test, else set the mode & test if FBC is d=
isabled
>   *
> + * SUBTEST: fbchdr-tiling-%s
> + * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> + *              basic drawing test, else set the mode & test if FBC is d=
isabled
> + *
> + * SUBTEST: hdrfbcdrrs-tiling-%s
> + * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> + *              basic drawing test, else set the mode & test if FBC is d=
isabled
> + *
> + * SUBTEST: hdrfbcpsr-tiling-%s
> + * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> + *              basic drawing test, else set the mode & test if FBC is d=
isabled
> + *
>   * arg[1]:
>   *
>   * @4:              4 tiling
> @@ -855,8 +1405,9 @@ struct test_mode {
>  		FEATURE_FBC   =3D 1,
>  		FEATURE_PSR   =3D 2,
>  		FEATURE_DRRS  =3D 4,
> -		FEATURE_COUNT =3D 8,
> -		FEATURE_DEFAULT =3D 8,
> +		FEATURE_HDR   =3D 8,
> +		FEATURE_COUNT =3D 16,
> +		FEATURE_DEFAULT =3D 16,
>  	} feature;
>=20
>  	/* Possible pixel formats. We just use FORMAT_DEFAULT for most
> tests and @@ -4001,12 +4552,36 @@ static const char *feature_str(int
> feature)
>  		return "fbc";
>  	case FEATURE_PSR:
>  		return "psr";
> -	case FEATURE_FBC | FEATURE_PSR:
> -		return "fbcpsr";
>  	case FEATURE_DRRS:
>  		return "drrs";
> +	case FEATURE_HDR:
> +		return "hdr";
> +	case FEATURE_FBC | FEATURE_PSR:
> +		return "fbcpsr";
>  	case FEATURE_FBC | FEATURE_DRRS:
> -		return "fbcdrrs";
> +	        return "fbcdrrs";
> +	case FEATURE_FBC | FEATURE_HDR:
> +	        return "fbchdr";
> +
> +	case FEATURE_PSR | FEATURE_DRRS:
> +		return "psrdrrs";
> +	case FEATURE_PSR | FEATURE_HDR:
> +	        return "hdrpsr";
> +	case FEATURE_DRRS | FEATURE_HDR:
> +	        return "hdrdrrs";
> +
> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS:
> +		return "fbcpsrdrrs";
> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_HDR:
> +		return "hdrfbcpsr";
> +	case FEATURE_FBC | FEATURE_DRRS | FEATURE_HDR:
> +		return "hdrfbcdrrs";
> +	case FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
> +		return "hdrpsrdrrs";
> +
> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS |
> FEATURE_HDR:
> +		return "hdrfbcpsrdrrs";
> +
>  	default:
>  		igt_assert(false);
>  	}
> --
> 2.25.1

