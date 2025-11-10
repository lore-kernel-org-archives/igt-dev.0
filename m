Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76718CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 14:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1685510E22E;
	Mon, 10 Nov 2025 14:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3yAWvre";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D36D10E074
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762784872; x=1794320872;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c2VMPw5qIaHNH0XgaqUxgUby4smih6Z3pF1gsV/hQ3U=;
 b=K3yAWvreF4fdZUSGFY2Bv1Tttg+J/+IgRRWvS8Jv9iQlOYttMzgAWOQs
 yWVFEV4ygdQX6bhBQxderRVDfI6VgYgm6DYpuKhg3lnmJPJxtjAZiPvPC
 O3PlTj4ayKLVS+U6C8jFx4Qd/OrHj8Ejcx5Qs0dj+JpPkhgFBWKqfnN5S
 NGYcjpFsN8mKGypISFVvcIcEghSa/uCKi4jVqnW6gDadMXsuIBZSuLbYr
 Z3JXDs30JfMYa1P8KtEq+GSb8bUCEVXj6qmy9S20o+MxqwAISEBeHIFam
 F3DKtfKLaMvh+J1o9HR0Vmq34U23JKC1fh7mV1QpUq29Mj9g85H6HIlpO Q==;
X-CSE-ConnectionGUID: WSMZeDUGR/aAQ+pTs+44rw==
X-CSE-MsgGUID: J14K28rJSd+JIjh3/lc3eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64869118"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="64869118"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 06:27:51 -0800
X-CSE-ConnectionGUID: SNFQfKIaQZeAStixEjfDXA==
X-CSE-MsgGUID: Tkl798VhSomdVh4y0S2vXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188327334"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 06:27:51 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 06:27:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 06:27:51 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 06:27:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=km6JzzbVd64qxvTTIOAS4RGcSinLmDC93NmUNLixl1A4SRoXMgBnz8F4oUbL8gcLsGt74TCdKZDfTANqFi6MYSSvZrdYJvHhnnMQ/tL5z7Goj+5Ijkh2GS0ycSkyblBzxTuaLfZGYAxW5swzuuWgLMfXqJUOTThBAdbLF9857YKj1PgAgMYZPtFl0ueLwwD0p6vo1/Uzwox8YuOh9Jn2z78LKvJcX8AyDU/cqz+C90dbV7LWAT1evUF04JSZlRjY2J5poZGYXiKDaY4E+6riExRNCsP0cDiFdbqBtqTsI4Itrw2GZ1OthIdaasTIQ8uLVW8u7c0tTD9ffVJNC/186w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rJw99Vz3VxWdHYXjnWH80JJunOM7zVRxYCElNg4zr4=;
 b=TY3uxo5/HKNMf7rM71gxg51lULo78o6xYT/SQjYhKyL4twR6F3Klu7HcNhHRUOegEH7hxUerHYx519dD5g5obnpHtVCSvI8c8af5vXHq/VPgSA3VvNBlfwkCtUzOCDqBxxiv9dcS0XmxjGbSyCZA/TwkKmU8omYqrMn24mtrZZLQYcsy/v2ZXz06QHrWEr4vres5y5nBCGzKWF1WFhgsgnCnRAa5D+F+ONVCnm3f1Ejtp7MJnKsXcoSUpPDdgidSOAepcGhM1ZSbyUVCn9Stw+orUjpQ2hK5isfC80i5yADFkG57Y8ruDwsyl/HeliPIh609SHS9eig7DuGFvJIv6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by SJ5PPF4DC104A0B.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::827) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 14:27:45 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::112f:20be:82b3:8563]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::112f:20be:82b3:8563%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 14:27:45 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "Tahvanainen, Jari"
 <jari.tahvanainen@intel.com>
