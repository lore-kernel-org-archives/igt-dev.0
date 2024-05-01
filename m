Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB516C4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 03:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B1C10FD58;
	Wed,  1 May 2024 03:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K1lsIUar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200A910FCFC
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 03:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714535732; x=1746071732;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5xHOfOUU1mtlWtUWWKEsmSodxhNcBaRFBtLKeSkHIeU=;
 b=K1lsIUark07hkv/ZLcziVLP0vftzEWDdHyOSRn5xDYuW3pfmPXW93+0K
 MKwO0hykg3Nj0UFo7xIU8jzabZjMDWA8KbAVtaumaACaqN4HrVF2fqz2f
 aIzJs7Qs5N/VJa3nOkVu6bG3K1XHdiKkviUV3ajK7xsS2HMtvhRwVOzJ1
 YY+vFemEYhth3dryxCXkIT4jI/8hjdAALth9deww1fMUyWeHrhQRBktex
 Xq8c1x+6LSwds+fxTuGXqS7P97Z2v1gb/wm4yszoojCkSU0BiMO+XLdvu
 fZ6z4z+EdaQONY7S7QUNYUrwy/rxXuXQ2w7EIIiy3oHSp3B71IkAe5OXU Q==;
X-CSE-ConnectionGUID: QUyIksWGQXaD3O1Rdb3anA==
X-CSE-MsgGUID: 0iUpRZNoSsG8FQ/hYGVekw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10438786"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="10438786"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 20:55:32 -0700
X-CSE-ConnectionGUID: sRMKDD/XRtylCsVhYGR6xg==
X-CSE-MsgGUID: WkwCgvMOSJu93+M0wLAnXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="57851702"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 20:55:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 20:55:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 20:55:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 20:55:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpdHng0DukXIBMIaVE+plzsFOt5s3Tm0diT/Tckw8d0QemtzBQ3zBOQrh9O99022o34bVvkeVMQUgEKRjTa9Okt7unKeKmXE0ZndJllScXZ1fU24RwQSwqObbBgFsEmICdQcXb7MLzJCnfHmVdy+DAm2EUKyD0WrF55srIq+2imBAbKzAPXl6lKZx7Lhi3aQkxQgEBieEThugHzWskrFTVF6preV92FSBddPv/A8dDq9+Jgpf68zSu2TARnL0wf4T15IEZE1Z3p/WvWd6dr3Iv95wxXCtiHmXakVUXkMuDWqpNb7DktJJD2sPtI2d0z4dyP7e+c1aUdtT/4eTQUtgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71W0KHGN9UmWcqnkStiK1wKuFHQzdoUN97Xofa3hcGE=;
 b=g4OxPUxGZ+8cOtTTHumczW+pt+FbFsOEbAbHf7VkqgIH0VIpJEHHj2CjZdrHRV9wD8TuguL3ZRphFoNYVKLccuLQaeqlA13ug+YJEuNS2snPIN6J0huwMwq5ciJyhdUY4NuHqTGMm1RyFYqsRxcLqevq+70uWbkB56Qi1tih/ET2Asgn/FJS2wgKQF7Yk4Az4L8f5wNmmPbfLET8Y74S4D82/dwSgSgQOWmkz8KCksOnqqI2AVH+DM90+agHgWZCWdrgSWhVAo+WL70AQqQDeIkHaIkOxrOgwmjYnaDrtm1iCNMDFg1ncr2GSLvAHO4u28bttbfKXejzNKoKuTCfAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH7PR11MB8572.namprd11.prod.outlook.com (2603:10b6:510:30a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 03:55:29 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.021; Wed, 1 May 2024
 03:55:29 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH RFC i-g-t 1/2] lib/xe/xe_util: helper function
Thread-Topic: [PATCH RFC i-g-t 1/2] lib/xe/xe_util: helper function
Thread-Index: AQHamywUjwJW/KPfQEO6TjPiyTBWe7GBusRw
Date: Wed, 1 May 2024 03:55:28 +0000
Message-ID: <SA1PR11MB6991537C9B9E9FE45542D7A592192@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
 <20240430182747.589234-2-krishnaiah.bommu@intel.com>
