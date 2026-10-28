Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FC6606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i+2uTWY+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C8210E59C;
	Wed, 28 Oct 2026 08:54:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B620C10E59C
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793177633; x=1824713633;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LaM5+xfQ3M/+Mla9WCByePaFvyQ8MwIOMhes8ScdDTQ=;
 b=i+2uTWY+1z/pUh5yK/nKVUrK6NQBMPtFtkwckhZoYyB1u9Ija7XLtxqM
 Nd9ld2yxkgMOp8xk4d+wJIQRp99+kxQ0RN3+ebmIT7EglU9CSidsyXGk8
 VDGX57knZ2mutTONnagQjBBb9Hicg7hFXHfwDjy2vmhKpUQFsmiQBl+01
 7xMG9J5qVs/t8B6TOeCFHj6M3BH5lUmAVnmsOm0n8ieU+TT6Fyux+LJZH
 CBGEMJm3ZLLcyGhc/KiIqH8lKfEjZZjDiMh9Veiw84R72W4m/Na79fcqG
 5saNR3YbAMCJQ5kQXuJ6qKjFe0uWudRvQxxEXBrjJOtB5RdwkOpUSTnwW A==;
X-CSE-ConnectionGUID: VE432LLmQ1OVgpM8mReTOA==
X-CSE-MsgGUID: G2I7lVBLRtiuEkT3xF4TfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1768864"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1768864"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 01:53:52 -0700
X-CSE-ConnectionGUID: yBEjaHkzThq6qDjq078C0Q==
X-CSE-MsgGUID: oQcN6OJpS4WF7skWmL1J2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6603605"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 01:53:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 01:53:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 01:53:51 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 01:53:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIPJpzy6yMJk2yZoFoEX7LckHqllB0u8lhlbX4FrBqkvNvsE8KEbvunxMGS0Z1Yh1Mh23loI+7B6/GLR6gW7ts4QiL9EpptHfKtoUOCChow9OZ4WbgWSSK3zf+Ark1JA5ud2OhQco1P/f72Xqeh+9oRMQiCvmOxmWXNfTOf1zq3hlAS0Z63z8IZ0pT42E+PyiYlHxiSZTA1whjLDm3PMMdHFOBsg66QSvm4WImhTDG+ZiNJtG4d4t2xE4AdfHUrMDpV0oEO6xRrAf+s2NcnrobopJin1wE3CNds4b+jf4Om268jZr55AUta82GNZyWVjZpPNEqwkWZaHzHfJbYoI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+LFzgEUx/aVnpOSzSE5xv/nLhxziE5+mLTZZ6Q+pLk=;
 b=iEUbeIOQG3RKhatnOB+PVZZv/XsEh4Y3h7BDvd61RtWtOhrup4w7off6XycuDBfqZR1DHAA8UYZ7e/GQQybOnlZFR4ncafBk1LjG6JVMr7seZ4wx9SdSK9oUMHmlhCtjdMDEc728/+0jc2wM5i1QUVmX0fr1jYp47R3NDoB52JRbiRmEAKnSKiY1d7W2o5eLKVlkB5K6JPcsaEcH+RWm2N5ke1ptQHfyNxRPB3dGvmgYGZLo9QoHXLjcfPcRbEuU2Tub6P+lJv7YEHzFzIIRupyeXfcKxwoVXhVwnDQliYXUzyXmfdvonjNEv1xLuU2++rbfldseKw1ysB98rbGDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 08:53:43 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 08:53:42 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_eld: Log module load state when no eld#
 nodes are found
Thread-Topic: [PATCH i-g-t] lib/igt_eld: Log module load state when no eld#
 nodes are found
