Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167C8C0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 21:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CB010E311;
	Tue, 11 Feb 2025 21:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJfBpmbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E04810E311
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 21:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739310843; x=1770846843;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sxmV6syDo1cxu1MxKEQjCVuZjlam7kzyPAMjAOdGvoo=;
 b=nJfBpmbot0V4exM2yZxxizEc9LQzHiBDQZpBkmnnb8mrC/vv5v2KpM/U
 fLXFLhseafY0p0xVDsGN2MfK1BjadC5K+caKdFX2dJu8DSv8u10QosJDw
 +vvMls8cNuYejszx4zLYzUyog90MvUrytB8k1qxa1URV2cawm5XD9VDM3
 V4xzwTm460Q3fwH+CEbWMeFlQkgGjiYXz9OYz06jzSqGN1YgZon6uaVTl
 6ZI6llqHbcYSjmkSDqk1ZxlIDxQcpzG+ShxYxAoQtJX6AK0o+jBut2rJC
 CAlgeQx8A7WJsxn5hSD/pwTQ9Vm4Mj3EO7Nt48TCkRxhBd0DnvBMytRyQ A==;
X-CSE-ConnectionGUID: YivqwH1CSP+V6shdpG8juA==
X-CSE-MsgGUID: Wue4nIMbS3CFK1Ijl5K17Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62417598"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="62417598"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 13:54:02 -0800
X-CSE-ConnectionGUID: dmhj/g4nTBilpWjH43AN7A==
X-CSE-MsgGUID: pmOPH7rdTFOvm0TSzEjQsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="113142357"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 13:54:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 13:54:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 13:54:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 13:54:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJMp1QJKxQmQ+Y61+q4s9XSnZvy+/VOrZwzw4wlHp/XJUAZZzeYYhfIJWu2ab8M4n9uE969jO9q1bdYVItTsp1DDWIzKbqDMtUTKpdl7AN9n+v7EobIAhN1Oi5Ad9PxEmMCRfALMaJhalxNFSBWOPTt4IUxMZc6MqTyA4N41O2ZX8vPgid2BwnZNVSB6U9trpj1D5LJ/VmK6psEYr8ogIb1ivCho/5NvDUsLLEjRXunajTKfE6EqOnX6M6sg5TWjrljMbAJEBLTWlSRhgLvJzJ2bfWOz605bms2nUrcPmzptNhZhv/L4AXD613cax9tneBW4YP2kAkj/iFGTa/gDFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6TNlgP057EZXlodDknDVh3uhdOyz4aHQ7f4iVBNYRs=;
 b=tzpErcmy2iX7uGpXKQ6nXnNGzaULKvYO4K2+5bAMyIqvZHEWWAY+yTbMSbKlJa3bNzoCTsGTaGvVt6p8vOZ6HS9aZPMjLEQ4JHiYzjuuoNq1NhlqcbYamOO9rbg9SXgtfOWS6v/4YQ2tvfdh5OhOwzXh3YXSpnbhRX5FydhkgHiElhRiYrlUixTpVE9YGLEq3WMfuPRs/6elGY4se3x2kXDT2q05DN+/iH8MXwwIp23HdrXdlR5VsPM0F+Sr+7Uj6N6i5fNifmjJThklwgN2Q/L2qgPZygAYngRTCMhLM4+fAhg1shFG/LTnMediaG+z5q7FwWydXFPweIwhNiadrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 21:53:13 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%5]) with mapi id 15.20.8445.008; Tue, 11 Feb 2025
 21:53:13 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>
Subject: RE: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Test scratch page
 under fault mode
Thread-Topic: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Test scratch page
 under fault mode
Thread-Index: AQHbe+Ay3ZhPn0AGnUGEBfxdPq+d+rNCnROA
Date: Tue, 11 Feb 2025 21:53:13 +0000
Message-ID: <MN2PR11MB4728B4DB54CF823F8ABBB86692FD2@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250204181742.4055152-1-oak.zeng@intel.com>
 <20250204181742.4055152-2-oak.zeng@intel.com>
 <Z6o1xkp5oErv0daA@lstrano-desk.jf.intel.com>
