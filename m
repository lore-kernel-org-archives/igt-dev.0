Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98733606B273
	for <igt-dev@archiver.kernel.org>; Fri, 13 Nov 2026 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T0IwPGGk;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=eQkyG5Da
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6351121EB;
	Fri, 13 Nov 2026 10:54:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E201121EB
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794567201; x=1826103201;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2RqUAjMxPacaNgPMYOFGxwJmxc8H0rYE3egHz+RzsB8=;
 b=T0IwPGGkJTajhW6TYUD85Ypl6xUl7z49/tViExODJ4j95uULQLlIRSlR
 4BKy961Q2pNCJkiJof3SdSeO5fc+1t/x+T6AQbDGUEMl4bo7eCV8VqXSR
 1TlOJYeN1MT/51Kq+ES/0Ecu2OK/053/hCmOpwRH1PL/gpjsEzIgHvqys
 Oy3tIfoF2jOpoxrtfyDW5F2zAOb1ajtdjkpZ1bjvSghxDBeBOHrkJcf9B
 bw/cl0nb6e2QfeoNW58WG+mHtXN+bl4/4SeRci/o59Gn7cTjzYzu9y42i
 l0yULLTu0IW+NPp2YBIpo9BOuCcobw/2h4t890r4duykWho6uDK+imOFQ Q==;
X-CSE-ConnectionGUID: Uq7NCUhnTku2tIEeygOp+w==
X-CSE-MsgGUID: 0Q0uFqdYQNS2DmxDIFdm/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3461460"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3461460"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 02:53:20 -0800
X-CSE-ConnectionGUID: 8RaMwFrLQ4mCXmvAHybJzw==
X-CSE-MsgGUID: n+vLjfs2RxCk/HimSrg0pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9311390"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 02:53:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 02:53:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 02:53:19 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 02:53:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3FpZ4Fy7t3aVr2yHM0YZP8HS2uZxjqmdcOuV/0Y9uZM6FP0wMQfuvzMtJc/be8HEpBcCL8ZfKNqxirQ1gQHLixFI0tLP5EdIL/kfd+NBOb0Z1RuecWs+G9v7HnywWP4m4hEljW6+YhaWJBrdDWzaGhprlIrRgJmekd8R0cPhk2tgL3lEFDKMvjrhuZe3yrYqWHCMiXFdT2NjOEI/UgLJb35dqyVkHqSP3z05c1p0bt2kXhjhrrEBk3U/1MYcXD6DL3lNIQMZ8j9Y1x77h/cI47YZzTeKZCBseGdvW2LzYVPkEGHQWGaE2TBeMf0+tP2vo0Xuy3vDTh7pQkBr+dIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RqUAjMxPacaNgPMYOFGxwJmxc8H0rYE3egHz+RzsB8=;
 b=Tc+dQft9z0YD59Bd7R4YZr9UVrFvlH/0qYlmA5nVaaccK2+OYjP6iZQDsWt2we5xPS0xSF27iGE55ILeM8e+CW+rc+Owv3FMdQI+4niVnQdzYJKGvCB+3gUH0ZTkrZSg46jgX2pi9REBvf/y0mvO0c0hsVwdeDc+Tg9lJG503GpJskKxvq/fkRUBfgegAgtF8UOFygUDD86xqlf1kHBWasKRP5JpSfL7hdmCDC30WK+cBOlRxrvpys3JfhC4dxCoP7WHRzcsk3LyPMmkXi4Zb/17XBww3xEyva3d4T1uAu9DLhrPMY4CUx8gjNMIaaA4QOimJZrWKFVB3dqzgbaZuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RqUAjMxPacaNgPMYOFGxwJmxc8H0rYE3egHz+RzsB8=;
 b=eQkyG5Daj9oKzSEa0rWQcALf47JGRqkI+YYFQDsDzY4vk+kxSoL78pPNIua5Vz6rFdwGfZp3tQ5F70bJj3pGLnYoHSA2Wg5IgPVOUJVIR83lgUctJFbhGZIOGpSTza7J1RHyOQRKVk4QEhcV3RFTw8KsQmC+kmM+mZFx8+19GNw=
