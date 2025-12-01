Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CEDD116F3
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 13:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC7710E3D8;
	Mon,  1 Dec 2025 13:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZ1cG33y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5D110E3D8
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764595095; x=1796131095;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=B9BBOcKEPhH/bL92+LQyBdmLbNlt6+JUaUHdWngO+go=;
 b=LZ1cG33yjW7WcG/uS1LfJPFKEx+7ihsq/kOiSsqr3WEf4dfk0mtYfzq0
 ppYZDlymURiYN2CRdW487e4Lqyts4Cj0d8BMnnOidH3c3kdqXrdOnLAUn
 +xelAnCHEEZ8oxPL5XOFWOzESpkkdjm87EvIangWY2+IutUCDTScCEQSt
 tEjAZ36EUZASYS16JuzGImfHw72rMPnB1mvkUX2ArzksePG69EQpgWXa/
 ZksfaIJFz6FIwmzam6to4Rnr6uvElMQ1vwkskTWkGVmZVutOzzfQ/r7uX
 q1MhRTGj30kVDk0Jtq4M9CpaRBrrIZUmm+6Sqv+XIe5211uRLQKFp6VO1 A==;
X-CSE-ConnectionGUID: 9skS39rgS3yU4RZyveKLTQ==
X-CSE-MsgGUID: ajEfxoyjQTGKfz+93aX70w==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="89183014"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="89183014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:18:15 -0800
X-CSE-ConnectionGUID: 9Q41L8G1TPyL3mgxeD5QLw==
X-CSE-MsgGUID: XkSU7Dk7TPy77kOh1vMTNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194272295"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:18:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:18:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 05:18:13 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:18:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWYdP1qhEH4nhC6gusb4f/0o23rKDcNhnUlvR/Go7K/Rvob8Rin2dv6bvl2tdbDrMDHgrfgNDtY4s4qeN/2nVqU8nIJSwWj6s+4ucziPC62p0vykxeBRtFJXyXE3f6V7yV8ER76ynDLlbIIxs6qrlQQOLV/Rgh4zkFXYXRRLI6nJFCx3q3CBH4mPnEbK4dVEmalH7ev4UkcDu5cWY+cuO8CXYBhGe9AjP7VFOZyMzPycGaF8HI/LcvKT/89jYXb6RWP8PUCozFb4lExeHB65+1eSNtnEO3lJPVt3npp8s8re2cWytoYY1skxJz3BTKmfaJ+t9xE3X4CMK2razYfxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DIF9cSmsUkRL4Yh0l8ah+k3dIiQBdJiWbhF5wstInU=;
 b=BhYOyG/jm3qGnd1C6sDs+pntGmm8s36syahoMZpi/MeT/G6fiK2+kLNq1HLSRjIOAGqDsVIvvQ89ubPY4UP4+U6iKB5dIxe1SmwDExro1TtNz8GuhlbqF4ACeOz0LB9o8qWQyxNWJSafr7j0Pb3i5KTSXwfOsK/HDDIrx2SpWHE91iUHvVgAaUHtx/O8+w+dcOSm1sgBJ4C/Af+jre7rs31R3/09SDuPU7aDK7nRtA+gH3Aji+3yjtQ4OqoQBtTm9RQod2++eemm8XzbBrWmpG7EzgSKXhnjpZu+VwjqNXJIprHOUmu4F3cJFXzauJQ3kmikiiXN73YkXcFKrAULpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:18:09 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:18:09 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v9 07/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU fault handling test
