Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9ECC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jul 2024 08:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216B810E484;
	Tue, 23 Jul 2024 08:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbdsKgGZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F6310E485
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2024 08:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721721654; x=1753257654;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CIaa/R2gyh7CPoop+Iy1yiNDSX+sj6icgmoqFTVza/s=;
 b=fbdsKgGZrXtgA5gyT2zwOeG/5Lelvl0jyU1Ui0b/RUp0/+kjtUlrD0jF
 pRCRAGOMKJSFXg4P2rnlfEBj/hjxOk6irbCgioyO5Ji6jnOIwOV+bW+xx
 bP3dw/RROZNPOe0evXIe6XkfKubm3fF854opu5viBriVEL+WObthTyHEr
 mBhRRHXg+GoJxEoOhzhmgIJE8cH28jFc8KIzgFMm7RQi4rAgb3rluxO67
 hyeykwYYQsiez09rrFijPhqSZrz6xiuVKJcGO4v3gy93CxGfRru7gtgpU
 NQsSgGK94vuXULpRl5H2RYFJy0yhmpC2ZXVEVesYs02PgewvM5m4RzsJd g==;
X-CSE-ConnectionGUID: DErYH/4tQaqeZGn85PLlww==
X-CSE-MsgGUID: dfnEE6pDRX2NDpr2z0zROA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29919520"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="29919520"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 01:00:54 -0700
X-CSE-ConnectionGUID: 8K7cyVtTR5SDKg+tmPL+LA==
X-CSE-MsgGUID: fot2LCOeSYyTOljyi5RUlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="51816616"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 01:00:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 01:00:51 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 01:00:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 01:00:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 01:00:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Afp8Zri9l6puQ7rCptuv7cc9Y5iHkC1dGz9TIbFTOhfb6gDpI0sKLMdT5ZZzHrpSqABmMWTzVFzLFe8SL6OM2YXzObwAJavi9MPNuDJt4gDw18tZti7OyZGAvA2C0WYl2VLxoLDeuQ4WJ/Zt9tKSCNARNYNyQ77EDN99AzWt7N2nu/7AuppSGDBG+JrruuwULUQWj6zZDPitNEk7enXW7Nc2ABbJUclTWrAaDmkqQH3vAzojfeYN0e3IHcru+AiNB8tdg62bMOvnIzKJ+upYIbEZyyXsWpGPuNEs63D3snKh09Wbrgj10pUwskVlJZJMKhT7Z/FyQtzRlkYZwqWYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPpNwSYqFheYtgy9/0qe5bCtKjB1+pqNuIIe0VeaevU=;
 b=sDBYkqNExznSIr5Qg/BnZ2ND/7kLIjoOqu9oCBbIkaD9mUtI32XfKHc3CNjeXDnuUw0ZaJRfkrl5938Vv3eRKNz3TTOkLiWQef0RVS8eOmXtUKFnqfd0CX5WGJD13vRiR8MAvCiDUEh5JrguSW89c/A23H+EklZ6CWCluehpM0rbqpKY5XICIJUxqu/UBaVKwhPxsKH8koQWP2DLOoxG5sWyzXGNakej6AcEmfjzOy3O5H2RMTEbBq6Ut9UVvEZwdQVrCK18mIXqIs5KrGHjjKUPFNcTNk5j51jcCEVISIVNtG8+FhL0Ct7xJpy6v8lLlE2pj8NDwHIaQ3zHpBHwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 23 Jul
 2024 08:00:42 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%6]) with mapi id 15.20.7784.016; Tue, 23 Jul 2024
 08:00:40 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Add userptr free /
 munmap sections
Thread-Topic: [PATCH] tests/intel/xe_exec_compute_mode: Add userptr free /
 munmap sections
