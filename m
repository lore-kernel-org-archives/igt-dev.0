Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128EFC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 08:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC39D10E874;
	Thu, 27 Mar 2025 08:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEW4gomX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFE410E874
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743063380; x=1774599380;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gHXUIfe+SeZWxYmllxqdgWxiHxVLXtz13vaSjMQuGaM=;
 b=YEW4gomXYdVa9egtjkjV17HVSJrtOjUNXU2kXTKlrwTjujK86XuTMlX2
 of3FrpF9QwvHrDWP9MT37INJ3rESfl6joyqgtgBpbxi041W6IYyxIXbol
 1w54LyqTMPWKsEhW+o3idXw4IAR6ieDB4eT59bzxxM9PsLDkoCcNa/cic
 X2v2djZYxaRLIpHPQHulVSzz3XMvYeteiBEQIDm9HgpjMDyVZ64RbeqtR
 MVKNBf6kK4LMgaT0GlS4p6bQcmoZIcDCP3SwghNPdvsaAAiHZA9w77vql
 eil9oZ+Qz5TxyKFV2nfjWKEU3CRC3M5zGT+5ZiEZVMR5P4HFCX4uAH3Zh g==;
X-CSE-ConnectionGUID: 58WHE7s0R/SgM7slLB1C5g==
X-CSE-MsgGUID: lI+D09/yS+SzfZswsfYFVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44484233"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="44484233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 01:16:19 -0700
X-CSE-ConnectionGUID: J+oeQD2tQW+upvZqxZuqtw==
X-CSE-MsgGUID: q6DWI3nHSauxaTxb6qwXNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="124830631"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 01:16:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 01:16:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 01:16:19 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 01:16:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbgnV9HdA9JLEbWAs55fMo3otemxCqpwNCHJEj1ERclM1XzMSqVHKuYSsxlV6FcXrY/XtTB98KeQ/e6SGzPsig1n5hz2xyj3KeE4QAxOu3hAz4+iDd6WTtg/wbJKqKP/oox1itCYtdl7cQgob2wgnf5/iuTVgfouH3dIdI/g/gsWJnISgwtvDbsfSV310SnRQHG5906XumcaRjFU8qz4cCVnF1zSDDG3SV5vc4FlESmjso1vc9KGsaq5KpJ+aSegi2yRaIXHie6D9uCYzBYoDGfvdRb480LGv6ItWazQLH7LvWlqq5RU023Ba74hyVIfAAUHMpKKVDVmk963Xu/Gww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60e3+jqkA9wVQMjq2fhosjLSScA4TX53AUvD/hLF5s0=;
 b=X+7yv5UqunSNzFK1xkedDrWMkn6EpmCbQ0UhXpmDhLH9nC3dbSDgVZ4I8ucLUozT1QgjfQPcBJ/q/lZzDjeCYAuJC7m5+vebMXcoDVySKPHZUwop8UMly2+1HskMooB3H/ybXvUsOSkDERAAxU1h8IBOsvTGbGTruJY846+TebH4xoIlguafXXjDXCn4bu4lbGEft+JrBcSAwkvjmmuAnV5hKwXdJby2oO6kDmUbUB3r1oRqbWGOeprGHB3fBGDyJKO6bHwWrqqx9TyuOAq0unwqFYcuTSEhk28pj5bLWF7yPfRNM06aCVLxqX5oiO4ndvFuUGH8dcud0fvbOpBQGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:15:35 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:15:35 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH 1/1] Added tests to handle error string conditions in
 xe_sysfs_scheduler.c
Thread-Topic: [PATCH 1/1] Added tests to handle error string conditions in
 xe_sysfs_scheduler.c
Thread-Index: AQHbnntD/ZOF41TNLE+8hoCOywwyw7OGlkeQ
Date: Thu, 27 Mar 2025 08:15:35 +0000
Message-ID: <DS0PR11MB7264DD43F8D5B99A837E3FA0D9A12@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250326180312.1808192-1-sobin.thomas@intel.com>
 <20250326180312.1808192-2-sobin.thomas@intel.com>
