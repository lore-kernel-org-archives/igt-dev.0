Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A2EE98FA8
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 04:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E721810E10A;
	Thu,  9 Apr 2026 04:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCwwWpFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBCD10E072
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 04:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775709587; x=1807245587;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o0UmJKaf+Qc9w3WPXXaShR1tvmHKc/AwptrY3T0XzNQ=;
 b=eCwwWpFDjFzSJMUE67PUnuICkgl6jR3+GEBXaQXiISnf1sq/oP8Rblgk
 027zc8OhoPu/D8o34bIIRJMHa200BiHOyEdl0a2/YSnl9G8pAcskKYwaD
 JjwVHxkMMzYc9MqQlWLALbe7w3taQ//BaKDsAmJ4b1UPZlm2cI+qHZuIC
 ZrWlRMJjMJw+U56S17RsBfBiue4mYmLycpsLo+yrJcMIMGp5ikcgqGzVa
 tMcMgbX65lrUS0zdpOc43dIyZav9VWjBNcR0NobD4auio07gNn1sUJ7Nq
 phwTk67vJQuA1v0vFKJq/zNJiwb44sPdxHE0WkxEe3K1/CXZRg+Guy1AR w==;
X-CSE-ConnectionGUID: Yj05s9wGT9+7XGkxx3QWVw==
X-CSE-MsgGUID: YZof62+sR8O5PwUWd1UYMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87405291"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="87405291"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 21:39:46 -0700
X-CSE-ConnectionGUID: M4a056+FSAuwfmg4pk3uGw==
X-CSE-MsgGUID: gBQM8FBoRmaL3s9f3dUEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="223908980"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 21:39:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 21:39:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 21:39:45 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 21:39:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD/EW1zIjOjDWEtr4co+jwKdpND8KhLmv91mDSnoLcdtBckYxpkJxdrdWBrMFPZBvCLCkNiC5mzwVeFWr2Ro15vbgK0WJuJPSUbxoASbFtz5E033H/tcQuDeJsSBI7a9mYRGAMfqaxClkwacCY5QK1UKGv2LSv1qC/aAtjDct7sHwoN2/v7iHDpU4L1W8aUBZ0HdMleasG+WKbTiycC1ww5YcPhVzmPPJMgOxAdk7zhU8o5FXRQ4nWA7L95lwo2v3zdvLKdynziEmoYFbinMjB6brZbjGHZnHi2B+DMQiND0mymmNvLvCMmw+PERK2mccbAkadeqXetsq2HFmeFI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwrcbdKLSBp59eYZgI/T2/3BojulFo0dq1xrnbSGyVc=;
 b=IIL7jXs/ViuPwInK9LydpDtQfwmPNJIbw8ZYNHp667ls7XiTKD0aVGRbEj1ycGj1lEGAPn58AoQL4rosq1kE5abQhGdS2klIGMyNHGoIBHdtnAj7AQqmjpQskdbWySrGNzKRNYPEWQ4ptggtvyDlxH+8NAk+w95G1F/UiFjrY2ETwbPEMStJF21iklr+WFafZnsbQ3tn9ILl9lBrcrkWkTFPhd5GNyhb8CjRakrto1/78MoauStv76/x11wgk/UHyYQilfUSxUeeK7nyTt0aFA7spyXb38EALRKqyv4RWiSb+rFwHT3MbvR88y/AQ/urZ7drO6+QWrOFP3yFNlVDFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CH3PR11MB7893.namprd11.prod.outlook.com (2603:10b6:610:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 9 Apr
 2026 04:39:38 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 04:39:38 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Summers,
 Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_reset: Remove CANCEL logic for
 CM variants
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_reset: Remove CANCEL logic for
 CM variants
Thread-Index: AQHcxhEIOaKf6tQJOk2AX7uBLuc/BbXWKXoA
Date: Thu, 9 Apr 2026 04:39:37 +0000
Message-ID: <CH3PR11MB8434C3C08A1A124F5ECB69E58D582@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260406220043.42823-1-stuart.summers@intel.com>
In-Reply-To: <20260406220043.42823-1-stuart.summers@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CH3PR11MB7893:EE_
x-ms-office365-filtering-correlation-id: f8b9194c-005c-4283-3ed7-08de95f201df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info: PGeKTRz1oLJrm7hldRmjR2vTjJS01xUSqJG8OsqiMftpDU3PQ35OcxiGTAdWVAB5D8UDGLqHbSaO5Pipb3hRUHDFE6ma4/iDHTqqXUGB37/RFd2qsgG/9HJ2HJiiaEeeXPRYuixmBW3TomgXb7XTlsx+AQ5gs8djZ0BtUHfWUSFmQTPIanHnXF4us8h4aujAX8gXqc95+k4gzCsqBQ6/Fu/b+bKuSd0/SS3pNBJnIWUbpJLm/F1ADfil9RUdczo/hOumFMIKlTF64WE38irQwGft4bWBGUymQ0TmGz0MXGIUQ+yWE7x/w/53p6O9DdCxtX4dNr4pzuz7szv8GWP87wHAKuAKQWpKMTjoxFjYH5oJh17bR3GrSyqhqE0I4xonc2aolosUX0HhPJjGQiaD4DYMgr/NRXW+YVreOaFduw618EPG4xgFyWDA7ClwmWS2nd091PXNAHD5Y2yNj9J5R23mPETasjafpK754jcDGkxxt+EbRkAksKoxqrI29TS4wpWAd9euyc065MTo6Oao09Q4xmjg3LQa5uGj3seanTXH8ZilGSahvmvXUXh/f8b31hklGv2fobAhW2DRt+tYFTgp7dijdFFMsH+5xiLsR6wFW1RIYYBPiACo5HLXZRQEJHiHcapEcQ6eUibk1AWHTn189hOaVxAeJKhkLAFMIdR8vxH+iMhS7OXU3emYN3PJHBRhME9EnzPd6lVnikOoi97321Og9Kl4MQhzFsov4nqFF9Zi57Es1MGvMy1wyaXmRwJWiPj7VSYNVi4Kju9UogUMnhP7oCW/lR+mgk1WcVE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(18002099003)(22082099003)(38070700021)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KHEP2/TEBeRegjakgIBHRWkXTL7hekyUAuCW7JGShnYR448E92SWfSpC4h2v?=
 =?us-ascii?Q?lsxY9hqm5Is2o4vJ1HUI7AQbvVkKBeqqVEAbo1VTp1o4y7luhiBJIH+h7jaA?=
 =?us-ascii?Q?4Mdq7faHcxqcfgJyC5l9AiZgks4tl89FbAFQ8ygZq6rmpuVrDz4z9WMeOt2g?=
 =?us-ascii?Q?NOgU/apRXC4Tf3ziuMm6EL20p0FTfKxX6CeWaq767VpU/8YcFirlkjdMWt46?=
 =?us-ascii?Q?/QsH5GOQt3P7VYk/FMQowLWusF8oE8H49ZOSCPANb4NCHa5NLskA4RRFxb9N?=
 =?us-ascii?Q?M9PuAL64DLE0SAQR+bcjwnOf0dmxXp0UXVSHIhkk2q1mw3j5uL14XcR7g5Gq?=
 =?us-ascii?Q?7Oc60H17neNgEHkvpNr+zyHwed9UigbmcybkZl6e48h/QhwB7BbwFe1l9Xda?=
 =?us-ascii?Q?wfR9kCjjDKryYn6DZWtn1LJ/tn2lzoANSSDdUmRevqdWiUls4a/AcjVMhEv6?=
 =?us-ascii?Q?5228uX//gPydloJos0JBRB5Sdsgp7Pb2/n3qAxLRCqv1SE/nDovZ3IyhCZkJ?=
 =?us-ascii?Q?lKjCQmavYi9Rw75iQRJxheUXVLURaVm9WfsEG2k7r4GprMpboKKZ2xfY54j0?=
 =?us-ascii?Q?FSCyuB4UxTXV/AfFMN+IDsrpaJJAi5bwjvqLSguAqkIfG6ifHSlTOhCmO6Kl?=
 =?us-ascii?Q?4L/jmycsetEEXG8N3hOIHk2S2fK/BwF10WrW9sINm30nhWiMgoK6aSpXj0f0?=
 =?us-ascii?Q?ahptzFJ5y6vw7C+kNB/ETfmjhea++3B7M3G5XqqtVczXWvzDHcLjxHviqbCI?=
 =?us-ascii?Q?b6x4KlLJEiYCY74MrNYBGIgkci2QUlA9izkdRab8WcOc+fiTijrYr/0emUKF?=
 =?us-ascii?Q?78Kfr7Oqv7ZE3ErvbKozwqTWlDmKSHqh7+ZGMa8uib8m82oQqgWot+jSfLoL?=
 =?us-ascii?Q?VgDsH9r8+Kq4muk4N7NGmFxEPOX4vMR8znSNt2KRRP26xZ3LLIjBvomIuC9G?=
 =?us-ascii?Q?DvxdGx0DHDgqu3hyHyy4ORhZBW8eF/MFvF3YGabNIN7uiM4u1XUY5/3gwwsl?=
 =?us-ascii?Q?yeXtdHsxM+rx0BbhvR4cOQ2wLqXQQieNjglJeB2K4uNAIibEtXpSf/5YhpvI?=
 =?us-ascii?Q?Tkd6QnzVsw7mCdQ49ek1ffuRIFzURMo4CcI1eIO4O+RzuOS4O7sjOxgbtRyz?=
 =?us-ascii?Q?2R/7LCQ5rtvU4hve1vHpLTKGrgZPT+CqkPcoK1tWtUyTqfHJsOzqynXkI/xp?=
 =?us-ascii?Q?Zgr4hjUkGLBn806l8DihHtXILZc6PoihqrEWCnwE819oAGU1IE1Gl0KMHJN9?=
 =?us-ascii?Q?Av1+omq/Dm+QTUcAkkOFDVK0MkGuaOAuLgjWbxcfhSPEXhmzLA3EF7+ZJUCh?=
 =?us-ascii?Q?yBEbYX3qN9sbqdxQvAnG2oKpdHIaoo7DZqzVr2D+p5UR0h/B82dlbYp1/TvI?=
 =?us-ascii?Q?TT69TZidhMlnMfmpVJlJ0Y1jYmxOlH7xWfQIUcnwvR7pmy8OxDnWC1GM5lFo?=
 =?us-ascii?Q?URSCo3dgFjaZk43FBGdL5pzifxmMJlCE1WQ97LJmPTdvoR6nZe7u45uNJa4H?=
 =?us-ascii?Q?SckGDNfxNs7/jFlcAQf/r09D0iuuexFdNm4a8ez7ni3JOm16TUKSm5wyE9hx?=
 =?us-ascii?Q?fyaUzIL/Qkq+uD+sMZ7OKq/EyDh4RjEEHUR6azfmwAT4MlSBSdofBj07y51r?=
 =?us-ascii?Q?AYJdDpcNbTpfMS+0RPKWyLt0Vo0/hutummCHPCFtoWq0aj/w9Zzm4siIWKwi?=
 =?us-ascii?Q?+EB5/m+KFb2mIHXO+e4FQVqQt2euGhh7BV93MLHWB7baACz4Ope+MsTHfoZD?=
 =?us-ascii?Q?MwLBX08475t/QRnIndH+KY+rE0h7yuhJZ7Z1myUi59hPHzf3tfY8VHUJOSiG?=
x-ms-exchange-antispam-messagedata-1: W0O5smCBO4KZdOXh2GmEGpZG4nKYT72cIic=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: V8bbtxkk5a23j0UZ/QIWcsZ0PYP7cw3Nja2gtiAJm+lA53PueIer/XJaX7v+HGlSWOeh9MNzOK6hlYwd6Lbpo3fQ43ts4Q1R6kcuiGxEl4qoGfEjtFCdKT+lLSqMRGB8WMd8VFKrXP6AC+6J6U42Dnra6q8Mv/DTTlI93raXmCsUdaj/EYxHsVHqYKzIBNxnbK5acheIbzOY4LkHJNL3/qVSH7QvveLy2vice2oAwC4260l9h0Rdrf1Up57C7XzCP3JwIvN6Z95qGg/LkhVf4Bewyj21NV0ymYsXcK40FNJ3O/2NU64UMsnrjrGhaTOmxZkVYy/IGQNo0GSA8pXF+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b9194c-005c-4283-3ed7-08de95f201df
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 04:39:37.8545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W26KaM8za+pAT7KhA1cDuV0EIZD3m8jXRkRDMiuT/tsGZyPrBpOBCabNxcrgFUO8P1W5nOXmdaFKb2+ag0/zEgTfQxSM56y/kku31QwyB3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7893
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Stuart
> Summers
> Sent: 07 April 2026 03:31 AM
> Cc: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>;
> igt-dev@lists.freedesktop.org; Summers, Stuart
> <stuart.summers@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: Remove CANCEL logic for=
 CM
> variants
>=20
> The compute mode tests are expected to be long running and will not trigg=
er
> the TDR logic in the KMD. This is illustrated in the test in that the leg=
acy cases
> implement the CANCEL case, which is meant to trigger the TDR based resets
> vs the CM cases which do not support this.
>=20
> Remove the CANCEL logic from the CM tests since it isn't actually used in=
 any
> of the test cases here.
>=20
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c in=
dex
> 7aaee31dd..4493a56fc 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -421,7 +421,7 @@ test_compute_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		uint64_t exec_addr;
>  		int e =3D i % n_exec_queues;
>=20
> -		if (!i || flags & CANCEL) {
> +		if (!i) {
>  			spin_opts.addr =3D base_addr + spin_offset;
>  			xe_spin_init(&data[i].spin, &spin_opts);
>  			exec_addr =3D spin_opts.addr;
> @@ -478,7 +478,7 @@ test_compute_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 *
> NSEC_PER_SEC);
>=20
> -	if (!(flags & (GT_RESET | CANCEL))) {
> +	if (!(flags & GT_RESET)) {
>  		for (i =3D 1; i < n_execs; i++)
>  			igt_assert_eq(data[i].data, 0xc0ffee);
>  	}
LGTM,
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> --
> 2.43.0

