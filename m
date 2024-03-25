Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0104C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 14:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8928B10E916;
	Mon, 25 Mar 2024 14:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2Dm6Wo8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C8610E910
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711377089; x=1742913089;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iUU2VV2afDB0s7VcXj1zoesO2Z4xZscZiVKKF/15XJ8=;
 b=k2Dm6Wo8BgmKYiCYz3/04uyRP4YnaCUrenkdMl6QGhqQHAhbtiJr1FoP
 4gMBdLSIb92UutcERIcVUAXr3y0O8LS8a9RZGT4zoCKpGB608oRtTE9ca
 I2OL7ckG37k8Jmk50D7KNRcd2oIh2Aqt53XAw/NpYMbtSece9f2K6VJds
 joEPTnj7G4Aie8I/ARoiiPaHMjDaiiUsPV0SXiWRAugNM0DauprO1pF6L
 tyWY95+4OSLPcU8B3fandPV4jq7qBWB20BeWUCxr+AOsr+nDXt85iZoxc
 QrN/ZFGgQfveSn5ECNqejAFyl0Kpaw69lbmCRiAuOeZ7FOolilpQUtKSL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="16924739"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16924739"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16306376"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 07:31:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 07:31:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 07:31:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 07:31:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 07:31:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKyI2C8/ye26eQFI9PwcfxkdmnPz5B0uplnpWeK3XhU+9aF2Gj6BlnEx0wiF5u70VKLskGkCx1qHjFqFeMl88ZwpC1Ww9UQTSoAl1xOaCHjfyrMNerkeXUfPrRYKjB4YTRk8KHyJ6cULQsmCw739/ENUz/nkemwfwrsIW928NXKk8YOVt5/n3uX+E8BGMJYK79dz2++DNsfxNxfTGSY0EuvJHhkADTtxg49o02eocD9NYc6+cZpZWV2LPSGf7FdLoK8pbPpoUDC7yxZsZ5wPvrgJ0+XRr9xLB3vuxNDRIG+XOB35BBWgYt5ahEYK55M5lnOuxwfrI56p1My93TCSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmA/HooNmlSqJHfnZ3b3mcTPSrJLOYMv7lDiyJOv0pc=;
 b=Sj/O9c7sliEEnxccqBQM8/rCY5zBhrRXbBlpjSQqTWqwgrml7PmyLp59i0VBEzvrS5liHIw+s8sjorDBMOoBXDhZbZ2pc3sJpNfTREakYnB6NTKxK4GGcRytSdxhQkVL3lzHPFXQhxwaJnbhk8WxOcZNOq8zVcev8e/5YPbtPOZaUJGxUl57lESOHJIQGRxA9IIgEBQg4eWm9YQ0JYRk7s3JZfwiF9jf4nK53qpFMZOsbut2rPIfILLBIx9wYXK2QloxHmOfgshN39DYqv/N9rrG7Y42SKRBSzyzvjNDww24rCHO24BfLkQPgisZnG/xmTvHhhFcMFi2ZO0ZU5hOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 14:31:25 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 14:31:25 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] Fix WB caching PAT index for coherency mode
