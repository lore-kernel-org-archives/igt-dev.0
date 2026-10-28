Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3BF606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 06:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=abxbw+NB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F5010F9C4;
	Wed, 28 Oct 2026 06:05:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC1B10F9C8
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 06:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793167488; x=1824703488;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8B/sapH1nQ1osVz7yU0EqQC1Hk1yaP0t9co7pr7yn0s=;
 b=abxbw+NB7KEa4CLZJuSDrEiO0XwKc98ZQ1V9NitQ1cBa7ejWIyxLlHm+
 cHNxi9b32pFsK18yA5pKxtTKoNBAFUTfdbLJ3NdhFquCVuGNcgVJYKDZ4
 RbST9syjuaKNC1CZCD9XXpGy/hOnTv03hdYsKP4F7YccYIZoWFQVYJ2D1
 L60yl0w4H0CCPKy1OM2EInyHQUSymy80rCc7FLDihklf3X3zRhFmZpQS1
 8dDR83XUXHImUkubecLsgO1EsluXwxuK0zEj4zr59y+WsVWbiQqG5JaHs
 JIrSH8pg7QI8+dkoTRKqfqbaREyAaM5tIyZvDGiBka7ogzxNbDVFzGb8I Q==;
X-CSE-ConnectionGUID: hy/RsY+/TpaKtxdHap+ffA==
X-CSE-MsgGUID: sim4OZAZR7yHnx+VkUhfnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1777473"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1777473"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 23:04:48 -0700
X-CSE-ConnectionGUID: Xloo77L6SNyLo/ZGXf8OQw==
X-CSE-MsgGUID: UGQLJCARRTqIQ3WEE3mhJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4717858"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 23:04:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 23:04:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 27 Oct 2026 23:04:46 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 23:04:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmhuQj+VyLLiqKCWbOwfk0i3SM1wC1SlOCGqd6QZFvgCg+KkJQipoiYmoeAR4NL3Imzq+9kcwrJJkMTqLPgYmwHLeY8X8sPaM2zmZWJB60+KaLKfH2I4XlDzZgIaiUG6AdDChsHhAUbJf2eEiMXYQVi8c6cnG4z1hHPoKcdsz4PoGd5SC5lRJKfKA/8R6OqNUL93l0QohRjLxQHRoDaL9bG0Txjy91S+4rR7Fc3JQP6QhO4OO3VSYaEzQPvne6fIgIke/LJ+yEb3GPmV6OvA5J7w9y5XYWCxrIrFds1yP6B0Qt5qizISHhIWqYrhzW5BRGx/iB4xcW3Xw6zbPMSUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiXnaEgDjQY5/P5qZOF2xJcPRp3qqp69Xv2ykvBE4YI=;
 b=jmV8nzhFc6mtVcLTlDW6S7kIrFLe7FVOIS7J0gWCOnuRH2PSKsUecz5nMmDHUSfjsaUdAa9JKIny5uNlCLdkTNpz+gVV2gK7Oq2CN2VjBvBrsJ5yQhDLhSSbUdS3znKOW+Ubs+lFxQsLBY6+BfCA0sKBeB8VQ8RD5648GeNN9G3gi3NZt7WnoYhyQ1KxbLj4zcTGJpHMd8SyPhIwBgTuziWBhwrY+JuKGVg5Fsf4vWLFAf0X3e3n1Ijp8+ewmq7HrQwxyQFohDHDI8NHQIgemGetTlNIqfj464dlhSiDSpThBmYZMxTgL7uZE8BmY2GFL86pNW1wCEcWQ26OBGEXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA3PPF7DA1589B2.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::c8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 06:04:44 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 06:04:44 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Sharma, Nishit" <nishit.sharma@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v7 3/5] tests/intel: Add array-of-binds random-size
 allocation tests
Thread-Topic: [PATCH i-g-t v7 3/5] tests/intel: Add array-of-binds random-size
 allocation tests
Thread-Index: AQHdYYNZEQQCPKi5qkis6SCMseavJ7cSgRDQ
Date: Wed, 28 Oct 2026 06:04:44 +0000
Message-ID: <CH3PR11MB8434E536EE5949C55AF04CD18D6F2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20261021174032.18337-1-sobin.thomas@intel.com>
 <20261021174032.18337-4-sobin.thomas@intel.com>
