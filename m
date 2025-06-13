Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCE7C61DB2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 07:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A4110E03C;
	Fri, 13 Jun 2025 07:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="momVUGpg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471ED10E03C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749799131; x=1781335131;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GEFCRI8/w3gCCnqvtpfePwB2ix2UH1tvPNSt3qSCiq4=;
 b=momVUGpgc9Tb2Y4h+1UEHfKru7mSdQo810bF6vGK9+uTObtsmd5i1muS
 DQjBDjA9PNMmyygpwIOSkHXemHlz4BFQCx3Qo6SIl19BF2cCIXmk+L3ue
 bLTZpo72gdtaw3Q/OPied5QMl05kuFtgU08zwF674cjhzp47lMSv23ScM
 CGwkq5DhfJB/Iz9fCxu9iRO8XFNSYIOeoqRJi6I+J20/H4CBp3YNKoTnT
 yJ2H5E19Y2R31QCBdOLlO6dHZ5mp+z3CmMobTtw6PD3svn1xNsOAn7Hnl
 nXP95IyEhD3askt+Dv2mtLcDnSUpGevGSGKpeHEo7AW1EUjazt7BZaQK2 A==;
X-CSE-ConnectionGUID: l601/y7DRyytsy6sOBz4XA==
X-CSE-MsgGUID: lY1VtfJ9StmSiIHi7S/wmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="39614130"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="39614130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 00:18:50 -0700
X-CSE-ConnectionGUID: 4DdBizGRQmyMsSOOTjUzBw==
X-CSE-MsgGUID: oC6mdlXjTOC3N7w8BQtbpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148636779"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 00:18:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 00:18:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 00:18:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 00:18:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmRZudGfmGEPppiTADKJCiQV6YBkC9VokaGj8rROq1qdF7zWuWgLQUJgmil/j2yjDUZxo07+gXcOfDiVxxjbXTjB2ccatpZuEJJ5umTjB5KHYyUiWYfPij8wfGN0lLZ3LnQruWyA6scbTXi1QDomrLMvqD5MfDX0E+JiTDPMYoCn3z9fKwCwo/8Lx/8384aVoUq6s3AV3bU8Rl3NRKnLeFGltmR5Kq0XV1QPXwu6ZihEfN3YywTIZ1SQrqvoIO/DsL+VDKKoIU9zm4Q1k6ishEHtZr3+JGT5GGqddsEneDFO5wLn21UiaLGzuY77/ulCO1JqACZvMkmCg+Spdw53LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYWzKYnajoRbmK5PQG0TvTOdH+iJ0NRxGBX9DHmKo1Q=;
 b=phUZ0m1clmcaVycRedXo/P967xdQN+OpA5YMTXWr13Oiz5d5J5lcmpjHnkD21LUUofQC3YFwAvdD9vZT+tAtLOQiyFSFM+17wCJNMhDHKBvYRexNFw9AGMuerbu5Jm4s0hvEC6X4KSeHp4FfGgkHiJ4P6ymajl48yaRn4h6uH3c+5iHYJ/AhdgcpyDBqYnFgyw+HE5IxPoSaokqmJiiLbqatqCOAEVQWWVt/403v013Di/GB0jS+1WEE1F01m8q/AbLUhugmY9Xi+pZIgUOhddaYHsfoxlXuM/8Lhj5+GQvjQWkf4445c/sNBFJBcplqQL8tgO+h5XyAMea+pJk7FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.32; Fri, 13 Jun
 2025 07:18:18 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 07:18:18 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_async_flips: Fix for HRR panels
