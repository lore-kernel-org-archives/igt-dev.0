Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89066CA0EC4
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 16:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360C110E02B;
	Mon, 11 Aug 2025 16:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbpqnQqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B6210E02B
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 16:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754931561; x=1786467561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v1RB1QnYCSbdyqzRLM68id0Ue8aGzDDMpdJ+UpK3Qo8=;
 b=FbpqnQqrKmM8417eYNNO9PCRQDM9pImbrx0FKokSYZDa8zYQiqP7Iut1
 NsKjz5IygdfpD/WiVL4MLRpBXJSFuqroRPDNrW/z4djKws9ymBEshuYiB
 rHNcXJnpadgcDJNhIRUfLOal7gnNaJVGEmGm6U3VuWfutdeSnXe9yRKu6
 QH65A/7h8T6OQotJAY4ufZm/ZDACKuwQ2SJGnVaRvJE5gbAUWRtmJfEuj
 NJ6D/5W2X3Xarz4KAfBF0pfaulJdrjFVSZna+DJVm+qLIbTB+yKSBTTqY
 SRxksleM3kcd5kLcPZxBKfBSqqqXv9FR6MoCIYcruTYaXtYO+JuDpYxGe g==;
X-CSE-ConnectionGUID: 4qnRX9bhREC8RfsFpuio+w==
X-CSE-MsgGUID: TCPd9zNXTjWk+qh147g2UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="74777939"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="74777939"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 09:59:21 -0700
X-CSE-ConnectionGUID: v8EflShWTpia+ohhWmpDuQ==
X-CSE-MsgGUID: UVSIgmE1Sc6HGUUtZY0hsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165969417"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 09:59:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 09:59:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 09:59:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.77)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 09:59:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBlXK4vuFj2ghyLtdim6mZiF1nXKsx0vy5R+R/NOajDvNF9XualIgnVA0JK5FTXAvXBuoPovwlZRi/MuEI00Sq15U/2wRzYdyRBeAOXB3PuLpod5mFjmVUrAA6sW1XcAvwwHb7Yj8ycd73cpRqJa2gQCsT+rG22YpilGgk54z+ZVWJTeJe3N9KrhfJFy97eYid4061sk0qZtEn5tswAadBDRbZC8hhEQxVFl/8n4EDmrt6nQL5L3FmFfG2xtIB9kLkoKv6uuVwPUwI4xaYWM8TYRzApZ+5BQjlkoTb23q8587gmaWHrWIcOQPLHoRsJxh7ilfPzC7Q+su3WMIHQv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiZbcdGouZQGMnaTO4AAdj8rx3CBr6KUIER/wCqTBdQ=;
 b=Ruy/4lcJdw9zjO9DDz+3PcfD2jOy+vZTHWKwSYIeeAodGRPHftsIThFoFB9PMKdYaARpf3DilVTK1lkoE+D8MV/3PUn7oYwYu1uMg/jhfF78aFLEht8FdDItJcmHdBmeAldzzH7NrxmDtxylgFnU+vPlUVLULWsNmaLGoOz0rfjuuc21X/SR+t/7l1/vcaAZmBfjBUKCEYjTHohj2AgkTgEy9slXf/FtZ69ej+kMAwaPoG+SDs2ptbmEO4xDZUFWBL6Zy3gtBbhZu97THjDbrwoST13BD2WljZW9uPSbdRivtr43DtSGYIxrauwavTYWkubhxA+vVXomaEVWThsWwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 16:59:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.9009.021; Mon, 11 Aug 2025
 16:59:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "Atwood, Matthew S"
 <matthew.s.atwood@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] intel/xe_fault_injection : Update function name for
 xe_wa_init
Thread-Topic: [PATCH i-g-t] intel/xe_fault_injection : Update function name
 for xe_wa_init
