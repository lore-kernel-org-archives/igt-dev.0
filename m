Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A582AC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 05:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D14E10E1A3;
	Mon, 19 Aug 2024 05:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXuDHPhJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E630A10E1A2
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 05:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724044739; x=1755580739;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LqX4AfoaHyI3F4ea8VYxRkGzUmlS/efS0ZhSeQb8jS4=;
 b=XXuDHPhJ4Fjtg8kkTiwrFDhevLDa9vjGamxDN6yTcKPYgWkBL9k+ez+k
 emY8KYweVYGGmBtN6ol6yDDZkYDp6ChUbv+EfdDqaWPLkCWokj3OpRlcC
 EHjVs+mq4ejFjciZi65rg9HQE8Qeqd95CoJkySsbgSCTe6p2kgSJBaSaG
 cXD2f+X7nW6y/fBy03Ptrsm4ubtLvZ8NWpvjwwQ+Hog56GCKsUaSEDWjw
 KCyZlfiC4RMd9+bmGfqX8nyxaPx8RuDCSE/o4MOs+RzGFqIaV3kHJqgOm
 ZhrX7qA+fSuC6B098pkUupAkihA0FnmgTzFQV9dMZf7GQQTpVquOaGR8f g==;
X-CSE-ConnectionGUID: XVj8FSXkQtCUih6kTqqMSA==
X-CSE-MsgGUID: pyWFE40iTNmqZE8YMFzOWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="32837930"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="32837930"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2024 22:18:59 -0700
X-CSE-ConnectionGUID: zyi0i6JHSJugpiRb+sgZXg==
X-CSE-MsgGUID: 1pijlkJcQBu5MCLghSq0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="64910692"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Aug 2024 22:18:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 18 Aug 2024 22:18:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 18 Aug 2024 22:18:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 18 Aug 2024 22:18:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8YOF198EdYE3mdjRvTTQdntN6K2jIO48M/voKfK4u+n7KAH4RkblDTgbOt7Lpm/tYgfspgkNUFHGCujrqFOyw/Nz6jULhJyOoJCLBrmEGICxevTkkWOcqTBpBxsrGsbHNtTmCuFeSkIAh3YJ1/CycKvVOy5IG2wRcctKS1BqKFMuLoMjuyFS/GmzFa4ZZnXhXQbWsE93ZW83w+WoM+UZJtMZ2NbVMdr0vX4igBy16vd1bpPac4b3hKI8GCy+D6EfrdrxQ0oVXFXfKt2HV8ItSxGwSzm8z3O/hEonfQgDIF2JzEAAs5cb3ulPM5sSLt3gqFED6TSNAHQ6X1adJeeRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/UFab3SMquxFiUxE/9RT2BgCVAyemCeuOqCVbKbvL8=;
 b=Yqo/LgPKv4seYdw6WeRKJHvvYc2cytGNKM16ywByT7KDLYlJ9bfyw1cNrRXHqxTg5ia9yx6nxWb7Y4VLnksxN7g5O+4XTTYrF8ixNaH0/ahOcLBLMBM/y+13iAMvM2JZB1tFkbVIA54uH+01rIAqubkdztGs5iMkZ9FSi3nrGR2VK4wTMnJrtI6I7dUEDDjEJ51upspQsVcg9SUBuav4BZleR59mD2zmbmSxOOxKvOzMG9oCNIMJLhOKSew/L+HaMK0cdeNwgxl7ce0Oil5hO7mesd7reMk4P0j27TwKhi8tzV9bveyQikVd+07H6cmMjzrDNXpS+61rqNjYffMAOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL2SPRMB0001.namprd11.prod.outlook.com (2603:10b6:208:412::10)
 by DS0PR11MB8229.namprd11.prod.outlook.com (2603:10b6:8:15e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 05:18:54 +0000
Received: from BL2SPRMB0001.namprd11.prod.outlook.com
 ([fe80::ddfe:7efd:a50e:abb7]) by BL2SPRMB0001.namprd11.prod.outlook.com
 ([fe80::ddfe:7efd:a50e:abb7%3]) with mapi id 15.20.7875.016; Mon, 19 Aug 2024
 05:18:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t 2/4] tests/kms_content_protection: Move try commit
 call
