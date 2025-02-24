Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B60C021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 13:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E435D10E29F;
	Mon, 24 Feb 2025 13:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADDO7/Qq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E4210E29F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 13:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740404201; x=1771940201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6bbcjbuSkYD+/IQXFEpx+29d1zpeT979PufY0S/iwU8=;
 b=ADDO7/QqXMtYGjVY2SpXd34aPZOo1fNVdFVkcw+9vnZXZNBvZ+Y6hVsz
 KidRY5QMKNUOS6Ev86g4aWTFGBswFaCEucu+cel3gUkney3ELHmyM3ulJ
 i5Tamotl9xHRRuDVgNF8VIcDc8E91V3wcokOvoPdZUI/akMknRDPuWotp
 NRQVt+otEHOsUGX1E92JxcV6N/1bqkOlvXEc9UqUe6TQWlIWTJIxIWzun
 zwZEpGKD814nbzorDE7ydMMPYFLEUVkdfYvt29gbSM+59gI6CF/8dx3u6
 jC8V90xnG/IJ6r4vbXHzD9YkAYt9NX9fpoKZvZ8LDxNjWjIf/I/ZfWm5r g==;
X-CSE-ConnectionGUID: cKX913rsTLmUNFdMyJixnQ==
X-CSE-MsgGUID: iZK/UovMTCaKoLFFOgHRkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44808886"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="44808886"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:36:40 -0800
X-CSE-ConnectionGUID: 5CVA2TD7QviSlDfK8KODLQ==
X-CSE-MsgGUID: IVRURn9YTgSS8EAdTMF8vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="116083367"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:36:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 05:36:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 05:36:39 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 05:36:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sp9DaAmsP1U89el0OS7eCunhZUZNNN32jwazI6/SBBZvRHJJ6NswQZ18MCoOLbB8oIPGXogL70SzD9woTQKMhTTj0MfacZ2TzS5QVZ5QWWa7j3tVPlTe98Qm81/F4Cnd75V0Qv9TVIiY7bnhG8xzysHWHted5mv0WnxBKivMueF+aUCv7d1OXyFj6g838NoiqNRcNJ8ladPgBQZH5yJYNjCL89c1JBVHdiJV42hqgvoFuZz0eopANwLUBvMDvJOZb2TmxnrO3WCPSpxiLGEWWsDDK9pTmJIUx7t9WStmIZeZ3ygUsjx6DU1mKUrTPowSncGgZpePLa0Vhpc1UNPhrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/Bv90Qh63O/2imSBPaf7QZq3I5EnatukZzMKWZJ8xc=;
 b=utwOGkqKyNprgTYBUf0YBJfvcdJKv+IDsECiVGhCB14/+K8Yasgu3c5TXHWmxQ3fCFMdF20u3ZB7IcfODDvsV+cpMzj3ru/xnz92J2ImT1+isq2Iih4aoH8JOSM8OwQ9tOVhaEfR4AswuakgfoYzdhe+/Blm+2ADrN1Yp/7nZv8lq0bGSqNpVfqSLuFzKKtYa87MImseyAAnXQSlTG7p3q68L0nUEyVidMboq1e1hmc0m6I483YLQ7z+1Nfci3HgjKoX4p4dXJdvMKh2AFFP6MQSvoANbXkkym1Y3e0XEX46gUhtDHDMf4OuxDC0AD+QLWVAJKUAziss85drAdVn3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 13:36:33 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 13:36:33 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] tests/kms_async_flips: use in_formats_async
 for async modifiers
Thread-Topic: [PATCH i-g-t v2 2/2] tests/kms_async_flips: use in_formats_async
 for async modifiers
Thread-Index: AQHbhCX1QcbeU79HpUWmx2rWQ+iDPrNWdrBA
Date: Mon, 24 Feb 2025 13:36:33 +0000
Message-ID: <SJ1PR11MB61296F94562CBD1EB746C31CB9C02@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250221055647.2014355-1-santhosh.reddy.guddati@intel.com>
 <20250221055647.2014355-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250221055647.2014355-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA1PR11MB7812:EE_
