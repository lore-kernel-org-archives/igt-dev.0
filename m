Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA11F506CF
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 05:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DDD10E2B2;
	Tue, 17 Mar 2026 05:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRbw2SXV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9787310E098
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 05:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773726081; x=1805262081;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hk8mDKGRcUgdaB6XdEMHyL6PCBU68p/3G2zDB/Grltk=;
 b=gRbw2SXVQ/EIXLvefmpFxlkbX6UZ3Jutb1MgMx9B7CA7QE0XxOxPexHo
 HtiG/CqpsBIJPucTx2yOWD91TzVZreWBvOAdqGafhtrPejIykebbq+3vK
 kIe5Y2KvI8l0D0gEbVcXFF3fWsQmwqnqvR3JVHkPwtTDhtwtlDyy028+/
 0Y4UxrcwXn59O6W+EWRPGZ1vVZqw2Ji61g9s1WSumhHnSjBomugNZh0MZ
 PpeIiNGVAcrE0Lk5Fk2aDah7xu1SpqGsRxxHafFpsvHOxYKJWUyG5Gf1x
 xWQRVIIj6JAbHd4XWDkIRtULSOd7fWqhbCXDN+2C5u1iSU6blV7cKjyNC g==;
X-CSE-ConnectionGUID: Rg3dYWCQSzCdfpihhz2TtQ==
X-CSE-MsgGUID: FBCsx7voRH++lnhytuNhXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85831076"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85831076"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:40:35 -0700
X-CSE-ConnectionGUID: QDc7kTlEQFaRsywPlxB1Cw==
X-CSE-MsgGUID: Pz3Je3C9QbqUeKepzScJcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="227123865"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:40:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:40:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 22:40:34 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:40:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DklPNFuxhsbliqXdUIYgCbnFZCKVs0kjH5NoPGCb+GVuXDEYtSc38GPUdFJ6SVeFZ6J91nEeDUG1I0lBgQ7dR+v34vrmLxN/Z2NoDcXXcfnqhI6F1S0KqfJPPUXgebTCg3E2si6yMhNxZ4YBWT8Ca96mq7RXfT9EaqGeBGfxvfz6G7pvEhJK+Wl1PmmRYBq/xvRuYzWz5NBhyDQVRGCnQMejA0p8zvxpiURFjIgARmAHowJ1SExa+F9Twy3x1wzn0GtqR+s1uo0X1Hnkd51oLanmm8EqVGBS50hyr3aXBzGaCbriK30baQMIjp0Vp4wehrMiIcGF0zerBj/mYleZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjGMIsIZ7Cs+jOccYp/zZHx/1gRUxgJ+kv7LTmdsF6o=;
 b=bJn7wGsAXRJWvF9hz+U706eCD17/8FZ6+Jo8GCCkgFt38szfJvm4X7soBzpXMy5wUbJ7lsDR5X8A63Faz7DSJtEltiSHNMTNG0xezv9c/c85bHd1Cwg4cujo7YDlNmBdfeHr1tFyD6i73nv1LHVegT+/YwSPqqu8O4nR/zMjQtFYEdIk67ObWqzl99iVoX6jee0YZ5z/zA+4qUhG+ir2luUfWQttKCvHX/DYHQA0NMHNgKb15BG2J56MTP3AjaMnck621jjwrtOo40hQX0AOf4LuOgQ9xJWvrT0DxxM9C6jcg3aXDvr54Xdljt78REFwUHIiIH/hObsS7b96GTj30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 05:40:28 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 05:40:28 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v1 01/17] lib/igt_pipe_crc: Add CRC stop-on-fail
 assertion and cleanup helper
Thread-Topic: [PATCH i-g-t v1 01/17] lib/igt_pipe_crc: Add CRC stop-on-fail
 assertion and cleanup helper
Thread-Index: AQHctR2dJ8Yf8aKp4UiaAr441vhJB7WyMlSAgAAAhMA=
Date: Tue, 17 Mar 2026 05:40:28 +0000
Message-ID: <PH7PR11MB6796EA81F2272C95691E3A3CE541A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260316084021.419580-1-sowmiya.s@intel.com>
 <20260316084021.419580-2-sowmiya.s@intel.com>
 <PH7PR11MB6053E0D8A4F03905886786AEE741A@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6053E0D8A4F03905886786AEE741A@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|MN6PR11MB8103:EE_
