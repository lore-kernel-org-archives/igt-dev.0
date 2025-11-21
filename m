Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAE1CFA477
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 06:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC3810E7E8;
	Fri, 21 Nov 2025 06:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbvOSo/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EC010E7E8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 06:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763706638; x=1795242638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wpwZvxDEcQ2rZIqlCazysgeOQYDbgFDhc9T7ul5DNCk=;
 b=RbvOSo/n2D0m2BzMwDAAuLG08ZwlpF9YaiW15lnpbKBBuR/cx6GbShQi
 JS4sJ6ydQGqU8Fpc2EIQy2qlCxFeAJmhjeXcsYSptp1zHzI7hnmfr/vy4
 /G2umSLn0F17EL2hGrWAiDfNICRPLRrzkZ90LV0PIRayGHedSJwvn41h3
 4fMAj9XaHmXmWi5xRkJTtNPh0sP/0xallb/K7gSseqXmzq8dlN1pNS1vG
 E8rkPzuxpKGulbixs/dvGj3yatV2MaFGGbnSP12fufQ2IDw5EhwoAYVUS
 xSPz3Gl4S6kW+jxvVUsN//TBswlm2N+qWRWWLL8QoDNxYF+/Di/CR+M9t g==;
X-CSE-ConnectionGUID: 1j4vNbKjQ4uz57Sdf6+lhA==
X-CSE-MsgGUID: +zKRJ/DSTRyqqAtAy0vqVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83417462"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="83417462"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:30:37 -0800
X-CSE-ConnectionGUID: JEUBIQN/TkWcR3cijVG5cg==
X-CSE-MsgGUID: olTuUfzlTE6vJfZcvBlOKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="190825318"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:30:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:30:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 22:30:36 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:30:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNQTEbtXgfk2x3HHtl0jLXTfSzC/ctACKwHm03mYKkKBgg4OiRtMAlxXKUPYzl3AlXQyHI3NA9tm3FqbqlVV4ZCGd+hKNK180cnQfeZhjbuU4BVIirazqQFXujZesBeSsoiMGIkaHGCXS8K7bAAsBTeejos4DH2L8fqPO2cKzpp4DF2okRzxxlNBFgainpo3I2PomO/kupDb09iHIzif+ZZq0FjCXi/1n40rUNR50LpqFHAhZMmfoppm6fhF3j9qucSNACxH3UP8nX07/UhctvruFaXqIb8mRxAsM9b6QPXkaw2Mgx1StLEGa31in+OiQkpKGc4d6yeCL+f0EPL6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2pZ2IcLy/b3/J4OlqgKsWLOQ4DlcorOlYmnXXnIUYs=;
 b=V+yoIUKLrDIo5yRkpsHEKepVuztEOIKEmEjx3Uhb+MgI3X4TBWkxWr4n9nG9//f7icHehhLdaE9u8FoFZZ6nKsFBfuY3DQ6mqGauQ06yE040FjKLZGlpe5WjYFYoBwQ89+TCTmsi7MpaJZeHUbYcOTaIuPx5ymGTB1JlE9X1tv3+bt55mpopzCrlIXriD2fdF10xoCcZkswEL4fYJ613Z3b+xLFBE4IS0HLxOdlxJXU4UgqsGfOByz5q3p0hvTxAnc7zbr6wxf4jqd0TJ6pt8rSBsiyOXQxpnT19q/3FaRch51Dwkj2f0v1YBNaWbXWRrCUdWR75yLB6QTrLmFCq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ0PR11MB4847.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 06:30:33 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 06:30:33 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 04/12] tests/kms_writeback: Add intel specific
 check
Thread-Topic: [PATCH i-g-t v3 04/12] tests/kms_writeback: Add intel specific
 check
