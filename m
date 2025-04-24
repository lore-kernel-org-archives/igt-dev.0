Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77F5C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 22:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CEE10E00B;
	Thu, 24 Apr 2025 22:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJf20xrW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD0910E00B
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 22:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745533967; x=1777069967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3yII4G/7wRt5HLSc6wsvpaSbklrWqSlAvG4VEJIUGOA=;
 b=cJf20xrWZfj40Qu/NdgVb1pLa4A+FwW+3NVjEBZOsDd7GP+ImHVDG4pK
 3py/ReERwtk1d9vIqr+mfUXqJ5BK43cUxyczNolzNMCAGRrXU4MwfyWcD
 NRBSXWbRHV2y6w2uTJSruKR7XX4/02/EdA4QG9Y2FzuIoZXy1VGoV1/wn
 EnpzZtojl+GqWk9cQJKENL9qhkGSDVZ4ynrnNX46Meo4ZTTDBhLRRf+fV
 Yz9gGYmtf/3+oPK71Iz6YATMJOMTDAAb525D458AZGT+6z3gs6x/YoADb
 DmWdlJ/Y2E7lVaUyFZZBVmn0JeY5K2RmIzgpmBTtOaSd32gGvYfoLRqD8 Q==;
X-CSE-ConnectionGUID: fe9FlS1XQ3ayaL1tsa0XoQ==
X-CSE-MsgGUID: OMC61JOwQlqmabRGtbiKbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47282030"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="47282030"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 15:32:47 -0700
X-CSE-ConnectionGUID: yjmTrVmUSvCjNkQ24PEVKQ==
X-CSE-MsgGUID: JLkUjdu6TD+2SvkP++CY5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="137732758"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 15:32:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 15:32:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 15:32:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 15:32:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAbnX7vCr8fvkats4/nEQD66cJoiyOVqs5Cxk7sGaeYqR4i/VRNPqDwnOLTUMSDjLNsTrArcqfwgFJB+VbH7lboY0wlob63x9oMX4vO7uyLaXielzWgLiVelzZi+f3fxlBVfnSfrD/C5ItX50kFBLxXOqPF5mUJZ4gM9UpI92GybsresyuUIvD8bi00pr05tGVE9pU4OikNjVsTIrKSMpGx5FAC3VJJmhsJ4XM9OTFoeuFqqPdvKanaBMru5lfGColKqacAgzO5CZYcXuJB5159sW78pMJsTIi8qvX+hlIwNXncEstTeeg8yyVZVsp2XVRoN1XWMSr3k6fuf8Yk6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb2UQSuOhK76HjO8GKLg0+kHbgajO3wgwsXCdTcGKP8=;
 b=U55pnf8OMF2lDXf4YG+Qwvwobw/tHyb+WnhdQ9MECneQ65QsVwJr0DzNm/xCp3TSjbAkxWydFQr79YGBGVWLndb8j7dAm8wnhB5RiH3MHDi5yCduy2g6qkkttTnfdOvP8Umbkyx0cmQWKv0BCX93APF9X4p0Xe9NxPUjoPuTanuszFptdQRsOLm74w6PMAjY6bVtEwReYUo9j4y1RZoLX1s79Z7ho8lkF50otwULv34eU7hv3jegJJdVT0g9y500VuZ7hrDCLPxmSRcUiQNBLW4ZOPiDWqPxbOsZ4oqvEujiXqyoIribxh88n4fNEK59RGIaJWX8SDafAMR/oTaaaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 22:32:02 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 22:32:02 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 1/2] uapi/xe: Sync latest uAPI KMD headers
Thread-Topic: [PATCH v3 1/2] uapi/xe: Sync latest uAPI KMD headers
Thread-Index: AQHbtVl85YfFX+bPaUmAl4aD2fltebOzTrQg
Date: Thu, 24 Apr 2025 22:32:01 +0000
Message-ID: <CH0PR11MB54447704A919315D078C6C2EE5852@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250424204406.656794-1-matthew.brost@intel.com>
 <20250424204406.656794-2-matthew.brost@intel.com>
