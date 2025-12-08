Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E59D3B7E2
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 19:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4FC10E3ED;
	Mon,  8 Dec 2025 19:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoXjjC4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B23810E123
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 19:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765221943; x=1796757943;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/nXRJ9UXAsjDAEXzYbwlFvQla++V+RPzbBVWr20ib4U=;
 b=PoXjjC4Uqb+RF68DRWzmAUsK6Bknmi7SkCG6BYDoLfvEkr7TIsQFSz4x
 XBRfsMtoPD9rj4SVRAg7XSnuhkBkz+D86uiqB8YMVNM0OP3MOtXJDB42g
 PX/aY/YHjuVwM4sj+7m/N0H8zDdyZbyTbotPTINdT4Q7yID6Nb5twZHLi
 sN1Tv7HbjeZjQCYxfbUI5Mpc4QftMCUPIykOJvr+bJf7FJUPj8X7L35hb
 17jDeMDdHoFUl4ktir11Erjk+PuyFRL6xPzNItLwp35wlqN9grqDxrQHq
 UNLHBUn4E+5qQssXIba/Qj+NtVQYHBSq2cFBGBZE3eLTmlpXTJGWce5Bj A==;
X-CSE-ConnectionGUID: A94e+6WAStSmcsiyCYE9rw==
X-CSE-MsgGUID: TCgL8+OESc6THziPPPqMJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="84578521"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="84578521"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 11:25:43 -0800
X-CSE-ConnectionGUID: gBjzwEfeRLGKV9HhDVvXFA==
X-CSE-MsgGUID: aECvYnqNRimTM01+zRUwHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="196293500"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 11:25:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 11:25:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 11:25:41 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 11:25:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugEoHI6eDzR9R50LFm63acDjCkMgg7z4xRe64n38V74I0867y6UnJnomOYGdgF4DRHis/TuhR/a1E3J4Pfqs8hTTfhtpi+W26qoPntyrNFPkaUIdB3f4PnKeSig3c1qfxuUQyxkT08g6eoxqWLJ7vvanWJkQ0D/wAmycEhQQtLRCIRaCUSYnY6SBGg2fgGr4tvYZDvB/igOJ8AuibfJ5EIA+D0npkAU28RlElEhfp2b2fpjrPW2klI/GTpU6XBTZADeXslxbeoknNZ2nt/iWnnXv07Gb40p2BB8GJ8dZIX+A7NtcWV3vk4sFAPsZNaXxNHB1kvTCgbG1jSH4waTL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDRPLTKsAgFeb2U343J8/prKLl9AYBmPw+z6jzxEcNY=;
 b=RzuLOBReTu3tQmWJ6KwBjFEIoUkPqdHsrTgXwl80MBJ90NzXI3D9yBwVBqPGZG1yDiZmK/ZHsVOltG/3rcnrnfn2StBSlmbKIfd1PyvoKDoJCtUF10xRhEBt8H8bA6PiGfUof2Py5HDFxMwHCWtEqAXr7T8NsrLRBo2NXVEGw7+6VN/7NxHI+G88ytRfiTIbCTU9MIftRh5aAPkhlTpdiNHL7m8zBwQ1kBRfvlLux9V9Au/6yip6Dow6dtSsIqjZPI66QtOTdckREZ6xKROJccAOZi8rr3nxpiU4tB6ShfEaMvpmN6RMqdEwdzC66XZ1xpLPX+6Oxro4cYurCveMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH3PPFA3FE8A23F.namprd11.prod.outlook.com (2603:10b6:518:1::d3f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 19:25:39 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 19:25:39 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Zuo, Alex" <alex.zuo@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from debugfs
Thread-Topic: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from debugfs
Thread-Index: AQHcZk12DP1gj+Iwm0q7q7D9jj3tG7UU9UaAgAMuA7A=
Date: Mon, 8 Dec 2025 19:25:38 +0000
Message-ID: <SA3PR11MB804606DD3B166244E56646D686A2A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251113070502.2148615-1-x.wang@intel.com>
 <20251206011241.67825-1-x.wang@intel.com>
 <DM4PR11MB5456EEADACFB56E39B95FB96EAA4A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5456EEADACFB56E39B95FB96EAA4A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|PH3PPFA3FE8A23F:EE_
x-ms-office365-filtering-correlation-id: a2ee1c53-9533-4d9b-7ff1-08de368f91eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|42112799006|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xVLfeu+CUpY+DWPEQAg+tcngvXY11CB6kdxc5aisQjTLJ/yOUYQ64E1ZpYil?=
 =?us-ascii?Q?fTkKlxdhnilrTsdzjC2kV+3AD2dEi/MpjGIK6XidRTRmpVXWRG/L9atHUOUO?=
 =?us-ascii?Q?ZhgS/ouHZ3F5w1Ex2TF7o3Y1PGedUrt+Lq2xMKBy+6tHHbOQo+CLO8FSEDKt?=
 =?us-ascii?Q?NxeX2ep85V4Ez1yU/VIRdEvud825nU4Ku3+4bVSq9A34QVmtUiIPwO7cgLoL?=
 =?us-ascii?Q?rZT5k2OIWZZL5uIpo/BeGYNAJQeGzeEeY9ORJGsMKlZZSown+4Zu4xlfn1QI?=
 =?us-ascii?Q?DhfiYRmmNZFhyru2Kgk+dlNIN1dfPAgb6lmxSbVCH972+pvQM5vcOcaVgz2P?=
 =?us-ascii?Q?CrUrEbUj6xBOWBnOXX0mxm529QkV3wJxcwzs6xGrD9HjdvhzqeLfKXYkz5e9?=
 =?us-ascii?Q?cpe1lVd6O3IOj1Td/iMm4y49eq4SSH7VpBclOVPPt+xFcMpa6Atffy8vpq4a?=
 =?us-ascii?Q?yArL16SwfqpdO+MUB31zd81ir0N07lnzFtA2jDVo+jSv0a32w9YSxAF1rXc3?=
 =?us-ascii?Q?+5lB+8JD4RYMh9M/wfMcRy+tkjU8I4cjfI7fujxUSweNo47CKk+7Zivg3bA6?=
 =?us-ascii?Q?DEfp0RJLybQ0PtzLCJ2I/gg9Dp9Xf809kHX846MhiGd3889Lo1xccr54hMmQ?=
 =?us-ascii?Q?0DEkQWGZJlOMEJF6wvMvPQcVKp1WEa/xLpdMMvb/6eocUCZkzS1tHM8D1wgz?=
 =?us-ascii?Q?VecqbQucIVrGW85f2+zWn8buMmMyKYzKtGxpRVYcdimgBxSc9MqlidjsJWn6?=
 =?us-ascii?Q?V119rPsyb6FEP80G/YQsibNaKRqwMQ47doXLIkIK6qNDIUxNj4LpyookZEFm?=
 =?us-ascii?Q?nOFg6qiaya+on3pPCmWDilw2JS4e+7mSQ9C2XwcRS1ScMwbWJK+13bAYKN0e?=
 =?us-ascii?Q?b+D3yBN3zwkBkoW5Q2aZq2J6quhADc6XsZIuyk9yjEcEb33NKoXXAYu+yxRY?=
 =?us-ascii?Q?7qtZqje3hZeDlJn/D7zdoDoXTBS4wEkyZaKnLblZWLOebjWaIy+JAdj+Y3hl?=
 =?us-ascii?Q?v2NFMjOTNY7iTu51xWvu+bYXKwQ8Dvmt/54zcw8nDyTvsuX07iHMQg8w9iFh?=
 =?us-ascii?Q?qgmxw+0cf41vg8MOn2JrCndc4yDB2JjMPhXaVzz3En0y0JprwFVeaJJVq8Jz?=
 =?us-ascii?Q?/DzGZnUKv/4y7p75ImKG3UeW5QrnrwF3TXMo3b6atIFj0SMsd4lk5R2FIEyt?=
 =?us-ascii?Q?Ucn4/ZSDTecUgQwgxDXtEmtqOqoxFzjKJKgUcblF8+ueciPGWpMvI2+lPlPd?=
 =?us-ascii?Q?tzfgN3J3zJxi8EeY2cMqy7QFw0+71xyHCUfp9AVM3/eoHB8DOxYssdtiSGv+?=
 =?us-ascii?Q?jrvWbWGZmZKJApIYI98CHZOllG5KPD+AVJDn8pe1hWVFNcyauWClW2RialKU?=
 =?us-ascii?Q?eaQ329DSKvYaLQSXAHnzL4HY+kX29xQYJtB+gOL4TfABcY5Was2COLwaVgxk?=
 =?us-ascii?Q?OuCNQPYqo7vWfjpbDI0GV9NBSA32sYP/Df6IuYHgT9pIXRxtr2FS9jLdnYfk?=
 =?us-ascii?Q?x3PX/kvYxQwOY6HOnccuK7lMUtUwzmIZaZug?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S2YMvkAP7imDt19kVNu+nTEe4+CwG28W8A/dYKBGwCwyDpx4Iwpxs4v51m/n?=
 =?us-ascii?Q?96BoZwlQ3I6Ayacz9RZtrAEYyk4uYoiARPFeF/xaMxRRm1JUPpk1BYRBkwIs?=
 =?us-ascii?Q?u81MnAIO5u7NMoFXAjFQ3clf5waFY0DoNxvJ7+qdrVBc8PVveNgNxwj19uLZ?=
 =?us-ascii?Q?kE5BCUk03uvXztVHeCAYlgC8NgM285rmK6zzPqPRDnCueYVFNhacSJwBhDUS?=
 =?us-ascii?Q?NYJR3rkNig5Uc7XjyetUh7lqc/EQXEBG2l57imPSx80fw14H0EPIWO2tcl9C?=
 =?us-ascii?Q?eOTcRk8cQ+kKAQqjUgoz0SvfylfzWbKBsh/F10+SrCyT0aQzxXTnvlKb+u+6?=
 =?us-ascii?Q?LWiAfjJcv1q3p0hEoNH6ETFYenY1WWZ8iI+06T5J8FNd6sHmrRuolvZCq1WM?=
 =?us-ascii?Q?y/RjiniXAjhNs551pH4npwsXMVas8SxY+SDF7Q1UCkqp7cwaH0sh8UaDo112?=
 =?us-ascii?Q?1amC1URwd19lMCx1Ssi4Q/qh53htpv6SD9cQcdYr3VMozMZsXT4W40Prxky+?=
 =?us-ascii?Q?2W1mwtpTpwN5G3/OadQlIChkKoxgyZ1u75oM1uQwg2T5lYS0EzCCcehQc9IE?=
 =?us-ascii?Q?rma3d63wNZ3nnb/SiC+OwRzDBxmzffZxg3PdsVCXvdNoQPFTefZ8NDCg9drw?=
 =?us-ascii?Q?+e5nkJCpI7B/6s9wRwoDOciSHar/2N8B/aWcVOdbJmUvWXdrH4FUMgByohEH?=
 =?us-ascii?Q?yOKat/WbR7J5DHbOkzf90ho2QPbUkMiLoj1+SeFu31AjCaGz3XAfWCqO6ACr?=
 =?us-ascii?Q?WwIkkTuIRFZwSvSAYoyR5heubPU2fXrN5QinJZ7bcTkIlsWOY3euLy63WMD6?=
 =?us-ascii?Q?aAOyk4Me+XqCE85QNvPrfric9mIGFsZqxBFcLfktqL2BiwQlWP1/wHVKhu48?=
 =?us-ascii?Q?DCKAJhhQBEJK18MhCEQ6mEoKZcMN+c5Uom2MmgO/ZB1+Z/u5p2b1vQY7H72+?=
 =?us-ascii?Q?0Hyd2xmNhXpcg1C7LXtZDNwcCWj18mbuzXcGDaoQCp4b6NBE2vmjcEU7uYSt?=
 =?us-ascii?Q?g/mlDggldS6f835bGvMUG4Zb29PJgAZ18kuIXWUHoe+Y8zmHPOS9M9fsahbz?=
 =?us-ascii?Q?yNkDfp4F99bM7N6bxjH9YV4mg1P0ES0DxiO24/RA1Kj2bxfCv7dzbx6ad9yJ?=
 =?us-ascii?Q?uOtvn+o8RVK/AuFS6bj1hetTug/6IKeK1a/zK/bQVECmwka90uW4Rfq5xlaF?=
 =?us-ascii?Q?MOgxWzfHZJs4cLEq0hGji1/lVLyF6S1GHs1AGxv4CXIMlrjZ6c/1aXVfmi7k?=
 =?us-ascii?Q?QjZGb4+JdXZD34DoeuoOScundnUYtMvuj4h73Lh+XOEajm81u8mQnRtLqScc?=
 =?us-ascii?Q?6iXWGNew1WuJq9i2cKGjFpPjKkzErxxnpYsix7CDzZHdktC4T4w4nyjgz160?=
 =?us-ascii?Q?rPFkl7oER7eIdmHIyzK+n4m1aYlG6D3OhHfWz8FyCmZ65Il7rCzxK/8hlw1D?=
 =?us-ascii?Q?t51R/qgmZFWPxAipuDXPqkGc4pnMG6nRA0HaEdRgXHy/YhwpfOl0haiwj/kQ?=
 =?us-ascii?Q?+q8Err+Sz5IZtqaP2mFxmRpIbM1jBv3FplLuOKKjohx56vfRxzTRrCq4qCDY?=
 =?us-ascii?Q?tylxua7SW6n2sW5gGLc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ee1c53-9533-4d9b-7ff1-08de368f91eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 19:25:38.9018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y/rvqHUc5kdiGZoiHm9cxo2U4hD2mGe9AYfd/d/C/qY3fUQ3OoeShAmsOvDlptyNvxD6jSJkD3VUYuMCvgim0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA3FE8A23F
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
> From: Lin, Shuicheng <shuicheng.lin@intel.com>
> Sent: Saturday, December 6, 2025 10:49
> To: Wang, X <x.wang@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Zuo, Alex <alex.zuo@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>
> Subject: RE: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from debugf=
s
>=20
> On Fri, Dec 5, 2025 5:13 PM X Wang wrote:
> > Parse the PAT software configuration from gt0/pat_sw_config instead of
> > relying on hard-coded indices.
>=20
> So the lib is not compatible with previous kernel that doesn't have sw co=
nfig.
> Should we keep the hard-code as fall back?
>=20
> >
> > Expose xe_get_pat_entries() so tests can grab the PAT table.
> >
> > CC: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  lib/intel_pat.c | 126
> ++++++++++++++++++++++++++++++++++++++++++-
> > -----
> >  lib/intel_pat.h |   9 ++++
> >  2 files changed, 120 insertions(+), 15 deletions(-)
> >
> > diff --git a/lib/intel_pat.c b/lib/intel_pat.c index
> > e3588110a..2d204e652
> > 100644
> > --- a/lib/intel_pat.c
> > +++ b/lib/intel_pat.c
> > @@ -6,6 +6,7 @@
> >  #include "intel_pat.h"
> >
> >  #include "igt.h"
> > +#include "igt_core.h"
> >
> >  struct intel_pat_cache {
> >  	uint8_t uc; /* UC + COH_NONE */
> > @@ -13,27 +14,112 @@ struct intel_pat_cache {
> >  	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> >  	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and
> later*/
> >  	uint8_t max_index;
> > +	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
> > +	uint32_t pat_mode;
> > +	uint32_t pat_ats;
> >  };
> >
> > +/**
> > + * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table)
> > +software configuration
> > + * from debugfs
> > + *
> > + * @drm_fd: DRM device fd to use with igt_debugfs_open
> > + * @xe_pat_cache: Pointer to a struct that will receive the parsed
> > +PAT configuration
> > + *
> > + * Returns: The number of PAT entries successfully read on success,
> > +or a
> > negative error
> > + *          code on failure (-ENOENT if debugfs is missing, -errno oth=
erwise)
> > + */
> > +static int32_t xe_get_pat_sw_config(int drm_fd, struct
> > +intel_pat_cache
> > +*xe_pat_cache) {
> > +	char *line =3D NULL;
> > +	size_t line_len =3D 0;
> > +	ssize_t nread;
> > +	int32_t parsed =3D 0;
> > +	int dbgfs_fd;
> > +	FILE *dbgfs_file =3D NULL;
> > +
> > +	dbgfs_fd =3D igt_debugfs_open(drm_fd, "gt0/pat_sw_config",
> > O_RDONLY);
> > +	if (dbgfs_fd < 0)
> > +		return -ENOENT;
> > +	dbgfs_file =3D fdopen(dbgfs_fd, "r");
> > +	if (!dbgfs_file) {
> > +		close(dbgfs_fd);
> > +		return -errno;
> > +	}
> > +
> > +	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
> > +	while ((nread =3D getline(&line, &line_len, dbgfs_file)) !=3D -1) {
> > +		uint32_t value =3D 0;
> > +		char *p =3D NULL;
> > +
> > +		/* Expect patterns like: PAT[ 0] =3D [ 0, 0, 0, 0, 0 ]  (     0x0) *=
/
> > +		if (strncmp(line, "PAT[", 4) =3D=3D 0) {
> > +			bool is_reserved;
> > +			p =3D strstr(line, "(");
> > +			if (p && sscanf(p, "(%x", &value) =3D=3D 1) {
> > +				if (parsed < XE_PAT_MAX_ENTRIES) {
> > +					is_reserved =3D strchr(line, '*') !=3D NULL;
> > +					xe_pat_cache->entries[parsed].pat =3D
> > value;
> > +					xe_pat_cache->entries[parsed].rsvd =3D
> > is_reserved;
> > +					xe_pat_cache->max_index =3D parsed;
> > +					parsed++;
> > +
> > +					igt_debug("Parsed PAT entry %d:
> > 0x%08x%s\n",
> > +						  parsed - 1, value,
> > +						  is_reserved ? " (reserved)" :
> > "");
> > +				} else {
> > +					igt_warn("Too many PAT entries, line
> > ignored: %s\n", line);
> > +				}
> > +			} else {
> > +				igt_warn("Failed to parse PAT entry
> > line: %s\n", line);
> > +			}
> > +		} else if (strncmp(line, "PAT_MODE", 8) =3D=3D 0) {
> > +			p =3D strstr(line, "(");
> > +			if (p && sscanf(p, "(%x", &value) =3D=3D 1)
> > +				xe_pat_cache->pat_mode =3D value;
> > +		} else if (strncmp(line, "PAT_ATS", 7) =3D=3D 0) {
> > +			p =3D strstr(line, "(");
> > +			if (p && sscanf(p, "(%x", &value) =3D=3D 1)
> > +				xe_pat_cache->pat_ats =3D value;
> > +		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) =3D=3D 0) {
> > +			p =3D strstr(line, "=3D");
> > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > +				xe_pat_cache->uc =3D value;
> > +		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) =3D=3D 0) {
> > +			p =3D strstr(line, "=3D");
> > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > +				xe_pat_cache->wt =3D value;
> > +		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) =3D=3D 0) {
> > +			p =3D strstr(line, "=3D");
> > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > +				xe_pat_cache->wb =3D value;
> > +		} else if (strncmp(line,
> > "IDX[XE_CACHE_NONE_COMPRESSION]", 28) =3D=3D 0) {
> > +			p =3D strstr(line, "=3D");
> > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > +				xe_pat_cache->uc_comp =3D value;
> > +		}
>=20
> What will fall into the else here?
>=20
Here is the file format of the pat_sw_config , for the else path we just ig=
nore the un-related lines.

# cat pat_sw_config=20
PAT table: (* =3D reserved entry)
PAT[ 0] =3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
PAT[ 1] =3D [ 0, 0, 0, 0, 3, 2 ]  (     0xe)
PAT[ 2] =3D [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
PAT[ 3] =3D [ 0, 0, 0, 3, 3, 0 ]  (    0x3c)
PAT[ 4] =3D [ 0, 0, 0, 3, 0, 2 ]  (    0x32)
PAT[ 5] =3D [ 0, 0, 0, 3, 3, 2 ]  (    0x3e)
PAT[ 6] =3D [ 1, 0, 0, 1, 3, 0 ]  (   0x41c)
PAT[ 7] =3D [ 0, 0, 0, 3, 0, 3 ]  (    0x33)
PAT[ 8] =3D [ 0, 0, 0, 3, 0, 0 ]  (    0x30)
PAT[ 9] =3D [ 0, 1, 0, 0, 3, 0 ]  (   0x20c)
PAT[10] =3D [ 0, 1, 0, 3, 0, 0 ]  (   0x230)
PAT[11] =3D [ 1, 1, 0, 1, 3, 0 ]  (   0x61c)
PAT[12] =3D [ 0, 1, 0, 3, 3, 0 ]  (   0x23c)
PAT[13] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0)
PAT[14] =3D [ 0, 1, 0, 0, 0, 0 ]  (   0x200)
PAT[15] =3D [ 1, 1, 0, 1, 1, 0 ]  (   0x614)
PAT[16] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[17] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[18] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[19] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[20] =3D [ 0, 0, 1, 0, 3, 0 ]  (    0x4c)
PAT[21] =3D [ 0, 1, 1, 0, 3, 0 ]  (   0x24c)
PAT[22] =3D [ 0, 0, 1, 0, 3, 2 ]  (    0x4e)
PAT[23] =3D [ 0, 0, 1, 0, 3, 3 ]  (    0x4f)
PAT[24] =3D [ 0, 0, 2, 0, 3, 0 ]  (    0x8c)
PAT[25] =3D [ 0, 1, 2, 0, 3, 0 ]  (   0x28c)
PAT[26] =3D [ 0, 0, 2, 0, 3, 2 ]  (    0x8e)
PAT[27] =3D [ 0, 0, 2, 0, 3, 3 ]  (    0x8f)
PAT[28] =3D [ 0, 0, 3, 0, 3, 0 ]  (    0xcc)
PAT[29] =3D [ 0, 1, 3, 0, 3, 0 ]  (   0x2cc)
PAT[30] =3D [ 0, 0, 3, 0, 3, 2 ]  (    0xce)
PAT[31] =3D [ 0, 0, 3, 0, 3, 3 ]  (    0xcf)
Page Table Access:
PTA_MODE=3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
PCIe ATS/PASID:
PAT_ATS =3D [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
Cache Level:
IDX[XE_CACHE_NONE] =3D 3
IDX[XE_CACHE_WT] =3D 15
IDX[XE_CACHE_WB] =3D 2
IDX[XE_CACHE_NONE_COMPRESSION] =3D 12


Xin

> Shuicheng
>=20
> > +	}
> > +
> > +	free(line);
> > +	fclose(dbgfs_file);
> > +
> > +	return parsed;
> > +}
> > +
> >  static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)  {
> >  	uint16_t dev_id =3D intel_get_drm_devid(fd);
> >
> > -	if (intel_graphics_ver(dev_id) =3D=3D IP_VER(35, 11)) {
> > -		pat->uc =3D 3;
> > -		pat->wb =3D 2;
> > -		pat->max_index =3D 31;
> > -	} else if (intel_get_device_info(dev_id)->graphics_ver =3D=3D 30 ||
> > -		   intel_get_device_info(dev_id)->graphics_ver =3D=3D 20) {
> > -		pat->uc =3D 3;
> > -		pat->wt =3D 15; /* Compressed + WB-transient */
> > -		pat->wb =3D 2;
> > -		pat->uc_comp =3D 12; /* Compressed + UC, XE2 and later */
> > -		pat->max_index =3D 31;
> > -
> > -		/* Wa_16023588340: CLOS3 entries at end of table are
> > unusable */
> > -		if (intel_graphics_ver(dev_id) =3D=3D IP_VER(20, 1))
> > -			pat->max_index -=3D 4;
> > +	if (intel_gen(dev_id) >=3D 20) {
> > +		/* Cache parsed PAT config per device to avoid re-reading
> > debugfs on every call */
> > +		static __thread struct intel_pat_cache intel_pat_cache;
> > +		static __thread uint16_t cached_devid;
> > +		if (cached_devid !=3D dev_id) {
> > +			int ret =3D xe_get_pat_sw_config(fd, &intel_pat_cache);
> > +			igt_require(ret > 0);
> > +			cached_devid =3D dev_id;
> > +		}
> > +		*pat =3D intel_pat_cache;
> >  	} else if (IS_METEORLAKE(dev_id)) {
> >  		pat->uc =3D 2;
> >  		pat->wt =3D 1;
> > @@ -96,3 +182,13 @@ uint8_t intel_get_pat_idx_wb(int fd)
> >  	intel_get_pat_idx(fd, &pat);
> >  	return pat.wb;
> >  }
> > +
> > +uint8_t xe_get_pat_entries(int fd, struct xe_pat_entry *xe_pat_table) =
{
> > +	struct intel_pat_cache pat =3D {};
> > +	intel_get_pat_idx(fd, &pat);
> > +
> > +	memcpy(xe_pat_table, pat.entries, (pat.max_index + 1) *
> > +sizeof(struct xe_pat_entry));
> > +
> > +	return pat.max_index + 1;
> > +}
> > diff --git a/lib/intel_pat.h b/lib/intel_pat.h index
> > eb48cbc65..1d6c4f1ad
> > 100644
> > --- a/lib/intel_pat.h
> > +++ b/lib/intel_pat.h
> > @@ -6,9 +6,16 @@
> >  #ifndef INTEL_PAT_H
> >  #define INTEL_PAT_H
> >
> > +#include <stdbool.h>
> >  #include <stdint.h>
> >
> >  #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or
> > better */
> > +#define XE_PAT_MAX_ENTRIES 32
> > +
> > +struct xe_pat_entry {
> > +	uint32_t pat;
> > +	bool rsvd;
> > +};
> >
> >  uint8_t intel_get_max_pat_index(int fd);
> >
> > @@ -18,4 +25,6 @@ uint8_t intel_get_pat_idx_wb(int fd);
> >
> >  uint8_t intel_get_pat_idx_uc_comp(int fd);
> >
> > +uint8_t xe_get_pat_entries(int fd, struct xe_pat_entry
> > +*xe_pat_table);
> > +
> >  #endif /* INTEL_PAT_H */
> > --
> > 2.43.0