Thread-Index: AQHcWqlsgLzOJzkjHkerRVWX5KDs67T8qXPw
Date: Fri, 21 Nov 2025 06:30:33 +0000
Message-ID: <DM3PPF208195D8D1B10CC868F3B2D2FA06DE3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-5-sowmiya.s@intel.com>
In-Reply-To: <20251121055839.3116906-5-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ0PR11MB4847:EE_
x-ms-office365-filtering-correlation-id: d9de62b1-4593-479f-0946-08de28c7799b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?00sECBC05keg6BXoizhxUroI9XqbZBKahFWaHv6eUOEfBTu66iwlG0RyhNg2?=
 =?us-ascii?Q?+kUk8Iym/cDcHJGwMF/zWtA5dIXa9ywOzDedt0yD83Tnj6kJZNJp4Ox7bbAS?=
 =?us-ascii?Q?lCR2OM8+by79A15AohQ80nMc96GH/b0p2OQCkR0x8fZ1EZZabQOE/mK778Qs?=
 =?us-ascii?Q?Khj6KFffHmaOaaKQK/5mrc6Vw9yF2WvBv6khpwe7uVsXJhl/55agkLsLmlNP?=
 =?us-ascii?Q?0gFatM8baoj5mOTR0z0//PzOtpi1VSFj9w7yPPfO5wJ5x9EQKVAKKbGfw92r?=
 =?us-ascii?Q?oxFXFHRC+AhZVrfHcihloaQRbttFVKXyYhnlV2qoEG2SZSINDv9sjfnI1Tst?=
 =?us-ascii?Q?pVWitbYi2prWSdlPBI30yQBC/JXKsAIFS4RudI3+bR1rnbzjJvtuUw0KoLnU?=
 =?us-ascii?Q?PbjlhO3zOKCVDvpVEoII1nAMXYDfnrbhq4CwUnEo4xL0jy/rwTyywDAemr3k?=
 =?us-ascii?Q?UcbiSxhtXhb41/dXZWHIRtv7o0T7tySZIGKErjg0Z//LQoQ78XaV90ujtkQz?=
 =?us-ascii?Q?tkBTe8Ah78PzG3av8L5x5bCfja4LhyUjHHBz6msoroR3bNTJ0hhaLSms83o3?=
 =?us-ascii?Q?wF5J2hicyO/lSr9YgE+bC41HQNx2Pdw1qt1bjb2oXAFtoxCo7bYyEhOrnq+o?=
 =?us-ascii?Q?m5rVFkAkOC7kA5F7Mrx0FCZomapT1DLtKrUU6VLdb5z3/No34D2Uwzq0QpzC?=
 =?us-ascii?Q?sQNTDESKdvPhp4ktyvTPSzSzDpZ1Z7yPmEysafBMvkeE0iRvNafi8K6ONdMs?=
 =?us-ascii?Q?yT8eZdwlskSksCbbiCY1yY/e+wMVCridH+CcKg6yP84cNbt8ZBXjrvG+cL7X?=
 =?us-ascii?Q?5DTGudd3x7qKSx77i7AMAeVyCG/6qut7Mum6Xio7Zd/3LPAZg4tgtTvttvIy?=
 =?us-ascii?Q?Yd2wgjA5fTDjYd4LlUi54hZdvw3rGEIEdaYeuCfLWtjpmmV8urzR0jSowiQT?=
 =?us-ascii?Q?b0DW4x34mWOS1v4HoNyEDh4z1e0ePgxKlarTN8lCecyP60MIWWrHHJ80yVOS?=
 =?us-ascii?Q?DSe7Z5Sbp5FB7b6diUmbEULXl1kiNd3/0AfpiyjxpeM48caCpXRLmfUgZ1ml?=
 =?us-ascii?Q?DH+1t0J8ocgSK5rEe2lV2c25MYGyi9+sTGLCbc9lgdmz+GciCgJ2LcmUXv4H?=
 =?us-ascii?Q?d0HDDGTLTcn2aP5TuJgSQN8MV6XJJeOSMtgfK67A6WOeY5VCigHF2AmOH7ER?=
 =?us-ascii?Q?ocilQ2x2X4CYfFVXQd2eelppilycXQEryNpgRIupir95/R6hIAvoJmyQ0Nkc?=
 =?us-ascii?Q?V6zEwSX5rACoeseD2ROmi0Jy33vMDcXZTJLSwu4CRCk+bSmev+j57uTYYY5k?=
 =?us-ascii?Q?nktYst4Ra8GTdhHJVBKPzVpIWpUjLNfLanCGCfdVl+CzSjQG3rlsDPjTHbV5?=
 =?us-ascii?Q?Xg9+/nTjhuVKswOepiyVJa+4CXZyO0r984TV0g+g9eEZtYjv+wGy3Ijwjn4O?=
 =?us-ascii?Q?54yXavuIBrPoBVH78/mwEcdN6GjQ+djBecc/gvWpW6sdst74uwVoI/HJqEGH?=
 =?us-ascii?Q?ppSonJDdC9gotoeWXgCpcDhzgeusFwcU9PrE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3PIYEuXvaFAtjw5HlV7RDwv+eevgCaazpM7U1AZky1kKat4HMZZyF7cx63JS?=
 =?us-ascii?Q?TNZC8me9vwULW/2EMGpuDGe0EHNq9QC4ngoDuEAsjqQMk24MTJbIrROzFO7X?=
 =?us-ascii?Q?ggjtOAomiFskhnfQHQZ9wjVneLxWCIIwyE5KSNkh7rHUui/nerBOKA555VH4?=
 =?us-ascii?Q?st7otBvJfGXRgY/FYM/pT4a4ypTKZ/DDKoyb0kPu3ThWGQl067IGg2I+mzcm?=
 =?us-ascii?Q?bebC34XKNS6v9/a1sJ7oeLzrO7/Vm5Xs5Ir7suLj6Y1xlae2g6X6euQa/30C?=
 =?us-ascii?Q?CVzAC3Jvu2wXf+B1D+Txu5u6zF87kzYABM4NeZq48N14NLYD2Alrw3HMBjEe?=
 =?us-ascii?Q?Z3PNh9ptBMsjMkfvHoHWS7wfOLZluakKfPTLocma/SIakakPCMNO6+PeqZDl?=
 =?us-ascii?Q?qVJNj7afPqMX82iNrekjtCD4Pq/R+58ZSjOdNOqCh5f98uVA/wPNF413n4mZ?=
 =?us-ascii?Q?iyd6CUCOsbtDcrxhHo1jy4zqZ0rPU16IY18x3Wqs3Vfdv/hurtACd4yAN0Zx?=
 =?us-ascii?Q?xFa9t9R7rcROy0bpmvvDmNNUdW5BFTS2mJlxPUiyFrDAoJdMHwuIi0+zUzkA?=
 =?us-ascii?Q?DS0l5Tlw009wyOfzFVw/qxg3iNxu0piEvb6FNovy1f3Afo+JZKnsBc28YpCF?=
 =?us-ascii?Q?6yYLL8V+Mb8q1SL9/enE5JFO2Q7WQTW4NK9YtU2Ah+7hBdAihoYHVAYbhPAI?=
 =?us-ascii?Q?Xy67BneOXaQu6f5D/kyd0+SV4yEZ1iCkeEX+tOOTR32gM9RKsoImyp9r8LdC?=
 =?us-ascii?Q?EJtpe+G6b6sRNph018FVHfwe4sD3CsxlJ2QqlNw+mjWh1HXu0YoILeT/9GaT?=
 =?us-ascii?Q?sIhXmqsFl4ULAmolQhgzSnlfFoX1Yn1xOMSpxjBpuVa0dwwsLDwL0u2uDs4y?=
 =?us-ascii?Q?wa/od6c4Z3mfbRRVuD6d5nrZuXA9ui9+1O/6CXgy7LiW5ajSv7iiMn8LQEkP?=
 =?us-ascii?Q?YlmmaoD6HMVGBICinWh3Cvr4hLUD2Z7iorBL8eP9s3OZZksi9wiiybeKFCCX?=
 =?us-ascii?Q?rlWhJJEPWF82skGXy6v1T6rt0KEISKRklDSzPrveh2C0qG+jCVVFjcF/upmH?=
 =?us-ascii?Q?AoeKJ3JD4KP0D22ySRLBb3mx1o4ixIUJ5g4DASPMEOIGtbfcbizgtlMS4qtt?=
 =?us-ascii?Q?VodDkhmUBr32Nn+SwNiec3DWCW9TompvrPUPdAkpFQsgBbca6WW84lJIg6Yc?=
 =?us-ascii?Q?LRUFIpvfsZJ6leT2RDYWT72PIrByYDWlajTuxCf9Bm/AO4GCEauzLo6uPH/C?=
 =?us-ascii?Q?Me6xYac65HOyqsj4f0X1dg5z/BJTnxWWDYXFs6v5TR69XihjOk+Hn9kYztKQ?=
 =?us-ascii?Q?boChOcveqr/EZLlugFcoubVFfK7Tjhx9r5XxllwYlfQkBHJU/eEZ1d2BC8pZ?=
 =?us-ascii?Q?MvR38KPm6YzRvl9URum63BipXfYGIjYhD1J3FbLzRy+he3qvtaJKNpJBnr+2?=
 =?us-ascii?Q?HEPTKN6WP8odMsZ+O2NhpD6rmoLlBeqsy7AX0HRZl0Lx5t1d6h16wnbCXqy2?=
 =?us-ascii?Q?k841qFSNfhJ8Pa9ShwhqhePQSVxe7pvndGA1COEITHvhmuTX4J8E1AyUuUQl?=
 =?us-ascii?Q?bDaGZiB5xXq8Jv2mPW23HF39Hnf+SoAPA9XIQTkh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9de62b1-4593-479f-0946-08de28c7799b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 06:30:33.6426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zMDqYGrr/aVvzy61AFaUlUpx0v++J25FPqfAaayFRZIZ2327PXOJrp8/mbyJ9xcMSd9E9sNGbbfJqw905SAQWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
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

