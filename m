Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24272CAC5B9
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 05:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFC810E4F5;
	Tue, 30 Sep 2025 05:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfCYN2dA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4409510E4F5
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 05:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759211724; x=1790747724;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+0XdYyeBT1wL+S3kOHS8+1lumgbvTH8JiyUCFDabrW8=;
 b=AfCYN2dARQjx/hAA4rR+NDLkWWMzWcRSpHFOy1M4kKHcBHHhE4uf4OnO
 bt8ZYW4V0bTFR5y/eKhuCZ9kWYAxUXNt1cPzy7+KLU2VolJV7c+16/GKA
 CikUTk66KnRwT7roCndPXp7yf3o2YBO/D+74zuIa/yF61P1brSabsVnkZ
 R1R0E7cgDDJ+I2gNoJE9cpfiNBa2GmjbJZLb3NdwcVLuEQdbWLyLbCQMk
 LDVtq5jw8JW4ZxA+kN4QlAgknUuuCex3Lq6D7JgbFbopQdvGIvCz3LRwy
 vI4bDsOcERCCC9XeNxFldap8E5Hefpn7vOHAp3I8JobPlyZ3VgNl7yi1X A==;
X-CSE-ConnectionGUID: +M7offfEScekTu03tPrQRg==
X-CSE-MsgGUID: A2D9e+5aR8qYJAvGlj/j2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61375361"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="61375361"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 22:55:24 -0700
X-CSE-ConnectionGUID: d4zoQnKnSqyMOGsNOq8oEw==
X-CSE-MsgGUID: 2+nwqZQBRraU8AE6Yulc8w==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 22:55:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 22:55:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 22:55:23 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 22:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEZzzwUfslZipOCGBSEAm5ABFf9hkWaB23x4grvWtgx/FNaJOZNMCp3MzreRAsHVCFVFE7uuiNGcaH0Wte088lK5Uj5g9hJsRIwi7VlGdmtZVmczUcOHFso1jGZfnlrJyoG3X38Op6p6r1/s+jhcLMM0YeGmdYCApeKysFznOrIOGvcDNhCTipahyOiPQvw1oUAnuiaHAOJMWkwVjxaSIAJlNYQKVNqKM0ejjDW6FhjPZjUh+apJ6xZ/qcpuXIdyKFUsW7aJQ83rbijCII7SifLnRn5GNOEHPVvWAFdFcfMRsA+sZH/mwC2znFqJsT0lHdu8/1YUR++PvwpN/jbjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9WTfLu5FdvqMSxj1/RjeY9kGkBlU5WAOzfNO5chSIk=;
 b=RiHp1iZgNYBh4+qA3oz9advieCImN1LW4Am14zAPAvhtilYFk5jSrWZUN5KnuA/qQ+PYmJbmmH4sxVDJZ2iWNfHnhSzgOVJPOLoBVodaMfdoD7CV/15wWBQ8JWzDesgNY6k85HJzUNgd/PycLsEHhoBfA3q1PIXZrVRLK7TKkFs3yq8ycFzf9kV6Z6qCOM4okM+LGVOLOIixiTmp+s0qJjD8+/eQNAntrlHTJuRHBeNJF91+VV3CF8RhJmcON/RqGlRvzt1Yr9SV5pSDms303w12a73PBO9A/vX6MDJKXsY6h/K+Z2Yxagd8zdN70pSyCBb5hlDj0XzrB5944lRLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 05:55:19 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 05:55:19 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>
Subject: RE: [PATCH v4 i-g-t 0/6] benchmarks/intel_latency: Add xe latency
 measurement tests
Thread-Topic: [PATCH v4 i-g-t 0/6] benchmarks/intel_latency: Add xe latency
 measurement tests