x-ms-office365-filtering-correlation-id: 439f9f5b-16e1-4409-8c91-08dd54d840b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?F+ekj6uHDw88ezJVBj4CbGmk7JyWTfOs5523PWSZXgTR06ESeVV48iqkS4Qs?=
 =?us-ascii?Q?gYFN8Dh9lViiK+JTKWegRl4bH0nEJaqsaaOOh2Z/CRYtBAFEaWd4J7UmYXbq?=
 =?us-ascii?Q?QDNhrToY+o9o7QLDo2vjYoFy3arHN05zlXpqAdiMj36MEiCrXvfBxPffwPBd?=
 =?us-ascii?Q?124AwDbIZAjSYPa29kMrnmH9nCkObVp/ghWUKuz6tLA8yvQdiM2pRgoal2vq?=
 =?us-ascii?Q?94AI8TzBoFK8MPhQbyRdmyo0IQncwk6E9FV07aBqTDOdtVOe+NVM7wPPRH2c?=
 =?us-ascii?Q?vsnsyTcZG9B13fLWzbdYeA+U0f0lSKsSeGRVZzA+ofOZ/v7nSi0mnh3m6YbC?=
 =?us-ascii?Q?/EZKRyenvSa6K+zJgX8TOhK4SBBw1JNqUieHaPeY4Rx14Fzz9i46DPVhidzn?=
 =?us-ascii?Q?NXTkIZwm7xS1/ana1YR1D7lL5A3du2s12BrxuEJI3ZnFhrLSMrWY14Xzy6MD?=
 =?us-ascii?Q?PYs+kEDOjtJwFk37dIMtpheooTinjsYzWj9MnoRug2hH+nKxfCrhr/ELjPoQ?=
 =?us-ascii?Q?oB2pji1i1rKRwf0FrOQj3StXNfLo1SFv3BelnX6hhGzYHJMd6dDYaQE/RHOO?=
 =?us-ascii?Q?NwI56tKXVAdfcP0UPXJfj37Vu01tgOzR6PeVhWUwvR+KNfgbWG9sKiS1YFAx?=
 =?us-ascii?Q?UXDYD5wiYXJ3tq7lUKGTBZ2sXfc3abpmmv2mYBQV5X7r7JKIFs5qun1g/o5n?=
 =?us-ascii?Q?7dZT7+Bzk/3j89Y1FAbJwAeLmSVse3xjL7YyvD11qMa4zkAbz0zaCELyQ6HP?=
 =?us-ascii?Q?zHNGOQufDeYx7D33sIbowNgx/lYjXLZrLdDfFrkHjMQi1SCk4BnlgTn0RNnf?=
 =?us-ascii?Q?HgC3I2sJiiHWEqtcNFLx5IPuoA0HPdVWGpZiXM9o/gMSK3Vu4xNxzQScpccT?=
 =?us-ascii?Q?tnvzyYMu1Krj8ntR4JqQeOt1AS/cZTy6Nmd8geI/1EeyoBXlb1hScSCTzqN1?=
 =?us-ascii?Q?BThJNjyW90ysx1JUGbObl9st1HiURiGmSHhqx7vIE/GehTiR6fijm1FDSGAq?=
 =?us-ascii?Q?dPiTcImsQlBciIkyPLwSMcG4i/diHm3A10TWg42G7ll5KdI2xIYTyD0tlqrv?=
 =?us-ascii?Q?bFVYEo3n/THg604ZXvkl8xcBDXNnwUmzMK/MA2lR0GUIVGml7yk2+4/Mkw2D?=
 =?us-ascii?Q?YBx/Pip0ReYCCcZJHsPlAe6oBb4igabM52tsrnFX81JEHSUnWkagG4TudWx8?=
 =?us-ascii?Q?feEuPZFNC01aU1tAhdAprDbAEOpbBl8g+W2h0ICvm9BkPgKZ3z/ObBeGbi9b?=
 =?us-ascii?Q?hbR9mv0wenhvo2tL5kL3ytVWxNQ6jZX8ArKmw6pmm7PHHcW53luacmj584tH?=
 =?us-ascii?Q?7k6xgvZ/mrOA/987B/lz1as8/AjVlDHTgCg0+MFDEDwfLs+LEbN8vj9HwU33?=
 =?us-ascii?Q?m2zZ+acxScHum2yXtwXtrvFjVR+SWy8e311Gy1RQaDrthHWwzcZi+QA/SdR5?=
 =?us-ascii?Q?HItMz4EVWXWPxnkx1Jc3LMl69llf0tTx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?awAsuboh3PFyQ1t91VmG1Esimdc5PXszAj4WO64qwA0dnENC+FWdEuwNn0xG?=
 =?us-ascii?Q?2Yjt8hfbJ1YMQZ1gTNRnP+cAR+S3nJb4m5RVv1xx4zGDgqgC7LVqohHR1Mih?=
 =?us-ascii?Q?7o6iQ0NFKTpGyQtujvtxE1xRz5/ED3z93RCcDqtO4AJciH4Z0m4F3DzyNWtx?=
 =?us-ascii?Q?PF+jgHpg1Pj4yQMFy/vyBFSSOb5emgB3d5+jACEgwW5Yi50OVggM4GN91Ja/?=
 =?us-ascii?Q?4yYtfitF92Ytayb+5Q6qV+iJkr+fKIGiY7D2TWEMImihdaFgz9pInS8J4BEO?=
 =?us-ascii?Q?iJ3DdtRRIbwkKrMCNqqv+GvzdE8khkQNmLpTaq7t8zuMaIkvSB8ABBy0jCn7?=
 =?us-ascii?Q?Cl7SkvXKg7w8IpWAhFOuIIrVSsxqYSm5C9rIYz6xCYD1XAs6OAi42t1XwSc7?=
 =?us-ascii?Q?yorT8nx+wXVJ0xgf8zTOAgNg6JXbMnkyEBlOla+MnLS9lxsS+h7hk1a9PjlP?=
 =?us-ascii?Q?Dj5P5XN+lLn8FswzOJ3ySoAazqiDzObO7NOhszC0J9LutS1/BHxjUmKgGAoK?=
 =?us-ascii?Q?8PkeBAcs2PTkLVaOBh837JeMWKtFsLwh8Qngv4fHjPurLDflOMOT+DbG7xz+?=
 =?us-ascii?Q?E1vSi/JlIblgFrALJJqYHIsHMoLQJo0D+4vpmfKZeGQijQZLbJQXhx3Q97qP?=
 =?us-ascii?Q?7PPmM7YmU2+gv0VHaSQBuG+MxXqbdB/lw7yv/pOOHhHcTs5zS+rU+G0cUCPI?=
 =?us-ascii?Q?DK8XpoaGHB9n+PafY5sgC0qA1fRb9RGM9X5Zb0fEL8J0hGQYTOFtSaVxwuQS?=
 =?us-ascii?Q?6lLRMV7X2DbiRh2IpJPIAtMFDBIf7SS+lgg1S6dZvFTgPZO8CkHsFsrWpfc1?=
 =?us-ascii?Q?Ef0BA2G07KjKrNhoTiVc2iFynvkjkRA49ngp6g3N1dAPNcHdEGof+Nq83sv0?=
 =?us-ascii?Q?z626Y9ZU5X41ckFJxWdu/9NN9IgspRDqk6/NzHpyjfUp0WcWr5QBR9pTs4Eq?=
 =?us-ascii?Q?yq5cgNxesYuYXh7FhVsd+odBY1+VdIpxijzNxqp7+WfiEKl7rTyXTEWO4eOl?=
 =?us-ascii?Q?hNdSuhh/eKJo1YiVxU47tI1VT2wLueCi0nhQreVBRd2uezjd3wB54Hq028EU?=
 =?us-ascii?Q?xbQdE9eT6k305Y3X//vmkbzNrt1xyE8IyKDxqjbtFUvaj38oIXPheOYlyMM+?=
 =?us-ascii?Q?dxAVtsRqyYU4yr3UPAHEm1ZEjo3Ch2QxgG/khMwOy14pnRADDVlPZyHYABE7?=
 =?us-ascii?Q?mdSC55hJ2E6c4hRvwfxxEAaK6bNyCgK6Mtz1uCy9Lyv9VqOf87zCZMpLOuXz?=
 =?us-ascii?Q?RTiaXPWheAHIjnuJmP8LpsavdKfo+0CaRb4RlnxQW5BvARlvph7WOqJbgXYm?=
 =?us-ascii?Q?AzVxQBhCnVtwTSMiit+4e9hWwT8OjHkM+8IbHvob5v5mPlFQhVvRysBp6qnz?=
 =?us-ascii?Q?mnV3qgBhsPHaDfe/zOkDNIUuEbwn5u0W7xQfI2wBMaB3LTtHFwgVwbFHl49o?=
 =?us-ascii?Q?0z889PWNFJ53eDmjRyW6r6SwHK0ch+GJkfXAVhy28dJ6NUxMtBXYlbTyHAoH?=
 =?us-ascii?Q?pIf3gXyA33LIZfr4F9W36mcGOnBWaP7ECp7WE5PyLxQDWxM+PumEmA0wvFsE?=
 =?us-ascii?Q?7C1ArEBKAM4LuVTz+OuxBdpCwmAzR1eR/HXk7RTLGIVJ+cmCp6E0YiHAxhqD?=
 =?us-ascii?Q?Ww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439f9f5b-16e1-4409-8c91-08dd54d840b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 13:36:33.1728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nXrY5E6cvDXxc3J0+fpjKamIcMl8SyfBmH9Gm7jsbQg8YS73oOWwX1rLJG3XZUgApfNSdHVlA/q2wmaSMGjRbE9N+Xw9gqJ4SXEfXh3RC68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Friday, February 21, 2025 11:27 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v2 2/2] tests/kms_async_flips: use in_formats_async=
 for
