Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369CCC369AB
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 17:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD82210E0F9;
	Mon, 21 Apr 2025 17:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c08MMn70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0918210E0F9
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745254817; x=1776790817;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8TTJuUU9xl8wVLKCxt20k8sLeEd/rJPemU3XI9zTBAI=;
 b=c08MMn70l8WYFJPi1YrWNP9W4+JnyC1M/5rAaC5BredcIz0fqjJnTcda
 KHO9jDVFa3fkouLsdnnovM2WgQwsvBKT+64QH4ye0pR5Dd1vN4wXQnxx5
 tAqdYcDzgDOVIRYhE1OeDuA02zc1ro65ZrJe07gxmfLVY4WX4Lr2Hi0C8
 ghxm1ZRcBuyhwpoDloI0XmUryd/Lq2QML9rWdHJPyDbFWT+pnFT4aMUu/
 pL6JlmkehfrjbLS/BeGfl/2PWUO3Pt6nnOFz8GM6LG7KZ5HMNchc8uIUK
 Su3dQKbop5xd/n24LUups5iaUit3h5eL4p/XXbUOniVxW40ROc2Haz+Cx w==;
X-CSE-ConnectionGUID: NWt5VEZiSaCoe0FwH8tMKA==
X-CSE-MsgGUID: y2oQ3ASnRpuq3BN3Q5TGFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46966760"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="46966760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 10:00:15 -0700
X-CSE-ConnectionGUID: ceuYy2sXTHqx43BP4bSi5w==
X-CSE-MsgGUID: gR1VNnsAQpOZHOXzD9lJhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="132655643"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 10:00:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 10:00:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 10:00:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 10:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skiISdfPLYtc517ytlDFE4znO5KvR9Dg9xwkA9gra+oF9zP3LqjwOxrcjkySX8o0+7UeoBLTliZN0EALE1XfAT9vZtU0K/idWka79K1Cg5UBhb4NpYl1+En2HYGIP1x8nupDcHGnd9yDm1XyMqAX8TT+3sTQZuqdRujmeoKCw/e43l5RwZ+kVtznSB+eXRS2DE2GGdT06UXA6ZvXzCFzpePhM0zCkQvyyUSLCLTM5oElKbw8lDjo28XuinEoJ4XECPTzqk0s1pwlCfpAi8uHGIwPneeWsD0p0VYU/6GuUHR5XoayQ9CWA92oDS6tG9b0YseBW88CziTcDRZQHFkxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3Cbv63S4RHws7pqmaKOnI6AolgZmnJdZ6jLDsS7DDk=;
 b=VHNLS+v5sZ34nUpd84gcVCNGLneHpvDcv6MYNNTCccmO16R32BQdUFuW5V7N6eDyLH7omWz2lZv+/Z2/ew5y1C+zdE8XLbP5sCYBEziMhFktfMlzqaJ71B0Y8e+lCAZQod7+r0vbhsxz+MtlEDhZYtS0V3qXuACFX/pJia/Ds8c9ZTqEgbzrqBUh2zbruUUqBCpsjV7W5Lb98nCbpWscDlTt1ZDZOqTcsOEycGUDHsYzYvZhdUeVhMr2ncXwgrbon5ao5Aq0R2PsqsfI4HN5sKOJrN4/u8SSmS4c8GM+fUje01yNiq9oAozSc5Hf4DPLcIF1rv4EfckHZ2TQW5CeYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 16:59:30 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 16:59:30 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Melissa Wen <mwen@igalia.com>, "B S, Karthik" <karthik.b.s@intel.com>
CC: Development mailing list for IGT GPU Tools
 <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Andre Almeida <andrealmeid@igalia.com>, Alex Hung
 <alex.hung@amd.com>, Leo Li <sunpeng.li@amd.com>, Simon Ser
 <contact@emersion.fr>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Ville
 Syrjala" <ville.syrjala@linux.intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Subject: RE: [PATCH i-g-t] tests/kms_async_flip: skip subtest if invalid
 driver-specific condition
Thread-Topic: [PATCH i-g-t] tests/kms_async_flip: skip subtest if invalid
 driver-specific condition
Thread-Index: AQHbrkHytF3yWZJVb0W2yq5EOzHpqrOns30AgAaNeACAABYgcA==
Date: Mon, 21 Apr 2025 16:59:30 +0000
Message-ID: <SJ1PR11MB6129D560A5106418F6D977A1B9B82@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250415200529.31722-1-mwen@igalia.com>
 <7177d94a-a2ca-4cb6-bbd8-894f489ac676@intel.com>
 <6c4ldbye7jjui25kofiv6itma6icf6xhouv7btnjuocmmbpsqb@kkvhwivs7nho>
