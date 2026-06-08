Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6608CCD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 05:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DC210ED1C;
	Mon,  8 Jun 2026 05:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUwso6t4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0D610ED1B
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 05:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780897497; x=1812433497;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=414I9Ta6YamGWOQbPzRBrl6Tnqgy+gHr4dlckouo4t4=;
 b=JUwso6t40uEpVpbfs1pBGk7E5i8AXLucrcJbY8TK9vFYV6IPtTbZJ49l
 +50saJ9BmqqL43UDotu33evfkNiSI3PuHyrWYXw5KQoSPqm8su3R5urcQ
 4c5pLultgJEGik5gmi/MoIzMZP6aIAY5JrKEUAr4tjXeQwwv2faw/eZgz
 lmqMEUUfhWa7UqHIE6Jgd6NameMkZQ4J9KmMvEnCVS+w5v6b4vi1V1oWD
 pe0dEiE37Wr1iJH4aCdQMFfmto5mYPoEY2ZmjUSYVV5VLpHdzVV3g9TXX
 hbgCJDmVz9s9ERKEtSGMXAuFS9a3kGpijvmlouETYLlZwCI5DO4mtZ7KF w==;
X-CSE-ConnectionGUID: o22h8mYMQv+BrPn/8zZ/zQ==
X-CSE-MsgGUID: SBf8jfdFQ1GZNzDtFH5tHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104284176"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="104284176"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:44:57 -0700
X-CSE-ConnectionGUID: rYzzvi/6Smi2H3SMUSYGkQ==
X-CSE-MsgGUID: hErxYovMTjaeIJIFFTV70A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="245505947"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:44:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:44:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 7 Jun 2026 22:44:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:44:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHPfK1YmDRRozawSwcbQKOUECTbwn5RjYg0E1tCFQ8bLLrdz25ykMVPsZ7gdH1DEbmQkzoErFf11lDHRr2HorTNmP0Mnlu5LdkCG2OZBxXf8vh827k1tD4qKwDLxUpxTquvRFTQFk7Vm0IzCk12uh66jw7+bS4KkShcvSsngbHhTqwz8ZJ5FlADvLXM0+X14BlWILGsTawUkiycK0fL/M1sIkjnteij2qsVrYxk7eF2ONMx7a0CpBv05uJhYsNmTw8lwHtbxC2nkDxrN3m3pXcFokSFUVZruAKhDjiI8iFtw9j+w+HQwdGC1xb1djjFQrfUNXsIIi7Nu/yPNSNhNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RFMNuFJyQTIYx0EMAxk6PoursIFZV4Zbg5sSHm0KMA=;
 b=Ij3Ks5czBNIuMMuT+6hZXnBaX3vTJj5j5RlhaYi2UbUFS1tQ5mtNWN18H+oGdKEILmOye4wUGshYaYUaGu24s61gCukDla9v4dKSnQ5xLyVjbEJ6dzlXeu9kkMqPY3wSJltaM5Uol5PutnOsjxIe/nWQKXsef9VVBx7gcJSupeFmMmDTdtA0+64k3TDbxh+2s3JY7l67/SoTb2GVPVANnE506KcXkj1TH2pjq+o/QBLqNLRaXES99EyN4AJHJGAAw0XXXXW4yAF12/QHytNjpPjhNyX3Pi7YwnmYdrmIV/oUXvULz9sL5ey/PU4InV5/NFr4slt2BBWU3E71DuFgoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:44:53 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 05:44:53 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_exec_multi_queue: Always re-mmap userptr
 on INVALIDATE
Thread-Topic: [PATCH] tests/intel/xe_exec_multi_queue: Always re-mmap userptr
 on INVALIDATE
