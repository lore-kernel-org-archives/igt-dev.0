Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D38C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 08:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1E310E35A;
	Thu, 21 Mar 2024 08:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9Fyqs5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F14410E35A
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 08:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711010756; x=1742546756;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=valk7xesQMxTGuJzkOHoAff/OPH2FFqesrghMxmpy0A=;
 b=G9Fyqs5Ow3fRMQdLymUhoTXkUfXgziLE4vX4E3d5RvDACxNgpdR7Vaoe
 iON7LbO1rt/ANaumqhrQtpK+ygRODI0LRIKHGj87EfFYiRoO+gXGT+MAS
 m64sS+4Yy01g0ugyOZ9F0lpewwRqSDlLMKJSRRKwZgxpyjAgMuq1jxw1g
 W6Ez7NmQDF3KveE7v/yys/t3NPTirkJr7CSlvQzXwC+ve7/X2mHTXU5Rf
 LWEuoOwdw8tCozFJ4AQosJy29NSUQ0DGxU+S65Nc2gpW4SjloP/XoZKVb
 G5MDeIyCmyRRhXQ5WGyda5fdmgRxBBTSfCkNN7NLWLZ2C2fdJTQOE/hDp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5831213"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5831213"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 01:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="37555545"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 01:45:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 01:45:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 01:45:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 01:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1deSH+53pqLL8mN3uoLB4viPTwaXPFT2Kcq/ZHCnVmKgdMj/ArpVcMtT/Hr2bZkibQ6DKubnL9X/EaNjZZ7oUZ6WjZBynqFfbuOhPehG9U8vmdt4bbh3OuDqPLOBUHKKLK4n9eCUYqAOUz/LTvrchpc+ceexQMyBUnx8rnlbIirz1t695rwmm6f6TH4zZgc8OU7EhxWB1fd3wH2cp/ocQ7mVMoA77SXtA56ocrymNgtFWaUHlVC2z4HU2zt3mmD4VAbqIep7N3bkpgXWBYHz6xcoH0HkZlr+JsF/m7/S0tr0sD1XyOv4NacdZrwWTgcCK6VZfpcrt2dJqNFZXTFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jxytHIkq6lMH/wbR4Uah6GSAOUVnFeixYgTaQNT0/c=;
 b=fTubsA9O2sd5ujI9vTc7O9icBrOWQVDs32ShAvtm6ygN93/gMRX5gQc3v5SLGbxzmjmJSPIB6/rxqxR5WNjT4C6z3ceUf0rxxw8rb3g9ca08Kp1yLLF1lmo6AoMaESRBOExFYv5LP02t5brMWW5E4NH5G7Fyhg5h7X+Fd6ap9ALlKGpgO1x7rfjX+L/LgTddDERWbfv9qmTCcqAUxMYqPhu9gSuGJPQBfKNtmxWNUB0G3W3aUFsjgnfl3XIynEthUYp/hRCFSpv0rgNc1sgwFRH9i5N5ogSRw6zgypcD0QzAC+1xBw7nNSER7kgAOVfFYDJ91nT+zPlun3Vpz5efNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by IA1PR11MB8173.namprd11.prod.outlook.com (2603:10b6:208:44e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Thu, 21 Mar
 2024 08:45:52 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7409.022; Thu, 21 Mar 2024
 08:45:52 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_exec_fault_mode: Test to check
 the access of invalid va
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_exec_fault_mode: Test to check
 the access of invalid va
Thread-Index: AQHae1Q6YyFycXLoXkqoxkdyov5tV7FB4UnQ
Date: Thu, 21 Mar 2024 08:45:52 +0000
Message-ID: <MW3PR11MB474822C9C3BD9868268C998BAE322@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240321055229.2705239-1-priyanka.dandamudi@intel.com>
 <20240321055229.2705239-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20240321055229.2705239-2-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|IA1PR11MB8173:EE_
x-ms-office365-filtering-correlation-id: e793f120-fa1a-4a30-58fa-08dc498350ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sP4VsyoEV4IDUXP5FlT2Rwnz0o7Ta857QxbNSB5piGjwTgJeaH6R49kIoE1rXPXnxCMeTZxGE2vH1e3XoaKCYjDcj/3NyU2+cO/PssNbm+tfkQqDtEjQP+YjrfLUV5zGlqWvH4OgxjIByFvAFUGrsM0Lw0Mk+lQOtqCGsUshsVHBXsyuoCvv0VXZEMO0ZqnQ4CRiyKFTkvEVgbTINNUnaa12QS5e6CwkxwkWFOHBzqg30v++8KfEVYTaSRsmNl2ZDXQxsUH9UwtZBXjmQZN/7k1fNYFesRP95dYWUv3heEmoN9uSJTaKL6Ywl3Fu3VoaEC+MPH2ejU39wnLx8VvYqiWYqeBuhoiLKZK99OgkM1KT1LjExskT8mFJTvKatr7kLyfRGu8SomCiKn9c8DZrUkThYuBUMu1Et+tSz8M42XxYX0RNsrzcZsw6+5D0IoyNRVnVC+2aTGfS+tCOe/oXmxsAKZTOskptGotRZA89DLMIXWHs0rmBGmUDwZsFHONPHQUv9gdgIXIgljffvcKvEK9jVPfR9gavVRuGpeLOkoKx211aMtHNRlfzFHDr98uxArNNVAcKleXidlfCGs7ttu/PYH8j8TMXoUdPkNw1VKmYlxnN6MIaEmAOzi0l0f0ARgUy7NBNqisL4+quHFSmcaFCG8OuW5gN8BIm+3n2s1QCsKvdvLwv9KHEYuSOcA2V+6nGcuIFKlPA/0HKlVlgro3jTLXDy+H254No9eeVkwk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?srptM4iXctmNvF2Eifz1HQizuszppO91jRphue3PYvzqSku8pRfWW7rIhQwM?=
 =?us-ascii?Q?qqBE4evVMdz/bY/h5BWWGH984DqzpM3ffYr+WtpyQxD5HMLkiQzYu59z+ehA?=
 =?us-ascii?Q?9MdUA1gved4Wmo0X+tCQyPzMXO4+2JMYiMAIPPRAVm1df2ZdKz+TbPbUV6xG?=
 =?us-ascii?Q?piCcxGglCFE2tsWvq4L/DQq++d3JM2rjSf3PQGMOKtILhKwMi6w485R25Kb+?=
 =?us-ascii?Q?4YVBhmYxvuhVpMFn3rXOiYguON2ZbI6h+La8ambJbCPY3N0cIBu+XUbYEe40?=
 =?us-ascii?Q?CaMAjEItV757wAPKzgQXnR4/Kx/2XY71AUpW7YcMbRkHLDGYuldrp/3o+JCM?=
 =?us-ascii?Q?mLq1iADQwTvJswMch4P2f95P2OmDQplinrQVm2uF6KELPNfYhXVfP6WesDpd?=
 =?us-ascii?Q?EX7YMc9OfQBKdIKlmB7x4Y0SWVAoTxOWzOLsFq6uCU+y0wbru2IwOG8W/biR?=
 =?us-ascii?Q?6z+vT3GOFaQ1PxW0Hrxe2M4Wr16548QfLU7FBm8s97iVSi6SgbuT6EhTISpn?=
 =?us-ascii?Q?JV7/yy7A8ZNWlLi10d3wALYL1j1oWZ9T1ijs2JOQfs7DoI2trtf1QytTERDE?=
 =?us-ascii?Q?YUetsVmZ4KaCmXzuletbJxy42rc+PrO68UMWDf4nBr5H3GNePvwChYqBtbKt?=
 =?us-ascii?Q?ASxLTMcCqnM3IkP8TDHbsLCVLJHmXEz0Sb/29tREScKIucaMx93W6ErTPi1R?=
 =?us-ascii?Q?oksGKYELzS1BIf6k7JjpKFKVmv1YpI0DWAZ/e+LFAmQtFz2OdBWk+IFWQr3Y?=
 =?us-ascii?Q?Jd8HIZ1we7IqVrfMytyc0vIxJno0y/ep3OoqypTbhmwxTMhXy/D6w2lYSaEy?=
 =?us-ascii?Q?4w2KZOVWQwJnOVsz9q6fuBYC1IuyC8gFqRgOjPRac+qVbL1Bx4HO7A51SwcH?=
 =?us-ascii?Q?q0Y6aV3oXzzxvAnd7YFWhxr5acqSwGLFw27/+8WgNBXrV2wkEIRxALdSo67S?=
 =?us-ascii?Q?GoY/C3e3k66noMvFRziYPukZvlzJJ2VdGE8XwpznxJwY+4Kqv/koPU3m4xRE?=
 =?us-ascii?Q?2jT76/jhSNLlOCKR2WA6xv7NKE8lzjASrWThRmsx4XiMY4QMM0lZwRjKMzQ1?=
 =?us-ascii?Q?+CoApONU/H9eVjLu7Dgn7Dg7ZrIYD+4Oa0Ypx6MZNxq91eojfQL2z3e2Y4Sw?=
 =?us-ascii?Q?9ynFVkA1Ni0/kVXJYNiAS9uBPsvAGMrnP+6IniUA2uu8HIOWgTxaGGkhPInQ?=
 =?us-ascii?Q?CGFfk+P+kb9fh7g9zWnmhul18Nj1/jIepiJs8BfOBrwPQ4v7Fnn6UM17gjCI?=
 =?us-ascii?Q?EB4qcI9ceaZHSFABfgvNkIkBoumU+S8aBwSFJroDvZ9/ZlDNB27fHHVE4BQO?=
 =?us-ascii?Q?5dlbop0oNKopqpFCnTnXuM4Yhgu6jxRSONJsTqtpZsZ6aEL0fHz8CMoj28WO?=
 =?us-ascii?Q?MGquRXZJmjxlRKkrtDhh01ZzLjIIRM25RE0XNbpLxg91oCQpl13Yj3A8CR0D?=
 =?us-ascii?Q?hjuVdHKKbEF3o4kJYoQPq4J1iw9DEv8xPHjSVfjRfmihbS8daln0OeDObchu?=
 =?us-ascii?Q?3Zn5wKAI+8wSW/xlH4VYIXT2+g+QZw2WeTvXNMOD38dhLH9xDVZR2nhNro4+?=
 =?us-ascii?Q?M3jzRng4vNi7FF2aznpzYa+3ULKMB+UyPl/ciHJincOB6zkA4TLW+2ExlBH5?=
 =?us-ascii?Q?ew=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e793f120-fa1a-4a30-58fa-08dc498350ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 08:45:52.6897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ul2JXuVUfBPhyVZ3q05HyRz6r0wEX+1SuVSWuMpk4j93FUlV7oVTUuiBew2COGaZmDT5aoocDp6+pAoew2DM2g8AW5koYWnlWurBJZ9M9iE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8173
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
> Subject: [PATCH i-g-t 1/2] tests/intel/xe_exec_fault_mode: Test to check =
the
> access of invalid va
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Added a test where it submits a batch to access invalid va (not binded) E=
xpected
> result to be -EIO from user fence ioctl caused due to CAT error.
>=20
> v2: Remove assert condition specific to invalid va.(Rahul)
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 41 +++++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> index 20a7cf8fe..31a105d3c 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -31,8 +31,13 @@
>  #define BIND_EXEC_QUEUE	(0x1 << 4)
>  #define PREFETCH	(0x1 << 5)
>  #define INVALID_FAULT	(0x1 << 6)
> +#define INVALID_VA	(0x1 << 7)
>=20
>  /**
> + * SUBTEST: invalid-va
> + * Description: Access invalid va and check for EIO through user fence.
> + * Test category: functionality test
> + *
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] fault mode test only once
>   * Test category: functionality test
> @@ -157,13 +162,11 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>=20
>  	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>  	if (bo)
> -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> -				 bo_size, sync, 1);
> +		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> bo_size,
> +sync, 1);
>  	else
>  		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr,
>  					 bo_size, sync, 1);
> -
>  #define ONE_SEC	MS_TO_NS(1000)
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>  		       bind_exec_queues[0], ONE_SEC); @@ -186,6 +189,9 @@
> test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		int e =3D i % n_exec_queues;
>=20
>  		b =3D 0;
> +		if (flags & INVALID_VA)
> +			sdi_addr =3D 0x1fffffffffff000;
> +
>  		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
>  		data[i].batch[b++] =3D sdi_addr;
>  		data[i].batch[b++] =3D sdi_addr >> 32;
> @@ -257,14 +263,20 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			igt_assert(data !=3D MAP_FAILED);
>  		}
>  	}
> -
>  	if (!(flags & INVALID_FAULT)) {
> +		int64_t timeout =3D ONE_SEC;
> +
>  		j =3D flags & INVALIDATE ? n_execs - 1 : 0;
> -		for (i =3D j; i < n_execs; i++)
> -			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> -				       exec_queues[i % n_exec_queues],
> ONE_SEC);
> -	}
>=20
> +		for (i =3D j; i < n_execs; i++) {
> +			if (flags & INVALID_VA)
> +				igt_assert_eq(__xe_wait_ufence(fd,
> &data[i].exec_sync, USER_FENCE_VALUE,
> +							       exec_queues[i %
> n_exec_queues], &timeout), EIO);
> +			else
> +				igt_assert_eq(__xe_wait_ufence(fd,
> &data[i].exec_sync, USER_FENCE_VALUE,
> +							       exec_queues[i %
> n_exec_queues], &timeout), 0);
> +		}
> +	}
>  	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>  	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
>  			   sync, 1);
> @@ -272,8 +284,10 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>  		       bind_exec_queues[0], ONE_SEC);
>=20
>  	if (!(flags & INVALID_FAULT)) {
> -		for (i =3D j; i < n_execs; i++)
> -			igt_assert_eq(data[i].data, 0xc0ffee);
> +		for (i =3D j; i < n_execs; i++) {
> +			if (!(flags & INVALID_VA))
> +				igt_assert_eq(data[i].data, 0xc0ffee);
Move the check to outside of loop.=20
Eg: if (!(flags & INVALID_FAULT) || !(flags & INVALID_VA))

With that modified.
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> +		}
>  	}
>=20
>  	for (i =3D 0; i < n_exec_queues; i++) {
> @@ -366,6 +380,11 @@ igt_main
>  					  s->flags);
>  	}
>=20
> -	igt_fixture
> +	igt_subtest("invalid-va")
> +		xe_for_each_engine(fd, hwe)
> +			test_exec(fd, hwe, 1, 1, INVALID_VA);
> +
> +	igt_fixture {
>  		drm_close_driver(fd);
> +	}
>  }
> --
> 2.25.1

