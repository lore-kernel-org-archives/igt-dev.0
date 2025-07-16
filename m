Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E799EC83F27
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 07:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3DF10E264;
	Wed, 16 Jul 2025 07:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjEj32Zl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A34A10E264
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 07:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752651099; x=1784187099;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oJRocYk8YdjBi6TuFVqs9aW1hfBe/AE2NEZv5Y1QqCE=;
 b=OjEj32ZlfxpRlhfK5TPsTBmD0Pi2ThrOJpn1cvOJXKNRqxFavEC8Y27+
 qORWTOfrxmj/Ce67SdQuNn/hyHZrRmROvZJTYeuLmQg5JQbbIBcgvhdxS
 /w9nuVvl2sD61hxdA0JPZrlacOufvCGT67fdcYlkcRsVCn1xakgQdJD0z
 q/hJTEl2cqmGA6+VqTAN/9EEYrks9jMZ0gO2oBMI+k1b/GukhrsfSALhU
 G3k5tVkbDU3aN0gZaXMbBmzzhcocowcND3ixT3fW1jp4tpHuRMQagODrs
 J8ckSZI4fmXUF824x6xbE3r5VZPSkFVwqGB61Gnj3Uem1B49y3ANDygn8 Q==;
X-CSE-ConnectionGUID: aTol344MQBmKB023zZKyug==
X-CSE-MsgGUID: cAnkKDdhRi6gYx0nwMG2yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65582211"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="65582211"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 00:31:38 -0700
X-CSE-ConnectionGUID: 5tOa/OdYRvqm2VWy68AaoQ==
X-CSE-MsgGUID: NtC7OsXpRQmlDbLguoFFFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="161456510"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 00:31:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 00:31:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 00:31:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.80) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 00:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxVXwINek273ojUN1kmxuAS/jhaqtfvIxIsWJfpa54xP//0wULgx6jTgdlCR8DBmcCdu9iAtwdlTWQoZGPUZEPntJJrZyTvhEDueW1GgcACPx14+PePt58ztL4Dd4S4zOG1jFUHHmB8J8cH/41QSHimIroksyspEw/tL59apJ2HKrjcFfoAfDTyHeIeCvzL/PW9AiQXy0QViF/316GIMEhgB+SRLokp9ZYZ9w4TfLIsUSZnhksVsSZW5nA82y+mWauOfniaKx6DIZ5QoP4X4LNSvxxSuqWe8e494VM8TVz061hf4EJj5SxGojZgnQqN8IkLyEOcu9SRIpIk9HernGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWt3WwOXthJp3Fc/JbATeF+TyVobwAiToLHxXEZYWdY=;
 b=IRPmGcibd3/19w+RvEjJo6o0zbL0DNjLk/LsvfajhdwGD8+/L9+wkvoOLjPYALPN+ILrlV8fz8z6blBUdqziY3nYWawxNTG9Ons0e+8yJG7udKHD2g1QI33P/s+lMNn4FCM5EQCGPZpE+Q4G9WINw2EGaX4U9/+qqbLtx/43O+IEO+LSblEbG3osIFjO79B38HvLgHfXLbQlBBteW7USkjEoTrvwIlHoALrQWyafBPGAZ/7C00feAN2TaXRenXM3YfAEADma2WrlsAM8bWEOjm/gYF16ydXFwk4wZou4v6OLUF1JtmlzxWjH8ldvsBi8X+Tj8pfY50s2ai68+PaAVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 by PH8PR11MB6684.namprd11.prod.outlook.com (2603:10b6:510:1c7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.37; Wed, 16 Jul
 2025 07:30:53 +0000
Received: from BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4]) by BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4%6]) with mapi id 15.20.8901.024; Wed, 16 Jul 2025
 07:30:53 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>, "Naladala, 
 Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 2/2] tests/kms_plane_scaling: Simplify pixel
 format test flow
Thread-Topic: [PATCH i-g-t v1 2/2] tests/kms_plane_scaling: Simplify pixel
 format test flow
