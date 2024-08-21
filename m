Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ADAC52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 14:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C805A10E63D;
	Wed, 21 Aug 2024 14:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCHoxOoQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0BD10E63D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724251056; x=1755787056;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+3a1MeE82TPZXOZpxkhR81niAcnbf8qWKcP7bcu9+eI=;
 b=HCHoxOoQ44taJBzphkQUfEhkRWncYrN2prH8L+U/ApJMrF4j5Y8SUYRj
 BwwjrXP7l6aJChlSspraG05wMbPe76U5SYUqleW0P01BdiK2qVslBDZwp
 mi8CS02sHq9fb3uSgYhacgj0K4U2l6jw2tZQOiTq9zwObntuz5abHqW+u
 uPnoHVGSn8fiBlfDHP74YjJTM1Enp9Sr9tDIT3Ebe2Ik6eg0Fqw2Th3Yc
 da6a74EBfhIGJqjdQLDe4v6DwcCLR+xM/+1O4rJyNmwUoNY5yic5vNrg7
 UYRISz+JfZTlSdpx31DDGFhxSLnGNaBrrym2KvNJUYTK4aIHOOk+pAgdI g==;
X-CSE-ConnectionGUID: GN2JYB3+Qj2QAtMxUjG3jw==
X-CSE-MsgGUID: p6CkpSxLQyC6PcfUCxuumw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33998984"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33998984"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:37:35 -0700
X-CSE-ConnectionGUID: KX3nT4woS2++xkUIPdOlpg==
X-CSE-MsgGUID: jjqkZ6IHTtqHVL5mR7Xb2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="84285494"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 07:37:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 07:37:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 07:37:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 07:37:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 07:37:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiYMgDVuTZT7FECjYO+oVUUkFTVzFL5nwxjrF1oCW1Whx2mQt9qWdiPSsI1Id0QI5HqZG1kshBqqfsk14QpL3hTDN7puVwHZFfTlbGIHjWVvnNyNlc6gkmocVBGiH4fI4vzXKVoqUrePlV+qmu4imYzWwCrQg1FAaek08VuIvdODML4rTUvrjjM8ST/Tq4SSuGQRD9FGmVoLFRhSf9aq9NMkTYauySlXyoKzM0E3YaxAwU1WD1qkIAQdA02FsQ6h46t5N50xUcWWxGgHd+tghI+3HdD67JxGQE7SiGBgpSvTFxHsGhM/vcxs6N0ODaXbRWCb9FLHnNTWX443iYVQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eY2DSOKdTkN/NJYzyikcoTCEsxRMkk2mZpx0d+X9jk=;
 b=AB3k+1irMn/HZyhGcWuMMUAiJrGxsMTGvKCxymeRnvqCWwEwdKrccEpbCMwg3APN/rau/qity33ld6XAFiNqucwXCvofT/HUG3MO9l5s5gqHRAm/u5VZYf/qZIA8P/6eN5kQi6uEI3c0JeXb7pGxODD3JJNtaYqRAOJyBCc4MGBN0V8IErMEckcjCADBluIOnp9C7g4jV+811v/lxsLnnlxLDPM4jYe1CVqa9ZI+NXWtH4DD8DR+2ti/NHHkwVu3KLQCr0pdrDJY/IEm72cz4rT/TUNC/7/30tLC8G+Y3mtA1vQ6yYX+S6KBe0R+im8Diz1qyI+6oAkgITs+R16eDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 14:37:31 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 14:37:31 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t 2/5] tests/kms_content_protection: Move try commit
 call
Thread-Topic: [PATCH i-g-t 2/5] tests/kms_content_protection: Move try commit
 call
Thread-Index: AQHa8tkYzMIV8tuarECtmZJRlU5uRrIxyYUQ
Date: Wed, 21 Aug 2024 14:37:31 +0000
Message-ID: <DM4PR11MB63123E2A096F2C4A2BBC09A3908E2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240820081233.4092203-1-suraj.kandpal@intel.com>
 <20240820081233.4092203-3-suraj.kandpal@intel.com>
