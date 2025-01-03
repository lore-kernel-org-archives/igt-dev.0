Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE45E77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 14:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3C910E8DD;
	Fri,  3 Jan 2025 14:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxID83EH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAD410E8D6
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735914198; x=1767450198;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=chQyli2jBgiZZ10sFWDxi11Tu4q/2CsiWKlp+cRQYns=;
 b=hxID83EHrW3nfX9W+PXsUapPIl71s8iu3oVyWfYPlml0wlolFesXKnQ8
 C9s9eCM8oKHqt3ghgPavOYkZ8foN0YlKF0lqUiuiaufDrUiJuKXziXxqd
 rqHBySaj3+wiXpVqOjWVPHwb85LQ7nPl67d9Tp8B5CqbuiwiYLGD9KoMm
 zYroOW3UTkryqt1YTygQ2+ciP+QO1c+yp6zs4eDIz26eU7QS48jhnk5JD
 qRj7g2Si4GdbqkpjEl2lrMgIP1626CfwKu4sz/l9awKLPXJO6wSW0CaNT
 XTwuH59edz61J1eti+I9LYZwnKhEr1vX5t4pyGUNsIwyk+JpC9L+j9LBV w==;
X-CSE-ConnectionGUID: bvsy3hbZQrWW+SF0wWjVgA==
X-CSE-MsgGUID: Kx2TM82oQyq6khW73Ma5uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47519253"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="47519253"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 06:23:17 -0800
X-CSE-ConnectionGUID: DvCGMcI8S82KNo7nhVS6Ow==
X-CSE-MsgGUID: pBF6nMeYSLGcbdczSDX1ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132724052"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2025 06:23:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 3 Jan 2025 06:23:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 3 Jan 2025 06:23:13 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 3 Jan 2025 06:23:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BD0dj4sXAQ4e5FnF/K/P97QNJuzemj1WbcgANl5Mqdvoidh1EMKBHI4xuC8ODBqlHSEzVbGP46KXbaJfyqHq7oeKJgKliypWJSKWWpDhc7MdS+o19eVLxpcLA28clgofOPJ2NPCvHjbdNNAkokW0jGG4AHDlbR6OOyDdNdDOHwdB7pljkHenr3B5syO64GzoL/VJGno7GN6O3G4RctwKLg94ZuvlDpcwa/1jjkZJD+TpzvxWUzTQWRQlpl+dNNk6cTdg0qL0ZbMokyjU1yILbMH5zdmdCp9Wr0Z26fu0flFR/IDsFcod5l3KOTShZ+1HGxx7Z4s5ssNZuSqF1Dm38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7RCZn+CQvzdJDFHfq8tPTSQ/j9YAuje9W2GS6wNBTk=;
 b=xDO07v/xE2gaV7zdj41bvZlh0bdQLdqWRrOWBgH5Vpz535s3Juzh1kBVkaoYSFFxvuWjTqvtZ6p0AdYKuictKvET9i9lOOQJ0ILgk9DYuz7JjMmZ4zB/k7t3X9korMAu3qpC6ePmptSn0c/DZDGyRfV1+h5B/Ejp1pQNVD8CTj9NCTxHBljfdyYmbsj0gjLGUXA5lRePKuZkNiDtaDyo0QLk/DtFUa43PCfpcyIdoYQEJZiQjsXrni5anapN6pLk/wyHB2FZN44y3NpyCcZnPhpTdJz2S0uMQwzgJSIV4oeU0HmZXyhus3U53LjtTW7zRnA9x1Os+jqgFRIU+CdfSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Fri, 3 Jan
 2025 14:22:40 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 14:22:39 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t v3] tests/intel/kms_fbcon_fbt: Add skip condition
 for bmg platform
Thread-Topic: [PATCH i-g-t v3] tests/intel/kms_fbcon_fbt: Add skip condition
 for bmg platform
Thread-Index: AQHbXdaqihfv73ms2UyGN7eb57diO7MFGcFA
Date: Fri, 3 Jan 2025 14:22:39 +0000
Message-ID: <PH7PR11MB6053C2A03BA98B141B4EF65EE7152@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20230328023811.46847-1-mohammed.thasleem@intel.com>
 <20250103115710.84108-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250103115710.84108-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DM4PR11MB7207:EE_