Subject: RE: [PATCH v2 i-g-t] tests/intel: Adjust test documentation
Thread-Topic: [PATCH v2 i-g-t] tests/intel: Adjust test documentation
Thread-Index: AQHcUkK+3xpqn/8SmUSwVo+Io3KU47Tr9yXw
Date: Mon, 10 Nov 2025 14:27:45 +0000
Message-ID: <IA3PR11MB901378843FD0F706347BBA1E85CEA@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20251110130614.28345-1-himanshu.girotra@intel.com>
In-Reply-To: <20251110130614.28345-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|SJ5PPF4DC104A0B:EE_
x-ms-office365-filtering-correlation-id: f11d4c01-1c09-43ef-6a40-08de206550af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6A3CcnAEAfpRinPEAHVkER4JPsnhE2Uehcc9jNB4Jcvc3fptn1LIiTCG6mJk?=
 =?us-ascii?Q?f4JxCWIKZcZ9Ih828tToxd/zP5iHSGKF+meLZ4KDKZ8OEv6/CVnzAORPiSa9?=
 =?us-ascii?Q?n6oUVjBFIeAFKgL7yZFuQwJD/BZhTx3VLT3mLhBF+XhsZM6eFkv9ZCbxsDKa?=
 =?us-ascii?Q?hLrnIj8uGGSYpviMgyH18UiSH9onKTxDQ+0SI9FQJ4BWWom2cg8v4aFRXnuo?=
 =?us-ascii?Q?4JTe8BlRyCWXfWOX0D3GOIz+/eq4tiQ+0Flu4kSvHRcAFnheZSbgsmwwAX+g?=
 =?us-ascii?Q?UldUZA/94eGwWXuiwZqnGBg1is4wbzfIpJX375hQeUiTsGy4qWbxf0UhSzRg?=
 =?us-ascii?Q?4M/PGDZP8PIlRJs2Drw0b9XTo2b/edj6Dsr2x0lfTc/0R8rx4Q5CZnVnZF9I?=
 =?us-ascii?Q?oVFJFiRiqIqGMOOEykW8Y90KTV2qR90tG33XeEX385R0n4BuKuIK2wNZSiVQ?=
 =?us-ascii?Q?bLeFfmve0kYoHyOBo/EV0+j/3ErvNZ+abebO5Sa4H33u4XkpJWETHd10Lv/4?=
 =?us-ascii?Q?/wXv/ukhqmYUPnSkLFN0AdKYFZQxe5LR9Hh8yFGbCgGrkYcs2PdwwtlAdGTB?=
 =?us-ascii?Q?Y7A05WiA/dSBumBeNBfR5Hi6OxvTHS3zwCUQ67U5KdWHArSQw2bE2XmW/ZAQ?=
 =?us-ascii?Q?GWgRJRtv/GeHrxX2jgD6/184VOql3N4hkAs69p5TKPyACPTZv9Fh8oC/IaF9?=
 =?us-ascii?Q?vFYqpxIGr3hr0WAnH5Vul28iXx6AHB1tRjl8KhTlyUA1FGiqHxwNvWRErF1q?=
 =?us-ascii?Q?fCwybQl+SUFlekxTypNPHe+NCtKstldoSmctfxwAq/YDZ2GRhr0HRiugZIfB?=
 =?us-ascii?Q?UuSPlf7GrwxeJ/jjyYh3a5rT/rlnsPLeSYHDuVQHOhQtBSS17iWgTkZMCSAN?=
 =?us-ascii?Q?6By8+VC5wSpwiH5cXbO2D9ccvDkL+5x0c9PGfHTW7WJMbj/y5+NhGLGIlFcV?=
 =?us-ascii?Q?uPToq3XUGPxoQt1ssErNwuM8h2mmEOFrQN4QJJLomJ9Qs09dyKrGhUl5FnuJ?=
 =?us-ascii?Q?DYZCe59S2sVqn3zp1t2tXpy2Hnxjph9pSscArUEoYhjlen5lVvr/sS35QtGj?=
 =?us-ascii?Q?fJGpg4zhIEDD+TYeInCAIqU+unPqkTU/vVeY2iGW2ouIMLh5CXB19DACtMId?=
 =?us-ascii?Q?/5q7ap4uyngwC82e+09hUjkx/JuAGt75IGGXwc+mQD1HDmyVPhWHtdGn70f2?=
 =?us-ascii?Q?eEzyaBm/Wah1SCv/iG8PVPCrUt59zAB+buPAn5r4826HtXkOaBBE1ueY5eMF?=
 =?us-ascii?Q?SeyocZa6qoBkMU5wzw3GvTXsNBe6huIHJLJH/ys5LeZhMQkJJYpaLcL1TLNj?=
 =?us-ascii?Q?nxhCc1xMUVeKywXeTjz3E2PfG0tydC26a08sviXQU9pXH6rNBsWmSdqB8TCj?=
 =?us-ascii?Q?MkvCTGSba+LZhXkepAT/ZvTQFsm2rOZsDmuC+oMICL5vKeXR0ZAeIJ1yE8r+?=
 =?us-ascii?Q?8+dTZywCjdKTLKAMF+sjM/OcRxlDDyaTb/vBpTiylYAWV2iF8A3xoMN/jlrh?=
 =?us-ascii?Q?qJhKgxe8PwB5gqmAhFBEzaJHMzTUaxA9H9ru?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YtMAgA0XWA+W86OqmQT755vcwQoM358SOrWf8zlyXZNMDDKH/HuUSDPio2xc?=
 =?us-ascii?Q?AB5xpBxPrb1XOwgpW2srnf/4fPLRHnjKlzrxh5Ydh2nWUlMMT9I5ulYUrjkm?=
 =?us-ascii?Q?xHGDBffHQg3RKScpk8JcPJxRHVpToEbu2y/zENmX5R4qgom/Zv1KjL3U3clW?=
 =?us-ascii?Q?CR9tThl96rUh8zlgfZHsOpqK2os4MBh23WruSLcLMVFeHDGiEMN+r7ysNuup?=
 =?us-ascii?Q?XTUe/pPTPe44bYgSuLqWGA49WHHL0/r+kYPurdeylAAhacCiQ9E/mcfME2yd?=
 =?us-ascii?Q?bPUar9SLAt09MMF4k+vTc3JwjEbDpFFsEk5u2vpid9z3jADXEak+0+28d6B2?=
 =?us-ascii?Q?mnM2gv4HJzqZ/nLevmCl/NbB1lqJZA+ucpVX0IcLac8T09NzCWmZpRuB1lZX?=
 =?us-ascii?Q?ZlQgMC8DF96HvOErTKO7NycKSLy1yd0bhMUCXjh40PsqpyEnFHkF7bIByqo3?=
 =?us-ascii?Q?W0luMeJVt7NeoHBCnva4jv6GqGcQjfwMAh4+4mO45VEKAronkKtlPp6bMkgW?=
 =?us-ascii?Q?9gRggYYqmyUUIY4iQOjsKjmx6kRozZmJWJ/QR/2jkqUmvh+hz6WZeAb3Yx7x?=
 =?us-ascii?Q?pCwq3MB9Y+xsinA+3LT3S5LJfTXPHLrJtjOid//O/0SYtk7DGzbFXJYDKojA?=
 =?us-ascii?Q?O+BznWgmm0e1hdXZsKBKkyG46G/kAFp5pPEqIVYh1+kZiNDeCB3HCSEF7hjg?=
 =?us-ascii?Q?h8MXzpjW749UvXCdEO2g1imaqgM/dGUhyK+PxltR67iy4JYxhHth81fC/Cd1?=
 =?us-ascii?Q?ubStUWSQr5L9y6OnVcShEGT5WF2gjal5nIxZ47hC6lL7CBB5iqvPP1Qh7Gv3?=
 =?us-ascii?Q?o5kRnxYv1j5GMbF2DX3oyBeuikZBXYbZaGBderSFvIT24F/FyFpH/nNkozGw?=
 =?us-ascii?Q?xR6UPV+aaj6SpsbhM8vgNgyJqafjLk7I6qA/Aj7ca+6FE9u9HvdH5ylL53za?=
 =?us-ascii?Q?eS0JJXEGtz8Nac77zN4SiV7L7P8ooXIwts0J6QTD3gek35Jy86cV/VVK4oYZ?=
 =?us-ascii?Q?Ov7pL8SlLSlDrn5nak1SvVA5AK75xDmU9i0c66atdvnTWhqk3ucSkH4rP+Fx?=
 =?us-ascii?Q?zumcPH7v9hXav4z7I9NQvqOibhfQqOdJAdr1cIV8RmDlnqvFGW3wuPNmHqIx?=
 =?us-ascii?Q?7ltu3Vps1kEEgzZHJuWOugavw0KidIHpa3/UrntFZ/p+vxUvb42f5PT/pDNZ?=
 =?us-ascii?Q?GHMzvLbNDebyb6wHUBS+5tul15w2UwA8LWn71HAhDJKJ0q2UO0k3n/+oJG2t?=
 =?us-ascii?Q?kubKO0qd+w1Hz7qiwoZSgVCG7DBIxys+P9N1n4F50GJWt7C1KKdGoJLdb1jr?=
 =?us-ascii?Q?i2T/9deilLpYBQnHORqwfg+J1bJakYFkdcX694a1gRxcz7v3hW/KpmX96Exd?=
 =?us-ascii?Q?nQnd1jmUV1YrKDoB8N/P9Y9CrntQrxjC6DQB4esCbU6NppsQvcYWNnUz551t?=
 =?us-ascii?Q?3Li79AYb6cQ9r/Jq/FdFvs9vKK4PA//zu604wIyPR0v2PmSQSKDcMnApSeXP?=
 =?us-ascii?Q?h5L20DeU4IMV6sPhGhcr//iKsoJVP/o4ghbSSL2E+3te0MQZwevax4kC95RE?=
 =?us-ascii?Q?NusbllWcWn3zPIbvzJaBgg4fJBqAJVIM2fct3kYg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11d4c01-1c09-43ef-6a40-08de206550af
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 14:27:45.0357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUSGhT7dH5F3RokZ8OUHA6suOsI4EQjZ0gnBrY+fKPFRGzpN/TJ9uGnYN/HLzO78fI17ihKtv+FpCH3hBpP+R33T5g/zoTTOdmmkqD/y3U0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4DC104A0B
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

