Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183B8C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 14:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA1310EEF3;
	Fri, 17 May 2024 14:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgLPcp6L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22AD10EEF4
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715957325; x=1747493325;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eMpP2UHrGUoiBR79jhWC/IrjAq+DKeYHFO4pmrF1XwE=;
 b=UgLPcp6Lf5qhYBC2FT5snfPKe7+vjXgSy60gaWAEXb84Yf5XJmR6PDEy
 y7oy31iWCah04uCgZts/yVvY2y7XK2mzd1XOV/y2SAj4Sg63QwB9/dwcI
 ODyqcgEzJYzxKxpGnoG/YWdPSZTwMaM4bHoDwRnc1dVuWg5pi5jAzRKTW
 ZQvvjJIPIDwA42HhFbnEM6bb+iYNkYgQPn0T7eqFQbANuW+/OQZEgWnMT
 6CzLwD5vjDrMy7GhQhPJK4IeyPgDEveeyJrvyRYRWx/cHp+YzoQ5aUSFb
 +JPR9sBW01fTxkp7VVytAvrlnGGUOnZ1cWNfAc16qY6pMIZC99rMzQeFr A==;
X-CSE-ConnectionGUID: tOS6w8wXSGiGjOvXz533Pg==
X-CSE-MsgGUID: iXai0vlxSeGPnqeSCsHWpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="29640263"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="29640263"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 07:48:45 -0700
X-CSE-ConnectionGUID: 29MmuUKeS1+puXc/l8RxCg==
X-CSE-MsgGUID: X1I/2UkbRKCdvCZUDsMwbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="62645297"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 07:48:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 07:48:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 07:48:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 07:48:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 07:48:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8g8wez/is/4J8TWXeuj7Erm+lnGxUcAz3WBwlo7oS3IM6DQ16KS3elswVnk9s4fkUQj3bA4gtLUlmc4GpWzaFALHqvAY2fPu03ZY08Nz+JaXt/QviVxHM83AHvIZVg1VULoHacfD9uzPSIGe0NAPhis8nZi/3EEGVRvX2wCtLR7H8fXdeIhUmHbMX0Q0syVRvZqpEMc+6aigzUxuW6+GUj9HM32kXqIZcM+Md7u9qQP2atjZ/V2a78Y8QanrFr3fESfsqV3/WIJSd3souutaLTxhDH0sSud//6R9YYpbnPePuqwWyhDpERPvOnX3hzj+GZHrlfZcR9qXbVmNIMToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU23AlUMQGdLxyrBQuBIslEBma7MBjwXA/EB64Gh6WQ=;
 b=eRkkFeUuIQ9O2a+3yeMj63EWHvIR4uuu3mY6o6OudN82/WRPBhLuDmrlwtFFQk6Bvzr761RQdu9mlY1jCghQCzlQVKx1qoIZQrpX9XuNzB+q07B4UYNV5LVojLvhcwpcXOtnFMPLbCqiW76/pMu1ZYBz834oQgg/UNQ1U7mnsLaAQe6rh5+NrQx5FFx3z4s3+34klwQODlaMsIf8D+VwQdk/QTd4Gp0rrXtAf2ait8BQ/OeO2d5XXOd7jlExUlRuZ5aOEC9eC0gAVTNxslnYkPt+3W7wEysDT1aFDYxxzxBEkhHI0m1CAUgbE3yuVUpx8yFmtmPhzi2JwI0DugExJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 14:48:42 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7544.052; Fri, 17 May 2024
 14:48:42 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH i-g-t v3 04/10] tests/intel/xe_svm: add random access test
 for SVM
Thread-Topic: [PATCH i-g-t v3 04/10] tests/intel/xe_svm: add random access
 test for SVM
