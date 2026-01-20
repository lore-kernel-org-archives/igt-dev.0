Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7564AD2ED11
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 03:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE4110E070;
	Tue, 20 Jan 2026 03:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VT1Z7saO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C3D10E070
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 03:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768880969; x=1800416969;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xt+HOHEqGKx+I2xg6uMkgAMIp3iSbXmACMGwiaivwRQ=;
 b=VT1Z7saOMET2JsaVz92pcKcxiMUcwDq10fLxWZPWDalUXGgThnd0m6qu
 t0QUya5du+itK19sDJmw/Hu2I+5aKkbNDNuRk4BjPeOy4Z0vKGqSXnq9y
 1+lMNHENwJ8TVq99/3ew4XxcINNp68lShoIx1JrnObFC3fC7qDBhBpnZg
 S6pcELIgNqNjwZbFJqbJEwMtLL7bQLK5QvB+mDjfHzQdSimFfEmvBqPAe
 XXkpCZMnjT1y1d70iHjyXFgPTzX6DYnhqVT77mNgbn1n1E4WOnzcR0/wA
 2Btxl93BgiN+T2XDRWAQbgRiGbKlJvwVx2Z/tzxLzF8qH5DuBrPTtXkRg g==;
X-CSE-ConnectionGUID: +oO6D5ATRJG4njGApmMqaA==
X-CSE-MsgGUID: CJeeKeZbT0+DQBmsaggzng==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69284455"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="69284455"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:49:28 -0800
X-CSE-ConnectionGUID: ij1mjtf0QPeVL4ihDjAO0w==
X-CSE-MsgGUID: f5oidqJcSHCaK0j6CdI48Q==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:49:28 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:49:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 19:49:27 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:49:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OweUVSaKD6XQEj+qw0c8L+4VxFYiayDvjpbJQl1LH9TLY1nYuTwu2Cqm6wbYG6y1mzWIp8qYSbIVXf4qrM/BgGdMTUJMRXMiUW0+RogVWJ6OOU2FP6OStHZ2DLNFL7dpVBqNxzRBO5OBxohlrrkaJV6JCOAkM2bHCwQ7BaKddOFlgBPdqh2YHKaRGp3bycSuCeIrkJ8neBKnlZGFzo2UQMSkqiwAFYoLqRmscAQAbdGpgH8sNJib9IrlsxLidfxTNt84G1WbiOK5wCQwOE9cj+/WEVxrDnyB6a71wWVxq9oTkvouCy3Z/gXrAKWv1Zjflmkl4k/Ewd/EtVSwq3SVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPhMcMBvqOM6XGzWKgSIbLbk8gAvTHWXJ+D+2Gf8fEg=;
 b=W3srB0pf5x7arLSyrgltNVtNFnMEFn/PW2rTyLF18/wGjOj74waFHaI2pHxIR88WHfIKjPMVFOkgUbVce0OU0PrgP93jaQ3XE1UhskUo9Sr/XHoQHp59bryi1nSPWs8iqxkXnbqeFmA6B/s58ZNBsNqwIzXjnYvPXZEkAnI+rV+8YlRkNJAKmnZOgdvOgVufubF1IXPH0vDHRZouoDuFVH2dgey4NHUGu3czCKuIXczjTT9zKHQuT1fnzc++6ynGS5EoH5bfeNasumUZxCPUGiQM57jUQrOEZiX5A8Pq5EyozVsagbFhfYI0GUAV9fLauZwrXF7CvvQew8RVwqFJyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB6503.namprd11.prod.outlook.com
 (2603:10b6:8:8c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 03:49:25 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:49:25 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v6 07/10] tools/intel_hdcp: Interactive keypress
 thread for menu
Thread-Topic: [PATCH i-g-t v6 07/10] tools/intel_hdcp: Interactive keypress
 thread for menu
