Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C77FCAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 10:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB0710E192;
	Mon, 22 Sep 2025 10:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edLTqP8I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEECC10E192
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 10:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758537303; x=1790073303;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w7bmgEyCJC+ypASBvF/IdJwCyZ3TcUexhuPOGg8EAZI=;
 b=edLTqP8ItGmL46+W5hs5egmQENYl5l0AJ65MtGg2rVaQqcxNM5FX7BJR
 hjttpbVMD6w34Ebj8xVTzq5ABXS8SHWP101Aw+UNTbf41qVFRV1D8CjBW
 GYs3m+he92m3wiSLfedgV/bPIEgTLqrGt1VsVife3LISAkCDhO1nUpm2O
 OSyC4ca4Y6hd2KbKwdBjzxse+6s4G24Vj/mFJnaWuU0STrNnplmfSDrF6
 ziTP62YSKVuONWEzdkLY/U+BJnu0nLoj1Zy6vhXFa5nqPJZze318+5YUb
 qB9z2gvd+B4OL6I9f9YIw4urSH8E0WLEE1gyaAJqytCY8jGKCMXnJrwD/ w==;
X-CSE-ConnectionGUID: LF3wUgsvT72CKI8eEk/EAw==
X-CSE-MsgGUID: EUSsRaUnTDWUJSzlBzhumw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60851782"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60851782"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 03:35:03 -0700
X-CSE-ConnectionGUID: yVcwllTlQ3OXGbd/+vafbA==
X-CSE-MsgGUID: UJkq2XzoRUGa8SxzfivRzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="175582480"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 03:35:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 03:35:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 03:35:01 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 03:35:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkK0b0Gu4vmnyCb0MaLteOA6hd6FjuW6hgAvjU74xQV4ko4glJrNWHmV0oLHBCvjlZTDqN7YguX/C8cLOunTtg6RI0W/ubvz84SmSJQdwx7zhR+dkeuh48RfuNIlLEwnb1V9XagIfmrI/kdmQzM74jTrxbj413np2olntZNfhX4UVPzf4XsGvn08x6hDXAGT81S2bKKPREh7RNJ3djb2DTc0alyLqt6naO5bPAgF0YsihfcLmxGgIh61LoGSdUibRDseKwbWFXmiaZH9GL/gUgIxOUdA+Dh6CiEZangKne3HdLfDiDJ0MNChScpqXUkLJl7jGvtyBxQkWYUXRvklrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b22Y/9KEZncibGh4tjktJwSZGppt8TnsDFOEpJhAR3M=;
 b=IcnjT98vKFlLgRt5T2GkhJMbyZ1PQd3m6Ku44jZc2HJKBtYtpmeSw8k5j4oaiRIzFvu+RcVb1ue5C7TQwTN36MPScCHzKACfJlond7DV0WP2t6GjiXFYoqgscHL9Asf96kqO9a10jFWBZ3piJruzqVBznA82skuaJmbTm2uTv7p0id//KnWIT5bvsU+u/lq9x/tgdRrXkzHid2njRGBa/QoEFV/XE9jck6Hz7ZsI6LZNxDTCqHuxbQFL3FdNi9fw7Ewg/JQuGEXqBwe3hhuedqYLy/DpGBS9yEfZAAyWq11stNPuAcb8oyak5uJBkEA25ya+fkiP4TdN/fj09w6TVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 PH3PPFE241D7F14.namprd11.prod.outlook.com (2603:10b6:518:1::d57) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Mon, 22 Sep
 2025 10:34:54 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c%3]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 10:34:54 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 0/3] extend lobf test for supported connectors
