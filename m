Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B998AC0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 12:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752E510E0D1;
	Wed, 29 Jan 2025 12:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuXCIy+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B1610E0D1
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738154849; x=1769690849;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/4897ddJ9cxYUWIOTWMaVrNssa/kOoiG0JY/2XXGsYM=;
 b=JuXCIy+pJ9Jjej1o9boMHjtRslv6gcCfXEK/xTMPGfyIK1WGvBHfM3Vw
 TKBKxdQ12eMSu/6A6UCiiARfVc97GZpJ17Nx4EsFWhA6xZNhYb6dXPE9e
 D68ii6VFxkuEx0d7+8qluFFS+8N0ksctKnalz2020M3Ftx/jn0Qigah3e
 e/J8kSyci/P1675Qbz9XInyb7560ajcH5wpfELZNrS4DgzlEr04Rf+fWo
 LBa88krR6aMtiSO0D6/3llhuWy5O1v+pLQbCZApqxcisco4TuiWhBvU5T
 52vYj6WzkEITc3LtAG92pcnJdK3f+9aIPMvp5mwqTsgSfGFIYTLEiOeEL A==;
X-CSE-ConnectionGUID: SXBTlrcQT3K0eMPLQr/6IQ==
X-CSE-MsgGUID: jKicZG6IQ4q1W5AnjPN0dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38371431"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="38371431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:47:28 -0800
X-CSE-ConnectionGUID: ZHNv/hsaSJC88djsbu9C5Q==
X-CSE-MsgGUID: TD2JAoa7SpuEvgwkWSNCFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="108845385"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 04:47:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 04:47:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 04:47:27 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 04:47:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxTZVxz/GnE03BCAXoQkpbNyrS8qV9hhPsIV+NW7NCcqCTfQ7bNkJHRP1e1lwr/P4ieGhFtd8OCwo0NuTfmUW1U5iOT+8/R90NgIzFVD1ugW/fDWczkflUep5VGjj26QYZnmupw+HFjgfZvXk7oxobVjFg6OlUtlKYNUWQBJip+zJqDAr8PeHAV0o/4y7gaT1cVuMwsrm0rzvA6DFA/kj6SnwtzG9s2EkPUbGCgWOXCnWVAkr1TJf8Nj3DsFtZ3MBWPzGBai2aFtck+LP6SoiCBLnCNzNJD/44LZsvKlVcGfszgWIDzlK53rqA6rFKyIxbDUyFv9kHRejagl7fboWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvCzsds+oW+Wk4Q1PlhPEhUsNF2M0yOWIAv/SUpqa3k=;
 b=vNP2ZwzofzLPogG6y+W5bO5m74jD898iAaGe/e090O7s9OPNX0NOq7y3iKqwp/1DcPoYNnOA6wbffkU4D3Qva3yXsj00F3eomAIfanOnhD6qAOQutH/bpuJwNTvYl8bHINLVjmKPkJ17dq0X+nMOhtlj3QZc/1vkZJVWTu5v2RCy5nUr5OqlkhXWc96Da8NjDyvsnWDAlud3ES3qS5XQoQ+koGPkCBEUVCn2YxHF+DT5nbbJItdJycJGNV5QAZVyEc9l9S0uVMWp+ONIGM+Re7Tcfz3fuCsYg+qIDJI62l/K8Zr4fPU5XvR/xlWg4vDZ6vO9+4ydBgFzWdu+GMM2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by DS7PR11MB7836.namprd11.prod.outlook.com (2603:10b6:8:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 12:47:25 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%6]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 12:47:24 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/kms_pm_rpm: Restrict cursor tests
 to I915 driver
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_pm_rpm: Restrict cursor tests
 to I915 driver
Thread-Index: AQHbcNZBEXbaurMXeEactJLUsRsPRLMttMkg
Date: Wed, 29 Jan 2025 12:47:24 +0000
Message-ID: <PH0PR11MB4806123F4402B8A3A3A0B620E4EE2@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250127162736.3451740-1-jeevan.b@intel.com>
 <20250127162736.3451740-2-jeevan.b@intel.com>