In-Reply-To: <20240430182747.589234-2-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH7PR11MB8572:EE_
x-ms-office365-filtering-correlation-id: 85735b35-0de5-4fc9-86e6-08dc69928a82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?RLzzS1hoW3O1DWKEiCTKKLEHERNkpM020RX8WcP1GiUPCADDHr68uEZiClbf?=
 =?us-ascii?Q?wjvCcZuAXmMs8EJny1otjlXDDKe92ZRSGfNbHaHp71qPlzcqdTlfZDKOaq3F?=
 =?us-ascii?Q?aQlu8KyeDakx5FcrCA9MIPbQwrXI/d8msWskMXblVWndlKZnda2AbSM7L5x4?=
 =?us-ascii?Q?0yjiHfFUxjNU5pAeXAKfg7seYUx6G0tk4Fd3D8TvhlRJzFpBkOfsMmmH3loD?=
 =?us-ascii?Q?DT8GAtk0MGYJXM9MN8R3hFVIRxdv50V8F61uPlydTU7wuitEDObaUqbcY2J3?=
 =?us-ascii?Q?6eyHLjt0znIrVG3n3EPvAu6hFQlB3iViu6InJmiHm9uxhexNhKvJbZwSjPMA?=
 =?us-ascii?Q?tbXJ2b32gtSJ6xV3Jbt+4LOQp9xVnaKt+cygiwjc5EcNV1i3qCLymlTJwJSv?=
 =?us-ascii?Q?4jlXeQi+ML/89q4s6La56gGGPsiIZrRk/uyaEuHDMFm/EAdEKu1RBn6Vpwe4?=
 =?us-ascii?Q?CrQklEp26xLCtyOQn8plr14Xt8IACxIAPZgcdqmjT2a4SJkmQEeAGOPBsaDM?=
 =?us-ascii?Q?Sk/1Ik6T2N0RWyN9HuOKA39tn5YzNrY8EIOudwAtq/N0RuUWxzgS3BeIe8C+?=
 =?us-ascii?Q?1yPFLtSAauMyrGz5+NAK0tODbdONHiTTz/FhW/06UvqVGs+rnrDlDRF6l/Ui?=
 =?us-ascii?Q?q4BKS4Z+lRYP80YYrhP0y1fWJNavZnZwepzOciLgNhKRwSq/Iy5ezhZNxOOc?=
 =?us-ascii?Q?0GEPPr/nGJ1lQng01GHLUIyA7NRqwk0OnkBUUHq0Qxj5AOHWfvXAXpDPLQtj?=
 =?us-ascii?Q?eKq8xvbdXG/r835k8mRC8Dtslr+8TDAwFsgrXq1Tm908bVPVOqO2v99l6AT5?=
 =?us-ascii?Q?j0qLbXfHWQpyGTGTyA04BBynCzevVphVwQOLlM7ArXWte6n2Qcnvad4PUNbn?=
 =?us-ascii?Q?UGxZ/FR7LxKoZbYBhkEk9xXtCvUfoBxMYA997oqAIMha140d68gkVmjrY6UQ?=
 =?us-ascii?Q?oaCaIzXIia6z2Yr4vBO78ElGu4pO5bDn3oRBWPBcGXwKHuCAXPbnb0XJkORo?=
 =?us-ascii?Q?1KaUIg6dsp+tKPEAeucAk65n+vBuTqHpcr97qOay9vdv1hKJKhUDbmEyqa/O?=
 =?us-ascii?Q?2bBJbref1AW1wxxT/hDWOfy+4yrvT/H0BjIh9b0i7IdT6bp1UDNY2Ljgh3y+?=
 =?us-ascii?Q?WoPsEGWQ2nHBKk1HZZIhcyFXh4VVqPnvvjZEBThkwIq/5m99hiM66wTTNVcR?=
 =?us-ascii?Q?SI4IgLj21s6Z+IZOFu9MnCv8pzctsZlbKicxLbb8+NjRAaW+KaBs1sNWActy?=
 =?us-ascii?Q?Qe3YnqgVvspP+O1phe+vibMz0u4Fra2faG7h6nWOU1qplqLU14Dp4Wg1OQUw?=
 =?us-ascii?Q?mU4hQCB3Dy2KQVvewume1GRcNBW5EOvETc+6dc5X3xe0sA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xcIXNNYWWboZ3Z3akTVB69XtYgFnjfxFppvh90bOno34ACkF4icT/mVbjmxj?=
 =?us-ascii?Q?LDjMnPem5bnlwU6EbShmMDMYVPPo0+3MIYAfTjYcqjo9D8BEPBJYnLthaAj2?=
 =?us-ascii?Q?4QPHqvLIrRnCCp4nxssg7FciBk4Yemcf5Kgm8/4ihNenJLbqKBx9Dhf8jVUn?=
 =?us-ascii?Q?fCZKhs7DSMeBrVSSqqVoaRqm7ngSgByteNuLbk0WOdbTHOIJmxT6yNYtTJQW?=
 =?us-ascii?Q?LQOAi8ttT6a2/QIt/SoV1C23l4yqhoKU6WSDZ/UCB4z948mJg/hpFxBKj0GD?=
 =?us-ascii?Q?GLUNLSA6Lw7EbcIETIhsFXk0A4rgAmP8/RyRjI0n9ziMVcNnNfWsGZ2myjg/?=
 =?us-ascii?Q?BAx8BVMPhg2ydfXmIsoDu/ticYYb+T0tdRVPBm+mqo0DpnI6dSTJJTFx1/yS?=
 =?us-ascii?Q?5cInSZ7X9P1vyn+hZFeFhQ2QKTaD+Ji5ODSUnos9baDLCiFSryjV+6RU7mLO?=
 =?us-ascii?Q?02BvWdvU9t0AS7OxB8/1Y0ZWRemyNHwNoAkiq7ba4IHex2qf+wYNiwz15ux6?=
 =?us-ascii?Q?1/OuaHsS6IC3aeanK6oYn6uWqVjS8vIppvKosIVMI0zr0aO62PFWCwsEypst?=
 =?us-ascii?Q?aJ24pBvrWfNCOXJZhHsbyMR9q8kqe9UvxHwweuSPlbYTtC0olfHMNQ8/x6J1?=
 =?us-ascii?Q?AFMXkqNGrAz1ti9lpnMIeyOGqf2Cc/f5L3awMDOih2sfRQ97Z9MAUqFrjWFs?=
 =?us-ascii?Q?GTwwlYka3YmuRVATwCi8YBT+BmcrVw63xmef69pT83adP39uzXQWw499ianG?=
 =?us-ascii?Q?4RSTU4y/nuSPH4GTfpR5rf6BV3Sowdxi+KpdAeeOLVtjZYhZSr6EHR2NwZFL?=
 =?us-ascii?Q?jMvZi03SG/h89oEXdEsMgB8/KqKb9uW8K9b6qbCrujFELJD5Jg5QEe9zGp0S?=
 =?us-ascii?Q?DoYXggHvdK0Gm59DVDNYj2zrrRIEn2DTcoogJiSdiFuq0cyQprZDzuy+5yHx?=
 =?us-ascii?Q?mcIAOnk4VFFJMVB7N9ZKggDznXRVWaQoGEzi0umBFrKfLUyxnZeRkPpewSxj?=
 =?us-ascii?Q?F3Jvxkg6fpL9ojc7ehvOXI0ILvjOPzZxiqL295Nq3M2ZqMYZdXiocxcnahIy?=
 =?us-ascii?Q?Udx7CRsXDAcXCno8VGMDpMdHIQJzK6qhUQRlJcHSde4aJaUDwCa/qHrTkIZO?=
 =?us-ascii?Q?wGgM8Yhx5YQqqN4ACM1qjwJwu+X3GHsz9B3gEVE72Pdkm60Nj786C7i6nwIS?=
 =?us-ascii?Q?rdtfgiT+om858X0OjyfF6TEfKHD7ajWgjAUiswwhShj+YZcAY/pYjthjv8/C?=
 =?us-ascii?Q?zTAxBGUAFjxerHULy6sUMRsxCMxLB6xiVSOiU+RrKxV3EMZTh54wYCp4l8NV?=
 =?us-ascii?Q?guK62CePrTSusYiwBdiEYSo09ILFVAUMbo8D60auTmybsZ4A1Bz4dNixmLIK?=
 =?us-ascii?Q?+Wx37u1hKrk/dofTyQYO+jAMzvJ5J5E811GccrDEMckh1snkRuFgQ+WFiPY5?=
 =?us-ascii?Q?rAScDxqiUnB/ASleKvZOz9riXa4RBJW2LxG9fs/s9Gf38AFaHm4JgUOa90yT?=
 =?us-ascii?Q?Q565yDkF1GuUftyr9noGI77kOCtq8AAsDi8/dXmY6jN1vAw9jk5AmgfaAx0X?=
 =?us-ascii?Q?ahty4pOrBWhIUGV5bUU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85735b35-0de5-4fc9-86e6-08dc69928a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2024 03:55:28.9466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CvdlEAErKXXKGUKFJBh9Psv4mH0iUtgYiC1qnqnNE/BTF7KiB4LJkGGFoZEdHiVcNSIeeTXgITfcWhVktebE1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8572
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
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Tuesday, April 30, 2024 2:28 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH RFC i-g-t 1/2] lib/xe/xe_util: helper function

