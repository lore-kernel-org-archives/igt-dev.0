Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32997C98315
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 05:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D914D10E096;
	Mon, 19 Jan 2026 05:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4n2AurF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5F010E096
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 05:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768799824; x=1800335824;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y7ZHlioEH77rEnpnlsNRmIf/1YfxAuOgHhRjiuVF/9Q=;
 b=a4n2AurFyJAGyj89Qjqw/LVXvmyIt/5Dla3OSY5KyijTdzhL6YbQ6mid
 Z7NqnbWbJhecsdfSdTbdJi4OlskDMlWo4g2UXSUFI3MpC5STrkDAdwcen
 dhlSzO3PPMsGU/uMwPNjYz3MzYIguD+kynddyviPuTUNNlK5k7959lMNL
 Wvl4g1XzTlwALvJOl4Yj+Ox7qKG34rn6G4EWgVrU67cbsDNMGiUgshVMO
 dKXi/UENN5HcJKTV1S03d9C+H6B2lq4Jinp3ZKVS1/YKlmzuiBiwTlSbo
 qkPQ1NxmteNtc4nRfu+uQyM+6pMW5OU7X3Txd8sC3Tm9ja/uqCDuaIOI7 A==;
X-CSE-ConnectionGUID: sA9lWDVZTLG45TH/q5L42Q==
X-CSE-MsgGUID: 3rLIOn6XRz2w7vOM6qUd6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69981524"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="69981524"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:17:03 -0800
X-CSE-ConnectionGUID: 4HWe7RvlQImrxAg9iZTRbA==
X-CSE-MsgGUID: CUshlPy7TwGeg4O7sduM9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="205830041"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:17:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:17:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 18 Jan 2026 21:17:02 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:17:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDR4CMx+XuJncyuMmzBKm2Y3YAmJmRB4gYZw0LvfAryy8GqGGVOJ/vNC//IMIJLzLpoz23C8eo3krxX4pHOey4+fTcVWqzx6taVWzrEhOdFjAslRPAIqmad4YocBx2pePdbv6rS8UBNdK3s+iUCx0OQcGlsdG+s3zenzDPGbz0xUBN1M1ShGCVTfrYeA06dk+zvON+3pghQX9abs1sLS4HTq62NIcp7Ldac5h4VOeXbdM4PdYWSd5LYRNRpD2MlMcfl5BF6ptYxJrGdLjUUPkkZ2sv7oCl5owUQ6vMU7pp8sX8YvFDUQbPIYrU7U+lhZ8hzFmFclxLAyiNcoCp7xXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcV7JRkMB+vF8uSJs5iGASr/5+4xS75o71eIJ2iR7CM=;
 b=W7DwOMg8kdRIG4SHpzYvvYJYUN233tatNK7IkfTjMcbwFuZknrAuGeKwXCu1Zw9XR1AzPlA/fliNL1pT8X7tUrIhCy9CNG/n/w0dpZQ8i2ZV5uaC5NNIVhWadyNeQzkOV5Ko4yKm3oon/JTq0ElpV5jhDzJ42qsxGOYe7+RXdU/0CNh2/WWY7M/BYYj2QE0N5uW3CgVd235KjAqxjCUavrkZiR8QZve0qCgZxRxNfIEMLtr8VT7hMbSod0FpR3vYYEBu8otAzJ67+2VUxTl22YFRFyVVy0//l7s9u5hMcXcdxKvNEIROWG1yxSclf+xxj6RY/gno6bPbv54/sa6GYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by PH7PR11MB6497.namprd11.prod.outlook.com (2603:10b6:510:1f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 05:16:59 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 05:16:59 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHciP7X1P9ibmH1gkqbVBcT/BDFKbVY7j0AgAAD1RA=