Thread-Topic: [PATCH] Fix WB caching PAT index for coherency mode
Thread-Index: AQHafK37tsFiGMQhN0KS346R02W0XrFIhnfA
Date: Mon, 25 Mar 2024 14:31:25 +0000
Message-ID: <SA1PR11MB6991C3CD7E9FA0D83F8C6F2E92362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <3f2c5a052be93e68e44d203f164dbcc36941e34b.1711148627.git.jagmeet.randhawa@intel.com>
In-Reply-To: <3f2c5a052be93e68e44d203f164dbcc36941e34b.1711148627.git.jagmeet.randhawa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MN0PR11MB6157:EE_
x-ms-office365-filtering-correlation-id: 0e858acc-5e6e-4d4a-5a43-08dc4cd84084
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8kGf/owL3oL8bWWFMNZkinGdaw737zat1A9K3FDmWo1EYqltfQSwinCoDmQ5c+ZmtkQZEJWdL22SivndE+sChmaJER2VCmj1dItbfO/6L9kd2EQDbBWFoDvYaInOKI5iPcu6MZRr9IhOraFJNkyK+HeIFljRrrPnx6l4IhpgwHVKo9fbwIwWnIm5uE+Jdj5Pcz9VHhE+dE6WHTzvWeZMUNRaLiGjYQScea9G/gSR7S3OspUVx7lfFJH/kLpgKMLzEmrCen42wirFDsMP/xC0jjqLMdFxutOmJql+8QaeJ7vdWo7nKvtFvDrDB8yTdCHbqTh9qHwQy/9x5vrbznVCSGEq7kK6wS77Rs/R0yGiIxz9rcYzi5GuS5gOHJlY80m24z3zHJ9HHB2NJF0ojWFxyZ3zn1HwOWEaGTR9axS0n+ncmGB/r+Z3SKHHtSUVbq/InlJxr8whNRfXF0qs0hcu5+AAj7Vjl0+iC17BrsfvQndfVtc++mEXaO1VIYvZZgDTjF7K/fDKh+bUd4g0wxmkC5/IgyVyvvMS8LMt2JcRmRfhcDXf25V9y6DZtmhyDgUtkAwdR9aArFj9Z+wQMWH9Cms1pSmurmXNHYa93LUBdo7f8Iua85p26JFLB0ebDaPROJtEGRj7VZ9DY/RJovhTaeu0psyJon1wD5Mlced8GSY6AK2odJDCVOIQ3gmNtaWeHXeRX8kHqf49sMQ3zVmRrM5G3lNk6Xu5wx9071MR2J8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7RV/r4qh6w/rZdvb6EwHd34WK/ecw6fQEHGkYlUaAElubh4oE82Gh/H51NH2?=
 =?us-ascii?Q?rHHO4fSUeAvSZ+BbBEPpobBzC1qMj7jhnEPux0BKAb4Ztq3VKjY6aBiGD9KC?=
 =?us-ascii?Q?9pMhJeoWmzyiv11u99mjFBp009ep1P2hrdmQ1qQKknD4NDPM33xoDKQwzth7?=
 =?us-ascii?Q?h92sAAELVJSnivePjGyrwKM8A/w3S4R4lpQM8dMnGNNLJTpmCiKs6KYDPINg?=
 =?us-ascii?Q?ZhnD81mOqN99YKq+Fq6yCE7vjop4duyxYDSdSLjZCEKof0+vj0Ud3x+JjyYz?=
 =?us-ascii?Q?fltzOa7My6D0KtWiDlWvRAwERluVXUtklH8wfRXfqCBtllO+/m61n8ecYiKt?=
 =?us-ascii?Q?NcxvIm6p83TSIfWDers1No2h1mQkI/v8JFnExxaU+mbFpn7Q/Afd7E4152RE?=
 =?us-ascii?Q?mNw7aT8ilwOhdQ+Nbfixjoi7yoqnRQ1Eb+j/NNmMdCcM1UKSvIOnIZF8ocKA?=
 =?us-ascii?Q?k5Sufieu7gckiX7MpzvRP7694ooS4dvQICFkSYyRd3PBYjTa3m9gGkRTjrQ9?=
 =?us-ascii?Q?WLByCTzUFpq99btyIGg1QnjiI6o1LhoQU1n7qwE7WY0blBzv5o67oggh2isS?=
 =?us-ascii?Q?v0ot5fKzvRIbHR/dZxnNyaJ7pguIl8a8dF44e8kDq3PSDTOWzPO9Q7ifnl1/?=
 =?us-ascii?Q?osWGJ250jhj6oBMGNyQ8Lkepr3piNBA8eeyv8Ecd1csOIx7IOqj3f5CjEN+o?=
 =?us-ascii?Q?aTstivwBske+Z2KCPFj7D6J+/ac4YtM3ZyTmcGR1e89CHLQua/zCL2OgkbCe?=
 =?us-ascii?Q?D3dKuaKC5asqxgw8Uke/Wq/HHNDsIHtp2rhb40pDaPkHu1RH7uRbqaOt/IST?=
 =?us-ascii?Q?EUdrDFegqJIIv58r+6YIV1/OTP6crkBO+nuofJNydUVnJZ1uphFi/TYiZGP9?=
 =?us-ascii?Q?+EQ1Iw2v7QlhZBhkRVUBPpXEKi8mVpJHKpJ7XC9K4AouPFmiIA4Y5Zl2vdhB?=
 =?us-ascii?Q?bUakPAp8pxFyWqptmd3woqbeKXzYGSq/0S3fNqx31iw64EW/7cFe3t7LSQIQ?=
 =?us-ascii?Q?zqzMMLqT19IJJv5FrJhaTE/B4BcZ4QoF5fTg/tp4EG8iJXdZ6RrY/3ozScWd?=
 =?us-ascii?Q?1wH+La0Dev5OZdHPbNmMlah7P7LXZweXmhw0IBVQt67V+59IBsz+DXhK8PJG?=
 =?us-ascii?Q?RwUntBEac4cbtLrrcJuCBusFeITq6HT+mpJKxm1fQ8Obm2vj0zLe1ORvpcx0?=
 =?us-ascii?Q?pMyp9yLl765/An4JnSxOgS6lwZhidbwRoxUnL/WNPK4L9c9uuh95ZNMXRwEO?=
 =?us-ascii?Q?jWuPcyggIxKNKApaE2zcwY6Oii1MsyzP84Pxv5pVgb+9lnHavGiBrNgfQQ2s?=
 =?us-ascii?Q?n1fR9+Esvz91HtQ6zgD7VXrvbSLP7cAQPkOa/TQcBTi5VReAhGNRScTttTAH?=
 =?us-ascii?Q?RswImFtyCB7Kocl/Ux66pRfsq+AToCIq/xzKalcScfeRQ4JpMeesx2f5muzQ?=
 =?us-ascii?Q?Mv0utEaekiul9+rfZILoXv8TFRyvPy5k43k67TbUA8gkK0XjJ4yfIVaFWP11?=
 =?us-ascii?Q?nr1W53ClDvz14Gy8F6ruOsNcEdxGTaUelJuuDtry70RAYdeLpg/fEGsgyxjj?=
 =?us-ascii?Q?b59KV5I5ubtXmoCumvE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e858acc-5e6e-4d4a-5a43-08dc4cd84084
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 14:31:25.8196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UzIlefUrGSVzecZLabDGLshKIsB67zJYtItyeo+0ZZftacbMCngWpu2d/t9wbzfhVW8MbjQT4BtD2zJAnVyyLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
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
> From: Randhawa, Jagmeet <jagmeet.randhawa@intel.com>
> Sent: Friday, March 22, 2024 7:09 PM
> Cc: igt-dev@lists.freedesktop.org; Zeng, Oak <oak.zeng@intel.com>; Randha=
wa,
> Jagmeet <jagmeet.randhawa@intel.com>
> Subject: [PATCH] Fix WB caching PAT index for coherency mode
>=20
> By default "coh_mode" is "XE_COH_NONE" and
> "cpu_caching" is set to "DRM_XE_GEM_CPU_CACHING_WB"

