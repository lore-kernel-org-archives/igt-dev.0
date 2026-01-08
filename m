Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE0CD1489D
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 05:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AE510E699;
	Thu,  8 Jan 2026 05:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pu6y8e0N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7770410E693
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 05:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767849492; x=1799385492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3yTi37zjT6VvhL0oMjmFPwiol+0bFl9JisD153nLqSI=;
 b=Pu6y8e0N3emOYSTCXJTql7SkleTCp9xdetLONC7N8xJAcGexCBsyAvVk
 JNoNic/HziybpMKGYGdFs/aLQ4kq7M0Y3iue5V2YcPiJ2+7uR9CXlrpbk
 0i9UMBOW4Auj1nmYHBTu2hAqvnskQSZAxHJTOKg+5o6s4CkxwtirGgvXz
 R0xFP1OKHi1S5Pc15AoX4zBwRAcKOvs1QLGsHm4uXpCKnJhgfxD4iThXg
 8OASzTPgjkyLjVLjyAbJL/3vuFGiExvePAfd70PL1HpVqo2BsHAr85QwC
 3pqUC532GRDUwasteTmwn5dKVWu7HT1+mHKUsXM+eOtik5sLVVPyeBAzC w==;
X-CSE-ConnectionGUID: wI5IhepkQX2O8ke3nbii/g==
X-CSE-MsgGUID: MzAsfJpMQLWD9Ij2l67wLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73079111"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="73079111"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:18:12 -0800
X-CSE-ConnectionGUID: x7VWOWdHSzWvsJmTLPKWeA==
X-CSE-MsgGUID: 2WSddDsiRFSPmGoZnMhrWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="207249977"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:18:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:18:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 21:18:11 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:18:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyaWwJnX8/fxie1J5OUVADwMZfSXIPNmIUR6KmXmdNledE5p/hPM7WAI43bbfBX72XwHGBb5LgLWSWQerHCLfeYUlJIVkgoz+j5lFClNU60cRJcoVdL2dcZh3WhcbyvGoAKmkDT6BMCvE84aC/epnYJSJDxxIoeV03Hq+XZm6/4wrtDG3bLBuPlFNMUQq5fe1HQ2WwBPVBq4gq2or9vyAPyqjf/6NQKOpCNTl9EhNpIELC+nLs8aP2rHpvke0+fXVCBj204Rn0VojFb3yKTTGSyGceKR4ePMGAH5PEM7xSNdqEVdexKf2YUmZnEkQTarrxObKIsrLSjr1OvAYsNPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTEzrPjzGCIfLmtPgtYCvJVc+OTkWcQn9+C9y6BtsKQ=;
 b=vYjeDHQCgLx3+e3ZS9LoxuGP9tLTFzE+KNr7KvN72s/GuYhNwxzGfvs5bn0rLLbDhpWw07o2O8ZU2MGJ4yNJg6Vff/H6NY0I8BjwZTd2AbYKIx1jsuk42fSAdVWv8QYhNvrmrG+1QIsScOR1w3yWDtz1Uozm5R2R/IGQn5ptOuHU3Slq/XWFdrUfOW3YMiT/wdJ0yvRD5ztfOryYKenxUejN+9pSFQ0oUk4aFyWJKeE2kdQSb+VhAB5zQgljVkpaGtjiAJk4D2kzF0M66gPHKRmx6sQHLKm4daSXYyX5D2qUrMfNuotfdLF3rxxlipiPng2+xU88/ICHzJDXi47cCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 05:18:04 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:18:04 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v4 3/6] tests/kms_writeback: Add intel specific check
Thread-Topic: [PATCH i-g-t v4 3/6] tests/kms_writeback: Add intel specific
 check
Thread-Index: AQHcZDa33+1d8CeL+kmojTMb3hqVk7VH87MQ
Date: Thu, 8 Jan 2026 05:18:04 +0000
Message-ID: <DM3PPF208195D8D0E7D1CB98C5CFA848B57E385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
 <20251203094307.3187669-4-sowmiya.s@intel.com>
