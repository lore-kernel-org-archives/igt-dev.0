Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEE2D4336E
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 07:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C68C10E248;
	Fri, 12 Dec 2025 07:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HixbNwpR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9721810E248
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 07:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765523734; x=1797059734;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T9v7XAwGiiz2SMotjb5K6/WLZ7lL8B3M2V4IfXuzzWY=;
 b=HixbNwpRT/vWGwN9AcP7sZ4KRkw0bzOuT44b8Z/jbrikhMFVjV5BzI78
 gcOXWUqDeEFIEitPZWHo+TcTZL5TdlgoG7gFNpgjiiQGa0qpbMszURkhx
 DxA2pkOsN8mgR2A3GDnwkbs2Cvy4EphZwq+243w9Utiv/sHZFo75g+18e
 Pv9rM95JK8M3tX+QN7Y6bUoYL7S+7iOeDP5eAHb3kf7InhL1JMYGCvO7W
 Q+foXp7tgURX9TeD1sguczypSV6Sc3U6g/ZCfOae5BX1pk+h1tD1+RvH3
 eLKyGI5s9buT2VyZrFEVdPyE4u1rayu7Whvxt736oCG3uoznTViu1t1sm Q==;
X-CSE-ConnectionGUID: /Zi8dWEOQD61nuFYdOWxBg==
X-CSE-MsgGUID: zrcG+wyYS828WHhGYsB5UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70094021"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="70094021"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:15:33 -0800
X-CSE-ConnectionGUID: oisCfgEwTVWNcGTvTn8Jgw==
X-CSE-MsgGUID: tlmhWoRcRC6x+KpOw9YOOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="227655657"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:15:33 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 23:15:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 23:15:32 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 23:15:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFCGKDSYsmSzLpZEvLCGA4j4Urfb67QQrLd+fF3hPKSZ3Px9Pn5hosqFql7jg7eUdGgwrxxxt0/HIHoCWBqRLGBvCIlExVEb+a1yOlXNml3Fi2rt2/ZGYVM2saV0KB7KCBRurUNIRUG+eOtncoF2Y616741DTXhgAeiSdLKo/OhJJxDuTrRx+4yFCFMJ2MXKjNjEERk5zNck8+yTCvCnED4EMjk/rHL/Ez6G0/WRPmwPi5gWmi0WM6QlSNAJ0m0WqX8CbfAKpcdBhD8hiiD+n3IlJNemuOWq5UY+e0RuIZ8ab1PEm3K3ZBbgOUrIG7KpJ0Gcd3zSmkL+UrfaFWZhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXZzld1VVhveiEfWpEJBFBkeSshbwKOZlHtgUhHv/hs=;
 b=K5xMJIdH2JV/tr0nqtrGAnERs+UxXBVVEqeCCKvbRbR+pSN17cZUvGXAMDIH3tJ/l+0AGeJo5UvbJtS/w2X3MB04RplSfVzHNuJP6p8rPAkyt23A/S+3dJj1IfyZ19jtRNtYFwiT5BG7y6PtkEGXDDdirJsM71KkyGfmzKNQhvlCsH0v2JBJ6pboqk2VLN8C0qLwDciXvmNNeCG2CEEGNfMyaYcCT58mqKQJH6HfK8FDAQUgG8qCAd7FSDNi2xEds2gbjZbW9O4MpyuyJPGoTLQbBZnUGpaV8CflF9MwCSpfNzs1ZEj57OOUngkRcSYOygjLcwkwqMRuXPlmpo+F+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DM3PPF31D2DA56C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 07:15:24 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 07:15:24 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Manszewski, Christoph" <christoph.manszewski@intel.com>, "Patelczyk,
 Maciej" <maciej.patelczyk@intel.com>, "Maslak, Jan" <jan.maslak@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 1/3] lib/xe/xe_eudebug: Avoid comparing if
 everything filtered
Thread-Topic: [PATCH i-g-t 1/3] lib/xe/xe_eudebug: Avoid comparing if
 everything filtered
