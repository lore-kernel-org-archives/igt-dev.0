Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B98C5474A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 05:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26EF10E4A9;
	Wed, 28 Aug 2024 05:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aKMEXUA4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B949710E4A9
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 05:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724824615; x=1756360615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MmL8CXtTZGDOChHzycXUBuIslJUqwByMIg4Mo45l2zE=;
 b=aKMEXUA48CWVLxppdSn+/DSFxUyYULASsYvyV6/WmCh+ua4r0tp+xkQg
 klTpqxQZ9v6kR214A1qTg2PTwztyigwUudgmRbdFSJkA8MdlaJ7+M8nkk
 Az5jacBsN/AHkmpTiiNRohoyuH0n5INxuieGeZS1X0xmcjjH/H6NOzmJ1
 JvOxSPhfi/IQILcpLIJM3CAwC1m93L3KQk/F5WQt5qeBn/iQfYIOdB6z9
 rsbXX4Ir96MT6GXc4/6zXaddAf2jH/TpMdBV2/kYpdugsxijwujj4IIzt
 O6e4k8Bu6/parwvsvlBB+0csER6jvF85Bn40VAqi8ope58PnXEFc4Lkk4 Q==;
X-CSE-ConnectionGUID: T717gcEdQE2qCX3Ef1JS6w==
X-CSE-MsgGUID: Mhi5KI0uQtS76bNsa7Mbsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13254272"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13254272"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 22:56:54 -0700
X-CSE-ConnectionGUID: ObNq8RxtS7actcNNdOBOKQ==
X-CSE-MsgGUID: 7k49M95QT4KCHa+tVm+B4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67964009"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 22:56:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 22:56:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 22:56:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 22:56:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNoUcvRHbQUjIWM8mXKyqflzTwo9ad4g5Ax1pKYTn/ED/pJHo9TYdaKFesPoxqlk/zA46Ou8QVCjCNOiUjNWqYOou8B/Pz9oH/keqIJkCm/0pvV+PDt715Imq49MA7n5TlG+fFfQn+vScBWKDopTLMre/JGZg9eukWpSnWqueoJqAM5Ny2AKmchUqAIfAqUuadUoc35EmjaDshgYr4aJ/p8g44nTVopX3XrIZTy2JXPBCjDs9nfEI8dYC6yCttHc4wOP3Q3PoZ9nBj0RS8MVaQaNs7op0BWQZrVRlYArdfytgK8lU7HnNY7pygYFlAJFvyli/sipMu6rnoR4veQHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FP4GpCTJI40U7XCTgdDuW3Fm1yFT3qtE1fapN/I3Bo8=;
 b=ubDDOJa8QugzSyzBVRoeuYY6nHDeiWXmTaCPcCKTjI08tfT2bUrgRFy0S0qsWDdCgSgnT9ATB1SYi9JiZjogQfS82Wekl0E5t/s+MX4TT8z+onhtPi4dJQKmNPdup9hRz3WZc9kqeioKYaTjGTrdK5ZC1r2r879rtb8XRwWUYu8GwwNEFXtpfqmQAE9W4boaQORo/o67cLKBWy41UJPkPSsufBIe5QfWWJNoiK2ZOGy9F8uO2Pst7ShCUr59eIMKKll9lwEdpOhZJQdWlV1UT9+Fl4ZRFgtHNk7wFmVtCB5hrMIgcl4lpFAwn/FyWjeXqEljhuWCf+Yi13ZkPIpB1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 05:56:46 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 05:56:46 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t v5 2/4] tests/intel/kms_pm_dc: Update VRR handling
 and eDP output check
Thread-Topic: [PATCH i-g-t v5 2/4] tests/intel/kms_pm_dc: Update VRR handling
 and eDP output check
Thread-Index: AQHa+H5sh3lEnlb9rE+jOdoWWdIcFrI8LFXw
Date: Wed, 28 Aug 2024 05:56:46 +0000
Message-ID: <SN7PR11MB6750B7B39147FC8DEA63135BE3952@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
 <20240827124018.1373304-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20240827124018.1373304-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CY8PR11MB6962:EE_
