Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234C1C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 08:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A5D10E5E9;
	Tue, 18 Jun 2024 08:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9RkqWcM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69FD10E5DA
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718700328; x=1750236328;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4MtVMdaCsz9VHVWu2zBxHBbBh8SKbpvB8Gw2yaDKQWo=;
 b=L9RkqWcMdW74+EWfy5tMVsPcszAbtMkSj+L2yjaAnN3WFApWH+JnmmNT
 4I0GBxkxsqYo1eVNlAohHh6cdGBK+53e/HtBBYPptWBrQ6c1pAT7Wl2b6
 e+PqI+utwqggNvh3O9zlpfNDaXpG5YSpHkOCWk4MkdVfY14c8HSD+AUDl
 jg2ht7G0P5qnjNW320q1jzuXY6TLlG4X6zRHtFHDwg01iseB1FDZ9aHxW
 io5RFCTy+A8q3FNVUpyUsJetLpNoasE1YITKkMWTOR2riHFrA2wwXitTe
 jYhPkc2n5HNFFl2HmWNX/MVyz/3ltJpCpMnv1l/UqEHSm63zPB0DpOhTO w==;
X-CSE-ConnectionGUID: slHIzn5kSfuac0jTUXMXqQ==
X-CSE-MsgGUID: uJ0na3R7REyaJronlYUdqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15686590"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15686590"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:45:28 -0700
X-CSE-ConnectionGUID: 5Jtfxyq0TuC3bUlQK3+IyQ==
X-CSE-MsgGUID: EFDXquB0Q0e1W9o60iEylg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41588858"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 01:45:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 01:45:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 01:45:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 01:45:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 01:45:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdSLy8q/d+QOY7WTSXGHqhG5akVcu1aWaPZvFUiEQ0gkPGodo5aja3TGWgNtntKdCdeuA7EDfzyZWrchVDAHh/fl/L2doP/p1mDn1pqyRbQIYYwY3kFr2dUP8fCzXNWMRgPlC6TF4SovUSE8kvGO2MVwBZtISyz1FOl5Qo/+FY+3LhF9ZH6c7b1O8+V3XSuLA9jU/NQhnvxmLQZUETc1oLIQ9yIWNEjlYHbpgU1Q8dTngTgBvS5MxdmANTidGybqfbe35grFj0b3NTKX9eFhlTO84gSWXHI0lGV44T0YolhdirHL3GXN3FIUb1BB2OkeyzlUF097XjBCGpkyxYPeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EP6rqEK1ujN3Rx9cnBFg6SqZtWOFE84vSNz3k9MGHxs=;
 b=msiv+8JVU73Fb7gu8/lbOPbbcJvqfnLCMWEKNjKgo0S+h1PMGkrXEBeIEl9D54W4mb2e6AhIQFmTFQ9puXKOqs36z5ygLDEGnaMbQnpvkOwTh6SyAcXgUX8UA8TGnX8sjqHUOx5eKDWCQJPRQ7y3MEulDABljcRBSO5l77c/Y+1HCCx7DFMtLaiiufWEx/DgpdEz4Sec+fAL2qwUkqlDv8e02eNSD77qP8Ud8N+2Cbn3PCp/vya6CnyxjNj9IYzdfJ6fkG0RKlGlexmZdFBLnPG7YoERZd5dnjbYy/2LCdyiCYVkX2VeOG5NNPL5WfJt/zn9bRYTYd1yD7wn7KHUfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB6784.namprd11.prod.outlook.com (2603:10b6:806:24c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Tue, 18 Jun 2024 08:45:19 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 08:45:19 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V6 5/6] tests/kms_dither: Use lib helper to check the
 pipe/output combo validity
Thread-Topic: [i-g-t V6 5/6] tests/kms_dither: Use lib helper to check the
 pipe/output combo validity
