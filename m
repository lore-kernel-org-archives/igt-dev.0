Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EFFE77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 22:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23A210E1E9;
	Mon,  6 Jan 2025 22:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFV7HKZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687CC10E1E9
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 22:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736204309; x=1767740309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RBeGUlNeTXvE61UqOr1ndKwbr6RB/KEg1Bds0IvN5+A=;
 b=HFV7HKZ3aaAENy9qfJfXYLHNiyAk/wcjTtyR97R5R2XESY212KsYEg4a
 U9ISEH4XKmJ0DXpzzB4ZHfKHzlomHZovvkou5T8DK4sNsMTsM4b7DPHXz
 ilvPj43XT/hD/2ARY/lpw4xz0dy6SwWNMBtYthoyGAMUKBG5wuRnN9U4k
 TzR0LSlogCzJvjI9fUGcIUVwXa/o5esIte22Xz93pnORRh1yTD7d6fy6p
 L2kM8fsiEN6lObeGDGCjW1f7ggWxKwHpRks5g2e8PYMXuFE9OoArAcGa5
 kAebC3DTJWSqNmlu+RJMstPKjI0JgOJkxwRpeStndtxiEC3dpl9//XesJ w==;
X-CSE-ConnectionGUID: Fd5ZAn0hReqDFtVtqewOvQ==
X-CSE-MsgGUID: ac4ZB03hRa2NFYgR6pxuQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36383074"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="36383074"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 14:58:28 -0800
X-CSE-ConnectionGUID: SU5JBpq4SzSJb2k8W/AWWw==
X-CSE-MsgGUID: 2OYsEFrhTCSk1o1PM4muYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="107535719"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 14:58:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 14:58:23 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5OMy/bC/5IJODlBh9YVDkJbdn3u0umoSM53+NHct5/oHYapJt4L5d+TQ++LIvtc28P+8s5/7lDDN0k5GXl/HN3obWwP4L9qIAHiJbrwIGxnwoiT01xrM2YxWS473f/58h0ARo6VrQMr25V6vjvIMiLPDPuroodRCoywB1dCwShKtPxFxmfyHxnwBgX6IJJGGxhTAePhrUUpGQ12ONBMqZpH5A9ROTzP4ffEYUBazbcrqZgbsMLYOosXekVKXk1RgTNBN2wwNnYohp6l4tlFkXes0Gzw1Fu6vIBIKYprgjrOsffbBOb+KqmDwf9nQo6a03LiZVaTsGCw6RIQkaKu6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZ2xjR/XWLe4wqpX5yaZEgme/ioP6fRaM2RmZ4WHiSs=;
 b=Nnz4xfvRPzhmL+YbWHy1Vg/V0IW8V+atRDwsa35PQRPB2V+yv/pEBIWuidUiPfT0f6JK52jbncYalL5ZCQkX/X38gBFNwfabLCjiu19f6uIDGhyei/qsQVr27TlPu2kEh5p1+zXPmXmnlFI2ZZy++XmaZNh0igAmp896SzDakcol9gHdLjICELOBvMamX79VNWHC5W0NmY6CBSZvTN4VO1m1EoIpdjeppECR1GzIjOLSsyjAox2aIPgLIGFjg1RiTZDjhGEQkzscMoKah3ORW1rCbjjIYAqgY3zMFX4nU1Qs3z1VE+RNe95pX+PXvi7Rpzb15W9rEODQLxqePSCLZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 22:58:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.018; Mon, 6 Jan 2025
 22:58:15 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 3/8] lib/xe: Move functions from xe_util to xe_gt
Thread-Topic: [PATCH i-g-t 3/8] lib/xe: Move functions from xe_util to xe_gt
Thread-Index: AQHbXniP62kBMfRYAkCMOsILavF4gLMKT59Q
Date: Mon, 6 Jan 2025 22:58:15 +0000
Message-ID: <CH0PR11MB5444D73EA4E6B5A0AA3279C3E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
 <20250104071548.737612-3-lucas.demarchi@intel.com>