Thread-Index: AQHb9dUBCjUGAgYn40iZnKSCJxQgKLQ0WCpQ
Date: Wed, 16 Jul 2025 07:30:52 +0000
Message-ID: <BL1PR11MB6050D1E092D77A506D962E87E756A@BL1PR11MB6050.namprd11.prod.outlook.com>
References: <20250715220810.287204-1-ramanaidu.naladala@intel.com>
 <20250715220810.287204-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20250715220810.287204-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB6050:EE_|PH8PR11MB6684:EE_
x-ms-office365-filtering-correlation-id: 1e999248-803f-4f7a-daaf-08ddc43ab207
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rmgvYQFLeL2n0YBNXCv9E5SCeBsa8dxEDica4KWk3su/4TEWGahIMEG/5iNT?=
 =?us-ascii?Q?6XV0OhUp5WZrpPB+B0t8xnfBCse4gx9vbmQ3TATFq4LkmGqt9v69DHQ2JgzI?=
 =?us-ascii?Q?CscWK3/64mEMs+G+ZyP7vIFloBz1WniYaBoogjVpDJ4ouR0R5dm0v1t7GkOl?=
 =?us-ascii?Q?jwTDzhyAYQDtc0/F4lMRZJezSYMvWx+geL8PHAwtfVDQieOXh2hxMlHcnuti?=
 =?us-ascii?Q?R7DDhTm+q4gQmivmft4xK85R+091mHbHrzMEO4+U8LQsBtEUNg16pGBtbbd5?=
 =?us-ascii?Q?xZaxbjk8jPnLsNuVXZCnlzJiAjYcToCIkvEatK6Q2+3zNMT34GNP8isM80Zg?=
 =?us-ascii?Q?ShyJzsCpMa1XrAL5u4E6OXYzfQnLiwasoFOICf+9rF4pieNXdJaec4jmDVbM?=
 =?us-ascii?Q?2J/Uro/m6MyxbsKgRLpm+OnlxjzR2OgsdUXOzhtyWpEkg5kMP8p1WGOboCtR?=
 =?us-ascii?Q?FK8EyrkXICoPxJQRMb/aQA6SZRDDjZqJ+oTsod6Ybdvm3xd/X6Gl6BpfmTaL?=
 =?us-ascii?Q?xO+lp6HU3FQmd3XpvDIgkY/Ye0FeJLPFtLvchfunlMDNW3zg7UzE+8GMbIlm?=
 =?us-ascii?Q?Wuc/l1CRLsytfZHFWYoY6z4tvc1oQCDOF2phjIxOQ3lRrzs1jA1QwNkkoDek?=
 =?us-ascii?Q?mjnswF0k4J0J/opgnIPOw7DN871+Abw5yZPHUoUvDCDeoEzmQlaun0qlCCyo?=
 =?us-ascii?Q?VVRs5JS/U8wGYQnZ3ErZH42M0/SLW4VuUuk6l8c2W9JfBvMQfUEmmBbINVPp?=
 =?us-ascii?Q?TFsLK0vDw5XW7ilktIZI2AxnpOSO/jAoNe5YY/ysKSawzsprt8AObpifTcbO?=
 =?us-ascii?Q?/XuLKE+gAPT4Mll3FDJXMNMIR+Jp0s1eBKVrjamfHP6G775I+YYnzPJnEVJV?=
 =?us-ascii?Q?MjQxCtjfWVFhPydy14M2TRQvoD1UZlM39efai8a7QOSDFaCrOg468hWEdi+s?=
 =?us-ascii?Q?XoRhZirFGJ2gHp4sVgmUb50Pb2Rz2neJJSvURSTWOtqBg3noLNPVWkfh7SGJ?=
 =?us-ascii?Q?rVqUfVpBzOM4akIvZwJFKGl3vSHwgE7CqY7waR71G9790HODEIRDQ5ulrraE?=
 =?us-ascii?Q?FDGB5Uwnn0fC5ZvLYwrmGux8tGfY/SXT6FmA7HZRT+PAkmIHbFd9MhiGcGZc?=
 =?us-ascii?Q?B5MMQhqR/tCUirsaGcWthRPA9jzQ8QdNyM3TV1hBqujF4Lp8NbwIxnM6gNKl?=
 =?us-ascii?Q?NUyqHOON+m7NffiWy5nRKuxgRjP5RCwn4U6MeBolW7JNhmP5GrVSc2cc7wTR?=
 =?us-ascii?Q?BuGzzu80KdCcxohVWlakQVVb82H3vVefx7L7FhBjziZ7CVBYcxffMA4IVJJH?=
 =?us-ascii?Q?wweMWIBxKeFmvNmC4R0lOI0KRc9o/ajvYOn8iqeBlZ3pK0zIPBM8C9u2HvVm?=
 =?us-ascii?Q?zod5JoeDhyfH2jRkmTqkpAhz/Z+x5r4pymdSnw904+TbhaDEzKLvbgtQWP1h?=
 =?us-ascii?Q?PgxhZJTTWiy+65xH8AEbJXkey56i0N4noJQYNvkiIcojZ1TGSSx5Eg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB6050.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bGqpMS486bEZa2470BfuwrDBYOUq4b4RKDabYtZeHMw/8sVmQuOohDplVE4I?=
 =?us-ascii?Q?6qMbY3OIfmfo6NPTdPIz4Ht+Lp80EdJ316eDIg7uarsQcLufi+27O4urk6IZ?=
 =?us-ascii?Q?3l/6uk6n1J/OJw4jv7kXxAycDBd6gVJlGM6zQ+W++qS48NU+BnE7iZ9sOlyT?=
 =?us-ascii?Q?lU+qnhoIUWuVmC8hBwIVUYVc8/1kvqEsbS7LiZEgeOT5aWxez4MmBCQynJx6?=
 =?us-ascii?Q?kOJOqFrpfeNPyf7Ny9jBhoLZShjsDy3YnFKf+xP/Lba3thM0ukdPKL7lWl4c?=
 =?us-ascii?Q?CB/0sFAJfmxpgke4tBsx7iGSCs//mBFDGxlqEsX9T6xbUViZHfTDxvevcxOH?=
 =?us-ascii?Q?vKkUe0LBRLBW2RVY+Gj1HLHWtPTUD13w/34onP9ZvOBhXRcWjfQ+lixiTl4h?=
 =?us-ascii?Q?duyXVTFdfW3O6qiXyZrh+yyD27bdkv4Pev4sLmikdFk4WSOatgEMKiPHg1hQ?=
 =?us-ascii?Q?YhGXqoAcXTgv4ZPrIsKF+Xq75SFy13p7pXgDPPvIu1k1vW+o089FzSpp4Cri?=
 =?us-ascii?Q?KTvzqU/LqWpEmi/LGIEv2m4I47kio6A3WOFe/LmVwdA9u2boNc4DPJrVrE5q?=
 =?us-ascii?Q?FsWjoZjoOqhLmGv32dNBS1+0+R6TRfD48/I5V39dB/w9Mr5X089IsupuwgOD?=
 =?us-ascii?Q?qQ9lncPNx35uey2St0j92bbF/Cvw0A2hBqjjQr6RaxipvakLavKFIWLTVTRA?=
 =?us-ascii?Q?nZITYjfuWH30jaBuooDynuqUQc/s8svNWiMT4Lg+9hT9sHioe0fGE6XsBBFw?=
 =?us-ascii?Q?Iha8hzY9bip9QMbGAn3D4/0r3/yTtQrgIsTMCjsP3C4JKcRF6ApwticalLSI?=
 =?us-ascii?Q?/N55S94qTiLucg+bzTQzUPMKY/fjSGMxfW+KdSZ/4skmTwYuZRamMDL3BLnA?=
 =?us-ascii?Q?y5X2egC8PUAsPeFQNGEAwghDT8WvYPqMLrnXC0sEgYt11bLDJGwLW6PA3MbA?=
 =?us-ascii?Q?SLZuqGHfsPOhb3lLXuSjxiFKr/pKLuMXAcgbzFtHSCxsrwdcd15ZwLiLU9Sf?=
 =?us-ascii?Q?VEKYT4205aSQQOWYZsK/khZHtNvyfLuuiWz70vsafez9wxcXqUwk/kPgcQh1?=
 =?us-ascii?Q?njRSMDnpXvbsnLpGQn8ArHNZRpDRoqvPD/kGXEa/AY083X0vq1ChtlMVMsmI?=
 =?us-ascii?Q?pM8kMTNYjN3Y5Arvy1bIln4bGogED8BYl7eWfRuG3QXuvjPcS+BJ3gKZpy6Q?=
 =?us-ascii?Q?pKWqa0PbFVZkLN7naEei/uo4IHO5Hn//FbX+dtOztGaTNZpw7CWgCtmo/Cxh?=
 =?us-ascii?Q?WzPMcdhDJMUyGPX9yiTYoKbI+YkFFMhkbLKMwhI+H7gEP7I4kGtGJNPFjXdB?=
 =?us-ascii?Q?GMIo9wLTbkY5HzuZIEAImGUEiZP1SbALGmbnRlUUxfrrCrAc9EB33753QGxe?=
 =?us-ascii?Q?8+oUDePhBDaJ3aeKxYF5xT0VviinzSx+G47/a7/eVjHGTkR6g611nmfEdCHX?=
 =?us-ascii?Q?83y/5GP4gEBpopJAGZ9GpjuIbbubmaoGjDJFie/SEBNZyOcvhifypp3w/v7h?=
 =?us-ascii?Q?kRmhgaUak691rgqUCHBon90hUkFDII+TdF0Hx1lNNQ2lcKttnWgaq+u9LTc2?=
 =?us-ascii?Q?nAYtdXZ3l+/yjZ5CjjnG4ePh3aagLpFYdKFOqB2L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB6050.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e999248-803f-4f7a-daaf-08ddc43ab207
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 07:30:53.0021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yH+GYUz0xceD3zmhGASwH3K9HK7ehWtsWPlPAfeg03WaYk8y0tpeml91Sy5foJSHBHIbWHzniWvYErHdcD3hfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6684
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

