Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA8E65D1E
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 04:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D6010EABE;
	Fri, 22 Nov 2024 04:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3gFEO6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC28710EABE
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 04:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732248280; x=1763784280;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EIT2xqJdHRVqqUNcLscO32fKSbxs1hHLYT8RWqqUEhQ=;
 b=n3gFEO6p9VO6tL46h86uYnIn3/CPWjQqqEBBRqOfQru60i7v/1nqHmQc
 QvSt8r+nIiAOp7iPMgxuqUL5U7mnj5uLKQ1I0urhCbqFxIzC/TLcx6uui
 wTjOyu0pFRKTqQyxYHe4CpOMR/RMART97gpOQEmM6C3OnJbxyQJFDkY4Z
 LxPPz3N9ZjQGfa+2T7/5sx0ILB2/JsL3J1E9YgGcNVENGIJ09pw0WOSDE
 sf6dGWmn/IVGMJA0Zsg3OTFarQYQAOJI6jNCXucx49herwaappx49YtJr
 ZR9XeZ6Wf9Ag6bQbVo4bF4xNs4mQgcnv3kQHTGhsk2I8lfegVYCAbItUm g==;
X-CSE-ConnectionGUID: s0zXD8Y5S92vu9c3oaoQzQ==
X-CSE-MsgGUID: 3z2GO+WnQfy5vLYMBTjTkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="49809224"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="49809224"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 20:04:40 -0800
X-CSE-ConnectionGUID: dd+7MIlER8yQiQjV7clJ6w==
X-CSE-MsgGUID: kaPcKF5mRCOQpcHL64kSvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="90872803"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 20:04:39 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 20:04:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 20:04:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 20:04:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g74eAezp/cLkuJNji9BVY7FPOWzZWbmYTFmWL084uesHxmmCa5OY6OkLNOPTIbzonOzCsAQ3znHDMuTKPwbG39ZnkDnjW+zezwod6b1Tg3+NKeNBFN6uap5D+/f6XFjcRebXRcgGH0xVqOLWh4pE8yoPq+8Rsj8lLDErYT3+pCFlz8sArhwMoWzV8MwzJPAvw/uZ7MpL+Hb6DQrFAsQhE742g5ZJRZLOrtDeC3WiFcjFF6maNm9ZZ6pwx8TRUevvGdvCuMfbrHXsbKFJbu/6fjmzp4nd1koOhNSsbcMvP6kk1toR7MPe8zfrtO4YqgGEMT4dNqTTKS4vAFVDvnLmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkO8tTREKRpkpU6Wx9x27Ci8VJBXMLdV7NuSH5EuFfU=;
 b=LFf8OqqDkQpAxpURuazKKtXD4BObj+yysodaD2JT9/q3s9W1X8rmIB/h/cgL8TQpre1POx0kcHJsCZ1lUfbejCK44t47MF2htFOfGjH4HGEYQ8J7zQpiCEXu6ykFk8mOC3mMSRY97woHztH8L3QJCoDMkVKaatOXJKZSPVfWLrCwVjnE1cAJqmyrXc0n9XZSbCYbm9cfd8FxIxJJiaaj2X2ISkJQSVUufrilqp0P0YhlVniCGsiJ2lxP3Jez5K2N0NuCgiqOIgf5QxkcpJj8ek0QM9FUxVJlOmVbHxkpOzu//QWIUXvSXC8b06hS/3FhwDnUpv0b/eTYbk/JNShuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB6692.namprd11.prod.outlook.com (2603:10b6:303:20e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.17; Fri, 22 Nov 2024 04:04:36 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8158.023; Fri, 22 Nov 2024
 04:04:36 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_cdclk: Handle scenario where ref
 and new cdclk is same
Thread-Topic: [PATCH i-g-t] tests/intel/kms_cdclk: Handle scenario where ref
 and new cdclk is same