Hi Jagmeet,

Our driver api only expose cpu_caching of gem_create and pat_index of vm_bi=
nd as interface. I am not sure why you mentioned coh_mode here? Isn't coh_m=
ode a driver internal concept?

Also on which platform did you find a issue? If you have a jira ticket numb=
er, can you write the ticket in the description so this can be referred lat=
er? I took a look of __xe_default_cpu_caching function, by default for vram=
 it returns WC and for system memory it returns WB. So I am curious, is thi=
s on a integrated GPU which doesn't have vram?

Oak


> because write back (WB) caching requires
> a valid coherence mode, and "coh_mode" is set to
> "XE_COH_NONE" there is no coherence leading to this
> contradiction. So to address this issue, we set the
> pat_index with intel_get_pat_idx_wb(fd);
> ---
>  tests/intel/xe_vm.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 7c061c497..1f458174d 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1789,6 +1789,7 @@ static void bind_flag_invalid(int fd)
>  	bind.bind.range =3D bo_size;
>  	bind.bind.addr =3D addr;
>  	bind.bind.op =3D DRM_XE_VM_BIND_OP_MAP;
> +	bind.bind.pat_index =3D intel_get_pat_idx_wb(fd);
>  	bind.num_syncs =3D 1;
>  	bind.syncs =3D (uintptr_t)sync;
>=20
> --
> 2.25.1