Hi Rama,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nalada=
la
> Ramanaidu
> Sent: Wednesday, July 16, 2025 3:38 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; B S, Karthik <karthik.b.s@intel.com>; Naladala=
,
> Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 2/2] tests/kms_plane_scaling: Simplify pixel for=
mat test
> flow
>=20
> This patch improves the structure and clarity of the scaler pixel format =
tests by
> adopting a more modular and scalable approach.
> Rather than handling all pixel format variations within a single test blo=
ck, the tests
> are now divided into distinct subtests for each pixel format model.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane_scaling.c | 124 ++++++++++++++++++++++++++++----------
>  1 file changed, 91 insertions(+), 33 deletions(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
> 63d35d76b..922d984a0 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -89,13 +89,25 @@
>   */
>=20
>  /**
> - * SUBTEST: plane-scaler-unity-scaling-with-pixel-format
> + * SUBTEST: plane-scaler-unity-scaling-with-pixel-format-rgb
> + * Description: Tests scaling with pixel formats, unity scaling.
> + *
> + * SUBTEST: plane-scaler-unity-scaling-with-pixel-format-packed
> + * Description: Tests scaling with pixel formats, unity scaling.
> + *
> + * SUBTEST: plane-scaler-unity-scaling-with-pixel-format-planar
>   * Description: Tests scaling with pixel formats, unity scaling.
>   *
>   * SUBTEST: plane-scaler-with-clipping-clamping-pixel-formats
>   * Description: Tests scaling with clipping and clamping, pixel formats.
>   *
> - * SUBTEST: plane-upscale-%s-with-pixel-format
> + * SUBTEST: plane-upscale-%s-with-pixel-format-rgb
> + * Description: Tests upscaling with pixel formats %arg[1].
> + *
> + * SUBTEST: plane-upscale-%s-with-pixel-format-packed
> + * Description: Tests upscaling with pixel formats %arg[1].
> + *
> + * SUBTEST: plane-upscale-%s-with-pixel-format-planar
>   * Description: Tests upscaling with pixel formats %arg[1].
>   *
>   * arg[1]:
> @@ -105,7 +117,13 @@
>   */
>=20
>  /**
> - * SUBTEST: plane-downscale-factor-%s-with-pixel-format
> + * SUBTEST: plane-downscale-factor-%s-with-pixel-format-rgb
> + * Description: Tests downscaling with pixel formats for %arg[1] scaling=
 factor.
> + *
> + * SUBTEST: plane-downscale-factor-%s-with-pixel-format-packed
> + * Description: Tests downscaling with pixel formats for %arg[1] scaling=
 factor.
> + *
> + * SUBTEST: plane-downscale-factor-%s-with-pixel-format-planar
>   * Description: Tests downscaling with pixel formats for %arg[1] scaling=
 factor.
>   *
>   * arg[1]:
> @@ -204,6 +222,7 @@ typedef struct {
>  	igt_display_t display;
>  	struct igt_fb fb[4];
>  	bool extended;
> +	const char *pixel_format_type;
>  } data_t;
>=20
>  struct invalid_paramtests {
> @@ -815,7 +834,14 @@ test_scaler_with_pixel_format_pipe(data_t *d, double
> sf_plane,
>=20
>  			if (test_format(d, &tested_formats, format) &&
>  			    igt_plane_has_format_mod(plane, format, modifier)
> &&
> -			    can_scale(d, format))
> +			    can_scale(d, format)) {
> +				if (strcmp(d->pixel_format_type, "packed") =3D=3D 0)
> {
> +					if (!igt_format_is_packedyuv(format))
> +						continue;
> +				} else if (strcmp(d->pixel_format_type, "planar")
> =3D=3D 0) {
> +					if (!igt_format_is_planaryuv(format))
> +						continue;
> +				}
Imho, add an explicit "rgb" check to skip YUV formats for rgb subtests.=20
This avoids accidentally running YUV formats in the rgb subtest.

else if (strcmp(d->pixel_format_type, "rgb") =3D=3D 0) {
    if (igt_format_is_packedyuv(format) || igt_format_is_planaryuv(format))
        continue;

>  				ret =3D check_scaling_pipe_plane_rot(d, plane,
>  								   format,
> modifier,
>  								   sf_plane,
> @@ -823,9 +849,10 @@ test_scaler_with_pixel_format_pipe(data_t *d, double
> sf_plane,
>  								   is_upscale,
>  								   pipe, output,
>=20
> IGT_ROTATION_0);
> -			if (ret !=3D 0) {
> -				igt_vec_fini(&tested_formats);
> -				return ret;
> +				if (ret !=3D 0) {
> +					igt_vec_fini(&tested_formats);
> +					return ret;
> +				}
>  			}
>  		}
>  		igt_vec_fini(&tested_formats);
> @@ -1324,6 +1351,62 @@ pipe_output_combo_valid(igt_display_t *display,
>  	return ret;
>  }
>=20
> +static void
> +scaler_pixel_format(data_t *d, uint32_t index) {
> +	uint32_t ret =3D -EINVAL;
> +	uint32_t z;
> +	char subtest_name[128];
> +	enum pipe pipe;
> +	igt_output_t *output;
> +
> +	const char *append[3] =3D {
> +		"rgb",
> +		"planar",
> +		"packed"
> +	};

Consider using an enum for pixel_format_type may something as below:

typedef enum {
    PIXEL_FORMAT_RGB,
    PIXEL_FORMAT_PLANAR,
    PIXEL_FORMAT_PACKED
} pixel_format_type;

This will also reduce string comparison in every loop, and may be "append"=
=20
and the subtest name generation logic could be reused in future.

> +
> +	for (z =3D 0; z < ARRAY_SIZE(append); z++) {
> +		snprintf(subtest_name, sizeof(subtest_name), "%s-%s",
> +			 scaler_with_pixel_format_tests[index].name,
> +			 append[z]);
> +
> +		igt_subtest_with_dynamic(subtest_name) {
> +			d->pixel_format_type =3D append[z];
> +
> +			for_each_pipe(&d->display, pipe) {
> +				igt_dynamic_f("pipe-%s",
> +					      kmstest_pipe_name(pipe)) {
> +					for_each_valid_output_on_pipe(&d-
> >display,
> +								      pipe,
> +								      output) {
> +						igt_info("Trying on %s\n",
> +
> igt_output_name(output));
> +						if
> (!pipe_output_combo_valid(&d->display,
> +
> pipe, output))
> +							continue;
> +						if (get_num_scalers(&d-
> >display, pipe) < 1)
> +							continue;
> +
> +						ret =3D
> test_scaler_with_pixel_format_pipe(d,
> +
> 	scaler_with_pixel_format_tests[index].sf,
> +								false,
> +
> 	scaler_with_pixel_format_tests[index].is_upscale,
> +								pipe, output);
> +						if (ret =3D=3D 0)
> +							break;
> +						igt_info("Required scaling
> operation not supported on %s trying on next output\n",
> +
> igt_output_name(output));
> +					}
> +					igt_skip_on_f(ret =3D=3D -ERANGE || ret =3D=3D
> -EINVAL,
> +						      "Unsupported scaling
> operation in driver with return value %s\n",
> +						      (ret =3D=3D -EINVAL) ? "-
> EINVAL" : "-ERANGE");
> +				}
> +			}
> +		}
> +	}
> +}
> +
>  static int opt_handler(int opt, int opt_index, void *_data)  {
>  	data_t *data =3D _data;
> @@ -1365,32 +1448,7 @@ igt_main_args("", long_opts, help_str, opt_handler=
,
> &data)
>=20
>  		for (int index =3D 0; index <
> ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
>=20
> 	igt_describe(scaler_with_pixel_format_tests[index].describe);
> -
> 	igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name)
> {
> -				for_each_pipe(&data.display, pipe) {
> -					igt_dynamic_f("pipe-%s",
> kmstest_pipe_name(pipe)) {
> -
> 	for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -							igt_info("Trying on
> %s\n", igt_output_name(output));
> -							if
> (!pipe_output_combo_valid(&data.display, pipe, output))
> -								continue;
> -							if
> (get_num_scalers(&data.display, pipe) < 1)
> -								continue;
> -
> -							ret =3D
> test_scaler_with_pixel_format_pipe(&data,
> -
> 	scaler_with_pixel_format_tests[index].sf,
> -									false,
> -
> 	scaler_with_pixel_format_tests[index].is_upscale,
> -									pipe,
> output);
> -							if (ret =3D=3D 0)
> -								break;
> -							igt_info("Required
> scaling operation not supported on %s trying on next output\n",
> -
> igt_output_name(output));
> -						}
> -						igt_skip_on_f(ret =3D=3D -ERANGE
> || ret =3D=3D -EINVAL,
> -							      "Unsupported
> scaling operation in driver with return value %s\n",
> -							      (ret =3D=3D -EINVAL) ?
> "-EINVAL" : "-ERANGE");
> -					}
> -				}
> -			}
> +			scaler_pixel_format(&data, index);
>  		}
>=20
>  		for (int index =3D 0; index <
> ARRAY_SIZE(scaler_with_rotation_tests); index++) {
> --
> 2.43.0

