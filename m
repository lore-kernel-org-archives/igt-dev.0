Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB281D2ED11
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 03:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8968110E070;
	Tue, 20 Jan 2026 03:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkBu6Pjm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BC810E070
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 03:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768879938; x=1800415938;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n0bLQuIpgVU4q45yVrdx7opH03mzuNZHiU0WGlAIyJ0=;
 b=LkBu6Pjm0JHmuRowQKZ3dZDZKILFf4Cz72WwJyoNP2Rm/4b1qXJNfnUd
 8tK/EehlxdEhbsm4vhdozVDS2iCbKig9GhtpaGn53CqigKkxkfgocptUA
 MW8i7hImjeZVebJeju072ioVOMEqjOP0JMViCLfXDfFVMJc3qzBoxoE0/
 qHn7PT1mz+b4bB2IAkRfjxy6Di6nG8B4Lp2/moGxQp2Q5Ix4RWZViAUtj
 zswpxSpGTFD5Eg4JGoNTAMrOy8pwx54ljLF/ckNhq14ophJRtrzh+SrXo
 4TPVwGUIMbhXWJZG9baBJ+8P0Zptasrtz/LaFf4RJ/70J7tfANV81ZP3o w==;
X-CSE-ConnectionGUID: UtZh2fOxTYCg39+nK/Ka4g==
X-CSE-MsgGUID: fvESg/OPSyCODYEa9Z6E+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69094699"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="69094699"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:32:17 -0800
X-CSE-ConnectionGUID: TmrlQDEGTQOwjqBCFJewWQ==
X-CSE-MsgGUID: S5j8mFpkTnmcEwg1VY0xwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="236687190"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:32:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:32:14 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 19:32:14 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:32:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgxBLWz+Zs1UJeEuQgz8HmK6X6t6PIq/r7ifFLYJuGsRWfQ6t8WaA/ELcP5cJkoMrjv/Z3cJHLbyfZGNnhJWI5FJOCjVAg9DAvBLVmiStSXM+z3xqfDLOb/xiMFfhDR31y1MpVJjwA8TI6OLDSudeI17tq6kZr40xdOs++E3SHqNKFdlabyYT78ffFPi8eQoAjdzPa5Ltqk9UH9GNBfueMqTrsaGR2DClL2DU99Xh1P7vjRNk4T9iP1Uwm5PwSsI9NX90GWIgfuKXq+eaByVY2OjM7RQxwDQK6ivkJCyGZMBaEwLdBueDaH6EmtueYLDPYrmO0N76lJDVE5xqPQN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5JnOgbts897qnn6Rdzu+U3Dr5kCjFJbVBMUdozMz9E=;
 b=dQ0SfH3bHKVHWG+Kk/nFcGWaRiUTO0NoSpo8K36kR/3Z0w3BqpzGFyiA6MsSP8XC7BWpGTk20B3eOvilqaE/4w1jZmQQymfEj6qd1sILKi1ZUn3bCfLvDCzSSmfTEe5/y04l72bh0EKJVhUv1875fztQ+qKM5Oo5czwGjjvpp6Ozr8vKymAWfnpEjImdAuihCgQGh67+03OZexGmWyOs84zZCU9guwKH3KuaiDW/w+TfKh5S5QdOhTWRXgkOZRdou36F/aSk/YlVXE/JnCvOPxkK0dCG4IZXnw7IdPbKhFohcjV7QS2JoYqa35wWygIJeZDyTlT68zOSxHIeWUKh+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB8057.namprd11.prod.outlook.com
 (2603:10b6:510:24c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:32:06 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:32:06 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v6 05/10] tools/intel_hdcp: Add helper to get HDCP
 content type
Thread-Topic: [PATCH i-g-t v6 05/10] tools/intel_hdcp: Add helper to get HDCP
 content type
Thread-Index: AQHciUAWo2QcU/IRY0y/vvSP59JGB7VaZ7Vw
Date: Tue, 20 Jan 2026 03:32:06 +0000
Message-ID: <DM3PPF208195D8DA77B845E8121A253516AE389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
 <20260119123142.504623-6-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260119123142.504623-6-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB8057:EE_