> async modifiers
>=20
> Add support for dynamic plane and modifiers in async flip with modifiers
>=20

The commit message is not that clear

> V2: Improve run_test_with_modifiers to set data formats based on async
>     formats.
>     Update make_fb to use data formats instead of hard coded format
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> 4a72be7b5..38fc2ced4 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -126,6 +126,7 @@ typedef struct {
>  	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
> +	unsigned int plane_format;
>  } data_t;
>=20
>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv=
_sec,
> @@ -197,7 +198,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
>=20
>  	rec_width =3D width / (NUM_FBS * 2);
>=20
> -	igt_create_color_fb(data->drm_fd, width, height,
> DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
>  			    data->modifier, 0.0, 0.0, 0.5, fb);
>=20
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, fb); @@ -718,17 +719,34 @@
> static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))=
  {
>  	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) {
>  		test_init(data);
> +		static int j;
>=20
> -		for (int i =3D 0; i < data->plane->format_mod_count; i++) {
> -			if (data->plane->formats[i] !=3D
> DRM_FORMAT_XRGB8888)
> +		for (int i =3D 0; i < data->plane->async_format_mod_count; i++) {
> +
> +			/* Check if the format is already tested */
> +			bool format_already_tested =3D false;
> +
> +			for ( ; j < i; j++) {
> +				if (data->plane->async_formats[j] =3D=3D data-
> >plane->async_formats[i] &&
> +				    data->plane->async_formats[j] !=3D data-
> >plane->async_modifiers[i]) {
> +					format_already_tested =3D true;
> +					j =3D i+1;
> +					break;
> +				}
> +			}
> +
> +			if (format_already_tested)

This logic looks unnecessarily complicated. What are we trying to achieve h=
ere? If a format is already tested with a modifier, don't use that format a=
gain?

If so, I don't quite understand the reasoning behind it. Why can't we just =
iterate over each format for every modifier? (which also increases our cove=
rage)

Regards

Chaitanya

>  				continue;
>=20
>  			data->allow_fail =3D true;
> -			data->modifier =3D data->plane->modifiers[i];
> +			data->modifier =3D data->plane->async_modifiers[i];
> +			data->plane_format =3D data->plane->async_formats[i];
> +
>=20
> -			igt_dynamic_f("pipe-%s-%s-%s",
> kmstest_pipe_name(data->pipe),
> +			igt_dynamic_f("pipe-%s-%s-%s-%s",
> kmstest_pipe_name(data->pipe),
>  				      data->output->name,
> -				      igt_fb_modifier_name(data->modifier)) {
> +				      igt_fb_modifier_name(data->modifier),
> +				      igt_format_str(data->plane_format)) {
>  				      /*
>  				       * FIXME: joiner+async flip is busted
> currently in KMD.
>  				       * Remove this check once the issues are
> fixed in KMD.
> @@ -761,6 +779,7 @@ igt_main
>=20
>  		if (is_intel_device(data.drm_fd))
>  			data.bops =3D buf_ops_create(data.drm_fd);
> +		data.plane_format =3D DRM_FORMAT_XRGB8888;
>  	}
>=20
>  	igt_describe("Verify the async flip functionality and the fps during
> async flips");
> --
> 2.25.1

