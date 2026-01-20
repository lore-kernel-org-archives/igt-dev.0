Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92199D2ED0C
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 03:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B898B10E0A8;
	Tue, 20 Jan 2026 03:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YvUf42fg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A99110E0A8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 03:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768878767; x=1800414767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tAL8XKT73sFnkqQmlmUzOzINNGq3Y218HrnSJuyNaJ0=;
 b=YvUf42fggy2r1mCmf2M3I1qEboXPSnRjAeQrTA3KUJAXkTj6amoDjrXP
 z7MDOeEzlC4h5SutB8IlB73WOTdeoLij6y9bT06MWY7cXJ2LRFQBKpn0E
 KjwKDGvqX330Ml8xbNHJmwq9qzrVnYByECRJ0mjldA9G7JUSyhgLZ3bO5
 JxEGjl8EfHx2bnEq+XahRb8ma6MTySyUQ2NiXH85nsGAEPwqHqAxeXJPb
 wfp14oXZLvrvAryYUTJbvyy5xuKwrJviXzNfngDNThV/hbkw0LYDoRNoc
 KSdrPlkDDGffzzWzYerghuDx2LfzW6SHU9XX9Sjzq6DiGPVyhsMt03GTf g==;
X-CSE-ConnectionGUID: QVRa135QRD24bMx2JZ+G3w==
X-CSE-MsgGUID: DbJ1tmMZQdaEH4799BLxKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81521306"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="81521306"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:12:47 -0800
X-CSE-ConnectionGUID: yeeWP4z7TheEHd0389prCw==
X-CSE-MsgGUID: wJ/5JhRDSD6rLq22Uexw+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="237266736"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:12:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:12:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 19:12:45 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:12:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdwBJdNrgi2MtHIvfsKtw6+mocvXxmJS/xcBLKREJNqMlFXR/Op5+NXd7ICrZkKg7qqZKy+w7hSqN/QGXQz9xc22QSBGd3TDlKCuHRxaXJVDUdNVWmIznryp271LUZ4O0GufrfTf8G0jV2ZyZJhXbvEDmSVjhYkGJfP9Opl82OEHQvrK6hBsPqI1n2m6ZFP5Es0kZS+hxNsdZn7WbsQwW/ip/0kra7P+rue5AjS3yX7lHw7oBQClpJYiuvmbC9Pvjsk4O9jdsdLvQwUBLbLxh2uNTNR8N/NzU7fijQdSVmNT3MacHA/ZWI6dSIxqWfZjOcoGEnIjL/ENr1JSS0z5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ur4GjKzTfBwbyEoKqC9W6H0uKWQe4+j7oEIljs6JjQ=;
 b=yBSrNq3DESTKhRPm0XE2arsQyN/tOCFHl5WreHh+7KLyystz1Zf6MhK2NbZFElR1Fm9eCJL/npV6+h5BzZ0qkZUS1z7TUSkbimA6T371DF16u/V2r+AqPYKR41AF590QAc/zHYIB3VWttTW4j128EWCQLKNrUyrMkcBQEg4zJUSakpU0bfVwl8BlBllNYeXnjo+lEtF11gBA6JZgZnlFgqt2LjFUgaH+lbs06+g2y0iG/Y/XeHpLIbzBvh8OveDMJqIxNhlWG1UGn6HNQGvLGCwy/wkxWTxYNBWSz029sMsfBDMeiRY4XSKrLeFDX553nwOtJRvHmmTljhXW2FaF6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB7589.namprd11.prod.outlook.com
 (2603:10b6:806:34a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:12:43 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:12:43 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v6 03/10] tools/intel_hdcp: Add helper to set HDCP
 properties
Thread-Topic: [PATCH i-g-t v6 03/10] tools/intel_hdcp: Add helper to set HDCP
 properties
Thread-Index: AQHciUAUvdqHlOQS4E28O4S0KRUUNbVaYcLg
Date: Tue, 20 Jan 2026 03:12:42 +0000
Message-ID: <DM3PPF208195D8D85EC4139230C22AFA8C7E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
 <20260119123142.504623-4-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260119123142.504623-4-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB7589:EE_