x-ms-office365-filtering-correlation-id: cb234ea3-255c-449d-608a-08dcc7263330
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?w3QKaTIuY/JWzDR4dv8oci8f9wLLZobxQx/2uaFZC1XQZwYB+ZyqfWZumucN?=
 =?us-ascii?Q?XomWvHiHs636L8d7sen6gTCZx6YS50Xzc9xVMd3cwhTE6Wo3ACg2XWKhT8DO?=
 =?us-ascii?Q?EDBn04TKntKZczNDcbvyhhm7rj90Z2JHQN6cCgVdAoJt7xmUcjfooC8Zb3tA?=
 =?us-ascii?Q?aVdL1UscT8/FLeI/zV7TSi+iJDcbWWd95EIxhEbCW7La2LwLPoBtmSVnk68K?=
 =?us-ascii?Q?fLCkP24gR4TWUNG23LuMjPIsJW9wKK/JoD5G3kUYA/kISmNmt1z6gKQ4PBuK?=
 =?us-ascii?Q?fjlqNly5md5sBrsHeMk/vPojl/Hl4R8UIFH75DfHbauG97kWVjF95IKlgE9k?=
 =?us-ascii?Q?iKlaRF32PEcQkYD78xlXXnQlzQJHkZuPXs+9SQu3Gll5QzaT/ah/NG5dU38x?=
 =?us-ascii?Q?SPKAbd/bXh5bWgKw2ErgLfdoGfnykaJ3AG8AFyfggu6ea+gMwlMKvuzKI5Qx?=
 =?us-ascii?Q?9Cpaya94KDwbYxk6KIovIGvT9jVq45YuEJMq5Gzuv3SkU6iSNPbgcurCm0xB?=
 =?us-ascii?Q?2ZEQmcfRYQrkqMARYbV7/S8U+Go3OcICM3Mz89peSc+EyEW3pyMirrrUhpx2?=
 =?us-ascii?Q?9whuCjWAxzn9w6rhjBKkDyWHNtZXE7crPiE93ihU9q9mVKZaOYIWcY55WftI?=
 =?us-ascii?Q?lbO6BLHC4agP8WLwis81DQxVZYKZF3ciL7V44y4pykQDObzlRnc9VADiIMqD?=
 =?us-ascii?Q?V4geI2ot+3RP8ppAAdnNGMC4xo0KpLuEF2Qh1c1IPZOaPK70iRWqLFvPFDXE?=
 =?us-ascii?Q?5o8ko5xD4imFtCftj6gTLVsueMYaKFarbHJ98oxq5nqrkb36TcF3HPBbyAub?=
 =?us-ascii?Q?mzsdPKzd954B9dl7jfP1d4/qSpN4JLiwhxgTrAssgIRle03AjigDSIaE9JGy?=
 =?us-ascii?Q?IPt00zB+7P9mPs1TrNvu8lJptLky35YoKU2fgC+BtEVdoSnbYsRoDZGGBQDL?=
 =?us-ascii?Q?xshzvuN+8z7n6mI2iOsl5zI8IwkH/+5977WCm1fGK5dfIPjuJWTbo6Z1rzam?=
 =?us-ascii?Q?XmUN2978h7wrgvzSD9MTPlhY1l0rJ9ALdcvMmRwtQ3qIPZ82S8/snzmhNmbV?=
 =?us-ascii?Q?vidTz2OkFIl3PRwVZ+rNmNl4qZcQzQYHQMjdFRrfwuqr6wD+c7OB5NVnJXLc?=
 =?us-ascii?Q?bJ772GzQMtFGnq5Pev4lsumGRdc1LlRt5tq6C3jizJE/jxeql88vdTHBWIMn?=
 =?us-ascii?Q?/0x7Hgej/ft4vFfGql1tt4feOpv8oervNVbLbUFAFnKEzh/DG3jOkCP/KbPu?=
 =?us-ascii?Q?5oNmB6VPniosORNtsDaCM0AVOlL+2sYDoVqLSQHWRACprJfiOZZp+A+2M19j?=
 =?us-ascii?Q?BMAYInsb6uQFLZkl0XUdeTDzzhYyCV3qa2LksosYu4Ki3dHdJmkXc3y8848w?=
 =?us-ascii?Q?49ywo0i2IX1mhn0/3y8s9YL3c9nIRtgqh0Ymqxwnzd+tjao8dQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WXysk83z0pl6+pXHU6SbtBNsowiaYNhNzM2bKQv/94CPuWg0EenU5uIxv6zK?=
 =?us-ascii?Q?/uDIuCcWPneXR07/mVDMnj1l7FGPZJssyS+ngOgSDpYZ3VpJojIDKzWv3WDn?=
 =?us-ascii?Q?hvrn+RC0e5964leX03I1Q86wTU48TZ2KI5YJG2R1/pwycJk63EfvwdFJILcV?=
 =?us-ascii?Q?QQvf68jV7y5o/IHyoyIHSsgfkQs52AkC0lGlQElUJ4kfSbTrjGDxxSpzF4Iu?=
 =?us-ascii?Q?ZRj1+BpD2tTCbsUTl5bDYtho9+qB2mWtpBhyPigdkSPj94mEWjXLa6zLLx0d?=
 =?us-ascii?Q?HlRjgU08NoG4DYiZ2UBVlOtoPVOep8c89rqdSrENCoojKXhumPjpT0V92IrI?=
 =?us-ascii?Q?EI3dEVq8y9LC0OPDPL2pSoxOkAnvk5dIeSYaz1VXIn2C3FfDHee5R7Yp7rHS?=
 =?us-ascii?Q?N/wPYaOm4YAK7jd532MQwVdsWGq8F7s9UJ9M/P52QHpPHb60h1FnZn6JBy4C?=
 =?us-ascii?Q?WAZ9hMHKYn8fNuGATiMZ2kwHnqBrz1VzgXD5dZuhXO96xDleuCXcd2gH4d/5?=
 =?us-ascii?Q?uFsM2KV3VidHpil8fCfaofu0Yk6xvclczQx5lVGR8rJRGIXIxGIZplNjmnRq?=
 =?us-ascii?Q?2NS+oZu/iP3Yr9CHWgmuZ3IJXHMk4rKhh4WG8a19aotGxYaJjPDzmMzVkTcw?=
 =?us-ascii?Q?NvyXSsj/LIjLn47Hykt+afs7PhDqp36MNwVPSjfgpOzMF1sEzaxiCFvk3PFQ?=
 =?us-ascii?Q?PLzsQJsK8TIZ85mVO5O9UgLB12cKtLxgQYZ/f/AixUTvfV4XCRz4hBzxI3qb?=
 =?us-ascii?Q?e/ikJtQQxiVYDRAZIqlTD989UZFfPfpXbDx6zQOQXJ80irk1rYjyQMjC9xj8?=
 =?us-ascii?Q?Nkqtf6PF0Y0MZ09LIMUC42qrAKWACtHeIWCbRfrC3o9ura+tlHdQ3jHZQ7Z+?=
 =?us-ascii?Q?Z+XeG24xDFbn8WP020KimaT9p7JuZGx9hVeh4D4Dt1QGaZZITnoVetnWxeR3?=
 =?us-ascii?Q?qoaDVnThj2WlGgxxOoPAa4Tfv/IFpULWGF5DgLAso5pZN4FeajQpUpyDhMcF?=
 =?us-ascii?Q?RhitkDwqg9H5sCy3IAAcXNKtiTmZxzxlVhlJHd5zaQNmhO5OURkeTrr6mqEz?=
 =?us-ascii?Q?Lvrmx0wYShs44MJabp26YeXonq7Zzb+phQgdPqImYe+GyCrYi27IlFTLGOgy?=
 =?us-ascii?Q?UMd/RCUXl07jibPbQzZyt1DcjHazea1cXe29FdmxgA6tXlfnnTmDilckdLV7?=
 =?us-ascii?Q?tj7nvxfkkAp1ebPXjsrl7BoQnKO+d+0RQgqk5N8RbH9z6FgbJgjZZevLTnri?=
 =?us-ascii?Q?55AZNbKdhbr1SSi7Y5WlY5Dk08DiTuYX2cgcsk9/ZSn+wMuWhvNxqf/ztLAH?=
 =?us-ascii?Q?DdKu5iJP4MMPwDtZewZ2RfcdcExX6oj7xwKdRQkMXSPdzYNmA/1Cak774JfL?=
 =?us-ascii?Q?x9AxRpxjbBLi2TuWf42DCPAEfawyi/oo9znA+piPSRUoWrZk2defDA8DsLQZ?=
 =?us-ascii?Q?lzTQ0iol1MhCXc9FSecQmwhRCN4YbM0abOXzckmpltkyZnD9bdQ7jH96zVZ+?=
 =?us-ascii?Q?VQ4A0PVVbFe3wPkBGoN2rF1TtJ8NBvx9T66oZrScOxdA7rN0Rv5+Mxb4Z8Ua?=
 =?us-ascii?Q?wOhNDyoifazd/oV9olzawV0Wxi6tDf5LuIEZWAp3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb234ea3-255c-449d-608a-08dcc7263330
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 05:56:46.0889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FQcpbBv+m2Q+ezT7J1BKPvIJjbnLifFgrdK+1H9cN/6T5pZTGO8l+l0zpN/AJ7SIMWzk6UjL6N3cR3p2gokajw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Tuesday, August 27, 2024 6:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; B, Jeevan
> <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v5 2/4] tests/intel/kms_pm_dc: Update VRR handling =
and
> eDP output check
>=20
> It should be enhance the test_deep_pkgc_state function to include the
> following changes:

The above sentence makes no sense please reframe the sentence

> - Remove the unused variable `vrr_supported` to clean up the code.
> - Add a check for the eDP connector to ensure proper connector handling.
> - Update VRR handling to disable VRR and commit atomic changes.
> - Modify the delay calculation for connector modes to ensure proper
>   vblank time.
> - Remove redundant VRR capability check and skip logic.
>=20
> v2: Correct indentation and update comments. (Suraj, Jeevan)
> v3: Update Commit subject/message. (Kamil)
> v4: Update commit subject/message. (Suraj)
> v5: Update commit subject/message. (Suraj)
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 2ae9fd2a5..b9bee3523 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -596,36 +596,50 @@ static void test_deep_pkgc_state(data_t *data)
>  	time_t start =3D time(NULL), duration =3D 2, delay;
>  	enum pipe pipe;
>  	bool pkgc_flag =3D false;
> -	bool vrr_supported =3D false, flip =3D true;
> +	bool flip =3D true;
>=20
>  	igt_display_t *display =3D &data->display;
>  	igt_plane_t *primary;
>  	igt_output_t *output =3D NULL;
>=20
>  	for_each_pipe_with_valid_output(display, pipe, output) {
> +		if (output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> +			igt_skip("No eDP output found, skipping the test.\n");
>  		/* Check VRR capabilities before setting up */
>  		if (igt_output_has_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE) &&
>  		    igt_output_get_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE)) {
> -			vrr_supported =3D true;
> +			/*
> +			 * TODO: Add check for vmin =3D vmax =3D flipline if VRR
> enabled.
> +			 * KMD patches still under review. Need to wait till
> KMD
> +			 * patches merge.

This is not the correct TODO message to add=20
Should be something like=20
Add check for vmin =3D vmax =3D flipline if VRR enabled when KMD allows for=
 such capability

Regards,
Suraj Kandpal
> +	 		 */
> +			igt_pipe_set_prop_value(display, pipe,
> +						IGT_CRTC_VRR_ENABLED,
> false);
> +			igt_assert(igt_display_try_commit_atomic(display,
> +
> DRM_MODE_ATOMIC_ALLOW_MODESET,
> +								 NULL) =3D=3D 0);
>  			break;
>  		}
>  	}
> -
> -	/* Skip the test if no VRR capable output is found */
> -	igt_skip_on_f(!vrr_supported,
> -		      "No VRR capable output found, skipping the test.\n");
> -
>  	igt_display_reset(display);
>=20
>  	igt_output_set_pipe(output, pipe);
> +	for_each_connector_mode(output) {
> +		data->mode =3D &output->config.connector->modes[j__];
> +		delay =3D (MSEC / (data->mode->vrefresh));
> +		/*
> +		 * Should be 5ms vblank time required to program higher
> +		 * watermark levels
> +		 */
> +		if (delay >=3D (5 * MSEC))
> +			break;
> +	}
>=20
>  	data->output =3D output;
> -	data->mode =3D igt_output_get_mode(output);
>  	setup_videoplayback(data);
>=20
>  	primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
>  	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> -	delay =3D (MSEC / (data->mode->vrefresh - 10));
>=20
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
> --
> 2.43.0