In-Reply-To: <20250326180312.1808192-2-sobin.thomas@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH7PR11MB7122:EE_
x-ms-office365-filtering-correlation-id: 4af139c2-e31d-46ab-ea37-08dd6d078ce6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PVIdA9ZwCLUPsyNa/oIpAMXWU6FR4U8yOj3xW9i+ygKo7AFebyO4J1SXg+no?=
 =?us-ascii?Q?k2LzG7nd6lFWOxQPHFbznaJFofg7bdV+CWZXfsmgA/0AdgS7hsoI2iufTzuk?=
 =?us-ascii?Q?Olfk7V6QPt0+ifZ9H2HnrRhFOtLdtEcVvE7WFYSjtqDrwLAEnLJgA/OEl+eK?=
 =?us-ascii?Q?YeCCBjeGch5htrC3OIMwPuD2NLyxmjrRw+mBY9Jipx/RApyjYXdlBVl2jHGw?=
 =?us-ascii?Q?PbIhgTgAwj2L/PCEZqfjCk8IiN0zU7iJI9PbVLZIxX4vC3s0CXCPLHWpCF7o?=
 =?us-ascii?Q?Mc3tiX8J4XMsSUlSZJ5JffpRejhPHV1dQCVRUjf7oB2lxY6ENCvrtADizStQ?=
 =?us-ascii?Q?TRVyENGIuRMI7thAm0RE/vq1el92sDsHs4dJz4blv90UHMWK0pTtSO751RgI?=
 =?us-ascii?Q?3WElB//4JElRVsUPlNejWXo2divtZ4UKPehMN5k4Z5dv5gwr6yTSwxrA/6jS?=
 =?us-ascii?Q?oxvj9N/xn9WVOldUZbLQ3mzNbSZ3zX1tPSdlE6V8oGwBqR+vtBBqThUOJx0V?=
 =?us-ascii?Q?HXqH+OczvzbAXqsP9O4nWHkpogfrgLfp6kPCcSlP8TodKPwULud4sYj7baCa?=
 =?us-ascii?Q?yJp8cvzIxDoMjG7EEWFC+wPGDazG7C912ZXOdRmsneSONT7cGgwxWhGHKqXW?=
 =?us-ascii?Q?lt38UO14UF9COZUUgylvjG8zF9vfYBZxOxxiBaLsyERHRe3IEQ4inkNAP9Ku?=
 =?us-ascii?Q?mfXHp6BkcwMPr1h8Ph2wfbsZsGl5Fz4wzLePfJ2aI8ISTj+PbUmCvOSwhAoT?=
 =?us-ascii?Q?VtrknyIKdAo8YoFI3FzWykLTMbTnxtlf+bMjwMIZHo0HOG/R3hxVJHeAS95Q?=
 =?us-ascii?Q?viSh8hC+fr1HomsGh/gaxscnK0oRfx4weIOqJk9vo/fz+aaG/3tUZLPrOyHV?=
 =?us-ascii?Q?4cR0uY9tF/1LZ13IDUe30c5wbVbth44TpmW6q0c04qZJyUQhR7kuc4Zfq2Sw?=
 =?us-ascii?Q?Y8thJQ+YYyMYhbVQIOXmHlq3BA3tckddWG+a+9PGctrhA5VDLYetYsr0UhIB?=
 =?us-ascii?Q?y3lK5/UyK66YXAQHbxR5+hgbUfunoP5+W/8OrogiI3DzpyBN78d0X61rJFxf?=
 =?us-ascii?Q?p4ogiNGSRmh2fbAXz2U+KZ6EDTWdR+8DNtkBFFe2kXIWfrbGl4fXUtIQoaC5?=
 =?us-ascii?Q?RVtmvz5qfRabWlECXW8HfIbjFBxm1Ad5AQ8J9CPSKMAUrfoCd1sG72YBXgU5?=
 =?us-ascii?Q?Y5UzmfeQcajOpt0iRUTK4A2izguzOoRquccWQt03NIAK0HaT4d0N2lYoHnL9?=
 =?us-ascii?Q?FiJolUiP/1eY+Jf6HyEr/hm6N1Xe3RtpPjODmMNqSyDhEw3N90CLkKrKpSP7?=
 =?us-ascii?Q?XpWT4upKfIgpXHvFN0qDiJWQawgHbMAl/IjLn1+NGp9ld7TjkLaKALK9YO2Q?=
 =?us-ascii?Q?yeY3Z3Ik75aQ3m9T+MZMg7QyKpUij0qqlTsZUoaiEvgrj+S/smI3kD7LT9Te?=
 =?us-ascii?Q?aKSTXVtlMmY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i0m3HlvYXylBJZx+canN128TL8sIAcmpXRiQpq10Psnc0InlcU0Gql3nd+3v?=
 =?us-ascii?Q?EV5Azy92hyiZWlB8azTCW0HkhfJJYkTAFvrTTN0mNuLUQrGhoiOiVWZ7h5gx?=
 =?us-ascii?Q?edWZlqBmaVX9x70gYEqaETTBius9o1k27Uv3kgDFpy9+Pc8PohakVTnRplLC?=
 =?us-ascii?Q?GfVdZlTR4SG59YaCswNzB3WEkfgKnmKhD7vNzPKkbSfdtsN5Y1HHa6SjQCYf?=
 =?us-ascii?Q?jLP1ximxHz35QqaJ3Kfad7bsYCKHdXS3ksYe62PNIzs2j8OzdGE6qfsfVbg9?=
 =?us-ascii?Q?hML2t6BzgVGmTeoLyriHIdszaCumFbqvGE+jGj9uG+r/2PH6QZiVA4TMXoEV?=
 =?us-ascii?Q?y3VIyODVvaQTsWSsJca3vVhJsiXpoGFWPdrSvHW6i1UVJsjDbC6842nUCRlV?=
 =?us-ascii?Q?wWFHT/iL1m8KenO/JTSHlna3F80Qc6hHdWXtvtxp+o9B8GbUKGPE29o56bB1?=
 =?us-ascii?Q?bygXOf8MOAbXFgwT5fDAeeovNg0X8cicIQ1XlPtiHs6cnhTqJL+oeGexazQS?=
 =?us-ascii?Q?n2icLbdM49TSmwoq24jNbwFVhNjsalTBk7dMQ4dQbV+MgEcLSrv+2qJQVrQz?=
 =?us-ascii?Q?zv6IEo8Y0XY/3l2qtuXxVohsmXdQt/cL3p7mxbcnrP6UAoy9uRfEXrsFayob?=
 =?us-ascii?Q?JXEL2ZmwyJyjpVHBfbKSXjYnDQjKejg+Wq4a6ADy3LY+ls6c81FFdarC4igt?=
 =?us-ascii?Q?i+mP8iOLJAQHnyY5NLpYtDsbsw2J/7wfaTSWYLJuwP0merl+HvvRI4WwZ2gF?=
 =?us-ascii?Q?2nkV2AghCQ3nktS9rK+VDeE0KxAYpfzVtMyYFMoXLVE5NcK1TD5J+T/7ZFdt?=
 =?us-ascii?Q?xSmzxnIAKLh00esmPH1hpfh9YVs8kF2gqmMIfthvlv8Xol/KKhnc7pisVK5e?=
 =?us-ascii?Q?zu8zdTiuaWweU/tDJdLQDaHcMenjc24q+s6vHYS8YnekF8CKMbBIM+KF0s3Z?=
 =?us-ascii?Q?pI30ti3MC5mWIjWri3/VCISSUfYVNtrHLZKlxmoX12gS4yhwbngtperUAi3z?=
 =?us-ascii?Q?2B4IHIuim6MfyA/Fa9XLhmqucz1yLOWMp4pYRNGQOzxRouoEYbAVeLHK4SW1?=
 =?us-ascii?Q?OOdhDsI2QQFoaio/oZnwZ068yKdlXi7V8TItkOuUbVMI2PypgBsJTn0jAY5+?=
 =?us-ascii?Q?Qc91xmk6m9H7B+8lPpqi/LLX16sCGwz0ugOpiTmA0c6iyYAOuoVpQSyrPvCN?=
 =?us-ascii?Q?pvsQ0yB6acRuzkYd7yA85CcTDefraYnLGXvt6Sc9e46jiYgUkfG7vwoF4DK9?=
 =?us-ascii?Q?UasJuB6sLMAZE+ypFfw0OEU25GPI3+G7AEKtmfkfZBYNNXGjWCRU0QTmF5Ng?=
 =?us-ascii?Q?dG1dgv9Y3co4/pTTRHzh+kfQ45w8RsX1G1g8Z+dTdHbNakb7Z2sRtJ4zlwEy?=
 =?us-ascii?Q?+IfwwAnOlMxEx/aZdPNBGOknaAiJIW4Q1NHg+W0lDRX3fwhLOPrHH1mNF2Cs?=
 =?us-ascii?Q?FQkuXn7y7RjqwCEGZTjOBVcO9BzdnT9KMS1LiFC5S+Ysgl4f6NpAgXPznffT?=
 =?us-ascii?Q?3nA5r9UP4OLu3VPRWTaMyBnfmtq/yCWYUey85IDHjLD1itlQaPkVpvR4Do0o?=
 =?us-ascii?Q?kkFJ05lDz/iPhOR3dYdDrgPrH96TSs6kUlI2SlRuPzDIpMu1/2frRzwSJxWf?=
 =?us-ascii?Q?mQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af139c2-e31d-46ab-ea37-08dd6d078ce6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 08:15:35.2460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJwGaGxiyKJQw8NdJOXilOC++e0zA9QW/eMKFIEv1HUB1+6CCGMcY/OYjo2DlYkgxb2HF7w63HrDYWqFQhb/z9q1aHAfzaDHjLI0VhNIikvUJj6tYYfiQXIn3xm1ofZk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
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

