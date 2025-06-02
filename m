Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B03C5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 18:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10F310E0A8;
	Mon,  2 Jun 2025 18:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLLd2a60";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BE610E0A8
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 18:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748890484; x=1780426484;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=5s/ksYxbueEyVmdTfQabtT8JMbMPZ8Z1wmbSGxGBbuI=;
 b=JLLd2a60X/4vNQqQCO7J0ZnpVlcecdcMvYwWLAyKGyx6q+icgC4fk26T
 QmcH45urv7wRU/NayMBEG0Tp87fXM5S+IMn96KJByq/gbda1aJ5o34rkA
 UhStazIYjvGLO2JHz8DxvThr/tp1iBtfP48RLT/qax2g3pRV9U7Rt3rY7
 PjZZAi2ZMGI8Q8ZMY5uGakynjFODudYgVZWrXK7baUIhpebs6ef/uI0wD
 tENtnrlISoHmGviJdZhoiHEtcjbTzC3hEznHp1vufIowpN3lxIUWxvYV3
 ig56CqPVCP2YPcj9bJm2dYT9TtlPTPWlsC/XdNtmI7vzlFJxelGDlEUSs w==;
X-CSE-ConnectionGUID: LCwMmeGtTY+1+XKbA6W47A==
X-CSE-MsgGUID: Vmcak1pKT+SJNzd7HsVEbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51008678"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208,217";a="51008678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 11:54:43 -0700
X-CSE-ConnectionGUID: dsSfcqPPQieU4TslSQ2FIA==
X-CSE-MsgGUID: LXVX+sm8QYisPRW3kp5/VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
 d="scan'208,217";a="149393855"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 11:54:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 11:54:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 11:54:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.79) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 11:54:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIZx1LwbQRgpaxNmqCINCODegSK3sqznzad229y3F2xKilcwZ6Z+pBxE0MP3GRa0N3lKNQTxrHoDxzPpVn9rBv4YArKDGzwNjtHWqYB0UmkNu7ZscrWQxSkIyy0iuMFZ5HHdHgpar2zMPVMHKo2joa5lOwlSRlmB488Vs17gpaosIbNpP60F03+osVo1k/ZXT0UfJvpYOmw6sCJ33z7tNpQrrroobJGfkvGTey+nfWhHiDu6/ElCxDwSx3sF/viAJn8PzOY3TRFzJO5rpLI5z/oSq9NtucqLhDi0k6rhIzxHr+9JbW6okj/AzwujyR8whC99gdy9wfefETmTVJW6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVvCAeVoXZ31rU+B4veppnauMkpCMu3T1cfstkKN0VA=;
 b=Qo4ld+nXqRFevYUpeQrAxvDnvXm9wzrtn3ruRnuQv6DoA+oaPyu2LWLgCMZQhVLPvD9pb7cf+aeqLmeipQV1cjeQZ1WxUkosayuq6lO/djVFKZdfjyNLJ7JnuQ7mO1C+GztNUkagQZ+vkGDH8w9W9vmlXNMW6HqH+JxKc3oq+Ga6lQZRuw+0uIk6JGgyAS5QovXv5paMx9Ov9uQLk0BMKHFyNc/id67jqVHi9U+Y8EzkONJT+v5ac5Q4guZdOtAKzEFSPUXwq0Bh9j2WCLwCAhEYA8+rrVybiAXFGG37+0NPIAgj3B1k7Qu1UQh1oMD5AIwUN/y9qSqySK4PgAJOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 by PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 18:54:13 +0000
Received: from IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240]) by IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240%3]) with mapi id 15.20.8769.029; Mon, 2 Jun 2025
 18:54:12 +0000
From: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "markyacoub@google.com" <markyacoub@google.com>, 
 "seanpaul@google.com" <seanpaul@google.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Singh, Sapna1" <sapna1.singh@intel.com>
Subject: Re: [PATCH i-g-t v11 4/7] runner: Include local glib header for
 Android
Thread-Topic: [PATCH i-g-t v11 4/7] runner: Include local glib header for
 Android
Thread-Index: AQHb0L0J62f01s5w70mwMqCeQbrNArPrgoqAgAS6Q7c=
Date: Mon, 2 Jun 2025 18:54:12 +0000
Message-ID: <IA0PR11MB73535A1B4DD6945AEDE7D5D1ED62A@IA0PR11MB7353.namprd11.prod.outlook.com>
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
 <20250529171246.74375-5-jeevaka.badrappan@intel.com>
 <20250530183817.ki6oxkiw3qp4mghw@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250530183817.ki6oxkiw3qp4mghw@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7353:EE_|PH7PR11MB7431:EE_
