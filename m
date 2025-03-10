Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E700C282EC
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 17:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1CE10E4A3;
	Mon, 10 Mar 2025 17:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTjXARe5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B0310E4A3
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 17:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741628288; x=1773164288;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V6nZ32HFaZK2nEH5H0V21KceN1u0AvvwaXPs1MOqG5w=;
 b=QTjXARe54ek/Xe+3Yig7jzPItz/6WUZMthTgka9Xj/qWmx7qQjCJTeri
 siSEFYaq8nbeA+Ft12lknaBUsARmz61Il0nWt3E0BdZfjlCSt/QpF0DI/
 MxUREXtwzaHj1LuZLITo9S9ufjpa/caw3HEAuwzjESTR10gbfwzyDS/Rt
 LvDzznevURJol5BqtrxpTpFFDF7BuqR27ZKlu1yQ7+UqLPEJxecTg53ow
 ePEyRPet09A6enjSn2sQ8p5WYyu2FtbRKdyV6NcqCZRD9QhCuJmgmNOvH
 zXEUErS8g3Hq7iwUZYBxyMqnZPNgNm8QO7e4ERxrJW/E+ca/phClghXEq Q==;
X-CSE-ConnectionGUID: PRi1gQOVTSWO2H01SWytqw==
X-CSE-MsgGUID: op+dkumOT4qV/NLX8UOfTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42852567"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42852567"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:38:07 -0700
X-CSE-ConnectionGUID: REE1AGFgQiyxzWUjgL9LCA==
X-CSE-MsgGUID: 86XwbdiJQJCRSTloLL9f0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="120265537"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2025 10:38:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 10:38:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 10:38:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 10:38:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0FkNmBqaCrOfbhNUoIZIu34R5bNDJq1Lr0eOmGcPsxdeDWIO0KgNuM0OvF5Ap/9lbznBJVxSGKxwQ8UTuu2459WujbZq1NvCg+zowrK9yC4DXHgeLsLrWhPHAi9WWYa0HNUcL/RFq0Rq7bul/mO0kAAWSs1xej+9bu+B8wmw3jBWDbazhSBTsD20eRd62YStYrG7mbLNJ6ONwCcJDC8sop5otqklwZRBrrSEX2vOu+b7B9O+Gv3QqGLZ8+jFLYVh3868swuD+V43zKc9aAgkZkKDlq3IHLuZ2l8m6yTOUeaI4cpUHmYFcwGiyaRKXQb+oHogRglfrh30a3UClkeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jzEOEtVJzwc0h6l5fLxkd6FWTA1kl6xKgPCwJB8AAU=;
 b=U9mhfBahua982y9BBH5SPKdAqHT4tBvDYcdxHcMCLXtej+0Am/GJeu77jcNeh9wfNBmpsNwEpGthQKpmxMOhaoaZUPTHjXko0KqXCELkcvHe1r1J4qhF+ZZakY3Ee9RNWFNYWCvOH3xzaspbMAHp+fNhq2qOGRU8q3KwiTvEfwbZX0tFG5AzHyL/YacVMzt2k/I+59lERfNwNDR2lBbblSK1z5zwT42zFHT6cAzpp9bkPyQLc+SSgwaKxNQEGf0/iUVdJk7H7hPHsrIogAecaSc2lbZjBX4MAnsiknTO78d/58e2cs0an8jZWidVeXqGm8UdHpmktfDesKRzdTtJEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 17:37:49 +0000
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d]) by SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d%7]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 17:37:49 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>
Subject: RE: [PATCH v2 i-g-t 2/2] tests/intel/xe_drm_fdinfo: Fail
 basic_engine_utilization if no utilization data
Thread-Topic: [PATCH v2 i-g-t 2/2] tests/intel/xe_drm_fdinfo: Fail
 basic_engine_utilization if no utilization data
Thread-Index: AQHbjtKXjUTDZct90kKlFdGbOAB427NsqDgg
Date: Mon, 10 Mar 2025 17:37:48 +0000
Message-ID: <SJ0PR11MB6696C44040D3D0300C7FB9FBACD62@SJ0PR11MB6696.namprd11.prod.outlook.com>
References: <20250306200118.1771514-1-marcin.bernatowicz@linux.intel.com>
 <20250306200118.1771514-3-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250306200118.1771514-3-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6696:EE_|MN0PR11MB6302:EE_
