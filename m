Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5920ACFA761
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 09:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1C110E806;
	Fri, 21 Nov 2025 09:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRIz1A0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2735C10E806
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 09:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763717466; x=1795253466;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1s9NF1nvUkGV/Znl5lo2nG3kPFbOMGZCJerXJoExXFw=;
 b=ZRIz1A0Bf9PEnZoiyIUbbKV85QDEeO51s3EeUAMaShPlqJ0c+ieCM6EG
 7kWsW2e00+P6rntDyPHkIu/D7UCyfnzW4CjEPDxOHawbBusNNzW+ulRld
 CbwrSe7rjD8dp0K7OqIFQmq6D5AC/m/IQXO1/STRrkz3bgKkEGrk2gmD2
 Lut/maKWcEhskrXA+3M+aYXREF0oE6IBlRCfwJEog+7AVGLnjiGkKRCOV
 iV3dMcNaZxtH6wK/JFuWoNVBreLxNccCZrEHAKJCd2yUrLvUQj7FuB2w0
 wLCsKanPh5fao9ORd2QU6JKTnGfDmBZUiyXjt87OhcJLwNtwborElcI/I A==;
X-CSE-ConnectionGUID: MjbDQ1+KRQi9b1ejwMdD8g==
X-CSE-MsgGUID: k8nr0CZgQouxSEYtnRVX+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65752701"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65752701"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:31:03 -0800
X-CSE-ConnectionGUID: 0A7U2ntjRHm2TEnX8+TCFA==
X-CSE-MsgGUID: uUhtkfaVRoSze/ewIPpzgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="192097780"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:31:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:31:02 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 01:31:02 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:31:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMG2FgVEOzjLsFy4zJjBJ/MvWjYOLjE1FCy7qEYqH1IFPYtGew3ObLy4L0gGXn7ZwZIwz+uh4u7Cl/uo1mQGTPbgYsHLL1qEwaN92LEt+egdSBhC58Oaz0ZnIMI6EUQXrBV9CCSTwkGGF37queypYfW77tidx/GhGUnGXXs+6kZVFNOPIQcIANyeSt6Mam6R4ly17TUFYAk16lxM4g0J8NyQAFhAewopjhQFeAPqiobL9aN7264i/PP8T7GV6Jj4BZ4oMGcWhXpCvlrfR5tNmVUcnqTjAX6SSijtVBmT8tQ/xUS5cI4Iihfna132MJxMNKft1Ri5Ne3haA2joLEfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=po1DzdC6s5BWx4annJmtERTVqCHGAjhvz/uwGcQ0DNU=;
 b=N9Q2lUMEIYlbvKVUVJ9VUau7wUHNCP1aE1/WdKpwErUEztxY5TpmbrbXZ4KEFOwGXmH6gXFjIRk4bJ2dkfxzAXIaHb+TH0WYrAtAOlZhDO2/H8KsWdBSk9A/r1BI2ZguRqikaHjCOwsnqDWKVhJNYQnSz7rw2dTUfpTcg9Y3ToUTRxQxsuSNTzf836CsT2G5voYXHjcHF1PPg1RXzI74h7YLQxwsRTZvRFf//xqNS/Xq9YwkSjka00i9IhMnAS1MWeER7bdeCiU9jPuGob0b9UODkDBu3V/lSFyEwZub4g00z2/GcAsd+9Ig8IijoLyIyWqzc/z2ddCfI08RyW2MSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ2PR11MB7476.namprd11.prod.outlook.com
 (2603:10b6:a03:4c4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 09:30:55 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 09:30:55 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 12/12] tests/kms_writeback: Refactored
 writeback-pixel-format
Thread-Topic: [PATCH i-g-t v3 12/12] tests/kms_writeback: Refactored
 writeback-pixel-format
