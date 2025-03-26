Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E43C28B30
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 03:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0F210E102;
	Wed, 26 Mar 2025 03:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KlYwGWZA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D426310E2AB
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 03:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742960842; x=1774496842;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aFxlAk0S6CBBzzIjrXDsN3801hGtx6mePc9dC2AUADk=;
 b=KlYwGWZA/eA8dR0XA/1y61+e2miojqz3gdWSoyas2fLMdUwPmq3KNmPp
 XTVAJqYKgMjn7jSwYj1HMsCFpC4FZRmB3teq1NSvHoLNn77k2VeLeNr28
 J8TguppTyFodm9dskEbv4026sgz9ahx52KAbyMXwfNriy+escJioInuAS
 J9atwzYxEQlsVV6Iqeqbez7N5CfejGAYrCADj+0weOqEtQZI8vBg13eSy
 sPpK3hWWpR7P4r612kkSlFPILqlgRas7aeYdLaugPPJwf48HpGtbJo5cH
 TnxHhCN0ZoqOxJe/+u62IIFfEf4q+qQDnsgyhiw315YL4GsliU1oIgQq3 Q==;
X-CSE-ConnectionGUID: ofTyNqkdSFiJUnBNLw7E7g==
X-CSE-MsgGUID: +0yFp1FaRmyLRnygx33oxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54894799"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="54894799"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 20:47:21 -0700
X-CSE-ConnectionGUID: cveYZ/edSt2HoQL1hjZeCw==
X-CSE-MsgGUID: YSNgXHkhR8eVHWDPSjqcfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="125525828"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 20:47:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 20:47:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 20:47:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 20:47:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Co9P/zzpYjOR3/NCYpc8UpE8csXzyMr4U7xjIkuwrxhknguEd+3qYzNK8zTlGBMfbWNPfFQse1vEMSqpLafbcioTWrUWNMdO4N1fjs6Mcr+cG+kuOjcb2ripp4gIx93+91QHua6YS1OvjTTYwwj9QW28812c0IHwfXfgwZ5bBuvzXYhcXeMIR5v6c7rMk2JUNPi0x3iMf17dGe+WZSScsfgWLqvc3ytIgQAWvo9aO2zJFCOCZ68sqhMXz9HUZV3lgHJudzHAVhDVQgcM1jYJvjf3gh3Yn41OTzg16vDC9v5+WfT/UGVb7Po30Ppnatwh8hvFUu6s80gsn867/lNbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mbt8msGqoCBUmCN65+Hx0/trPEBOPEI7VqJQORYg5XE=;
 b=KKJF7nf3nBUTOaITShE52WdxjACEFinK9G2bu3VEowIPEp0o4fpk3LAK3LQ5NqvA7oXWgTps5ld7Akpue4dulYWKKlH+8Ga9ry2rX9QgUOUvIHstByQD6U1uWL6IqTl3GOKHabc/Xa+OMS/Rdjn2xvZ2mBr0Gvfp3fQ8FDoY00mnP/xU9fK1fs98eZnArio3TqIY0+X1tdr+72RY0gBu6UXv5OrjIiqkTwLeppdTZIhLi0LhflNWei5+82BtHkd+IsB9ar7OzaphyKBPtc1Dns4/p+Ow130ettkEbucYxEW4ud31RLd3fYkpab2qadPpaM6qVoa7lb+j3cjFVV+n3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 03:46:36 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 03:46:36 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B S,
 Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v7 2/4] tests/kms_async_flips: use in_formats_async
 for async modifiers
Thread-Topic: [PATCH i-g-t v7 2/4] tests/kms_async_flips: use in_formats_async
 for async modifiers
Thread-Index: AQHbnYCH/ATxxC4I10q1mkIweT8vbLOExqVA
Date: Wed, 26 Mar 2025 03:46:35 +0000
Message-ID: <SJ1PR11MB61296EA73BC6BFFA7123C64CB9A62@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250325121625.2718374-1-santhosh.reddy.guddati@intel.com>
 <20250325121625.2718374-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250325121625.2718374-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: karthik.b.s@intel.com,arun.r.murthy@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SJ0PR11MB4911:EE_
