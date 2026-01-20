Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57F7D2ED01
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 03:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EEE10E0A8;
	Tue, 20 Jan 2026 03:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c++8Ec/1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1B910E0A8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 03:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768878135; x=1800414135;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DjIZKubdPYyfcZfuagj/FweJ58kETzfTpef08qjJxW4=;
 b=c++8Ec/1j6SBtBOYxPGv4HVkmTB8o9ahcjb+lGwBZZc4VRI+IeRzswIP
 iN2NavKAAzA8DlrnAEoh6cYFEVRFCv0ydPvX6t5MBodz/E2JSlb7Idnuy
 yc58PgJceJBuk5XSxKpJ202w2X8MYZTLTckoAVrtvRy3n1oe/mPpPKMjv
 SEZpZ7cW7ydo71HZWRj/rt0njZFmdjQ6afv5X0w2y6Ls3TjmsYutjv/5D
 PTYgFwgFODINY+stlFiQZcUQQnNIAL8IL3s9579LF3hNQ2n2jpR9eksin
 vPzcAdlQ3e9Q92tJtthbohapqe5eP+LMS3XTvc0KoX6obP3WqhimqW9iw A==;
X-CSE-ConnectionGUID: xZs12Ga+Q8a742JSqBKVfw==
X-CSE-MsgGUID: U9S6zpbeRfaQPsBFxYQK+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80382624"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="80382624"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:02:15 -0800
X-CSE-ConnectionGUID: GX3W/VJXTCSR71NIMEd7Wg==
X-CSE-MsgGUID: F93PdZhnSQSbH9q705YA7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="205627737"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:02:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:02:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 19:02:13 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:02:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIHuq+LoGOgZH2oSEz8vX3sjweguskvggPLiqm34K0wmshGNfm3gATxHLUaifE2jvO+stv6feXRt5mgwy4TwKvofx1iJbQWJ2iHfYds7dceijaRMFYecZOnP1WwbGihmx557PjlCH7iThHz0SF5bjVCM8Oec5g2U86cdAUhSh8GbdvRL6A3upxyEDS1cuD8RKaXEd6BARes6EgBD/W7uCRmOTjFtrTgMOnoK3GsX3v7e/f6NRhZt+me7vvD8s8uJisCsTZKFoD/WiAK/Gfzl1prwtx7eynk2KRCfKM2rp5ObV4hShC1bX0mCLfQkyl7dnSepI5Gni/cznx1XFir/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnE9ZNZu55SDnyptep57+rWGNsEqBR+SqGHnwMDhdBk=;
 b=lq3wGvISm9QxstlgYYcQ5oM/DouXIqxlNfi09ITXOjseYpNBegWQjXuPu3Kn838Jm03REMDUy35ymAHRksEbsbVst2ztRUL2aDDy0cNcn4j7DaSKpMiYoxsofMdwCCKliDXry828Wo1AJ+PRixehc9E2sY6b0X2eSQvL91ydpWxZN4xIT9w9L8e845AQt7E3GGq40WHFXCUJdc4hRs2Q2q7+zlyEOfZLiylbJ3xjMq61ENurfhr/hnpLpbts9dktZO9Q0/Cpa0QUmsDcq0uA5JomegVf0a/d5HOst4tggCZUj2f2L+SFgqoKrzaDIwJdnYxZ3z89W5yNnx4juwwNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV3PR11MB8742.namprd11.prod.outlook.com
 (2603:10b6:408:212::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:02:05 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:02:05 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Alex Hung <alex.hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>
Subject: RE: [PATCH 1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
Thread-Topic: [PATCH 1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
Thread-Index: AQHciZUDsMJJe9ItkU24/ViCIw6iXrVaXtpg
Date: Tue, 20 Jan 2026 03:02:05 +0000
Message-ID: <DM3PPF208195D8DF69335A6195C2064A37CE389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119224237.561000-1-alex.hung@amd.com>
In-Reply-To: <20260119224237.561000-1-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV3PR11MB8742:EE_
x-ms-office365-filtering-correlation-id: d172df9c-5921-4266-bcb9-08de57d04adc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Z5uBexhNbdXrJhbHPvnJAhLcGbTZhy+z01ogRj3jPJZw9nRVFtzOMWSgRQPJ?=
 =?us-ascii?Q?FJuLkn4ScCQn7J43muH76TITwby4dorill902TZmYx+FCOGzbMIQ2bFlqGPe?=
 =?us-ascii?Q?t5iUtNIeHBonWTSTjMHqa9Iv4hYH7wBOBIVXEVaoJWGxGbXHSJealM9Rjtqt?=
 =?us-ascii?Q?Jv7SreyY6tAyO3r9IfxY+RxwAE1Mf+nP/9GhgwJDnWi3K22iJ+z17+/Njd8b?=
 =?us-ascii?Q?gJr639ruJzH8X8YH+ZksijXo7XROLLX7pbhMITYruXUXWcg7Gx1eZlWI51g1?=
 =?us-ascii?Q?Jn75IsjOm1Jwa5xPOUwXn+WRRZ5sRHzPKxAFyAQ3uZwIaUbNfXweEAKZAxFl?=
 =?us-ascii?Q?hrUwnS9Is8z+Fctdatx8YwN4SZYiUzaJaazSJh9b4idZXAUwCFvTpJ0XLNKP?=
 =?us-ascii?Q?n6JvppkpLHH5MTt7s7bsjWxVjlTLkRCcF2TkCRPmPdVsSpXcealJWNjuaxUb?=
 =?us-ascii?Q?lRBGQ6gwHAN+98YB0hwxSN/8pbGfz5w020HaNWA0zhpsn6obvqWBV0AcdqXO?=
 =?us-ascii?Q?IXbYTXYABHFDCi9tup4g8JnM6EkXl/B3m/sqGjdegpZLSOkokDjVub8k17ut?=
 =?us-ascii?Q?5ou5wMepbPGq7hMg3Kp5req9OdavQ+6pu3jCCVKazeJrYiAc1K+OiC1OiaES?=
 =?us-ascii?Q?zPu5KTWLJR2UEv2QJigDgJF2laqARe/6CAfaOJTXvXpePi6DzTqp71Ywyf47?=
 =?us-ascii?Q?FxjI6NY4SfdQYH2b6gd5i9SHpeYPTPXdAzwa7MGmn/JB6BtRjjIN7KCUC9tc?=
 =?us-ascii?Q?hePAznnK5Lj2NmRj9Q3TsK7iEQLSaCGQth0qVCL9XyOB0gHDlFPT8j70fgjI?=
 =?us-ascii?Q?P43T3J7Ay8r0bktKduXouyZMdrxsu4hMy5YyVKExmm+0i8M25WjF/bD3tyYG?=
 =?us-ascii?Q?mBwSzkE2RNfUb2wm2zq1yXw/C43T+WO/KVqLRXnKs/AP5LLSy5/vjnV8EDQu?=
 =?us-ascii?Q?pLudsKSwjs1JSm83dxVpAzfbVU2g6OrlDPeIkFG/a9BmSl7ds7AdDQzZBRf+?=
 =?us-ascii?Q?432LWqsm5eag8cF4FC98P/cqY174zvE+iqplDcTaypUgG7FUC+jKSoCN4gYm?=
 =?us-ascii?Q?E0jH5VFICRDXifjCSvRUEYRnaGUvO/YI5wzeTDftXk7fwFDoFHvFrSprvpqa?=
 =?us-ascii?Q?u+Putufd9ph7W0/yc41QYmaa3AO9KTNr5sT3A2Mgp0H7ERSusLpG3XFF8AQf?=
 =?us-ascii?Q?Ml658FYb9OM3W7aVHHsHqdEyFz9U2V3gfzll4DVDsUe/H6MIKhjylr2yzWPt?=
 =?us-ascii?Q?X8uxcePT8yYbx7FVqitDrtTIPWrx1M14hEalnX8QJfg2gBmS5wndI9aDoh7E?=
 =?us-ascii?Q?4l/sODd/PdU1ag3FHdmQyOzs5Hmp8cDxKTvliScBXxucx/Rv8pCFFagMRFhl?=
 =?us-ascii?Q?bggL4UGL1KyLViWMKKZutQi/q7s1sWQ0TQByDAiXFPdKy62Cr/WzqcGgJN4N?=
 =?us-ascii?Q?XnjxM8yjIRmmJ0hcJ4sjjVpcWQGNHpjsCsIjnAPNuwigAl3L2/hRmxMpABe2?=
 =?us-ascii?Q?HQsx9tmSOpDQxYaUOtMKa+WXGphmJW6TJclC5g8PNX2mnL7S7D/9ev2L5P9Z?=
 =?us-ascii?Q?1/b8BTOH/BPyPXED5OmmhA0UaWkVF2lOpFz9Lnos89t8U6q+POD6y8I+Szvt?=
 =?us-ascii?Q?AHrxU8gw9dvAxbaq+FYnUpA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0Q8k0ekUpl/ms6+iDU+AxeAmlO5gDHF4ue/DUVOFtsJQRy2sqWu+tGZcGlPq?=
 =?us-ascii?Q?y5fhFWhxGnrkma/YMhLL/Uc9i6b7TputJosJuf6ofXf6T7sPisgYNYwYA5Hx?=
 =?us-ascii?Q?MWHVTpmOdsz9QfCraxB82xQEVIaGiDg7hLBkGpbqHhJ1Otf++LCB9I97TBBG?=
 =?us-ascii?Q?3VVvYqfyVSV+8mAV8GyEccTqH+mXF0cd4SuXMUL84yrahrVwGUtk7DrkSSdt?=
 =?us-ascii?Q?7YlfeP5RmO06B5nWc9d2IcQNxs7X8hrIo9Q+rWL8fjpA+rsbK1Tkgn+Yuqvy?=
 =?us-ascii?Q?yYZnvDxTogRqKfF5SDxZZIq4/qr/XC1jnyb1XMomiPArl/q7PRThh4mS3xfV?=
 =?us-ascii?Q?GZtqwAyDwC39SCD0wpS1JOi2SKLxbdUv7A6zMluhC7b3YldGw/pZvsj3L5v1?=
 =?us-ascii?Q?S50rhOsK5N0GNU91oYSSfznLq76PNPXzcpuR+Wa9FU4JhsHBZ5UkHGb7ruSt?=
 =?us-ascii?Q?5gm7aAFM/n/5kL19IW21GqKb9gi1r+V/EU3CwIzCYdh4sA6iaq4H3HQg2P6l?=
 =?us-ascii?Q?q3T5nLNZQNGoeeAfYramOpjcAhhT64cOTKmUvQ/8RtAg6uP97DjSs0mZ5ykN?=
 =?us-ascii?Q?DSO6qCpPdkpiWRY5K4aViVJYgu6p5GJnuuiKOimXawGJ+yAp8qpOPZHLeZEN?=
 =?us-ascii?Q?zZ/KXU9p2/gUBYpLosEi+8+uF+TYae5uBlaGZsJOILuZMsFHskv8ehi7ZzQz?=
 =?us-ascii?Q?fqBML9FBWosNvGAr9wDt7WEOLiU9SAkBbtXKrc7IFoUjXBd7OUpGF1w2rzQp?=
 =?us-ascii?Q?bPBGjkYRYI7/oYpksFWx2plj3+D8OxxGtSRdKh7eI7f6PEJeK64Lm8kY3RcF?=
 =?us-ascii?Q?Jvz1Ni0zEl4VVXUfm+IX0TnIA4wHWPNde8SO8W4Nx+N82q6uLIQujQeJMclc?=
 =?us-ascii?Q?d27YLsNYBOWvGvAnqK6ZL/+aBi9WzxoyJtlRwUcQEvEXWLfW5a2lhpOFUYn0?=
 =?us-ascii?Q?TcdhuOlsX8hjhb16PyF33ldaDzzl6CT2IGCcXibwetVtQO+Z+brGiya47kwQ?=
 =?us-ascii?Q?DcJsLGIYpOoLDliNhCLOMNKmxZnEBzH+yGw977CH/CKZJC1qWIZlsMkwS7hE?=
 =?us-ascii?Q?K5gxT+Dtm6YgmpC8SFTsLwoL2GK7N1x9rmUHZjYIHiwu/oQH+RJ5twcdsbfw?=
 =?us-ascii?Q?xavZGWfnt4OBXPPAmYOe/vaJje0RplOQ9xOIN7XIOQYO/SvFovCIbyI/kCBU?=
 =?us-ascii?Q?vcUlBbt1Eqb+cBnz5JoFQWw4ucYEkqpV6XbEcgaGycS/ptpltyOJSoJmpH3i?=
 =?us-ascii?Q?ASwPDGv3amb25qrj0d5atWLcMVBAo4db97tIp5/uIHDnxBPMzuSE8OJ52y5I?=
 =?us-ascii?Q?rbSAxZ/mZJjaya1f/OIJLJtoKJ0QkSpPVVGQ//VkwTDpZzQBbmZFakyAErt7?=
 =?us-ascii?Q?In0GViiNjPBW0rXn7PcOVu3d0Lda3exIQETcsb/QPQFqBX/tjltnzGSVSmcP?=
 =?us-ascii?Q?zxMDiIL4AJd+Ju63JBD0esVvXbdM2M+nsX4zbC0BtgLDu22t24eZ8E01gay0?=
 =?us-ascii?Q?zAoEPnyEiGJvpprhBK3b+qE2o+RQaGJeVK1oiTZE7U4fWgsPo9k58qoSoPqI?=
 =?us-ascii?Q?Woq/UEUEC+FhsYyBATlGi1aiBEupM959ZPWvI1N/kP8/wmhi4l+YEh/n+4vY?=
 =?us-ascii?Q?HBKtd6x9L9TKgxiSdW3I7JR9QfJIUc+4smkaAuGZeVi4vdTlLWGEeBDotaW0?=
 =?us-ascii?Q?5aT8js9ktaUvPL93KkdmTQ/zR8KgfDTHGBv22WML8ucgx6JjR9qAZVISZkbN?=
 =?us-ascii?Q?j1Q7pZcFiQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d172df9c-5921-4266-bcb9-08de57d04adc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 03:02:05.3396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qfDcFkP5Rc2yK9GgaCO+3ngMKLbM0x7P2KvKKWn9nnERJTobC7Qg80PRblQhgA0hgNIGq7M1sB8qUoveWcqIaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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

> Subject: [PATCH 1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
>=20
> MAX_NUM_COLOROPS =3D 128 is too small for some hardware and it stops
> kms_writeback from running.

How does that stop from kms writeback from running needs to be mentioned in=
 the commit message here.
Also curious myself ?

Regards,
Suraj Kandpal

>=20
> Double MAX_NUM_COLOROPS to 256 to avoid future frequent changes.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  lib/igt_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 77b3ae2af..dfdebb83f 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -92,7 +92,7 @@
>  #define MAX_CONNECTORS 32
>  #define MAX_EDID 2
>  #define DISPLAY_TILE_BLOCK 0x12
> -#define MAX_NUM_COLOROPS 128
> +#define MAX_NUM_COLOROPS 256
>=20
>  typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const =
char
> *value);
>=20
> --
> 2.43.0

