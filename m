Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C539FCA1009
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 14:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C78F10E8AC;
	Wed,  3 Sep 2025 14:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtZK1brW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B84610E8AD
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756909695; x=1788445695;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gIIiBqMTsggYK5VHvm6HRyDsB0fhv2cK/wgy8M07gzs=;
 b=MtZK1brWzUIUXjXtzZQJLM5GPqF387L1p52SlXv4+eC7U2XH6OxHAG42
 gxl+ezsD2BOEcAlqfhI3EECcBthgnyeDa3e8mWTX4puWnCogVdAAD+Frp
 sMwPYTux0ilbzimrYQaVkRDGW8Px686en81OCAVGZLMheb04QoLqlCfuN
 GZThuObQ692/72oScs39wFIzGR2ZD1cMYK7jL6HyGLtIuUj0WwB1wjGn+
 C7ym5f1AW4U2eoWB/i/EekfNAl+5bLTff1vmre7R75phhR0J0qPKoMddJ
 bttCUhpWomlDxNckHiZqD5zoaO7uJkM/nfgXwBXVBqKYi4Pydf5NnmCbh A==;
X-CSE-ConnectionGUID: DAfG/ubZSqOp1LH2K46FtA==
X-CSE-MsgGUID: 3bD7w+KiT++cUp8zl1hJbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70654617"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="70654617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 07:28:15 -0700
X-CSE-ConnectionGUID: a70H4+8RR7Ch8Mo6K5q81w==
X-CSE-MsgGUID: 7aMdtWClQ32iNga2J5F6WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="202481060"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 07:28:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 07:28:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 07:28:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 07:28:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iak9x0vFJW12K67jr2hyfi3jIQrCBxJaM+43CfHdEsP6HHObMhBArzvb3PUnD8/oIAROQQC3lebRi8r+ylkiI5+6qf8iRon952VcJP2YtE5hJ5xiK3762EOtHLVTM+76A8vFm2Z03muCE2iaNHCFSLvrpWnkNMd5GH2mJsfzp1fko5VUuFB8RlOtQkn26V+1xfMk3CKw9HNWS3wEx2inkdErNMwzZ5pcM7V8z4UYg2npnZfjjX8+6JL+HHhjkg79C4OE8/XoAFdVTKOFUBG9Xgvwv24Av0pPKQzxVk6ierdsAqdQ+vR2UEJ/NlWJmOBSlOs681HQMTtmqbgRKqub3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hhk/uA57hjzsn4u5rFSBx7ci14AbteakR6ozCa/3mk=;
 b=ItaGj+QHivXeqR1O5jBTn+kv6U5bO1lTixVwCzssiBoenuALjU/vATl7p9/uqXNYTIxnme+BvEPPqQ8q1mMNtO0gKNUVKZHfdQU8B6YrLAuWMrrWjLPsL5YTsGjg+KUnc+0/LRQfXsWAilyFPCYkSbSgEacjCnL6Xt1E7HX/FktxsLbVPBLVn6kvnzV8tCkhTispkXIb8CuoWul4dlfexS8cmx/OWePWBMuC4kJLzSmbTz00cBr3pryXplpupSYuZusD4MFpriGlv6Clrqmpyri2AK+EAHC0LUxFSuks7q0dk5sGF+6xpoO1p4bOKujo+2Z/W+56E5Z4OOa/lOYy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:28:05 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:28:05 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t v11 3/5] lib/xe: Add Helper to get memory attributes
Thread-Topic: [PATCH i-g-t v11 3/5] lib/xe: Add Helper to get memory attributes
Thread-Index: AQHcHNz+qRmYqSbi70KA60WEwnDRs7SBhBtg
Date: Wed, 3 Sep 2025 14:28:05 +0000
Message-ID: <BL1PR11MB552501744A8BCCEB0EA873958401A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250903141339.1859497-1-nishit.sharma@intel.com>
 <20250903141339.1859497-4-nishit.sharma@intel.com>
