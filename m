Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF44C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 18:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B1A10E8BB;
	Wed,  2 Apr 2025 18:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boo/7GRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CA010E8BB
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743618475; x=1775154475;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9QMzmcAQH2SceqE4F7afhIWmueRFAUcQU1G6v6fIsDc=;
 b=boo/7GRK/pUY7FZckY8om7NrKt17pwtSCyKk6JL8zTx2l6Ur+FV88eAm
 ivU3BiBaw2+hkrWaQEB3qN6cnFFllVzUCkYN5ja5SxuqTCMFAd4bL5E6K
 iQqm3G7HaArAGWAnItJXSm63JJWGE1RSddl3bFQ2R8FFp0dlNu7kM7XuD
 i1YeSdsJ1uEL07yEMADXxx4KZm+ltoc9u/4Mp5LpkzRfvZ/EL70xaba9P
 NdnCr/8539nQ//kioJUNd1J33MfzvDkNuo+eJtcz6dBe7WPZ3qA1iNPff
 TZ0oXnLtvR74P2fgwz5nu85j6LGdn5w1ldy69NI4PROSSCVAvFCliaQ9L g==;
X-CSE-ConnectionGUID: GbohULP/Q4+ujdZNni80+Q==
X-CSE-MsgGUID: 6N+iw/ilTJG1H/UsS0yjEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56366542"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; d="scan'208";a="56366542"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 11:27:55 -0700
X-CSE-ConnectionGUID: 15t4f/ztTUSbiYRVhlxTpg==
X-CSE-MsgGUID: D/8oKiZ+RXWOAo/tvRGokA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; d="scan'208";a="127624875"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2025 11:27:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 11:27:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 11:27:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 11:27:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EX/faHtAiQQ5oJFWpdSFnR19pmohn5MD1RWSCXegFNN1WfN49BbHF8sn/03RH4iY2XVe1LMTkebIyXzks/t8iLbtKTSacCovzlZT1dXE+2Gyi/AC+2fkojc2j9S1NIx3vxCNfTwQUnz0nMv/mw+fOL/sj5azRcvCcLwMJuuTLgLm/xL6D0UTkzp6lLcqKAEDzhBJ/s8b14R09vEz5weGF0wHg2CFZNfPwWyQ8YB71OKHHjj1CEVs4aVtijScs8CdwMmA+X9Dcq3QR0DEOnc4zWMo6KS38AE7+Rzut81CLeQRAmSY4Z+ZCozHGj1zf+O6+ZrECq5aFXlyqkh6G06eYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrVbeDucGMxVIjsc4vf6NkMtGztH+VnFb3M9vPFmG08=;
 b=ICFtpdBDaLrjrMOxKUkmggIoG6/ir3dG6jLkn+RvovlwgAfGojSDRY0idBTg7nMj+siU4w0akicaW1ufuOtz41U5l1K8u7AmJp5eI7KAe/lmS1rfeHuqRa0CHSJh5fO21x/GxSnQ+7m4qZ57U+6r45Ugz6cpou5Gc8JJVQGBcVIvcmJP2e6apKt/x8gs5ogVFUyrKeF0OgFhsjHpVdiIpIWS+Y6gIrfX9DDvkTJzPk63xwv5WlERLFWJ/djW/STMwx0j8AaDFbT1rnImWcwE1Y+Trw5LFvHbUPECrtIDaCB69EHeLD5KRWD39Faz6S4S4CRGI3Q42NmBQsk3ZL73OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 18:27:38 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01%4]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 18:27:38 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] intel-ci/i915: Block more Xe tests in i915
 runs
Thread-Topic: [PATCH i-g-t v1 1/2] intel-ci/i915: Block more Xe tests in i915
 runs
Thread-Index: AQHbo+oZO/TZXv0pBEu0e6zBAi6OE7OQsOrw
Date: Wed, 2 Apr 2025 18:27:37 +0000
Message-ID: <PH0PR11MB5782E3F38BEF8AA49137EC2582AF2@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20250402161207.66601-1-kamil.konieczny@linux.intel.com>
 <20250402161207.66601-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250402161207.66601-2-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|DM6PR11MB4660:EE_
