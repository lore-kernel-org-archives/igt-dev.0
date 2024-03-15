Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EBBC54E5D
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 03:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C7710ECDF;
	Fri, 15 Mar 2024 03:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcsZdzsB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CFE10ECDF
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 03:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710473138; x=1742009138;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LTqhnCJiSrmnOrSBpKSF9pPXhLP1xtB2cKJMUDHUEN0=;
 b=RcsZdzsBovGw0YRzcVuXRAC/eWAJtLY867jbJ2zBx1SMhk9ftdRGiK0d
 rLGqEpv/6vFUocVuk4N3SGimmCLve24D9Wr5T+ilf00fyBa68tuiZ+092
 Rf51w4Ku4Qg2GrNiJ4UjXIuKzPn7CJ9QCIySHzmTpNiv2HGKSAUzxPclY
 zBzVidRvgVSeg3oqwwrHXO3aMGqsBai+3zNa5tikILRpIGWCvBUMcF9Cw
 Tj+43TqZQehvNwTa9RTgAGK2wOjpp5fkZJI0RBLqqRTkgpEQvhoyzXgT1
 84lQu3vPE/alezfqihrWVbA2c5cvEpsVZqYwOrNwgu76dJzLd5AoyjQNY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9141573"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="9141573"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 20:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="43549553"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 20:25:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 20:25:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 20:25:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 20:25:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 20:25:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liP4mxlT8S7tyNioO8iQ7ZF+YeqznyMk56On942XBXjiHjDIQhmqTh2f9l6hfE1iGCrohANSo0skEqn7BNn7x5/2BGZ/4ejXGCXMhINr4MhDsYhiq/00ltyTFPRPri8h5tekh2G7p6sLUIlDpImKd7vtLCUHgOTcYoFy2DbwMGW7wbv1m/yJXGfPTKl1zyTTTH0IO+qe4RnUeYvJIYtVPteXtJRIgdchI38Xcf//QqcmLA/ybOvKkzulp2qMiQa8KCrKt6fm7RBkvs6p8HHkGPbWtNdwG0u6DcQ1lpx34RUHXNWpHqrNGTnB/ngBWwKeIERzqXSBe4loh5UxI2F1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUeZMDIxKUiPvmBuFqKQ4NgmKQwAHIi/ykcR3AObTbk=;
 b=crIO+KEjBD1Afm/aCu/k9X4uGzumWnNH2j7PNb0FmXagvqMwaTrVMWJawbAQwhV7zI9ETHOZNgRfLw/YgCfXDhsd8P2C/3rYrSH0opneNYmRKJBkqsSDA+WYrTK1qytO5zStbQW1iPeHnnido9YgZrt8esZn3oDSk86/8/q/iXDlNpFmhogPPBWY+amErR775U0Mwyi0cXbuiFzlhY75QmnUoQSDZ/XCnCvqbAQngr4xu8F/8KHWy3x7isD8oC/4q1+hddbVaYlkvDwJaO+fs8h2DwJMcz5ZEiEhsv6a4Twc1eUsJHww894NDCCF1slBktT4p9YHXkiBRd62IeJ5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 03:25:26 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 03:25:26 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t,v2] tests/intel: Add tests to run suspend without display