x-ms-office365-filtering-correlation-id: 6e933f38-6a38-4f1f-3b04-08dd2c021428
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?vuVUdaisP5LZ5aB9ahqjsRcNAc1H7tJh+LKSKs7Qnh8W9YTwK0/onJ+3meyx?=
 =?us-ascii?Q?ibzLHvYbG+BqD63Dq6/PIol6KJHd4zTVPuTGEPe1DRiXpDr5NppTHSICXYCl?=
 =?us-ascii?Q?dUS+vChCq7dYGIhfjaTD3mEd/gj1c8/uiIHYO9+tzezgb0iyolbH6DXr9qlL?=
 =?us-ascii?Q?/GONDl7cz1JsckFedNXc+Kb3JrqEr47dSwRf6d3G4kotIExTYCaPTz4dcKHB?=
 =?us-ascii?Q?O2XSi0/pBFJE9TtBjaEaPUaQcq601/x/FhVt4XmULAMOpY53qfG3bDvt5bq+?=
 =?us-ascii?Q?xZv2a88dw/cV9RaKjJFsYIlT+3AnurFrQ0B06QEmBuwq8NtZ7aV9t/vd4HMC?=
 =?us-ascii?Q?bWOIMDbBH1NKXSMMB9Akf/qLpN/5COCktH0//DafG6ZelzrvEZhYJtipRrbv?=
 =?us-ascii?Q?Zfvoqr6PyI4f1rZ6ouHqW958yG8vad8DSO0EKI05fGLdIHiLVgyi2/rWhvnc?=
 =?us-ascii?Q?88i+HFLrCaBip2aZvr8cNwJQpY2SkW5gB5DbrLhzcNVe87d0TEZWPNXfseJ6?=
 =?us-ascii?Q?SVqwIpzySa39a7wenV0Wx8QDtCgUM/ujtaDhmemU8seZ+9wANegAS6Be1wYR?=
 =?us-ascii?Q?II+LXnrqhthUjzW0r21DjDP06yrHtsGWT/Dye97+cek8SuuqIO9Eznz5JLIW?=
 =?us-ascii?Q?hdWA+7fYzXMYvQkO8Hp4a5OQwOubRmpVV5owj1bdVvmJoX8kdsSoNHA7w7G6?=
 =?us-ascii?Q?sHnlv/ONSXeUh6V04TNmN6ulZWHg1RsrQjPd5bTcvAvbS+5JS6mVXjQgtPCN?=
 =?us-ascii?Q?SM520PKEYKtuAnfyXFtdq22NU7ufVxurfYqn1KaSTwvBbEd2ONiGp/o//kxk?=
 =?us-ascii?Q?PzaEPFWPhj29tOZiswBBDtYd+L2OnAkww7XUb6a+1kwHvR0PRH5zWs9Z+crS?=
 =?us-ascii?Q?eYERYQ8wRqTe2NP4eRBRs30VNi8aw4eKEynhhQEureDdsjuMu7AfK+/oquCb?=
 =?us-ascii?Q?W0sMha9ImddcoIE63Fbw8lb2Sh77Qf5QubwGVsApmbI2NPq27SeerVwW/clW?=
 =?us-ascii?Q?KADAEx/Pt64Os1EIPOwHf94ewIQQWzWUTRLqc8izmqKYP9eqYJI9A1loefWa?=
 =?us-ascii?Q?CWctM+/wsPL0jCX1vjnEJHWV5fJxzfz4lQPx9JX8+XNnqC1t2N+qRLEFCyrs?=
 =?us-ascii?Q?kLAtSDTxB/3D/XyTtOrlNugSjKGuRW6CXcm1AxrHjxTYc+HYvRpxAM5D/pGE?=
 =?us-ascii?Q?7Mek5bLAf4CrcO0Bg/fCOj87fhhs3AibEvdP8Q3nAppa8A/uTxcP+PH66y02?=
 =?us-ascii?Q?1arsshvibOlwWIDlU6+YhA8ZlKm7iWORqB3PDmAxgF5/7DNyCCR1CUJZCW36?=
 =?us-ascii?Q?5I/CdxD3rQTWMdD3Dv8eld0lsurST+tXapdmi2Glj0rSkIDgAHneSnVWPptG?=
 =?us-ascii?Q?4UESWXqTVQUJ/u4jcyy4iPUoqL8EKFGQJe06DySmHs5IiFDLYRdpUmYdIT/I?=
 =?us-ascii?Q?Qd/pzxhiULeuj7zJXxzYTrBLT5rU+WH4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Bbr/PkvF1Yhf6wh6waGlSV7csTG1G3aI85modwDMDvdkK32XEJwPqExLzyQY?=
 =?us-ascii?Q?Bqv6Zo7qkvi59UV4NGMhyOCTAW3wYtheEDXu/TSBKdDv14tu3lcCsVGdwW2m?=
 =?us-ascii?Q?0OXQTQ71EyPuRqnUcM9fxlva55fjFYXhkxepvFKHy8rckoL/1dMNmIGeFUnB?=
 =?us-ascii?Q?uBlDxLRDhvPnd9dwcatgZmsWujBqasqGNyW7gFNcJigOmb2X6jTS1HNNwSv1?=
 =?us-ascii?Q?XyZLxUGsN5nHshpPoi6xjxWMSbA1bVtvW2eVfN/8kLrfGIre5i6GF9zA6AYO?=
 =?us-ascii?Q?jFM07XeD61YY57nXC2DS33NYkOfpctPfnyI0s7EuwsJV06oOpga7jgs3t6Wx?=
 =?us-ascii?Q?vrpK+aj4yfIg2FCFwCOHCOQ9/c7q3MnkXpvpeav8LLv3a7WXGlbyAUxhJxvi?=
 =?us-ascii?Q?M5uGbTTRdvg5OoYDj25X342ZhMVb+aLHXy13HDH+UBIoRPaPkFqnIP3RkQlp?=
 =?us-ascii?Q?i3ouO/WurdJ0AcwjEIDeQRIx6Tm/i/mRaPOyFZ8Zyt6yJbSGagARlhFpH/te?=
 =?us-ascii?Q?JV1g3Qt/imcsKAlPMbygpCT8K3x7G6CTrwVjxCOeKcRdlngz2+F3nP0MbOVE?=
 =?us-ascii?Q?uzl6vJ9zBUEAasapUMz6TzCnNBBUUOMuBMAq4JY8Mmqt0xVvulJ9E2iBZKno?=
 =?us-ascii?Q?pRw5nnq5VSa+ncasm6sXRlZ+HsWAs8clI0Ic0kpVPoGfWaIkgARf33R3ptRe?=
 =?us-ascii?Q?RrGEPxaXLfvOWrrDaXpgz1/pSxD7qr3oCk48GA7GRNX8k13GYkHN8AMBGRyT?=
 =?us-ascii?Q?mQuE8TUl7/MPx10TX14tYWS7sVLtvSqMYjr/ZVsjUrS1tvmZA+AWfsb0qAAM?=
 =?us-ascii?Q?mtKHT/DruwdMuKEAobZRUEtylCx4BvRrd9X4UjwMZe/cIVj9DfCwfq2BYn2M?=
 =?us-ascii?Q?HMITKR4i1IFCIX27U+zG8wJEkpOWHhXxKSvRoj6W3LLbfZYmg96uA8BTssby?=
 =?us-ascii?Q?9q2nh5qbaTSGkwgnX22ebQBhRfYUtOE9OtKX/r0Ky/cEJQTMQ+O2rdPBvDvJ?=
 =?us-ascii?Q?sfi3uZTGBExWRlqJazUkkiVmAs8UuK4MtBopy1s3dcnhephXQmLJxQ1zbUxD?=
 =?us-ascii?Q?S0VzGllePRkmAAa1x7M7bNqP6XhjPzqMmp0QN+JvCY8uVoL9QajEdNn4oii5?=
 =?us-ascii?Q?486QzXBOMJ5ucE9HtGQqo8CPz58t4fE8/PPyuGnEnKrU8KUjkEjTXeGfiXJE?=
 =?us-ascii?Q?eGDsrchmIIoo9gkAO2NnU+WFiY+QnMa65egOx/BxdUfwxU1IdCwq4UWuGqGS?=
 =?us-ascii?Q?8VBNKZz8FQIgcqoupBTV6/xgwr07QZ1DtfNpvtJzgsu93XVG8i7HgO2VvD89?=
 =?us-ascii?Q?8TETzwlxYrJ3cFuwO9h6fNHgY+g3wjIzpKpFWdGADdPdasAZXVCAOvV12f/F?=
 =?us-ascii?Q?5aSzogdH9B3JeUzXbmhvcQ3/LHhUtTWj5IKLrU0kFuxOC9SwyWqxLf1hVitm?=
 =?us-ascii?Q?Ju36SiCv/pXwc7uCK3VZbddTHHrEnO4hdJP7Ssm20bmoxLYwn7AlI0i189P0?=
 =?us-ascii?Q?YBlsf3dBri8iWKe1sgAeJqFuGuZXyVSG1wOFtHn5TAwVdXyDOLnEK9DeR7sO?=
 =?us-ascii?Q?xfuFnxTfGuqsJm/qh+BOd0HdSB2liMZ6igbotX/6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e933f38-6a38-4f1f-3b04-08dd2c021428
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 14:22:39.5941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3jrh3kV8gay4ZBZzcUVsq6fKDy9xqu+GRlnT9lBAPWulQ4Nr87+b7Ng7HvN/1gM8mNkMvFStKVvgWbKXEntgpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7207
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