Thread-Index: AQHcWql6f7iXfrNp+kCbhFWwxmzv+7T83T7Q
Date: Fri, 21 Nov 2025 09:30:54 +0000
Message-ID: <DM3PPF208195D8D336A3D7CE151C949B9C2E3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-13-sowmiya.s@intel.com>
In-Reply-To: <20251121055839.3116906-13-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ2PR11MB7476:EE_
x-ms-office365-filtering-correlation-id: 14fd35d5-29b2-4368-5174-08de28e0ab93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?yxHv3ACyHh1UTYsbT7Z/NzKGE6MWI8oc2QImpu9gwKchAjtMKIe4+3OyyxE0?=
 =?us-ascii?Q?FP8c12WIIsT3jvhy6vUzVhv7pfZeJ4X330kkrdPTh1bE1nwZ8OufAMGjSV7p?=
 =?us-ascii?Q?i+TonpP9l1c/+6ga6/dkAOucl+Mx4XVM3P+h99WC255PIcrTNZog6abTBM8h?=
 =?us-ascii?Q?iH+Gf5TJKfyveeu5vsitn8rvSMbBS/2OWkAVbfOU8/RnjS6FvqN/rpmv0gJ8?=
 =?us-ascii?Q?935opMGgXNnbLuWHmv8j3HDVI4HXToNb/UxLTTrx/BL3xxlTGM6dXqP3MwSX?=
 =?us-ascii?Q?kHLEXj8K/bJJG9HfHFZ7gfcjL3/KVfNgh/Fr/XmJnoDC73ho+f7brLMgP4Gt?=
 =?us-ascii?Q?aVc7AQHb989qTxKF8x6n2+cpududmdxDqjA8+NOsjzxbI6nHqFOeH3P1bAhf?=
 =?us-ascii?Q?qPQRsux1SdhfGB2rSgA/aekKU2RzCch4O2nmxxYl/mC5B2hG334olCzWIB/f?=
 =?us-ascii?Q?cJbMu5EeTxcribNDXC7OI2ik6H5IN/xJaheWpLH0yShze3ejWUceLPJlBk6E?=
 =?us-ascii?Q?MT3uAQYX5twOaiZ7vNDL8ee0WgVP+4cmrr6HgOqGGdKNDRn7ez83M0vFrntk?=
 =?us-ascii?Q?7m/E9Y20OX0oxgTm6RiDt/6BXN/F+7A3Zhu9dkPSkbsFVjWdiNd1+8T21/zZ?=
 =?us-ascii?Q?s1aHFX6YaDHfzlj9Rknlmq6DsbM4Ql9jo2OzF49BRuU8JrnHLQNFXpDdJss3?=
 =?us-ascii?Q?ONsMFoqpPQqfQPcLo5PVAggmFthZZWQH9ybukg8+bK7AhS+1BdiGMZ2KVLLx?=
 =?us-ascii?Q?SbqwN9Vl8+OK3YKI6MDrpyxr/mYTivKbqH7NnL1Sml0gWiOfC2IUPGd3rSNZ?=
 =?us-ascii?Q?YzCdQT78z4mmU6YalUct3/e8IR5+4ULmG9+ZAaqw3Eicp3/jZLuaiytpWeVg?=
 =?us-ascii?Q?lF4H1rkypp6E/rVxCQ+K0zjfk/3YHm0Bqt0MOfqFyIXNRN+epAzAbW7tPVjs?=
 =?us-ascii?Q?YqnSgaQN1eu59yCPKM0lPhFGEpImPr0kblFXUzdh/FFpvFhhEv8HuypbzhQG?=
 =?us-ascii?Q?ujKs9oDESJ1yhuIm0tnyIkSZzWrAGvJrv809JEbZqNjW9ozYCCHKtuCcHstP?=
 =?us-ascii?Q?W0bQrmEj1WG7LSmdjj4VhTOIHWPy6x5Uu9Al3f7timd1L8BN7iv4cXNSB6NU?=
 =?us-ascii?Q?Z0IdRzbaFZnLrV/fFgg7mm8SgLmPoxd3J2WiPkj8DdACacVEkqX3FpgLUFTS?=
 =?us-ascii?Q?DVGisgo7gn3VB76xH44O3Bh3Uc87uoUHOGV3lIoel7QblLm202sPqkW8aowt?=
 =?us-ascii?Q?L2FDLL7NsZ32HrNTSWxR3ny7N+dGBAaW4KIX6LnbJO3exGlusiaR0eoOkwgh?=
 =?us-ascii?Q?cBDq1CQQ1++68SKy60KaOCCn0aNuSlVV1W6gJXbxnMoahjcYu6Mcm5lVaP74?=
 =?us-ascii?Q?Kt15EWv7LScdYX89bZ+DveBYSXRFUB2Fw5DfEX50H0tt6HlABrv/DBj6O4KQ?=
 =?us-ascii?Q?GQEjcjtHqTQtlGJqv+TbnJs/1pYxN3B29ZOKPKha6kmJKhowFBhcCS31njEx?=
 =?us-ascii?Q?nCu7Qy33yFQjhDWXyb3ofYcfqey2ahgIji9j?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UTPbyWMbaUgqAUqGrTwS7EURJMmUGsxka7YZGfHFEt/O1u4ev1XZsWwL0lUS?=
 =?us-ascii?Q?N3ZT0UagwDDgApQGmopj+kbtdCKUtdWWmKG8Ew8aYysITcSrNgl+xqHQycSo?=
 =?us-ascii?Q?3U+q1r28+5OdB6B87BTIm3pLcLB4+fHosiqOkv6X78gpekWwZCLeIP1PHEZd?=
 =?us-ascii?Q?2uNCDtoRDvqqBwH1m+0W9UtbAjNq+9xxTljaPD5D9gEmVb4Pmtb6b0x4s335?=
 =?us-ascii?Q?0mNFudM7e+c7AdrM1WQcgv7EQ9dWsFbRRn5E9HAiVM4MCGcbSX4mYiumEapJ?=
 =?us-ascii?Q?bzBv8g/Ap/AfLoYrV31NM+mAdspEqMrlhbucDHT1Yp22rgbnHBn6jJsMVZI0?=
 =?us-ascii?Q?7CkTnX4evVIhBvjEaJpD7v4OX0uR3JvBDyZJKUg0uVD4dYz8l70jSbEQQsv5?=
 =?us-ascii?Q?zjdXE4VEWRL15DHQ+B3Q/ojFIC4J2IIpdeQMJW+l4SJPHz86Va6OLhUwN/+0?=
 =?us-ascii?Q?WPlMT2/eDFJeEItKlaW+XlGRw+CfcoTGSFXsL8N0v51JNePTQ+/lCEN2YyzB?=
 =?us-ascii?Q?MW6EqaQdmUIjQ+ZmkCld6YpVF4WKuB2P5e+7Wjg8+qISOt52fjT3hzy4/mpF?=
 =?us-ascii?Q?xY1noWfgqni1pZcHHhyv9GEQE+uVMxdGMWHn8PZw8yJBBLDxtTCCGlV3m16u?=
 =?us-ascii?Q?SL2UttKf1d9PyKuz7A8MvTLx+98PpxgnXxmoG14aiVmbqaGQcEnlREdGEuuE?=
 =?us-ascii?Q?Vh2koDvlN0rEy5bePULx5sWv+eEwin9dRitiTOpp3rQZ/J6odqFb/K1xyZyi?=
 =?us-ascii?Q?NjYkXGF3BmtYhSDamO7ODFum+TQyMqgFp8UHGEhbxFYQzSFm3aqYdb/cHaZD?=
 =?us-ascii?Q?AakoLT4vrcqfQK5xZIeMe8ToTuegB0BA+tRbj872ZVaYNvOPLdWe6LgeQvCN?=
 =?us-ascii?Q?8KMON9MgHDE/fuY2y0I3MrDJtmQY7TIC3+Hz+P0S3in3CSdLNae9a+OlSF6W?=
 =?us-ascii?Q?He91opMy3WDrO7GOjzDns1qwqkHxbO+lWBo578LVzxm60azs7ny0skmXQcq9?=
 =?us-ascii?Q?ylipcS2wNlaTx1N72+7ebDgF/4JlfDhxAmwmJvJAlYu4ZDqai8VNogUWcZ4X?=
 =?us-ascii?Q?WRAL56sZI+pNsgN2yxnQVCJQc3JNC1K9OWGJ0HVgY6Ta81yQBhO8ZakYZVb5?=
 =?us-ascii?Q?ZPR97B/jlaYZmwaUcWf+BeEXf3CxnUj8HIAgdzN6Rgp8+cF10lh92wy8QFbH?=
 =?us-ascii?Q?7zQTfr3fqb9JYPEfnsdsjmYaX6IBtQXZEnYiX1uktPhP68YBq+B6r+sklFy4?=
 =?us-ascii?Q?TvmjFAWGlfXR7L8Fbm9xXO5HSnBBaawx47+Kf7NCK6gjvhgR0sXO/T86niFi?=
 =?us-ascii?Q?QIpU+MUPbhqOwA3kodbMWYs1l/uCiFGvVi9fYW3Vbkjznm5naOVg5UBy2LY+?=
 =?us-ascii?Q?BhndBOpJ6/Rak4C+CzgTm//XYhWeWa66swuAtKYEHiHosp8b+PgcVymlXucQ?=
 =?us-ascii?Q?7Yjtqm/4t/r8JOixSIVU3udO/MiG8ZAZEHBWItHqJWOpjqfkXEPWZi59MRnp?=
 =?us-ascii?Q?teRDhbgJAfIrlyIhe35qgNgXIRthj8OcgvfKqhKLFxrNU5cRP2JCwJSvCsvh?=
 =?us-ascii?Q?9KgP+SoIzxnwjFRzy1xFYzSx/a203n5CPfD5I9O9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fd35d5-29b2-4368-5174-08de28e0ab93
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 09:30:54.9438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AeN1QEjvOcDMrhNhbcvg9hSWpwgX/R6GpsrRf8Bt4tScfb5i/FgJ7+jdkr/Ux9wm73UYUbubzvea+teG9QcPug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7476
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

