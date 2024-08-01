Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFABC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 11:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EAD10E91A;
	Thu,  1 Aug 2024 11:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T14SNONA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED1310E91A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722511395; x=1754047395;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4FlRYKSkj0BurgYkzrAVr75AmH3UhmHugRUIrPl2RcI=;
 b=T14SNONAb98jYS+h4mlxBAerfjroWYpD4/BNtKCIry9rQpLIYgyRMGH8
 AykQO4ap3bx2PHiZGMPHiX70SfaP2YlOIOAic74T9PSZC2K7tzvkynkEe
 uVZ4G++IYg0AJc0PHv+Dei98mLoy+En9BEec8vvYIADWlicG4EQtNplwY
 Kv3114VbqHzd22NlmZ7FJPv4rF879YYueY6ON683SzRmfC+R+9XAtd6Dw
 VJhmVg1Cz/xReRKBNnl0e3qNnkzIvsSJH+sAqWnqrBWf/hbryHloxKapA
 jdv8PH64DhfQPhvO+dyr+9/FHKHKhcBL01wv2vWhktDJY+u2j2MhV3yWu g==;
X-CSE-ConnectionGUID: 5PaffzBXRGm62SQyA+3MJQ==
X-CSE-MsgGUID: q6hv1Z0cQDK4kSiGB2zmWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20140829"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20140829"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:23:15 -0700
X-CSE-ConnectionGUID: cbQTUx9uSFyWhmblZI5dcQ==
X-CSE-MsgGUID: Pu9JhvqiQhWrtDu27JKIEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55088867"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 04:23:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 04:23:15 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 04:23:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 04:23:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 04:23:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnJ67gvMXWnb0CqSEiE/TZYQWdUzptmZkPj9TS6YTlxg+jdiSBa2rWgLi32MEmZtf1r9+b1LTiUgYXrTC1uHi4KtZKenRZkYem5ULJWituI0TJiycTBlIkKNyzk9ATt7cSrNzSGYtMQirE6JgKN7+NSDOtcKFMa0nPM38ktIRXZ2R7w07QE+ORU+YwqdLgPVD5rvUbyJ+tvnkleRfekayr6zFh0YTd0aADF6ByGxE49iXWRYKDEP4kb56n352CWzq4SdAmXD0IPalXO/fSXilG4yDqpCbe8iWAEGQdk4aAndlRl9vO/XBXX4A+5g0UKpJRJHep2S26nrqCuCoCVx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4ctpa3WDz0hODgP/uy/KS5cz/hIhOnjBAazYveoOCo=;
 b=y1TV9+XoVh6mHuU90mhc7rGgScdkz5u1xDl7j1RPNwkvxsep5gUeHUQC9NRO3aMPzEFOFKrn6D7NqBJJK5AJqKA86z8l0q8bJvCUepUPC4k33enUed/R2/1Eh0sL0NyGr/h6nLuAdNmTggtkrLUGZn8G8ewVdhDpiewc3rOW1iD+bRKSWsA4NgXPBIoY4s731WW3DmCVzbdFhxGwLpa6Vo0Dy/BP21WS3DCMRtGtE2OLI2mmcSXBimiedrEFqlczYehSCoOrPtn5SdyN/rzL20m6iFjOn6adVqzVwp/AQ/kRt/I4JDYX7YK8nJEp3gMukHUeu5aZM6GE9fXvX6jwTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.20; Thu, 1 Aug 2024 11:23:07 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 11:23:07 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 07/66] lib/xe_ioctl: Add wrapper with vm_bind_op
 extension parameter
Thread-Topic: [PATCH i-g-t v2 07/66] lib/xe_ioctl: Add wrapper with vm_bind_op
 extension parameter