Thread-Index: AQHcarzjVCagoRTp1k6Y2FJQlH2EMrUdmDRg
Date: Fri, 12 Dec 2025 07:15:24 +0000
Message-ID: <DS0PR11MB7264988A59C77B91EB525ED0D9AEA@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20251211164020.1065880-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20251211164020.1065880-1-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DM3PPF31D2DA56C:EE_
x-ms-office365-filtering-correlation-id: ca215ec5-5880-4dda-833c-08de394e37dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?2f2aEOVDAiUzHYtWeMplvqzhHRiCM92gqP1/w5MwUvUUrAdEOI98VsMjiK?=
 =?iso-8859-2?Q?i+XY3s3Zh5AmU2qtA5sFkbex55r05xBELYPD5os5T/7JvOnIJkH42di2LK?=
 =?iso-8859-2?Q?kRk9+GfGfwD35mnWOXS5pVYsJI1+BN5jfbjEx5KALqzkwyXXXHEpv/kqux?=
 =?iso-8859-2?Q?OpSAn5Cd6WSHlraN8mRSukl3XrR2s5NGvZt+GSLb1azZ6TOk/WMW5FgTLG?=
 =?iso-8859-2?Q?knY25rDPV2D14PvQo74imPKNRpNN7FLe9HwUjXr3IkDq8kH9J7r0AIUjVJ?=
 =?iso-8859-2?Q?3bne+PcfIt9iKm85u7+rh34bjQkKqwORH50uiyERY6CN99VPoq1CGVM3CN?=
 =?iso-8859-2?Q?cWZ1GYpER9Jwg/liGHFn0q/CeuzE3NeQ8fDS/G+0xINztvIdJ25NCejRTd?=
 =?iso-8859-2?Q?930LFpalJncMmKKP6ZoMEuQxuMhtW5vUh4dyWFTPsRpLiTHZOMbjoovQql?=
 =?iso-8859-2?Q?ItkjsM72dNPQv/Zt3Ri3CV+R2H2C9Ns73hFahbhaDJfOnMSnt8ekMfQiOo?=
 =?iso-8859-2?Q?xmFIW/Qtma9qL08HA7psA0wzkq2q4jEWzbqceD7IiANV2FgzMproSEbXTo?=
 =?iso-8859-2?Q?WcRBHDCNPU5BkVu0Sf4xtLWRI7poPIoXspj5Sgcax6AoBAjufvGPiT8UtC?=
 =?iso-8859-2?Q?obzrhhR7egUoJLM1+NJujQ2m2fa+NzZ4Ze/z7Wx3WB/NNk7yBT06ntizgB?=
 =?iso-8859-2?Q?8h4T32Q8PJ6cRpKrvVylh9ZENQXWoJ9bN8BVX8p2JbnI+ZrduYqdj8L7oW?=
 =?iso-8859-2?Q?BC700GJVvvFD6lD3HTpPZSL71rPMZR/dOocE5cxHG1iHPt19nVVN7ihSdJ?=
 =?iso-8859-2?Q?io5srP66ULJnk2CGsd8O0NVpq8HIh1lOH4esFEmAGYn0W3m+4ieLU6GNKT?=
 =?iso-8859-2?Q?+kquzAfDYTRgoZV/vAnowQnVmTbWBuDSxk7V61yIXWnWXA6X+ABmStp9j3?=
 =?iso-8859-2?Q?ahEFyz/DVFNoUJQK1qeNbSQKWP8Zjss6JK1SiHr+c/y1rXXzt8BHF6/PKz?=
 =?iso-8859-2?Q?iRU7wcSupi52NVVdu8sh2MzB1y5mQX5yf/UJmVp9FBMQwg1vAB75rOSlOl?=
 =?iso-8859-2?Q?+x3snx/NKjfagyRWuBbphwHBNBRvrWhbyigMHiEzmujfWE4FWtPm9SylCd?=
 =?iso-8859-2?Q?IIFOG15WZ8zRYiJ0ma5S7lZcONRdVqWqFuTKvpv25bGQBl9WABGpzq6Tpu?=
 =?iso-8859-2?Q?4mz5b/paJuB55bqRQ55TdHpyz6owP9BG7lxfLKmZd/C/gLjHq62Sp4BHye?=
 =?iso-8859-2?Q?LmszpV4sgJzKtQiA2kL5Zz6A5PbtLkH4mE5synSwy5I/6qEPCimEfsh5Wk?=
 =?iso-8859-2?Q?AVJsWFG4BxIu+oQZvx+NqxKQo8UhVO7j5yk5wTchzi1nK1Gf/OMq4RqznX?=
 =?iso-8859-2?Q?U8b6kOeADg1LTR8erD3sCoOJtKab0g+CQ4kY/gt/10nxoreBU8YnOJOq3c?=
 =?iso-8859-2?Q?jxHXs9bgFTtXFVel9Nin9lUypJW5p5kVKUyqltUK2IeQrZDzj7xCKpJO0i?=
 =?iso-8859-2?Q?a9FbyR9UN0iMI8+OYcWlq71N8DkTeltb9XkyjYbcEEeujYT3CQWTJe4H5q?=
 =?iso-8859-2?Q?9ZeZjGOh5tM7xwhScBSogSzhH3Vl?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?1HhvMlPEU5dimtcxdTUFsB11R3t7Gyr3qXDq1jnRSuDDZ3fztETmX6nN8b?=
 =?iso-8859-2?Q?cX6mpLlWATY12rQ8ocJ1mK8/04FMQ09S+kd0rPDAehHNusVNrQa7HLMwK2?=
 =?iso-8859-2?Q?KtswQv1Vb/UpJBQQMi7ExbX85PJZIG0oCtlsjtrXP8Xfl9c2NJNMVDQGLu?=
 =?iso-8859-2?Q?bo6piDP/s8h61xaaShewWK0HRD/iM0yEgXLqA5ySrt8IOMvV1iUMIoyVvF?=
 =?iso-8859-2?Q?0em1zCJYAp3njV0HzJsLtXsuNsMzpX4DFty+3LWhsNXcDgkPd064TMkh/m?=
 =?iso-8859-2?Q?4cZNaehKVeIY2E4WwvXsVg+P7Sw5C+2y0IY0Y1NpsRZPDjwIISy9p3k+JU?=
 =?iso-8859-2?Q?ksfY+WzKznejRkwzIw2tZOKKBkoKfcDFngMMFKaqyF8nYepB/EzlaniseT?=
 =?iso-8859-2?Q?cKl/pDPgxsYrGfszjCY1zB/c5E6RqQBmJgamOcKzspIB5udPQ5a6IQi+7f?=
 =?iso-8859-2?Q?+0dLnASeYcRwqbzJqbKXaZXVoBzllAO3SQdBAzhOgjzo9AbGEXZR3IOFAI?=
 =?iso-8859-2?Q?orEGghkvQd17KBI9StZG6FhU27VK3J45joCxntdtFl3jhxBkevzTEXBGdT?=
 =?iso-8859-2?Q?ECqC5zs6jJ0gqdq6Ngx2LkZMoEa6ZXOmP11qqaipPkpkQEiGDSqQ6oPHeC?=
 =?iso-8859-2?Q?UlzicQJQDchpFzG1TSgUtx21XKTcpkkPhzKekEQU2PB83WVxgvRMBcx4kL?=
 =?iso-8859-2?Q?MVHrBZDUrKx4VjAElJh4j4YaoWTekZwLGHl9eKbCk0ioVi9giMTE99HIQa?=
 =?iso-8859-2?Q?33BxXZJzWiKbjGFndcxqvRAZzMoHFbGd72ZTG+oIEDWtaWjbSe3ot+ABN3?=
 =?iso-8859-2?Q?R6A3JIxjoYQSJAs8wonlIduQhai2kQiTpQzcEcx5420s573Mn4sfGVefwd?=
 =?iso-8859-2?Q?Q09Q1Jfn12oyPmon8DH5GGX+i40t6j5mszkS+tyuJT7lJZ2Ghli9UBXAPa?=
 =?iso-8859-2?Q?4wT1Y1HM/HMmFC7rHEUYkV93UjLuV7ia2zWda+jT/JwivCy5oyndRbutO4?=
 =?iso-8859-2?Q?I8Hf3KZ3oLuxFs4aJLVl52+nU8xjPoGUe63BrMt1GT6Xj1qAlG1aYOyLlQ?=
 =?iso-8859-2?Q?KoOSmQxOuWzFGDBmPlfOaRySt6y1oICgtstqwWNdjWPkyuW1QjfF337ClX?=
 =?iso-8859-2?Q?SWnvL8X3+Nfmgg3jJ3OQTSki3HuYuXDTSkLtSH5piNy+w5CinPc0H0cm8M?=
 =?iso-8859-2?Q?1MzHub7/URteG9bVXitDonv6YC5FZ0Dakg4G1kx3ts9WkiWuaQ+rhcwt65?=
 =?iso-8859-2?Q?jL7aDjrvR9/B02UncitZXuQzNb40tP6DepdXfUeS7wVaG4pAQP7Eudis0a?=
 =?iso-8859-2?Q?PmxzmYgc+ItI8YTtz0opKneonBZZIp7XYBoLF7yUu5PTWDZ0SCOU/NoJCq?=
 =?iso-8859-2?Q?ZKeEVutuozIs198xx+jKn5TrDnBOZUFLuc58eYein6HYZFEjnFmHJQO6Mt?=
 =?iso-8859-2?Q?x4KvwG2ZqCbD0dyCWNePNX8LYYjwh8CO3GLWCcUy3+mMWsKvz08Ozs4Yhk?=
 =?iso-8859-2?Q?tFQMnEDbmtSG7tS1UyekeqY5ZhA/CvOTjkU6mfhRNGyCXS26fdmZUyKVz4?=
 =?iso-8859-2?Q?s+plvPzB72pLP4BZE9usT2eV0YH5vsSyL5Vl5yiMnrn2blC6y3cWRyFbix?=
 =?iso-8859-2?Q?I5/JoZ/9JK6iZ8um40LhwCUpGowdog6JrSRXJ+RN+i0byvriIYmCppSQ?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca215ec5-5880-4dda-833c-08de394e37dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 07:15:24.0512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKLCa06lGgH89/KPvUSP4mOM/hLKYmCCIlDvWqyWTQuzS3ddPds7oGZSdju0VcFbdjlgmqyX9nFVYzBjv3wf47oaaErzlsAjo5km/stOAtOIpgG8rSOEAdJBtCHlNW5P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF31D2DA56C
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

