Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CA6CD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 05:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F169C10ED37;
	Mon,  8 Jun 2026 05:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAJwUyF5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE2A10ED32
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 05:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780897934; x=1812433934;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o9vk6LmcRnrswAI6WPfXrWxbFyIh/IIcVQMBO9l2L5k=;
 b=aAJwUyF55gDUAPnNBM/M0c2IJWeqXqnRl0ywU8LU8GtfcwbhdyjGubv2
 HCdE8RIXbYrkBIIPqPZi7cZkssJT2IBd1HfyZHhBURwS5gogxmcYZO/af
 UcbAx5qHAc+0VzPa7uDZkGlXIegWwY87/hnjC8DfbsJT0+IMV8xP1d6U7
 2ZYnBxyoWyd5QHdeD3NnjodvCXEI7t7jo1TLMRinCkjadKwRztlJXlVOf
 V622kQeTT06xaAAC9oXCNjbqrB9E5vYFpeAXqgkp6oPNHLv1sg5UOiTqS
 20x19mZQfop4F3OqJFrXKqWIIcoDDbcXk0XEnAMWWwOcpKJelNiWuqLHh A==;
X-CSE-ConnectionGUID: KB4MxWXXSvaRTHtTHUvHgA==
X-CSE-MsgGUID: t2uPtC9FQjyXSzkj6j24qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104285162"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="104285162"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:52:13 -0700
X-CSE-ConnectionGUID: fmADETArTDm9LSXzg0ml1w==
X-CSE-MsgGUID: c4+NiqZLQQmFyfNmMaLdcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="245507975"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:52:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:52:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 7 Jun 2026 22:52:12 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:52:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDVG2INQUVagOnbbDw3jt5TsCHXOjNd4a4relPtVcJMjAHsDBczMPQngST+eKdl83Jv+QMyAWSurT3cTW604XBWLeJcmbiMspa7IBzvYurC16Tsz6pnKT+A9N78dYVz4KgHbTUIgpjmeSRqOsTRb9P0MwCwlUDulMXpHJDZse86d8CDNO2dbayoj1JokybwNC8ONVzxTOkuPi23gq827gJhqD1pUb/KTd3+5wGspe/D71EbgXZIK+BHuU0z9UNWO+1OhOSJCei8IdK9pGjEiSKrqDhbaYqj4bA6dtmAPenx2UgvPrCn7Te0blUB7vC1IM6ygcgzBTufCfgwvU7heuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNJw5RaYueXXLJcD3TOldEFtT8SFdeVreFrJY4/BLNc=;
 b=eR32q2746m1qN/gnqwBllJHCagjbLaNldJiG62NOOg1Yt41wWRpPtXnT81r6AT+ZE5C4byinVpoH6OBs6S9tfWbpg0+CdYeheZgb0iwHrDV8eBQzaArd1dnaQMUMpU7sylfyEKahxx5MDr0EFy10pk5xk9NJyBWQh58njpZozeGBcKo19TPHVEiF3uQ/cAwq5qFRzyMR0k1KI/fELXR6va1t65TUGG4yhsRqew8YOBmt7RZybzfpGpUI4S4kb0Mtz1jIg9PCm9Al8sfDs0cNw36Hqhyn+gUf6bPZYyDra/exQv8pa7KClVsZ8bJz2ka9VsR6JxLkdfqc67YP+qbNIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA7PR11MB9595.namprd11.prod.outlook.com (2603:10b6:806:4d0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:52:08 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 05:52:08 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Chauhan, Aditya" <aditya.chauhan@intel.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Girotra, Himanshu" <himanshu.girotra@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_reset: suppress expected
 CGP_SYNC dmesg warning
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_reset: suppress expected
 CGP_SYNC dmesg warning
Thread-Index: AQHc9Nc2aTmQOHpKsEeRFJCYysB7pbY0LA4A
Date: Mon, 8 Jun 2026 05:52:08 +0000
Message-ID: <CH3PR11MB843477785A19EAA084A1AD5F8D1C2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260605103632.3297911-1-aditya.chauhan@intel.com>
In-Reply-To: <20260605103632.3297911-1-aditya.chauhan@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA7PR11MB9595:EE_
x-ms-office365-filtering-correlation-id: 1c235a42-a86a-45e9-0fcc-08dec52213a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|56012099006|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: MfpmnJIVFfnmdNhJhiGIlVwQg5Qoa7jeYTseAclQ7BXNP0sPqiKWoNrnL9hu3K1azW4JFHENkyd/tUyNI/VVWirVsqw3NyvvQ25W3j6jWRCIu2qOSef9QW4Gnjh12RoBeKxrLjgTJZ385izgjwxlfNrWCCtDR3d6TTxposqJjxAfCZWYdRE2d8pgKi7hN8JKUMQGiqobE2+0Py9ntHBNIcX/SLWsMUjUjsRhIOyTtSENLOnDr/GbW9rhrnDtYeoXo1Pfi9nAfYPSVVaUY4zfF7JA1NGJCVYH9vf86IhKtnRmbIr9yHpEoPtp3JKaZp1ZRuwDxhiLEJrlbCa2OYpyKWqzwb1+EIlJar/KV35XwhArq56UZ8FW4TdxWGnSC80cFKPngrV4SP20bUkyqdJi/x8utdgEIFatoiNDGjMx0zyjEImjMTB+kxlI3uP9qLb3eNHN3cnMY20KWQ5NKMum+aGQLYgwa34FsUfpTBwDdZn7IrsyR7T1U3VMnLYZDrnsfJMJO5gQ0BBDgK8BAG7QuDxtT8fxjSu8HagGBaIX1h9kZ48cb3SrqjuLQp4HZbYt6WmnIUIotBoa6hUyk1wd5Xgl1GaGFun+LHFoD0xAsWfemFrpcBBEojuvdifuzE6OZQUJaRV3Dc7pZWQ7cHey1aIKGGuxO9BmiovBs1/3RFA7S1bBJS734GNwXO+Yx8iMeY0Lzz+p12fKEHjzDTBUBqIQxQaCFzirAK8RbcGwlZR5Lx25pE7FemE/Cj+ztzDq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(56012099006)(6133799003)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dchcgDhm3XSELeiQ9ZWX2VTg+qzQFf6QzxQ6bUOhgVPS6l0VK4g2mgmbQH3Z?=
 =?us-ascii?Q?u0XNylu3xjqZJC7i73WDsaBTgim4cT3UOakYFbL6w5Zb8LseD5XU4Bu0M3+O?=
 =?us-ascii?Q?/TuqWjEfgIQU+WgF1Ilo0W//AVzC9qkGdgEAl6xKpvDIRnRRWFZDhHGJ+/cW?=
 =?us-ascii?Q?qxLl+T4SQ5jv6NZVZP2lFqEMhGsplov9wmDukszGrE5ZTsxMBNtADj412SPK?=
 =?us-ascii?Q?zdytfdeXFc6ZLeYFib1Ct+F3sGVzlcQz3LYOJucJzs0J6CEiJYFGlegoAOAp?=
 =?us-ascii?Q?/gMq3257dk156t3f9Fkt/Ec9aD59XqWKtKx2zaGiO4wOyuRo4gngP5yuWsCi?=
 =?us-ascii?Q?GeiQkQ0NyLMG2E5w9J2HpfKPbrmcSriQbgI1U32K2jeElbSJi1KjaOQCr/TA?=
 =?us-ascii?Q?iaR72WWUaA0gLPp+SlI66hYjS56rDv1Nh0h+sMPz2AhPs8ApmxKCT4yffs6A?=
 =?us-ascii?Q?OeoF4OPc9zu9j2MV+5tVMYX973swj35u4s14GZ4FPOuhUk4L2vzgGX+BmoU8?=
 =?us-ascii?Q?/x64bO2JmSvD9QOT8k9xnPYjvSyv5Q799KcYTQZxDtbRVVeFcP4QMOD7DT3F?=
 =?us-ascii?Q?uBtmrLb2NyE5as0mPz5a+2g81Clc3k8sYUlfZJvjGU2mRhi27jR9HPnrZZWB?=
 =?us-ascii?Q?VkeZMOHgNsEAdrdYjxsBlBKujmAqF1+E0YHhBD5Pw7ARGzPkF1BIqJZj51Ft?=
 =?us-ascii?Q?0LbS9HjVizLVy9Re0yk5CpJpIf3C7CIaE1g3Yi2oW3XoqjSOTM6ntppR58gD?=
 =?us-ascii?Q?3S8Vsc4+/A7+yNPADC/jgJCMMwhPc5CBu/yYtHnIyCjp/BDiYRiZJ7rgk05V?=
 =?us-ascii?Q?qU20ZoMQaMoWs7X4C/TSmvyrUcpz/qsCm6YFnpI8viggX8/ywInlsK6vaJPo?=
 =?us-ascii?Q?hFFhtRGuMoPDVfcBtt4+8EZLansD2vC2qxPucAuur25XWNw0qBDDI22cpe1k?=
 =?us-ascii?Q?pmW7QcM54kjF7NJR1h+yEPY29/GkjfxPsMwkdfxeygStiGOUMLz41Mlnij5A?=
 =?us-ascii?Q?aa9daYWvYebc++2KtEgWa8MloB7hH9pYpY8HaKbZai7gAcFqlqXVrK57QWCi?=
 =?us-ascii?Q?ZUPTTA4t9we8oaJl0u49ut6d8wlSCM6mBJ5mvZXY8aGee3ptsDZDlKolBUwr?=
 =?us-ascii?Q?mOjT1snr1umqFiURGaihrj9dnMFqX7kNF2uoidHUNbIbLgcorKuKuJVeve2p?=
 =?us-ascii?Q?Ikh4uLlnLWZrLp1gYzjsQoTQIhQxF7dpIKva9bkWLzKDemaZ5sEir/eRg5gI?=
 =?us-ascii?Q?aENbmoltzEr6K16sF0rMm+fusBpjBVSISIzApSbSKG5IsPdkgD5zlGLc+Nbr?=
 =?us-ascii?Q?QrBUGz4P/D4JvafUDf6j4XjSHv1RD0ayNvMEc8OQES/APMgQcMaoGI1n+UDv?=
 =?us-ascii?Q?waZuwuF//nsGx/Jst0bMV1a4s0P0iBTMMIyW2AlZOHP7IY2MF5oAgPacNNDV?=
 =?us-ascii?Q?XK18xHl6sY8upy9y3/Iq5qVAc9T1p27OG3CRPiLhXZ7evvR2sl5kNHBkm3U6?=
 =?us-ascii?Q?9fm+I0uRTdQSjAmMmEmrohta0cKsPT8dSze8RMYv+aya83IdmYbTkXpqe0Z3?=
 =?us-ascii?Q?bgLSi4aae8bOTLn6T40GiNLzLMoIrqnful/6+1snGJRcp6uIZXpT2ehhXzFY?=
 =?us-ascii?Q?kdYpUqEYv7m6qMPThe6u7mLmWuXJxAVoSyxKX3beGjXvTtpLYQh5oFs6LFdB?=
 =?us-ascii?Q?XMW3Hr9ZJ9ruiLpMycyeengdvOih3ZbO/sYzO/Fe1/pg59JV8Oz2yyg6EWBP?=
 =?us-ascii?Q?QCvRd7uY/iZD5bBa4KbQVlab8iIqCkE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Q64XkMtqm1I5QjzeP88sTDekkBJvCmp1YxmgMZi35euq6t2K4StQZAkX9zrE3weTiQc1ffGO7UbWPSf93qog9ieWGwXuIHsnNvqY8MDI7DgJuUwF8aEp3tU0QZyaCc0fxalS3n70VtghmaNi9Zl/hrd+RLO5hAcWZYr0wlETAq9ej5SHaPvt90XiBxdwIYsNGFQHA3E2kGkqPi1e1COb3/qqC3RX/92CWOfPkHEoa/DnVzNE2CxYvYEL8xSfhCMEmvNthsBtiBXsJETqIOwMjLr5qXnFyOkdNalO+96/qysB1Re2UBMJA36eA6M5es0I9jJuyF96y/I3O6D4NA5M7A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c235a42-a86a-45e9-0fcc-08dec52213a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 05:52:08.2036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZhUka76BBF4n8YpDo6WRpj9XZaBnPtwy+FmWHLNkTCz0YDnTBDeetemohdtRm6zKu1VYAEq9OCQDg3So678NPlk8sk+++ckLUdJULiy++Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9595
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
> From: Chauhan, Aditya <aditya.chauhan@intel.com>
> Sent: 05 June 2026 04:07 PM
> To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Girotra,
> Himanshu <himanshu.girotra@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: suppress expected
> CGP_SYNC dmesg warning
>=20
> From: Aditya Chauhan <aditya.chauhan@intel.com>
>=20
> When multi-queue GT reset is triggered, it causes the kernel to emit "Wai=
t for
> CGP_SYNC_DONE response failed!" at warn level, which is expected behavior
> as  the test intentionally validates that CGP_SYNC failures are recoverab=
le
> during GT reset.
>=20
> Suppress the warning using igt_emit_ignore_dmesg_regex() in the multi-
> queue-gt-reset and cm-multi-queue-gt-reset subtests to prevent false dmes=
g-
> warn verdicts from igt_runner.
>=20
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c in=
dex
> 89a47d236..dc1ae7e99 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -29,6 +29,11 @@
>  #define SYNC_OBJ_SIGNALED	(0x1 << 0)
>  #define LEGACY_MODE_ADDR	0x1a0000
>=20
> +static void ignore_gt_reset_warnings_in_dmesg(void)
> +{
> +	igt_emit_ignore_dmesg_regex("Wait for CGP_SYNC_DONE response
> failed");
> +}
> +
>  /**
>   * SUBTEST: spin
>   * Description: test spin
> @@ -1104,6 +1109,7 @@ int igt_main()
>=20
>  	igt_subtest("multi-queue-gt-reset") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		ignore_gt_reset_warnings_in_dmesg();
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(fd, hwe, 16, 16,
>  					    GT_RESET | MULTI_QUEUE,
> @@ -1165,6 +1171,7 @@ int igt_main()
>=20
>  	igt_subtest("cm-multi-queue-gt-reset") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		ignore_gt_reset_warnings_in_dmesg();
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_compute_mode(fd, hwe, 16, 16,
>  					  GT_RESET | MULTI_QUEUE);
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> --
> 2.34.1

