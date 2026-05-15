Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7069CD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 09:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F72110F4C3;
	Fri, 15 May 2026 09:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6wY7mZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B1310F4C3
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 09:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778838221; x=1810374221;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zluKRxlFNIO581rVXfJ/+1+XzvpIBDBL+zkPmMTUqLE=;
 b=G6wY7mZsFHmSt0vkLFNL8Hpw3Q4i5qAVz3+SNk2g3Ki0RI0PiJy5UIjw
 in6MAOOj1RGP/fIGzW6TIrBD+oyZPr/+T/f+UTuDT6fQY2GYQjgUUc8aV
 Zbsl9Iqffpk4UPIVYAy+lCqkN7YAZKSnWK4w7EU8b4dgVv5kilM2rlMk7
 UX2ypjAL7IC8R9TubXVhZyEART6NRAOzeRmg07DH2AsBnbaJLLJfIr3wp
 Y9MInHFZ1xundzBYjQ6IM/MHABcUh9eX1dP/JsGpPf2lDUiM2S42cjdkk
 XOZMN14FLp7KJ1iTOKJL/++1As4+IwNHe4Sy9qgMoGJM4W5i2tBjrKlJ6 A==;
X-CSE-ConnectionGUID: VDTMp26wSLeICW/cUJvyFQ==
X-CSE-MsgGUID: 3yY2Qc+0RfyCfAOhHk5r1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90371405"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="90371405"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 02:43:40 -0700
X-CSE-ConnectionGUID: FOqnAs71T2m3JZBQw8+SLg==
X-CSE-MsgGUID: 2xCWrHZPT5CJELgEEpsP4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="242989894"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 02:43:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 02:43:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 02:43:39 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 02:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9CVYa0s10Q5xSc5bRNTCzje9viuTyl0YYkcxgpRi50fnt9rhDwNijA4MGqMzdX1NvOJKYeG1hlhr18xDK6hR/SIfty0vf8OZaaCb/PWUgzmrFJEldRt4RJWib8MpDW+caIyswFaPbnqFiA/MgboWVhFszumaf0et5KPEwC5+4OLH2kKnrkPIypF6tSi9GfUKR+QwSG78PXKNvThSMhszFLaQhEUwCugKe6PtLu9W3tStEVQpr50Mq3d07W1+JPFj8oCKXF/xca8aO/ydryqPyUTY0tkrkaM+8Vf8hkp7EJ2eBcsz4cUyO9kQotYCOZLBEg3IDnkICDidQ3XR7sb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxNJX+q58IolvltyFKbAIGvs9AToAmwYJtXUPjw0L08=;
 b=h/uIzXKJYxjNpgs1u+EKTTD6++LijeTX0401JfsIZa27wB11yuqZZ3LG/EXxP2Maupq3Z2bo99zEvYOyP8RKuUfBy7EVBgpWDIihESZ7/pZSRP57VlpXBtFhbc5wpU0TFnQOJt3IxUnkNMuzNyE5ji0LJPGW5VUYOxeOu1Vp07XWQ6Q4QWWZ8/OhGeRsk7ELxGymIPFJPC4UrDhm4+kdAoqz3xSHL7p5+XaKaOtcMAyDrnEiIEJcOVTeZMLOTic2TBAvXf19/iHT8Yt6dOdwQG4rtWLF2ne9O+Q1IXaLHdJ501i7XUukN1WD4mkpU5wanZ0seV1W2jXsxJGhybQP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 09:43:28 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931%4]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 09:43:28 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Sikora, Pawel" <pawel.sikora@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix duplicate
 documentation descriptions
Thread-Topic: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix
 duplicate documentation descriptions
