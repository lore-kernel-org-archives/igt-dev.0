Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56415C61DB2
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 09:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8ED10E09B;
	Mon,  9 Jun 2025 09:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeVrE1JT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B9C10E09B
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 09:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749461124; x=1780997124;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jk7FDGU7jl4vQzvoUnQ6iu6oPZZUOFvxVrVQSKp++EI=;
 b=OeVrE1JTuoMHHPl4nwxfWd+LbHW7MmB3wiJErQ5DAEW/8JBO0fUBnlwS
 K+rNd8SmH+y+s9VnTv+SzQmgMRfsCZrIaaZTQKLqtzBrZ0czFA6F0c1Ke
 aozhUAxRFxtLo6Uau7U7AtEiBmBgvq2f9+seBcx2rPYAZsb2XfKWk2wUy
 WcEIafmwavcu2iyXFnPgZisMF6ZAXQflu3r7bwLFANgzi4iOBkSWtyasE
 SCjREKVWe0kkT4/d+p4fP7u9bVzhBUSQCX5VGBWxXbB1K/RwjhOfzcc4S
 7AUHoczSAnG9PugCNgnuKerY733qv9RSMfwzHqq6se/Sb+INoRQ+qa5bo Q==;
X-CSE-ConnectionGUID: tH1Hq567TKa6yCyCW9VeBA==
X-CSE-MsgGUID: +l22aMbrRi+gFkuBy+kWuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51390808"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51390808"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 02:25:23 -0700
X-CSE-ConnectionGUID: 1p9sfG1NR5qnJFG6Yg7CDQ==
X-CSE-MsgGUID: H2TfJxtAQIyVQYrLrDsDQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="150276642"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 02:25:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 02:25:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 02:25:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 02:25:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxUDoFUQFxFms8p/BhP9utpE9w8/eF43IHAlcwVdwkTm3egJu9J7s0fXYGdwjpDCPyZcU7KQrc2SuMdHNERhkc8mHp3KxjpIbQPdFy/dZcB6ts7WEX9gTI+s7YJ/Q3XnOvdQEhZKkCZSuVYF5AaFweK/kN71Q1QjoOeVWOeL8rCND9GVlHZLYPgMvxuKhmE73tUmHprmlpJr2Sy79mepfo9QZxB7HAne15WkNYcynhXD1yNxK2FhNdn6z/cN0zzgdxvRrK60F9WWxTi/bVibEnFVHTzMQCd7jkf/7dtSGDU6EDGN3M3oCcuRTZZKxbH1tUe9hZg5DnPanaFMQtS7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StVM/KoSw/VEtLrHBP2JqOLEF4Ul2635iWextHNAKC0=;
 b=DMCeB+8gyF2UdMmrtJ7KoeOCsmB504bF1p7zmLi7wWE2TGnygbc8xVdOnfufKWRDtLnxxMsnPoIUe0VssoxBK3xP0LuI7IH+pbJMG6/D12iIWFOoIvAYIDAP+PyDClzraFB+sGO2HoZxQNy2UsoRS5TkwZyVskChDYOrZimi4998HMOhV5ZrHEY1BGnlmhsihLCbdev3UxNM8U7rOCi5n6zo24TQpIC0Wc/YF7A0OF5B58kCbQhUATQCk8O7fqRXoxPdSvUVHExJLv4Dz5uS/qifL4jkjsbkg//LUgKTr0f+6oMXhvqMIzqFMYqmeUOzaJz0Ae3/O3JtmZuMj2vmmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB5174.namprd11.prod.outlook.com (2603:10b6:510:3b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 09:25:06 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 09:25:06 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Alex Hung <alex.hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH V8 04/36] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Thread-Topic: [PATCH V8 04/36] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Thread-Index: AQHbuXBlDpDitWvM6E+scZ7JHZ/ywrP6zIRg
Date: Mon, 9 Jun 2025 09:25:06 +0000
Message-ID: <SJ1PR11MB61290BD0B1E41BDF6EC9003AB96BA@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
 <20250430013454.226910-5-alex.hung@amd.com>