Date: Mon, 19 Jan 2026 05:16:59 +0000
Message-ID: <PH7PR11MB6796D832928BA5A82936C14CE588A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-7-sowmiya.s@intel.com>
 <DM3PPF208195D8DB744E4298B2AFECE6145E388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DB744E4298B2AFECE6145E388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|PH7PR11MB6497:EE_
x-ms-office365-filtering-correlation-id: 69f9b26f-e17a-4776-9671-08de5719f8cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MPVNjHl+IT49GuK4N8bJTIo/Y9QZVS9yq/BCJOJ2hAe3HIeeId6jfn9acowp?=
 =?us-ascii?Q?RbwTR3DdcyukPA276KSyTJydhocbEp2r0ZyzBQO+GOPQuGFq2yOLfL2EohS2?=
 =?us-ascii?Q?A1kGO/N9vqf6TcQW68HFo8O0uURz95M3MpQeqTUlfZUfS57hrQsBKEKIgqw7?=
 =?us-ascii?Q?ztyTsTFP1GcoAihxhE1jyGcBGmmOj66mdcRKv2c99tmd/SPBdPmnVAtvoK2Y?=
 =?us-ascii?Q?c+ppbz/C/1sCbQTfAR8BdNI086YaOEcFcLAE2jhlbTrcFasrmWNh2rBg3jsq?=
 =?us-ascii?Q?mP9omNPlRw8YceC7WEjMZXQrjqINc0+Et709HNCpBwd6STb7ayWlWIbeA/vk?=
 =?us-ascii?Q?1jVlpPEFkltwbjQLr4z0V+sGqEDUw5hkWnVJlTQ7Cu226lCYbbs01ei50w87?=
 =?us-ascii?Q?85pQEUaQJOOLfuFEj2DsPk3g4X3d8D2MFW5mZ6d8fDx939n0950W7SjIwAjJ?=
 =?us-ascii?Q?v3u3Lf3IhJbQdwtevcg2X5FWezYH3uZnGPeTmZXztUUI15CwhuAa3YzKoRO2?=
 =?us-ascii?Q?bKBI+USibKy8dZpfpueyMGDzpmSKt8/knXNodg1deVAon2+K6j9+aN7gXUa5?=
 =?us-ascii?Q?WnhFwj1mIhVjhGNoWfDK+ardNgWZowGj01zTYcBsvBv9i6z+WFJy3LNDhlmN?=
 =?us-ascii?Q?hG4GCFWHQiwsxAdT43AqRoIx4DLPfpdu+Y5H9EXmt6yX8prnZJVYpkbYJF3b?=
 =?us-ascii?Q?472al48wvqbsie8lK8xs+RmdPm2Hd3j0wuOY4pcut/y/o74MbspJlej+6pJf?=
 =?us-ascii?Q?vxCm3bAjdPzjkl6+dAQ7GTpSpp1lWz4SY/a3q+iCXqRUFNERMMttqyC+CROq?=
 =?us-ascii?Q?tHO/pTmFgLfDZIFeQgDHqjmzXQKqWhtUCYM7vawBqDjeYTZC6A0WBP4xeZMe?=
 =?us-ascii?Q?dAa+bT8pFjHQlgWhU0yXp9Jrj+SNFfMuV10o7IvO3xf+KBYXruALZ+/X1T1e?=
 =?us-ascii?Q?SZab34jFoDXh5JYeQOwuF3Locwd2V6EWn7lCVeFCyP1iH6Fhaav88A6mGUNa?=
 =?us-ascii?Q?8Faa+KHHjdQ9zppaYfM3PRWqEY3+uN0dHPjJN9F3mb1G9ZrDXCiIjzSwWU4a?=
 =?us-ascii?Q?QCdyLRsg3Z7GILDwBVygknYvEUFkNgq+7p/wWPhn/YYl85wq6xZpLySuecpr?=
 =?us-ascii?Q?YquOmeQnY+Le6+gd/w9TV5gO5ee8jbXPEt3YrDICHzNaJjPeTWx/Kt7Ygd3f?=
 =?us-ascii?Q?EMU1FfLsiS67MsW6Td7g4qd6U3O9Z7F+IOqoij/v3Yt6RkxThHsnMaeFjR2D?=
 =?us-ascii?Q?voet3nma4qDTHDGtoYe2OkMJRtZ2oClwMbfUj2qs0PbV5k+Q02Cg9Bk6UWAe?=
 =?us-ascii?Q?urJo/7wphfgUmcCg2pDsB4T9UGmwE0C1/2cYl96oRpjShMnjK5lLOjq8K6LK?=
 =?us-ascii?Q?QtOKCQoNsoAMJZJ/DoQOpqsqotHu6wOhiN3QqQH5Y0/BnGVLaEU5yqUSQm7L?=
 =?us-ascii?Q?QYlo70h2vdUt1qd3EKOliHlyJNKj1hKQk5LgibV07dsfzKfkT7c/WUegdYSa?=
 =?us-ascii?Q?52xUIhq4mvCDerlm1vX+40HxmGS/aotHuhPTujSur5/zvWmu4Umr0FxJ864X?=
 =?us-ascii?Q?di5g7sOzutTflOPZ+VAeTJVA5w1krbrv16/lo4WhnJGYYL3DS/qI3LoCKUji?=
 =?us-ascii?Q?Ge9OsjGBxEdQspyU1yddnAk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e4DaoavUYr5TYe/b09I+LmlbRpsYhm63rN1UhIuGX7a5foG7vVZsKOiWWK4o?=
 =?us-ascii?Q?JTHjKSU7ouUXv6KiPoy8o472cU9dKbrI2f08Ygu7IsXYFjGKLkPKYVtCD0y6?=
 =?us-ascii?Q?DDAbcMV0htgRsJ76YYqlxexMlz+dLn+0q2SKtB7AfZnVg7fApHp70qD+Ug5e?=
 =?us-ascii?Q?N4ir9t63sdfubBnkOZYZYCp7jjsbU1lOK6nYhgV9N54Jv+/M7BWDkJ+RM6Wj?=
 =?us-ascii?Q?jSqSZM/jAzA1MyDe7IwqltprreaoFTlk3/asf3yWzhDDm6Xq+4BIisrevsqV?=
 =?us-ascii?Q?P/+I7D3VE9SyUN3HZDHzgmmp01sGfCDEJMCxdGts089H9qRvhgQNyvsRzeHT?=
 =?us-ascii?Q?5SOsgewwjTmKhU/Y1FX0peBdR+HKs6F4Ov59KLYP6FW1rJFESo7GVn8EW5jD?=
 =?us-ascii?Q?dLpf5Yg5bFRDJsfnmYJcCspJTy1KtfHF4srdJ6b6ogKHSqC5PCYjnrmI6UZI?=
 =?us-ascii?Q?6ZYq3SrTG9mXmpxkK8NH6BlntR0c+mPXLGtpTS/MltcP99sOIP4z9kzEQwjM?=
 =?us-ascii?Q?p4jFA4EO6uqZUNKUD42guTYHfWq2xJiOSy5WsSr5ci5BBvnA+F5hN+rIOgZx?=
 =?us-ascii?Q?B11p3uPbQrXA1dAZuieGTGee0Dm7SNyy/Q+sX8H9khokU9nqhgu495rgPFNd?=
 =?us-ascii?Q?odZowtqxqnPBjb0LpqiBbFA8DOLQaTjoV5MZ8I/ldKqHWurE2JtnpiQkzRRc?=
 =?us-ascii?Q?2xoAXBF/G2VbtcCgWcrd1H+Ij8PkCJQtuEQ1pXrbBgzZIZYEQc41kFMhPf1a?=
 =?us-ascii?Q?ISKy7J/i9xp4AvDChbfq+0xmx2EdaJF2jZmLXAXXQqJchOw8FourjUi2+DoU?=
 =?us-ascii?Q?ja6f/U+keTSLvmZpbihcH99/0L2XUhQm0LTdFUmGYLy1HFt0qS7Re+xFJwW9?=
 =?us-ascii?Q?MS62XKI3/RYYcaP6jS43Of+lGnyYAaOWf8VyJqhhjjROx0LTC37fu9QbKP/r?=
 =?us-ascii?Q?XfIKv5yQtAi8FszNXxEfCm51IC8ODhSUzZvHPs9P+MbYDiuSctdFtnILKJ5N?=
 =?us-ascii?Q?5ydMMrpdVFEJ9DFMitj4LmYYKNiF/S73GDqIboOlbkYqrSO9D2SU0PBXEzvP?=
 =?us-ascii?Q?jkngCfycfQ80EyPvARtZqRb8XZHp09XbVwTrPrtx1VBITEIZDxsLjPuOGHL2?=
 =?us-ascii?Q?DkLM1M9tGHpfk4puQ6Pvmb0DQFjWHbMq9RB5JZUSSPCUMM4aeCRgcY9/wWun?=
 =?us-ascii?Q?xfjxSME11upx1GomzAUV9omBlf2uUDK1LO6nXL+PxZcfN9uJKLCan9x0scyW?=
 =?us-ascii?Q?7zVnKnSgzLkoW99xPxEJTJnW9ihPSenB8Xp8L4dd6hw+cnS8wQ8Sv5KgmYOP?=
 =?us-ascii?Q?y1LbhkGBkPDtoaguGUhmp8Jog6fsqoaiJ9Ji2hWRstim0nf0U7uS9ctHru6u?=
 =?us-ascii?Q?MzHxokClyvtTjPRN032qfzFWHcqmqqQkZHA+wAaZmqJyRh+rXqA0jwSlzU+P?=
 =?us-ascii?Q?WqTTMKv5FIMqdNcYbiQQ3+TM+80v7cdCsiTTR7o3keMGPjeEDsPowvI5sF68?=
 =?us-ascii?Q?41Chloi/8TQWNbG1IUVo4k81yaX8VhpvSCw0zTpYABCfjMxwl2eb9i0rXK4X?=
 =?us-ascii?Q?5p6MbQ/qtdltum7skb9cy5egLXS+mX548F2dlQKgRLxHE6J8ncPcwqZOaT6B?=
 =?us-ascii?Q?pjSgweQnpL8x4FWjXkoP6NPJ/qlFDglolYDUikAZmX18V5XONqcw90VlLb4Y?=
 =?us-ascii?Q?lC6Mx5ICoiDjhcXGK8VZ8R0vfx6lM2w3WxLWi6uoqNOIFv2l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f9b26f-e17a-4776-9671-08de5719f8cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 05:16:59.2834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MAyi1xbjAyJtNedxurxy5zXjrW8ecY2EZTUKzVD+tXD/8qBWhOdABjRTQ+7SVufig67ZB4CjVbEL4kis32xx7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6497
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

