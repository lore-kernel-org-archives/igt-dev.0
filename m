Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71C2CF6491
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 06:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9428E10E2CE;
	Mon, 30 Sep 2024 06:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFkZww7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8292C10E2CE
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 06:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727676978; x=1759212978;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ne7oqvVBesIysMYDWKKMfPovquZ4YpqSf9JeNc8Prh8=;
 b=lFkZww7F0o+BaRbmB66XTmhJc1QHcoS5Ozy/uVGPa1bHH7tm4wcA+wEU
 uR4+CxOp1UwL/6Rar8gKRlq8n758sNB1zBqJCPQpjxwXZnLo5hPIh7akz
 xAvdkMV8bPSaqH88bcpSOVpG0Ykm9rU2KI6MnA51xl/vYUNUYfP/EN8V/
 hJ2YfGU8z9Kjkc3EefD1XpzyJP1wneuRKGzaXh21C8ceKfmRORQtLYW+Z
 3F61SiUHdAXq2DcT836mEzNnoI0vGOVTPQDJdIrshqVihP2UIM/ueYYdi
 /AdE/89lo/LDGPMu93njEt6lwSJ+sno6cLNGYxkcEaSkBbIBRpQfYSLYb w==;
X-CSE-ConnectionGUID: OClyDZrcRsKfZ4kQO78obQ==
X-CSE-MsgGUID: 1CznU0ffQayKqMmxnw5oRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37330355"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="37330355"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 23:16:12 -0700
X-CSE-ConnectionGUID: 9BCKSp+bTV2IkxGQBj9cGA==
X-CSE-MsgGUID: C368k67fQhqNA8oYHLScRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="77585701"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2024 23:16:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 23:15:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 29 Sep 2024 23:15:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 29 Sep 2024 23:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmFFzmn9TVHQvzmZO/gAu+/Y2gLNhpCRxZyxlN3ol7On5rEb2UNNc90j6Q9O3EJOL879kiFvjk+zc3X2VAiQdGbfDevcj4QhptaZSYiu5IQn11UOCbjkIAP7FGPN8UCeodqzajK/Y6voThMjXTk7CvRzp/Vm1AL27dz79oijcTTrmV7DdBu/7LChvbeXCcQ6Xi7mVZOPDDewec2jeH8Ow+Pq+5TawbaVV0kkuGwjcc1SMMKU0yftAQyxyy705pDb1Aihrovvt+hEiUD5aoKKc3IVWi9C4IF4ZDhS2keXOIAtN3aTV59Kb506spc4DGZ6kIpSYb+TKLFcl/EdgAAZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvgAe751oAZvvW8OD4YWZc045G3o+nUaGYnwKLyQv90=;
 b=KYL2uGpu8DBrf4XMMejLCO9ed9rG8xj8pEZhCMr5v6toJy0yWRAsMW+/sWOYqhxkaQH3ogh78goCh+PPByK4NuaZrlHExM6rAXHf/JwH6x9pllI26+ZxWF09q4FAgSpD5GL3Xt+hqjdhVPBe5Lit7og9SDnzzEiKAhDrBG4Tm3ROqBI2Fw5Ds7SoNFTKvmYpJ8AQeRsft45avGp7nbrtBgazsWPB1ljeD0WIR51X1B+FkTlfpc58rRr3PKqhcjR3EQOLhTq9+ooZvB2FWhSpG7ZT7u/dMIf+ZAajrekpAnIY6tWisYbmgkqeU1+9MnucT7sryfBvZmASD/SxgTai5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CY8PR11MB7778.namprd11.prod.outlook.com (2603:10b6:930:76::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Mon, 30 Sep
 2024 06:15:54 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%7]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 06:15:54 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] tests/kms_hdr: Add brightness tests for hdr