In-Reply-To: <20250430013454.226910-5-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH0PR11MB5174:EE_
x-ms-office365-filtering-correlation-id: fa756326-c698-4d91-360f-08dda7378585
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?E53nnVT5FOF99Mv62LA9fCGXJa2ru9CMAqHRPmdNIuhXozn1rsSVoZ2tYTEu?=
 =?us-ascii?Q?8DaeW8wWaRNP7fN/nr0qdPnxFCQB+4CVJlh1dYncxRyupGpQjvFbDYbLlh7R?=
 =?us-ascii?Q?CGkWAhtC3dNbujl7q6jAg3tub90D0UglSiaOMy9zAH8M21ai61nYC80bfcAu?=
 =?us-ascii?Q?E0Y59nUg5znI1WSxlLbe2GIqg+VADD9G+XyIiaiJ7I0nuQZKgISdUTknniAy?=
 =?us-ascii?Q?0I9Sc1aPzCubaGKDR2VxoRdMb80FWpt+Y05bm92GVVHzhp1ggKwYCFQ6Ru+8?=
 =?us-ascii?Q?KYNTlM+aeQK5XAl7ZaUhgng8IViOLDgbAvkWoMXMI+b2MpqTk7hQM5n5d/Ya?=
 =?us-ascii?Q?x4uXTusfTyUWHgUnZBbFaNNynIs0wMZQB0SpSvppn9vukV9NGp4cVQSLlcgD?=
 =?us-ascii?Q?BExr5WhEPTkm4E+wMiEWsE17/gPDhHEKLl7I0q/QaCAf6qaAT/xPaOk1FoeZ?=
 =?us-ascii?Q?JRw/7fIdVfTz92q1tl6Zfv6itfBLwcR0w/JhXo0c/0saFJTzqBOiSHwwgdjx?=
 =?us-ascii?Q?gnY//CovLAqaqbs78E6qLpM4EfDYA5RCP6zI+Aa+L5dUR9mmHXIBWaeEov/U?=
 =?us-ascii?Q?5YT1eN9l3T+93fwXsm06L4P3VelLPRoIe2EX83JJ7ydAD0dzIo8r1JpwO34d?=
 =?us-ascii?Q?f1mC9QccfLqtnE1cuGH9s8HosGZFGw7Qyh6iCEHL72cUbym7NdBCEJJG7l+N?=
 =?us-ascii?Q?VyVzSfd7bJnefHSLcOf+8HlTwv9MaOpKsIXWV3qEbAqvGd0FI+xG6Z/I/6wq?=
 =?us-ascii?Q?kSS+pmicTKCWjqcFFSsRWm3lcYCKpIiK4wvLpGqUVlkG8w1osh3yiygToIgf?=
 =?us-ascii?Q?VbcXfrK7USmTyMckPbgP7aN1YNLMJFdVYHdvMWbAx2dnS9iQxa6mGZSVjIWd?=
 =?us-ascii?Q?wnQ+w1cwvigYPP+neuuE8dSfNtIk7Q7g4/MbVrdzOpcM+Vswfx0IkYVnZByr?=
 =?us-ascii?Q?rYa9yGsMRmfd3K6Dy8ifhimRoIW+5G9VYv1uFCNG4k89rW7D41lbki/xHhBm?=
 =?us-ascii?Q?kQ5XTNAB/BziYJlXkq4a8J67eV9kg9l7yWj+aVj3qNhiml/p9wLQqrjtnk7o?=
 =?us-ascii?Q?BGEDDsnr6NnSnHNiycx+FD8Kd0B01pFxccK/j6B2TaYTiUSZi1XAOvL62kNn?=
 =?us-ascii?Q?dFRC1CxL6CZ6hErQe+G0bpttfQB83enNNgrz4s7I1I9T+kgU0yAingw7agpW?=
 =?us-ascii?Q?bXlSrAbGHevZDYbe06A15IbC7gTgzds+IYF3T+drrrb0NhJ6dP36sAaV4Bcr?=
 =?us-ascii?Q?V5UgtTW/0jiEps38R/XE9k+m9JzT8E0Bz6JC0uMNeA/8Yg4ZaHZFKuJLhJoI?=
 =?us-ascii?Q?5If6cCDAzhWQ5ekwtq4dCUklisWH6qqgBU9WkvTL7Gh30SF3tYLHSOJbAaK0?=
 =?us-ascii?Q?MTJzoY76EC3Yersqk3QjEMsFHvGTPA8RzV8uBCDA54V/Z7GHPhOyR36+3EU2?=
 =?us-ascii?Q?XkJs/epUAucf3xMaQeSHw5ZM0NNc11z8xQnQXea0ajPeQg1+B+Ojw3NtiVPh?=
 =?us-ascii?Q?p8B/zPJ25/r9vcA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VwfWu6aIC+eBihi0Gbd/hrPbt4LQJhKz8pCwhOfsgyN6TnKTYvRb7U9G+338?=
 =?us-ascii?Q?NqUbfrD/xJyCT3KxqYQ0oT8KzPeayO/glyKe47yNrIPo+YI0VZQwe3vZ7aX0?=
 =?us-ascii?Q?+97vkfUmXXE6wzZkJv6z9610E5y2udH60haF9PUeDotbRSvBooHfoNRImFCw?=
 =?us-ascii?Q?miv2g/e7va/hYAYVI4SOj1xE5dZi5o12M11ekyEsqnYsjTnUjtvL3I9VjCv6?=
 =?us-ascii?Q?ycONB0x4IHxyI63RoiYuIHRL8E5mLsrdC7fCh8ZrbC691z44JTry7Ze+ubGk?=
 =?us-ascii?Q?3uTriiYL0WGJzDjKSt/hLIiHi5LW26lX41jWeQz58/5D6rEiB8e6hiBHgEqH?=
 =?us-ascii?Q?s+gAbnRHlhBFacMCGf4xRgIlbK4trGvwrGrQkqeUcpj54Okw6oBYe2s9zhxs?=
 =?us-ascii?Q?tCo7WABhZhCEJYs2yKMZQDWFxmoz+jI/NcopSEowDxQdqn2BjTvu/IAfgnnA?=
 =?us-ascii?Q?OmrRR6cypktHBfLfBMTAVaEKRJGbd3xxrtYXXqrhlUYRYAeZs7J8SqkDtJ9A?=
 =?us-ascii?Q?Gti2shxlC97A9pYcZgo1dYsm2SYwJlV7Fcd2E7YO6d6EukRqTPGw8iKWCmNx?=
 =?us-ascii?Q?AzpGOwiYms1fquTp86te+NhvG1M0OEigbtun6d8B3rmfdc9N/f+H9/oeqIRz?=
 =?us-ascii?Q?jTb6fYo8WhWQ3DfXQ4kyPt6bcJ6V80MsmdD8+jIn2llJR3hJCKzwKRUgdHHF?=
 =?us-ascii?Q?ew2XEouUw0FrYyhRLQk02mK7a/YpUR+DwvRK2fXzTNNL6AsyS5roInjJ+rQp?=
 =?us-ascii?Q?B0FCbM5Dn58ALvlOJCJ8bwvjOOzlielSnEef2IacLZ+k7Wl5T3Qty3QWaHxU?=
 =?us-ascii?Q?sY/Bi0eRStkw0yQ0LIbiMEF3tAyHUFxloVfIOeyqG3yr9Nm7tvMGDZZC4Zi1?=
 =?us-ascii?Q?pZOC0dvq1sQ04wfbl7lrjGOXmCci2fA+wYBZivOqTqYdQEKSiBXNygeyWY1b?=
 =?us-ascii?Q?zmOs9z4Pqwh7FUFxYSSxlJj4YCnIor2vfeio/cWL0cEjeTPGYqEBo0KpJHoZ?=
 =?us-ascii?Q?inlHzuVyjKhIYd1zH1qhLDWID/bYqgS/qcXqJbTA+rCo90UhkzpY5EAso2+h?=
 =?us-ascii?Q?SuXhqt4Wy0DLKWz1HbL/7wjNYfSjVYN03Yd9keVWW9o67VPfDiXfqozL2dBT?=
 =?us-ascii?Q?hl9hYun0Fp7qEtkREriGcwIrzG31Sir+LZASPMJaAjCUS3+OdPILV3BSmrED?=
 =?us-ascii?Q?AO8ez1mUqT1N8iGJ5Jqr45IsmEtbdC+rx1P/2mLMnSFZJihXCe5J9xQTTYRo?=
 =?us-ascii?Q?18ifGiVxXbiZD0mcZYj3hCieNF2/klX564B8hCxsxN/BZ1zbLfy2bCw8/QmV?=
 =?us-ascii?Q?a0jZrLw0R21+/R7K/r+Dt7UduyXxUdUXVWaZ0X7Rs1pxITeqfnwyovPCDWtN?=
 =?us-ascii?Q?3o+cm9w0yODygyZ7YapzE6ylGD+Em9HsGjJHufTn6jf4qZiAaQKw/gH+NFa7?=
 =?us-ascii?Q?ObqUxMgzp8U0ct1ihVtSRZ0Ujnj2FUapzqLpKioMWle/OOPlm1p/3O/EHzQ5?=
 =?us-ascii?Q?oW586xCthXf4+B4sko+OS0VfJZLLS7n4CYFXAqFD5looLuu43m8LXtv4mOYa?=
 =?us-ascii?Q?VwluynG1f/0mmh+U3IMPyvbVK93wqfU3TZsZGaicd0DO1HqYVyaz8Habc4GZ?=
 =?us-ascii?Q?1g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa756326-c698-4d91-360f-08dda7378585
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 09:25:06.1366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pR7kwLpsgWsg3EgYIbiYQ3zZVmmMBT3zMWbKcH3Bm8F1meBDuDe5ciHte0sjjY+quFqZhq6QFdwcTpyr9syWUd0xueiGKV6dk1HPH4YUGWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5174
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

