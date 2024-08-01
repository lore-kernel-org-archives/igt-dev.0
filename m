Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCA1C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 11:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE9E10E919;
	Thu,  1 Aug 2024 11:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPzTpM7n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7DD10E919
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 11:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722511254; x=1754047254;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R2FxEKzXVkvC9toEYOncvcyhClWPAZ8496CsGtnwm4w=;
 b=TPzTpM7nac/1WyQ9YuHVIJkn8JK5cr4ojFwBmi2PfOFyD7ntw+LMGpa9
 28KS2Ty1wc1g1YiiM7dZnwIJmuLuaBlb18KhQHRtF1cnwTxTTt2LNhTpo
 KlOrU+tPW7iRvP/vTmJGozE8PGq7W90+NNcfd31Q2k8VOT/2TS7QSchvK
 CI8sFS5+I4eTFEbsv0yX74F+4O1WsjC3REYA2nhrVTBxAaNV6jfLeR34i
 NKJqfz7F07cuQOXzY9OtJBYhmbATUWfP13n/QpESkuKZK5cJwFaGiorKM
 rwYSdZVcgCJOlqW6D3AjCYTAxgXomIOq4v4GmxrvxXbPMqYB+5vJy8kp0 g==;
X-CSE-ConnectionGUID: +wRvv/wwQz6k9j9KYecKng==
X-CSE-MsgGUID: SeBb0GZqTaSqm3pbnUoGBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="12826558"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="12826558"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:20:54 -0700
X-CSE-ConnectionGUID: d+0PCAYYSDe16nuwiePbkQ==
X-CSE-MsgGUID: 4CXim6uBTw2l7dBHW/yDuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54665951"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 04:20:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 04:20:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 04:20:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 04:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgzj1V9uxUAZnsnPvCQ4LKs6IcWDoUzX/OfBjTeqKil+3Cj2DaJ2eZqAgc/pJx5MJ/yUZrDF7G8lONyVZ/86o5x5iPsQ0jLS67i23aS2ajm5idqYsvrlnTEevQdrLBx4iQCS/vQhaWjlkLlcIesWAgYY+xS9inWXI24GxuAnl/0QQqFc5+8IG3yFtE67HCyVQzy2ksDaf3TYTisLSKl3ARDRCGKUClI5NCv2IyKiuAyaPdP/a9pKYSktN+KXE01bzFzcf8xNRWgSVuIrRHABeHn66bNpdUWuAVhk0JNZj/eoVphQYM/5e5eyuX13cYof+zYTAVXvGbtgFqeOpmn3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhkBXdL+/nt5NfuchhkBEiYQJF7IiKr5IFdd1cyWfDU=;
 b=ncDdlqvboTKq7ugMAaxskSDLHbC39xHb5uRl5hp6E9kPUmmGKI7W41ZV3dFEhtvo2LTPO6q5ETFwqQkSbjawOxOes3KabMw4vx0XB8xg7kVrQTTrKJEFKfHM/qDkLllBmLKG/xqYkkSIaYxDPQaC+jIbjBw4xqUmUUQPmlYSqJxekAW5s6ZfeI3fE5a0lUwz6mGkCrPLexkcSEYa84dJ6n+PgbCYMxV3agsHE/M8yIP5EO93TkMttaOXuvVQplgpmjvSn7t+ZUla0K7RzmhqimmHs5usYT1aC7raYCR6O9H7mncGt2dyhR6ZAhym3NOEDR9U3G310+OhgYPDWJbP+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.20; Thu, 1 Aug 2024 11:20:50 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 11:20:50 +0000
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
Subject: RE: [PATCH i-g-t v2 06/66] lib/xe_eudebug: Add attention events
 support
Thread-Topic: [PATCH i-g-t v2 06/66] lib/xe_eudebug: Add attention events
 support