x-ms-office365-filtering-correlation-id: 0e904088-0ac9-49d3-1ce1-08dd72140bdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?9uceTKRFCzia8QiajrrCiZ8ffQALzMtd0EuAEh9iWeAbIxcNvdDOfs6pu8+/?=
 =?us-ascii?Q?ZvFWkmH5bSTrmL+kBEAWh4p0PzdiBVC011mnJZILpXA5yRY+XuFvQNdXtrdU?=
 =?us-ascii?Q?8cpvYqiEzhbi8RZye12yx4UK9TL1H6aVHI2twSUpD6Ayr+coKbRXVnj+wcPI?=
 =?us-ascii?Q?Jx0ziHAvJHUQnXC7qqFA8gUf4bElpOPpW8B/SV53vvM4l7RC1SHveU1tPJa4?=
 =?us-ascii?Q?cVtbt/i6Bp51SIJGLYmdzq2lgZsVWtiiFlZkSXMWRTIQD1dvvdv66qP0Tz7X?=
 =?us-ascii?Q?dlciHnWBWYbE0831qpHInAE+5lemBFXDgNkzjnrsRO8cv04Pj3Bozcb4ihpP?=
 =?us-ascii?Q?3qe1FDrs138ZRO+NU+ShOGDiC9ZFkD7K46oIPyQj4o5h0yT+xzPhtJIE9qTC?=
 =?us-ascii?Q?gwXgBeJWqW+XECF3bYd2NGNQo7IB2hPLgJnDLx3Y4cyx6nZGCaRfpEaSh9RF?=
 =?us-ascii?Q?r/LhR+BKwcAt+Z4YVeoPp3MD1cuC04dea/3Tdpg2surYTHfmT41wXn/ApLum?=
 =?us-ascii?Q?zfXKB0Fg/u1VO5lCps/Wm06l15t0MIj8s04PzfQriBY0Fsv33p4cnGNCg61p?=
 =?us-ascii?Q?vMRvciIATSWoMJAGh5hgq8EJnGYxNqjjdSbUfYPc0ywZecJgt9JfK9Ua0m3c?=
 =?us-ascii?Q?dcUiBYuUq4LNeXkzSFSGl38eGvIxjxHgKbvTHoon2XclBJbOh8uLVXO/5TCO?=
 =?us-ascii?Q?INrSkGFLq7gtE7UcefDtW75jawJR8NMlyCCCwfVZbxH8KBy9gz9t6UZI8VDk?=
 =?us-ascii?Q?ARbFbSA64FquUSVkaTlBgBA/N0plkm0QIxHdSwVduVRSl+NAudO2lIZoftJo?=
 =?us-ascii?Q?wpLLTnwWniDI4jAQW3DOFGKjjyvsw2eSpWdjcgBOTv7r0yT8IysawTjBc+Qi?=
 =?us-ascii?Q?gEvEmadatK29+ZHYFiBBqM0BHW9QwfxrM+zd+fn3mssVEBAHDE7kGWIO23OJ?=
 =?us-ascii?Q?oDaLT8HWvYkqZ6nT9gkLxPusULhb9IKEsYRHZdPvXyitvXrN8opg1duhFCm+?=
 =?us-ascii?Q?MAK73VK7AwEO0d9M9+KNfwB5T63rXYApf5nTGakeDMhcg/j8jeVRGZele8kp?=
 =?us-ascii?Q?wvSidu+jp166Meef/5X+SlyWxIzN0DA+2278GtnJIUMSjLaM6mg5VdgSdWTd?=
 =?us-ascii?Q?muHq9WE49UCpzZHpfjDKHFcILEW/uU2N/LIGizs4H/NsrBW0F+0Le2e4P4aU?=
 =?us-ascii?Q?XryLllg+7Yln1Acn5DpDdqt2MLuuUOOFOcOMk6DK7jZ01c5PCFqokgNq2ipx?=
 =?us-ascii?Q?tDVvfWblTOA1PRiT3EkjFBBfn7UT2nwDoCKoTKme+GvUNMqpEAdy4fAdkqrf?=
 =?us-ascii?Q?/EiOfAh9bY+t5vQq+GzwUozgWkRhV4bw8AS1s14Qrfyn+bn/d3RJbT0BOeIj?=
 =?us-ascii?Q?2MglN/DSacrR0D9vHu4z626UA1T8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+8+Awj/0gR6y/06l/TdlbwQ1cWFr8HimNYdJe/thPjNM7gUZCrvmdFWswRio?=
 =?us-ascii?Q?KgNwxcWGnE9C9NvFTTUVlqaOGS/qw/D1ZMplGU7LrTnpDsr6IJaayi5utI0U?=
 =?us-ascii?Q?Jl5fIMjTydbRJWyc60blgGVJzEYNvJmJE6/linuMWxSXv6K66J69a9IW1gJn?=
 =?us-ascii?Q?NyujlBTC+6wGUqBmEJ2qroP5+E2JGLD9kZ2d0ydzPTQgsa/pG/LA6ioYmloT?=
 =?us-ascii?Q?0gX30Y6ByTnz59UIvJcTGO5Ok10xeyOLXqSqNWJcGIEFj4HVrsYa69Y02P9D?=
 =?us-ascii?Q?gQFw4DVhd+qo08+FUpxxwJmntHlqAxh8de+ezVghgNjLl0X4RIo1pPdW6XZA?=
 =?us-ascii?Q?txjLroEQS3Ha2RvEan/PjSZ9XCEfBMDRlHx+oFDcN7JLzyslyhijwyHAcoXe?=
 =?us-ascii?Q?FRYNSydPh9VfTLgTAEEL8qL6IZTB50QxC03VlKUxYemqN40oMDtHZQgXxR+f?=
 =?us-ascii?Q?c95/b6w3Ch0XzPHYARTcOGNBzc8CQk3/0PKn5oC3g1ZOER8/2IWrLrzlEWnZ?=
 =?us-ascii?Q?Of7IlDLSEN6GArCD2XGv6Z006Lm6WPCpdvBwQiJVTVeQss0dtnq9UGyuaQdy?=
 =?us-ascii?Q?Al+3swYucfl1NnXpsVwkW7rX7XJQMQ2pqa2ATPBDeMCf6Gj4v/bS/PmzkgJS?=
 =?us-ascii?Q?8w6Y3fV0l++TXVt+3QBf0+GxT85DUpZr2oe7sJQOTdjZ2KfGenFUWsl10OUX?=
 =?us-ascii?Q?Q2/LlNSyhfMvBZGBgxjBy/UJT4yJ0vuz7wGpFQNmPZDtTY4LR/cW3loxGakh?=
 =?us-ascii?Q?eg3V2pe4KtmE6xi8Lv4cTx1Jka/6VO2Zqr3Mf7zwOeOUTPvXg6xaKyHUn3e7?=
 =?us-ascii?Q?tr9IMRkQlrRNZ/u2MYKRhqH9bwIeE7g0XVo6Vde+VWU8pBo+dynwbs971VMU?=
 =?us-ascii?Q?nZxwvmeULGQD0KyIQKuNTl0lhwuQuAhSKEo6XfWGQs1UdF7vkaV5bqPEBl0t?=
 =?us-ascii?Q?0IzL/G5FpiHgNDtiSMMhkNVYkiFlVt6Pp/5kRNHrCf5WO5iG6AUDsWxJTw7W?=
 =?us-ascii?Q?wop5iHkAu471ZHpi+hV8nOzbDvUWEZbXzht4Kcw2P/DDpHJp9NuNZTju/2RV?=
 =?us-ascii?Q?YcyYNrRJVLlJ+zFMfsG9cKNdOrGxuNV1oE69ZTN3XpOJUuuw6LUet8sE0VC5?=
 =?us-ascii?Q?V2I99Q5EDpaui9rz/J1jLd8QSL0lAN/iUxqg7uHk0xeozkiWTKdDpvMDahiF?=
 =?us-ascii?Q?+Q3mAh44ppxiI7n+mLaSuDQvPmZjyaYMO0jpW95ccnEgDGQWXI9j/f9VGXq5?=
 =?us-ascii?Q?CGdnBkbHRu1tWgRczh5P6k0YSDpMYmzBYiB5Yi5AL6S7DXjMaog0gca2C46k?=
 =?us-ascii?Q?1Y9c5WWtJm6puTcI5P8IPEBh3ZMQdD5gfPeI1NXzqdOuM7JKHE8kRhrOxWav?=
 =?us-ascii?Q?DMjXWrz6PJBva2IjSSV+ci+4lPpi37KpP8gmSjthWhuyz8Z8820TsLAL9txn?=
 =?us-ascii?Q?3NcdLiCWY35hnBrpse+zP2JjBA5H4kzabju+kIxgkA8rq2QDxp9Q7kzk88Au?=
 =?us-ascii?Q?rkOU+L++GKR8aaCgmrDmQFOBsxRbm8GNznVTbxNon8fvQ2fsjd87tvy9DoSi?=
 =?us-ascii?Q?It9B9Onm7f2ZAh8shZBWX4xJBi4b0kqSzFqHghDdIgmJPjwpLlS2z2k50Vww?=
 =?us-ascii?Q?fq2c/z02iu7cXb3wqX16Xb6rDeFBLuPcWBcJTMXn3PhU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e904088-0ac9-49d3-1ce1-08dd72140bdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 18:27:37.9922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vgAGStgyIFezVL5PgE3hhx3XBOuS68GWzlZa4Cs75sjuosmAGSFhcB4C6AH5LGEO/QwefXJUa6rJuknmjv9baUYgmOKAFZtFpg4UcxRa34g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Wednesday, April 2, 2025 9:12 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Peter Senna
> Tschudin <peter.senna@linux.intel.com>
> Subject: [PATCH i-g-t v1 1/2] intel-ci/i915: Block more Xe tests in i915 =
runs
>=20
> There was recently added new generic Intel test intel_sysfs_debugfs@xe-
> debugfs-read-all-entries which is causing a valid skip on DG2. Lets block=
 all
> similar Xe tests from i915 runs.
>=20
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13983
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>
=20
>=20
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt =
index
> 9917bf46a..1afea1c86 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -2,6 +2,7 @@
>  # This file is for non-Xe tests only
>  ###############################################
>  igt@xe.*
> +igt@.*@xe.*
>=20
>  igt@meta_test(@.*)?
>=20
> --
> 2.49.0

