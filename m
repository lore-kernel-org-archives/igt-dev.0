Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C711CF64BB
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 05:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7C710E296;
	Thu, 20 Nov 2025 05:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVOsuxp7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F8810E296
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 05:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763616672; x=1795152672;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=06ZgY8bfrgdwtTthmH+yhOs0v6A3JvHNJLuYbFhLSAk=;
 b=kVOsuxp7dIu8o0mNjZ7kcuPeVfINx22Cj/qzwRkbxPOglPK03finiTaM
 IQmynTCR7KYAKrlmr+RD2NnkKrd0SauZN4CzizlLgyYsjUhorHWwn4wjB
 ZVuREn40izFbjkSa72bd17HUFlKdiH0V/IRSpdOVaXBoot3K4Kean+Ji4
 644HZ/Hp0DpmgxXRPoFVr3y3gffHlpk+JYtbvHb/gKqnrzy21uB7olPi7
 HYX5oHCeSj5p7FvyZv7CAnHjpEBYgWahOXkp++GayzEEHGFP8VMgsOd8T
 QsqclVHbFHF+RQinaxwhD+mN3kuJzfFmAPmvW9omuShp09sla+6mWBtKU Q==;
X-CSE-ConnectionGUID: JCoWw9QmTvufb/oXObR6Lg==
X-CSE-MsgGUID: OVuzNsdJQ5Kj0IATJD9ang==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76282049"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="76282049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 21:31:12 -0800
X-CSE-ConnectionGUID: pC35sUjlRl+bwD7fGm9+iw==
X-CSE-MsgGUID: shoQ8PGtRx6pWJO33NBeyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="190932669"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 21:31:12 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 21:31:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 21:31:11 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 21:31:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hY1OZ7i3F5EThgVAgQ4E50iZVjSGK22dyqdgcKnvorcIIx82Y2/SsyqQ/rafJ+ZQ61jNv9/iZTPBxa4ULuG06jAsyptyX0sx1l9+jEhK5P18C/kYkYg0RmGvukrHzuATJjOU5p7LcxgwszCEGdXMtmDfX0ymhJcWE+oqYP88o0BDX50GHwz7yjoUiMcb8Ea7RyxeSr7CwxIjEJjq/X6n+jhs54RlRV0qUk1AEP+rImcdXMTX47qhbc3hVMOHp4pMPq3CM1Gfs7LlBtptiTYdPo105M4KA2gCOuTCrKhyVAb5u36DLWBIVHLqcV4wFdgFF8JVQ7nPnDOOhR7fASehjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0EEDuOpb1YiTg3EgWH3eZNPjHVswJZKdqLID20LdrY=;
 b=o0eclU+JlyZgSiqKL8nCAKtFsXcLu705IfvpDG3SE+m2oHX9aHfxAiRVAahBredOGufR6GdjoHNcVyxVJ9+/ZTUtTalL7I4HnXyJFjkNrWK+Ten3KcqgHmipQpWr5nRyVCSJmDP12aaNuTKREmCbGCI1k5ZSynK50M0+emZB+qlywN+91SL4BjfmRQKbLoUaszujcZUQVx1L4pGCONBXmrtkxxOHAU4gPAtR95e8TQ9M6mOPYxTOGUJCEKijmsVlexB5Po+vNuSRhZ9xAOnLE+fMF6Ej7OvM1TwbNmrx52jPUKl/8WpVmkCeiey9mvCYV3WCnKga54AUJ9UwEEZS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 05:31:07 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 05:31:07 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 08/18] tests/xe_exec_multi_queue: Add preempt mode test
