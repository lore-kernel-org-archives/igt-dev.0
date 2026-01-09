Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9DDD232D8
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 03:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D7F10E7E3;
	Fri,  9 Jan 2026 03:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuhPyriO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFF510E7E3
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 03:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767929738; x=1799465738;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JqgKcZdZwnDm5nXvUgHdY+pz2kQrx2PUZouboVZxdiI=;
 b=YuhPyriOIN4o+PcqbNxgxBaTg+VkQH/abkM8lebCt9a8vnObkIIVbqpA
 lohkpRKaMg1pgDF22TP/CVLSseFISSaVDN/O+gSdlFdyb4CfHHP90JMnT
 +ehA5XQBJkq+idSbfO2K2ZMf8jzzA1LvHMd3+Jzq7Ues1G4wMBV5vz9Vo
 ffpSIYmnX7QPDyE8pdiOjzdTvKtCCNGnF+H3BywzPy48TVZLcsa7mqOkp
 4bmrsPPHTtZBwaqYCkuLsa6yFcHjC/vvhU7bDZSJgox3wNhaEBJVnz7zE
 uYu67MLJPNQ8G55nek1mag53p52+3x9Z5uf5rSkVgHRdmyhKaEfOAPL0z w==;
X-CSE-ConnectionGUID: xp5uFkQpRESK5uOJdeF7/g==
X-CSE-MsgGUID: VOx3UACZQ4uOxmjpd7UIGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80678582"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="80678582"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 19:35:38 -0800
X-CSE-ConnectionGUID: 0lOlTSY3QPK1VZrrUZWyHg==
X-CSE-MsgGUID: QYaQF3gPQUeuWcNE1CXJ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="208208860"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 19:35:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 19:35:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 19:35:37 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 19:35:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2GJb/v71Nft3tyJ7FYviVYP6GRN/XAJiNB/ZeEyiHsPV0L4wWKhAn7aBXzTxw4BSNHaoYEKJqZ0+LzRzOLrxw5zO9Qd4ZwZRyyYx/dGDX6XJZj2DAvz01hPLNLo1MQ361NXJaPhNNlzWTkUQCv97de+XTeEl3RtrIpegBAQxVyeRjAboqGkPdaL3xyMbcU9wPgmNRpc0nzi2QsNV2FfZEzCeiqeJjbFnypnR84xbqhI3pFNWNpcu0nLtdz38yevZtk55V9iWrcTMflJeYuYoHyHnMeEI98gjkGSausPTYS9Wp8fxH7CW4rSOyJdMqJ8oerN5oVWXRmjszNiARhgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uxjUMMkdS84uNID50q38wROuhwGHzBoi5MJ13b5v+M=;
 b=EtMvxe628f1XPzlkVGnPj9h1D9vQdpjKMzoyTtaJ8KSr//L3h6sRKUPicuMJ05qJdEMaXEd1SVy/q5kZEJfCsyYyh6Fgd8Cj5V278LI6a0mFc5sYWBl1QRVK4XA1AlJAarc/aRZGaPPsi3KRdvv1PF/cL4Wna/q8+9UruFuYXP2AIrBQOEp57WxZJBjjaRzcGS9muhA84yml2nkblCMR/e+g0KKea96nYto8w2duq5v1G5d869ZkEwU89VRgjB7xLccL9937lk5KDdDYOn1vQxKlD1cT+44L+Wbd7/hrpa3V6VHCQp2fW9fLiL5CWwmZjIojb+hnXk5D0QeyP3suKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM6PR11MB4580.namprd11.prod.outlook.com
 (2603:10b6:5:2af::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 03:35:35 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 03:35:35 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v5 4/6] tests/kms_writeback: Refactor format
 handling in commit_and_dump_fb
Thread-Topic: [PATCH i-g-t v5 4/6] tests/kms_writeback: Refactor format
 handling in commit_and_dump_fb
Thread-Index: AQHcgLNzgr7uzwkuYEe2Yypkgubu07VJL9pg
Date: Fri, 9 Jan 2026 03:35:35 +0000
Message-ID: <DM3PPF208195D8D49AE5533E5D7141B1BF5E382A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260108154817.48665-1-sowmiya.s@intel.com>
 <20260108154817.48665-5-sowmiya.s@intel.com>
