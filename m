Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E2BC369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 16:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9C510E158;
	Thu, 24 Apr 2025 16:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzshlxRC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2FD10E158
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745512505; x=1777048505;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fe6u2/gk58LBynj9+zFlnVnoLBDwTwIw9uHt9ZmqUHw=;
 b=FzshlxRC8UeXk2O4v8XaIFlqMjzSG3VTwOXxoYHPW7j7rag/I9CJvKpP
 2i1UDCMy3dKE4YZUlBm24KiVQf/N0LMSreEVMEhIS1nFCW8qcj9KfIF8y
 TU/vMJztQGQZ3LmGPuNLT3nUsG2ZJ3prtlAdrLUX5+E578hlUX0SNho+B
 P2sw6YM7HfsCxFfNTHrAaNBaHhFA9NU3Gw2CLcjsTS7KDrra204YHSnn3
 /iFnfpyZdb1ppRWNNe69KNeUy12z5gXAUWMOgpbUOMAdhY0KTtslek0Ki
 Q+E9yjIzED/keZIqUsghVFbIvng8JpKj1eSxqoB+LTkZQSQw+Kuzl9Gf2 A==;
X-CSE-ConnectionGUID: hr5j4i8gRd6jwj8GGpivoQ==
X-CSE-MsgGUID: kVnbZqMYQougbnCfn9pNaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47071224"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="47071224"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 09:35:01 -0700
X-CSE-ConnectionGUID: G2Zt+KxkQ5qr5efKj0OyXw==
X-CSE-MsgGUID: d9e8/q4uRR6DVxJhQE1duQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="132554579"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 09:34:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 09:34:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 09:34:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 09:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnufkyixpEAo8Ee+gfP5y1W9x6vHZdtKPYyxfsx9Zo7KlcA+xmJMgZXyN3RzFnJKC9scHaAwfGi0X7wdk2I+zH0W86rmp8U2D+6fTGLP4vTt0aOl54NF3nhzv4ZW6/HoafNw+nEAF+H2etSHeqRrXsE45Vz7WoJD/Qm3gpcWTMmc0pFU94hUA6iF/3GOclV7QRY6SvyVWxQMCk6oI3dsFHkOU/3wFIq8sZJG1kzYL5GSQYal5qEtTtEQ3WxvGzK3vkKzYHd1+PYRO92GEKMG6UGX0KhK8arHE6ATuFAItjW7t0cemjQ9na/Qo3707CHo3d9G9CjQ1lwDPE7ojeu/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3cKb8RAnV5HCrch+FEUU42SfaifYxC8/EoqU9jgS4g=;
 b=H2l9sSxXCkHdJfujjV04M+VeINEoJNOGPCHVrDaYi3EPoU/aUHp9OCjOjY5ooyWId6RIPHTS9jCWUA6Yj70ofcC0KS4Y7SJb/N+tPNfhvmUuJ1tGeRlYovi2f43Vno5orMFCI6dtyxWm5hyonqU4Au5yfDpVJYe99vlkUL7wGTExGc4GOjfMdBzU9aJiz8LyOi9MHvvjwNIe9B+fLNZLlUUuVtCTLoMTwYnEuT5Q2YkrobsDVQMSAfcOzoTJd8CTc6LqRrK9HFRRRQxgQwF1BqECwPar9AhLMd3O+703nhHuAVSDLjaoKt/TkhXtvK+LB5X3NSO7XKC8+G6n6WZgDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 16:34:28 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 16:34:28 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 0/3] replace div64_u64_round_up() with DIV_ROUND_UP