Improve the subject as well

>=20
> Introduce helper functions for object creation, binding, submission, and
> destruction, applicable for SVM and other tests.
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  lib/xe/xe_util.c | 113
> +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_util.h |  32 ++++++++++++++
>  2 files changed, 145 insertions(+)
>=20
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 050162b5e..3f1e8c052 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -10,6 +10,119 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
> +#include "lib/svga/vm_basic_types.h"
> +
> +/*submit a command
> +* wait for cmmand to cmplete from gpu
> +* verify ufence value*/
> +void xe_submit_cmd(struct xe_buffer *cmdbuf)
> +{
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value =3D USER_FENCE_VALUE,
> +			.addr =3D xe_cmdbuf_exec_ufence_gpuva(cmdbuf),},
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +		.exec_queue_id =3D cmdbuf->exec_queue,
> +		.address =3D (uint64_t)cmdbuf->gpu_addr,
> +	};
> +
> +	xe_exec(cmdbuf->fd, &exec);
> +	xe_wait_ufence(cmdbuf->fd,
> xe_cmdbuf_exec_ufence_cpuva(cmdbuf), USER_FENCE_VALUE,
> +	cmdbuf->exec_queue, ONE_SEC);
> +}
> +
> +/*create a buffer, map it to cpu and gpu */
> +void xe_create_buffer(struct xe_buffer *buffer)
> +{
> +#define ONE_SEC MS_TO_NS(1000)

You also used ONE_SEC definition in xe_submit_cmd function. So move it out =
of this function

Oh, you defined it in header file... so delete here

> +	struct drm_xe_sync sync[1] =3D {


I personally prefer write struct drm_xe_sync sync. But I am fine if you kee=
p it sync[1]....Not a big deal=20


> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value =3D USER_FENCE_VALUE },
> +	};
> +
> +	buffer->bind_queue =3D xe_bind_exec_queue_create(buffer->fd,
> buffer->vm, 0);
> +	buffer->bind_ufence =3D
> aligned_alloc(xe_get_default_alignment(buffer->fd), buffer->size);

