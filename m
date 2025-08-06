Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358B8C87FCB
	for <igt-dev@archiver.kernel.org>; Wed,  6 Aug 2025 10:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BED10E3CC;
	Wed,  6 Aug 2025 10:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYaLYEV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5A310E3CC
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Aug 2025 10:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754475750; x=1786011750;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eyiRm7bb4Qf1A5knxmtU3L4yO/5RmgDGGV8mBuDK+GQ=;
 b=FYaLYEV9YZRJ1zU1KH3pFtogSDcQftXD7uO+P3JIOcb+06N8BKZ+OqJq
 6if6JX/DnUAGhPZ7h05KgagBlKQNAbFHZWoZiAVXyB+u8y540a0s+ciey
 RSjsUQAqprbHd6PVFkW8SNILuFnXNLjNXKLfk41E0ubH+cEYZpr6wbjP8
 tOcMXEo7n6I03i4nkOKKFvmejb8dB+E/aBR8jh2fsUkUDT16x2okhrvTP
 lVrBpEQoR+szhz9I/DPMeyQpLdWUM7E4cpfQ0vFmw2Ke8SANZct6pk/OZ
 CYbgszwqekX7mg6E9JCpTdUv0hOB/AJtArsFtrb4RaUqGu+vubWAFXOx5 A==;
X-CSE-ConnectionGUID: urSFwd72Q6GyY4PmkfdkvA==
X-CSE-MsgGUID: TITUdm2RSiekSrrLIomPcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56502330"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56502330"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 03:22:30 -0700
X-CSE-ConnectionGUID: hUAZbCRuSQio/3Vp/sqawA==
X-CSE-MsgGUID: prtE0C/pS+Kodzyh9P2JMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="168987307"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 03:22:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 03:22:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 03:22:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.87) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 6 Aug 2025 03:22:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6Pc5uB5+SwREFa43AKWs/18YegyshM28XUC1HW7DGH+MUYQLuF2EzYmmiL/YAsPC6xfR4T8b1n1ZyBzhlrDE0nUoEdU6TkUrtvv8+e/cqJGH7+6ni4F+mZ8hBK7SrckMk2/2cC0v0KwEaQkuv2TeNQKBxFaOyPEaxOIjBfdoW4Jj7K0I4tRIhV/A8uRo3W5wszeMcaNi6lyJvKGv/3eb/4vSXxoi7CRQmWVlvR8Fmbpyw9HFCavpYtZqtQ9y1M9ETd0v6/gwucJCizDu6C7cDJIg/qyVjDgeZIx4MpQAbUYudXRZ8+qbjg06uesIX97cP0pQyEJWjmi+dcssZLBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYKkO7nnZO6C2vDW1h1wChRJ1EEnKA8Q2eoOLQi8edY=;
 b=XRgzLRz5tgST+AsvC+38P4/z40ogPqWUzQ9PEFA/MPAgqdFivQhiKJykgkxFEbHlvEb45yE7hDi9v4utk/xvO8umfDyPkQOS75nWJutnaRJ4xfi8lCAJCiLPWxT/K+tIVEB13aDhxLL8HcMoFxhy5SSO9WqT0BOV1eOsVaLk/NO5YzEiIQgv4zLXFE4yc+TiK8jVZGEbQs9qRnbckuV7oDEK32GiTVMUWFseJvy4iSu0d6XxTnOU1LQufo8mTuGgUE+GyG5zv5AF/XvJoFoknHlYknw+b6jpUM6VQBZ0aMu05tia79HiSGdMe9VO9CL78On8bKRdLSBljse1Hqj9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MN0PR11MB6205.namprd11.prod.outlook.com (2603:10b6:208:3c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 10:22:18 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 10:22:18 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH i-g-t 1/2] lib/xe: Track valid Tile IDs
Thread-Topic: [PATCH i-g-t 1/2] lib/xe: Track valid Tile IDs
Thread-Index: AQHb96e7r7NnJ7AMlEq5M1iBcBirxbRViCDQ
Date: Wed, 6 Aug 2025 10:22:18 +0000
Message-ID: <CH3PR11MB8434DD5116E72B3971CC7D9B8D2DA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250718054908.1502234-1-nishit.sharma@intel.com>
 <20250718054908.1502234-2-nishit.sharma@intel.com>
