Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BE6E83848
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 03:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A1810E115;
	Tue, 17 Feb 2026 03:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tl3G8tT1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0948C10E115
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 03:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771297668; x=1802833668;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7icXQ2pefRZKO3LdXFmLD3CEjWBpqimuNtBg01lNI/E=;
 b=Tl3G8tT1jmCPLeGUkdwcuIBxwGYIi16TY18jhqSEULOc+xE+GxyZqi33
 YxrhrUcwC0jXtykzHooMfZ2DEoznVjtQP6tOMqWWdX7D+wuDr98cReqTr
 w9uHrKIT+Kkw6E/zU4Y73nxbDolcC3lK0m8qqHK9ApiVeLPTY1ornevi5
 8yb5R0qoH7IXTv3IisoKZ7/2OfZC14KeYe8TvDUK6deTasJyIvYRVkbgV
 lsLNrqmVTlMpKZuporbbCVXVaabMAz8fPhGkRXTuhPBzZPrz6c3gBLa5I
 90F7FWtA38rbx3BbN3ifZRCeAWnd1YA+65iQFVgtH7Gh2GywkiZ08lF8H Q==;
X-CSE-ConnectionGUID: Lewl5Mh/Q8KMBDlH7XuY0A==
X-CSE-MsgGUID: gt9r8PrxTaWY9pfIaD+pDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72257736"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="72257736"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 19:07:47 -0800
X-CSE-ConnectionGUID: xPMmXToHThuthlaXQ8kA+A==
X-CSE-MsgGUID: znOY1ABERPq3myLREDx8Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="212513554"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 19:07:47 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 19:07:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 19:07:47 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 19:07:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T55y0y01+WNQ3WBSs3CNkKrxqIFgEpLEu7MXm+Q7/teJ/j7GQP7GCTLpJ7lk6/EQ64oJVjwjhdHMOSDpfqomes2kLtoC5Sjt9MXVYmNMrt9qnST8Ru1AZqId7kDR0Rutzs4l8CG9k5VLsgr4BYm57Otxj4pdjHS+V2RPrgoNdfHc7cOe+tSM3Fk2swUIb/bXspSdgnI6kBDFclAZLvIHg/D7ysDyI9q3J3xjIMaEgL122bLAmYQCDINUKZZxEHAvLLxMCWzHK+2Tw/PYelxrAhjesVozMDTLcPuXVP7uqfG70GbWrbxbiSZsX9K6JXdttj3oRevascB0SrflgX4ieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtPdqKTgAyEM7jqzdVqa8whFYDW9/ezfOcjFSQjicTw=;
 b=dHBEYeJcC2YcngpdBomp7Ntx9MWCZ1GGeQqHpvqhLftocRjxCMn/tU6yqRj31Hv5L688ZaT0RStsBiLP60K/zJiOBHgPKr+5GFX6qhvvtukxBs/04VDk4MI+eEI6l2HZ33AQGaHttXUqmwCLrKTo74d9UkfE48iOEkeyPxB2L5P9I8jLgIKlGxaPnWYkzOs0+YEdOCVti8PTKMv1p12IDFhPS7/867X9G9Pdj5hcFuprbmvVJeWqfU7x465K1K6dzgKnVd72xAvuVyWJX7B0pZTiyz3XPy7OyK8YEGLoPfd0C+aQSLPdaBh3hg8FY6Zf2Tg7lUxPPPZDUfmHMV0rjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA2PR11MB4780.namprd11.prod.outlook.com
 (2603:10b6:806:11d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 03:07:44 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035%5]) with mapi id 15.20.9611.012; Tue, 17 Feb 2026
 03:07:44 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: John Harrison <John.Harrison@Igalia.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] tool/intel_hdcp: Fix flickering when
 changing HDCP state
Thread-Topic: [PATCH i-g-t v2 2/2] tool/intel_hdcp: Fix flickering when
 changing HDCP state
Thread-Index: AQHcn3RDRkj6cuPMz0emM0YYQTMsB7WGNDbg
Date: Tue, 17 Feb 2026 03:07:44 +0000
Message-ID: <DM3PPF208195D8D0D66091BFD0243899168E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260216184341.437722-1-John.Harrison@Igalia.com>
 <20260216184341.437722-3-John.Harrison@Igalia.com>