x-ms-office365-filtering-correlation-id: 501fdfd0-3e28-4697-2fa1-08de83e7b20f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: f9QLKVJzYrkdDAeY2UzXdvtacnwL+A3J3/EekrTWnxxqFdH7veCD9IvhiiV/xHx90z8HsVz4WYMigbo3fLIh02knK6NcAhWchIqX1bcD0wR+/5wCt+AaWSu1l89HEulaOa7+6HuInU/RwoOWbWmckNNUoY4XOg6PH3GqLy/1s0n1vaQAIbOkGvL+HKuZBMrKZnSelaCS6QKJIUcgn3IkVFjofF+IiYjBg7NV1VLLuAbFNMKCLzi02Nih72JsUUs85MYcXyBttdCJr5E3rwgFwILgYesnJzmm6ZYsM1ih8VgcHXNpV8gS9+gmgrm1DGWdksvCssgQMH5B7vTzOyxm+cyhH9R4sOdHNYQwneEB415hR1cPv7XPyjVMV8fvIWRRM6paixmz9WTrbracsMe42U0pL5TYxgsj9KWoPHMxxkqz/O3TD1fxI7VC1U49QeaPiNLgZ4soAV8yQQTrhcfk+9qJ+I5fS8zmuNzw3fZDFJ3799gMXua8jJFTLfrc1Z3oN3QOx3PO4qqX5eREZU54BsrVsr0TWI3yzIKSrkASPHEq8FHPDpbPIMyvecoICm7ysgT0xTXaxB96nRbYCxqpgFvK/T2Yt2jMl/pUuF4Z4JagbkF3A4Xm1omH9nO+Djf9ryN/WuWULl9eAtVDoRv71HG4c7E/4FPiurYLbbYnCwWb0xQJi2b68aX+wmH3JruNLaxCm4UBY4V6au6rmsqYUs9uJ8l7Nx2h7zIKnVP/bbkqeMnGx9Gp2y14Div3zPfkvnj5WKFVjgQ40lVrGgSNSfX2e9Dx3B/V432B4tQk5RM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BLh3FYD8uwqqqB69vul0i3OV9XT4PX9uBFjs+2+7FkC8frWKGpMHyG8jO7L1?=
 =?us-ascii?Q?/R5H2zTNAhonyxw032iNTOYmkyf5GYPS78I/i8YQAOm1aG74sKkpFTD/m/K/?=
 =?us-ascii?Q?wtQrqx+irCxJXUVJih/DHOJ/S6nU7MYvi/CWn2obCzGrBPm9kegYMq/WN4oa?=
 =?us-ascii?Q?uqbWEMI3kPN3eJD/5uJWlMke5Pe6piap7NhPlyN/XzzMag4aB5FUHEw0u/lw?=
 =?us-ascii?Q?wN9oTQAgm2SOHV7Zv26FasspKvVwEbx3+zJqNBlgblJ3JfUxZYaFr3z8xy+f?=
 =?us-ascii?Q?xNlOughqQDY6yw+vFsGPVgwOUb32+9s6YLfX1qGoZ2rLDTYLVCkFKSK/rD7a?=
 =?us-ascii?Q?QVCT9vH4Oli862rYdt8lzJrTQ9G41uw+pw53pcYhUEkQXrPHO+xlmAHWxHO6?=
 =?us-ascii?Q?Rv3KHA5gBJBY8150R62mDvujmA4mT3Cdd4jG5K8NIjzilvBJD5zrOqiOTACF?=
 =?us-ascii?Q?jCoKphvg0IlT8xvWbnl6KofKKQv/FjmxXNJ9r0f502a6LLo6n2mcQyrRYsS6?=
 =?us-ascii?Q?QE4LQAHxmL/aBw460Qve1nOKoLIGsO//QYdk/k/Bzx6T3A2oCplF6lffnPVJ?=
 =?us-ascii?Q?nXmlyEtyeLDOibXcsMSO0HvJsaQIlBvYLdBWn5Yt8gr0p6kUhyNmwcJ9BSib?=
 =?us-ascii?Q?qWArMCpn9IGHG5Z52h19MDYn09w7T2neUgegWqlF56ydTQjwJoMD/2Qpo/43?=
 =?us-ascii?Q?sD1z9qIkjrS7NE5X3E8T2cxirtM0/NkGbvOA6e+PdgjmjO8NkJdUpKB3VTBt?=
 =?us-ascii?Q?Y+on8iWKqWPzppKfQjbUz0GqcoQjj/pZKwO5GZ495LUh88QzmllNAOulnCKb?=
 =?us-ascii?Q?nlpfN6FpOJsoq7PMGrrYufsmhvfsF6Vjcb6ckPLH8l6oQi1xFZsJy7O/hV6u?=
 =?us-ascii?Q?6PLFMMK6IEAvRrw6eT8hHlXaPVccbA+YMX66jLQlAS7CxFIr1tIgnSJqpSp0?=
 =?us-ascii?Q?B+E/ZRkVXYDwp8Pj/2sht/6ynMQggMv7IcrxVN1Vp02xcWgVocGjGlGdgYDk?=
 =?us-ascii?Q?BEnEIFiDsJu7GB/sIfXL8Vou8jR8DNbDmVfU179l0H4uYUaj9R94E7i6a75F?=
 =?us-ascii?Q?qns4Byj3dWDJDo80s3V1psZg4iVW4ddmVBnTqx9tgCWMavVjPtVN8ppkg6Gq?=
 =?us-ascii?Q?kCC6DicGbiHa3Viu6R8vfPsuFK1OCyl0S0b1RMmAi9ddsGm4qJFQAKIzTrnT?=
 =?us-ascii?Q?fCZvDP0C5lCuDw7Hmtl/oOQm9hTBarTGAYJ+k88R8P7IsOe23Ey0btY2Vt+z?=
 =?us-ascii?Q?ox/LNQeZyGO5HQdBlz+hwMhfehpbiXlrewZT3p+y4koiUF21OiKp8if2Q+tQ?=
 =?us-ascii?Q?fy+SeGFpXQ8JCpVd8xx8wNKdQQMCwyaCxthtmRwlvNMnjmKR9YewCpi4yuwU?=
 =?us-ascii?Q?LDVVpIRuZnmKD0Zt96l9hXow70PaOzyBs1GzmQzwkylColP/ZEyb2uR3vjFN?=
 =?us-ascii?Q?g+sKf737+m3QUOQH4oyB7MGLUdT6XJS8F4JpH/pWK/yin8iXW1xNmC9QHOmK?=
 =?us-ascii?Q?AvnQ5o64UQyv7Ic7ycwa+ouNcIrnHwfeYZZm2Cl6UIbUgAD16uZaCc9CqPeA?=
 =?us-ascii?Q?nJEzIRM8UVvPufYlwU1hn9KYjcSCUaEfsyBnzOBgk5hrXFittdamAPCaxZ9k?=
 =?us-ascii?Q?UgKI1n/EFfyR+3QS5EidZI+YkGDBp+6jlPdah2QsqwGBwiWQzr2xgz4tOIpb?=
 =?us-ascii?Q?UBjxqSqJWaguBmo8s6hYfRwTAn7gYdmbEfrf14WBGeU8Mg5W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KSfwYhMRy62U2NCWqpYqRSRr9SxJsLKkEubWdIYhQFjfVP0krZpwPj9k46K/1iO6PcAzKIxBxKa+CyjjtFDGSQeo0wsHQ7zztrzjAnHw25+s7CEBNRmnkNLNjNbTvgFkvB6t/u31qmOnV6/Mr9iSW+/Ylov1sRITOkSMoi6VpN9umxNM610qvxwZM30tIcTIHoIRoiegrvGSmkZ3Q75ymFT+aESgPPzE4BT/hNXXAV6TVz/EU62gg4ueI7gBdTc6gh4ZTgoeSqs/bXZwhLza2sOkgA033ir32v9G5tGv7WWTRmH3ncIzNuSgzt4t4HhGoGs4nTcwtUwIMXJyh5lDMg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501fdfd0-3e28-4697-2fa1-08de83e7b20f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 05:40:28.0707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 02KkTOK3GJ4U3RlHC+BF6BacZ50ZYoz1IoKzzHbNo2FMWv+WSw10XVdrykfFWSq5kbA5DNkM7vYuyWmJ6qtVCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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

