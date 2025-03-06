Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1728DC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 07:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC8210E848;
	Thu,  6 Mar 2025 07:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7GsiErX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6E710E848
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 07:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741246534; x=1772782534;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4EdFQmBdIGV2aYgye/Fo6Dvp2UwrpTusBIWLJ9r8lf4=;
 b=B7GsiErXKrLWgBl3KNWoCCe1G7dfyzZRVGg7zEhfGh+LDBIz1eOV5x1+
 06WvCOAu+kvE/7TPeluxpkFv2NVMA6oQDrgGCLRPvXckcJ/aVy9a4+RpW
 HFb0i8QfMym2Fu81KfWBX/8G2gmyR0/X/QFv3bBS9Q8m1QhJieMV2+y1f
 r7yB6rN6E+KUWr8tRpP2r6Wt+VSq0Ybe0+1SaNb382uAZ3gg6RGoEzRub
 umOxW5dNR7yFJcjcmdgw+JSwgX/JbAXWd9yJSDCCl4xBkgD67/KX5opmw
 8yJqS3bfFnV3QBwgxXpdCkxFXgObQjzK0TdmUIOlQQ/hGEM443nrld/Fj A==;
X-CSE-ConnectionGUID: buq6l5G1TfeYKCqZBVBlkg==
X-CSE-MsgGUID: pVfZy1mOSMijiKeosUeulg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53651311"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="53651311"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 23:35:34 -0800
X-CSE-ConnectionGUID: SdDQxvtlTxaNYWS55ED5yg==
X-CSE-MsgGUID: ChSzlzTfQA2fwBCmdthCrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123093944"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2025 23:35:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 23:35:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 23:35:33 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 23:35:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0RKSqTFo3iuqW4AERhwRi4Mn2m8/yBxK6fdD0m9DLameEsGGredpyBJ1ovbsjFXDcQ7AyiYvyyK77XywuwGra2yntZwf6X0EIb8FrWEhaKomcESwik9iAx7Pu6nEDgiL3JmBQ9Fd9Uc+6tLmLfU7cE0AfRSCoFA3uD8WKXOYWcQ4Hf2gt0JaFKp+m1E0GYpv8DZ4KO9/qlwBXp4YCgp7om7eNboFzKY1L3DTBE1VfoEG/GXQOJhQvbZd7dvrrXJnCE3mfxopRGKKnR4WEsKKszfxksOMdHnDqalc2g1Mk2bLF6CoGf95liDFArYHtnyZdiNWYkaPDQ3e5/E+jo6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zS+eTy+RGWW5JP1XqiDtrmymD3XCDZBdFrJxuE9w+yk=;
 b=BscCIIBLcMym1YV4hoqynAAHfEg82s4iSzUaLFgOLOQs/+Msc7ycFI218ckbT+/kriFXabfRQh6yf49x9x1zk4vhO442gc4Xgnu51YUbG0f1N7ExkhpTFSN03RIBG2u/mmP/GGB6/1mSSK6JEKfLPK9oS5G1fVxw26WTEWWRQOMgEs8HvV3YqdHIUm3Yfi0/UbAAazHQnd4czbDV9I0DTi3u7Jpo+O78+TF0sGUtNVTkP06j3glHESF/2tdI7SEt7bVQtHKqWJ79Ad8/jtQmOZC84BsIHj0tb/2V643s9VXYynArwb0xxrwMZK7i/TeYKu9EUcCWKvIJ6o+VFkL7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ2PR11MB8567.namprd11.prod.outlook.com (2603:10b6:a03:568::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 07:35:26 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%5]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 07:35:26 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t v1 1/3] tests/intel/kms_psr: Skip PSR test on joiner
 outputs
Thread-Topic: [PATCH i-g-t v1 1/3] tests/intel/kms_psr: Skip PSR test on
 joiner outputs
Thread-Index: AQHbjkoNGVoD6xvn1Ue7auhdTmqH2rNlt5ZQ
Date: Thu, 6 Mar 2025 07:35:26 +0000
Message-ID: <DM4PR11MB6312DFC9058C8E90BED65E6090CA2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250306033953.2519156-1-santhosh.reddy.guddati@intel.com>
 <20250306033953.2519156-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250306033953.2519156-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ2PR11MB8567:EE_
