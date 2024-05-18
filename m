Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E21BC04FFE
	for <igt-dev@archiver.kernel.org>; Sat, 18 May 2024 02:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDE310E165;
	Sat, 18 May 2024 02:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ay1x0G4I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6C410E165
 for <igt-dev@lists.freedesktop.org>; Sat, 18 May 2024 02:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715998772; x=1747534772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EJQrZ1Ukv3RIphX+MVSGzNgs9BMnPrwX7eWKfgp5F+4=;
 b=ay1x0G4IhTqVXf6HPXeLioZVVKQjBFJ+nLW6/QC+FjXYiVlAGz0nRDnk
 wOQLDiRySJD7D9b8/NtRV3Ob7yDersDzry/1AjbLQHgB+5kisOZTlKzhQ
 LgvsD9OXU418WEC9zhTQJlhUEFsIkWl5/wrdqCnr0z9XHOCBTMvrW0efC
 4Ye1t8We6S4OThgPUknVSPwFttufGIoOIOF3u/mB8zIQXYZzXgAQe+Jqz
 VgreT5G49m1J87JgUYSHHJ4qbN7zikKAcWB2NH8qeMj1jnTyOyWU0fqO6
 nGOx1DFC8qoxxo+JL91gcEduMPult0GyXUTkOz7knCEDUnHdX0UVW6APz g==;
X-CSE-ConnectionGUID: 9r+oAjmhTC6xdA0PJgWpKg==
X-CSE-MsgGUID: WJlty/SvQkCm54LaeZlzrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22809151"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="22809151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 19:19:31 -0700
X-CSE-ConnectionGUID: pCGCdre8TvWFV6dpIp7xpA==
X-CSE-MsgGUID: De26rVVVS6Sg/FpA7Ma9MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="36885280"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 19:19:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 19:19:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 19:19:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 19:19:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 19:19:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKV5n4gmIVHwd1xzf1zvK63QpVQ3eRIAj0WbQ1s3mpunrXwtX0k5++OL04YpGnqt/xKTaQfRzHpfRsjSCT5fd0n1rRFxeIPNsAlOCAPtNq8jPrnhy2wdSkitpgy72tPb/ZeZavSGjPnHja19fez0l4tbfpsgt9YmtQ4C4Tei/KlJHCT5BYysKex3P6St7BpoP99XB7pi5kU6NgcCFCy8loU2SZT64LSJReUm+gBtJUIzR/oV+eAby2eMiBc6IsVrEaaKXouPyEmVQ5nmkDIk4DZlNgqUjWXKEhTP7fKaWTM1I/IgVRQe/vvrwBIZ0cMjHO1IkcCJjnCUKQBYAK+sxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcvQiNj0L8u0MIbuyPtliHwloUQ0j5U1WXQHoooa8+Y=;
 b=RiZbsdiPA9H778fBYjSdCKt9Mjce0D3CPoQpKM1iSvz3wIfj2tSB5BVTjH7J2o8hyt8DfMWfOYjcmLJrbV3xdRWt38zogMJjN84cntgW3UkLIto6DT1Y5R1asyGoFP0/6T2FZziR1QI2k/Iaa28th9zmxyvOsR14qfNmbIo0Uh0D4J0QKTxSGyEqHS7TSgV3UJDUH+qkuagVSXvBbQQ5S4n+88PDdcoKK0+axHjWRTBLwRsQ3SnfefIrT6ZPhC8Tt9IueB3DY8dl5VkH8zBEIZpDfFu/2PrBfitopqy8MoYnD5pp8egRMCk/DDDmYbNR6JkGgIWeh40yJG31uVjOPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Sat, 18 May
 2024 02:19:28 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7544.052; Sat, 18 May 2024
 02:19:27 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH i-g-t v3 07/10] tests/intel/xe_svm: Add svm-invalid-va
 test to verify SVM functionality with invalid address access
Thread-Topic: [PATCH i-g-t v3 07/10] tests/intel/xe_svm: Add svm-invalid-va
 test to verify SVM functionality with invalid address access