Thread-Index: AQHa4nY8TKoCbK3p5Eqm6ZziQisfSLISRTPQ
Date: Thu, 1 Aug 2024 11:23:06 +0000
Message-ID: <DS0PR11MB72643719B3B43B55A391623AD9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-8-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-8-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DM4PR11MB8157:EE_
x-ms-office365-filtering-correlation-id: 77aaf301-7386-48d2-fc88-08dcb21c5121
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?vg8g1uddHCTOotSVHITYDEASDNbzJWseucKD3ZpDxdlCvO1rZ+HuD6EZ5Z?=
 =?iso-8859-2?Q?2CEWSeA8CrNPwx0uxihch7bSwEI8AvKav8bdkWOUtndOiV0D8SfqMN4Wh9?=
 =?iso-8859-2?Q?wVPsAoY9c/hnFWPLjYxkmGckIHTBfbS7jnIdOR9rx7Z183YIonfx7n3MwW?=
 =?iso-8859-2?Q?vynyFu/nlSsA4U63OaG5pcLCZPozDYm/srSjM0mV+Q62H56XfYgwOH2l2m?=
 =?iso-8859-2?Q?oi0iB3BJEd5QfgovzQU1Oq+MwDIkmJOk3WUFNyubgRHuBoNSjVL63j+Uws?=
 =?iso-8859-2?Q?oooh1ZJufaqyJ+Rp+5YPz9D5STRrdztfPAuQNaDtq7M9htKkQRB32ehDW1?=
 =?iso-8859-2?Q?ZhV0Okhkbb7KGE/ek9i6/KlA/lvGL3JfA8HgEOV7XAhd6Pr0APVzoMFlX/?=
 =?iso-8859-2?Q?Zv+4UiprAtV4bzBnHaxRYEhHz0aAIFF9aQ0hDvZETwAEOHa0mT+vWaGS5t?=
 =?iso-8859-2?Q?SzP2C1HlO6YgK5s89uhCHNJbno9zHU1Lp2z1bzzI3ieq8T2yptdLUdUsiF?=
 =?iso-8859-2?Q?rCwYiwyrC906UPRchgwvYxe9TDRETimq0TaWsHLrHnWCtXve9vVKS7YY48?=
 =?iso-8859-2?Q?DaVM/T85vTVJ6Nbnos8oXU0c7O66aL9SmmrdqFo7ASIJ7jAqS6RKhCiig7?=
 =?iso-8859-2?Q?1inrOCW+kYgxLndIHlLYkhpk3wxdmEvpLjTw59RHhqwEDuvZfolgof0TE5?=
 =?iso-8859-2?Q?+YOswmXwVjhVM2Jm2H0IBuX3GdtXDVPzrL1K3V8SF0c7x5yKonsx36o+LQ?=
 =?iso-8859-2?Q?Z/wWqLQ/8KQDe1WThkaJhJ1vrglKxMwBdwQFzDqGbjsVuf2Gw7XfYCGrMz?=
 =?iso-8859-2?Q?sL6MAsFU5yBBH2ORWMqaIjIF+i+4KpbLQWMhydPLf8HDoPflV9/tLyO9IN?=
 =?iso-8859-2?Q?E0i5xjEaIpc4477NLcWqFCkfoFvxyrrGB+/KEVkQN5H4N4etkmgBqhhPeN?=
 =?iso-8859-2?Q?+wiZ+PtoKXVFwpCAPtBq5kTBl87QyrbuiGV+M7WLBVSOjJeVtyDCkOGnC2?=
 =?iso-8859-2?Q?TnpyuUTgLI/ssvZNymItUZhpZYcUpTXgwdpP5oZpz3SPY7WM+6rWghJ7hG?=
 =?iso-8859-2?Q?D18UhyaLCzJZ5lQHCFmDafSrboJrNfe75LNjmuSj2KMYmW7scbe5Le8gXd?=
 =?iso-8859-2?Q?g0H8XIhzm2rwo1tVwqJ2y09emxywnv4KofePiv/9mZU+rciB5G2YBYiVit?=
 =?iso-8859-2?Q?7xTwltSGmSMApFdSa4t4o52PIbDnClgakaL9WfxJ8XATenTfkdwFjqqRyh?=
 =?iso-8859-2?Q?ukf51P8qIukA6H/zPiEFkyf9RCm6c1Au+PFDCxr8TzKGWILRggGU9V0cX1?=
 =?iso-8859-2?Q?a56S0RU9P2/P0Gd6NYzzUsC8xnXEbZrf5IUPbWrzATeU2qCyBwmBr+igOk?=
 =?iso-8859-2?Q?2soPCW8SafL7NaUItnpZErovvd+kq2lx1zoBnX3ZyeE/vgstwkZtoUtY01?=
 =?iso-8859-2?Q?8IJETyQ/G7d20XClg0QEhN7vlm5n8oC26oT9gw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?j4THLp8J3LeveRf9fivDgOS+5fWb9uFRYjSOjsG560vbwiROUF6pzf8miH?=
 =?iso-8859-2?Q?anpPcR1yFcmTDgMuMgOqEBB+VvmAWxCFMaZrErlugLNGj7d+GXPbl6kSPK?=
 =?iso-8859-2?Q?VUum4XuhJsfF1qZ45twW441tFdSzQUDnOQK6jL1VkMl/o4iUoHei8ziZ1d?=
 =?iso-8859-2?Q?OIevlyopr8lXBnLKsKrIZcuBbXK/ShSRZiS+hkcF8AuaaeT41W74xTUaIV?=
 =?iso-8859-2?Q?Dh9xd1qIJMqMHbm6WM/a0GRGwZXsb+D6s1umu2m93iSU2eG4k6mPryHq7D?=
 =?iso-8859-2?Q?vfsNPSAneKJFZNaOj5Q22S6boAhWIWpMh0Qa8tpbmRF3Nz4XYuhdsqufBf?=
 =?iso-8859-2?Q?asNdDGajYfneJlU+s/I2z2B7M0QeAkKXyIitQsXkw757gVcIjAgIvBep3V?=
 =?iso-8859-2?Q?tWQ2gQxvhV5dMLAQVrDWJ/4Utp9Q+DjN1IWNC1uVxF41S76M45F7n7ySTS?=
 =?iso-8859-2?Q?44vmPqniDGruMTPehUs3jeDv8Ethq3Vqkit418KyvW7AWj3s861XMPXeKs?=
 =?iso-8859-2?Q?oxTujeNzLAgb8nUzu2CRE23QwSA2PE6mWH4U8u016kZ6ANJibSNYboBER6?=
 =?iso-8859-2?Q?33xePsG6DmOrrGfpq+V7YIP9AB/qAz1MBds0pIS9D0EFeo3LGYjj3vTaAf?=
 =?iso-8859-2?Q?eGsG+2ObFluWEnpt0g0raYFP2W4s8QFoHRBQiP85OvEtYHHjlJaRl8VPQ9?=
 =?iso-8859-2?Q?BL63GJ07byG/kxQCPAoVeFlGrsncNHzl+bXLDHTukQn4FXq7djD64Bd6mi?=
 =?iso-8859-2?Q?KMeEpYSvSJQyYpy7TvghVgdkv/gAr+uGcdRdBivPimzF4U+52b5jKO8z6u?=
 =?iso-8859-2?Q?zlqRXgisnqX75S5QcbAV4ozStTrpj2VEiWUCTs/pqsyL7pywZNNu0iFk85?=
 =?iso-8859-2?Q?HkEe6hCnLlR0jj3hXaLiUq2hauEPa5Jb49wmXM/kPTq+2kre/HfIWPippy?=
 =?iso-8859-2?Q?LNl+KDloI/V56ee+IGVwEogHIXvdXAJ1mMfVYmxbX7AMS2aNr2yLVQd6Us?=
 =?iso-8859-2?Q?bQjBZXEKCCNGDAAuQCWu46V9Yutfe9wzEoVzlmV79aUkjcXFkaXwihc4LX?=
 =?iso-8859-2?Q?L+hOrH4UuvUULP5dwu1Sk9NmfCcufT4Xvy7KKLIFOhFe/nkoHdQkbox7Hu?=
 =?iso-8859-2?Q?FCupDkOk5QyajY7UxsUK73bYkiIcCZmJSGkzCcFQmnxjl+gjscjoorIlVH?=
 =?iso-8859-2?Q?n0bSuYzdJIGKrpO6n8nRWwvEJfGykxDZSB6/SlP59lDra/IrcTbBQBT5Gu?=
 =?iso-8859-2?Q?E48f0hp8l3XhIkn0Qk8biAAUj0w+0HjtGD/e+fNUhWza+NwLNJ1gHllkug?=
 =?iso-8859-2?Q?SwrE2Y7A5PgXKX/ndMViP+IHOz7MQH8xY7LMTl4Ib03xMbD/Si8BXJrgKb?=
 =?iso-8859-2?Q?54wA8/9Yeu/FfOGGlbP1G5zq5ZBV9oViSGvfhHgswj/+UQrDCeUrYysIi0?=
 =?iso-8859-2?Q?eBtgB+P/iLhJSdG7SO/evR+bSoO1FI66jFTd4Dvf62KU7dkcCRNDaEdmr/?=
 =?iso-8859-2?Q?FDY9RS15Lrbm8EFtc8D45Lt5qjweLDgL5A47ZdPbYd6PpJE+kR3l6Gk4/r?=
 =?iso-8859-2?Q?BvIc1+VOF79xesRaz7s0IrxB2jo2wJJxkC/JdJa8Ic6C0K+Tad7khnF60X?=
 =?iso-8859-2?Q?ZM1+fozVtTs5EOwuqooCv7R6s0JLERyhRx7vMlbzAjcjCQI4BV0hMK4A?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77aaf301-7386-48d2-fc88-08dcb21c5121
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 11:23:06.9725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tN6MwXDS6YBVe/JmntHJIOMgUMhuExSU/JT7MDzADBZE+ph4zGypVqHL9wrIX5qG5BBEaXqVdZClvGjuIGekJX76HS9SHA/s4iJ1HyKqeKjs2TARK5M3qk9bweJVc5Ld
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:44 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 07/66] lib/xe_ioctl: Add wrapper with vm_bind_op
> extension parameter
>=20
> Currently there is no way to set drm_xe_vm_bind_op extension field. Add
> vm_bind wrapper that allows pass this field as a parameter.
>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 20 ++++++++++++++++----  lib/xe/xe_ioctl.h |  5 ++++=
+
>  2 files changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index ae43ffd15..6d838=
8918
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -96,15 +96,17 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t
> exec_queue,
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);  }
>=20
> -int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> -		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> -		  uint32_t flags, struct drm_xe_sync *sync, uint32_t
> num_syncs,
> -		  uint32_t prefetch_region, uint8_t pat_index, uint64_t ext)
> +int  ___xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo=
,
> +		   uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> +		   uint32_t flags, struct drm_xe_sync *sync, uint32_t
> num_syncs,
> +		   uint32_t prefetch_region, uint8_t pat_index, uint64_t ext,
> +		   uint64_t op_ext)
>  {
>  	struct drm_xe_vm_bind bind =3D {
>  		.extensions =3D ext,
>  		.vm_id =3D vm,
>  		.num_binds =3D 1,
> +		.bind.extensions =3D op_ext,
>  		.bind.obj =3D bo,
>  		.bind.obj_offset =3D offset,
>  		.bind.range =3D size,
> @@ -125,6 +127,16 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t
> exec_queue, uint32_t bo,
>  	return 0;
>  }
>=20
> +int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> +		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> +		  uint32_t flags, struct drm_xe_sync *sync, uint32_t
> num_syncs,
> +		  uint32_t prefetch_region, uint8_t pat_index, uint64_t ext) {
> +	return ___xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size, op,
> +			     flags, sync, num_syncs, prefetch_region,
> +			     pat_index, ext, 0);
> +}
> +
>  void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue,
> uint32_t bo,
>  			  uint64_t offset, uint64_t addr, uint64_t size,
>  			  uint32_t op, uint32_t flags, struct drm_xe_sync
> *sync, diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index
> b27c0053f..18cc2b72b 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -20,6 +20,11 @@
>  uint32_t xe_cs_prefetch_size(int fd);
>  uint64_t xe_bb_size(int fd, uint64_t reqsize);  uint32_t xe_vm_create(in=
t fd,
> uint32_t flags, uint64_t ext);
> +int  ___xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo=
,
> +		   uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> +		   uint32_t flags, struct drm_xe_sync *sync, uint32_t
> num_syncs,
> +		   uint32_t prefetch_region, uint8_t pat_index, uint64_t ext,
> +		   uint64_t op_ext);
>  int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
>  		  uint32_t flags, struct drm_xe_sync *sync, uint32_t
> num_syncs,
> --
> 2.34.1

