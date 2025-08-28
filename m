Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BD6C8303F
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 14:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDABE10E12B;
	Thu, 28 Aug 2025 14:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiJLSBzO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B31D10E12B
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756392973; x=1787928973;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wSdJ7HYA9IMivXrFTF7lrmTkiLm4rOe0k31ztOQP/Ys=;
 b=UiJLSBzOwmj8PIkkedwhjuP99lAVM1uL68czRNw6+SaDZz3x/ZrP05pj
 YSUURJOMrBDmbJ/Uai6bEqFwa2CPRU7TsC4RLekwlhuuyowOVwUcOeZew
 xAjUDDfyGo9BR8yE6MFseVYLBSV8U7Lwfw5X+L4oTHnkrXKeVwrz1OoVJ
 PqWeDDGODy9tDIXN9I1bMMbw8MBG0j9Jr/XYMflUNAEk2jHlRZGewC2vr
 ZzFGGJEBy9lJJCfE/upwNXB7UxRMCqgoKS71GwalOVixGXuxP2t+K39RT
 MPTcOUEDByOPJXqIgVg6WRqvXn1//ao4fN+IbFj3EZpVseKao4/6F12mt Q==;
X-CSE-ConnectionGUID: AtQlVTBLSO6klJaXEJENlg==
X-CSE-MsgGUID: 6FA+S2HWS7WUgHKJvmZUrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76114761"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="76114761"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:56:12 -0700
X-CSE-ConnectionGUID: WSPbc3WpSsyU6/h9itfJ5g==
X-CSE-MsgGUID: o9KjJdcVRd2vCF4tu2ed/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="175420670"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:56:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 07:56:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 07:56:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.52)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 07:56:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlUIOmqq3JdQ3vJcnEUwqgW9zqxe4FrBVXiovGBXYewJ52DRiuVbG80+FNTzHCo4cOHQRO9Qk9C35U4cx1ohdkDMjdctWmQfnOahv28w0tZdl8zYjHYEm4fhmam+tjRygQYSY6dEqI4cJn6Bpju9RT3tgWIVreioY7ghsBQnAuqQ6UYjO/LlzLFkuC41yzezi0cY9X/w49zAOdbkytWvtIYtX11Eq6TzFIY6rULCZ4bYR1/6rPNaKz3O1q0RUwS412iXdlQAq6txBHQiC1GnquH/DH00w+Z3cCcP0jg/fXFw9bPUrvQSI9DIyGJKpN62siIjzAYo4lfAf/25ev5nXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpXxIJCSxuV+ntcKBOmW6uZ9Jp5I/qfniQRChVZs8D0=;
 b=JDFnGI5Kv9wY/HP5KJjX3v0kunLbWvBFqT5dIezObAR2w9vgJDFhZHO2m2RtkOMfUYSi9yXSLzOqDPXLAplBDCWFDZ0T0+ycMjE9wIq9WIRnBkmXD76cxYD0mfs6VtIJJpGxZ3MZxBXZE1rZ3zzmzclZSxmammFz0jbG+3sl4r5sseGQ1btja9IFh7Y7Ok81bmlUZFKU0jiDZsQWwtPVxNdZEi++3371yd/8uwxFeRClyLIw2fAkRpV3wdWjAt8CU3kznFtRARiVL2v4MLhpk0fY4HFfTNU4yloV/cVu/Kem8nDVfTJNfhfbIf2Q3pVnjWYh4uEcmaCEqvBr9XqLrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by IA3PR11MB9351.namprd11.prod.outlook.com (2603:10b6:208:57c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 14:56:05 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 14:56:05 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Sharma, Nishit" <nishit.sharma@intel.com>
CC: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH i-g-t 3/5] lib/xe: Helper added to get memory attributes
Thread-Topic: [PATCH i-g-t 3/5] lib/xe: Helper added to get memory attributes
Thread-Index: AQHcFmVJ8ewtPMFus0qsgxPsvqyKPrR4Kj7w
Date: Thu, 28 Aug 2025 14:56:05 +0000
Message-ID: <BL1PR11MB55258EFEA827191254FE2D3C843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250826084133.897768-1-nishit.sharma@intel.com>
 <20250826084133.897768-4-nishit.sharma@intel.com>