x-ms-office365-filtering-correlation-id: dcba4069-8bef-4ad3-90d8-08de57d1c711
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?3dlbEQWNfH9rkBHFfUJ3Hvz6UZ8dItnXKwC1ksYDkYOoyuWhb+HCGtfqH66/?=
 =?us-ascii?Q?jzp76531hXh0e3pR643te25cnGeJynYZK90pXiuh+FW5BwL9qt0k5akSGRo2?=
 =?us-ascii?Q?iJftHtTs0S0KtsU16DOCltvai3tAhB2l8ypLFvbkN98Z0yF62rDJ9CbiS8au?=
 =?us-ascii?Q?AuFDJg/M8Cie5PXeKSs1FCvIWTg08cv1RNgrRwoyXlSd5Sdk8OFFJeC6G8JU?=
 =?us-ascii?Q?hzMe+uuUKwavShpCLpnmtsKuJrpPYZ8LEYqUDWTR0XbcZ9S0qhaCIscgAhev?=
 =?us-ascii?Q?wVuSwCrqxdvVr6LvGJfpNnQSXCEavORKnGMjrxihwPXIEoJN6LpKGU3h/kLs?=
 =?us-ascii?Q?YVI+KGHKDGdzdZItt50f5S65XioNmtDf9C1NgxK3sE1MHh20fPGc6jQLfRJJ?=
 =?us-ascii?Q?/prFxx+Oqr96fsHaaQ8S9HtlKOH8BDxJGxS96vyWGgPGHhagJFuYIbhNuGKU?=
 =?us-ascii?Q?cCV7gCStmU4iFhSLvw2iDezlOxI7Zn0L7wzvaJDEifMb90YwTXcnsEHCurmC?=
 =?us-ascii?Q?gSX4w4gD1hx4OOP7yYaP8tqw8i+sO++UjUtLtPio5wQXReSo0uai6dqHjSGA?=
 =?us-ascii?Q?MI2olHG743LISVZPXpjIzEs7xB2R2s/FlNVegQMJOIyBIy3gMbCUZz10W78U?=
 =?us-ascii?Q?jL0qFvBcBoyTo4H07Ritvd1luNdtO624bcBAl5DRc04dmPFUeQ9pSeAV29lt?=
 =?us-ascii?Q?8CUn7tyTKaJzADN7G4b8HYAxdSkow+KMOyoNgA9Q0om7I5w6h23kkEhEKPfv?=
 =?us-ascii?Q?8e74QQIuEm8sbg9ew5javDdROuAuhZ8n9JcNpCAEm51fudC6Ni1os5ybwIBH?=
 =?us-ascii?Q?Xiin2zvbVi4gKllFmh02NlOaUBuAg2j2VEg8yBlaz553yLN6RRiGo1YTVGxh?=
 =?us-ascii?Q?gitToIpCNysYoY9DQ6fuhue8J9z99ra4W9XQl5p/kuvUbisxJ5mjAwYLBYM6?=
 =?us-ascii?Q?koqEYLaAm614FvHKeIRrdhsz3mqc0Amx3amFvwSTcJE2mG7bX4xoBcYkbsny?=
 =?us-ascii?Q?IhXRx0V6EPwu4o7M1sIajvAUmn8DNSGeLFYBwVtg+ZIJbBiQADUVNlIl456V?=
 =?us-ascii?Q?e4roePIo+LARh+9Z95xy3dbnv3SuvkD82mymjrgWOG30BnMgTvg1JaX8tvVg?=
 =?us-ascii?Q?/qXXUWPhLIIX/A85Fa7kUFgG+aCtrZl+dlhqdSJrfWKosAYSRuwSTlSRC5Ly?=
 =?us-ascii?Q?LggC4aM13/qBBqXeyivJY8BTWS/cZ5U044bUoNTetAktF57Et4DfouP5FPNx?=
 =?us-ascii?Q?GTNKy5EAbWd2Tv79q5u5WI2T7k0AUnTu8E2idDY0rE42W5zPweCT5Sxf/omt?=
 =?us-ascii?Q?kFlCDHyb8K0I6PVZYH9zBOsgV/A02Te6DZ+BRrB+6LtGaVRSpJnFZaDYuqys?=
 =?us-ascii?Q?zJz6w8rJZ6BXrgrVb+jXwFKm5Q6qTIYLeph6IHQrX0T66HXZclq0y2pXGKMk?=
 =?us-ascii?Q?RCQFtOJvuSPs4AiBxGqvYHSKk1FCbhrQdf3CCfXkJCcM8SonP0tmVRevdgdZ?=
 =?us-ascii?Q?LO0hwYb6xztERDbiwA4jEbf6owEnmO7riIUwc9QwYlJLjw+WIvXYOIqF2XoW?=
 =?us-ascii?Q?x91CZpJ9iz/hyo/7M/mmbziE1ok9hhoikHdTd0Ey7FAkQeidDrD7see2U2cs?=
 =?us-ascii?Q?wQnOuIMfI76KvP9v5kz0b2M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VgiKeKL7JCdOr3Q/n5Sx6CNLe86nK/bv5SHQfYFG+KmAztQwCIFevi07/iNU?=
 =?us-ascii?Q?EhLrw63WpuHabRc5FrbZ5xndPwAQbFPSCYcpsE6NcGbvP2S8nKZk2hUHzVxk?=
 =?us-ascii?Q?XRrseI4jQ200BHHHnkmRZAVbegHGu6iAfvh+7uXJseYLDPzCp+Vlmyr8ij15?=
 =?us-ascii?Q?0zWz0kVsCHv0l0NaHupDS9s2VG7+WVVb5eCqSKbB2vOauauyFgrchwmG/mtg?=
 =?us-ascii?Q?VSaSLB+9G0wsGsi8z62V37iPCKT0ZSy54R6oMCNwece6utmWOioboOr+R6re?=
 =?us-ascii?Q?zxm8wehZYhdA4hnCQlvF7MMMxa6Nj0cIVO3kxrwBW5keaq6qqR6z8etly3Qz?=
 =?us-ascii?Q?m+nVVX+ctEXVEcrZvkzw279850sqTBkuIu4O+GVRgYGsGug631k7A9a3Mmd2?=
 =?us-ascii?Q?7v9X3JOgBSyKZB/Re3PYoBtCMyKOAXMymMjEaCzLKT0BXWv/NEcTN6Q/B9v7?=
 =?us-ascii?Q?sPiXe/+xUHrQBX+fEj1/6Hf9ItxnXD/3MDZEv5xMIbKX/EetBTAxFev1JEik?=
 =?us-ascii?Q?BhfDQwFOUjYr76apBIXu4mCc1v3u7CfN/e0xNTg9p9Jkvx/s7hfnPVTt2889?=
 =?us-ascii?Q?J7vfXdn4iXiBpV/fROkDQlIqMVoBJhlCnl0b4AOfpYqL8IOAiaP3OQy/NWdi?=
 =?us-ascii?Q?nDbSHFZ2f1A/Y6uuRr6QCmGlhXTIwJcLGJcpGZAnStYl4fbc/KvTlLOPBtec?=
 =?us-ascii?Q?5cu9ht3HDVBlA91uPcswlRlQmKcr/hlxY5736BWYNnqbAR9EAJ1bRNmQ9DIX?=
 =?us-ascii?Q?Bt2Z0aTSQIXYc+ZlTv0hAqIXiAyq9XAyPELVK/Z+wDcN2qMxDkn5vJOOoq7k?=
 =?us-ascii?Q?jehF50d2v6AHgGJAfqqhSp4OGmbHCPNCQrxuaYRe6ryo0ZzlHLHVZdqIqrga?=
 =?us-ascii?Q?HvHfcuBh476w2Rnk5I80K3p+T7iJrJKgFdxL8otlDaRhbB8jZQDlf3um3t2K?=
 =?us-ascii?Q?wt8x28UxPsDYgCRQ7BXUrEL8ibJGMARFm5DLVjgJx60pAljn5YQyGqqOAXvY?=
 =?us-ascii?Q?ynSM9Wzh21TrSfscQakmfwz8Xg/QwyVVQYQhRboLLzWydAwIUwmSIs/tGgVc?=
 =?us-ascii?Q?x9Dvnsd8rdw+NvXxDiY/baZxhhwl4Ffi/mH5/xek3cLCSYbrCbygOHYoLfGf?=
 =?us-ascii?Q?iDGHfUwhDnI3Co+vPljeCVkcJhhKysDdPJnsZdC//5OAIKcyS35uXSI5mvkx?=
 =?us-ascii?Q?6E4w9JkOwnpn0ejMn3sv6ofXL1vqIM+++fAR/T86uZQEPHkSl5RO2rRCG6Zj?=
 =?us-ascii?Q?Bw40gs82lcwz7pWU8yXOJQrcSJpbK2sTcY1viCzRSwtkZrrxlSS6xuCE48yX?=
 =?us-ascii?Q?Tfo/dqnxcZpGSaRx4RtyPAOZc7IlKnDEYl/sK5eDWCz2f75tWtxmdPBHD/v9?=
 =?us-ascii?Q?k1YrqnNbSUe68taEpPPMyH2Sc3ZuJ7ix265gWqmMcMGHBIsP7LoEXsT/kWca?=
 =?us-ascii?Q?pDhOKPE0rK1DG/fqYod4MloIccUvVFJ3SLb8bqTLnrJ7IvitZK08bbJAA1PB?=
 =?us-ascii?Q?YIuXGgQ/fpaVkL6/OGAcdn1SnvMd8TU/bof79mTuBWcb1Z3IPTsEeJVbRzdT?=
 =?us-ascii?Q?zCkfEdc9O+xdThlk10afzTqdjEOzKTkvtWL7u/xZ86SWCIXp0GfHTqMwMQpH?=
 =?us-ascii?Q?IOtxh0j9ApiKpg6Axvja9ZaQ8gh+MrJt/DuDUFAuaouv/h4A+tC9yOxkM2fL?=
 =?us-ascii?Q?4KMZGYop0JYEJKX1rIongTui4XG2dNOpZ49K1I+5ndode8xykdOzPK8yx3b5?=
 =?us-ascii?Q?BCeQxzQdBQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcba4069-8bef-4ad3-90d8-08de57d1c711
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 03:12:42.4251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RX/RPTOck38sk6DWFdGYSf2jCG/pWi6JQWq2/DRWHVWvPOW9T72bzBNSLMdvwbFSkT/phE2Gb0DhZamMdvTjQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7589
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