x-ms-office365-filtering-correlation-id: 1cb09cef-59b3-4ed3-75bc-08dda206dd9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|8096899003; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?8t54EcwyESiR1l3VnZ6grvrAvT0DFGd1a+BoTELKsvhUhPgLCSZ8yf549/?=
 =?iso-8859-2?Q?Hu+E0I/PS4MuhzPu3fNlxfNVTCXkw0st31vsLICT+43ZM4fF81vFuBwXtv?=
 =?iso-8859-2?Q?ctcFiGj11emlJc4F3zAx2EBDpbq75XAeXopmJeK2Brbgpm8HTdjDePH/kU?=
 =?iso-8859-2?Q?QmJiJhKOZ13HUV+qTwCGAdwKNBFq61usz08O1rtglrAmpkx6exLmwg3tAc?=
 =?iso-8859-2?Q?O8eNdWs0ywJXHVeu45MI7sWqGSBfp2554ic848NX4+SqrWBhZJyPJeonAP?=
 =?iso-8859-2?Q?SVOAoeiIABXaG+5tAoXhSWv1tsVDSAnfwJFpRvstVkuiYUbjpmEB9faizY?=
 =?iso-8859-2?Q?eX4ZNcu9SPplPnv9FL7J6+o6VTnpd9Wh2k/sAmIoNMY96uAu8sY3w00YH8?=
 =?iso-8859-2?Q?0xCWR449JP1ipq381ys0usXZADqFA5/hj4neEhuxXeVMjoxfOe7fQc1dXa?=
 =?iso-8859-2?Q?CfdvwEja8Qad2OlQFk5N+MDWiDu/tmX/kBmkzjQvs+w7IdeVj2FiUSWi35?=
 =?iso-8859-2?Q?CuMRJA5eKtQyIlGz1WphH6kqgBafI+qp2Iw5hC39b4Td6xeuG1DwMQJFj+?=
 =?iso-8859-2?Q?r7g9L4YWqTxsDxQRshBGtySUzXSMIuYZGsW/xQflg7Ib2dZoZPqnMY78tE?=
 =?iso-8859-2?Q?+9ER8sDoyRQ7F4XW+RvZ3Qm+ENLfdaNuKQVd3z2vkE/gECOnEKbs1/ZLk7?=
 =?iso-8859-2?Q?NL9u6GUpNQUjqtO5brkek+xd3S73NKzfEY20j+L4p40xOeAW1N6pm/YwSg?=
 =?iso-8859-2?Q?7AuFlsHAwloCwc79SMUFk+5rP+ruoMu4COhZzCsKziv/Ej7yyh3PSorNPj?=
 =?iso-8859-2?Q?DLMs9kUh+0zs2o4BExfrV4P863hRMeqHpoi0+e5gfj35c9oRJn3R5KGm6/?=
 =?iso-8859-2?Q?ZgTps3XgvUcAJPkApO+lzbp+Im/rKK/x1lRQa0CSALMxziucPnA63qjB6E?=
 =?iso-8859-2?Q?UJmAPy81L/VEA64M79XV/kQP/moWD40zjOORa5+g3b/QyjxdvByENUSCAX?=
 =?iso-8859-2?Q?PG+jtywv2Dwk+Wn5g7NaJ0u3gJ59iplbJ5hahgTal+1j46025+2Vb4UrdI?=
 =?iso-8859-2?Q?ImV2vCdLktUJzhEem/Ik5/ZQwf/xpmiDw2k+bsS5Tjp9oN6USHHig1PJWg?=
 =?iso-8859-2?Q?Q0QLD8Grdn5kw8lOyjdb30GvtyHQw9+5AFdGOeWbhECNrsT/+e6e/OGTs4?=
 =?iso-8859-2?Q?e6PWvCBTT6dVvpUCN84/NfzKiaejFZVGMMrcpcRPDgut+NOFcQP0vgId0D?=
 =?iso-8859-2?Q?3nJxPRM1iPxaF+T+kNv1uyz3GSUhGvxe088oSPTO8qw3mdlEFExOLkpvdI?=
 =?iso-8859-2?Q?WYNa5o50+1o/Z2nEnRJDiH05XSd8m50Uijx+GXO/n1OzNavr+ToXYhz1mr?=
 =?iso-8859-2?Q?WgzleVPXrQdFlJbPb3aBhVnaLTJTlU7bWHuaed1REFaQ//MkJjdHiPQi1x?=
 =?iso-8859-2?Q?SaLvAeV9VjpzqMTVmnyyJqf84TkN/k/8A2CenhpAs2aSDXiidTqcAz+qFb?=
 =?iso-8859-2?Q?qtSgsTsh7w2rAXGvWEXHOcAM6aVtGWOQ+AHSb+sw6wTgyql/rXhm2tDclA?=
 =?iso-8859-2?Q?58pulQ0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7353.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(8096899003); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?ZeuSBabrbO++gTZLqdIr8tGPfOQfbr3l4hXW0aPL8kwEJuvDk3x7yZ4ecb?=
 =?iso-8859-2?Q?3TpIGJiblQ1oHkaSe8yYPKdfMVhgWQihKFgjApAN8skneYlicSA+iwrD+J?=
 =?iso-8859-2?Q?4OEuxza/mMpTOeaCxzML0ZILmyRzTKp5N5mcltcKeEwB+Jy7E0UwC+O8xf?=
 =?iso-8859-2?Q?ZYuLfEV88TDWgy70iXbCH/5VSqfQP2ErB41OLM0+BAF5mGyEnOTZpmcJZr?=
 =?iso-8859-2?Q?2SggfgcvnczOseonjefx2gZ+NdrgFDTmLtLmjspWmh3i2+Q1lbXyZZG4t+?=
 =?iso-8859-2?Q?MdKfI2lXX7/8yjb0KIXODwneCO8/fYhraMJ67rk6cg+EuJEAvKx5aP9GPe?=
 =?iso-8859-2?Q?erkL+MPQLxQ6J1VaEzR9brg9ykUDH7i4ucGYOtnJtriwP5gFfFaP+3Wk1w?=
 =?iso-8859-2?Q?jhPYWf+6E0fqnQfWuWxJ0vQz+9TZsNU+rWIaLw+RFXV8AfE/+B/fxKRM5m?=
 =?iso-8859-2?Q?BX/obX8M3fo6Mo/u52m7dBpwULSaXtC6ixTr7TlTwcRtUktrdSloqWyHKp?=
 =?iso-8859-2?Q?FGo2AxOPJOY40MX4BJM6/3izd6oBj3HhJw+mO8Slu5dRw3a1SuJM15lHPf?=
 =?iso-8859-2?Q?7yB6JV1y7exc2QRzImpjG1+yZF/Qr0ydRCuPlSMgKGz8342xswSj3K9Gg6?=
 =?iso-8859-2?Q?eIXVpsPbTibOZZkVebJGP30tI6caZ2OIHnYNu9RSQziRem9RcQbHrlvYG/?=
 =?iso-8859-2?Q?f1/wv5ihLLqsvOkJnAZodJoNQrcSx7NTPruc990NgatbQWdii1JgEQwffy?=
 =?iso-8859-2?Q?cHEkyFdLfioIC6VovH+mVExp7Bd7ZglU63cmTRYznv8KdCYuKL6v/7vt74?=
 =?iso-8859-2?Q?gf4Y68y9Mwv8mXkXbt8c7FTxbe6+OLi/FZSdlynSMZtSTxJOEqKkTB7/ov?=
 =?iso-8859-2?Q?yFRhlX0ZFUGOuwDaTAlfCM8m4RAm08lpZJZkUlkmeO9lhwe1TD19dCMhQR?=
 =?iso-8859-2?Q?Z7dzHu/Mys5DXpAdKZomBh8+N+b0LrCk+CjwwQpeyPAYnF80VpgZuNRboF?=
 =?iso-8859-2?Q?qh305NmOlMC+wFU2k5332Ro28T1iojNo1mDLN4E9yH47QvJ0/qdy3xaIkG?=
 =?iso-8859-2?Q?piExhhH7Bwr/Ko1fFIFvqL5hXcnmel3jyIIjrNsPgLjt9AwihXskMwWXdz?=
 =?iso-8859-2?Q?o6OOFEWGpJ0XrjqUfgdlMolY9k7QJ0oYzLcEpE976Ws94BDoyVPhTJPJTC?=
 =?iso-8859-2?Q?nEZ75mLKO5NnExFiMz6/uxemStUquZWVguT4KCMTOdur+4aPqiIvpMyXOM?=
 =?iso-8859-2?Q?uGo369T9F1to2aJ3VUzpYNhhljbveLgJZf3IN8zD2eaPFL3THg/ql3SVg2?=
 =?iso-8859-2?Q?rBW4SVCUMqJ0IN5edA4OUsPSsnPCRY+vEVmUNKMBxWxIpI6sBSHoZvyQDg?=
 =?iso-8859-2?Q?X2kCT7xBlLwx/ZRRw6QQ80+YkA0waR789MCWDCA119gBaXM3UsMMrGK4A8?=
 =?iso-8859-2?Q?BGWNDOMCbg7aWLAAeiEasEKf2VXBNFw3wkYLnAel1HnD2n/UUHJKv+YwHj?=
 =?iso-8859-2?Q?PHTt25xg8WneONbFl8O1PvpGJ2aWkfOzO7s+BdjnLEEwcJpmG1NVBy1e1b?=
 =?iso-8859-2?Q?u1J5PJd1tkpISFySy59KtelWz3GOPUYNhVxcdBmNdYVQAyUx/1IGF0Sz0A?=
 =?iso-8859-2?Q?p0yoANjIAc4vUu0Xz9sfUzAZ6vv7pJV3NP?=