In-Reply-To: <6c4ldbye7jjui25kofiv6itma6icf6xhouv7btnjuocmmbpsqb@kkvhwivs7nho>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MW4PR11MB8290:EE_
x-ms-office365-filtering-correlation-id: b66f127c-1eb8-4395-18f5-08dd80f5e1e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4tvB1KyHmLjaTZ90RQhjmq8ollymGQoBTgXqkVkYrmEdz4x4MrqByS0xu4qL?=
 =?us-ascii?Q?RdJsThlqSQM8C0Inq16MlmklvrW0eyFk75UKQbnTAkqwiuu1nZ7enlRkltza?=
 =?us-ascii?Q?EgSlbIQMOZYof1B5bJ1L5V9UWzY/64xpUOG9EtTE+aQpwJuuNlKih7W+6Qo8?=
 =?us-ascii?Q?laz9RL/+GsFdYwYl7qV/2A/oXL2PdjoUiC5WmmDrLPWyx46YK0DRa61/0rEY?=
 =?us-ascii?Q?G3Z0CbgDK+h+4ohZSolFenKkbZ302JdCeMMULalXyr6aUs7IZ83LqCNultHD?=
 =?us-ascii?Q?amLpFG8/rT5sh93VvuY86WZCwe1ZIUxfpaRNsX1BLFoBx9ktCcdqBLQLDPaX?=
 =?us-ascii?Q?elEpj2nw9prLoXeYTEfHw4LREHCbz01i7HFRD1QuMjCPr4Y+lGbNZG4Ph1FX?=
 =?us-ascii?Q?0s6XCvuavRrRtlaI8VwV3yljLIIVfBgHVNkKViSdsdeDpdQXSTkayppus4PS?=
 =?us-ascii?Q?wR5+fiBwrw1LhZazHBL8U+vgfvREivAS+aiGI7dslJbLci+RCDfKAe1J3HRA?=
 =?us-ascii?Q?7HIeWpK+IppJLcIOmP88tzQo5rCmwuMlQ0uH+u0qMqpSq5c32nlyg1I0r3xP?=
 =?us-ascii?Q?lqaTIgdLmgOOZ54S4HezB5mStDfazhLkEv2019GkCmsiKDnFcEtDANid/rZo?=
 =?us-ascii?Q?R2v0PZ/hVFps1aNEJxZYMTDw1Ed7sSv2OAmNr8ydLKwP4tLf7H6X5cW63H8L?=
 =?us-ascii?Q?JwjktQjshmOmU7BFNmGZpdttlH0HSmK1WvUGn1ua3Fm4PXaqbUNFZF5q5YMY?=
 =?us-ascii?Q?/4f0IgubBJbzUxurSJmSU7++PvAhCEWxUVHDLVqXCunc4kJX4zlm7UH8r3Pl?=
 =?us-ascii?Q?oLOHH17R9Ec1M0GAXwyMavUphXh6we3vLijjZYNY3HN1/Eggl+/lUx0hzv1l?=
 =?us-ascii?Q?CuTcLrNypdI6O5GZQBJhZOO3ZyAXgJXX/WqwlWgzagkiNBfLH7CaRa+ZvXog?=
 =?us-ascii?Q?qY0Me422yrqYOn+m+1/Qh8Uqm4zkI96JzXAheD4UvfY2EbiaJNyoRlqmgOt0?=
 =?us-ascii?Q?mcFVIBtxBaE1SHamgzT5Wr3ffHtYfPtUNWeeApTa4LO0Pc+FSlYzwcoaFuT8?=
 =?us-ascii?Q?TT27s1yw03ZLwnFC1YJYkScN41htyeRvCxAt6lfnr1wjeCxNUbl6nqM9hIwZ?=
 =?us-ascii?Q?y89ya+m4jj62++GCD4gBBXpSWSRF5LMhIwqvWx9n+lq7S0SCBZp8XdaTxMe3?=
 =?us-ascii?Q?pqVrqWpUU1pmQpMAkg0FseLgyGR1SrQZMioFVPgmtJGrBvpVxdxxiOpRTKjw?=
 =?us-ascii?Q?blIHsLCk0p2rKqJ/Mf7lNcKJ7UdqRRCDfrkgRWdTjXZ4uo8jYX4d2n7ePtGr?=
 =?us-ascii?Q?thq5e3qt80ox7DkXBEPOJByLbsfkAgNXEksTbjLnMswG79glhN3QHbYXt5tS?=
 =?us-ascii?Q?Eoe3q7R2XvnMaG6ahjcibIahACqp+qCqhLKeUgLSokna4v7R8RjRDz3OsuS8?=
 =?us-ascii?Q?top16GkfeBCqIFYygRQ64hp8PEdPOEEB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nwNQawCx0rCPJ3YcNCKMbhhYMQCOLvU/npcet08EwCECrdEvFlHIEGE4rvnW?=
 =?us-ascii?Q?VTwI0ZkczHrVeAn9Qgony/RZlSqj7VOo9vizQVuxAAr5B19BFqjo+3dKdvuC?=
 =?us-ascii?Q?u1q8IW1MYRflgQbGZw14lnjK6KZkKqiLolm+BLEulk3pvW6YNUSObXj30A1S?=
 =?us-ascii?Q?X8Dm9M/a6yn1n/o31VjFuFRjALfbH7Xm9cUc8AjVJOzQs4Tiwb2fD4kB8mWq?=
 =?us-ascii?Q?DXvUVt9c6qvRgPO4uZHL53HrDxGMc9wxoOsoEPFU3bcIDtg+PLt79YkNzGvF?=
 =?us-ascii?Q?Kd8POoANOoh6tYetFniB2IYmErjpIw8yHOURw3/JtK965BaEiJKhuPmZhCYs?=
 =?us-ascii?Q?1fyuNR0lp85rT8lnrMDvmR+bQvR4bwQxuaBGJSfpRl7/rus3aDvJaUrYE09F?=
 =?us-ascii?Q?MIY2+cUbnm4DgbKMP4C2NRSc7azSTdjYGDufZvkfqQjjNoTkKtyGgturmwwS?=
 =?us-ascii?Q?ZJyzJJkW5nbIPxMNTYddIVnj05AYAUp7xC64kDuCkHVueZeOGEH1w44O7Sre?=
 =?us-ascii?Q?Fswr/XEF/TsI5DiIylTj2ZHy49CQgXGtBdb/QxQSMHxgzw/StC7hE6WWwPMn?=
 =?us-ascii?Q?cmzv5TvK9el88lC+qhpGOLVvx+vu4372CdHmyhi+dmBmWx5ZmTlfC4V/hAG1?=
 =?us-ascii?Q?0B2Gx2ZUlNf7oim0chFVJHxF8VQ13ZavU4uRgzLfLYsooVUhnuT2HXcGwIm5?=
 =?us-ascii?Q?ssedtI/y1LJ2SoeB+CzHEMFYtNY8XkDTUW5oDdoQS8SymfQxRj4VmX58/9mT?=
 =?us-ascii?Q?5F4KUm2XJpXMpAfQ7oayMqn9cTk2lGEmxQ08jEyyAeoQKMzqq3fJvsZGiVyU?=
 =?us-ascii?Q?a9ZKDzX2d/SqqRQqzmBB/M7ReFOX2fWdlt4YZScu9zl6vLGaxMWVN4zMTa7X?=
 =?us-ascii?Q?gvkJelZbGQ1Jv666fNKwO1YA5UfZzNgrMbkIKfC3pJVxqw3WdF2xsqMZcmbv?=
 =?us-ascii?Q?Sgc5UtuLilXOdpjQ+rBtktwO9kIaPypwxFaIEMvnFixQymS6evBK57Iruf4x?=
 =?us-ascii?Q?YI/ZqHMMX96FFsDM2w7l16a7KuvzrN4ntFDi1sLKbNbRr/Ep3MV+DTLFHjZ+?=
 =?us-ascii?Q?KQQLtS+An1SDJa78MV9IgEF5dX/lecWrzQORiycsH7XrJXc4WK/wF6QvOUpq?=
 =?us-ascii?Q?y7dN8b59R1tLRH1M19UAmU7OU1vjKCFbQIAH9qmDUK3/QQG2yCTj9GJxmT/S?=
 =?us-ascii?Q?zpNtLOzhbEmOc1HkbHyBITV24d8YJ/PgQ02CpwxN53nhkP4FfvuNUvMbSipI?=
 =?us-ascii?Q?2NIA/EV6nKxnm1QXpM/J5Hotw/zMCeAOQUiU/UPaFYrXhn1JbxsUpFCUJoFB?=
 =?us-ascii?Q?IngZNZBncw1MtCRGgpIhky7EBW8lpIJh7NExI363gTtfaKaMbJW5Pv76TVh3?=
 =?us-ascii?Q?ns+X07rwx9CjUyK2OhWwKw9CPqMqZvim85+i3OyVph+3U7QBDCq0cIUe1uYy?=
 =?us-ascii?Q?G4bayq/UInf++GqGanyCJ1sAkY9fCFvdXAbEi8GJdzQizaRqDJDQOc3OuBtM?=
 =?us-ascii?Q?ephsQDnkvUQEx3vt72HSGGyoSrwnbRP1g8Pg/TtQGZGYval4nlD3gj7gTOWi?=
 =?us-ascii?Q?PKEC9OpBgLpDjX7rkq4LXdxte/3CDOvPNAvQx25P499Fx81CvEavZYR9kwox?=
 =?us-ascii?Q?2g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66f127c-1eb8-4395-18f5-08dd80f5e1e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 16:59:30.1673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3tpPi2xdvOzu2QPL3xRA7vmhmAReXbfQd8RVA7JKYPt1kibsspKDrA5yIvRxtL9KCXEQsclXrbIro+I9upCF4nQEfKwG13C6pUMHL0QAcLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8290
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