In-Reply-To: <20250903141339.1859497-4-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MW4PR11MB6665:EE_
x-ms-office365-filtering-correlation-id: d099617f-41db-42de-bcc5-08ddeaf618b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gWNeAz6MHICGYs0WH5+6z9fP6i8+1CuAiybbxcDiZX6VSSOw5UEFeoa3bNXK?=
 =?us-ascii?Q?XgOkw3aodDCzz4oXHp6SfWdqcu7jnFs2JXwflnxLcN2JMOuXNl/T1enS7Q8Y?=
 =?us-ascii?Q?hscSWU15lDlR2RYfptVl79LHzTfaLCA78O4g5N9KJOfBqUXcLyLsqJzXfkbD?=
 =?us-ascii?Q?4cAA6JbZOdUv7tm6lKOpUq4llRO/M/Dd4T6QMBiRtb8v88S6RUGd0aant1ns?=
 =?us-ascii?Q?x6RYwWAh+IA8MPM8Qm0QEiP2Y9yb5/0ur8g9temfVQal35wPXeZ9AGhMRhfy?=
 =?us-ascii?Q?nQCcTuGURXnpeFrwGpxTpZiHKb+dvdHnWABimcXgzNjFAvbwAoZtxJqTdxnM?=
 =?us-ascii?Q?gVzfuDM1z671MaWVAHPmN9Cd9SPo5acec3WLF8Qocd6AAOkv0esU8GdVdMI/?=
 =?us-ascii?Q?HB1m2qVPqWNU4q9H1cu0O8eXjOQRLl8mAeOqf324KbJQVY6c6D1HZSuIRP1W?=
 =?us-ascii?Q?s4h5YGe/WCN94hlTpOhgMMFnkZMOJCaxPXjiwF55sUSCI1MYpoOQMuEHWttD?=
 =?us-ascii?Q?7HnYx6jMZFfIMuXUJIDMV0FVzWduTsYxcRLc37jU05FkNgTAE5c20tg7+9qw?=
 =?us-ascii?Q?TZEX7Ugv8uclU5ByhHjVfKd8M0yy1m1/R6MBn/wzBAA+qd6YI2QZ9Wrh/As+?=
 =?us-ascii?Q?ZWJEQlvie667Lp+64BfTJFXDiJx4gllaHoJPXm1VfmkJZz6jRn2Z5MYxRbg5?=
 =?us-ascii?Q?DjIqyvwGEb0wPDXNP7/THLrhoRjAIBQVG+Dovylm3tAGO4F0DiN/A+EiEqBV?=
 =?us-ascii?Q?vZ4Oi494Z8QgPCmjL+x/dhssRShN6guToRd18L23yFkGgJeK14ExNACyuw/f?=
 =?us-ascii?Q?xcBhS3I8FdUP8MPDGuzq8R8cHynDPHOc0v2Femq5shx+2rlvx7Pzdl+/Jwie?=
 =?us-ascii?Q?ZZUPTSfxuRqzK+hEPvOAiubUMLsdngucbnr3tTmHZFNRSS9rfOg80G9xBylq?=
 =?us-ascii?Q?3eDY4Pes0UKJvwdSKmEi4lD9GaJhVtwnMfcj2I6dwBKoKbi5yIIBcnQH/OoG?=
 =?us-ascii?Q?H8Be7nWdM6Ox7luRmIrtuoaoI865ECASA3Gi0DLhNkQyLbMLdTxNMAsnbDfB?=
 =?us-ascii?Q?ZSqFBraIcuXaVEFA7rS/e0aV5SOxE+NnwZTOCnShmqJb0uK1sonl1sabH3NC?=
 =?us-ascii?Q?mnQagC5eItnZLHz90nXsv+/dWFBUGphbjUNRXNz39HC4w9FC2Dtkb5RhpfLq?=
 =?us-ascii?Q?7bHCN5gqFC+Qm4C4gbqRQYAzPzvjct2gKaf7InwAv81r1SeP/PQT9txLgBj2?=
 =?us-ascii?Q?JGgFd5cycvhgAT1LXKcycAdYiooyYeuzsutebNcECaH9agBCvob9KFSvLOg3?=
 =?us-ascii?Q?Xn4VBWA+dDS1c9Ad4p02EhKrYk4OFPYn3e53lbZ1bNviyoLwyjSe7SX8WwBW?=
 =?us-ascii?Q?WphOplmB5ovRC5v0agFeFeF/uKR7B8RN7kavpJdIFfhyEkLPxYeLwcluf2JG?=
 =?us-ascii?Q?gQ1Udq07hrlYIqv+qt1uyWALP6/NnEgzlKnFnxhUkMOV70S3mWiw4iqelAWN?=
 =?us-ascii?Q?0Ipul5GcFI5NOc8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OveRjR1RuwrdzeeAK7V8/9xt+KWh8vuFBruCycEf79VMqD6Jcrl7xaLF+ZNf?=
 =?us-ascii?Q?o67oDyj8jBnW/MLU1rNmpvBSqyyE8rlYgI2fc1UcIrJf2cB2IcymXRf9spsO?=
 =?us-ascii?Q?D1ojE7YsYtIagtM6eMFkd13CSIVFXZeKNIloJc/Z4ErDTIBbXZfD0X8dwpHv?=
 =?us-ascii?Q?M2thSt8gkglGqXDeU0Zo9EgVXojI9BDJxyCK5q0s1C5H3+ycKmY9XABQi/NJ?=
 =?us-ascii?Q?kl2OkF73e/bzFHi6ap4YmOBZyyVeKgfaVJKHE/51rYVu5jpMXaBZTkuM7Nfd?=
 =?us-ascii?Q?dKeNP+7uDluk/GGA05WBFmwdcZsJ6higVGXMUoXndSmaDOnXVC82xOSzdxcl?=
 =?us-ascii?Q?zkaaawBUGb1t0rgPlKRWdtsVAoIY8M8y/8bUYe7wyENj+9mgzkhvFq98gmRU?=
 =?us-ascii?Q?MJptQKiP5NTfLIN+t7ZlQHc7CN1s5GJ8CemtNLkXVVjp6kQ3ldirdYNbxmak?=
 =?us-ascii?Q?o1oePeQf6Jqhvma/4SFN9K5TzxtxlwdfWtSdLej0wZ1znnmpv78aHStngjzp?=
 =?us-ascii?Q?TZ/M039J7xvdFzWCZ3GGUO81U8oKvISLJmiHgx6BKzK8mjgYCo3sskM/U7/e?=
 =?us-ascii?Q?OVb9szTqjgzz9fUNKCNOASqDH0uN79VsDD4H1wQKzrTNLpgLnYCbpthvruia?=
 =?us-ascii?Q?qhex/9EdAieebfWYFT706cb7dY7jG3HrwQ1KwiAfpHUf/6Qu0TqA0Ghw5b17?=
 =?us-ascii?Q?RwRNVwrKYhfL1RJyf3Ub5eJDXN3RkKovSxE1AHtNSqjJhQN870JJEiRraH0G?=
 =?us-ascii?Q?p6m2GkL/BcztrJ+xpqlN8p16ZvVPrpNv3oT9mA+eDqUcDF6QVF0IiYnH0yRh?=
 =?us-ascii?Q?1a6Xmz0JrvxNEJvyLV+gMBnX0r5RThP1z+WX5yjN+99STzhzL9/+lk2vxSXI?=
 =?us-ascii?Q?yshS+39zkDk1/bYpYlJAG+XIJyr5EBdYwErys2st4SEgECrJMKO0TubXxnO5?=
 =?us-ascii?Q?m4gqv7Rpgp0JCicX+ZL0OnNrDhur8luRSrvia4IvN6NZFaDXe1la20aR84TF?=
 =?us-ascii?Q?20WTFO7heg/fz8Jixzqxzf7ibyY1Kca8ikQSEh8vjnoc8KEhRDwvkLqpu5H1?=
 =?us-ascii?Q?ZvfDqEmuhKQhxO1CQQkfU498v5+onVwpKhEMRTUdq354NzYOEfZ3SrlblUkg?=
 =?us-ascii?Q?ye80Mr7T1vUq7XlbUwF59LIHA7hHgjQKvhAGKA2BHfPE1tmXtAQe8tFZz4GN?=
 =?us-ascii?Q?PY2lp+U9Yg1LbehNr4h3OXPrvGFsgfF52COKTtt6EkwxnTcYWLH55Ix66Hif?=
 =?us-ascii?Q?llSkPDFC5us2DWadB/oFdVbVkNA7PvuyL11ancxPWXCnxar/BxzVtc0KyF4l?=
 =?us-ascii?Q?QrXW7fkq+l7ZXzMJAQYK7aVDXxVZVAL4xYGMm8EsJIdG0cOQOzeOKFIIPBn6?=
 =?us-ascii?Q?urjKfSDcD72AFJyxK5J2YGSRj7Uc9X6ppAjaeA2y6I8ESl6a7m2vP5J+5Mb5?=
 =?us-ascii?Q?HOsJIt4/TLewsBkjFECky/H2OiQ4TKucvoMO9gjR9ZgRWvqQC5yNKGDIcJ5o?=
 =?us-ascii?Q?ddZRt+NqokVRVlzlGavHNWPR8Q1APp+o6kvGdhMiNeEkEM/DxR2YWNgLPvFp?=
 =?us-ascii?Q?9nR1YgH8Z62saEs3t/VBBOg9wEBr59MJCoVg0fLHEBXx+vsrieb9H0/4rp+5?=
 =?us-ascii?Q?0A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d099617f-41db-42de-bcc5-08ddeaf618b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:28:05.2976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Mr0ug1nmakLxY42BUuGI13/jIotY/8tbfoHMM4BKm0H8L3Xc8CF4ALbJkJqOuhFmzBzctl77+aWCXwdz45mqpSxLk5M8nJrXyfJyxYp3xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Wednesday, September 3, 2025 7:44 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t v11 3/5] lib/xe: Add Helper to get memory attribute=