> Subject: [PATCH i-g-t v3 12/12] tests/kms_writeback: Refactored writeback=
-
> pixel-format
>=20
> Refactored the writeback-pixel-format subtest to verify the supported lis=
t of
> format against kernel
>=20

This is wrong.
Before this we used to get format blob for property but now igt is dictatin=
g that
Every H/w has to support one of the 4 formats.=20
Anyways this patch too needs to be dropped the current implementation seems=
 more sane.

Regards,
Suraj Kandpal

> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 98fcf8a52..aaced0f57 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -691,26 +691,34 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  	igt_describe("Check the writeback format");
>  	igt_subtest("writeback-pixel-formats") {
>  		unsigned int i;
> -		char *c;
>  		drmModePropertyBlobRes *formats_blob;
> -		const char *valid_chars;
> +		uint32_t format;
> +		int count =3D 0;
>=20
>  		igt_skip_on(data.dump_check || data.list_modes);
>  		formats_blob =3D igt_get_writeback_formats_blob(output);
>  		igt_assert_f(formats_blob, "No writeback pixel formats\n");
> -		valid_chars =3D "01234568 ABCGNRUVXY";
>=20
>  		/*
> -		 * We don't have a comprehensive list of formats, so just check
> -		 * that the blob length is sensible and that it doesn't contain
> -		 * any outlandish characters
> +		 * We have a comprehensive list of formats(fourcc) and verify
> +		 * how many of them match the format blob, validating them
> +		 * against supported_colors.
>  		 */
>  		igt_assert(!(formats_blob->length % 4));
> -		c =3D formats_blob->data;
> -		for (i =3D 0; i < formats_blob->length; i++)
> -			igt_assert_f(strchr(valid_chars, c[i]),
> -				     "Unexpected character %c\n", c[i]);
> +		for (i =3D 0; i < formats_blob->length; i++) {
> +			format =3D ((uint32_t *)formats_blob->data)[i];
> +			if (format =3D=3D 0 || strcmp(igt_format_str(format),
> "invalid") =3D=3D 0)
> +				continue;
> +			for (int j =3D 0; j < ARRAY_SIZE(fourcc); j++) {
> +				if (format =3D=3D fourcc[j]) {
> +					count++;
> +					break;
> +				}
> +			}
> +		}
>  		drmModeFreePropertyBlob(formats_blob);
> +		igt_assert_f(count =3D=3D
> __builtin_popcount(data.supported_colors),
> +			     "writeback pixel formats mismatch\n");
>  	}
>=20
>  	igt_describe("Writeback has a couple of parameters linked together"
> --
> 2.43.0