In-Reply-To: <20260108154817.48665-5-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM6PR11MB4580:EE_
x-ms-office365-filtering-correlation-id: 99442a5c-3a9a-490b-03e2-08de4f30268c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?b4wTAbV6ggSgXPi1qOk4v8LEgDxSR7C0GEF1CkyC8nHtC0gpm6NfM6nKMhCU?=
 =?us-ascii?Q?2LoFx7gjvAHqHl8SP6Yflz0C4wOoIowZnCNWMwF9PAFzb3qHQBxaY4hecQHA?=
 =?us-ascii?Q?yQwQ+f8CpKcDl/S+oqz5Oc+U3bP3UutYl+/rjis/ka96sp+/444OIeqTYDeq?=
 =?us-ascii?Q?uUxI0j5Usu2GJeQ9yyBSXKQugWbIjKcoYImkyAEddkR6CQA9MIc+qlXsYyEB?=
 =?us-ascii?Q?pT8AOFzEmr2YLCoQjZWdfeIa8IgnpHIq8LQ30Ur3qm9hz7dJcCUSdIT4AEgA?=
 =?us-ascii?Q?uWCLP4ROhngntL558uk7TiZAK9C+5+BJbpeJX49SzK+R5r6aHMYKSv4/U6G9?=
 =?us-ascii?Q?k/S1F4myF7aUZlg3e36TbXwHw5pVdgWK1X7QRMlwio/Y004WeswVxBzVelkM?=
 =?us-ascii?Q?zFU42AnIbKgI0Mx7MnsO7ePvuSNJVLEheS6lGbVBsOIuCjqQqRkd8mGTElcM?=
 =?us-ascii?Q?f8hYXY1VVhMTdNWUqDYYrBcqMAKV3n9ER9BBBVFGw8yh6M7cEYv42lkvdcd8?=
 =?us-ascii?Q?+uBJJVSRwX3ysHoBdMyW9oJ78KL6pY2/LAgEP6/oeDva/f0MHdWZRzVBrZ8i?=
 =?us-ascii?Q?FCBqwPoeqlGsb+Ym6KLFjAH+FSHeNpJYMj6pBZB07GXuIOYs5Ek9k36WSsMc?=
 =?us-ascii?Q?jodVi/3haWWNc8OtoPnjkZOXFFMf61uoy/5Yl1+okHUsGYhmdJuMH0RxBtB0?=
 =?us-ascii?Q?1dBiVdz5ayAX9XY+96Uo2AlMqDcu3MKeJN2Y2MDuSZzUPLwbMeTIrR8zUijW?=
 =?us-ascii?Q?9+1FrQwLGTeKDCiR8X4RDgeN2pBb3IcVAGKLY7vIKFIUAdWEMEss+/4GWDnK?=
 =?us-ascii?Q?8QmwiWoGCUO8gwtUav1hbdRgQPo2PeKwHaz0BcSkFO40ZHpxxBMmyf//bHeS?=
 =?us-ascii?Q?FJu/eF7vdYeqw4zt/C7924rVgq0i0N8+rUs00bcN1ep7wTE4eNO8fzQ2aCf0?=
 =?us-ascii?Q?7UaFcYZHRZAqabc5QhiHPOVHi1ENRdf7avwfurNoiOf1dKp8Yy6hyuqYpPgG?=
 =?us-ascii?Q?FGK6KDfjnfLO748b+d0Lc64LoFQKMq5iCOH4YNh6yBaJphAfI+tamdwI/ytV?=
 =?us-ascii?Q?9em8ye4fbjCn3GPEPDz9TBf5s6NjdYrHfTapIcpn7X3NuKlz9ARSoBnXJqgj?=
 =?us-ascii?Q?UmqV7MbutXLDkm+j6wt/YdxHyadGgUOR145X6G0zUbdqdoxDxK8guss3TpBc?=
 =?us-ascii?Q?Qi0BGd55MmOvN8AtKWMYcxbKuOK3z26/yRTTyNJybHufzsw93IKTTQ0NEwqv?=
 =?us-ascii?Q?uCP6YZAi3fK0MnPYMui8XU3nTwObKaJP2QqZjDKSXRNRbWAp8ABWt925ryqA?=
 =?us-ascii?Q?3fAxtMVj9T+mMwG3uQvnLcdIxwNIjQnxv+Umz52mMwFjfQfScmJqguuOWlT4?=
 =?us-ascii?Q?RR7FPQO+KK+Q5Z53TElm5D3ikOXIVQd7xVupCHJs8UzHbf/aRXs0VY+E5f60?=
 =?us-ascii?Q?Ky6Y9z+JtoSVVOIqHWKPQA6DVMc3knUvohmSljojVKE2zkllcFLNmPmbnrsN?=
 =?us-ascii?Q?diTjPSkiS4QHLMvEN5+Voj42R4mZS2knzfGu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JclK/nYFYTSkC584SC4J2DQLKCLVlkU7aZgxGnHKNT/KmU7mQi1uj6By/dBy?=
 =?us-ascii?Q?W7GYrn27PnN3sNbcmDzWtmyMJDrwTQDATgCUsZLAUWM0/UCQ36y2JJR9n24p?=
 =?us-ascii?Q?qz1e3V+CAaT7uOd6wopo1aL1wyB2F8Ma5KJ9OgDnrORmbGjoCiYclR5hybjR?=
 =?us-ascii?Q?c8Wd6t9heLqhqVRYqEsNUmjI1Dme78/zbvocx6y7PmUURANinf5G0x3mwh97?=
 =?us-ascii?Q?Obd4k8NDOoXG7hpw0m/xpYjLZdRW3KZahtfJdz6U7aTM+5+0MK1zGcoOlBhQ?=
 =?us-ascii?Q?eI9s3L0SwiwX7a60EYmc1cNKJ2eavYlNFGvclsvVHxur83dLqjUdAZ6LSJm2?=
 =?us-ascii?Q?4QWLFiVfEGGhaQf4cZKisTv4EkOFGtqIgEBwfOMTYTLnKg6HQImNsCYhY0qE?=
 =?us-ascii?Q?ALdH7SntoxbFeO1zzMqSp6nb+/6HoZ2icSBA93PHezhs4l0kp/n+rczKbliZ?=
 =?us-ascii?Q?HUzC1E8G84Jl+6fwnboimH+ftZ2Mo+7AFP6xR3MCc+IoOEeI4R0kh3zCjAP8?=
 =?us-ascii?Q?27YaFMDLwvm4T5tfcF1L5naaCpVef2MbzKjdOveJDlV/zIkEuz61yTR+M18z?=
 =?us-ascii?Q?aGfkQ7LadhnGbnIwD0OSo5BIfhAfnu7Sl+GZgEp3jCX73d7qw/Wwft1QDoWF?=
 =?us-ascii?Q?ouJXymhShTF5LYECuaPxaocs9xWn1lYe9o/Y/crlCrwyEUWE3aqYyCR+8zD6?=
 =?us-ascii?Q?K2yGvXjYnru48Cnz9yzOFi4QgHuzgfwNrPC60qCxFd2tt8Iu2RwrsLNNUHvT?=
 =?us-ascii?Q?Hb24VjK+rrKsJMrBHUKr2mM1W6Tin/+YTIvVzwoVMr2n6dV8uDe+v/orc21q?=
 =?us-ascii?Q?pVuqVnHrB9Kq1ez9cQiQUVtzI7B4gugPMIWGblJZsZmbHr21CDxyt/APlhzn?=
 =?us-ascii?Q?STQNQwDBCgxkae4GamKYREv7anuDvUTQDv7fOEBY1jPcp3fg2Y32d4Rmy5ug?=
 =?us-ascii?Q?7p8KGsXDC5OKAaFSl0TmuED4YNqNHqxKCQ46/rO53CiXECrxNqED71YSsSg8?=
 =?us-ascii?Q?sWoFKiLiGhPvHHlClCxTtWot33hCICbmV9NB+rJ8ehe6/EA5TQHTLUL9wamg?=
 =?us-ascii?Q?Ev8pZT79cncFAhYiTPRlzIfJJ3ZYIwLICw3xKWXzarbeUQsHNbCOHApQBpG3?=
 =?us-ascii?Q?nR9UEubXc7CkFfWbvsoY9oFt9p3wo6cr11zLPIzh6ya7x5dQH+RrQ39B/8ES?=
 =?us-ascii?Q?4UvtvZsgZpcJFqMj0JQ0lyg13Ljqaik81KC6atUSuki28g8PWh5nhVWY/8l7?=
 =?us-ascii?Q?btJ8kSgktYGZRVPQJx7KZfd0wp539QJO7A41OA0cm2SxlOoGqY/n4RtxKqja?=
 =?us-ascii?Q?0T7yjb6xANMxEmEU5Rfm4JIfnLARw50QnSMkDVznbMvlKX5lv6HnomfrSNRm?=
 =?us-ascii?Q?4AZ4Wk+FTEmnhftQIAQ6Nn1p6DToq4+vvgbGgiNWKQfeoGo1De28EgfDzy6E?=
 =?us-ascii?Q?t9qjv9GEJetSVpc1VVgonLDkbGCkxdsaahkwbs7F6XhA/KfF0VHJUhaiiYUh?=
 =?us-ascii?Q?+i4mB5Sa+snYtgOjRyX0cShkecJh25iMEs23PrAkc3FmjMXbgfaWxJ4TP3Pp?=
 =?us-ascii?Q?+sGJVlt94Iawsj7Zn3Rdf7wP1GaIU9JR0XKZusvC98xFmTSJUzD8H8qIAhiT?=
 =?us-ascii?Q?pNkhVgaXbyagMdiJ08g52/jS6ia+okixqZwA7xdcsiEyEp8yEJgt8XOomMwS?=
 =?us-ascii?Q?stBPLnhDxh0WAKiBDrUt4wKvFiR5iQnYghSMfG+zjNdYeY1HfRvwUumW/0Kd?=
 =?us-ascii?Q?8iFwTYD9jg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99442a5c-3a9a-490b-03e2-08de4f30268c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 03:35:35.6574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WDMiFOIjfVMtI8/RScFetzX738ATLqTcCdXQlWBxdCZwseEFpHlNKD9vvMyXSCG8anH26jntOvoYNUONsVbqOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