Thread-Topic: [PATCH i-g-t] tests/kms_async_flips: Fix for HRR panels
Thread-Index: AQHb22IRVS3hbuN1eUixFmROpcjfGLQAr45w
Date: Fri, 13 Jun 2025 07:18:18 +0000
Message-ID: <IA0PR11MB7307B633E0D11A69FA3B9D17BA77A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250612061829.431231-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250612061829.431231-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS0PR11MB7766:EE_
x-ms-office365-filtering-correlation-id: 4b2ed805-2791-4fbc-4611-08ddaa4a78a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZM8ccBGOBUtThwOlziDR/qQRxohGQKxee/crNlE4+mwSDfq3kKunGDzyvPWu?=
 =?us-ascii?Q?hECFUaDig5fFgZRClqoYG+SsXrXCbBRltJKsepGo73qoJgrcwRDjS/5G3WcK?=
 =?us-ascii?Q?UHAaNRjZCgle83hkcGOyoKjrTdPgMcVIXcMIFGe+pQ7rBmhsubAIlkOK6Eub?=
 =?us-ascii?Q?06leU9OVOHaJoqmZPBQVzaaGlswtkI1Jbjilt6rzw/hwnBlrHH5RuzNZAz24?=
 =?us-ascii?Q?7zJgRkKKe5d1q4HaXKZo1o5AJXAdgIx+j0FEFw/QGwxd0ms7fKfssHIMEdxz?=
 =?us-ascii?Q?0AjK1SbQEQAaQyCU1SWj3J0wl/gpxKtOq4tv+L7RQLtQRSsxqMoVr+McvGCZ?=
 =?us-ascii?Q?Y3J8Jx1foR431iFJI1zHy/HQ88BRCdijQjMJcv6fFBdbnWzgwXL6rW5+Wz8O?=
 =?us-ascii?Q?5XQgcj4jcgSvBrPFn2S7JDsBgYRYvHSsHyX0PZ2K0GsXDFnADGD4VLeI/3xZ?=
 =?us-ascii?Q?nXhCkAJud7O01xTuctvJo4rUyiEDguuSssvIu2tpf6ccFs9qhB/n3UHyUOsm?=
 =?us-ascii?Q?u2pp21zI16p7Hnih1NqU0q0X/ZvziSlNlTrVBJ51P8+I06PKQb8YLj7DgC11?=
 =?us-ascii?Q?PPXDFEMGR++j2C+W+9YMmZfQCl/NY0uRrC/Fcn3hIBKbajNl3OpwKbse7lJV?=
 =?us-ascii?Q?VXfBX3jMg+TLbh3EnexHQuc1F62NZ82UEZBg8ubfqb8aHBQ3lmAPySwoc19H?=
 =?us-ascii?Q?RmYC+tU7ejuXVRQVsZ6+HTbcP9guk1VqH1svV+n00GPlm4i9sPqxfofLgfW4?=
 =?us-ascii?Q?d/gLuS4QvBCFxO7VIML4/MMig5bfKI38UwJL+8kc9YD5t8fDeNy+qtNIMOf4?=
 =?us-ascii?Q?XkmC/QfORYI8it/uFhi32Owi5FuFms0iHrhGIVE/X8cSjzQboQb5KPWMfB+O?=
 =?us-ascii?Q?zS0N7v1xluc8DsoWXN3wFjAHrfOc+zt09eDUscT4aTeeCHWMjHpCQhy5ofoB?=
 =?us-ascii?Q?fu4sHMlwIg13SJmAVIWys7fMOeVjKS9d7r6wDeuSRCEYPJBd+Q4W5eNghxVy?=
 =?us-ascii?Q?LYQ88YaQOfGowcwGLi/EEa8BqT2GFxWAZmT/AR2rEUEhWRwMsKR6+ZVOPw9W?=
 =?us-ascii?Q?hgAZK3pY+U/1b1GkazE4ZNLwYgkAEld5c0oe4pPYFnTSxemV4CMOvBeCV0kt?=
 =?us-ascii?Q?t4V//sjMq/TbFdLXX6YQeV6O0/8NxlIe1irNt9ucyqb+82YSGTUzWOkY3okh?=
 =?us-ascii?Q?s0q2MECxNvn+8CnY99HeCbIUrb+gThjpItZqkQNjpbKaZgVSw5qDzz5JnVgP?=
 =?us-ascii?Q?JOjz8gUX9nt9L4QQ6zOfl3GLAARubuhDYPPvDR59fON3H/2QVLwodRO5qoMu?=
 =?us-ascii?Q?3IacfUhXQJFEG/Tzi+WI9qCW3IAOHe4FnBi/ShyB9QTIM+C5AFMKwJ5Wzvd1?=
 =?us-ascii?Q?e4GZ2siAxoFD93P8aWjxYsm1B5nwird362/UFa73EBMqvTccwo8RMWN54A4z?=
 =?us-ascii?Q?M5iXRAhCWA4ShOhmDKIs/bWCXVODi1XQQpxAZXiY9hTb2WGeDtUz5d8d5Smp?=
 =?us-ascii?Q?LK/thln1BqIDSas=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8MnkcPSEs2+OTfedND887j4yNqjJJOj0QWDVdhT/ocJglT2yJI5r50F/qcFL?=
 =?us-ascii?Q?0JNn6SWWLtC1FE52hjk077ciFG84gqn65XeK8B1Uf/n00n94WOl8TNcAarle?=
 =?us-ascii?Q?LuxpjG+fWr4FF22ge/IMxxn4wbEa0oOvJ30MP/l4nWxCug2QCFDCmgsh4g7W?=
 =?us-ascii?Q?d/y4ni3EqQNw9O65Q99j+HbQEZje5DfM1WKkE88BrCJ3MSeIGsB4dWIGWj4X?=
 =?us-ascii?Q?0vcnvaXdnXBrx0kvRwj219KdXok4FFGTRmcvz32u1BSNr7Y0xJN4UW9P2WP4?=
 =?us-ascii?Q?GTgMiuezQkn/1r3V1EdPWqZwFdIcZTmodIgJ2fiFhsywR91Cice+icJMjubp?=
 =?us-ascii?Q?Tn77a75kg4IW7o/JB1Zv2MuLC7wgrnxU4BpE9WB/nQeJOvP3W/9Oz+WPp7QE?=
 =?us-ascii?Q?VaBuxBUeEam2/wtd3gPhmQioIKJBoQMJC03QJ5Zh5k/XAZIG69wZID6FRx2Q?=
 =?us-ascii?Q?L06tgzPNdklQFpponrCmY0LAS8JSJDTOyXI3sGXAvwkKol47LnkNkdTNj6ft?=
 =?us-ascii?Q?ULhGD9ZHJvGlzOKhOohNGwwPYaui1d6SNBwuc0GlGz4X6Illj4RoET7Hg3b/?=
 =?us-ascii?Q?dLb5mN9aNssieudgPkcbJojtl4spyguWvbSQxdKY4ZIswGcwPja5aLB3MAlU?=
 =?us-ascii?Q?Lu+/1NZ++rXrD0Wu4Pm0QQIIGiP0zinxbfmNqY/dTozKnK0I0D+3miRib+z9?=
 =?us-ascii?Q?ppVeNLFHS5A4XThYvwnJwYwzuB9UMXshPRaB2W90ZkrSM2xPEQl9EJPTm1a/?=
 =?us-ascii?Q?nvnGFifYhPCzbSACJSPT07tbbjPKRNhLj4Xby58cGNi1arbRuo+ubb9owt2G?=
 =?us-ascii?Q?Hnvpsb77iKC+8o1IkN+4RyD5+v9fWzcCL9PM0VUVTJcIZborBDFTWbDl6v6g?=
 =?us-ascii?Q?8XJF0TK7bSog5D6LrNfW/yJ8ZrhxryyuX4kRrWwpsn84Nb9lzgLGNFQGkItf?=
 =?us-ascii?Q?Qwqw544YmiL4EruppLLF7zZwlmDNjfoCXye7JxBB3YUnPxZGcoiMgSP/3Cwp?=
 =?us-ascii?Q?XXoNrVKZ3qNdIY7CI3cbT55ccsPO6H9JC/0zcNaePg0qYaZXti/GJXm3Sfk4?=
 =?us-ascii?Q?Bz1nllm2109Cavh485fb2hRDms7j/Y/SIgoVWU20qGI+M4R8TWtj98P8EIi+?=
 =?us-ascii?Q?QdGtRqZAa5HuXd8dgMPMWaTzvE0+pjuhuephnfV/mmTU3z9Yg2R/dwviQJiM?=
 =?us-ascii?Q?GnWtSiJg4ts0ZdPIwUCKe28YAblA48w/ma0wOnyNABqzVUWHPH83GJN2YSGy?=
 =?us-ascii?Q?s52+529DCaPuXbLFm+U+u42RN8Uh/NGVMq6ngLS3CH+Cv+wxZ3xlg94rtKcG?=
 =?us-ascii?Q?wJaoFXHMIL+MH8ROeI6srr5JjRvXATdU51yd2J41q8fPbs9UpceVLl0H0gpL?=
 =?us-ascii?Q?D7L0u1Y63u8L3SAfqvZ2bc+5pzy6yZuy7deCgY7WWwIhOneNy9kagLLrvpum?=
 =?us-ascii?Q?YhR8t5NudVMpiCDuD4Rv5Cri677a9BJOeQJHX6CPhVpYVgeRwOkgNTKVqxzu?=
 =?us-ascii?Q?RKasItseJDTGh9Rug6OmJ83Qos3WU4Uy6y8SCXeS4maMzM7zleHXVLU0ezw/?=
 =?us-ascii?Q?BdI1PbTRPATl31vAU5FsWtkXoa2W7A3/C6Jz/7xC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2ed805-2791-4fbc-4611-08ddaa4a78a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 07:18:18.4577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t4ZoSjI9Qm3qXf5EB2GuQESOsZLV9JgurBgpqvAhINE4urnnr6mbfZ953DEqRDaUtJmRKRI5OPTrxQ6NNVaZcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7766
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
> From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Sent: Thursday, June 12, 2025 11:48 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t] tests/kms_async_flips: Fix for HRR panels
>=20
> Current logic in the test is too strict for high refresh panels, It expec=
ts the flips
> per frame to be 5x times the refresh rate which is not ideal for high ref=
resh like
> 240 , 360 Hz.
>=20
> Introduce func to determine min flips per frame depending on refresh rate=
 of