Hi Suraj,

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 19 January 2026 10:28
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor writeback=
-fb-id
> subtest
>=20
> > Subject: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
> > writeback-fb-id subtest
> >
> > Remove individual tests for each format for the test writeback-fb-id
> > and introduce dynamic subtest generation based on the formats supported=
.
> > Framebuffer creation was now part of the subtest level based on format.
> >
> > v4: squashed the FB creation function with this commit (Suraj)
> > v5: -Update dynamic subtest documentation (Suraj)
> >     -Rename input_fb to in_fb
> >     -Set plane to in_fb and remove unused input_fb as an arg to
> >      writeback-fb-id function.
> > v6: -Remove in_fb inside subtest and reuse input_fb from
> >      fixture (Suraj)
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 60
> > ++++++++++++++++++-------------------------
> >  1 file changed, 25 insertions(+), 35 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 63917bf4f..0ed86c865 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -51,9 +51,6 @@
> >   * SUBTEST: writeback-check-output
> >   * Description: Check writeback output with CRC validation
> >   *
> > - * SUBTEST: writeback-fb-id-XRGB2101010
> > - * Description: Validate WRITEBACK_FB_ID with valid and invalid
> > options
> > - *
> >   * SUBTEST: writeback-fb-id
>=20
>=20
> This is the an example of the documentation that needs to be done for
> dynamic tests
> * SUBTEST: %s
>  * Description: Test content protection with %arg[1]
>  *
>  * arg[1]:
>  *
>  * @atomic:         atomic modesetting
>  * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
>  * @legacy:         legacy style commit
>  * @type1:          content type 1 that can be handled only through HDCP2=
.2.
>  * @suspend-resume: Suspend and resume the system
>  * @legacy-hdcp14:  Test HDCP1.4 content protection with legacy style com=
mit.
>  * @atomic-hdcp14:  Test HDCP1.4 content protection with atomic
> modesetting.
>  * @atomic-dpms-hdcp14: Test HDCP1.4 content protection with atomic
> modesetting and DPMS.
>=20
> Regards,
> Suraj Kandpal
>=20

