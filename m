Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4148C71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 18:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FED10E145;
	Mon, 16 Jun 2025 18:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgCIdj8J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC9410E145
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 18:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750098946; x=1781634946;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xRbQUMG17mknfoahzts48YvOUeGKGIbPKPi9DWArUhI=;
 b=MgCIdj8Jl6jdMs+MQEzwivCQkOyMd5KHaA/k3r5CFfteZKMBRo73Smqf
 gKhstyzfS3RDzH7+hjC0yIAGn5EkBPwMppt62/M3iXG35cybV71HE010L
 8N/hJW4RpKr6Da4RzWpMSZTR07WmTtT62fUnOhwRavwWEbUV9iQAhNQN4
 Ii72B7taPgn27R9IubkhaihQYDv6VtsA5wxaYD9jrH0Dcv0LzBQa0xWaA
 ZMNf8BiQprz2RPCjPNdKVxGOd1DWS6q9mj+t+hdcuW/D+u8cjUkWahr3n
 nI6JeyZcB2078xGS/iJpAJq1qQhoZXzMsBdlDKKl05G62/ZYkSakscLSn g==;
X-CSE-ConnectionGUID: LQukA5luR5mAV38RGjuPSw==
X-CSE-MsgGUID: R0gKAsf1QpaqnJLTc36zcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62860490"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="62860490"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 11:35:45 -0700
X-CSE-ConnectionGUID: aNFq6mVDTveKtfTcntEAhw==
X-CSE-MsgGUID: moHOOyXiSQazFcf8Va100w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="149417736"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 11:35:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 11:35:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 11:35:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 11:35:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgLmmErfrfmTEX3XD2vSxZ9SvL9oss6A29o275FxN4f1OmmBkW3z7779ZT7s3dD31ui89mv6mJ/+G2GOdB+dXr6ULL6wkT1Mf1ipsBRAEvqgnqZqL8lzIY0WXX+sRraBxeNBoamkSSLMeZ4wVMc1ogTTlCJtyVt79CgzMweZD/l5pQx/jDz/XlUHlaSTcRGI5WxxJWDZ+L8mQ1WwiHqMOKVah4gfYYwLe2MtC02IzdeiTvG4KqvrRELUS73qpomcLfBNVVRGJLQ/q+r78ljt/C+8GD5osRr/JYfs94RzCfdI1xBfrWkDEY55yGRAA+lfinFELlbc35Yxwib+B6VWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ap4gmo+ZruWlKgdZ55u1rOfkDghbV9qYOkOMK8kULvM=;
 b=OhW+x9v8LUpUQQBFaYfeNKa4QgnCHhrqU3WauB8FroC7VtQE7U/85y9jV7SDjSqRIzpPLaHiZZs+7LrEChM7NPCo8JkALCUpIDxg+/1lAfCxB4T2XzpWarDq0ULdC0O951YSYFbiaM3Tpzsej0JNNKLto6c/nXTZ0Em3QA3DyN229n0DAaD8il11qy41pG+5YwCKQAZ1gTZmpCqLtNTuUfGGV5fQNDnIWfOIVL7W7zK4FTk8o09vzAGknynGWzC1XKh8ox8KLXeOA2pD4/wdrxFL9r3zy5cxjVyDjw1ASrIdux7oZlt0mYh+nZ6dzwJfLx2kYoyS2IgMkdgbI3e10A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 18:35:26 +0000
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8]) by SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8%5]) with mapi id 15.20.8835.025; Mon, 16 Jun 2025
 18:35:26 +0000
From: "Grzelak, Michal" <michal.grzelak@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_setmode: Find compatible mode for eDP
 before selecting default mode
Thread-Topic: [PATCH i-g-t] tests/kms_setmode: Find compatible mode for eDP
 before selecting default mode