Thread-Topic: [PATCH 08/18] tests/xe_exec_multi_queue: Add preempt mode test
Thread-Index: AQHcSpVCIBe6dTgB1Ee47Ske2fSy57T7J+1w
Date: Thu, 20 Nov 2025 05:31:07 +0000
Message-ID: <CH3PR11MB84340CE1D9A1B920D524B2528DD4A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-9-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251031183555.1882721-9-niranjana.vishwanathapura@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA1PR11MB6513:EE_
x-ms-office365-filtering-correlation-id: b9ee669f-a781-456b-7fd3-08de27f60189
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?50HDxYa+PIquNWaAx208R/VV5b/R/lZnYBP1Ab8fGseEJUHAOs23nEvJULkP?=
 =?us-ascii?Q?PfOcJKbJI0Roib5cNyOy8mj2QCM5Nnq/CLCsXaWwGTq0eW9rKI9gRntqXKZb?=
 =?us-ascii?Q?kZKl9DFAOxsFxWluPjURr2PAn6G9NZzEdDzgADquiAf1gLPaFhVOSaPY3yn0?=
 =?us-ascii?Q?5PbIKYE1fA5S9Q0t+qgSgMBcgAuwE7BNFp05Ypkr79zOgqUe0sRp0qUZzJwH?=
 =?us-ascii?Q?HEau9iZx9dJkGZUVqCHIq2dRdxWOlW+m3q0nmXdMMrFXoncuNDZLPZQKHRws?=
 =?us-ascii?Q?/ZURHDZEuYp9SiOW9hruVaxjy3WW6YULXhY8CRtrl4RSMhinrHf51UrYJsp7?=
 =?us-ascii?Q?j5xiNtdsi5Af3VGXAHYUIH1Oyft8L3zsmgEHDx4U9MLkwzw5lD0HSzcnbpEr?=
 =?us-ascii?Q?aWb5MM5N19p266jv4/pd2RRiCKi5sWIqBbTHe/4BILeVedsjwPmuRFml2mA1?=
 =?us-ascii?Q?JnKe4hV8SzrVuMw/HCXDEORccuVZe6AiwoRlrJ5aslpyizuRKFXxGw8A8vLi?=
 =?us-ascii?Q?silPrWstM7jEoAwvBYLE1H/IdXCzDUpNtoqQ1FA5cw8/524GRfhjJWLV33k3?=
 =?us-ascii?Q?gg5ALnc1HiDKy2BhyG13j5UgJ5lSuFvuagAgUqJMQD/dI0flUNrKK2JobYlD?=
 =?us-ascii?Q?kDciWHRDiwSfWhV3eXgi6bVP/Lx+GY0qFw9Vrao7WCNj++yDwc8rOOSAYhe1?=
 =?us-ascii?Q?z4IdxNSS6lnvT4kksvjjUKaI6XkUCGQXUU9YLZ6Kk7x2csTRu5PDIZhq31ma?=
 =?us-ascii?Q?LMB52I9GNditeQHi/npDhk+oPEPdxREhy0RCk0ps/7MrTRN3jqKIVeYNRQwV?=
 =?us-ascii?Q?hNlxJQ2vp+lU6BeF8kywbzGFcJFjOkpgO64Yj/EP7WMf6S+BuHZsuVJM628f?=
 =?us-ascii?Q?wT6C+jVut4URtiavGtu1GCbkd4hPRhZYcFNIFwxuC7XLMGx9hojVcLysVTAR?=
 =?us-ascii?Q?Tt4+77TYsGHy8xYADCrIEWHwJf/xKzh4j9uQ2RVkeEFqzfH70PoWJv1+lAc6?=
 =?us-ascii?Q?jxSWph8H6HYsx6HoXbBoGLJYOJOmVC7FPqbXpdlsUFV79CmouSozPZYSwJUV?=
 =?us-ascii?Q?pXUrdElT4UwuZzV6D0NWLgnwqmOmm2yNlaP4o5K27NDhYCwpSn4x2tOqfAhY?=
 =?us-ascii?Q?PWEs2/oGtqIjesHaq8H34KM/uTko8hDUTQMrC7bGNWQPQYpaUZA81CS680AX?=
 =?us-ascii?Q?75gzgRlZw5I5AfG4b0+gSJ+R/kCOh27LLPinagWpV2fLUzen01ll32J2C7k8?=
 =?us-ascii?Q?SShJ71bng+JjxaX3IUBw+D79delO4VOj7SRmUomR+IdR2GMHZ2BhlrbKlT70?=
 =?us-ascii?Q?8z6K+UoW4xtRn+9+M3dWTT//mLSFCXTOTQzwSJ/QY4l0OHNAEFUHd/kO424X?=
 =?us-ascii?Q?kSC5EJI0/Ukav/IWJi34vJJ/Ka4qnA+dTINEO8+4iYzmK443M+m20zkdjsuC?=
 =?us-ascii?Q?4EHnpIgaWL24u10igN179OBU/t/mS5q8c3Zh/GT4Tz3vbQHWtqmKZfS8QCHm?=
 =?us-ascii?Q?A0K/JviZ202ZCjRIMS1GOPKSFLp2ljlqF6uZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?laCvGbFC/6A7WsesvPt3ybb/VdR852QbRbyzuyFXqYWgs/4MoyPgmOOcglHR?=
 =?us-ascii?Q?Fsw+s8QKesNbq8WtSTZHoqAJbomczyR/wI4AzJ5tTxqnESsgsLtAgCT0UvnC?=
 =?us-ascii?Q?lkKv1wyZXS/CektTCfFMJXz7OQ2Dju6oSvl3nFxCjHXPGsfRyeonz0baofrM?=
 =?us-ascii?Q?MilW3DWEePC+kNmPzxfpSAYR+xmY7xAXuvs3Ga9rg6ji4NOTJPcGLR2zATBY?=
 =?us-ascii?Q?Ywp2Ed4MXJ8Q+ZjwutaThV96ytTdm0rridZhNZjUx68cRaB/RSqyXYsl8MLG?=
 =?us-ascii?Q?xK9GU3iRvDtewo6WVdKy3YdZH2vGjMagntmC4WWYrg2vyhY2qO5Azbta78lE?=
 =?us-ascii?Q?Zu+UsjFUCTAbUY7/QklbzQll3L8+W00Uf5Gn7XV+sj1MGvh2HkwDLxWKBY2c?=
 =?us-ascii?Q?zNRzU/rZlgtF27ai4sB4byNF9YwUNZf6RU1UvThyLKK4ehqt958Ybhh49V1Z?=
 =?us-ascii?Q?vZTtpe6Nqgn4Mad/2sWvZcGt59BTY6vnhy8ylbRKU1wL7KFIDxwEYaPeruLl?=
 =?us-ascii?Q?eSyDb/bMGvb76Ri8VyFVrvFUR6aPpeqoKoNrawsONXknc+bT/ZmHvqkhH/Qb?=
 =?us-ascii?Q?CH4Xt9wrDR543NY9HqMYlwyrrA2DVKQM+rOHIzXvvzvuAqRdLIVox2QT+Sam?=
 =?us-ascii?Q?kTctKeRWiQGEeVffM0LGtP4kcb7zIg5ryG6vfNEeWViB1EzAXXVCJ2mo32f1?=
 =?us-ascii?Q?Q4LEnOSaNhFYZrBaLj0hXAdW62wbcF+9O5WimCUGGxUwQ2CsjRjmxYxJVtMj?=
 =?us-ascii?Q?IyJz/PfGVlcTxORq8gH4DMzkSPAlzoqKWSzgvK6qGnRDasHKNg/5dsbtnaHO?=
 =?us-ascii?Q?mtyw/fHtSicwP9BrTL3KXSNa4Lp5VZ74lsvj3aFwy9fhDzPpEs5Ue8U9Lrew?=
 =?us-ascii?Q?O0j3IcDk6F1iY83EYyPjug4k0BmpLBHyWLRKrK2DpIZq2lEKdCcRsygIWI5k?=
 =?us-ascii?Q?wXWtw2It+TkZ2C86rDVTZAk0k+p+mXReQzLnVjkxidTWUKxsBnCgKeHD+Y9c?=
 =?us-ascii?Q?KogEEQoxwCmgaU61bJs0CCy0eYQKfS9vsl9D4hLpVMoO9Uu5/CJyoaY6Bp+q?=
 =?us-ascii?Q?89A0QaH3JZA0TLDi+iIx2H9PZ4KLSeMbbvEnkXjU985jAnJifZzxWPrjA8+p?=
 =?us-ascii?Q?P7UNbpEzcb7ByIMtaBcr6OygJJScr2tspI3ptWEzyUAMNeqiVaVOms0wCV7f?=
 =?us-ascii?Q?hISxOgiQETEkVuoxoqfXmBGpq2/YCBrFnPrbKVNjRoFqmyhMFaLgYZFy8ZrS?=
 =?us-ascii?Q?WlIxIzkvSByAGP2mBzBG0wQbhBnkTsSyfUzz9JCbec7dnUcqqXG5d+VjbqOw?=
 =?us-ascii?Q?SKdL9cSR0a1TyqjppuP9e2Ujab6RXZPp044Yc4caNsIHbIZ3EzD0ApmulCYY?=
 =?us-ascii?Q?KfVZYNAKboXEImIt5qjxTs0B6ReBTA0A+c9C5jnsEbm8mepdGBKEGXamHzhF?=
 =?us-ascii?Q?1fMmMCLRmC9WVa2w4a8daG5e3ReJNlEGxdQUjGB46iq6oQoaD3h8a7yduMTR?=
 =?us-ascii?Q?Vfcv/Akc2tvRKYRVB0esuazYIeJA25t3e7QqwDRXMDLwysDwfusd3v8oN0y0?=
 =?us-ascii?Q?UGloEZEe3ehmNzWC5GUB1t280hn05ZtDKHKwoj680nYQnzKt065sqh7dv3Rr?=
 =?us-ascii?Q?VA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ee669f-a781-456b-7fd3-08de27f60189
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 05:31:07.4303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A3gtb1dMj8fikGu4BO5ZvEG/3aPB3++i2I9Fshtfe25vLICEww/4iPgoWg8HZEo2vztHv4KVCiZ0ds00iPR/WqOLy/MGdSAxYPIF0F0RtJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Niranjana Vishwanathapura
> Sent: 01 November 2025 12:06 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH 08/18] tests/xe_exec_multi_queue: Add preempt mode test
>=20
> Validate multi queue group functionality in preempt mode.
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  tests/intel/xe_exec_multi_queue.c | 156
> +++++++++++++++++++++++++++++-
>  1 file changed, 151 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index eb40e92d2..191c55fdd 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -18,6 +18,8 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>=20
> +#define SIM_MULTIPLIER	100u
> +
>  #define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
>  #define XE_EXEC_QUEUE_PRIORITY_HIGH	2
>=20
> @@ -26,13 +28,14 @@
>  #define USERPTR			(0x1 << 0)
>  #define PRIORITY		(0x1 << 1)
>  #define CLOSE_FD		(0x1 << 2)
> +#define PREEMPT_MODE		(0x1 << 3)
>=20
>  #define MAX_INSTANCE 9
>=20
>  #define XE_MULTI_GROUP_VALID_FLAGS
> (DRM_XE_MULTI_GROUP_CREATE)
>=20
After looking into priority and preempt mode both are doing the same thing,=
 in priority test also pre-emption only happens for secondary queues,=20