Content-Type: multipart/alternative;
 boundary="_000_IA0PR11MB73535A1B4DD6945AEDE7D5D1ED62AIA0PR11MB7353namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7353.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb09cef-59b3-4ed3-75bc-08dda206dd9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 18:54:12.8000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OPJeA0WNxRpe55xyarH2S9c7NxNwVkjIYBc3x/f1GIJ54tU9avJUrEyDUMOyd6gNMobDFS4dcuV8h/sN+e9s/VulOEU0v/InXfEdyyIZPOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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

--_000_IA0PR11MB73535A1B4DD6945AEDE7D5D1ED62AIA0PR11MB7353namp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

> As glib is not available in Android, added local stub header to build
> igt for Android.
>
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> ---
>  runner/executor.c | 4 ++++
>  runner/settings.h | 4 ++++
>  2 files changed, 8 insertions(+)

> Should you also add some NULL handling there?
For glib stub functions g_key_file_get_string, NULL handling is already in =
place.

Regards,
Jeevaka

>
> diff --git a/runner/executor.c b/runner/executor.c
> index 41f521e56..784d9eb5f 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1,7 +1,11 @@
>  #include <ctype.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  #ifdef __linux__
>  #include <linux/watchdog.h>
>  #endif
> diff --git a/runner/settings.h b/runner/settings.h
> index 1f0b85318..ccdc7281b 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -5,7 +5,11 @@
>  #include <stddef.h>
>  #include <sys/types.h>
>  #include <stdio.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>
>  #include "igt_list.h"
>  #include "igt_vec.h"
> --
> 2.49.0
>

