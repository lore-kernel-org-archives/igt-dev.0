Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A50CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 05:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B4910E187;
	Mon, 17 Nov 2025 05:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7fGBC/h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50FC10E187
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 05:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763356425; x=1794892425;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BKKrrqcvzd7J631T7YfxkAe2cEQkCGth5mOndmAnC+c=;
 b=d7fGBC/hF0cY0gVRjZXT4YjRWecnT9i5pPxUnqJyU0ASa0XG8le9Lo2K
 bYjrVWnKTwnlRB+EM5jQ6bFM8D1nvSckn5PyYRFwGDH3uB0qnjugpWGJz
 3sd/0mRBS4s/cNuvLnIg9X/Y8JPdYyosYVG/zeoN4KNb1+Vk0vtxYl2Yz
 7xVlf9ub6xp35u36H/CksrLHbuDGZSlybwjL52gWlBrLm5pSaXtPKj+OS
 VeEEBzUFblnAG3No9UPlOzBUnU1DQvpxGLqugqWfkFi1NN2rhmDdy8gPx
 HjxWWdbdM3qb863S/AWFbanExkST3EyBOCzy4042MgDT+adQI5LrB8Dx1 A==;
X-CSE-ConnectionGUID: fbtr1w6pTE2N3nIGmWeswA==
X-CSE-MsgGUID: Nd3O79BYRemill1kshWJrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="52917150"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="52917150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 21:13:45 -0800
X-CSE-ConnectionGUID: wMOfBow3Q9G+aMIIWxgAsw==
X-CSE-MsgGUID: FwNvnWlYTkGyeDMLTk/P8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="195298277"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 21:13:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 21:13:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 16 Nov 2025 21:13:43 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 21:13:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGOmrZYlz7eJk8/Vj2Rp10oSdS28r9srirO683LUeeCJh+kUy3WMw+U8zmO54+K74wlawBYN1bYI4NQrU6PgHZd+5heXiMibAVsYqYyI1NJ/IrI1vnEqkQAIsVmLhwJAlL7951u3tIFZLCktJERJtZ6u+8hSH5Of5H7LknTPFKDt3xPNfWIvwKRN4EaU3KioCv2WQZwbPb4XGdcP4Lx/J1fDn46b77glWcRVWYvfv29XQHZJc0oAGRQvgOSluhKqYoDsjmLM0LM/GDcgfsTGfQAbW9BCKRfQMzdVw6siNsguSxmwjnNd3yv8KXYl2dKB5VjQMF6EqIat+yKBZMft3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fi/mX5cgIYzgGXSCcoEWlZQz5HW1riTGEUpW4Nkg4kU=;
 b=f2kbhZwUUxTzGGtX5ksLHcPOo+HOGnbMp0hDDImD0OOqMVTWoph8boN8CfTLLPn2XIK+cfmqrUhVy/FNyqrNhis1/XHZ8VTDLXkJBA8dFJA6fetVxypursVupGNu8urcEHkgDx0S+0gILTXEH7iP4PF0H/PBT5loPsHNNYr+44cRN/yyg0Mf631Vk2Tx76PKOyNA/Rgl+L0h37kmJmz/3k/w94tR1StK+DU4Z8d4MU9MszyFJLXfZHmV9w57hjbl5tGNQc/4oiPNPKkEh6dweupiXiZnUqkTlHktaeiZTCHs92/s/HyK7z5XRtl+WG2SSQov6cGtK2QbiQeCoe0ngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH8PR11MB6755.namprd11.prod.outlook.com (2603:10b6:510:1ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 05:13:36 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 05:13:36 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Poosa, Karthik" <karthik.poosa@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH v1 2/2] tests/intel/kms_pm_vrsr: Add test to validate VRSR
 with runtime suspend
Thread-Topic: [PATCH v1 2/2] tests/intel/kms_pm_vrsr: Add test to validate
 VRSR with runtime suspend
Thread-Index: AQHcUzWKUuO2f1OMP0CEaQ7i9dwI+7T2WXVQ
Date: Mon, 17 Nov 2025 05:13:36 +0000
Message-ID: <PH7PR11MB6053FCBAAB36A05EB43CD987E7C9A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251111180004.11865-1-mohammed.thasleem@intel.com>
 <20251111180004.11865-3-mohammed.thasleem@intel.com>
In-Reply-To: <20251111180004.11865-3-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH8PR11MB6755:EE_
x-ms-office365-filtering-correlation-id: cf197ff2-edbd-4c20-8f3c-08de25981000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?iYmFG+xPZBb8SAP/Pk1CcpJPEXLAWAUL22+wakQVVsXRO43pJljvF5vYwt+s?=
 =?us-ascii?Q?fGP8gavE6Q4f0JsFWMCLfzmRy5heqY9/Asjd1AeUYeBnDu7CY3eQIb9U1ERL?=
 =?us-ascii?Q?B0Txrw+iJzsr9AumfGc6dsaolGWxFiI1oGJqML+LkauuZUWjrBd4SMW8m4RB?=
 =?us-ascii?Q?p0gfy6FlshFOlEy3Gozr3YlqpOFVlJUCgHxKAPMG08YSLOxg6bwPBoje8z5V?=
 =?us-ascii?Q?oxqnCEfBnyOtQOUVJBJEGb51qIqEjmKcLGKJiKigziPbhCIjUTwh0Zsyo25a?=
 =?us-ascii?Q?Up+bSF8I6YorU2FxHkWLYbt7O4jyg/l6qpRrod06TaWbtO80/blted2fHoYp?=
 =?us-ascii?Q?KHFK5g49SVkcQzRJhAKextirUYSg4Dmgk5vMF6F28yvsAJ4JXwsVxOiQss2o?=
 =?us-ascii?Q?qe518+8T6ENBUTogFtNESlOXTtUxMOSJn4cylE+t/x36fRQLSiOsbSuZ7n5Z?=
 =?us-ascii?Q?/O7kNA5nCUexI0xrKzKakniYW+jzp2ZCdS+uZGQnjJwUBe2iLR1HiEz+8J9e?=
 =?us-ascii?Q?97dKn7BwLEhlQIyXXouEmfze/qi3gqWX1mdWBjc6ugcT0HqJj136/wmltygP?=
 =?us-ascii?Q?5PaYAtQ+cO9eNKMyPfXcZvvORLVgERq+wUjrxpvqaSpWgz2qZCEPfBoVr9lK?=
 =?us-ascii?Q?cfjwGzkTulhLWv6Mgee0gONJQ3Jh+nXTPWjkb3k4sl/xgefMM9QS+aOggOLn?=
 =?us-ascii?Q?BgwtDKJpAdgtPFC6seSKg/qy0y0v25m1gs1+JEatDeqpZA01elMjyEkbQY9t?=
 =?us-ascii?Q?qRW10n+fMUaHJhtCmEuR1gI0O5iIhkbDHJ9Q9B94z2Qt0LjAzf5pxzGIPnlu?=
 =?us-ascii?Q?PCrxJiLPygDbmAZNzgAsqLHWtCktnVLfXGkim3ZBXdbK0oMD1s0FlQbFhSA0?=
 =?us-ascii?Q?EVpoOctyklyzpGFLQvIMdXbthe5q0gNICXNgW0JNYluyN8YS+gM38qxf5ogl?=
 =?us-ascii?Q?i0vNQVVJFVtAP5ijQ6/QGfaspToiJG32+117mu0C4TopvEbOdWeiw9q4gRKW?=
 =?us-ascii?Q?g3JNxvjrFaz/Gik7MD1ly5LVwqvyUbOGt+PMfHKvQ7HRm4cSKVtbTbKR8sAv?=
 =?us-ascii?Q?t5GPqTBIyX4kohKu70O/GOCzUyCaUlL5+s6jYPoPFeBaXgjgBoWF8ANYfO17?=
 =?us-ascii?Q?cW08Z0SSCFG/+mzJjN9nESAYI1YufwuTPmeEXsqN+mgdL4BzQHMxAhjdaSGa?=
 =?us-ascii?Q?009WzrRvYqYtURFDmMzB23qLz0bH4CtTtge2L4dvX3aby3yd/muFi4vSc/GC?=
 =?us-ascii?Q?iiMozjt0Twjj9YXpltvl7mtuA5yp06ja/P2H+n877lpCr4H9h26bmIgm1goQ?=
 =?us-ascii?Q?J8RNPVn0dxNIiYIv4Ir11bwxUi3Pnu7Ahz6U7CkfuZ92lREvd2eIrhDUGcDV?=
 =?us-ascii?Q?klqvBzPTvfqP9dQJ9qv1pQH4WekQsgbs25WLVBjhUA0ThFqq8xiZpSRdoe0x?=
 =?us-ascii?Q?Am+ocTk4ZhEuvvyQbK5IzKXGpN1ea1ueeuWpN8c3jYsCGCjFNB1pNdrbFmph?=
 =?us-ascii?Q?RcE5ouuBFRz65Wp7tbSGGBnK5q09wAE/aSJF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DU7+U0vA/cqxmLedh0ti8gd6Qv0QV8VpW4JKRz+kYpSE6l/aAfzPS28i/w/V?=
 =?us-ascii?Q?Kw8VqVab3gY85ERF+kE1K6JZH2lcGvoogrc1wyBqaRCF1S/lfsCF2v5rOX5/?=
 =?us-ascii?Q?WWRV2j1eztjtSKURL0L43U6THTaFJLDCoVlJjOwcpmPyUim2bi/GQWUMt5en?=
 =?us-ascii?Q?C8XYaLgys2N5H1nLLblYRUcV6CGub9UUsUNHdP3A9vTWPeqk/22nk0iBohFV?=
 =?us-ascii?Q?ho/jv5vRBXAyUjLOqbKdHllBFKbqkqi0mIPoxtvh7GX0MlO+t9nkNe2ns2zK?=
 =?us-ascii?Q?n2jUwJxhwu2dODAAJQJ43L3sYgLn50zywSETMEv7hJ2S10C0MH3HNTt2uxfb?=
 =?us-ascii?Q?bs0kcQTzBWir6Rq5oA8GPjrGXSyDgYCf9nZTdFKRssuzZuvVyQBCc36I/nrc?=
 =?us-ascii?Q?CL0MlN2kEhyiQL5suEOqquNXH13ayPP2NTuPcgbGegRLhdFIJmtiqnyGyJff?=
 =?us-ascii?Q?GWc3qoUjdDWBaR21f1mbkI7sUXIMQOOKc74ygym/no2GxxycoN3n1XOY5HxB?=
 =?us-ascii?Q?XyrnY/PGp8X6Pi+pVc4ERIGDFYyyu/EFUAkH9Rtxb39bgGCcWfPTUKxJJ4eQ?=
 =?us-ascii?Q?Urhx0SH8wCIOx9ofde5Mucvj2PzMiFmRVFNHiTamD6N8ljr1ZfRc8Xxi0CrF?=
 =?us-ascii?Q?Ci/z5jsCc6GrdMnJHrQDzO7WK4U3tHJyhav9MDv6RGckI5mSHzm6FsRR48SS?=
 =?us-ascii?Q?/5XZkOx39Pbjiuh4JCdG06mTp2DBW6uh/rZrjcjpn7aINvDTYp3NaV06NJmE?=
 =?us-ascii?Q?kM/H0X68GAvAEYphI1woIsRU8cOuqxyOJTPOVIkxbFn58Z6fD1/MXSyYnsgt?=
 =?us-ascii?Q?awV/cNFdPZxxmcanv+bu5AS9GO521ZkkcQMbx85CAzBXXTrFTbB+QH6coTup?=
 =?us-ascii?Q?L+fsM+ysAR8gB/45PPwzEK0on2Ndnvgl0+BeUF+AReciLGmxa7ljqwtIuHU5?=
 =?us-ascii?Q?9+8dJR+1QvmgabmGFRmGPLCmztaO90Fu6C1zqHDJlXe0eeMXnM0o3NoVZv48?=
 =?us-ascii?Q?xhnU1qxBQ3KQHcJHupkDrbm7MZen7griQ55naTXhdtdwdhIjzrSAPPE9Ksoh?=
 =?us-ascii?Q?HgmY6q850ZMFr1p4LJOyQ4vOVBgDb2XS+VOwBgjj3mUElNcuyr1N1BmvxTi5?=
 =?us-ascii?Q?g1GR0m42Re4EIFopb3hpEr/rLI3boNqzgacH9IIA7bl8owbgHJpuvGYY0o7k?=
 =?us-ascii?Q?7xw2RYIaS4C2FxUKlzmxdWugmDTY2/3OhlnoSskFnJpWbrd5zcNmarVGJpAx?=
 =?us-ascii?Q?yjJ19mAF4rOqRB97tbCsBIcZzNZhU/0yX4eWP4ZWY5uyBrtpEd+w/7fnR+1r?=
 =?us-ascii?Q?lYsQaYm7wSy5XbPutRa+htDS5QQ2oJkWitfbyivsb6C74BbwLA/n7pc+w/fm?=
 =?us-ascii?Q?GbMzNRmTSz940DCZDpyLdvLS9Qla76r2dbjETMglTPJP9hT9Q3SLRXYplGWL?=
 =?us-ascii?Q?oKDnbr+T23XwJtgq630DWKcvokPPECAWYOsx1pVsuRK38ifKI3kObZkyX7VK?=
 =?us-ascii?Q?i+/RAFRSDgKXSG38LwU5y6x+Nbp1vMSanS0bUsvBPBWSddN8ONQS2nXfYT0A?=
 =?us-ascii?Q?7OUDvt2zOy4JSDvrryDF3vb9mMIgEW3CIk+EgF5/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf197ff2-edbd-4c20-8f3c-08de25981000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 05:13:36.6343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wkSTr9qrNcg+tHpw303SYlztYgMLcK9PxpRAIYdKS+htWcshou3LJOki3SftKlGeGcu6e+h7BxitXvMXSh5UrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6755
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

Hi Thasleem,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Mohammed Thasleem
> Sent: Tuesday, November 11, 2025 11:30 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Poosa, Karthik <karthik.poosa@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>
> Subject: [PATCH v1 2/2] tests/intel/kms_pm_vrsr: Add test to validate VRS=
R
> with runtime suspend
>=20
> This test detect primary connected panel and also adds a test for VRAM Se=
lf
> Refresh (VRSR), focusing on display flips and power management efficiency=
. It
> handles transitions between power state like runtime suspend. The patch
> includes validation of VRAM residency and power state transitions, ensuri=
ng
> accurate testing of VRSR functionality.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_vrsr.c | 83
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_vrsr.c b/tests/intel/kms_pm_vrsr.c index
> 5a96eebfa..906563dd6 100644
> --- a/tests/intel/kms_pm_vrsr.c
> +++ b/tests/intel/kms_pm_vrsr.c
> @@ -46,6 +46,9 @@
>   * SUBTEST: vrsr-system-suspend
>   * Description: Validated VRSR during system suspend alongside active
> display flip
>   *
> + * SUBTEST: vrsr-runtime-suspend
> + * Description: Validated VRSR during runtime suspend alongside active
> + display flip
> + *
>   */
>=20
>  IGT_TEST_DESCRIPTION("This test to validate VRAM Self Refresh"); @@ -84,=
6
> +87,7 @@ typedef struct {
>=20
>  typedef enum {
>  	SUSPEND_SYSTEM,
> +	SUSPEND_RUNTIME
>  } suspend_type;
>=20
>  static void setup_primary(device_t *device) @@ -440,6 +444,63 @@
> test_exec(device_t device, int n_exec_queues, int n_execs,
>  	active_threads =3D 0;
>  }
>=20
> +static void dpms_on_off(device_t device, int mode) {
Why are you writing the full helper function in the test?
I feel this is redundant.

> +	int i;
> +
> +	if (!device.res)
> +		return;
> +
> +	for (i =3D 0; i < device.res->count_connectors; i++) {
> +		drmModeConnector *connector =3D
> drmModeGetConnectorCurrent(device.fd_xe,
> +
> device.res->connectors[i]);
> +
> +		if (!connector)
> +			continue;
> +
> +		if (connector->connection =3D=3D DRM_MODE_CONNECTED)
> +			kmstest_set_connector_dpms(device.fd_xe,
> connector, mode);
> +
> +		drmModeFreeConnector(connector);
> +	}
> +}
> +
> +static void cleanup_d3(device_t device) {
Same as above

> +	dpms_on_off(device, DRM_MODE_DPMS_ON); }
> +
> +static bool setup_d3(device_t device, enum igt_acpi_d_state state) {
Same as above

Regards,
Pranay

> +	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
> +		      "PCI power management capability not found\n");
> +
> +	dpms_on_off(device, DRM_MODE_DPMS_OFF);
> +
> +	/*
> +	 * The drm calls used for dpms status above will result in IOCTLs
> +	 * that might wake up the device. Let's ensure the device is back
> +	 * to a stable suspended state before we can proceed with the
> +	 * configuration below, since some strange failures were seen
> +	 * when d3cold_allowed is toggle while runtime is in a transition
> +	 * state.
> +	 */
> +	if
> (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
> +		return false;
> +
> +	switch (state) {
> +	case IGT_ACPI_D3Cold:
> +
> 	igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
> +		igt_pm_enable_pci_card_runtime_pm(device.pci_root,
> NULL);
> +		igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
> +		return true;
> +	default:
> +		igt_debug("Invalid D3 Selection\n");
> +	}
> +
> +	return false;
> +}
> +
>  static uint64_t get_mods_count(char *pkg_data)  {
>  	char *e;
> @@ -493,6 +554,11 @@ static void vrsr_suspend_test(device_t *device, int
> sysfs_fd, suspend_type type)
>  	case SUSPEND_SYSTEM:
>  		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
> SUSPEND_TEST_NONE);
>  		break;
> +	case SUSPEND_RUNTIME:
> +		igt_assert(setup_d3(*device, IGT_ACPI_D3Cold));
> +		sleep(1);
> +		igt_assert(in_d3(*device, IGT_ACPI_D3Cold));
> +		break;
>  	}
>=20
>  	mods_curr_value =3D read_mods(device->debugfs_fd); @@ -502,6
> +568,9 @@ static void vrsr_suspend_test(device_t *device, int sysfs_fd,
> suspend_type type)
>  	igt_assert_f(mods_curr_value > mods_prev_value,
>  		     "Mods residency is inaccurate: %" PRIu64 "\n",
> mods_curr_value);
>=20
> +	if (type =3D=3D SUSPEND_RUNTIME)
> +		cleanup_d3(*device);
> +
>  	cleanup(*device);
>  }
>=20
> @@ -522,6 +591,8 @@ igt_main
>  	char buf[256];
>  	device_t device;
>  	int sysfs_fd, ret;
> +	bool has_runtime_pm;
> +	uint32_t d3cold_allowed;
>=20
>  	igt_fixture {
>  		memset(&device, 0, sizeof(device));
> @@ -542,6 +613,8 @@ igt_main
>  		/* Always perform initial once-basic exec checking for health
> */
>  		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
>=20
> +		igt_pm_get_d3cold_allowed(device.pci_slot_name,
> &d3cold_allowed);
> +		has_runtime_pm =3D igt_setup_runtime_pm(device.fd_xe);
>  		sysfs_fd =3D igt_sysfs_open(device.fd_xe);
>  		device.res =3D drmModeGetResources(device.fd_xe);
>  		igt_install_exit_handler(kms_poll_state_restore);
> @@ -551,9 +624,19 @@ igt_main
>  	igt_subtest("vrsr-system-suspend")
>  		vrsr_suspend_test(&device, sysfs_fd, SUSPEND_SYSTEM);
>=20
> +	igt_describe("Validated VRSR during runtime suspend alongside
> active display flip");
> +	igt_subtest("vrsr-runtime-suspend") {
> +		igt_require_f(has_runtime_pm, "Runtime PM not
> available\n");
> +		vrsr_suspend_test(&device, sysfs_fd, SUSPEND_RUNTIME);
> +	}
> +
>  	igt_fixture {
>  		close(device.debugfs_fd);
>  		close(sysfs_fd);
> +		igt_pm_set_d3cold_allowed(device.pci_slot_name,
> d3cold_allowed);
> +
> +		if (has_runtime_pm)
> +			igt_restore_runtime_pm();
>  		drmModeFreeResources(device.res);
>  		igt_display_fini(&device.display);
>  		drm_close_driver(device.fd_xe);
> --
> 2.25.1