x-ms-office365-filtering-correlation-id: 61a79d97-707b-4e5f-5958-08dd5c81764f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?CbcE8pi84N/S9y+acB3yc1FHMxgqHwaTrBJQBCdIhvC5X3muwM2HmlH8p5Da?=
 =?us-ascii?Q?9w8ymkyeWRBCINUljFY44cfuHRo8eKIS0vkR25FN2stCMDdbw5Zo/Ko6NF1r?=
 =?us-ascii?Q?u748dW8JLxQGEs3nHIIdcmUBlXKVl8TlLnWJxU/e0WKjVxzo9vHdiv7MY6rC?=
 =?us-ascii?Q?6QZ9+KuzCrtV6Pfm7ujtbo2Hp6Hv2WJDyxyc4DKhXGrNQXzxVPyDtetBAJbF?=
 =?us-ascii?Q?vEPm9InAvoLejHgVjjWmx0oIJB7datGyTOfYxr2uzGMYpbXKs+6SFUoVNxWx?=
 =?us-ascii?Q?nnFqXkAYg7H0PPjKxqUY38te5+WkJ57G7U7tzX0LzVBqOdGp8QRu5h/u4LEz?=
 =?us-ascii?Q?km6lM8JZngH+rUhDZ2UhGf54zaKTt9rr1YTZnDyJAKxGTuNDfEqLQZraZM3d?=
 =?us-ascii?Q?fpAcK3eJz1XFS/m6OePbsTQPR8LgJ2KRBjJoNW/o09QIg0ek2N7J3510csBB?=
 =?us-ascii?Q?xOu1ZyhH83ja/rcK1MS7iXRH1hj5kd2/oE5nvV/fxsLWgZzDAJhZUgdKGM3m?=
 =?us-ascii?Q?Toz27IYD1C9V7iFpXmOTi7kdqbMdGG02lcmoTsLLyL0uPOiAoTILFp3KPxno?=
 =?us-ascii?Q?8PiFJIBV1KoemInMhVow7ldpNOZJlmJvPcDlGrDu1XMyQMAxn+L84zxXKTwg?=
 =?us-ascii?Q?2JPdPdU2qfI4IpwO5zGRvhRKxcZeQ/YT+6aRejMYDzrXHcDlJZ9Dq/muLTpM?=
 =?us-ascii?Q?Q+NTQVIf5Zcfzu7wRgolDiX7nFeGsbEvs7+DhJrwB8JRyAsSWi+9w0QbCE42?=
 =?us-ascii?Q?CRwFYoDW+Fu9fw3Fc/QkM6tS80t1TYz55bLYCj84rb3mCw30SYQxOk3DKLX0?=
 =?us-ascii?Q?bg7olLnLxi9QknWnrXDRf+2mpDeO6Xn2HdOb+tWAz6wo5fOTswFpSeAJEZAz?=
 =?us-ascii?Q?QEdEVXsoguEgTttlW2Mhz1u/WTXO63kFD958YWtHbJIy/QNzFWRFGWFBzh7C?=
 =?us-ascii?Q?2mEeAHNkVHI5c3jjrwNRlIheKffUT96xlrvEWzaGtBW1zaAuDbzT87wGhCse?=
 =?us-ascii?Q?afyixff+KeX21tys4tkxEyClOUWrTOhNeuxf0Ye0LbhAzr+dTvOPePk6CpJR?=
 =?us-ascii?Q?sJ9KP50mquET7N770wmFrrPlcK0HHIrQGD0rfoGSypWJ1HEl89v5N9iJVhi8?=
 =?us-ascii?Q?C7/Bn4YpNd5ibvs6vpm4X7Ye/cwh5RILBm7kCWdtSK5TL+9C0HHLoKqs9920?=
 =?us-ascii?Q?OmueIw08ZlBvhtn35514vs9TTv/Pu9z9ywz5SCE02sBigAIrSHVN1fpTKd6t?=
 =?us-ascii?Q?unn6bq0rUmkwiI2VkdMR1ChB3v6kiY5oVlSjcAUvXRcNkzQNKl0nBzCME8wd?=
 =?us-ascii?Q?dOb6wKLPcm4WHJ5bpxgQ1WuSD6T+KIy5t3Hn/9xsnnuRAOd/2jrcUB/LxxkL?=
 =?us-ascii?Q?HqleXJVOOQK6EM9aNLEg1HA+yGxw7HLFCuZ8uZhvzFoCz5g6anE8sKDIH4RB?=
 =?us-ascii?Q?albTVOUZiZRCz8h+cqGUqapI5n7Zn/l/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RA4oXX619fcqHsuymhmQagRw+DKV85kze1CXcMEo2HIn85R99VOlKacbEqO8?=
 =?us-ascii?Q?tT+nZOoX5JDkprUUUWFDai9wbCPwbsitLddwQPWxYBN8GTPsIaTFFfADjR0I?=
 =?us-ascii?Q?rtfiqaez3yJ2zTrcEHiTLPqoN1feRL7nyFLacLMQoJRk7hkzH4faib07T9uc?=
 =?us-ascii?Q?GaA0U/iqD+1/EtbWmY4n81lt2bHOZQ8UFDjcWw6e0QWxFLQw9C8jb6Lnd1l8?=
 =?us-ascii?Q?Fnbd8edEnEVGy99+fZlNVBqaimxuW3rYmiy/RSKVL88jIGDFJJdQb2AvclqE?=
 =?us-ascii?Q?OQQc1M2jkv+dGaekBU0H2fin868YRJVx5ZPnq9JnJAceRaTFcKetQjKVFuHG?=
 =?us-ascii?Q?0MMJb+NvPR+LBzESF/HE9ZE68m5FC+bTLD24GaCJHkbKWjaiCHHjTMLLtXJE?=
 =?us-ascii?Q?qjwmcP9K8bEzrc8O2DSpZ1Ilgn7rT/Nu/rQNPzQFIoirlvd/iD21DoAEjGRq?=
 =?us-ascii?Q?Mk6pXUi76hVXfGXWqsNIVtw6gfXY+HMZioy+h1CRA3JxnzmvBwIUtRX7V8JK?=
 =?us-ascii?Q?esFQtB4B48HsJLMBHT3tI1TZ74HEcfwjo1zA4HhPUBcHrzaffr0vJcHGEuJu?=
 =?us-ascii?Q?RR8hQh+Ks3s3afXPBNL8JfuJH6yuRKlWVdkm4DwNRqSM0O+JJGECJsxaXPEr?=
 =?us-ascii?Q?o5v43hfDXu6eXjLsk/mC4a4FzDQLeoUIW14wnmNXTePf60c+QdnMCCIfABXi?=
 =?us-ascii?Q?wdM/6ufEKknp7QsPKxIBBnS5dX1SDCGXbDTJ7vRWlEb3Od11qmCWLG6RRDlD?=
 =?us-ascii?Q?QuU7RAqt7Q2vPsZj/GCxI72MUDpiIsR7zOwndE4JLVtz1Sv1SYSlu1hUrVE4?=
 =?us-ascii?Q?e0fCNHXM10V5rm/AneMbZLsA4W6X2dCHRLnQSoRRg6USDvsd9Q7bSTqdTJkk?=
 =?us-ascii?Q?ZmM/LUsedvVkkQwI+EgL/OKnzGmFSGRSGh4RZQa0FN7xBvdTsu8Gp0jZk4Lw?=
 =?us-ascii?Q?75J83f3Gss0+g0ahdFfCjNnrYJmEHkvA5j742RmOYYwR+vy1xr7KB6iAfFUv?=
 =?us-ascii?Q?zwH2B1oBb6r+ahPUJY+2F456LCUqvQfb1O1wF3r3WVkZO9iTQP7pxKXn8FL8?=
 =?us-ascii?Q?uKes2HTp+9u84ZjG0dMd6P/Pj7eu/PLSEU3se04+BAHOuSS1vqsU1+khbIMS?=
 =?us-ascii?Q?PQE5DMl1ePpqABbi9DtS05eFuu/yRXSeF/CAlOTcNxMrARw50plUvFQcCUET?=
 =?us-ascii?Q?+ORkLcDT8DZ9p483xr0y+8zXnFYRBwdnwTPY6SIxip37BEPdFEmp6SZlfM8O?=
 =?us-ascii?Q?vharGc+Qqo+PjFE8H/G8VKk6cgB883x272C4Eygl41tOjdoLx+rsQ8cyJy+Z?=
 =?us-ascii?Q?OmOAGP9ykWvdLemmgACdi/JVbAZiB09d+KfLZxnWqb8Bve+mOG1HxOzfBYxl?=
 =?us-ascii?Q?St/P1KbRk/lZHd0pgDXC8XnPlJzDhig/Sc/avRx+VrwtwsYIU0y72/+ik4/r?=
 =?us-ascii?Q?Kuw3XM3qgXWQjAXD4If0Jl6s2mAZZ1vTcKj1LAe+a5JBvOsOtQj62U0l6wWp?=
 =?us-ascii?Q?WkszrDOMOGZjJg8BgqyKRN7e2QOh2YoaIDrunqWoyWX4ICB9m7EmyqUbHzO+?=
 =?us-ascii?Q?qzQ50wI9pAb6YnGkYBk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a79d97-707b-4e5f-5958-08dd5c81764f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 07:35:26.1679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L5hfSYy3p4T75a3nhxp7BLMvZH93vAfx3yJLMq29h1WZuOPZW47lvo0kwIu706Al5noFvGXolYn/XHFh/8wyQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8567
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
> Sent: Thursday, March 6, 2025 9:10 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>; Hogander, Jouni
> <jouni.hogander@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>; Reddy
> Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1 1/3] tests/intel/kms_psr: Skip PSR test on joine=
r
> outputs
>=20
> Skip the PSR test on joiner outputs as joiner cannot be used with PSR.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/intel/kms_psr.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c index
> 124d7be18..c930e3872 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -838,6 +838,11 @@ igt_main
>  			igt_subtest_with_dynamic_f("%s%sbasic",
> append_fbc_subtest[y],
>  						   append_subtest_name[z]) {
>  				for_each_connected_output(&data.display,
> output) {
> +					if (is_joiner_mode(data.drm_fd,
> output)) {
> +						igt_info("%s supports joiner
> mode, can't test PSR + joiner\n",
> +
> 	igt_output_name(output));
> +						continue;
> +					}
This checks for mode present and continues, I think its better to use igt_i=
s_joiner_enabled_for_pipe for the particular pipe=20
Or even load non joiner mode to run the test.=20

The same goes for other patches in the same series.=20

Thanks=20
Jeevan B=20
>  					if (!psr_sink_support(data.drm_fd,
> data.debugfs_fd,
>=20
> data.op_psr_mode, output))
>  						continue;
> @@ -855,6 +860,11 @@ igt_main
>  			igt_subtest_with_dynamic_f("%s%sno-drrs",
> append_fbc_subtest[y],
>  						   append_subtest_name[z]) {
>  				for_each_connected_output(&data.display,
> output) {
> +					if (is_joiner_mode(data.drm_fd,
> output)) {
> +						igt_info("%s supports joiner
> mode, can't test PSR + joiner\n",
> +
> igt_output_name(output));
> +						continue;
> +					}
>  					if (!psr_sink_support(data.drm_fd,
> data.debugfs_fd,
>=20
> data.op_psr_mode, output))
>  						continue;
> @@ -878,6 +888,11 @@ igt_main
>=20
> 	igt_skip_on(is_xe_device(data.drm_fd) &&
>  						    (op =3D=3D MMAP_CPU || op =3D=3D
> MMAP_GTT));
>=20
> 	for_each_connected_output(&data.display, output) {
> +						if
> (is_joiner_mode(data.drm_fd, output)) {
> +							igt_info("%s supports
> joiner mode, can't test PSR + joiner\n",
> +
> igt_output_name(output));
> +							continue;
> +						}
>  						if
> (!psr_sink_support(data.drm_fd, data.debugfs_fd,
>=20
> data.op_psr_mode, output))
>  							continue;
> @@ -902,6 +917,11 @@ igt_main
>=20
> 	igt_skip_on(is_xe_device(data.drm_fd) &&
>  						    (op =3D=3D MMAP_CPU || op =3D=3D
> MMAP_GTT));
>=20
> 	for_each_connected_output(&data.display, output) {
> +						if
> (is_joiner_mode(data.drm_fd, output)) {
> +							igt_info("%s supports
> joiner mode, can't test PSR + joiner\n",
> +
> igt_output_name(output));
> +							continue;
> +						}
>  						if
> (!psr_sink_support(data.drm_fd, data.debugfs_fd,
>=20
> data.op_psr_mode, output))
>  							continue;
> @@ -924,6 +944,11 @@ igt_main
>=20
> 	igt_skip_on(is_xe_device(data.drm_fd) &&
>  						    (op =3D=3D MMAP_CPU || op =3D=3D
> MMAP_GTT));
>=20
> 	for_each_connected_output(&data.display, output) {
> +						if
> (is_joiner_mode(data.drm_fd, output)) {
> +							igt_info("%s supports
> joiner mode, can't test PSR + joiner\n",
> +
> igt_output_name(output));
> +							continue;
> +						}
>  						if
> (!psr_sink_support(data.drm_fd, data.debugfs_fd,
>=20
> data.op_psr_mode, output))
>  							continue;
> @@ -944,6 +969,11 @@ igt_main
>  			igt_subtest_with_dynamic_f("%s%sdpms",
> append_fbc_subtest[y],
>  						   append_subtest_name[z]) {
>  				for_each_connected_output(&data.display,
> output) {
> +					if (is_joiner_mode(data.drm_fd,
> output)) {
> +						igt_info("%s supports joiner
> mode, can't test PSR + joiner\n",
> +
> igt_output_name(output));
> +						continue;
> +					}
>  					if (!psr_sink_support(data.drm_fd,
> data.debugfs_fd,
>=20
> data.op_psr_mode, output))
>  						continue;
> @@ -966,6 +996,11 @@ igt_main
>  			igt_subtest_with_dynamic_f("%s%ssuspend",
> append_fbc_subtest[y],
>  						   append_subtest_name[z]) {
>  				for_each_connected_output(&data.display,
> output) {
> +					if (is_joiner_mode(data.drm_fd,
> output)) {
> +						igt_info("%s supports joiner
> mode, can't test PSR + joiner\n",
> +
> igt_output_name(output));
> +						continue;
> +					}
>  					if (!psr_sink_support(data.drm_fd,
> data.debugfs_fd,
>=20
> data.op_psr_mode, output))
>  						continue;
> --
> 2.34.1