Thread-Index: AQHaqE/pICKhRHD7YE+osI/K5ur+a7GbgYXQ
Date: Fri, 17 May 2024 14:48:42 +0000
Message-ID: <SA1PR11MB6991E848D11B914BB911B41792EE2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <20240517114658.810283-5-krishnaiah.bommu@intel.com>
In-Reply-To: <20240517114658.810283-5-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH8PR11MB6802:EE_
x-ms-office365-filtering-correlation-id: 1d2c2e93-eac9-48c0-fbb0-08dc7680720c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?cUSiQ/nREvAMnH8DSuhCmAC0Qh3wTCI8SgAO0WPjkx1BTkIXQu3BxT7oMPE5?=
 =?us-ascii?Q?pk4vaflvAFHeUfbPsQgkAA41OqqUrAXMJtMC7t/P33mIVd3ueNa7H4ujPQFL?=
 =?us-ascii?Q?3lgHhGMHd0nfBsdzqqN07SNuZjQkbAeTOHHFDqJMG6BPU1Twhq1Xws4RR8r5?=
 =?us-ascii?Q?mD0mpouwvxc2OvmpIh/6oWogJmFHGtPmAqck1SRT/IgoQ1phnzaG4wlbkAxB?=
 =?us-ascii?Q?dXK8NJkOcKHv8XUs4U8vbP4KONhpDY7PWAGZQQFkBHVFtFmqDTJWcCUoXIRi?=
 =?us-ascii?Q?jy779IKLGe/hTa2UVeQA5J3Y/h/Ku94lDz24apxwsZc9nv6lrrimAOj4ReG1?=
 =?us-ascii?Q?p5HAaYXL6L5Kf1WR4u48gcN2InR4375a5to7uuuy4wcgKEIUiOubwQa+tMVI?=
 =?us-ascii?Q?O6HLtwfLRtr43xLDHrs/kRhg7fE4eYpA3VUaRZWt/BfXfW9xDPSN2fQYKGxv?=
 =?us-ascii?Q?FAxYXGdX9fersVlPnpBV+a6wQ3F0jA6lTi6hSHZIS6gMROk+KBzVCUAIR+oG?=
 =?us-ascii?Q?0q0RXHs1qVsNawpeSYuw/1OX1kFgRRAVYtnN2gPdaeux4vEftmk2RSZsP5yF?=
 =?us-ascii?Q?mLrRAvsY6wtEphOVifM1nkui9FtQmr69KhgbEZ1BAG9w6xHFq0i0IHvtcsPX?=
 =?us-ascii?Q?llXwR9emB5ELlGWOI28zaL0bvjaauTSVEa6xisfqKMniv9FjWZfIdPf3lXHm?=
 =?us-ascii?Q?2F9Z7AxOLLrX52P4iE9w3o9NrQsTl/cXw450mbOPqoyDIRCWfS5dvO5cj3Aj?=
 =?us-ascii?Q?2RbLcJIAae87WghKpyQScXHEJmsxOEgdqmDKjqFe4n2re5bOVENRVj1DmSih?=
 =?us-ascii?Q?66Ii5/b4v5YP4lD9Pbo8Ntu/XGyAzddzW5ldRauaKr1YAEj4oKDCcQxJsdB0?=
 =?us-ascii?Q?aqIirZi+ChF1HFJ0p+ex9HNyJ0+eutskEPdvneWZwbOkjCYwTDfSiMn4A5l6?=
 =?us-ascii?Q?nKt5X3HNRb9cKoiJrqeaoOM15RCbZxkSQ4pyACAXC2Cm1iLvcZV+qown6v6m?=
 =?us-ascii?Q?vDq6r0q6d/yvkMGp2TLPV2HOkZr8CfSHYmr/9NqpPdRMjqtNGDpMAtUCJj2v?=
 =?us-ascii?Q?tfm8O3OAdksbRT+2T95Xt/rOwxA3I8RJ9GiCKDj9HuwPix5fK1NxOFVxeWsB?=
 =?us-ascii?Q?YQI2hzMEFfH9q5FMGaoOckJpXuzM5aDFwalizo0zmPAfEFcA2ySLI2Xsk9N4?=
 =?us-ascii?Q?6BtaRNsRgiX/FREjpVf87D2SBkCdpJTt3v7Y92aL3p0zFSRszwQV4LR5g1Qd?=
 =?us-ascii?Q?WKR+E/QNxGaQv/TwB66ZQf7xY0d5iU1ERfFVs6FC82gv4Z8KJq3JgDQbIttN?=
 =?us-ascii?Q?38EsDHfYw+DjWzbePf3gqI8jEspa8aPJyeeae1rIfvBFGA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?427XmeWbBXd8gWHP/MXSAq2ikWJOhKTQ57QR0dx5o5R/hCAQFIbHP0H/YlIL?=
 =?us-ascii?Q?LgL+ReD2rcayM0Cu8RDM84s2oXOyZtxbiwoUbxS3r4CBHJtCEq9GNVjhL+SI?=
 =?us-ascii?Q?y+mfQTzN9ffeyX3S6+WVt8lVpNkcTGsUI8O8BFHm6fFAfFUcChePLNgOVOT1?=
 =?us-ascii?Q?hwn6JX3ydhvwIsDum774KM/zMFGnRwjdZBH6wzawN+LIGx2M3CVVf7q72V3c?=
 =?us-ascii?Q?iF/LAypLKlW6cJM7t+hfbX1d5ICCVdoJfCqV9RWs0ySym61nOnVEZTzK3L47?=
 =?us-ascii?Q?QXCpdVTeLcwKB4MDMtmEhKG7zV+xNJXMRrDyQR5FvZNlIZEzUTW7KW4salZe?=
 =?us-ascii?Q?Y4Kx3Tl+2PTF+VPXGnW5ezCb36141rn+4k/50fVGsWNj7/Akw3I5vtn2GLqn?=
 =?us-ascii?Q?Us/QEAIVNBqf67KjWcFXNhYvzt1WjkbEFKgJC+JpMezfXuC6JqzAXzCDd26E?=
 =?us-ascii?Q?Bs98LpBHcVfc4+icUPxHs0ZjqkaEN7W4gjpVuxl9uUaT1tflPwcyarK13MPk?=
 =?us-ascii?Q?lAy4GTuKgUFQ79V1XuuRjcMhN5+Gfg0+AL6Tz+ZO51W0PzPlIIeJAzTfwjDg?=
 =?us-ascii?Q?kLohJ68P0j+4SEq1ftyu9dlTcZN24LSV72A0Nv0x54TI71lddls3ssDiga+S?=
 =?us-ascii?Q?hb2FKj+IG+T5cW71hB1Cvh3x/HSIVdDB57EbnvC6gfVdDy0utSljoEYtiaHr?=
 =?us-ascii?Q?G8li4WM/Kmgr1Zv6B8xa7jnsiy/EVHzwA9XJRIYFsniJVlPrx2yYGxAZ8Lli?=
 =?us-ascii?Q?89/g4VrNAaaneBUgy0mIjZT2pzUThwX+0MtNtJXIykQIHVpPpCrsldu2NTmW?=
 =?us-ascii?Q?4sS/QJ5Tvso2xU1OsXQTBFF5HjyFRgOVWFTO7CUh+kNvrkPrx7WZvicxGSB9?=
 =?us-ascii?Q?JKD5CKT6BD/Pe7Q1fdob5noObd6XVqekgE33AVcl8YUz9LwG/71yHPU9PAcE?=
 =?us-ascii?Q?/PweMtsEAv/1jrVsSJ6u8KmlJflhz+cJOf/6zTmsAAa8q3M4g1rG80yMCUr0?=
 =?us-ascii?Q?T+euWeM5ALfZK2Z7kbOgv8lCKgp4EioAL8XoESYerZBg5nDpWMxv5wGGTs+/?=
 =?us-ascii?Q?e3W6dYQWrIcWzAvKx5mIqMoRPEQ3syVFcIg9awxpLNDbIRGiOUFk5jRtnaV0?=
 =?us-ascii?Q?pB3KGAI7YC3E08wrPM5BxH1Fp9C4J+Arikl8ZUxcA3xsQF2ykc6X3tXNaN7S?=
 =?us-ascii?Q?1GvQscW2bPBqZyfx7ovaf+ZVRdESCs6pC9ap7gNxFLRJGQ4UYoP9bjvOAC55?=
 =?us-ascii?Q?ihShhI6K5GE3Y4BZUkISmSBw6mqHSBLTjD/VV7rsroLJ8lACL2Jmna6j/wap?=
 =?us-ascii?Q?72xdq2Wk1P9b02PzMacxRLlohnCHlzvI1laUrxONsyia1PAilwVsnwS90ve7?=
 =?us-ascii?Q?LJTuhaZTSgYwaLL4Gam4zarwU3f5Nlgx6+lp2HsW7OmZWd/2V482g5rwuxA5?=
 =?us-ascii?Q?9lnGw0V9Anrift6i2w+ycCMe1Yb8lC6kjyfVLwvVlhfqpSlYsGeVpAevpA/C?=
 =?us-ascii?Q?Uk8KMTXMqXguCArTf0mBJ6HMiWPy0G7Ag5EQHdSsfe/RWTJE1t4Vg2JYyHnj?=
 =?us-ascii?Q?0bo3dBzMW6/wwh8FPe0YIS6P5VLUcRJTQOJ5bi5s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2c2e93-eac9-48c0-fbb0-08dc7680720c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 14:48:42.0479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: poYvNFFLmrxiaD1M5wwd3nyLdVruQwK+jRhj/JjD98kQOFyK/H7Zrb5gQ+gG5FUQx7FzR8MyGnC2zDQCXPQfTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
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
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Friday, May 17, 2024 7:47 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH i-g-t v3 04/10] tests/intel/xe_svm: add random access tes=
t for
> SVM
>=20
> Verifies the Shared Virtual Memory (SVM) functionality by randomly
> accessing any location in malloc'ed memory. The test ensures that
> the GPU can correctly handle random memory access patterns.
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  tests/intel/xe_svm.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
> index 741961529..73a232c47 100644
> --- a/tests/intel/xe_svm.c
> +++ b/tests/intel/xe_svm.c
> @@ -27,6 +27,9 @@
>   *
>   * SUBTEST: svm-basic-mmap
>   * Description: Verify SVM basic functionality using mmap.
> + *
> + * SUBTEST: svm-random-access
> + * Description: Verifies that the GPU can randomly access and correctly =
store
> values in malloc'ed memory.
>   */
>=20
>  #include <fcntl.h>
> @@ -119,6 +122,40 @@ static void svm_basic(int fd, uint32_t vm, struct
> drm_xe_engine_class_instance *
>  		free(dst);
>  }
>=20
> +/**
> + *  @brief Verifies GPU can randomly access any location in malloc'ed me=
mory.
> + *
> + *This function tests the ability of the GPU to randomly access and corr=
ectly
> store
> + * values in malloc'ed memory.
> + */
> +static void svm_random_access(int fd, uint32_t vm, struct
> drm_xe_engine_class_instance *eci)
> +{
> +	uint64_t gpu_va =3D 0x1a0000;
> +	size_t bo_size =3D xe_bb_size(fd, PAGE_ALIGN_UFENCE);
> +	uint32_t *dst, *dst_to_access;
> +	uint32_t size =3D 1024*1024, sz_dw =3D size/4;
> +
> +	struct xe_buffer cmd_buf =3D {
> +		.fd =3D fd,
> +		.gpu_addr =3D (void *)(uintptr_t)gpu_va,

Why you need uintptr_t? same to last patch

Oak
> +		.vm =3D vm,
> +		.size =3D bo_size,
> +		.placement =3D vram_if_possible(fd, eci->gt_id),
> +		.flag =3D DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +	};
> +
> +	dst =3D malloc(size);
> +	dst_to_access =3D dst + random()%sz_dw;
> +
> +	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst_to_access,
> 0xc0ffee, eci);
> +	xe_submit_cmd(&cmd_buf);
> +
> +	igt_assert_eq(*dst, 0xc0ffee);
> +
> +	xe_destroy_cmdbuf(&cmd_buf);
> +	free(dst);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -143,6 +180,10 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			svm_basic(fd, vm, hwe, true);
>=20
> +	igt_subtest_f("svm-random-access")
> +		xe_for_each_engine(fd, hwe)
> +			svm_random_access(fd, vm, hwe);
> +
>  	igt_fixture {
>  		xe_vm_destroy(fd, vm);
>  		drm_close_driver(fd);
> --
> 2.25.1