> Subject: [PATCH i-g-t v3 04/12] tests/kms_writeback: Add intel specific c=
heck
>=20
> Add a check to ensure this line of code

"This line of code" that does not really make sense make sure your commit d=
escriptions are actually descriptive and
When someone pulls to main line they do not have to go through the whole co=
de to find out what this line is

> executes only on Intel platforms.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> e9173ea4a..b6d38ab28 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -74,6 +74,7 @@ IGT_TEST_DESCRIPTION(
>  );
>=20
>  typedef struct {
> +	int drm_fd;

Why there should be done in igt_output_t in igt_display please check if you=
 can derive a variable with currently available data before adding one in a=
 struct

Regards,
Suraj Kandpal

>  	bool builtin_mode;
>  	bool custom_mode;
>  	bool list_modes;
> @@ -287,7 +288,7 @@ static void writeback_fb_id(igt_output_t *output,
> igt_fb_t *valid_fb, igt_fb_t *
>=20
>  	/* Zero WRITEBACK_FB_ID */
>  	ret =3D do_writeback_test(output, 0, NULL, false);
> -	igt_assert_eq(ret, 0);
> +	igt_assert_eq(ret, is_intel_device(data.drm_fd) ? -EINVAL : 0);
>=20
>  	/* Valid output buffer */
>  	ret =3D do_writeback_test(output, valid_fb->fb_id, NULL, false); @@ -
> 402,7 +403,8 @@ static void writeback_check_output(igt_output_t *output,
> igt_plane_t *plane,
>=20
>  	/* Two commits, the second with no writeback */
>  	out_fbs[0] =3D output_fb;
> -	writeback_sequence(output, plane, input_fb, out_fbs, 2,
> fourcc_color);
> +	if (!is_intel_device(data.drm_fd))
> +		writeback_sequence(output, plane, input_fb, out_fbs, 2,
> +fourcc_color);
>=20
>  	/* Two commits, both with writeback */
>  	out_fbs[1] =3D output_fb;
> @@ -552,6 +554,7 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>=20
>  	igt_fixture {
>  		display.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> +		data.drm_fd =3D display.drm_fd;
>=20
>  		kmstest_set_vt_graphics_mode();
>=20
> --
> 2.43.0

