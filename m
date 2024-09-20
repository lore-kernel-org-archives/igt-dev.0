Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4361DCF58CC
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 04:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B8310E79B;
	Fri, 20 Sep 2024 04:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsmS9AFJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4710410E79B
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 04:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726807212; x=1758343212;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KyYdlHMOHrIvryOqdxX7S2Ftu8CnR/AQ47zXUSJmjQc=;
 b=GsmS9AFJUDbzsMwn3Q7RVn4OoXk/TRAbiD9gTtGegyIea9OomAPTRkoU
 ZRY6XqUSAGu32mxP0QbBKpKrrCEFrrX/1/JYadydd5OQg2laZRskTyWIM
 fh2cvJks6EL/OWI1xYCTbncIZY4Jwwmv0j+DQ9cnh56AZS6uC7Omfhny7
 pRUcXQYZDTeaYVZFpoDQO58lFtFenfZXYlFq1Uc61M3f7C8Wiyu+fNJzk
 wbYx3+HornxX3LdU8emLKtAUfcFvYDrBRwFT6BiqTkwdXdlzTDDHskaqh
 aAmU6lmgot5HQwrhtJUBFz7r0U5RQqWHPuT+SU+KMu96vWCx6VyWNBEb+ A==;
X-CSE-ConnectionGUID: d48Vlkx6SHaE7jduNZ332g==
X-CSE-MsgGUID: dRvmkZuOQdq6wZ5yY+BL3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="28699301"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="28699301"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 21:40:12 -0700
X-CSE-ConnectionGUID: BLDa28aVQEKEP9aVAKVIhA==
X-CSE-MsgGUID: 467Pm/ehQZyk1EBqOsir6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="100895514"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 21:40:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 21:40:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 21:40:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 21:40:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTNE6i8TnE7DKBvyGWuosEWFC9KUT/4ZpK5YFGC1v/SO/7xTxOFtC0fAsNiPeX6buisLfaDgumNdo7JippU/BY9lSduA4lu6ZuwpxCZVNadjnAkmcfbCZcLK3AoQ7dBflpfyFUY+zaCu7sm6yvS+KB4i45SLCJSvUVm8lqg3TnC8N0+QBA9VWA2frzH65OzwMtq4ilcbYPUiYm/iLitNE4C13QbPaK7wq7QNJ5+HQhMZYo48hxqg3jJ0XEEdbhW551jjyIJR12cv1mrpr9YtSxB+5edKWe/23ro36jJND33DsExf/GAg0UiAYmcJgpq9oojzkMZLGixPRF5q9ECSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nLCLCGOlr6nvTudyqdBikA2zNUH2kBvruqG4+vI2/o=;
 b=HQDHccDVpf1xkOvcQVdgPKMBP1YHvwNubw+MkScFo4lDd2KZFktdNeObs1frNJcreoDvQ3lNGz/tLu8PVFu9LyyhMhJZqCNrnUbBDV6KDvOTajWwVHYT5GWLgv37VS+9ZrYCYCfD+vEgw7rBHYfSPuAdXHkW7EdlaKGrvOCyFogurBIYOvltp84eigM17aDfnjMa0Aohq8yishZOKiR4lW1Bh1KMiigxGV/z+6DTWmAHRDzl67WIymp4Y0woVcsfeK/7Qr1aljcTbGyHTWHjhh2rb3jNEc2mJjF3QUjd4wLbKabAa8mLibkwS+l2Gmo8lPs9yxdcIXVjDCPueH/osg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.16; Fri, 20 Sep 2024 04:40:01 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7962.025; Fri, 20 Sep 2024
 04:40:01 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel-ci/xe: Remove kms_rmfb@close-fd
 from blocklist
Thread-Topic: [PATCH i-g-t 2/2] tests/intel-ci/xe: Remove kms_rmfb@close-fd
 from blocklist
Thread-Index: AQHbCsrSUd5+9e33+kqM3i+mLUSxw7JgGKLg
Date: Fri, 20 Sep 2024 04:40:01 +0000
Message-ID: <DM4PR11MB6312094C11E01C17E485B10C906C2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240919193250.1439745-1-lucas.demarchi@intel.com>
 <20240919193250.1439745-3-lucas.demarchi@intel.com>
