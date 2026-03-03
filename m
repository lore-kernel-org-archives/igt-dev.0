Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9D2E67A96
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 08:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EAE10E65F;
	Tue,  3 Mar 2026 08:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjSn7jtI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278C410E65F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 08:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772527090; x=1804063090;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Sw6pclGp/GE4AqCSQuHCfKtYeOtcQHaIE1nDUlUm9Is=;
 b=OjSn7jtIHdm8yw7IdshkheQG5IOnKIm+GCPGhNN4XCbO5qXyY45FRJzs
 tJ2nZVr39g+3HZxxzu6fCAA4nG3vsuilV9bKLmUfky6H6Fn4vM9yLOxro
 Mg+G/0L9W6pbCHztliC227YzQnm1UAY5/u8sZwEsr75yegf6nTTlVD0FJ
 MMm9VFKO6cz+L1uiDkUd5eDUteSZhB/aPt1WTRwC3s2wqL/VmJo8wn2ZQ
 o0uvCZgNzqol0F55ov5F1Z3HV22mf5wfS36qZqxbn412eAvY+AkodjchM
 muHb4rkZLZRaNlU+PiMfhvbwama5iHHu7MDSgML7tEGBagvqBxtKoJ5OC w==;
X-CSE-ConnectionGUID: 5Y7XxfJhS52ADEfa34k35w==
X-CSE-MsgGUID: ob2/dz5oS/mn0XDvlMIfVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="83895316"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="83895316"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 00:38:09 -0800
X-CSE-ConnectionGUID: XVz4QsoBQtGe0co16HAcMQ==
X-CSE-MsgGUID: lf2WAXPiS9mCDaMR3GuAFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222592414"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 00:38:09 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 00:38:09 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 00:38:09 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 00:38:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrX/2IvfMuZvcFMlVdXitPTnHZILBduWt/grl5mrgrHSqRdSNXwxBLcNNUdxcpJsfPmgQRktXqMDGNcS+hJHhsax1qAEf4XQCUbP1mgEhZug6YXuMzimhabv/vSzZQGQ/LcudHxKB70nmqyIy3gD2uHYSld8/Lmt3flwkdH0MgSdn3TDB3NoLCscdfvISM88iwWUxGVbIZXN//HWg1qGH5nEF4xxHUMSu5CuYQ86iovpU4V/r/Nrz/bj/4r4bKfZ7Jwb00mZyJFxZ7G3U66zuzgkNXcAPenQeWjAvdgY/NaBuwZSesm+3DYraioEIv6tnUhTjYwzGXqxf9hZHSW43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngCnlbHN+zLCr650fVtRXYDcS/kE9RLZMmPajE5arSI=;
 b=YzxF2lkbSp++2gCz4H5fqRwNkE/Dp8AAXk+5chsHNWWz/t3LTO7b5EZgvTcKajAL/mwAZzVXRJfPBNIXrD4IaBVuGT5+xJq0ye7kf/vRSpmcwFzmEhV/N2kvHSDUkOnik2F6aQ0cFujNXg2ZraqqYGU1ySOYaw78ZIbWLJI2QXabGxoS38l5CyrKuJ9fk76G5uU7dmshlb9DKyuhd8cexhGeboJWW3mdXbEC8Zyo7h6oK0eZe8hS19KFPvRNavEjFY3y5lRku6BDbOlcVHmv0HH55RLA0sywngfjUkjRYeS1kKiAR/ra7t7zFfhmpdhT6Kh9iqhN64W4owGZsLDpPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS7PR11MB7834.namprd11.prod.outlook.com (2603:10b6:8:ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 08:38:05 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 08:38:05 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Miszczak, Adam" <adam.miszczak@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_threads: Initializing
 exec_threads array
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_threads: Initializing
 exec_threads array
Thread-Index: AQHcqtd8QwokhGmKl0+T4M2bw7gJzLWceMaA
Date: Tue, 3 Mar 2026 08:38:05 +0000
Message-ID: <CH3PR11MB84341FDB31AAD20A4BDC4D5D8D7FA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260303063154.489637-1-nakshtra.goyal@intel.com>
In-Reply-To: <20260303063154.489637-1-nakshtra.goyal@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS7PR11MB7834:EE_
x-ms-office365-filtering-correlation-id: ecbb71ef-db31-479c-d0da-08de79003073
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: 1+FAvCeieZ5x+T62j4o6sc7lRu+ZkcfCxsikD/lqNqyDqXxSR/j3oINvYkUGJNR+jhRyy+G66/Q2YFYga/ALr8TIZj/UuU/tJ9//XSolxL1/A3MSYjCGunpv2kEFhqMTzVKrqJr1d+KZ6iqN4FPLyo8brg2UHUMPwqahuMK7z8H3vnBIAnta3hGKBGFKF1SpesfxfjUztkzN7hSQoOkNLTDqbYaFvWtLPDIVud8P7RxviqiHvlOfmxgdjDggBriQ5i06AiiPrfjcVwLivAVpmMEilzP0sqzxvt8ZuNgDZJXp4kjN1XGs8/PZtt8I/wyg4CQblB5oS3Y1Jo4gwSDNd56oIsaWHMtqiDkUpmt8BHnGIIL8XRxYG+No3JDmmYPEhNxuwA/Er7gH43Q827N1M4AdOyNxByTBBCQgCtiga3czveRQNXLt62R5xqPP+pyY/5QFplWJ6/NqJ/T1LVm1sg9s7Ci21FsCU6eRDX0aRxIx7f4cvLCuwuj7tNGM4m72Kl3hTtxBGnZzcI0tt6TmDqKDBbcQOZMfibLaXhifBTfr3b+2VHaUydGml52x1ZWBfYdyq2PZh/xercb0kgBF5Vq/zjww2dLkzhHg/NK7AKo62VOZ7ZvfidDdPhB0jt0Y5DdsoSAZ9GPIQDqMY6oY0gdvWg7tV9MTHZ97xmkVyB7TjPVbesfMZSMalgjxS4B9YI/S7WifcZ7QiFQBnu35znPp6N/BR+rHHD4SdzO9gBIfJhc0vLSAUtXbdHV2OgkCeKig6BFzZG/IXMZjkbVHmu+GWYSFZY925KQ2e7fu/Ik=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qzjc8QqngYs1gLCfZyyUdJB936dbIryuBWktpJWArLBcqKvxsTBHa7SIy/Xi?=
 =?us-ascii?Q?t8GnIu5KPIm+Xji33GfjCThCZzwpTo9h7QOomWd8nQYA9XgRiCUD8g9Jnk2U?=
 =?us-ascii?Q?enowci4UJCgTRxwqdMcwDxYr0EPpTiLkDAjztGOucXgET8+bADTYdx0sKToH?=
 =?us-ascii?Q?r7qlkCbVmkkkjUdVQ1i66unu/veHDbcdPcV2/ejZxl/cPr3E4/csSKhkR410?=
 =?us-ascii?Q?w1PPLUulCz02Z/mnCgbbL4/FXbtHiKiF4Q2YCGgVxFGYjhwgwVsEji27pkWE?=
 =?us-ascii?Q?RrxaNsjJ/jY/OZluBgH4c74G1nuXPhfZlJ6zDaQGCkUVz0Wx85e5wqw3hmh0?=
 =?us-ascii?Q?ktTb8uhm00DlLwpEmFO+sNXWGtHTpgn1K2/7SVDM7CGpJXSxLN6cRyQ7s9Hu?=
 =?us-ascii?Q?i1nM7KBjrq39luZLGspgWSnu1isCTANtzczu9m5q0bqppiCCiYz8ojqLbHsP?=
 =?us-ascii?Q?ppRzjsAhGSRMhuj0k2/TW1bA3DCfstIvoQRDEavWpx/xSZ+vkFnAAtfSd7XL?=
 =?us-ascii?Q?CUeM4Nq56qFxl4YhkZSXSRF/LSEgWUzBzTpfkA2Xv6392W7AHCmF1s8HYozH?=
 =?us-ascii?Q?BXxL6U4mdi9/7HDoHOVE4yAYU+NtoW6g3YgI1sNle8Ae1u0+nHD+5xrduIKq?=
 =?us-ascii?Q?7roiw6i8c46AVcICCsMTXoofobHVb0wkopdktCP2zifV7ccS7OftV817t/Ao?=
 =?us-ascii?Q?s1HhjXV6h+yoLqWY0E4R19wllBNPYmzN6IU5Y6JcEbk7yYz3CRPf9F8JqOkr?=
 =?us-ascii?Q?y/CXo/2+7+PH7AV2gd/JoNuqE/IQmit9X1zx5qfIf/cd32K4J6y/rudhsjDU?=
 =?us-ascii?Q?PlojwblzzctpkaHlkDOB0ekkmC04YIL7n70036+XUoUifOr/2w45cfFTbroL?=
 =?us-ascii?Q?YJ1OmH2BZ3G+wanp+1d8tmgNKzSSG7r4pi0Z52ot5k66exM0T1HzgHcHC3Tu?=
 =?us-ascii?Q?EYHJsy+7ok8m6NdJHVX0jxpvaZjhnnLgUogY4GSwacp+iuNpHUD/1gKeEVCm?=
 =?us-ascii?Q?grVIaduGsny4FukuVhUjg/iIklaWSZQ6bv65AU/+AjqAApEipALIyfZ6Y0al?=
 =?us-ascii?Q?3aA+o+jBqjF/3TVSEu3OrfUleZWfCcZXOly6ZApikIVvKB6ikSrlQnalEYug?=
 =?us-ascii?Q?H5D0MR7UprOX8WEf5Ce7zveJnaO1/YQx78E1iq3oVdwOGUsbjjx3QuEwt96f?=
 =?us-ascii?Q?u65MAiqLFH40UarF1NzOuVza194PK/YjE+p/zLGqJmya4MYDfYb8LW5TBYVB?=
 =?us-ascii?Q?ED7BhopKRoLcVAcLM4LkHwmAGMjA09ajc0/CgyaJxfK8rvJs0FIUejr0ET6k?=
 =?us-ascii?Q?CzEZT3lr9rORQ/1GYvKTu/trngnDgEIHCMh8uewCILcfF3jWrzKoTcpkfhpQ?=
 =?us-ascii?Q?zMHzjGrqyV8fsCm1U0p2a5N/J115+KKSIXL20hot+jWPQJERO80F4AFV1+8V?=
 =?us-ascii?Q?sp3pDq81F1StQ87Xged50/7aKTqQFS0Bj1S8eAP3lBEGZ5L+redV85Ezdkgz?=
 =?us-ascii?Q?jhfuCsGa6Lyww+PcNO2bHLz1+/d0W3Sv6g6X1f1sWDSRSHlFO2zJqYZwDGGk?=
 =?us-ascii?Q?lTBef+O9CojSqXLQJJ6dROH8vAr+flUceqiF5MuOz+qfZev2AluhIYik8SOi?=
 =?us-ascii?Q?6B9Wb2mmmaqxgI6m/by+tAN9w0ySrDPzjIybxPfQq1Jax3H19WjmpCPdDTc+?=
 =?us-ascii?Q?Su6tIziW+l8tYhjOEbfGn8W0+FBxDszSIuWDRWW6W5AHLwqq0ACqyrSApsFA?=
 =?us-ascii?Q?yxetb9ykUQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbb71ef-db31-479c-d0da-08de79003073
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 08:38:05.2998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Roi2mmhJIyka+GVWLviSRXlNiEr2zScMG4f3FFzqhQX63So0/6E19tq3l7Stbx6MoO2w6chZq7l3k7zAZAhcNLG/Av5y+YBgw0QMkAh4s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7834
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> nakshtra.goyal@intel.com
> Sent: 03 March 2026 12:02 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Miszczak, Adam <adam.miszczak@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_exec_threads: Initializing exec_thr=
eads
> array
>=20
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>=20
> Initialising exec_threads array to zero as threads-many-queues test fails=
 on
> initial check to non_zero condition , it takes garbage
> value(non-zero) on first iteration , which call synobj_wait on a synobj t=
hat
> was never signalled.
>=20
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.=
c
> index 27d5a8928..f082a0eda 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -502,7 +502,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr,
> uint64_t userptr,
>  		.num_syncs =3D 2,
>  		.syncs =3D to_user_pointer(sync),
>  	};
> -	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES] =3D {};
Your approach is correct, but the below approach is also correct
                        if (!(flags & MANY_QUEUES))
                                exec_queues[i] =3D xe_exec_queue_create(fd,=
 vm, eci, 0);
		else
		    exec_queues[i] =3D 0;
one more question is across all the test cases, why can't we initialise to =
zero in the beginning for these arrays, so that these kind of bugs can be s=
olved?
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
>  	size_t bo_size;
> --
> 2.34.1

