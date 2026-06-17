Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60CECD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 04:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2BE10E91A;
	Wed, 17 Jun 2026 04:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6jrac7b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9600E10E919
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 04:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781669483; x=1813205483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3EHZS5hpzntiIyjE6cxlWrkrwrj+ajBFBjB2UGrC43k=;
 b=h6jrac7b0WDbgg7vN0LNZ5NpsPHoA0UYu05N6hs/T7bi1fAOS34qfipa
 JNoEcSsNTeTbe0A376AZql1s+ri1WMXKFPtz8ZUQx50It/0tXTXfoVezj
 31ohuXrbltCXIIvQ83GvjSAPGiaCp1i0S36jMjUyV2Js2bsIDSlO5iRVw
 ii4fyttYjL6c8bovPdCRrngngMi4xp1DaKYEN7rKXNRlKXV68Z1nYYmqX
 Zsff1gBD09tcrS1psCe9M4f67kyfwN9c9K3Xh+kht08GVfZ/ImiSwHYSp
 hrWcrT2mIXgRroIkIsHhgE3TsnGed3jOijifGaGCgsU6jZNNvBCEo0+Ey A==;
X-CSE-ConnectionGUID: Z2HyFT8MSyaalvx5htfLxA==
X-CSE-MsgGUID: LuItHr9FRjOf0k5/jvH9LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86378915"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="86378915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 21:11:22 -0700
X-CSE-ConnectionGUID: O/7yLA8JRFmHKAp4p3x0lQ==
X-CSE-MsgGUID: cRMx8lzNQwGYk9Cnh7KNmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="241597406"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 21:11:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 21:11:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 21:11:21 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 21:11:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZohwHhXSP2horFSgc49+CDJ2WfcnWxvgskxJD6c9G5LxDwqwVhd0MZ0KsbXZNmiqu6XHZ86I1M79TaWnv62xUkIjhjbCKg/oXPmMrECOBOXicHCurBKYrrwA+awFq0KadIo7T3aPHw7K1gU5K/hpv+KUNkeEzjg312Uwkplr+dFjXXBPdaxXqKqH75Yo6rryAF15IQkeKRPqb8Id4idFfwijqd1c3SeoFWi4gjGQ1jIhbJP5JVgS4tGhM3bIOl2/VTJn5dpL5AV31h6qx/pnFc1qoHK08P4eKGp7WrkD/uIuAD8za6wKX/VhWZ19G1XOZvEsEwjS/SHpcWwfXUQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orS0vSLR4JZ8Y51XAizcG0l4zyrx7nnAXp/MfXnZlHY=;
 b=bruaamJkPpNfcjBhiOJa2jm+L2WIoBTrZktyLbNatT7+ifeAglEXQJvPDAKXQcwHZ5deFwt/mGFuRJhs+jMhd2zCs2nPjGb0g4iSFr3gQS5xv3vcudY2neGthfUpMShfkAyM75m8RW5Dx5vyICNgqq5jojy3fb6IcPcGJzmgDgvsS/2uoduXvxv3cvtgDT0zwh8KmZ8zi0l04IzF3Izo6jLLD4BGdmhKuHSPAfAYeNuIqxEcRr47ed7m/+xa5OYxQRBJzIzex+h+ZB1xfxS5BLe9rdYfDl9CLkhp+qHvHFAtIObK2RWrC4hM3CMpyZeqKDehmwKPcPQADs6+xeQTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SN7PR11MB6798.namprd11.prod.outlook.com (2603:10b6:806:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:11:18 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 04:11:18 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel: Skip multi-queue tests when no
 engine supports it
Thread-Topic: [PATCH i-g-t v2] tests/intel: Skip multi-queue tests when no
 engine supports it
Thread-Index: AQHc/N0zRr/eLHiflUS/mj8dWZaJaLZCJNcg
Date: Wed, 17 Jun 2026 04:11:18 +0000
Message-ID: <CH3PR11MB84341AB1D8165ECFF67CDF5B8DE42@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260615153926.2094688-1-shuicheng.lin@intel.com>
In-Reply-To: <20260615153926.2094688-1-shuicheng.lin@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SN7PR11MB6798:EE_
x-ms-office365-filtering-correlation-id: 0ae9b9bd-0f7d-40aa-b32f-08decc267ba1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|56012099006|11063799006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: G+EYkLKv9OVV0uU+YN/BeXckMSEgcRinI1hWY1ia9XTxrciri1KX5XMsz6t7NPZ55p+quROJo5FXFRGVBKT/VCnZgX/VpxKZe303MJhtVsO1HhOANXdS0mtP5yNxZ1phC8SByjPhu0J2Rg4yXDgM1lNVngXO3Xlgiljc0ZCqjTMPL72koNVXsLD6QXGoAnmCd8sJMuNfDTHbipb8Yqx4djsZXnnvZop89MRDDTQ9rIuq8+4AWy1nCBk3w32Q3uoDRpinNsKf/AdTEeEYv3gGe6ya0S81z/MvRN4pnoh8udhTV8Qkxe4low4Szsb1z42ILnoGtTndVzgzuMCI0osTqDf5pH3n6LuXC6emkE1/JgdSLatDSyJLs/GnT8WuFDEZUwFevDwAGtSVSGA4br4E+TLrwM8Z3GtHbY0h6BMcQsFiyVCoLV/jZx6ooXXqoSKvAdzVg9RC44GDkI9mjJa6Ax7KfEQKNmbJXibU+7S2tOqPqbICD17i2HDjLSqWSZUy6qeuHS/h/r2VilnSYk+n4ETu7fCzp2SbNmd+7kgw+VtjtSZcS/DMP5VueKCxgVb6lKvvAwvo9RPXLJekcyhVZlLQbENlHbypf0AamLRdFymBsFMaHMym5aZLPAhqMtNEqpgg5xHe0LbqVOlX+LsaE+/FbmU/h/Ov5Fv183reHUIa0iYqmhEn6FDR6NymNj0fG96RTusRo9GaCcxLoVrLuYujG14YqJOa1XKZkRiTQdxZ3Rnm/5vhPmjRzFdCxtpg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(11063799006)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0UW1RlxqXETTuTeZOWvk9b+TkYDuYdrup2872OJJQxYzu/KJ9OcqCelPEy7g?=
 =?us-ascii?Q?LFHmgX+BKpw5HSRQiicx/VMDVW87H3JdDU3XlSX1RqyK5fHMnz38GoumzEoW?=
 =?us-ascii?Q?88WMjvBDZTMvk3RPK0F7bFBNSJZ/9x1geYU4522C9qfTmqiYm86SDO3Z77CU?=
 =?us-ascii?Q?b9DBCLR8pg6XGHRbpvo6LV3Vh3itaUZmqdyxxUUF1lSIYRiScvsy/Ko2BQo7?=
 =?us-ascii?Q?Z+Pbjw8h9vIMbbNbWp+OmTVbNgvqTL1BqBLzC96fkTnLDLg0K56cD9VeZRmF?=
 =?us-ascii?Q?X4kBKwwN/fg0ovNgL/AfPKk1H7zFTC46SwQiKC7zFC7vsA5AHj6NBSzlTX4D?=
 =?us-ascii?Q?WR2qYug+iYENdaE7gg7t5cG3alji/cYSxTcnWV5wrg7qAKk7xNXgfVmJaLxs?=
 =?us-ascii?Q?yRjaUbbt4iiSEkpErZw6sqm9Mvm/6J1GCWW9J4c9UhNPfVH/1APAgAwdUI+X?=
 =?us-ascii?Q?wo/mvGQ1sK18Murgu6m18/yW9mdLG0outUTyOEvY17I/9ux2j3RmDYZewMz7?=
 =?us-ascii?Q?SyZvPAT4HkO84YRydNsAZXWjl8Z35OZNj79+A6KppNCTqZelK9bwG8fPOHyx?=
 =?us-ascii?Q?YQKtVMY51+Gdmk4JPm/fi/0+YYRnQpS/24Zo/ymu7J4GkYg1o/CgMk9Qs5u1?=
 =?us-ascii?Q?P1Wqraw/4z+URy5YUbhPKg/gjg+Ob263csHQbU4hKp8GMCgDSmkia658VXq9?=
 =?us-ascii?Q?E+sGmo0CxQYtO5f7Fm/09kvp7DgGYXcfr5kER3pt4tggH0Ieu8EM9bjgGwwI?=
 =?us-ascii?Q?J6leZXK10FtuIrKLA7ddVmZKeAH3oNaUV4xTkg+Bf1kN5v+opEAQHsJmLNx+?=
 =?us-ascii?Q?gxIrOpnPuf3zENX5/s0cJY9gI44WDQS9NoxHzm8KcVsyuwlzCHmlKvzqMLZ0?=
 =?us-ascii?Q?a9QYBS+PhGhKs2sWBQ6H1fkKZRIOkLbDJtP6JHVSMNCipEY/q2/HDSvjy8rR?=
 =?us-ascii?Q?2xf5NZHVzmfnTZGFZu/Oxb09cgN8Ka8ii9O8nv2lxu+8P0ztgH04L2iNICLP?=
 =?us-ascii?Q?da47hfeRJdGQg3zYEsgjaAXxa+8rafFAMgSF5a8gFnVpbwl7SNvXqZMGoePs?=
 =?us-ascii?Q?ayfl/WQj1nkw9IdeL9NQy9ea+7kDt40BYP7DhqYR8Jc6hkE5qR09gUDf8oJk?=
 =?us-ascii?Q?J8GNpqJ3Nd29u6Hq5d3cr/Q49gO194jN860U5qOr9NAtZocZdrLEnkSqaQiJ?=
 =?us-ascii?Q?6zKzJp3y7jssqh43Hu466qiIyyXYP0jMRi3IlxbC2UN3Nj12Jaj3oAIawJ2/?=
 =?us-ascii?Q?0yMO5YKvg3Bbp019sZodGRTZXPJeWAkLKC1DfAzjeT1onLeEJJZ2dIdE4SG+?=
 =?us-ascii?Q?5OcZ6+HNVXLCoqliTtRWMDv0+7gU05mkqDMKGINXhMp9mjeFjAQgBellqEOy?=
 =?us-ascii?Q?SvR5V05+Roh6eSYgW622taQJS6F5QMyPlT2OW3MOZEaiV2JogVstL+q/TpXj?=
 =?us-ascii?Q?4XR/A4vKdZXGVA0qRDPxrO6S2bGbVlW87qRImNb6fnJ2x2HTxJv0I21aLrLt?=
 =?us-ascii?Q?0rQselFE6LYWI+qfqSREw23hoSqs6Dyo2/DkrLvi6NUl0pW1KIFHwwdUpqyF?=
 =?us-ascii?Q?Ovbk22sZV7rls30asWuho73EE5onJbXu5tyk6U7v/cynCwiTpxKaSQNXeFXJ?=
 =?us-ascii?Q?IifvI+q39yGx2TPzfd9bjugF0rwl4IIHzKAk/KGHsYjhIdM7W7jLHtDR7d7w?=
 =?us-ascii?Q?4rgHylFUeY6IsTmGMNFRO1YJureD0L243VYObonH9qEeC8tEcIWAXt4EpQVl?=
 =?us-ascii?Q?TJ+WOpUm/S7zSIvw9QfiGP4zw1+Aio8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hsd4tT2RXiS7cAzE7HGL3fhBu0dSzd9DeLd3tPeEDxZeX7PQ1Hf1EovVOvkaXPYEnBwuyXmeUMs0HRFBfjdHePIXuU/lfR2f642gjxfozinp2VqIpnU9OiuIGzYUMzaOYBoGAa/+e3uHI9ka6q/vZwebMYEs9/jqspT+5TJDZHY7iT8givWMjSRI0jEYyNUryyJby8ayG7VLfvL6KfvCtEyTc7uiS+KN7Fl7j3ktrjMHw9Z0wDUpYYItyrTOvfe1YbM7O+Xg/WWwBMRJFqBuowkr1WMyPkpSR265T7KlmVvUIQ+EHejl2gHQUMdM5pNkdrvJIeWiBTTFXhnrQvWN9A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae9b9bd-0f7d-40aa-b32f-08decc267ba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 04:11:18.4314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhLXV1v7TrQRZ8h90ykCKLmJhYuDNFR8fL7FEULiAwqvz5YF9iejlkdDrGdGjRJk6a9s4/AWz8YIquAWKduLc1a7BlzoFYOkSs/In2o4qHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6798
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
> From: Lin, Shuicheng <shuicheng.lin@intel.com>
> Sent: 15 June 2026 09:09 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; Sokolowski, Jan
> <jan.sokolowski@intel.com>
> Subject: [PATCH i-g-t v2] tests/intel: Skip multi-queue tests when no eng=
ine
> supports it
>=20
> When no engine supports multi-queue, xe_for_each_multi_queue_engine()
> iterates zero times, causing subtests to report SUCCESS without executing=
 any
> test logic.
>=20
> Add xe_has_multi_queue_engine() helper and use it as an igt_require() gua=
rd
> in all multi-queue subtests so they properly report SKIP on hardware with=
out
> multi-queue support.
>=20
> v2: combine 2 igt_require into 1.
>=20
> Suggested-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>  lib/xe/xe_query.c                 | 20 +++++++++++++++++++
>  lib/xe/xe_query.h                 |  1 +
>  tests/intel/xe_evict.c            |  6 +++---
>  tests/intel/xe_exec_fault_mode.c  |  2 +-  tests/intel/xe_exec_multi_que=
ue.c |
> 2 +-
>  tests/intel/xe_exec_reset.c       | 32 +++++++++++++++++--------------
>  tests/intel/xe_exec_threads.c     |  2 +-
>  7 files changed, 45 insertions(+), 20 deletions(-)
>=20
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c index 3286a3b37..f0799=
f268
> 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -346,6 +346,26 @@ bool xe_engine_class_supports_multi_queue(int fd,
> uint32_t engine_class)
>  	}
>  }
>=20
> +/**
> + * xe_has_multi_queue_engine:
> + * @fd: xe device fd
> + *
> + * Returns true if any engine supports multi queue, false otherwise.
> + */
> +bool xe_has_multi_queue_engine(int fd)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	/* Multi-queue is supported only on IP version 35 and above */
> +	if (intel_graphics_ver(intel_get_drm_devid(fd)) < IP_VER(35, 0))
> +		return false;
> +
> +	xe_for_each_multi_queue_engine(fd, hwe)
> +		return true;
> +
> +	return false;
> +}
> +
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  static void xe_device_free(struct xe_device *xe_dev)  {
>  	free(xe_dev->config);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index 8815c6c66..9f04a=
7422
> 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -163,6 +163,7 @@ uint16_t xe_dev_id(int fd);  int xe_supports_faults(i=
nt
> fd);  bool xe_engine_class_supports_multi_queue(int fd, uint32_t
> engine_class);  bool xe_engine_class_supports_multi_lrc(int fd, uint32_t
> engine_class);
> +bool xe_has_multi_queue_engine(int fd);
>  const char *xe_engine_class_string(uint32_t engine_class);  const char
> *xe_engine_class_short_string(uint32_t engine_class);  bool
> xe_has_engine_class(int fd, uint16_t engine_class); diff --git
> a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c index 82a6cde0a..3f1d6c=
b9c
> 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -902,7 +902,7 @@ int igt_main()
>=20
>  			igt_debug("Max working set %d n_execs %d\n", ws, s-
> >n_execs);
>  			if (s->flags & MULTI_QUEUE) {
> -
> 	igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D IP_VER(35,
> 0));
> +				igt_require(xe_has_multi_queue_engine(fd));
>  				igt_require(multi_queue_hwe !=3D NULL);
>  				igt_assert_f(!(s->flags & MULTI_VM),
>  					     "MULTI_QUEUE and MULTI_VM
> cannot be used together.\n"); @@ -922,7 +922,7 @@ int igt_main()
>=20
>  			igt_debug("Max working set %d n_execs %d\n", ws, s-
> >n_execs);
>  			if (s->flags & MULTI_QUEUE) {
> -
> 	igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D IP_VER(35,
> 0));
> +				igt_require(xe_has_multi_queue_engine(fd));
>  				igt_require(multi_queue_hwe !=3D NULL);
>  				igt_assert_f(!(s->flags & MULTI_VM),
>  					     "MULTI_QUEUE and MULTI_VM
> cannot be used together.\n"); @@ -941,7 +941,7 @@ int igt_main()
>=20
>  			igt_debug("Max working set %d n_execs %d\n", ws, s-
> >n_execs);
>  			if (s->flags & MULTI_QUEUE) {
> -
> 	igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D IP_VER(35,
> 0));
> +				igt_require(xe_has_multi_queue_engine(fd));
>  				igt_require(multi_queue_hwe !=3D NULL);
>  				igt_assert_f(!(s->flags & MULTI_VM),
>  					     "MULTI_QUEUE and MULTI_VM
> cannot be used together.\n"); diff --git a/tests/intel/xe_exec_fault_mode=
.c
> b/tests/intel/xe_exec_fault_mode.c
> index 3e92dfbd9..4649c67de 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -444,7 +444,7 @@ test_exec_main(int fd, int n_exec_queues, int n_execs=
,
> unsigned int flags)
>  	struct drm_xe_engine_class_instance *hwe;
>=20
>  	if (flags & MULTI_QUEUE) {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
>  	} else {
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index d9d648b02..82c9aefcd 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -1093,7 +1093,7 @@ int igt_main()
>=20
>  	igt_fixture() {
>  		fd =3D drm_open_driver(DRIVER_XE);
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  	}
>=20
>  	igt_subtest_f("sanity")
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c in=
dex
> 9f5fde1a7..4634c24d9 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -1105,7 +1105,7 @@ int igt_main()
>  			gt_mocs_reset(fd, gt);
>=20
>  	igt_subtest("multi-queue-cat-error") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(fd, hwe, 16, 16,
>  					    CAT_ERROR | MULTI_QUEUE,
> @@ -1114,7 +1114,7 @@ int igt_main()
>  	}
>=20
>  	igt_subtest("multi-queue-cat-error-on-secondary") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(fd, hwe, 16, 16,
>  					    CAT_ERROR | MULTI_QUEUE |
> @@ -1124,7 +1124,7 @@ int igt_main()
>  	}
>=20
>  	igt_subtest("multi-queue-gt-reset") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		ignore_gt_reset_warnings_in_dmesg();
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(fd, hwe, 16, 16, @@ -1134,7
> +1134,7 @@ int igt_main()
>  	}
>=20
>  	igt_subtest("multi-queue-cancel") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(fd, hwe, 16, 16,
>  					    MULTI_QUEUE,
> @@ -1143,7 +1143,7 @@ int igt_main()
>  	}
>=20
>  	igt_subtest("multi-queue-cancel-on-secondary") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(fd, hwe, 16, 16,
>  					    MULTI_QUEUE |
> SECONDARY_QUEUE, @@ -1152,7 +1152,7 @@ int igt_main()
>  	}
>=20
>  	igt_subtest("multi-queue-close-fd") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(-1, hwe, 16, 256,
>  					    CLOSE_FD | MULTI_QUEUE,
> @@ -1161,7 +1161,7 @@ int igt_main()
>  	}
>=20
>  	igt_subtest("multi-queue-close-execqueues") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(-1, hwe, 16, 256,
>  					    CLOSE_EXEC_QUEUES | CLOSE_FD |
> @@ -1171,14 +1171,14 @@ int igt_main()
>  	}
>=20
>  	igt_subtest("cm-multi-queue-cat-error") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_compute_mode(fd, hwe, 16, 16,
>  					  CAT_ERROR | MULTI_QUEUE);
>  	}
>=20
>  	igt_subtest("cm-multi-queue-cat-error-on-secondary") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_compute_mode(fd, hwe, 16, 16,
>  					  CAT_ERROR | MULTI_QUEUE |
> @@ -1186,7 +1186,7 @@ int igt_main()
>  	}
>=20
>  	igt_subtest("cm-multi-queue-gt-reset") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		ignore_gt_reset_warnings_in_dmesg();
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_compute_mode(fd, hwe, 16, 16,
> @@ -1194,29 +1194,32 @@ int igt_main()
>  	}
>=20
>  	igt_subtest("cm-multi-queue-close-fd") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_compute_mode(-1, hwe, 16, 256,
>  					  CLOSE_FD | MULTI_QUEUE);
>  	}
>=20
>  	igt_subtest("cm-multi-queue-close-execqueues") {
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_compute_mode(-1, hwe, 16, 256,
>  					  CLOSE_EXEC_QUEUES | CLOSE_FD |
>  					  MULTI_QUEUE);
>  	}
>=20
> -	igt_subtest("multi-queue-long-spin-many-queue-switch")
> +	igt_subtest("multi-queue-long-spin-many-queue-switch") {
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe) {
>  			xe_legacy_test_mode(fd, hwe, 4, 8,
>  					    LONG_SPIN | MULTI_QUEUE,
>  					    LEGACY_MODE_ADDR, false);
>  			break;
>  		}
> +	}
>=20
> -	igt_subtest("multi-queue-long-spin-reuse-many-queue-switch")
> +	igt_subtest("multi-queue-long-spin-reuse-many-queue-switch") {
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe) {
>  			xe_legacy_test_mode(fd, hwe, 4, 8,
>  					    LONG_SPIN | MULTI_QUEUE |
> @@ -1224,6 +1227,7 @@ int igt_main()
>  					    LEGACY_MODE_ADDR, false);
>  			break;
>  		}
> +	}
>=20
>  	igt_fixture()
>  		drm_close_driver(fd);
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.=
c index
> 2f44d5555..24dae2b52 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -1721,7 +1721,7 @@ int igt_main()
>  	for (const struct section *s =3D sections; s->name; s++) {
>  		igt_subtest_f("threads-%s", s->name) {
>  			if (s->flags & MULTI_QUEUE) {
> -
> 	igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0)),
> +
> 	igt_skip_on_f(!(xe_has_multi_queue_engine(fd)),
>  						"multi_queue is supported on
> graphics version 35 and above");
>  				/* Balancer can't be set with multi-queue at
> the same time */
>  				igt_assert(!(s->flags & BALANCER));
> --
> 2.43.0