Hi Melissa,

> -----Original Message-----
> From: Melissa Wen <mwen@igalia.com>
> Sent: Monday, April 21, 2025 8:35 PM
> To: B S, Karthik <karthik.b.s@intel.com>
> Cc: Development mailing list for IGT GPU Tools <igt-
> dev@lists.freedesktop.org>; Petri Latvala <adrinael@adrinael.net>; Arkadi=
usz
> Hiler <arek@hiler.eu>; Kamil Konieczny <kamil.konieczny@linux.intel.com>;
> Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>; Bhanuprakash
> Modem <bhanuprakash.modem@gmail.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; Thadeu Lima de Souza Cascardo
> <cascardo@igalia.com>; Rodrigo Siqueira <siqueira@igalia.com>; Andre
> Almeida <andrealmeid@igalia.com>; Alex Hung <alex.hung@amd.com>; Leo
> Li <sunpeng.li@amd.com>; Simon Ser <contact@emersion.fr>; Dmitry
> Baryshkov <dmitry.baryshkov@linaro.org>; Ville Syrjala
> <ville.syrjala@linux.intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Xaver Hugl <xaver.hugl@gmail.com>;
> kernel-dev@igalia.com
> Subject: Re: [PATCH i-g-t] tests/kms_async_flip: skip subtest if invalid =
driver-
> specific condition
>=20
> On 04/17, Karthik B S wrote:
> > Hi Melissa,
> >
> > Although I agree that async flips can be rejected for multiple
> > driver-specific reasons, my concern here is that there could
> > potentially be a genuine failure(as EINVAL is a very generic failure
> > check) as well which might get caught in this category and be treated
> > as expected skip, whereas it ideally was something which should've been
> allowed by the driver.
> >
> > IMHO, if we need to have this, we need to have some more checks
> > together with EINVAL (though I'm not aware of what this could be
> > currently) to treat it as a valid skip.
>=20
> Hi Karthik,
>=20
> Thanks for raising these points. I understand your concerns and I agree t=
hat
> we should not ignore genuine failures, but I don't see a way to currently=
 get