In-Reply-To: <20250718054908.1502234-2-nishit.sharma@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MN0PR11MB6205:EE_
x-ms-office365-filtering-correlation-id: 7e9e47a7-1d7a-4f48-03c0-08ddd4d31f24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Dmu8fvRCyAtmGw4rAVWWSvLzqLwhQGTPlcSVhxgwRAfHWQuP454mcS0N05sJ?=
 =?us-ascii?Q?tbwmOmL2GOR9DpyMUEmmYKbFBcUABIjMzPF+sZ9nFL9bVaVqocPsbJ5ZvNI4?=
 =?us-ascii?Q?2h/c0X1qlh8ROsLzsAMeKOVl5xM/VwR7xnierI3Z3EWeeEx7euYUFuCqQWVw?=
 =?us-ascii?Q?CoXthSKtP+fFTiPThdJDETrcyKGEXvl9MedAxppP+tRrr2oTKagrOnfxEaP7?=
 =?us-ascii?Q?ih6jLsbTn6J919nHNN+jrPuhKV/EI67wJ58ZICUHkwl8oreIFmQWBWQXu+6a?=
 =?us-ascii?Q?Smn437XtvjHOSExptUz3OqvR//HmEE7/iaJF6+7cD3rNlILQwDkmqVrkDFaH?=
 =?us-ascii?Q?UKa5n3c5xE+3z80MDia6ofMFT7BOOis5Q10gITCsyEjfxDz3Se7VVv/M3L0W?=
 =?us-ascii?Q?KKsqhw1WG0vaEQWUAqnks0roC3IiEH9L9q4BwiCmvz/MyjpHB8+7zGiMkb2s?=
 =?us-ascii?Q?T5xRPOM/0dP1d4iZVfX8eM9pFB3VmPAehCsk+9mlgi0y6HlFqgAoXJ4uLjjU?=
 =?us-ascii?Q?7xx6kdRfy9/UCiVSAgAOxHAuAuxOfq1cpWA9MrJgnW/Htb8Tc8gRtAMai8Ob?=
 =?us-ascii?Q?CAbHIRuJUqh/cbqLS1uK1aUWZohZBJ3ima7wll1eRCkzVA/++05w43WAHPGD?=
 =?us-ascii?Q?Gpo/O6V3zJY9GWumo5owhvIwGYTA6BUeoFcjx7tbzofuCbuOjIOQ5nhYDmfz?=
 =?us-ascii?Q?V+0yXK85NZ/pRdog9lnLThLL/uYZHGSDl6cIesZAlgqL2KAVdPdEj1xEhOWG?=
 =?us-ascii?Q?DFZesgHOchaBrdYyVDybFdD32WcG6FWHyK62GzgvwAG5aKwuNlMEIrxWJO5G?=
 =?us-ascii?Q?EzF4/qAQZGDLeaH+q6pldI8Y0nG+ZeSfkd3EoUrJE0YlLwXHD/BQA2R+5Uas?=
 =?us-ascii?Q?OYJj6m12F7K+Arok9J3UsaT+rtFLA5ZMQHIuIxBDOrrEu93/3LSiaf73HuN5?=
 =?us-ascii?Q?O2lFb/FGURGOpcuGlDbCfHHuoqQ4Fp/+Ppn7v5PDC9CRwz5Z3QnHOeLtRIEN?=
 =?us-ascii?Q?0FMp1gQfIJZRkhoAxFKZ42WL1Fc5Rq2TsnVG/aRaS5mct08s9SRVtlt7yhC+?=
 =?us-ascii?Q?LI08PjN0nTMTM9u/0qEW2Zl3pN405d2zOrQEjl5RXVwbEyHpfUTib0edeNX4?=
 =?us-ascii?Q?FWEi/2pH3kvpPPjtKowpPoG0l25sxuZUpKEx2QTDLUak44HiTDwVuIVM/xos?=
 =?us-ascii?Q?ZZaUELx3UUKi1R6Mqrx5e4di82cqHqFiJxnZ0gE0GGv///UvKaBleMDqlpwN?=
 =?us-ascii?Q?pUuBvpUZFa7tcUdDs6CLuS29sb++gYftDLgPdtRrLDrcWDhPDjTfzJMJ/oFO?=
 =?us-ascii?Q?1YDFa1Ouhs+zBJcqcqbPU7MbMXW2/pt39+vyhqPboDogfgjQtpmZYxVhQl6R?=
 =?us-ascii?Q?hgKgSgYSsaC53YOLfJPYZsf0kTG5xXW6Ddh83Fpsq4J5+alsn8iWiWb8xJ6Q?=
 =?us-ascii?Q?HaXsDTsSOuZU7fbNNVjI0Q8B8YHxlWWXSxVfAq8elNY1IU+ck+z6duERiXT5?=
 =?us-ascii?Q?Ux35jm2jhBosYwc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QybL+pG5GInQzwZR7pgsrrPs2CPW6LvI40RIufybMrIvBJRbPQIJ53BfWiAR?=
 =?us-ascii?Q?N9+yS9myVApbZsax4toWzd6CEWa/94km93wuF8Ha0aGR6TAgKfVziKeNtRxC?=
 =?us-ascii?Q?gqMq9NNF0d8e/EtJnlP6ajSIDAuBQUD/lb4BDXb/g2nWKxC8tyWMl4dSzYJq?=
 =?us-ascii?Q?FBkEnBbcvxnHbbES6Z0UNrOtkspLN/Txn/khrbS86M7adXtVvZRSQ9Xatk58?=
 =?us-ascii?Q?vm9FwYeCszBwH/0jdOONwRf/gy1gq0UjlrMXDgWgDiOeBNbGpL8SL7iEIi5P?=
 =?us-ascii?Q?jbWJg3aqhkpKYLI240qstC6oVuHPV2bsi97wsL7IBlLWwIjQBVoN2UAfg6mO?=
 =?us-ascii?Q?lcq8CFsGcTRQbMcCe1wZi4SqeVG7R42/+6OsZAto2ivfOQ4dZKzEs8rd1FIu?=
 =?us-ascii?Q?WEIvjtlHL/R+T4X6KfL+XccKLaeLC0HtsdHhO4zEDedpS3MTqAMCvkl5t/3I?=
 =?us-ascii?Q?Ex2gXMa+MXztOZjO+KdeJt5WnGBwrxeZVBVzjP/2mVUjeyN+g1mtqw8oPCPA?=
 =?us-ascii?Q?hpznhS2479V1kRmXJn7ObCdgNiHM63qLg0HCULpLPsW8zXQuJOWOzuwA3jQV?=
 =?us-ascii?Q?qgzgo3FLqK07XN76WEgss6oJsMN8cuzjw13O8Zj8wW40mSvWO35FfFc5R4To?=
 =?us-ascii?Q?ELR6tL1lWEoWb34qKQNXX9kVkHCEgrsHQ8L+4dXCrUIrzn1SkGi5IytaVP6E?=
 =?us-ascii?Q?+Du+IVCMc9Mr54qw/2DwXHDL6enVV4U6c9/mG2ptMiIgh/BAzLPaG6MEV1I2?=
 =?us-ascii?Q?BCYqs3Ty3XUW0hcS2qS/EJJr0O+MIdgJbS5AdzXjTMxFxgmskdVLvm2UzFNL?=
 =?us-ascii?Q?hRbO/hlsWG2jWX9OPJGFWhIHtx7cVVvsmGAOtj837Y9IiIkJgdWWgt5ioYjt?=
 =?us-ascii?Q?7mUceE4/Q1fV8ifvI+NTlB0lzWHy30h6aN2Tm0NT4OY3PpDzLUUeu6WOjPxr?=
 =?us-ascii?Q?Y12q4NCCoU7uZXceRjEq0LIJHXBbI+/vfSjC/nCawwaL8aOE7orEvP2IfuXb?=
 =?us-ascii?Q?kceV/QhQc9uzP4PhIH/D7pTOQKcK0r6KjIQbKI73329u/oVotsqxgTXI7uI+?=
 =?us-ascii?Q?54vcRnkkeFgl1AjzITCzbJU1aKrkG142eB8b68K8dH4IWja+WAW82ff8KbaT?=
 =?us-ascii?Q?iWDvYj5fKBaeNWnLn9XJOpdUkKzd/a5cGuzqxBq9gTFvvW2iNp1qybtQNCNM?=
 =?us-ascii?Q?dD9OEc0qrrFL1p+YSBkeh+U9HstovEtFT5b2KZHfOv/kwIYN4uGhCJ5MBye8?=
 =?us-ascii?Q?zB4RJz07cNXE8BXSpRdmdnvQhJF4Sq0Bu512m+VY2ZGbIapAUnpWAdbtWmg3?=
 =?us-ascii?Q?/jx3kilXwsPnMCLHmfwhPLXXd/qqSLalMyAhE2oK5TXeAeOFxeH/xEtx9TN9?=
 =?us-ascii?Q?++EEhFHS6v+AoSNjcGt44sn3zK3a6u2nPOD6Mm3hNzHgnM3ZVs3UF8z1T6co?=
 =?us-ascii?Q?dPoP3ht8+KTOWI2kcuJf9ctmhDoBLUwEIFtPfdnwUrLHJpDxDy5fh5h5Z0wv?=
 =?us-ascii?Q?artaen/4haa5wS++iyykTgBwHbZ4SymipDXz83xR901H8P/YJkVtl6abmut/?=
 =?us-ascii?Q?4Claj8APfJohoGNxMFud4CV83eTSKg3yDGA5EkB8+SkF1AshekYrTn3vFnZ0?=
 =?us-ascii?Q?ksSJWXzEsewSASWtMDgOB0A7onbaeUju5ZYgv4wM6x2+90Hfhvas4rzrI9X2?=
 =?us-ascii?Q?oxaHXQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9e47a7-1d7a-4f48-03c0-08ddd4d31f24
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 10:22:18.1672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RYdXczH7qEWHr/YYS6D/yNVKTokgix153Gz+j3ziEHRr31AOtmnRoVkExaF3ZEOFUhZsi43BAAk76PCw51Vrew62JSP04HxtnWF1RydcYPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6205
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
> Sent: 18 July 2025 11:19 AM
> To: igt-dev@lists.freedesktop.org; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH i-g-t 1/2] lib/xe: Track valid Tile IDs
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Iterating drm_xe_gt structure to get valid tile ID instead of assuming ti=
le_id =3D=3D
> gt_id and finding sysfs path for GTS in multi-tile platforms. Initially i=
t was
> assumed tile_id =3D=3D gt_id in multi-tile platform and if gt_id =3D X pa=
ssed, it was
> considered tileX.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/igt_sysfs.c   |  4 +++-
>  lib/xe/xe_query.c | 12 ++++++++++++
>  lib/xe/xe_query.h |  1 +
>  3 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c index aec157b5b..af80e91ee=
 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -226,6 +226,8 @@ int igt_sysfs_open(int device)  char