In-Reply-To: <20250104071548.737612-3-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4622:EE_
x-ms-office365-filtering-correlation-id: 1a3647d4-2f4e-4276-3a10-08dd2ea59a5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FzpAi2AODbyLauZb7B0PjcIauGegz1I7of3TyuspeaJtWGrfosJJgtvega1k?=
 =?us-ascii?Q?CVRQs2xdqrxtUIWnnsEbrB73a3K1WHzs2gZG0/4H7FvpWYKvsFZVGIwBWC7o?=
 =?us-ascii?Q?cbKNv0ZnJ8NeAZDjNxxRIMNKRy/2tpjRHa+gS3jPGDO+T9+uYf1TRBNPD+uO?=
 =?us-ascii?Q?jVxlAQFhY+246KxFVz0r6MLJ402NI/VYvW/5TyWy+IGiTKhC472kZGOz3zAJ?=
 =?us-ascii?Q?9eKynY2f+Xb16p6eIoRql4wp3UMRfw9ICvc1fplEinO9QncfcnnmxsdeKupq?=
 =?us-ascii?Q?AT39SEPJqNtODG0tEhZGkJEvEQzgwyfh5kHr60mLFklfYXsDUI3E7CdTSpQX?=
 =?us-ascii?Q?vk5BoGS+p4/VoleCkTa4YOljgPVbUVOz5rMLNosZvzNh4x0BxsPS5NuiNSXv?=
 =?us-ascii?Q?xsNOmHMndVkMG4l/NZbF06fwuI0AmjssWXagSZgdo8n/BYILyqzWQxg6j+Ka?=
 =?us-ascii?Q?u+X5ImUjQqmiw/18jGRkESpa/uer0cN+so1F+0bmESSUmXt8p4czpDZ6eOB7?=
 =?us-ascii?Q?ROdAscbO4baGriK0BV3HmAmuMWjyKJGK6EiYgvBoZAP79EDHXqNItbKm9Pcl?=
 =?us-ascii?Q?8Tj4+mFVToOi38x+6dEd3s1XG+SZrIkZqaZ/szceZE/ULpmn0lnJWV9tCPKK?=
 =?us-ascii?Q?Pcuxqgv3dxfIh0y7TbWVCjtqNxO22Den/5aCNPmy2bap/6H7usNVL6IKwEJL?=
 =?us-ascii?Q?QhGAslYlBUvp4d9faf5alwPHKqBzRsYq/ne1zzT3i7rUsRoxFMiOYCh7G6qJ?=
 =?us-ascii?Q?9vkerwTONf7VDMuQQMlRAeP0dBXugUzcrmWhhdFHIgGIJDgtVl6j0UoVhGK0?=
 =?us-ascii?Q?TCImoxjlMRhGenErHiEUmYmow6G6UfKqM6aCWVIAGWJdq1+A6oz90+JRkd16?=
 =?us-ascii?Q?jr66Fzl1/goMMEcwkHvgVQaXdb9+a856ds2Y69fMePHKZ9oPd52SZWvndTpU?=
 =?us-ascii?Q?eu44wr2H3bBxiAmWgwSEAlBfw5cQDBwQ1TMX7rfemU2m9ZJWedUKLHPv+rhM?=
 =?us-ascii?Q?xGmUnmkDRlGQUgAmdoQTsc1zgIQtrxlusdiiatQGnfludINWnERMh5q6JlvK?=
 =?us-ascii?Q?hVTJ5Zfjo7XVS5/ssm8nEn14rDi7g/IoDJ37a64Ep9Ou3Fx2RBvXEbGQRovM?=
 =?us-ascii?Q?gyV24mNxoTrWkBJsyX0wB3zQKQP3HDx5LF2oCEBNzNjIRKrMJxbc5POD6pCE?=
 =?us-ascii?Q?Vx6MFLmtqncKavmsaQ4ez4foY6rVKmeUoKovuP8UmGS6ojmOyU75KZ/BFiGa?=
 =?us-ascii?Q?WuVaSWSb/+HRHDBV+Dbjd3ppRP56jbbTwxnN2MzWUb8xRJDkavb30lsC1KgS?=
 =?us-ascii?Q?iRPC1N+3W/nSakFF1MHSULmLnBB7J+wqxkUNglLXs/D/NnumQ0o2auzym0H5?=
 =?us-ascii?Q?6NnwF8aXFelNdPo0Z9/ky5aEH3xruf1uqqn3QTxz4KJxqvw08An0uhcXAUUs?=
 =?us-ascii?Q?Us7EBkJxfMmcwSkwuuQJH1h4ErzLMWb8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R8RR6LGMzENVnFktE/H86uGzalYGFxaDUcIhme+ukD5+ZqwZ+JYXtSAwIUap?=
 =?us-ascii?Q?/jfRcVhQUYGcltZnGzn93sqSYvfy3g57KiKh5cgCt8k3U3f4ztKARZZCFFTY?=
 =?us-ascii?Q?CICyQPaxLrcAXtguqCb8hvCv02hCfgvqkZs8WQlg39Wrd/K5shgE9XoeyyR6?=
 =?us-ascii?Q?pXgXuxVrL/z7/sBZeWoP4vbbXPG7KtA0pHppS+haBeaRX6WptX4YaDKrejnd?=
 =?us-ascii?Q?BfL7K7MuTeOB1Tpt8f0HQRpExpe1romepQZxgBaQgEAYA4ahnDPLLRRxb8q8?=
 =?us-ascii?Q?SMsTQmks90/YoxJtDk0dhnR1umCnRqGbYxm3mrr3M+FETIXZqrIN3pJdtEMZ?=
 =?us-ascii?Q?w4en2p1Hn/ntRxbkJWBfTgjaKj5nu512HhZvtOjfWNcYZoE/UGidfudLgWT4?=
 =?us-ascii?Q?xFbxd2OGDoNLpo49vgx800PMHmFDAJY2KcRG3YQWWo+CClEVqThrFIQdC2rP?=
 =?us-ascii?Q?/eIPD/ZXAktHhdfEc2dqklWUYdP+fHGrooVXBdDGazxJose3IPnCHQoOogl8?=
 =?us-ascii?Q?JGHxiSpMuaig37wr5qGmISXxKDizpzZWJ/PPSMUnaxhe4kg+1lDbk/IUkih6?=
 =?us-ascii?Q?8yLg/AzEgnMu5GT7wgJlNnGqtLYIar1dCNhZIK7HM3lf3BCG+ClZZVNmto1w?=
 =?us-ascii?Q?ytHlNAFC2OQcQf4QPXll5pARg1p3jOpP+tLjIUJIiKNZUSoIZZCOPdAlQ/Gd?=
 =?us-ascii?Q?e45BvFMaN+Dg0/kX7nDgaY9AklajiQiyq4VzLyNYpMGEQVRfdbSeYPm3lxup?=
 =?us-ascii?Q?EUVImKqc6aSGwKPbwrPslJX0G5Y+XZDLkvzR6nIrISvVeYxq+kXbNT70TgMH?=
 =?us-ascii?Q?Ugo4RqsY/sa+aoT8WT4HBJHMna1FMxgvh+AI6IYnMGTsWFpBI+qGygctzaUY?=
 =?us-ascii?Q?ikHE8UMnc/1yFobEPOSSYJpFtME08XMaXt9y8EXVe9/yOtOsPuLz1CKTJYx8?=
 =?us-ascii?Q?41yxM/ZjVDyPlBSVvjbA0uPfX1dRDjg2cjI9/Cu2vIvwW3qK1PzU0p6LKQbX?=
 =?us-ascii?Q?ixMbLJUNHzGydSrXEoE2jS1Ms1OPC+cLZvsI2yHsJkmVvmjhQK9+k8+P0/M+?=
 =?us-ascii?Q?9A0Tt5JztxFQhrEk+ONVmm16v830USdyrpi+p1l8FvOn4QYZMnK2XW+9SWX0?=
 =?us-ascii?Q?L0m1LSF0SnMTFS/6uJlXduPWB5NJpBuWdKfGchV3ISBYRGWwLJWLO2QwMtPu?=
 =?us-ascii?Q?56Zyr8A3TJhKy0NuFuafyaOdttfJEZ+3JO/Lm7JVhBg0YkNKitbvErlqHTQ/?=
 =?us-ascii?Q?2ojo4zUag2kTFDE2CdpWOofs1Z7EBgUOD9Xjfg3PNVwh3AR7L+bhofOGcCN7?=
 =?us-ascii?Q?o+AqVbOKNDMFmzuySuXqO1o6TO7woqlHsRiI3uXmgoJCuLsMr3bNAaPbWW2h?=
 =?us-ascii?Q?E7wLJqHdOArGfiKBrBN9GfGZcxBtEw6aDimlzevi9zQ+iab5gdZiF2/XR2j4?=
 =?us-ascii?Q?G4e5x1Rnyb6hKAEJIam5gDhBGbmg7m9YmYMGpmwistyUYw9yKthcgCcOT805?=
 =?us-ascii?Q?5vPZc64oXpTV5kXLb0ht64UlRKh09IJbA6cLtGPn9V2BKMFv1GeuBc96SMnf?=
 =?us-ascii?Q?B6LltAPDUPsJEdjdAE91KQpJORmvz1VCBjHtS+/U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3647d4-2f4e-4276-3a10-08dd2ea59a5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 22:58:15.0565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2aFFHxRujkRIDbgZshY02ekzKgijeZGWXw41ut5fRbRmaZn/10oOxBGy/isXJRSIklpcD9N+c/RP/qO5bVQMPU16nLpImBQI+Fq9H357Sq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Friday, January 3, 2025 11:16 PM