In-Reply-To: <20240820081233.4092203-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB8278:EE_
x-ms-office365-filtering-correlation-id: 16232dda-e962-4d33-44bd-08dcc1eec9e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?JIIqZxq88l8OJmxEKVZrLTsoDhz0Orzw4UuX/7kk2Dp8dbNDfznccXAYaxy7?=
 =?us-ascii?Q?7VJupbbZNsMJeaqWJ248cCsR2C53EEY1IB6QFTb4yUHbP8u0TeeUZw3NDZF9?=
 =?us-ascii?Q?OqlsC/g6N0fYNvT1m5/Q0ROHUYbPiGw6DYBwhJI4rtLwBJz0N4n0q/AkZf6P?=
 =?us-ascii?Q?0ijQAe5KsE4kEjbT0bbgd2PRTSyjvuK1sBX77eDCJD6idd0ok2YbFB/Nbe/Q?=
 =?us-ascii?Q?LXG9iA8612ZlqmalMeU8Rk4EcEmbBH3Gg/1A2qxAoeEL2O2JWRT9Fpi05UUf?=
 =?us-ascii?Q?HVsLgtPBZj/bizTjLr7sbCYQo7HJqBxJ29k4jaLATBH6UbNckej21sAEhPvH?=
 =?us-ascii?Q?nHqLVXCGJjRPmaKk3hXf/r0NOJ3gB+SoCdP2ebOv5E/NElOIsGD05xFy0yEI?=
 =?us-ascii?Q?2JpPpZ2QH5LaeuLbOHsiK5S/TFHtcD5Uik1aNMFpJ12cwmGx+hGHhOCJGFNJ?=
 =?us-ascii?Q?sXKEXNN3IAi5xb+Xx1FplTLxNPOnAh+iPoOpUQW2JnfMm2ViLKZZz8ujweqQ?=
 =?us-ascii?Q?SI129SrL/PdDGhFQwDwrpqddtt5KjrtEPNOWIBuVBVQf9zW7/WXWSwh5mJzY?=
 =?us-ascii?Q?SUmFb8oZnzJbgBM4Ua4cnVoupzOAwdA/Uq9dDpJe5mR6cbS5f1NrNyfWG20N?=
 =?us-ascii?Q?nNXoidx3EcPPdhDaP4cGfdBAG4zlBVfIijPU3wfUHWLl1u6rhCRPgIi+dsim?=
 =?us-ascii?Q?tSxK/JVuXpwe2SYVXsT7j181+JhJImwu4AI6MU5yYJb8bxIxQ+2OHlF2pGhz?=
 =?us-ascii?Q?prgxJYwHDHtJiF7b9+r3r0NJ7c/NPXU4AerOSwf6AgCLIYN80xATeTp2OBKS?=
 =?us-ascii?Q?09d6ci3T31BGSYY5nZYrhtfyBbzhnT1+PhkF3cxmZTyfqUdwbi0/DT2p9w9O?=
 =?us-ascii?Q?cuityR4IAXVimhCIY7Nx+eoeAqYEOzj7XoKb4tySLJvbUp5PdutLOOrqFill?=
 =?us-ascii?Q?LcEPTFgeQjHKHXExKN49hb4J9bqXLF1RuqtD35s9ZJcOumMY0OqJcWo2Nxbq?=
 =?us-ascii?Q?3RJFrsbJttGl5e0hustUoX4NGmC/8Pw1eqt9ydm5i9ej2cAwFLyfhkImmeJx?=
 =?us-ascii?Q?fXc8107XYqoFKyQgRyLVliDkulDrKmgkyc2e5jgatytT1W/BsUc8w2OlnTRp?=
 =?us-ascii?Q?OocZ+kWKVjzPN6+qn8shK//eRqlXIbtiyypbQyIELLjW+6sjqAWIhZgxTcP3?=
 =?us-ascii?Q?BmZJNcSmr0j2YN59iMtMAJULXeBc8WrmQg/b4w6JZFGKfI/FvLR6FjtlkZRO?=
 =?us-ascii?Q?7XNVuEQh6FpO975y3KyrOEWRvZUs+E79tfDOHThaiZAKvcQMqlFWUnCDru2a?=
 =?us-ascii?Q?ivMtoZTBuLONDGKIfRbYzX8Jjxge5YXytaBaFG72sG5yigvPl11uu9+iOrVx?=
 =?us-ascii?Q?6eUCHtDYJUxOjzWB7Z/cSXkl+dB6luddUd2j4LKhZZ6KPNSV6w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XX+QSYQ2PKcS99y9KsmdEMhUeYxXddjUGbakXdz3s7Eb2o5a/FWKMInNKeT7?=
 =?us-ascii?Q?PcHDZYtYBS8McEYkqio2ep3ykB4N7KbLrwqzN2ynukofyMqFcOcoyH1tRX9e?=
 =?us-ascii?Q?4rfPM+jY8KelVFyJmeSsSyMLHD5Pj/EtfJApr282jEkZC2tuqth/OyEl/rrS?=
 =?us-ascii?Q?byHAhCGAXcWNz366x+OYnUC1qHsx5om0G8//lSx4oPqC3ccj7UTXYKTduxmI?=
 =?us-ascii?Q?dWD8wUr/GLnRpQ6Op0fh7A3tdk/fok4YR0FTKTZs3egbZdupuOLdQWxBQ8bQ?=
 =?us-ascii?Q?zOEy+5vMjNVJSVwVgjpdCuLCOaszZnLc4aT6H6n8yT3jDK5YIU1m29K2OzzR?=
 =?us-ascii?Q?2X+OL0babSUyJrrqszIjO6Ogn8YNY2kjGBOGXVigm1sjLDiurvnEUSktVciL?=
 =?us-ascii?Q?tsAE9ulg97R18RLHw/1L+IyKsyULBKIR+A0Me/U1qbgOPrvQVay00FWbNlLl?=
 =?us-ascii?Q?ZW5w2haDZrG0XyPdM/QGBwVpesQ4LY/eDmOxStZZ5E1z8PUmFd6oLGb1FDv6?=
 =?us-ascii?Q?3qvs4FWhNyAqd9qdwaPZ1yLupRJ9G5lpUcn7PqeXeETekFyLP0wgwqHDag6I?=
 =?us-ascii?Q?qxpy6RnBt0uqrZgYC52pOIwXwSybxkn+o9wGA6+G/tNIeLlCQp2fboENKJu1?=
 =?us-ascii?Q?XsoJvvD5jxL5YaWyGcYZpcaRCVPGoKvbjnyQi4EA/iDvU1K7ZSiM+t2NGDKu?=
 =?us-ascii?Q?fBv0IRShRoGIFVBXyvKgGjlpolI8O9RQ7WBecdZVL/c+CTpLCw1z8ljlpsYX?=
 =?us-ascii?Q?R4i0Ujdtil8PNVBu4qPZW5JRvkMICVv0sX7HsSXfolsjRD1Qc6kesHXcNtYj?=
 =?us-ascii?Q?vx4QFo6nOci9jFb5FyJbcNsc5auPj9R4IMz0TtBZivfjRw6fgF3tweBYzV+H?=
 =?us-ascii?Q?yhpkoe3Ho2Or89CRg42rGiZX9lU9nNV6ucSleINZ41XdbFlFFMhPaFlOWebN?=
 =?us-ascii?Q?vgQlW+iM7qL36pnqXGnDvAt/jEAKs/ctLtkmESymmh6VlpfwuktrFb3Eagn4?=
 =?us-ascii?Q?Gi0kw+DVncF4PHcTiQIVWIXPAb7DvKWZKBN95Qhkm8PxvEYEp2xadRht7bbu?=
 =?us-ascii?Q?biKN31b053v48GxoeY5TPoWpOhy6gChjNlH563R860YdIsTrxPNVn/00uQbc?=
 =?us-ascii?Q?6lLNN1aZNEi0JOjFGvgaIVHw3YTOZQGCJOZ/9y0s993F1IP8f/QNDVmQay6E?=
 =?us-ascii?Q?qoqhdzCC/LA3uFOiNh+Dd4jySeChuUkicfgC9c0zjQNnSdCpeWeWtNdAfxMm?=
 =?us-ascii?Q?ewdMAP5WBwgmXG4qgTo15ET+KDHbFhxDbi8OegbJZ2QcvhVNlSBQWHnit+RR?=
 =?us-ascii?Q?dE4qTa1kai5fNkMhBB0ebHN5/ldQGIXC0ddhP9pMbQ/oWOymF9WeDZeWMoJf?=
 =?us-ascii?Q?gs9YPE6Px8zpE8BHk1XM7a/FTR53f7SZhhm6Bdh9zMhBfOaPpd8A4Y9TZUo4?=
 =?us-ascii?Q?uZlt9rZj3lvM8dMZf7ObgD8oX49UF3XtMdrgAwG3zKd0/c93c6KcYv7gHkMQ?=
 =?us-ascii?Q?mR34/Sw23dEPY5gYidfBh+Ajre7Rk6yxNZMAJOoeo26kVwe0Vsy1hfsa1olG?=
 =?us-ascii?Q?TeFrFItbeGpYWAcmC7o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16232dda-e962-4d33-44bd-08dcc1eec9e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 14:37:31.2818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xp61x/1LWGG9mfcbQWInZdxHkcxs9LabYYwfAeyBlFEAPCtgxGz/DsjFlg5WibgLO+ZqCnbAQWVbU8wbN8VIUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8278
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Tuesday, August 20, 2024 1:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Su=
raj
> <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 2/5] tests/kms_content_protection: Move try commit =
call
>=20
> Currently we are calling try commit twice once in if condition and again =
right
> after that. The correct sequence should be we call try commit again only =
if the
> first one fails.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_content_protection.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 6bd744351..db6dc17b1 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -679,10 +679,10 @@ test_content_protection_mst(int content_type)
>=20
>  		for (count =3D 0; count < valid_outputs; count++)
>=20
> 	prepare_modeset_on_mst_output(hdcp_mst_output[count]);
> -	}
>=20
> -	ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
> -	igt_require_f(ret =3D=3D 0, "Commit failure during MST modeset\n");
> +		ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
> +		igt_require_f(ret =3D=3D 0, "Commit failure during MST modeset\n");
> +	}
>=20
>  	for (count =3D 0; count < valid_outputs; count++) {
>  		igt_output_set_prop_value(hdcp_mst_output[count],
> IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> --
> 2.43.2