x-ms-office365-filtering-correlation-id: c70db234-3753-43ee-1a22-08dd5ffa46c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?yYPU/GcsUSAWXTsApQ2LUZUghIVcSOy76blmduG/yLBkTPUfYquKveXBeNwe?=
 =?us-ascii?Q?2zFDyl2IZ81QHLSe5YsahaZskYudsuKGdtfZZFal2moIWLSdm43Mkq3n9qf7?=
 =?us-ascii?Q?uzOP8F6ygOA1XrLa/7QeI3P7dhd/VSfDsBjlxL9JqgGznIWPSzyfOX3gbHzL?=
 =?us-ascii?Q?OJVLXmAsY5CwTplqDHg/EkPBF2ip5uAuEAy1ctAMpEwjRQ9dGGw4LUio8/px?=
 =?us-ascii?Q?JlQrW95+wmgDZgaiVUeEQDlEfBZktMiej7M+3JrynJO1XtBjiq2uolsfxNqD?=
 =?us-ascii?Q?BAPrw1eWOFgRe23357rK+1tEQUSwy/5+gvbODETUm/oAdwY3R5fQvZucBqPa?=
 =?us-ascii?Q?rh/shAfTDuPxNSbVNRgo9LftJOoOgo6l6heDrQxtYfMnFZOvrlwMw9Tkl60n?=
 =?us-ascii?Q?kUnHQvV4o4XrAD1sOLQSBr7hKUPdf8Hl9pKfSmRAWtRdW/7LSooLqoWdUm2m?=
 =?us-ascii?Q?5P2vRXsWAnjBJXKK4wsVdeI4loCWSkNB255UmG0ohBeADuYxugLV8e+PPyMh?=
 =?us-ascii?Q?0eh6VrzFD971rvc0MXhterhE11QL2PwEDDXc5HoAoldcr4WdQhz6u/h6fWpm?=
 =?us-ascii?Q?a90r+vnwCBvewY3YBdGORL4QmJnkbTUHeDKhsrpcOdt35WiRO0Utz+bC1PUJ?=
 =?us-ascii?Q?iKWpIVn2AN5/4RAtG9Is4tU26YGLrXnqBeMP3bsFOfImw11jbbI5gsbXxpuA?=
 =?us-ascii?Q?A40kqa/Ngqyivrsr+8w9J6Y8x+0i/YZ8eTlztJp7h9C//WaK7OVOwV9w7YKg?=
 =?us-ascii?Q?QYRMO77c4dJgRBR209Tmt2yhJVo049i1z9Rircd11xEjykzG4ok6ve1r72R9?=
 =?us-ascii?Q?TPIdDyjtSbKY5h9WGMzIb83lD7J1cvxl646EEDEPAHlnAC501m14LQfOH2Cf?=
 =?us-ascii?Q?R8XsM1gmixfNNrs0i4faGsKw0UAAOZrJ2JCXl3P6gvKHs9RzpAnk2BVsKuvx?=
 =?us-ascii?Q?taHvDpUqQQYYSa+TY4g4EAVDtw8fNsvML9rzRJY5FJnA7EKD099uUWEu6APd?=
 =?us-ascii?Q?u//q9dI8G3nGd+MGhakO9IWTO6lFC5sEBDK0YmDXhL4o+zbes/ulzgONmyoT?=
 =?us-ascii?Q?ZICpuX9HV4cSVEkgSKIUOqvnQw9/hKtuoOXlxvEyf1sC7y2XqTMEtvt0RKAx?=
 =?us-ascii?Q?w5bP8vJT1RlLRM6jRZ0nQK1I7dYDRj1wOCNUEQtPC3OXVoevRjXI78gCX7Cx?=
 =?us-ascii?Q?NGtOIhVzb2AZtFyx4nUqzEK8b+p1Ru7R4mTF9PhAXfdLgprVhMWOGL3GL9Cr?=
 =?us-ascii?Q?8Lcg5q1iWrsTVuGwmO0X/gPw+J6tTRV1yjPWapbLHwfcKlciEtjeK8p0LfHb?=
 =?us-ascii?Q?HGgggrUGFMsHkjjG1ojaN8JhKr7nKf3R8mHZOU/xHEPMG6c6rEE8KSNPcYvq?=
 =?us-ascii?Q?J8uafG6S2ZKwbsJkuXDQOeuPDr+YLoBV61AWYDd8/yLCQfWRe5N6g6WHvZLE?=
 =?us-ascii?Q?HUWH/0J5QbTRnss2JXPNjZ/xkltC9Gtc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6696.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2mAu7h8Kn9Kq+apc4+lbi1VAwNJ37Om6LZ5gKhahSystT0qiyXzsMzZdZ0cf?=
 =?us-ascii?Q?zVp3xa55rbThTZCnHUl3qbDZFoC6mVxOEv/ZFXXhH+ogMp2oMSzGD+SKZ+Df?=
 =?us-ascii?Q?dX8XwvjMNA28W9oXAEhanOdtVszDR7r5ejDJiGz+iQS77bxGtN2w5o7WD1O4?=
 =?us-ascii?Q?Af/dUtyxO14IonwKZiXeC7H8ysax0aOtZR7q/02xkqL1ChkgYok/tGUz8A3Q?=
 =?us-ascii?Q?l0XVR5vGImuzKHYztiAwLVimdKvO7OwD5XHQAggxbNLqOi+Z0r+WyshNhXSF?=
 =?us-ascii?Q?f09BGDmsqF5aiKd9XXBQnIu53xr+jygH2A5uhcb5bOW8FrGVM8dInpaCdNst?=
 =?us-ascii?Q?4p5gnNvWC0I0fiyG2G0mzxIF05pWDmNhtqh0/t455LKOfYqoBSSAdEUlUCEE?=
 =?us-ascii?Q?aOwqlDmfVEwIZtjeYDLY0KViRvAVheis0mzR2ceeDv99EOnn6hc3l8YdhHeD?=
 =?us-ascii?Q?R2Me8xnBQgfyZw5Ahbc39UgRYr+A97aZlzzEiSRhw/oDwMFoLzrAcgR40VaH?=
 =?us-ascii?Q?tw2HTFbxz148H3lR5IRC2Jh8mbIbKPgEcF6CV2/VKC/+FeDHR7M/yv+A18zl?=
 =?us-ascii?Q?oeyC3HBMBWBx67tdNrBQQC26yXA31GDGtDJZY3sEoT6J5RSpdA94/Pl7iqFH?=
 =?us-ascii?Q?1etu1CU6Bssol4Y9LNPQ/iM2yVTGG5zxe8Fm4jz0Jw0LzQFCLcidcDmr8E1V?=
 =?us-ascii?Q?K3YzJqk3RIn3ehMVpZ1D1lDlmKagx3Iqz781q4MqiL+GuPvAlh6vXyCVVeDq?=
 =?us-ascii?Q?qei3BLugeq89Yiv1lZqDgdMeVHoQRwA/PocYw77V5UZJLazjOQWAM5vUwAW4?=
 =?us-ascii?Q?ewNGqkfQGJijqvAIplJyFgxSrQSyLKJQ/1k6n4DEwDQUv+n2aNgKehUSvjp9?=
 =?us-ascii?Q?eyh2pICcd59bZmVedlkFPEE5/yePZ8FZRbI9HJ6nmkiic7LxHfi1JZU3Ht/S?=
 =?us-ascii?Q?psx88nmymmBakmDgKSVhVq/2HJogUkur1leO0gkUZLM9dotvesshqAy8R1Ro?=
 =?us-ascii?Q?rup0O68i8Xj2L8ozVh7HdK9wLYztfr2GVd86OEu17ToU6sBE6HgFz5yMY33U?=
 =?us-ascii?Q?PkYtAE3ewdbXYdVQZZVpGY/zeq1AAlUr57yawBTWijrZDZgA0p38ykp4DeQO?=
 =?us-ascii?Q?gTKQwzoC6c/uhDze/WyO6BHsS+LyCMOiuOqvemx9ZAyz1c5ALTQLpgI41OQK?=
 =?us-ascii?Q?NMTeC77HK5JmAovmltE+EsrHsRSSYrSM48UDi1QWK441EugPv8LinF+q/fPB?=
 =?us-ascii?Q?zH7SdLd5IyVCd+KbOBF52J8Y4fNRhfXiGHcmHuJzOXb/pfCmyvo40mDypH5+?=
 =?us-ascii?Q?L2wMCcNRaq0tDKEKeqYRszK/7rBZCmQxSVenc2NV2Wsaybw3jrSxRWuRf5I1?=
 =?us-ascii?Q?+H1Nz931s7dhO//aFhf97TsT1+2HhoY1bPqTKm735Oo1lKYUnSlAPeXfTnqT?=
 =?us-ascii?Q?T5sAOe0LM9ATBPEBCrggyc2P6v6c/XF59x/OXWP45qFHW69/kBJk2fmAWjwM?=
 =?us-ascii?Q?I/t7aMkiZ4exL9CfXhSL7D0YR0yWdPIvII0VBmSIYKE2GmWE4mI1pwk8GBAs?=
 =?us-ascii?Q?qGurdp/eYKdNPufFzzjeGGpXmnZFrTPmUvqY9s9U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6696.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70db234-3753-43ee-1a22-08dd5ffa46c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 17:37:48.9896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCKmWVo4pMDbtfQ37xRNn3OyXBQAWaSVd30a79xqbJlv2koFvyMeGa4mOPAPh6Z+IuGWsVBUG7Pv/vvPyt4Og1iT8qO+qDvaUzovTF7c7EM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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

Hi Marcin,

LGTM,
Reviewed-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

-----Original Message-----
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>=20
Sent: Thursday, March 6, 2025 9:01 PM
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>; Kolakowski, Ja=
kub1 <jakub1.kolakowski@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.=
com>; Laguna, Lukasz <lukasz.laguna@intel.com>; Nerlige Ramappa, Umesh <ume=
sh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 i-g-t 2/2] tests/intel/xe_drm_fdinfo: Fail basic_engine_=
utilization if no utilization data

Replace igt_require with igt_assert to enforce that num_engines is nonzero =
rather than skipping the test. This ensures the test fails explicitly if en=
gine utilization data is missing.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c inde=
x f166b73d6..9a8811b4c 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -377,7 +377,7 @@ static void basic_engine_utilization(int xe)
 				   ARRAY_SIZE(engine_map), NULL, 0);
 	igt_assert_f(ret !=3D 0, "failed with err:%d\n", errno);
 	igt_assert(!strcmp(info.driver, "xe"));
-	igt_require(info.num_engines);
+	igt_assert(info.num_engines);
 }
=20
 static void
--
2.31.1