In-Reply-To: <20260216184341.437722-3-John.Harrison@Igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA2PR11MB4780:EE_
x-ms-office365-filtering-correlation-id: 20e44b9a-b234-43b2-1582-08de6dd1b88f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?XPrMhTDgoaVoUivgO9QpgXUOOxRhy7675sqohJnfiuNBwVUQ4NJQ0Wr+eyCo?=
 =?us-ascii?Q?qrW+K6Uiayo5pYIO4MxkQ+/IOfYLPbSTK0AQMFblSqDuXvfI0Z8Rsrqgfvuy?=
 =?us-ascii?Q?Gsa6G+ircB4zuhIvpvE2iOKxLDV38cEDB3KRqfk/6EL1suoEQRQn71z4rtW1?=
 =?us-ascii?Q?J7CUiguJS8Wc52K1JitnSjn83BM0wZ0Os+ALJoQcPL7gwitSMH/8CZWywVtN?=
 =?us-ascii?Q?TDQ9G6/j+mZL2p0skD64L3BJ4G9LzTldJh980AmyjAoIOE6D1OoRjE187Wdd?=
 =?us-ascii?Q?ADJ1rFCP66J0oG/04kdKxhY6uFMGEkKrXO5YMtbjAoxObywIvN2YyDiOgr6t?=
 =?us-ascii?Q?VIdxDMFr0exJ58u752hraULhCqeKd5eWDXxhOcJsEykdAcnZM91eXzbRsrrc?=
 =?us-ascii?Q?uh4mLvGJCYL4aNMHMA8LZ2GD8y+lBzieFogfApG7uwsuQLU4u70LvnN2Ga1j?=
 =?us-ascii?Q?8BgChEwQCtFA0ctLiaYlmPL7vqtY+6/EPtoahBilEuGHkLdxsqSeCQjZgk3S?=
 =?us-ascii?Q?ipLBUtmKLky41EbcomEa1HisAmO9o5nSrsiGLwVgcH9YIoxe/OxXN3NKwJQf?=
 =?us-ascii?Q?gDYwPvaIsKnt1qm8JCGfK5w9vAP56p+21AAXbw10s5gyN87JKLQTI0qlH96x?=
 =?us-ascii?Q?I3586IkgnsMAUZU3FweAKfHh9qb5y6Me/M14S1KJOJXRvrkKFQGtvNIgZbYH?=
 =?us-ascii?Q?ykk1akW7e5SWMipr1xdAOKpPQBmQ3SZtAByDFKX2R3TImMGvM3/Z8U+1Fyt2?=
 =?us-ascii?Q?TDvCb+ev4pMXlYg5Rq56FeG8/sp+yFlaxSZhJhHu//AnWrY8c+L9ppWJjYst?=
 =?us-ascii?Q?iVrRR88v+Q0FduBjKw+IjwvRhbxuRzcUbPhLwI7ROSwub2u0c01oKi3ExpLm?=
 =?us-ascii?Q?mqC7rIf6iw9w935Kzc9wplNi1TEypXOxvPAb4pliHAe2qEEL13LzgcdgOncy?=
 =?us-ascii?Q?FG38rHUWx2uVIpxWPGScL0muCEgbP/+TDww/hOUavW84dlAAMRWvHM/KM5jH?=
 =?us-ascii?Q?I7i9V9n/n0OQrfiNgJwOHAdFpk5M/qAwQrlu66WFVNeilQy3xbPG1QplaNP9?=
 =?us-ascii?Q?IoufQGealtrMACLgDUScVMS2pUr5ENJCXwKqcgrPVj1WmdEmWdGJ4R4bvq+G?=
 =?us-ascii?Q?lGByIIJPUnCWhqXC3fwd3junRf0Rq/DEJLb/ouYOwC0jCW/bqEOYjua3zMay?=
 =?us-ascii?Q?GLMf6TualtwpLZqJ7J3X9Xs7XYtsvTSWmUBvuTfG6MGGnXwhcBr7nisLdfCC?=
 =?us-ascii?Q?opi5+Fu8bXjqAek7aK4WSAO2wxye9orFVSCNeCNiAUsf3TYvxmlem029bLlX?=
 =?us-ascii?Q?StLPunAC04yab41W3aHf6AaeVJ4TQ0rzER4ASTGJd0TTCQJZye97QQQVVuv6?=
 =?us-ascii?Q?BCtA+Kpq0mhZkZVvfXHU3NoCHIxftE25Dcv9vVL6uMvxxr/9wb+IpPzKf+Zi?=
 =?us-ascii?Q?id9dlpulFyVXzLAy7pRL9j7Km+AaYXlixJmyNty7dVmblBL8uJwKodCAj5mc?=
 =?us-ascii?Q?/ft6V9+wW4NDlEzc6YOgTS+WKuxYo2gG+OGkRcvwhS3J3EFntK+DP2tilk2p?=
 =?us-ascii?Q?/mnCyDIx+cXh8PUYDA27YYCXxN3JsWQG2R28XsonxWJNTU2zZnBIAhqomv82?=
 =?us-ascii?Q?7cS34ZD6i1RadJ5GXnh6veg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ri7R8kpgpyGwB0L+qckj0mzOMYXKNw1nIapajazwLaTkpJhMakGJoBepFcJh?=
 =?us-ascii?Q?W+LGlbpXh1+i5CEuYB8WcerWrf47Zll1kkvZJ08IV8EQBGJGr/omgpRRCsdk?=
 =?us-ascii?Q?hZ1RrAEbIDN5Y+G8QTUl9+T7OvTErRZjo/sjgYj3x8+8Jck+hMWC0iPJbO1S?=
 =?us-ascii?Q?TOhCO9L5xUZzUqPXT7Ngyywq0omIn50VF86WRsgwJ6P5rygAAYEEkW+CykCB?=
 =?us-ascii?Q?MYhWI0cqfP+37T0unw6GEFVL3AayModKYZMl1DJrkhpDXkD5VLPYBBNT6ezq?=
 =?us-ascii?Q?Hb+PMcKP4lG3PJXaVUFX0Zh40jKcuvPCxN0+u/RBnjTGPB3d6DyFbXosZtuD?=
 =?us-ascii?Q?gXgNUB8dd1O/1S01ZS19+Dyll6O9Q0VtozqYOo5A/xYiYtnttpyOJ6v7Yrs+?=
 =?us-ascii?Q?r1aIWAugZ1lnjw1OdPL3LAQno+eao6K9gTmmzfm7/UiczaUpmux81HhejmJ8?=
 =?us-ascii?Q?Z5eefDRgsHy9RqwYPT5KyJwSPB4Ib1tS/KopyYkpUvwmNfUrkCKhNynhJErM?=
 =?us-ascii?Q?zgDZ0j0//+PWD0dqbweNyXxVETK6czlxinY3u7efyhqo6RNmlE8Nl426/8Ci?=
 =?us-ascii?Q?qXVln+wAhTDq/nspAaCM63hVob0JxfkGx0okhtX1PAE2mBIxzjTaozSwVhtP?=
 =?us-ascii?Q?ylxQyL9xHQKwcDbnQDZviy/ATgLfGWfB/gdZ3aWnsWJ/Z7F3mulzdgnhfwDW?=
 =?us-ascii?Q?KDCQe5W0eDPb9T1C6YwdTo7T7LbyIBqINOjYjQY0FmNik9Ka+RuOarGZnchd?=
 =?us-ascii?Q?y+U5yCGf4ormnKhIbpdj0qsxFf9E68Xm6Ax+7cBRqixB9HzWrqBMzTjcfCRE?=
 =?us-ascii?Q?PI+/Ca+mewsU3PhaqJahmrg4AtQBUqq9avrQI4S6MEKcuzmqDPI34LEMqYbP?=
 =?us-ascii?Q?l9n2TgALONM/Dr7oD9+4bLO3POiab+uxsmluWqfxvM1L77Ho0NMDvgpxuDot?=
 =?us-ascii?Q?ZPVOAqbIrYBgqTYa63nb9cLGwSQ367z44E9xj4Yxku8dXO22w2l6xWCpeMl/?=
 =?us-ascii?Q?auLFLhdPFU4UnG69wbaOQaNPSwsEyKt92aGZ0ryCz6qqrl8kyAEm7nKcRsUO?=
 =?us-ascii?Q?R4ObbseLEzTFv8UlKl5eGD3u/tmvdY3TK2o/ml63iccJj6OIwxprIu4zIQjx?=
 =?us-ascii?Q?dTYKS7ZFnPRIKQq3syB5I4BpMPIOB1Yz2Ny1zlW7dTZUccbk+9kvsV1dvEuw?=
 =?us-ascii?Q?bpFge0nOobupeDghn8i2dyesnBYOtBhxsSPOlikZD8wtzK/NarfweTLa3NOK?=
 =?us-ascii?Q?0YwACj7piEbRCC3efAlwXbWTYuPnsWuhciBu04IzmnUp7Yo/UcO9m9RL7FJO?=
 =?us-ascii?Q?hd06xkj3mXNz5p7GXuDB5KZ8YB86C7pe2TRCDocCIH7+P8vSjxr4HKv4n+1S?=
 =?us-ascii?Q?UudAnHuwUAr8OSXpqydRfuglnZ8zXtSoovvK/bCNJ4G931Oio1xYT5OM5XOp?=
 =?us-ascii?Q?WekoHBtRkSWrXzdrpqMecXo3NnkYTuiQY3FdoKgFQMqsDizjSw51Ho3cZCnd?=
 =?us-ascii?Q?V0WyMowoIT1nQkvyeYqJ6vz+XAuXul/QsfT+WgM6B1AGhT/urYYPl4RN9wmC?=
 =?us-ascii?Q?pJgIIg/p0i5pkzXZWWH6wmYHJ2lVOHNIF4a4QSHrORUv+W8mceCgtnl4jKcx?=
 =?us-ascii?Q?50h1GvA2jAH+xtqGapw+NtjBUtKrLqfqW4z4Fl5Gfrm/l18NnGyqQaBFVyvk?=
 =?us-ascii?Q?VYz72qB8QFr/7Bl5JfcEH1wgrehkoknECUrS8gGj88lc5R3WUotP7jJJ71oA?=
 =?us-ascii?Q?dR3fQk2+rQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e44b9a-b234-43b2-1582-08de6dd1b88f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 03:07:44.4967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uxz7wR9u/HUx/ySrZMf21Tcs+ZoJVYJR3horp2JDR7W+gWrKNgdwez39cmn6XxcLtiUYJCtHCeEtJ5/L9xUY/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
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