x-ms-office365-filtering-correlation-id: ad0a6fae-e7f5-4be4-60ac-08dd6c18ceb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?G6GajiwswtGI1xYPS/UnXxXjPjaty67vVS8nGfDiEJnW5Y1oHKzf3YTfUN05?=
 =?us-ascii?Q?lpuwhbKTpVZ89NrfRP6HgJmAL3f4rxvKgvk0luznKcJBIcEw3W1wtDvnox/f?=
 =?us-ascii?Q?lcQqqI/yGz2vLMZ+VhJEnHk4vdpiaUjYYGwFI4axO+qpuuABzB/xbitID4cm?=
 =?us-ascii?Q?xwNvDx2Ubnwg9hoN1UDdpkVT1yLLwpFe9Q4Z2lPCeraefejOyaf4Yw4mh0Yq?=
 =?us-ascii?Q?NVv8wojfPCjg+YFMDq/aoeYfCnKZt5xMYvqm+y2OlzWYjptKHIt66fX4ug/w?=
 =?us-ascii?Q?3uoatR+KasOmOCFwpKAf8YWe7fe/z1KvJ4A6F4GVG1Tb49+mZALnjZS9qEX3?=
 =?us-ascii?Q?hUlmSiv4jvqW0yHzc25+gRvb7N7/kb9awAPK9TOacxxJqT/oYEgPuI+ayfXh?=
 =?us-ascii?Q?BrUcK2KNtB/hs2zpVMht9e2k6p/JLhn5IDbr5ZfhCOZIhXw4uZNgDUlTMal0?=
 =?us-ascii?Q?Q8sYiPvEBKZdV9uQ/lRY/qNevZ9QIh1vQzHTOzv1WlGfd+ZaG1Vh816lr24t?=
 =?us-ascii?Q?6YMpDZ12f4XVJXFk40xxpIgw4vGqNwwXDQ/hhHBx5sx1Kq6BwIzBs94z4Ib3?=
 =?us-ascii?Q?C6HzLBIm9T26/DTJyc+hDB9+Km3DRrG0Mveq1mS5QSXcUIE7uP7egLWMOpA+?=
 =?us-ascii?Q?p2rgiWK6j3XwemO1L1yAav3ljgv+L3BPs1Jdnj/RE0Gg7rstQ8pLxzzw/npw?=
 =?us-ascii?Q?1g+rxQPqXxdfOOhmr4OLVt4h9htV0CBZqnfAA0UlulGmmSUx0+J32S71OHVq?=
 =?us-ascii?Q?ZaXMwEnzZ8lI3Fj4Zuxz/xTYZWZj99wnB2hvoLRODpUZ1k4XXRJRCDsQ352v?=
 =?us-ascii?Q?VJtnqsQtp2O40boBivsddb+34IjcjuzMvBE4gLzfH8dZxaQAsl9dlgLfgKpv?=
 =?us-ascii?Q?333+wYyvs2zEAXIZk6pPIunEc+7+f+OixUr42Mg8Kd8nyH5lThqBTtbTI7a8?=
 =?us-ascii?Q?U4xdNMkGsEzq0J/hqodhS9aA293G7l81x3Dz/Ai+IOAgKYVOTkN6hZX2sxoT?=
 =?us-ascii?Q?cJpTyoWe0HhO1x1c1zYtj4/6S0NwCG5KDFkMoEp7yjAMavbhJpnSVW9AQJ9m?=
 =?us-ascii?Q?XbCRgI2m6wtZYkvAvhA5fIm1PYt8GMw2yFrVJuQViXNqscQPM//wPm+Db+5I?=
 =?us-ascii?Q?KVy9a4VSST36ltQXkn37QuMbU7NEOgH5TGg01dZW3Ni2/y5vM8aITBEmo1Ig?=
 =?us-ascii?Q?gYd9C/CB+vzDaMleIpMS8CqGXokR4wV5lm/T0FhJBJ0ROyTJvdW6+XasqRty?=
 =?us-ascii?Q?Vv2IZkcIVC0dpmjabPDjW/AeDe3uu4lRpROYj62uzMVDHqLoR9dWxVYiLJVZ?=
 =?us-ascii?Q?mL/2JgogA0pk/9tKeaykhrd1TBOBBypShHlcHD3oDCj9Y4lyDPkeIoSrGcs6?=
 =?us-ascii?Q?7MZ3u9bJAg5KY9lL6ITZFnGeby3mffUqtKCtv4pTL7pHdlNqmWo7PhxjRRIF?=
 =?us-ascii?Q?a5b9pwGh5cCLY3GTAqh52V62iFgPM9Y1e/KlMlsb4s1GTp/gx0vM4g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?trT6wU56E28X1defjEuXhD21VqK0SNMd7JC95gYsEj2umZlUXBfDS+ZZMuFF?=
 =?us-ascii?Q?8ONQXzZcvJAU5KrgiCXtE+/iJyhgmubyj2iN3a9iFxNxvBSm3Wy+R/DDyNnx?=
 =?us-ascii?Q?L7z1xavCeVFfawgscsHTDcrkECuu9vqo5FwTewYl767n1Az4i7EdOKc9E4dj?=
 =?us-ascii?Q?Xk1R+77HYUhZbjUUsY1wCviXgsxbClB8uMSC7KiBvuBEVo4XUqVI5KgE3Qfo?=
 =?us-ascii?Q?l/MaaJ2a6Hp1dkWjmA27UokyajzzNup1wz0Lrl6qJekyKh1UHPpipdJheyNV?=
 =?us-ascii?Q?20y494aJjvv67Yuq1ghU8cGU4lTwH/xsZQXAUHx76cjsa13eGIvcI5UMpe9l?=
 =?us-ascii?Q?M0TtcXo+UycYWj8zcWSDYdefywwBogoKMPcGIqjzijmUySlMKzOeMrD1/YA1?=
 =?us-ascii?Q?5/G1bZ/B4oKGqIJDeOt3E+G9yLibOIgtnTWjwFDZrhFArmeJ32SO6ttDS/Wq?=
 =?us-ascii?Q?GS0cdbXeYweKHds1Eo15Qk5LqfPUZOyRgSVlOtAr4PHU4uGrhSRHH8liJWE+?=
 =?us-ascii?Q?OvUaPgJYJ5bWUB80imgNGyhJKszvOLqGu5cnih4vAcZteBn4gNzBt6nvanBy?=
 =?us-ascii?Q?O/rY7amGofCsMbaBYGw0u3jWHwIUiKvjpfVYNvGm6wT3QsGrFV30qDIPF4L6?=
 =?us-ascii?Q?/J5x6sSvDjFmX9BXJxNImuYA/rfg5EZGD/PEA0M3a5DWHomotnq1KWGPD1nT?=
 =?us-ascii?Q?meWCUPpR56Go7TidzSvVlpVdiI/ctTObTr3wZQf1xjowp6Cbs8tW6EvJ+g4Q?=
 =?us-ascii?Q?ACsU6IIn61V5WW3zm/Fkfz+kemfwkN/+TR/90OJnN/ZdxKnGLX+uQ6u7Pxeg?=
 =?us-ascii?Q?b4nL88n3ot6hMP2jURd4TvIY19sFs2GBALiHg3j4+MUnRYaH+ntbClNMTQ18?=
 =?us-ascii?Q?05PD5nyo6P0RClcbDiPXQynLbduDOVxAd81G187Kpg2ch793SCEPyWjOo+hB?=
 =?us-ascii?Q?Midp5T/FpdOUm+K/cGWYR7Of6S+jVsO7CIBbl/stUeY15GNFDGCxDPO7t4n0?=
 =?us-ascii?Q?zp6vLqiW6ax8F7KkvFMrwQLFHdrG4gSeEptqXdAW3YOzgSrFcx+u7O59HssA?=
 =?us-ascii?Q?ULkim+x++E6QNGyvsx1NC4R6J4+rDItA+wcjlFv7kNLouuPQUhHSC17ujyco?=
 =?us-ascii?Q?bB9q8AQqeYbtMTQZoG5wI0uSARL30HAMDKflSod1Pi30OxHgCnQFS5ZPSVRd?=
 =?us-ascii?Q?DebbhmGN3GUAypFh1m1ktwCswm46/ybdRv79tB/OGN3KB7scT9EZaIFWgj/3?=
 =?us-ascii?Q?2GB4cc4JNC1FD9QLTkWn4QMZtRTILagz34jqoKnUklAO+mCBSI3RxPbtP6l0?=
 =?us-ascii?Q?PmOQpYAH3qKlWcl3Cs5OKMxHKlJHoqaVFpmB4kZEyH746xVlr3AyNknmwCFO?=
 =?us-ascii?Q?EwKlgsB+0mhIXx8ADxlblE5DCW6yxTFs+ox+6q7DhkMaNN/Q2xPWAmRV2q8p?=
 =?us-ascii?Q?vJRZNKnCrP6fPs/kiSANQSZAUHW6y+BE29Ti4a4NGx3P9O/ZBj3XjGelRKlF?=
 =?us-ascii?Q?jMTkdiChZUHOCcfU5mfU8d9TEkO4wSGyGslzS5vELxHfBT9CLZXrYMjA95oG?=
 =?us-ascii?Q?pK8tKErL537El1006+SEtjdHm/pqtAB1Mx3gvlcFyKIvyMlZqMrT2d1wKYc7?=
 =?us-ascii?Q?UQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0a6fae-e7f5-4be4-60ac-08dd6c18ceb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 03:46:35.9473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6iCc885h7I3tY4vnGfEdM1axzW1sySlvR+KEGLU3lMMumdzUDsYCLcUXFLV0X5SNMvRbTD6k8pQY9N/p8pnjE3nEBWE+j693rqztVL4EwuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Tuesday, March 25, 2025 5:46 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v7 2/4] tests/kms_async_flips: use in_formats_async=
 for