In-Reply-To: <20251203094307.3187669-4-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA0PR11MB8399:EE_
x-ms-office365-filtering-correlation-id: bbb186f9-576d-4bc0-6654-08de4e754ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?R3DfOb3xDt9nlddosalK/DK9eComCH8fUFtpDTxLiYxWP1bggYgdtxkAaTX7?=
 =?us-ascii?Q?dsonjhkdC8tCQDLlpysxdBhqri7iQOnf84mHECDLBwnKRM2GvVUoQ5LTCxlT?=
 =?us-ascii?Q?l2E0HK7h22IwuDdzGXMb6+MwPobXrlR3eGTiAFbvXhuhqdKfPFuzQgPsq++y?=
 =?us-ascii?Q?cz/Py1P7A/o6SryL8rqmdB/cWBoRtc8RmLwQ9PPQbTZh1uR9X8p3Y18Ed/hI?=
 =?us-ascii?Q?vQgDTHxMYV8gk/R27Il22qEyZ0HWT/aVTFc8D98uMNiXEJAArKXOzG9IXazu?=
 =?us-ascii?Q?Mel5CS9Cnui/IhXXvfLVgDDxUoymd0gxNgkYNCe+hUHKO2W2ZudBbI2iiXuj?=
 =?us-ascii?Q?BBmMYblzj8TNlXwxRFXp0cwOKmdBbgBA4cQGbKSJc9LDCKBO9jymlQSvxZzu?=
 =?us-ascii?Q?qYaBA5mgVuEPYZ2vZh7j7JWWNOk2IaUw8pvjmBxdXyFVhsjVuGsH2WNCz3E7?=
 =?us-ascii?Q?KdO+Wl6PicZ3Dl5SZAp1NC30EYmtq6xm20cGr18/zkjBmNKPSD2gyvtmi6e7?=
 =?us-ascii?Q?nomwIUemrKW7KSsYHN/8twTBiSgT+LDnkosBRCrDOBeeOD5aN4JqezmJWT4d?=
 =?us-ascii?Q?FQU1E+Ug6445ONVQpbb52R/3nNuIlQsl2FRHTPm9gUljLibEM/NsGOoA5aHp?=
 =?us-ascii?Q?VZj1BLrPvsY2IeVoSbK8b8FCe/E8Mytyo0IQpvgoIn0h1dGYtmqhZJUXSv7N?=
 =?us-ascii?Q?iPA3c4opBsTvdyioTjVIlE/jgW9rNfzYiDoObSOLp/Oby6GDoSDyC40dYnTR?=
 =?us-ascii?Q?ggR+AqVRdCHKkOknk2qgiLm4hIxuriwZFKE4ZNPE/LkGSHuhvWScOvG4doxT?=
 =?us-ascii?Q?fPESqM0sSjrRrI8l1ZnhCvo0xzPsc+7Pc0FprATteV/c+4K45doMs9DmkjSv?=
 =?us-ascii?Q?pREnyeP7umXWYsNqP7NGpPD43DoChnBDb8Nob0p5hTN9v2oz3w0SDn67wXWk?=
 =?us-ascii?Q?x9f7Ux9jJpJn8eX2rAE9qZ5DFNdKqSplSRhcOVoUwFu+MtJJj5DgyZuVXbuH?=
 =?us-ascii?Q?y1M1yS2cT8E49wfNKtE1aSD2a0klpPID87/YzbG6/gK0orhkYatfYbFK3ILb?=
 =?us-ascii?Q?EVvKTKAJONR3gXSiMsKIfE13vESgUHqKNydV6XBZPlbOO2pAFP/r3KDtG9tx?=
 =?us-ascii?Q?gQ+wKSwmP1Lauftud+nAd5ARNWid5SqpJUwojAuIlttkZDNyObqo7jHVyRH3?=
 =?us-ascii?Q?4doylbpPOy9ZOzwxiBmeo6eBezoKP9HlzN6uuwQ/PtEECtGt/ODV2p3Og6R1?=
 =?us-ascii?Q?ozLPKd+Z2DW2UbevMZtZvpN8JUdVdKKwFB8VtZm1L9GdDtqlkz3DQZVYqjmD?=
 =?us-ascii?Q?RsaUKUCqDUKon3uXi0DLijyXLVfbhFFulCe/WJpF6KqXH2MqIrsDXS2QofRX?=
 =?us-ascii?Q?78mqK4gNNk8MgAACfXzHApqAxya/wKtUSqONyqMcCzf0GIjLDNFuLRVB24yb?=
 =?us-ascii?Q?9H0Phv/hMnK/IpagtK0albGcn3JIhhO8wXN69v268yW9pZkgwf/mqEW1r7mQ?=
 =?us-ascii?Q?A7EPTgSPBTCd43qqP4ath95eLzLv4QecKoCw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yHvMutlKBYRNlSTJKxR58mri1Wm4KxBiFJXApn/LG5aH5au98AlH4g6F5Ky8?=
 =?us-ascii?Q?jddFgEsRdfkmWlyOo1751R6M7BadKCPcw38nJle3LNBRPjZ+HaZHEnAPIBeo?=
 =?us-ascii?Q?XkgYago1httv4X7CDCDZhZtIp0uA6ZNzJybkT1ruePV/i4/YW5j0AFJKCEN2?=
 =?us-ascii?Q?Jxh2Xf6xpCvDDg5E4XE7Epi9xlH40PIIMyI0IyyaNPorj0Qwe5DKGLzQ1RbZ?=
 =?us-ascii?Q?3nVG9gGVGB/j6dhy9V+cQBjPbCF+vuijDVC6ze2yncW/CU2RtII9b1ceXwxn?=
 =?us-ascii?Q?OhNcS00fjHEZP7oE4AUnr0yd+nivfttnVI8dzXPnj9a1+NlVxW/QcNASVjgm?=
 =?us-ascii?Q?CAOBkZPPpzrMLrrZ8txI02ke/BFhB7f+natIoqwqFQUdGaaHJX5P3lKlL351?=
 =?us-ascii?Q?+l2zTDWAMm50Do2v/d9C/tmOabfHRZG2epKQ7GICUncYX/aZTicxprqJIO5k?=
 =?us-ascii?Q?ieN0WHkGKBNtbMrKInaxjNBwij9oQtiIHrjJi2KyZWbTXu0daHwP9ImLQndw?=
 =?us-ascii?Q?hFy4hx4WTNsWOpZUyMmO9alg/MkdKSe7yFfIh9+fPUYQuanCwIKBJpe+AS1p?=
 =?us-ascii?Q?76Huj4p9FMSKRGfpM4UUIRxyi1p3RDPprw4wxTbY4S1OA4Ie58ns0ueVB5ae?=
 =?us-ascii?Q?Z/ow1IEF2PI10lVd6eVMwtSoCLsyj1n7ydiEHO+LFUOLvODqTx3TFp+IyO9G?=
 =?us-ascii?Q?oEYA36I8Na75y00D3iFBws65bokUn8FpwpcOM2Sc4m8CVsm5mZtDpyVG9Fz3?=
 =?us-ascii?Q?PVFZ33Ee6R65K6C5+R0p/IT8HHQlnFNwBPYRRRAapJKOWMrw2o8O5Ug5hQQG?=
 =?us-ascii?Q?shByrvhTYecsI9RCQHzc3l1DJXRvnHr64a+mn2ZstO/vlsO5HbRz+zvfVxZH?=
 =?us-ascii?Q?SfIgPzrsy+3fPsm+yhH1Yweu3AMw92ty4oabp6PmW3t5olGlIBOUKhTQrcLy?=
 =?us-ascii?Q?3zj34LcJGH7ND5vadD8wuRJoC8Lb2aNskn4m4rIEKoELCqZOLPAJAi3kXnG+?=
 =?us-ascii?Q?oUOJLa8YFQo2Ospe4rkOiYeYSjyv+XWztQvklqE84nOg3z87dklHVwlnL57J?=
 =?us-ascii?Q?ISQXBaxbF7ui8RC9zb+9Qp3W9hVMhLyifuOB58b+Ih/8wP5v1zLt+A9veuMj?=
 =?us-ascii?Q?GCs+PThYhSLBHKEjawE/dDuy4n+h0L5WrG59d41Z8go8DYAkQK5yk5nUmbwM?=
 =?us-ascii?Q?11sHjEgMhZEGx6tVCtU3fsGGW2TmJK5PNJ9jst3SVzjU5DBMK9EjbHD+0Qzx?=
 =?us-ascii?Q?CS6XXPNAI3rFgiXHmsb+N0TcikgfHIIjRs1OkP1hSNRLpinpoyh6GdVNiYxj?=
 =?us-ascii?Q?KIASITjVxsUUypxw+9kpW+N1hMEKitCM96fd4Xp0Z254I0B1C5jKG8gfgL/c?=
 =?us-ascii?Q?/6/4e+/cbGPU54hWp0zfkuqd7NULtZJhNXYjTd8Gje88dtld+I49zV9dFpp0?=
 =?us-ascii?Q?G/OTuAjU0z+8Yre7ES5JtWuA/PUKqLzjBrCsNIemf4da7lkCuQuewBPbyD3J?=
 =?us-ascii?Q?huPsWGUl2lxKJAJZAHHzZehy5OvaFPZm8Dn63gaTdjQ3rQJxE4cqXc2UIUiJ?=
 =?us-ascii?Q?QLlRsD7HXfwlB8+tN0DpIcr/kjnhf0YiUYlHiFwg3QW4MWT2bqo7ec/SHDQe?=
 =?us-ascii?Q?8nUfPqAqXMOCnCoGMvx6maoaZerUJq9yjvhf2k4oC6jfEt7oein3RwLkXrV3?=
 =?us-ascii?Q?Aw3QMW7QKtxywBi3F4PgeMCqEjFL/ON6Ge9asm37TKg4rpOGwlUKVNIPIJDm?=
 =?us-ascii?Q?3wNvTJbnTw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb186f9-576d-4bc0-6654-08de4e754ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 05:18:04.1401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JfAmIFgiWqOAfAXo4a9ZfVBnvr1qVgcryh3EbErIRARkfSrUZR3c/e8BBJIUhQ/obG+rdINJdxXW26k4wfsDPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8399
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