Thread-Index: AQHa2g8jlqL0OtQVjE6ojVd+NJYhAbID9sEg
Date: Tue, 23 Jul 2024 08:00:40 +0000
Message-ID: <MW3PR11MB4748AA06AA1FF4BAB7205C77AEA92@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240719190914.1535721-1-matthew.brost@intel.com>
In-Reply-To: <20240719190914.1535721-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SA3PR11MB7525:EE_
x-ms-office365-filtering-correlation-id: 706f5f31-8e80-41b6-bf4b-08dcaaed8bc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?X5+zfR5L2htR66yf0Ep11qAndTcb0I9mobL9unbGiByIrkv36dBZWl9HP7Qj?=
 =?us-ascii?Q?ZM/cf1Ay/acy4mtbOYSoVw05OBgkkLRiT1gJIqCHAKAs5dmsCRjJ0iHkNGXC?=
 =?us-ascii?Q?ETEMGaqAEqnuzesbmBi2zHiZLmF9L8aaAaamuhzfMQQt0wctPL8HC2e7WPRc?=
 =?us-ascii?Q?0lPjy5BEpjbDDKcmy8TPg67YolfVmZygkzhfzQr02ZcV/vpCj/HqwTxfjh0X?=
 =?us-ascii?Q?mTixNNKrPqiQwf+DPDHShg8FzTbpPKvK/m+mKl4Lsnjaea2Ib1LnvcB/or87?=
 =?us-ascii?Q?kqDQlSxkWnAJD7ck853uR+nolhbO05rGIBbnyi5bmH0bNITNE5YeqvD6Pgg2?=
 =?us-ascii?Q?QScMcMSvxTwExsChoPbe2e+bzxOXuFtrRfU4Ra4KxxMsnhDIG8Rgj+oY53cD?=
 =?us-ascii?Q?WySfPNFtb3UJtbWLt1YdCFkRzHjfn16vItqTH7JPHA1NjhqhAAyHcWYEyW7E?=
 =?us-ascii?Q?dwFQnGNKxM03zks2FMsL7xzIrljl/YPHPz8qjOprtJn3cyMRibwzWWR7AfNp?=
 =?us-ascii?Q?QDCjK49ezB5IUjSsrAHsR2Ejw7DpF7NTEWexEW7LsqQ7N1QjmQF4Iknt5c3A?=
 =?us-ascii?Q?+vM+KoIkx3XBe/gR82J/fQQYKRnK7rQ7F/DqEJL7MOC7Dl/VTzFlazT4w4B/?=
 =?us-ascii?Q?aMMj4OGESLnrfTMo2zAzAmh7QaiQXx7uxQyg6MjgdqtjOPmq5en6bPPgKqGR?=
 =?us-ascii?Q?Fpmut9kfkXxjpZwTzwp3xAs6GbJ6sbPCcApShXvfOKP4twoSKxdfVL/1aePp?=
 =?us-ascii?Q?qgfp4vWrBJO8rSgwIn+PN16A5SyWNUx9+H9obYfW1KM4tQAo6kxH3CSBenV3?=
 =?us-ascii?Q?/6uKQOXuPvdfD/yo0ZEaBkrSHWS/CiPL9L+oYI2VeSJ+sXH+7UKL/5Ftie83?=
 =?us-ascii?Q?H13jvebBcIu0zXmdZXacRT9hWuWkSXK5UXXBE8pdkq/aW+LHGq1MaIR57Zkt?=
 =?us-ascii?Q?GJ5StA9vk+FI+lVHRf+8jMguY//nxxxNhUGm2ibTHNz0qBa740DjemD65SVD?=
 =?us-ascii?Q?48QEu21rG283HByCPywtjuGFmExvRbFqJOHb9yM/YANrLMnXM+eMpJhJaRl1?=
 =?us-ascii?Q?eBw5HJgPGgxgUDzspmVJJpTTg9P54Oja4JBO9GpKOoBxa6HX2XxHQ4M/KpMS?=
 =?us-ascii?Q?mIIGyhfFB4jXdD6fSYogycQeR1yJi32H70TWSeKCiNs3rj/siPnvT/x1U9us?=
 =?us-ascii?Q?FAx/rJYHZaTGt74fx8qhVTcvpoecmKJETgMv3LLNlxznsWZoOU+rUCJv61n5?=
 =?us-ascii?Q?Agpe2RFTNA/ZQZSha7S/hSIQSbaHefbN42l3z6ys2ma3NzaOLrB1N2UaUpWa?=
 =?us-ascii?Q?ELQTFKNkflZ/nNN+vPO+uLsYFzjOFVIEF3/2yYz8Dfox7zRXArSkGxI3HTVU?=
 =?us-ascii?Q?zca0mGfbpjzO/WZLsrxrn4+mG/YReHQs/V7gWw6jqTQDqSrpUg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mDboqYURJu+COoBz0HoSRTrHoHLSYt0qezuKshwOrt0KfyOeBhoergYZti87?=
 =?us-ascii?Q?K75LT1cw+9IQAiJCsqwJ/wEik0Yorlitw/fbXiwdJ9Gm5BKwy/3bUtGGUV/S?=
 =?us-ascii?Q?BEDSL4XJTD9VipH290Z7QjQHVWV4mqvFJXW7bo1PhdzJskib2gLnTBfD20Ub?=
 =?us-ascii?Q?KsfiFSgyenrOdbjOhOCUNCgFYWMvSrC1hio/jPG70vcj7honIVWKSnrnpl4H?=
 =?us-ascii?Q?Rwvz+17QQe2+FGpyHrE95+u9Sd2zI9mn5P7AE0TE/giZo5G18v5zDIS8QpgX?=
 =?us-ascii?Q?6T4IomNHED4qGniJoHHlWAf9+BrWC6qDoXmRlgj8g7+NUyRmVp8n8dYZRxb2?=
 =?us-ascii?Q?SMrWF7EuSu4q5lf9vVG9AdAJaf0sUP7BQxL2YxgqoFaAHYmxeIPrXrukvgev?=
 =?us-ascii?Q?3W4/kq1Lyo0fqO4kGsCHdZiBOyt5m67TihAkoUP0uIM0gNcD4alRbZ0yJYwM?=
 =?us-ascii?Q?DqaC0k9weO3XqJgn4s5KpiJISQq1qGefYbMJ87/0H/F9p1SXC588wco1gmQq?=
 =?us-ascii?Q?0QezHq2eH078E3LCmEANQaEVk1ky/obaZndSLfDxxKH1aqnFu2L7zrRCJZO6?=
 =?us-ascii?Q?tJTywpmxkS/krM9H2h2a8SkrtMmE9SAMYTVxn9BAZBFQO1sAiisPzuMbjGOc?=
 =?us-ascii?Q?sU4orpp/ttWU2RJUGE/vSAEkFyZEBeOUzJNtti1VQPOZ5WG3k0SXKSBqXkok?=
 =?us-ascii?Q?p+UdFfXQY2sEYTdCtxJpbWlOXQDJ5U3BsGx4VpOh1ROMKF7QRAirrVbmb+mH?=
 =?us-ascii?Q?fCKzY7/CBmMMQFlOaobxA1CLgBM0kfmJ6K18J1KS1y6N8KQ1YdDSRdtogCIz?=
 =?us-ascii?Q?GotPkVtu2QLlc7rqtHBP958g2vYpEVvbB5uKnap4VHfUQoZPQA1EoTn9G4Fd?=
 =?us-ascii?Q?7G37mQxstB/X6D+MTRwUpbgJRRdkhZhHkaWRvBpuXR7cn0r8R2N8qf2F0gAH?=
 =?us-ascii?Q?z9+Rotj7CO6tVQX4c3FGof28wYA3Z/mu3OAUJj9JjAfsZTb0/Sare3GfUG3B?=
 =?us-ascii?Q?FDuoIWXH1UFfO8At8j31odTNKUkgqRykE2XcHDfCwxdyux49Lsq8L7XCmVac?=
 =?us-ascii?Q?lmLCn09Gwt1Lq8AIgAkx4sVFwNq4kVIKAhVnMRQplnnV6yH5CHGyUV/1dun3?=
 =?us-ascii?Q?JnB16vr+Tq035/xbM1ngpB2Q41/3XaeweKqE4sQJV3jtfVWqWC1gCpTUi2mB?=
 =?us-ascii?Q?qwxXCiqmBaQOHsGBjzzypo4w4BkGgJXCRqHt8KbxweAkXhubyU5JVeBClgAR?=
 =?us-ascii?Q?jwbwGg0zqa+8Xzj+Q79C3oe/xKKLIiFLV7Ol6+egQlyABTZEqYpmnNGQqW0z?=
 =?us-ascii?Q?hPltQq/VuX17YXHORMTyrqZFWzaXTzgI+9oDH9sDmEfqYolPHiD4apu1Ay7j?=
 =?us-ascii?Q?DsUfT4ZLRcn5RwC0lNNCYGlY2U33ultWxOiamEu2STmZ99OeGo8+lJNJZUFK?=
 =?us-ascii?Q?1NTQm4iH2e0ijzDDIqy24zBdQOVJUy2GFMXZgM0XrpGunUZLQcX3ArNLC0Ei?=
 =?us-ascii?Q?EP1ctd0A133ZSx8/lRTra9eOSkJV8FMd7ki1Mm0MXc6ZUN6+XH1RHTiLlR51?=
 =?us-ascii?Q?TgToEjk0DjJj5eG6Xj5x+eRAy+qQ97wBZgvdBRNEdda74MfS39vaq/DXTeUH?=
 =?us-ascii?Q?Dw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706f5f31-8e80-41b6-bf4b-08dcaaed8bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2024 08:00:40.8692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilbYkwQln5bedDUPHnzC+ctK1T3VKlM9Nv/oaoXuwl6Nx37tNYqdTECbdvvAYT8E6BvL5vptON/hZvzoO5vaJu+Kot3OYFMx/rcmzciBO74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w