In-Reply-To: <20250826084133.897768-4-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|IA3PR11MB9351:EE_
x-ms-office365-filtering-correlation-id: 5b0772a0-8f93-43c3-35f8-08dde6430368
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KIMiLAJM6p6o4rAwgN79Nh3BUtqOsSGz7RZ2vk3tIHAN9WjzcayW2dWOVW9G?=
 =?us-ascii?Q?7K81WzEAL4e6mE+f+CEf2ZnFLRI79g1VT67exTJMcgNkaJrsobQhbGJPOLJi?=
 =?us-ascii?Q?IkPT8CB4X86moN8UBtxwPGC+QuVLBN6AbYivihol2JtE3J7MSMgj6bqEaw+M?=
 =?us-ascii?Q?MXyOa0O23fyH4Pqc2sLVMKPC+r6bbybjOjXNJpVvwB+pFZI1C4fwEqCqnwor?=
 =?us-ascii?Q?cOFoolarDsbZ9JLZa9Tq1zKnCzm0u2UzT2g+vMzGjN+4mTZ9TOWr+yLb/xV7?=
 =?us-ascii?Q?fhQbiR4+zJzDrXka0FdWJnYWJWA7JrU48hced0nuVbso9vqWGmjpNeNHAY0+?=
 =?us-ascii?Q?A09/HQPQRSnHWytFv3Mi4orwHRLONcvEAkwtsaV9Y2FJVsjeBj7/Or+p6Voa?=
 =?us-ascii?Q?L+Tn8VLv3ckc8eW9ryWpCDpTX9Y3ZfF3ZdSZnQkwU/0UqsodrMNDBD3xyRo8?=
 =?us-ascii?Q?W7sLI41XjxnNObHWUJBe1WkTlmbTO/d0UTrmv4+UMxKwR4ppefLXENJww106?=
 =?us-ascii?Q?ILqCdSx9J0w5ZAT19e2vLbB9GOUbFtpwOHSpvAHDUIddr+CuxMhb6vUX/t1R?=
 =?us-ascii?Q?EHTbL7Xlsm4V2M7NlQYJoFqdGD4BsAyRxZZR4uuknrew5TG4d2a8RtdZe1hb?=
 =?us-ascii?Q?jlY5QEjRz6p0eLxiYWeVFXPp6aDhOD43C2iMfhhw1NgG6a9WT1skpEU85obJ?=
 =?us-ascii?Q?8INQ2rJwdodVLKSCG7YZCu7puTx9WBjzxsbl6Qm//aE4JyZ2smT4xI4HW31A?=
 =?us-ascii?Q?R9Dhh43KO7QV8t8DLwouH3sdOtGrWEpgyyvGJGHmNbjtqVBO/KotkPEr5BbR?=
 =?us-ascii?Q?ldM3EQzIpneFJ3PN03Oqwqg07GQghApVnB0Fjp5WJNLHICpTB+vefDCJA1Db?=
 =?us-ascii?Q?5gGq1J1Pw8kZFVU9iqUEiW7bg8cZB3+/GEi8ACmo6lm8Z6XuBwHQ3IPBGwVc?=
 =?us-ascii?Q?GdISv3x4Lm32xs1FaAT4GUaO/qshGA7BDxZAqGUWBOsVK+f42Za4ffln7Ccq?=
 =?us-ascii?Q?rNigvh86KT6//N7ZCQNZfbSVmT9FxY4t0n/Ci9bp/1fE+aPmaD2iRdSyzn3n?=
 =?us-ascii?Q?FY9NbgK2o5oskkzZ2DEEklfabmfJoXPF0qVNQzroGdeT6YESbum+oo6wiLfF?=
 =?us-ascii?Q?N+zVBdXr08H+SkGvqEVt23XuZv7QbLu0tG61J8DqSAuaSaartSGMVxImc1Z+?=
 =?us-ascii?Q?YpA4HYW2kP5i2qCDn5jeSOucHQxmvzoGfERRXPf9n7oQqjEoITwRXlQp15hS?=
 =?us-ascii?Q?BthbUUtH/GT7sDRuKnf9yuzI/LJEcDeyWcCLZQB65Hje2MQP9ijkZZEeqLz/?=
 =?us-ascii?Q?Wo8S1NiA1C/p/qN9FGkYf6bZKReazPHc22xZ42VAMa34szYZoEYTuBeHyx/Z?=
 =?us-ascii?Q?HtydWPuYXKvIwpatdxiYcCfuOcndqNE9lTXfC56JF0HYvv5bdy3lhh/4QJ9l?=
 =?us-ascii?Q?+t6S/ruF6Vy/nls/wlhVewnTEGEtBWBgcFf6jbBM+DmvuS4wE8sXwFm5Re2Q?=
 =?us-ascii?Q?OoiFefogKeEQE+Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sSIaKVVexzCT0Eug4XPrHptHW92ve5gAucal/NtdBu5lLnzEIZLLlz365KFV?=
 =?us-ascii?Q?bkvZpHNrensOKkL8z8CkDNTFPufoYyJsC24Q6LPmTBqKswWyclxHFL4+WWUS?=
 =?us-ascii?Q?yMz/zEfd3Tvcqjq0p92eDVH8eAUjv3BywUeO54CLQ7qgKvca5Xn9JtagNs9K?=
 =?us-ascii?Q?JZitC12AhSrw6YhDnZkVvQrv24YL0zoEfo6HQ/id51p/F4zTqDOnMdyc1L4B?=
 =?us-ascii?Q?fNda4VU5mJoLXylxjI6gwmX2HFfmkrLbWpRJiCWUz3DcCZsQA6nPdP8uOrbi?=
 =?us-ascii?Q?/0gcoE5vPDAPNi1dpFNb2/3IkCBDwavAyPOlB4L+tP7f1eO35RM8W7cNBUp3?=
 =?us-ascii?Q?ibZbgot59HMV1gEN8Z2csQOMSZkDQoOhfS+OZRudaGmn27MwOVpBPWaiPmV2?=
 =?us-ascii?Q?LtTkprBfOKW/hTimmwKxwRfXBEzZfCvgKJoeZe6IYsRosyOJki5rqPWeMDjM?=
 =?us-ascii?Q?CgzppDEdPRIiAoHePBLWvfeMvy7R9ijdH/UxzrvT7SYqRfre7Ho9axzd83AF?=
 =?us-ascii?Q?+5u3X6MAVYXMnvV/RTqEDZ52e/ZlthCam7b8SGKtLlpazUkvP4bwRb74f+mv?=
 =?us-ascii?Q?F6XK+REO7IWfRMiFD/2nKlKmYvHkGBsNZewA0E1KT4UBQRPoSiq2/UOQE3l6?=
 =?us-ascii?Q?fE9FH6CaLfBQzKUuMBJGojCLD+QIW6BTNPJz7dO2f60Cm52OkdSLGyxzBUdV?=
 =?us-ascii?Q?ERDr07d4Yi6WxAXS1Z2dB6xv+G4LUofmPhsoN6UH7NryiCLhOc7iHDC0pOQ8?=
 =?us-ascii?Q?Hdabg5uICD/qdDxIhXEJBkPQzhvuXaryeSoJhzgfdHNEQehk9YfM1mYpC07B?=
 =?us-ascii?Q?F1B+vi7cbDcyl+kmr6GF0MD/IzyRxFTrZjVhx5oxq8nsNw1YDSMEPdH4dVkc?=
 =?us-ascii?Q?KDxV9zb1CpoiRQoLEzDU3ewB0xZ/Xp/PckZnI8GViDrNwEi63FQOL4JJD4TU?=
 =?us-ascii?Q?0OsD3UyWBOFM+msS4Z2Ihbnn4Q87NG140agVh2kKAk3DRMa2kWptJUo0l1Te?=
 =?us-ascii?Q?+Pj5N96NJ+o4INy2JL/XrPiOUeDFFBzvqjfjiwbFfrr9Wb8zyaKMOWv0Bc1x?=
 =?us-ascii?Q?0TzIIOo/zBmWlAXS/oPUFMC4mnLsEH4IjNkWwUIQg37mGrmGIgEVQYPc9MMR?=
 =?us-ascii?Q?zjCFOSyu37+FbnZVuh5nbS6qQ530spu9lPPAbacbRm6CYZRtpW0TLOzsi2TY?=
 =?us-ascii?Q?slqAVe5dBLXULoQmpxfNNHyqX0PS7ngWLyR4+NsLPc4xxhXTk6AO5ZXEy+cm?=
 =?us-ascii?Q?KQT6N3bEgB632BRA1EwkdS6sGPV8IqZ4FoL6QclZKqDdweu+67uy+4KE/8Lh?=
 =?us-ascii?Q?O/u5UNqlWa6NdzWhy3ghRXhSYGbeQZKBfTQlkjmp5toeOAS3gD+trgfrkGeZ?=
 =?us-ascii?Q?jyiYmypTmUy8dpZeo0NdH0+XNWoTvMV6CILFlb7VOCZg9lYbxtS3M0XSLCDO?=
 =?us-ascii?Q?MYRDCTo9xsXLievds41y+SYdRrZMrKNO1AhGJpP++I6ysqhuINSSl8qErnSs?=
 =?us-ascii?Q?1ta+XbJrGq7i7qZYkRd9f03tBdnq0PJN1tAyDubN+xD56Pg/Bpxa1nrBR6hV?=
 =?us-ascii?Q?HSQtrQfhpRK2dP87G80598OicNKwe8idBSpoyoTs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0772a0-8f93-43c3-35f8-08dde6430368
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 14:56:05.0263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qNeXqQqIuN32dBekvnZrBXOuEJ7yhX9e8Ji9W/GexCTxflYilNsYGIvzXdDrkmSpR+FRNfFH/vzIRe6Xcm1JditAqwas9ZhvZsjbgtsSTfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9351
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
> nishit.sharma@intel.com
> Sent: Tuesday, August 26, 2025 2:12 PM
> To: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t 3/5] lib/xe: Helper added to get memory attributes
>=20
commit title can be " lib/xe/ioctl: Introduce xe_vm_print_mem_attr_values_i=
n_range() helper"
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> xe_vm_print_mem_attr_values_in_range() function added which calls
> QUERY_MEM_RANGES_ATTRS ioctl to get different memory attributes from
> KMD and then prints memory attributes returned by KMD for different
> access policies like atomic access, preferred loc and pat index.
>=20

