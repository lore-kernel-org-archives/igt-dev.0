Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2705C369D9
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 04:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A5210E333;
	Mon, 28 Apr 2025 04:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFY6Odtd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCED10E367
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 04:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745813294; x=1777349294;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=62B+kKqAepKlfGcf1fO+I17HY1YZ4UrMp/Su1nLlZiE=;
 b=DFY6OdtdooFXKFLTU7KsIF89jkgfm8np/hWGHTOJmkgRzsFyOr3XWDoX
 SKvz72xYP3Ph/S8y1zTyuE/kAOYKI4OhzzG//wcNpbHI3UV6f3PP1qGlz
 wsKi6F6t042u2t/VqcimwMnnpi/PUQz8AZn15hUYavfCKl4nZlH/eflov
 kKiMfi29Hi6O4Wbx96GUWI1WYubf0jepyzqndV8YM3p2dmXDdy0Y4QSAe
 6LPmtXqI6o8D8h/Y4PlScPSGwyrpIN9HF7OM9rCLur7qM9P/tFlD4OtP1
 yq1tfn6qCt9jxH/ExlQz7+5o8smlLvEBAbA3ws6tWk2TOAOn7CspgUV9p w==;
X-CSE-ConnectionGUID: w+QWHxDfSQSGArNxY52Y2Q==
X-CSE-MsgGUID: PdISumxBSYaBWxIy6Dzx4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="69890122"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="69890122"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 21:08:13 -0700
X-CSE-ConnectionGUID: 158VFj/jSY2cbQOWuP1Mng==
X-CSE-MsgGUID: eh61ezDiSCO2lJ1JXXAUzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="138400399"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 21:08:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 21:08:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 21:08:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 21:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snKwkonLEIpjemmTPhr+DVcLm49qbVpNnMvRzubwDaRWI+oiAGZRvLgpBl6tF1n+B/FCRxBsoAOUScf2nH6geQUzHg5/uRegungwwBixWZmTUKiXTGo7QTgLVCFow9Zcvsh+blFHfTEdmkWsXJXfLDhcD6NuIgYDqkgn9TtMAiQ4XD5UCc505HOVjeffpczRTATAbHR0mbvhcKGCB8PSJK9hmxBrPJsUC/SrrBSszl2EiarS5XFidQZ43Y0Ec9buqbAh5OsFkqQHLWu9kUQEnOQvNmkZBXvUnMa1CmAtxJf+9bFvquW6sxjiNut2Nh9IcJwOztaIa5AlgTvjmbX2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkd/L2DI8ciDGCh02jbueyrmtUz5wX01b69P7wZZAqs=;
 b=JPn41dXf5J/baNGlqec0+5DeQDBobNpliNSs2bkas3bqUVwobeMdF/J0jSzxujiyWS4My8F54aRIl3DzmNUX+PWMudBJySaVqNjWxB2/4VCNdly++j35Vb2wBkCPcbLLKn/BRWLdjD+kGl2ABWftH4oqHIVLhdNzwki/TJtQ81w0Bc/ki9OtrTmsTZhNEE+zPosr9Owa3y5mnQTtzvOqTOjIpUx5OIDb3D2e8Re7BiXaguKWcFmDn43Us9obY+OahjysAPVrgUd7CgkpAS6p4mBeSN+Lvt4eHyLlzM3B4eyRbx+zg2GK0RQ990otKsd6fgORMMU1QYj0vpO7QpUkdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by MW5PR11MB5906.namprd11.prod.outlook.com (2603:10b6:303:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.39; Mon, 28 Apr
 2025 04:08:09 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8655.038; Mon, 28 Apr 2025
 04:08:09 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_content_protection: Add force HDCP 1.4
 subtest
Thread-Topic: [PATCH i-g-t v1] tests/kms_content_protection: Add force HDCP
 1.4 subtest
Thread-Index: AQHbtDpxwSwdQUGnxUuOZuQIukr6iLO4d0cQ
Date: Mon, 28 Apr 2025 04:08:09 +0000
Message-ID: <SN7PR11MB675042234ADAF4196CE81A46E3812@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250423102036.2944399-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250423102036.2944399-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|MW5PR11MB5906:EE_
x-ms-office365-filtering-correlation-id: 6d685b27-4acd-4407-46a3-08dd860a497a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FsJYz39H0ke2z3dNO080BusSJX5wgZgzopDrwoh9yTSs+PmyE05lIVDCGVBo?=
 =?us-ascii?Q?ndum3Sogf4jYzsnTiQHrziwFehFMHj88e/RcV7YLNAlfFpWpZOuDRYiXNa36?=
 =?us-ascii?Q?C07eKF6xJBqQtjZQ4iagUzhPmMldSE4f1Z8g3csxZPU+2l2jHPCcebXntzGf?=
 =?us-ascii?Q?+3zQdbbgCPq8FmdGr2CgD3jjpBNXS29iIZhWbjhd9j82140PGPQDIy2bmazk?=
 =?us-ascii?Q?IV76V6oYEAI4rKHPopbRfYe07M2JLa3HQfYFQ+992acttfcD0qoS3pfWliIv?=
 =?us-ascii?Q?bzgPQMJv0NGg60d3eqaNXuirzea8XXTpABF1C29E6tTb92tAHaAc7jKaZKHK?=
 =?us-ascii?Q?TeTxL4MoYQM4/K68Jsvi1/WbWXBw8DIRNG6Km1EbPklWqQBWoxSLVlFKog3G?=
 =?us-ascii?Q?rhfTdI2qDNFClQE6hkcfNZTbTYL5Xs6MU7oz8A3QtsyiIdAAglYkOlfikXqg?=
 =?us-ascii?Q?eTQ3haJ+p5/7OaT/ufoFTB+6h+LKj6YfKwHuJn1tHiALpj9NGkL2sWtEKhUz?=
 =?us-ascii?Q?51vZgd5G3wBxfMzOqz9qeTEKt+y+YWOGUgdACtjALHY1klipjC2cfkSbXSc+?=
 =?us-ascii?Q?40NzgeW/wi5PhpqkC8tBY3UQ3nqM7FIvFv1VFvLEVaAzVX8ATLxTXPR9ZDmn?=
 =?us-ascii?Q?AceiXi+kmsf9r7LasQDBDIsreaXUPSEkeGvYMUeqlbtXMUCNdC8Vx59INVSo?=
 =?us-ascii?Q?p+0BL+MB+WC55YCTTGJ4Vpq9v4BiyQefGK9FtJwQf2J80RpPg0ldEhGXezse?=
 =?us-ascii?Q?JIYQ1kpVOGw1cunr/6jrFH/gMOAcSLJxciGDbe75edg52+uPLYFEU3s3zoIk?=
 =?us-ascii?Q?KslMhX4euB3Bo3tbg8sKCu791mQSzV1QfQEb1K1z/fjNe0jD4A/4ZdemaVlx?=
 =?us-ascii?Q?uVKdvCF/qpI3fXShI7qOu2C9BLtqy2GE0xL7g86CDUI3OTovk6FfSRzMTQUv?=
 =?us-ascii?Q?JnQHgzq6i/bnUZedv6jB6ctyDaEJnSkxCIw80uAVuCbBtT/GIupy5mw2N4sD?=
 =?us-ascii?Q?ODmVmOxtQ0yqKvnqfnjIQ3jTRP8oDTtuEirgFaV9/Hw31HdD6Zf4kG9XUpIt?=
 =?us-ascii?Q?jKevRXzfTWNPkaaovz+v34UkrAuXFB4vKf8+ByEnfVBIMGxU5uj85suhabPw?=
 =?us-ascii?Q?0EfB1SFyn1SyQ6mmR1hUXBLSdy04J00Fjwt2AAW+L3NaOF7PILWQT2bw2LiZ?=
 =?us-ascii?Q?b4lFj02QEUjEOLHJNaCTbbBJfnTnGE3Vu4Cm0sNpYEL5FH+swyeO6ZdCfqR2?=
 =?us-ascii?Q?SCsoqTBVOSNgqqukUKJzxBJUu5oP51Ka37ZUtEz3FFQK3jy5giPwh5MPoqcw?=
 =?us-ascii?Q?GklnayYH6kW0hUyzPvSXNPaCPYRoEHVRZbMJ7l8eXPniXyu/c5EGVKcvvRms?=
 =?us-ascii?Q?tPjjIzkR4IzX1YQslvNH39YeQlur7G5bUkVzSNOzdNM0dZ3aHu6pRJPpU7oD?=
 =?us-ascii?Q?2+WqoucJai/fh2wtnVBJXwwTWoV0tYeCQCTB0bw54hmFVFt0NWOc8Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VG3ToQELOYhFqs94/hIXNNKv3rCnRIRNtn0mBJMS+zLgENXYDEF5k96pIlvX?=
 =?us-ascii?Q?jH3Is6p136TrMoc6gMGuYtuzJT0rzt+E0WnN7a1mC1Ex38SdfWTaHJGr8Kul?=
 =?us-ascii?Q?uFX5UYz84faUbIdCwe5Hysx5A0AletC5SlpXUxFXV+2pDiBO9m1Gj/cMlTuE?=
 =?us-ascii?Q?FKRY9ZtgbdcdRSEfjNfgCMbb/Lcw9SxE3Hel5u8PU5MwzGOBU2gqXw4BF64u?=
 =?us-ascii?Q?YKu+OVZ+QNk9cRb8cTUo5b0GDjvLaeKR6Eq9soBBSCTEe9AWCB1LwkCdkPlK?=
 =?us-ascii?Q?wEr7T6l0hQQ/wD7z1FdTW8t2z0bIOCNV9QwVymNz9q9jqHYpCAZ25Muz2XNp?=
 =?us-ascii?Q?JbFQ6+aRsI8fGaAGNQnfS215cdH392AfyD2+lUEkH/xI5jLnSOsvsDLsSKFX?=
 =?us-ascii?Q?/DVX945kGxEITq94YJ1mXsBhoyLWxTc0WBcFg425Rzg4HIP5+C8JvRHAvKIB?=
 =?us-ascii?Q?H88EMFRoPJM6PKbCcbksjbWvYsrCbjwA6ClLD18p1BIcVIFEciTK9tVKLFf7?=
 =?us-ascii?Q?7KVfh0bUQHtW/C05/SYSQIUPXUnkAd4uSaYREx1kJM2iyp5GlsTSGsCfAkob?=
 =?us-ascii?Q?rvirgAc3SLtgY+bUsTxnkrWyI3DpUULgkyPHmkK73LCZIPX5DAR1TFmZ+Igm?=
 =?us-ascii?Q?PKfDVFHx4IcENMWFjYeoDJkd/rJz+mV5eG8jYvWnC/d+nJbRWy/2StVPwQwA?=
 =?us-ascii?Q?l3IetYJKsY0CvhmsmJAxpmwFVXdmO9MxnkmtW0rnv+V1JL1nDjwcCJLKFtgh?=
 =?us-ascii?Q?LP73F6VgvaBxHz6ON8Xm+lW/D9QFmzTut2OeL2mSDl0BVbSpqfywizLVpuV8?=
 =?us-ascii?Q?Hu01AIwPTQLMZ2/bMnkc1FFtPtm25wrais2eCdc93s6mpsDId1zk253ZLhGx?=
 =?us-ascii?Q?OrODG7ItvDxhSy3slQ81nHFwV7jLeT7vGDv3Wing4+EFSeccpztV9Qr6fKkS?=
 =?us-ascii?Q?7M6GRQw/u2QRCKc54MbQk+3ylF/0LaxQYx6Pd3gPnHqrwh7ZNOrhL+WLHXhC?=
 =?us-ascii?Q?WejjW/c5PP/Lmj+s3Pi4V/lVS5oNAwsLooKrxClN34Dr9BSRJ3kWLSR6fkf5?=
 =?us-ascii?Q?XrFGiMNQPJXIyoO9LOwnZw8zKtuYJ6UeAVcpTcPL/V66Iwnl5vsMdmSSRYLY?=
 =?us-ascii?Q?GCWFwDn1RKTzi2b2J26ginlepLcAntNQ++lLOoLda52JnvrdbUa3VPGYoNqy?=
 =?us-ascii?Q?IpNG5zA6XdmwbTVWyNiFXT+7JP5ixhs+w8oDcvq5QKKPmB3YA/8DWHPAQRbT?=
 =?us-ascii?Q?mmTlMyD/7PX+4NdWwoJVZhXK6b8/oSDqufmR3GfhnPUCUZahB7zqJk0+6BsK?=
 =?us-ascii?Q?KYvoxRlpXd0FThyzzEpuMbj9Pll8s7CjyakWsNvhLJ7z4cEy0DNdUJGbjID8?=
 =?us-ascii?Q?UFED8e1zxfjFYiu/QCjSb+9J/WWu4z7rVORxfABPhwAESSCY+bduh71asoql?=
 =?us-ascii?Q?2Yl+pYa+DXSNDDUF6VA3sA0plsMYDIyEh1LBVJtM5ewpdZ62rzoHeA0+7GKM?=
 =?us-ascii?Q?75ueeevRJdiK/ZJ+QdJIoP/lvnK3d2e3zw4s2XvriSTjS9pZeoZFLOY7f+YG?=
 =?us-ascii?Q?KJIzSU1I9Vhl5sTROoQmV4qb2aeBuZRARJhUpVmI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d685b27-4acd-4407-46a3-08dd860a497a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 04:08:09.6719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1oaajGwBvIIIOzfFx3CzsrkqWOyDQ/zmSEfczmwoJge6X9ZCnMyl08VcxaERBjJkPkmwiEGDmEdEaB7Zd2Bf2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5906
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
> Sent: Wednesday, April 23, 2025 3:51 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_content_protection: Add force HDCP 1.=
4
> subtest
>=20
> If a Panel supports both HDCP1.4 and HDCP2.2 versions, the kernel will al=
ways
> choose the HDCP2.2 protection path and if this fails, then
> HDCP1.4 will be tried.
>=20
> The subtest uses debugfs support to force hdcp1.4 on the connector and ve=
rify
> content protection.
>=20

I think having just one test was not why this debug fs entry was added.
We need to have a whole suite of tests of the top of my mind these are some=
.
Legacy-hdcp14
Atomic-hdcp14
Dpmst-hdcp14
This patch should be a part of the series that adds these tests

> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_content_protection.c | 62 ++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 6fe1edbc4..aea842bdf 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -63,6 +63,9 @@
>   * Description: Test to detect the HDCP status change when we are readin=
g the
>   *              uevent sent with the corresponding connector id and prop=
erty id.
>   *
> + * SUBTEST: force-hdcp14
> + * Description: Test to force hdcp1.4 on the connector and verify conten=
t
> protection.
> + *
>   * SUBTEST: %s
>   * Description: Test content protection with %arg[1]
>   *
> @@ -102,6 +105,7 @@ struct data {
>  #define CP_MEI_RELOAD				(1 << 2)
>  #define CP_TYPE_CHANGE				(1 << 3)
>  #define CP_UEVENT				(1 << 4)
> +#define CP_FORCE14				(1 << 5)
>=20
>  #define CP_UNDESIRED				0
>  #define CP_DESIRED				1
> @@ -565,6 +569,51 @@ static bool output_hdcp_capable(igt_output_t *output=
,
> int content_type)
>  		return true;
>  }
>=20
> +static void enable_force_hdcp14(igt_output_t *output) {
> +	int fd, ret;
> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
> +
> +	fd =3D igt_debugfs_connector_dir(data.drm_fd, output->name,
> O_RDONLY);
> +	igt_require_f(fd >=3D 0, "Cannot open %s debugfs\n", output->name);
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	if (ret <=3D 0) {
> +		igt_info("force_hdcp14 not supported\n");
> +		close(fd);
> +		return;
> +	}
> +
> +	ret =3D igt_sysfs_write(fd, "i915_force_hdcp14", "1", 2);
> +	igt_require_f(ret > 0, "force hdcp is not enabled\n");
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	igt_assert_f(ret > 0 && strstr(buf, "yes"),
> +			 "force_hdcp14 is not set to 'yes' on %s debugfs\n",

 Shouldn't this be i915_force_hdcp14
Maybe set_i915_force_hdcp14
And reset_i915_force_hdcp14
Instead of enable and disable

Regards,
Suraj Kandpal

> +			 output->name);
> +
> +	close(fd);
> +}
> +
> +static void disable_force_hdcp14(igt_output_t *output) {
> +	int fd, ret;
> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
> +
> +	fd =3D igt_debugfs_connector_dir(data.drm_fd, output->name,
> O_RDONLY);
> +	igt_require_f(fd >=3D 0, "Cannot open %s debugfs\n", output->name);
> +
> +	ret =3D igt_sysfs_write(fd, "i915_force_hdcp14", "0", 2);
> +	igt_require_f(ret > 0, "force hdcp is not disabled\n");
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	igt_assert_f(ret > 0 && strstr(buf, "no"),
> +			 "i915_force_hdcp14 is not set to 'no' on %s
> debugfs\n",
> +			 "i915_force_hdcp14");
> +
> +	close(fd);
> +}
> +
>  static void
>  test_fini(igt_output_t *output, enum igt_commit_style commit_style)  { @=
@ -
> 607,9 +656,15 @@ test_content_protection(enum igt_commit_style
> commit_style, int content_type)
>  			if (!output_hdcp_capable(output, content_type))
>  				continue;
>=20
> +			if (data.cp_tests & CP_FORCE14)
> +				enable_force_hdcp14(output);
> +
>  			igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(pipe), output->name)
>  				test_content_protection_on_output(output,
> pipe, commit_style, content_type);
>=20
> +			if (data.cp_tests & CP_FORCE14)
> +				disable_force_hdcp14(output);
> +
>  			test_fini(output, commit_style);
>  			/*
>  			 * Testing a output with a pipe is enough for HDCP @@
> -830,6 +885,8 @@ static void create_fbs(void)
>  			    0.f, 1.f, 0.f, &data.green);
>  }
>=20
> +
> +
>  static const struct {
>  	const char *desc;
>  	const char *name;
> @@ -893,6 +950,11 @@ static const struct {
>  	  .cp_tests =3D 0,
>  	  .content_type =3D HDCP_CONTENT_TYPE_0,
>  	},
> +	{ .desc =3D "This test forces hdcp1.4 and tests the content protection.=
",
> +	  .name =3D "force-hdcp14",
> +	  .cp_tests =3D CP_FORCE14,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	},
>  };
>=20
>  static const struct {
> --
> 2.34.1