Hi Pranay,

> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: 17 March 2026 10:54
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: RE: [PATCH i-g-t v1 01/17] lib/igt_pipe_crc: Add CRC stop-on-fai=
l
> assertion and cleanup helper
>=20
>=20
> Hi Sowmiya,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Sowmiya S
> > Sent: Monday, March 16, 2026 2:10 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Sharma, Swati2
> > <swati2.sharma@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> > Subject: [PATCH i-g-t v1 01/17] lib/igt_pipe_crc: Add CRC stop-on-fail
> > assertion and cleanup helper
> >
> > Introduce two new helper functions to improve CRC-based test robustness=
:
> >
> > - igt_assert_crc_equal_stop_on_fail(): Wraps igt_check_crc_equal() with
> >   automatic pipe CRC stop on failure. Stops CRC collection before asser=
ting
> >   to prevent test hangs and resource leaks when a CRC mismatch is detec=
ted.
> >
> > - igt_pipe_crc_cleanup(): Safe cleanup helper that takes a double point=
er,
> >   stops CRC collection if active, frees the pipe_crc object and sets
> >   caller's pointer to NULL. Handles NULL and uninitialized pointers
> >   gracefully, making it suitable for use in test fixtures and teardown.
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  lib/igt_pipe_crc.c | 50
> > ++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_pipe_crc.h |  4 ++++
> >  2 files changed, 54 insertions(+)
> >
> > diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c index
> > 9a79edd51..12f13cd62 100644
> > --- a/lib/igt_pipe_crc.c
> > +++ b/lib/igt_pipe_crc.c
> > @@ -134,6 +134,30 @@ bool igt_check_crc_equal(const igt_crc_t *a,
> > const igt_crc_t *b)
> >  	return !mismatch;
> >  }
> >
> > +/**
> > + * igt_assert_crc_equal_stop_on_fail:
> > + * @pipe_crc: pipe CRC object to stop on assertion failure
> > + * @a: first pipe CRC value
> > + * @b: second pipe CRC value
> > + *
> > + * Compares two CRC values and asserts they match. Unlike
> > +igt_assert_crc_equal(),
> > + * this function automatically stops the pipe CRC collection on
> > +failure, preventing
> > + * test hangs and resource leaks.
> > + *
> > + * The pipe CRC is stopped before the assertion fails, ensuring clean
> > +test
> > + * termination. Detailed debug information (CRC index and values) is
> > +printed via
> > + * igt_check_crc_equal().
> > + */
> > +void igt_assert_crc_equal_stop_on_fail(igt_pipe_crc_t *pipe_crc,
> > +				       const igt_crc_t *a,
> > +				       const igt_crc_t *b)
> > +{
> > +	if (!igt_check_crc_equal(a, b) && !igt_skip_crc_compare) {
> > +		igt_pipe_crc_stop(pipe_crc);
> > +		igt_assert_f(false, "CRC mismatch\n");
> > +	}
> > +}
>=20
> In my opinion this helper is not really needed. It does two things at onc=
e (check
> + cleanup), which can be confusing.
> I feel existing helper igt_assert_crc_equal() is enough and clear, and te=
sts can
> do cleanup where needed.
>=20
> Regards,
> Pranay
>=20
When a CRC mismatch occurs in the middle of a test, if we don't stop the=20
CRC engine before failing the assertion, the active CRC file descriptor=20
remains open and continues collecting data.

