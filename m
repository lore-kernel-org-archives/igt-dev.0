Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A83EC83F17
	for <igt-dev@archiver.kernel.org>; Thu, 31 Jul 2025 08:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48D510E727;
	Thu, 31 Jul 2025 08:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y20Nc7Tc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524110E727
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jul 2025 08:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753950646; x=1785486646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dnPnuwCWbel0dAls0u12whszX02CdircenXvxNAD/Xk=;
 b=Y20Nc7TcjqqNcgueDMY4GGWZgmaJ1s1xhCd3feLcbbcFJuaDxWBdCQ2+
 k6ZFqlQGr0LUPi/Ccjl23GfhQE35kwHXH8OAn71gFuhI+1G3V4CKwo+aB
 C0U4Mhqm83cjFwg7mNpnWFk93U8L6T8IffAvQhTQwKQb1Q6yTCEGjk/3N
 MMBqgMK+LGk51lEdVIJNlyR6t8j9RCbyzIs485MZOnBu/QJlqGAw1aQCN
 jEz0eRt6LzB74HYAR+uJi3G3o8Pbzq/0vijZzUpaEiZyPiugxNxi4PIDJ
 mz3GT9KXKT3GciDPBwHKuxAsFMgniME4YM8p8LhrSoV76h5rhhqMGCDDw Q==;
X-CSE-ConnectionGUID: aOAvNMsbTnGZJGYA8eS25w==
X-CSE-MsgGUID: wODfW9oXSSelyUaeIf71VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66960194"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="66960194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 01:30:46 -0700
X-CSE-ConnectionGUID: 24995Qj7R0iV9e9tucMGLw==
X-CSE-MsgGUID: PJhIalMQTCq8gxOCOvuoTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="167457446"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 01:30:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 01:30:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 01:30:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.73) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 31 Jul 2025 01:30:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfKnEzcfyJ3N04nHDTB98crJOTWFmPKf8Mlaj42GunPQG9TxCMPoYNwZm8SyGvUGLhE2lnCJ6QF420RbFaPoHl30SRi0NJY8SOKqzhmoIP92t+7Q84iRZVRqrDBL3pazCvb/+1M1vDQWhL3MNUeCLEFAe0L5a1fX/uhwAvlperYUYa9kKUUqOO7jzmvvlGSvrapjLkBZwBgp6H7E6OQdxoOApWnEHK055CTFoBKADDO4l3R9vyp0aJpOrCHvX0+l5AGbG6dPMlKzk9SjLz1yzQnQI/d8l8whHoQHTNcXeL97z1U+d0YC8iMuRR2KIrVbCN0kNWNeysSGxhfE+/twqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1Jb/93Z3m3xTrZ13I/g14MwSumeQsjKoh5vWj2v4VQ=;
 b=T8s5oyAsatg+nOwebqqaufwILGICa1ZShPgSVFRkXkjWEs2fm94060xbgQcSf0lWB+YgbSaYXjkOOJwELFbDnuZQ8yeY8Th27SLDTHyhTcXYmHvRHEK3X46WJPC7hj1sOG6nYm73r2nY4FD+EmYodHwEsy/7Q8WVIQuLzCeF8TZ8oPg44eft/B7rEIz1OIMnLgQSxfsGJO9q9HmDSM7zsXMloP4A/MfscEx5VRW0VKn+yAH0VG26wn8TqbQtj7vopa/aQj3Jn/NLs41urU3JJR9sgpkrr12vlHTEZ5nSlLCbvGtx75nNEgB2WgKc05mqm0I9wM56C7kWol1kqfHJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by CH3PR11MB7915.namprd11.prod.outlook.com (2603:10b6:610:12f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 08:30:35 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6%7]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 08:30:35 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/xe_pmu: Skip tests if the
 engine-active-ticks event is not present
Thread-Topic: [PATCH i-g-t v2] tests/intel/xe_pmu: Skip tests if the
 engine-active-ticks event is not present
