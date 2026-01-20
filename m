Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0324D2ECF9
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 05:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B84E10E4C1;
	Tue, 20 Jan 2026 05:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEzvuOfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4236E10E4C1
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 05:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768888655; x=1800424655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hph4tAhJcwjRMGrPehw4gQ8HPSYgL756VYJQ+iJbvjc=;
 b=cEzvuOfh9WzRj4ogcqFzDRGk2XDdOP9dBIAsWHElvT4kDuHHXvCTJCOt
 2THkOPchSH3TIop3TFuSU0FbWFc9elUgHOIy6GTrU8EHNYKFJcsRo24qq
 WRhSEBbi26Zd2+HZRc/ncijgM57hO9DRl6zA0wHpjavoADU7o43BP0XW9
 +y+nx59BhiRszcCDHh8TUdIEWZyIqWWV4x7OGZPmCBZTjQNkAB4Gu/ae1
 XhzRttYOU3agh0NaEamudFnGuUUM4HA6FosNMN/K3xuhcBNG276V0ALvs
 jJu98CxGtnbw267/L2B/Rf+k9XcMbHlFm5OkKqWJM7eL8VF/TNNt4ZZ4m w==;
X-CSE-ConnectionGUID: xtsogEIHTu2M7NfAzBQX3w==
X-CSE-MsgGUID: t7fUc13GQXmIw428SEO1Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69819367"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="69819367"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 21:57:34 -0800
X-CSE-ConnectionGUID: 1trZl28ySJmizae7yzQq7g==
X-CSE-MsgGUID: 9kS+A7IJTpSfOsncKV9Mcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="206460042"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 21:57:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 21:57:32 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 21:57:32 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 21:57:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMGaqEGi0AweA5Gi42G7vEdJP551ie3X7Ea5znCw4kO0YVX2jUtRyaJ4i6g4jYQljU0lGWJFIqvQNPBqkFcmvydWP9UijJrintkP9nUpjTCorNvzkXKyHdmHgDM427j00IHCZonwnwwwYaSRIvkGiAGxFuVP83VKhz97oB5qJSVnlTaFGK4/2+3KRD31X3OxlFHT3YbUKfXzxJuZ5otoV+rEL2oq+rxgBrperZl/cK4jAgGLGld/ARauosBs8+Wtdil43PmV+33Tr8WgE9kzWZ8Cn64DNG1E46BkGvzjScVT7uG7Lp9jljz69BJkfwY32H1aR+x4zsvP4W8CP0qtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZmCDL4X9iYuljbL2cU+g0bJnv6jFa7gPQh3S+wRq8g=;
 b=kAzZP3rAFjS15fxrT8EuKc8xNjCkBCC8A7XLTdPLSsRux5lZjjmgdmIE1vnPb7De3hr0t+j3mhIOoBO93h+BaXJKSSgHTNhCcahNNd28Il1ZytY7u+jd213VT1K2oaVtydNlAZ5mx+OoZjpCIkf0vO1IcwsUmp8pIKMLCcyC5pMzo3uAKeekbwaWzU2XZtF2+l59mxpjTQMY+7cLkWXJZjn4yYKckMc9VqTlNuDwBGAQCiDZCB4ZHEMTbPOZeLBdz4Tq0UzA5g5VAOBSr2hck9GFtNdj3Ikkp50YnKFU5fHWlkP4lmnFYYUpeFRljNNn1ElqrSYR80kpDQLvElIGaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM6PR11MB4515.namprd11.prod.outlook.com
 (2603:10b6:5:2a9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 05:57:28 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 05:57:28 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHciP7XkgC+KpYm20eTttXamoODnrVY8afAgAGfRICAAABHsA==
Date: Tue, 20 Jan 2026 05:57:27 +0000
Message-ID: <DM3PPF208195D8D319B54692D95D366CBC0E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-7-sowmiya.s@intel.com>
 <DM3PPF208195D8DF52BB0D3BE58C7D4F1E9E388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <PH7PR11MB679646F3DC6513E02391A293E589A@PH7PR11MB6796.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB679646F3DC6513E02391A293E589A@PH7PR11MB6796.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM6PR11MB4515:EE_
x-ms-office365-filtering-correlation-id: c2c46c40-78a1-4420-7f58-08de57e8cad2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Dv3LKDBtF9nVspjhLRSxmcolgK3QVuCOcUrKToh1KjfpFmNc9G3EHHW1YTac?=
 =?us-ascii?Q?CP9ltFcCfOjOGFWwhkcQRl8kIj0lElEBlW2H09DaHevWbiMA3dBvrNLth7Dt?=
 =?us-ascii?Q?jNY6LW9l+kgm9hoCwbtIg8IZBnA8rVY5lV7IH8FCyS5CKWOh9Z1u1awYZK0c?=
 =?us-ascii?Q?RGAbt+k+SpyyIOG837R3CoU5Q69Qgxg3yUJ1uVcJLlMbGB8SmQIzHKIayE0p?=
 =?us-ascii?Q?FVWA3ljMPYt+mtQutv2w7WKHJaZCCJRmcVdOqlQ56NNBScvFAFoPCEr/xwnm?=
 =?us-ascii?Q?3V/EY2UeLOEL9867U3CwKZXjOSkwA1E8iJvRw9naeNQC8+XEzTO/pAb8fHzf?=
 =?us-ascii?Q?wGci1M/1H39bOggKToz+sCFL2E5xXkoh/EmJ2PGJiU5uM1W03CZXvCoajFg8?=
 =?us-ascii?Q?dxhjW34LI8fAGhAQLbjSkHhQskVonegZI6Zija1I8butQblZEE5ULiTGBAmY?=
 =?us-ascii?Q?/KH1c9WO71zyrC5cP1wLC2syt2Iw35TYtRjcmHT5Oq45+XHdsKbpeYwOIfCX?=
 =?us-ascii?Q?IRaYijwAizq8AnkV8eZdK+5wIPfTEAYkCE9gDsnUmvSfUMXm0Ebn/3fHQ9J6?=
 =?us-ascii?Q?8fgOCIb+nYWDencoo9FlFOXilSrL6ri4aq101QtVBUxOaCDDr2LwXmBNN6rH?=
 =?us-ascii?Q?C0yPg+LR/OteWbBiwgaOU+5CDuMUoXIbmlyNXrjCMvcUiRj1MDXfgOY160WB?=
 =?us-ascii?Q?Y/8P3ngxS+qU5JIL1t5K1Sjq7bmVvPvBcsfkGHyvLV5eTwH0UOpR6928z/x9?=
 =?us-ascii?Q?VdiqBFmbEVm3mb4VN3nTD3hVdP9CgogHm9LdsLwlnvvoEWOwCfEQEHa/kA6l?=
 =?us-ascii?Q?1sJpD/o0wgdH0DBKe3Kg8Q0cj9Au2/4tSHPfFElOa5ceTofL3VQoWEbzCask?=
 =?us-ascii?Q?0G7KQhEVN70L0sn9QFFEFZg+Nax6HKu27tM/yiYxmbMZkR/TFjk8DyzbV+Oe?=
 =?us-ascii?Q?JOYmmmPf0FSUa5D6hADDhSaX+ny9pk9edJ3H/ld8/iggPDGyu2Jik2+0vcLQ?=
 =?us-ascii?Q?z8LZMvLsPHJcrErFGN6KrnYZY8a3tiUXE/T2+aMhcdQObkF5krKT9Oo6+kmQ?=
 =?us-ascii?Q?Dlw2/RJQYu94BMzkhG5mSQMKhubIWBnLlPoYf4tlRVeAdP3C5Cto8ib4/pjv?=
 =?us-ascii?Q?5+SbqVUwxXPoxLjmwLsf5CurUq46ZAAqASMcQyUwDHmt4DrRgyrMFzugQJtF?=
 =?us-ascii?Q?Ixxtyg3tPlaiEjjguuTdQOMbS8IRNM4uA6Tcm0iCCqn0m/kcO+teYXaYHFjI?=
 =?us-ascii?Q?DVSt3p9rTYUf3aCDVbYXbepF0MDRiGtStCjYo2Emc9AAJy9rWHgR2vqm6oUc?=
 =?us-ascii?Q?J7BexHtVfZ5S3NI+zeHPnQ47m3tqLA+6xFS4bcmeOJeXPNCcVGvgCBV02oA0?=
 =?us-ascii?Q?At34u2ioI4IDO6lvF0DGGAoubRk2EZp/x7+w5tkeUrmQeAsjx9nWqCGXBlTB?=
 =?us-ascii?Q?50B0uE44GQcagFgmrRjWK10O9/OYbZvooEAB6lUSpyCV131O1QigDsr2PdBL?=
 =?us-ascii?Q?fIous3YoFpCRr90oHBf1amnEfQmVErN9ZXc3jaazdkFn1WooD6KnH3FEEssk?=
 =?us-ascii?Q?fUlezrrgCMw29fdGpla+EmU5xWRAGciEyUE4SYt64AcmiZi6hA5PjDvECFnT?=
 =?us-ascii?Q?XrmU/tSXxWzxTbP7fEbl3K0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ICry6DhmeUJ2U9X23A9bbRkbBlXpsQZYN7uxmhw+uNrm9rQ0uNxzl7KjAMoP?=
 =?us-ascii?Q?gWThw4hJrWUm180i4/eg1GN/NMmXJnhpgM1TKq6k37PTn1HL1PR4g12cYDbN?=
 =?us-ascii?Q?DiW9tz36hKOVy+rZ6SCWZmR7rf1LCUne173I8GLuU1e03lIRcjOAhdm3ydWG?=
 =?us-ascii?Q?GkatldQi72zGDFQix3iujOGaZZdEiPGybU4GCx3xYKMB88BOuFKbAAiFByUU?=
 =?us-ascii?Q?VzcTg6ZtwDdcM8LppGgrocAvWQTD/yn1kMjHOcMaeHYhW1IFMKbhjOAUHa0g?=
 =?us-ascii?Q?1GYE0uS1SWye/Rr0Y35JID1M9GWCO7/L4TKOtNppLaaItVz4cLs8rEDerkP0?=
 =?us-ascii?Q?7wTkFBIgCLHt4HGKNll/7G4kaJ8NqUOMvqbkSXvGJGxBsQOTJ0yV0b3ZZH7c?=
 =?us-ascii?Q?yi5Yzrpu2xS1+qOrD/i2Ozt3cQT2g0Y8gUkaaFkOUIQ1eIDMhgxn6yVz6cVO?=
 =?us-ascii?Q?lNhjCEysC0plPXFop7oTDGuAB2SDxRGnALpoIu89Nmceyz9zYTLuAR45C2DS?=
 =?us-ascii?Q?atwlxRHsznXav/MpnuHrZ8WKRip/bH7g664mX31wguqZNbAjTerexiNR4PNH?=
 =?us-ascii?Q?JJJg+o/9hj2sHAl9A37D2DqdOCn3tIusjTb4q7+w+tNjNIjG8IZ7AEt+0Kn7?=
 =?us-ascii?Q?HZ+DYsj708AZsY7vfC4RkmQKdKSwoqgyjKYA+8BIiplrByC5CqKGJyqCEXZ4?=
 =?us-ascii?Q?zyYLfhHZTYNk933Q4KfhLJUffz+fHUGf+hnq8CmeSwIUr4OEnSgblMMKp1Ri?=
 =?us-ascii?Q?UkZEICYPAyKTY7hnkVHsbR6KQgCBbFtyDAnEG30npf2jt4nh1ykkoQHbKSrw?=
 =?us-ascii?Q?lDGrIuE2X3s2HOepQI/MNEXyGQ0mAgJJxc/e/SlkLDq40OCHnJWEYkPz/82G?=
 =?us-ascii?Q?lVUCn5+FLrnsLXZDClTp6/N4es0qyYDsImOzN5gP9ELMfrqWP8m6rKBFk39l?=
 =?us-ascii?Q?EOK49N9ETCMEOJzjP7/GdTKqVqPciwbnWcEEoL8JdWgcvjPJBxVNobolgP4X?=
 =?us-ascii?Q?oUstCA44qSDcy4lTir8Wipvp4JjJi6BMpj+OouXiy0WPM3MyxlDR/H5P3ou4?=
 =?us-ascii?Q?NMdA4a0FIAGxWZ7S5UfT6aNUPgidUfv35ivaxlNLfku1vHZefkNxLZt3nfbS?=
 =?us-ascii?Q?lpxrPYooebzjqOtQJsoRnEMADDwCIwtZvWuEomimPXVOzxuXFTMdjlG1WGNt?=
 =?us-ascii?Q?UqmdmtFtW5pVzYnjmMuZnGveDvsHcZq0+UT5LB2Wdav4zuOJx302s328+mBW?=
 =?us-ascii?Q?5d0jdISFBIPozi++5K2AwZuaeBNoBShVCUAVPEdUkTRglDU9x5Wwsfiyi+E/?=
 =?us-ascii?Q?f/abFJTwQBdD8r8MQlj0FQAarZegE218AvyZoNp/bmEaJ/+aC26dWhc+plwm?=
 =?us-ascii?Q?GR3/8AYKFLnDTw/LlEYhWbnUbTkMDfclJnY1cBsiBi/lFRGdAtclQWyqN/8G?=
 =?us-ascii?Q?HNw7YHQ5iV44QM94s1GG9kgi/sRs7yCPWKM29kWiSJqda4NlDN8vbOf34r0v?=
 =?us-ascii?Q?fegrFDaoG24eZJXS2neDy2EFslh0uLE5Vzbn+J0USshIdhuu8qz0Bs6WgJ0J?=
 =?us-ascii?Q?12b7d+wy4zS0gbrhpWADT7r+ORI9A48maOzeAr14hFm94tsOlGwFY7tWbJxY?=
 =?us-ascii?Q?v2+PVYKio/5k5WG68eC0dg9rTAQZjOMfKRt1c8SbOuxQs2p/3HSEqt5TXHZg?=
 =?us-ascii?Q?KKgCeUfEHwiLH3t8X9SY7LKSBI2QaslJn6Nee7zKG8idthHVYOHNf3GExtNF?=
 =?us-ascii?Q?PkYZKCg1kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c46c40-78a1-4420-7f58-08de57e8cad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 05:57:27.9630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ahEnW2kaaoZcxE1xGB6yaqyo26BBNHLnv12wmX0/vhj5nls/UC46lhn7Ei03fMDdNJNEiBiCj2yOUH/xYqprTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4515
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

> > Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
> > writeback-fb-id subtest
> >
> > > Subject: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
> > > writeback-fb-id subtest
> > >
> > > Remove individual tests for each format for the test writeback-fb-id
> > > and introduce dynamic subtest generation based on the formats
> supported.
> > > Framebuffer creation was now part of the subtest level based on forma=
t.
> > >
> > > v4: squashed the FB creation function with this commit (Suraj)
> > > v5: -Update dynamic subtest documentation (Suraj)
> > >     -Rename input_fb to in_fb
> > >     -Set plane to in_fb and remove unused input_fb as an arg to
> > >      writeback-fb-id function.
> > > v6: -Remove in_fb inside subtest and reuse input_fb from
> > >      fixture (Suraj)
> > >
> > > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > > ---
> > >  tests/kms_writeback.c | 60
> > > ++++++++++++++++++-------------------------
> > >  1 file changed, 25 insertions(+), 35 deletions(-)
> > >
> > > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > > 63917bf4f..0ed86c865 100644
> > > --- a/tests/kms_writeback.c
> > > +++ b/tests/kms_writeback.c
> > > @@ -51,9 +51,6 @@
> > >   * SUBTEST: writeback-check-output
> > >   * Description: Check writeback output with CRC validation
> > >   *
> > > - * SUBTEST: writeback-fb-id-XRGB2101010
> > > - * Description: Validate WRITEBACK_FB_ID with valid and invalid
> > > options
> > > - *
> > >   * SUBTEST: writeback-fb-id
> > >   * Description: Validate WRITEBACK_FB_ID with valid and invalid opti=
ons
> > >   *
> > > @@ -300,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> > > *output, igt_fb_t *valid_fb, ig
> > >  	}
> > >  }
> > >
> > > -static void writeback_fb_id(igt_output_t *output, igt_fb_t
> > > *valid_fb, igt_fb_t
> > > *invalid_fb)
> > > +static void writeback_fb_id(igt_output_t *output, igt_fb_t
> > > +*valid_fb)
> > >  {
> > >
> > >  	int ret;
> > > @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options,
> > > help_str, opt_handler, NULL)
> > >  	}
> > >
> > >  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> > > options");
> > > -	igt_subtest("writeback-fb-id") {
> > > -		igt_fb_t output_fb;
> > > -
> > > -		igt_skip_on(data.dump_check || data.list_modes);
> > > -		igt_skip_on_f(!(data.supported_colors &
> > > XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> > > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > > mode.vdisplay,
> > > -				      DRM_FORMAT_XRGB8888,
> > > -				      DRM_FORMAT_MOD_LINEAR,
> > > -				      &output_fb);
> > > -		igt_require(fb_id > 0);
> > > -
> > > -		writeback_fb_id(output, &input_fb, &output_fb);
> > > -
> > > -		igt_remove_fb(display.drm_fd, &output_fb);
> > > -	}
> > > -
> > > -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid
> > > and invalid options");
> > > -	igt_subtest("writeback-fb-id-XRGB2101010") {
> > > -		igt_fb_t output_fb;
> > > -
> > > -		igt_skip_on(data.dump_check || data.list_modes);
> > > -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> > > "DRM_FORMAT_XRGB2101010 is unsupported\n");
> > > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > > mode.vdisplay,
> > > -				      DRM_FORMAT_XRGB2101010,
> > > -				      DRM_FORMAT_MOD_LINEAR,
> > > -				      &output_fb);
> > > -		igt_require(fb_id > 0);
> > > -
> > > -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> > > -
> > > -		igt_remove_fb(display.drm_fd, &output_fb);
> > > +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> > > +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> > > +			uint32_t test_format =3D fourcc[i];
> > > +			int bpc =3D igt_drm_format_get_bpc(test_format);
> > > +
> > > +			if (is_intel_device(display.drm_fd))
> > > +				if (!strstr(igt_format_str(test_format), "BGR"))
> > > +					continue;
> > > +			igt_dynamic_f("writeback-fb-id-%s",
> > > igt_format_str(test_format)) {
> > > +				igt_fb_t output_fb;
> > > +
> > > +				fb_id =3D igt_create_fb(display.drm_fd,
> > > mode.hdisplay, mode.vdisplay,
> > > +
> > > get_default_fb_format(&display, bpc),
> > > +						      igt_fb_mod_to_tiling(0),
> > > +						      &output_fb);
> > > +
> > > +				igt_skip_on(data.dump_check ||
> > > data.list_modes);
> > > +				igt_skip_on_f(!(data.supported_colors & (1 <<
> > > i)),
> > > +					      "DRM_FORMAT_%s is not
> > > supported\n",
> > > +					      igt_format_str(test_format));
> > > +				writeback_fb_id(output, &output_fb);
> >
> > You have also started using output fb as valid fb  we previously used
> > input_fb as valid fb please be mindful of your Changes and mention
> > these changes and why they are needed.
> >
> > Regards,
> > Suraj Kandpal
>=20
> As of now it will use only two formats BGR/RGB 8 and 10 bits. So, I will
> refactor it to reuse the input FB for 8 and 10 bits accordingly.

Seems fair

Regards,
Suraj Kandpal

> >
> > > +				igt_remove_fb(display.drm_fd, &output_fb);
> > > +			}
> > > +		}
> > >  	}
> > >
> > >  	igt_describe("Check writeback output with CRC validation");
> > > --
> > > 2.43.0