Thread-Index: AQHc9u0nXyoHaZHdeUCsDJDaj1DjJ7Y0JdZg
Date: Mon, 8 Jun 2026 05:44:53 +0000
Message-ID: <CH3PR11MB8434B719E8A6A864C618A6238D1C2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260608021802.1051933-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260608021802.1051933-2-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB5310:EE_
x-ms-office365-filtering-correlation-id: 2f4874e7-7ddd-4847-23f3-08dec521105b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|56012099006|11063799006|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info: Mi4Rc32YfRGgExF2Yd7VaxuQXksNAu5yXhLY2TJuFFU4c9h/bxgv9OE1RCAbPZyTUmEsQBT25bcCFRPLOXd7wtlxNSwjJFC2xxaJbAHYJts4DepuFKn3YgdCIpoVrEZDIet0oHgvDwCUDhDrR7tR37ybyTVs/Jcrn5yYMuZhZLvUTU3vc4BZQ6s2roB5OFk1wlCHM1vI0EiqQnC7OblE4yzIAgEQHi/V9lPZBA7frqxiM2+cNy/4HpY5MMe8cXNA5e9wY030XnktDT+PcY31FjUoX6JE7Xc6gS16CrTYoIejPNVpRf4L8/psYlbNTAvZIZrXMLPk8SqDpL3Jn1Zd+ZhmWPMThTKLdhiiiXfNMr+pjTosEKbo3BBYkbRXzVMMOFknXHt++4SXCfLOk3oNSsfwtV4kq2BCcbkOZgBq51vFEZ3o8ERoSfLwooXseQDmv4P3hE3W11hpiBLsSe5hqBitFpXe51th0+wLgjERCClAPf2HfvE9OJVWE6lEZrTPVvjN/CgfPQs11XGVUkM+YqkFNREU1oGyjclT/FyGMgdo/TNN7CAgwcXBLW7c/ATj/BCXNE1lN9ge2diT588Y9CA8O5wnoDjm414XZIJlz2ctaiJ6qbHBUuVSfM2JrDdrVF5GklVTu8O1e3zG/03PmLcK1BI34nRo2wb96yu3f6Dmm8YtC/0wA82rQPQRGpzCEjhZpBVlF6WxtunsQM6owrsrCh8TJm+4tn2zSjmtbuAQDjtGc7J53UcQ+Ksh2m0C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YWxE9bHFPGarWjQUNupfgDWSzQvLIXIaIn7Me4MBlInZUPIgLf0dfReMQjk5?=
 =?us-ascii?Q?U7RZJneikBiIYwpFkZm0uu7yiATpAmNorZ0MFd1ox2NrjAUbGY54zGz1Vki7?=
 =?us-ascii?Q?ICkNcIY77qEwRuvjv15EEc0+b6tLJh85bAhftyMZ77uNSDSYborQYkXLYH2N?=
 =?us-ascii?Q?hIOLrDkoVsofNOwZGnLUotB4EZWjQ0jp9hA4o4Ste71ojfGeaG/9UeAO9KwB?=
 =?us-ascii?Q?SLrBqjEVYhBNkviN2HCYqIoxlUBChZLQxyXMFyRe8pwv0hI4yuh15L8QWMon?=
 =?us-ascii?Q?gdlB/pmEWQNef0jrOVL4XDcuQkZ6xSO9WOjiwkYuGZHHDCX03w1ilZVyxLoA?=
 =?us-ascii?Q?CUW7K0+33yDBoQUd2A6UTYTODpeTxqfZw/++pyjm8lJaEXe10QUeqx83yGdQ?=
 =?us-ascii?Q?ZI9oylIkl0j3dBKBmqUBqC5sSg0zbnmMnrcABNAX41TzUuOTV3PSFsndu6jh?=
 =?us-ascii?Q?vw/9UvR1+h87IHv3A0O+5snbcPKg43n6YLQlQv7UoHh8D6aQ68m7LYX2S4qb?=
 =?us-ascii?Q?E3I/E8vTLyFC3mql+v4FbUtGXXxOy2wfqeqm6kHdxYR1g9Y9BkVcuyITdlMh?=
 =?us-ascii?Q?6mQ46kaQhBAHFVHKFzVYLAbekdBw2xOtcyg3Wc2SWYZS+lOlOORW3h4LcHxc?=
 =?us-ascii?Q?SLkXFVem1GO4PhzfOc0iZils+u9sjnLSrgfBO0KfEDAe8ooB95WwDaD29KMV?=
 =?us-ascii?Q?fmQdWsWtYuu6sLSasT4HqX/ofFmFmtdIuoMI+x7GG5ef0OiOELEHD3o3J0l6?=
 =?us-ascii?Q?W3Qd2DumOSoxyRmCa7cUNv9r+znu46ahgPHhK7SvwuZl2e12cTajLdfaHciu?=
 =?us-ascii?Q?iHJRsn91hJOzWUEEg9UXZ/Ad+PiCEoVgcIwsWYGnFRabi17sgMYC+HV/YznH?=
 =?us-ascii?Q?YJMgee+9mtVpRdrTxZ057xICwXyegl3xy2ltoem+w/Qh9jEbJNVU1fPC9lBq?=
 =?us-ascii?Q?JEfHBj6ozwLZv6KAXUqETERWkyLtEBBhwJE/9hQ9VIFXzifNHPSF/WtmkHgg?=
 =?us-ascii?Q?OEqxkI7X1qmrmXSTFRsVUk2AoR0Kf5vPYDmUWmOSIzwPlf1+fR/nT4iKf7EE?=
 =?us-ascii?Q?p7uZrVuGJy1ecZbyPJUANVnsRZlghmu6MvfHlW2EvtzwVIT9ufjiEqKL0ALs?=
 =?us-ascii?Q?HXLzLKJ0gI4DxnNYKYOfxt1PBAme5ne6Vch7NISUrHBwAS4H+mtC3+K9qLKM?=
 =?us-ascii?Q?zu18cbhRZE7nK8UFa+7znYQD65a3esClQK+3ZHj+b5vqG6Z0Z13lzSMNrxBe?=
 =?us-ascii?Q?6TtAEj/ev23cJ2IqVQ7qyH/aeG/S9/NtL0/bN6h7OtbIEefui8jqxj1lo3jY?=
 =?us-ascii?Q?el02F4od+eVpyFIosXCK4UlmNaUPLnkEML0guisqOS8mIsHMF1VYbWE/eSG3?=
 =?us-ascii?Q?KzVAjvunvS7pTdTSRohANhKGSElLU2jC+TzeTP+deO7Guj8jguwk0vrR2cNp?=
 =?us-ascii?Q?fwK/M9b3k23zMDwydt+0//8u8aXP0LufoxXPkna88Ao8sa0ixmOUxkajFhJG?=
 =?us-ascii?Q?cySh6MDT55uTbpwDlKzqI78QciIn2GT9/kZ8f5M3ck4ytCppoD3lGYNFYFOJ?=
 =?us-ascii?Q?79q33fBOeiZ6TVoskhXO2MQZbFeiUNnocgFw4PN89/rZtDPctWZRP2ADVGS4?=
 =?us-ascii?Q?b41KdmFCnc7eSOdSEIwTJhjw/SEbedts53n38O23MCf4kYwyVAVCGVpIvP7v?=
 =?us-ascii?Q?F+KHDWLSMzCXgYHRFKdER5qIkARYDuEE0DBxXp4jo019L0UYGrqRbJUm+HKc?=
 =?us-ascii?Q?fS9dyH9KMil++CzQQmfw5Lh30TZ+YEo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZCg602lEMu5OF3aGtIRBf33IiKbz98Jc3HDhoYSoxKzX/Xlen5HPeIqkWJhGlzYQZgZ1WFv2Hdc+NIUZBl/6lCVfjrPYHXqRrwQPCuH5z2WfIeFAWZcg74HVXFjFIb/KeJeVIngFXdVXmcJ0QCNS0fSrOKUnZUNIVlirBJ3jaRTX4HVlgvoqqFyZH3VhAZMzh6iFcSDLT9nTd28MHHs8R0BVO6klN4Tqj9Ymg09gfSux+C733DgF3Af+LUhinJskJLZB61OtnesUdDuGyqXUY7QBWEs0yMZi229KYVEhjaKp+3HJmK0LwO0mxe7igfR/mRA08reRyLeZo/VcSAWJiw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4874e7-7ddd-4847-23f3-08dec521105b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 05:44:53.1693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQfLAUM7dpJuWzd85TE3VEo29rFbfYTyE/HbtQb0gfWy2hbgb8JeLeoZ67WkygS6xHN8TQapFiqKLgHOBQ5DCNUt4bU3WQlINWyKqttzjm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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
