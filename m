Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FE3D3B7EA
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 23:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B0210E3DB;
	Mon,  8 Dec 2025 23:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NC0Yt0sx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DAB10E3DB
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 23:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765236444; x=1796772444;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bN7tPPA/eNnThrNJ3Dx2XQrSpyn6uyBbCsiwDUnyufs=;
 b=NC0Yt0sxfbEwrFshp3f/BfAk+PX5yJA5lqV/avors5um2lvOxa0ndx6z
 +DxV/3AL/RCfId/S8ujQ+5q3bbeIjQ2b6c7ZYc2aauIyu+iFaspJGWQaa
 qAxIj+KYdfysmPxuyml1BdCKJCE1unYpy+1cpNjP+y853BzOq/ztwZxY+
 CFHvqoK8vRffSi7osJLHM+/HEsEEpkUckUL9E/86Pc5HhiumadGknjxr9
 09cny27UDhkP+1GokJU10tHyJRGRLSWuXXGQF7J4Wi7Noqz/qyn2K9vgp
 ww3JCpeJj58llAxxZ+ptxi4rY7Yfsmcv3M8KyV+Zz0iTw2j64ifH3IOxo Q==;
X-CSE-ConnectionGUID: GpC37vdUQN2W3p/bfqu6Ig==
X-CSE-MsgGUID: ldZoFlZ5SlyZ/vND2BjH0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67071576"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67071576"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 15:27:24 -0800
X-CSE-ConnectionGUID: Bh9iGbo+RkSt7MxXq4SKlg==
X-CSE-MsgGUID: 06SZrowXQimkN6QYoySiZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="195346361"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 15:27:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 15:27:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 15:27:23 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 15:27:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSx3WC2y9CZtvu72VRRIVrNbascYuXWsiX0dXsMX6E+kgLC1ljGgXQkWm8Ka8o+Y+t5X3gePFRFiTTUUG8JueHz2mUoINmzMt+h/iPQoGGF7Y92H0x9NiX27AbiIvdjgHnYNHcX0JBKzeeZlIK23490a30CWWTVBMbbbSTZ67SSRNaBi8mn+C2oTAexD46af0p6yK+cRYsOs1OKXHe6KbWxokfKMpgcyTFOx8bzhw6J1puB8x4VmdniR6CWZhOhzMWnb5iqp6QytevG0qy+VpF7f2T/xuDyOJa+e2jKpClhF8n+npOVstTpB+EGqAvWGtvr5gz2yQPdwG+1/NaeF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQzx0YYni/rQojQ9r9eSISXHespqyKNmWHuEnDsib/A=;
 b=GzzSpOobWYKV8V2HuPN76/877w12+CvkojeOCYT9l+e04trBGZTIMW7XI4Bpb5j04dW5yVLzAAz7hj2+pV64icBaLl4SaPgHCP1SfCLVE6NpCPF4fGbKWNUfUnPrXiRoYiGLuTG0Kkn5BYFPuzn7e4rb+mLrVTSWKT27mrizKOhRNfm4jcFDE9oJsNJa6oI7LRewiugk1RLD4p80essFeEUaz5cnkBZTkgqwXlyeZB7NkUUN3HN+DXjR1aHAjXtNqWYSj48BJvA2jNhckSCISdn/FlAxGWX3Olggac/rFF4nyEpMQgQyAXlKm4cQ2d5tGaHKYWgy/g7aZxR8hWG7Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MN0PR11MB6111.namprd11.prod.outlook.com (2603:10b6:208:3cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:27:19 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 23:27:19 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wang, X" <x.wang@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Zuo, Alex" <alex.zuo@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from debugfs
Thread-Topic: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from debugfs
Thread-Index: AQHcZk12v0N7tRyChUOp7uZdC3zyvrUUBwdggAQP4wCAAE67YA==
Date: Mon, 8 Dec 2025 23:27:19 +0000
Message-ID: <DM4PR11MB54563848606A4A2ABE67B220EAA2A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251113070502.2148615-1-x.wang@intel.com>
 <20251206011241.67825-1-x.wang@intel.com>
 <DM4PR11MB5456EEADACFB56E39B95FB96EAA4A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <SA3PR11MB80463A3571A8C5085CBDA03686A2A@SA3PR11MB8046.namprd11.prod.outlook.com>
In-Reply-To: <SA3PR11MB80463A3571A8C5085CBDA03686A2A@SA3PR11MB8046.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MN0PR11MB6111:EE_
x-ms-office365-filtering-correlation-id: e127ae38-895c-4a09-bdc6-08de36b15507
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XzsCxjeNqD5yla7Bqft1WoLvJOqzs/7rBWL2V7MXwnvGo+74KuxQ+pzbEqYR?=
 =?us-ascii?Q?LmP4tymgjEr0NBlqwcpe88a/llZW1ZmEhFodEUHu7IO3fbpLGNIdaG5sa9kE?=
 =?us-ascii?Q?ccBpgVHrmyjry3AZW8tCXlOIGE3yi4CTDQU//rnAJlzz1C0UrwXhBVm1RhNQ?=
 =?us-ascii?Q?KUyiyEZ7tdUwvrXmAVsJI7oMjONiy09K4MeHmwOISLr0Ouk9nkwi32CW3CEV?=
 =?us-ascii?Q?qBspx/0SXYh0ZCVXsH3/7G041/7BKYaN3oag8Up/5QO3QWrLGeMV29TylDGG?=
 =?us-ascii?Q?vclt+b4N1TPoGYVw/xo/TD+uZhauRMCTjAzzqmN8DEnfu6wIXQh1tkU0uUmL?=
 =?us-ascii?Q?pm4iE1W2fqS3uR2sebJ9rfoXqGNjm0VboIRZwQ6NTjevQVeWpY8HB6wrIuKU?=
 =?us-ascii?Q?ApImz7FP1VHCeke2NHZZnhF1PLGvu4v3ccDjeorPMceW3S9b0jGMJ+y84dg+?=
 =?us-ascii?Q?m4e4XjYmR1wiX/Sk0Oz9r+TkWA02/aSFPz71P2PTgLyxLcQrecSX2KvtMrAZ?=
 =?us-ascii?Q?coTY/+sK02I7L8VA/87AdOqSNLrlKgWw7JmCRk0I9WnxujxQncRstDrE2/qU?=
 =?us-ascii?Q?vDjd31i6WzrVeennvfLrBOKDH0NLuLhmRKId/YtI1zgpQ6klOh02S0QNwYvu?=
 =?us-ascii?Q?pIIpmNAilvXk6+oGHWTvzhU9tphO6oP7VmH9h6FvekZ47QkQXhWB6VB5eYHY?=
 =?us-ascii?Q?CLKtc9Ty0lkH1HuU8doe3Z0qbUVTPJGPnNsCNy0YukoWcnstVecLwp0r4PCh?=
 =?us-ascii?Q?ycl1C6Pvc42NIqRAD0/cjXEnAHFtzliLFXAVZ5lAeM2Li0Au4eFcvSQBtcTg?=
 =?us-ascii?Q?Nlkig4Tst/Wtp0er/4zVuX9dmU5mLKQVfYK6d+qD0Ph9OzdVCOTTduNf96v5?=
 =?us-ascii?Q?owiZ+gYl81GjIXKcwMPss93c+Frci1sIz105PCByvk0OH3ic7L6GeCo7xKvk?=
 =?us-ascii?Q?ZY2zntlvntP4PNmdwZX7CR3SZm/7LVZDTJNtX61AYCTtRFXzZQKhnV8uR4qK?=
 =?us-ascii?Q?XRSp5DFMYwka000S5523KrnynwJ09pPRrAWWhPWCjT+QuGWde2lAkNc7HlOs?=
 =?us-ascii?Q?k+TUqec3bxRpfwSdVydJu5RFE4NphnFw/V7/VJc+Nq+Whhk0kY37ZaE30aC2?=
 =?us-ascii?Q?TcoPrFcu7o5VZpNEk8dxMXMppUUef0WhUVU4ubZe0s0sVIhLSqzbet6Ur6iQ?=
 =?us-ascii?Q?PrA7FMuGMmj1Dut6PQy7dgBph9xNd3rEFcmPdQm8V/oF+D7ZD9n6yCqq2dyH?=
 =?us-ascii?Q?rIHIwsxgex3a9bEP3fbLVsjtiuRT0gSpTQRpyDVHA9pwcwUOK/B7XeGkcMPO?=
 =?us-ascii?Q?wOC+ZL63s6LUQ3Tqt3mwoeQXlO4rg1jVttaOhoEjITSjctzV2Uk5ScMxdNba?=
 =?us-ascii?Q?c1MQNQsufDzLZB7rw6D3gNgo8wO+36TvnUaQpeUAir3ctGjhV50es0YpMsTA?=
 =?us-ascii?Q?MzaHUeot5OYRpUFMtkQ/La7j9TG/RWiYll0xXMKkhEv/AaTExczotrzhn6Tw?=
 =?us-ascii?Q?l1m3VNGA4IYTqiZKlpPEgr2ksYUpgiuaokU1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QYOjU5IkJnDhHaKINdalqMtSN2htdSapE2/BC8JV22SsDGMrIyeDEbBBc/eZ?=
 =?us-ascii?Q?K3TGNY4pzollSh/w6ITARqqtqlzjPgHzrXZDrra5yNxBZOSPFXyB1ssxKt3R?=
 =?us-ascii?Q?UsTGfmgaKS75GsZhNfGbwLRD8gDlv2C1I+fYc++dSgnlsL3Py1ta6O8uxj9g?=
 =?us-ascii?Q?kBEX60OTrjT9h39US+u+2Za2YuYBINmahRQ34+l79fTcPCiVkYbD4Iny3IJW?=
 =?us-ascii?Q?/VH3jd0gHVGWWvV96520M3tWCwAjoDF4G5exL7iWPNZ9WNK2VdCSQ1pOQL1p?=
 =?us-ascii?Q?qaun494N0x3QpqYfmzMlsu5CKvpujebzqmFP/M2L31lhsjXlQG0AMa+J9RHt?=
 =?us-ascii?Q?wikzilHVtUb2KUV5mWY9Rj9jm+D8jzYqY9UX1erPJT4JGAvsiSGQkAgmpLJb?=
 =?us-ascii?Q?cTkWmPc461GmQzGsn4e8PAOMwdb0HLmtzlXDOtjglGlg1EqP2eoQ4o12wf6o?=
 =?us-ascii?Q?OxYAyERPJgSgOvz4UrzJu7qAi4I60s2IJDQND67b9uhhu6l1RLZaAcwjdWQR?=
 =?us-ascii?Q?h1ErYzmx5ybzxHgfcAjMvZdA+0KrT3z7jYfc4mHur/gER4bnVTDQhUqI60z9?=
 =?us-ascii?Q?4gE6h7HiuXd+FqVbQ1vldf2t0kVbZ255YJ6KFMSJTZiZ0QNVZHvRtLoI5HmC?=
 =?us-ascii?Q?ZUr57DdLkYtxAwxO+NBux8VrKPMuZOfj1CVK+n0vevl334oazUuczvqkTjBx?=
 =?us-ascii?Q?A4LGFMuPTYyA/3FD9WytqPElmaKDkHs5+JP4BmM4RPe99LNDyPv+Ih+n/KuI?=
 =?us-ascii?Q?4m80MvtWXdTg+N7yC9avEGgfNDo8YibMsUAVprn6YqJ2Zen2KiKLU0rd8EnW?=
 =?us-ascii?Q?IBNiHthxJjTGeJCKoc2goMvRNIjcpmJufz6k7g9Q4m+nEMKYH3CawRr/bRdp?=
 =?us-ascii?Q?5xBTGRwUrb+ccOeVCpGl6OcJYLtYjlPqBMLTstX95nMhpQ6Uwy45kykhAmid?=
 =?us-ascii?Q?e5mcDcKMSUQKZvUJh3IcdQq0L+mXybLu41o1qpcdVI6xH4LDoqd+72sOM4cZ?=
 =?us-ascii?Q?YcDGbbKDwipNJUyKlnOGMt+5M6UTWalJp+W+7Sv9mN2zOOtnMKHwufGYZ5+L?=
 =?us-ascii?Q?dpDU0NBQuhJdK8c7FBYkoaZQ8mmPgYEUAn520W7HFSpwiyrWS+IUt6ZDxVh+?=
 =?us-ascii?Q?BRdXRhzKhkbFXzHrp+N7+BBn+iPrsexfoqpBVg14pEOkS9CAhHtBY20dvfVE?=
 =?us-ascii?Q?Ux5WD2aHfTzlypPRCPEpxJphqzRcOYyv0lp4RvJB15BPCfFm0rQHVVNM0FPI?=
 =?us-ascii?Q?E5qqbCDukDCltKbZsNe/5GqQ8T12U5dkJVmQ1rAxJTuWYjm/kmg2kVXnoyDv?=
 =?us-ascii?Q?9Ud2JGeFa77V3LPIiKkbr5oxbJSDpsKsxHDKopZyosQOJCsfTgVKZcobiAd9?=
 =?us-ascii?Q?1lIg9KPdKuN7Qjg877CZ2FUePPjjdXeWhEYltBFjBc/Xzxuj7mi86KZejI4q?=
 =?us-ascii?Q?jxrQy1X2BSabZIASe8CJ5ij/UldeiszpvdUPA+ObHVe2IIliBgmlY+rjS5zb?=
 =?us-ascii?Q?wTqkEEkhwets0fTb55wW3TxxWbHxhpSLsZ+4IqdlKwMrZgjWGQ4c+ppvRm4Z?=
 =?us-ascii?Q?y0ADRULy3NIFZgLsz/02qj212S7wd/MZP8PpRX1w?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e127ae38-895c-4a09-bdc6-08de36b15507
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 23:27:19.6401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVW5ktXrbeTmY0pCY6aZmE9LVwWK3JXD41ECRS70A6W61qXZJEfvYfWvRYfabKIYVeZe35PV/UK09bedRfWv6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
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

On Mon, Dec 8, 2025 10:38 AM X Wang wrote:
> > -----Original Message-----
> > From: Lin, Shuicheng <shuicheng.lin@intel.com>
> > Sent: Saturday, December 6, 2025 10:49
> > To: Wang, X <x.wang@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Zuo, Alex <alex.zuo@intel.com>; Auld, Matthew
> > <matthew.auld@intel.com>
> > Subject: RE: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from
> > debugfs
> >
> > On Fri, Dec 5, 2025 5:13 PM X Wang wrote:
> > > Parse the PAT software configuration from gt0/pat_sw_config instead
> > > of relying on hard-coded indices.
> >
> > So the lib is not compatible with previous kernel that doesn't have sw =
config.
> > Should we keep the hard-code as fall back?
>=20
> The second patch also depends on gt0/pat_sw_config . If we retain the har=
d-
> coded values, we would need to duplicate them in the second patch as well=
,
> which would make the code quite messy. Do we really want to go down that
> path?
>=20
> In the current implementation, I've added igt_require(ret > 0); so that i=
f the
> kernel does not support this debugfs, IGT will report an error message to
> inform the user that the kernel is not compatible.

As it is for test, if it is not easy to be backwards compatible, I am OK wi=
th it.
Thanks for the explanation.

Shuicheng

>=20
> >
> > >
> > > Expose xe_get_pat_entries() so tests can grab the PAT table.
> > >
> > > CC: Matthew Auld <matthew.auld@intel.com>
> > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > ---
> > >  lib/intel_pat.c | 126
> > ++++++++++++++++++++++++++++++++++++++++++-
> > > -----
> > >  lib/intel_pat.h |   9 ++++
> > >  2 files changed, 120 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/lib/intel_pat.c b/lib/intel_pat.c index
> > > e3588110a..2d204e652
> > > 100644
> > > --- a/lib/intel_pat.c
> > > +++ b/lib/intel_pat.c
> > > @@ -6,6 +6,7 @@
> > >  #include "intel_pat.h"
> > >
> > >  #include "igt.h"
> > > +#include "igt_core.h"
> > >
> > >  struct intel_pat_cache {
> > >  	uint8_t uc; /* UC + COH_NONE */
> > > @@ -13,27 +14,112 @@ struct intel_pat_cache {
> > >  	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> > >  	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and
> > later*/
> > >  	uint8_t max_index;
> > > +	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
> > > +	uint32_t pat_mode;
> > > +	uint32_t pat_ats;
> > >  };
> > >
> > > +/**
> > > + * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table)
> > > +software configuration
> > > + * from debugfs
> > > + *
> > > + * @drm_fd: DRM device fd to use with igt_debugfs_open
> > > + * @xe_pat_cache: Pointer to a struct that will receive the parsed
> > > +PAT configuration
> > > + *
> > > + * Returns: The number of PAT entries successfully read on success,
> > > +or a
> > > negative error
> > > + *          code on failure (-ENOENT if debugfs is missing, -errno o=
therwise)
> > > + */
> > > +static int32_t xe_get_pat_sw_config(int drm_fd, struct
> > > +intel_pat_cache
> > > +*xe_pat_cache) {
> > > +	char *line =3D NULL;
> > > +	size_t line_len =3D 0;
> > > +	ssize_t nread;
> > > +	int32_t parsed =3D 0;
> > > +	int dbgfs_fd;
> > > +	FILE *dbgfs_file =3D NULL;
> > > +
> > > +	dbgfs_fd =3D igt_debugfs_open(drm_fd, "gt0/pat_sw_config",
> > > O_RDONLY);
> > > +	if (dbgfs_fd < 0)
> > > +		return -ENOENT;
> > > +	dbgfs_file =3D fdopen(dbgfs_fd, "r");
> > > +	if (!dbgfs_file) {
> > > +		close(dbgfs_fd);
> > > +		return -errno;
> > > +	}
> > > +
> > > +	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
> > > +	while ((nread =3D getline(&line, &line_len, dbgfs_file)) !=3D -1) {
> > > +		uint32_t value =3D 0;
> > > +		char *p =3D NULL;
> > > +
> > > +		/* Expect patterns like: PAT[ 0] =3D [ 0, 0, 0, 0, 0 ]  (     0x0)=
 */
> > > +		if (strncmp(line, "PAT[", 4) =3D=3D 0) {
> > > +			bool is_reserved;
> > > +			p =3D strstr(line, "(");
> > > +			if (p && sscanf(p, "(%x", &value) =3D=3D 1) {
> > > +				if (parsed < XE_PAT_MAX_ENTRIES) {
> > > +					is_reserved =3D strchr(line, '*') !=3D NULL;
> > > +					xe_pat_cache->entries[parsed].pat =3D
> > > value;
> > > +					xe_pat_cache->entries[parsed].rsvd =3D
> > > is_reserved;
> > > +					xe_pat_cache->max_index =3D parsed;
> > > +					parsed++;
> > > +
> > > +					igt_debug("Parsed PAT entry %d:
> > > 0x%08x%s\n",
> > > +						  parsed - 1, value,
> > > +						  is_reserved ? " (reserved)" :
> > > "");
> > > +				} else {
> > > +					igt_warn("Too many PAT entries, line
> > > ignored: %s\n", line);
> > > +				}
> > > +			} else {
> > > +				igt_warn("Failed to parse PAT entry
> > > line: %s\n", line);
> > > +			}
> > > +		} else if (strncmp(line, "PAT_MODE", 8) =3D=3D 0) {
> > > +			p =3D strstr(line, "(");
> > > +			if (p && sscanf(p, "(%x", &value) =3D=3D 1)
> > > +				xe_pat_cache->pat_mode =3D value;
> > > +		} else if (strncmp(line, "PAT_ATS", 7) =3D=3D 0) {
> > > +			p =3D strstr(line, "(");
> > > +			if (p && sscanf(p, "(%x", &value) =3D=3D 1)
> > > +				xe_pat_cache->pat_ats =3D value;
> > > +		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) =3D=3D 0) {
> > > +			p =3D strstr(line, "=3D");
> > > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > > +				xe_pat_cache->uc =3D value;
> > > +		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) =3D=3D 0) {
> > > +			p =3D strstr(line, "=3D");
> > > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > > +				xe_pat_cache->wt =3D value;
> > > +		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) =3D=3D 0) {
> > > +			p =3D strstr(line, "=3D");
> > > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > > +				xe_pat_cache->wb =3D value;
> > > +		} else if (strncmp(line,
> > > "IDX[XE_CACHE_NONE_COMPRESSION]", 28) =3D=3D 0) {
> > > +			p =3D strstr(line, "=3D");
> > > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > > +				xe_pat_cache->uc_comp =3D value;
> > > +		}
> >
> > What will fall into the else here?
> >
> > Shuicheng
> >
> > > +	}
> > > +
> > > +	free(line);
> > > +	fclose(dbgfs_file);
> > > +
> > > +	return parsed;
> > > +}
> > > +
> > >  static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)  =
{
> > >  	uint16_t dev_id =3D intel_get_drm_devid(fd);
> > >
> > > -	if (intel_graphics_ver(dev_id) =3D=3D IP_VER(35, 11)) {
> > > -		pat->uc =3D 3;
> > > -		pat->wb =3D 2;
> > > -		pat->max_index =3D 31;
> > > -	} else if (intel_get_device_info(dev_id)->graphics_ver =3D=3D 30 ||
> > > -		   intel_get_device_info(dev_id)->graphics_ver =3D=3D 20) {
> > > -		pat->uc =3D 3;
> > > -		pat->wt =3D 15; /* Compressed + WB-transient */
> > > -		pat->wb =3D 2;
> > > -		pat->uc_comp =3D 12; /* Compressed + UC, XE2 and later */
> > > -		pat->max_index =3D 31;
> > > -
> > > -		/* Wa_16023588340: CLOS3 entries at end of table are
> > > unusable */
> > > -		if (intel_graphics_ver(dev_id) =3D=3D IP_VER(20, 1))
> > > -			pat->max_index -=3D 4;
> > > +	if (intel_gen(dev_id) >=3D 20) {
> > > +		/* Cache parsed PAT config per device to avoid re-reading
> > > debugfs on every call */
> > > +		static __thread struct intel_pat_cache intel_pat_cache;
> > > +		static __thread uint16_t cached_devid;
> > > +		if (cached_devid !=3D dev_id) {
> > > +			int ret =3D xe_get_pat_sw_config(fd, &intel_pat_cache);
> > > +			igt_require(ret > 0);
> > > +			cached_devid =3D dev_id;
> > > +		}
> > > +		*pat =3D intel_pat_cache;
> > >  	} else if (IS_METEORLAKE(dev_id)) {
> > >  		pat->uc =3D 2;
> > >  		pat->wt =3D 1;
> > > @@ -96,3 +182,13 @@ uint8_t intel_get_pat_idx_wb(int fd)
> > >  	intel_get_pat_idx(fd, &pat);
> > >  	return pat.wb;
> > >  }
> > > +
> > > +uint8_t xe_get_pat_entries(int fd, struct xe_pat_entry *xe_pat_table=
) {
> > > +	struct intel_pat_cache pat =3D {};
> > > +	intel_get_pat_idx(fd, &pat);
> > > +
> > > +	memcpy(xe_pat_table, pat.entries, (pat.max_index + 1) *
> > > +sizeof(struct xe_pat_entry));
> > > +
> > > +	return pat.max_index + 1;
> > > +}
> > > diff --git a/lib/intel_pat.h b/lib/intel_pat.h index
> > > eb48cbc65..1d6c4f1ad
> > > 100644
> > > --- a/lib/intel_pat.h
> > > +++ b/lib/intel_pat.h
> > > @@ -6,9 +6,16 @@
> > >  #ifndef INTEL_PAT_H
> > >  #define INTEL_PAT_H
> > >
> > > +#include <stdbool.h>
> > >  #include <stdint.h>
> > >
> > >  #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way
> > > or better */
> > > +#define XE_PAT_MAX_ENTRIES 32
> > > +
> > > +struct xe_pat_entry {
> > > +	uint32_t pat;
> > > +	bool rsvd;
> > > +};
> > >
> > >  uint8_t intel_get_max_pat_index(int fd);
> > >
> > > @@ -18,4 +25,6 @@ uint8_t intel_get_pat_idx_wb(int fd);
> > >
> > >  uint8_t intel_get_pat_idx_uc_comp(int fd);
> > >
> > > +uint8_t xe_get_pat_entries(int fd, struct xe_pat_entry
> > > +*xe_pat_table);
> > > +
> > >  #endif /* INTEL_PAT_H */
> > > --
> > > 2.43.0