> Subject: [PATCH i-g-t v5 4/6] tests/kms_writeback: Refactor format handli=
ng
> in commit_and_dump_fb
>=20
> Modify commit_and_dump_fb to select supported formats if provided; Apply
> default format based on the platform when none are specified.
>=20
> v4: Add get format function to assign format
>     based on vendor type as a default format.
> v5: Change function name more descriptive
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 38 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> defe43686..be123adcc 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -101,6 +101,13 @@ const uint32_t fourcc[] =3D {
>  	DRM_FORMAT_XBGR2101010,
>  };
>=20
> +static uint32_t get_default_format_by_vendor(igt_display_t *display) {

Wait for my reply before you revise a series I may suggest something else. =
This
Helps avoid many series revision

Anyways the function name should just be get_default_fb_format no need for =
vendor

With that fixed LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>


> +	if (is_intel_device(display->drm_fd))
> +		return DRM_FORMAT_XBGR8888;
> +	return DRM_FORMAT_XRGB8888;
> +}
> +
>  static bool check_writeback_config(igt_display_t *display, igt_output_t
> *output,
>  				    drmModeModeInfo override_mode)
>  {
> @@ -447,7 +454,7 @@ static void do_single_commit(igt_output_t *output,
> igt_plane_t *plane, igt_fb_t  }
>=20
>  static void commit_and_dump_fb(igt_display_t *display, igt_output_t
> *output, igt_plane_t *plane,
> -			        igt_fb_t *input_fb, drmModeModeInfo *mode)
> +				igt_fb_t *input_fb, drmModeModeInfo
> *mode)
>  {
>  	cairo_surface_t *fb_surface_out;
>  	char filepath_out[PATH_MAX];
> @@ -456,12 +463,37 @@ static void commit_and_dump_fb(igt_display_t
> *display, igt_output_t *output, igt
>  	char *file_name;
>  	unsigned int fb_id;
>  	igt_fb_t output_fb;
> +	uint32_t format;
>=20
>  	path_name =3D getenv("IGT_FRAME_DUMP_PATH");
>  	file_name =3D getenv("FRAME_PNG_FILE_NAME");
>=20
> +	if (!data.wb_fmt) {
> +		format =3D get_default_format_by_vendor(display);
> +	} else {
> +		drmModePropertyBlobRes *formats_blob;
> +
> +		formats_blob =3D igt_get_writeback_formats_blob(output);
> +		igt_assert_f(formats_blob, "No writeback pixel formats\n");
> +		igt_assert(!(formats_blob->length % 4));
> +		for (int i =3D 0; i < formats_blob->length; i++) {
> +			format =3D ((uint32_t *)formats_blob->data)[i];
> +			// Skip zero or unknown formats
> +			if (format =3D=3D 0 || strcmp(igt_format_str(format),
> "invalid") =3D=3D 0) {
> +				format =3D 0;
> +				continue;
> +			}
> +			igt_debug("Supported writeback format: %s\n",
> igt_format_str(format));
> +			if (format =3D=3D data.format)
> +				break;
> +			format =3D 0;
> +		}
> +		drmModeFreePropertyBlob(formats_blob);
> +	}
> +	igt_assert_f(format, "Given format not supported\n");
> +
>  	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay, mode-
> >vdisplay,
> -			      data.wb_fmt ? data.format :
> DRM_FORMAT_XRGB8888,
> +			      format,
>  			      igt_fb_mod_to_tiling(0), &output_fb);
>  	igt_require(fb_id > 0);
>=20
> @@ -584,7 +616,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>=20
>  		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
>  				      mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      get_default_format_by_vendor(&display),
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &input_fb);
>  		igt_assert(fb_id >=3D 0);
> --
> 2.43.0