> Subject: [PATCH i-g-t v6 03/10] tools/intel_hdcp: Add helper to set HDCP
> properties
>=20
> Add set_hdcp_prop() helper function to set content protection property an=
d
> content type on a given connector. This helper handles both enabling and
> disabling HDCP, and supports HDCP 1.4 and HDCP 2.2 (Type 0 and Type 1).
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 48
> ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> 6ca067b41..082dd98f6 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -31,6 +31,54 @@ typedef struct data {
>  	enum hdcp_type hdcp_type;
>  } data_t;
>=20
> +static void set_hdcp_prop(data_t *data, int property, int type, int
> +connector_id) {
> +	drmModeConnector *drm_connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id);

Please use consistent naming of variables you just renamed a drmModeConnect=
or *c to connector
And now you have name drmModeConnector to drm_connector.
Let's just keep it as connector everywhere.

With that fixed LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> +	igt_output_t *output;
> +
> +	if (!drm_connector) {
> +		fprintf(stderr, "Connector %d not found\n", connector_id);
> +		return;
> +	}
> +
> +	output =3D igt_output_from_connector(&data->display, drm_connector);
> +	if (!output) {
> +		fprintf(stderr, "No igt output for connector %d\n",
> connector_id);
> +		drmModeFreeConnector(drm_connector);
> +		return;
> +	}
> +
> +	switch (property) {
> +	case CP_UNDESIRED:
> +		igt_output_set_prop_value(output,
> IGT_CONNECTOR_CONTENT_PROTECTION, CP_UNDESIRED);
> +		break;
> +	case CP_DESIRED:
> +		igt_output_set_prop_value(output,
> IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> +		switch (type) {
> +		case HDCP_TYPE_1_4:
> +		case HDCP_TYPE_2_2_TYPE_0:
> +			igt_output_set_prop_value(output,
> IGT_CONNECTOR_HDCP_CONTENT_TYPE, 0);
> +			break;
> +		case HDCP_TYPE_2_2_TYPE_1:
> +			igt_output_set_prop_value(output,
> IGT_CONNECTOR_HDCP_CONTENT_TYPE, 1);
> +			break;
> +		default:
> +			fprintf(stderr, "Invalid HDCP type\n");
> +			drmModeFreeConnector(drm_connector);
> +			return;
> +		}
> +		break;
> +	default:
> +		fprintf(stderr, "Invalid property value\n");
> +		drmModeFreeConnector(drm_connector);
> +		return;
> +	}
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	drmModeFreeConnector(drm_connector);
> +}
> +
>  static const char *get_hdcp_version(int fd, char *connector_name)  {
>  	char buf[MAX_HDCP_BUF_LEN];
> --
> 2.34.1