Hi Thasleem,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohamm=
ed
> Thasleem
> Sent: Friday, January 3, 2025 5:27 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t v3] tests/intel/kms_fbcon_fbt: Add skip condition f=
or bmg
> platform
>=20
> FBC test isn't supported on bmg, skip the test on this platform.
>=20
> v2: Add workaround id: Wa_16023588340. (Pranay)
>     Use IS_BATTLEMAGE check instead using devid.
> v3: Add workaround id in code.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Please add Reviewed-by as RB is not reflecting.

Thanks and Regards,
Pranay Samala
> ---
>  tests/intel/kms_fbcon_fbt.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c in=
dex
> ab4819d23..9c3ff7a21 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -73,7 +73,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between
> fbcon and the frontbuffer "
>  #define MAX_CONNECTORS 32
>=20
>  struct drm_info {
> -	int fd, debugfs_fd, crtc_id;
> +	int fd, debugfs_fd, crtc_id, devid;
>  	struct igt_fb fb;
>  	drmModeResPtr res;
>  	drmModeConnectorPtr connectors[MAX_CONNECTORS]; @@ -418,6
> +418,8 @@ static void setup_environment(struct drm_info *drm)
>  	igt_require(drm->fd >=3D 0);
>  	drm->debugfs_fd =3D igt_debugfs_dir(drm->fd);
>  	igt_require(drm->debugfs_fd >=3D 0);
> +	drm->devid =3D intel_get_drm_devid(drm->fd);
> +	igt_require(drm->devid >=3D 0);
>=20
>  	drm->res =3D drmModeGetResources(drm->fd);
>  	igt_require(drm->res);
> @@ -457,16 +459,25 @@ igt_main
>=20
>  	igt_describe("Test the relationship between fbcon and the frontbuffer "
>  		     "tracking infrastructure with fbc enabled.");
> -	igt_subtest("fbc")
> +	igt_subtest("fbc") {
> +		/* FBC disabled: Wa_16023588340 */
> +		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported
> on
> +BMG\n");
>  		subtest(&drm, &fbc, false);
> +	}
> +
>  	igt_describe("Test the relationship between fbcon and the frontbuffer "
>  		     "tracking infrastructure with psr enabled.");
>  	igt_subtest("psr")
>  		subtest(&drm, &psr, false);
> +
>  	igt_describe("Suspend test to validate  the relationship between fbcon
> and the frontbuffer "
>  		     "tracking infrastructure with fbc enabled.");
> -	igt_subtest("fbc-suspend")
> +	igt_subtest("fbc-suspend") {
> +		/* FBC disabled: Wa_16023588340 */
> +		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported
> on
> +BMG\n");
>  		subtest(&drm, &fbc, true);
> +	}
> +
>  	igt_describe("Suspend test to validate the relationship between fbcon
> and the frontbuffer "
>  		     "tracking infrastructure with psr enabled.");
>  	igt_subtest("psr-suspend")
> --
> 2.34.1