Hi Sobin,

> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: Wednesday, March 26, 2025 7:03 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Konieczny, Kamil <kamil.konieczny@intel.com>; Piatkowski, Dominik Kar=
ol
> <dominik.karol.piatkowski@intel.com>
> Subject: [PATCH 1/1] Added tests to handle error string conditions in
> xe_sysfs_scheduler.c

Just like in cover letter, please fix the subject for future submissions.

>=20
> From: "Thomas, Sobin" <sobin.thomas@intel.com>

"From" field shouldn't be here.

The patch is missing commit description. Please fix it.

>=20
> Signed-off-by: Thomas, Sobin <sobin.thomas@intel.com>

I believe the formatting we use for name and surname inside tags is "Sobin =
Thomas".

> ---
>  tests/intel/xe_sysfs_scheduler.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_sche=
duler.c
> index 4fc764f82..a0eaad5ab 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -10,6 +10,11 @@
>   * Sub-category: SysMan tests
>   * Functionality: scheduler control interface
>   *
> + * SUBTEST: %s-invalid-string
> + * Description: Test to check if %s arg[1] schedule parameter checks for
> + * min max values.

You need to indent this line, or build will fail.

> + * Test category: Negative string test
> + *
>   * SUBTEST: %s-invalid
>   * Description: Test to check if %s arg[1] schedule parameter rejects an=
y
>   *		unrepresentable intervals.
> @@ -121,6 +126,23 @@ static void test_min_max(int xe, int engine, const
> char **property,
>  	igt_assert_eq(set, default_max);
>  }
>=20
> +static void test_invalid_string(int xe, int engine, const char **propert=
y,
> +                         uint16_t class, int gt)

