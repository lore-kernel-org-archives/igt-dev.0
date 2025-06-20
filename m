Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD0CC71155
	for <igt-dev@archiver.kernel.org>; Fri, 20 Jun 2025 06:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0D510EB0E;
	Fri, 20 Jun 2025 06:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwZHjUrb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC8110EB0E
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jun 2025 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401367; x=1781937367;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3AI6OfNCMdbamffQ9I//3wh2qKBMoesCVaNTYwLb4xA=;
 b=hwZHjUrbp5FZ2qyYAmD7kBslFnIwjoZlAiBCxwvmzEz4JNca5vFwJprT
 zBBJ5vR77c4/V6WL4ksnrq26X4BjpxKCwx6c840D6K4QDMsVLo+d23rch
 V2P0hUvEjosbArFhukvCKDRmBkTwklOVZBv+wrSvSTvjcqUFV8k91OUMA
 PpKY4c7+Kdb2EpphicJ/L0KjjPiFpwD79PshSETKo7bT/KIEQ5ooXdgRf
 6eAxA1RPVtTu3bUgJUh50oQuFempcpg5BDV2wEbM2KiGdEFbBRz2/qntP
 Ru1pTH2UxfxhZMtcWP55i1BNUywFZcieOiYmm27/xIE3lJWBEFNBpAwbL A==;
X-CSE-ConnectionGUID: btiichFXSQ+B9mYLNXwhNw==
X-CSE-MsgGUID: ccnBJa2IRsmDi0R85odHkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701964"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701964"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:36:07 -0700
X-CSE-ConnectionGUID: NtSM71VLQVWw/BD/4NbV6g==
X-CSE-MsgGUID: I/c9Iq0bQQCdVXLYZaBbCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="150636076"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:36:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 23:36:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 23:36:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 23:36:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T65+cDR4MheBpUD1QPA1p1AlOXLog4JxLoNKHj3yzOOS0ps1tj/8STRm3KPIBR2MvG7tcX99RFCdBtzr03rp+c/P2nXEDCBIRBg9yA01B+/kNZLhLS2Qp9WUqW7+xSeVUDwCBncNm/Ox4SA7Cs0DosSbKg5UdzNN+lM/ttT4oxL6xWI/rJknLPMvdHKeOWaYQcSXv86hAvYBiflXk9B2uaRxfyzUXWOG9TKeNGxBBMTgPHLsJIlB2szQ/EJ2py9q01LKGUzAAcK89c4jULcq7F2C/ra+QZbAmhei17PL2aWjM81J9LgjHkQs6mRcY1kyL9w/aXV8ehB28np2Ru+a1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uuvu58sE1jN8EgA3vU0mXOG2hfmM2LVJnYyiykKC4aw=;
 b=ZRkri2QT4FLxCEup7T0mcKUIp4bdDLYgXrDUEIkAYUY4VFKZYt48oqBAghDqkRFn1yJqYK98ZHhSwvozRrpakQ4tYQKukJgYuQY6BI/tnTI0kPpPcfzg/TKeWmyAKlHW+gmGnFHq17f18H73HkR238YGDEExTJvDreql03AH0I06bCh8TAm1Legm/bzb40gvxhcJNHNB3a8JI5pTy0ou1dfMtPbPcFVmZcbuqMzib5iJhI8lIbprUnYXiYhZmjc8tne0TQVF2/4qTPdn7vJvYn9/O1tk+h+0x2yeRurNcG9KkCm2LINw6RhiqnVMocNvon8j8sLzlX/0IsaeUugdaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 06:35:36 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 06:35:36 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH i-g-t] lib/pciids: Add PCI IDs for xe2_hpg