Thread-Topic: [PATCH i-g-t v2 1/2] tests/kms_hdr: Add brightness tests for hdr
Thread-Index: AQHbEMcKqrjvfIC+2U+TyVLUSRH3vbJv2Wjg
Date: Mon, 30 Sep 2024 06:15:54 +0000
Message-ID: <PH7PR11MB6053EBFE5650E80A166D75EFE7762@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240927102038.1001578-1-santhosh.reddy.guddati@intel.com>
 <20240927102038.1001578-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240927102038.1001578-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CY8PR11MB7778:EE_
x-ms-office365-filtering-correlation-id: 350fad26-4c16-4d94-b34a-08dce117574a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HOLfZa7uYdo2R8zgtC2+sxbLV21mPdK6eQydEA1oJua0rkWaXSkCzw1rdZqt?=
 =?us-ascii?Q?HV7sXqe+K0kuDAZOXPFy5Zx0gLImW0dbKZAaBCCgz+gbkfVFsBw4Eu4O4NbI?=
 =?us-ascii?Q?AkAz1vcBjLWTE7pUqFbAspL9vuRwoNZAIG2lvmTcRWOSxtZXav8WWtzOxMMa?=
 =?us-ascii?Q?UegtgX9h1Xff9c+AM35x1RpIG5rr/UfRBe7z8a1TwSVe7rFSCAyJ9Zxm0jos?=
 =?us-ascii?Q?Xb6pOVcuGd1MMK2fs2zUFYDyN4ltknM40+4m7MZumFhxHjzDV85GycRGc3JQ?=
 =?us-ascii?Q?qm02oFIYEo8slqfwHysmHsi1AQRZYXEGWo7dkuL3BEcyLJOBAkegnHoJM5Vd?=
 =?us-ascii?Q?9JQ9UkyqieqR4/9mKX4qd26uSmcHeR/7uT0qeB6eLm5Zkw8WyGJ7EcAb2gf9?=
 =?us-ascii?Q?xCvHZE6qNIvkxR+YOKGI/7vxUeTwrt8YdwCv703NzPZOensYZwn9SZZLFClY?=
 =?us-ascii?Q?mCevjIS9c8qbDuWUha3JoXp3MR3s08BladiinKf07gv/fLeF/gSyK8Sd+vHK?=
 =?us-ascii?Q?ufrwnc9hOSARkX9Db45UBW5q1geNaYe06Rp8vlhL7h64462OtkNt2GCN+kVh?=
 =?us-ascii?Q?UA7MWtLanq9fUM7BmcItI7CNcVKGTpA0JNAO2f0h/lUemOI2BO5b1o7kAfvk?=
 =?us-ascii?Q?ienSIQsi1pyFf+k1dOKVq2R1ZvDfwYYCkT+IIM81FA1y4QHTLs1lsRGVfQBS?=
 =?us-ascii?Q?0cRFTqe5sB7rc+7oDbY+jjteZ+4OGSszUYW5In4KmZq+aj2B7py7iVENlyGF?=
 =?us-ascii?Q?Q9HlnaMR114+8GidJ9jvjNA4GUPmnRVFHg3WpI7bPth09OHrwL+sCjlxQmtd?=
 =?us-ascii?Q?YJKGpxEw1eGXIhIRl7VEE9YzG8QaqyTXWE95m+iWarOzWCJRf3TrxUjfd03I?=
 =?us-ascii?Q?y/oX8TTl6PF9QiejkDxFIObex/D0t9ZlS+0IN7jMkPuMRQ9lnZYVaO0IjSWh?=
 =?us-ascii?Q?LODI0WL/wT46uQqRuIkm8d8zK6VbWCNBvu0cqyFDXaWnW7WHQxbI/e6DmM3y?=
 =?us-ascii?Q?KdH2dvjRvb08sz+ogtGJRR6Sp+Cy3gmFQw3AoQNjrGUJDPnTDxy4Ib65nSBH?=
 =?us-ascii?Q?nNNQ9HVTdqbbcPoBHlCdfa+piHfTsMQUzLEL9LqejDpDYQgW6KWWPwCQKrzY?=
 =?us-ascii?Q?zsTt0j6I430RRroI+60QSB/U6TJwYG9Kzm4W3v2sWbeKd8D5jjC6wbsAUe+h?=
 =?us-ascii?Q?UOYTk0pQvjspKoJAb0clXKApRvVta0teSSqGES+JcTDX8gQkEqFw2y09s6W0?=
 =?us-ascii?Q?ZeKtUsJ8dh7izgMN5ZsILgQRxJ5wPfP4EPmyUcF2CRFcU2uCstR9CUlzI2xu?=
 =?us-ascii?Q?qdwuGtHTX+Kusk9QPfOW4SyskCtUSGK5d1cgDGTJaMWXQnnmCsUN0gS3MnUu?=
 =?us-ascii?Q?8a9ZwQsLmO1xnHH/Jmje3Gc85FJDvu6dkWbZqNc/JR59dYtFDA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8G9hnsEu8BpDnKPMGALJDLirWNfxlvWjEayhYak8bDa6zkErWq9zqxXPCpfK?=
 =?us-ascii?Q?dy395TOihus6dQUPe9tIsMo7QBd/zFAeG4wjYW9CCSExevxoxtpLVVQ4+bDV?=
 =?us-ascii?Q?nSDP4nWi9bUnbCXlGuDK3D6B39H/5lOGm1/MfUknkBmScGVh7WMakSNIFn7R?=
 =?us-ascii?Q?RTqK/yM8At3LcnGqyTSx8/+YRMnVzqtUyckIej8Nlsd+8/6xcaIL65Jz5y2L?=
 =?us-ascii?Q?A9x+cRimiCngisrDdcEGHkliKWma8g1PLnB1bIA+Mq2suWR6t5u0YajTsNbO?=
 =?us-ascii?Q?WxjcfIEhUZGQIjDMJ4wTvWnvm2jy9EqiuCxATwXyMFqOObjeVWns28vBZBe3?=
 =?us-ascii?Q?f8JhOOMbGAkIWn5qpvboBEnkSzRNAV0qpO8LANieqEXd/aIG/hSfHXX+o7AB?=
 =?us-ascii?Q?5ye45d4b8gfCqXCndOcRAwEq/rP9tRFnyRI040DL5dqq/58WPJYJHYV2G53o?=
 =?us-ascii?Q?zS3H8Ap+tn5lBFGY9sFkHsABekINuGWgZA6mxgSk6acF2ASYkCo0kpepTNP6?=
 =?us-ascii?Q?eaQ7CIk2o5jVTLcFCx4lsaBvIC7pc48hazuUlYWmyvQWTzEofRtZ2D9gts//?=
 =?us-ascii?Q?D+W3V4pRxHYwn9s5QSSi9/ysFKsQktCChTkPExJP//IG3oB+NS6PYlnSfgo+?=
 =?us-ascii?Q?ImTMa5MeA2AyXw6f/cNG3EaihwdJVIcpSeV8l1DtZf4oAm5NRTfpG5xA7Z2O?=
 =?us-ascii?Q?aaXGwA/nSZzmNS09CbrB758tchwabJ/IC7l9i7KaibE14WRSOu2oa0v7J4Zw?=
 =?us-ascii?Q?DuTOG/WEpUniH2PodA49RDai26NhVu0gjfgdVaHtf2o2X3cq9XulC7VLTtJy?=
 =?us-ascii?Q?y8bJs77C+IP1tJO19j0PJtTdY0T/lbkpteOG9FPh0qRBjOUzLyeJp6gLxMmH?=
 =?us-ascii?Q?pQ8DJonKoED8rR6Ck77qkhMLFCExjYZC5v/2zaFr1W7SkXUSYb8u6mgG/T9T?=
 =?us-ascii?Q?LP+qqEHv5kwJBJXXxIgvRNYeLpy6LCgexDm469oDA4HKohB3ZHeyG+rcpJY+?=
 =?us-ascii?Q?03vQKYO4dhX0rBxrH9ziMw30JGXVmFQJtnz3uXASqrSNm0i3Id/4J+zfSPRR?=
 =?us-ascii?Q?UpXQZ/2vdfsvqu17EXEcQCHzHmjer6hYEhK92UlugipGEJ/uxQFE24LdYg2n?=
 =?us-ascii?Q?7ZI8zUTlTlbSM/nhpznd0kQ5JKIVaQcZYB5Yv04XaunFeWSZ0u8HKQluuFtp?=
 =?us-ascii?Q?Q81KPnNFkxbX8JPDDUuS+0EpL3IBPISNJmFDYmnxloN9JS4QPtU6h+Pk/cie?=
 =?us-ascii?Q?O6ARXAigOIAqq41orkAFOksQjstEzJWF2mpoQQTbOouurJOh5mZ6/AR9Cg9x?=
 =?us-ascii?Q?JvK6yzDOZ8cKaAiAxadYTo/NGPhfDub2NsaNpu4jRN4Bd8/6x2k429Kc8qcj?=
 =?us-ascii?Q?LSXiiKYWYvr8ZYa/bdhTwroFCXkw5dNBv0uBeABMy/NnadP5H67xEo/HaO63?=
 =?us-ascii?Q?cHShk8ow7Zr0gKBcDE722johVpm+0q+/Gu2HzsK2A/wcQa2q/BxFW3SDqBXN?=
 =?us-ascii?Q?CFbqw+3PXSMMjNvFOx32O4L8urQtagHBtqmeewVJ8poAuSS12NzvPkZdDYUq?=
 =?us-ascii?Q?cYFyfAeRmpI9rabkbffHWwN/Q45rJput2ASG8/rG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 350fad26-4c16-4d94-b34a-08dce117574a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 06:15:54.4411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vTserZ63AwKd954OHRSjw0hvhvMHG0f45iXoFh92cUwAaG+qGydQzCBz1aBn6VERtIKhWyAyW9A6nbpSDQUPtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7778
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