LGTM.
Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: Monday, November 10, 2025 6:36 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; Tahvanainen, Jari
> <jari.tahvanainen@intel.com>
> Subject: [PATCH v2 i-g-t] tests/intel: Adjust test documentation
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Change mega feature and sub-category for multigpu subtests and some
> other legacy tests so that it can be fetched under correct Feature Bucket=
.
>=20
> v2 Remove subcategory entries when possible, as they duplicate the
> information already captured in mega-feature entries (Priyanka).
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_create.c          |  2 +-
>  tests/intel/xe_eudebug.c         |  2 ++
>  tests/intel/xe_exec_basic.c      |  6 ++---
>  tests/intel/xe_peer2peer.c       |  4 ++--
>  tests/intel/xe_query.c           | 38 ++++++++++++++------------------
>  tests/intel/xe_sysfs_defaults.c  |  2 +-  tests/intel/xe_sysfs_scheduler=
.c |  2
> +-
>  7 files changed, 27 insertions(+), 29 deletions(-)
>=20
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c index
> e8b8bb025..d7fe9d626 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -383,7 +383,7 @@ static void create_execqueues(int fd, enum
> exec_queue_destroy ed,
>   *              buffer sizes.
>   *
>   * SUBTEST: multigpu-create-massive-size
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Functionality: ioctl
>   * Test category: functionality test
>   * Feature: multigpu
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> 59aca526e..9d1280528 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -932,11 +932,13 @@ static void test_read_event(int fd)
>   *	partial unbind, unbind and unbind all operations.
>   *
>   * SUBTEST: multigpu-basic-client
> + * Mega feature: MultiGPU
>   * Functionality: attach multiGPU
>   * Description:
>   *	Attach the debugger to process which opens and closes xe drm client
> on all Xe devices.
>   *
>   * SUBTEST: multigpu-basic-client-many
> + * Mega feature: MultiGPU
>   * Functionality: attach multiGPU
>   * Description:
>   *	Simultaneously attach many debuggers to many processes on all Xe
> devices.
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c in=
dex
> f652ab6b2..616fd262c 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -58,16 +58,16 @@
>   *
>   * SUBTEST: multigpu-once-%s
>   * Description: Run %arg[1] test only once on multiGPU
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-many-execqueues-many-vm-%s
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Run %arg[1] test on many exec_queues and many VMs on
> multiGPU
>   * Test category: stress test
>   *
>   * SUBTEST: multigpu-no-exec-%s
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Run no-exec %arg[1] test on multiGPU
>   * Test category: functionality test
>   *
> diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c inde=
x
> 70374e56d..92cb6a65f 100644
> --- a/tests/intel/xe_peer2peer.c
> +++ b/tests/intel/xe_peer2peer.c
> @@ -18,8 +18,8 @@
>  /**
>   * TEST: xe_peer2peer
>   * Category: Core
> - * Mega feature: General Core features
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Functionality: dma buf copy
>   * Description: Peer2peer dma buf copy tests
>   * Test category: xe
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c index
> 2de88fac9..928daaf58 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -184,7 +184,7 @@ const char *get_topo_name(int value)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-engines
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Display engine classes available for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -211,7 +211,7 @@ test_query_engines(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-mem-usage
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Display memory information for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -275,7 +275,7 @@ test_query_mem_regions(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-gt-list
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Display information about GT components for all Xe devic=
es.
>   * Test category: functionality test
>   */
> @@ -350,7 +350,7 @@ test_query_gt_list(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-topology
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Display topology information of GT for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -414,7 +414,7 @@ test_query_gt_topology(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-topology-l3-bank-mask
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Check the value of the l3 bank mask for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -486,7 +486,7 @@ test_query_gt_topology_l3_bank_mask(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-config
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Display config information for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -543,7 +543,7 @@ test_query_config(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-hwconfig
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Display hardware configuration for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -582,7 +582,7 @@ test_query_hwconfig(int fd)
>   * Test category: negative test
>   *
>   * SUBTEST: multigpu-query-invalid-query
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Check query with invalid arguments for all Xe devices.
>   * Test category: negative test
>   */
> @@ -605,7 +605,7 @@ test_query_invalid_query(int fd)
>   * Test category: negative test
>   *
>   * SUBTEST: multigpu-query-invalid-size
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Check query with invalid size for all Xe devices.
>   * Test category: negative test
>   */
> @@ -628,7 +628,7 @@ test_query_invalid_size(int fd)
>   * Test category: negative test
>   *
>   * SUBTEST: multigpu-query-invalid-extension
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Description: Check query with invalid extension for all Xe devices.
>   * Test category: negative test
>   */
> @@ -793,8 +793,7 @@ __engine_cycles(int fd, struct
> drm_xe_engine_class_instance *hwe)
>   * SUBTEST: multigpu-query-cs-cycles
>   * Description: Query CPU-GPU timestamp correlation for all Xe devices.
>   * Category: Core
> - * Mega feature: General Core features
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   */
>  static void test_query_engine_cycles(int fd)  { @@ -815,8 +814,7 @@ stat=
ic
> void test_query_engine_cycles(int fd)
>   * SUBTEST: multigpu-query-invalid-cs-cycles
>   * Description: Check query with invalid arguments for all Xe devices.
>   * Category: Core
> - * Mega feature: General Core features
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   */
>  static void test_engine_cycles_invalid(int fd)  { @@ -929,8 +927,7 @@
> test_query_uc_fw_version(int fd, uint32_t uc_type)
>   *
>   * SUBTEST: multigpu-query-uc-fw-version-guc
>   * Description: Display GuC firmware submission version for all Xe devic=
es.
> - * Mega feature: General Core features
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Test category: functionality test
>   */
>  static void
> @@ -946,8 +943,7 @@ test_query_uc_fw_version_guc(int fd)
>   *
>   * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
>   * Description: Check query with invalid arguments for all Xe devices.
> - * Mega feature: General Core features
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Test category: functionality test
>   */
>  static void
> @@ -996,7 +992,7 @@ test_query_uc_fw_version_invalid_mbz(int fd)
>   *
>   * SUBTEST: multigpu-query-uc-fw-version-huc
>   * Description: Display HuC firmware version for all Xe devices.
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   * Test category: functionality test
>   */
>  static void
> @@ -1011,7 +1007,7 @@ test_query_uc_fw_version_huc(int fd)
>   *
>   * SUBTEST: multigpu-query-oa-units
>   * Description: Display fields for OA unit query for all GPU devices
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   */
>  static void test_query_oa_units(int fd)  { @@ -1063,7 +1059,7 @@ static
> void test_query_oa_units(int fd)
>   *
>   * SUBTEST: multigpu-query-pxp-status
>   * Description: Display fields for PXP unit query for all Xe devices
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
>   */
>  static void test_query_pxp_status(int fd)  { diff --git
> a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c index
> 393e56651..f21ae94e6 100644
> --- a/tests/intel/xe_sysfs_defaults.c
> +++ b/tests/intel/xe_sysfs_defaults.c
> @@ -7,7 +7,7 @@
>   * TEST: xe sysfs defaults
>   * Description: check if the sysfs engine .defaults node has all values.
>   * Category: Core
> - * Mega feature: SysMan
> + * Mega feature: General Core features
>   * Sub-category: SysMan tests
>   * Functionality: sysman defaults
>   * Test category: functionality test
> diff --git a/tests/intel/xe_sysfs_scheduler.c
> b/tests/intel/xe_sysfs_scheduler.c
> index faafabd29..90d4ab8fd 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: xe sysfs scheduler
>   * Category: Core
> - * Mega feature: SysMan
> + * Mega feature: General Core features
>   * Sub-category: SysMan tests
>   * Functionality: scheduler control interface
>   *
> --
> 2.50.1