Thread-Index: AQHdXJxF4Pn75OxIEEaFbQ0nyCS+jbcSkCgw
Date: Wed, 28 Oct 2026 08:53:42 +0000
Message-ID: <PH7PR11MB6053FF9ACDBB32795BFDA3ACE76F2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20261015112548.2682369-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261015112548.2682369-1-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CY8PR11MB7135:EE_
x-ms-office365-filtering-correlation-id: 03ca6a01-d4b2-4f53-2597-08df34d0f805
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261009223027099003|38070700021|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|10067099003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: /hCQkQG/MD1jXX1A5tlDWtNW75MiP0Ic7Y9A8sJYK5x+G9wNlLs6KxuutXwhq9nNVb0LVtyv64EXJQVuzxJrctKHR2OIhCts560xeEWc4aQoFld5q6/iV+ge3/3NP5FiUp8L2/uZquN62ItAEBw3kJNp7pYg/RRMwByecOSmr67R73wvW9amkMSjNPGgNfWj5WGZfqQyB7dMohOLcW8Yi4oyOynUsb04ofCDwgYcENH6VAvNnbLdkA3fXSj5NNRUxHQwW9uuibzO+h5l+ZdOJi+EgJEFLEGWdNuBt7OS0AdIvdY5qwx2JDXHO+/kFG2DCHf9SdI7a6O3jKPtMD0iMuqFTmf4aTomx0gpT0A2BETcZLn6l9nDFaP4unLpbcKbEhroV9gGIn1qGC9NhE1eynWq7437aqDPGpU1Q80Jaqc3l6fJa7lqRP3RsbFOjAE/w8Z8wt3KmfFUq4hK3wHLIf3rHFEmCykgAcaSZ/cXhYrdLXtEswPpSDaWYfb2yqvUm4b1AxtSZi8qif4DWACpTRDkaB59e0HQY46SsGX7TaaE1dQSFSH9MXxcgiEfRIZ6iivToDxhI6iPVt6T0jr/mG346fphK2nZD1k/eDGSG5/6uNhvCjOert3N404P6RJIWa1WVQtsh6p4AWanxToI83znVTGBx+lnVAZcQCMq3mupy1z/tgmMpHcSL2EmmF1GE/6OHPJ0vu+H4tgAJRIOEYSIONBqLzUGtBShNDQjJ7Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261009223027099003)(38070700021)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2iki5w5R93WBrNSHj3aXEoxehmyCTYqCtzRhKUolta73z+PAyOVY6CzjDUsw?=
 =?us-ascii?Q?FTOOr7965/bLPBLUtJmbCPRd81FG++XmQ+SbClSIFjlwSD9VyXsg/501Q8Tv?=
 =?us-ascii?Q?/8trTiKinOh1h0cNjKdR69Df16wttECCk3FiyrWIyuNrPk0bq1RtFLq9xuau?=
 =?us-ascii?Q?MQuLWBI6P93K3/4/wysGAVAhsVUeZR6aHvHRS2dwZgNqTVbOUiAI46Dxp/zZ?=
 =?us-ascii?Q?MJMO0ORufEkaDALkdltvygLwuVOh6Y4sziEw4gY6oG/wiV4cXGg2xiZFSlJ+?=
 =?us-ascii?Q?u5oA31QFpwQ+kRJ0hemyiFFmuQxdZI/m+eqexsiOa9h17iF2pYx02Cokt4EC?=
 =?us-ascii?Q?TBL6G2XJn3CmucJf1427vDvlH3CMIGc+LJAbtNv/4P99KEOJH2cy/i0JtnR0?=
 =?us-ascii?Q?ENi2wXpPDXRJD4L/O8Io2AT8K8sDotS0itgqcokdkldT4ib6m7VChnKQ0kRk?=
 =?us-ascii?Q?/lRn+7qYZB7u2lkm3tCDbVlPUXTUx3/BkZXZs4ODtKxV8j0yBf0FNwP86tyO?=
 =?us-ascii?Q?W+gRGENmgK5S18m8RMoljvJoXaGJuq3Y86nvjH7vdohgWRlvRRoZXZLDcPkI?=
 =?us-ascii?Q?Ai67IVPhPskwZA9ejDWgH9o+cFR5IXasAaS0fcB7kHFW98VIwt6SkfklcZD+?=
 =?us-ascii?Q?1IxPo4JBJ7684rdK4e+Ks8f2Bk8QZIxzii+B3pAFSls+OG5deNVOhK75+iLF?=
 =?us-ascii?Q?ZtHQEYR7uVYQ0ZDaNie1KkGU/dKMDxg8Ymulk4W65PIEuF34BtfXewObZJLj?=
 =?us-ascii?Q?E+9PfZO1TFb9yPzI3jYi15ibZQUsM9JWQiuNB0gFBobbqkU+C6WRppJVjYBj?=
 =?us-ascii?Q?7XIDHlEopA9r3ybTDekfiPczYAaONXt+cCnvndCOlR6Q9pmmIs1jufaPIWpe?=
 =?us-ascii?Q?QGK2qeloW82/n/plamcA4rTvsN7ax2Eiv18ffeb1o33ncjg2IyQ5aA2PE5A7?=
 =?us-ascii?Q?IvmaQX1MLtJsxCB/1JVJM0QXRmyGHhqDgRbO6Su47XrrHJGxVtpTbWgiOGQI?=
 =?us-ascii?Q?M6Ct3rIrg2dXUbfLSGBmf5CwEXQZUkGRkad/k9X8EmZXEnxd92Q/sxbA02pu?=
 =?us-ascii?Q?aDDEWwakT4U/TOku4HculuSWDdzy5ZA1I9h9FnU3awBXFv5Pp5WCNAnrBhLE?=
 =?us-ascii?Q?c/d3+770ycBVejiSdCd0V8S5jP+axZweLRADWa9XqdFI/i56XWaiJCq6+tNf?=
 =?us-ascii?Q?Jag4+Zn5FcGD5Dv68ywfGBnTmn8C9Hnj0VbgGcf3zFeVc5VOBNb/bqj/Zbbh?=
 =?us-ascii?Q?Q7kg+da2hJopTESGoPLu+IXSsaPGsynC8mE5rsny9JqMLLXR+BZzLT+v/zw9?=
 =?us-ascii?Q?1MgRLYrysE6ApoMG6tqbI+gNLLd9RUQ15JColcfioqJmwRqmLfZ14o5/MK4x?=
 =?us-ascii?Q?87WdhIAPpkmai3QLeji+WUDDOt5MgipleZzv7OzOctUt+WNtYDZwk65JUO/2?=
 =?us-ascii?Q?t/rwi/SHOHnU7UmboC+Y0cMB0aQKS+mvtrklkXAPiQDWY8ktDfbp2pDMtgDn?=
 =?us-ascii?Q?dILLiRQ5rcX6g3o0rTJRTJ66GjoOiPqrK0tGuNSGmAgLCVNQRbuMWvPMOrky?=
 =?us-ascii?Q?ev9kE/qgR5BFbLjvvuGEmw2eRcpxOP8KYNFrmFTjke+Zsl2IEPV4THcy/bvK?=
 =?us-ascii?Q?7XIjJ1HWhRSb8pUYrN8GfMyc3iVIqzC7/NiiRj+yxy45jmjXhuzFbMXoDYau?=
 =?us-ascii?Q?lAPK8KOxYbXezjQjKBKn+x531/0CPR2Ywmwx3YrGRpcOtr6vHlDnF4bTQcRN?=
 =?us-ascii?Q?OHQdhk2gjw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YvC0T6qj4sfBa3pO58gOLaUXrzutC3TqKLhC+mF4rLt+FLYUCJ/r+fpou1N5fd8Sim8kZIa244fjCuxplzDFjdansLJYof7ChS0WVdWMFq3pFjx7bMpOgFisPKiIURYFsE8VJHPiHwRJ4sNBh+QKRFUTXDkJ5fiK+cbag5tOlBaYZVZYvDOHtv4qsHYG5/UcZlFDfe+I3GzPNU9nDg9J/Ok+0qGB9ChCCGdFsCvnRDKUTYhBtOppclBJQvL2fRE96WxPlXlvXykbxfIDqR7MpW89oMjPA5RvnIBbwjfwAa060SdHHbVD+nQMO3g09a6NGqdOLLvfdIEp7mK/647bmA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ca6a01-d4b2-4f53-2597-08df34d0f805
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 08:53:42.8470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hLBxcKKSk80nvCHumYasNXM+ODotOfL4gZpEEuB9vDRH1KlSuXXd6oHvJMgczUnWOq2Eho+1eKX1p8ZPC5b3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chaitanya,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Chaitanya Kumar Borah
> Sent: Thursday, October 15, 2026 4:56 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; B, Jeevan
> <jeevan.b@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] lib/igt_eld: Log module load state when no eld# no=
des
> are found
>=20
> eld_is_supported() silently fails when ELD procfs node polling times out.
> Log module load state to identify whether audio drivers are loaded when I=
GT
> attempts to read the ELD nodes.
>=20
> Cc: Jeevan B <jeevan.b@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  lib/igt_eld.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_eld.c b/lib/igt_eld.c index 896ab0e6b..bfb83a213 100=
644
> --- a/lib/igt_eld.c
> +++ b/lib/igt_eld.c
> @@ -36,6 +36,7 @@
>  #include "igt_aux.h"
>  #include "igt_core.h"
>  #include "igt_eld.h"
> +#include "igt_kmod.h"
>=20
>  #define ELD_PREFIX "eld#"
>  #define ELD_DELIM " \t"
> @@ -301,8 +302,15 @@ static bool eld_has_nodes(void)
>   * for a bounded amount of time before giving up to avoid spurious skips=
. */
> bool eld_is_supported(void)  {
> -	return igt_wait(eld_has_nodes(), ELD_SUPPORTED_TIMEOUT_MS,
> -			ELD_SUPPORTED_INTERVAL_MS);
> +	bool supported =3D igt_wait(eld_has_nodes(),
> ELD_SUPPORTED_TIMEOUT_MS,
> +				   ELD_SUPPORTED_INTERVAL_MS);
> +
> +	if (!supported)
> +		igt_debug("No eld# nodes found; snd_hda_intel loaded: %s,

Use igt_warn/igt_info to log in CI logs. igt_debug won't log without --debu=
g.

> snd_hda_core loaded: %s\n",
> +			  igt_kmod_is_loaded("snd_hda_intel") ? "yes" : "no",

As per my understanding, on SOF-based Intel platforms (with DMIC/Soundwire)=
,=20
snd_hda_intel still gets loaded but aborts its probe, and SOF driver bound =
to the=20
audio device instead.
If so, this would print "loaded: yes" even though it's not driving the hard=
ware.

Would it be better to check whether the driver is bound rather than loaded?

Regards,
Pranay

> +			  igt_kmod_is_loaded("snd_hda_core") ? "yes" :
> "no");
> +
> +	return supported;
>  }
>=20
>  #define ELD_MAX_SIZE 256
> --
> 2.50.1

