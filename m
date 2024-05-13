Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E55C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 16:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5664910E865;
	Mon, 13 May 2024 16:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4nnz6lB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD8410E865
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715618700; x=1747154700;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gl1QtR9SwBEKKGFl/cLhBHz0Zwd2Y/NUlcgYka6ACYY=;
 b=f4nnz6lBuRNbQjubQdYjrz8+6iBLR8ODII2L69KGbIRuyV+x0S/6L8wa
 eQYaS+lowdLcxMISYGv8Cvq0ts0xrexQyalMbg+jpKx25Qe6DK0MYt3Lh
 l3YPL9XUJQngfdJySingODJ7JBCaRK7XJBdmlOwoXnV1uc6xBUmNfsNqy
 bsjG5HQ97dMSeir3LuC9EB4rY2rknzX8LUSr1CAwXdfnJv3vKmbxOcG3w
 bpdesxIkhFaj3y6y3XES21l1guO2R0yXkdifX2neqiEAaM9QFNse0J1Ls
 /nhI8fTuYEyudE0rQbeLXK4ya18XtRObv+XAp78Tit7LGnSaFyFaI+CEj w==;
X-CSE-ConnectionGUID: xnaenoTHTOy3jW/emUdpaA==
X-CSE-MsgGUID: ng5kA8l2TtykbWa/ZsBvGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11687617"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11687617"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 09:44:59 -0700
X-CSE-ConnectionGUID: AGdJ43pDTWC5bFl6SXIAcg==
X-CSE-MsgGUID: FsR2RdNmQwq6smRRAOf7WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30959321"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 09:44:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 09:44:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 09:44:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 09:44:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zk0teMpoor5LDVJ4aYBJA4kXJmDp3ic22uBYQkK4TtzX8r5HR3SPasO6t3mU/RmyZ/F35KcQDFnLfRt+Dut5k0k6EyGJyycortp0tKwoX8In6TCdg+nkgkgiBr7QBVMn1ChXw+hFlVdU0BCKMQG/+oQ8q7dISs+fdpFwidwU+lNH/Sds9JS7pTlthNAGE/j0Xis7U4V1gooLZpSFcqcDuGhCBG8SH2Z9xELSYSXh9K2nTWbgQSQ8Uld1i2yoB2duBSPyXwn+erxY4AsX3SEl6Gv8TK9QH+WWAKRtCjbdaKsXbTM1yh23gKqExSzTTim2Bm0tRDeNHP/0QBVffWXXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2HP3zNg+8x08zD5pnZUIKg0h+G7N5AW6qJV4GqMts8=;
 b=A/MBaqECw5AuuImeibbKka37lJG8R2yD34yF5jF6HG61tdtGWerwVyZODT7/ctYl8nXNq5F7lwEqyQsRX57VHEdL05gCL2juhTWn+p9vZ8bNqQ5/xE+EoHr/5/GAmX5FfwkN8R6x3rA+2VmiJ0daANqNIiDGaP9vVcc1/OAHoy8IwH143zMWuWjDkPPzmdaHY+aUd6A4xfJrBSPqVVg/XXCkyGCGsAUIbpf3luL8w/I9z2x+ionbYzS3Jp5fuGWuqo+Lvm+j4tmONmk5vG0WQucWR+Pk/4JPv1wSWZxc6Zc7dd9vIG//VMHnlhl+evM5qqHZITnEG08JmzBG1C0wCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7337.namprd11.prod.outlook.com (2603:10b6:930:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 16:44:51 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 16:44:51 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
CC: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH i-g-t 2/3] tests/intel/xe_pm: Move mocs documentation to
 the right place
Thread-Topic: [PATCH i-g-t 2/3] tests/intel/xe_pm: Move mocs documentation to
 the right place
Thread-Index: AQHapVH+AHp6/7WiH0SDupkBne3n47GVXsNw
Date: Mon, 13 May 2024 16:44:51 +0000
Message-ID: <CH0PR11MB5444644FA4987A917E1F45FAE5E22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240513162435.952578-1-lucas.demarchi@intel.com>
 <20240513162435.952578-2-lucas.demarchi@intel.com>
