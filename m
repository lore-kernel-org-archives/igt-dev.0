Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A81DC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 08:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0971710E34F;
	Thu, 21 Mar 2024 08:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkHxhntn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D06E10E34F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 08:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711010648; x=1742546648;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XyMAU61ufKTrIof1EERHXbZxSdLUuAWCXNdpGc6Eor0=;
 b=OkHxhntnPM4fl07uLUDPRKT2Olnf2zFlwKi+wdLyZpUsl3jcKGkDdrjk
 ptz/Vwk3OBRIDJE5LPit8ccDRHm2E3I0G44FKgCnOPnTFvpwsfeOPeIpL
 EBAu9LOdCIGU7AMfHl/aCND9jC+f+0dK0RUMuzOw7+b2KldecA2F96hDj
 H6egO5/OxEF6M4sVrEKxNSmCpwOpPLjLZfZ0qPoAKs5cBXo0tKNduTYy2
 64Fu8UtKS7qHmZ9ozVBx4Nf7383Nb8j/qTfjo66mMLh0PZB+lJ15sk4ij
 a/EIYJygIKJ6oWsn806Dj3urLbgFLNE9i774NwiK2RtLduRPbSWKv7EoR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16529621"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="16529621"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 01:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19132031"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 01:44:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 01:44:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 01:44:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 01:44:07 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 01:44:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0bIGmUyKHEmz970qUEPmFWRxWkQ6FUfPQrty62SQDagL7rAT/8WG6N9MWudm16G/evmu4B75HFk2Sb68ooKuj68407cimUhRQCWW465U4cwnXoIovMqpz2ASbMfy3AK9JagpVoGvgJNT4zwUpqxruDul6j9As9V8BAtc4y+DHCnL6L6XAuTU9gGmPEumTSdZr1Z4UdBu5pWuaCXvZFYjlYocJiVU8WMXiDwpVE5Uq+l1Fpmk/Laz02i0BPV0N44Yr4Nfy6zzEtLTjSPXc+3YbPZ8yf+vmMoB6dLwpBGVWJnFBVjQkEHrcJYjzRd4ym3jRLcwmtNdO+IfUr59XlSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYfckQPRn77DZY+JMTO5u1byBLitS6Qzvdz0IwhhaYI=;
 b=hM6fVXZdVJ8lLFx3jWI0rV6958gDec8y5DIKVjMQGbn0QbjvWFIXDobe/x/5j0XNybFhEJUbgqMUpgj3/j3eOvqsx/jjUlRXT5lJg8dTssTajzpt11t3HTK49feFWHzuBgu0F+GcowGrmXCNJ5nZOYiTvpKIZ1/+eaj1XnnfJJg0opaJyitcc2WguFL06h9GkI5Y2cHqvzVTFgVKxcpE+TT3SIoI6wMvpuqLdbWbB+aJ+6COmrePTt7kJJLzfUCpJzc8AhQZV5dBl7BMbF7QL6EBdANr8hewH5eogchUj68UdJJL45CLfxUjCoUzSs+6fPc6sUnMBJ2Ccq3553Fc/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by DS0PR11MB7442.namprd11.prod.outlook.com (2603:10b6:8:14d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 21 Mar
 2024 08:44:04 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7409.022; Thu, 21 Mar 2024
 08:44:04 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid
 va test
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid
 va test
Thread-Index: AQHae1Q7MFP3L31LHEWntBMjt6hzy7FB4Rzw
Date: Thu, 21 Mar 2024 08:44:04 +0000
Message-ID: <MW3PR11MB4748CFAB177BC9CE7971EE5BAE322@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240321055229.2705239-1-priyanka.dandamudi@intel.com>
 <20240321055229.2705239-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20240321055229.2705239-3-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|DS0PR11MB7442:EE_
x-ms-office365-filtering-correlation-id: 428b7ab9-ceed-4935-8688-08dc4983103c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1h7dC6xMq1Gqlu8qqe7a1m+qGsqzZ9EQV0Cp5odNqVyVSG5WLjf4eM22YTUtIL6jOxLGdrNXhtXB3xBQ+ZNYHUa3sEPjjMKYz+0JLRq2UmJXRKdFZTT8oc7FhoQDQMT3AmBHbM5ney3MIwwUHDJQv6lYzixeZKx41L5DdDnWA0A7bgNxyACFrBAvktgyqIbrCgldp9lRLu7QXRDvEi8P4OnF96kBx/nYTQLyqbGXg4VHqTuL2gmW7xOyFEk3Tpu4sptpcnDw6P/q+1SOXY3NflvBTU0a0p+2KPdO76AOFBtDqt2fk7qDL4gnHWPGcknzCOYPkfuVQ4VZmwZPGmzOD3jIKV68fA/p14Sj20SHadR86qzwvzTmV54F3rRzDEf7eqLbGmCZyI9rcHnGP//iNA3nojseQ14C73vPa6T/6/ucPc7gGWlggooswUr8Ws+Vzeap9w/7tqUKtnrC7NP8vrjLWsfXU1y9pZLsB7XqdMKhEATDZdV4svIGYq/4JWU9gTnKhl7XmkT3I4N6d3+7MRp6WCMn94xEhuFxa3LlVt4LXBbYTOm3hDmKK5XULQt9Ld6BHTtl4NYtXKp8si3x0Xj5oTcfG7MzkId7jU/fXxaYcmXwu9vA7XaUyRXLdDo+62jUZ5Uhh8ESFiGWsEZYfPMMkcQuUakShhD1ujwarWqRpWpIa0rBi72S7CXDOuuNKBblnc9EO18RjRvfUOW4oyqtk1euqUqhCJp7/3iXuA0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zs28fb0AKeZq5BOHTdN93N3emag2Et73F6aKGoNnVD0fPLmwcDyXOSQjhmNd?=
 =?us-ascii?Q?bGdt3ic3sNaoun5AunQ/VfSHw7OaNQ9ub/2HbSRnEP9l6qChuIYkWFUrY/nP?=
 =?us-ascii?Q?39xnvd3Kv80RBylk9J2pcTGgRo7nGriTwchTYdnPrB51rgWBO6c3TG9g++2r?=
 =?us-ascii?Q?n2/dZ2UdxK2CuwNlgChZRai0DCSoXrO/PKCtklyNAbA/Nwm+0NEHoJbu+8Ot?=
 =?us-ascii?Q?4CCWkXjl53Eutfd+5fGcclH44/ympHF8ZvuWuR92Uu9julL5LjQ6VwlAFMqC?=
 =?us-ascii?Q?9euUUP9lKGRewty21n1grMNjQxnGGrKIfe7TTINk+Rsd+Oc1QQnHmxuBP1Tm?=
 =?us-ascii?Q?QLiJno+nBPvH7pZrtiMQByCvJTEKTlOqh6EycWYtJaUj304nfTQM92NbW6v2?=
 =?us-ascii?Q?bkct/bG3VJrezIk2c9gS072zvSZdRth497XMx9shR51kc9VFEbN5D8gV7foy?=
 =?us-ascii?Q?KuVDelT1cptWVN9XCgd5kK66twCar1Jul0pyDO5hSoBdFBPdvm4jzwN2g7gi?=
 =?us-ascii?Q?0cAGRs21v/VAz98mBzjLWz4uCZfYqrTWTcpRUiinJ0P3QiCKzAirfGAZCFNA?=
 =?us-ascii?Q?kNQAUTLXoVZdk64YDnkvLP0490N1QIGXSU3KeMf3V7+Q5v3M2/MZBxxIBnLw?=
 =?us-ascii?Q?Kp7ZjDmQtIKADBk7r7evHPNEh3/7z+Q4Tv92a2ufyq9pay/GDVs96yq2x/Ra?=
 =?us-ascii?Q?Ph8xFKctQK3p5tREXwgcjTuiBtdXoVgsj3udFyDOxGExHnep8A+aSaYzxehA?=
 =?us-ascii?Q?9Aea/FlJsUr3Qe8u4U8eLQe+/SS9TG0HGfpJJ8J2QZms3q8Y0a0cfKcJ5fBn?=
 =?us-ascii?Q?zKfIj3eoahmxhpculzRKTupDRTz9AfqTQVufNlG6KDSYSus1P+hN48K7v2T4?=
 =?us-ascii?Q?Mpmiw9HMdhGXS+SOU3mcFB8GVcAf7x+iFKfCDZa6EmF1gS/Zo7NKKkgIaym3?=
 =?us-ascii?Q?7E6ArP/Pn9m7ZpUOL+J7cUz+lwYdkLuiJ6cf2ywqQwWWbRrX2STYlPg3YMOQ?=
 =?us-ascii?Q?VAeGB0bhIHudL23Z4iyobP78z5/XCtL5DrEZ0kTqzYoNZ/KeXL8bUullYrhZ?=
 =?us-ascii?Q?5u2elUM5VknGbTgqU2ItVd4sCf+FPG6bQz5P+LRwfgGqiP/2epuMlqapAhCY?=
 =?us-ascii?Q?xdDnnSxevByDo48icE73Psl0qu+V2hvF81UrQcGAOhPdloWGKY5H7zvDz/aP?=
 =?us-ascii?Q?DI131DKWqAoqihbD12StHYA0kJVPkVBQ28tFqg7k5fYI9qMmLPccU2hUSAQr?=
 =?us-ascii?Q?RtBBv9lJ4PfvWX/WrCxKgPXOGrZ0BY0ilu41v4LKgAvVfp/JPuqeP6z6IBkL?=
 =?us-ascii?Q?zFJG2dMRihIvVHTcx/Kb3jQviRIKacY2Z/3cLFEEGW12TVkuwq/+nJm1a5HR?=
 =?us-ascii?Q?NokA7yTzKKQ66Miz0XYHyqZnGJzFctfQDcMdYLhXvtgKwJjqNRW7HRPXihN7?=
 =?us-ascii?Q?D12rg0XSZQlCy3WK7bembb2ZjakSDOl9n6Oc+DQP8AZa0pqGIwoEobq5ahHp?=
 =?us-ascii?Q?OtcyhuE72HMd2c1mEwZ0c3yU9C5RdZjrNyQsRso7mRZKjKMduziIzznWXsGe?=
 =?us-ascii?Q?QWqDEBs9Ww6zOS+Nnkz8Gwn/kYvKWSZURUvENpwYunF9WesQGko40sqJJOy/?=
 =?us-ascii?Q?iQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428b7ab9-ceed-4935-8688-08dc4983103c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 08:44:04.1665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yw1WNurKHZ6N7/Jo5Z6UMVOp71gSHH2j9JrNr3YFbEmY0xZyD2/j4Bi1b/7zo4h7Hr/yX/eMoZq8/3b3rhMIT218GjP+3NbBEgx6hlsZ9ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7442
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
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Thursday, March 21, 2024 11:22 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid=
 va
> test
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Extend invalid va test by enabling scratch page without pagefault and che=
ck for
> success of userfence.
>=20
> v2: Rename flag NOPAGEFAULT to ENABLE_SCRATCH and add INVALID_VA to
> test.(Rahul)
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
LGTM,
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> index 31a105d3c..b601eb23a 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -32,12 +32,17 @@
>  #define PREFETCH	(0x1 << 5)
>  #define INVALID_FAULT	(0x1 << 6)
>  #define INVALID_VA	(0x1 << 7)
> +#define ENABLE_SCRATCH  (0x1 << 8)
>=20
>  /**
>   * SUBTEST: invalid-va
>   * Description: Access invalid va and check for EIO through user fence.
>   * Test category: functionality test
>   *
> + * SUBTEST: invalid-va-scratch-nopagefault
> + * Description: Access invalid va without pageafault with scratch page e=
nabled.
> + * Test category: functionality test
> + *
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] fault mode test only once
>   * Test category: functionality test
> @@ -120,8 +125,12 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>=20
>  	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
>=20
> -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> -			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	if (flags & ENABLE_SCRATCH)
> +		vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE
> |
> +				  DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
> 0);
> +	else
> +		vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE
> |
> +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> 0);
>  	bo_size =3D sizeof(*data) * n_execs;
>  	bo_size =3D xe_bb_size(fd, bo_size);
>=20
> @@ -269,7 +278,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
>  		j =3D flags & INVALIDATE ? n_execs - 1 : 0;
>=20
>  		for (i =3D j; i < n_execs; i++) {
> -			if (flags & INVALID_VA)
> +			if (flags & INVALID_VA && !(flags & ENABLE_SCRATCH))
>  				igt_assert_eq(__xe_wait_ufence(fd,
> &data[i].exec_sync, USER_FENCE_VALUE,
>  							       exec_queues[i %
> n_exec_queues], &timeout), EIO);
>  			else
> @@ -384,6 +393,10 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			test_exec(fd, hwe, 1, 1, INVALID_VA);
>=20
> +	igt_subtest("invalid-va-scratch-nopagefault")
> +		xe_for_each_engine(fd, hwe)
> +			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH |
> INVALID_VA);
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}
> --
> 2.25.1