> from the kernel a more accurate reason for async flip failures.
>=20
> Also, I don't think the current test implementation prevents misleading s=
kips
> even for i915 drivers. While the test attempts to meet all valid conditio=
ns for
> i915 drivers, it allows the test to ignore the first flip failure, which =
can be
> questionable when a driver advertises that it can do async flip, but then=
 the
> first flip fails (EINVAL) and we cannot guarantee (control) that the caus=
e is one
> or another unsupported modifier or what else.
>=20

We will be removing this quirk soon. With the addition of IN_FORMAT_ASYNC [=
1]
we won't need to "allow_fail" for the first frame. Please see [2].

The idea behind falling back to a sync flip for an unsupported modifier was=
 that, in view
of user-space, it is still performing just a flip with a new FB (albeit wit=
h a new modifier)
without changing any other parameters. It is a valid expectation for an asy=
nc flip.

With [1],  user space can check which modifiers are supported for ASYNC and=
 flip appropriately.

However, there needs to be a larger discussion regarding what should be the=
 "uapi contract"
for async flips. Some of it going on here [3]


> Unfortunately, cataloging all failure conditions and create a valid and g=
eneric
> enough test configuration for all drivers in the subsystem doesn't seem a
> feasible task.
>=20
> So, if the current setup are suitable for validating i915 drivers, but ar=
e not
> accurate for other drivers, an alternative may be limiting this patch cha=
ne to
> AMD or any non-Intel device. WDYT?
>=20