Thread-Index: AQHbPD0Vx9ULmfRKFEG9O7QQQHI1tbLCrrXg
Date: Fri, 22 Nov 2024 04:04:36 +0000
Message-ID: <DM4PR11MB6312A7A97D518BE7180588F590232@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241121174659.1752109-1-swati2.sharma@intel.com>
In-Reply-To: <20241121174659.1752109-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB6692:EE_
x-ms-office365-filtering-correlation-id: d93fb7e6-829c-4128-27b3-08dd0aaac7b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rjps/Xmm6dgdp/Urwb1uPyMo7/X7sdQXOXkxhjGzsMDs83WY3KtZ8Fjwg8LI?=
 =?us-ascii?Q?2X2U4jThH+2Z/mlLN1HvMxL/nqrbhJWnG5T7KNmSsIvwzWb4YxlAqSsM485S?=
 =?us-ascii?Q?WoCK2ByAOGkhs3DPSn3ue5MHCMpfE1hUwWCGQC70t+19uoxUEabCXIC8JdxP?=
 =?us-ascii?Q?EE0/ENwgM+mR4AmvBL3GGoWU2Mzp/1J4ey+spVDXza6AdmDRlxtTC3T8+V7s?=
 =?us-ascii?Q?6dPq6kpUqXlHUazIrehBBCY7aR/Q4wWlBEvEbtYmuF08osRLHiom353/lxOo?=
 =?us-ascii?Q?j0gYPEHT5alCy+Eqhj+Hrg9gtBiwIOuXRAntBe7M8IiOfXCtk2VJKrlFe5gc?=
 =?us-ascii?Q?OpJgBaOjDmu092G7SmjiIWg/i9Utcl7AYYVB4EvXzdEgNl9QrCH7p8YEdHiC?=
 =?us-ascii?Q?ue3e5VUJW4VzwBeCPMLw7zA8hfhgTZ8ViF9+WccgV0J4t3MJktDHHj0PRJvj?=
 =?us-ascii?Q?E2b8mh3kpfhy+jft/D+hJJC3u86IZZqUhmeahmJyf0rAhCl0OlPo/FfXi6qi?=
 =?us-ascii?Q?HKW+bzzFGgH5D5ZCx0WxT82Q4dY+Io6FA15W9S1DAEfTHWjNvUPWciU0A4Y1?=
 =?us-ascii?Q?p4CWYCNa1sO23Y7pPXxHiVndW+7bfsbCM3W/X37/fsFPCYIIDx8OIUdZw0ZJ?=
 =?us-ascii?Q?txpug7p+LPzZflWzHbB6zTmnADkmTNrgGX54RT/IF0Okr3auiB8lkrNKU3qb?=
 =?us-ascii?Q?B9V/GXVHAmiuLE+PRRv3W0KCRPvEAspfn/mCYYPU6snR6+lcaweSkSJ6sYIV?=
 =?us-ascii?Q?0kDGgdV1qXe4n2cTFMEa7iRr8F4xAZXxGTIAmsxT6ciLNwiqmyuBOrBKYLJe?=
 =?us-ascii?Q?EehdNTQtXU0uqvhYumTMieAucHJTkkRuklMB8/zw3Ugykol+vp1cRFGSWAdo?=
 =?us-ascii?Q?iJQa770B5c8D3q6S/WKq+gyHRDgYjC7hutew81otap02h8IIaUlfgjJBX7td?=
 =?us-ascii?Q?BtqLnU5sWP4bH8Onjb7uawvErFekKxgIfRfBhTZPr+INwdyX2XMUzt4aQhXB?=
 =?us-ascii?Q?CHxXVsY870WfChqS6pzdPI9jAeYIcn1FWeHrmr70SAQe8ZWpEWwAj6fPpvFk?=
 =?us-ascii?Q?Vt8jq5LXCDT1MpWDY4Yr0+Rb+FdbTiv4Z1qDZW74TnQPX/RqkeGvijrkHxRF?=
 =?us-ascii?Q?HcKDCRSIhCQ0l/a8H0gClnNUtTzt2lV3KHiwX/nlMn0aeLq0Ubxq2707R0e2?=
 =?us-ascii?Q?vqlUeSZEgaUI00wJ8j7Pb+CZFiO4qX3x7XbBPkWg7IM7R6GQA6ivubnGebLE?=
 =?us-ascii?Q?3Unq6j1Z5HOt3TQrBiRtL3r6fk4fW/s/COaiDqOm61CI4rqB/djq6jjdC+pr?=
 =?us-ascii?Q?/c5ib1sSCJnKbvb/zGxRLvQB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uM8q78uj+S482VsjhR5bZpXAqR/fC8rv5TmPJ8HE6LKwY5sABfthnq6swUqV?=
 =?us-ascii?Q?kiWe/XMwA3E0wDrL7LKeH7M7CefkrMNMJ3httmMYAUe+qb2c6YMZ6F6jQlbw?=
 =?us-ascii?Q?Yb9GodfQRc64oGNnoCE+DY16W/+5IaFtsE0kxGarreCHqZoW2wlG9IFeOVxL?=
 =?us-ascii?Q?yZaawPehgKAGSQUi351/D7n1h+WAeOFS32mueeHxNuGD1wGqA+kSROU3k1Zv?=
 =?us-ascii?Q?0dOp/T8kYxk+bGU++SEGIkSVJNIkCZivjhZGFKUCC6MLa+cUiR9/mMwxmPwC?=
 =?us-ascii?Q?DfBWxhHaTDV4p5YWQlb0Z2Khu5fz3FAuzFdP5jUfvhBpeE7DP5SNV8ZSAtZk?=
 =?us-ascii?Q?FtQ2MOiBB9nD1Hzi5IA1YeTJj5s0W8P6G9fx5Sk++NJG2Trj6nucjqjZ8SyM?=
 =?us-ascii?Q?VOWaNxEAUHQeE8igsgSBjsSHs6pvI7NL5rm3f/Ywgs8CTlWfpsrpR+HGZpQL?=
 =?us-ascii?Q?E3cN6CH+HG/siFmjFkLErpmdCEHD1HNW852JGtnp/j+a6EW+SCs4O+/vQ+Si?=
 =?us-ascii?Q?Va0VjPW9jvYe3xds8j5K1RLGw/qMzFWoeA/baNe4nRV83/DkePZ8rOyckZxL?=
 =?us-ascii?Q?3SaLK3E6bp94eyxkcimuATSo1Aono3t54uHhTnIIPl2D6DsVnGAH8F5NwrE1?=
 =?us-ascii?Q?leQUSg7mwXvpWssW3Ni7cEHkyycrWFkbHrQISuXvgMCP+KFjLOZJs4eg8+nf?=
 =?us-ascii?Q?DetlwBLOuMFR57VBTAl3YCKrBkpQdWmrChse+rGtctr4BIM1j/0tVHA+3v53?=
 =?us-ascii?Q?5mUII9buczg8cPCEVjVnoVz/wF3JDTblHTKoFlIiNn5jkol2BknaYE663YC0?=
 =?us-ascii?Q?G9Bfj+HNjeSAjZ0ejKwWz1MNY21tezu7SZxp6h9M4Xxkp9nFHxsyuw64i/8a?=
 =?us-ascii?Q?5q0fXHdZNVh03Pi6MOVS95g6tL+Y6dBaXx5Yit9Vd7Q+g5L3PZfftCEMLAIy?=
 =?us-ascii?Q?ZTnf1HBirvUce0kTfPqqURcfpsvjghzbBWm64xd/QOJpzgf6JTNs9s2TJ+Z3?=
 =?us-ascii?Q?PHQ+Yw9q0jcY71Y8s+y31E7N9tX20+mjlsHvhjjd1nQre9S0/XtlwNMGQiv0?=
 =?us-ascii?Q?MYVlcjoKUtWFsAr7Zj6JqHmhbbta9jC8AVaJ/qIQZLxmZVj96878UkX5e70n?=
 =?us-ascii?Q?shF6ejWSK8D2RYV3LwOzgxe164TM/BHou109jGPM9F4Qo1dcO/hhQNYO65I/?=
 =?us-ascii?Q?rltoMgIanIXsbH3E6KnNBGaS6uHSjYm6FhVOd0dNolDvabDeew5iTEnzs8C3?=
 =?us-ascii?Q?FpcTqakomb09B9jh8bpdgTm6I/TmZy4puOTS1BWaptZbxb5VfDhYWO3Lipjw?=
 =?us-ascii?Q?m6TdNFPrsSbJlkMqjDsKkYLtpTMHr4NDko/xL8iSsDjT8tSCAw2uv0XBtT8q?=
 =?us-ascii?Q?fWMF1+ZpTzTEylAvxCoUC+edFXE2qk1516pFD/9kZDugZogwjkJ0AJu7uoOl?=
 =?us-ascii?Q?c9a0t3BJvjaLIE+UIRvwBAnqLoVewCsKO0EytlGmjgVwARMJjWQbM8Ir1MJ2?=
 =?us-ascii?Q?UN0934nZNg3H2wCjLtyjd+WwbPVWSAklsZGPGYcgAfo2OriFH22Ugbo1qw7e?=
 =?us-ascii?Q?L45qnFdQl9TsB7V31s8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93fb7e6-829c-4128-27b3-08dd0aaac7b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 04:04:36.7371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uu2q+t5yCXDxgeBGc/I4MeryV0m5bQQDXG4gkSSHaTynNzWmsnrsc9spUAgBCOgsWicsMjXDhfUwdVvZXZmZ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6692
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Thursday, November 21, 2024 11:17 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Handle scenario where ref a=
nd
> new cdclk is same
>=20
> There are couple of issues with the mode-transition-all-outputs subtest.
> Firstly, test should execute only if we have minimun of 2 connected outpu=
ts.
> Secondly, if hdisplay and vdisplay of highest and lowest modes are same f=
or an
> output, don't consider that output. Both these issues are addressed here.
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1887
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/intel/kms_cdclk.c | 67 +++++++++++++++++++++++++----------------
>  1 file changed, 41 insertions(+), 26 deletions(-)
>=20
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c index
> 382b3e9d1..61d73c8c6 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -54,6 +54,7 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling
> and squashing");
>  #define VDISPLAY_4K	2160
>  #define VREFRESH	60
>  #define MAX_CDCLK_4K	307200
> +#define DISPLAY_COUNT	2
>=20
>  /* Test flags */
>  enum {
> @@ -274,83 +275,97 @@ static void
> test_mode_transition_on_all_outputs(data_t *data)
>  	igt_display_t *display =3D &data->display;
>  	int debugfs_fd =3D data->debugfs_fd;
>  	drmModeModeInfo *mode, *mode_hi, *mode_lo;
> +	igt_output_t *valid_outputs[IGT_MAX_PIPES];
>  	igt_output_t *output;
> -	int valid_outputs =3D 0;
> +	int count =3D 0;
>  	int cdclk_ref, cdclk_new;
>  	uint16_t width =3D 0, height =3D 0;
>  	struct igt_fb fb;
>  	igt_pipe_t *pipe;
>  	igt_plane_t *plane;
> -	int i =3D 0, j =3D 0;
> +	int i =3D 0, j =3D 0, k =3D 0;
>=20
>  	do_cleanup_display(display);
>  	igt_display_reset(display);
>=20
> -	for_each_connected_output(&data->display, output)
> -		valid_outputs++;
> -
> -	i =3D 0;
> -	for_each_connected_output(display, output) {
> +	for_each_connected_output(&data->display, output) {
>  		mode =3D igt_output_get_mode(output);
>  		igt_assert(mode);
>=20
> +		mode_hi =3D get_highres_mode(output);
> +		igt_require(mode_hi !=3D NULL);
> +
> +		mode_lo =3D get_lowres_mode(output);
> +
> +		if (mode_hi->hdisplay =3D=3D mode_lo->hdisplay && mode_hi-
> >vdisplay =3D=3D mode_lo->vdisplay) {
> +		      igt_debug("Highest and lowest mode resolutions are same;
> no transition\n");
> +		      continue;
> +		}
> +
> +		valid_outputs[count++] =3D output;
> +	}
> +
> +	igt_skip_on_f(count < DISPLAY_COUNT,
> +		      "Valid outputs (%d) should be equal or greater than %d\n",
> +count, DISPLAY_COUNT);
> +
> +	for (i =3D 0; i < count; i++) {
> +		mode =3D igt_output_get_mode(valid_outputs[i]);
> +		igt_assert(mode);
> +
>  		width =3D max(width, mode->hdisplay);
>  		height =3D max(height, mode->vdisplay);
>=20
> -		mode_hi =3D get_highres_mode(output);
> +		mode_hi =3D get_highres_mode(valid_outputs[i]);
>  		igt_require(mode_hi !=3D NULL);
>=20
> -		igt_output_set_pipe(output, i);
> -		igt_output_override_mode(output, mode_hi);
> -		i++;
> +		igt_output_set_pipe(valid_outputs[i], i);
> +		igt_output_override_mode(valid_outputs[i], mode_hi);
>  	}
> +
>  	igt_require(intel_pipe_output_combo_valid(display));
>  	igt_display_reset(display);
>=20
>  	igt_create_pattern_fb(data->drm_fd, width, height,
> DRM_FORMAT_XRGB8888,
>  			      DRM_FORMAT_MOD_LINEAR, &fb);
> -	i =3D 0;
> -	for_each_connected_output(display, output) {
> -		pipe =3D &display->pipes[i];
> +
> +	for (k =3D 0; k < count; k++) {
> +		pipe =3D &display->pipes[k];
>  		plane =3D igt_pipe_get_plane_type(pipe,
> DRM_PLANE_TYPE_PRIMARY);
>=20
>  		mode =3D NULL;
>=20
> -		igt_output_set_pipe(output, i);
> -		mode =3D igt_output_get_mode(output);
> +		igt_output_set_pipe(valid_outputs[k], k);
> +		mode =3D igt_output_get_mode(valid_outputs[k]);
>  		igt_assert(mode);
>=20
> -		mode_lo =3D get_lowres_mode(output);
> +		mode_lo =3D get_lowres_mode(valid_outputs[k]);
>=20
> -		igt_output_override_mode(output, mode_lo);
> +		igt_output_override_mode(valid_outputs[k], mode_lo);
>  		igt_plane_set_fb(plane, &fb);
>  		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo-
> >vdisplay);
>  		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo-
> >vdisplay);
> -		i++;
>  	}
>=20
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  	cdclk_ref =3D get_current_cdclk_freq(debugfs_fd);
>=20
> -	j =3D 0;
> -	for_each_connected_output(display, output) {
> +	for (j =3D 0; j < count; j++) {
>  		pipe =3D &display->pipes[j];
>  		plane =3D igt_pipe_get_plane_type(pipe,
> DRM_PLANE_TYPE_PRIMARY);
>=20
>  		mode =3D NULL;
>=20
> -		igt_output_set_pipe(output, j);
> -		mode =3D igt_output_get_mode(output);
> +		igt_output_set_pipe(valid_outputs[j], j);
> +		mode =3D igt_output_get_mode(valid_outputs[j]);
>  		igt_assert(mode);
>=20
> -		mode_hi =3D get_highres_mode(output);
> +		mode_hi =3D get_highres_mode(valid_outputs[j]);
>  		igt_require(mode_hi !=3D NULL);
>=20
> -		igt_output_override_mode(output, mode_hi);
> +		igt_output_override_mode(valid_outputs[j], mode_hi);
>  		igt_plane_set_fb(plane, &fb);
>  		igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi-
> >vdisplay);
>  		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi-
> >vdisplay);
> -		j++;
>  	}
>=20
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> --
> 2.25.1