In-Reply-To: <Z6o1xkp5oErv0daA@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|DS0PR11MB8081:EE_
x-ms-office365-filtering-correlation-id: 3c0a5421-8501-4e03-c530-08dd4ae67b95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1uEHmI61cq1KQzfpVGCvWPCv6WogJCXkPV8xJSsKB0rRiqb65fZ5gl1tqU5A?=
 =?us-ascii?Q?FR2K/Ga9p0WzdX6kAeMsj1dyu0BhQv5zgYX9WNkD4qeTF7px2/xstdGq3Ni5?=
 =?us-ascii?Q?wX7vyAM2tmvcK5XMp3e7LwQyvdwJgejgKff9y81W6ShAwoQRpIC8KyMLbwq7?=
 =?us-ascii?Q?q/erGpGbcpeZDt/FVzPEuIjeoNSCdDdli+sEell1lfJY97EffUgSUdpSapej?=
 =?us-ascii?Q?bGenRxNCGEVyqfm0zz1o0nDzQ4tB+U2dondhiqGvOu3P8WI5NehZoKXnVDVe?=
 =?us-ascii?Q?bGmU6FevAyxxAm8w27ZzT8R1DK61sNGQj1un2KdrKcXMmTGkeNltnN6T3ixR?=
 =?us-ascii?Q?AaASGYZZpMOpJpSZCXQuMO9fVbtehZ9e8WXreBfQliw4uPIiEmfrg94jQurn?=
 =?us-ascii?Q?lzC7hMT3hPGq82CBpV8RGZ5Ld6Yf7Lb4jCO0EU2WI0AAOYqQJ1JLLA66LNWU?=
 =?us-ascii?Q?M55sCIPEsEGnLCTtl1Hvj683l3gp80+y351w7i4hxlEyqAKZLxaTYTOrYHHo?=
 =?us-ascii?Q?nL5B+MoUVjkI86o2O5ocCetiP1dLsyiCGKheSp6dSMyMTl/6W8vkqCl5Zy4e?=
 =?us-ascii?Q?6CwhpC7StyfqQ237AheHL50QOeP9q3PjrmI/kTiydd+XHY4dzMutukO7Jkuk?=
 =?us-ascii?Q?sOZ1/cs9d1nwSxF/tGXLwP8kM1E+WzOwFmaLFAp/n7XwdUTiY25hrcjtZ0YB?=
 =?us-ascii?Q?dI0TBzz7AB8sprmpAhIS3d3pf5OmD6GlH/86CQnmFhiw2g29muKyBxXIhbLg?=
 =?us-ascii?Q?oxxUp/IDgKdn3m2l7lZ/pBlIMxGLY53GH1mB8nHWrZ7//DKzD33sL66tG5sY?=
 =?us-ascii?Q?LfrEItVyBP6GCFbiT/ZsmczfcmU0dSlBdXL/j8r0ZPmh3TSD/xKxARlph2YJ?=
 =?us-ascii?Q?f8wdLGMptgGxJnpEw+UwWlenMD2SpDvLP6qzQDRGw3HvhBQE4vN/iP+tCUqJ?=
 =?us-ascii?Q?376WeBlCH5KwmJPkFSBf0PFhFXjpoY2avfafEdnrPXzkMmtdynYLd5chx7Mj?=
 =?us-ascii?Q?BEYHbVa5PU/9/BAsXj+NLdza6h06BOXlBAegtuzsOuXQpZCpg6F9o01Yc2ga?=
 =?us-ascii?Q?mB6znbHl9R/pvAgh0Zf47p38q21OrUtESt53lB2Z8qVgz26ioNxn/WG902vR?=
 =?us-ascii?Q?F+6WAEetRgOkqlVaLdMxV4TIysyPoh7pZV75GXjKPemHYZiUB7vlumGF4ybr?=
 =?us-ascii?Q?rEB5usAQRPnvcWm2BzwlzPYx44A9S2LtTnlYeKWwHF0G3OrQp032s+3HNqTT?=
 =?us-ascii?Q?tqtA/ggo2IJnEvxoN/wSkJWJeKK/GsadjiKWjf5/43gd8GlBmqaHClYLG2Va?=
 =?us-ascii?Q?HlY3uGOZgRjklJTwyRbAKEAj3NBhoEY7Dy8o48WeMVjcmiAEYYF9O8BpnrMY?=
 =?us-ascii?Q?MGtj1Oz32Zt+Qz3bp8l304CVJ5uxL9VTPJCif3HZ4tf5jPhYNLNlcwpnVdHH?=
 =?us-ascii?Q?Qnxrd4zPKvFm7HvjNgJDLlGGMJ5TvE0R?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+hgvMFNmb0/SU08zakTYEL2wT8zad3/Qmem230w5v5A46u/3csv98hHT0CSC?=
 =?us-ascii?Q?Wd5THYtOKy44HrG8Wd3h+/JWwtdTtZu+TF+iXC7ivII61/AqPvYSrDreR8AM?=
 =?us-ascii?Q?BuAMGPE19Txol1WIHL3mMcs+fDZePB38N1iAFo7VvsADq9k+IuFZ5ieoWmtQ?=
 =?us-ascii?Q?tJaKmBbIgYUSMbggTZ7tjcIqkQ6mXO9mH2KtH7hJryoQN4+OwBQkyg5zrk9i?=
 =?us-ascii?Q?lEYSc2MZKT7UF4DB8N1bNAB9GtKsEnqkNobqC/8W7Z4r0ehLUPcNuHbAHBCt?=
 =?us-ascii?Q?WA9/lw8GJ1RccQ/96bv1ch2HTlwZEDnf3QEP4+KqstEMslO1JaFsaPmaP6Le?=
 =?us-ascii?Q?2kS/NOE1bjWL9TG3/T8oCaEXjK0pUH6wsmpqPHznrLk3ABZZaodeNhejZ8J4?=
 =?us-ascii?Q?QKfK2sdzUnZDxLC191WsxTrM8S1weLXV2RW/PvwHiYueLJWLiTfnyMadyZNN?=
 =?us-ascii?Q?N29A76KinHmRs9IoOAzz0Ge4ckgPD1AtLkHZ0sN4N4Ly0DEQvRHKE8vZiHEN?=
 =?us-ascii?Q?Yd52mc/w5tDJq4IaS/ENofNJdlyu4Z5rQClGpEeRC/1bThdca9Nf9JhNfEE2?=
 =?us-ascii?Q?OsGifoNEQs3deWIu3s/YUOS032/Nzfgvu/Bmm/rkheWv83HCrzhuveoxyjYy?=
 =?us-ascii?Q?xPMbAiovG3aPRwqeZVhfygEa2fuxSawDw1Z3o3bbfg/suIfW1+aCIXLeNyWy?=
 =?us-ascii?Q?qkPuwr+P2SWvH1gEmZBAD5URIpcO1Q9WOsEbBcylQzoTd1OSgknBkyj7Qge7?=
 =?us-ascii?Q?QI4iXC1WyWKjFSSsqWUvmA/YjoS9V3ZQYv//5Oh/x0YpA2RmSjhOnLxaTIty?=
 =?us-ascii?Q?VSwlcn+MX3RPuqFWj6J7uNIijYy2kR8P9AXlNSvwOxztZVu18JuVqy3BtRMX?=
 =?us-ascii?Q?Fn/DZW8Ja/AwlcMEyw3lQH+xgZ/pROL3HJQ2bq9YAJEFvfaWqqhFOIxeTn2Y?=
 =?us-ascii?Q?R/S1+Ru5UeNLwR49IWqfByj+YL2DMoCy0KWM4Hzb1ddXAjKBWnEAVDDLTDRK?=
 =?us-ascii?Q?z+ZWRufEWqjsltyDAYNkVYR8r2lxfUNztM0OqgZwAchiXlzRCeUi1f4NmD2a?=
 =?us-ascii?Q?eUPs8I8yCr9Uo3nTXl/43jU+5BAH8PFhRpKIbJi09rSuPMbjg/K+vLANSE+Z?=
 =?us-ascii?Q?YToNCgmWgSeYauZbXosDu44q7PghwF0eOVAqypYuzC/eSJiHOgPGbePoYAXF?=
 =?us-ascii?Q?4gyZ7K5zrVwiA4Lx9gD0x+sqFH0mjv0wHt1sNv3cy5g5JwO8eMUvgMjp2HG8?=
 =?us-ascii?Q?r+bWNlg9+2DSB7icY3QDN227iCAqjdM6U/xHUrK5mfjqazoA1smZGs0nod8p?=
 =?us-ascii?Q?egiMBYenOAhP9UbTu/SNbpXwVGDddhj3w0cIlso/HrDPwlRE/YeE10Xyes+k?=
 =?us-ascii?Q?cI6H7xY0KnXje7aCKv+yv+WnBJkNpmyYCzl2tqHLuDddX7Szk/sKijLpPUob?=
 =?us-ascii?Q?BuxBML4cKJ4n3xfUiNk6LJcm9MNYRO89JhH4z5oAjGYDmr61Nmy2pVSCuaTB?=
 =?us-ascii?Q?N0kCjCWoQ3uGQ2s2mzqmZaF7IOCY7ktoHm6rEljqocqDRdK276UtBKnrJg7e?=
 =?us-ascii?Q?qIfD3xBHLg6pZvxTwjc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0a5421-8501-4e03-c530-08dd4ae67b95
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 21:53:13.2673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vPxGtiHy30d4lzsSaGy+lH3fFKE7LrvfYrNcSyUKSp/4OK2YYCVmSZlQN1nLXbyKHvrxVc1wXECpkZz4HvbPFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: February 10, 2025 12:22 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Thomas.Hellstrom@linux.intel.com
> Subject: Re: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Test scratch
> page under fault mode
>=20
> On Tue, Feb 04, 2025 at 01:17:42PM -0500, Oak Zeng wrote:
> > On certain HW (such as lunarlake and battlemage), driver now
> allows
> > scratch page be enabled under fault mode. Test this functionality
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  tests/intel/xe_exec_fault_mode.c | 128 +++++++++++++++++++--
> ----------
> >  1 file changed, 79 insertions(+), 49 deletions(-)
> >
> > diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> > index ae40e099b..935e6c044 100644
> > --- a/tests/intel/xe_exec_fault_mode.c
> > +++ b/tests/intel/xe_exec_fault_mode.c
> > @@ -35,6 +35,7 @@
> >  #define INVALID_FAULT	(0x1 << 7)
> >  #define INVALID_VA	(0x1 << 8)
> >  #define ENABLE_SCRATCH  (0x1 << 9)
> > +#define ENABLE_FAULT    (0x1 << 10)
> >
> >  /**
> >   * SUBTEST: invalid-va
> > @@ -45,6 +46,10 @@
> >   * Description: Access invalid va without pageafault with scratch
> page enabled.
> >   * Test category: functionality test
> >   *
> > + * SUBTEST: scratch-fault
> > + * Description: Enable scratch page and page fault at the same time.
> > + * Test category: functionality test
> > + *
> >   * SUBTEST: once-%s
> >   * Description: Run %arg[1] fault mode test only once
> >   * Test category: functionality test
> > @@ -115,6 +120,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
> >  	  int n_exec_queues, int n_execs, unsigned int flags)
> >  {
> >  	uint32_t vm;
> > +	uint32_t vm_flags =3D DRM_XE_VM_CREATE_FLAG_LR_MODE;
> >  	uint64_t addr =3D 0x1a0000;
> >  	uint64_t sync_addr =3D 0x101a0000;
> >  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > @@ -145,11 +151,11 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
> >  	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
> >
> >  	if (flags & ENABLE_SCRATCH)
> > -		vm =3D xe_vm_create(fd,
> DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > -
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> > -	else
> > -		vm =3D xe_vm_create(fd,
> DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > -
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> > +		vm_flags |=3D
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
> > +	if (flags & ENABLE_FAULT)
> > +		vm_flags |=3D
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE;
>=20
> This is always set, right? I wouldn't add this new flag then.


No, FAULT_MODE is not always set. Before this change,=20
it was always set for !SCRATCH_PAGE cases. Before this
change scratch page and fault mode are mutually exclusive.

With this change, we can have scratch under fault mode, so
I introduced this flag.


>=20
> > +	vm =3D xe_vm_create(fd, vm_flags, 0);
> > +
> >  	bo_size =3D sizeof(*data) * n_execs;
> >  	bo_size =3D xe_bb_size(fd, bo_size);
> >  	sync_size =3D sizeof(*exec_sync) * n_execs;
> > @@ -405,59 +411,76 @@ igt_main
> >  		const char *name;
> >  		unsigned int flags;
> >  	} sections[] =3D {
> > -		{ "basic", 0 },
> > -		{ "userptr", USERPTR },
> > -		{ "rebind", REBIND },
> > -		{ "userptr-rebind", USERPTR | REBIND },
> > -		{ "userptr-invalidate", USERPTR | INVALIDATE },
> > -		{ "userptr-invalidate-race", USERPTR | INVALIDATE |
> RACE },
> > -		{ "bindexecqueue", BIND_EXEC_QUEUE },
> > -		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE |
> USERPTR },
> > -		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE |
> REBIND },
> > +		{ "basic", ENABLE_FAULT },
> > +		{ "userptr", USERPTR | ENABLE_FAULT },
> > +		{ "rebind", REBIND | ENABLE_FAULT },
> > +		{ "userptr-rebind", USERPTR | REBIND |
> ENABLE_FAULT },
> > +		{ "userptr-invalidate", USERPTR | INVALIDATE |
> ENABLE_FAULT },
> > +		{ "userptr-invalidate-race", USERPTR | INVALIDATE |
> RACE |
> > +			ENABLE_FAULT },
> > +		{ "bindexecqueue", BIND_EXEC_QUEUE |
> ENABLE_FAULT },
> > +		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE |
> USERPTR |
> > +			ENABLE_FAULT },
> > +		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE |
> REBIND |
> > +			ENABLE_FAULT },
> >  		{ "bindexecqueue-userptr-rebind",
> BIND_EXEC_QUEUE | USERPTR |
> > -			REBIND },
> > -		{ "bindexecqueue-userptr-invalidate",
> BIND_EXEC_QUEUE | USERPTR |
> > -			INVALIDATE },
> > -		{ "bindexecqueue-userptr-invalidate-race",
> BIND_EXEC_QUEUE | USERPTR |
> > -			INVALIDATE | RACE },
> > -		{ "basic-imm", IMMEDIATE },
> > -		{ "userptr-imm", IMMEDIATE | USERPTR },
> > -		{ "rebind-imm", IMMEDIATE | REBIND },
> > -		{ "userptr-rebind-imm", IMMEDIATE | USERPTR |
> REBIND },
> > -		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR |
> INVALIDATE },
> > +			REBIND | ENABLE_FAULT },
> > +		{ "bindexecqueue-userptr-invalidate",
> BIND_EXEC_QUEUE |
> > +			USERPTR | INVALIDATE | ENABLE_FAULT },
> > +		{ "bindexecqueue-userptr-invalidate-race",
> BIND_EXEC_QUEUE |
> > +			USERPTR | INVALIDATE | RACE |
> ENABLE_FAULT },
> > +		{ "basic-imm", IMMEDIATE | ENABLE_FAULT },
> > +		{ "userptr-imm", IMMEDIATE | USERPTR |
> ENABLE_FAULT },
> > +		{ "rebind-imm", IMMEDIATE | REBIND |
> ENABLE_FAULT },
> > +		{ "userptr-rebind-imm", IMMEDIATE | USERPTR |
> REBIND |
> > +			ENABLE_FAULT },
> > +		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR |
> INVALIDATE |
> > +			ENABLE_FAULT },
> >  		{ "userptr-invalidate-race-imm", IMMEDIATE |
> USERPTR |
> > -			INVALIDATE | RACE },
> > -		{ "bindexecqueue-imm", IMMEDIATE |
> BIND_EXEC_QUEUE },
> > -		{ "bindexecqueue-userptr-imm", IMMEDIATE |
> BIND_EXEC_QUEUE | USERPTR },
> > -		{ "bindexecqueue-rebind-imm", IMMEDIATE |
> BIND_EXEC_QUEUE | REBIND },
> > -		{ "bindexecqueue-userptr-rebind-imm", IMMEDIATE
> | BIND_EXEC_QUEUE |
> > -			USERPTR | REBIND },
> > +			INVALIDATE | RACE | ENABLE_FAULT },
> > +		{ "bindexecqueue-imm", IMMEDIATE |
> BIND_EXEC_QUEUE |
> > +			ENABLE_FAULT },
> > +		{ "bindexecqueue-userptr-imm", IMMEDIATE |
> BIND_EXEC_QUEUE |
> > +			USERPTR | ENABLE_FAULT },
> > +		{ "bindexecqueue-rebind-imm", IMMEDIATE |
> BIND_EXEC_QUEUE |
> > +			REBIND | ENABLE_FAULT },
> > +		{ "bindexecqueue-userptr-rebind-imm", IMMEDIATE
> |
> > +			BIND_EXEC_QUEUE | USERPTR | REBIND |
> ENABLE_FAULT },
> >  		{ "bindexecqueue-userptr-invalidate-imm",
> IMMEDIATE | BIND_EXEC_QUEUE |
> > -			USERPTR | INVALIDATE },
> > +			USERPTR | INVALIDATE | ENABLE_FAULT },
> >  		{ "bindexecqueue-userptr-invalidate-race-imm",
> IMMEDIATE |
> > -			BIND_EXEC_QUEUE | USERPTR | INVALIDATE
> | RACE },
> > -
> > -		{ "basic-prefetch", PREFETCH },
> > -		{ "userptr-prefetch", PREFETCH | USERPTR },
> > -		{ "rebind-prefetch", PREFETCH | REBIND },
> > -		{ "userptr-rebind-prefetch", PREFETCH | USERPTR |
> REBIND },
> > -		{ "userptr-invalidate-prefetch", PREFETCH | USERPTR
> | INVALIDATE },
> > +			BIND_EXEC_QUEUE | USERPTR | INVALIDATE
> | RACE |
> > +			ENABLE_FAULT },
> > +
> > +		{ "basic-prefetch", PREFETCH | ENABLE_FAULT },
> > +		{ "userptr-prefetch", PREFETCH | USERPTR |
> ENABLE_FAULT },
> > +		{ "rebind-prefetch", PREFETCH | REBIND |
> ENABLE_FAULT },
> > +		{ "userptr-rebind-prefetch", PREFETCH | USERPTR |
> REBIND |
> > +			ENABLE_FAULT },
> > +		{ "userptr-invalidate-prefetch", PREFETCH | USERPTR
> |
> > +			INVALIDATE | ENABLE_FAULT },
> >  		{ "userptr-invalidate-race-prefetch", PREFETCH |
> USERPTR |
> > -			INVALIDATE | RACE },
> > -		{ "bindexecqueue-prefetch", PREFETCH |
> BIND_EXEC_QUEUE },
> > -		{ "bindexecqueue-userptr-prefetch", PREFETCH |
> BIND_EXEC_QUEUE | USERPTR },
> > -		{ "bindexecqueue-rebind-prefetch", PREFETCH |
> BIND_EXEC_QUEUE | REBIND },
> > -		{ "bindexecqueue-userptr-rebind-prefetch",
> PREFETCH | BIND_EXEC_QUEUE |
> > -			USERPTR | REBIND },
> > -		{ "bindexecqueue-userptr-invalidate-prefetch",
> PREFETCH | BIND_EXEC_QUEUE |
> > -			USERPTR | INVALIDATE },
> > +			INVALIDATE | RACE | ENABLE_FAULT },
> > +		{ "bindexecqueue-prefetch", PREFETCH |
> BIND_EXEC_QUEUE |
> > +			ENABLE_FAULT },
> > +		{ "bindexecqueue-userptr-prefetch", PREFETCH |
> BIND_EXEC_QUEUE |
> > +			USERPTR | ENABLE_FAULT },
> > +		{ "bindexecqueue-rebind-prefetch", PREFETCH |
> BIND_EXEC_QUEUE |
> > +			REBIND | ENABLE_FAULT },
> > +		{ "bindexecqueue-userptr-rebind-prefetch",
> PREFETCH |
> > +			BIND_EXEC_QUEUE | USERPTR | REBIND |
> ENABLE_FAULT },
> > +		{ "bindexecqueue-userptr-invalidate-prefetch",
> PREFETCH |
> > +			BIND_EXEC_QUEUE | USERPTR | INVALIDATE
> | ENABLE_FAULT },
> >  		{ "bindexecqueue-userptr-invalidate-race-prefetch",
> PREFETCH |
> > -			BIND_EXEC_QUEUE | USERPTR | INVALIDATE
> | RACE },
> > -		{ "invalid-fault", INVALID_FAULT },
> > -		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR },
> > +			BIND_EXEC_QUEUE | USERPTR | INVALIDATE
> | RACE |
> > +			ENABLE_FAULT },
> > +		{ "invalid-fault", INVALID_FAULT | ENABLE_FAULT },
> > +		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR |
> > +			ENABLE_FAULT },
> >  		{ NULL },
> >  	};
> >  	int fd;
> > +	uint16_t dev_id;
> >
> >  	igt_fixture {
> >  		struct timespec tv =3D {};
> > @@ -466,6 +489,7 @@ igt_main
> >  		int timeout =3D igt_run_in_simulation() ? 20 : 2;
> >
> >  		fd =3D drm_open_driver(DRIVER_XE);
> > +		dev_id =3D intel_get_drm_devid(fd);
> >  		do {
> >  			if (ret)
> >  				usleep(5000);
> > @@ -508,6 +532,12 @@ igt_main
> >  		xe_for_each_engine(fd, hwe)
> >  			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH |
> INVALID_VA);
> >
> > +	igt_subtest("scratch-fault") {
> > +		igt_skip_on(!IS_LUNARLAKE(dev_id)
> && !IS_BATTLEMAGE(dev_id));
> > +		xe_for_each_engine(fd, hwe)
> > +			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH |
> ENABLE_FAULT);
>=20
> This is a good start but we really need this section to roughly do
> something like this to get good coverage:
>=20
> - Run a batch with a scratch page access, wait for batch to complete
> - Bind scratch page access /w immediate cleared
> - Run a batch with access to newly bound address, wait for batch to
>   complete, verify access worked

So bullet 2 and 3 are already in the test.

I looked how to add bullet 1. Adding it to the existing xe_exec function wo=
uld
make the codes very very hard to read and maintain. So I decided to add
a separate function to test scratch page. This patch will be dropped.

Oak

>=20
> 'access' here likely is DW write.
>=20
> Matt
>=20
> > +	}
> > +
> >  	igt_fixture {
> >  		drm_close_driver(fd);
> >  	}
> > --
> > 2.26.3
> >