Hi Alex,

+ Swati

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Alex
> Hung
> Sent: Wednesday, April 30, 2025 7:04 AM
> To: igt-dev@lists.freedesktop.org
> Cc: alex.hung@amd.com; harry.wentland@amd.com
> Subject: [PATCH V8 04/36] lib/igt_kms: Introduce
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>=20
> From: Harry Wentland <harry.wentland@amd.com>
>=20
> Setting the COLOR_PIPELINE plane prop is only allowed when the
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set.
>=20
> Setting COLOR_RANGE and COLOR_ENCODING is only allowed when the
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is NOT set.
>=20
> v6:
>  - Ignore COLOR_RANGE and COLOR_ENCODING plane properties
>    when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  include/drm-uapi/drm.h | 15 +++++++++++++++
>  lib/igt_kms.c          | 32 ++++++++++++++++++++++++++++++++
>  lib/igt_kms.h          |  1 +
>  tests/kms_properties.c | 22 ++++++++++++++++------
>  4 files changed, 64 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h index
> 4e4f7c2c3..6b9af3348 100644
> --- a/include/drm-uapi/drm.h
> +++ b/include/drm-uapi/drm.h
> @@ -869,6 +869,21 @@ struct drm_get_cap {
>   */
>  #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
>=20
> +/**
> + * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
> + *
> + * If set to 1, the DRM core will
> + * - expose plane COLOR_PIPELINE properties for pre-blending color
> management.
> + * - reject setting of these plane properties:
> + *   - COLOR_ENCODING
> + *   - COLOR_RANGE
> + *
> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> + *
> + * This capability is currently in development.
> + */
> +#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
> +
>  /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */  struct
> drm_set_client_cap {
>  	__u64 capability;
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 9b817c98f..9ebe22d1b 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2981,6 +2981,9 @@ void igt_display_require(igt_display_t *display, in=
t
> drm_fd)
>  	if (drmSetClientCap(drm_fd,
> LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) =3D=3D 0)
>  		display->has_virt_cursor_plane =3D 1;
>=20
> +	if (drmSetClientCap(drm_fd,
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) =3D=3D 0)
> +		display->has_plane_color_pipeline =3D 1;
> +
>  	plane_resources =3D drmModeGetPlaneResources(display->drm_fd);
>  	igt_assert(plane_resources);
>=20
> @@ -3608,6 +3611,29 @@ static uint32_t igt_plane_get_fb_id(igt_plane_t
> *plane)
>  	igt_assert_eq(r, 0);	\
>  }
>=20
> +static bool
> +igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop) {
> +	igt_display_t *display =3D pipe->display;
> +
> +	if (display->has_plane_color_pipeline) {
> +		switch(prop) {
> +		case IGT_PLANE_COLOR_ENCODING:
> +		case IGT_PLANE_COLOR_RANGE:
> +			return true;
> +		default:
> +			return false;
> +		}
> +	} else {
> +		switch(prop) {
> +		default:
> +			return false;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  /*
>   * Add position and fb changes of a plane to the atomic property set
>   */
> @@ -3627,6 +3653,12 @@ igt_atomic_prepare_plane_commit(igt_plane_t
> *plane, igt_pipe_t *pipe,
>  	    igt_plane_get_fb_id(plane));
>=20
>  	for (i =3D 0; i < IGT_NUM_PLANE_PROPS; i++) {
> +		if (igt_atomic_ignore_plane_prop(pipe, i)) {
> +			igt_debug("plane %s.%d: Ignoring property \"%s\" to
> 0x%"PRIx64"/%"PRIi64"\n",
> +				kmstest_pipe_name(pipe->pipe), plane-
> >index, igt_plane_prop_names[i],
> +			plane->values[i], plane->values[i]);
> 	continue;
> +		}
> +
>  		if (!igt_plane_is_prop_changed(plane, i))
>  			continue;
>=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 9b5a940f7..7531ae53b 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -503,6 +503,7 @@ struct igt_display {
>  	bool has_cursor_plane;
>  	bool is_atomic;
>  	bool has_virt_cursor_plane;
> +	bool has_plane_color_pipeline;
>  	bool first_commit;
>=20
>  	uint64_t *modifiers;
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c index
> 408e23578..01ec3bedc 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -101,7 +101,7 @@ static void cleanup_pipe(igt_display_t *display, enum
> pipe pipe, igt_output_t *o  }
>=20
>  static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
> -			    const char *name, bool atomic)
> +			    const char *name, bool atomic, bool
> has_color_pipeline)
>  {
>  	if (prop_flags & DRM_MODE_PROP_IMMUTABLE)
>  		return true;
> @@ -111,6 +111,16 @@ static bool ignore_property(uint32_t obj_type,
> uint32_t prop_flags,
>  		if (atomic && !strcmp(name, "DPMS"))
>  			return true;
>  		break;
> +	case DRM_MODE_OBJECT_PLANE:
> +		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE")) {
> +			printf("hwhw: ignoring COLOR_RANGE\n");
> +			return true;
> +		}
> +		if (has_color_pipeline && !strcmp(name,
> "COLOR_ENCODING")) {
> +			printf("hwhw: ignoring COLOR_ENCODING\n");
> +			return true;
> +		}
> +		break;
>  	default:
>  		break;
>  	}

This is not enough for the legacy commit path to work. Further changes are =
needed[1].

That got me thinking. Should we set this capability within the colorop test=
s instead of enabling it globally?

Regards

Chaitanya

[1]

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 487906453..707d9b89e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2664,6 +2664,8 @@ static int get_drm_plane_type(int drm_fd, uint32_t pl=
ane_id)

 static void igt_plane_reset(igt_plane_t *plane)
 {
+       igt_display_t *display =3D plane->pipe->display;
+
        /* Reset src coordinates. */
        igt_plane_set_prop_value(plane, IGT_PLANE_SRC_X, 0);
        igt_plane_set_prop_value(plane, IGT_PLANE_SRC_Y, 0);
@@ -2680,11 +2682,13 @@ static void igt_plane_reset(igt_plane_t *plane)
        igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, 0);
        igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, 0);

-       if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
+       if (!display->has_plane_color_pipeline &&
+                       igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING)=
)
                igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
                        igt_color_encoding_to_str(IGT_COLOR_YCBCR_BT601));