> Subject: [PATCH i-g-t v4 3/6] tests/kms_writeback: Add intel specific che=
ck
>=20
> Add intel checks for platform specific execution.

Add why the commit subject and message does not explain why this change is =
needed

Regards,
Suraj Kandpal

>=20
> v4: Restore drm_fd added in struct and access it from
>     igt_display_t struct
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 15917d2e1..473f6c58c 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -290,7 +290,7 @@ static void writeback_fb_id(igt_output_t *output,
> igt_fb_t *valid_fb, igt_fb_t *
>=20
>  	/* Zero WRITEBACK_FB_ID */
>  	ret =3D do_writeback_test(output, 0, NULL, false);
> -	igt_assert_eq(ret, 0);
> +	igt_assert_eq(ret, is_intel_device(output->display->drm_fd) ? -EINVAL
> +: 0);
>=20
>  	/* Valid output buffer */
>  	ret =3D do_writeback_test(output, valid_fb->fb_id, NULL, false); @@ -
> 405,7 +405,8 @@ static void writeback_check_output(igt_output_t *output,
> igt_plane_t *plane,
>=20
>  	/* Two commits, the second with no writeback */
>  	out_fbs[0] =3D output_fb;
> -	writeback_sequence(output, plane, input_fb, out_fbs, 2,
> fourcc_color);
> +	if (!is_intel_device(output->display->drm_fd))
> +		writeback_sequence(output, plane, input_fb, out_fbs, 2,
> +fourcc_color);
>=20
>  	/* Two commits, both with writeback */
>  	out_fbs[1] =3D output_fb;
> --
> 2.43.0

