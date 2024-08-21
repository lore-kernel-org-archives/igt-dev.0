Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A210FC52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 14:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4963510E653;
	Wed, 21 Aug 2024 14:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBCZeMw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E33310E653
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724251889; x=1755787889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2lM7YDc2xaYNJyzeHeEmIBZ9mXm0E2YzwQiknlIwcrI=;
 b=WBCZeMw6V6JPAt9AeYewwJiQttq8W24HBNv2PPAtaYzfqZWE8x7soFZv
 rRc/lYMV2rO2W4mfz/DPY6nDYkyvmi1fkWLM102Gh2kP7UaHK63ppuliH
 uhCSy80pLrT/UitXFCrPrauWQ5sci6cZesBrobXjdZFmuSLBmGKhQ6wrI
 rumdB8dP5W8E+dbhq6Ln+zk+uHrvUMSwny2HQbhA0OE8VOyTuVT42SLNk
 282PryyW2bEvthI87NLO1+EwJVsLLBKP1jE9ayc6sfVOzXWdvVYr+44rn
 YCxszGYPd6tvcx7nEvYtmJSfx1WQuYH+gVNBj/yKsFIwkD1fyaUX7V+KG w==;
X-CSE-ConnectionGUID: YDC8vhD3Tyqc8c7qooMBGg==
X-CSE-MsgGUID: 8Ws7nSyrTwOBqvCmlGN4Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="48007494"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="48007494"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:51:28 -0700
X-CSE-ConnectionGUID: 1jK/eoOFQQCnvvXnXZEz2g==
X-CSE-MsgGUID: ic1NOo3uRLCT9RmUEI+D3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61096398"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 07:51:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 07:51:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 07:51:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 07:51:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 07:51:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovD2gmeo2z/CnZZdmF86jJOMdMgLuyzmY0VvZcvQHTZh6zOkay+ZFmrXhq+ttRMsaFe5gGjEqRJ+7ZHK6ReJqmUAfdnfAFTY+lBwMG2Jam1E76MmcCoTQh4gBg+b3W4lWqJw9SYxwQb4uhnYEtrYICJCZZfrXUjVSF/chTHqXNgJahNctXnOKNGm/yS0aopy8RgKxB9gR7kMyyNXhDV9Z9V2GPMHg7MykprzyBLmLydvDFSBi426SeZ9YYZsDWyVx1836ORrjcjx3ucqzroavvfrCWZL+AdFxzEgFnPofc3z6JzH6rFvEe2VCUw+ETXCoS1yNYvk7xw6zqZtPpjb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUbe5HchTWxhJnFeLp9og4H6Uz9c84QUAbLwFilDpN0=;
 b=cuTl9fMlhvs0r1QbUYBt28A8n6uLIzEVFP+15pLkSlIyoowevdSvTO7OcA+6K0rxc45POgb0XlNs3OF9L10/jsApCk9dChaRKwleweaApzWbaC1LI+a19n5bW4VPrXXLFeotbXss5wKNKFfKvaXXZAetOI79EzWifRBTlZ7oE1QT3xnB0WLDuuoaj3kMdo4Jjrk44YmtmuynCW2U8hngVBl2DE26I5KdNd8E1wQ9LIXiblZxFD1PsalS/L6eRvHFQhCwOEUj75k0jPRwyOXv62htkIBc4AQ5t/i04hKU6D2dujh8P8ad8A0ZsIeZQpogUW8o2oqli9YaMTk91MmY6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 14:51:22 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 14:51:22 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t 1/5] tests/kms_content_protection: Move HDCP output
 checks earlier
Thread-Topic: [PATCH i-g-t 1/5] tests/kms_content_protection: Move HDCP output
 checks earlier
Thread-Index: AQHa8tkX5GkmVwKt9ki/8HfhwkMwQ7IxzWMQ
Date: Wed, 21 Aug 2024 14:51:22 +0000
Message-ID: <DM4PR11MB6312751266F8C90265E40716908E2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240820081233.4092203-1-suraj.kandpal@intel.com>
 <20240820081233.4092203-2-suraj.kandpal@intel.com>