Thread-Index: AQHciUAfSGYM7hISYEC+zFYxGryukLVaa/tQ
Date: Tue, 20 Jan 2026 03:49:25 +0000
Message-ID: <DM3PPF208195D8D162C4D2DEB3BA817FD41E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
 <20260119123142.504623-8-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260119123142.504623-8-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB6503:EE_
x-ms-office365-filtering-correlation-id: 6083ed2c-bd55-4c20-2bfe-08de57d6e7a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?2Vv2qtsL9WgV/7qMRyWlPCWo99bKboWqhdaxMTpu8LHpzHL6LeRm/BPuxuqW?=
 =?us-ascii?Q?bNW1dJzNz3ets0lEHbc2fE8c4zuo+1lZ9+286/BYloe023P6yUKUv26Fkm53?=
 =?us-ascii?Q?dIJvuSbcJZFdJ1YU4ZIyap+Gr+eAMSXwPsz7YgFNK+p/RjotoyMizzedhGrl?=
 =?us-ascii?Q?BbzsCPONVJcS6KYQMjNyBFF6RM47F7eikqnL+ZDxvMERXffbFBOx8pfn+Tvu?=
 =?us-ascii?Q?IRf5qbtupIPFALK+UmNIUPsuXbILIwCk/JQhfENCe+DF/YDkSrOzzvUuspOY?=
 =?us-ascii?Q?q++EVtadXngnzLZv0pZbtQsYne2OFx7JmOfq8ThYBDHZ9Xcahxov8mV43QwO?=
 =?us-ascii?Q?4rPG+HZgM4LQSnDI1aE10h8yyWzC+ygXHSmAwATIlmIQtXUvel4Xxyw9Wv0U?=
 =?us-ascii?Q?eS8sqORsMA//UVNdYz4BgeDTKESzWitfK3qlH+XujnyalUUQ42pTkxVdBuAa?=
 =?us-ascii?Q?PBvR/04uNmoszIT/ehJVGAOl3A3kRoIbOgqKk/xLtp75+afqsQfjyw8/a/es?=
 =?us-ascii?Q?MdDjNQFACNHyfPIJrDUcL/nOp9XSBd+tlbU5RHM4wZKn3hOSitds3AmJn+V1?=
 =?us-ascii?Q?3eWqIrwkyJISe1JEQE3D/+1+KuaXkzYnKnvjVAdbYmmvqwEuXSHKnrI8xsIP?=
 =?us-ascii?Q?WjIR0OImnn0nztRxDQjznkbH6knWyd/w0smcFfJ7qhtCdl6OWNjn6uFlM0Gh?=
 =?us-ascii?Q?zNlArh/UlhrnUTEH0UWVdadvbAc05/sdHbCwo4WBIw5L8gbds6J4TZXqi/qt?=
 =?us-ascii?Q?1J8mMpWjjBz252vod7fptO4kHYBELSQya71Qqf3iwb48+EVC7dbBntAfduQk?=
 =?us-ascii?Q?vXmMAkxyHPrcVbKmNZ7SVz5qkEf13e85xsJE965cthVixl7cFPG8qf/zzndm?=
 =?us-ascii?Q?yZJi4r8tYt3/n87iM7pwiWF9XUoFNaN0q29vtg46V+FcF7I5bSEPWpLroeZD?=
 =?us-ascii?Q?MAhPD2bwjo96RFbj+h2/I8bCfls8dlmIZATx33Ls2C1G8a5Fl4c6kZ+0NPGx?=
 =?us-ascii?Q?6RDSETJ/MiJaJ+BipU71hz1SPweHWKn4+8R5d475CdURw0NYj6xxCpEgg9tN?=
 =?us-ascii?Q?a9dNbIb6+1QqiaIJUsdGwc+t8Noz4h673MRmiByRrMJsQFZpbMjFVjGUNeh2?=
 =?us-ascii?Q?wnj5q/4NpND/cObsTF5I+51C6g/34bCLP8CusxxNi4TIsKdZEoSYm6/cowu0?=
 =?us-ascii?Q?+lRpmZtMp+PHnoD4QBXVhCSJj7c5HeuvLXdY4jg/wBOtOgnxaR570ILPJ2o1?=
 =?us-ascii?Q?qP8xwhEqRGzT18WfsJ2hFrZvrgr2OD8MRrHopedTwu8Bjaa2WCEAtAk24ZV9?=
 =?us-ascii?Q?eTevKrozfhURWkpk9EJLn3n0W8CLtDq1ueHdmYDv6cAWl/E+kYV5nV/Y0Gdi?=
 =?us-ascii?Q?oQJYM95lmP2PXMDOCUP35FVQutLf33w223LjU8bCiH5iPo4/t7hayklS3+oe?=
 =?us-ascii?Q?fbplUBiIoJZz91natEPExytTfL110fDJzBMWuMhReNhTxfqLYyCjmNw2Khwh?=
 =?us-ascii?Q?anuNzwuopuePcBiIDMaZyRck6X7UXv8QKZTpa0AuTU2cnhlRcQlk1eE/ClVT?=
 =?us-ascii?Q?3TVmcNAKWyp7lNEh5W3RC4mgG4ZrSxnb0yH6rW/y03i+z/M108EkVtaNfmU+?=
 =?us-ascii?Q?3ejTkPlRCmyLyGy2F3WXvFM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?98weEa8u2iD2GiH37wRsNbteKSGLlpYB16ly5f0yv2aYPD6XRC29Mhx+LW7z?=
 =?us-ascii?Q?0/civxPf6B9q7NG3ZJ3uXum9/vKDMZQv66neEXO9/KUn5bGot9q8fANIzIse?=
 =?us-ascii?Q?6rDv1QuAgN5G1kNWFU8IY5+CmxQEygQtgPy3gtdkAkKiiHFcK1sEcmp6OyUu?=
 =?us-ascii?Q?BuD86YsuiSeHYRraIj8wUmprzlV+gU7Pi9dV8ph8JRXRT+x75MMGo3VZOoPQ?=
 =?us-ascii?Q?En84pguDD7eW4Vvvntxd+uvZHOTVz24AACvRGLBnTJ3786Jdgj9GuyaMQ0z1?=
 =?us-ascii?Q?ewQ4/P2sgEDprDs4oPV8UhbaZ/pnPPfXvHqZ2O++SGFJi569qf8eVGkGqihD?=
 =?us-ascii?Q?x4FNrTc/w7Q6AtPb7DS7E/21fC+XUoT7JZzqyPOwberVvLr08wUnJ63Yfc0y?=
 =?us-ascii?Q?jKXYvpVZohFRPSjqSu3P8UOQ6Rmpkp2k1GtBx5oi1THwK0lo9D/m0ZPOfz7s?=
 =?us-ascii?Q?IZeVy+rVaP43glJUUnNbrmN6FiQitWTKdwzuUUVp8mq6IkXbYVcRv4GhYPAn?=
 =?us-ascii?Q?F72TYakHQbICBMsdHhQu1pIH5PYjxW5nWo8+Y1TR8Exl2jHR5QcouTl4rDcv?=
 =?us-ascii?Q?/9BsciQ4P3NH+CYsdByoOD1hWDmossdQyoRgKrapxWbEoPGn2BOGmwOSRWTZ?=
 =?us-ascii?Q?/SY607DYtdPzVPBxL7MHRtWXyY5JPwjwp/VJPKBk9QdRDF9QX1eHNJ0xXD4d?=
 =?us-ascii?Q?D420XbItz9XGhZPwp+nhtw2L7Hzhwk7n5/zysq1GRSCePECKnasYXuTXuUuS?=
 =?us-ascii?Q?2EGpCBqwfE/aWMWmlqive1sUAkgbCwjN+hfcdjrQFf3ZVI7pUiMcIYr9bNhL?=
 =?us-ascii?Q?LGvS+A7ZiSHva1+luRk6Gtpf4XNPcQjKOsSjaawCiUwh5EbiUaXtugmeqSVj?=
 =?us-ascii?Q?BJH/LuAKlZIbt6tbV/ZRcPiDIT+KAeoSeOuaswq1n9JqlyG7458IdymtpQT+?=
 =?us-ascii?Q?zYshTjCu5OkF94IFHhDf6P99HlfPZOR/qNRE6hDOVEZTeuYHgjfp8O/hlOFz?=
 =?us-ascii?Q?wzhdOw3IoPXWiOEKsMFa1z0jZkXlGpvPuUuChA2XWNgVIHQhXJqvvhV3bg2a?=
 =?us-ascii?Q?cHLL64yldcOnlYpuqVKI7mOUCo1iVcsBzlXxD0RIdMrA0tX4QXcLmdZXblWD?=
 =?us-ascii?Q?mGqaR9kwIqfB98y1xbRyAdZFV8JZ5RHCuEGwR9jTDEgWdrUBmiQAmMf/WrpT?=
 =?us-ascii?Q?CXIBT/6VLczjWYhNjSNPIrGO0ZhU8jLU+E9hAO3PLUMxX4UCrGo9N8i1rtXR?=
 =?us-ascii?Q?PMUC60D/cytY0+zxpLnq+KyW5gcMP7nWUXoKEVRMHU/js9v4xqSK3UM6UbCl?=
 =?us-ascii?Q?UX+mpeZyAkmuqvXHKEXlddgbCYp3W4hNTkfzKlGrFMAYmhjZtxeBcAt3RtTQ?=
 =?us-ascii?Q?0j/sWVPVzqzOd6JJkkVTZVFB8gFL4azd1VopsYkkFtV4Lta6s7xM25fFM/OL?=
 =?us-ascii?Q?2DEdX4e9IteUi6LNHbPZ0o9aMLSorY2nvf4LFUN5CfF9T2vAHgPiUUCJbmfR?=
 =?us-ascii?Q?jydtOKS7GYSzDAzh9B6xl63ST1JgGzl9uWCkNCQ5lVcSwYOt67rwg86/L3TW?=
 =?us-ascii?Q?sY1ar1TIguzNqp0WIOUSOmSCQBu9n8j7wALKLTzAzKvF3Rxyo0qoDxCA0Mf1?=
 =?us-ascii?Q?WacElKAeUV6GTc6JPz3lzn92+uYNksvjvYoqAfdEOZcyzQmExb6g5t3eMsgA?=
 =?us-ascii?Q?NeSu3t9kfW6p7IagmIwh2/HvUTXjKEtF20MnSuO8h0vLEV/22BeLl2VOOvm4?=
 =?us-ascii?Q?Py9daIkG2g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6083ed2c-bd55-4c20-2bfe-08de57d6e7a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 03:49:25.3347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSNt02C8+S62ebn6aXBPgKZXHpXw1WphpY/skK64tZQ4qRjBe/zpYIpOpD24C56hH4Jsuu41JZUJ88EzgDaYtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6503
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