--_000_IA0PR11MB73535A1B4DD6945AEDE7D5D1ED62AIA0PR11MB7353namp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt; As glib is not available in Android, added local stub header to build<=
br>
&gt; igt for Android.<br>
&gt;<br>
&gt; Signed-off-by: Jeevaka Prabu Badrappan &lt;jeevaka.badrappan@intel.com=
&gt;<br>
&gt; Acked-by: Zbigniew Kempczy=F1ski &lt;zbigniew.kempczynski@intel.com&gt=
;<br>
&gt; ---<br>
&gt;&nbsp; runner/executor.c | 4 ++++<br>
&gt;&nbsp; runner/settings.h | 4 ++++<br>
&gt;&nbsp; 2 files changed, 8 insertions(+)<br>
<br>
&gt; Should you also add some NULL handling there?<br>
For glib stub functions g_key_file_get_string, NULL handling is already in =
place.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
Regards,<br>
Jeevaka<br>
<br>
&gt;<br>
&gt; diff --git a/runner/executor.c b/runner/executor.c<br>
&gt; index 41f521e56..784d9eb5f 100644<br>
&gt; --- a/runner/executor.c<br>
&gt; +++ b/runner/executor.c<br>
&gt; @@ -1,7 +1,11 @@<br>
&gt;&nbsp; #include &lt;ctype.h&gt;<br>
&gt;&nbsp; #include &lt;errno.h&gt;<br>
&gt;&nbsp; #include &lt;fcntl.h&gt;<br>
&gt; +#ifdef ANDROID<br>
&gt; +#include &quot;android/glib.h&quot;<br>
&gt; +#else<br>
&gt;&nbsp; #include &lt;glib.h&gt;<br>
&gt; +#endif<br>
&gt;&nbsp; #ifdef __linux__<br>
&gt;&nbsp; #include &lt;linux/watchdog.h&gt;<br>
&gt;&nbsp; #endif<br>
&gt; diff --git a/runner/settings.h b/runner/settings.h<br>
&gt; index 1f0b85318..ccdc7281b 100644<br>
&gt; --- a/runner/settings.h<br>
&gt; +++ b/runner/settings.h<br>
&gt; @@ -5,7 +5,11 @@<br>
&gt;&nbsp; #include &lt;stddef.h&gt;<br>
&gt;&nbsp; #include &lt;sys/types.h&gt;<br>
&gt;&nbsp; #include &lt;stdio.h&gt;<br>
&gt; +#ifdef ANDROID<br>
&gt; +#include &quot;android/glib.h&quot;<br>
&gt; +#else<br>
&gt;&nbsp; #include &lt;glib.h&gt;<br>
&gt; +#endif<br>
&gt;&nbsp;<br>
&gt;&nbsp; #include &quot;igt_list.h&quot;<br>
&gt;&nbsp; #include &quot;igt_vec.h&quot;<br>
&gt; --<br>
&gt; 2.49.0<br>
&gt;<br>
</div>
</body>
</html>

--_000_IA0PR11MB73535A1B4DD6945AEDE7D5D1ED62AIA0PR11MB7353namp_--
