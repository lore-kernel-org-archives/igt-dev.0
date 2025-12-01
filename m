Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC47FD116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 13:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602A510E3D8;
	Mon,  1 Dec 2025 13:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GW38tw+F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB76A10E3D8
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764595123; x=1796131123;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eLxH3vL5Vu0SNWjFeHH8NBpwVIoTHZUGYXM9fZht9fY=;
 b=GW38tw+FOoHqYHvVhXMTu34nopNMB5PvQJrj3eDUVwZce+5hpiLD9ElL
 lz2RUGl1Xt4wV5bzDW7WhBu0zIWHUZM1CbXmvMF2Y72mlj7HkheOuupUh
 1Sb8nHGJuGUgoldidjFezo58V1Gxg0R8pNJFyWPjmyMEep1M13WOEKW4B
 uF0Duw07lplv9C1FwKO/6M+XshrbgQWNuePRL2nUu0N10fpEL2E2bTiDE
 2wqieg3feBrJA1HjAAQJ2jmqZbb7KsX4p7o3iTdPss36dhgbvGOxitOAv
 UmW46qOJ+3YvqWq/X1q/L1x8IsQw4RkvkRFpDdD4m7Ji5vB3SeaODPVsQ w==;
X-CSE-ConnectionGUID: lt6cg6ngQbaZnZq/QcLARQ==
X-CSE-MsgGUID: ovSNS/4nS+OVnk9xoXjmNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66565282"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66565282"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:18:43 -0800
X-CSE-ConnectionGUID: ax6ZNtTMQX69hoCG8WWiSA==
X-CSE-MsgGUID: VdGwEEUaQhudSOcLI+Gbeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="217432966"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:18:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:18:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 05:18:42 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:18:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1P3xjJ60a4D2yEZV07G+B1DD50hlKMjmLfbKYoxIYuK90z3MYm3M3yN1HFrsQg3Up2qRyY+MPuO2bC3S1TeHoRxTlYHMwjbLW+m3MfYI13nZMTJFyFbeY6iPuoFsSlT9N6fEe19YQ+E0KF7K0AXLhHAkSnj38bZqSev8yMAqHxXNH0ulqrwlO7alG53UwDwLb2Qm3PpFfjMwLwIxsk+tK6PA2GRJI+Ta1/0nGgNOXoiH1S1rDFGjIMyi/Z0pcCP/w4WiyFsgUX7ZSi33E1YUDgNxQQ9MDNgO3aatzh0M/xznZzp+F3pdbK9C8VFdHS/J5R1+XAMNVCcEKTR6Irraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgnMYsaHhs7JsE7zePnPVe65BBWrY2Jg7iPmrf6AI3Q=;
 b=DqRpNsIws/pho688HETCVzhaHUifcqGdIuk+D6G+tEgpiGOcoM6IS8bo6W9I625IO29+GD7Vgiob6o74q8yRwc0Esr5f8jGm1BKaM10zvg7wUJ2PBhh+HM3AOQs9uwqhZgqsYqe6LeIGWONz+IiMcsinno4px62ZhsA0r42H+O6n+vS41eHhwx0UpFEcPuJ4ueG+RcZzpA4SGEYWBwdP599XimzRK5IKLD9JzXBLsyp+zRy5jLNkJYxi2zT1dWAf0dMToWj/oLcUMr7tE8MMyAwdZFfUqyxSAnVuMsti0xIiNOLPka30xe6JjJ2zkCcQdSw4Q78XZ4urZV8I5I2EPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:18:40 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:18:38 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v9 08/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU simultaneous access test