In-Reply-To: <20240820081233.4092203-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MN6PR11MB8242:EE_
x-ms-office365-filtering-correlation-id: 937020e0-e370-4058-fda6-08dcc1f0b913
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?s0WbYbdkpirsvgy7kCdLqBQ/hC2XgjcuMRtA1GY3TqFII6snZ/ODKO7iGsS9?=
 =?us-ascii?Q?Ogoq/liPCf0y5i2n6hva/uqX5ZiHPUtXGmTQAIyYD2NrzEbWHS2c/nxhk6/J?=
 =?us-ascii?Q?WyaHd9w7jIqH6TDcbo8E4jk9aHC39X5JD2iup+RRcyToQlEzQMBRe2U0R/pI?=
 =?us-ascii?Q?/LsWM/iw3c+DV575AuBC8jIuYSnM6EHR4lr1hGLYybRCJ0ImSwNwaJmO7XwA?=
 =?us-ascii?Q?GVqbR69Yt9baIjZ6OG/oFjojHzPf09N4OmdWmswCBffBEtahU6ons4MAwb6z?=
 =?us-ascii?Q?2VTB/3WZLoexx4w0Sh9DyNAF9HLX7szf2W/swgl46cu2hB6bjQm+fmahKpEt?=
 =?us-ascii?Q?eUWL0dH6EFssiPzxuKv5+MlVWQ+3AjRtUyUwrXu1W73TVcTksjEfJdXlernT?=
 =?us-ascii?Q?vR/c3BszOe/SadtXB/v1iz9cTjXbQXdddceLrXL9eye11GRTP/nSPF99qoWM?=
 =?us-ascii?Q?DXd3ozreANJTKR9/7ircfqdeXbQNeXOwHvAm03HGxRZpc1EnwwWvpwxx3Bly?=
 =?us-ascii?Q?5DaT1KkjnpxaI3EK8F7RkEdNviPqY7CFj4hV4s1mZ3aLajoHowoVoh1M60Cg?=
 =?us-ascii?Q?ltmRGCdsaaW+ixX0n8lfVJl1L92Q6nMtDc3uqTujdTJf3TH8LwfeISKcoRYj?=
 =?us-ascii?Q?9iTLO0RxxTycD91sBOvWAg2rYSDy/cXvKsfj2ZAMen8J4LxS6S8sGmrl4A3m?=
 =?us-ascii?Q?2uNy8PVTq90wkhoX8RTxO2PIOtDYZb9+X0N5EAiTy2QoVtILr25w8DjZjS75?=
 =?us-ascii?Q?3BevKMn9tvElL93EeChRCrXbv1Y05S++2CKlyXjJBvdPZwTVMF8oAiVLwbbk?=
 =?us-ascii?Q?zzrG5hz0yfXlxv775d6Tol/I23sPgi/pHZ8n47rrBYEus14VvPMYPUMALtLA?=
 =?us-ascii?Q?dnPXpqz4ggtEI7T6EKcLhKbWFN5HwHTUIWIsrJR7Y+XUKlXBWuDrBwumMORD?=
 =?us-ascii?Q?iWhJjpb0njx5Oc4/nsoGhiq7kaiRCxMrBnv54B603jcpFY1Fzg5ahPl2MIpc?=
 =?us-ascii?Q?ym37pvrzlhV5rZmRTYjtQwetw3UocSJCqdE4QjmOKZiQQ8YyIhkTHuMqcFhf?=
 =?us-ascii?Q?ImlndL6JbcATeDNfkzEsdPUkeEz6BFj2Ed5BmJqEm9JBe9nuFw7bk0x4tZJc?=
 =?us-ascii?Q?UJFub0SEAUAN9IQG/vweiLgORYWVHgjP8ZwlrxmQbcaBEsYGhzz9NaJ+BPiC?=
 =?us-ascii?Q?r//LiRss/bOp922UPcc1cyTMvOXodjGvef8MV0cfSLo2Ew3KvcNtzM+ggLbk?=
 =?us-ascii?Q?oXKg5YnW9hWT55n0XXaK1jDD7UkqVOd8EU2nNTBnv1nuZHdXUUFx89d32E7H?=
 =?us-ascii?Q?qvoztMT6H/lPQtfa1GejFNsiqO98RJ0rqf6DIevlaQV/z6APdoyhvep3IDi3?=
 =?us-ascii?Q?wrrFKYEnUOxm8UtqQGiI0Kq1ph+D9VDJs17UpjYyTeOG3nIJ/Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VWlcJCPBp/0cYZXAVJzv6C6t5rKQND6Ux5mAZeFAaeBKcBNP2d+P6/2+4eD8?=
 =?us-ascii?Q?ZUvN65uuAbAHSSiuMM5+TLq5DOhTgCFdAl9Q68oDxyOLD4irsut3OyigNVDj?=
 =?us-ascii?Q?RZIPq490MG46HFZIzkE2yVNQHrQRRPE7eM7MGZ3R1sjOdKexUX2sUgLcdjqZ?=
 =?us-ascii?Q?v5BeaKzv/CIV4bB7LksboV50kwKF1tKm0P0rMr8jlFxFRu1gfQtkP213UaRV?=
 =?us-ascii?Q?Hbzrh6g/jegXyeVFNOd2cyLuuAPitNob5r+wU+3s0I/F8sLnmTDkCKRz2UxM?=
 =?us-ascii?Q?cdO52FOlYdsx9Kr1NNduLNCckXB3wUT5glzidPqg3E417Mtxuhmm1zKesVTK?=
 =?us-ascii?Q?BwqXxgdp+SZ1I9gMy/zdTgnRMuswG42Hvk9v4lNK7kZAmJ6l2tjJ9ph/HkqW?=
 =?us-ascii?Q?OfdsfLah3Tpj/HWqrQIpVjZW8b6G6VPiR2vfYw7uyHPn4ckovWvdKE5fiiY4?=
 =?us-ascii?Q?rVtCDB4Z5jGZj08OfgQe40mpaMluOGIvmQ6VAy2dqfd5IY2OZUNrSKRtJ+lR?=
 =?us-ascii?Q?hpaRD0/pyNrmKfEDhbqc3iRN2DTJ1lrmB/fhLvA4hL6mPZgQ1mSPIqS1eOsb?=
 =?us-ascii?Q?nAAP8mlrk4BkGDg0Jq6cfs3eLZQMr9maemH49a05JbGnI0NHQSCOzTABaV1w?=
 =?us-ascii?Q?yTjsBOjfNgU4CDQQmgfGgvq40PV9CksKcCZienLAYzkhbO0NPYiN3vBvtWsx?=
 =?us-ascii?Q?Gg8JJT66DldJSorIVZQD8s5RJGRELEzh3rjAJgbuXcOQymNQL03ZhkVde8cF?=
 =?us-ascii?Q?733xOD0U+h6asMCS3MpcRFBCn6QgzMjggnoCQ+uho72f0MrKqHqUhxrYeHAO?=
 =?us-ascii?Q?Uo7QzUZ9W4JtRkgv2JdnOyifMSVQRiygl6dBoNBzmJHknTRzrhgAxEnOgLZY?=
 =?us-ascii?Q?XubCGf+Mg6v8BtvQcc9V6uai/kVCT9i/fXQBSZbPApu/2fXEEeRVKD5oh+ar?=
 =?us-ascii?Q?jTJ0SH/MBshxTZ9QTSNr5bsEGftcU5c/ZdCjvP4Xc0OuXCKNeToO66zz/lrA?=
 =?us-ascii?Q?p80qPATIj6desPyoILbl9/JcPYVgGYFgzxh7II9u3xDwXtwpHAx0aOdz8W2F?=
 =?us-ascii?Q?YlfFXSq3Dq/UdZr7nBvHDWS0zaUZKLUzYnb3h6uDOMIteHqGlBMPT5tm7jMz?=
 =?us-ascii?Q?0L4h01z5IP6yT0jZJnXzMsWwgu+lqcFPwHFMocdJGAn3QNpJ2suciKk5mQzj?=
 =?us-ascii?Q?cDVKldSqq4/gVN7Q1+8RJasURYTBXJiFobYslgLxVT4ci1HE007ezeSJF1Q3?=
 =?us-ascii?Q?K912t4FCumUJkR4+QTJNcYGGwxYrOfXE0TyaNAuu0M/JXfLpZqzk1R92Lml+?=
 =?us-ascii?Q?PWb37Lpia7qBYcjkg3gXMgQFiYHLptzzbDgzPw8oBHmubheQ2xDE6N2ttlZz?=
 =?us-ascii?Q?ryCTSZCtu4VrvvkQqRGVTWcacRbOjVpvTa+rt4V9ISUDT4rIRcOMx7Z+a6O0?=
 =?us-ascii?Q?wrI5iBKCAOcxDzFm8gRbg1bXx61nibBK9dOuVZvfdKtTBVVYkH7L3RvVLLPX?=
 =?us-ascii?Q?oe8O2saWQIzusY5NFm85QEmFtfHJ/vkOMBME6Mdq6iWsgpBXqtpYhTAdKhQn?=
 =?us-ascii?Q?5bG/vvgBMI5nhC5rb94=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 937020e0-e370-4058-fda6-08dcc1f0b913
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 14:51:22.0713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TpVrUUwkqPEp/V09qHPGraiBVD6HoH3DCJ9P3ZW8V9zr239OiqY7AbyANua8BHSFxxrSea3637VmwpORWjDrJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Tuesday, August 20, 2024 1:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Su=
raj
> <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 1/5] tests/kms_content_protection: Move HDCP output
> checks earlier
>=20
> Move the HDCP output check earlier when no. MST outputs are being checked
> this will avoid us using an extra loop and an extra array.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