> Brost
> Sent: Saturday, July 20, 2024 12:39 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH] tests/intel/xe_exec_compute_mode: Add userptr free /
> munmap sections
>=20
> Add userptr free / munmap sections which does the aforementioned while th=
e
> userptr still has a mapping. The userptr will be invalidated triggering a=
 rebind
Which will trigger the userptr invalidation in this test.free and munmap ?
or do we have to refer this addr in batch buffer so that the addr will be i=
nvalidated
during exec buff submission.

> which will faill pinning pages as the userptr is no longer valid. This is=
 allowed and
	       ^fail

> should not corrupt the VM or future submissions.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 43 +++++++++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index 389de7ca40..704d975178 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -29,9 +29,11 @@
>  #define REBIND				(0x1 << 1)
>  #define INVALIDATE			(0x1 << 2)
>  #define RACE				(0x1 << 3)
> -#define BIND_EXECQUEUE		(0x1 << 4)
> +#define BIND_EXECQUEUE			(0x1 << 4)
>  #define VM_FOR_BO			(0x1 << 5)
> -#define EXEC_QUEUE_EARLY	(0x1 << 6)
> +#define EXEC_QUEUE_EARLY		(0x1 << 6)
> +#define FREE_MAPPPING			(0x1 << 7)
> +#define UNMAP_MAPPPING			(0x1 << 8)
>=20
>  /**
>   * SUBTEST: twice-%s
> @@ -51,6 +53,8 @@
>   * @basic:				basic
>   * @preempt-fence-early:		preempt fence early
>   * @userptr:				userptr
> + * @userptr-free:			userptr free
> + * @userptr-unmap:			userptr unmap
>   * @rebind:				rebind
>   * @userptr-rebind:			userptr rebind
>   * @userptr-invalidate:			userptr invalidate
> @@ -74,6 +78,8 @@
>   * @basic:				basic
>   * @preempt-fence-early:		preempt fence early
>   * @userptr:				userptr
> + * @userptr-free:			userptr free
> + * @userptr-unmap:			userptr unmap
>   * @rebind:				rebind
>   * @userptr-rebind:			userptr rebind
>   * @userptr-invalidate:			userptr invalidate
> @@ -88,7 +94,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
>  	  int n_exec_queues, int n_execs, unsigned int flags)  {
>  	uint32_t vm;
> -	uint64_t addr =3D 0x1a0000;
> +	uint64_t addr =3D 0x1a0000, dummy_addr =3D 0x10001a0000;
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  	struct drm_xe_sync sync[1] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, @@ -114,6
> +120,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	int i, j, b;
>  	int map_fd =3D -1;
>  	int64_t fence_timeout;
> +	void *dummy;
>=20
>  	igt_assert(n_exec_queues <=3D MAX_N_EXECQUEUES);
>=20
> @@ -142,6 +149,17 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>  					     bo_size);
>  			igt_assert(data);
>  		}
> +		if (flags & UNMAP_MAPPPING) {
> +			dummy =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> +				     PROT_WRITE, MAP_SHARED | MAP_FIXED |
> +				     MAP_ANONYMOUS, -1, 0);
> +			igt_assert(data !=3D MAP_FAILED);
Check  dummy here. ->igt_assert(dummy !=3D MAP_FAILED);

Thanks,
Rahul

> +		}
> +		if (flags & FREE_MAPPPING) {
> +			dummy =3D aligned_alloc(xe_get_default_alignment(fd),
> +					      bo_size);
> +			igt_assert(dummy);
> +		}
>  	} else {
>  		bo =3D xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
>  				  bo_size, vram_if_possible(fd, eci->gt_id), @@
> -157,16 +175,21 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
>  				xe_bind_exec_queue_create(fd, vm, 0);
>  		else
>  			bind_exec_queues[i] =3D 0;
> -	};
> +	}
>=20
>  	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -	if (bo)
> +	if (bo) {
>  		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
>  				 bo_size, sync, 1);
> -	else
> +	} else {
> +		if (flags & (FREE_MAPPPING | UNMAP_MAPPPING))
> +			xe_vm_bind_userptr_async(fd, vm,
> bind_exec_queues[0],
> +						 to_user_pointer(dummy),
> +						 dummy_addr, bo_size, 0, 0);
>  		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr,
>  					 bo_size, sync, 1);
> +	}
>  #define ONE_SEC	MS_TO_NS(1000)
>  #define HUNDRED_SEC	MS_TO_NS(100000)
>=20
> @@ -197,6 +220,12 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>  		exec.address =3D batch_addr;
>  		xe_exec(fd, &exec);
>=20
> +		if (flags & FREE_MAPPPING && !i)
> +			free(dummy);
> +
> +		if (flags & UNMAP_MAPPPING && !i)
> +			munmap(dummy, bo_size);
> +
>  		if (flags & REBIND && i + 1 !=3D n_execs) {
>  			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
>  				       exec_queues[e], fence_timeout); @@ -
> 489,6 +518,8 @@ igt_main
>  		{ "basic", 0 },
>  		{ "preempt-fence-early", VM_FOR_BO | EXEC_QUEUE_EARLY },
>  		{ "userptr", USERPTR },
> +		{ "userptr-free", USERPTR | FREE_MAPPPING },
> +		{ "userptr-unmap", USERPTR | UNMAP_MAPPPING },
>  		{ "rebind", REBIND },
>  		{ "userptr-rebind", USERPTR | REBIND },
>  		{ "userptr-invalidate", USERPTR | INVALIDATE },
> --
> 2.34.1