Thread-Topic: [PATCH i-g-t 2/4] tests/kms_content_protection: Move try commit
 call
Thread-Index: AQHa7ThhuYIenrU010m0tWPzbUg3I7IuECeAgAADRIA=
Date: Mon, 19 Aug 2024 05:18:52 +0000
Message-ID: <BL2SPRMB0001F128778BB15F17CC8FF5E38C2@BL2SPRMB0001.namprd11.prod.outlook.com>
References: <20240813041936.4014668-1-suraj.kandpal@intel.com>
 <20240813041936.4014668-3-suraj.kandpal@intel.com>
 <DM4PR11MB631243C49E154335DFEAC49E908C2@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB631243C49E154335DFEAC49E908C2@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL2SPRMB0001:EE_|DS0PR11MB8229:EE_
x-ms-office365-filtering-correlation-id: 4d284148-c0a1-474f-040e-08dcc00e6a43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?o6FMsIqv99SMf8Q1DxFGMOvMGPreLZx7BVG4T8Mer+WoSA33AKZnQYris52k?=
 =?us-ascii?Q?xKDyUpEzfsk6xvQVPMQPtiZCMZ7/ea+hM/F4NoB/XmkT7eVUBxW0lQF2B+Bo?=
 =?us-ascii?Q?PUVHA0O94cd2C0OSkR/1xN7Wr3vJQWW0P2QuIK9HdDJzEn5c29v2LeNZ6Cvm?=
 =?us-ascii?Q?oPGDax2JsLtzrWAQomQHALTYQP0mmm/fUAGTzy4GVq1NBpza2qpv2HKCIlcP?=
 =?us-ascii?Q?cPMtN5azAhsVYp7YOay/0QQ8aY/hmE9SU55XpfBwjhCZXXzOn2u5m3GFx5JD?=
 =?us-ascii?Q?YBbOzR9QVRWleWOhfI4ILqAaWKt0sZ2wfsQ/lTwJA9by/3eL5d31mMPY8rIj?=
 =?us-ascii?Q?mykMAQSpGPIflfT17yVIhLXp1obAouIOUDbfGcdd82do2jsRX0OQPadK0ICx?=
 =?us-ascii?Q?9LZJIpvCG9sTtxhM+IIbpxnAKyeoCkKRc5wjFQ/LxKuWkTucKMVaUA3eRifu?=
 =?us-ascii?Q?QFkxc763zFTV8wzt9J03YVdcVDyMznl5Y17sIbhvkTeprRVY2YcgRjowE1nR?=
 =?us-ascii?Q?ZCOrqsAiIXb3LDARI6BvrOegiHJ4HeZGK5VugzfYIAjKZQzHHu0Y8KrrMOzi?=
 =?us-ascii?Q?l5JvfV3NZtqtHiAX4ugG5Ll03K7vVEskMCpT+uinpJu7Wytl67FIim5Uiatv?=
 =?us-ascii?Q?X2QUTQmMFaVa+49xZtHn1OwQn0594ojEhTlUE/Vv/bH8HtWc+0RA+QHuqOSS?=
 =?us-ascii?Q?zSjjZQfd7OPWJooXjKQkY5fWzl4INj1HvULw/HNj2feCm9gc0oQYuOBp+hqd?=
 =?us-ascii?Q?aKYxIMbGP3makALZJ7ctLnTEz7op0/7eOeJEiwfjkDE4XAwHhPi8xkkhBTVj?=
 =?us-ascii?Q?TkryuCMXuqUH93sCYqR6P7wm0JdA6F8qFaAG5IQ4Ru8T/PgjfDe6wQwhTw3X?=
 =?us-ascii?Q?9cp9GiXgrXUgdpLxzwYjxMmNko7G1FnI5wgbol2DrecM5HOrVl7+Yv/kahN+?=
 =?us-ascii?Q?nlSrZbF2X6VlTehavO+C6KhgvHG1409WbR72YcsEjHn16xgND08WmTLAmRgT?=
 =?us-ascii?Q?hz3Py02tqnSI1v4V5Fl6nhR5B2j58SeJGFt0IxqkTMDSbliS4iOW9FOqZRdq?=
 =?us-ascii?Q?ZJyAMRabf2pvHm6OuMRwpE7o1mc3HOFOG8IMdH+pvGIc/GLSiMv6NTY80CNQ?=
 =?us-ascii?Q?aplikGWMvaKRgXPwD3WnwemZzd0toqU/fU6xGmmNEA2RqkCqwrho4lBVqMuo?=
 =?us-ascii?Q?k4yXpgtG+6JXEt1q1lcCXMQR+Sr/v5aZrbSAQr7WHrbBDCfcW4zSXURNeJhQ?=
 =?us-ascii?Q?eOmgYMx79TYCnGQVHd1HrvFEjUVsd92McZyXDNahj2d28W1lF3k1yu+U1j3T?=
 =?us-ascii?Q?ToBM8MMzaOV6lQ0VNTeCgtuRdeKUQ9orJZopJFLIO3uBkvNVXc20XMZHIlqA?=
 =?us-ascii?Q?9YQChFOtfG8t27cZavRpfIF8i3BeLQe2OyOBlNo5Ck6Jt6KvOA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL2SPRMB0001.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QFxmEEcfUtzI1b/biizgACvLDtXYOfiPwDV0XOqYUnroyjhXnXyaB0ZuYYB1?=
 =?us-ascii?Q?U9QsDce7B+ThO9gUL8CYuwjBodbZp+/mMY5K16p2IREmsHBHBB0qQSrb88FK?=
 =?us-ascii?Q?KneEQMRXrVtQBRxlW658WedIanLKixi9yBX8lZTY/VvfW8SCwPVBd9EVn+a+?=
 =?us-ascii?Q?p0WR22wjtQCAvsZI7+ypl+x/pS//Bb0Kh3sWAlaulRAeFGnGldU7XmMUp2sD?=
 =?us-ascii?Q?KBR30kHk2oy0v0pRgzd/QmOeAcDLuXzDsgA1HUSWHaUkirTW88QRtWzfnKD/?=
 =?us-ascii?Q?rMpKKFe+ClRkBKTZJPJGuctPjLgipnvQvfflaK7ec02uPGuOv9UUyL6XqrJW?=
 =?us-ascii?Q?kkuX7mmwVUvBF1Y0pRPc9VFYIeoQs1WQIwoA47bAW5rB/o3fzoC8oltO9sCY?=
 =?us-ascii?Q?pmzcEzj4tZl/6gwgMTJIVhkhuT9VO7PuGXkiT+EKfXNZ0hrRQGxPuw2W2wXC?=
 =?us-ascii?Q?fjwRyguat03XCerP4oGZETcpREuiN000UxzlyERUQ/qtNHdiz1mcOBl3dAz1?=
 =?us-ascii?Q?CnDtVvushel/jStyPOgi1XkR9lKt50+TF7tg8v0RPu712WgHaF/5E24i7GQ5?=
 =?us-ascii?Q?a/jaccUMznIXYAGF6z5+oSYm0ygFEyAoBI+pHSZ/3RcxbPoom2kDMBz7KiQO?=
 =?us-ascii?Q?riOh64aazIhZcI7R7LbwI/KzqdBK6hILUXuAOQigsSlRWH1jIwzUCUcXXLJS?=
 =?us-ascii?Q?phGmyGsxs7yH+asaE62w9JWMvISie6tMjScCuldPHN29yD29dSkVkrzeq486?=
 =?us-ascii?Q?gcTR9z8bM426chwfuchxbwKp2DhThI1AKaJyAGL7B2gORzL8K/LEaYmdIjxT?=
 =?us-ascii?Q?3B4zxzA8DWbCPuZI7xlnhmzlekzktDSSoDu6G2Rlpt2paLYivu5fT6kfWsgo?=
 =?us-ascii?Q?g163UR/m+byKGYza/ATwjYa7mkWso3HIFT6erByu8DF9fmcsQuhp+mPwHckH?=
 =?us-ascii?Q?oLwlvVuZ5+xWqLn/bd9aVMSCTR8yt0JRN2l8QyA7oZU11p+JF7tDh8wM9OjF?=
 =?us-ascii?Q?uWVIG0EU9DwHCYm2G12Dq9rjCZjtv2XKU0F6fjn06hBjnuxbU1NiEMoet0ln?=
 =?us-ascii?Q?tQQqydTd8UMxXJEbBCfcNMgNFTtIIm0GdSIGzeN7EfNyX/nmZ5LFCSslCL1Q?=
 =?us-ascii?Q?55SaK1uOcQlpv9LImreUVu+2Z1H3MNQs5UADLYF1CXpNlXLdqONWfiV70FzM?=
 =?us-ascii?Q?YCNa/BxvMeWzdfpDQjZFwfluAtogbvtHn15gJjuiONC7gFwGeBXDeGkHgIRu?=
 =?us-ascii?Q?d/ZGZyC5Z4kQInX9kV+u26+L+/ORyVYEMG1CsV2jS6wcMy8Bn4L9VyFfJDFI?=
 =?us-ascii?Q?SjTI307T8bHGfmnubVyeey+ikplh31l9jTIQvvIHj3CRYAS169/SdYGlku25?=
 =?us-ascii?Q?yD3Mlrcw1qUXmc8vW4qZKVuW8HaF4Ii+XBSgsu930Kdrf3vNs7KsDjNFXcuz?=
 =?us-ascii?Q?yWhi9WVeZ5Uo0QGFInaekD+CWNg8V4gF2c739+rOcf3wQiBhpekStmbzz0tj?=
 =?us-ascii?Q?KlNGs4RwEorWtACduQywLzEN8CtEedkhokpg0iGv7icMc0dttHpt5vvzFteW?=
 =?us-ascii?Q?1+JcuiNwlvEMV6i40qJJh3q/8SwReMEb6fA4dYmX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL2SPRMB0001.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d284148-c0a1-474f-040e-08dcc00e6a43
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 05:18:52.4315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xObk7E7gern2nz3MJrbisEwJELXnsgJm29MXH0Mu0rtqAwn99YzV2oVNnPu0rapj8l3hR4Se23Iyj2LeeGcc1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8229
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
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Monday, August 19, 2024 10:35 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: RE: [PATCH i-g-t 2/4] tests/kms_content_protection: Move try
> commit call
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: Tuesday, August 13, 2024 9:50 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> > <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH i-g-t 2/4] tests/kms_content_protection: Move try
> > commit call
> >
> > Currently we are calling try commit twice once in if condition and
> > again right after that. The correct sequence should be we call try
> > commit again only if the first one fails.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  tests/kms_content_protection.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/kms_content_protection.c
> > b/tests/kms_content_protection.c index 6bd744351..db6dc17b1 100644
> > --- a/tests/kms_content_protection.c
> > +++ b/tests/kms_content_protection.c
> > @@ -679,10 +679,10 @@ test_content_protection_mst(int content_type)
> >
> >  		for (count =3D 0; count < valid_outputs; count++)
> >
> > 	prepare_modeset_on_mst_output(hdcp_mst_output[count]);
> > -	}
> >
> > -	ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
> > -	igt_require_f(ret =3D=3D 0, "Commit failure during MST modeset\n");
> Sequence change doesn't looks correct please reverify.

This is actually the correct sequence currently what was happening was that=
 even if the try commit call inside the if statement passed
We would still end up doing a try commit again what er actually want is tha=
t if the try commit in the condition prior to this fails
We adjust the params and then do a new try commit call.
Ankit maybe you can confirm this behaviour.

Regards,
Suraj Kandpal
> > +		ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
> > +		igt_require_f(ret =3D=3D 0, "Commit failure during MST
> modeset\n");
> > +	}
> >
> >  	for (count =3D 0; count < valid_outputs; count++) {
> >  		igt_output_set_prop_value(hdcp_mst_output[count],
> > IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> > --
> > 2.43.2