s
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> xe_vm_print_mem_attr_values_in_range() function added which calls
> QUERY_MEM_RANGES_ATTRS ioctl to get different memory attributes from
> KMD and then prints memory attributes returned by KMD for different acces=
s
> policies like atomic access, preferred loc and pat index.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  4 +++
>  2 files changed, 96 insertions(+)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index 5608c8780..28b7d=
5bec
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -57,6 +57,98 @@ uint64_t xe_bb_size(int fd, uint64_t reqsize)
>  	             xe_get_default_alignment(fd));  }
>=20
> +int xe_vm_number_vmas_in_range(int fd, struct
> +drm_xe_vm_query_mem_range_attr *vmas_attr) {
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS,
> vmas_attr))
> +		return -errno;
> +	return 0;
> +}
> +
> +int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr
> *vmas_attr,
> +		    struct drm_xe_mem_range_attr *mem_attr) {
> +	if (!mem_attr)
> +		return -EINVAL;
> +
> +	vmas_attr->vector_of_mem_attr =3D (uintptr_t)mem_attr;
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS,
> vmas_attr))
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_print_mem_attr_values_in_range:
> + * @fd: xe device fd
> + * @vm: vm_id of the virtual range
> + * @start: start of the virtual address range
> + * @range: size of the virtual address range
> + *
> + * Calls QUERY_MEM_RANGES_ATTRS ioctl to get memory attributes for
> +different
> + * memory ranges from KMD. prints memory attributes as returned by KMD
> +for
> + * atomic, prefrred loc and pat index types.
> + *
> + * Returns 0 for success or error for failure  */
> +
> +int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t
> +start, uint64_t range) {
> +
> +	void *ptr_start, *ptr;
> +	int err;
> +	struct drm_xe_vm_query_mem_range_attr query =3D {
> +		.vm_id =3D vm,
> +		.start =3D start,
> +		.range =3D range,
> +		.num_mem_ranges =3D 0,
> +		.sizeof_mem_range_attr =3D 0,
> +		.vector_of_mem_attr =3D (uintptr_t)NULL,
> +	};
> +
> +	igt_debug("mem_attr_values_in_range called start =3D %"PRIu64"\n range
> =3D %"PRIu64"\n",
> +		  start, range);
> +
> +	err  =3D xe_vm_number_vmas_in_range(fd, &query);
> +	if (err || !query.num_mem_ranges || !query.sizeof_mem_range_attr) {
> +		igt_warn("ioctl failed for xe_vm_number_vmas_in_range\n");
> +		igt_debug("vmas_in_range err =3D %d query.num_mem_ranges =3D
> %u query.sizeof_mem_range_attr=3D%lld\n",
> +			 err, query.num_mem_ranges,
> query.sizeof_mem_range_attr);
> +		return err;
> +	}
> +
> +	/* Allocate buffer for the memory region attributes */
> +	ptr =3D malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
> +	ptr_start =3D ptr;
> +
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	err =3D xe_vm_vma_attrs(fd, &query, ptr);
> +	if (err) {
> +		igt_warn("ioctl failed for vma_attrs err =3D %d\n", err);
> +		return err;
> +	}
> +
> +	/* Iterate over the returned memory region attributes */
> +	for (unsigned int i =3D 0; i < query.num_mem_ranges; ++i) {
> +		struct drm_xe_mem_range_attr *mem_attrs =3D (struct
> +drm_xe_mem_range_attr *)ptr;
> +
> +		igt_debug("vma_id =3D %d\nvma_start =3D 0x%016llx\nvma_end =3D
> 0x%016llx\n"
> +				"vma:atomic =3D %d\nvma:pat_index =3D
> %d\nvma:preferred_loc_region =3D %d\n"
> +				"vma:preferred_loc_devmem_fd =3D %d\n\n\n",
> i, mem_attrs->start,
> +				mem_attrs->end,
> +				mem_attrs->atomic.val, mem_attrs-
> >pat_index.val,
> +				mem_attrs-
> >preferred_mem_loc.migration_policy,
> +				mem_attrs->preferred_mem_loc.devmem_fd);
> +
> +		ptr +=3D query.sizeof_mem_range_attr;
> +	}
> +
> +	free(ptr_start);
> +	return 0;
> +}
> +
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)  {
>  	struct drm_xe_vm_create create =3D {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index 8e13ffe65..14245=
eeec
> 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -103,4 +103,8 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t add=
r,
> uint64_t range, uint64_t
>  		    uint32_t type, uint32_t op_val, uint16_t policy);  void
> xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_=
t ext,
>  		  uint32_t type, uint32_t op_val, uint16_t policy);
> +int xe_vm_number_vmas_in_range(int fd, struct
> +drm_xe_vm_query_mem_range_attr *vmas_attr); int xe_vm_vma_attrs(int fd,
> struct drm_xe_vm_query_mem_range_attr *vmas_attr,
> +		    struct drm_xe_mem_range_attr *mem_attr); int
> +xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t
> +start, uint64_t range);
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>  #endif /* XE_IOCTL_H */
> --
> 2.43.0

