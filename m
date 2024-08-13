Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87C6C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 09:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868D810E2CF;
	Tue, 13 Aug 2024 09:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJQgKPt1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD4610E2CF
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 09:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723541040; x=1755077040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I0EaPCZfELw7YySA9UvmTrg52C3d7jfxHSoHhzXE5ao=;
 b=ZJQgKPt1go7o0rSdNpjzO3TRlxPlLaKQB0yEAmkG1LVOAvMm5SloaxNg
 /KMj6zMO1g/BLWw/YtduNEWaIbCP15G0IXZKyiAuNxNnt2+ecLh17zwWt
 5LpiQwsvzUDBGwx4b7xf6Vt58iAw/DaoYqwzxneqvZmZZFTIhH2Rb1EH8
 ngF/RHR0MG3MrDMX+oHxs6ubm3HJIBaADbRHsaJQemTcVOVVj4vnhwDUN
 a4kVJ4ArLu5cJKCcJsqJvfIRQxDgxCVnYyNDB0wCN5itE7lygM0Ybrh5E
 swsruRdUP8bq++SVPK9MZESTKX6LlaDNLu+rvvLjXqbmZt6eB7C+oggMW Q==;
X-CSE-ConnectionGUID: l4esmEGgQsKMDheIAjwwqA==
X-CSE-MsgGUID: 8L7LTf/RQdqKxf4pGP4tyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21825498"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21825498"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 02:23:59 -0700
X-CSE-ConnectionGUID: vVeJVvI0SjKD6G9ZASsKHw==
X-CSE-MsgGUID: Gyc0BKHuTlOqpIcUuvd49Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58248686"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 02:24:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 02:23:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 02:23:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 02:23:58 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 02:23:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NR9C/aSuXljYMQKnTWmc4kgeVbPfhIdE0ng2VTpCEb8PoDaVFHiJjomqvMMHrObpBJuhQQxrmHGh2UEX9OhC/zFnqubjjdMGAxlLpmkYrrnEHATasxZTDA6yWKeMScMXKituhfWZpwfgS3p9G6f1fQBfZYB8SdnfMugmt4h7Zri8qEW4RG4RSUOTbgSunwSMIot9yEp8iFPNsumG0VZgKhwAzHTs1SiijRIDYNtLgjRuy82ya5WMuxLnTyGHXybnTw5jxfQtUox4upmndnf1jELqe+oczxbbUjWNIJSQXn4CdojlqNOtyQX210asenRfNeANyb14M/qYzOCYj/rdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P47r6wTO8ykNqVblvfsCtF5c8rZ6r4xSvp4hqmj3la4=;
 b=KPK2m/e9dHd9nqZrGnywyN4v7ytQslNMlPSOQbaqcP0zO78XiZLnkKf5aguFkoiuDt6E+izQQciZIM9YciQlVto4SeMmQx382xCSJaVUoUdnzndSCewvtqNlwyODM7tPReQQtxShD2ujU/NPHdOjli++Rtt5lNOQftZlBXia4JWlPYuDUiteeLD8N94ZZJMHs9+lQAqJh3IOnPHFUFNPsBQwX+YwvPrpCCwreeT2CmVysw/HP62ycVgidJwHyocQpMTe+oCYQFcNOsXig6obuO7Q6PEmjMf6K2ae/40iFjn8LggXLPTlwNH6/2Aw7sI78GPLRCFyuKjSL5gJJH/6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6761.namprd11.prod.outlook.com (2603:10b6:303:20d::5)
 by PH7PR11MB5916.namprd11.prod.outlook.com (2603:10b6:510:13d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 13 Aug
 2024 09:23:56 +0000
Received: from MW4PR11MB6761.namprd11.prod.outlook.com
 ([fe80::6b8e:aea1:6960:2430]) by MW4PR11MB6761.namprd11.prod.outlook.com
 ([fe80::6b8e:aea1:6960:2430%6]) with mapi id 15.20.7828.030; Tue, 13 Aug 2024
 09:23:56 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t v4 2/4] tests/intel/kms_pm_dc: Update test duration
 to 4 seconds
Thread-Topic: [PATCH i-g-t v4 2/4] tests/intel/kms_pm_dc: Update test duration
 to 4 seconds
Thread-Index: AQHa7Cm1rFDRP/gedEy4/GYpWH2/wbIk7E9A
Date: Tue, 13 Aug 2024 09:23:56 +0000
Message-ID: <MW4PR11MB67614EC56036B26700FCCCF7E3862@MW4PR11MB6761.namprd11.prod.outlook.com>
References: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
 <20240811200359.1086166-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20240811200359.1086166-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6761:EE_|PH7PR11MB5916:EE_