> the panel.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> 97128cfad..5669d450e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -139,6 +139,18 @@ typedef struct {
>  	bool linear_modifier;
>  } data_t;
>=20
> +static int min_flips_per_frame(unsigned int refresh_rate) {
> +	if (refresh_rate >=3D 480)
> +		return 1;
> +	else if (refresh_rate >=3D 240)
> +		return 2;
> +	else if (refresh_rate >=3D 144)
> +		return 3;
> +	else
> +		return MIN_FLIPS_PER_FRAME;
> +}
> +
How did we derive at these values, 1, 2 or 3?

Thanks and Regards,
Arun R Murthy
--------------------

>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv=
_sec,
>  			 unsigned int tv_usec, void *_data)
>  {
> @@ -377,6 +389,9 @@ static void test_async_flip(data_t *data)
>  	long long int fps;
>  	struct timeval start, end, diff;
>  	int suspend_time =3D RUN_TIME / 2;
> +	int min_flips;
> +
> +	min_flips =3D min_flips_per_frame(data->refresh_rate);
>=20
>  	igt_display_commit2(&data->display, data->display.is_atomic ?
> COMMIT_ATOMIC : COMMIT_LEGACY);
>=20
> @@ -421,10 +436,10 @@ static void test_async_flip(data_t *data)
>  		timersub(&end, &start, &diff);
>=20
>  		if (data->alternate_sync_async) {
> -			igt_assert_f(data->flip_interval < 1000.0 / (data-
> >refresh_rate * MIN_FLIPS_PER_FRAME),
> +			igt_assert_f(data->flip_interval < 1000.0 / (data-
> >refresh_rate *
> +min_flips),
>  				     "Flip interval not significantly smaller than
> vblank interval\n"
>  				     "Flip interval: %lfms, Refresh Rate =3D %dHz,
> Threshold =3D %d\n",
> -				     data->flip_interval, data->refresh_rate,
> MIN_FLIPS_PER_FRAME);
> +				     data->flip_interval, data->refresh_rate,
> min_flips);
>  		}
>=20
>  		if (data->suspend_resume && diff.tv_sec =3D=3D suspend_time) {
> @@ -712,9 +727,12 @@ static void test_crc(data_t *data)
>  	unsigned int start;
>  	int ret, width, height;
>  	drmModeModeInfoPtr mode;
> +	int min_flips;
>=20
>  	igt_display_commit2(&data->display, data->display.is_atomic ?
> COMMIT_ATOMIC : COMMIT_LEGACY);
>=20
> +	min_flips =3D min_flips_per_frame(data->refresh_rate);
> +
>  	/* make things faster by using a smallish mode */
>  	mode =3D &data->output->config.connector->modes[0];
>  	width =3D mode->hdisplay;
> @@ -763,7 +781,7 @@ static void test_crc(data_t *data)
>  	igt_pipe_crc_free(data->pipe_crc);
>=20
>  	/* make sure we got at a reasonable number of async flips done */
> -	igt_assert_lt(data->frame_count * 2, data->flip_count);
> +	igt_assert_lt(data->frame_count * min_flips, data->flip_count);
>  }
>=20
>  static void run_test(data_t *data, void (*test)(data_t *))
> --
> 2.34.1