Thread-Topic: [PATCH i-g-t 0/3] replace div64_u64_round_up() with DIV_ROUND_UP
Thread-Index: AQHbru0GQ1WIf9+G50u+Yf6Ccg1Ix7OzDykw
Date: Thu, 24 Apr 2025 16:34:28 +0000
Message-ID: <DM4PR11MB54562481A5C9DB36097C1562EA852@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250416163053.117425-1-shuicheng.lin@intel.com>
In-Reply-To: <20250416163053.117425-1-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB7512:EE_
x-ms-office365-filtering-correlation-id: d530167c-3eac-4b03-dcbf-08dd834de225
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gmNi0Q/9sXLgKEKv8JNXWSw6+isLH0Puk9kc2G4wAsI8wp0AMzKxwUJ7wRTV?=
 =?us-ascii?Q?5eGcoo+H4gxH6VUVDWEO2+eNSu24ZjIWGPNl7vb9LMOmmOeHxJsidHkFBjgg?=
 =?us-ascii?Q?JvvYAk+/kahT+gnEF0QG2dI/fscLxseg7uRp4v6nvXFLpcppqmuj8pSCVKhD?=
 =?us-ascii?Q?n2++D9FVftn0F7jExLJfD/z7Z0r6FZoRHJnwKcn1H/q8vQI/iu6dq6Oo9bxK?=
 =?us-ascii?Q?vATCYl/9jvBniC+q2bn0a9nCuZ5lmlcCGG0eJaHjmkbyltewoyBWM/h7Xo/4?=
 =?us-ascii?Q?A9bokjvk0gHYc7YelbAg5PiHMZg7ISQ7njlUT1fTaspBRhay9sP8BJaT+Yb4?=
 =?us-ascii?Q?c8/zCcd3C7iYkq8KPT4YXafsJSdVgNsKuURz4k4pZ289GihWRtr1zpSvQ4Tc?=
 =?us-ascii?Q?EA6F7a8gRzzaddErHP5cUw4aEruD4EMXDoQKY+KzMsQ3D3gX+ANF0QI96B8J?=
 =?us-ascii?Q?aD5BB9edh7xQ5imGagtH7fWIbkjc2KeIahUg7JwylDG7frNjaPuUJ/hs6IHC?=
 =?us-ascii?Q?yPd4n3wrTfyl/X2LmZXDfQJzOG4P+FoH37ESyTCmhR8KV4w+BMQpqORKp/Ep?=
 =?us-ascii?Q?UMWxXlbfSPmsjwr8O5RkbewP0205LbCaO1xxCXmQQrFGjSa/Ro8PwGgHCwgu?=
 =?us-ascii?Q?4k7NMe1zITqWsn2dTuZZ6tcqn3yspIwRGratUEmXnqltvLuKDaKnk5rZyf2I?=
 =?us-ascii?Q?skWymXAp8UxoH+Pzu01zI7yXeZo4NbrAx5O8NgI5R48iO1BPaf+b6YFQqxcP?=
 =?us-ascii?Q?8qLiOCiS5Z9wIxFqUvtH/t06TF8mL6oN3dp7ixqs45z55n2TSHMAe6qJ/5yI?=
 =?us-ascii?Q?f3ou4WkDk7UPsjdx3buStf+kiCVhTdCVPIdS58tGS75zXK04rd2JpGIAOWqQ?=
 =?us-ascii?Q?qWiOaehqHAtqem1h9knqmYVea5t8l1MO0c6BofAnxlkX6NVeYFV1sg8vgbaW?=
 =?us-ascii?Q?VUkdBcXQdkhGZFLCy/fcUFXRHKlFyE7Khnxie6NRR+OHub98qO30f06Ie4dD?=
 =?us-ascii?Q?qNoR3kyoXMKEZYslWG7iu3NH430zrYGz4mE9gzPmsR53E6GEP2dDmFoe9W78?=
 =?us-ascii?Q?0rrQ42pkiU8Bdzz4KXYSrdj0VTOKLrP5fVbF/WVeoUsEu8nEmCDGwZtnhaP0?=
 =?us-ascii?Q?RRzMUSlQK42NCKBoS6BpKqpgvqAKMjAhbHOib5ZfMcVK87qU5dyfQ+91jNbt?=
 =?us-ascii?Q?temy0rPf9N1verame5rvJDBOLF1Dd1GIF9UYvy0q1FJufdUt7Gg83Wv14fR8?=
 =?us-ascii?Q?2WkrAayU54g9qAbrSSdjOnSWJcsnBGB1vJP3NGZ4YpfnaNOIGkUWsrNcLJts?=
 =?us-ascii?Q?6XAwEGB0mJ1ihF67p/edKrpsRk3CZ+b4VQQc7Gc3/V0+6L1lcEYad5qo8NWg?=
 =?us-ascii?Q?n+I0D11tlc4vn2bkoa6PMbmpya+sQEzGdmYFIv+NgiqgWt0C2KqAxcQVGuaH?=
 =?us-ascii?Q?5NujGoxeXlux90LmjsJG01lio83mAY7OsjRjYKXDHVyJszY4+7Yncg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QGXXRObvcls+teJ+SY1NpX/exJPt/WyNphPxbRdtIeXY/ZPIS+ICKVTJaZ7D?=
 =?us-ascii?Q?kYC3XnsAWBicipf0peBY82OPFiKEiPX0mxYD8EMYR303BsPfwZnMFu7CdFc4?=
 =?us-ascii?Q?9k5NK3U1abLZdKprh6iCVrZCdW1C51Xxu2lhAJgrgQuDsWT5Uxj+0SsCiWmI?=
 =?us-ascii?Q?FY6bPln+LKsUttiWbpy0MySm88igUAgso8yJqORPmf3w96zu1v+BpiNA2vBH?=
 =?us-ascii?Q?NOvPgHJijitRIpofvpJ4HqiNV1pLLua1gi3aeu0ZsIhw6rTtXADJ6QVBSxfm?=
 =?us-ascii?Q?3Nvba9FwaaQfQwnoFvhrtAiMeBv90MF4wRDUV7PcgpR17CcUdNvlTqX7lmHz?=
 =?us-ascii?Q?HWQcX4KDdeQf8nUkdJJ5jMk7zZHUKqi7kouZneL48rObxLQrI4KFgW7lQvvD?=
 =?us-ascii?Q?6z7pA7GPCsf+IlQjIM1eTeChSgPxk4k4WkkEIcuaECadH+LY7CdYBLncbINc?=
 =?us-ascii?Q?gSGmOpGzfWYiHNTnajShXx8P0cPLP8RdRAgbzsPGslUe47PFLN7CGWMQO/Ct?=
 =?us-ascii?Q?a6TfjMT0BOLOeiRziC1/oGWjAUp0qqLvWsLmxYR4LB2pWQIrTwf5n9k299NC?=
 =?us-ascii?Q?cA5VhQBhkU6fsi14eWYKfbojDs2EKKDfNZvWc3fv8PXy2c387/naElpcw840?=
 =?us-ascii?Q?oT5fJDymo889QQztCkqtwZi3qu11YrWkMYJlPfxm1CAWxd0yQW12r0Eb0MNv?=
 =?us-ascii?Q?gjJvzG4CTvXVkS1X/2wUDJw7DJyLQODkR5i1X09iLC4voCn/4J9dR/JsmezF?=
 =?us-ascii?Q?HdvGcyWDspCpperSiCoScvW497FksqG/LUwmaHmCHSlsTriYt+2wHDj8iJPn?=
 =?us-ascii?Q?03cL6JRIk0xnqlAdCJe+OQi8/AeNXVvRcmXQiBN1rOkwDcSLKwDJBvhu7MbN?=
 =?us-ascii?Q?L21Opr4tYoKbEkQv6UjVutXRN0AgzLBiVDUyQxJYtGbbme0Y43NNxP+BRr7s?=
 =?us-ascii?Q?p08Sps0uUcCXQcFPuf6tfL2LCw7WArGsb1AR5AZpZeq89z3e/rWJQ9Qecl3H?=
 =?us-ascii?Q?Ew+/so8nxqlsoypzSDa+O8gnlL28JFwi2Sp1PDL/0pUrf0LSUhE1KQv6mzY+?=
 =?us-ascii?Q?uAXY5/EwN4rX0g0eKizR9uiFniXLh1KUyNuK+ImbaW+nEL8+9HsJYye0cnVl?=
 =?us-ascii?Q?NtFsW3q2tUjZXKjaJ+U7ah/PtpOd1nwligFgd6VvzJGJJqmEF8eqqx+9kyym?=
 =?us-ascii?Q?DBTr5x7/JemZXbV2fNJCydyCqwkcthP8jRag4dA+GBcvNofsMoF48odMt3kU?=
 =?us-ascii?Q?jtkjERXrMcn3z+Q+Y+5rxjoTcXRI6mI0xD/hms2elgmwEjwGmLJmyOux1QOA?=
 =?us-ascii?Q?1qZvFU/3/ca9DW3lAtxf38bKAySxtU4jEmhBUobSGFAHrva6BKOznGN8673f?=
 =?us-ascii?Q?+wX54NG9PkxnWhG+kBRFv3OvSCbapMbn+q3B8TvvlVgknJS6xcAx1/RyDp9D?=
 =?us-ascii?Q?xz4cs9eRWanfNN3OLwlqdXdaEdd5dI3Q7O45zuSTLkpmTmQskIpvISJeoFEY?=
 =?us-ascii?Q?r3+GJUUD+gzHSEzFEDHcFUZPfA72VGb+1m1+czFoo75H7awXnmWPGsed5yIW?=
 =?us-ascii?Q?EpGDuX6cAx6CHQrw27pJlKMOU+WlY8ufTWYiDEXy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d530167c-3eac-4b03-dcbf-08dd834de225
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 16:34:28.6023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cxtp5PrMGCWTuSBsmP5+r0ojwg6YzOW10VM1Q23HjEN/8c1wziQkl/kkc8DcF65sRN2Po8wsAMxNtcjrGa3qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
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

Hi,
Anyone could help review and comment on the series?
Thanks

Shuicheng

On Wed, April 16, 2025 9:31 AM Lin, Shuicheng wrote:
> DIV_ROUND_UP is defined in igt_aux.h with the same function as
> div64_u64_round_up().
>=20
> Shuicheng Lin (3):
>   tests/intel: replace div64_u64_round_up() with DIV_ROUND_UP
>   lib/xe: replace div64_u64_round_up() with DIV_ROUND_UP
>   benchmarks/gem_wsim: replace div64_u64_round_up() with
> DIV_ROUND_UP
>=20
>  benchmarks/gem_wsim.c           |  7 +------
>  lib/xe/xe_util.c                | 10 +---------
>  tests/intel/gem_exec_balancer.c |  9 ++-------
>  tests/intel/gem_exec_fair.c     | 11 +++--------
>  tests/intel/gem_exec_schedule.c |  9 ++-------
>  tests/intel/gem_watchdog.c      |  9 ++-------
>  6 files changed, 11 insertions(+), 44 deletions(-)
>=20
> --
> 2.25.1

