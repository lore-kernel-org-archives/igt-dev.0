Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702C4CA0EC4
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 03:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0472410E1A2;
	Wed, 13 Aug 2025 03:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pb2oql+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3047E10E1A2
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 03:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755057438; x=1786593438;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Wd86i4/jaWMRMtpyGdW0xxJyA3i8MHbcgKa/Qu72MM=;
 b=Pb2oql+dfEnlx+sgy13BzRHroHjc8Uvt2WbQu+azCuYQuCtlT+QFgn0h
 m0c9KvpSZbtmIIwncpfGGiHoWBAvqkhjoejmdwhghEIVFXYs7oU9saozU
 vDIVEbZIHcRWZphxn6la6Pet+hIEaSvriFjVXFg71PPRsmXaNMRz6rGlL
 biqS6XtlxBy5BD9XHQhrEU5QF0o2zYoPXJd0SvK0cBtsL5wPVihSm3Dss
 vhCQNm5b6iSAX7xDU0eCx8f8HR6Xogj3vk6emtccp863cc/pyGegl4HvW
 hUASNQrL/20OqHmEWbHylMA+4oM2BRs8WO+6GOAQjN0oHj/HQuvWm95Jq g==;
X-CSE-ConnectionGUID: eY+pGJ1vRvyvFNd0wzV+4g==
X-CSE-MsgGUID: YSKXIgMHSq2o0Goc+4pdVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57208804"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57208804"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 20:57:17 -0700
X-CSE-ConnectionGUID: NF9nNwUqScum/1TVd5cVAA==
X-CSE-MsgGUID: 9Jt2SsRZTXC+o7xMr+t2Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="171618681"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 20:57:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 Aug 2025 20:57:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 12 Aug 2025 20:57:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.61)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 20:57:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDtP7yXlGDGyp7SzoR9h9LrE6au0m3vdxQMc3WnMFSdkEGthqwlcrIQlzeXExEOiUdIuIdvwxpgnzt1N7Ttxc0Mx5yKXTmDrUReE3w1A/rXdQ3xpmqJPMMTdg01k9KTscs5EvyAv/lvOTtA4567eAS7fa/HSJ58fAfY4NG05o7RHc4eTWWPjEG9Nja3fIjEkgoKfgvHE2Mv5EoEagojsI5V6T20op2ZTEzB8fsF/6mCrLn55Ald1UR3ewUdfPPXREI3cYGjf9qcTkaxqq81qLsGxO/yxVHlo5wtIVRu5tIAne/SqnB2brNXFIFlywENd8cC3fDSm7j2a8t+Xn2h4kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HGFw56VYXfYoKZxFvLYsuwdTnf5zcjR2NssJXxdJGc=;
 b=FI8DFaxyBdbAgPw6zxHFuAnEbIl12CZV7lGd11/y6BUQb4nBTqRstQTVgJuMFBy/FhOFJ8FgpN/+oFOMiYxOE6d7IQi7BKqhJPWPiS2RcWLeBNAuQoeHxqHD15MA8bSPYHjct3CMfbZ+rdZfQVZld3go5fjk+kavp0EBlofeWL5ElAjhu5vkUSfPwIKAiq6YblcF77/iF7PlEX3TD7S29RgOvFvNiUtfPTRN1vqVnx9HNSRU05AAIFI5mVt/cs7OsR6NPWIgbv6eRoVD82Rk68ElhnSV46FRYrIpXhkwXEMxaFmDckok80/u+SIoYsETVMYyPcaa26Y+B/YGsjyqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 03:57:15 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 03:57:14 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_vm: Add bind-array-flag-invalid
 subtest
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_vm: Add bind-array-flag-invalid
 subtest
Thread-Index: AQHcC4lcPrloqlf840Cs1VzrmdwZ27Rf9OvQ
Date: Wed, 13 Aug 2025 03:57:14 +0000
Message-ID: <CH3PR11MB8434AAE76F6D92CDA09C1E528D2AA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250812130142.37988-1-christoph.manszewski@intel.com>
 <20250812130142.37988-2-christoph.manszewski@intel.com>