Won't all drivers be interested in knowing when async failed (particularly =
because there can be
so many reasons for it)? At least, it has helped us debug some issues.

Downgrade to sync is anyway covered by the flip per frame test criteria.

Regards

Chaitanya

[1] https://patchwork.freedesktop.org/series/140935/
[2] https://patchwork.freedesktop.org/series/146853/
[3] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834

> Anyway, I can't think of anything better right now, but I'm open to other
> suggestions that make the test cases valid for more vendors and their
> hardware versions.
>=20
> BR,
>=20
> Melissa
>=20
>=20
> >
> > Regards,
> > Karthik.B.S
> > On 4/16/2025 1:17 AM, Melissa Wen wrote:
> > > Async page flips can fail for any driver-specific reasons, i.e. when
> > > the driver can't commit to async page flip request for hw
> > > limitations, the commit is rejected with -EINVAL since there is one
> > > or more conditions that make the request invalid. These limitations
> > > varies between vendors and hw versions. Skip a subtest if any
> > > invalid driver-specific condition happens. This behavior is in line
> > > with userspace expectations and fits better the plurality of drivers =
in the
> DRM subsystem.
> > >
> > > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > >
> > > ---
> > >
> > > Hi,
> > >
> > > Recent changes to async page flip conditions and limitations in the
> > > DRM subsystem shed light on unexpected restrictions of async page
> > > flip tests. The current approach doesn't make the test generic
> > > enough to correctly deal with the diversity of reasons for a async
> > > page flip being rejected by drivers of any HW vendor.
> > >
> > > As an example, AMD display driver can't perform async flip when the
> > > memory type changes [1][2][3]. After further investigation performed
> > > by my colleague Thadeu Cascardo, he elucidated that this situation
> > > can happen whenever there is not enough space for FBs in VRAM, so
> > > they are allocated in GTT. Moreover, the space available in VRAM
> > > varies between hw families and other system needs. Therefore, the
> > > driver rejects the async flip due to memory type change, instead of
> > > silently downgrade the page flip from async to sync - which seems cor=
rect.
> > >
> > > The userspace expects the rejection (-EINVAL), but not the downgrade.
> > > So, I understand the test_async_flip should just validate if async
> > > page flips aren't downgrade in acceptable conditions and skip for
> > > any invalid driver-specific condition.
> > >
> > > [1]
> > > https://lore.kernel.org/amd-gfx/20230621202459.979661-2-
> andrealmeid@
> > > igalia.com/ [2]
> > > https://lore.kernel.org/amd-gfx/20230804182054.142988-1-
> hamza.mahfoo
> > > z@amd.com/ [3]
> > > https://lore.kernel.org/amd-gfx/20250107152855.2953302-17-chiahsuan.
> > > chung@amd.com/
> > >
> > > Let me know your thoughts!
> > >
> > > Melissa
> > >
> > > ---
> > >   tests/kms_async_flips.c | 8 +++++---
> > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> > > 031417ed8..0de299c2b 100644
> > > --- a/tests/kms_async_flips.c
> > > +++ b/tests/kms_async_flips.c
> > > @@ -397,8 +397,10 @@ static void test_async_flip(data_t *data)
> > >   		ret =3D perform_flip(data, frame, flags);
> > > -		if (frame =3D=3D 1 && data->allow_fail)
> > > -			igt_skip_on(ret =3D=3D -EINVAL);
> > > +		if (data->allow_fail)
> > > +			igt_skip_on_f(ret =3D=3D -EINVAL,
> > > +				      "Skipping, async flip not supported at
> frame %d " \
> > > +				      "due to invalid driver-specific
> conditions.\n", frame);
> > >   		else
> > >   			igt_assert_eq(ret, 0);
> > > @@ -768,7 +770,7 @@ static void run_test(data_t *data, void
> (*test)(data_t *))
> > >   			continue;
> > >   		test_init(data);
> > > -		data->allow_fail =3D false;
> > > +		data->allow_fail =3D true;
> > >   		data->modifier =3D default_modifier(data);
> > >   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data-
> >pipe), data->output->name) {
> > >   			/*