Here we allocate a ufence, so don't use buffer->size. Buffer->size is the s=
ize of the buffer we want to create, not the size of ufence. I think 8 byte=
s with alignment is enough for ufence? =20

> +	sync->addr =3D buffer->bind_ufence;

Write sync.addr if write sync above
> +
> +	if (!buffer->is_userptr) {
> +		buffer->bo =3D xe_bo_create(buffer->fd, 0, buffer->size,
> buffer->placement, buffer->flag);
> +		buffer->cpu_addr =3D xe_bo_map(buffer->fd, buffer->bo,
> buffer->size);
> +	} else {
> +		buffer->bo =3D
> aligned_alloc(xe_get_default_alignment(buffer->fd), buffer->size);
> +	}
> +
> +	xe_vm_bind_async(buffer->fd, buffer->vm, buffer->bind_queue,
> buffer->bo, 0, (uint64_t)buffer->gpu_addr, buffer->size, sync, 1);

Write &sync if you write sync above...

> +
> +	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
> USER_FENCE_VALUE, buffer->bind_queue, ONE_SEC);
> +}
> +
> +void xe_destroy_buffer(struct xe_buffer *buffer)
> +{
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	sync->addr =3D buffer->bind_ufence;
> +
> +	xe_vm_unbind_async(buffer->fd, buffer->vm, buffer->bind_queue,
> 0, (uint64_t)buffer->gpu_addr, buffer->size, sync, 1);
> +	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
> USER_FENCE_VALUE, buffer->bind_queue, ONE_SEC);
> +
> +	munmap(buffer->cpu_addr, buffer->size);

