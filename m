Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D39CCD185
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 07:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6584B10E276;
	Wed, 15 Oct 2025 07:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpzAJngb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E523310E276
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760512910; x=1792048910;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zEC90YG1SdWAIdBu1yzyyeuJywcQLJkbKdUfeEQCxws=;
 b=HpzAJngbcwRN7hHsFaQ7LCLjwLJKA5Va1BJCUvkxAkfe0sFFC5JC2eJx
 4LWhkh0AdJ+Cops6iLoVLBrM7HKEm/BVGUuzOb7VzGEXARdCCnG18KicI
 hsmEukWGrO/6Wxvx/JpByGjxyNFsfI88cBkidDYfPRSjqeW2Bfr3gqb/N
 VUT6z4Dn1GOFQnApIzNnME7hv9kJc205UR3gfEaVSEOhb2F6WMnuS5FyQ
 c24N3K7IFu7lff2anxoLempUr0Nk7gUpdoALnfQb6OqPgVjpyswYOckc5
 qHo1y0mW1Nzrzm8G55XU6Tt+c30UBsPml8ZR0rYVTHHQkJfUTMDJhqQUO Q==;
X-CSE-ConnectionGUID: /tTE38UeRFKIE8JvIvGKig==
X-CSE-MsgGUID: FyLxgNB8TUC2ZQu7b+ng6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62716884"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62716884"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:21:49 -0700
X-CSE-ConnectionGUID: Sfn5+haZQ8KcHg/Pg88AOQ==
X-CSE-MsgGUID: eoPNtkIeR0yS4BuCwAZRHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="205796722"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:21:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:21:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 00:21:48 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:21:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWA+bXT7dOSJrYqzMM5hkmU/SgCpBs4JzcGIHgEbP2+x03rjMGlaK7XZSs43+EJBWuG4aJUEMgg5PKAdk/udYTeH10tWu3q4nBbFrLCUtegMjjafAy5hHfcP99eQ5M83wm96u2cS7hbuPSkN9mydyxWG1zcgsHOlFrQk/3O7v+DiMovVk3U3wSwApZb4D3wy2WX/TF2frTrSZ8Yfxe+mmaCGJTivy8KKeoh4lkCaA9eGVzPW8bFsP+wk3vFzZFTVCkk2WsBIvdIgbsHxU+8LeNcVi69kLqGdheEbhibS/oOXp0m4DRqZ3CvvZHNBptTd/3FzmeJEtTfsFmU0Us0/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvggzr0gVNdU4J9EyxEMDIquYaXrSja4m8lfzeZ2UeA=;
 b=vYGstj19+Z/t94IOV00X2IcLg7XCfGpd9fazsYrkV5r3Nnu4dGluFTWeLDp5Of9qSUw0pyOxEEZTpwSgBa4z7G5MjQIxx6UblXAhsbmKvyHqgCdnVu6LM8fN9uNDZFIYwJj9Rt5ntL/6rgVh7sO3QOgDQNoKC6DirBb89Dol4+5hXD5eo9eqlOh1pWBSsd8LTMLiCrqJW3k7RYSTE7n+R/fOiZAR9LSmaiDop6WuBOOX66t0WNuobUCUsBK5y3H2uaMvoYzLnOH0+mo6gaqEORu58BaehV3NdY6QLHlmpxoabP090vl0FDXagZhTAH2BNHde9YOde16CeJSgknlqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 07:21:46 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 07:21:46 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v3 1/2] tests/kms_vrr: Dynamically verify LOBF
 across vrefresh steps
Thread-Topic: [PATCH i-g-t v3 1/2] tests/kms_vrr: Dynamically verify LOBF
 across vrefresh steps
Thread-Index: AQHcPZ0ZHJg4h0e330WrgOCjeSEUjLTCzRlA
Date: Wed, 15 Oct 2025 07:21:46 +0000
Message-ID: <DM4PR11MB6312764C6B5D00900F07F47590E8A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251015062922.447336-1-ramanaidu.naladala@intel.com>
 <20251015062922.447336-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20251015062922.447336-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA3PR11MB7433:EE_