> *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)  {
>  	struct stat st;
> +	struct xe_device *xe_dev =3D xe_device_get(xe_device);
> +	igt_assert(xe_dev);
The above 2 lines can be moved under pontevechhio if condition as it is use=
d on that condition.
>=20
>  	if (xe_device < 0)
>  		return NULL;
> @@ -235,7 +237,7 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char
> *path, int pathlen)
>=20
>  	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
>  		snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile%d/gt%d",
> -			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
> +			 major(st.st_rdev), minor(st.st_rdev),
> drm_xe_get_tile(xe_dev, gt),
> +gt);
>  	else
>  		snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile0/gt%d",
>  			 major(st.st_rdev), minor(st.st_rdev), gt); diff --git
> a/lib/xe/xe_query.c b/lib/xe/xe_query.c index 3d628cb3f..70ce625d0 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -517,6 +517,18 @@ const struct drm_xe_gt *drm_xe_get_gt(struct
> xe_device *xe_dev, int gt_id)
>  	return NULL;
>  }
>=20
> +/*
> + * Given a uapi GT ID, lookup the corresponding drm_xe_gt structure in
> +the
> + * GT list and return valid tile_id.
> + */
> +uint32_t drm_xe_get_tile(struct xe_device *xe_dev, int gt_id) {
> +	for (int i =3D 0; i < xe_dev->gt_list->num_gt; i++)
> +		if (xe_dev->gt_list->gt_list[i].gt_id =3D=3D gt_id)
> +			return xe_dev->gt_list->gt_list[i].tile_id;
> +
> +	return -1;
> +}
>=20
>  /**
>   * vram_memory:
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index ca0b3235e..6ff85=
76b9
> 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -98,6 +98,7 @@ unsigned int xe_dev_max_gt(int fd);  uint64_t
> all_memory_regions(int fd);  uint64_t system_memory(int fd);  const struc=
t
> drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
> +uint32_t drm_xe_get_tile(struct xe_device *xe_dev, int gt_id);
>  uint64_t vram_memory(int fd, int gt);
>  uint64_t vram_if_possible(int fd, int gt);  struct drm_xe_engine
> *xe_engines(int fd);
> --
> 2.43.0