Thread-Index: AQHb3CS1vhaalwZI70qcTFCp8stWSrQGHwmA
Date: Mon, 16 Jun 2025 18:35:26 +0000
Message-ID: <SJ0PR11MB507248333ECA5D7E74CE9B118F70A@SJ0PR11MB5072.namprd11.prod.outlook.com>
References: <20250613054848.3279961-1-jeevan.b@intel.com>
In-Reply-To: <20250613054848.3279961-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5072:EE_|IA1PR11MB6076:EE_
x-ms-office365-filtering-correlation-id: 7f582f51-c333-4bf0-31d9-08ddad048fd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?pJxElzll1St9IRN3IzBH7mMFxPHMSLf3fmb8r2NRb9FGcUfB81djHCXYak?=
 =?iso-8859-2?Q?ref9aG+pla5xjsf6HfNgCF6MAL4tnsKNf/vfzUkZEg/1j4Tkx2r6AU6yYd?=
 =?iso-8859-2?Q?lYfJeNn1tEAMSOTW8XucvnhTS9zq1g3wY+V3k4TcnoKPrsFkzTPKcyFmsl?=
 =?iso-8859-2?Q?hmx5aBPwsZEAoqzLtHV/0xbRUytd8PwKVOGAwlhsYnpVr2DbeBItGU4m6P?=
 =?iso-8859-2?Q?IPM64uulGcErtDbyw5Xa1wwrkt0+FYp4OdsE9iROJUvIVv51y7NXcbfdn5?=
 =?iso-8859-2?Q?mFfmH/dZRKsb9B2oDtmR384i+c654WLpr6qb02Lr8GUonYyvfYZ3yhJjOw?=
 =?iso-8859-2?Q?ekiP14nmE+6R/McxOhH7/N0mUFHQRSE69nbpHz6Ej6y1T0wNPTY+usfD7p?=
 =?iso-8859-2?Q?xxhUXACJ1PCPISGZGVjmv3rXYXoDxakrD1JfYC4K27NO2gLmdSgVW5uE0m?=
 =?iso-8859-2?Q?3bRDMcsweI4Q50MITIcCipFTx4Gl/6DJWVwp7HZ9hHhhpcSww4kfw9Bmb3?=
 =?iso-8859-2?Q?l+GU0AD7f2hHFcwXVvIA6ZOsOmx7zlSonnPBYaXnpTmN52asaYeAWN8U1R?=
 =?iso-8859-2?Q?hj4R5u1JBdUuDx1HAAMFhZCBz9bLj/qA5jyUDPDLOKToWP2dxHpad6n6pk?=
 =?iso-8859-2?Q?SkDkwIyHNz2KJ+D8Pk7ZJ7Pg/W17Rp7WPpMHqex646S9kjFECp5WhEP1Cz?=
 =?iso-8859-2?Q?GispG3vn87hteeuWP47PVBzwrzfmuo4kuoXFI3AJjXkv1r0UBoWbCk/PDB?=
 =?iso-8859-2?Q?37OVidgmyAYRHTh5mwEoY5WZh7lp23IP3HzvTdmc4qqIC235IbFKPTcu8c?=
 =?iso-8859-2?Q?E/qyh2Xk1sZbxXYjFFgxoE3YegC/62f70MyX4LDFh+0Oc9YVhXFuFLl9/T?=
 =?iso-8859-2?Q?znRQe3+B8W7ty8t9sPQYUR4h+E7Y9iSyrtl6C6HvooHRRDxeZ6Hw7GIxU3?=
 =?iso-8859-2?Q?hK3Z+hZfZVuTFGq2Iu5dzb83RrUkN9LXOYvIitkEaI1IlGnLJPROrfreMa?=
 =?iso-8859-2?Q?qWZ6i5ISpA+vmCZKRVFUklqEQYTAAyEEkCsUKzlkHwXr4DxJK3X0h0FZOL?=
 =?iso-8859-2?Q?jmw+e+/RlZATwpmn+vKVUVVthz19v5IE9a36tvxPlxw079+QBrNP9wlKR3?=
 =?iso-8859-2?Q?WcQuPIG3ZQ0xyFWIjEB0n4kEAxGz99jdrrNr6SzIc+g6/IL93S1v5E2cMt?=
 =?iso-8859-2?Q?pUbOzNXHthpqbJF/WzzkkeF5uiXtTDvAXkxyJtyCeQP+H+e2iJJ/E8Js8a?=
 =?iso-8859-2?Q?raFsBklqq6++Ladb32IfD6lqMJbuSYa1e7HeyYzQk6qTZsdtS1a1hEL/9D?=
 =?iso-8859-2?Q?aFeIxV/DbLB8rwOdTZCWSa7ylifEHNbpz45bF/kEheQr6IbpzYnfKR9g3Z?=
 =?iso-8859-2?Q?Xx4BTuady2fw/Yykq32wyOyR6Fp8HUobjSSlEBgTS/i3bvwutENrYdGGna?=
 =?iso-8859-2?Q?ToYnQWWYlsK1q8A9bWKLv0hrFrQKxbmO6IuG33Q24T0FTAcmIDVmQqnG+o?=
 =?iso-8859-2?Q?mj/SM5ltoO4JQxruzkiiDELxdWQTbc+dqKZozALzG7bG/8ojBITcqoUm6O?=
 =?iso-8859-2?Q?WMRojE4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5072.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?rkvAdETGrKm1WxEvBI36b5LOOcCCj3tmaVBaryl6fIawOh+hpN7qzggwND?=
 =?iso-8859-2?Q?CRyBUe7jLnLCkXq1ao50pOEDS0Pxb+Rb57gbM6dlMVwpX6smQxszBoB4z0?=
 =?iso-8859-2?Q?LHcGpX75V1Rt3YJ3OjyjUjVRPoCiA5V4s+Nry3s2AFsTNERuH68DB9Xx2B?=
 =?iso-8859-2?Q?VJ/ElmwAIL9kJB/GHK1I8J9L85nnkghOAjhmZe1Zd0H32iVE8L7VQmWTKJ?=
 =?iso-8859-2?Q?JwiSuIhqaKYYUYG6EtTqmxxeIbnkL03kEwNUd/uOageRFJ0Tqexststu9y?=
 =?iso-8859-2?Q?6L43qnNQa5LOY5YetZYKCBZiggzXpi4zaYsutNpgFZNSazateshs0gqBlZ?=
 =?iso-8859-2?Q?uTQxCowqfuRMePqu2gp0+N10TKY4Jt165I3uhKNPjcv8tOG9GWugjcUWxH?=
 =?iso-8859-2?Q?DHDdpNSEMC9xpPAHw2ZwJhSerWvOLtKI4wDkxUGTqDriqWANaIdNVlhMX9?=
 =?iso-8859-2?Q?jgGzykh4s8SH6hpm0gDBWwGNnxHZwhXm8z06DwQhkW5azc0BjCet19fi5X?=
 =?iso-8859-2?Q?wylLkyZsJ1gyFGsRELgLJNiX9WqR3RXc0EMjtqtyinFNEfuj07qSshmJ+V?=
 =?iso-8859-2?Q?jA1YwTFeyisenT1Uk8oUuhDXMJ+o/NAwXi6nCb0VjMeuAn/WEmvkbpykkm?=
 =?iso-8859-2?Q?Obc9rGTqF0M64t0vyadvfQpR02g4NJMz5vFwHgIP2MpCvWhLxLsd5aouhS?=
 =?iso-8859-2?Q?G9acI8BxFCqleVuxrxQbbbA3wfh30MfoMUk1d0cbLnqXUipRCL07QipLcB?=
 =?iso-8859-2?Q?lMlWcKVGn3xG9wFasP/S+P6AdXtYndQCh4fBOxEa0HzHSSTl7mC1zebk7N?=
 =?iso-8859-2?Q?72375CfEf32lY0rCFITguDi2+qOA4cJkWGpWAbAtEoyp8ET7iUWDEnOL6A?=
 =?iso-8859-2?Q?TDAlUST21/oU/9QAaAQhcQiTF0D9ehi0YmZen4ZvoOENFIOjgP049sMJo2?=
 =?iso-8859-2?Q?UPZuH9WavUJw+8GdrQl/eCiJVY22456VRM24hbO5y2fIZVXqKK15jZk2lV?=
 =?iso-8859-2?Q?/kD+zaMveWI+i88idxao5Whae/7X7DtQLd/9gm3nIpi5njlwNTPzAPIsXX?=
 =?iso-8859-2?Q?JO+mqNVoMNNFoJfMAnDsHTUhpoYXyiZRHlUY/zjJKlBZw3eHtvOp1CDNes?=
 =?iso-8859-2?Q?+2d7duP6ndmxG1x2lwfr3ThCAlRfE4yRmqD4dM+g6sEVnsp1qf5N5JUK/G?=
 =?iso-8859-2?Q?iGGU5hNyckj4sGJXhhiCpMG6gbNEUOtk3XmbDN42yTGKR7dyslx21mJhFc?=
 =?iso-8859-2?Q?6F2A+tFYXEu2qiPyeJkOM7eGgznm+/brvykYP1I4Cj+2++h4EeWgi77/+h?=
 =?iso-8859-2?Q?xEQbMu3uH4LoT2CyuQWYtFoL7gvE3jd9VPMeD7YZePse5o8L7KftqAxgan?=
 =?iso-8859-2?Q?fWNRQmNRDcNT3gVmCVI93I8AMnYQIRQ+dqkFP2+ABJgr3mUbcJT0Me4guB?=
 =?iso-8859-2?Q?kq/h88m/2EeGQf4gdpqUinMD2sKELh3FQiOFtxVXtN/2UZIrKff5gUlKG6?=
 =?iso-8859-2?Q?H/RhOvdCjubJwbibm5Rnq51WYQC/BMPWO2y0h/iYdfs7/G8aSjBqz2wu0/?=
 =?iso-8859-2?Q?hDXPDoh+zZyRUOQ5PSugX94fnS7zePMPvCiwFkU1GgyGRa9DrT6HwVsLjb?=
 =?iso-8859-2?Q?hPulVxUBGjAPIj9v5QuFFZTVCWWw1D4W/7?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5072.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f582f51-c333-4bf0-31d9-08ddad048fd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 18:35:26.0359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bIMNGc9eD2oBE+8HPfRN9fezelihvS003zft1sq++UCZzVhe5a+GadjiD9h4qjazuN8FAhA1xwlz8eu8qfXKVW8Ve3RDV1vw8yDw536cz8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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