Thread-Index: AQHcCtp6FR5fBVgF6kmKgJzrFmQbOrRdq24Q
Date: Mon, 11 Aug 2025 16:59:16 +0000
Message-ID: <CH0PR11MB5444DC212D93AA18424EE509E528A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250811161008.5355-1-himanshu.girotra@intel.com>
In-Reply-To: <20250811161008.5355-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB7356:EE_
x-ms-office365-filtering-correlation-id: 70f9d60e-d16f-432e-e460-08ddd8f867d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?U7EagivUB/eymZaiTBLSK0Lz2TypLki0qd181HA0iNQ/V3pWtbNsvecTGiwM?=
 =?us-ascii?Q?O0XU3Jw8PSfKZpek6N7P7UptOFlznq0DaR0zcXGDb1FbWYHy3gWVXKHtWeN3?=
 =?us-ascii?Q?xyeDs8TqtRFWs4W/X7okZwrWlZUnOZuKAKoMEdIeLJQOmBzeC34hXjKb1iXg?=
 =?us-ascii?Q?SCTOiRizLq5fsBC1vikIPx/TB/pQBZXYJpMXL8yjsZ8F/6kNNRtU2dpChlxK?=
 =?us-ascii?Q?NWuVWlmMxTrg6dp6fvEStv200pFw9d3pNhply4YzlfRzHO7Eu6R1wUdkfYyb?=
 =?us-ascii?Q?+8n0SQeOlNqOd+Hy3wkqXpR4UK3C7g+takT/W45Z1J6ITHFhvtZtdDFt4xGD?=
 =?us-ascii?Q?oUmad5+mRBt1SGeURNp6Pt10iWhJSDQP3v4Sf4nvE9LJV7OJArUTlkVZRBZ6?=
 =?us-ascii?Q?NZB0E8O+s8hqtR6IOrM3ScHe8wMRD3kye/Z3AB2exR738FflRXanVbidNasF?=
 =?us-ascii?Q?k3DcCQ7P0gXlKmjqIxq12FvynypKUv7QTWPbzlFiZqwZkts1jnNZsZpN5/al?=
 =?us-ascii?Q?4XjMx6ghS7v3n6++KpPBREvDhKcj3ICeuvvzbCDVrj/aiSFDWlj6TsbXkYOL?=
 =?us-ascii?Q?cUEmc+85JaS4FX9qV2HTmBO1GzRvyLaEUulLHyRahPojBnCam+NEgCwuHqPK?=
 =?us-ascii?Q?dWpPNoGSaBe/nzCv6gW5DW1BZFZ717x2mXlm+1N3vscDPfaTwSOLua/R7XDR?=
 =?us-ascii?Q?VQtvSCH721p7CAaLjY6q2hHMI9j0KS5N1KwgPFADv1/JTCZkKeBmzVyY+jKs?=
 =?us-ascii?Q?N+EboXzKfZClGfYcN/Cy9h8uVds5S8d/RP+aqNRG7lFoVwvHEr/eBA5Urlad?=
 =?us-ascii?Q?UyNjgNauqRlL4dARgyUrCBa6v0nZHrh0s6QkFEw5QPaVE5gS9d9pIp37wxLw?=
 =?us-ascii?Q?CBYBzg7gaNVvvOrVNxi7n7KZ3vERrPDvROymjSjzRMHXEHYaXpkyli3rHIG6?=
 =?us-ascii?Q?uwsn/juQH5sTfFgiznM8bkByKJV7pRJndUlTzSmvrX4SBVyQpBrMDQWANuna?=
 =?us-ascii?Q?PdkwOxkKiBHK2oOYibtnf/6rg9YfNnFqaPP1AIUv9TkSCEY7oyWKayw+L1RG?=
 =?us-ascii?Q?wI9jYA5i90lC71UzNAitciGn2P7t9xu0tbeM7vboWopMjSaqST0R/Zaxeh7C?=
 =?us-ascii?Q?rUigsDk4zp+KLiyrYAEHAckZrQgGlUFfUqNCuwGERtPCXKgrGK3rykNNyIXO?=
 =?us-ascii?Q?YzfjTy9Rfh1+sMHb7LUpz7AQSPhZb14AFV1XPYQfMAWG5k3dozggDXjLeshR?=
 =?us-ascii?Q?Hz93re0JybY/2ZOnlq4uodYXC+c06QXrKyHJ9+OQhPQj86j3ekirahubTl56?=
 =?us-ascii?Q?85aPUnKkGwukl16rBuSs4SZZ8qcqZUre+YXCt5mb7Y+VDwQ5nbfi8tAbgFRk?=
 =?us-ascii?Q?uYgRzr7JVJdz4qW4z/GBCDqHjBuJfUWFon2Ju5x3NowGiiMKU3ZMAYfsj7jm?=
 =?us-ascii?Q?s35P+09MOzw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uq/wnZbSyq5esKGIBmbduLzvAfNe7wH52WaiTVpgoFxyf1+2rHmS5Ez5ckSP?=
 =?us-ascii?Q?heUuPICTt6sRBGQLbtHCMHRhVr40N2Z2jgPVBFUx50HXZkuDjUU9EO63s2VJ?=
 =?us-ascii?Q?6g8vcH62Ydzjox/cBmSIcSPgzhW6hDfow7U0DdQ+POcy3oiVwT2Nhwr31/zq?=
 =?us-ascii?Q?O9OH0wwOK/lymKYxQskszEE6v00ixk2Qx8ZDECJsTaffetnkWgzVccPWwcYh?=
 =?us-ascii?Q?7v82S58f+jQlTZS8YWZwjZ376dYFjVELH7r2dseI38UtvTrBvlyo8wMN/CoQ?=
 =?us-ascii?Q?HGrkB0+LtJZLYV/0b8mtcXwzuy43MpaWO8w5QUO9frk/z7HOpg4876e1v7Mr?=
 =?us-ascii?Q?MkNdPAIW3G87BCXJBa+aQAm7WKY7E2+U61oYrhxp2m+LogvexNjAhEtp7FM+?=
 =?us-ascii?Q?85Wi6tWTsp+YUKkIu95YoW2kl1TDmcoUms6IXn8b9k1oIk+C1UBGZ5QIRN9+?=
 =?us-ascii?Q?dQ97gJoCOJCnR9n4VQ/ioqlHQiRxgWOcOGb1GkZ6mE6rYnVHduo31SPO0N02?=
 =?us-ascii?Q?F96Z4Mex6bSAzqozX2UqxELcneC6JVFzI6EcS6Gx/Y+TBs2xnr1XU3kuHsVv?=
 =?us-ascii?Q?zFPgmCQgN/uBfVtiJokwXU1YHTnWJ6xPw0x+QH2cQpvLGwf/GGBJRd9DIIH6?=
 =?us-ascii?Q?ayGqaVBQvl2clUHepE3SsG6gzszBBIq9VYoqgW+4qlilSNmpcRLYXyGYGh01?=
 =?us-ascii?Q?NQYXRxmURC/0UK41Rxu2upRPCMgyICOD0M9yeQ/bvMBL5eHwxvzz83OzwgQ9?=
 =?us-ascii?Q?lzvfPsBjONLEs2Scc0TjCee4IHV7zVpDV990PIqtGFcUryQIdeus4b9LHzNX?=
 =?us-ascii?Q?FuYeXdKDpBATEulhPI5vIHtQNFr61pHe21dF6u2N7ktYgJyNsC/e572SrW+2?=
 =?us-ascii?Q?GL+9EdpgbiZgu39x2wxHU5HvLJMLWvMtEfjZo4WYH2S47ygDiM6q7cah5ueE?=
 =?us-ascii?Q?GRZ2DUF9oS2lxO8c/J+fUCQrUBPhAyEihYWDy3bMt/6mIUFkQXfpNNtdybG9?=
 =?us-ascii?Q?YXAV+IkKUYlculnfGZB1c4qQNL30YkokMvwpE5Ats7MySq9STgw10WDowgaY?=
 =?us-ascii?Q?uCetEaY/1Nk3Lr/myA/KkdPQisqS0cbjUL/w4taZBg+g2+8jyztfMzzAW8ej?=
 =?us-ascii?Q?ywXwA6jEGpTG5FKQ1PpyIfUX29ITrmCxgq/myeA2sjmOrjTnZ/+cFfB+x2K1?=
 =?us-ascii?Q?g++9uuXSs4fKWIA3Kg3RWaZ6uCXHDUbA6WJT3B4ws6TcQO7JqbR/HKe5MlkD?=
 =?us-ascii?Q?mdWRkug+4/ie5Z54fWJ1Ii2wyJN0iIZPNtYS/YiPEjOGfzwQCuAzIbgt1CX8?=
 =?us-ascii?Q?KfoKulHEUHaKF8neUF6vDjbXpH4kptnQZv/e9RQ/m+ghRb7u15iphrbq5qV4?=
 =?us-ascii?Q?5zaaTZ0NPOTRGEC4aN9GCxeCPZDD44EfsJyiMY/1lOsmLDCHTv2TQstSRyJ4?=
 =?us-ascii?Q?6GrJkHGveRwcDaISEPZirPMO/0UQFwgs2zhkGlliEoDWc07JRfFp5KFwEXOh?=
 =?us-ascii?Q?+03h9KU821t0mlsnSX+XvCtrwfAqf7i37H1YCPLGQstyn9bfKqeS7OHE+Vub?=
 =?us-ascii?Q?ZE3MA0QZ14spfEFPVmQdAuOXH26VFoPoeKxcQphE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f9d60e-d16f-432e-e460-08ddd8f867d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 16:59:16.1425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k0gEkT4gHi+dP7VZiPynMNhHCsNFDTolO/k6bxHVdVDiwxF2LzUicV1wvoJb6J6oxGv5PZIZuyCCXSHxKtU10nA5G47/Z6hQf3Vbl1ctbPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of himanshu=