x-ms-office365-filtering-correlation-id: 323582ff-4166-4809-ba4a-08de0bbb8016
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YDJin7N7StBG2GowEmQms/jDpZ4vhTfm3pUSbDOHN6AJAD1Lls5QF+y+pPje?=
 =?us-ascii?Q?OAyQbyOHeHw8zuGfqXlXpT67NBnVd0PptGlyn3EyipEfuLLnSZmPQWtnRis2?=
 =?us-ascii?Q?tg8Agic5v2SEvldS175ZKBz5p/qYwLWcn1dlSGQT0dJJ7U5lKQpjIvncMwFD?=
 =?us-ascii?Q?TLV/Jc3uG0IrJWW9dZ7/nryxjgiuZmeEs65x0vo0125pvwUPw0XDkiDLUOVL?=
 =?us-ascii?Q?8wsPUE6T187X4M2+N4VrcI9EL/ZaG+5fMetuyyAvQqUnHGwJJI4TFABCJhZj?=
 =?us-ascii?Q?p876sX65TEHMqoNTkd8iV13SWOltzgnN6wxR6ZLugSBxeq/1+OkfFNbY+X49?=
 =?us-ascii?Q?KkTqLL7l/52igjaRh+kAx4FuXGUuaQiamlcWPu5nimRL2A4n6Ra58Hjt2atY?=
 =?us-ascii?Q?PsNrp6SsZ3msKY4z9cC2N6aIxl1I8aT95BQNFT91i/FWi+3xB49QA0klBZyo?=
 =?us-ascii?Q?AK2czr/HZuRd5YYd//L9tkL2racMLl9R4TEyGVdBPZkSfQPXeruF/T6wm5yX?=
 =?us-ascii?Q?XfN5mHo21WtEGcmxKHyGB8K2DX37ewzKqiz8WLzGgZSWvJtLI/6f0Tccbzt2?=
 =?us-ascii?Q?5T395irtGXndyiNR2m+CF+oyOP95AiMBLZ1LYiWRluqm7EAWrcqrwNDIJ9bE?=
 =?us-ascii?Q?J5GRHuKnxSxk3KufSgL1RDhiQnjPkOTdvrZwPc264mO+stn3lzQSX+WERgK3?=
 =?us-ascii?Q?qAfiJIk196Bua7SxvoCP7IYhRl68p6AyTbPv/JzS9W4LJbs4s1nSmxwdxB2Q?=
 =?us-ascii?Q?3JxBd3pxWtIPLdqVQw41f0eytvC2yGfOQ9zXGskwJRSjdWKx9jbxIR+DHJGO?=
 =?us-ascii?Q?Y4O1zFtdTdJdehdNN41kV0wGPDwJKM62NLzUDgE8DGibNUiMSdJ6bWiYkRQH?=
 =?us-ascii?Q?dZk+CYaY0nPSlsL1GSt4mytcblLEbePmfAFFM8ZR+3ZSixjdLY0JO2o1hFND?=
 =?us-ascii?Q?yEpZscLbU4ja5qCO8XbiCt5o/mXLAfJa9++1LaDgSs7V3nhYsi1k/Ovm61Yn?=
 =?us-ascii?Q?IeiZ7kLBdjkhUb8kADz5WjpKU+yKhN6+ASny5YML4kUV/RTyu0ZNq5vL3PZU?=
 =?us-ascii?Q?gK0YBnmsBLchMVkPp7eGBti9FPOD79OohOsaIiSNszLUe5j+VOwpKEKnPOpP?=
 =?us-ascii?Q?epQoaDnjnk5+mKTwSQ7n5Nhz93wkZ47t+R7xSWv3oqenESGP6uCU5nc6eXF7?=
 =?us-ascii?Q?JikgCkc+wlTkKxBc1pavbxFxZQF6fYlFuc0GaI8j0lUnu4FCA4LHgWYaUw56?=
 =?us-ascii?Q?aIA50XpYyrGc+F94gVybjt8jZ5pd9ueOQsdxZ+z5MUKhYh1qoO8aGLzWWxzk?=
 =?us-ascii?Q?17VfupHtGvzJDJR0OVwuP0hxtZPDdMmBqGEvc2s/l4hOuWCFVxTXtBtJZBPz?=
 =?us-ascii?Q?l4JWi9lQ2zVqz5DNYLWbeLLmeGTfjNfLEMaCQZFEuh4BL36AGZqi5rtY1eJj?=
 =?us-ascii?Q?Q1w5pFU9KYjQvGmi/BHSUpyxdxwMdOhGgWTDstdrwC2RiuTZYLOlAEHx8fQr?=
 =?us-ascii?Q?FwijcAUBqv3A/tc/VYObcUuOFi21XqViIIcd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?um5wi4VenwL1aEAgXQmtcNLDGpcvwOroyBQ0dhNOj5umt1t9bN4VlLXkT5na?=
 =?us-ascii?Q?G9Pgel5wQ9zC/g4KXPg7favjcrerehL52zxBjmLD0SwjJhScaEfH3+hTtFD1?=
 =?us-ascii?Q?8IndKXM9Uw8W8Uh61OjFl4SMufVgGrm4XFf46/bi+YwP9KN59ZMZ4QtJIk+4?=
 =?us-ascii?Q?zXdmgmd2tYC5IEU0Miud1gJPHCgOrgLB0zSMesF8b3r2L9b0abZACwaZYMmh?=
 =?us-ascii?Q?YAvzQSpmABu8+UsWnrdXVw9JHjstuRKFL0m3Fr5Sd3qnwL2bRM+IEg7Bq8Np?=
 =?us-ascii?Q?E4hBKMdTt8Ewlk6EmWv0AWVAjb2RjU53AC84/qsl0I+EpTYH/09b1yeABWPX?=
 =?us-ascii?Q?gMFmp4tbidiDwCqJriNSd6XHquUti1sfu6lLtibnzfY6w7nzyLHNKQ5M6KWB?=
 =?us-ascii?Q?F1YjSpm5VKNXNzXVIUe6OGSj45WSiZSXJAFikWVsPPY5i1NnXfZMUC4/w+2p?=
 =?us-ascii?Q?lgzyI/hRJxCOcdjZjLP/pOI1P7R+FxiyYj4SvxphckSN6srO3loikv/xpggF?=
 =?us-ascii?Q?NU8bRRnoGWZpNdzXFsa0ATx6sFKB/c0GwzmSN9dxcf7CeRKqq5coL+9thWAI?=
 =?us-ascii?Q?pT3gnA78OKc7C79SJXolLjXpq3qAhulDWO/P6xGmdM/ljhEL6geB9uuZLX9u?=
 =?us-ascii?Q?prUao/6y5a9jobEX/F7jJNaCguOegnepGbaDN8q0OB0GzNtVYrCGwNcrY3j8?=
 =?us-ascii?Q?Gr2fPh8Fi1x6vv3ooeRy8xNpQTD29tOoV1DeEAj0pnAtwUqyzTXyn7QU9fVh?=
 =?us-ascii?Q?HUtebrqXEz3Fa3cEWT4fa0si1C7Dy2nocw1YrIlvSXJACAVKVzQGTwMFsLrB?=
 =?us-ascii?Q?aOzaHdIcFtLfN712r104gywg2iBbBmVGTvQUuEOn/YORL0xV9B3Cn8Vpnz3Q?=
 =?us-ascii?Q?Prokpxur4sFPEd72BMZO3GQf2oZw8HRwutN4K5Xvv14EQRQgWlQ/lAF4gcBD?=
 =?us-ascii?Q?nAV1rqhMgkWSFKQ4esBV1CuuXINLDamJ+piGc9Vw1SM2xrmlHTi9tpzwGWL7?=
 =?us-ascii?Q?JxM/4+sP4LFYbLHG6QPMsocNI2mCP+/yS2pxjvfRbUpCnx90+KvVqNcEhlSK?=
 =?us-ascii?Q?Rw/8mAXkEt0yCFLRnsgRSCeK82i1oF/JZ33jUNwZUst679NX5vgmUNMosL/w?=
 =?us-ascii?Q?AkCo72fdUcm14bJX5oN1ECTAvUpkCelZhQB0JV08ot/R2Om4wNMKx8ckcEIK?=
 =?us-ascii?Q?gzn9B/ZX1sBQcwuBZAjof0nHOZc+68SO5lJvmGRNZQae8ntW/18/fxkR87ma?=
 =?us-ascii?Q?RzGE69+1T0CgiwJaGJB0WRQO/5A2/1iRVb5jcp/snXL++uVh/DNQd4Tx7lwV?=
 =?us-ascii?Q?k7FosFFa+3zglJ0t8JVzaVN4HhxUN5VXPaA/rdTiFVzcER+iCNR34FHSLIa0?=
 =?us-ascii?Q?C9bgQbZjyGtyzT82JAoVm57MXZGXwK8JecVY/FVqIWHebk075lBa6ZcIgMUZ?=
 =?us-ascii?Q?HI65+1rom9wevn9xMtJStS35KNNtxeC0zxHeyf7grZJJN4gMTHAf9zodm+4M?=
 =?us-ascii?Q?2ROqXfJeKUKufOqrQokC0+JM8P4+lNJiZYz404FjIe83w0kcwnqM/LwQUKif?=
 =?us-ascii?Q?9nXu8b+0A+ezWEh5U/E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 323582ff-4166-4809-ba4a-08de0bbb8016
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 07:21:46.8924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j88XeDFwBprOyD3vAj8PHMt2Ng5ki0r3At+DlL+EREewu4gmKfFJm/Z97KM+Y/MK+i9hWyNWLXU10HCR5x7sSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Wednesday, October 15, 2025 11:59 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v3 1/2] tests/kms_vrr: Dynamically verify LOBF acro=
ss
> vrefresh steps
>=20
> Replace the static LOBF check with iterative vrefresh stepping to detect =
LOBF
> enablement.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 704620a7d..1e4d9cdac
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -870,6 +870,8 @@ static void
>  test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t f=
lags)
> {
>  	uint64_t rate[] =3D {0};
> +	uint32_t step_size, vrefresh;
> +	bool lobf_enabled =3D false;
>=20
>  	rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
>  	prepare_test(data, output, pipe);
> @@ -879,11 +881,21 @@ test_lobf(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>=20
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
>  	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> -	igt_output_override_mode(output, &data-
> >switch_modes[LOW_RR_MODE]);
> -	rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[LOW_RR_MODE].vrefresh);
> -	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
> -	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output-
> >name),
> -		     "LOBF not enabled\n");
> +
> +	step_size =3D (data->range.max - data->range.min) / 5;
If max and min diff is less than 5 or equal to 0 this might enter into infi=
nite loop can we handle this scenario?
We need to still run once for the above case and then fail or skip based on=
 the result.=20

> +
> +	for (vrefresh =3D data->range.max - step_size;
> +	     vrefresh >=3D data->range.min; vrefresh -=3D step_size) {
> +		rate[0] =3D igt_kms_frame_time_from_vrefresh(vrefresh);
> +		flip_and_measure(data, output, pipe, rate, 1,
> NSECS_PER_SEC);
> +
> +		if (igt_get_i915_edp_lobf_status(data->drm_fd, output-
> >name)) {
> +			lobf_enabled =3D true;
> +			break;
> +		}
> +	}
> +
> +	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>  }
>=20
>  static void
> --
> 2.43.0