In-Reply-To: <20250424204406.656794-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4574:EE_
x-ms-office365-filtering-correlation-id: ab10eaed-d25f-4415-48f2-08dd837fd55a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1svimw6/Zq8s+SDiS7LlUGOSlVn9FDozwGAmPGwebA2h0NvRhLbMDbsttbDK?=
 =?us-ascii?Q?ZfIw5xlJfc4vhuDpVCAjc/YmlZ76+5iAc0qpBCWUeSMlI1IoVsVWe6Ug8Jdi?=
 =?us-ascii?Q?sPIsp/0U35pGdLXVmoNjZo8IsG4GcJYVVJhMYV6jvUqvmhSkYdoQrCH57BeW?=
 =?us-ascii?Q?7QstZc0goJf0fwqqgyTquq6wvsycmbM5yFsVAIlxsN2tvntZCdnJA7pgmgK4?=
 =?us-ascii?Q?NJhlWT0AIRDHNVu6YZdpiAwz/e1M0IpC9UuzDYiCeTA7jo3eawYOwT8R5PrT?=
 =?us-ascii?Q?Vbe8MlxI7wYwoZtFlJIGaVznbnWirgMQH7IgMbSODQ13q13y6OE849ZOKpVi?=
 =?us-ascii?Q?9jkEz//4sx3KAxJuUjXyDtP4pRSMw3DUU40DITWdoqqa92pnAFHoe4svD0C/?=
 =?us-ascii?Q?SDBbMIAVSM31lunPeYuDhG0pleEbpMkV4Amw60LkBILkeqbMH+mi6Q/EZ2Kz?=
 =?us-ascii?Q?yRcTdEuL5qLdAP6pElbnP+ACTjQP0P6FRDizilspwkeeOgBjVtJJzjn+Ixkj?=
 =?us-ascii?Q?HsB+eQNR2+c7FvvNlKqwNvQslqGYY++chBOtVoWHjOlOA34veN1jBG19rm+m?=
 =?us-ascii?Q?X1usYcv1bu5qQZCwlRRTCMILb6vMVAx9LHxIDpMZRhGUYatkdvsErLh39AVU?=
 =?us-ascii?Q?VWL7CKpq3X095e9uNFa1ighbzuOQLTdxexhN2uzWQFBIeKF6pfEbPEfhPy+j?=
 =?us-ascii?Q?NLGsWs4VUCpIOL3t4p9gdIUce+Gufoo46/wxIyifGmrq5Zepy48JdJY3NJM/?=
 =?us-ascii?Q?ERKzR6Ld4J/F7Ah3qQmpV++mEk0OaqEE7iPXCw3oyhscpclFF9Iw695s/Guk?=
 =?us-ascii?Q?sUUDodahP1bW21dKddjPAoytFMOjmD3uR3R8uD+2R/eLmtf3FyDdHGpfnAvn?=
 =?us-ascii?Q?IaoxaBWiLGcv5cqDeU/H42n6K5Kb10rTOHhWnm39KyS7djyxZSL+gAAQ/YEw?=
 =?us-ascii?Q?6HxGsKTG0f+2TG+JgCm9zsKgp9bB5UFwrcJGfhorw/pIerTLZsuBnbZQXZke?=
 =?us-ascii?Q?V2SjGYHCCQGioWuWGutPIZPVtZN6R46cjrD6IHlYRR/ryIMK7zV9TXz/wm4v?=
 =?us-ascii?Q?CAD3q3BMy8soLjS+2gFvmivVnnljHN7V2bSiYXyMPlgdf8BuJAlEZcGrF/ya?=
 =?us-ascii?Q?gY243CQlnT+7Fe+HJg10DhHsbizCG1uMUyv08WY9JSSJI1eAV698dliYSV1n?=
 =?us-ascii?Q?GgM/4YBQXyZ44XnOQB3iGqSDlWWV0Ld9qbUc2VyYrLA0YDK5NxsEzQWwh/vn?=
 =?us-ascii?Q?FXgs3DkL/691BHtgwNjplz7nH6+NWkX8284mx6NnvRYO/87gUL2r6EYhB8wM?=
 =?us-ascii?Q?rD3/TeL/FWPeI1lxoAbtBNMv2MLGrQ4hvu13ISybncsHTjLGWODslae5Zv2F?=
 =?us-ascii?Q?oPU1odRjs+3x7ATMMn5gqiwJloYYh+5H3LGpr7DGreGhggFXfP62auh8ciRw?=
 =?us-ascii?Q?5/tgAgzXFLuvAbdYK0AhL4Y2qBPNF+P9iea32W7BNmReBQSw8ZVkxdYeo963?=
 =?us-ascii?Q?0QRbTqyOpkY5EKI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EpjTG6MT9hKMWUMtzkNef60cD+uo2ulie8UXb+qrBuo1pievtgBtq2+0Ffad?=
 =?us-ascii?Q?sCFHHpM/2jI5OnfBXCaHZstZJwjEPA4Kj0WqLx353P88ura65CvGu7Sgzapo?=
 =?us-ascii?Q?5u1MwcRHEYHjDOz1Rt5kxO1ER86512aDKebmjMMIjgVumeziJOli1AJ/hMlA?=
 =?us-ascii?Q?PwiWJPMkfqwcs31kRy39P13NDFb6oOE04sJOxui5qH6JdkEUoyh+8KE3lyRD?=
 =?us-ascii?Q?P3Smn23YlC5Xj3dn8i0chaDmV5f7UqE0J+zc5CUA8c5I6wEwzpwlExwn6S8h?=
 =?us-ascii?Q?szjJ3+HUVnopoKAJeH+bntLSXLKHnZxfaWOID5nP+aDIsfs1zu76F4W2QJA/?=
 =?us-ascii?Q?CXNBg84tcXONHpWSwD4LjcRj7DgINB3u/OGXf31iHRQDKinw8EfO4lzUx+yJ?=
 =?us-ascii?Q?1WcgEAQ6cFY2vfnrp0vk4v5I4u+QyoJiGMnydI7KAlAtZocI8kAMxY2ff1o7?=
 =?us-ascii?Q?J6lTH4nUvHW60hFXUcEV/gRTZ/4Ss449tNstAOzbEZqaoax5QxZ+WmAzK8Qs?=
 =?us-ascii?Q?0JS8+V5fNOTvgKCAk0+fJMbgfh8Jwiv5GgZGI5ZkEjJzIhBohYMKNGpDU7SK?=
 =?us-ascii?Q?I4OltCsOO2TIWL4rmeKY/9TS0Dy1dh/TkHii71so4rfNMZM3VT9DJYUp3LOE?=
 =?us-ascii?Q?4d4gK/tQc0icokjkreDciE9FenfaxXCKuCaCHG95qiQbNNeXtZ/RRDMTZe5t?=
 =?us-ascii?Q?pSgZFVgVMdpX+M7/32ypE4AJNf8uBke+5pc+g+FkWIbqEvNyuOPGpGj3qvDL?=
 =?us-ascii?Q?OY0WKIuY0Og1R5m8WyuPFNqmhdmG9BmbBCNISR0+FybSjBWHMWYHTxnIg3G3?=
 =?us-ascii?Q?RjEMDSfd8TWPZLoS4rczJ1fcXIUxw4/VRauPcf+2ojUIoMvYCQ0hsaC5eT68?=
 =?us-ascii?Q?xgwzvuw2LjOMiCYf7gN88MuJHfsU/iTwDXvA2R6GzsXF+47Hjr3LlpmQnUuf?=
 =?us-ascii?Q?PI1XfTTlNQxweGXgCYJIwZSfteY521cHn8IGwFJ53F0f8UZas82k5d2VG0Ew?=
 =?us-ascii?Q?tD9wk5FeX1byXWEaIu9PlgkvUEA28Tp4tp2DeVZriScJM02r6f/Z1BgPKWFP?=
 =?us-ascii?Q?+Z6ULVJ0fay5tc/CSQE2LIm7t141ITDVjqT4uHdBHHX6wFHy2Uq8rNPNOz8I?=
 =?us-ascii?Q?dCr2xNjuXbWeXg+xuUBpMA67BPV9WbIGyI1kgqg+dEUU+dqwoeYxhNGxTSDk?=
 =?us-ascii?Q?VTG4sxXrtREZEjoOHXitiy7k0JMe2WlFKSMio9+H7Y8chot0e9nqYTBXQbSf?=
 =?us-ascii?Q?tUIBpMkuOGYtD/8295JoWunUBDxMDAkayhD2S9PasZStS9hO1A0H8cjaQhzq?=
 =?us-ascii?Q?5q/4n3GlijFWI2s5YiQUklMRSqgpr+J51UweituskYcq/mqmz+bCt9KQYsxq?=
 =?us-ascii?Q?REetMGZATLUyE6p68+XQTwNTOG4nR2+D17HtqwPU8D0bvcNELAfsX0CsRHG+?=
 =?us-ascii?Q?1Df8pusPCPKRpNxca/wqivCV8ujOeatlgU0R+Bk07HjjC1UeGNoZEeUSGywB?=
 =?us-ascii?Q?MOzHPVEDUnaoZu85KsCnFCh5EvawNq7DyAErjU/ke9nAw9wsEv/t8dV6IDlQ?=
 =?us-ascii?Q?86itZi3zTQKjNOhhwqNqWBN3fyhUyHqueDuGWzMF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab10eaed-d25f-4415-48f2-08dd837fd55a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 22:32:01.9639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HeCEj0P22Muijwyx7NiaCvzFl9cU/41EVTBZtPZHrdJry7qdT7uGVIN9z2ae0P6+gA00jV/SBTgn64IoH6geQDOGTiUu6uWEfUbwbsy6+OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