Thread-Topic: [PATCH i-g-t] lib/pciids: Add PCI IDs for xe2_hpg
Thread-Index: AQHb4aNXpVEL3+9DRUm5Nz2zggG/KrQLl2og
Date: Fri, 20 Jun 2025 06:35:36 +0000
Message-ID: <SJ1PR11MB6204E9C31BC2175CEBE0D5BF817CA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250620053818.3633618-1-kunal1.joshi@intel.com>
In-Reply-To: <20250620053818.3633618-1-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ0PR11MB5070:EE_
x-ms-office365-filtering-correlation-id: 5d81f585-6129-436f-ab30-08ddafc4aa5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dp8IPYDwD9AiKcBrZoRkH+NJzrrEf9OXTN2BBgNCBO4gPXPr07C1k04vgM3b?=
 =?us-ascii?Q?2Cp+7wWu4PFv0VjNkLKcVErJFPJ6JdxsugG6QLv8rxdAQx5DdIRE1LnqzGLR?=
 =?us-ascii?Q?JZgG51JeE/NlVVWq6zwyrMsVESpUs4E5MbCAVhLbu2iucsRDolwaBmkZNeV8?=
 =?us-ascii?Q?d7ervv2FwKcW5p8CqKKtk6tf+WX/WQSabdA+teywqpM4RDIfNSaWoLPPz1th?=
 =?us-ascii?Q?5Ft5zgWaJyZSer0bT7WxlYFO8jYnSi5ErljaZvXnJChzgXduqQl2Frm2epzU?=
 =?us-ascii?Q?cNF4XBaYtqRPhRcZWcxYeHzwhp2HWpKntCIffnnUsRMKUkxns27fooSNZN7R?=
 =?us-ascii?Q?OynmtBLesVKjZKhtpBxNySNER6Q1yIbxQ9E2QlMgY1cPvNXRTO5ddtmzSx3c?=
 =?us-ascii?Q?dAJYAKA+trWr+06vo+kTz11gUmyDgpPX62118LAq4wpxtRwCX3PDLxjOpvWz?=
 =?us-ascii?Q?U0l2wfKGR37ZiuZU7Ny3U/HXNoZTBu0pSFr0YhOR51NwOgxcW1cw/EQ8gWWX?=
 =?us-ascii?Q?HxntaPWLFkIDoSz7gYzmwQIb7LgwiTimxqY+pGEbXrDyxD9U6qYQnbv1Ov7F?=
 =?us-ascii?Q?jNmbPp1/T6+Dc5vtsmu922XlK+Rx8aMyywl/USxmyyRH0H+w11VVXqt2Weyo?=
 =?us-ascii?Q?G6wMeWhJVqKPv1uErEg1NIYM0k48oOisRpDM61JQFi5Mn+fGLfiNTZbtW68G?=
 =?us-ascii?Q?N+zvKBcKYG7R18/FgpIL6cY9PeldxCG/lqiRdFUbKVbmXEJFzsUcdBEyQOBc?=
 =?us-ascii?Q?zvrG6YEcRL24GUeGqE8eStBRLQAYqN8ieH4VU6R7usGO/5TQxdtBjOP38Iik?=
 =?us-ascii?Q?nKemV+/cFSQBEuKZB4Pm1/um3j5T7+dh/Y0cDehKvuYBj27R/X4m5JdWbh5J?=
 =?us-ascii?Q?8PpnzxdtWM3bBpYhLssCzpWwgwzAERWveUSqj8EqX3r29hiAj6Zjb+IJQ0j0?=
 =?us-ascii?Q?CwcnHTjmpm6Il1WrTUe/l593cw7lgiw5rBKIKiKu8QxRtvdcaChItrw6Gphx?=
 =?us-ascii?Q?nbuZNOJAH1YZW0Tyt8ObEGouxJChsp1x1jS+hU3m6yojGTguwXM7c5aoa5Cu?=
 =?us-ascii?Q?pxrvzkXm0yzVG5ZetbH4q+onENayniICaVkllrcpvEuOMjukh1NUvheJusf4?=
 =?us-ascii?Q?PZ/J6I+NmwvAet9zVNAvAdtQaiaXxwfSPwakOC16fEVDWiEkO/MZpkEj6xOq?=
 =?us-ascii?Q?QCxhbOo5BRLXqgJ2BapZcPtBt7c8Bxf2G6IUrh6ysG9+T7/rXy68tqkMw9wm?=
 =?us-ascii?Q?7flr2+eRzW7wr7KMMJ2VetVI2wIY1xbMBRufmHCjlOmj7Egl1RHrkJ7AH5/l?=
 =?us-ascii?Q?7F1EZaQpBQ58Db1/7o+2kUUGvYl1EN7R3307p5SseYTZo1e04UZxpax7MrBl?=
 =?us-ascii?Q?UdPMX1RexRzy7ZY6b+Dy3bWvNMUFKHs82+TmsIzn94KP7hJBpQIkpVEgb0yY?=
 =?us-ascii?Q?pc8ixd5q5WdagSFho8c86zYmVtYOFLCuGxJCAoKXg3jXjeV6sk9GKX2QSnK0?=
 =?us-ascii?Q?ut4b1REYDyx+WDM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tpWub+MTqSTZaTo61xCa1x12rlnJHaUdZDTpEdY5rlDJiP8JjSTy151Jn1Uy?=
 =?us-ascii?Q?NdyiQO81o6sLnM0zcoDNk3E/OIg06oIqIF6PMtFM11HdWGi2YfgCWth3EG2e?=
 =?us-ascii?Q?A1U4+I0oOHS/UH+2uh2WEtzJ9COO+sp64ql8GDCNf7AUUb9mifum0xH7ccYb?=
 =?us-ascii?Q?verrEi/0GbcUqRDqjZ5Bbg2KB79XeIU2sTfHFlkGvIqcz8ObGKAqsQn/S34r?=
 =?us-ascii?Q?+tnjZv20GOsaG99BDHcNv/KJcA5cQ7c1gs5mP3ZLz31pl1wgtF8Vf/E1mtEO?=
 =?us-ascii?Q?53XjuTnzg4cSOxm2wzoLRJ1GHISgB8r48bP7FN3ccgLd0abGCYC4JxLI3oJf?=
 =?us-ascii?Q?/aqOXEMLQqJoCsewSQsPMUP8FX/EhNUHxvBmFpL3sKt6v8Or+ehhJ7iVVteu?=
 =?us-ascii?Q?7OD88pUJxMlb+YbpuNcQVN5QSwP3hnxEwPw007ullD9WE+d2KKuQp+xXATiL?=
 =?us-ascii?Q?RhPZwIdof8q4KbR07W6UmAsvjz+pmtWsMrAEaAlYDKDHDD+0CUfvGSPJZMNv?=
 =?us-ascii?Q?LtIoWE9+97vt4gz+j179yeUwFGQAxogAvuWcr35eq1/pSl90TZHg7uRik0O9?=
 =?us-ascii?Q?xLefuZfsK0gbxDaW9Ypvzy5b/8xjCCULK19SQT9g/7b5bFkB7BkCfKqYRKB7?=
 =?us-ascii?Q?lA1OcewFhVkBdDBSGY9MPFiERxw+ofwFsTkhR5FkgZy8J6vE+O3kA6raAP1d?=
 =?us-ascii?Q?a2U2rGI/vnKa6+Z7wBUfCJNkAqBjrAt+1h9KY8uBtEgrDqNlDSYuvStwOosa?=
 =?us-ascii?Q?Op80lvnHDq6ESQBtIxatNsg9sMOlJuiqCHKZwkTX/kgpe55Fioc6I0qTGFJo?=
 =?us-ascii?Q?yvV8gZBikqHqeyIUBoNLfudoT+i/QtCWTMm4ET9B0kskofMQqmgF1JfF+7e8?=
 =?us-ascii?Q?HE7U5G+cSS1MCYpQgtqWteMOp4eF0C5qlVMSs/g54sNdO/Fr967nyp/YI1e2?=
 =?us-ascii?Q?UQMVjvaK+JkxkA6PLhuR+XQIxbC43XkhYs9hh1cOcWUFYdPuqHE33A/pxTkJ?=
 =?us-ascii?Q?+5HrCHDWmIU6XrOlCfThv2V5WeD2pBcaw33ZvqzvdYJzGIS2FeXhNOO5vkff?=
 =?us-ascii?Q?P28GCapGHNz3ebs4QT/XL9JAKjKHg/PpI7F1i3ak/ifGAoyyQQGlswfgiUAH?=
 =?us-ascii?Q?awfRifQR22eOvlyjg0QGmS0nMJrCRshv6mMcpr75jMtD490Xz2bcMhjiXYQG?=
 =?us-ascii?Q?QWGR/iRdDQnPtH4ltcTOYeiHD3mtsHa6H4QnWPIMZ1y9lDH3G/CsuNM9MgRB?=
 =?us-ascii?Q?HITzdJi0Mt891psEN4eb3Zg/f6kpoeTpiOHG5J7gtm33Jg+6Cium4L877aul?=
 =?us-ascii?Q?bmGXkpz/x3pr4FDdnn/YiyIDusK6s49opOKUfIJQDtibBE7CI20cbHRGIBl1?=
 =?us-ascii?Q?TekdyZTIs2au3A9Rc2sXJosBDjxWtGzmS6Rl0e0cZNU0HT2sw8qEHVVuDnHQ?=
 =?us-ascii?Q?cJllNLjQd+9FbXht3lkn67pMGmk1KMFN+jGylI/YhuqeLtt/rjlxgp1PwMCQ?=
 =?us-ascii?Q?kGb6aUCtoupcLMbrM3GncISW2dUzpMOdikDz6+o3Cb6zultMkfio7mLjH6Iw?=
 =?us-ascii?Q?m3xMBmMe4vyAUs5MMmBPWUg6QqF1FDbvHRCSMi3d?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d81f585-6129-436f-ab30-08ddafc4aa5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 06:35:36.2421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DgqgjPqG0Vum6imOGKJWpnGiyZnjhTpQ6mCZliEDtLg0QnrASORny/QXj6lWfw6x7ucQXCYvpQofBYm8Ed9wYKeA6FkzBEqGea2U+LWPvMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5070
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
> From: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Sent: 20 June 2025 11:08
> To: igt-dev@lists.freedesktop.org
> Cc: Chauhan, Shekhar <shekhar.chauhan@intel.com>; Nikula, Jani
> <jani.nikula@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>; Roper,
> Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH i-g-t] lib/pciids: Add PCI IDs for xe2_hpg
>=20
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>=20
> As per updated Bspec, Sync PCI IDs for BMG.
>=20
> Aligns with kernel commit 9b779ff ("drm/xe/xe2_hpg: Add PCI IDs for
> xe2_hpg")
>=20

Change looks correct, but we do sync whole pciids.h with kernel pciiids.h, =
so we have only BMG change or whole file is synced?

Tejas
> Bspec: 68090
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Link: https://lore.kernel.org/r/20250605190804.1287289-2-
> dnyaneshwar.bhadane@intel.com
> ---
>  lib/pciids.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/pciids.h b/lib/pciids.h index d212848d0..86cd54764 10064=
4
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -853,7 +853,11 @@
>  	MACRO__(0xE211, ## __VA_ARGS__), \
>  	MACRO__(0xE212, ## __VA_ARGS__), \
>  	MACRO__(0xE215, ## __VA_ARGS__), \
> -	MACRO__(0xE216, ## __VA_ARGS__)
> +	MACRO__(0xE216, ## __VA_ARGS__), \
> +	MACRO__(0xE220, ## __VA_ARGS__), \
> +	MACRO__(0xE221, ## __VA_ARGS__), \
> +	MACRO__(0xE222, ## __VA_ARGS__), \
> +	MACRO__(0xE223, ## __VA_ARGS__)
>=20
>  /* PTL */
>  #define INTEL_PTL_IDS(MACRO__, ...) \
> --
> 2.25.1