Hi Santosh,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Santho=
sh
> Reddy Guddati
> Sent: Friday, September 27, 2024 3:51 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v2 1/2] tests/kms_hdr: Add brightness tests for hdr
>=20
> Add subtests for Aux based backlight control on hdr enabled edp panels by
> changing brightness via sysfs.
>=20
> v2: Add function to adjust brightness in range 0 to max, refactor code an=
d store
> and restore brightness before and after test. (Pranay)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_hdr.c | 144
> ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index f123c6b36..115ed6ab5
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -64,6 +64,18 @@
>   * Description: Tests static toggle with suspend
>   * Functionality: colorspace, static_hdr, suspend
>   *
> + * SUBTEST: brightness-with-hdr
> + * Description: Tests brightness with HDR
> + * Functionality: colorspace, static_hdr
> + *
> + * SUBTEST: brightness-with-dpms
> + * Description: Tests brightness with dpms
> + * Functionality: colorspace, static_hdr, dpms
> + *
> + * SUBTEST: brightness-with-suspend
> + * Description: Tests brightness with suspend
> + * Functionality: colorspace, static_hdr, suspend
> + *
>   * SUBTEST: static-%s
>   * Description: Tests %arg[1].
>   * Functionality: colorspace, static_hdr @@ -81,6 +93,9 @@
> IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>  #define HDR_STATIC_METADATA_BLOCK       0x06
>  #define USE_EXTENDED_TAG		0x07
>=20
> +/* Intel Backlight Path. */
> +#define INTEL_BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
> +
>  /* DRM HDR definitions. Not in the UAPI header, unfortunately. */  enum
> hdmi_metadata_type {
>  	HDMI_STATIC_METADATA_TYPE1 =3D 0,
> @@ -100,6 +115,9 @@ enum {
>  	TEST_SWAP =3D 1 << 3,
>  	TEST_INVALID_METADATA_SIZES =3D 1 << 4,
>  	TEST_INVALID_HDR =3D 1 << 5,
> +	TEST_BRIGHTNESS =3D 1 << 6,
> +	TEST_BRIGHTNESS_DPMS =3D 1 << 7,
> +	TEST_BRIGHTNESS_SUSPEND =3D 1 << 8,
>  };
>=20
>  /* BPC connector state. */
> @@ -623,6 +641,112 @@ static bool has_hdr(igt_output_t *output)
>  	return igt_output_has_prop(output,
> IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>  }
>=20
> +/* Move adjust_brightness to lib/igt_sysfs to reuse in other tests. */

Mention TODO here if you are planning to do this in future

> +static void adjust_brightness(data_t *data, uint32_t flags) {
> +	char brightness_path[1024];
> +	int brightness_fd;
> +	char brightness_value[64];
> +
> +	snprintf(brightness_path, sizeof(brightness_path),
> +			"%s/%s", INTEL_BACKLIGHT_PATH, "brightness");

Alignment should match open parenthesis

> +
> +	/* Get current brightness */
> +	brightness_fd =3D open(brightness_path, O_RDONLY);
> +	igt_assert_f(brightness_fd >=3D 0, "Failed to open %s\n",
> +brightness_path);
> +
> +	igt_assert(read(brightness_fd, brightness_value,
> +sizeof(brightness_value)) > 0);
> +
> +	int current_brightness =3D atoi(brightness_value);
> +
> +	close(brightness_fd);
> +
> +	/* Get max brightness */
> +	snprintf(brightness_path, sizeof(brightness_path),
> +			"%s/%s", INTEL_BACKLIGHT_PATH, "max_brightness");

Alignment should match open parenthesis

> +
> +	brightness_fd =3D open(brightness_path, O_RDONLY);
> +	igt_assert_f(brightness_fd >=3D 0, "Failed to open %s\n",
> +brightness_path);
> +
> +	igt_assert(read(brightness_fd, brightness_value,
> +sizeof(brightness_value)) > 0);
> +
> +	int max_brightness =3D atoi(brightness_value);
> +
> +	close(brightness_fd);
> +
> +	for (int write_brightness =3D 0; write_brightness <=3D max_brightness;
> write_brightness +=3D 50) {
> +		brightness_fd =3D open(brightness_path, O_WRONLY);

This brightness_path has the path of max_brightness path.=20
Change the path if you were trying to change the current brightness.=20

> +		igt_assert_f(brightness_fd >=3D 0, "Failed to open %s\n",
> +brightness_path);
> +
> +		snprintf(brightness_value, sizeof(brightness_value), "%d",
> write_brightness);
> +		igt_assert(write(brightness_fd, brightness_value,
> +strlen(brightness_value)) > 0);
> +
> +		close(brightness_fd);
> +
> +		/* Verify brightness adjustment */
> +		brightness_fd =3D open(brightness_path, O_RDONLY);

Same as above (path is wrong if trying to access current brightness)

> +		igt_assert(brightness_fd >=3D 0);
> +
> +		igt_assert(read(brightness_fd, brightness_value,
> +sizeof(brightness_value)) > 0);
> +
> +		int read_brightness =3D atoi(brightness_value);
> +
> +		igt_assert_eq(read_brightness, write_brightness);
> +
> +		close(brightness_fd);
> +	}
> +
> +	brightness_fd =3D open(brightness_path, O_WRONLY);
> +	igt_assert_f(brightness_fd >=3D 0, "Failed to open %s\n",
> +brightness_path);
> +
> +	snprintf(brightness_value, sizeof(brightness_value), "%d",
> current_brightness);
> +	igt_assert(write(brightness_fd, brightness_value,

Same as above (path is wrong if trying to access current brightness)

> +strlen(brightness_value)) > 0); }
> +
> +static void test_brightness_output(data_t *data, enum pipe pipe,
> +				    igt_output_t *output,

Alignment should match open parenthesis

> +				    uint32_t flags)
> +{
> +	igt_display_t *display =3D &data->display;
> +	igt_fb_t afb;
> +	int afb_id;
> +	struct hdr_output_metadata hdr;
> +
> +	/* 10-bit formats are slow, so limit the size. */
> +	afb_id =3D igt_create_fb(data->fd, 512, 512,
> +					       DRM_FORMAT_XRGB2101010,

Alignment should match open parenthesis

> DRM_FORMAT_MOD_LINEAR,
> +						   &afb);
> +	igt_assert(afb_id);
> +
> +	draw_hdr_pattern(&afb);
> +
> +	/* Start in SDR. */
> +	igt_plane_set_fb(data->primary, &afb);
> +	igt_plane_set_size(data->primary, data->w, data->h);
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC,
> 8);
> +	igt_display_commit_atomic(display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
> +
> +	/* Enter HDR, a modeset is allowed here. */
> +	fill_hdr_output_metadata_st2048(&hdr);
> +	set_hdr_output_metadata(data, &hdr);
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC,
> 10);
> +	igt_display_commit_atomic(display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
> +
> +	adjust_brightness(data, flags);
> +
> +	/* Exit HDR and enter 8bpc, cleanup. */
> +	set_hdr_output_metadata(data, NULL);
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC,
> 8);
> +	igt_display_commit_atomic(display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
> +
> +	test_fini(data);
> +	igt_remove_fb(data->fd, &afb);
> +

Blank line is not needed before a close brace

> +}
> +
>  static void test_hdr(data_t *data, uint32_t flags)  {
>  	igt_display_t *display =3D &data->display; @@ -691,6 +815,14 @@ static
> void test_hdr(data_t *data, uint32_t flags)
>  					test_static_swap(data, pipe, output);
>  				if (flags & TEST_INVALID_METADATA_SIZES)
>  					test_invalid_metadata_sizes(data,
> output);
> +				if (flags & (TEST_BRIGHTNESS |
> TEST_BRIGHTNESS_DPMS |
> +
> 	TEST_BRIGHTNESS_SUSPEND)) {
> +					igt_require(output->config.connector-
> >connector_type =3D=3D
> +
> 	DRM_MODE_CONNECTOR_eDP);
> +					igt_require_f(is_intel_device(data->fd),
> +									"Only

Alignment should match open parenthesis

Regards,
Pranay Samala

> supported on Intel devices\n");
> +					test_brightness_output(data, pipe,
> output, flags);
> +				}
>  			}
>=20
>  			/* One pipe is enough */
> @@ -734,6 +866,18 @@ igt_main
>  	igt_subtest_with_dynamic("static-toggle-suspend")
>  		test_hdr(&data, TEST_SUSPEND);
>=20
> +	igt_describe("Tests brightness while entering and exiting HDR mode");
> +	igt_subtest_with_dynamic("brightness-with-hdr")
> +		test_hdr(&data, TEST_BRIGHTNESS);
> +
> +	igt_describe("Tests brightness with dpms");
> +	igt_subtest_with_dynamic("brightness-with-dpms")
> +		test_hdr(&data, TEST_BRIGHTNESS_DPMS);
> +
> +	igt_describe("Tests brightness with suspend");
> +	igt_subtest_with_dynamic("brightness-with-suspend")
> +		test_hdr(&data, TEST_BRIGHTNESS_SUSPEND);
> +
>  	igt_describe("Tests swapping static HDR metadata");
>  	igt_subtest_with_dynamic("static-swap")
>  		test_hdr(&data, TEST_SWAP);
> --
> 2.34.1