In-Reply-To: <20261021174032.18337-4-sobin.thomas@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA3PPF7DA1589B2:EE_
x-ms-office365-filtering-correlation-id: bb6bbd8a-d4b0-4864-75dd-08df34b95ce2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|38070700021|261026140227099003|4143699003|11063799006|261009223027099003|56012099006|261022105027099003|10067099003|261021121427099003|261021123027099003|261022075727099003|18002099003|261026121527099003|22082099003;
x-microsoft-antispam-message-info: R4D77h2JaAYQDSq+jWxBE+qjTc5LUD/c6k+y1fT4LAJEpXGqHJkGiBLw/3xvWK/lSbBZ+4d8I8HFnBaGl8anvmEeN0ModhpxyBL8F4X3Ih4wx2yo8FkLf8yKFKj5UDrrsGOpT82tLU+tMLyBg9KCcRzt1nucM19eKW0+us9qEQ7ovoNJ4C188Rrv9LmARPz86UfBJqDOPO1qKw9ft1aE3L19siOTmtWDxSZOMyHOCmsM8QsRLULTS6KBvUdf/DwMnb0ACI9tLxpmDL+Wb5zb9H0BjRfonqtZf8rjRgODvg/unsLRBBWjl5p9kFO7DsBAIUyoWvWVeMxptO9OBNF/9aH28UrgWGca+io3kmBvUAAEnpKMnd96+jSxt7lTyfUXWp+KO4I6FNIZpMLvpzf3LsQDsYjSlx7/wvKzzMsFFej4r7Dr0UTCr7mKtdS8Ik55FfRV+IAK9Ho080Ze+OSatxs4T/uLuGC3OJKEAF4j2fAUWydgWR6e9Ra72u6UuST6IlGk7Gd+r3rH65xtJarMCbDZ/+Ynno1jiYVtH5fJH4nxdahexNNJ9T/B4H5pvvn+p+rDEXTOY0VPlahWqvSLv0yDoWWbzAAB+l+p7dnv3rRsUB8ASJQTMS0CjXZj04aubKa/UiF3UhMfNhqMo+tBxPubUK3OjUTJu0NyDv5CcYpdJo/ctdL5RJhK4GUnAboXG6D5ZP02gI7Vz5eUKVGgGcMSCxCssRh7I5Cv9SUZ4PU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(261026140227099003)(4143699003)(11063799006)(261009223027099003)(56012099006)(261022105027099003)(10067099003)(261021121427099003)(261021123027099003)(261022075727099003)(18002099003)(261026121527099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YpNha5mpKHKTqVsJAwK8wmo/dFibMoSMKK3QUba08C6EPKAPeEK3deKaSI/q?=
 =?us-ascii?Q?z3p3pkogmu2TLdBbmHkFImyxVwniS6/2huA3GxuuTMZ+vpAqq3tlBMffg68Z?=
 =?us-ascii?Q?uQsRJogTgCJ14VDSgeRVftUBhPd3rIVUkMFRk1D8gd35+WeZGQ4MfkHMwmFW?=
 =?us-ascii?Q?L9XeI6fjfiQbZ5EWqel/d5rBzpLGHvFXiouQq6YaCJOUcaOZOjRo6GCi1Xz+?=
 =?us-ascii?Q?bfpdSdG9FCsxl0tzBHFfQwaWOAqgt2FmPkwLVtlUD8WFDV8GkQJaTF8moenn?=
 =?us-ascii?Q?nXANF0sXTBaGtYEsHeTp5uu1DxODqCyfyLV9dS2lSFtZBnj0L9aguIdX1iLl?=
 =?us-ascii?Q?cncAGmpNNNCITsmb1sD9RQbKJysRdH5nA+k6tzCMK/pMSaxJZb7LoxEMClmr?=
 =?us-ascii?Q?IyU1PzTas0pMHZwm334EAEqkzA3Z8anxL/Org2xHLB2JT7R9DcNtii+0fvvq?=
 =?us-ascii?Q?bitvsS9vR790DmGYpG/kvOex9qffS6idlEX2Smlfgg7afuRdxDOcv3NNtlai?=
 =?us-ascii?Q?KpOqXrq4kVhbDIgQXjTTxLFovGf3w7AnHeB/3XGED6TX28eOr1A/nGYfgrIT?=
 =?us-ascii?Q?pQm5Z5vENvxXxWDm41tjvxxTQe1Vt+5v3zSE7YLwhLCc1oA80LRSA65KZIja?=
 =?us-ascii?Q?4UtsN4Ksy8BmIM+d5iWLwcXZfFNNEObCJcQuu7MdfbRR2cwBH/coK7Sp4EGL?=
 =?us-ascii?Q?HKlPuQrBVK025915kdUglL2Code4NM+ZKZ1pN5qzyRiBqTTlyhQiM3waW6je?=
 =?us-ascii?Q?OdoBfOwu9U/ZlX2gtEhzvtXeEVqxYtez9ZKv3AE3dljEIV34XPiNH9AJR1gY?=
 =?us-ascii?Q?qEWi5SHnVGXC6phS62kkqLnTm35xaNwFVfygPlI5mBEeuqOvM4Wwm0MCMx3U?=
 =?us-ascii?Q?88e48DsFA1Ua66Lx85ozblbV2try5UAnCRdzAVxjfaUMAxhEdVhFrMvoKisW?=
 =?us-ascii?Q?bIEcWg+yc1oetr1g1RCL9RUhF+xxxac/LirMasVtUv7SgZrkJArFdbAzqQUI?=
 =?us-ascii?Q?GLm0+Io/YHmYFp6mhO6pSzftqCVwBLh4YUpunn75CI9hyjtmoODz39miGylG?=
 =?us-ascii?Q?YGDhRqmaUETEn2R5AJipHs8ARbG6BKnDOjz7138aWWKO60tFypvylMy7+7yv?=
 =?us-ascii?Q?jMPEXNGYbSd4EyjI/9DISn1tPveRmNP7RzHTrZ574bp8EuwY+od3wh/Kg5Mq?=
 =?us-ascii?Q?6d6yLvp/P2TPB+mgTbOzbslrAzJ36hzLKZakLwaGdtTmUzzSb3hZS+FX7Pd6?=
 =?us-ascii?Q?lNaIt8sHTaLDQlv12YxRQayn05w1d1zQX4LbNJk8JZkYGy6wegeGg/D/o9yA?=
 =?us-ascii?Q?KLiXagBaAr3MSVe3NAdldwcnFzZTuxT4q0DBKrtLQOHwnYc+MSwrkkIh9adJ?=
 =?us-ascii?Q?75FlTCFNJ1M6z2Rdcb6D81SjfmnbMldzSe4ZxwXv0xQ5BDx1Qz1pMxi69O+t?=
 =?us-ascii?Q?daK39qyVxmG9rzHKIq91+20n7oGqBmpwPMVKp7cE5GtzMh1Oa2e66xzbn+Qh?=
 =?us-ascii?Q?Fqx4VFpiZ8hMSXIwYzO0r/RfpQFbNxv+pu7laQaJ9IlaJ8TBMRG8pE3BRMyf?=
 =?us-ascii?Q?g76PBZWXFaPGArtzSoSY9W5XmJn0glEFYJV4V7OnKa+ZK7seGpBI5JN0bwZG?=
 =?us-ascii?Q?M2hU6SZSE+UVqzqzEC86APlg1VBVNho8Tmjln8+N8CTXs1Tkkmyhh5/CRBGK?=
 =?us-ascii?Q?YSV0MAbHW54zcmVTPnppc7GJhpEvVXec4tgpaLNoCSSJ48sJxXM4SYHlK8aJ?=
 =?us-ascii?Q?Oyfj13SoDHXuUzw5Ds365vEEH/IGTTo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HVrUSMDy3aLMZEFdRBqoTEBZuvEzAsNiKIa5U8nHPkLhKCGfNYJWBjoMQM9c+o140yBhAHEqjgjBk+aAj/9c3NO4voAodz0mMGqdb7OsIQS58vSrRT071W+0Epg69V6uLxgkCOW6ZPBCCMecCgNiy9eiLO6T6cL7bS/o8Nga1U7eCYci3olv1Y/6BhxVNKTolFVg6DGhJr0nCyWk4McJD/os0oFt4zkHPJKRCJDDML5T16/lThK2h0eZZcIoOMjcz1/CIBIdb43Hh49UpNqiE6Z4ooJaUN6j+Uf63EAwDUY0QfuyjK2Val1FhScU9FvBSCzm+xxXTIYCvl/etqPkdg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6bbd8a-d4b0-4864-75dd-08df34b95ce2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 06:04:44.1450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DvFyUyuS2CRdZYHPEuatBIziMg/o5QjJaEw32jxoOu4HFU8qs+psdxE4+54nEsJttyLCw2QOHzu1wol4htwx90lCPB/N6mf9KUFbzvzJSo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF7DA1589B2
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: 21 October 2026 23:10
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit <nishit.sharma@intel.co=
m>
> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>;
> Thomas, Sobin <sobin.thomas@intel.com>
> Subject: [PATCH i-g-t v7 3/5] tests/intel: Add array-of-binds random-size
> allocation tests
>=20
> Add new array-binds-rand-sizes-* subtests that allocate batches of random=
-sized
> BOs and bind them using a single array-of-binds operation.
>=20
> The new tests allocate 10 BOs per batch and exercise both aligned and una=
ligned
> bind addresses. This extends existing eviction coverage by verifying that=
 BOs with
> varying sizes can be bound, managed and evicted correctly when submitted =
as a
> single bind array rather than individual bind operations.
>=20
> Introduce alloc_random_size_bos_array_bind(), which mirrors the existing
> random-size allocation flow while grouping multiple BOs into a single arr=
ay bind
> submission. This is particularly useful for eviction testing where a set =
of BOs
> needs to be resident or evicted as a unit.
>=20
> The tests are intended to provide additional coverage for array-of-binds =
handling
> under random allocation patterns and VRAM pressure scenarios.
>=20
> v6:
> - Replaced n_batches with loop variable i ( Priyanka)
> v7:
> - Optimized alloc_rand_size_bos function
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_bo_alloc.c | 153 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 134 insertions(+), 19 deletions(-)
>=20
> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c index
> 80b1ae887..1b3bef79a 100644
> --- a/tests/intel/xe_bo_alloc.c
> +++ b/tests/intel/xe_bo_alloc.c
> @@ -28,6 +28,7 @@
>  #define BO_BIND_BASE_ADDR	0x1a0000ull
>  #define SZ_4K_SHIFT	12
>  #define MAX_ALLOCATIONS 50000
> +#define N_BOS_PER_BIND	10
>=20
>  /**
>   * SUBTEST: all-sizes-once
> @@ -53,6 +54,16 @@
>   * SUBTEST: rand-sizes-evict
>   * Description: Allocate and retain random-sized BOs until VRAM is
> overcommitted, then validate them
>   * Test category: functionality test
> + *
> + * SUBTEST: array-binds-rand-sizes-10
> + * Description: Test 10 batches of 10 random BO allocation sizes each
> + bound together as a
> + * single array of binds
> + * Test category: functionality test
> + *
> + * SUBTEST: array-binds-rand-sizes-10-unaligned
> + * Description: Test 10 batches of 10 random BO allocation sizes bound
> + together as a single
> + * array of binds, with bind addresses unaligned to BO size
> + * Test category: functionality test
>   */
>=20
>  #define N_ALLOC_SIZES	256
> @@ -66,6 +77,7 @@ static uint64_t *alloc_sizes;  enum test_type {
>  	TYPE_ALL_SIZES,
>  	TYPE_RANDOM_SIZE,
> +	TYPE_ARRAY_BIND,
>  };
>=20
>  struct test_case {
> @@ -85,6 +97,7 @@ struct bo_group {
>  #define LEAK_BO			(0x1 << 1)
>  #define EVICT			(0x1 << 2)
>  #define UNALIGNED		(0x1 << 3)
> +#define ARRAY_BIND		(0x1 << 4)
>=20
>  /*
>   * Represents a single BO under test: its reserved VA range, the BO hand=
le, @@ -
> 169,6 +182,28 @@ static void bo_alloc_reserve_va(struct bo_alloc *b, uint=
32_t
> flags, uint64_t va_
>  	igt_assert_eq_u64(b->gpu_va % align, 0);  }
>=20
> +static int __xe_vm_bind_array(int fd, uint32_t vm,
> +			      struct drm_xe_vm_bind_op *bind_ops,
> +			      uint32_t num_bind, struct drm_xe_sync *sync,
> +			      uint32_t num_syncs)
> +{
> +	struct drm_xe_vm_bind bind =3D {
> +		.vm_id =3D vm,
> +		.num_binds =3D num_bind,
> +		.vector_of_binds =3D (uintptr_t)bind_ops,
> +		.num_syncs =3D num_syncs,
> +		.syncs =3D (uintptr_t)sync,
> +		.exec_queue_id =3D 0,
> +	};
> +
> +	igt_assert(num_bind > 0);
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
> +		return -errno;
> +
> +	return 0;
> +}
> +
>  static void alloc_sizes_init(void)
>  {
>  	int i;
> @@ -245,11 +280,7 @@ static void create_bo_arr(int fd, uint32_t vm, struc=
t
> bo_alloc *bos,  int n_bos,
>  	}
>  }
>=20
> -/*
> - * BIND step: bind one or more BOs as a single array-of-binds ioctl call
> - * (see __xe_vm_bind_array() above), replacing the previous open-coded
> - * xe_vm_bind_sync() called once per BO.
> - */
> +/* Bind BOs one VM_BIND each; signal only after the last */
>  static int test_bind_individual(int fd, uint32_t vm, struct bo_alloc *bo=
s, int n_bos)
> {
>  	struct drm_xe_sync sync =3D {
> @@ -299,8 +330,77 @@ static int test_bind_individual(int fd, uint32_t vm,=
 struct
> bo_alloc *bos, int n
>  	return 0;
>  }
>=20
> +/*
> + * BIND step: bind one or more BOs as a single array-of-binds ioctl
> +call
> + * (see __xe_vm_bind_array() above), replacing the previous open-coded
> + * xe_vm_bind_sync() called once per BO.
> + */
> +static int test_bind_array(int fd, uint32_t vm,
> +			   struct bo_alloc *bos, int n_bos)
> +{
> +	struct drm_xe_vm_bind_op *bind_ops;
> +	struct drm_xe_sync sync =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle =3D syncobj_create(fd, 0),
> +	};
> +	int i, ret;
> +
> +	igt_assert(n_bos > 0);
> +
> +	bind_ops =3D calloc(n_bos, sizeof(*bind_ops));
> +	igt_assert(bind_ops);
> +
> +	for (i =3D 0; i < n_bos; i++) {
> +		igt_assert_f(bos[i].bo,
> +			     "BO[%d] was not created before bind\n", i);
> +
> +		igt_assert_f(bos[i].bo_size,
> +			     "BO[%d] has zero size\n", i);
> +
> +		bind_ops[i] =3D (struct drm_xe_vm_bind_op) {
> +			.obj =3D bos[i].bo,
> +			.obj_offset =3D 0,
> +			.range =3D bos[i].bo_size,
> +			.addr =3D bos[i].gpu_va,
> +			.op =3D DRM_XE_VM_BIND_OP_MAP,
> +			.flags =3D 0,
> +		};
> +
> +		igt_debug("Bind op[%d]: bo=3D%u size=3D%#llx addr=3D%#llx\n",
> +			  i,
> +			  bos[i].bo,
> +			  (unsigned long long)bos[i].bo_size,
> +			  (unsigned long long)bos[i].gpu_va);
> +	}
> +
> +	ret =3D __xe_vm_bind_array(fd, vm, bind_ops, n_bos, &sync, 1);
> +	if (ret) {
> +		if (ret =3D=3D -ENOMEM || ret =3D=3D -ENOSPC) {
> +			syncobj_destroy(fd, sync.handle);
> +			free(bind_ops);
> +			return ret;
> +		}
> +
> +		igt_assert_f(false, "Array VM_BIND failed: ret=3D%d (%s)\n",
> +			     ret, strerror(-ret));
> +	}
> +
> +	igt_assert_f(syncobj_wait(fd, &sync.handle, 1,
> +				  INT64_MAX, 0, NULL),
> +		     "Timed out waiting for array VM_BIND\n");
> +
> +	syncobj_destroy(fd, sync.handle);
> +	free(bind_ops);
> +
> +	return 0;
> +}
> +
>  static int test_bind(int fd, uint32_t vm, struct bo_alloc *bos, int n_bo=
s, uint32_t
> flags)  {
> +	if (flags & ARRAY_BIND)
> +		return test_bind_array(fd, vm, bos, n_bos);
> +
>  	return test_bind_individual(fd, vm, bos, n_bos);  }
>=20
> @@ -532,14 +632,16 @@ static void check_leak_multi_group(int fd, uint32_t=
 vm,
> struct bo_group **groups  }
>=20
>  static void alloc_rand_size_bos(int fd, struct drm_xe_engine_class_insta=
nce
> *hwe,
> -				int count, uint64_t vram_target, uint32_t flags)
> +				int count, int n_per_bind,  uint64_t vram_target,
> +				uint32_t flags)
>  {
>  	struct bo_group **leaks =3D NULL;
>  	uint32_t vm, q;
> -	uint64_t vram_used =3D 0, bo_size;
> +	uint64_t vram_used =3D 0;
>  	int i, max_batches =3D (count =3D=3D -1) ? MAX_ALLOCATIONS : count;
>=20
> -	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
> +	igt_assert(n_per_bind > 0 && n_per_bind <=3D N_BOS_PER_BIND);
> +	igt_assert(count > 0 || ((flags & EVICT) && (flags & LEAK_BO)));
>  	leaks =3D malloc(sizeof(*leaks) * max_batches);
>  	igt_assert(leaks);
>=20
> @@ -547,20 +649,25 @@ static void alloc_rand_size_bos(int fd, struct
> drm_xe_engine_class_instance *hwe
>  	q =3D xe_exec_queue_create(fd, vm, hwe, 0);
>=20
>  	for (i =3D 0; i < count || vram_used < vram_target; ++i) {
> -		struct bo_alloc *bo;
> -
> -		bo_size =3D alloc_sizes[rand() % N_ALLOC_SIZES];
> +		uint64_t sizes[N_BOS_PER_BIND];
> +		struct bo_alloc *bos;
> +		int j;
>=20
>  		igt_assert(i < max_batches);
> -		bo =3D test_alloc_sizes(fd, vm, q, hwe->gt_id, &bo_size, 1, flags,
> BO_BIND_BASE_ADDR);
> -		if (bo) {
> +
> +		for (j =3D 0; j < n_per_bind; ++j)
> +			sizes[j] =3D alloc_sizes[rand() % N_ALLOC_SIZES];
> +
> +		bos =3D test_alloc_sizes(fd, vm, q, hwe->gt_id, sizes, n_per_bind,
> flags,
> +				       BO_BIND_BASE_ADDR);
> +		if (bos) {
>  			leaks[i] =3D malloc(sizeof(*leaks[i]));
>  			igt_assert(leaks[i]);
>=20
> -			leaks[i]->bos =3D bo;
> -			leaks[i]->n_bos =3D 1;
> -
> -			vram_used +=3D bo->bo_size;
> +			leaks[i]->bos =3D bos;
> +			leaks[i]->n_bos =3D n_per_bind;
> +			for (j =3D 0; j < n_per_bind; ++j)
> +				vram_used +=3D bos[j].bo_size;
>  		} else {
>  			leaks[i] =3D NULL;
>  		}
> @@ -579,7 +686,7 @@ static void all_sizes_once(int fd, struct
> drm_xe_engine_class_instance *hwe)
>  	int i;
>=20
>  	vm =3D xe_vm_create(fd, 0, 0);
> -	q =3D  xe_exec_queue_create(fd, vm, hwe, 0);
> +	q =3D xe_exec_queue_create(fd, vm, hwe, 0);
>=20
>  	for (i =3D 0; i < N_ALLOC_SIZES; ++i)
>  		test_alloc_size(fd, vm, q, hwe->gt_id, alloc_sizes[i], 0,
> BO_BIND_BASE_ADDR); @@ -588,6 +695,7 @@ static void all_sizes_once(int fd=
,
> struct drm_xe_engine_class_instance *hwe)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +
>  static void run_gt_dynamic_subtests(int fd, const struct test_case *t)  =
{
>  	struct drm_xe_engine_class_instance *hwe; @@ -635,7 +743,11 @@
> static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
>  				all_sizes_once(fd, hwe);
>  				break;
>  			case TYPE_RANDOM_SIZE:
> -				alloc_rand_size_bos(fd, hwe, t->count,
> vram_target, t->flags);
> +				alloc_rand_size_bos(fd, hwe, t->count, 1,
> vram_target, t->flags);
> +				break;
> +			case TYPE_ARRAY_BIND:
> +				alloc_rand_size_bos(fd, hwe, t->count,
> N_BOS_PER_BIND,
> +						    vram_target, t->flags);
>  				break;
>  			default:
>  				igt_assert_f(0, "Unhandled test type %d\n", t-
> >type); @@ -658,6 +770,9 @@ static const struct test_case test_matrix[] =
=3D {
>  	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE,
> false },
>  	{ "rand-sizes-leak-100", 100, LEAK_BO, TYPE_RANDOM_SIZE, false },
>  	{ "rand-sizes-evict", -1, LEAK_BO | EVICT, TYPE_RANDOM_SIZE, true },
> +	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND | LEAK_BO,
> TYPE_ARRAY_BIND, true },
> +	{ "array-binds-rand-sizes-10-unaligned", 10, ARRAY_BIND | LEAK_BO |
> UNALIGNED,
> +	   TYPE_ARRAY_BIND, true },
Here EVICT flag is not set but requires_evict_ram is set and also in descri=
ption also it is mentioned saying eviction is happening which is confusing,=
 can you have a look at this?
>  };
>=20
>  int igt_main()
> --
> 2.55.0