To: igt-dev@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/8] lib/xe: Move functions from xe_util to xe_gt
>=20
> Some functions are clearly gt-related, so move them to xe_gt.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM, though at some point in the future, we should probably take a closer =
look at
the test files that have been impacted by this change and check if xe_util.=
h is still a
required includes for them.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  lib/xe/xe_gt.c                 | 67 ++++++++++++++++++++++++++++++++++
>  lib/xe/xe_gt.h                 |  8 ++++
>  lib/xe/xe_util.c               | 67 ----------------------------------
>  lib/xe/xe_util.h               |  7 ----
>  tests/intel/xe_drm_fdinfo.c    |  2 +
>  tests/intel/xe_exec_balancer.c |  1 +
>  tests/intel/xe_exec_reset.c    |  1 +
>  tests/intel/xe_exec_threads.c  |  1 +
>  tests/intel/xe_gt_freq.c       |  1 +
>  tests/intel/xe_pm_residency.c  |  2 +
>  10 files changed, 83 insertions(+), 74 deletions(-)
>=20
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 53554beb0..e1f353b41 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -174,3 +174,70 @@ int xe_gt_stats_get_count(int fd, int gt, const char=
 *stat)
> =20
>  	return count;
>  }
> +
> +/**
> + * xe_is_gt_in_c6:
> + * @fd: pointer to xe drm fd
> + * @gt: gt number
> + *
> + * Check if GT is in C6 state
> + */
> +bool xe_is_gt_in_c6(int fd, int gt)
> +{
> +	char gt_c_state[16];
> +	int gt_fd;
> +
> +	gt_fd =3D xe_sysfs_gt_open(fd, gt);
> +	igt_assert(gt_fd >=3D 0);
> +	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_stat=
e) =3D=3D 1);
> +	close(gt_fd);
> +
> +	return strcmp(gt_c_state, "gt-c6") =3D=3D 0;
> +}
> +
> +/**
> + * xe_gt_fill_engines_by_class:
> + * @fd: pointer to xe drm fd
> + * @gt: gt number
> + * @class: engine class to use to filter engines
> + * @eci: output argument to copy engines to
> + *
> + * Fill out @drm_xe_engine_class_instance with all the engines in @gt th=
at have
> + * a certain @class.
> + *
> + * Return: number of engines that match the gt and clas
> + */
> +int xe_gt_fill_engines_by_class(int fd, int gt, int class,
> +				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANC=
E])
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	int n =3D 0;
> +
> +	xe_for_each_engine(fd, hwe)
> +		if (hwe->engine_class =3D=3D class && hwe->gt_id =3D=3D gt)
> +			eci[n++] =3D *hwe;
> +
> +	return n;
> +}
> +
> +/**
> + * xe_gt_count_engines_by_class:
> + * @fd: pointer to xe drm fd
> + * @gt: gt number
> + * @class: engine class to use to filter engines
> + *
> + * Count number of engines in @gt that have a certain @class.
> + *
> + * Return: number of engines that match the gt and clas
> + */
> +int xe_gt_count_engines_by_class(int fd, int gt, int class)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	int n =3D 0;
> +
> +	xe_for_each_engine(fd, hwe)
> +		if (hwe->engine_class =3D=3D class && hwe->gt_id =3D=3D gt)
> +			n++;
> +
> +	return n;
> +}
> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
> index 756b5f38e..47569cec3 100644
> --- a/lib/xe/xe_gt.h
> +++ b/lib/xe/xe_gt.h
> @@ -8,6 +8,8 @@
> =20
>  #include "lib/igt_gt.h"
> =20
> +#include "xe_query.h"
> +
>  bool has_xe_gt_reset(int fd);
>  void xe_force_gt_reset_all(int fd);
>  igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
> @@ -15,4 +17,10 @@ igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_=
t ctx, int ring,
>  void xe_post_hang_ring(int fd, igt_hang_t arg);
>  int xe_gt_stats_get_count(int fd, int gt, const char *stat);
> =20
> +bool xe_is_gt_in_c6(int fd, int gt);
> +
> +int xe_gt_fill_engines_by_class(int fd, int gt, int class,
> +				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANC=
E]);
> +int xe_gt_count_engines_by_class(int fd, int gt, int class);
> +
>  #endif
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 9482819c2..f0b6bbb2d 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -235,70 +235,3 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint3=
2_t bind_engine,
> =20
>  	free(bind_ops);
>  }
> -
> -/**
> - * xe_is_gt_in_c6:
> - * @fd: pointer to xe drm fd
> - * @gt: gt number
> - *
> - * Check if GT is in C6 state
> - */
> -bool xe_is_gt_in_c6(int fd, int gt)
> -{
> -	char gt_c_state[16];
> -	int gt_fd;
> -
> -	gt_fd =3D xe_sysfs_gt_open(fd, gt);
> -	igt_assert(gt_fd >=3D 0);
> -	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_stat=
e) =3D=3D 1);
> -	close(gt_fd);
> -
> -	return strcmp(gt_c_state, "gt-c6") =3D=3D 0;
> -}
> -
> -/**
> - * xe_gt_fill_engines_by_class:
> - * @fd: pointer to xe drm fd
> - * @gt: gt number
> - * @class: engine class to use to filter engines
> - * @eci: output argument to copy engines to
> - *
> - * Fill out @drm_xe_engine_class_instance with all the engines in @gt th=
at have
> - * a certain @class.
> - *
> - * Return: number of engines that match the gt and clas
> - */
> -int xe_gt_fill_engines_by_class(int fd, int gt, int class,
> -				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANC=
E])
> -{
> -	struct drm_xe_engine_class_instance *hwe;
> -	int n =3D 0;
> -
> -	xe_for_each_engine(fd, hwe)
> -		if (hwe->engine_class =3D=3D class && hwe->gt_id =3D=3D gt)
> -			eci[n++] =3D *hwe;
> -
> -	return n;
> -}
> -
> -/**
> - * xe_gt_count_engines_by_class:
> - * @fd: pointer to xe drm fd
> - * @gt: gt number
> - * @class: engine class to use to filter engines
> - *
> - * Count number of engines in @gt that have a certain @class.
> - *
> - * Return: number of engines that match the gt and clas
> - */
> -int xe_gt_count_engines_by_class(int fd, int gt, int class)
> -{
> -	struct drm_xe_engine_class_instance *hwe;
> -	int n =3D 0;
> -
> -	xe_for_each_engine(fd, hwe)
> -		if (hwe->engine_class =3D=3D class && hwe->gt_id =3D=3D gt)
> -			n++;
> -
> -	return n;
> -}
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index b9fbfc5cd..c544d912f 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -47,11 +47,4 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_=
t bind_engine,
>  			  struct igt_list_head *obj_list,
>  			  uint32_t sync_in, uint32_t sync_out);
> =20
> -bool xe_is_gt_in_c6(int fd, int gt);
> -
> -int xe_gt_fill_engines_by_class(int fd, int gt, int class,
> -				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANC=
E]);
> -int xe_gt_count_engines_by_class(int fd, int gt, int class);
> -
> -
>  #endif /* XE_UTIL_H */
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 6549629b4..f4264aadb 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -8,7 +8,9 @@
>  #include "igt_device.h"
>  #include "igt_drm_fdinfo.h"
>  #include "lib/igt_syncobj.h"
> +
>  #include "xe_drm.h"
> +#include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balance=
r.c
> index 1e552e9ef..f2df5cbec 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -19,6 +19,7 @@
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
> =20
> +#include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index a3eaf8bbf..47c7666df 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -21,6 +21,7 @@
> =20
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> +#include "xe/xe_gt.h"
>  #include "xe/xe_spin.h"
>  #include "xe/xe_util.h"
>  #include <string.h>
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.=
c
> index 661117bed..c8fc17366 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -21,6 +21,7 @@
> =20
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> +#include "xe/xe_gt.h"
>  #include "xe/xe_spin.h"
>  #include "xe/xe_util.h"
>  #include <string.h>
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index de4d111ea..5d806cf15 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -17,6 +17,7 @@
>  #include "igt_sysfs.h"
> =20
>  #include "xe_drm.h"
> +#include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_spin.h"
>  #include "xe/xe_query.h"
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c
> index d4b26b231..18e5cb6c3 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -21,7 +21,9 @@
>  #include "igt_sysfs.h"
> =20
>  #include "lib/igt_syncobj.h"
> +
>  #include "xe/xe_ioctl.h"
> +#include "xe/xe_gt.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
> =20
> --=20
> 2.47.0
>=20
>=20