Here we have one subtest "writeback-check-output" under that two dynamic su=
btest will be listing "writeback-check-output-XBGR8888" and "writeback-chec=
k-output-XBGR2101010". It is enough to add documentation for subtest not re=
quired for dynamic subtest.

Regards,
Sowmiya

> >   * Description: Validate WRITEBACK_FB_ID with valid and invalid option=
s
> >   *
> > @@ -300,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> > *output, igt_fb_t *valid_fb, ig
> >  	}
> >  }
> >
> > -static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb,
> > igt_fb_t
> > *invalid_fb)
> > +static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
> >  {
> >
> >  	int ret;
> > @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options,
> > help_str, opt_handler, NULL)
> >  	}
> >
> >  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> > options");
> > -	igt_subtest("writeback-fb-id") {
> > -		igt_fb_t output_fb;
> > -
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors &
> > XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB8888,
> > -				      DRM_FORMAT_MOD_LINEAR,
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > -
> > -		writeback_fb_id(output, &input_fb, &output_fb);
> > -
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > -	}
> > -
> > -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid
> > and invalid options");
> > -	igt_subtest("writeback-fb-id-XRGB2101010") {
> > -		igt_fb_t output_fb;
> > -
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> > "DRM_FORMAT_XRGB2101010 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB2101010,
> > -				      DRM_FORMAT_MOD_LINEAR,
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > -
> > -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> > -
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> > +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> > +			uint32_t test_format =3D fourcc[i];
> > +			int bpc =3D igt_drm_format_get_bpc(test_format);
> > +
> > +			if (is_intel_device(display.drm_fd))
> > +				if (!strstr(igt_format_str(test_format), "BGR"))
> > +					continue;
> > +			igt_dynamic_f("writeback-fb-id-%s",
> > igt_format_str(test_format)) {
> > +				igt_fb_t output_fb;
> > +
> > +				fb_id =3D igt_create_fb(display.drm_fd,
> > mode.hdisplay, mode.vdisplay,
> > +
> > get_default_fb_format(&display, bpc),
> > +						      igt_fb_mod_to_tiling(0),
> > +						      &output_fb);
> > +
> > +				igt_skip_on(data.dump_check ||
> > data.list_modes);
> > +				igt_skip_on_f(!(data.supported_colors & (1 <<
> > i)),
> > +					      "DRM_FORMAT_%s is not
> > supported\n",
> > +					      igt_format_str(test_format));
> > +				writeback_fb_id(output, &output_fb);
> > +				igt_remove_fb(display.drm_fd, &output_fb);
> > +			}
> > +		}
> >  	}
> >
> >  	igt_describe("Check writeback output with CRC validation");
> > --
> > 2.43.0