One nit in commit message, otherwise LGTM
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Sent: Thursday, December 11, 2025 5:40 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Manszewski, Christoph <christoph.manszewski@intel.com>; Piatkowski,
> Dominik Karol <dominik.karol.piatkowski@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Maslak, Jan <jan.maslak@intel.com>;
> Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Mika Kuoppala
> <mika.kuoppala@linux.intel.com>
> Subject: [PATCH i-g-t 1/3] lib/xe/xe_eudebug: Avoid comparing if everythi=
ng
> filtered
>=20
> If all events are filtered, we should omit comparing.
> Otherwise client might not have produced any events
> and compare will assert of not finding any.
>=20
> Previously this worked as one event was always guaranteed
> to exists (client open). This event does not exist anymore

Nit: exists -> exist typo

> and thus we need extra care here.
>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  lib/xe/xe_eudebug.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 2abee7ba2..0f09bc8a1 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1021,6 +1021,11 @@ void xe_eudebug_event_log_compare(struct
> xe_eudebug_event_log *log1,
>  	igt_assert(log1);
>  	igt_assert(log2);
>=20
> +	if (filter =3D=3D XE_EUDEBUG_FILTER_ALL) {
> +		igt_debug("info: filtering everything, skipping compare\n");
> +		return;
> +	}
> +
>  	xe_eudebug_for_each_event(ev1, log1) {
>  		if (ev1->type =3D=3D DRM_XE_EUDEBUG_EVENT_OPEN &&
>  		    ev1->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
> --
> 2.43.0