-       if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
+       if (!display->has_plane_color_pipeline &&
+                       igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
                igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
                        igt_color_range_to_str(IGT_COLOR_YCBCR_LIMITED_RANG=
E));

@@ -5549,10 +5553,12 @@ void igt_plane_set_fb(igt_plane_t *plane, struct ig=
t_fb *fb)
                igt_fb_set_position(fb, plane, 0, 0);
                igt_fb_set_size(fb, plane, fb->width, fb->height);

-               if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
+               if (!display->has_plane_color_pipeline &&
+                               igt_plane_has_prop(plane, IGT_PLANE_COLOR_E=
NCODING))
                        igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCO=
DING,
                                igt_color_encoding_to_str(fb->color_encodin=
g));
-               if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
+               if (!display->has_plane_color_pipeline &&
+                               igt_plane_has_prop(plane, IGT_PLANE_COLOR_R=
ANGE))
                        igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANG=
E,
                                igt_color_range_to_str(fb->color_range));

> @@ -164,7 +174,7 @@ static bool has_additional_test_lookup(uint32_t
> obj_type, const char *name,
>=20
>  	return false;
>  }
> -static void test_properties(int fd, uint32_t type, uint32_t id, bool ato=
mic)
> +static void test_properties(int fd, uint32_t type, uint32_t id, bool
> +atomic, bool has_color_pipeline)
>  {
>  	drmModeObjectPropertiesPtr props =3D
>  		drmModeObjectGetProperties(fd, id, type); @@ -183,7
> +193,7 @@ static void test_properties(int fd, uint32_t type, uint32_t id,=
 bool
> atomic)
>=20
>  		igt_assert(prop);
>=20
> -		if (ignore_property(type, prop->flags, prop->name, atomic)) {
> +		if (ignore_property(type, prop->flags, prop->name, atomic,
> +has_color_pipeline)) {
>  			igt_debug("Ignoring property \"%s\"\n", prop-
> >name);
>=20
>  			continue;
> @@ -230,7 +240,7 @@ static void run_plane_property_tests(igt_display_t
> *display, enum pipe pipe, igt
>  		igt_info("Testing plane properties on %s.#%d-%s (output:
> %s)\n",
>  			 kmstest_pipe_name(pipe), plane->index,
> kmstest_plane_type_name(plane->type), output->name);
>=20
> -		test_properties(display->drm_fd,
> DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic);
> +		test_properties(display->drm_fd,
> DRM_MODE_OBJECT_PLANE,
> +plane->drm_plane->plane_id, atomic, display->has_plane_color_pipeline);
>  	}
>=20
>  	cleanup_pipe(display, pipe, output, &fb); @@ -244,7 +254,7 @@
> static void run_crtc_property_tests(igt_display_t *display, enum pipe pip=
e,
> igt_
>=20
>  	igt_info("Testing crtc properties on %s (output: %s)\n",
> kmstest_pipe_name(pipe), output->name);
>=20
> -	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display-
> >pipes[pipe].crtc_id, atomic);
> +	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC,
> +display->pipes[pipe].crtc_id, atomic, false);
>=20
>  	cleanup_pipe(display, pipe, output, &fb);  } @@ -258,7 +268,7 @@
> static void run_connector_property_tests(igt_display_t *display, enum pip=
e
> pipe,
>=20
>  	igt_info("Testing connector properties on output %s (pipe: %s)\n",
> output->name, kmstest_pipe_name(pipe));
>=20
> -	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR,
> output->id, atomic);
> +	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR,
> +output->id, atomic, false);
>=20
>  	if (pipe !=3D PIPE_NONE)
>  		cleanup_pipe(display, pipe, output, &fb);
> --
> 2.43.0