Thread-Index: AQHa4nY7uk1rWgcbjEC/huZ0S5HOtrISRJsQ
Date: Thu, 1 Aug 2024 11:20:50 +0000
Message-ID: <DS0PR11MB7264E3D609ABAB7A5AB14E02D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-7-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-7-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DM4PR11MB8157:EE_
x-ms-office365-filtering-correlation-id: 3e8fd287-ad05-4e6f-684b-08dcb21bffbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?FShSGAEycgb5/N48p7eHvcIB5ZFvYRjeko+ymoRSOwhHORy6HCIx50/alD?=
 =?iso-8859-2?Q?gl68Dd1aFt+PXkUzbi7dLPKDjkR6QnPcNHejucr3t1PtfDdvzByjXGyMyu?=
 =?iso-8859-2?Q?orU1GN9cbfwRyKvLPAE91BWyrvuxuVlt9q4C+1AQ7J4XXUVsxMUBltGySH?=
 =?iso-8859-2?Q?2tU3R8M8HIIjprWjjiQe67qtsFGTqHWTJpYXUfnaOnIrJqWBLvSVj4eo7L?=
 =?iso-8859-2?Q?50SjPM6R39KRjdnPpa+5JW0u4PMqnwxNKqSJvnEgEwponqT8Eu+cEngS2r?=
 =?iso-8859-2?Q?FErGOf7SiPPkPlqdv/9WW2rXPQyxA3yWiMm4iVFjd58Og/rZq4fF/nbd9C?=
 =?iso-8859-2?Q?gMwFrVrRwdzSIAPxqRUO4h6kYwxeRyhGPJIUdgK78+gJnoAtaZQ9EgiAav?=
 =?iso-8859-2?Q?xoWy3qRv1Ahwk0FzWOuebIaLI6qAOgvZOiS0V6Bo+5gcCHWVSMmK9ek7wG?=
 =?iso-8859-2?Q?mHAt0kS9nhldvafHUc1bSihXHATRyllsqDUuTESB70ka0lea9WzNqT6BY3?=
 =?iso-8859-2?Q?oPWqVeNJz3Qfxqo3pFjjSFPnVyH/CR/4QCWLKsFyjUcFccT124paE+R7ow?=
 =?iso-8859-2?Q?cEm83CP//mEBQHubvnBeKtNxOoc00H+c679AQRrmeCuBJkhDZXM80qF++b?=
 =?iso-8859-2?Q?hsCgvY1sNgnHOkGRxMqldhVaYP4jebRGli5i7w1vQq1I+Pb+OYgaJP9cpZ?=
 =?iso-8859-2?Q?+JL441931sJmj1jCqvoWDrlfel0ji4qyJ2fp4PUPHukNISoLgmQlr8r5BK?=
 =?iso-8859-2?Q?QaVrrrvkMw4xoOIgyyad8C2hLnG+QxIm0facmp9RQZ7jXDrQDKepp1Y2RN?=
 =?iso-8859-2?Q?FsI5Imm1su4xVbW5xdIOFk3KxlRBUqOT+dIT9UbtqJRin3yH1M64DQNROe?=
 =?iso-8859-2?Q?c6bcSbPd/6OotttkDW6YZ0j4ziKjKjjZ8Nunv8WyUv1uif1nJlStNPq6U3?=
 =?iso-8859-2?Q?vCVKYNyviGaJYRZam2la9VGPoGyZY+trjXQZWuOQHW3h35s7kXRrd5ooDQ?=
 =?iso-8859-2?Q?vqlWjnxqtf+mVqeqSmXKCKQiiR0YAy8gWQKs18IG06NUKtQzTsj5a1am4t?=
 =?iso-8859-2?Q?lKzdZ86JI+B0gb8qKVYGihqVZnpShHzzljJsdnZ1uldPp2quM9xRKFubHn?=
 =?iso-8859-2?Q?VZIhCGQMGEl6XtguyQTV2dbLqQXVHVRKQ0PXtSB29tEjZkqMG5J5uw4o4e?=
 =?iso-8859-2?Q?F/0mjrpVu+8pg9ab6fPEsG9PGqempmFNDyNeaGlFc4rbEMLSLyTqd3xNHV?=
 =?iso-8859-2?Q?2Lhv/73axCpxlsVBJWzP2v/3Gi/6YmRW25YwrQI8jrBCEcMzWeRL2FeUJ5?=
 =?iso-8859-2?Q?NrHyqm/eb2RnI0KAPCizT9qIRWy8CrfhzkgFvDsEYRKfV6Jl7fqxOkHI2e?=
 =?iso-8859-2?Q?4ycCLyasaPFcD4NbljVwKFUdyytaJQrZkmrwsTlvGIqeCLfSMwDq1QmAQf?=
 =?iso-8859-2?Q?+88M0+OXyzp4HuF57kF2Ti8hPib0nWuJoqsm0g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?WX9mTccrbzXX31jjGzg0SO+IyWoRk/yzL2RqNxbqsg0Qz0DQjcSBVoh5jR?=
 =?iso-8859-2?Q?lp7dKhOXkif6FmQbEFkCn82drXFF88622mnSAA7rlJXeBiFuduLAFNkd6i?=
 =?iso-8859-2?Q?nogppjRWm32YBaW7CdSGWPG1VG23kibhbfdWpyw+G5/9B0ApuOkgFdCvYf?=
 =?iso-8859-2?Q?LGH+Uhs6UrxMNXqcyw7NhzZiCY8aLRYGwKf6p0V5tLSXo6JVQrXhqwxfPP?=
 =?iso-8859-2?Q?pcjm+MATmQZkZmjcjayyytT1ci3zQ3B+QyGxuMpEOwLUzCNGZ33Ma4d+OP?=
 =?iso-8859-2?Q?/ahCer5LV9+R20BNjSYL0qV8kYNje6kCrWwPyxkQyuT6d+d/DbpEJMq2VA?=
 =?iso-8859-2?Q?BvKlVVgbgeIEcdqOeCdQG2LrbgWTGG+xx7iOiyhvgd9KYNT1dQp9YZMbp3?=
 =?iso-8859-2?Q?o812eUBNZxeZbZaPkcLH+CfFoeKA7Ac3+2f4yMQ6vzk8tYVLVXp5/65OVU?=
 =?iso-8859-2?Q?bnmFBBcuaPJmylYcPK8jeQnViyad/KYuYZDg+sHCqmtydeLBx4NHNJO4Lx?=
 =?iso-8859-2?Q?aFG+x3az8AuKCans+a4fUPevx/kh9AYAvWjR5meqTqWtJ2NllkaKtukljm?=
 =?iso-8859-2?Q?YOUoYCWnyjyacz6pC+hlD5wua44C6nvSXkHJQVBtnRBzVHykSqIbo5UuQE?=
 =?iso-8859-2?Q?FyEGkbAGY+2y1wXZI9m49LprgrI+rzWPlA88iPLcdNzS/CQxJ1LeXENKcO?=
 =?iso-8859-2?Q?m3PiTWvrGiyaCGXoZhtxkAlTI4fYSU9svVHajlu++ZEPLegT2IOFseJCjb?=
 =?iso-8859-2?Q?CBrbCkbE45dIh3Co4RwnxuuKpFSrVBBb6qBCWwI2GCjR5ibLuEc0i9kp23?=
 =?iso-8859-2?Q?uopZ/+vJ/x8C5J0i2fjLKuRiJFE1A/lZ5ynF3Eeo5DOuEInk/21zMqFJTD?=
 =?iso-8859-2?Q?NMBLQvLNotkQiv5fDeaYUjNHug3y5w6rQB6TVgRI0D/WtKMxbHg3DnIyV/?=
 =?iso-8859-2?Q?q13z2ANXWRemnpAdl/w2eGIW/gdHArzQiPkbA8tEvF/T4nBZ3lJ5fL7S8x?=
 =?iso-8859-2?Q?vZ+rOWmA/tAHBZpyIW8EHrIRh6tKab/5e8jfnz9oi0ZMOnXCFLidb1vMv1?=
 =?iso-8859-2?Q?Jexn5lEFI0itM2uElywBybg2BI6xPDtpEazKlI6ygZgLkL7mK3jz8lkAgH?=
 =?iso-8859-2?Q?hlCI6pdKTO9+W4ieUsiEJSgLXXPeXzj7ZbcNl/Ct6g+bYt/0l8yOuWpotK?=
 =?iso-8859-2?Q?1QoVJgSED4ONdVwcW3cYmAPxvBkjGc35p/4W7ou0WBeql5fa4HkHoA0iVQ?=
 =?iso-8859-2?Q?+mtk5xQtrCt+oQB04kIEfDgFdUyVf2ah+JNUji0T56bp12n82NBOtS0AKM?=
 =?iso-8859-2?Q?DmdBaoqbFsQMqzvKtZUlApuQdJ+enMJl7gJqUzpTvYyHMsiSo3dAynf5bK?=
 =?iso-8859-2?Q?47aNfyaHByXAJjXRcFZxAevDcrTh/n5H+YlxqQhkwNdptMeeLoMXT62mff?=
 =?iso-8859-2?Q?AovZyZLk5J6vE6Vg52OZjgnYTkXwf2/uEEE+AeNPdXhNn0XLy9UIYjwGMA?=
 =?iso-8859-2?Q?Q6FWLSudXxBHdSq8TvjQf8QzsBhHn35G6PbuexBP28BxNvapVgd88msKDx?=
 =?iso-8859-2?Q?JUhhRHMm57pXOsQsxZ+AKRZJ3neSee8+upjjpwEwE+PEdcqbgn679hiDKh?=
 =?iso-8859-2?Q?YIZx8tdzTkKl04QkJNxGVkWe21YRnm6NNtmNcwar5qziw05Hz8ILAD4g?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8fd287-ad05-4e6f-684b-08dcb21bffbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 11:20:50.3809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Te0ZekhJPXZJ8h3hWZOZe+BMHWvtWkcHfttepwng3AZ5I+iFbb88CRCELv/DO16WuY2gN/j6HrPGHUceuslmUfPtLU5JVm1TySthvrr/tiJ2ro8ofRkvrabO1EVthh31
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
> Subject: [PATCH i-g-t v2 06/66] lib/xe_eudebug: Add attention events supp=
ort
>=20
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>=20
> Respect attention events in eu debugger library.
>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c index
> c84c9d9b7..8a57aaae3 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -54,6 +54,8 @@ static const char *type_to_str(unsigned int type)
>  		return "vm";
>  	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE:
>  		return "exec_queue";
> +	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
> +		return "attention";
>  	}
>=20
>  	return "UNKNOWN";
> @@ -105,6 +107,15 @@ static const char *event_members_to_str(struct
> drm_xe_eudebug_event *e, char *b)
>  			ee->exec_queue_handle, ee->engine_class, ee-
> >width);
>  		break;
>  	}
> +	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION: {
> +		struct drm_xe_eudebug_event_eu_attention *ea =3D (void *)e;
> +
> +		sprintf(b, "client_handle=3D%llu, exec_queue_handle=3D%llu, "
> +			   "lrc_handle=3D%llu, bitmask_size=3D%d",
> +			ea->client_handle, ea->exec_queue_handle,
> +			ea->lrc_handle, ea->bitmask_size);
> +		break;
> +	}
>  	default:
>  		strcpy(b, "<...>");
>  	}
> --
> 2.34.1