Hi Jeevan,

>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan =
B
>Sent: Friday, June 13, 2025 7:49 AM
>To: igt-dev@lists.freedesktop.org
>Cc: B, Jeevan <jeevan.b@intel.com>
>Subject: [PATCH i-g-t] tests/kms_setmode: Find compatible mode for eDP bef=
ore selecting default mode
>
>This change finds a common mode for eDP before falling back to default mod=
e.
>It avoids unnecessary failures by not selecting an unsupported mode for eD=
P.
>
>Signed-off-by: Jeevan B <jeevan.b@intel.com>
>---
> tests/kms_setmode.c | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>
>diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index 484c3a95f..6e=
7e5942a 100644
>--- a/tests/kms_setmode.c
>+++ b/tests/kms_setmode.c
>@@ -252,6 +252,21 @@ static void get_mode_for_crtc(struct crtc_config *crt=
c,
> 			goto found;
> 	}
>=20
>+	/*
>+	 * If eDP is present, try its modes to find a compatible one.
>+	 */
>+	for (int c =3D 0; c < crtc->connector_count; c++) {
>+		drmModeConnector *conn =3D crtc->cconfs[c].connector;
>+		if (conn->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
>+			for (i =3D 0; i < conn->count_modes; i++) {
>+				mode =3D &conn->modes[i];
>+				if (crtc_supports_mode(crtc, mode))
>+					goto found;
>+			}
>+		break;
>+		}
>+	}
>+
> 	/*
> 	 * If none is found then just pick the default mode from all connectors
> 	 * with the smallest clock, hope the other connectors can support it by
>--
>2.25.1

This patch looks good to me.
Reviewed-by: Micha=B3 Grzelak <michal.grzelak@intel.com>

Best regards,
Micha=B3