LGTM=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/kms_content_protection.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index e9a468eb0..6bd744351 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -638,7 +638,7 @@ test_content_protection_mst(int content_type)
>  	int valid_outputs =3D 0, dp_mst_outputs =3D 0, ret, count, max_pipe =3D=
 0, i;
>  	enum pipe pipe;
>  	bool pipe_found;
> -	igt_output_t *mst_output[IGT_MAX_PIPES],
> *hdcp_mst_output[IGT_MAX_PIPES];
> +	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
>=20
>  	for_each_pipe(display, pipe)
>  		max_pipe++;
> @@ -662,10 +662,13 @@ test_content_protection_mst(int content_type)
>=20
>  		igt_output_set_pipe(output, pipe);
>  		prepare_modeset_on_mst_output(output);
> -		mst_output[dp_mst_outputs++] =3D output;
> +		dp_mst_outputs++;
> +		if (output_hdcp_capable(output, content_type))
> +			hdcp_mst_output[valid_outputs++] =3D output;
>  	}
>=20
>  	igt_require_f(dp_mst_outputs > 1, "No DP MST set up with >=3D 2 outputs
> found in a single topology\n");
> +	igt_require_f(valid_outputs > 1, "DP MST outputs do not have the
> +required HDCP support\n");
>=20
>  	if (igt_display_try_commit_atomic(display,
>  				DRM_MODE_ATOMIC_TEST_ONLY |
> @@ -674,22 +677,13 @@ test_content_protection_mst(int content_type)
>  		bool found =3D
> igt_override_all_active_output_modes_to_fit_bw(display);
>  		igt_require_f(found, "No valid mode combo found for MST
> modeset\n");
>=20
> -		for (count =3D 0; count < dp_mst_outputs; count++)
> -			prepare_modeset_on_mst_output(mst_output[count]);
> +		for (count =3D 0; count < valid_outputs; count++)
> +
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count]);
>  	}
>=20
>  	ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
>  	igt_require_f(ret =3D=3D 0, "Commit failure during MST modeset\n");
>=20
> -	for (count =3D 0; count < dp_mst_outputs; count++) {
> -		if (!output_hdcp_capable(mst_output[count], content_type))
> -			continue;
> -
> -		hdcp_mst_output[valid_outputs++] =3D mst_output[count];
> -	}
> -
> -	igt_require_f(valid_outputs > 1, "DP MST outputs do not have the
> required HDCP support\n");
> -
>  	for (count =3D 0; count < valid_outputs; count++) {
>  		igt_output_set_prop_value(hdcp_mst_output[count],
> IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
>=20
> --
> 2.43.2