Received: from MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 by DS0PR11MB8136.namprd11.prod.outlook.com (2603:10b6:8:159::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 10:49:00 +0000
Received: from MW4PR11MB6570.namprd11.prod.outlook.com
 ([fe80::63e8:6dc8:402b:36d1]) by MW4PR11MB6570.namprd11.prod.outlook.com
 ([fe80::63e8:6dc8:402b:36d1%6]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 10:49:00 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 0/3] tests/intel: validate PSR2 selective fetch
 under joiner
Thread-Topic: [PATCH i-g-t v2 0/3] tests/intel: validate PSR2 selective fetch
 under joiner
Thread-Index: AQHdbF2Em/xq1JX4Nki21YTmE5QgcLcqJNkAgAG4iMA=
Date: Fri, 13 Nov 2026 10:49:00 +0000
Message-ID: <MW4PR11MB6570D18B5817DC774A8DAB47EF7F2@MW4PR11MB6570.namprd11.prod.outlook.com>
References: <20261104130737.2549248-1-mika.kahola@intel.com>
 <7e10f85919c96d64bdbd5ceac032c52cc7829539.camel@intel.com>
In-Reply-To: <7e10f85919c96d64bdbd5ceac032c52cc7829539.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6570:EE_|DS0PR11MB8136:EE_
x-ms-office365-filtering-correlation-id: 7f571cc2-dbf1-45bd-db72-08df4173b9e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|3023799007|4143699003|11063799006|261102123227099003|261021121427099003|56012099006|261021123027099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: 3EcmShItAJgJgjnivkTzEkhlI1AN2s9q0i0uNAPwP0mJEJNkXyTdI6Z+N64MzWjpcUvh7l8Wl2BEUBe8NQfcLokmst+1culFhMVdmynE9SlRgH4/HYHR9F+FFQp0395BupB1DxxlSWHQQjmqivN8KVOkDMnW1OC/EfuUB0G1dN+Zt68iZxi305Zqb6+524yc896YTe5J/DRM8+a9YDb+IZAGJkgwYqRQm2I6+z4/s6ELMGuI1jFYOd9LRBV6M9iB5V8uxCMieQgJ1YAPYmdYby7ADTznCkVKA5x3O+DuZ5VwxV8qCucpSCpK6vuWYIZSfvQr0bMU8E5yHOyZsDVUGNpX5bFO336HSa1DXoohqrpCIqVj/poUe7CEU6tfDKxmoup2suMXls7s57Nu4StPPZ4Qy/53epf7R+1XpOsAqzfH7IUYHrz/pRU0fOydfK0mI/PtDpUEroAhXuGt0K5CvgMcaccovwrpvmh6mmYYieedRWnKfsMUQlMTrGho82TqJL5pC+pDRzVPWh0uanxzducpG3bViZrG4A/7aOHTfQgZL9XaXrDgSCEBGxZRyYdLBkK1AO3Zwkj/DiXCkqkWqsP6BDt6QJ23K/p7ZwRIYpz4nr/Mh1XPEL0O2gp7aFZmm0xKbBaQtQ5Cz0E2kOJyGfjC512twm0bVbmg/Leq9SAyXIVXIBGlRNVMZ0/Cz0t1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6570.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(261102123227099003)(261021121427099003)(56012099006)(261021123027099003)(261009223027099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXlNdzNRcDJQVWNVejd6M0ptSUtQMm9pMGlCdnoxb3lPMkpyM1BBV21BRklJ?=
 =?utf-8?B?ellUNGx1YktLNVpKOWcrMVl4U21pREg4OFY1SkhGdG85a2RqNzQ4RnhFWUJu?=
 =?utf-8?B?UWhIT2F3MXhMNVV4eUhMQW1Cd21MNTlwV2NBeTZPQlN2RUNRS2IzM1lKZzU2?=
 =?utf-8?B?QmZlblVrcE5yUDZSVFlBL3dIaURnaHNPRzdJS2MxTW9oQmZ2WTJpdHc3R2ts?=
 =?utf-8?B?OFVoRVNlMWtDWlpkbFBOcUNsbmtDR0NEMmp1b0hUMXFuL0EwTjFvMFVrZEUy?=
 =?utf-8?B?RWRpdWFib2FybURyazM4Q3RMNGpWeXArdnduS2JJOVJNMTRYWXVFcHhxS2Ir?=
 =?utf-8?B?a3h2OG9ETWNaUXd3YzBEcFIxMHRCWDRRais0dDZFb0tjai9ieUExdE1TSlNT?=
 =?utf-8?B?eGFmRWxERlJqdDhsVnc2L0pQeFdDSXlvbm9oVmFsTld1c0NKcTFoZTBmemRh?=
 =?utf-8?B?Y1A3N0tRUHNwV29aVVVMR01Vd3hCYmZoVGhId0w4NWxkVHRPNndvNHBQdDZZ?=
 =?utf-8?B?SENZb3pYa3d0emh0TnlQSUVUbmR6ZkV4UHo2SFRBQWd1dlRZYnpEL1dYNVlL?=
 =?utf-8?B?R1cvdE9UNzlJSC9wLzcvTGJsZEtvRWhUckhya1hJZWtZdk5FMHR4eXRVS2ZG?=
 =?utf-8?B?UFNsTmpXL3J3TnU5eW5iclcrMVRoMmVaODJXdDhwR0tWcExhL2g0ME8wU3NO?=
 =?utf-8?B?eTNiUHBsMERORlVNUkxUeXVFWGFEcEhTV2F5MG0veEZBVmo2b0c2b1dEMGRJ?=
 =?utf-8?B?OXNNclJ5dTNuY1ZpeXVqUThSS1FQbGQ2MWg5MnI1ZWoyMjNWeVlCYUJReS9O?=
 =?utf-8?B?VWJsemcvNTloMG92dFk3NThaVFpIaktiVElxQVZGNlRJL1B4aVlxYVZWVkIy?=
 =?utf-8?B?MmtERnBxeThTZTlkSlhYajNCS3BDSFJ0MUd0MFBRbE1wOWFyRW5vamlzRDNG?=
 =?utf-8?B?SG9jeFJFVUVuay9zc3dNcFQyYlFhL25iQXgxNzFPSWNFSVI1QkJuZXI5VVlD?=
 =?utf-8?B?VWJqQ2Zpci81bU1sWGlXV01rckJjZlJrZ2UrQWNibXhMaXRNWE9Nd0VzRlpw?=
 =?utf-8?B?dVcvd2NlN2g4Z1pxYUhMZ0IwMkpjbFRmYlRxNHBENDNTaTRHOVpEYUd4L2x6?=
 =?utf-8?B?ajVkeEpSL3NHU01YVlZYNlFaa3dZcG9EbkdjOXFrVEUrTks1N2tuZjBtejVa?=
 =?utf-8?B?WjZub28wVWtvQjk5K0M2MDVNb1BMMVhHYlpvSk1oWXNrbmpUSXFCelR6NEhX?=
 =?utf-8?B?eUNKNlBIb2lGSmFLNW1UajNUTUY0cnNvL1NMcHYxUjBSamlFK0RjaHBKUFdH?=
 =?utf-8?B?V2p5amlZVTlOaU9LRXpYR1p1M2gwRFppNmFub2hnaDIxRUxvSDA4ZWY4WERU?=
 =?utf-8?B?UHlSdUh3d1M2N0FRQngyY3RZN3F3OEtacWJlYVZRTUtnNWNXdXhkaHhWaG9v?=
 =?utf-8?B?dzBEZVNLYUtLUTREUjJnckVqUmQ4VWVVK1ZyclNKenFyWDNnSW5NY1RGWHpF?=
 =?utf-8?B?TFNxTHl1dFFCQzFXZ0dYaHhVWlhIckQzSXNyQlBVQytSUmpuWEdnQkZZVmNL?=
 =?utf-8?B?VWdYVjZyYitJbUV5VVNpRmwybDV0SmJya21XcTd6Z1lFNlVNZGZwV3RjOHY3?=
 =?utf-8?B?MTAvVDkrZDB4UFpDRkRmdWJsd0FPU041Ky9yRGhEY3c5bjNISUQxQ1pZeTNV?=
 =?utf-8?B?dUtiYzlnaEVFdUpaM2VEZmZjZGlmTGp6RllLWHRZc0pobUgzbVJuRmpHTEVa?=
 =?utf-8?B?WDhTcGMwcVp0NGU2dUVtaFg3R0tPcnhvbjVyRUErSmdWTzkyZzlZNDA4MTJH?=
 =?utf-8?B?MEQ0K3VJdFFOU0JtQTNpWmNVUDk0c01lUGNZUHVtY2l3cFVqc04rMEc1N2pt?=
 =?utf-8?B?aWdZbGdKVUVpSmR4Y2dIU3QrOXBMN1llY1NJUEdyNlBBMFRKWm4raWVSME54?=
 =?utf-8?B?TkJnSEFGV2VOci85VTRDZ0c4NGJ3WVBTTjFQV0w0eTZtVERCUWtJdlVtRHdQ?=
 =?utf-8?B?MW1sbHVFMkFQMkNZKzJKNCs4b3M2RndlUzdVNGdmNTBvWXRuclpSYnpYekpl?=
 =?utf-8?B?cDNsV0x4VGpaa3lqdjdaUzRxL3Z2aGpZR1UreTRzUCswcFBXUDFpVE4zZlMw?=
 =?utf-8?B?TmNxQ0svSFg2VWxranZWUEZEU09lYmJvTWFmQTg0MmFVNC9VT2hsREMzdHNj?=
 =?utf-8?B?Z1p2N1pqNGIxVkIydFBkNWdOTGNXWVdQVG5FYXpSWGo3TDBEa24yYkEweVBp?=
 =?utf-8?B?WnlHbXNkWTRTc3lVcHFHdnR0bW5LNzBKQlV3bzc3SXVCQ3Z6ZDd4ZUxWNzh5?=
 =?utf-8?B?aXBUTmlCL1pnK2hKOGhWdUZOdzRuSzM3S1FuRGdZU1Z5TVdqUXNnUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: stlzgG1pNqTgace0vRXrrhXo/OD9i1bITYTvGOtiHucAzeYwZAriMjSI5s1xWcPnbqK6Lm7SnAFTVPCLyJc67rLBMCGMnm8ACqHrN5Em3kmJjjxFj1E0i7MIxckW4g1lR3TLZbzh8+BFnieqD8dDrLm4QvCOix+9RJ364F5n2us0yDjsnyqANfgZzh2gz4CRX525T0NuGeDX/xJlwopL1vrchJZ6f0AsJQcjQ1IiXKbhZQ1Zc8nVwv4YEKwRyAZjf2Ec+VU82A9QzoUm/mh+lqZ0zLyiWL3mG4j4kpBFx8wDgZM18UWyo38U4qVzSA/Cv0KVkl36QJNcGVvU2iY/rQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6570.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f571cc2-dbf1-45bd-db72-08df4173b9e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 10:49:00.5621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YilIOO7wpO4vu6J4abOhV3rogYl3CWE5dX1TKTTNnAiBzYU3mD9/mQBYOexXTAyC7Hb2Z60xXwbAOrsYXUx6Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8136
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIb2dhbmRlciwgSm91bmkgPGpv
dW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIDEyIE5vdmVtYmVyIDIw
MjYgMTAuMjENCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBLYWhvbGEsIE1p
a2EgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2
MiAwLzNdIHRlc3RzL2ludGVsOiB2YWxpZGF0ZSBQU1IyIHNlbGVjdGl2ZSBmZXRjaCB1bmRlciBq
b2luZXINCj4gDQo+IE9uIFdlZCwgMjAyNi0xMS0wNCBhdCAxMzowNyArMDAwMCwgTWlrYSBLYWhv
bGEgd3JvdGU6DQo+ID4gVGhpcyBpcyB0aGUgdjIgb2YgdGhlIHNlcmllcyBbMV0gd2l0aCB0aGUg
Zm9sbG93aW5nIHVwZGF0ZXMNCj4gPg0KPiA+IC0gU2tpcCB0aGUgdGVzdCBpZiBqb2luZXIgaXMg
bm90IHN1cHBvcnRlZCBvbiBlRFAuDQo+IA0KPiBDb25zaWRlciBhZGRpbmcgb25lIG1vcmUgcGF0
Y2ggaW50byB0aGlzIHNlcmllcyBhZGRpbmcgZm9yY2luZyBqb2luZXINCj4gaW50byBrbXNfcHNy
Ml9zZiBhcyBhICJjb2V4aXN0X2ZlYXR1cmUiLg0KDQpCYXNpY2FsbHksIEkgY291bGQgc2ltcGx5
IGRyb3AgdGhlIGttc19qb2luZXIgbW9kaWZpY2F0aW9ucyBhbmQgaW5jcmVhc2UgdGhpcyBjb2Rl
IGNvdmVyYWdlIG9ubHkgb24ga21zX3BzcjJfc2YgdGVzdC4NCg0KVGhhbmtzIGZvciBhIHJldmll
dyEgDQpNaWthDQo+IA0KPiBCUiwNCj4gSm91bmkgSMO2Z2FuZGUNCj4gPg0KPiA+IFsxXQ0KPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2lndC1kZXYvMjAyNjA5MjExMjQ0MDguMzU4Nzc0LTEt
bWlrYS5rYWhvbGFAaW50ZWwuY29tLw0KPiA+DQo+ID4gTWlrYSBLYWhvbGEgKDMpOg0KPiA+IMKg
IHRlc3RzL2ludGVsL2ttc19qb2luZXI6IFBhc3Mgb3V0cHV0IGFycmF5IGludG8gdGVzdF9zaW5n
bGVfam9pbmVyKCkNCj4gPiDCoCB0ZXN0cy9pbnRlbC9rbXNfam9pbmVyOiBBZGQgUFNSMiBzZWxl
Y3RpdmUgZmV0Y2ggdGVzdCB3aXRoIGpvaW5lcg0KPiA+IMKgIHRlc3RzL2ludGVsL2ttc19wc3Iy
X3NmOiBIYW5kbGUgdGhlIGpvaW5lcg0KPiA+DQo+ID4gwqB0ZXN0cy9pbnRlbC9rbXNfam9pbmVy
LmPCoCB8IDEwMQ0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+
ID4gwqB0ZXN0cy9pbnRlbC9rbXNfcHNyMl9zZi5jIHzCoCAyMiArKysrKysrKysNCj4gPiDCoDIg
ZmlsZXMgY2hhbmdlZCwgMTE4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo=