.girotra@intel.com
Sent: Monday, August 11, 2025 9:10 AM
To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Atwood, Matthew S=
 <matthew.s.atwood@intel.com>; igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] intel/xe_fault_injection : Update function name for =
xe_wa_init
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Update function xe_wa_init to xe_wa_gt_init as per latest kernel changes
> introduced in https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/342d1=
f84320994ab72a6ca96e18f2985868e1cbd
>=20
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Though, we should really try to find a scalable solution for this IGT
in the future so we don't have to keep updating the function names in
the test every time they get updated in the kernel.
-Jonathan Cavitt

> ---
>  tests/intel/xe_fault_injection.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 00d045cd8..04de2bfd5 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -256,7 +256,7 @@ static void ignore_fail_dump_in_dmesg(const char func=
tion_name[], bool enable)
>   * @xe_sriov_init:			xe_sriov_init
>   * @xe_tile_init_early:			xe_tile_init_early
>   * @xe_uc_fw_init:			xe_uc_fw_init
> - * @xe_wa_init:				xe_wa_init
> + * @xe_wa_gt_init:			xe_wa_gt_init
>   * @xe_wopcm_init:			xe_wopcm_init
>   */
>  static int
> @@ -562,7 +562,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL=
)
>  		{ "xe_sriov_init" },
>  		{ "xe_tile_init_early" },
>  		{ "xe_uc_fw_init" },
> -		{ "xe_wa_init" },
> +		{ "xe_wa_gt_init" },
>  		{ "xe_wopcm_init", 0, true },
>  		{ }
>  	};
> --=20
> 2.40.0
>=20
>=20