Thread-Topic: [PATCH i-g-t v9 08/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU simultaneous access test
Thread-Index: AQHcYqFxesiTfIziuEGC60Susdres7UMxLHQ
Date: Mon, 1 Dec 2025 13:18:38 +0000
Message-ID: <BL1PR11MB5525174165B9619E339A5FC084DBA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-9-nishit.sharma@intel.com>
In-Reply-To: <20251201090349.326673-9-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH8PR11MB8260:EE_
x-ms-office365-filtering-correlation-id: 20ea80be-6930-443b-3e49-08de30dc23c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zKXBsBMHNc1uYxgMprWaLiA/tTsRKSH2YGss/3BXpu3z5++K2usmc7oKG9mu?=
 =?us-ascii?Q?ZO98dBDMDvkAvLnReOMxSHdWVXke/QiswRcIhba0J51DXPNVTg18KurQttIH?=
 =?us-ascii?Q?JLbCSHs+PK8BpIyu5gKWJdEyt3q1FgvqK3THbZM0Gz4W0IBLG+p2ZNaI9+Ii?=
 =?us-ascii?Q?R9ehd5ReyRiXqWi9phJlf4is/Ol6vaAIQJXXwL+NFXgG0BoqcbsA9aZtkMaa?=
 =?us-ascii?Q?VFTOxB/sLj2GcvDX0p+mBoVQ2oOmxLGxmayzUB+Z806CQ90lgJxuSI1MDAeE?=
 =?us-ascii?Q?irKKLANjpzMkps37Xnn2Kn4YZjKAaz5yhYn1TdVeWckpolRDg4xqULWec85+?=
 =?us-ascii?Q?YS/riYRMG7MoLuZx2439SPQkB2QahRWjEdICEgkbXTCGoKe2SGgG14oAApNg?=
 =?us-ascii?Q?ibEOSbQnZggUcvslRTa9IK06bu15vvw3IERUTLBcRY9IgyxFWbWki+qHaERq?=
 =?us-ascii?Q?qfmm1loeCB+9KyHRKGEM/MFVnfhB9vhyotLunaiCNJ+BLjCMsLpEadHeN9KP?=
 =?us-ascii?Q?BWDnSDa7lpJj8FZHKIfr9cSND/NNd62DrH+3g4Gn2Lbn3OdNczt3b7bT79wQ?=
 =?us-ascii?Q?KEEzwCBEBNFirTKIlFjqYmQw7JMtZrMteNv7kGMW0iRo36X5Yl8nJvPPWkIO?=
 =?us-ascii?Q?cEZQo2Cd7uTQP7dpXW5J3M4Br2TTsYv3t/0MiKPjb/kjkXwQoitJ/N6qDGmV?=
 =?us-ascii?Q?yd6QoPJcYsayNqP+kk+u3rJXhnLk/9ZrI5ZP28gwAc4hkiY0aP9M/wbXmI7c?=
 =?us-ascii?Q?xGcDVodkV5bb3h+5FbRFHPiCfZg8NSpmSX7ZU/orfRL+R2hnOs2vdNO/iURw?=
 =?us-ascii?Q?kxtI7RviV8jPm82uc3wp+noUTV8HSxukv70ID194Weysk/h1i5QhCHLs1SiQ?=
 =?us-ascii?Q?4+B8zHgKKmc90IJ13RBrnlUkVueLWBNl05Jo/42utDxNxFqa05++xoIy9n6B?=
 =?us-ascii?Q?0f/I7jqlEdQPvONn/YujhhCGoAT39wltsvfqVOtOOoQ4RpFTyosYF8BitHev?=
 =?us-ascii?Q?IYsDqlicAAtWXYs0K9REhxetX/cXdaKK6xy2U2eNUCfa3/EkCVB0srgQGyob?=
 =?us-ascii?Q?SXpknnEV82b1cC9SHUTpjCKIQ8qLqHvsV1Pz+kcn3eJVXri0glZ4MP8kTmhZ?=
 =?us-ascii?Q?CVgFF32OxKQ2tJgJemiyX+tEG4M3+tNWndtfyxNsMHwgQRnhV+pBou+dFJBH?=
 =?us-ascii?Q?HMXSm81LrbxLeqgsRUQbSE6m7vEr/RnfRDpXzgtJdffAN2vQogdp6i9ONBrv?=
 =?us-ascii?Q?fP1FP43TlT+U6squcBS9q62b4TlnvzYP4huoli9AhKocJ++madZOJBVPNyWy?=
 =?us-ascii?Q?CO/nr4TEzWTOTsGvjZS3XtM0Syo753IUXPqEIeXNgZ8eI0FUzz6DU94lVpwX?=
 =?us-ascii?Q?ZM8xhNH7p9Cin6wBK0TqK0fJVQ+J79jevyDnADoLjTrVVjAFjzuPwRrxSqoD?=
 =?us-ascii?Q?dQoDP/qYeJpO3tFbI6eYPULI0eiObe4R/z+6LcL+y7jmNGvYR1txsk6KzxpU?=
 =?us-ascii?Q?cFbH4r72mjZXg9dVzz1cgHl43KJE87jzY7Zf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IaXrAYzuRpeT1A0TMO/KYGJKULqasxIG1MrmLOvchiCdfYj1Kt1dvxXRbhUk?=
 =?us-ascii?Q?xi6Q0BbTrDH+ttIllqWH9VLm9BSqKHlbKN0vlMsi7oK8RiAAEiO8Z4uu83eu?=
 =?us-ascii?Q?MKZWBYbwzAcd3U50eeGJNRiTL8Osg0wLlHk7ftY2DFe2JPJZ4VkRmHtGblw4?=
 =?us-ascii?Q?ILrcsM3nTOFjELLa3LrsdneHfrNQs3Ph1lwhgbUM43serWSX9J/LALPEdOxU?=
 =?us-ascii?Q?bhuhLFgp86JmI8CN8PPx5W0PM27nMwq9bkCJNWfV9VyU0CcpS7GWWFuLv/ol?=
 =?us-ascii?Q?0b5XfF/NT0nIiaAZA64mcvz8AtVTEUekksfmGhkRu8McRRwoo0rTS1f8ZjMR?=
 =?us-ascii?Q?azX2TbY3e43C2Vd9OHjjsoYnABVa+4u1Ig9SqblHTkhMuUPJ+HZHtfyX8hsj?=
 =?us-ascii?Q?fmWLUeiaxgzIIrj5zay/LCkfJSxyezuogkWpFdl5e/V38XSdobw57ti7mSQD?=
 =?us-ascii?Q?R6OKYpnXXu7y0BJzORi1P9WQvb/xhrwit8fuQb4CE9U8k3TKPkWI5M2HsLiU?=
 =?us-ascii?Q?Z20Yg5KP0QB1hQmIuXqJrUvlL24sZcNWFJAjfFk5vbXa/zaJwrlvWJUwWeFo?=
 =?us-ascii?Q?2mRA+U+FXAK39eBV4fA5Jw4ySFEDD6tuHeLfgW+92ZkwfrCLK5HqU6bnj3mE?=
 =?us-ascii?Q?Zv2cus9fEWLIRry8ifzzekAqa2ibZKJqk7s0js+xwIBjyPuKiGbDzf5vY1qh?=
 =?us-ascii?Q?gtA8dUM4l/4/p8/LvdhLYu33bIi44F8PfwWNaP3RCluf9ZOVKjjJFDrudxPX?=
 =?us-ascii?Q?dfte1MJxk1m83LvEPkQSE+JwG5fOzCmOTr0njXlq2FO4LMQEqBEALlyipc0f?=
 =?us-ascii?Q?eFCexRpaXzku52oWzmC6vVrUuo2zNwr1AIrG1g3E6p5J4Ca5Cp9WfOXTBGi+?=
 =?us-ascii?Q?VZ25QNYCcbSMjMNSgyL7IY/ABuTOMXHB+0/638+p6g4JAbat80b1OEuNNBGz?=
 =?us-ascii?Q?tbjfY1MCeuYsOt8OONAI6QhD2kItUNK72ONx89R9elu+ItH/YKb+eYZc7GPa?=
 =?us-ascii?Q?XSNuSJFO9vgabMSLytRWTtozHRgiiRmeRF8fMvNLBadojpYBeALJa4GS4nQU?=
 =?us-ascii?Q?1cwyo3JJrAIDsQKUt2CssGuXnEvLH6R9jDRFrkknElHZ53uZhXR6DOaqV6AO?=
 =?us-ascii?Q?+ToLTt1gfcF9+jgIMsAF3CBfWpsfaEPuDFmvs7s4Co34PfxvMgwNFRNdQF3/?=
 =?us-ascii?Q?3gNHUpqo88GLjt6E+CIun3tSIDdIwpy4Q9INnjc/WrJh3/26WqzJXZPzpSB0?=
 =?us-ascii?Q?gl/PCrcBHb+32FsG3ySTtg24i7B3Noh8hNS1b/FQ2T8lxFWWi2jJbe/ahRqo?=
 =?us-ascii?Q?90pPQLDD3a4UC8G4yYXLXsbEbCF3bLZ6z1LHqunYyxtEU2QMWPJl1m6T4q2t?=
 =?us-ascii?Q?zIdSeoks6JRLqHshd2ZBrt09BEH8yLCneLubOGfyPqLmp8uG1xT5+blwl6Jw?=
 =?us-ascii?Q?1SqrLp1TYlPstDf3PDzP+QkQiiF9XeRD7RvXLVUXCxR4ut8fsix8no2ngEX0?=
 =?us-ascii?Q?R8nR8/7UXuEXTtX4JrtSibK00Vz3Vnvv3bjzEnT3cgHZV9K7zLSiF1F3g6Lx?=
 =?us-ascii?Q?uKT1YQ1MMWftGqPzL9rUgRjzlttsDB9dx59/NjR/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ea80be-6930-443b-3e49-08de30dc23c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:18:38.4018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wFhM3kXnxbuEkiUopVDt/JxXEeS+hzDyTjGEGx6e8NVtMvUEJg7QRc+vw78T8ruMwjujPxZEWAmTOru6uovRDRVT2RoZf9vgMUwdG2e9Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Monday, December 1, 2025 2:34 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit
> <nishit.sharma@intel.com>; Gurram, Pravalika
> <pravalika.gurram@intel.com>
> Subject: [PATCH i-g-t v9 08/10] tests/intel/xe_multi_gpusvm: Add SVM
> multi-GPU simultaneous access test
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This test launches compute or copy workloads on both GPUs that access the
> same SVM buffer, using synchronization primitives
> (fences/semaphores) to coordinate access. It verifies data integrity and
> checks for the absence of race conditions in a multi-GPU SVM environment.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_gpusvm.c | 193
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 193 insertions(+)
>=20
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.=
c
> index 7a06e289c..bdbaa7a16 100644
> --- a/tests/intel/xe_multi_gpusvm.c
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -13,6 +13,7 @@
>  #include "intel_mocs.h"
>  #include "intel_reg.h"
>=20
> +#include "intel_gpu_commands.h"
>  #include "time.h"
>=20
>  #include "xe/xe_gt.h"
> @@ -98,6 +99,17 @@
>   *	Test cross-GPU memory access with prefetch to verify page fault
>   *	suppression when memory is pre-migrated to target GPU's VRAM
>   *
> + * SUBTEST: mgpu-concurrent-access-basic
> + * Description:
> + *	Test concurrent atomic memory operations where multiple GPUs
> + *	simultaneously access and modify the same memory location
> without
> + *	prefetch to validate cross-GPU coherency and synchronization
> + *
> + * SUBTEST: mgpu-concurrent-access-prefetch
> + * Description:
> + *	Test concurrent atomic memory operations with prefetch where
> + *	multiple GPUs simultaneously access shared memory to validate
> + *	coherency with memory migration and local VRAM access
>   */
>=20
>  #define MAX_XE_REGIONS	8
> @@ -109,6 +121,7 @@
>  #define COPY_SIZE SZ_64M
>  #define	ATOMIC_OP_VAL	56
>  #define BATCH_VALUE	60
> +#define NUM_ITER	200
>=20
>  #define MULTIGPU_PREFETCH		BIT(1)
>  #define MULTIGPU_XGPU_ACCESS		BIT(2)
> @@ -118,6 +131,7 @@
>  #define MULTIGPU_PERF_OP		BIT(6)
>  #define MULTIGPU_PERF_REM_COPY		BIT(7)
>  #define MULTIGPU_PFAULT_OP		BIT(8)
> +#define MULTIGPU_CONC_ACCESS		BIT(9)
>=20
>  #define INIT	2
>  #define STORE	3
> @@ -180,6 +194,11 @@ static void gpu_fault_test_wrapper(struct
> xe_svm_gpu_info *src,
>  				   struct drm_xe_engine_class_instance *eci,
>  				   unsigned int flags);
>=20
> +static void gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
> +				    struct xe_svm_gpu_info *dst,
> +				    struct drm_xe_engine_class_instance *eci,
> +				    unsigned int flags);
> +
>  static void
>  create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
> drm_xe_engine_class_instance *eci,
>  		    uint32_t *vm, uint32_t *exec_queue) @@ -1058,6
> +1077,164 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
>  	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);  }
>=20
> +static void
> +multigpu_access_test(struct xe_svm_gpu_info *gpu1,
> +		     struct xe_svm_gpu_info *gpu2,
> +		     struct drm_xe_engine_class_instance *eci,
> +		     unsigned int flags)
> +{
> +	uint64_t addr;
> +	uint32_t vm[2];
> +	uint32_t exec_queue[2];
> +	uint32_t batch_bo[2];
> +	struct test_exec_data *data;
> +	uint64_t batch_addr[2];
> +	struct drm_xe_sync sync[2] =3D {};
> +	uint64_t *sync_addr[2];
> +	uint32_t verify_batch_bo;
> +	uint64_t verify_batch_addr;
> +	uint64_t *verify_result;
> +	uint32_t final_value;
> +	uint64_t final_timeline;
> +
> +	/* Skip if either GPU doesn't support faults */
> +	if (mgpu_check_fault_support(gpu1, gpu2))
> +		return;
> +
> +	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
> +	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
> +
> +	data =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(data);
> +	data[0].vm_sync =3D 0;
> +	addr =3D to_user_pointer(data);
> +
> +	WRITE_ONCE(*(uint64_t *)addr, 0);
> +
> +	/* GPU1: Atomic Batch create */
> +	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
> +			 &batch_bo[0], &batch_addr[0], flags, ATOMIC);
> +	/* GPU2: Atomic Batch create */
> +	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, 0,
> +			 &batch_bo[1], &batch_addr[1], flags, ATOMIC);
> +
> +	/* gpu_madvise_sync calls xe_exec() also, here intention is different
> */
> +	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> +			    DRM_XE_ATOMIC_GLOBAL, 0, 0, exec_queue[0]);
> +
> +	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu1->fd, 0, gpu1->vram_regions[0],
> exec_queue[0]);
> +
> +	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> +			    DRM_XE_ATOMIC_GLOBAL, 0, 0, exec_queue[1]);
> +
> +	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu2->fd, 0, gpu2->vram_regions[0],
> exec_queue[1]);
> +
> +	setup_sync(&sync[0], &sync_addr[0], BIND_SYNC_VAL);
> +	setup_sync(&sync[1], &sync_addr[1], BIND_SYNC_VAL);
> +
> +	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K, &sync[0],
> +			     sync_addr[0], exec_queue[0], flags);
> +
> +	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync[1],
> +			     sync_addr[1], exec_queue[1], flags);
> +
> +	free(sync_addr[0]);
> +	free(sync_addr[1]);
> +
> +	igt_info("Starting %d concurrent atomic increment iterations\n",
> NUM_ITER);
> +	for (int i =3D 0; i < NUM_ITER; i++) {
> +		bool last =3D (i =3D=3D NUM_ITER - 1);
> +
> +		if (last) {
> +			sync_addr[0] =3D (void *)((char *)batch_addr[0] +
> SZ_4K);
> +			sync[0].flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> +			sync[0].type =3D DRM_XE_SYNC_TYPE_USER_FENCE;
> +			sync[0].addr =3D to_user_pointer((uint64_t
> *)sync_addr[0]);
> +			sync[0].timeline_value =3D EXEC_SYNC_VAL + i;
> +			WRITE_ONCE(*sync_addr[0], 0);
> +
> +			sync_addr[1] =3D (void *)((char *)batch_addr[1] +
> SZ_4K);
> +			sync[1].flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> +			sync[1].type =3D DRM_XE_SYNC_TYPE_USER_FENCE;
> +			sync[1].addr =3D to_user_pointer((uint64_t
> *)sync_addr[1]);
> +			sync[1].timeline_value =3D EXEC_SYNC_VAL + i;
> +			WRITE_ONCE(*sync_addr[1], 0);
> +		}
> +
> +		/* =3D=3D=3D CONCURRENT EXECUTION: Launch both GPUs
> simultaneously =3D=3D=3D */
> +		xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0],
> +			     last ? &sync[0] : NULL, last ? 1 : 0);
> +
> +		xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1],
> +			     last ? &sync[1] : NULL, last ? 1 : 0);
> +	}
> +
> +	 /* NOW wait only for the last operations to complete */
> +	final_timeline =3D EXEC_SYNC_VAL + NUM_ITER - 1;
> +	if (NUM_ITER > 0) {
> +		if (READ_ONCE(*sync_addr[0]) !=3D final_timeline)
> +			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[0],
> final_timeline,
> +				       exec_queue[0], NSEC_PER_SEC * 30);
> +
> +		if (READ_ONCE(*sync_addr[1]) !=3D final_timeline)
> +			xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr[1],
> final_timeline,
> +				       exec_queue[1], NSEC_PER_SEC * 30);
> +	}
> +
> +	igt_info("Both GPUs completed execution %u\n",
> READ_ONCE(*(uint32_t
> +*)addr));
> +
> +	/* =3D=3D=3D Verification using GPU read (not CPU) =3D=3D=3D */
> +	verify_result =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(verify_result);
> +	memset(verify_result, 0xDE, SZ_4K);
> +
> +	/* Use GPU1 to read final value */
> +	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr,
> to_user_pointer(verify_result),
> +			 &verify_batch_bo, &verify_batch_addr, flags, INIT);
> +
> +	sync_addr[0] =3D (void *)((char *)verify_batch_addr + SZ_4K);
> +	sync[0].addr =3D to_user_pointer((uint64_t *)sync_addr[0]);
> +	sync[0].timeline_value =3D EXEC_SYNC_VAL;
> +	sync[0].flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[0].type =3D DRM_XE_SYNC_TYPE_USER_FENCE;
> +	WRITE_ONCE(*sync_addr[0], 0);
> +
> +	xe_exec_sync(gpu1->fd, exec_queue[0], verify_batch_addr,
> &sync[0], 1);
> +	if (READ_ONCE(*sync_addr[0]) !=3D EXEC_SYNC_VAL)
> +		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[0],
> EXEC_SYNC_VAL,
> +			       exec_queue[0], NSEC_PER_SEC * 10);
> +
> +	/* NOW CPU can read verify_result */
> +	final_value =3D READ_ONCE(*(uint32_t *)verify_result);
> +
> +	igt_info("GPU verification batch copied value: %u\n", final_value);
> +	igt_info("CPU direct read shows: %u\n", (unsigned int)*(uint64_t
> +*)addr);
> +
> +	/* Expected: 0 + (NUM_ITER * 2 GPUs) =3D 400 */
> +	igt_assert_f((final_value =3D=3D 2 * NUM_ITER),
> +		     "Expected %u value, got %u\n",
> +		     2 * NUM_ITER, final_value);
> +
> +	munmap((void *)verify_batch_addr, BATCH_SIZE(gpu1->fd));
> +	batch_fini(gpu1->fd, vm[0], verify_batch_bo, verify_batch_addr);
> +	free(verify_result);
> +
> +	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> +	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
> +	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
> +	free(data);
> +
> +	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
> +	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]); }
> +
>  static void
>  gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>  		       struct xe_svm_gpu_info *dst,
> @@ -1118,6 +1295,18 @@ gpu_fault_test_wrapper(struct xe_svm_gpu_info
> *src,
>  	pagefault_test_multigpu(src, dst, eci, flags);  }
>=20
> +static void
> +gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
> +			struct xe_svm_gpu_info *dst,
> +			struct drm_xe_engine_class_instance *eci,
> +			unsigned int flags)
> +{
> +	igt_assert(src);
> +	igt_assert(dst);
> +
> +	multigpu_access_test(src, dst, eci, flags); }
> +
>  static void
>  test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
>  	       struct drm_xe_engine_class_instance *eci, @@ -1133,6 +1322,8
> @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
>  		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_latency_test_wrapper, flags);
>  	if (flags & MULTIGPU_PFAULT_OP)
>  		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_fault_test_wrapper, flags);
> +	if (flags & MULTIGPU_CONC_ACCESS)
> +		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_simult_test_wrapper,
> +flags);
>  }
>=20
>  struct section {
> @@ -1168,6 +1359,8 @@ igt_main
>  		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP |
> MULTIGPU_PERF_REM_COPY },
>  		{ "pagefault-basic", MULTIGPU_PFAULT_OP },
>  		{ "pagefault-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_PFAULT_OP },
> +		{ "concurrent-access-basic", MULTIGPU_CONC_ACCESS },
> +		{ "concurrent-access-prefetch", MULTIGPU_PREFETCH |
> +MULTIGPU_CONC_ACCESS },
>  		{ NULL },
>  	};
>=20
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> --
> 2.48.1