> async modifiers
>=20
> Utilise IN_FORMATS_ASYNC property exposed to get the list of async
> supported modifier/format pair and improve the test coverage by iterating
> through all the supported modifier format pairs.
>=20
> V2: Improve run_test_with_modifiers to set data formats based on async
>     formats.
>     Update make_fb to use data formats instead of hard coded format
>=20
> V3: Update commit message, remove complicated iterations (Chaitanya)
>=20
> V4: Reduce the format+modifier combinations to reduce time needed to
>     execute the tests. (Chaitanya)
>=20
> V5: Remove unnecessary check for reduced formats. (Chaitanya)
>=20
> V6: Introduce new test for all formats and modifiers, executing only one
>     flip to reduce overall time.
>     Update test_with_modifiers to use async modifiers and formats X8888.
>=20
> V7: split the newly added subtest to separate commit and add condition
>     to skip the test if async format modifiers are not available. Also
>     remove data->fail as it is not needed with the new support (Chaitanya=
)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 33 ++++++++++++++++++++++++++++-----
>  1 file changed, 28 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> da426f753..369318368 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -36,6 +36,7 @@
>  #include "igt.h"
>  #include "igt_aux.h"
>  #include "igt_psr.h"
> +#include "igt_vec.h"
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
>  #include <poll.h>
> @@ -85,6 +86,9 @@
>   *
>   * SUBTEST: async-flip-suspend-resume
>   * Description: Verify the async flip functionality with suspend and res=
ume
> cycle
> + *
> + * SUBTEST: async-flip-with-all-modifiers-formats
> + * Description: Verify the async flip functionality with all supported
> + modifiers and formats
>   */
>=20
>  #define CURSOR_POS 128
> @@ -122,8 +126,15 @@ typedef struct {
>  	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
> +	unsigned int plane_format;
> +	bool async_mod_formats;
>  } data_t;
>=20
> +struct format_mod {
> +	uint64_t modifier;
> +	uint32_t format;
> +};
> +
>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv=
_sec,
>  			 unsigned int tv_usec, void *_data)
>  {
> @@ -193,7 +204,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
>=20
>  	rec_width =3D width / (NUM_FBS * 2);
>=20
> -	igt_create_color_fb(data->drm_fd, width, height,
> DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
>  			    data->modifier, 0.0, 0.0, 0.5, fb);
>=20
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, fb); @@ -348,10 +359,19 @@
> static void test_async_flip(data_t *data)
>  			data->suspend_resume =3D false;
>=20
> 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
>  		}
> +
> +		/* Reduce test execution for all formats and modifiers. One flip
> should suffice */
> +		if (data->async_mod_formats) {
> +			igt_assert_f(ret =3D=3D 0, "Async flip failed with %s
> modifier and %s format",
> +				     igt_fb_modifier_name(data->modifier),
> +				     igt_format_str(data->plane_format));
> +			break;
> +		}
> +
>  		frame++;
>  	} while (diff.tv_sec < RUN_TIME);
>=20
> -	if (!data->alternate_sync_async) {
> +	if (!data->alternate_sync_async && !data->async_mod_formats) {
>  		fps =3D frame * 1000 / RUN_TIME;
>  		igt_assert_f((fps / 1000) > (data->refresh_rate *
> MIN_FLIPS_PER_FRAME),
>  			     "FPS should be significantly higher than the refresh
> rate\n"); @@ -715,12 +735,14 @@ static void
> run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>  	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) {
>  		test_init(data);
>=20
> -		for (int i =3D 0; i < data->plane->format_mod_count; i++) {
> +		igt_require_f(data->plane->async_format_mod_count > 0,
> +			      "No async format/modifier supported\n");

AFAIK, currently there are no platforms which do not support async on any m=
odifier. We should fail the test here if that is the case.=20

@B S, Karthik @Murthy, Arun R please correct me if I am wrong.

With that LGTM.


Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


Regards

Chaitanya

> +
> +		for (int i =3D 0; i < data->plane->async_format_mod_count; i++) {
>  			if (data->plane->formats[i] !=3D
> DRM_FORMAT_XRGB8888)
>  				continue;
>=20
> -			data->allow_fail =3D true;
> -			data->modifier =3D data->plane->modifiers[i];
> +			data->modifier =3D data->plane->async_modifiers[i];
>=20
>  			igt_dynamic_f("pipe-%s-%s-%s",
> kmstest_pipe_name(data->pipe),
>  				      data->output->name,
> @@ -757,6 +779,7 @@ igt_main
>=20
>  		if (is_intel_device(data.drm_fd))
>  			data.bops =3D buf_ops_create(data.drm_fd);
> +		data.plane_format =3D DRM_FORMAT_XRGB8888;
>  	}
>=20
>  	igt_describe("Verify the async flip functionality and the fps during
> async flips");
> --
> 2.34.1