Thread-Topic: [i-g-t, v2] tests/intel: Add tests to run suspend without display
Thread-Index: AQHadfwPFtri+QeiqkWS9vt/nKQSvLE4JLYg
Date: Fri, 15 Mar 2024 03:25:26 +0000
Message-ID: <CY5PR11MB62115A7D4FF929CF0102FB2D95282@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240314105812.10194-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20240314105812.10194-1-sujaritha.sundaresan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS0PR11MB7558:EE_
x-ms-office365-filtering-correlation-id: 94969e7b-bded-4911-ea0d-08dc449f8e7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j0VhQ9WXBKDJgXZhbieIoRQ3WLKsOi55mZbF2BKBnDdo/nMMxARNmxcOfnOWIiDwFK5UTGiSItFPwuBSQwICg9TCPmVhEcI26KmXWW3DD8paZkwue6qKY4Vc2r21v6CfNLVYxbvCbLJR7go41wZ44Sb2vnhybJ04HIFCSwp55i659k18m7M9rjvBSXG7rLBdBybtYZHV59cZ35IfAY+jOKkTNRzoAocuIo2jAK6xK12tUPjLXJ88Q4qQqaUgoD+I/Xh3/EFivD08C1jpXbianrIVroxSHU6Zi28dGgI2ZTTkf+eraD0JRIKzRGUWUG2fH4UzSHwwWAgRIyjaocAkxAotmO7tJ7izUP8zq6qHMcxLRRu9cMzN+plpcpeEBIRMrK1nBknNyRjoHrHv3J/V9VO6kIJpPeU/SLymZlKQcMhgYBIMkA46kzZH5kFaTFyPpLSoG5qyJqgH6DXaliM9taIKsvHSFkKaMbfw2hf/jER+xbij6i6RMgsEbIqpQvcHT4pxRFzvT5qt0TWR8WW5bdP28D6GxZgrp2D60rwf+A2vkhLBgohTK1yH5lxlJnlvYL6iihBK5KZr8rAGb0cz1/Xvs3x33F16qfBJzVNmDdL9pSt/ck5geYBaHErS5Ch2F/gaTvJoP0yZPiL7H0zXVpHTiRNjKFR6qG2jSPP6+MjQVm4MmNw78h1lr9hkQfMfjiKxaKKgwdlB+cuT5QzM+eqoDrGEer83KxzKxvhzvKs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jb6KkHdxDSwefDvMa7bAnYsnquKOHNbFjKjVuY/dNMyG+duNCiGt7xjJ//rF?=
 =?us-ascii?Q?Fc+1LBdEiCph1a5+AvrcHYxZ9/oexNtNWXA4XtKlJDonHyGmQW+H8UIOlZvM?=
 =?us-ascii?Q?tJgWywILBRY54RXXuGqhNddvL3w1J1uo3rtIDPRjSlhZDindynD3SezUa4aZ?=
 =?us-ascii?Q?HGUUAN3fSC9v3gidJTQeCTMU5vzjQoLLRZc8BKMh1AIyW6ynhKet+Cpvh/42?=
 =?us-ascii?Q?cGdXufGHD7IUhVicPo+u0JSJmZunMY+dEseUR0KQyqpVKxtMOA7D3j/R0fLJ?=
 =?us-ascii?Q?qhjP1kepVVSM7Vc4eYd5VkIY2M/D9ESUKZeGKCKSon3r6SV0Fib4Lxi49FW/?=
 =?us-ascii?Q?1m2HYQh5NIt01/DPYhZ0hXLxjgUavYolhdauS5InLJucyioFEKoYZJcDaLdM?=
 =?us-ascii?Q?sL46/2P6McLCdfNSoqSIgs6jrsgVpU9ed21fxy7uLvPrgA2GNaTsoKpSV3eo?=
 =?us-ascii?Q?3W/KT9B2L+e8RYS/ahwVgkFyOAKanMNyMH40DLQN9ikifYMTTMj3P8sr+kPQ?=
 =?us-ascii?Q?CnbF1wmiEkdvRXjJQLQ3POrUHy/uqcEEwTD1LkOtN6N95KPBue1W9sWHQK2w?=
 =?us-ascii?Q?t5MxnNI9GFg6TrXWdj+eu6tZ0afpwAQikiBkNH0X/iRKYT1g5fGg++dv8tSM?=
 =?us-ascii?Q?6DAATwjvzoFUrspWYZZkOIAEn0iP11zBj6aM1FjvsWgutjKf/oZjV3+dFxfX?=
 =?us-ascii?Q?egKHlIkXn8LjM28SffT+JwknOpsZufgY6u53YYCJIYaw6gjLInZVdmUOXmqR?=
 =?us-ascii?Q?LSJYcCUESyUsoiCPIa3ozjpHrbE2xCXQnX2+BXc7t5qcDusm+LZ2E+1jhDEs?=
 =?us-ascii?Q?s8QgB2PkUc/JI0QrRvT2dmZUeeGFSazlVGSCYNlZP8GO7vqnRmlswQwPyV5r?=
 =?us-ascii?Q?6j63rFZMCnTmq4ApDLvPbYku4pUC5TTyDcydX78h1kPd9xGBofL3wjq4AXsg?=
 =?us-ascii?Q?f6U5M+Tb5dPnUz0MtVh8ZBH5Mdp8tfiuqs4OEIDU0WcjL184OYdqV9ooXMJV?=
 =?us-ascii?Q?mFcygRNaxfN8t1kbRVjDZPRPaKU+dO4v3VZCXleWtiTQje2VJYByn1suKmd4?=
 =?us-ascii?Q?SyihFEMojhwDfqRPZXqJrlrHB8OR45oxVw2/5Jb/rqyvOhK1sJg3gWCf4vK9?=
 =?us-ascii?Q?PQqrObdMSPZwqzWzp2DAzIEZTQ5//obuB/PLG4iQcRZYMxubtBpIzVZFk0Z7?=
 =?us-ascii?Q?kfhKbQ2KyGImdRhRuPggi2HHe7gm99QWosoSscE745CYZH45APtKz/4plpL5?=
 =?us-ascii?Q?0MO8fvEmVkTP9gmwq70mM5Y1wu36KqJoltmAMqDxVU1Vgt3IPGrzjSrWEj4a?=
 =?us-ascii?Q?cTBVNHmQ0VnXHl0Wf8plOngX7HGG2A6wbQ1KA+yEWCSRav9ECeV9ZZz9a0+3?=
 =?us-ascii?Q?403Npw7vHnnTXzYP9BI58lSbbxYgYyMjD2KdvHz099n45v8MkD2fjMci+98o?=
 =?us-ascii?Q?Xs6R+BxhqesUnzUg2WEyQGsYWXe4KeXkXT+2yII5AovLAAaq8+3OH0pro3mN?=
 =?us-ascii?Q?nFf1fS6a+EPnDIdtMOg6yV2PEX09y2NhrSN9omz5gz9yns3al2O0AQ1xo4ut?=
 =?us-ascii?Q?SUyMpl4W7KlndqAvax0NjPlZUp7mHlZ/WDXlC4du?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94969e7b-bded-4911-ea0d-08dc449f8e7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 03:25:26.0747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MkRWimsvM3Z2fCAN1Qoci56XMTVXPEIMqDGd24YYsYIkkxiApvqq0AMmwdnNPXXrqPGsk8NstiEJl4aUEW7KwOscNA6qT5UZgQ59RgqahRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
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
> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
> Sent: Thursday, March 14, 2024 4:28 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
> <sujaritha.sundaresan@intel.com>
> Subject: [i-g-t,v2] tests/intel: Add tests to run suspend without display
>=20
> Add tests to validate basic execution suspend/resume cycle without displa=
y
> module to rule out display related issues from the suspend/resume stack.
>=20
> v2: Add normal reload cycle after running test (Anshuman)
>=20
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> fcbed6249..f6ef5d124 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -16,6 +16,7 @@
>=20
>  #include "igt.h"
>  #include "lib/igt_device.h"
> +#include "lib/igt_kmod.h"
>  #include "lib/igt_pm.h"
>  #include "lib/igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
> @@ -246,6 +247,10 @@ static void close_fw_handle(int sig)
>   * Description: suspend/autoresume on %arg[1] state and exec after RPM
>   * Functionality: pm - %arg[1]
>   *
> + * SUBTEST: %s-without-display
> + * Description: suspend/autoresume on %arg[1] state without display
> + * Functionality: pm - %arg[1]
> + *
>   * arg[1]:
>   *
>   * @s2idle:	s2idle
> @@ -565,6 +570,7 @@ igt_main
>  	struct drm_xe_engine_class_instance *hwe;
>  	device_t device;
>  	uint32_t d3cold_allowed;
> +	const char *opts;
>  	int sysfs_fd;
>=20
>  	const struct s_state {
> @@ -628,6 +634,34 @@ igt_main
>  					  NO_RPM);
>  		}
>=20
> +		igt_subtest_f("%s-without-display", s->name) {
> +
> +			if (!drmModeGetResources(device.fd_xe))
> +				return;
> +
> +			xe_for_each_engine(device.fd_xe, hwe) {
> +
> +				igt_debug("Reload w/o display\n");
> +
> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
> +				igt_assert_eq(igt_xe_driver_unload(),0);
> +
> +				igt_kmsg(KMSG_INFO "Re-loading Xe without
> display\n");
> +
> 	igt_assert_eq(igt_xe_driver_load("enable_display=3D0"),0);
> +
> +				test_exec(device, hwe, 1, 2, s->state,
> +					  NO_RPM);
> +
> +				igt_debug("Reload as normal\n");
> +
> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
> +				igt_assert_eq(igt_xe_driver_unload(),0);
> +
> +				igt_kmsg(KMSG_INFO "Re-loading Xe\n");
> +				igt_assert_eq(igt_xe_driver_load(opts),0);
> +			}
> +		}
> +
>  		for (const struct d_state *d =3D d_states; d->name; d++) {
>  			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
>  				igt_assert(setup_d3(device, d->state));
> --
> 2.25.1