This is only for !is_userptr case

> +	if (!buffer->is_userptr)
> +		gem_close(buffer->fd, buffer->bo);
> +	else
> +		free(buffer->bo);
> +
> +	free(buffer->bind_ufence);
> +	xe_exec_queue_destroy(buffer->fd, buffer->bind_queue);
> +}
> +
> +/*
> +a command buffer is a buffer in GT0's vram, filled with gpu commands,
> +plus some memory for a ufence used to sync command submission
> +*/
> +void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val)
> +{
> +	int i =3D 0;
> +
> +	batch[i] =3D MI_STORE_DWORD_IMM_GEN4;
> +	batch[++i] =3D dst_va;
> +	batch[++i] =3D dst_va >> 32;
> +	batch[++i] =3D val;
> +	batch[++i] =3D MI_BATCH_BUFFER_END;
> +}
> +
> +void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t
> fill_func, uint64_t dst_va, uint32_t val, struct drm_xe_engine_class_inst=
ance
> *eci)
> +{
> +	//make some room for a exec_ufence, which will be used to sync the
> +	//submission of this command....
> +
> +	cmd_buf->size =3D xe_bb_size(cmd_buf->fd, cmd_buf->size +
> PAGE_ALIGN_UFENCE);
> +	xe_create_buffer(cmd_buf);
> +	cmd_buf->exec_queue =3D xe_exec_queue_create(cmd_buf->fd,
> cmd_buf->vm, eci, 0);
> +	fill_func(cmd_buf->cpu_addr, dst_va, val);
> +}
> +
> +void xe_destroy_cmdbuf(struct xe_buffer *cmd_buf)
> +{
> +	xe_exec_queue_destroy(cmd_buf->fd, cmd_buf->exec_queue);
> +	xe_destroy_buffer(cmd_buf);
> +}
> +
> +uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer *cmd_buf)
> +{

Write a simple comment to say the last 8 bytes of the cmd buffer is used as=
 ufence...

Oak
> +	return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size - 8;
> +}
> +
> +uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf)
> +{
> +	return cmd_buf->cpu_addr + cmd_buf->size - 8;
> +}
>=20
>  static bool __region_belongs_to_regions_type(struct drm_xe_mem_region
> *region,
>  					     uint32_t *mem_regions_type,
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index 6480ea01a..35f59cb6b 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -12,6 +12,38 @@
>  #include <stdint.h>
>  #include <xe_drm.h>
>=20
> +#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> +#define ONE_SEC MS_TO_NS(1000)
> +#define PAGE_ALIGN_UFENCE 4096
> +
> +struct xe_buffer {
> +	void *cpu_addr;
> +	void *gpu_addr;
> +	/*the user fence used to vm bind this buffer*/
> +	uint64_t bind_ufence;
> +	uint64_t size;
> +	uint32_t flag;
> +	uint32_t vm;
> +	uint32_t bo;
> +	uint32_t placement;
> +	uint32_t bind_queue;
> +	/*only a cmd buffer has a exec queue*/
> +	uint32_t exec_queue;
> +	int fd;
> +	bool is_userptr;
> +};
> +
> +typedef void (*cmdbuf_fill_func_t) (uint32_t *batch, uint64_t dst_gpu_va=
,
> uint32_t val);
> +void xe_create_buffer(struct xe_buffer *buffer);
> +void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t
> fill_func,
> +		uint64_t dst_va, uint32_t val, struct
> drm_xe_engine_class_instance *eci);
> +uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer *cmd_buf);
> +uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf);
> +void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val);
> +void xe_submit_cmd(struct xe_buffer *cmdbuf);
> +void xe_destroy_buffer(struct xe_buffer *buffer);
> +void xe_destroy_cmdbuf(struct xe_buffer *cmd_buf);
> +
>  #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
>  	(xe_region_class(fd, region) =3D=3D
> DRM_XE_MEM_REGION_CLASS_SYSMEM)
>  #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
> --
> 2.25.1