In-Reply-To: <20240919193250.1439745-3-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB6380:EE_
x-ms-office365-filtering-correlation-id: f6680dd4-50db-4f83-cc30-08dcd92e49de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?KRuymk9UjxGgy66BCYCDX04m7spWC2nBKILaD4vzEZgrUr4wmaY/W4anXj02?=
 =?us-ascii?Q?cu31kWlurPCVTbaZZX0vnemOUBX4BrznHfdaMYeDj2vNjnU6YRdGixHK+50x?=
 =?us-ascii?Q?vgyqVJ09O404Qvg3aB3zpcNbQn3OKsDR+PVAhgFo4wfNi4BxO47EGL6Lr+qA?=
 =?us-ascii?Q?nPugSf/9N0y83FiqZ1owrx+SUrBZtVv4k/6K5+rWQ7w3HU3dT4lSBp2fiRxf?=
 =?us-ascii?Q?1hWFOzZ7YEbO7I33HmP8InrQfsUOZx7AW8/CRo3AiEBJnfjcKinmORQiK/Qn?=
 =?us-ascii?Q?+C6LRT2ylYZIrRBgJkk/m2GSMrwiPdIxN7VykS70Id49UNl76dJqaCEthX2B?=
 =?us-ascii?Q?TRMNDS6r9e89AreYF85A9o44YcXZ6cfAlFvlgelx32a4z3KeuqF88yxP4j4r?=
 =?us-ascii?Q?IiVbDCOzIg3EWMUuysq+J1ZZN0cqEWeV6hNuf+0o92tZKubEjmC/X96ldHaz?=
 =?us-ascii?Q?rWvzQ+3ZYBkyDQKDPaaf9GVZAEJZT/F9f9avlydQaq3vby9h4WyhfSZR8gKQ?=
 =?us-ascii?Q?pirZ2mqS2dDS+Zf5QmaOY+RyNzoF3FMSah1pdmQ+vPfpEo8vg+LSMC2kAiZ3?=
 =?us-ascii?Q?NOSqxxVmtgk0sfdm5B+S86sxIdbrZO/nckf6BY1vMl9DtGwrlu9LhJhDUyAm?=
 =?us-ascii?Q?zgEQeA77J6W+tB1ZFtKZ8kHpZkBqGvzz2lFErfwJ0q6LucRRw8xwmmGAAetH?=
 =?us-ascii?Q?tkWM1pDg71Pmtbso3bnPTs+MyU+SgKR/aUASP+3eH+c6jrOkqx0J9zcPf5CH?=
 =?us-ascii?Q?l2erqK6Q3oPxv4cp3Dfj2wy2Kr/d4PaJYAOkVEK/EkP5/BL+LGpAlRDeMEYJ?=
 =?us-ascii?Q?cIAfqE/Zjj0f8E0u5e4B/SF21zuSzMrAIF55FbdhVgOeLgELuX6CwuVk+EYq?=
 =?us-ascii?Q?wgSeLeGDNvNTJN0R5o2nS/X9tTejbQ14veB4gtc4f6Dt2Zdbw54WueqHrHJQ?=
 =?us-ascii?Q?l4Ya0otLvZqNIfLYP+cwIyQQWPAJ9YSbe5MTfdrPHvQGC+XTlhgFiGbY6Mh/?=
 =?us-ascii?Q?WaFGUw/wvQ+CLFHevGAzjBjRCjZML7k4iNYWjD5N2x62InLMfdbCKL4mGnxv?=
 =?us-ascii?Q?2+W33bY57eCP0pq9UWwwLF6eyqnCGkJFloSIMYRBV/pKVl2l0ystydDWjm7T?=
 =?us-ascii?Q?rDhXtMnOpjYdRXmgHJjqGaPmjtWvxQvIdQIdhz0g4UReMYNDUhiIkcQzb8wu?=
 =?us-ascii?Q?/b5oQc8KnE/KL36aV09qf4RcOE8t60ZwGlx5m89N2cln742QEADEPcTCASmv?=
 =?us-ascii?Q?2B9fTeXD8RVIFJFFciLs1jKUIuUDHmm8RutwHMBwMA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0c+IklUeWPpdkfafNlOdlTWlu+yeBEGduGwkvoEhEgmFQL0vGIR6uyDYHQS3?=
 =?us-ascii?Q?MTgqXEg0xitekM9NtMENGzEohTlud2C+wS/PziifArVZwrxpmSL/ejCPbq1Y?=
 =?us-ascii?Q?BnK6z/jG4NXpERIfWZCFJn1PbWtGEWM+6Mh0Z7wyuzK3mdqJLZ3V4O9F/gxs?=
 =?us-ascii?Q?ddpgu/Xt6gfW8Foz1UA5vxspayralMznvhutZodIkbRlGdTKW57WnGagL028?=
 =?us-ascii?Q?+G7eY3/8ZdduOWsysA3vCP28kLUVsLjwVBFmEFY64MqWZijm4Jz5rYtbeIQH?=
 =?us-ascii?Q?S/fh5OrIy3C0GIuxPVb3lv7JeGsN0ijkF3dc0M93pP/ZguvJLG9phC9lK6bD?=
 =?us-ascii?Q?JWqgNUyW5FWXhK9W0d36JKKf2lUAHanIz+PP75Jt39Khe/m8tqzJWaUXMA/K?=
 =?us-ascii?Q?azxqVvt0fkb9tgEcMfhFZigORiLwWoTlFASh/z0YzHq6Whqha3qrso2nvfzU?=
 =?us-ascii?Q?WVpb//Lj7MDT4A1SQD9L+cMaJ8sPt8uIh7xZn4xFCNc2EN/+DyPl3oodIAtc?=
 =?us-ascii?Q?3NLQCoopmpwjfnVzE62eupF8bKf3QS3fisj6L+KiHTD3jnS5p2REx5UnD6Eb?=
 =?us-ascii?Q?Ne5kh9MxC3M7FfpvCBe6c/v2ijppgwD6frGWAbk6adcqbMnmhiqjnx59YgOH?=
 =?us-ascii?Q?v51Oro2JBZ8inaZnjz7XuXGfHTdxaAgkwDt4WrS0iexuQiXpfiFYicKjj2a9?=
 =?us-ascii?Q?pu3sxsO/SHql64fY3H6stn04ljsCOUkGO73bBEMgz86/xS3G6wYikMOlSAQt?=
 =?us-ascii?Q?voKAZPGk/vBH7H6areUGDGPvfMJhmQC4BsygLMTJOY0Yl/Lr5fnH4jZQhjH0?=
 =?us-ascii?Q?emJy6vCH4ODWXqH2pZiYGHQRcPdpysrDPb7T6vifgTGy21ONPbIHi1mnXFTP?=
 =?us-ascii?Q?BVe8bjj+P0lfZmMkG2/R/1Pco37csTgyfCbHqQmmZk4hE1hRTGHNeqAJb80A?=
 =?us-ascii?Q?dZ5gbilh8VEu8/3c5jNotHgNwIlmgGm4eonwh/X4oCAKFILXyZbT8gcqZ3BG?=
 =?us-ascii?Q?cZPeYq9tfr4hYUlyoNf+h/KcxxtxZqpxoAWRvI61qVfg7tQiM76dIZPfA/V6?=
 =?us-ascii?Q?kjfYoMvF1TH66gAHCrtPpJPcYFbSDq9oploCIjcgx7+QQLUJLhHaQmDk0tDQ?=
 =?us-ascii?Q?mM7851g3NNP49ivo4PijOc2bJNjbFhJGpC17Esnfsx1VJ1qQX80cmaZNgbbC?=
 =?us-ascii?Q?RmMrxPWQFc7hpX1aqfLCPmhMYBipsi0gFGpAwfUuqx/TWyMceD0vA+Jk+o2T?=
 =?us-ascii?Q?MjVcbm3bLOpuvlETWJXa99sLKaAzM9ScxdBMXxw674CgkaRWRb+o18M66yZS?=
 =?us-ascii?Q?x9YFj2/biBZALouSzTk9MeYYd57dA8erj8e9Guak0i28MDrPDxr4ahrtc2D1?=
 =?us-ascii?Q?Dl3GSFX6RWHwsgpwzBoEnOEAlMmf/wnXeyJT1Kh+pxJhROzrqbHSMdG8Ag1K?=
 =?us-ascii?Q?/cZi3MgfPT71yx265OG3FPqv6LCDVg2t5OhUr8oWrTHfBKaktmy5ihqn/LLI?=
 =?us-ascii?Q?Y9y0jeHUrwg8LnA4yOon9Ph9e79Tl8FwOWXfZi7qqQ+G1BnHiQ40TChG9FyU?=
 =?us-ascii?Q?nnbW3XmZ9f1hMQJ9b5k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6680dd4-50db-4f83-cc30-08dcd92e49de
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2024 04:40:01.0456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3Y5UYX+iy5XXTDeuCixn8VDxaE06K4+WTjA7UTwM1KcIg0dB5Lw14Ck92bmq3Y+047d3SXl7EzvZXhfz8mkcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De
> Marchi
> Sent: Friday, September 20, 2024 1:03 AM
> To: igt-dev@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel-ci/xe: Remove kms_rmfb@close-fd fr=
om
> blocklist
>=20
> Now it should be working, remove test from blocklist.
>=20
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt index
> 4ee8fb0d4..f9ef612c4 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -78,10 +78,6 @@ igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
>  # KMS: Yet to add/missing XE support
>  ##################################################################
>  igt@kms_prime@.*
> -
> -# Expected failure on XE:
> -# https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
> -igt@kms_rmfb@close-fd
>  ##################################################################
>  # KMS: Non-Intel tests
>  ##################################################################
> --
> 2.46.1