In-Reply-To: <20250812130142.37988-2-christoph.manszewski@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB6020:EE_
x-ms-office365-filtering-correlation-id: d5190303-e16a-411a-6606-08ddda1d7d55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DyJjyah0IPUDo4KzEDtoixD9jAko1q8YyERZsFI0gCxWCZyuxT35G1YLtbhr?=
 =?us-ascii?Q?mkkpQMXey7SxLREcp0nL5eGsaFtsB7zDlGlFeGdP0dERVa8UXE8RYzwBBPcT?=
 =?us-ascii?Q?7bx10i+hi0WuJ/eY9qXNmjrQN7vN01kzP4eGsbfkcCr/aKmu+C0wJ5FRU0or?=
 =?us-ascii?Q?rsernJlIvidHXdWWwSaLezJoQIgyxCsyc/dF2HGOwEQE2gib+KZz/ZApCPvv?=
 =?us-ascii?Q?KTvqE+qK/EcBDtjboOye4smTyT8+Sa8ffUTJTf0W4dP8RI6Tio+CzUZp5RS0?=
 =?us-ascii?Q?TBcA9aAmqqaIE+XgD/kt5IloSkx+m0NT0Vpl4bxiFdkyiGNxkqP/sZETeYHt?=
 =?us-ascii?Q?U8h+5DyDOHfWVnZrcGyCCKWI5pom7i6ldMXaxLIizuVBfXEmmwkEfZTBQwH+?=
 =?us-ascii?Q?aoZTHh51g3Pu3TEZ/2wTipz4jxqLK7Vmn2qbKjKhd1oikIOEshXnkFB48iiS?=
 =?us-ascii?Q?o2XjpIVd/uQXSV+UH9ZVJH10ZCgrryG8DTVwgaTI7aXJwwAYntwK2s36mVsz?=
 =?us-ascii?Q?KvXQRss48DjkIkrNb/hYDMK5rH44loHNGtTZpi8ePHZ5Gp+PMTiyegvdGcq2?=
 =?us-ascii?Q?kaKe83kcRG+Iyy4mvrbMmMqZ7ET2E4Huo44S0PvJwGTtrZSNCCoPAqfkiwfO?=
 =?us-ascii?Q?4yXwTgYAMRM0uicd8PDDx+0U5fMupSGWPznS4STWmV5pitwRmD2B4i2Qe7Er?=
 =?us-ascii?Q?lG9Mg2KtXeL1eBWcR6jsG6aYUB5Eq01musT9+dRRZw578ONclR5J7FU9ov9I?=
 =?us-ascii?Q?B5nc5DCOUxaJRlyqyoIchG5/9Zn5bNMBAYIs+Yz8JkleBiaBjz8TATLLxHEN?=
 =?us-ascii?Q?EqwcZ32D246oHQmn7wSxgXwwBsf3TeFb3GAC514M1Te7L2NWyOtL2Y3IEKKq?=
 =?us-ascii?Q?qIDuWcS59FmZGJri6ETJNxaxscogddUMKpmmEAwI1zRZoBHitS0qJu6F5nIB?=
 =?us-ascii?Q?bQ07/M90DlMdJoZp+xIJHneLIACoCKrlKDK0lt6u1FgWWeq33ZPebLVgmlLI?=
 =?us-ascii?Q?n1ap+kwvPYqf/iBokXqAQBwYD7PvLf/Hp1orPWp87OJaIYabScXb4C8ir5qW?=
 =?us-ascii?Q?pxFfMlhw1rDTkFCH0H00rre1ikPtECi+CWJWbX15Or7YOOBzFIoGveISYKtD?=
 =?us-ascii?Q?/F7Obbd80WcyCsR5dZtCl1J0X1MLwFweoAnkVv+0hgbHBytzTLbijcYXUKLe?=
 =?us-ascii?Q?oi0xBoDQbPkzzL2hk4RZxVCTwlejsJv0+ys02dyEAya3Axu+YfuF9f0ncZjC?=
 =?us-ascii?Q?s83bQd5S82kHguLoLhemqlLpH0ZAf+NYMqhquTQbtsUSwvSl2I+hWXlVwtH2?=
 =?us-ascii?Q?VngBLW+ryz8hMu17V8wA1kGWXpMioywxYi+0g4wrzyv8h4CDGlSpAmlHWMvQ?=
 =?us-ascii?Q?4yZDTCLxpuXh7I9hiEr23xYXSAikd6+6HYGYWkMhfqtR3zEhHnrv7GuVn1LQ?=
 =?us-ascii?Q?PmM9r/z2Q/z+WkSU0QfadxSMg2izjDfzuoGXzQkzRpSZH69L4IVjZsvfxvWI?=
 =?us-ascii?Q?2BUG26Pe2unsyfo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1olYmw7XZ8ujS/0FjisTiB0eliVYIKcddu4iQBnz80ZXE7dplK2YVGUKRGLz?=
 =?us-ascii?Q?0UevjvJpWHZigVPAT9VWEc4sv+yBDotIKgi212Z1rTmG3tr5FcFmv29my7x0?=
 =?us-ascii?Q?VhRPJdZUdKeRct/htxmGxCoRdB1USuUpw953ORYM58kPqgy1AI66VisBM2MH?=
 =?us-ascii?Q?KvMdJFJZ20erieEsA1Mt5nhN2DAEgzU4FmCj11mw1Wtcl1fUb1QadRlWzxf2?=
 =?us-ascii?Q?EkcKvzw/scGIYQWippgjw7yzdDRPu3EtwnHw5lfBZk6R1giA8iZryYMFfISo?=
 =?us-ascii?Q?ESM0195z8EfxLBILJixe3c0tmys9AccXqloGmgKYT1kcexibvRmP8sLX082E?=
 =?us-ascii?Q?6wAT3YlO/VBgStqPpstA0nFlD3Kj3c34IOZIbh4KFZ6Ig6+NURqo4oX6ugHt?=
 =?us-ascii?Q?Oeml24K+1OH0slHPZ914SAQKIhVPUNwmdBAqPUfmfBX4772mEjsqj/Baj9gN?=
 =?us-ascii?Q?nfCpMsyAEU1/uR+xotFIlnRv/7vcO9mbN0M8rX7qqJI3ENmQkktfAfQYkwVK?=
 =?us-ascii?Q?/tCGpvrH6E6f4GxUxu+v0g6MUco1b4tG4m6J1P7rVCGMbTjNQK5sD+jylJZ3?=
 =?us-ascii?Q?FsJGj0vtNbCdj0/2ZMvseQ0fDximOllN5AMxVnXHyHSokIIbkX5BamOMWAuv?=
 =?us-ascii?Q?z6NJxAHV3gapG3fdClqRH4eh4cZ1L1FRUWdL2SxE59jOiS3ZAqEHSy+7Uakc?=
 =?us-ascii?Q?qB26zwxFgZA0oPUfKsvVJiJP8nlM+OPvmDp6rLbSoh7PHF4bMukx0WofboxD?=
 =?us-ascii?Q?NuFoa9866IVyJOFW9F72tMPJyszfIC/CRP/PuXi4Km7igEiUUs7bau4ZFUQA?=
 =?us-ascii?Q?kxjP6hDRfoHiRcY6GHHd0lUiUIrRcJ9VqqGPmJzVUBTo+vlC829w4vgy68JX?=
 =?us-ascii?Q?vzEs3jlkHbFS6G4LMllYwnL6DH1Ume/stjmiaObhtfoJZUQ6FKsWq61V6xr/?=
 =?us-ascii?Q?agVOeZGI0JrdSYGmaomsX+aHVLvdEOyJBTUet0V4VW5M8nzffKBT0PS/nYs9?=
 =?us-ascii?Q?URjctsVupOuG1Cgy3WR9TAGYindgGhQeh3cmrxBMrhC31EZvt1z9iCiir3/6?=
 =?us-ascii?Q?xhoLZUJF/pWnVo/ugjRjrdFWtGAw9Z1YqXilLpVe1fPcHvKWfqXuSBTgZPwH?=
 =?us-ascii?Q?Vbxv3ItVGvKPCKSsLqz19krLF92ldwf5AbQ5EPKWxRtazcX1JZAVgaBYQjCq?=
 =?us-ascii?Q?N1QIYCYFGSUzubC6CG2jxvCxdSqIzubyU7Mrlq6tos1TxElBj7eqt3EbEuWf?=
 =?us-ascii?Q?wqabPReymraFWa/V2+7p4LoEOe/42sDYUxARSBoci+wIo3CruVrADSp5Bf3B?=
 =?us-ascii?Q?GlCprmErSSyGpqoLceQtr51BWZ3xN+BNQ2sZA8DDDV1WygYNjkmM18HhaGCV?=
 =?us-ascii?Q?08sykr7wdRNuGVdaZpAw0grIqgUcC1ePqgoXIWQM1tUE1mHhBuOlG5TUAWRK?=
 =?us-ascii?Q?g662yc+/NXHhILq1S8jn//Ny7t/DfavdOBY4nmj8krmH1gfvIxWU5TT3dNlP?=
 =?us-ascii?Q?zrdoRdeNPX749S25UwoQMUJm55zJ9G/EMgxOTCDQkjHgao5WuzDZ/PD7sLDV?=
 =?us-ascii?Q?hVp2QDcnruyv2AOhQoYlL4OYsR4sTtvjvc8wpbRdNsMLdvcBzaSDtumKQVpH?=
 =?us-ascii?Q?wqdd8U9mVEl4s8pdPxz8dlRuRmOF4nW/ACO1B4HQ7RSzvAJxDQMWf4L7SYx1?=
 =?us-ascii?Q?onf9QA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5190303-e16a-411a-6606-08ddda1d7d55
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 03:57:14.8050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3N8jrouJ1jrLciAHdLq7IAV6yFU4AqTeO+5TezffIavvLKEXnO7iQbUWPUenrf0GBxxC4MgLXmZ0WlbghbuUqJBO2Wb+Ft/6QCI02gBSzkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6020
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
> Christoph Manszewski
> Sent: 12 August 2025 06:32 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Dugast, Francois <francois.dugast@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Manszewski, Christoph
> <christoph.manszewski@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/xe_vm: Add bind-array-flag-invalid
> subtest
>=20
> Add a complementary subtest to 'bind-flag-invalid' which checks vm_bind
> ioctl behavior when provided a invalid flag value when submitting an arra=
y of
> bind operations.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_vm.c | 90
> +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c index
> 3ce54053c..236494407 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2271,6 +2271,93 @@ static void bind_flag_invalid(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +static void __bind_flag_valid(int fd, uint32_t bo, struct drm_xe_vm_bind
> bind,
> +			      struct drm_xe_vm_bind_op *bind_ops, int
> num_binds) {
> +	struct drm_xe_sync *sync =3D from_user_pointer(bind.syncs);
> +	unsigned int valid_flags[] =3D {
> +		0,
> +		DRM_XE_VM_BIND_FLAG_READONLY,
> +		DRM_XE_VM_BIND_FLAG_IMMEDIATE,
> +		DRM_XE_VM_BIND_FLAG_NULL,
> +		DRM_XE_VM_BIND_FLAG_DUMPABLE,
> +		DRM_XE_VM_BIND_FLAG_CHECK_PXP,
> +	};
> +
> +	for (int i =3D 0; i < ARRAY_SIZE(valid_flags); i++) {
> +		if (!pxp_interface_supported(fd) && valid_flags[i] =3D=3D
> DRM_XE_VM_BIND_FLAG_CHECK_PXP)
> +			continue;
> +
> +		for (int j =3D 0; j < num_binds; j++) {
> +			bind_ops[j].flags =3D valid_flags[i];
> +			bind_ops[j].obj =3D valid_flags[i] =3D=3D
> DRM_XE_VM_BIND_FLAG_NULL ? 0 : bo;
> +		}
> +
> +		igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
> NULL));
> +		syncobj_reset(fd, &sync[0].handle, 1);
> +	}
> +}
> +
> +/**
> + * SUBTEST: bind-array-flag-invalid
> + * Functionality: bind
> + * Description: Ensure invalid bind flags are rejected when submitting a=
n
> array of binds.
> + * Test category: negative test
> + */
> +static void test_bind_flag_invalid(int fd, int num_binds) {
> +	struct drm_xe_vm_bind_op *bind_ops;
> +	struct drm_xe_vm_bind bind;
> +	uint32_t vm;
> +
> +	uint32_t bo, bo_size =3D xe_get_default_alignment(fd);
> +	uint64_t addr =3D 0x1a0000;
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +
> +	igt_assert(num_binds > 1);
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
> +	sync[0].handle =3D syncobj_create(fd, 0);
> +
> +	bind_ops =3D calloc(num_binds, sizeof(*bind_ops));
> +	for (int i =3D 0; i < num_binds; i++) {
> +		bind_ops[i].addr =3D addr + i * bo_size;
> +		bind_ops[i].range =3D bo_size;
> +		bind_ops[i].obj =3D bo;
> +		bind_ops[i].op =3D DRM_XE_VM_BIND_OP_MAP;
> +		bind_ops[i].pat_index =3D intel_get_pat_idx_wb(fd);
> +	}
> +
> +	memset(&bind, 0, sizeof(bind));
> +	bind.vector_of_binds =3D to_user_pointer(bind_ops);
> +	bind.num_binds =3D num_binds;
> +	bind.syncs =3D to_user_pointer(sync);
> +	bind.num_syncs =3D 1;
> +	bind.vm_id =3D vm;
> +
> +	/* Using valid flags should work */
> +	__bind_flag_valid(fd, bo, bind, bind_ops, num_binds);
> +
> +	/* Using invalid flags should not work */
> +	for (int i =3D 0; i < num_binds; i++) {
> +		bind_ops[i].flags =3D BIT(30);
> +		bind_ops[i].obj =3D bo;
> +	}
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
> +
> +	/* Using valid flags should still work */
> +	__bind_flag_valid(fd, bo, bind, bind_ops, num_binds);
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: invalid-flag-%s
>   * Functionality: ioctl_input_validation @@ -2658,6 +2745,9 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			test_bind_array_conflict(fd, hwe, false, true);
>=20
> +	igt_subtest("bind-array-flag-invalid")
> +		test_bind_flag_invalid(fd, 16);
Remaining code looks fine for me, and one more you mentioned that you notic=
ed a double free when the vm bind ioctl failed, do you mean its for negativ=
e flag ?=20
What is the reason behind fixing the number of binds to 16. Could you expla=
in?
Thanks,
Priyanka
> +
>  	for (bind_size =3D 0x1ull << 21; bind_size <=3D 0x1ull << 31;
>  	     bind_size =3D bind_size << 1) {
>  		igt_subtest_f("large-binds-%lld",
> --
> 2.47.1