Thread-Topic: [PATCH i-g-t v9 07/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU fault handling test
Thread-Index: AQHcYqFuyMbfhkYYt0+7G0kBOxoVQLUMxITg
Date: Mon, 1 Dec 2025 13:18:09 +0000
Message-ID: <BL1PR11MB55259E076626F36BAFB465A384DBA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-8-nishit.sharma@intel.com>
In-Reply-To: <20251201090349.326673-8-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH8PR11MB8260:EE_
x-ms-office365-filtering-correlation-id: 8f8d4ad2-e43e-4d62-ad33-08de30dc1266
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MKYzdf8uxj3qjEnq9DNOg6O5mf8NvHeLauRu0Zk/7mFdUirIBYpKpAaa2Z4E?=
 =?us-ascii?Q?xn4A4fot31RdFNYMKJ6JDj5b1IsWd/LpRX1gw+iAhLkQhVMdKXCPLpWuJZwi?=
 =?us-ascii?Q?5SFR6zsfuQqZ5a6OcHrFx6QAX+v8bM6pSKuCBfiGi2/t4onFZDHpWeGrnIOd?=
 =?us-ascii?Q?eKbn5L6w/H52EMTdlOcPsv0c9tkElxLPCUGNe2FQn+Cu2qj1ALvBJ+RqJVDk?=
 =?us-ascii?Q?dght9D3cnlyTerTYBgPE9Jm91t+h+RUw+K5ttMyv371O4D1RTRctp5pu7cnt?=
 =?us-ascii?Q?Rj6mx+prhD56vy/z3qqt23Sxc8Hc2p9fVtlZks5QxlupQX0FSJ4EbOPJ5TQY?=
 =?us-ascii?Q?1blUzZXDzqldCjkoEruyXDrAsNKrgqWH+y2m4qyoaxtsh+nLV38+D8tZ1+sf?=
 =?us-ascii?Q?pLBbG5VmPsjyrWvm68YqDiariuCcbsVZlEoOvpNcqf+SwxKbu3HWylfZMVVT?=
 =?us-ascii?Q?XTV5tNTJw2X7clLY8eqWQUMZ2ikSi95lTdcix+0jeqtGDpmdKXPMhND0tQuf?=
 =?us-ascii?Q?pH6sVM+IASb5zRLRIuyjkqn9rtK0CTRvhDvUNsn3sCXD4OK0rNk8fYhle2/5?=
 =?us-ascii?Q?CtAFL3t/i6oe4tWj1i+DeEgApJFo+/fJuOLpYzd3BS0WlVpbmFLiMy2wV+N2?=
 =?us-ascii?Q?0p/YgDAm2j1Ot7l9Is2XrlTBS/aIX9PKux/DSPVmzMvUOBtVOtJnNZJON38n?=
 =?us-ascii?Q?jiw0UelLsQI/PPfaP7A1GD07AntI/7128uD/nqOYVxC9PtFUnbDRvhOhfeSe?=
 =?us-ascii?Q?B6jGIxb88iqyzvr7zGX/3aKHZ0SNA3q0DF66Tz0r2nQCRKci6fG4FBzwfATw?=
 =?us-ascii?Q?FvOPU7KuIOCNtTTWxeOE4uD1QVno49/jwgHiW8PKrikrbkZSabjM2q7hNbRQ?=
 =?us-ascii?Q?GW6UtHr47OSDwKGw+001vtfFj9i3EBjdfBiSB84cbh/U9m+nyvMdAYVcfGfY?=
 =?us-ascii?Q?lcgKkpzjPL9fivwLuuIsVuCo9Aggqr9reS7tS1/Z0xbVdd/Kd5xbsfxvv3Sw?=
 =?us-ascii?Q?yit7hf0g3/aeKL+ZtBTe+Ex9k9tgth5ZkYHebtQSJmId9Wu6LxxY1hkF9GRP?=
 =?us-ascii?Q?Yntr4bq+BidEJ7LYzowgX+zTIOj6CvJRkiPvBCyweDqrShtikTKnwE2P9tO5?=
 =?us-ascii?Q?pbMFBw4uS5DgSN1j6Me0EP3xcsAfRObk2AH4w8a26B2Oq5nimRhI8k/F/UnB?=
 =?us-ascii?Q?31w/QS1nEWx8dye9RoB8OMtXJU2qtdnMV7VdE4AK10TpU8pZZbocclOKRa0p?=
 =?us-ascii?Q?6V8f7slG9JPnnXhHRLA7PTLsZTHQBAXRWRbBIcOOpKKPrSXsf0wZUYcA8Hj6?=
 =?us-ascii?Q?f3Qd4OBpU6/WxLzaO5fHwDFbwouwRm2ZJDKleDdOQUM7Dz6KlMJoYmQapD0j?=
 =?us-ascii?Q?SphdPLKdfh0KRFBJwszI7GVCJzlGtGYOcLe169Q3wCp941KvmQhDkXevaA39?=
 =?us-ascii?Q?dutndp8M5x0+HlEWIRInB+4G++3HU1G9DwLOTwLnys9zP7B1/yay2Mp8Knge?=
 =?us-ascii?Q?2MFeHblAI7NyUPy3+8bFk0+82iVJMebcSjXx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CnTPSS4cGHiuKFLiSd1h/f4eUm9b+kDI3yB0ZGEDZpEry5e6LVm8nzxrtwNS?=
 =?us-ascii?Q?0rM926ltbqC8OSNECgompM4/ZpKhxa2sBga6nB3KuQ0r/uK3iBF2srwI5gt4?=
 =?us-ascii?Q?FM/7TolufYGqi7m2ugCgB3Wtz3MCyVFNgetwwgrp736Swi4HRBfHI00oB2wA?=
 =?us-ascii?Q?5MLAhqqnNe6MUFLX06pxBaHZWGspkrmXozyeKcKoNPigvZ1ULwGaz634BPO/?=
 =?us-ascii?Q?Gtt9WIVnoAtdOJcls1/9jAyROgn1ADGOwKSzcvmn2LiB9aLj58Dj7rQy4qxH?=
 =?us-ascii?Q?YdnqUUqDopH6u2HGw1tqmy0VKRcyPLclJFva67Lm5Rm/u/0m8oUvAqR9KwyZ?=
 =?us-ascii?Q?AB2QF+CKb4hGQBmqJ3xTXrIvYwuVX7LGJccq+LiGJRbrfWlGysdd7rHSqCZJ?=
 =?us-ascii?Q?esVDkn6M5iupvmacpnD/U5BVp0Qsvx8+oHu499j5BUQHIHMghywFFx312QNT?=
 =?us-ascii?Q?U0RvTAiGD+E0+6Lf/7QX8q1FcjcajA4/nHtXIxl0AfuPjd9u71v1op+FxfgZ?=
 =?us-ascii?Q?ykjp0Mti9clOVfsuYMYoM3x5GaGCo9fYZ8goYEjCG062e4hF44HIr7bGIdEy?=
 =?us-ascii?Q?xUqJL/BqWivb0WELJu5SEMJGJn0ayWJpzpbbKWiW7GPSkf4wVpyQF3Ec57PT?=
 =?us-ascii?Q?uPfAyVtGrpmrtxcy4rRwIMGQIo4kdNLKXQP9hV+Y77uhzcNA1I8cYjISWMZf?=
 =?us-ascii?Q?NUDz/u/6GlVq5Bg5a9Qk3F8ZKwNztXGv3s0msI9Kczqx8Gd+ErXGQgGd6O0L?=
 =?us-ascii?Q?QNlVqn6s5ifXNWxgj6LBlHAFiGh7tfl7uk4U6ztqrCQenRyv3CzdlSal6xMi?=
 =?us-ascii?Q?4r8pl7W3GOsUBVEWypkCaB8W5Puiwf+s19ktl9AWYPOk2a2FgEg2bvyI5ETi?=
 =?us-ascii?Q?kb5hXtvzIzQgcfaMn0dzhvtKq7DJIcY1O2JMoIv6MTF2DCzgDOTctsx39/EK?=
 =?us-ascii?Q?x3kmpDObDTtQWFlNnIf0b0QXF1kp5rYsMRABL40PKlyRlkHAz7Zb3xwbli/C?=
 =?us-ascii?Q?npuH1p52dMfCnroyUAR3fdjvDWcGIud+b9mtV5ts5GIGt1uo+oMjmtJOP1e7?=
 =?us-ascii?Q?hYkxQv2ZGhrfd4xQ5Om4Z0UZA+/yDegj7ZrzlKzbJZg0f0S7bmCqL1b2M8DJ?=
 =?us-ascii?Q?DbzUtHmFt7l/2/h6WgkY7RI0pixbw/okHkJNtLZ2WrxG0Nv6UicYFJRKHAGY?=
 =?us-ascii?Q?M9dOUXs3c6OwfxI80YNpsur2K5pRPueB84RDgNPYDPluI7kbxgd16D2YtNmN?=
 =?us-ascii?Q?M/8ZlyC1Qn1M9UPOr8ig04lrJbDwXQAuBJgdKsIg2RRNiOvPrUz/IPXAtkng?=
 =?us-ascii?Q?hdPpq11lxbMd/KqhBbzeibbR1ixsUr7CjF1n031cZLd6EefHzupC56dwGWQ5?=
 =?us-ascii?Q?qojiXycXe4RI1ampEYW3gWASaDR40JL5kiLC0b1JmT1eh6xyDRc4qaHRddag?=
 =?us-ascii?Q?KWvbkuLYR+4fBmC1Ez5fjSV2+TI87OyeT6HPjVHMMvSGf+/p0kEc/C5s16IF?=
 =?us-ascii?Q?txhxQlwC0SnbdDW2YeUUqlCsp2NqYwxAgklDqE7/ylscRrUEm5PLOKe5XXWK?=
 =?us-ascii?Q?P8W/yMDeyL58elPFuA20kE9wQjQtpmRK0GPsHTC6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8d4ad2-e43e-4d62-ad33-08de30dc1266
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:18:09.2620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6iHkGlw8Mdu42aVhg8cXDOcY94Jjd4hqe2NVMmecg7VVF8AZ79iyrHX9BxgOLuKHt2aFfA8jrnkXmtrucUIG1rhWwdilzqFtRJdEM3gqCO4=
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
> Subject: [PATCH i-g-t v9 07/10] tests/intel/xe_multi_gpusvm: Add SVM
> multi-GPU fault handling test
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This test intentionally triggers page faults by accessing regions without
> prefetch for both GPUs in a multi-GPU environment.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_gpusvm.c | 151
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 151 insertions(+)
>=20
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.=
c
> index efe3db099..7a06e289c 100644
> --- a/tests/intel/xe_multi_gpusvm.c
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -15,6 +15,7 @@
>=20
>  #include "time.h"
>=20
> +#include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
> @@ -86,6 +87,17 @@
>   *	Measure latency of cross-GPU memory copy operations with
> prefetch
>   *	to evaluate copy performance with memory migration to local VRAM
>   *
> + * SUBTEST: mgpu-pagefault-basic
> + * Description:
> + *	Test cross-GPU page fault handling where one GPU writes to
> memory
> + *	and another GPU reads, triggering page faults without prefetch to
> + *	validate on-demand page migration across GPUs
> + *
> + * SUBTEST: mgpu-pagefault-prefetch
> + * Description:
> + *	Test cross-GPU memory access with prefetch to verify page fault
> + *	suppression when memory is pre-migrated to target GPU's VRAM
> + *
>   */
>=20
>  #define MAX_XE_REGIONS	8
> @@ -105,6 +117,7 @@
>  #define MULTIGPU_COH_FAIL		BIT(5)
>  #define MULTIGPU_PERF_OP		BIT(6)
>  #define MULTIGPU_PERF_REM_COPY		BIT(7)
> +#define MULTIGPU_PFAULT_OP		BIT(8)
>=20
>  #define INIT	2
>  #define STORE	3
> @@ -162,6 +175,11 @@ static void gpu_latency_test_wrapper(struct
> xe_svm_gpu_info *src,
>  				     struct drm_xe_engine_class_instance *eci,
>  				     unsigned int flags);
>=20
> +static void gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
> +				   struct xe_svm_gpu_info *dst,
> +				   struct drm_xe_engine_class_instance *eci,
> +				   unsigned int flags);
> +
>  static void
>  create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
> drm_xe_engine_class_instance *eci,
>  		    uint32_t *vm, uint32_t *exec_queue) @@ -923,6 +941,123
> @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
>  	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);  }
>=20
> +static void
> +pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
> +			struct xe_svm_gpu_info *gpu2,
> +			struct drm_xe_engine_class_instance *eci,
> +			unsigned int flags)
> +{
> +	uint64_t addr;
> +	uint64_t addr1;
> +	uint32_t vm[2];
> +	uint32_t exec_queue[2];
> +	uint32_t batch_bo[2];
> +	uint64_t batch_addr[2];
> +	struct drm_xe_sync sync =3D {};
> +	uint64_t *sync_addr;
> +	uint32_t final_result;
> +	void *data, *verify_result;
> +	const char *pf_count_stat =3D "svm_pagefault_count";
> +	int pf_count_gpu1_before, pf_count_gpu1_after;
> +	int pf_count_gpu2_before, pf_count_gpu2_after;
> +	bool prefetch_req =3D flags & MULTIGPU_PREFETCH;
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
> +	memset(data, 0, SZ_4K);
> +	addr =3D to_user_pointer(data);
> +
> +	/* Allocate verification buffer for GPU2 to copy into */
> +	verify_result =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(verify_result);
> +	addr1 =3D to_user_pointer(verify_result);
> +
> +	/* =3D=3D=3D Phase 1: GPU1 writes to addr =3D=3D=3D */
> +	pf_count_gpu1_before =3D xe_gt_stats_get_count(gpu1->fd, eci-
> >gt_id,
> +pf_count_stat);
> +
> +	/* GPU1 --> Creating batch with value and executing STORE op */
> +	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
> +			 &batch_bo[0], &batch_addr[0], flags, DWORD);
> +
> +	/*GPU1: Madvise and Prefetch Ops */
> +	gpu_madvise_sync(gpu1, vm[0], exec_queue[0], addr,
> &batch_addr[0],
> +flags);
> +
> +	pf_count_gpu1_after =3D xe_gt_stats_get_count(gpu1->fd, eci->gt_id,
> +pf_count_stat);
> +
> +	if (prefetch_req) {
> +		/* With prefetch: expect NO page faults */
> +		igt_assert_eq(pf_count_gpu1_after,
> pf_count_gpu1_before);
> +		igt_info("GPU1 write with prefetch: No page faults (as
> expected)\n");
> +	} else {
> +		/* Without prefetch: expect page faults */
> +		igt_warn_on_f(pf_count_gpu1_after >
> pf_count_gpu1_before,
> +			      "%d page faults generated on GPU1\n",
> +			      pf_count_gpu1_after - pf_count_gpu1_before);
> +		igt_info("GPU1 write without prefetch: %d page faults\n",
> +			 pf_count_gpu1_after - pf_count_gpu1_before);
> +	}
> +
> +	final_result =3D READ_ONCE(*(uint32_t *)addr);
> +	igt_debug("GPU1 wrote :%u\n", final_result);
> +
> +	/* =3D=3D=3D Phase 2: GPU2 reads from addr (cross-GPU access) =3D=3D=3D=
 */