This causes:
1. CRC buffer overflow during subsequent tests in the same run
2. Test hangs or cascading failures in later tests
3. Resource leaks that corrupt test results

The combined helper ensures CRC is stopped BEFORE assertion failure,=20
preventing these cascade failures. This is especially important in:
- Long test runs with multiple subtests
- CI pipelines running many tests in sequence
- Stress testing scenarios

If you still prefer explicit separation, we could:
1. Keep igt_pipe_crc_cleanup()=20
2. Add explicit igt_pipe_crc_stop() calls in error paths before assertions

Regards,
Sowmiya.
> > +
> >  /**
> >   * igt_crc_to_string_extended:
> >   * @crc: pipe CRC value to print
> > @@ -407,6 +431,32 @@ void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc)
> >  	pipe_crc->crc_fd =3D -1;
> >  }
> >
> > +/**
> > + * igt_pipe_crc_cleanup:
> > + * @pipe_crc: pointer to pipe CRC object to clean up
> > + *
> > + * Safely cleans up a pipe CRC object by stopping CRC collection if
> > +active,
> > + * freeing the associated resources, and setting the pointer to NULL.
> > + *
> > + * Takes a double pointer to allow the caller's reference to be
> > +cleared,
> > + * preventing potential use-after-free bugs. This function safely
> > +handles
> > + * NULL pointers and uninitialized CRC objects.
> > + *
> > + * This is the recommended cleanup function for use in test fixtures
> > +and
> > + * test teardown code.
> > + */
> > +void igt_pipe_crc_cleanup(igt_pipe_crc_t **pipe_crc) {
> > +	if (!pipe_crc || !*pipe_crc)
> > +		return;
> > +
> > +	if ((*pipe_crc)->crc_fd !=3D -1)
> > +		igt_pipe_crc_stop(*pipe_crc);
> > +
> > +	igt_pipe_crc_free(*pipe_crc);
> > +	*pipe_crc =3D NULL;
> > +}
> > +
> >  /**
> >   * igt_pipe_crc_get_crcs:
> >   * @pipe_crc: pipe CRC object
> > diff --git a/lib/igt_pipe_crc.h b/lib/igt_pipe_crc.h index
> > f648b2c92..1863edc14 100644
> > --- a/lib/igt_pipe_crc.h
> > +++ b/lib/igt_pipe_crc.h
> > @@ -41,6 +41,10 @@ typedef struct _igt_crc igt_crc_t;  bool
> > igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int
> > *index); void igt_assert_crc_equal(const igt_crc_t *a, const igt_crc_t
> > *b);  bool igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t
> > *b);
> > +void igt_assert_crc_equal_stop_on_fail(igt_pipe_crc_t *pipe_crc,
> > +				       const igt_crc_t *a,
> > +				       const igt_crc_t *b);
> > +void igt_pipe_crc_cleanup(igt_pipe_crc_t **pipe_crc);
> >  char *igt_crc_to_string_extended(igt_crc_t *crc, char delimiter, int
> > crc_size); char *igt_crc_to_string(igt_crc_t *crc);
> >
> > --
> > 2.43.0