Same here please use add=20

--  Pravalika
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 92
> +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  4 +++
>  2 files changed, 96 insertions(+)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index 43bad8452..4ab2e=
f39c
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -57,6 +57,98 @@ uint64_t xe_bb_size(int fd, uint64_t reqsize)
>  	             xe_get_default_alignment(fd));  }
>=20
> +int xe_vm_number_vmas_in_range(int fd, struct
> +drm_xe_vm_query_mem_range_attr *vmas_attr) {
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS,
> vmas_attr))
> +		return -errno;
> +	return 0;
> +}
> +
> +int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr
> *vmas_attr,
> +		    struct drm_xe_mem_range_attr *mem_attr) {
> +	if (!mem_attr)
> +		return -EINVAL;
> +
> +	vmas_attr->vector_of_mem_attr =3D (uintptr_t)mem_attr;
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS,
> vmas_attr))
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_print_mem_attr_values_in_range:
> + * @fd: xe device fd
> + * @vm: vm_id of the virtual range
> + * @start: start of the virtual address range
> + * @range: size of the virtual address range
> + *
> + * Calls QUERY_MEM_RANGES_ATTRS ioctl to get memory attributes for
> +different
> + * memory ranges from KMD. prints memory attributes as returned by KMD
> +for
> + * atomic, prefrred loc and pat index types.
> + *
> + * Returns 0 for success or error for failure  */
> +
> +int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t
> +start, uint64_t range) {
> +
> +	void *ptr_start, *ptr;
> +	int err;
> +	struct drm_xe_vm_query_mem_range_attr query =3D {
> +		.vm_id =3D vm,
> +		.start =3D start,
> +		.range =3D range,
> +		.num_mem_ranges =3D 0,
> +		.sizeof_mem_range_attr =3D 0,
> +		.vector_of_mem_attr =3D (uintptr_t)NULL,
> +	};
> +
> +	igt_debug("mem_attr_values_in_range called start =3D %"PRIu64"\n
> range =3D %"PRIu64"\n",
> +		  start, range);
> +
> +	err  =3D xe_vm_number_vmas_in_range(fd, &query);
> +	if (err || !query.num_mem_ranges ||
> !query.sizeof_mem_range_attr) {
> +		igt_warn("ioctl failed for
> xe_vm_number_vmas_in_range\n");
> +		igt_debug("vmas_in_range err =3D %d
> query.num_mem_ranges =3D %u query.sizeof_mem_range_attr=3D%lld\n",
> +			 err, query.num_mem_ranges,
> query.sizeof_mem_range_attr);
> +		return err;
> +	}
> +
> +	/* Allocate buffer for the memory region attributes */
> +	ptr =3D malloc(query.num_mem_ranges *
> query.sizeof_mem_range_attr);
> +	ptr_start =3D ptr;
> +
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	err =3D xe_vm_vma_attrs(fd, &query, ptr);
> +	if (err) {
> +		igt_warn("ioctl failed for vma_attrs err =3D %d\n", err);
> +		return err;
> +	}
> +
> +	/* Iterate over the returned memory region attributes */
> +	for (unsigned int i =3D 0; i < query.num_mem_ranges; ++i) {
> +		struct drm_xe_mem_range_attr *mem_attrs =3D (struct
> +drm_xe_mem_range_attr *)ptr;
> +
> +		igt_info("vma_id =3D %d\nvma_start =3D 0x%016llx\nvma_end =3D
> 0x%016llx\n"
> +				"vma:atomic =3D %d\nvma:pat_index =3D
> %d\nvma:preferred_loc_region =3D %d\n"
> +				"vma:preferred_loc_devmem_fd =3D
> %d\n\n\n", i, mem_attrs->start,
> +				mem_attrs->end,
> +				mem_attrs->atomic.val, mem_attrs-
> >pat_index.val,
> +				mem_attrs-
> >preferred_mem_loc.migration_policy,
> +				mem_attrs-
> >preferred_mem_loc.devmem_fd);
> +
> +		ptr +=3D query.sizeof_mem_range_attr;
> +	}
> +
> +	free(ptr_start);
> +	return 0;
> +}
> +
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)  {
>  	struct drm_xe_vm_create create =3D {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index a5996cf65..ae16a=
f233
> 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -103,4 +103,8 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t
> addr, uint64_t range, uint64_t
>  		    uint32_t type, uint32_t op_val, uint16_t policy);  int
> xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_=
t
> ext,
>  		  uint32_t type, uint32_t op_val, uint16_t policy);
> +int xe_vm_number_vmas_in_range(int fd, struct
> +drm_xe_vm_query_mem_range_attr *vmas_attr); int
> xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr
> *vmas_attr,
> +		    struct drm_xe_mem_range_attr *mem_attr); int
> +xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t
> +start, uint64_t range);
>  #endif /* XE_IOCTL_H */
> --
> 2.43.0

