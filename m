Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB035CCD192
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 13:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C40C10E7E7;
	Wed, 15 Oct 2025 13:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSpk3f1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862A010E7E7
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 13:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760533869; x=1792069869;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PVERqTFxOVbK4qAmbsvhZhnMfYlFSR6qzjNgtM9xH9s=;
 b=nSpk3f1xn2ELbH24CB5IncgX/Ofd5ZCJetZOnegejdIJoDqRRk5d+ml3
 dY82d8mcRP/h0uFIJ1M6V0OHawIvsk46OQEPhPjYXNbFslP7gv5+NSdWy
 wfaFIxp0CfO2rYkMzftY2N/K/m8s1CdOKmyn5PPg8b5enb4W6nd8qYjVM
 xK5xSYFaV4Nd8/W8VqBsiXO84W4pthfH2ZhpMpo4VbRPeNAKjRfykl6mV
 eKlSDap9MVdvO5Wrkfa7gOcYY7xyTpDQBj+tUB2bneF0hqwK0FCJvG8A7
 i8GF4wk66qhbf57J90eeb6qMjZp1mQECR0Cld2a8P6vKoBFaIpmaXEIZL g==;
X-CSE-ConnectionGUID: YHfq4rzcTeiuO7SK03rX4A==
X-CSE-MsgGUID: QYqtvTOtS2ClCnXytmewOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="80341770"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="80341770"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 06:11:09 -0700
X-CSE-ConnectionGUID: ZpeKHRYcQhmielLFovuGoA==
X-CSE-MsgGUID: 8GF94TNqSbaVAoJ9QTTRGw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 06:11:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 06:11:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 06:11:08 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 06:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0pYD3b6/aV++pJoxJaIQu909RimBvsd3veOzjPzH3vjra1JPdg2+6o4YE/2tsUxQpbDgWxZmRS2C/tIgR7Q/5zZetYANIFeWkFLKqKy26T+Dpi/gD9AYlDkVZ/9y0Jvw+H63UC/7Ko069/MdPgbtvKaHL5ossoAG1yVFwvYr5nnzhBxn07O/usEjc8G3g3fR6X/5j+8tEdf+jbIs1NGqDmhakp7rTathPGgpZCost4JI2SSbMeipsUt/xxDSlJc8WzxD1AOFhYb54JclP3w7IA3Njdlqs9NAQOzAtAge/bcZYolM6KtOH27uDuUkUhN9ZKYo/VKb6BGKy0sxKairQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7s7IoE2aD2/Y32SRy9Cv42YU4e8vYDqzWx9tDXN37I=;
 b=pXKOKSERL8y7DeuIunX81HTpIKfPw3qu3prPEQ/QSuQmXdPRqJzOAP2J/4otqIVO+GV10jMPlTK/grgyKDE00Fr7+g/XRDGCaDfBaH5XnNL2pHz4He7LxhacxRIQqiYsIDDDoU/Q/8Qt+L1fvlYtkIMXvPq0AOvuIlSL7YIYpULwljymXb33TseCLvR2LSnsQ7ell/ge9JpqfU/EBT273tpJx1kRB6Pm764SAPn0I3Wfti3XdTCoHdN5jEE6HHPT0N1R/jXBA8Ue6/XXB9L4AMHvJ2UTnDg13nVph/6wR3Y8XTnBzJJ8Y86ACoN9huuNBUYLhswyg5PFenWVsOmetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA1PR11MB5801.namprd11.prod.outlook.com (2603:10b6:806:23d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 13:11:01 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9228.005; Wed, 15 Oct 2025
 13:11:01 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block section
Thread-Topic: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
 section
Thread-Index: AQHcEGFYD3P8acaJKkSGrLHR+kwgXLTDiNuQ
Date: Wed, 15 Oct 2025 13:11:00 +0000
Message-ID: <CH3PR11MB8434996C70D65178C30E5FD18DE8A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250818165742.2648473-1-matthew.brost@intel.com>
In-Reply-To: <20250818165742.2648473-1-matthew.brost@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA1PR11MB5801:EE_
x-ms-office365-filtering-correlation-id: 7a969944-cfa0-4814-6e49-08de0bec49ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jgW0zCRgE3OTqhJIsDt+WyZSPKTlMH6NH2W2fNnWGIoyE/pN8cCKAPlWyLbZ?=
 =?us-ascii?Q?XaTpn0ctDSZo5SwgDAZOCtLukrwqgKyLf/B717TS42eRKyhf6vuuuJfWgLU4?=
 =?us-ascii?Q?YmGSPmW9pPw8QfBY9+tA2SohDuExw79lcmmaSUiFyZC7NXVQvjc23YRYS9YL?=
 =?us-ascii?Q?12ppwjEcaX0YlD4jUuDfb4FeT03grIdpybbtxZ21CbGP4jnXy9cuNyY9i2XY?=
 =?us-ascii?Q?8nz+lfk6OYzHjnQnNRXUTtu75M92PDkYBWKCd4cyHLxAZ64g91wUqoUox7Z/?=
 =?us-ascii?Q?QEGdPlFuXPVXqXJyTkVt/OQGfJ7rwRFkePsBHWD+e5U6mftM99hjAEwsK7ML?=
 =?us-ascii?Q?bvp8PXgpSh54aONsF1U2Fxmezz4mDddeZsuldGMUYdcKOS+xIAy/5ukb/SMV?=
 =?us-ascii?Q?sTgPWkVBUA2A33Ux8Q0khsvNOPqEhu4YndbYLGYjrbFTrJEPG1scqpNdzqVh?=
 =?us-ascii?Q?b0EV9g8TfA8Y/KaIttT5iW1ABJjAzrAfjr60lwz4/6hM/2IfQVRiwCaqDEoO?=
 =?us-ascii?Q?ySjqR2u6hrbkdI/4U/MpLB6XKeFoL2OFsDlquyEk0+x+WQTGVBTz9dFEG2TD?=
 =?us-ascii?Q?Tdn6MmvsKxm4RzzLY8r72kFAmgnTP7X4TfT9Mv/MoEtif5BuZEfhCz8GQHaE?=
 =?us-ascii?Q?4zTPydkWvSMR6/TvTEJnVsDOW0+OJNB408zcJny6NsEH2hUYgaKQhFbtWHg+?=
 =?us-ascii?Q?SXwEoGo5Kzhxpz0C+y40+KNHMfoQVsVkIW5/K+3B8eG2d1zhzaM2bYzMAZJ1?=
 =?us-ascii?Q?uw6e9Mv8Fjdeec8GvK1u49vWngFgMMnL2ASEATOCn7JihjWaG1IotuBkTiut?=
 =?us-ascii?Q?x8UaXYftLM1SyXUaqDfGIMrkkSDTYnjVcq8G7a+rqieh3UCWQWtEG9oJiQP8?=
 =?us-ascii?Q?GxEJk3aE4GUHp+DnANw7W+vpCIDE5xsaXpOJE7Cx06DbSV+7eUyXP+5PG4nP?=
 =?us-ascii?Q?5bKGkoA5Hmc+EwuDDReURBVvrXaSXv0fCE4RYU8nAfn2E2rEFUbTx9KIPO5w?=
 =?us-ascii?Q?ZfJuyQUcY3dgvSdHwmUY42JnoKVV/R4B+DIeGdMot/xjD3Po6xXNN1/HWVb7?=
 =?us-ascii?Q?BfLblprHp6CcTgtzjlO8pT63/VWB3iRVbyXisP4O8Iz0N+cD9iv3iQ0WZ2yB?=
 =?us-ascii?Q?LBqHdbIMQ3Zg7zEoJpgEvOPDmgjhRyqwhfZoMtsL7I7UZfdACY2l3/jC0YG8?=
 =?us-ascii?Q?ABDdbrw+nTm/ea6vvVRMEizhvWe+HR4qOLH6tACObp00ae26qKkIaFfSj7bj?=
 =?us-ascii?Q?dv1QZbhuaVlzwEASD5+tsdC12IlIbAwupEVdhylv4zDLxtIiEwIMBOFuUqi+?=
 =?us-ascii?Q?73E8/+1gg2YdDBOJHiRlinJwzHpAkEz/KO0//axQ7H1cythf3nhkSFE39cDf?=
 =?us-ascii?Q?hjUaIBFL1D12c3Eq4/y9ksAFTmALrAkhovbje8kkz/sAFqbI9SZOj4KVuqTe?=
 =?us-ascii?Q?KNK8dFw/zXCGDMYtJjXJPtYasfyejL/gUD0PpDH0Ycx5qas7iHBBLVl0fzLM?=
 =?us-ascii?Q?0P3bOolB8WnOZgnhqP2bJ9rlPnSQakBArBSt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eFtMTe00tKSV4k2v0OmHSZKVVCSvSQpymIAR40R6dRoJVYLpNHQXspyTsURI?=
 =?us-ascii?Q?xZTHHSkH3B/IHEWHVkwXGlBIvS1EJ/wgfuTKDJSs4lKPuPJdlHgxnFiVxvMb?=
 =?us-ascii?Q?mgMMMrRBpzVHkWoKNdA3Re22nCbEfFefqEwsPvNY+iO5bt0x6dIXndmYJ1Q0?=
 =?us-ascii?Q?KPp4k512+35XAmPFDpda9Da9Lc1nrNKkPlElsgcd7YMHvfzVDxQbNhwRZBd9?=
 =?us-ascii?Q?ZFPzcKA75ub4rfPUYmpQ5z1h08pKz+5ZZ005SjeZd6YopaQ0jaddJI9DJZkx?=
 =?us-ascii?Q?OHm7XqbEIy6UpS/3HqFvuhWhJewxSDQbJuIOCXwrEcTxww9wXBNNf3BjnCWc?=
 =?us-ascii?Q?Bke0Wq4xmBAgk0+NuMPJeYm9X0FUr6pWljRAZ4SCm4efXSZzeb68ks83ziAs?=
 =?us-ascii?Q?8P0yomCaK7ap+h7vf9LqCSPgj2bcVNcoUz4AMgxtSLzJq93QFRsDJOF2ZJ1M?=
 =?us-ascii?Q?Yy+MqhGDe0S0aBYuMoULD3RhG6mU21aTAEOWDjaHqobpVE+8x2bvOBjwqOiu?=
 =?us-ascii?Q?AgXnGvmYIdS2/4ETCLl9z8iFIUdaD/5hROPfZiKkEOjGkhQekPxP0dekBIGl?=
 =?us-ascii?Q?Xv8stJcuxMN65SyrLZnq76t5NqU6tdMQ59lqwv0pfmM2TkIbJpzPeecy0BqS?=
 =?us-ascii?Q?sxXakGrpPkoJyu/vpm+AtQZ5Q/PB6OatTaF1nGUvJJ3JO8M6HZcPeGdEacNO?=
 =?us-ascii?Q?6Fi35dFXf/3nD6MKif5zp8C+fV9H9oMiD4pixQbeGRAkL7XSse9Kzck2fJJ2?=
 =?us-ascii?Q?khaelaTvp0ZMdkXuXdAynGzKMFPlsZnvdnnD/9qY3Ml1YTtRVRdsiwPr6TuH?=
 =?us-ascii?Q?eu/a2w9M0UF8eDYF68f7EP8q2v6Sf/i496BEz0vpQ0nO//YKZ3TiQTKFK53Y?=
 =?us-ascii?Q?4zVv67297FEWMJY04p75eQUYyTRj723OhS3m0/BIK69kTsyLIJlcg1LrGcNo?=
 =?us-ascii?Q?Fly6xrlFwMYAOsDmzcOGTdqvQ9uAKyUgMudYVKXjaofOFFWcwRKyKsFlng0B?=
 =?us-ascii?Q?SiBvQYtAHBwlTYp4sZfSwhKOYifIeJzhAWDmk3R60e5Ej45MzfjRHsFtMfBk?=
 =?us-ascii?Q?VabD6BcPZ1rahXcX0ktUsPg03LoNJAmWaK5w2bBpaxDYcNFClkXiwVMfw/Fp?=
 =?us-ascii?Q?krE7mSwHcqRyp1L0aS8M7GE4X06QACWNWm30AcMdBHQMCU5m66904c9WDDFO?=
 =?us-ascii?Q?H52k7NUtjpHSqIrXYiVWNZFfcao1J5cooeFJjmegaUa0iHG8Z9SoTlT93+2/?=
 =?us-ascii?Q?LxO1fMGaYGlId4IY5+3Cmj3pET0RmQc7nVs77gFHu6wGfhRO3LSTfpBUoWV9?=
 =?us-ascii?Q?7s9NRI7b5NgehVTE5R+JKt1/TcqdiCvoLneJkBlmMLKCIFS08f+yPKWIls2e?=
 =?us-ascii?Q?BzSh7kodo0MfZIGSQ6tQeBZcfeHAWGewuYKD6Uvn+8kSo7O7XVY5I6sWYEqb?=
 =?us-ascii?Q?L+ScqTA6qxmUxg1B9HiWyJPcOoy+l8Uls6gXycTRuKQFaLgQ8hC/bj/0wajd?=
 =?us-ascii?Q?C+HnrRa8d9O5YJxxtImbNf+dQQC3bYXuw3CfsMFxnzB/RWf72Lx3s0IQZ7qg?=
 =?us-ascii?Q?OUryy7T2Lfjr4MD818+C4DAHax4sFktw3WR0050k4BUkSXxueZLdo7xL4qUc?=
 =?us-ascii?Q?lxsabmQohxYwQ1WNCqZQ3nMLYcLyHmZRMDfmSXXfmgWJNRUkkEiK0P3IIDP7?=
 =?us-ascii?Q?p2lvsA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a969944-cfa0-4814-6e49-08de0bec49ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 13:11:00.9471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y8AFEFC/1u88GKnjfBA10WgB71XoAw+Cucw488QkKD+le3kcEVNlt6Z5TiFcWTkT2WLVUzx+sDXMk2BPly00WBN7hctOdgUTryXRk4/blYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5801
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w
> Brost
> Sent: 18 August 2025 10:28 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
> section
>=20
> The non-block will become invalid and hang until the test exhausts all
> memory when LR jobs are tracked in the DRM scheduler.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 113 -----------------------------
>  1 file changed, 113 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index b904dc76b4..316f7322c1 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -320,116 +320,6 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		close(map_fd);
>  }
>=20
> -/**
> - * SUBTEST: non-blocking
> - * Description: Fill the ring and check we get expected errors.
> - * Test category: functionality test
> - */
> -#define VM_DATA		0
> -#define SPIN_DATA	1
> -#define EXEC_DATA	2
> -#define DATA_COUNT	3
> -static void non_block(int fd, int expect) -{
> -	uint64_t addr =3D 0x1a0000;
> -	struct drm_xe_sync sync[1] =3D {
> -		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> -		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> -		  .timeline_value =3D USER_FENCE_VALUE},
> -	};
> -	struct drm_xe_exec exec =3D {
> -		.num_batch_buffer =3D 1,
> -		.num_syncs =3D 1,
> -		.syncs =3D to_user_pointer(&sync),
> -	};
> -	struct {
> -		struct xe_spin spin;
> -		uint32_t batch[16];
> -		uint64_t vm_sync;
> -		uint32_t data;
> -		uint64_t exec_sync;
> -	} *data =3D NULL;
> -	struct xe_spin_opts spin_opts =3D { .preempt =3D false };
> -	struct drm_xe_engine *engine;
> -	uint64_t batch_offset =3D (char *)&data[EXEC_DATA].batch - (char
> *)data;
> -	uint64_t batch_addr =3D addr + batch_offset;
> -	uint64_t sdi_offset =3D (char *)&data[EXEC_DATA].data - (char *)data;
> -	uint64_t sdi_addr =3D addr + sdi_offset;
> -	size_t bo_size;
> -	uint32_t vm;
> -	uint32_t exec_queue;
> -	int value =3D 0x123456;
> -	uint32_t bo =3D 0;
> -	int b, err;
> -
> -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> -	bo_size =3D sizeof(*data) * DATA_COUNT;
> -	bo_size =3D xe_bb_size(fd, bo_size);
> -
> -	engine =3D xe_engine(fd, 1);
> -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
> >instance.gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -
> -	data =3D xe_bo_map(fd, bo, bo_size);
> -	memset(data, 0, bo_size);
> -	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
> -
> -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> -	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
> -			       addr, bo_size, sync, 1);
> -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> 0, NSEC_PER_SEC);
> -	data[VM_DATA].vm_sync =3D 0;
> -
> -	spin_opts.addr =3D addr + (char *)&data[SPIN_DATA].spin - (char
> *)data;
> -	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> -	sync[0].addr =3D addr + (char *)&data[SPIN_DATA].exec_sync - (char
> *)data;
> -	exec.exec_queue_id =3D exec_queue;
> -	exec.address =3D spin_opts.addr;
> -	xe_exec(fd, &exec);
> -	xe_spin_wait_started(&data[SPIN_DATA].spin);
> -
> -	b =3D 0;
> -	data[EXEC_DATA].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> -	data[EXEC_DATA].batch[b++] =3D sdi_addr;
> -	data[EXEC_DATA].batch[b++] =3D sdi_addr >> 32;
> -	data[EXEC_DATA].batch[b++] =3D value;
> -	data[EXEC_DATA].batch[b++] =3D MI_BATCH_BUFFER_END;
> -	igt_assert(b <=3D ARRAY_SIZE(data[EXEC_DATA].batch));
> -
> -	sync[0].addr =3D addr + (char *)&data[EXEC_DATA].exec_sync - (char
> *)data;
> -	exec.num_syncs =3D 0;
> -	exec.exec_queue_id =3D exec_queue;
> -	exec.address =3D batch_addr;
> -
> -	while (1) {
> -
> -		err =3D ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> -
> -		if (err =3D=3D -1 && errno =3D=3D EWOULDBLOCK)
> -			break;
> -
> -		igt_assert_eq(err, 0);
> -	}
> -	igt_assert_eq(errno, expect);
> -
> -	xe_spin_end(&data[SPIN_DATA].spin);
> -	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> -	usleep(50000);
> -
> -	exec.num_syncs =3D 1;
> -	xe_exec(fd, &exec);
> -	xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> -
> -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> -	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> 0, NSEC_PER_SEC);
> -	munmap(data, bo_size);
> -	gem_close(fd, bo);
> -
> -	xe_exec_queue_destroy(fd, exec_queue);
> -	xe_vm_destroy(fd, vm);
> -}
> -
>  #define LR_SPINNER_TIME 30
>  /**
>   * SUBTEST: lr-mode-workload
> @@ -570,9 +460,6 @@ igt_main
>  					  s->flags);
>  	}
>=20
> -	igt_subtest("non-blocking")
> -		non_block(fd, EWOULDBLOCK);
> -
>  	igt_subtest("lr-mode-workload")
>  		lr_mode_workload(fd);
>=20
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> --
> 2.34.1