Thread-Index: AQHc5EC/pKqgJTwhWUKrW4D/UME9HrYO1fIA
Date: Fri, 15 May 2026 09:43:27 +0000
Message-ID: <IA4PR11MB92515EDEF8028093D757E99299042@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20260515080728.2433990-1-swati2.sharma@intel.com>
In-Reply-To: <20260515080728.2433990-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|MN0PR11MB6057:EE_
x-ms-office365-filtering-correlation-id: 05b5083e-ea78-40ec-8c0e-08deb2666aac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|11063799003|22082099003|18002099003|18092099006|56012099003|3023799003;
x-microsoft-antispam-message-info: uMTGo/upFrg3x6eJ9lH3qF4MZKkbffImuM2vLSnlyJVtkvkKtXFB4WRYMTSxLxgJDPEaDcYUyPWR9UpWQ+P8Au1kEXXsKXpi1Wt/d9mh+/0lBb7ikR77hWKs6sq93yKDc7g7ti1NZ5de89Sebs50vsJq+33t6YmWFpawWhxBoBQT7dROIlb6rFKzPckugyN5LOE3UuaBhbSQK7+YTsvWD2eyQwY06yvyQtEYTrcKS+uukQea9Fx/Y3N5/dNlVW6q4yDkFWpggubFmxYdF4DlM5iSi2JrfsuHkbKca1SYgQ0g+SjQV/z19QrL5QgolvepUtyC/nnqtGSYfaWTrTZ8qfQi+xrZmmOW4x2KQK/R3D4Rhv1/a806UVu2bA7pKeZn74y6EhjONA4YeYzFK1XNy5OBgOs7Zglim/hyYGj3n93uAcXRja8blTjw+NF+J5BnT3oai2BwOn57zPwmiEjofMf5yjYhJAor7BeYsW/m35eYp4MFufTYyJqin9lmY0edgMoJVdgUsJmB/iuvtzAKqT/kkcW7LMV6POioGFzB2fCN1Z9gP5viRS0tcBo16VongOL4KZaaxW14+TfCBX5LIc4kNjADSASSqV8wvmT8jhVTo4aHWU+y1b0EF7J7E4PHOdegeAobbUMJJxaaVFOGdT+bgq0T0ho7Yi0P9pPRrxZRIjAAH0sveGm4FJZ+qCY/Bk7fE25+yEgStpy/VgN26MNRu7DjlBoAgbfddOW/xPB/Tkb471VuSPm6LJFcCqz2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(11063799003)(22082099003)(18002099003)(18092099006)(56012099003)(3023799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pcUtAQDSud7oXpz8APdXQXk3Zbwu8OdmDyAFjsZHNc/oXfQKSPhiGgJzfIvc?=
 =?us-ascii?Q?f42Fm3JAwHatYNgv1fEff3ZholHxji9AOJ0cx4k+/Mc4dKkQz3zxn7k4Czmv?=
 =?us-ascii?Q?5W2Hy9YMJ6VjWR6DP85+IP7bUEJFoGZ7FkTP8rjtv4FAJ9cAQWe9nrVy21ZR?=
 =?us-ascii?Q?zH5UQvXTZBCL2V/li++tO337qMTUARWg4zpPlPAwYFKLb90q/6dO9IrybKLe?=
 =?us-ascii?Q?kqfy1Z8dltGAJWDbu9b3+HSBH8ON4GlvGpnuGOC3M2ffIOB9eshPzWbJtxnj?=
 =?us-ascii?Q?N76/3jg/TWeZcn/0SD8LCi9gQN1UtPKORzY184wvNM6XA6kimZ4/ZSZz38Dj?=
 =?us-ascii?Q?C2SyZNzor90kEbtIP9WoyhRWPKqDFmbAtaCZGEKcHFG3dwVEDBpnwYJO7DCy?=
 =?us-ascii?Q?A1lAhk7qOW/JFbA8WJkLIAjC4k+gYh7oEcos7h1GigGXNbpwnxsv3yVUer5l?=
 =?us-ascii?Q?USQ77WiIg4Lc+xayL7sMj/seFrWvhWYJj+speo2gn+z/1x/sChLtBhcTouZ8?=
 =?us-ascii?Q?Sm8zCnhMvQG0jGA++CD6sDDfsPkcF4Prh/OavNQGEzRZLVpXcaMt4LSANq8V?=
 =?us-ascii?Q?nJ7j7TtEK2DUrOYse+EaTApSrQ/FbUaTpDg5sbcoWWBGKne6ZRp+gw4ek0Dc?=
 =?us-ascii?Q?/c7RSwWmDD5+qwJ4x+iPoqtgX7XP9iJ8NCXr9xwYrioaAUvgLvrP4rwysd7G?=
 =?us-ascii?Q?thbufBXT5qUOUOZSf7By9biTiU+RhbMl/zncShbE1CgLKCEGjc8s/M4GFd+V?=
 =?us-ascii?Q?mZBbO2HjbQWBWeWIZObNCULKMonhIpMnp5heYE2WnN8F2g9uzTUOCrGAE0vR?=
 =?us-ascii?Q?sTmPD8dcqMmcZkufzl3wyqf3CMV5PV0Y8/2xGizvHBfpOL9U40BsVuxs+k5+?=
 =?us-ascii?Q?07DBfsfTkbgCnrF3FJD2mdAkqPmCvk8QG+Kob8Ps0gasLTbdVj/Y14QojTqf?=
 =?us-ascii?Q?sUSAnK/6FQ+lw1pocMcR4bGlS/Ssasks7ZodXHq5u8xni/6Mvy38dEwV5JJq?=
 =?us-ascii?Q?FknRAYXWBeUCKkqIv+OV29C+vVbWw4QgsgYjCI4j2ZztqfqNV6Xvk2vGStKV?=
 =?us-ascii?Q?wFyS/mYMKtL4sHoZkfoRAjGiur684+BXukWyvotvsno/Wl3lKxqLIQLZJOwT?=
 =?us-ascii?Q?PBy3ynezpHPnAge/e5ey5H29h80KZGyNRYVsgggldoWbStLz7sAIyDKYPiDZ?=
 =?us-ascii?Q?n98yYJsW7yaGIxAjuvQaYR6SluMN/stBzKfAqno6tAKxZM2EJaH13eQ/11y4?=
 =?us-ascii?Q?O8Y3BoinEs6LfwI5XtNcKaskAuehJLsHLslHVMbK4WotSn41l1uGK+1GUzwX?=
 =?us-ascii?Q?F7FLkZKjm0VxnABM4oSVZCcEI1MG2oFH6ipxeYwLw/SxlI5nAb8ezo6uedXF?=
 =?us-ascii?Q?k7X0QC0zk8m1cAl/oSng4UGLtJZSxNImdovzmgbl78df2Om1uFjZ+ePUNqmY?=
 =?us-ascii?Q?Zn6D4ndCybKgqX1BOj0R6AMk6QYW1VorYV8/nC19rWqn9QBKkVbypTb57K98?=
 =?us-ascii?Q?Qo1BrXKq20Ze7lPP2OrEbsSp/eKfTEy5TCIzBPdvvbBy+T4nE3dCb15vMIBY?=
 =?us-ascii?Q?bAjV7p3y+9Bjm4RbtOW2V9yy0MCRSlYXX2EJEzn7oih9gvccN+h+KxsvIrvx?=
 =?us-ascii?Q?7a4DOam14RTNE0MmMD8qGidqskCdg+dt+nySAuxfVZc7sg0cvlSMCaQpCPx2?=
 =?us-ascii?Q?hQoRtaHDoly3lXc4+pFKJOdT7/9sUJLmUEPrHrd3wRCLzIKUXlh0empTX4XA?=
 =?us-ascii?Q?hOD6T/QBqQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jB1rLNIafqIvDnxsPROygI/wfbd5kghngH84fsEN0Gn9Gh9V6H/Jqp1f1oVEROm528NB7M4iQT0ALqayuqJUQyQeGSS9v/vsPKEZw89t5ik7GusQP1mnvuvohzTEmZ7plMbKpAoSAkKiqIkMu1lXXv+QcUSjCuZ4BM1KDnQxX8ovxS7Pl6F6zFWQFnky4wTmxOfeWnVVGRQy4oKEtNBr0Ek6NUEayMxbftdraZmbhLUo7EjCTMrjVhUpf353UW1LFnDk+7rFEz+cgS9dNNfU7V/d4bhOjxsB6rV+7I1xMskwd1Swqc8RrCNCcu/7AijcsmGnv38LVi5sKHHf6XuywA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b5083e-ea78-40ec-8c0e-08deb2666aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 09:43:27.9070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ERvQp/0rhIaCp6pO/sREr8hadYWGaLmKJF3FEIBsI/HNuK3b/kNSb0GaL0+7S5cTX3L6vPuW6brTIhDAcc/HQIZE07q0UCzCTy6zwNyCi6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
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

LGTM

Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Friday, May 15, 2026 10:07 AM
> To: igt-dev@lists.freedesktop.org
> Cc: kamil.konieczny@linux.intel.com; Sikora, Pawel
> <pawel.sikora@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix duplicat=
e
> documentation descriptions
>=20
> Multiple SUBTEST entries shared identical descriptions across different
> test scenarios (offscreen, primary screen, secondary screen). This
> caused ambiguous documentation output.
>=20
> Fix by:
> - Adding features in description.
> - Appending scenario context (targeting offscreen buffer, on primary/
>   secondary screen, with individual/shared fb) to differentiate test
>   variants operating on different screens or framebuffers.
> - Adding missing Driver requirement: i915 to HDR combo subtests in
>   i915-only draw method blocks.
>=20
> Co-developed-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 583 +++++++++++++------------
>  1 file changed, 294 insertions(+), 289 deletions(-)
>=20
> diff --git a/tests/intel/kms_frontbuffer_tracking.c
> b/tests/intel/kms_frontbuffer_tracking.c
> index e7bb3fa18..034222aa2 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -27,7 +27,7 @@
>  /**
>   * TEST: kms frontbuffer tracking
>   * Category: Display
> - * Description: Test the Kernel's frontbuffer tracking mechanism and its
> related features: FBC, PSR and DRRS
> + * Description: Test the Kernel's frontbuffer tracking mechanism and its
> related features: FBC, PSR, DRRS and HDR
>   * Driver requirement: i915, xe
>   * Mega feature: General Display Features
>   */
> @@ -69,7 +69,7 @@
>   * Description: Sanity test to enable PSR with %arg[1] panels.
>   *
>   * SUBTEST: hdr-%dp-rte
> - * Description: Sanity test to enable PSR with %arg[1] panels.
> + * Description: Sanity test to enable HDR with %arg[1] panels.
>   *
>   * SUBTEST: fbcdrrs-%dp-rte
>   * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
> @@ -97,37 +97,37 @@
>=20
>  /**
>   * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS, targeting offscreen buffer
>   *
>   * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, targeting offscreen buffer
>   *
>   * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR, targeting offscreen buffer
>   *
>   * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with HDR, targeting offscreen buffer
>   *
>   * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & DRRS, targeting offscreen buffer
>   *
>   * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & PSR, targeting offscreen buffer
>   *
>   * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & HDR, targeting offscreen buffer
>   *
>   * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS & HDR, targeting offscreen buffer
>   *
>   * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR & HDR, targeting offscreen buffer
>   *
>   * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, PSR & HDR, targeting offscreen buffer
>   *
>   * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, DRRS & HDR, targeting offscreen buffer
>   *
>   * arg[1]:
>   *
> @@ -143,43 +143,48 @@
>=20
>  /**
>   * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with HDR, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & DRRS, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & PSR, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & HDR, targeting offscreen buffer
> + * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS & HDR, targeting offscreen buffer
> + * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR & HDR, targeting offscreen buffer
> + * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, DRRS & HDR, targeting offscreen buffer
> + * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, PSR & HDR, targeting offscreen buffer
> + * Driver requirement: i915
>   *
>   * arg[1]:
>   *
> @@ -195,47 +200,47 @@
>=20
>  /**
>   * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & DRRS, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & PSR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS & HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR & HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, DRRS & HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, PSR & HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * arg[1].values:   1, 2
> @@ -255,37 +260,37 @@
>=20
>  /**
>   * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS, on primary screen, with individual fb
>   *
>   * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, on primary screen, with individual fb
>   *
>   * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR, on primary screen, with individual fb
>   *
>   * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with HDR, on primary screen, with individual fb
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & DRRS, on primary screen, with individual fb
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & PSR, on primary screen, with individual fb
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & HDR, on primary screen, with individual fb
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS & HDR, on primary screen, with individual fb
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR & HDR, on primary screen, with individual fb
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, DRRS & HDR, on primary screen, with individual fb
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, PSR & HDR, on primary screen, with individual fb
>   *
>   * arg[1].values:   1, 2
>   *
> @@ -304,37 +309,37 @@
>=20
>  /**
>   * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS, on primary screen, with shared fb
>   *
>   * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, on primary screen, with shared fb
>   *
>   * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR, on primary screen, with shared fb
>   *
>   * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with HDR, on primary screen, with shared fb
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & DRRS, on primary screen, with shared fb
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & PSR, on primary screen, with shared fb
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & HDR, on primary screen, with shared fb
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS & HDR, on primary screen, with shared fb
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR & HDR, on primary screen, with shared fb
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, DRRS & HDR, on primary screen, with shared fb
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, PSR & HDR, on primary screen, with shared fb
>   *
>   * arg[1].values:   1, 2
>   *
> @@ -347,47 +352,47 @@
>=20
>  /**
>   * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & DRRS, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & PSR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS & HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR & HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, DRRS & HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, PSR & HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * arg[1].values:   1, 2
> @@ -401,37 +406,37 @@
>=20
>  /**
>   * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, on secondary screen, with individual fb
>   *
>   * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR, on secondary screen, with individual fb
>   *
>   * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with HDR, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & DRRS, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & PSR, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & HDR, on secondary screen, with individual fb
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS & HDR, on secondary screen, with individual fb
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR & HDR, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, DRRS & HDR, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, PSR & HDR, on secondary screen, with individual fb
>   *
>   * arg[1]:
>   *
> @@ -448,47 +453,47 @@
>=20
>  /**
>   * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & DRRS, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & PSR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS & HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR & HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, DRRS & HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, PSR & HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * arg[1]:
> @@ -506,37 +511,37 @@
>=20
>  /**
>   * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, on secondary screen, with shared fb
>   *
>   * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR, on secondary screen, with shared fb
>   *
>   * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with HDR, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & DRRS, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & PSR, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & HDR, on secondary screen, with shared fb
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS & HDR, on secondary screen, with shared fb
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR & HDR, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, DRRS & HDR, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, PSR & HDR, on secondary screen, with shared fb
>   *
>   * arg[1]:
>   *
> @@ -547,47 +552,47 @@
>=20
>  /**
>   * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & DRRS, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & PSR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC & HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with DRRS & HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with PSR & HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, DRRS & HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provide=
d
> method
> + * Description: Draw a set of rectangles on the screen using the provide=
d
> method with FBC, PSR & HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * arg[1]:
> @@ -599,74 +604,74 @@
>=20
>  /**
>   * SUBTEST: drrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated
> drawing methods with DRRS
>   *
>   * SUBTEST: fbc-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated
> drawing methods with FBC
>   *
>   * SUBTEST: psr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated
> drawing methods with PSR
>   *
>   * SUBTEST: hdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated
> drawing methods with HDR
>   *
>   * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated
> drawing methods with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated
> drawing methods with FBC & PSR
>   *
>   * SUBTEST: fbchdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated
> drawing methods with FBC & HDR
>   *
>   * SUBTEST: drrshdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated
> drawing methods with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated
> drawing methods with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated
> drawing methods with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated
> drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated
> drawing methods with FBC, PSR & HDR
>   *
>   * arg[1].values:   1, 2
>   */
>=20
>  /**
>   * SUBTEST: drrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with DRRS
>   *
>   * SUBTEST: fbc-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC
>   *
>   * SUBTEST: psr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with PSR
>   *
>   * SUBTEST: hdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with HDR
>   *
>   * SUBTEST: fbcdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC & PSR
>   *
>   * SUBTEST: fbchdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC & HDR
>   *
>   * SUBTEST: drrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC, PSR & HDR
>   *
>   * arg[1]:
>   *
> @@ -684,47 +689,47 @@
>=20
>  /**
>   * SUBTEST: drrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with DRRS
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with PSR
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC & DRRS
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC & PSR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with DRRS & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with PSR & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC, DRRS & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> with FBC, PSR & HDR
>   * Driver requirement: i915
>   *
>   * arg[1]:
> @@ -761,45 +766,45 @@
>   * Description: Sleep a little bit between drawing operations with PSR &=
 HDR
>   *
>   * SUBTEST: fbcdrrshdr-slowdraw
> - * Description: Sleep a little bit between drawing operations with DRRS,=
 HDR
> & FBC
> + * Description: Sleep a little bit between drawing operations with FBC, =
DRRS
> & HDR
>   *
>   * SUBTEST: fbcpsrhdr-slowdraw
> - * Description: Sleep a little bit between drawing operations with PSR, =
HDR &
> FBC
> + * Description: Sleep a little bit between drawing operations with FBC, =
PSR &
> HDR
>   */
>=20
>  /**
>   * SUBTEST: drrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
DRRS,
> on primary screen
>   *
>   * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC,
> on primary screen
>   *
>   * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
PSR,
> on primary screen
>   *
>   * SUBTEST: hdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
HDR,
> on primary screen
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC &
> DRRS, on primary screen
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC &
> PSR, on primary screen
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC &
> HDR, on primary screen
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
DRRS
> & HDR, on primary screen
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
PSR &
> HDR, on primary screen
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC,
> DRRS & HDR, on primary screen
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC,
> PSR & HDR, on primary screen
>   *
>   * arg[1].values:   1, 2
>   *
> @@ -817,37 +822,37 @@
>=20
>  /**
>   * SUBTEST: drrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
DRRS,
> on secondary screen
>   *
>   * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC,
> on secondary screen
>   *
>   * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
PSR,
> on secondary screen
>   *
>   * SUBTEST: hdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
HDR,
> on secondary screen
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC &
> DRRS, on secondary screen
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC &
> PSR, on secondary screen
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC &
> HDR, on secondary screen
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
DRRS
> & HDR, on secondary screen
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
PSR &
> HDR, on secondary screen
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC,
> DRRS & HDR, on secondary screen
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with =
FBC,
> PSR & HDR, on secondary screen
>   *
>   * arg[1]:
>   *
> @@ -863,27 +868,27 @@
>=20
>  /**
>   * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips wi=
th
> FBC
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips wi=
th
> FBC & DRRS
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips wi=
th
> FBC & PSR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips wi=
th
> FBC & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips wi=
th
> FBC, DRRS & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips wi=
th
> FBC, PSR & HDR
>   * Driver requirement: i915
>   *
>   * arg[1].values:   1, 2
> @@ -896,37 +901,37 @@
>=20
>  /**
>   * SUBTEST: drrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with DRRS
>   *
>   * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC
>   *
>   * SUBTEST: psr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with PSR
>   *
>   * SUBTEST: hdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with HDR
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC & PSR
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC & HDR
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC, PSR & HDR
>   *
>   * arg[1].values:   1, 2
>   *
> @@ -938,37 +943,37 @@
>=20
>  /**
>   * SUBTEST: drrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with DRRS
>   *
>   * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC
>   *
>   * SUBTEST: psr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with PSR
>   *
>   * SUBTEST: hdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with HDR
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC & PSR
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC & HDR
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC, PSR & HDR
>   *
>   * arg[1]:
>   *
> @@ -978,37 +983,37 @@
>=20
>  /**
>   * SUBTEST: drrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with DRR=
S
>   *
>   * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC
>   *
>   * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with PSR
>   *
>   * SUBTEST: hdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with HDR
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC=
 &
> DRRS
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC=
 &
> PSR
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC=
 &
> HDR
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with DRR=
S &
> HDR
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with PSR=
 &
> HDR
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC=
,
> DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC=
,
> PSR & HDR
>   *
>   * arg[1].values:   1, 2
>   *
> @@ -1020,37 +1025,37 @@
>=20
>  /**
>   * SUBTEST: drrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with DRR=
S
>   *
>   * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC
>   *
>   * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with PSR
>   *
>   * SUBTEST: hdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with HDR
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC=
 &
> DRRS
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC=
 &
> PSR
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC=
 &
> HDR
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with DRR=
S &
> HDR
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with PSR=
 &
> HDR
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC=
,
> DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC=
,
> PSR & HDR
>   *
>   * arg[1]:
>   *
> @@ -1060,107 +1065,107 @@
>=20
>  /**
>   * SUBTEST: drrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with DR=
RS,
> on primary screen
>   *
>   * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C, on
> primary screen
>   *
>   * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with PS=
R, on
> primary screen
>   *
>   * SUBTEST: hdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with HD=
R,
> on primary screen
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C &
> DRRS, on primary screen
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C &
> PSR, on primary screen
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C &
> HDR, on primary screen
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with DR=
RS &
> HDR, on primary screen
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with PS=
R &
> HDR, on primary screen
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C,
> DRRS & HDR, on primary screen
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C,
> PSR & HDR, on primary screen
>   *
>   * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with DR=
RS,
> on secondary screen
>   *
>   * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C, on
> secondary screen
>   *
>   * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with PS=
R, on
> secondary screen
>   *
>   * SUBTEST: hdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with HD=
R,
> on secondary screen
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C &
> DRRS, on secondary screen
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C &
> PSR, on secondary screen
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C &
> HDR, on secondary screen
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with DR=
RS &
> HDR, on secondary screen
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with PS=
R &
> HDR, on secondary screen
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C,
> DRRS & HDR, on secondary screen
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FB=
C,
> PSR & HDR, on secondary screen
>   *
>   * arg[1].values:   1, 2
>   */
>=20
>  /**
>   * SUBTEST: drrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with DRRS
>   *
>   * SUBTEST: fbc-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC
>   *
>   * SUBTEST: psr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with PSR
>   *
>   * SUBTEST: hdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with HDR
>   *
>   * SUBTEST: fbcdrrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC =
&
> DRRS
>   *
>   * SUBTEST: fbcpsr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC =
& PSR
>   *
>   * SUBTEST: fbchdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC =
& HDR
>   *
>   * SUBTEST: drrshdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with DRRS=
 &
> HDR
>   *
>   * SUBTEST: psrhdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with PSR =
& HDR
>   *
>   * SUBTEST: fbcdrrshdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC,=
 DRRS
> & HDR
>   *
>   * SUBTEST: fbcpsrhdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC,=
 PSR &
> HDR
>   *
>   * arg[1]:
>   *
> @@ -1194,139 +1199,139 @@
>   * Description: Modeset from a busy buffer to a non-busy buffer with DRR=
S
> & HDR
>   *
>   * SUBTEST: psrhdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with HDR=
 &
> PSR
> + * Description: Modeset from a busy buffer to a non-busy buffer with PSR=
 &
> HDR
>   *
>   * SUBTEST: fbcdrrshdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with DRR=
S,
> HDR & FBC
> + * Description: Modeset from a busy buffer to a non-busy buffer with FBC=
,
> DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with HDR=
,
> PSR & FBC
> + * Description: Modeset from a busy buffer to a non-busy buffer with FBC=
,
> PSR & HDR
>   */
>=20
>  /**
>   * SUBTEST: drrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of
> DRRS
> + * Description: Make sure suspend/resume keeps us on the same state of
> DRRS with DRRS
>   *
>   * SUBTEST: fbc-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of
> FBC
> + * Description: Make sure suspend/resume keeps us on the same state of
> FBC with FBC
>   *
>   * SUBTEST: psr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of
> PSR
> + * Description: Make sure suspend/resume keeps us on the same state of
> PSR with PSR
>   *
>   * SUBTEST: hdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of
> HDR
> + * Description: Make sure suspend/resume keeps us on the same state of
> HDR with HDR
>   *
>   * SUBTEST: fbcdrrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of
> FBC & DRRS
> + * Description: Make sure suspend/resume keeps us on the same state of
> FBC & DRRS with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of
> FBC & PSR
> + * Description: Make sure suspend/resume keeps us on the same state of
> FBC & PSR with FBC & PSR
>   *
>   * SUBTEST: fbchdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of
> FBC & HDR
> + * Description: Make sure suspend/resume keeps us on the same state of
> FBC & HDR with FBC & HDR
>   *
>   * SUBTEST: drrshdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of
> HDR & DRRS
> + * Description: Make sure suspend/resume keeps us on the same state of
> HDR & DRRS with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of
> HDR & PSR
> + * Description: Make sure suspend/resume keeps us on the same state of
> HDR & PSR with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of
> HDR, DRRS & FBC
> + * Description: Make sure suspend/resume keeps us on the same state of
> HDR, DRRS & FBC with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of
> HDR, PSR & FBC
> + * Description: Make sure suspend/resume keeps us on the same state of
> HDR, PSR & FBC with FBC, PSR & HDR
>   */
>=20
>  /**
>   * SUBTEST: drrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible wit=
h
> DRRS
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible wit=
h FBC
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible wit=
h PSR
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible wit=
h HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible wit=
h FBC
> & DRRS
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible wit=
h FBC
> & PSR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible wit=
h FBC
> & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible wit=
h
> DRRS & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible wit=
h PSR
> & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible wit=
h FBC,
> DRRS & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible wit=
h FBC,
> PSR & HDR
>   * Driver requirement: i915
>   */
>=20
>  /**
>   * SUBTEST: fbc-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FB=
C
>   *
>   * SUBTEST: fbcdrrs-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FB=
C &
> DRRS
>   *
>   * SUBTEST: fbcpsr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FB=
C &
> PSR
>   *
>   * SUBTEST: fbchdr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FB=
C &
> HDR
>   *
>   * SUBTEST: fbcdrrshdr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FB=
C,
> DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FB=
C,
> PSR & HDR
>   */
>=20
>  /**
>   * SUBTEST: fbc-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> with FBC
>   *              basic drawing test, else set the mode & test if FBC is d=
isabled
>   *
>   * SUBTEST: fbcdrrs-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> with FBC & DRRS
>   *              basic drawing test, else set the mode & test if FBC is d=
isabled
>   *
>   * SUBTEST: fbcpsr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> with FBC & PSR
>   *              basic drawing test, else set the mode & test if FBC is d=
isabled
>   *
>   * SUBTEST: fbchdr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> with FBC & HDR
>   *              basic drawing test, else set the mode & test if FBC is d=
isabled
>   *
>   * SUBTEST: fbcdrrshdr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> with FBC, DRRS & HDR
>   *              basic drawing test, else set the mode & test if FBC is d=
isabled
>   *
>   * SUBTEST: fbcpsrhdr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC =
do the
> with FBC, PSR & HDR
>   *              basic drawing test, else set the mode & test if FBC is d=
isabled
>   *
>   * arg[1]:
> --
> 2.25.1