> Sent: Thursday, April 24, 2025 1:44 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Dugast, Francois <francois.dugast@intel.com>
> Subject: [PATCH v3 1/2] uapi/xe: Sync latest uAPI KMD headers
>=20
> Pull in latest uAPI KMD headers to enable testing of new features.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM, though I am a bit surprised that cpu_addr_mirror_offset is
a signed integer and not a uint.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  include/drm-uapi/xe_drm.h | 49 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 154f947ef0..c90fab1b00 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -393,6 +393,10 @@ struct drm_xe_query_mem_regions {
>   *
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>   *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the d=
evice
> + *      has low latency hint support
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if t=
he
> + *      device has CPU address mirroring support
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -409,6 +413,8 @@ struct drm_xe_query_config {
>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -911,7 +917,11 @@ struct drm_xe_gem_mmap_offset {
>   * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
>   *
>   * The @flags can be:
> - *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> + *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE - Map the whole virtual addres=
s
> + *    space of the VM to scratch page. A vm_bind would overwrite the scr=
atch
> + *    page mapping. This flag is mutually exclusive with the
> + *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception of on x2=
 and
> + *    xe3 platform.
>   *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
>   *    exec submissions to its exec_queues that don't have an upper time
>   *    limit on the job execution time. But exec submissions to these
> @@ -987,6 +997,12 @@ struct drm_xe_vm_destroy {
>   *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PX=
P,
>   *    reject the binding if the encryption key is no longer valid. This
>   *    flag has no effect on BOs that are not marked as using PXP.
> + *  - %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR - When the CPU address mirror=
 flag is
> + *    set, no mappings are created rather the range is reserved for CPU =
address
> + *    mirroring which will be populated on GPU page faults or prefetches=
. Only
> + *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU ad=
dress
> + *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, t=
he BO
> + *    handle MBZ, and the BO offset MBZ.
>   */
>  struct drm_xe_vm_bind_op {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -1039,7 +1055,9 @@ struct drm_xe_vm_bind_op {
>  	 * on the @pat_index. For such mappings there is no actual memory being
>  	 * mapped (the address in the PTE is invalid), so the various PAT memor=
y
>  	 * attributes likely do not apply.  Simply leaving as zero is one
> -	 * option (still a valid pat_index).
> +	 * option (still a valid pat_index). Same applies to
> +	 * DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR bindings as for such mapping
> +	 * there is no actual memory being mapped.
>  	 */
>  	__u16 pat_index;
> =20
> @@ -1055,6 +1073,14 @@ struct drm_xe_vm_bind_op {
> =20
>  		/** @userptr: user pointer to bind on */
>  		__u64 userptr;
> +
> +		/**
> +		 * @cpu_addr_mirror_offset: Offset from GPU @addr to create
> +		 * CPU address mirror mappings. MBZ with current level of
> +		 * support (e.g. 1 to 1 mapping between GPU and CPU mappings
> +		 * only supported).
> +		 */
> +		__s64 cpu_addr_mirror_offset;
>  	};
> =20
>  	/**
> @@ -1078,6 +1104,7 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>  #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
> +#define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
>  	/** @flags: Bind flags */
>  	__u32 flags;
> =20
> @@ -1205,6 +1232,21 @@ struct drm_xe_vm_bind {
>   *     };
>   *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>   *
> + *     Allow users to provide a hint to kernel for cases demanding low l=
atency
> + *     profile. Please note it will have impact on power consumption. Us=
er can
> + *     indicate low latency hint with flag while creating exec queue as
> + *     mentioned below,
> + *
> + *     struct drm_xe_exec_queue_create exec_queue_create =3D {
> + *          .flags =3D DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
> + *          .extensions =3D 0,
> + *          .vm_id =3D vm,
> + *          .num_bb_per_exec =3D 1,
> + *          .num_eng_per_bb =3D 1,
> + *          .instances =3D to_user_pointer(&instance),
> + *     };
> + *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> + *
>   */
>  struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
> @@ -1223,7 +1265,8 @@ struct drm_xe_exec_queue_create {
>  	/** @vm_id: VM to use for this exec queue */
>  	__u32 vm_id;
> =20
> -	/** @flags: MBZ */
> +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> +	/** @flags: flags to use for this exec queue */
>  	__u32 flags;
> =20
>  	/** @exec_queue_id: Returned exec queue ID */
> --=20
> 2.34.1
>=20
>=20