Thread-Index: AQHawUlR4p1/psHtz0OpACny501EXbHNNQ/Q
Date: Tue, 18 Jun 2024 08:45:19 +0000
Message-ID: <DM4PR11MB63129D81793F4C8FC5709F3C90CE2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240618062405.4004955-1-bhanuprakash.modem@intel.com>
 <20240618062405.4004955-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20240618062405.4004955-6-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB6784:EE_
x-ms-office365-filtering-correlation-id: 90951ec8-6d13-4aa2-f55a-08dc8f72fba6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?YsIaNewB8oPqcH5d7oKi3bmy2t8yf5+68lHCyeIrs+jfn0R/YtfPwHOfEw1s?=
 =?us-ascii?Q?aaNH13mcgiREuYPprybLRZLuwywUQv/bnmal2sKpb5bEVDooIoXSzbXUc5wZ?=
 =?us-ascii?Q?VXjbIj+YItfbtYez+SKz5tYNFZ4MfvOXHynfpTNaVRGiT7/TA8EdmfKabHAB?=
 =?us-ascii?Q?d/xboLxCwpEc6NqkB8EzjJmHcTMa+qdFpKG9W0tkke9hxDBRa3XWY85vxZdt?=
 =?us-ascii?Q?oetYuv6JN27w+XusGbem2o3IuBnuH5HC1xsXZzUZx42fzH/b0AKFsJPVSkop?=
 =?us-ascii?Q?c1oDhlexnTRPr0Hv7j6iJ6/vD9i+5utVX+OXbH4Ckt9Eer93z3jJX414CCuD?=
 =?us-ascii?Q?UlJxwu2QTXHLH9fUQlWDzkOZzBFpE55ZN5Xbp+IJPeUWRirNH6y6jKnxjFrN?=
 =?us-ascii?Q?+61iLG4xhOIvFbP6caOnf2MUzZJ4TWgtZsz/Opm3zA9BkJqssKtESpZiewR/?=
 =?us-ascii?Q?XUw7ibYuid21s+pvmUMHAq5obyGgdypBlb3OYZnMJ9H47u24bsBHXi3hOs1f?=
 =?us-ascii?Q?osVqWc36XUMXZsXOKMTvlS2+0DbNv7ivSFTdw/f+yYanftfgjGoLsTSjX6SQ?=
 =?us-ascii?Q?Y6ROr/4C+7vcpVb2tFJFNQgUWaKfUvc+96Gq6IP6XZ4ISlcVTmd1vN+YfHdA?=
 =?us-ascii?Q?QbpLfbOWBUUiB31Mf8VX4AS9NauYITK/pKQrOmkcS98vIKSn6C6UQAuAD5vd?=
 =?us-ascii?Q?0SM3ndXAOjausiAr75adBMARCY3p+v9x8a9IHwZtc22KMUe9wzk6yev1s+fc?=
 =?us-ascii?Q?fSgyRML5zu7//VyyEKgDM33aJ/2ufTszu+XPA6jDMRrav+CAiw88Hh7LZJmf?=
 =?us-ascii?Q?aKjUT5CLZhVVIrt93K6VTRPkhVKdm3LHLXFeSzrS2FzyiV5o/oRNqP8sQwNj?=
 =?us-ascii?Q?BHPUYThP9Wk5kcKUks5c0dNTn6j+QfjTQrM06u9+xgLKi2BH4xFRMvEXd9Sr?=
 =?us-ascii?Q?rgafJfsNM1LNl+IRI2CliNU4zbKH+HYgPuxxp47DX+Eskdove70bON60VERZ?=
 =?us-ascii?Q?vWB8/Vnrsd5ia8Y+eyUA992vaQk9fXFncVXrmVH4bHsoz2cHgDMrK5jX+DEA?=
 =?us-ascii?Q?k+oAwH0ddTdCqB7XoC2HvGfVJWNcg0IeMr0bkvu23LqS1AcBGnjhU7wwHjVF?=
 =?us-ascii?Q?nEwVv6Hku1nrxSxMx/L/FjqR9AvZTyRsi/PvK9eLJL65479TrQUQ947WzrZG?=
 =?us-ascii?Q?wADueGhWoaPwuFDxoNNS4AIiLJ7b9hLFCAq9w3ZQR/7ZXQOP1KZjvz3f8G4X?=
 =?us-ascii?Q?J61japhhP09uf2TOEezqzD3n51QHN5+Yo1jms1lWS2yz6XLpjeO3oAT5TG3d?=
 =?us-ascii?Q?YtUIi43v5JsQvjHaGJRzHSewCXDvyaCDORH7OJ2Lrh9Q5ZOw/4zEt5QklNnp?=
 =?us-ascii?Q?7bbqaAk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TJFPKt54eBBENo//5Mof5ui8jtj0SBq6TDV3RwrMFB//FXKzT8kJiwwdkuzD?=
 =?us-ascii?Q?oFv7DwWj9yVuQWULVUS2jL8bo+y9g2yolGAxj9Ld+UYFaRHGAvElr4Pz272I?=
 =?us-ascii?Q?rzTuDQQqcdY1WxF0FGy8fwd34wHUjsr+msUo0PaggOZPVLn6vfz0INm9hPCa?=
 =?us-ascii?Q?VCy1NVqhYN+b/M1BMu5Nq71UP8sVOIEw1U5RzS1xDJ47glg+PgC7p3Kdx75A?=
 =?us-ascii?Q?/oqcFjSARdsnlVfBEczAvw4pY/q3qtIo1YDQOQNOYM9bcZWQOB66dCOU7huG?=
 =?us-ascii?Q?rQnR2aC7mwgTRJSQKVr0jy/3RekiFcMlZ6K7w7HBk9yfs09vD4KnVyz2gROu?=
 =?us-ascii?Q?l841j/Wlx6C9ZR6m/Frl/OBOfWbs3wHDjd4/cFC0OgulBsos3ttxVC9zca77?=
 =?us-ascii?Q?4wCpacIvaDx51y5qAZptgIE0VkXp7+HBaw3Ko6izrMif5Z7QzkWQrYl+9CNK?=
 =?us-ascii?Q?QCS4t8w3i3MVteTsgQnoEXwKMQ0uXRJSJqpWX4Rfi5WaRElFGE41WvBEhBn1?=
 =?us-ascii?Q?TYQqn6NPgRMNquj+ZQqUhKaKkKT8RSGAxxoubo5+tDMKN/Ug1qBLMTh1JNSI?=
 =?us-ascii?Q?wL7SQOn8szA6ZeAlE/CCVozT4EzgtFStnk4lrE+k/Tj19l3AUocGFDi4uutM?=
 =?us-ascii?Q?eHlAFN85GOb4983sQfV4WRiEBKzsqYSHsob0JoQ524Rh1pVGKWrD2gDjpuw5?=
 =?us-ascii?Q?31PdOuOqAb0gc18rsclZYsxAypB3fGH8sqnpHSmwXARIj/gFAbBiKZjAkK/0?=
 =?us-ascii?Q?Y/pi3hEFqALEucZ9oY1MuVOwM+aUWSzbRWUpmBgpHCFV63oROmBwm+mZTHNL?=
 =?us-ascii?Q?PUZB56o4VPLA1WDGr3VYbZe+gIIYWX4QywPIA9oG2KMXQoiInFbcp2oSvn7g?=
 =?us-ascii?Q?YEr6CQ8mgeAdfbfpzYBAfqcpoFMDYHua2t6j2OkxGVRgxwrHQPMLReDYx/nn?=
 =?us-ascii?Q?Mb4Sot4/7PYYyVp04E/Lj8i43u0qveZNdBJ7+DW/XqTBc2MHC7JmKPh9JPez?=
 =?us-ascii?Q?z4xq7rYDPS0uWv+qStruaOYly8/5jClhJ+/DI0TIo0QO2mmtkNv/rpuBgHBE?=
 =?us-ascii?Q?XOHGRcO2OqlPBmRozhXcZKXNkZkcufcJzpwUugBux9DxgA22gcULHsAVu7Kz?=
 =?us-ascii?Q?ckeSXuwz+0KR+CZC3kYLnX24nTd3gulzM3AI/ekSKdBrsx/afC8osoFm8h35?=
 =?us-ascii?Q?5fD4LMsosI6ZoxvZdp+3ty0arTP+s4ylahQrKD1WDn/h1Q69uER3rw7YqGQq?=
 =?us-ascii?Q?7lDZtzHggkpNdwxWh2toXLgLaRuXoGKVprB0qwJFbA9ky7P++7iTWgePWD/u?=
 =?us-ascii?Q?IEbTqbcUiZGNouIPjxBeWGP8vrDxTpQ5oNbjhAesRFqNXp/OgxThn8e6xxaf?=
 =?us-ascii?Q?+UMgEDKuvmxWeXeSMg8tZtP5A0cJqyzh7CQL29P/bRJZ0PX1Bre9xEEc4ku1?=
 =?us-ascii?Q?0I20hjYcurjBXjgoIGRhaBrdtEdqswrZ2lh0y4Rfj8yRGZb9pwMFMnvwI+j+?=
 =?us-ascii?Q?Pn1BkpjUVKCrI8p5CyzyVlgjNX9NCB3ySIFGAAnkUsQJl9AVvOyanR0Rut+s?=
 =?us-ascii?Q?t6JIBX/buNgNMRAdKTY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90951ec8-6d13-4aa2-f55a-08dc8f72fba6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 08:45:19.0256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0JlGEk6IWRB5sZkZTLhbUvM3tOh6lSsFd65Y/l0uRGWx0Lwu7oh2XZCgzDxKETsqJUatbbohRfRRFKXON29pZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6784
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 18, 2024 11:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [i-g-t V6 5/6] tests/kms_dither: Use lib helper to check the
> pipe/output combo validity
>=20
> Use IGT lib helper intel_pipe_output_combo_valid() to make sure the selec=
ted
> pipe/output/mode combo is valid.
>=20
> V2: - Split the patch into multiple.
>=20
> Cc: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_dither.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c index
> af7b7f05c..21b1210b4 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -76,13 +76,10 @@ typedef struct {
>  /* Prepare test data. */
>  static void prepare_test(data_t *data, igt_output_t *output, enum pipe p=
)  {
> -	igt_display_t *display =3D &data->display;
>  	igt_pipe_t *pipe =3D &data->display.pipes[p];
>=20
>  	igt_assert(pipe);
>=20
> -	igt_display_reset(display);
> -
>  	data->primary =3D
>  		igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>=20
> @@ -205,6 +202,8 @@ run_dither_test(data_t *data, int fb_bpc, int
> fb_format, int output_bpc)
>  	igt_output_t *output;
>  	igt_display_t *display =3D &data->display;
>=20
> +	igt_display_reset(display);
> +
>  	for_each_connected_output(display, output) {
>  		enum pipe pipe;
>=20
> @@ -215,15 +214,20 @@ run_dither_test(data_t *data, int fb_bpc, int
> fb_format, int output_bpc)
>  			continue;
>=20
>  		for_each_pipe(display, pipe) {
> -			if (igt_pipe_connector_valid(pipe, output)) {
> -				igt_dynamic_f("pipe-%s-%s",
> -					      kmstest_pipe_name(pipe), output-
> >name)
> -					test_dithering(data, pipe, output,
> fb_bpc,
> -							fb_format,
> output_bpc);
> +			igt_output_set_pipe(output, pipe);
>=20
> -				/* One pipe is enough */
> -				break;
> +			if (!intel_pipe_output_combo_valid(display)) {
> +				igt_output_set_pipe(output, PIPE_NONE);
> +				continue;
>  			}
> +
> +			igt_dynamic_f("pipe-%s-%s",
> +					      kmstest_pipe_name(pipe), output-
> >name)
> +				test_dithering(data, pipe, output, fb_bpc,
> +							   fb_format,
> output_bpc);
> +
> +			/* One pipe is enough */
> +			break;
>  		}
>  	}
>  }
> --
> 2.43.2