> Niranjana Vishwanathapura
> Sent: 08 June 2026 07:48 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH] tests/intel/xe_exec_multi_queue: Always re-mmap userptr
> on INVALIDATE
>=20
> test_preempt_mode() and test_legacy_mode() re-mmap'd the userptr data
> buffer only when 'i' was non-zero, skipping the remap after the first exe=
c.
>=20
> Always re-mmap when the INVALIDATE flag is set, including after the final
> exec. The trailing remap swaps in fresh physical pages and triggers a use=
rptr
> invalidation, which exercises the teardown/closing conditions (e.g. unbin=
d
> and fd close) against a freshly invalidated mapping.
>=20
> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  tests/intel/xe_exec_multi_queue.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index 6f90c3e4e8..d9d648b022 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -746,13 +746,10 @@ test_preempt_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_plac
>  				       fence_timeout);
>  			igt_assert_eq(data[i].data, 0xc0ffee);
>=20
> -			if (i) {
> -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> -					    PROT_WRITE, MAP_SHARED |
> MAP_FIXED |
> -					    MAP_ANONYMOUS, -1, 0);
> -				igt_assert(data !=3D MAP_FAILED);
> -			}
> -
> +			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> +				    PROT_WRITE, MAP_SHARED | MAP_FIXED
> |
> +				    MAP_ANONYMOUS, -1, 0);
> +			igt_assert(data !=3D MAP_FAILED);
>  		}
>  	}
>=20
> @@ -915,12 +912,10 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>  						INT64_MAX, 0, NULL));
>  			igt_assert_eq(data[i].data, 0xc0ffee);
>=20
> -			if (i) {
> -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> -					    PROT_WRITE, MAP_SHARED |
> MAP_FIXED |
> -					    MAP_ANONYMOUS, -1, 0);
> -				igt_assert(data !=3D MAP_FAILED);
> -			}
> +			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> +				    PROT_WRITE, MAP_SHARED | MAP_FIXED
> |
> +				    MAP_ANONYMOUS, -1, 0);
> +			igt_assert(data !=3D MAP_FAILED);
>  		}
>  	}
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> --
> 2.43.0