> Subject: [PATCH i-g-t v6 07/10] tools/intel_hdcp: Interactive keypress th=
read
> for menu
>=20
> Handle user input asynchronously with keypress_thread ,enable interactive
> HDCP via user options.
> Update print_menu to display available actions.
>=20
> v2: Handle invalid user input like choosing an invalid connector or non H=
DCP
> supported output
>=20
> v3: Use menu lines to print, Avoid reverifying the user input connector i=
d to be
> valid or not for HDCP. Instead display only HDCP supported connectors to =
the
> user and verify the option provided by user (Suraj)

Nit :
Try defining it as points
V3 :
-
-

>=20
> Introduce validate_input(), get_valid_hdcp_connectors(), select_connector=
()
> and handle_connector_selection() to parse user input.
>=20

Move this above the versioning info

> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 205
> +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 199 insertions(+), 6 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> b96fc570f..bc0485caa 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -5,6 +5,7 @@
>=20
>  #include <fcntl.h>
>  #include <stdio.h>
> +#include <ctype.h>
>=20
>  #include "igt.h"
>=20
> @@ -29,8 +30,23 @@ typedef struct data {
>  	igt_output_t *output;
>  	enum pipe pipe;
>  	enum hdcp_type hdcp_type;
> +	int user_cmd;
> +	bool running;
> +	pthread_mutex_t lock;
> +	pthread_t video_tid;
> +	int selected_connector;
>  } data_t;
>=20
> +static const char * const menu_lines[] =3D {
> +	"=3D=3D=3D HDCP Tool =3D=3D=3D",
> +	"1. Get HDCP Information",
> +	"2. Enable HDCP1.4",
> +	"3. Enable HDCP2.2 Type 0",
> +	"4. Enable HDCP2.2 Type 1",
> +	"5. Disable HDCP",
> +	"q. Quit"
> +};
> +
>  static void set_hdcp_prop(data_t *data, int property, int type, int
> connector_id)  {
>  	drmModeConnector *drm_connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id); @@ -223,12
> +239,190 @@ static void get_hdcp_info(data_t *data)
>  	drmModeFreeResources(res);
>  }
>=20
> -static void print_usage(void)
> +static void print_menu(void)
> +{
> +	printf("\n");
> +	for (size_t i =3D 0; i < ARRAY_SIZE(menu_lines); i++)
> +		printf("%s\n", menu_lines[i]);
> +	printf("\n");
> +}
> +
> +static bool validate_input(const char *input, char *choice) {
> +	const char *p =3D input;
> +	const char *rest;
> +
> +	/* Trim leading whitespace */
> +	while (*p && isspace((unsigned char)*p))
> +		p++;
> +
> +	/* Empty input */
> +	if (*p =3D=3D '\0')
> +		return false;
> +
> +	*choice =3D *p;
> +	rest =3D p + 1;
> +
> +	/* Ensure rest is only whitespace/newline */
> +	while (*rest) {
> +		if (!isspace((unsigned char)*rest) && *rest !=3D '\0') {
> +			fprintf(stderr, "Invalid input format\n");
> +			return false;
> +		}
> +		rest++;
> +	}
> +
> +	return true;
> +}
> +
> +static int get_valid_hdcp_connectors(data_t *data, int
> +*valid_connectors) {
> +	drmModeRes *res;
> +	int valid_count =3D 0;
> +
> +	res =3D drmModeGetResources(data->fd);
> +	if (!res)
> +		return 0;
> +
> +	for (int i =3D 0; i < res->count_connectors; i++) {
> +		drmModeConnector *connector;
> +		char *output_name;
> +		const char *hdcp_support;
> +
> +		connector =3D drmModeGetConnectorCurrent(data->fd, res-
> >connectors[i]);
> +		if (!connector)
> +			continue;
> +
> +		if (connector->connection =3D=3D DRM_MODE_CONNECTED &&
> +		    connector->encoder_id !=3D 0) {
> +			asprintf(&output_name, "%s-%d",
> +				 kmstest_connector_type_str(connector-
> >connector_type),
> +				 connector->connector_type_id);
> +			hdcp_support =3D get_hdcp_version(data->fd,
> output_name);
> +			free(output_name);
> +
> +			if (hdcp_support && strcmp(hdcp_support, "No HDCP
> support") !=3D 0)
> +				valid_connectors[valid_count++] =3D connector-
> >connector_id;
> +		}
> +		drmModeFreeConnector(connector);
> +	}
> +	drmModeFreeResources(res);
> +
> +	return valid_count;
> +}
> +
> +static bool select_connector(data_t *data, int *valid_connectors, int
> +valid_count) {
> +	char input[256];
> +	int cid;
> +	const char *q;
> +
> +	printf("\nValid HDCP-capable connector IDs: ");
> +	for (int i =3D 0; i < valid_count; i++) {
> +		printf("%d", valid_connectors[i]);
> +		if (i < valid_count - 1)
> +			printf(", ");
> +	}
> +	printf("\n");
> +
> +	while (data->running) {
> +		printf("Enter connector id (blank to cancel): ");
> +		fflush(stdout);
> +
> +		if (!fgets(input, sizeof(input), stdin)) {
> +			fprintf(stderr, "No input; aborting action\n");
> +			return false;
> +		}
> +
> +		/* Check for blank line (cancel) */
> +		q =3D input;
> +		while (*q && isspace((unsigned char)*q))
> +			q++;
> +
> +		if (*q =3D=3D '\0' || *q =3D=3D '\n') {
> +			fprintf(stderr, "Cancelled connector selection\n");
> +			return false;
> +		}
> +
> +		if (sscanf(input, "%d", &cid) !=3D 1) {
> +			fprintf(stderr, "Invalid number; try again\n");
> +			continue;
> +		}
> +
> +		/* Verify connector is in valid list */
> +		for (int i =3D 0; i < valid_count; i++) {
> +			if (valid_connectors[i] =3D=3D cid) {
> +				data->selected_connector =3D cid;
> +				printf("Using connector: %d\n", data-
> >selected_connector);
> +				return true;
> +			}
> +		}
> +
> +		fprintf(stderr, "Connector %d is not a valid HDCP-capable
> connector\n", cid);
> +	}
> +
> +	return false;
> +}
> +
> +static bool handle_connector_selection(data_t *data, int cmd) {
> +	int valid_connectors[32];
> +	int valid_count;
> +
> +	/* Commands 2-5 need connector selection if not already set */
> +	if (cmd < 2 || cmd > 5 || data->selected_connector !=3D -1)
> +		return true;
> +
> +	valid_count =3D get_valid_hdcp_connectors(data, valid_connectors);
> +
> +	if (valid_count =3D=3D 0) {
> +		fprintf(stderr, "No HDCP-capable connectors available\n");
> +		return false;
> +	}
> +
> +	return select_connector(data, valid_connectors, valid_count); }
> +
> +static void *keypress_thread(void *arg)
>  {
> -	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
> -	fprintf(stderr, "Options:\n");
> -	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
> -	fprintf(stderr, "-h,	--help		Display this help
> message\n");
> +	data_t *data =3D (data_t *)arg;
> +	char input[256], choice;
> +
> +	print_menu();
> +
> +	while (data->running) {
> +		printf("Enter input 1-5 or q: ");
> +		fflush(stdout);
> +
> +		if (!fgets(input, sizeof(input), stdin)) {
> +			printf("\nExiting...\n");
> +			break;
> +		}
> +
> +		if (!validate_input(input, &choice))
> +			continue;
> +
> +		pthread_mutex_lock(&data->lock);
> +
> +		if (choice =3D=3D 'q' || choice =3D=3D 'Q') {
> +			data->running =3D false;
> +			pthread_mutex_unlock(&data->lock);
> +			continue;
> +		}
> +
> +		if (choice >=3D '1' && choice <=3D '5') {
> +			data->user_cmd =3D choice - '0';
> +
> +			if (!handle_connector_selection(data, data-
> >user_cmd))
> +				data->user_cmd =3D 0;
> +		} else {
> +			fprintf(stderr, "Invalid choice: %c\n", choice);
> +		}
> +
> +		pthread_mutex_unlock(&data->lock);
> +	}
> +
> +	return NULL;
>  }
>=20
>  static void test_init(data_t *data)
> @@ -290,7 +484,6 @@ int main(int argc, char **argv)
>  			break;
>  		case 'h':
>  		default:
> -			print_usage();

So here is my problem with this patch you add all these functions in this p=
atch which you do not use here which is understandable since you do not hav=
e all the
Gears to get it working but the you delete print_usage() here which means a=
t this point of the patch something that was working breaks

I would like to keep print usage here as is and delete this in the 9th patc=
h where you add all the other necessary fitting to get the new upgraded too=
l working

Regards,
Suraj Kandpal

>  			break;
>  		}
>  	}
> --
> 2.34.1

