Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59FBE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 12:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BE510ED7F;
	Thu, 12 Dec 2024 12:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apcAhPvD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B97E10ED7F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 12:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734005866; x=1765541866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x5u0wrxS13hcMCME3mWskurvXTUMbQCLDJDPm3slRZE=;
 b=apcAhPvD/4aXZuVM5R8r/QIHJfNun2QwrxAjGTGd4XqPwgucxNlg4sh9
 FntU+8dS4fDlCgxTwlL0Oh82tJlNMDHrREgdtoUBOJKHSokL2asQhoanv
 XpSOgYwH9UMsThWEGgxS2DxCP5rSRieowA9zYq6IEVKi6EC4Mk1V0sFT5
 fOLwJOeh7LlUmqpDav/kZ8YiqXNMnEbGl0ldm/InQEKGlDWD8vOUvwNL4
 el/V94+etBV8O9EdSEosBAhqBv+BX/S1VyYxwHIqFJ7XJ/Ub7I+1abniP
 o9WE2KychkcG7a3Uswj/WCqU4XOfgobbPAJC34BTpskAjS/SXRxd+0ZxD g==;
X-CSE-ConnectionGUID: t+47Wa5GQAO66CAg0d/R5w==
X-CSE-MsgGUID: kHB0UzV0SvWSU/22EYKOkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="59817161"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="59817161"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 04:17:46 -0800
X-CSE-ConnectionGUID: Czgub0ooRWq4BlKiS91+RA==
X-CSE-MsgGUID: Mz9wF9uHRluBG0Vkao74Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119458844"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 04:17:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 04:17:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 04:17:45 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 04:17:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWbjRlaHXcJaTmyUDWPDvprif9uGHF5VP8QtaPHWd9qpKXnOSOkr7gaWFvHSgzVktWigQj7LcAzmUxfpZikj4ua7dDOstswD5YioJGOJ19VUAWG29G2vhKpswFH9FZy0oVb4SFDbIP9WEIFhM6nspnx6L0XywlSGBh+SWtU75KWRgVET0xRtGtgXZbJF86YyM3UNiMyruyLvQ7xcngCbYRo4zG2wKs92PoaKYy8YtrJmpNeSNXFLj45ZlQrZj0+DbTBdEjUf6O/JUibLxAnmEk/GCOIQnXOL4Mrl52x7pCfcb3XwWEZUy6t1LYQ1JOxBQz4LZHtI2NYIIpD7gUAMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLqdy0c+dINre4N0RjIcQKiTfcyE/Q9Z8PAPd4acLOs=;
 b=iugTbkggUiJ0CcuRjYE1FWFX+mBLu0Ymvq/HL5i0wjKyu8H3ftq2PwNeORM3H6e3IUFtd7fD15eQ4yamkFmag6rlegOFsQju2r1q/eDcU3zXBs7bNupp65S+NmvbLsvJaAjOlTFU5RbnIN5nL6DgSnRuyaO2fs0iOubyqXKIQolsHhdJ6wBHRCyTiWJnI2LNGE/ggg1Zw2Wr/nOlkbvrg8sh6tidhYixWgM96x8Y8D1pQf7PBfwj3agIwHQGYy0+8S9g4Y5kNG1wqnTReaXMgk0Jjq/MGLU0zsBD/n0qXywnuNhADtdrH6YMv9cBZoa2AB15crUG+4mcFesHjiWFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by SN7PR11MB6947.namprd11.prod.outlook.com (2603:10b6:806:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 12 Dec
 2024 12:17:01 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb%6]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 12:17:01 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_joiner: Add
 igt_get_dsc_sink_max_slice_count() constraint
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_joiner: Add
 igt_get_dsc_sink_max_slice_count() constraint
Thread-Index: AQHbSwqC7sYpvopaGkqa7JttWoaOgLLiiUbg
Date: Thu, 12 Dec 2024 12:17:01 +0000
Message-ID: <IA1PR11MB626673D7E54979AEB7BC5BB2E23F2@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20241210135322.2117541-1-swati2.sharma@intel.com>
 <20241210135322.2117541-3-swati2.sharma@intel.com>