Thread-Index: AQHaqE/pV7McxnyHMUuMS71G25DdlbGcQrOw
Date: Sat, 18 May 2024 02:19:27 +0000
Message-ID: <SA1PR11MB69915FEC6D5EBF919E8839C592EF2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <20240517114658.810283-8-krishnaiah.bommu@intel.com>
In-Reply-To: <20240517114658.810283-8-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA1PR11MB6871:EE_
x-ms-office365-filtering-correlation-id: 1c89ce16-bfc0-47ee-d825-08dc76e0f1af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?i3j088RC6+TNjlckNQo//d617fr++Qq+NO0uK7Wbbk2H+QNT3s2xdCuMdaVX?=
 =?us-ascii?Q?c15WBVGCe9GVyNuUwfd2cVVXKfa/DI4pATZDrhrtMjEdDVicZXvT4P72eI8h?=
 =?us-ascii?Q?EIDAgC1EL8GC0dn7jeZail/HcfvV4G3M9t+WQa77i4hFAY4A43IFlcQ83Rv+?=
 =?us-ascii?Q?MG1KqdykO+mS7QFh3SIufKYLA/QW2Gia44boIydiP6J1vE5iJZf2k2S/IesA?=
 =?us-ascii?Q?L2fCnSVLvnCcibWPuQCq+jCfDF09HsiIiq8aGYr0vpr2qUrj6iiJYDq564I7?=
 =?us-ascii?Q?Z9wVSadGBqZf48VsE+N2rEiCBB+XaSGGpr6SJF5eIyKLNj6XQCosl6Vf2+ae?=
 =?us-ascii?Q?thEk2589vSccw3/uUD3JsMRKy+1Y7tZP1mNlrliiwA+/fGFQJFNUYiZNxJuP?=
 =?us-ascii?Q?AVN634ed4EWYgZfxAGWwjrTBWCmuk/SyNyIc0Kg28ymd1nyPGDDoELIPQDby?=
 =?us-ascii?Q?eoc8f1Gnr2k65nK3L+Xks7PhusXe85T+/g7G0UqY+uyJWnYLR0e05QV12cB7?=
 =?us-ascii?Q?LEAkNrKsGvWus5afsIYkvteZl82Og2Cx6ZE1ZCMS++JKiA/B8d2Df6O0g1ix?=
 =?us-ascii?Q?kLlesxLrsrQ7kE1o1y37lGEsBkkHORoARf3CaFjegKvfahdXgF114A+7t19L?=
 =?us-ascii?Q?qMFymUQlq+gA5yR6OjsZc2LHb01qoHcIdw2vGe5v+9QY6GYxepYgZXEmupp2?=
 =?us-ascii?Q?vjbffSK6uJe2bZWBQumvSCQkMB70jdMyg+2ecQDuQo2B4zn2UHpmxySOI88u?=
 =?us-ascii?Q?d1sSuigSs0a/hJBFE9nphGscM3Wb48Q4YLHtCTCSbS5KdGmBPW1aVgGueEYk?=
 =?us-ascii?Q?b/7us2K8pZQCColQLcE6eP28T9i5rIMO5UuA9YH13wJV3mVs8IP9Pcj6mvls?=
 =?us-ascii?Q?WPpGIsp9fFsDWVDsEUIujjM9jhAD98oMIya0Q6Rh3rVBBV83jo9CCDbvebkJ?=
 =?us-ascii?Q?x4hHCE4BCsBUDyreTth2kq5Rr0SJZHdGlaWrPK/9cTwsm18upjTfbGNX+B0x?=
 =?us-ascii?Q?HNn+HbOLe4fMhLDEi7OoMuVptrH7+YEt2PscpnqXxMaPjKqE8il7+ozC6vH7?=
 =?us-ascii?Q?MViubdJQmoeRmmZ/1/I2zH3HoDS7s5VyxrDOhOgY+LY2CEQWiuvoQC5kKu/F?=
 =?us-ascii?Q?AuMoBVgoRjy4MjKvaGge6Ai2nWMvTaVo2AEJLF2iFHJt1hVbf5fhOov4iKgy?=
 =?us-ascii?Q?6JvH91KLkpwiZJ3bBaxsLYkYNZU57ZUidY7U7mUaFK4ilXrPdiSeR2CnqoA7?=
 =?us-ascii?Q?AmHUVXyLKYe4CLzf/5WxGeidd5fcXM+adlA36/qCGU5va2zKE+IcqOGuPo/I?=
 =?us-ascii?Q?KyNSGbLUQxbg0f0T3ViWYU3CHp5yLv/1Mz4v/SaSiRGMPA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ePyk9Dx6zaA2NqB22ZEL7q+Xigcn5fP67yyCcjQjxH8OkOeW8UrmFCoBhlNO?=
 =?us-ascii?Q?GQ+fLA9sWtacdF7KnrANlYp4+NHlg06o3cHYbW50dRcojunAhPvoKJmP4EzP?=
 =?us-ascii?Q?Djm+qqPnDZIaWOod/PvpNmCzLuD5Us0fPBR0jXwPn0eGT6/HOe//mbL1IkoZ?=
 =?us-ascii?Q?vBJGkFJXDdj2+vQXj4nu/wKjXiKgBVJxmKnwG8FWZ9l3nYEArXcfxfNnNflN?=
 =?us-ascii?Q?0MynzdIXs9qrvmko7iHA+iELnkngdG4nbZlL8v0DZoKBC6YSaRGe2MUIcjR0?=
 =?us-ascii?Q?wcLrLVFiT8QveN3trPUmuxvG55zOJl8wsb4rVdVVM37i6R9PIHaHdZ+2Npwy?=
 =?us-ascii?Q?pIniTJBb4Aekvsds+T+xtY9hOggO8Y9IM+FCQEi0satxfWb6XG70SblFdtT2?=
 =?us-ascii?Q?IpSFx0XGKkQ8GLf4274ol5+NRlLkf4i6Kma+JInJxJHGSwfDfcdL+44YeKZN?=
 =?us-ascii?Q?wOPwwNkNPUON9pWzATHjcGtISuSIv2jo7pEZzy3wB/j/cEwSVrBrVWAR05dm?=
 =?us-ascii?Q?vecd+f4fLdPZwEwqsaMeOuyWsqCY1tx7zNe1WDYHE+zUkJMEok81hkWlaQ9b?=
 =?us-ascii?Q?usLBKBedl53D95Ygk5u0JZemNap6eDDXfUUKMzvEChozBCDQMX3QEZcowKP4?=
 =?us-ascii?Q?jJv+kTdMv2hLyXLEpEhJ1VuP6ehVh2+LfP+drjg1gMHTPEFyLmG2P2pXnwsS?=
 =?us-ascii?Q?QhrikeyWFKqj5BeMOf8tk3ku96TPz49T8lkCrLaU7DTl8YzCj7uqdJn6SQgC?=
 =?us-ascii?Q?Jw9C2ujTvefMFEXM0dYbKA5DwR2sNQZO+sIGsl44DNK5awDeQpD+lz4oSB63?=
 =?us-ascii?Q?Z8IXZDhEGHgv9Ke+V8KrMV9TKtb0Z1Obk91frWTULieUQ554Wy6URkRDqylz?=
 =?us-ascii?Q?9P60/F7UABRmoNPSjddLnpLDI3U3JrbaLuu0D7RzuQccfLqlbwUy1fJtFojw?=
 =?us-ascii?Q?CC2e2cfiQx5mtexZnCgfsOKxhM9bjWYSVPnL5WfVXqyBRYv5cBFjILQ5JHdi?=
 =?us-ascii?Q?XQsUR/9/b4asx5r6DvvMsczrFCF50hUSsdBCHmPoFb8XTcyJIHM12J7N97nk?=
 =?us-ascii?Q?zqa78C0qwTsRuCmvbeWrwtcwEOk4uVKbMttewINymJsZ8RtqXPgNfdJpeZd1?=
 =?us-ascii?Q?uEi906ofy+Wk/n/Fn9OOWe+aOekzpHQb2FzL4e8/MiOD651pAvQ9+2hB0NlN?=
 =?us-ascii?Q?rU56UXvnvmLvMcRwwwJ6ENw3DJcrIfnFZoR5MXKv3VE34DVGunEBEH+f5fpd?=
 =?us-ascii?Q?aZncAQ1su1HH1xAsTSuDChYrAyEhLoi2YY5Jg1fOH3/4IWhXZfN6TF64SDMn?=
 =?us-ascii?Q?U4fA68jHM0uR8qXLcP52r67+q6LYpKsnhPIifQlKiGZWrEPDGykpnxyJUZgh?=
 =?us-ascii?Q?Ocx5KsRZ5SXLOy/SZ82387lXZCitdusgAkCaV4sMZp6MxrJd+7hiPpKLgdwW?=
 =?us-ascii?Q?+ZqxDF4jKRud9KV61Jf4W5r+UHg5Fqr5kPx1kBwvH8LEBkcsZxCBLDl1+zrr?=
 =?us-ascii?Q?ZNEsRqM6r9WVoHw5Sa5CkObs2D1eJgnhQ2WmZgh2PHHTA4ZzpzdMfdVJ1raR?=
 =?us-ascii?Q?YX53elYrfzDzDTF9dSDueS6h3o3GN0qPMeDqpmTv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c89ce16-bfc0-47ee-d825-08dc76e0f1af
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2024 02:19:27.9147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jl0JTDC99HeH0yb5BnIULdNtjYt4NFnIzYnXyi7MoWieX0NpPu2TuQ8pv4HoSfdUdjODOxwuKpvqFwiMMxWFLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
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
> Subject: [PATCH i-g-t v3 07/10] tests/intel/xe_svm: Add svm-invalid-va te=
st to
> verify SVM functionality with invalid address access
>=20
> svm-invalid-va test ensures that the driver correctly handles catastrophi=
c
> errors when the GPU attempts to access an invalid address in SVM.
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  tests/intel/xe_svm.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
> index f9e8eb2d9..895cf26ac 100644
> --- a/tests/intel/xe_svm.c
> +++ b/tests/intel/xe_svm.c
> @@ -36,6 +36,9 @@
>   *
>   * SUBTEST: svm-atomic-access
>   * Description: verify SVM basic functionality by using GPU atomic acces=
s any
> location in malloc'ed memory
> + *
> + * SUBTEST: svm-invalid-va
> + * Description: Verify SVM functionality while accessing an invalid addr=
ess.
>   */
>=20
>  #include <fcntl.h>
> @@ -269,6 +272,35 @@ static void svm_atomic_access(int fd, uint32_t vm,
> struct drm_xe_engine_class_in
>  	free(dst);
>  }
>=20
> +/**
> + * Submit a GPU command to access an invalid address.
> + * Driver should detect a catastrophic error.
> + */
> +static void svm_invalid_va(int fd, uint32_t vm, struct
> drm_xe_engine_class_instance *eci)
> +{
> +	uint64_t gpu_va =3D 0x1a0000;
> +	size_t bo_size =3D xe_bb_size(fd, PAGE_ALIGN_UFENCE);
> +	uint32_t *dst;
> +
> +	struct xe_buffer cmd_buf =3D {
> +			.fd =3D fd,
> +			.gpu_addr =3D (void *)(uintptr_t)gpu_va,
> +			.vm =3D vm,
> +			.size =3D bo_size,
> +			.placement =3D vram_if_possible(fd, eci->gt_id),
> +			.flag =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM
> +	};
> +
> +	dst =3D (uint32_t *)0x1fffffffffff000;
> +
> +	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst, 0xc0ffee, eci);
> +
> +	igt_assert_eq(__xe_submit_cmd(&cmd_buf), -EIO); // for invalid
> address __xe_wait_ufence will return -EIO

Move the comment above igt_assert_eq. with that, patch is:

Reviewed-by: Oak Zeng <oak.zeng@intel.com>
> +
> +	xe_destroy_cmdbuf(&cmd_buf);
> +	free(dst);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -305,6 +337,10 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			svm_atomic_access(fd, vm, hwe);
>=20
> +	igt_subtest_f("svm-invalid-va")
> +		xe_for_each_engine(fd, hwe)
> +			svm_invalid_va(fd, vm, hwe);
> +
>  	igt_fixture {
>  		xe_vm_destroy(fd, vm);
>  		drm_close_driver(fd);
> --
> 2.25.1