> Subject: [PATCH i-g-t v2 2/2] tool/intel_hdcp: Fix flickering when changi=
ng
> HDCP state
>=20
> The menu system would redraw the screen with a special colour to denote t=
he

* color

> current HDCP status after a change was requested. However, the screen was
> immediately redrawn by the player thread with a background colour denotin=
g

*color

> the requested HDCP level. So all you actually got was a very brief full s=
creen
> flicker of the background colour.

*color

You can keep this description here and remove it from the previous patch

>=20
> As the current HDCP status is now being shown as a separate line of text =
in
> the video player's output, there is no need to use the screen background =
to
> show the same. So, drop the menu updates once the video player is running=
 to
> remove the flickering.
>=20
> Also, don't stop the video player thread when HDCP is disabled so that th=
e
> status update continues (given that the menu thread is no longer redrawin=
g
> the screen now).
>=20
> v2: Split into two patches (review feedback by Kamil)
>=20
> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> CC: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tools/intel_hdcp.c | 34 +++++-----------------------------
>  1 file changed, 5 insertions(+), 29 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> 8e29c5e32..56ed720cf 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -102,24 +102,13 @@ static void draw_menu_text(cairo_t *cr, data_t
> *data)
>  	}
>  }
>=20
> -static void draw_menu(data_t *data, const char *status)
> +static void draw_menu(data_t *data)
>  {
>  	cairo_t *cr =3D igt_get_cairo_ctx(data->fd, &data->fb);
>=20
> -	/* Background color and text color based on HDCP status */
> -	if (strcmp(status, "INIT") =3D=3D 0) {
> -		cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
> -		cairo_paint(cr);
> -		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> -	} else if (strcmp(status, "Enabled") =3D=3D 0) {
> -		cairo_set_source_rgb(cr, 0.0, 1.0, 0.0);
> -		cairo_paint(cr);
> -		cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
> -	} else {
> -		cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
> -		cairo_paint(cr);
> -		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> -	}
> +	cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
> +	cairo_paint(cr);
> +	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
>=20
>  	draw_menu_text(cr, data);
>=20
> @@ -678,13 +667,12 @@ int main(int argc, char **argv)  {
>  	data_t data;
>  	pthread_t tid;
> -	const char *status =3D NULL;
>  	igt_plane_t *primary;
>=20
>  	data.selected_connector =3D -1;
>  	test_init(&data);
>=20
> -	draw_menu(&data, "INIT");
> +	draw_menu(&data);
>  	primary =3D igt_output_get_plane_type(data.output,
> DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, &data.fb);
>  	igt_display_commit2(&data.display, COMMIT_ATOMIC); @@ -718,7
> +706,6 @@ int main(int argc, char **argv)
>  			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_1);
>  			break;
>  		case 5:
> -			stop_video_player(&data);

This removal to stop video player should be in it's own patch

As a rule of thumb if you have to add Also in the commit message keep it in=
 a separate patch=20

Regards,
Suraj Kandpal

>  			set_hdcp_prop(&data, CP_UNDESIRED,
> HDCP_TYPE_2_2_TYPE_1,
>  				      data.selected_connector);
>  			data.hdcp_type =3D HDCP_TYPE_NONE;
> @@ -727,17 +714,6 @@ int main(int argc, char **argv)
>  			break;
>  		}
>=20
> -		if (cmd =3D=3D 1) {
> -			draw_menu(&data, "INIT");
> -		} else {
> -			status =3D get_hdcp_status(&data,
> data.selected_connector);
> -			draw_menu(&data, status);
> -		}
> -
> -		primary =3D igt_output_get_plane_type(data.output,
> DRM_PLANE_TYPE_PRIMARY);
> -		igt_plane_set_fb(primary, &data.fb);
> -		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> -
>  		usleep(200 * 1000);
>  	}
>=20
> --
> 2.43.0