Please use tabs to indent code where possible (unless it's less than one ta=
b worth of spaces after tabs for correct alignment).

> +{
> +	unsigned int saved, set;
> +	char invalid_input[] =3D "999abc"; //Intentionally passing wrong string

I think this comment is redundant.

> +
> +	for(int i=3D0;i<3;i++) {

There are missing spaces inside this statement. Please format it.

> +		igt_assert(igt_sysfs_scanf(engine,property[i],"%u",&saved) =3D=3D
> 1);

Same here.

> +		igt_info("Initial %s:%u\n",property[i],saved);

And here.

> +		igt_sysfs_printf(engine, property[i], "%s", invalid_input);
> +		igt_sysfs_scanf(engine,property[i],"%u",&set);

And here.

> +		igt_assert_eq(set,saved);

And here.

> +		igt_info("Property %s correctly rejected input
> %s\n",property[i],invalid_input);

And here.

Also, it would be a good idea to check return values of igt_sysfs_printf/ig=
t_sysfs_scanf, for example checking if igt_sysfs_printf failed (returned ne=
gative value) - as I assume we expect it to fail. If second igt_sysfs_scanf=
 fails, and we won't know about it, we will deal with uninitialized values,=
 and that will be a headache of its own.

Thanks,
Dominik Karol

> +	}
> +}
> +
> +
>  #define MAX_GTS 8
>  igt_main
>  {
> @@ -130,6 +152,7 @@ igt_main
>  	} tests[] =3D {
>  		{ "invalid", test_invalid },
>  		{ "min-max", test_min_max },
> +		{ "invalid-string", test_invalid_string },
>  		{ }
>  	};
>=20
> --
> 2.34.1