Thread-Index: AQHcAe/FvmqNcIrikUOmIXUkKqdG7bRL5htg
Date: Thu, 31 Jul 2025 08:30:35 +0000
Message-ID: <IA3PR11MB9304F56C8FFCE45B06A68F4AAC27A@IA3PR11MB9304.namprd11.prod.outlook.com>
References: <20250731074309.3227163-1-soham.purkait@intel.com>
In-Reply-To: <20250731074309.3227163-1-soham.purkait@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9304:EE_|CH3PR11MB7915:EE_
x-ms-office365-filtering-correlation-id: 5ac81912-350c-41be-93c4-08ddd00c856c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XHr6fE6MfVfM4qdfPoYGBlK89i3EI8Jr3DJZpNKhwVRTVoxcN0Uef85NS1wg?=
 =?us-ascii?Q?maSoj/9tdpRX8UgT5sJ8FzyoSbg4O0C/q2kp6sLsv9cFUXQ426tigXb2HSPq?=
 =?us-ascii?Q?OZMNgXtGo7EEALi/qYUMcJKqW3BSGYjRFc54btHTZqH7rP0YDqc1gUUpnOY8?=
 =?us-ascii?Q?TPwLGbq8dCo+dcGiKNMmDVH+BnjReZQQQcb6ZZXbeK1KdYoVfymFpVB3Mxu2?=
 =?us-ascii?Q?DIybqE7+4F7cvjnfEcusfvZpmVMsNbfN1Jwg1ZirMO6WeUTA1xG11c+4Sen5?=
 =?us-ascii?Q?OKyCQaSdFnGd2+vwZ8jJhDKGXSEzsbzMiFxfUqhvgfFX3NyEUG59DpJbJ/tG?=
 =?us-ascii?Q?Lnl7XrQeUsqkeYpnp7Y+noCKeE/+iXnTrnbcygZqKQCtrD3nmoa7YJ7jBaVN?=
 =?us-ascii?Q?+Pllaz/y0NXG4dWT1nhSdOWVOXW0aprzCUFZZ1S3RnMBHMEraGfZpUEkJKcU?=
 =?us-ascii?Q?IFMk8oVaVV0o6v3hnlKQTfF85p8O0PkgKvUQBU7pT4RHwkq7b4cD8qBOwueo?=
 =?us-ascii?Q?xFtBEsYeUfb8kq2tPelLsUg7SzrRB4sPU6iexHUMzPStDim4wxGULXM4Loys?=
 =?us-ascii?Q?Op+sKEeg0YlvQGFsC2JnrRtHCP6o8U4KjA3zVj2SXZ40q8LQv1aSDYcl5lny?=
 =?us-ascii?Q?BVbWYzVrLcm95bjeI8br7hZVBdQVAtYN3o1wGUctkrUQtPATweFp9rO79FBk?=
 =?us-ascii?Q?NWu2b2KSJH0xAYV8AjIYsRWGH+7aW3zivCS3r2z1LJ8jKpb6ibIGwxp+5mM4?=
 =?us-ascii?Q?tIOwrgMihhUTKPIrzRIu6RhDmfDejU0oEW9wOuIjtnFwTI7sWVuViDicfCW0?=
 =?us-ascii?Q?e32cSChiRQ4bE9oAjrtT8ntk0h5cK72WIKpfWlj+cKJ6pvdBx405TrVXW3sw?=
 =?us-ascii?Q?UtIZut2XULDDLbY3A4pE/zJQQUoBGarf5viIjzAORXdLnkdo/djVcQn/TA1q?=
 =?us-ascii?Q?vxPtGDOlGcci8B2ZIJto42W0eW7082Qs2Oq3hz36+7ZmsF104rJqR6DYDF+u?=
 =?us-ascii?Q?wWgPMjXQoZlW0srhuYuHNnewz/cxpzKvWhRN9H4JuKxgKLbzo5/fOXLwNvRs?=
 =?us-ascii?Q?W+O5wPDxb1nE/oHwovQbFwKRtnhf5C3tY65JE6VwixfpPhJDM7Zw7NWPLOtp?=
 =?us-ascii?Q?hkt+/rZTcoES2KFdG4JvheWaIZb5YyPUp4SkQyDga71W7ixvZ+0Ec3D3BPBD?=
 =?us-ascii?Q?5euV1OKj7q0pBmPvl/MK+XDg+gbjAycWIIr8ss9WHFe4LHtG+iq+r6yIB3H+?=
 =?us-ascii?Q?GM8pKTwap1jlRo8rSWz4Jhzc32HAr1aEJAUlma9hRfSIrCg1LAqFAj9MVzF0?=
 =?us-ascii?Q?KZ9kLlAJOSVbCuw+rYZHbSBRU82pepBNEeKp+VeK1AZO686MkJyRaDAmwtdo?=
 =?us-ascii?Q?cZsMEpfzKqrZxpeHxhMu+Ms0r/w3ZjYAoWwxIjZ9jdPywN4vF/66/IzJaXHM?=
 =?us-ascii?Q?8rlhsl9YUbrAFuqOnT2yoTWBoSzDMVrpu8Z1l3aXrJz1hMHbQnMxJA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OhHO5/Q1veY4DfW7RsEqXjbHNZlWnGXz+Jj2uWnpIzidToTUBQew5ff4Z7sN?=
 =?us-ascii?Q?OuEzzbFmkFzoqJjkfu0HCePGsGrcg9BDkQJz2fGaFWLkj3WwX5nm1u5nS8oe?=
 =?us-ascii?Q?Y42bfQ/Ug32ZJ4p+sG7M0hkjagN64iNkSvuS0a5ZCX7BheJl62PNI5usx/0X?=
 =?us-ascii?Q?r0/Qo84kDnCcNLz4m0u3orB3WLfItTXuYAVju0cgwAW7ddy80hBU8jmjB42b?=
 =?us-ascii?Q?ZSuKWu3Nr5bp38yyKt3KLXDQ7He4jdFbWQdW8EQuBM8ZbcT2IVS/ueXZLSrT?=
 =?us-ascii?Q?NjMR0R2/Mo4/Ts05DH3MtU8mTS3WsgvmscEBh/ayHNzr69eyhI5yh6YPu/q2?=
 =?us-ascii?Q?R3cFDMHtsWI0Nn3krH4OmKQ1kfTzWnxsWbYOUYzsQPx0+prV0IGQ6cMSkWih?=
 =?us-ascii?Q?6CksTq6CJZirHTyxLn0O3mUjRSiGbs8fInLnviovn0hitfHLHoYxu+mjIkiI?=
 =?us-ascii?Q?TZCSdu+5HB/+Gs9bPXG+R5PWSaYEtHDppbvAQEfr3oWj71fH8RX5IInRno/5?=
 =?us-ascii?Q?Vu+cRt5u/LSxZudGtll9HM9Y31/kNGWkW5OHnxDOBe/aHeY2bYg+E7TUg3dy?=
 =?us-ascii?Q?9RmB3ZkAkQhFMzIq3hheSc0ArobJxpHhm0NPGlCKQG07luXI7tD7k66G8tuG?=
 =?us-ascii?Q?5Ja3e2Fmd6mWzqVRzBtXMFEcprR9fyRf8/MNMtzSWzVcDe6H6RgPYD5C84j4?=
 =?us-ascii?Q?rkJ7ab432CoTEgUm1+G4+VLiFc/tHTzJMqENuP0CCUzWuZaKkEmXghPwfRqI?=
 =?us-ascii?Q?Ud9EIGO2z/YVhvfYkSWMK0Dsa/UIa5OzO4Htl484GnqyDIMSp1lqETtfKoqu?=
 =?us-ascii?Q?x+lvEs2/pzNIe/P7TxKZw1qJMqihiG9VZTb72gpM6b2iHGsNiixDooCrow63?=
 =?us-ascii?Q?C7DFb91LfXGb8XloMXAz1ZjNb5J+uO+CbRn8DFi4gYBu452uUoD2BXYVJ474?=
 =?us-ascii?Q?A7tgeJvt5WRddCu/+1bRKtXRW0RtKrDKh2DVUltWoRQlkjZXT2Dr3kA8D9Zx?=
 =?us-ascii?Q?NLZ/GyIteS2Jth5CFCdInXUfcismHWgos0Uh1x3xav/7ym+HFSQFG0Z7XHn5?=
 =?us-ascii?Q?fcvRujJjHLybDzwzGL3HTGk4F99q5rnfrwAUkqN0+XfsAOrJ3JbJCAYeWFJL?=
 =?us-ascii?Q?SjPIkxlr8JhHquT2Mi0DRgacVFbJE3TsyarQwXqF58JNtQKNtcLl2mRVTHo4?=
 =?us-ascii?Q?rewHOpb8YYne679nMc5PFEXXxptnTtrrIWPf6kn1bqohcnVQyldNCzFcmBAa?=
 =?us-ascii?Q?pfIIG7e902eGOKYYXUFwhWzlOwvyUzyGMag3ijQ3HDN1qHe4JAsTxbso+CKY?=
 =?us-ascii?Q?drXNcl+dRsEiVpsugB2/lAwnbcZotbN3DxYUcEbwNAIeS3R0hUmaqW/mLd4L?=
 =?us-ascii?Q?tEfotFU2I2w3Zssloy5b96sz9aD0K9VWvJ85nowHVhbXV8jM3EbEnlAEV8AZ?=
 =?us-ascii?Q?alx400jOH5/hUElcI8BB7eeoVZrMeo0oAWCUlAtAYsphdpiHIaJmZS/LndqU?=
 =?us-ascii?Q?xKKP9jBWqANKKpOqWhfYdCSa/irwgzYJeVxifdymN9ZpepcqfHJOsFZN0QYI?=
 =?us-ascii?Q?anlwLNmbQGuy4NeKp0RIN66L3Cahf6evIcHH1oYv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac81912-350c-41be-93c4-08ddd00c856c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 08:30:35.2958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ef4otmOk9/LlUucu8XnH7ro5+C00D1X7Q4F5HGdCavdWTeco2gUxBuFuOBxwH1IOTJA8KweG9PAJoJNT1C0eBy4GSIqz2BSgdpLdxldK7d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7915
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