> +	pf_count_gpu2_before =3D xe_gt_stats_get_count(gpu2->fd, eci-
> >gt_id,
> +pf_count_stat);
> +
> +	/* GPU2 --> Create batch for GPU2 to copy from addr (GPU1's
> memory) to verify_result */
> +	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, addr1,
> +			 &batch_bo[1], &batch_addr[1], flags, INIT);
> +
> +	/* Prefetch src buffer (addr) to avoid page faults */
> +	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu2->fd, 0, gpu2->vram_regions[0],
> exec_queue[1]);
> +
> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
> +	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync,
> +			     sync_addr, exec_queue[1], flags);
> +
> +	free(sync_addr);
> +
> +	/*GPU2: Madvise and Prefetch Ops */
> +	gpu_madvise_sync(gpu2, vm[1], exec_queue[1], addr1,
> &batch_addr[1],
> +flags);
> +
> +	pf_count_gpu2_after =3D xe_gt_stats_get_count(gpu2->fd, eci->gt_id,
> +pf_count_stat);
> +
> +	if (prefetch_req) {
> +		/* With prefetch: expect NO page faults on GPU2 */
> +		igt_assert_eq(pf_count_gpu2_after,
> pf_count_gpu2_before);
> +		igt_info("GPU2 cross-GPU read with prefetch: No page faults
> (as expected)\n");
> +	} else {
> +		/* Without prefetch: expect cross-GPU page faults */
> +		igt_warn_on_f(pf_count_gpu2_after >
> pf_count_gpu2_before,
> +			      "%d page faults generated on GPU2\n",
> +			      pf_count_gpu2_after - pf_count_gpu2_before);
> +		igt_info("GPU2 cross-GPU read without prefetch: %d page
> faults\n",
> +			 pf_count_gpu2_after - pf_count_gpu2_before);
> +	}
> +
> +	/* NOW CPU can safely read verify_result (not addr!) */
> +	final_result =3D READ_ONCE(*(uint32_t *)addr1);
> +	igt_assert_eq(final_result, BATCH_VALUE);
> +
> +	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> +	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
> +	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[0]);
> +	free(data);
> +	free(verify_result);
> +
> +	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
> +	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]); }
> +
>  static void
>  gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>  		       struct xe_svm_gpu_info *dst,
> @@ -971,6 +1106,18 @@ gpu_latency_test_wrapper(struct
> xe_svm_gpu_info *src,
>  	latency_test_multigpu(src, dst, eci, flags);  }
>=20
> +static void
> +gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
> +		       struct xe_svm_gpu_info *dst,
> +		       struct drm_xe_engine_class_instance *eci,
> +		       unsigned int flags)
> +{
> +	igt_assert(src);
> +	igt_assert(dst);
> +
> +	pagefault_test_multigpu(src, dst, eci, flags); }
> +
>  static void
>  test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
>  	       struct drm_xe_engine_class_instance *eci, @@ -984,6 +1131,8
> @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
>  		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_coherecy_test_wrapper, flags);
>  	if (flags & MULTIGPU_PERF_OP)
>  		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_latency_test_wrapper, flags);
> +	if (flags & MULTIGPU_PFAULT_OP)
> +		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_fault_test_wrapper, flags);
>  }
>=20
>  struct section {
> @@ -1017,6 +1166,8 @@ igt_main
>  		{ "latency-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_PERF_OP },
>  		{ "latency-copy-prefetch",
>  		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP |
> MULTIGPU_PERF_REM_COPY },
> +		{ "pagefault-basic", MULTIGPU_PFAULT_OP },
> +		{ "pagefault-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_PFAULT_OP },
>  		{ NULL },
>  	};
>=20
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> --
> 2.48.1