In-Reply-To: <20241210135322.2117541-3-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|SN7PR11MB6947:EE_
x-ms-office365-filtering-correlation-id: 8b7774bf-2849-4a77-c997-08dd1aa6e1bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zOHYP1bP1XSvZsg9Pp6XnjFCZgzQXWP6L/sKzZ1+qJjHtpzOhcA5+4g5pN7g?=
 =?us-ascii?Q?iS/mAOEtp7P6ZZREvbF9zJLwR4gkBSmRGPuhsc4BnxaVzeQVskS6/V/hG4kX?=
 =?us-ascii?Q?knDLTyNU1mRfmrSloOvi0Vbgb0VGEvkGBwreqI0Jn54K4kA0rbAblry38UEb?=
 =?us-ascii?Q?H6EWSIiRUayIFj/mcHKpN9qn1HdwSOMkm7Ti9b7V4Cw3Sn7IQPZQipkdOLOn?=
 =?us-ascii?Q?sL8dKg5PEEjfru5JkFaAfDi73NvJV3sOufO7+aIOvhPSA1ZoBS9MH+RWUv5P?=
 =?us-ascii?Q?m8YmsoEzhlBy6zMLRTZCansXVq25oDZSEF68qRKuquuBEx0N5ASq4+1rtEEW?=
 =?us-ascii?Q?fpBqY453OahQsNF/7LAJm7sh1trXW0/++lpptbkiwfy2EePr8sg0rS7/XCgP?=
 =?us-ascii?Q?uq+yisCggi/89L3x1f8PrY5Pl6xlrwokzMfjy8JJ+GRbV8+l80TzMprDI7Kb?=
 =?us-ascii?Q?9PVQv94T/ik2XCmy2j33HbxBrkO6Fw4ZRl2YZMz4R2kVM6rrV5Te9TFDzN+7?=
 =?us-ascii?Q?K7bc8SevkG9naMaKGdN6r0IC2kGMXhEYlb70wwtm0ZTwDA9mjA4fB1l679lv?=
 =?us-ascii?Q?slH8+RPezM9ALzL9hY48YSkDlOBpuYlD2eq2AF3ALAQeFnJgFZBBzd2+j0DR?=
 =?us-ascii?Q?VddwvX6BiaYQMFU+hxkUAbSTXhvcsqpGRMoPuIsPkLaiF5KkQLcwEukBx6/b?=
 =?us-ascii?Q?91d/BKO1yPETv2BozIhwJaBsOkdq+rbrziPVPuCWG6lzFqz+CRr24+FT/VDJ?=
 =?us-ascii?Q?b5XVfe5Kc1p+ACO5Du6hXBaMRP+txY/0f11Pa+oxtbIixni+zqbe2rCzvAxX?=
 =?us-ascii?Q?n/U5Ro9iLywAObxxYchTl29bZ6hMADUJChwWqLjAaxBWV14+c417YFOKNirL?=
 =?us-ascii?Q?bOj/HDzmE8p8ZAsjXq3b5y41NbDqvqdcNbXPH4G1nO1n4w5Gzj7O+/i8dmQ1?=
 =?us-ascii?Q?GvbyydfiKhduc9Rxw2dtyWlOGjBw9k3JrdN7+cyBSmWHSzImBGzCYhGl5tsN?=
 =?us-ascii?Q?edtmMepaBOMpWZx5JLKfghB9p/ejovObAwinF/+0/WKLy02OtMhsCFumuIPg?=
 =?us-ascii?Q?uO9CzUIlou2H8Ae5TkxyrZhTods0CzEjdpKzxzFngQXlOQxJw2r7XNUyxS0m?=
 =?us-ascii?Q?A67dGlDpuqTRWTWz0s1ku+jIU5ye9y2Q/rkxLyuk4NgsRBbJwez7kuqHhI4l?=
 =?us-ascii?Q?exvo/moGWSdvdUliZyHpcbwAL2YN11SRMPsUVeAuUqF3HAntOv+Gije22SqC?=
 =?us-ascii?Q?leknPvxK2MkZA5UzHGaFaDm7HRHLHfIBytJGxycaWILkD0lgIJIN+JMKFgaj?=
 =?us-ascii?Q?f6NE3A2hgOagp2w6x7dNMtg3T8RLrQYFgWlW5+TKMTwBlFbyroxhVtNICLIN?=
 =?us-ascii?Q?q9585xQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?foeOU/P58X13I71WR1wNlOZXkK3Kp0ioX58tVOingtP3UBJcXJAtKy9p81vn?=
 =?us-ascii?Q?VH9yjhwvgAgGGaex9MgMaKQIuSpauXfrN3u09nqRgUvmmpo8BhzXMwL+EqoO?=
 =?us-ascii?Q?sKL7hW9zUpXZpDK6UOXz0Ier4HnDEfot75SAQD7boyIKMZTy6cGNIqXVWQuy?=
 =?us-ascii?Q?ym4qnciTdBgFpUB9t0oJPLxBhAEjHB6ScffvdNbcf9Ljzm2Xffa5qgK2lODx?=
 =?us-ascii?Q?rn+coKchepNwaqI/K3o1t2l5EJG0vK7eMrfN2pUUrD30nBq8DfvxIwtfQ1cl?=
 =?us-ascii?Q?TMbGVMsACOXbMoLo/Dd47j0WGLKDtN9BMQuu6AISp4PvDUNzb+jTyztFg5wQ?=
 =?us-ascii?Q?4AbyBmiiS82nsMRFgRahGk1m+02kMXmOLbfzRIg3oISs0Bl1BBOFD9sjRxs1?=
 =?us-ascii?Q?mh110wgCVlt0kZmOjQXr+ByCSA49/T+bST039ZfSKrEP6erpw6mHISkF2JWO?=
 =?us-ascii?Q?FfL4h/h9GNzkvGxi59b9YC2AJ1mW7LtGgibuNwfEhsFVIKI4LFMO0tZc5LdL?=
 =?us-ascii?Q?xiEgu4yXWaJiTarUYqCzcH25GUOS84VxM14KGc0FQTxrZTCwyynAEmpXSbF/?=
 =?us-ascii?Q?3k6ctS7UrubwQSy3e3znTNMMPiRPywaUply/UwTKaZTiVg2M0KdKlUVgbCyH?=
 =?us-ascii?Q?IWF94c6pMUiIpEDNhdgxK4Je4+vIqlIESDZYMJfQ7CaDlTqJR2agn8kTtke3?=
 =?us-ascii?Q?ROOaHzBhVN5H/IwXl9qovglY09AS1TnKSPXgd/mv0n/4QIdI2+m+BIkMo7t5?=
 =?us-ascii?Q?0sHEhO5nu62DeRsGamcNFbnvEL3mAXq/QXghZ3nDaNaweDvdd7wrdXtPDK7D?=
 =?us-ascii?Q?RCCIZ9ZGiLEXF0OGNn4wywp/tPMJhjs/0Xm1QKBPkWUer4hPA1w23uK7tRpr?=
 =?us-ascii?Q?JmG3FRBIw5/r6jPcHPwoWvPcg3e9s0HlnjiSvsLMOT8aRQmT0T49uHKNy8Ak?=
 =?us-ascii?Q?npSlbJ56L+5sbTuGSA38yqvssXSS8FQbRw4HYaCB3xQ3YIE44zr8f4IVuSqb?=
 =?us-ascii?Q?Xiz09FG2Hr7NaG+Go88z01nTz4rG7y+K0ika5qThx0flY52KW4G5S52P+jiv?=
 =?us-ascii?Q?fhENKBPkqK1kX7yz7hN/cQ114WKarqOiUhW4kwecyWuOjgYbVYLEpjmDctEh?=
 =?us-ascii?Q?qGolU6eEItR+/ZjtKkWpgNw07PpWmQBa7HPGF6Q2rMoHlej0XoAHvqiPemhG?=
 =?us-ascii?Q?tKmTKt4SRg3nItZlzuMIuxwsg5+a4jLBHyidXipzfB+faEW8AtRcXtcQOeT+?=
 =?us-ascii?Q?dMatzAltitGeKqsN5WVmcGi4tqYeX6plo2ZpB3cqCkyRE8fLeFhq+WoSbJ/4?=
 =?us-ascii?Q?t0Di1rPLEo/ooJc9ekPAyDi1QCLNpcdG+zSkQbExzFCh5tBsc1X0upJIuXBF?=
 =?us-ascii?Q?wNySSGwqGRsFCJSoSGCojewQswtqHB2RB1P1rIIguoaQK9XsvBK9FJgUbrmi?=
 =?us-ascii?Q?6in7TDo28ZFnni9TTuQuqV9omrQcmmJPIA0MiGd6sH5Tu1wldrGgh4U4EmT5?=
 =?us-ascii?Q?r7T64IlCWH/VcWTi8+6bj6yGGc1lAJwLbNA9Osk9VYamtuiW8YYy/9J9vQJ0?=
 =?us-ascii?Q?lstCh1wptq4Z6WnZfAVTABIfq5c93uMrI7cz16B9Vxc9wqEFLlvCOXre+p4f?=
 =?us-ascii?Q?Ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7774bf-2849-4a77-c997-08dd1aa6e1bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 12:17:01.0351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ugwePz4i8iXly7XfVQGpHNFL6gQvQScBXo5H8X2hSXtSKTYW/W0mzL09LdcxSfSm4S3dHrRD/vh0EcjEILWDI+cZBdugrH2erqTFnZDglE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6947
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Tuesday, December 10, 2024 7:23 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/kms_joiner: Add
> igt_get_dsc_sink_max_slice_count() constraint
>=20
> For ultrajoiner min 4 pipes are required and each pipe requires atleast 2=
 slices,
> which makes minimum of 8 slices for ultrajoiner.
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3387
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_joiner.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c index
> 9a353ee1b..418ff26a6 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -457,7 +457,8 @@ igt_main
>=20
>  			if (ultrajoiner_found)
>=20
> 	data.ultra_joiner_output[data.ultra_joiner_output_count++] =3D output;
> -			else if (force_joiner_supported &&
> is_dsc_supported_by_sink(data.drm_fd, output))
> +			else if (force_joiner_supported &&
> is_dsc_supported_by_sink(data.drm_fd, output) &&
> +
> igt_get_dsc_sink_max_slice_count(data.drm_fd, output->name) >=3D 8)

It Look good to me,=20
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>=20
> 	data.non_ultra_joiner_output[data.non_ultra_joiner_output_count++
> ] =3D output;
>=20
>  			if (bigjoiner_found)
> --
> 2.25.1