LGTM,
Reviewed-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

-----Original Message-----
From: Purkait, Soham <soham.purkait@intel.com>=20
Sent: Thursday, July 31, 2025 9:43 AM
To: igt-dev@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.co=
m>
Cc: Purkait, Soham <soham.purkait@intel.com>; Tauro, Riana <riana.tauro@int=
el.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Kolakowski, Jakub1 <j=
akub1.kolakowski@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_pmu: Skip tests if the engine-acti=
ve-ticks event is not present

Skip the tests and subtests involving the engine activity if the engine-act=
ive-ticks event is not present for the respective device.

v1:
 - Add a variable has_engine_active_ticks to check for the
   existence of engine-active-ticks event. (Riana)
v2:
 - Refactor commit title. (Jakub)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c index 0e5a7360f..b=
0bd235e6 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -106,6 +106,7 @@ const double tolerance =3D 0.1;  static char xe_device[=
NAME_MAX];  static bool autoprobe;  static int total_exec_quantum;
+static bool has_engine_active_ticks;
=20
 #define test_each_engine(test, fd, hwe) \
 	igt_subtest_with_dynamic(test) \
@@ -113,6 +114,17 @@ static int total_exec_quantum;
 			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class),=
 \
 				      hwe->engine_instance)
=20
+static bool _has_engine_active_ticks(const char *device) {
+	char buf[512];
+
+	snprintf(buf, sizeof(buf),
+		 "/sys/bus/event_source/devices/%s/events/%s",
+		 device,
+		 "engine-active-ticks");
+	return (!!access(buf, F_OK));
+}
+
 static int open_pmu(int xe, uint64_t config)  {
 	int fd;
@@ -191,6 +203,8 @@ static uint64_t get_event_config(unsigned int gt, struc=
t drm_xe_engine_class_ins
 	uint64_t pmu_config =3D 0;
 	int ret;
=20
+	igt_skip_on(has_engine_active_ticks);
+
 	ret =3D perf_event_config(xe_device, event, &pmu_config);
 	igt_assert(ret >=3D 0);
 	pmu_config |=3D add_format_config("gt", gt); @@ -907,6 +921,7 @@ igt_main
 		fd =3D drm_open_driver(DRIVER_XE);
 		xe_perf_device(fd, xe_device, sizeof(xe_device));
 		num_engines =3D xe_number_engines(fd);
+		has_engine_active_ticks =3D _has_engine_active_ticks(xe_device);
 	}
=20
 	igt_describe("Validate PMU gt-c6 residency counters when idle");
--
2.34.1