Thread-Index: AQHcJ9R9a0Wr0LdkKEiHnJgoQA0VAbSrTapQ
Date: Tue, 30 Sep 2025 05:55:19 +0000
Message-ID: <CH3PR11MB843415AFDC1BC183CE2FC3CC8D1AA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917131003.71762-8-gajendra.uttamchand@intel.com>
In-Reply-To: <20250917131003.71762-8-gajendra.uttamchand@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA0PR11MB4671:EE_
x-ms-office365-filtering-correlation-id: 07eee2de-f48a-43bf-57f7-08ddffe5efdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yjb6XAEhk78pnkgrG6C8rgxUQrLDEqfK8xolJb1LB6qcdJ9m8rpLYSELVVzC?=
 =?us-ascii?Q?kIb7+cU/SsqpoamvQzbBRzWEu0VpLNFnThuqRSNhN4PJ6zc8ttWesYBAerQS?=
 =?us-ascii?Q?+G8WCQ5m9FAXx2EshsilivM3iu173kCT6ogmEV4iRYFKtboCXjfl7lwoJgNH?=
 =?us-ascii?Q?iNwZAHxrJHLQ+rzn+tnvCZSvK7qr735/jObtvI5n7IwT/kOB6tNhCr3JwzZb?=
 =?us-ascii?Q?YNm481s9Wd6h+lKwltNHyUaiH4muYmzTc9g5qHaKoYiU5d8nSFfhB0GbBnpM?=
 =?us-ascii?Q?2krojdAVKTxaLQw2HQx8x52ceKV1tvS7WgiUl74IQBMVRRBE3I784S9apYeX?=
 =?us-ascii?Q?vrYJo8Ne1vOMCtn0NmavYzEn3HRowXe8obKs6GUfXLcUPUmsZKmw9z9dXO+F?=
 =?us-ascii?Q?fHVogufctePSoXlQw5Bomdf2RKsfv7WEMxH+SbytIAB83a6b966xs9jH7sTP?=
 =?us-ascii?Q?AYkSmeYrAq74Zev/XcgTLqUxKzxIzPkHJsSOXwyTKn3OBeU9WFrMjcHLHQTP?=
 =?us-ascii?Q?KKJNKgDlz085fargakx/VisIBfAT2UUToqK43Fw6AcernCGf2w2jzKsCmdqu?=
 =?us-ascii?Q?kGuggAavp8lhY7oftdgxhhAcGUnlRYHlQ52ifFFAqPPAkhygJJ5rmZ5E07sl?=
 =?us-ascii?Q?nTFu3miXXGO337D/p0ybYiCZc+yrKp/XvQPMI/wcPTqf8g5gqNyhNNpKxb0H?=
 =?us-ascii?Q?xyoVUUA6AmYJe0Cp5S+cpRprML11RRQd4Pe6iCoaBsQujKvMQ+pEoYGxyPeG?=
 =?us-ascii?Q?LWkXatbYp5N7DReDW4LkmffhtpRWdO4bw2esBT4k4IpE109U0veLSxXdNG9T?=
 =?us-ascii?Q?jAk+kCecKLUV4CqRgXkMk6p34KSkkKopv8evgPl8iuu+V9wANIjn3m+1wVpj?=
 =?us-ascii?Q?MD3WyBntixHvd9n3Mn/SKhlrnUIdWn7FYiV4LTNEPznDt5CtBW0vU6vRpeb+?=
 =?us-ascii?Q?le+Omu3/ePtiLZa/RNhDdRQnpScd++1ghQ45r61q+FqSphfo29MaTxHVfglk?=
 =?us-ascii?Q?6UChCbW4L27lU0QcOlxhEs7+Jo9lWmxW1QNzW3Bjjp8cQj8Xx/6gLfb0Nr0B?=
 =?us-ascii?Q?+4x8zIo0NRn6D3plVbqcZsOhWTcKbTYdbIyVUNQ8Cp6jThywv30aJV+iG2za?=
 =?us-ascii?Q?ujlDewfdphzEssS4z5drki8AagDb/9NxnTukZKA2pQVQM1ApyaojbBMsZHo0?=
 =?us-ascii?Q?ZXOptWQoLKpFNZHgtGJccr1F0U0F8Xn1GEgBjEoCHD2F2A0RVtx96y5XP9SB?=
 =?us-ascii?Q?eMHowcfQTc2twSQyDh/fgP/bgfwuQZ5V8N7IIQaooKMFNhSh3Ls4B7foV2hn?=
 =?us-ascii?Q?j5eaBgXLFdRMX6TfTE8yVAYU1LBJrPz+956K6fnV7PcmE/wKjAQPDlba268s?=
 =?us-ascii?Q?WVvR8pMPWilo6+Ic4tueEkAFGLrzl1OaqpKUf99F5BReSwKTAjQ+GsT4HBuj?=
 =?us-ascii?Q?hIOaj79hue1x5323kHuhHwL4fSeZWT2NaJohLAsWmd07JThoBfKbNZ+0TcAx?=
 =?us-ascii?Q?t0EJ3CRbiQd1Cs5OrsHmghgrPudMF3TvASgb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uOFr88xNTdCNZLxwoJ8HBnDU5Hflzk2nWKOa31os3rfNfUh/Rq0lIWuuI58j?=
 =?us-ascii?Q?Yenp7sM+m5N3tq8ciqbf180FAwo0EhSrADvVnQCL+ZKIgdGLRnP7Rlx651rW?=
 =?us-ascii?Q?XqCSvtBVmSF+YetonUX99SUmU01HQf3V6Fd7VmZnIrIHsMFtW8qMiL5DU8L4?=
 =?us-ascii?Q?QjZUdnk/gxNbthpelmYjPj47qCfWcvSorAoghH8P8D095401fAL2ttsMsp4/?=
 =?us-ascii?Q?l6EkQlDxRdTjiW4hJUpPeB6dYgQYhNKRcExVHwGagszTdXxFJmcy2ILWcb1l?=
 =?us-ascii?Q?9zsCHWwmwh/OSFno2kUy/gtt8/ZqVgoa47t+jBQ3z1Pt8Jd1jYlYRbnfa+GJ?=
 =?us-ascii?Q?a0cY2L9xSuNzj4u0QCFn5XSMAtZTq28r0Y1cK4k6p86KXjFrR8O46+pQtLF9?=
 =?us-ascii?Q?9ZDgrnB0NvpKu5Y7Et7+ErE7cMMe8C08xe/KmrccHXLPyY3hFBzJ/rsp9nyN?=
 =?us-ascii?Q?cXzCOqlcl0Fqsz9/BnUlV6IDNfWyDGTm5ao/ARd86MzoLliosWfna/ZLka3w?=
 =?us-ascii?Q?Po8rQFWcuOAJR9GLqTLmMiygFpAZRsGyjmC6DpoRRvNnsQBThHFYQleC5P20?=
 =?us-ascii?Q?tk5tqSE7dhNDlMZF0TJKUMkvKrJA7V0/Gq/3a5pDvuPNyz5YVtoY843E8fp+?=
 =?us-ascii?Q?CyDU2p1kxGSn4PhsgiblVswu9DPGYEJ8v70kLvonYt4qRrjgeJlFBcmIipJL?=
 =?us-ascii?Q?W9yLZT0zkr3IjMswtHSIZ3pQ93GtweOtQVPgKdqsyTj+B7U5qYzuezHV9ryl?=
 =?us-ascii?Q?L1QtXhJOOFIXu1M3WVy0BnRIEUfMp8FxEqkkKCgAmm+w81cD4P/2PrSkX0JA?=
 =?us-ascii?Q?bWiuls/Ys0d9dFn2Gai7Pv5tpo12EuCI2Nf84Coq8d/8Hb6pNTQ3UkskWWpv?=
 =?us-ascii?Q?cic1rdlZKB9/sX4CvovfnQuFsmleJ9e6GWCsh5uX9kD4LNlHcKW646WXsyVn?=
 =?us-ascii?Q?PRzLUQeDRz6SEDRWt4+75PhEhCy5pg1433wNdf0xwP7tCsSWz0ffm2wh2iqZ?=
 =?us-ascii?Q?T8Iubd8XLwbYXH4JSTFQGq7hQ//syLdbG9pAb1lysDyAYoZyZo1Xj27EXGtd?=
 =?us-ascii?Q?XxKzElRHsqBvJVGDyglZzPZvRna1wTHLTQ0XP2u3kCTV2WO7k5eMtzPZQ/G/?=
 =?us-ascii?Q?aui7wtpfPtxTNXTkFjV342HCsCnyyjFPzC4Seyj2KGQT7PUHNe/riLj7ceh1?=
 =?us-ascii?Q?9nsDuO7kzH9Rs4J93GnR1o/YWD5Q0SVD1xPsXJfIQVuNMWYpMg+PLNM9CstQ?=
 =?us-ascii?Q?YdYF6iVD7nzXyKv7SV7MLEGBoZkPASEadtT8QoDvxAOYaQqIGwofbyAKR7sS?=
 =?us-ascii?Q?HiZeCzp7FpO9voqTiqIbl9X4qPiraTLQ+TC5KZ+p4lp1RmXcRHuBIvp3SSE+?=
 =?us-ascii?Q?fAy6rxvxjllj9KlaDm0pxbNzbRi4khoGMamaBES4EivxcppSf55kQhMrnX4t?=
 =?us-ascii?Q?agoHTkLct9kXJsW0vc6dvao4d2yXn1/eSFcDTeT1HAaSC6LeYv9w0UAAqv7V?=
 =?us-ascii?Q?rM6W27I/6EF+hRNqG9cEtMqKWV7YSJSh34MvzOmhE6xqhBjs2PXSay5M+lxF?=
 =?us-ascii?Q?v6PK+Gt4PEiMzxG9KCbUwr3OcUIEZpbUmMh8GFl6gy4eyerKgVbgEgE2owXL?=
 =?us-ascii?Q?vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07eee2de-f48a-43bf-57f7-08ddffe5efdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 05:55:19.2723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7uQLBD064yYIZEc33EcYgvyPuknGlbnvQtijRkRAKCTvBvfUimWutVUprM+yfBn5iydCooPB+WdRJut6tiH3OhLirdMs0htnbV+a/nqTPhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
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
> Gajendra Uttamchand
> Sent: 17 September 2025 06:40 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Uttamchand, Gajendra <gajendra.uttamchand@intel.com>
> Subject: [PATCH v4 i-g-t 0/6] benchmarks/intel_latency: Add xe latency
> measurement tests
>=20
> Add latency tests to measure latency of xe driver uAPI calls for regressi=
on
> detection and performance analysis. These tests help identify performance
> bottlenecks in critical graphics operations.
>=20
> New test modules included:
> - xe_blt: Block transfer latency
> - xe_create: Device initialization overhead
> - xe_vm: Virtual memory timing
> - xe_execqueue: Execution/Command queue management
> - xe_bo_create_destroy: Buffer object allocation/deallocation
> - xe_vm_create_destroy: VM lifecycle
>=20
> Default test parameters:
> - Buffer sizes: 4KB to 8MB except xe_blt (1MB)
> - Iterations: 13 repetitions
> - Inner loops: 1000 per iteration
> - Parallelism: configurable via command-line options
>=20
> Updated benchmarks/ meson.build for build integration.
>=20
> Changes in v2:
> - Fixed trailing whitespace and formatting issues in several files
> - Added original author attribution to preserve credits for applicable fi=
les
> - Moved tests from benchmarks/ to benchmarks/latency/ subfolder structure
> - Updated build system integration paths for new directory layout
> - Preserved git history during file relocations to maintain authorship
>=20
> Changes in v3:
> - Added original author attribution to preserve credits for applicable fi=
les
>=20
> Changes in v4:
> - Fixed folder name to intel_latency (Kamil)
> - Fixed From, Author and name (Kamil)
> - Fixed some alignment and white space (Priyanka)
>=20
I have also suggested to do refactoring of the common code across all the t=
ests to avoid duplication of code. I see no change made related to that. An=
y reason for that?
> Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
>=20
> Gajendra Uttamchand (6):
>   benchmarks: Move xe tests to intel_latency folder
>   benchmarks/intel_latency: Add xe_execqueue test
>   benchmarks/intel_latency: Add xe_vm latency test
>   benchmarks/intel_latency:Add xe_vm_create_destroy test
>   benchmarks/intel_latency: Add xe_bo_create_destroy test
>   benchmarks/intel_latency: Integrate xe latency tests with build system
>=20
>  benchmarks/intel_latency/meson.build          |  18 +++
>  benchmarks/{ =3D> intel_latency}/xe_blt.c       |   0
>  .../intel_latency/xe_bo_create_destroy.c      | 130 ++++++++++++++++++
>  benchmarks/{ =3D> intel_latency}/xe_create.c    |   0
>  benchmarks/{ =3D> intel_latency}/xe_exec_ctx.c  |   0
>  benchmarks/intel_latency/xe_execqueue.c       | 127 +++++++++++++++++
>  benchmarks/intel_latency/xe_vm.c              | 128 +++++++++++++++++
>  .../intel_latency/xe_vm_create_destroy.c      | 122 ++++++++++++++++
>  benchmarks/meson.build                        |   6 +-
>  9 files changed, 528 insertions(+), 3 deletions(-)  create mode 100644
> benchmarks/intel_latency/meson.build
>  rename benchmarks/{ =3D> intel_latency}/xe_blt.c (100%)  create mode 100=
644
> benchmarks/intel_latency/xe_bo_create_destroy.c
>  rename benchmarks/{ =3D> intel_latency}/xe_create.c (100%)  rename
> benchmarks/{ =3D> intel_latency}/xe_exec_ctx.c (100%)  create mode 100644
> benchmarks/intel_latency/xe_execqueue.c
>  create mode 100644 benchmarks/intel_latency/xe_vm.c  create mode 100644
> benchmarks/intel_latency/xe_vm_create_destroy.c
>=20
> --
> 2.43.0