x-ms-office365-filtering-correlation-id: b97151fc-e656-4221-9c55-08dcbb79a7dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?57lz9ZMN6skmzaoN5HFBrG9o/VhU2kJ/t9nn//ScvHS5l7RoKg+Ks4bLRBpz?=
 =?us-ascii?Q?xue9nHBFTuVa6/Z4hJwFPT8rLJYc0xrhv8e7NbilVLq8l5GhSV1rMYhBBfZc?=
 =?us-ascii?Q?ISEPe/uDfo9vyR/U6d0ZG6ZTEKUDqTOCGC57uvYthz8dunQA8clMxZgCPGo+?=
 =?us-ascii?Q?o1URYtZ5qnC0FQzJIMqfH+LY9h9LWSU5fbAvkuH8FNvXKrL3ea/VFOZ4wnxU?=
 =?us-ascii?Q?YzAOLEdHXgYhsAjFDoR6Sp2OTO0xwC3p4iK5BRFdq95X2jIU8G7Ff0s4knWA?=
 =?us-ascii?Q?7H2f9ZwSaMfI8oG7iciEMd6LztLh80QwQVTeBE+cREdBUADODWteaDofOn9Q?=
 =?us-ascii?Q?/jVQBYs+A+qaLU2lBmqH1NBD+rhMC4bsv4GiD85cLqBwJGBOnqoJSxty9VbG?=
 =?us-ascii?Q?DjPcr9Af7IVXLZzLuLF7JE3oCCkMp0x9Ck1GyE4nBUVIMOt/V3mC11ePFT8H?=
 =?us-ascii?Q?h+7r/TPKCf5vRf7AeYJK4UiF+t3dVqbgXJbnf1mTpGgqg5J0lLlrLtjk9Anh?=
 =?us-ascii?Q?YMPMGPgoPVDfSMukSrM/LUnzZTbS7PBuTuToh8xz2lkPXs8v2rxHgkgBVA/u?=
 =?us-ascii?Q?SXiqLHO5i9eVM6Ge4OKyZfptnXkHfL9B1Wi1GLH3dqpcNL9Aon5KX+a78zHj?=
 =?us-ascii?Q?yjjttLMTfJoVGfDIFBsX+8wLGU12uJQNc4nqFF10AUy+TIRBN2mHb26xYwyI?=
 =?us-ascii?Q?3liCVJM6Fvi4BCPrSzNDtSbm/0yhkRdheJjKOUwFy49gm+F3Ad0J/YmcY+o0?=
 =?us-ascii?Q?//FXKZK9w1ZjB/lL0+aS93M/NirUwesQlz/u4tOslZSh43glflgDtdJdojH0?=
 =?us-ascii?Q?BTl9eCZ7nYfNXowcYcFBwHnQ4EjOxmxRwM6uf1BlMKwBL9VEcAg2r1rHyu9t?=
 =?us-ascii?Q?UbS2yLTzssU5+/4i/GgziczJGczIZ7QSykUixU7iNqd6viUgYOXeKbuCAfTw?=
 =?us-ascii?Q?xez8sVO953RCfEsZi9IuUOI3vp3sj6zbnAe9YKEtXVf687bGpgR4eO7gR3hM?=
 =?us-ascii?Q?YnNOKtuTu77CcgToedghtAZiwK1k78PI70dvk84C/d1f5CYyYYvbzQrIysWb?=
 =?us-ascii?Q?QzT8mGixO1oum+XIbbl/2lWkoypt7Lj+n+hqyvNgwG4+3F+OjkmfjEhAVZJN?=
 =?us-ascii?Q?Zs1x3tChGZuxkkH5IkAObdu9aazwvn+5nhOW4jPV24eM3nKWoH2Y7ak607NI?=
 =?us-ascii?Q?UXv+wh+dRuMf32dIlJvb2hq8IpdkzSgn99N1QoFTGm3SkJE5dch0Mx6zV+bf?=
 =?us-ascii?Q?BYDATVciRAnC+0KEyKCxuXhVvE75x5oTOUYaXqUje935dzn2cte2XdkJ6fa3?=
 =?us-ascii?Q?Q5m3UKebBoRyGEA3F5hHcA31nLprGWsimp+ZBO09vTvozYEXRZk+qDTVVz3h?=
 =?us-ascii?Q?WIlPuqSvBY08oc++xoambg1bjfJbEkchzjttcJsaok4W+XF+Xg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6761.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A0f1FChg6yjPi4rb+Eipm1c1ujH3DDwEXNfhMCwSrBRZcCl1hxhve8HJ22hF?=
 =?us-ascii?Q?iAnIvw5+B0EsSjRmkNgZSQSsgQP+NbN8tJcNBRuRQnm6pICSXFdWj8z+t49h?=
 =?us-ascii?Q?T4yioNU/kvbHXW5p4m48hoekky5l2/yRrHpAS3AbJJUf89u53vH1tK+vrIuT?=
 =?us-ascii?Q?3rzur2QgXAr3yt7vJ4uc2GTBZg28KnYvoIOjZ8hnCpC0/jknbyvyQUa97fms?=
 =?us-ascii?Q?LjH25+FahlOROGtpNCSmaa5JbknobD8lxtI3X6ZF7Nvs7GMWve8XYUhljcON?=
 =?us-ascii?Q?E2Tl4Zt3g3hts1ipHtfJWgFDDo78UpTuaX3ZdLShT3qdacydPcgKYJAm+IkT?=
 =?us-ascii?Q?iqJcK5LYFH6TlKu8aAB/fMKN9ogl6fDJI2D4/oCwsdFgs/T9MDtc3EBWjDbQ?=
 =?us-ascii?Q?/0UefxV8m/MG8mp31zGMtvC+ofJxRtUkbgiZfIbC9aYhSmvGrUvD9ROYqkMR?=
 =?us-ascii?Q?AehZb9w9AkD53pW39p1hEKpGI3hDbp2poHm0cjvXot9t6l9kI6I9zWBLfMiD?=
 =?us-ascii?Q?YU6/vA3w5D8O7UOpiUqHylsm3eBAO4gqijVUfgrDEn6s2AXWGcH939Q7ZKii?=
 =?us-ascii?Q?8SOCjzLFBuMdNJGjfy7vK5XzmWv2+O61nbJnqLf8Ylv3cMuS7GCnb2RTABWC?=
 =?us-ascii?Q?OlUF3KMl/UAJhhrNHjLqDHfVxNV5wUNwzGmdSnoDqels2PRwg1Nr9A4ygObl?=
 =?us-ascii?Q?HI8zvawpJxv3f1CBSo6IZo/XkJ2xGvfGQF2HvU/NCShNRluDzeG9xrxYYcZc?=
 =?us-ascii?Q?VsGSyElEcDTuzwhIyH2v2VYVqupdb1IsgMaimLsIynQD8uwcF7S3ddXomi3k?=
 =?us-ascii?Q?kJF87CxMjTnmHKE/h5Q+5X2FcSe2yafgOktXYM01k3ArpyV7VgLXaWYeT+pY?=
 =?us-ascii?Q?HOxrOTYwNck84R//42Qq/qayZAQpdh/N2EKkpPCNCJd8emsjHQ3oqsA933HM?=
 =?us-ascii?Q?GcnleSt5TeC1dULN9Yr4IRM1hOw25DUz0EJpHIshN5dbjtuuh8LBB3UU6nAp?=
 =?us-ascii?Q?+3g0DmRtGMMvlAvIKXMvO26N206dBYtUOJqIhcmbI7IEZVnOwSAWD/VYBIPg?=
 =?us-ascii?Q?aG9Ge+02w1q21+enr3JYTBzi3OApDGGNR9k0RySgtAtzIWtVyI8x+3u4b1eg?=
 =?us-ascii?Q?Bdaj9gMnJRy5MKxN9L67BhaRc0Z8cwWW/yhaC2xrdp9x9MRNshlGpdF1CPCI?=
 =?us-ascii?Q?XI2dWLVUG/egTYGJuUUSratHhp5LTk3yZF7xl4IW8JXYSOwK0i80ErqOY8+h?=
 =?us-ascii?Q?Ma6L9GTspUusB6j5Ule00AxjREJoOTAb2AO+HEs+OSlQ7amBM9dFPef7Qi04?=
 =?us-ascii?Q?uySHC49PJ5gDNrlN/SIjHUVirIg7QbGZSNLQbKkyn+Kj58xsZu+2tLpqfSew?=
 =?us-ascii?Q?TdKCF9l2tfLaSGI4G1nIUBDBGtM0Ji1HF+z1tzvMV0/FXJxxbFhPlH7DkNsJ?=
 =?us-ascii?Q?qfNnP10yRy/1dSkNeLFCekHPXDjioCE7j6qZBE2vyuJ+fMG/FBB1j7ED/3Hh?=
 =?us-ascii?Q?ZRJ5b2BDxxkmKEEz0aR/1phHpdmaUsbWlmIAbvzeynK3LSZRcdbZlk/mgG92?=
 =?us-ascii?Q?iHUpg+a8PnIgF/Vz3u3RbjMC2k7ePkQ8sK7BEYfW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6761.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97151fc-e656-4221-9c55-08dcbb79a7dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 09:23:56.1362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cc6ngJ2dqiB+4LJRnX92xXTGIdtRc1oCOMl42klth1VVm7Y1CIT8WRL9m6f+xlSTzPCDiUtzOV1RXF397UtIHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5916
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
> Sent: Monday, August 12, 2024 1:34 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; B, Jeevan <jeevan.b@intel.c=
om>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v4 2/4] tests/intel/kms_pm_dc: Update test duration=
 to 4
> seconds
>=20
> Certain features can prevent timely entry into the C10 state, causing inc=
onsistent
> results. So increase test time to get accurate results.
>=20
> v2: Split the patch into two. (Kamil)
> v3: Declare variable in new line. (Suraj)
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 367bf4303..565c3d48d 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -591,7 +591,8 @@ static unsigned int read_pkgc_counter(int
> debugfs_root_fd)  static void test_deep_pkgc_state(data_t *data)  {
>  	unsigned int pre_val =3D 0, cur_val =3D 0;
> -	time_t start =3D time(NULL), duration =3D 2, delay;
> +	time_t start =3D time(NULL);
> +	time_t duration =3D 4, delay;

Why is the duration 4  or how did you come to this number explain , if in m=
s don't we have a define for that use that its
not good to use magic number.

Regards,
Suraj Kandpal

>  	enum pipe pipe;
>  	bool pkgc_flag =3D false;
>  	bool flip =3D true;
> --
> 2.43.0