x-ms-office365-filtering-correlation-id: dd87f7ac-8e58-4535-e968-08de57d47c78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?utuqozinm3FZvTPGaTKsr5ib7IvO5UhyrFqZyvlc611a8unINrQb10gBxmwy?=
 =?us-ascii?Q?eo6v53q9zXlKbZUuPSmUEjDGlgtrmbkyIqIIHgcji8aU2Ux5eBBtv8FfDEwP?=
 =?us-ascii?Q?gu9kMYTUQDpARTcV7nwEdndXmRHhqr52jgOtaH6SZS3i6DkG5I5Dq+TG/ZM8?=
 =?us-ascii?Q?xjTdag7fy+1ieqCPLfalhMzYsTGeSyl+jYg6HopM7T6owkDjYYD9vesEYFBg?=
 =?us-ascii?Q?qP0ZteWrULLGOXPTFgucQ7WJjiAJsF9ny3Swb8LuyzXYKKcVHdFaCQ6OuHFt?=
 =?us-ascii?Q?zhFAJvyVJoajpDES5AgRJa5iTLXyBETiyYzp9vlyJ35ZLcwHJ/KpOOhdPT3z?=
 =?us-ascii?Q?PQ2vufLSV0d+5mKVeOyXu98lbz3t6paOTMrMGgsrd5H3YwXfPy9PA9wm3IEn?=
 =?us-ascii?Q?YlUlQFq0F6qIZs0362XmUxBui3vVPZU12CCNMIGbLz1PmlBxDAU2MOAnegOQ?=
 =?us-ascii?Q?U4VJuXAweSTMPh5iKS8T+Doel3TYPBIPr/joUy7kPZmfOYO3k8XHQUsksepE?=
 =?us-ascii?Q?S1CUrABwMFd6s8e4UEWIcfs8GFExzneDwPiIDTLvIqnqXrn9PIS0kJpENlzq?=
 =?us-ascii?Q?HGwL9Xo6AlK/qjxCOkjxhOwJ6z4TfMIQN0i1RiuPdJeBztQBgfCwc/FTpwJz?=
 =?us-ascii?Q?IDk7/6Uad9IWLawYNrRMoVkbfAX4lw3hE2YLysrxA46jWoWYIw62/XX2Yhok?=
 =?us-ascii?Q?zdwL15NJzC5SE24ZPBXeeVAJXrk1woZX6Wy5ZUMNajyQ+jHh3mqVNRM/oILF?=
 =?us-ascii?Q?B5SvG0IO1wXRN/N3yd0R3gLQeAw6Vs5qpbA+ZdeKBmYm0RaAD0WH4viOFFOa?=
 =?us-ascii?Q?VL4cvyM8tU6n/s2lHig4WTJm0oXbwnLT5qVEYotDF7E2EORcgYJuGm8ZX9Up?=
 =?us-ascii?Q?vUYXnvj8hfNPkNfX1e3juFWzJObD8vgkr8DFScutl47eTVe3h32gMQvEJlgg?=
 =?us-ascii?Q?pYd+G+zDFkGxybrNJ15NMwFwvNWdz8f/8f26NnMzKqqKcfQoG7Z9Ibd1SjhQ?=
 =?us-ascii?Q?vxYEkzgR8LfTbVRzIEyZdct8JzUNi4VeL9eMTgj/i1laaKHzmElADKbbCoy8?=
 =?us-ascii?Q?g9dFUJHDFqqoXqQrPprvMaNYucqQfxXzvJwUbiWbk3TcdiEUgtxDCGSeGoby?=
 =?us-ascii?Q?i4X7mejqhTspNuTIuvqCu3f4I68WeH3TyxbgFnlEaIr62PmrTf/OH9/ofkgI?=
 =?us-ascii?Q?fIyzypowIymQSzMGjlw5nRQN991edYqFb4YKay2kJfi61eUevuxKh2oXnUqg?=
 =?us-ascii?Q?EuwMfsTvD9TEbWqw+hOOwjO0vS7bkmgRwbAYEAGgOjw8fuwAzQThBqjYfLJk?=
 =?us-ascii?Q?4JIAWgQPpuSbVUfh9BX6sI+REMNcLbMOgorxkO6oXHLQyHprbqzaOoeTmCnb?=
 =?us-ascii?Q?JpSUz1P5eabBgjpPrjUEh4XPjPqA9e07ifE5oPktYvTesXgd0b+r6THfeKZW?=
 =?us-ascii?Q?65LLHnxT8aQqF6IjL0/vnR0l3SYwjmQtkkejxz7x7ksTwATqUBxmMnDGasmw?=
 =?us-ascii?Q?RTb58mZ4Gf6isuODlAeCdwKKG6pL7tZlUrKp4izdhYLdIiQHzaYdjCjrmLkj?=
 =?us-ascii?Q?n95LkrpTGhXZyZG03MTtITDcBPl+XVUj1Y8+rVK8ykLQpSZCGpn5xJ3W5lxh?=
 =?us-ascii?Q?VpsQgMa1S4BurDcVNRAELoc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qNFnPa3nKpcVU0y0ylD/7cfUF/0xfBxET+MOV5aXlPwLWMx9VlPuCvV8mSGc?=
 =?us-ascii?Q?hCtnDMlKATeCwd+zPSLLR2mwcPsLnaTYfX8PhdKojwqg1mZLumvp13gVMlvi?=
 =?us-ascii?Q?Lbx3binQy1st2+ELr4DDqBf/44kjF+N9Xh02JfGvJjT1CLByHIRu0oeKwi+v?=
 =?us-ascii?Q?vokZ7eZdnAg6Q9Dw/U5/yDlhEncyR7xQZG16L6Jz7KqbbZDpEaaL4hY6nKkJ?=
 =?us-ascii?Q?QYaglim3oi+rfImWunraYxGh8yxipfkxdOPYuovQfJp1dmib/+EfgOzc5eBR?=
 =?us-ascii?Q?BnOe8QHT5rLepPn/jRWQpb6aWQJPih6r/YouH8nbVMbUjuabxHa+jcX2/avE?=
 =?us-ascii?Q?R795JBrrEYnHympeFkan1TZn07Ef+XOi/3j+XaFQGLLp17m3mOKhmeIPBiTF?=
 =?us-ascii?Q?gMjvHD8UJHX6xpmbHXVORniCTKVkexbBwKEBnwiR2ywdhRhd5PGPMQQo2sIc?=
 =?us-ascii?Q?hVBtLoUS9px+jr5Ec2Tbh5H5KNpfaDTYDPPiBPwqqX/HaVLzf/A/moSvFmmb?=
 =?us-ascii?Q?bSy+q4P+uOsHvV1XgK5b19Kt4ipOjLPU6BuZbnlPhpbyx5QiJAYZtoub3qni?=
 =?us-ascii?Q?v2VF/ro5kpGQP92Cue9D8mlhIyAnGzw5LQmJrAbut1Uq59441T9cTR42O9qc?=
 =?us-ascii?Q?LMwMYQ/LoijlzoVMwa/UDuGn71RST9PpiQjbA8l1OImaCabOgUq3QEEFVrB7?=
 =?us-ascii?Q?fC/DgZL/YlbAEJibhT/rUtHMGFAYPByZ1MoRa2r+g2L3907RkBLQdfVPUnZq?=
 =?us-ascii?Q?wvH0ljaXR56PS9QHX5M2WuuIhJZyUHb5o5tQCKScXdJNoWs/4ix59AuuIp+u?=
 =?us-ascii?Q?vivbzpYau7rnMlayPx/fxrK+KdTSWKVWH3qRL09SElvqotbNqoE5pNpTgm0T?=
 =?us-ascii?Q?9jQlr+KdoAwDzgLKUrY0k8ejffGw+IHehQ23s2MQge33p2OCvFJRc5TM8x9N?=
 =?us-ascii?Q?0uT3EfsxBoSnsUUW48Vo+WSO+gBlwP4g3B4bBhbdpivNdKEJZSllVHGWY9xz?=
 =?us-ascii?Q?Utfe8lgPNRjT4UfZ/wUFZjjU/1aB8u7iSvNDrRsHIGLXMblDrBmfg7oD8I2w?=
 =?us-ascii?Q?dYg+6/f6Ng6unUn2wTD5cSZtadlNqvDwnR5IgREnAGyu3DsgE3GlBGSCOyw3?=
 =?us-ascii?Q?LPMdDSWtTM0GZr3Hbxu6djI8bcbwgyAlUoffaVjBCTblI2vkFdJG5jrxYhvO?=
 =?us-ascii?Q?MqwYj20z33FGqIaimkK5DDMFO8h8uEj0Q8oYP9g4deAsX17ez0wowTzf0FNB?=
 =?us-ascii?Q?w1MkChDd1ZSlB0v0CCd8ieBaK6FpRReU6P8jLWrgBkC/rODcPHz1dti53gMy?=
 =?us-ascii?Q?BHiGCnV793URh9R1UF40sDN6ox1cqHV4DI+6TLnDEv/2hIVpvrD1cr7yGhE5?=
 =?us-ascii?Q?ZCRX8NTOShtnGQ/u0NljfGgSEWgaMOaAxiBW09LzhfNMnovZn/gHmTQ1l8ri?=
 =?us-ascii?Q?FMOV8Q5P3TyOV4gmyLQPSzUg1LQ8YneqhxeXD8pywZ456MR2FJQCK2DaRgef?=
 =?us-ascii?Q?/ubaE9XKi6gJsIAkTp7beOLC9ALdz2dMeN5If3iua6CO8ehxT/e1d8dfarP4?=
 =?us-ascii?Q?t21frUaZ3ncSD0JMXLlzpD3K+8sGL5k1uNaae7SlqJrNhykbpF9ZBzIRDL00?=
 =?us-ascii?Q?Kd4YnhnHv9aUS8a4Nyup+MsGaYOL2sHMohrFZTkQAIFRg3BEgkop07sIBvXQ?=
 =?us-ascii?Q?9ctusHb0clHE0ph4z0e7uyGnSwAmOfbq1FTjLy/Zw7vqrdqiU6ej0G6AQNdC?=
 =?us-ascii?Q?pC+JQ8Kf4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd87f7ac-8e58-4535-e968-08de57d47c78
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 03:32:06.6051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzgX3+6kMZcKiplUvzcKT7Z30DEHTsrE0eDVz5jH/tFlmCeV2s0ZpWwdap4ARzYroVC80q4ee7NSYMjtW+0V0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8057
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Monday, January 19, 2026 6:02 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>=
;
> Konieczny, Kamil <kamil.konieczny@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v6 05/10] tools/intel_hdcp: Add helper to get HDCP
> content type
>=20
> Add get_hdcp_content_type() to read current content type property This
> displays Type 0 or Type 1 or N/A status for connector.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> fcb746b6e..dbedc60c8 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -79,6 +79,44 @@ static void set_hdcp_prop(data_t *data, int property,
> int type, int connector_id
>  	drmModeFreeConnector(drm_connector);
>  }
>=20
> +static const char *get_hdcp_content_type(data_t *data, uint32_t
> +connector_id) {
> +	drmModeConnector *drm_connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id);
> +	igt_output_t *output;
> +	uint64_t status, content_type;
> +
> +	if (!drm_connector)
> +		return "N/A";
> +
> +	output =3D igt_output_from_connector(&data->display, drm_connector);
> +	if (!output) {
> +		drmModeFreeConnector(drm_connector);
> +		return "Unknown";
> +	}
> +
> +	/* Only show content type for connected connectors */
> +	if (drm_connector->connection !=3D DRM_MODE_CONNECTED ||
> drm_connector->encoder_id =3D=3D 0) {
> +		drmModeFreeConnector(drm_connector);
> +		return "N/A";
> +	}
> +
> +	drmModeFreeConnector(drm_connector);
> +

Disregard my previous comment from the next patch idt that would be the bes=
t direction=20
One thing we can do is all the above code can go into its own function get_=
hdcp_output().

What do you think?

Regards,
Suraj Kandpal

> +	status =3D igt_output_get_prop(output,
> IGT_CONNECTOR_CONTENT_PROTECTION);
> +	if (status !=3D CP_ENABLED)
> +		return "N/A";
> +
> +	content_type =3D igt_output_get_prop(output,
> IGT_CONNECTOR_HDCP_CONTENT_TYPE);
> +	switch (content_type) {
> +	case 0:
> +		return "Type 0";
> +	case 1:
> +		return "Type 1";
> +	default:
> +		return "Unknown";
> +	}
> +}
> +
>  static const char *get_hdcp_status(data_t *data, uint32_t connector_id) =
 {
>  	drmModeConnector *drm_connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id);
> --
> 2.34.1