Thread-Topic: [PATCH i-g-t 0/3] extend lobf test for supported connectors
Thread-Index: AQHcK5KCtCHhov/3QUm+Vr0J35ihgbSfAUvg
Date: Mon, 22 Sep 2025 10:34:54 +0000
Message-ID: <DS0PR11MB80497898F32E2620ADF3AEC5F912A@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20250922074401.2494339-1-kunal1.joshi@intel.com>
In-Reply-To: <20250922074401.2494339-1-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|PH3PPFE241D7F14:EE_
x-ms-office365-filtering-correlation-id: 27da6ab4-56fc-4715-e515-08ddf9c3ab42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kjI+gAiqvZz7TWD5zBqC6gCmq8qTkM2bj67j60f3mc7Ox7HUDKlr/VLPT/y2?=
 =?us-ascii?Q?Z7B8tkt5IIY/Ye+9JOfJQojTQhrk679QfrrLcez6E7PHXIMU8a9ecQXe2tzf?=
 =?us-ascii?Q?ZEzoInlmK+XFWaTSowPDmRP5VGIhjUlBM08wZtn84hQxrbsmik4VkJM6iewU?=
 =?us-ascii?Q?4+LQ72KAspTHBDpoDA+2B7Sr2BlN4r8c6O7d4GvqdtckOwJ4FmDfALN8qvOb?=
 =?us-ascii?Q?rzMLIiLSJfR119PILdkNe+OxxT7Q+kZYctC9WUqO/sIExzdvWBA0Q7Y6Yz+M?=
 =?us-ascii?Q?LFcPbcl4bm9jsX204SV5vjj1grx2NFhsX3yRf2jAqBRcZnHJLQYZ2ysWU96X?=
 =?us-ascii?Q?/uGf/YtH0uzFlRIHYr2t0T5CJEQDHWXkxzirYlelp7WiGBX7Kv/kbxpN+2TN?=
 =?us-ascii?Q?cCgYc1ni4XeXBc1NzsZTTcn1Jj1OBypDuEhQ3tiOCheZ1UGAEX9HxiG2bb7A?=
 =?us-ascii?Q?YMoVi7ZwO8Vr8kjP3+HTQPcxabC8JjuYU1fPBAIaLjecCJmtD1unVIdlZW0h?=
 =?us-ascii?Q?jyy31nY33M1CNPmN4D5jYUapbIUHKzh1DE8LWpD+tk4ILuRaeuxunOoU/V0D?=
 =?us-ascii?Q?8FtTP7ZuQcVEg2hVAX0XhriNx2ma9fxlKTdqh+82pezhVztXEAINMFNUh/ej?=
 =?us-ascii?Q?5/pBCG0EB06NPvnjk8WebPlWEgp3PoWNJ1+qCrphdRdBjFKPPAIF5PA9GbTd?=
 =?us-ascii?Q?uBu6zbZ0WJWAHL6SiKyeUEV85s3CO4SC5ysXD3exrScEuI8QMGy5isUYKsO8?=
 =?us-ascii?Q?+U3AKezKoh35BDiEer0a2BrDyHtnTmqlsxMMhpvQHKNJzuiTqYZnV+7VoBSH?=
 =?us-ascii?Q?SysNNMeWKS9xl3dmNuFX6lDa80MdoAXf0Hp4dStB8eK1wHME+B7pjnSSTElt?=
 =?us-ascii?Q?KKDjdXudrwvMdt5raFTx6LYpcP3c7fSKNZ8JrLDsirNW9uWC4Fp6BOzS41g6?=
 =?us-ascii?Q?na7QUTRNlEcPrCGRQ9fk2moss1SR6A66Egpmkh48zQAWncOoatysHZFIuuJi?=
 =?us-ascii?Q?DcrcQpG00JQDFmKX7pyzxIbDFnN/ssFXLpHclLKnM0izY4YtyhQWnjiczXsE?=
 =?us-ascii?Q?Uq58tgblseqtlkwCLkZJvFUl4VXbZLN/xPtuU1D3EgR/LcXmyCr9h+dJ1mO+?=
 =?us-ascii?Q?L50napf6MHEZLlELfK4VZtUKWxmatHYmKa8N251/hPnLvk3xlAfdUT4tG8ch?=
 =?us-ascii?Q?bvZK4mG+QoEOWeAWuVuFeNAvxG85GkBezVt6pLth7G27aptxHBjHpJqhRdJF?=
 =?us-ascii?Q?35OTLjFfVEl82DK72yaOyJf6wp8qMWDWLWcd626BPJYOzG2KLD2riaRWeuSG?=
 =?us-ascii?Q?K5KaZemX7hJFiF744/qMKiDZye8CAqVNf7fW1Wt8+sQVIPbOZ2f407n7qUNQ?=
 =?us-ascii?Q?MtzQCXszlDguNOrYE1V6JoP8Vg4an27VTc0cb2aUbPk+PZzLb2kZAUXXCWDw?=
 =?us-ascii?Q?Vj7zEKYVdjBVRMvOOlAqLSX1icZxiF1at6embYH1lsefz5ozsN6lX/6P8Dxk?=
 =?us-ascii?Q?sqtxsiP5z4KxJv8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WnqJNKalm0/O7ZMkpIj73mkr41Y+3QcyRRC6Ae69rp5Zx/GB1hcFaelO/Pjk?=
 =?us-ascii?Q?DOU9rhcJ5DytddX0zXv4ZrOk4vsbzcwGE6Ei8PLrGJFLq/HmNGF/Di/MTaZT?=
 =?us-ascii?Q?yNWMem/knZ5Bz3Risq2Ukeev9XOQyUu/dnP/4qanE1KJUzbeaXfTHuKYv9sV?=
 =?us-ascii?Q?Q6gOhI5Py5euaB0Nb8+cdZE3dMaDOR2pnsjLgAFtJjsLug0GbbpB6Fkxj4Yx?=
 =?us-ascii?Q?I07XXjikrI9cf8Htb+uR9vmFWWsHdy0To2QXqCXQVDQoUweykf46YnWkhzUa?=
 =?us-ascii?Q?jC/kJpSl+Wc/jfUnrha/2HwdmjiSTAeM2D52GWFTQd9fVNk1IaHJeHbZPwae?=
 =?us-ascii?Q?HKFjpBhw9hcJBlYCjkDWpOFfAm3NdQK2J0bsjn096lQ/drWQk+qAc4W2zz4M?=
 =?us-ascii?Q?wH8q5ZeahCkldkG1uDcBHw501KVSYYpBcLtzjvRQEMCrHue14PY1eeOgW8N3?=
 =?us-ascii?Q?h1myNoMH89sr3OISNjVOcbV2cDBEOY3f/4RQaNeqa1+jCqAG/hhG7KeNVD49?=
 =?us-ascii?Q?qpq6sKMGmcw932vMQt9xS19CEi2pqcqkhCjoS0WxzULXukI68LZB+0VdmoDz?=
 =?us-ascii?Q?t9ugdbc43wZuoaURfOPqwwUwJE2+TGsFrC9/IX7ef/pzuIRS3iDdew9d+EZr?=
 =?us-ascii?Q?WoD0ilkz6cJ/Q0QG2OlWd8OIvXyIgAUrVwV9TP8YeS/3iuZmEPFLtB4rxU1o?=
 =?us-ascii?Q?6bTsmIJBvmSfBVWIZwZHsYU7erXBNSuw0pQwvXn9e29RrufSb/UheJnYxkLE?=
 =?us-ascii?Q?CZwr8huiT51RV3TnmGcJR9q5VkjaB6GNpJFeGwWo78na2INmZyogH9BisflE?=
 =?us-ascii?Q?RRo/W3TQVKSguGjWcMC7bUxkCz543d/uvyvitpzjVzjcaVaaipddw97kj00a?=
 =?us-ascii?Q?3g/jzhb7dzd9KAaHqtev0FTse1IGE3uuKcNnMsIDyMvBFcTd/oYJVkXcr32G?=
 =?us-ascii?Q?tcBcIvRYb+qye/+o0oFS0DztO1RJnR6BBK+WvgtTTbzyAreN7xgS0nsYbqmt?=
 =?us-ascii?Q?KmxuLTdwlqjENXHKhwzUZ4rjnkdCkV2GwSERatoUtpio852uzK7nkKC87rqZ?=
 =?us-ascii?Q?LKxC7t1G5VSThd1TCF/WEBmEl62AwR0k1b/943d7aDLOLbLRovSOYIb2KEDJ?=
 =?us-ascii?Q?92Yyrt8RHLaRoAdoO/fv9JkSQE4uxT8F2UyZJbanzIFjz2ptO0FxpOEkks6V?=
 =?us-ascii?Q?iKuANt+bz1RXlpZCOeT7NULsRiAmD5LZfQZ17tKXhzC4vA17hL7Zx+eu7p1V?=
 =?us-ascii?Q?gVYbyTv8rXqG1j8bdJzksAWPJtEUrzrapQk0kIJKp796q3h1WGtqG/8phWlo?=
 =?us-ascii?Q?hJBCnODIaW62PDQ469AhBHNlo63w+F8sk+hlWOvYY7mxLXZR7rkYQ6eGuE5z?=
 =?us-ascii?Q?IR6JwyFQvpM2/6NPYs4ybLTehRLfUHi+jGmx/nNYEpaDEm3MgQ4czxzv+/j/?=
 =?us-ascii?Q?VR0Ztdv1jAkh62DoogJA7y0mauv2ApoY1DUlMqyEYIv0S5bEejQ5uxmRdcE3?=
 =?us-ascii?Q?mNOcpvA+cDIXS6ZsYno+SkjGNJ93HnJDwRtAAqhlmhXcqzl/wDCwAyGml1fX?=
 =?us-ascii?Q?OX8BxyuGztSSuQnUUy4pVPNvysdSH9LBPdEgUQ6u?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27da6ab4-56fc-4715-e515-08ddf9c3ab42
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 10:34:54.3404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xnz5+gqBMX2YHCHUKYoNQjpvGohptJHno6qAgoFYiDjVhBxg/qGpCqRmgIrt3oQvsMW50+Bs2gbdZ5pUkT8apQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE241D7F14
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Monday, September 22, 2025 1:14 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>
> Subject: [PATCH i-g-t 0/3] extend lobf test for supported connectors
>=20
> Extend lobf test for all connectors that exposes i915_edp_lobf_status
> debugfs
>=20
> Kunal Joshi (3):
>   lib/igt_kms: add helper to check presence of lobf debugfs
>   tests/kms_vrr: extend lobf test for supported connectors
>   tests/kms_vrr: remove check for PR support in sink

Acked-by: Animesh Manna <animesh.manna@intel.com>

>=20
>  lib/igt_kms.c   | 20 ++++++++++++++++++++
>  lib/igt_kms.h   |  1 +
>  tests/kms_vrr.c |  8 ++++----
>  3 files changed, 25 insertions(+), 4 deletions(-)
>=20
> --
> 2.25.1