Here you are extending basic test with additional preempt mode but doing sa=
me thing as priority test, why cant we just add additional userptr flag for=
 priority test case?
>  static void
> -__test_sanity(int fd, int gt, int class)
> +__test_sanity(int fd, int gt, int class, bool preempt_mode)
>  {
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	struct drm_xe_ext_set_property multi_queue =3D { @@ -65,7 +68,7
> @@ __test_sanity(int fd, int gt, int class)
>  	if (!n)
>  		return;
>=20
> -	vm =3D xe_vm_create(fd, 0, 0);
> +	vm =3D xe_vm_create(fd, preempt_mode ?
> DRM_XE_VM_CREATE_FLAG_LR_MODE :
> +0, 0);
>=20
>  	/* Invalid flags */
>  	while (!invalid_flag)
> @@ -114,7 +117,7 @@ __test_sanity(int fd, int gt, int class)
>=20
>  	/* Queues in a queue group must share the same address space (vm)
> */
>  	multi_queue.value =3D exec_queues[0];
> -	vm2 =3D xe_vm_create(fd, 0, 0);
> +	vm2 =3D xe_vm_create(fd, preempt_mode ?
> DRM_XE_VM_CREATE_FLAG_LR_MODE :
> +0, 0);
>  	igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext, &val), -
> EINVAL);
>  	xe_vm_destroy(fd, vm2);
>=20
> @@ -199,7 +202,138 @@ __test_sanity(int fd, int gt, int class)  static vo=
id
> test_sanity(int fd, int gt, int class)  {
> -	__test_sanity(fd, gt, class);
> +	__test_sanity(fd, gt, class, false);
> +	__test_sanity(fd, gt, class, true);
> +}
> +
> +static void
> +test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int
> num_placement,
> +		  int n_exec_queues, int n_execs, unsigned int flags) {
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +	struct drm_xe_sync sync =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value =3D USER_FENCE_VALUE,
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +	uint32_t vm;
> +	uint64_t addr =3D 0x1a0000;
> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> +	int64_t fence_timeout;
> +	uint64_t vm_sync =3D 0;
> +	size_t bo_size;
> +	uint32_t bo =3D 0;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint64_t exec_sync;
> +		uint32_t data;
> +	} *data;
> +	int i, b;
> +
> +	if (flags & CLOSE_FD)
> +		fd =3D drm_open_driver(DRIVER_XE);
> +
> +	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	bo_size =3D xe_bb_size(fd, sizeof(*data) * n_execs);
> +
> +	if (flags & USERPTR) {
> +		data =3D aligned_alloc(xe_get_default_alignment(fd), bo_size);
> +		igt_assert(data);
> +
> +		memset(data, 0, bo_size);
> +	} else {
> +		bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
> eci[0].gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		data =3D xe_bo_map(fd, bo, bo_size);
> +	}
> +
> +	for (i =3D 0; i < n_exec_queues; i++) {
> +		struct drm_xe_ext_set_property multi_queue =3D {
> +			.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +			.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> +		};
> +		struct drm_xe_ext_set_property mq_priority =3D {
> +			.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +			.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> +		};
> +		uint64_t ext =3D to_user_pointer(&multi_queue);
> +
> +		if (flags & PRIORITY) {
> +			multi_queue.base.next_extension =3D
> to_user_pointer(&mq_priority);
> +			mq_priority.value =3D
> XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
> +		}
> +
> +		multi_queue.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1,
> num_placement, eci,
> +						     ext, &exec_queues[i]), 0);
> +	};
> +
> +	sync.addr =3D to_user_pointer(&vm_sync);
> +	if (bo)
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
> +	else
> +		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data),
> +					 addr, bo_size, &sync, 1);
> +
> +	fence_timeout =3D NSEC_PER_SEC * (igt_run_in_simulation() ?
> SIM_MULTIPLIER : 1);
> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> fence_timeout);
> +	vm_sync =3D 0;
> +
> +	for (i =3D 0; i < n_execs; i++) {
> +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr =3D addr + batch_offset;
> +		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> +		uint64_t sdi_addr =3D addr + sdi_offset;
> +		int e =3D i % n_exec_queues;
> +
> +		b =3D 0;
> +		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +		data[i].batch[b++] =3D sdi_addr;
> +		data[i].batch[b++] =3D sdi_addr >> 32;
> +		data[i].batch[b++] =3D 0xc0ffee;
> +		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> +		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> +
> +		sync.addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
> +
> +		exec.exec_queue_id =3D exec_queues[e];
> +		exec.address =3D batch_addr;
> +		xe_exec(fd, &exec);
> +	}
> +
> +	for (i =3D 0; i < n_execs; i++)
> +		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +			       exec_queues[i % n_exec_queues],
> fence_timeout);
> +
> +	sync.addr =3D to_user_pointer(&vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> fence_timeout);
> +
> +	for (i =3D 0; i < n_execs; i++)
> +		igt_assert_eq(data[i].data, 0xc0ffee);
> +
> +	if (!(flags & CLOSE_FD))
> +		for (i =3D 0; i < n_exec_queues; i++)
> +			xe_exec_queue_destroy(fd, exec_queues[i]);
> +
> +	if (bo) {
> +		munmap(data, bo_size);
> +		gem_close(fd, bo);
> +	} else {
> +		free(data);
> +	}
> +
> +	if (!(flags & CLOSE_FD))
> +		xe_vm_destroy(fd, vm);
> +	else
> +		drm_close_driver(fd);
>  }
>=20
>  static void
> @@ -371,12 +505,19 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>   * @userptr:					userptr
>   * @priority:					priority
>   * @close-fd:					close fd without destroying
> exec queues
> + * @preempt-mode-basic:				preempt-mode basic
> + * @preempt-mode-userptr:			preempt-mode userptr
> + * @preempt-mode-priority:			preempt-mode priority
> + * @preempt-mode-close-fd:			preempt-mode close fd
> without destroying exec queues
>   */
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
> num_placement,
>  	  int n_exec_queues, int n_execs, unsigned int flags)  {
> -	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs,
> flags);
> +	if (flags & PREEMPT_MODE)
> +		test_preempt_mode(fd, eci, num_placement,
> n_exec_queues, n_execs, flags);
> +	else
> +		test_legacy_mode(fd, eci, num_placement, n_exec_queues,
> n_execs,
> +flags);
>  }
>=20
>  /**
> @@ -402,6 +543,7 @@ test_exec_virtual(int fd, int gt, int class)
>  		return;
>=20
>  	test_exec(fd, eci, n, n, n, 0);
> +	test_exec(fd, eci, n, n, n, PREEMPT_MODE);
>  }
>=20
>  igt_main
> @@ -415,6 +557,10 @@ igt_main
>  		{ "userptr", USERPTR },
>  		{ "priority", PRIORITY },
>  		{ "close-fd", CLOSE_FD },
> +		{ "preempt-mode-basic", PREEMPT_MODE },
> +		{ "preempt-mode-userptr", PREEMPT_MODE | USERPTR },
> +		{ "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
> +		{ "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
>  		{ NULL },
>  	};
>  	int fd, gt, class;
> --
> 2.43.0