In-Reply-To: <20240513162435.952578-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7337:EE_
x-ms-office365-filtering-correlation-id: 542fd9c3-6a2e-49a7-3704-08dc736c0243
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?twqvZ5G9sbrX09PyeiHlbZLl3yDfFuo37NFzJKODS2PBWSgpL7XpslYEfdc3?=
 =?us-ascii?Q?8tAONFvnD8GfRY3+SHI2I2lOmo7aF2F3zNObptLJfdzwHOqE8FCAKDrvqGzI?=
 =?us-ascii?Q?uuJw3+avQ9fWnvHCIaG1X1aKcdfvBJ5LCJqI3EsFmAspCKn9rwC5VXoI8yEX?=
 =?us-ascii?Q?MEa8dMxA16Dcfep7RGLcDpZAObX+/L7VWKNwGQMM4qMS2dNIYonRNB2g42Vc?=
 =?us-ascii?Q?h3EMn4uObzJwQWtGAUCF96/ppsE8hHZqBzSadRuV3l28jjc26iVj5qY93vu5?=
 =?us-ascii?Q?ZO/61vWCJt8zU89Evx1XC8dBwCW5JDS9JHSjr2v8v/Vs09TlmfFWMasBRsVP?=
 =?us-ascii?Q?0AtIJK6+Jgm0gGmNgL4VfJZdB7rK9vHREiYw+yD11cyTWTYsfExEBKAmaWSX?=
 =?us-ascii?Q?F3kKBiQIxUhHefAk2qMz+gIUl30oCu7yIgaKpa38f9/7tlxGXvrCdEQaO+ff?=
 =?us-ascii?Q?nc2oSDJzB/0Y4PhexVKgONyY+fxLSSBGxlc00xy0HSXVLDnjkOIpx9rMt8Md?=
 =?us-ascii?Q?7dyP6QpY47A3RCMfh/WVZE32csh2CHM71iBmG6WA5V/K0VMsxc63g59ZX8ia?=
 =?us-ascii?Q?2J7Quw2F2wcHOKg1UvdbhOupN1qrkVCZgFw1gp92wyb94HWVX3tSBOUZuJ55?=
 =?us-ascii?Q?4HhAPpPEIxWZYl5Sm+V6qhDZSpbgire8TFJCKl8uGMxSg55k+aRSPz+PdNZp?=
 =?us-ascii?Q?NoDrD/TQqj+uZyxY/EzTHWodWq8RuPQDxYxjK3DOwkPgGW7l5Cj1k+O58KCQ?=
 =?us-ascii?Q?MKfA4tgrFavrCjpNGQejrMwJUngwF2SuVcIwdOsHMqTZXTT9WI41D4EOTky4?=
 =?us-ascii?Q?oRtVxyt1twCa6eIlJ7UXWcv6lb2qrXzkWcZgMlrekTOr0ITbWH91N4j39j1r?=
 =?us-ascii?Q?SFpzooczzwkttBxSTbHvuqmSaaN19BOy5NDDfGVE9e+4zYB+Zb4zzGsp5adW?=
 =?us-ascii?Q?FysTb4VwvWgAAThUi1QieXyHj9uRtwL4p4ffUcyYCfgtZXpwECIl1iiDPbX0?=
 =?us-ascii?Q?cGqcyvEf5f5kkS2VHgwgqFv5LyyMbiIPOSAuKremHtfz0SljI40oFDyeVb8i?=
 =?us-ascii?Q?P5CN3nKKQ3/M5p2KfnldPdbhFMAhAjRyZ/0YxGlnH9RvFnmiSrx+7v4qz4Xh?=
 =?us-ascii?Q?Mls19Bucr+hh/kfq0o4hwkHYruSn8AI8eZZSf49PIUlXRLjSm4whc+KGdlfI?=
 =?us-ascii?Q?Yh9QVOlHJ9//uXsZ5cE28RoU2tqAz5oeuaP7KLayWG1BGdhuoyvcI4oKqkgA?=
 =?us-ascii?Q?mkl5V6vPzwAKmUbYptDyKAHNdV16r9oS/+GK1qMjI0f4TZ4oVzVSsu8rvN2d?=
 =?us-ascii?Q?S8hUlxiqHVBkeY+VU2r2VqQBpfjXk/RJTZTJqIpCTdAbDQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E0z19Ww4Qbd+LHkkaRAr1BjITShqnsuLv0UoewrMGoH6QeyRmcAdlnxFCfoW?=
 =?us-ascii?Q?tQRbjd6w2hwdSsg0tt0rbZ61VJVMeeCrkLjn8SXE4tw5vyPd2+OrxWspVBuu?=
 =?us-ascii?Q?96bMjoBYweuycQUvgAnXlaJnnQYvyEzF5LcX06GHfRjs2pPqQEk0GwCZXmTg?=
 =?us-ascii?Q?EPfDg/d0j95O54eXmBaJJAl/Rp7tMTOx/4aI/6S4NM54g0oGj0m8S3pnwCQc?=
 =?us-ascii?Q?waQbFjSADe2bqLj4I2UG07NWVKcuyHtnGt+mN+TB6savLODRf0zqk25fFSZK?=
 =?us-ascii?Q?w956zZJ4xY9bKeVosSpE8Wrjrk8xs/JLIBKPZxazGxT0OFYUYyfzQ01psKHB?=
 =?us-ascii?Q?KIC02cdpPiX+DEFu7h9dHOpylUgmgtI5bYErcxQX+ItzsALaVWSjR7JQidD5?=
 =?us-ascii?Q?N8Sagf8M6/+evjH5Hr4pg8YHvcV5HQ98P+e1/JE/TEbElEXTGBWjySL0XQ81?=
 =?us-ascii?Q?sDUDN2cOBiUQ0z5MqE1nToESdO60jomT/8ZD1Lxfu7rT/YKtyNiEn6BqEolR?=
 =?us-ascii?Q?v79F7bUs94WC7Rcs1R8Bq7Zr7w9A0Iqtw8HTdfC+MNxGsVtu2RWtzVeZ53RO?=
 =?us-ascii?Q?SRd/lx5BqeyUwqUthJC15zjJ3Vgk14xPiJBdnj+ALqhaOdui5hFSpc0rGomP?=
 =?us-ascii?Q?uvL080prPyue4w6dl5cN1RJJeh7qjad7auqYsmkI1IUBy5wVfha8hW5HOiwB?=
 =?us-ascii?Q?+K0Y2DcLK0c8HfNiXZY+DqQ583dylr9aBdvhXCJRROi1R/D7eppLsPTOZdiU?=
 =?us-ascii?Q?hO3oIodSn/UiMI4kue/9UqMWMpCdKQBbs4oJs27hFYhrBI0z9YscMZeW5Jzi?=
 =?us-ascii?Q?dR1CliXViIp/LcKjuRAMwpYSGCA/t6xx7l7s3wOsPIlCtOzmImKWo1Udix4j?=
 =?us-ascii?Q?RIygDv1DFST2GPkRIlz9CuhLnGCxHqwlD6yiDsc3D7C16sRuzwMWpdUyACMt?=
 =?us-ascii?Q?Xf/2ZVb87coqXHVexuO6n3V7GoVdvfhRLrS4lzudqCWNmBiL+pQSAAnqfU9O?=
 =?us-ascii?Q?hWn78CV1zlP7QE5I5m3vZ2F6Ze7pteVwKiAlwWPJP7Vl1UWz+lzMPK9WJZ3y?=
 =?us-ascii?Q?8f9ARsTq9tPg6Tng7Ud7TBzPHn2fW73HB45DMT8ytWp2OawcIX+qNCWShk1Y?=
 =?us-ascii?Q?09QQrNk4IrMrFkGZWjbFn5q81yys8B3FoAhOxU90+qtRdWc3iw0HalZyosaC?=
 =?us-ascii?Q?3xxB6dllHBfQnOs7Sf1qcZQ8q/OBRjPsPlXjxRefjog94dbOaAW/160t256X?=
 =?us-ascii?Q?thEvbOVSKOEeUAm/sOEN2n7cPZENup/CpPQ97/+mW0xxVexbGZXdTlGUsTAb?=
 =?us-ascii?Q?pdnNIsJ6q1uzIeSDiAlpSg+j+ddJoukSfn4RT5aQ+tXGqCHKjVKGtI9k+m7x?=
 =?us-ascii?Q?z1T/7K8bQYe3J/9/uKf12w9ZIBGPSedvCVNphX/gTap6fnnXWpRPuWxodnLd?=
 =?us-ascii?Q?i+LGT1rFpg2/0J9/DnzdJ6kd3ICNsjEFoPHvyo0/K8tAaKfpbAVxXX5VLcRz?=
 =?us-ascii?Q?2p1NU3AxKZxls3Eu0Rr8/0fCjLO27BVle0w4s88G3odBgebI3jeG45DuCcB5?=
 =?us-ascii?Q?bVi8RxRmFvZ0NnUaTdPBKAD9RElDwOwu/1p3W96i?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542fd9c3-6a2e-49a7-3704-08dc736c0243
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 16:44:51.1173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mXnHt+zWsERnDG2oCO/jliCdnMsLvENYTWeE+RRYmMmbHwvFpN41WvnNyiQ39omLZpYn/yVcZKtb+JA33rwxEwr5gHMTfg/+FlS8Qmo+vqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7337
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Monday, May 13, 2024 9:25 AM
To: igt-dev@lists.freedesktop.org
Cc: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; Nilawar, Badal <badal=
.nilawar@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_pm: Move mocs documentation to th=
e right place
>=20
> {s_state}-mocs is not tested by test_exec(). Move it on top of the right
> function.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_pm.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 1215b5c2a..584cb8548 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -251,10 +251,6 @@ static void close_fw_handle(int sig)
>   * Description: suspend/autoresume on %arg[1] state and exec after RPM
>   * Functionality: pm - %arg[1]
>   *
> - * SUBTEST: %s-mocs
> - * Description: test checks for mocs state before and after %arg[1] stat=
e
> - * Functionality: pm - %arg[1]
> - *
>   * arg[1]:
>   *
>   * @s2idle:	s2idle
> @@ -624,6 +620,17 @@ static void test_mmap(device_t device, uint32_t plac=
ement, uint32_t flags)
>   * Functionality: mocs
>   * Run type: FULL
>   */
> +/**
> + * SUBTEST: %s-mocs
> + * Description: test checks for mocs state before and after %arg[1] stat=
e
> + * Functionality: pm - %arg[1]
> + *
> + * arg[1]:
> + *
> + * @s2idle:	s2idle
> + * @s3:		s3
> + * @s4:		s4
> + */
>  static void test_mocs_suspend_resume(device_t device, int s_state)
>  {
>  	int gt;
> --=20
> 2.43.0
>=20
>=20