In-Reply-To: <20250127162736.3451740-2-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|DS7PR11MB7836:EE_
x-ms-office365-filtering-correlation-id: c3343f7f-e360-4a2d-7ad9-08dd40631493
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FK6YJ9MYyySPHvOu8wzsKWKuwWK0BrzCpg4bI9m034Y6ctYrG1hS6V35dccF?=
 =?us-ascii?Q?+xu6rpJMK5m+pPty6TG2Ngl5tXOEy3iSZQ7P8kJbPKZ/m4qSfPW+PKVHE/CO?=
 =?us-ascii?Q?dBIAllWBNKDYxGL+7yZjl08aBQYobvv0Bkxnh+HfSSmHppL/9yAPvl4Fukbk?=
 =?us-ascii?Q?YwpvxaWEba+qry5ZpLfwAOVVYjqBzQYNinuaWkH2xrRZnqhzsTot46XsH8Hw?=
 =?us-ascii?Q?JVZQRwxrjpey0PEut6oEpMjqml9bc6E1cjDcVh+iFXwojNzSNCayeelVP4a7?=
 =?us-ascii?Q?XHgHLCZrunxq5zx/3f9y/GsARftk083M+zSfL9Z7QCgHpqomZ+T72/SvfCuh?=
 =?us-ascii?Q?E6qHHA5sYsG4VchOZWl2qgchwEtGNquE/+241YcS8eZ8IQuxUmBEgRmwSTuT?=
 =?us-ascii?Q?gHNTi3XZ9cpe5Yco9bw8xdsF2RKWqXjuCFyqbDy3XH4vAUfOOacIyjmdek2z?=
 =?us-ascii?Q?UFL70+uDHonxdfnFmCEOH/S7FaFLxEay/dnToQz9CrncCC7uug5hYy5jy+V9?=
 =?us-ascii?Q?AvuS/5JjLQQQzcNcklJncT66TWNPyt5eYPMgLzyV28xUJfQd38SugABhckzW?=
 =?us-ascii?Q?TUsvOwfr1KT/Z8mA0do7xaKVc/tzg7RPCoHMu0VFTh8axmbXeWvBIpQAtYRr?=
 =?us-ascii?Q?Va58k7g8jKR7BFz1479p2NTPA3WVSE8LyxiEg/T75HRPesQE1b37cTLRiddS?=
 =?us-ascii?Q?xoErRH+86Ccv8P3CChOI7N6Jd80xXb8YhQDudMEgI2h7zeGvpSTCaVShWzGz?=
 =?us-ascii?Q?z/KmF/6I5OO6rTKBHtnU/TOPR1Pb2sUALHAB0BV08USoFuEzgAuDKdtijawe?=
 =?us-ascii?Q?Tdpr3tQMXQY3yoENx80pcQSKUrrJjbXT4Uu9fMp2E4UXbl34IMqd1+fM5KJA?=
 =?us-ascii?Q?wFC/rhbpUQ2GKPhNhrlrcfpDruzSPH8I37UTH0VHpiYJ0wLh7S0EPt/ZO0Od?=
 =?us-ascii?Q?Erj6nsrPoiz56/nbxORCxjKGiwWYWZccLSNjGm2FnghaE6AAlzzDcAB7YRPN?=
 =?us-ascii?Q?oJafrXrllTioJ7gtPqb87LIbHwyCGmDs1z4AIQkHwtYSBeL1aCNADh0TS6Bz?=
 =?us-ascii?Q?PHMemX4XYOGgNGLGLt7cl24vxW1OTcunx43PMo4oqDe4haq3SQEul7xWjNqj?=
 =?us-ascii?Q?nssN+HbIznS8LlAEzKp1ofnIGgneWPSpx9Gl9Q9iCL0jiMaLCGurM7UeF1PT?=
 =?us-ascii?Q?4GBcV4UVc5sfiTUlczeBoAE54anJLDab70KcEBAk1OBh4AdeLgQ3Wf60x3dh?=
 =?us-ascii?Q?V6Kqkzz5wuUEz3F+1D1alY3sadooxc9ucepIOjON0fXLDDa5YEEEtx37Ccuj?=
 =?us-ascii?Q?8dDfB8PZxsmAppkoP9+IyQadvMoYRC32GpCJOOZiU2E04W7cd03v4K/iX0Ms?=
 =?us-ascii?Q?sZu+ebqMsJHz1IATcwOuO2HzP1zbwrrKITKVX67J7J7P1zX8cis8MH0fkdD/?=
 =?us-ascii?Q?sbNLaYiFBLjQYOCfZNY4Iz9AUeZg9FGr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NBBeQonICp5r+dLcPcWSFONusJ65oLKkVH638D6o89SdvRo40JcIblO470L7?=
 =?us-ascii?Q?mYvW5OIe4I93oZtwFEGpnNwKaYbzQNdeUrNwFhLtiDm/ZR7olZzsJbD69OKq?=
 =?us-ascii?Q?Pt6AS5AJ7hCx6uHe/N83rtsZgEe3j5ERWNCwKh4LvJ64aSCXdI1XsdgxFVYj?=
 =?us-ascii?Q?lEJZmcM0KdMx5hhTuEdENx9cI2oxd1dQ+jJHZwZGF7X50KFkDVoqGAUlFrti?=
 =?us-ascii?Q?YbizTYYloxQ2uX9/ZMK/bBkqJ1yQqz3wvnn6gRvDLssDA2K4/ZMjvrkkEWex?=
 =?us-ascii?Q?//Qa/NiNW6nDCS6LiBMOUe1GLmAHKxYaVOAEgI7goC+vdUyn71dLTYLOTH44?=
 =?us-ascii?Q?afYaB9cVaZjid6b3O8xRDkJsVBhy33RZ7QYDi8YSZMbN+DxFq+AfT/gXN1I/?=
 =?us-ascii?Q?wSRyyn6HRn5twpBuNWeZL+6vu/vGUjOezz2K5C+pwdS/z83xNjH9Bt6gUiXZ?=
 =?us-ascii?Q?+MJ5vAkeGzkXp4T+vaMLLpy5NTRtgwI9ExIGH92nk7ENxg418oG+exYMp72M?=
 =?us-ascii?Q?6I8zxw/p1OE3XfXxOLWn0f4S3NFrD149OLXHzINCjCCAIzmPHzo0pCgWIwXa?=
 =?us-ascii?Q?FkrYHtPruRRTQThqnIhxrTO6MwYVF70eApmzhJmzyjs3uzlf7Uv4XVyi0nZZ?=
 =?us-ascii?Q?/QiN11varYv2NzEiB4I/6ggefTJFtfuM/3oy94JHCVuMjnVTm31D5IPehfdT?=
 =?us-ascii?Q?1blA5VuXQkSMuh6DvYigBoIhQvAsTibd7ULlbxtbdz11xzfPKcejai3KaCjH?=
 =?us-ascii?Q?pObxBmjOuUgRnAHZ6t0HRhP5RcbG266Mz0FsyQAQYlZSDqWajqc3FyGpGQ57?=
 =?us-ascii?Q?hveJNWTQPKyN7xxVwkJovDLqHFcY8OU0Tcqti72G5mdjEKt7W+dkEkjCsfz1?=
 =?us-ascii?Q?2MN4L7DtVgHuDMNyCh+j/gy1IHpnRB5XsWTIpPdVr1+FuchxDkajJDh1++br?=
 =?us-ascii?Q?m8nakLe0jzBGTW9wLkdAjOrjZgu801lRFOy1+N+RPOhT9jKAhe+lu6m0Cc97?=
 =?us-ascii?Q?3hX1D8D31iWJygWVy258BB/I6GWgxvY+DMRRzSUc9iN5UTIhq4GsfjR8v81L?=
 =?us-ascii?Q?iFkTp/QWDXZfD8Ty+Z4VjcHUcRUB23Z0GIZDKEaMJiORNKR2sALR+JLALmjR?=
 =?us-ascii?Q?Rvl1ii6LMQfHxCkBli3LPr6yeFdcKrfL1CNcaIgEyaQnrxwdKd4adHJPUyFM?=
 =?us-ascii?Q?Vk9UgZ/EUvg4eafc39bQWwk1sxH3i7Ou4nJbLAmqFxExGCAuqWrVpJlbobdJ?=
 =?us-ascii?Q?qBoLi3xA2+zyUg8FDHePHtSy9uPD9Mh294G8EGY62A05CwG/DSsyCGChW+zm?=
 =?us-ascii?Q?+BVp62z5t3kTz8Q36NUPLzFgfkMbEnxTAfSMbCc3FWgMT5Cgr9OFyGokdYtv?=
 =?us-ascii?Q?ygWM5/VoYT4iZ3xjCFDAVxyHVtWgfd0BZlexJuuLxQPqU/fWa1ucoS+vGZsO?=
 =?us-ascii?Q?XoAVT/VOOMmFdnIxurDXmyoV2394oTrPlatfv17OPI5I31/TgmPeCJEo6bE/?=
 =?us-ascii?Q?R9GfuOxVX2ECgP/g4uQAiSMlz0CXwzMJg3IAkxdVJ2/SXff7A7tlLlhbeSGa?=
 =?us-ascii?Q?UrtQPiluGsPfH07Ow2xgFm7P+gQFYLcUJ56d5oNyDrW+qCuTECzRFbT37WDV?=
 =?us-ascii?Q?WA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3343f7f-e360-4a2d-7ad9-08dd40631493
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 12:47:24.7589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BgDZnPx3+/I0QAJq8EnvTKzCzEhBz3KNm6j/7bjQv/1S2avvaKfuOy47n1wIOSdj9O45B6cb1FBDpcaElUsmz6hgt8I00IWAfxBnL6XDuvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7836
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



-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan B
Sent: Monday, January 27, 2025 9:58 PM
To: igt-dev@lists.freedesktop.org
Cc: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>; B S, Karthik <kar=
thik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_pm_rpm: Restrict cursor tests to=
 I915 driver
change accounts for the limitations of gem_set_tiling, which no longer work=
s on recent platforms and will not be supported on Xe drivers, so updated t=
he tests to run only for i915 driver.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
LGTM.
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index 990c=
50915..24f527c2a 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1189,6 +1189,8 @@ static void cursor_subtest(bool dpms)
 	struct igt_fb cursor_fb1, cursor_fb2, cursor_fb3;
 	uint32_t crtc_id;
=20
+	igt_require_i915(drm_fd);
+	gem_require_mappable_ggtt(drm_fd);
 	disable_all_screens_and_wait(&ms_data);
=20
 	igt_require(default_mode_params);
--
2.25.1

