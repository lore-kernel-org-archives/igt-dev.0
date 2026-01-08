Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF99ACF6AB4
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 09:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972B410E6C8;
	Thu,  8 Jan 2026 09:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UwaOq7GF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7650A10E6C8
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 09:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767864907; x=1799400907;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GbVvi8DJv0BC1wwzM5gKlRcKDLQKPR3gDr0FnhlAqVo=;
 b=UwaOq7GFnOT4uKS59Qp9xFszeA79o1JmZC8PqhaX9WJwvK3S6y7OX2WD
 vgvkZaMfOiTuAx6BSRP2tLXsI1XOFaLc2z1O6PyWlMJdqyTjyY3bqOMYJ
 Cl5mtuz6qQjEm5112rurMEszwgNIGf9zy5/mhg7Yl9KjyXh9X1p1X/dVh
 o4ojvKwQT58Lw5sqjR2aHg+Lxe1A4/YCr8KfUcOotmfQQ6H10jWfS3ist
 MxGJ0LRA0T1A6QXUEWmROrUPMHDZLv6hxcG3U/MCupnW5U64zW5NBJ1WG
 ykkBGbZ205Jsg/v2WO2Yb0r6GazmkfVZoOxEYwoKNxkhZJUW8dsvY9plg A==;
X-CSE-ConnectionGUID: +vEOUeaXQSSCDT5MAEhXyw==
X-CSE-MsgGUID: R8HfZ3wMTgi0mHanBcgjiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69288917"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="69288917"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:35:07 -0800
X-CSE-ConnectionGUID: 5bIhAbIsQ1qzu6/5xEjseQ==
X-CSE-MsgGUID: u4e1AtPIR3u/36iQ0T+UUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="233865010"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:35:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 01:35:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 01:35:06 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 01:35:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ht7423y9qhSJz6DhI/cbiTnFhnwjiNy9gqJ5Dy2emc0J/M9SUNO5U4pL+5ptQ8DwiHgMZDUdhtK0KgPecC8iWRdBByEwVQrHfr+bqtPzMRSQmUg2eAisLWXQ2G6UhzmoTmyyQF4WFWDgWxgvCjGwcl+cI9wJg1l/z2XFFrK+/e4S3tWPMnXVdaoLc9UEtEO6S4YccwoePxADJrdokngKIslStSJd1AMZ45jLLtVJvDUTReuhkJ9FOOVxKURyxMeAv//YhxzvAz1zAlqQRXHH3BqC3dzSBEnMNUdwq2LDJBqSWht1pbiC8F56R56gU8gOdvchpMI7fQsjugLFPYHjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEyXRYgyr/1OQgvYYSnHfIF9IQ3MehpTjGjfQbNEWZY=;
 b=sYdirg75UIqlU7Y0rkt4kWHzK41A65kBiOuKrXldKtA7XSmMZvdFLU9VFj910BFB0Ge/F7FjOJOgqTy5Aw0UDP/xR5gRiyvZWoJC5OGKU3c6HU2niicDlPJsaoNneFlFcrgPIKo0X34n+8HwgQ6cPox2OhJQj42FPMx2n760FFsz5jAqJpup3OCmcKoUZBBJ/NmUE2sivGGoxb2G1d5O6s8z0g4XQINmqPJfiRiiDpHS/vFfcqp1Ib9Xdaxz4dMv5xKqIfIU/QetjA1NigS7BcylfBlyKPXSXX9UDTMmnghFzYTKg2/p3AcjdNIgQqkz4BOoyRH0KJBfhW1NiUW5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DS7PR11MB7807.namprd11.prod.outlook.com (2603:10b6:8:e3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Thu, 8 Jan 2026 09:35:04 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 09:35:04 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v4 3/6] tests/kms_writeback: Add intel specific check
Thread-Topic: [PATCH i-g-t v4 3/6] tests/kms_writeback: Add intel specific
 check
Thread-Index: AQHcZDa3mlNMoTFAHEmwTsdvWqLRE7VH8+cAgABHltA=
Date: Thu, 8 Jan 2026 09:35:04 +0000
Message-ID: <PH7PR11MB6796D77042B3D85D2D1E9039E585A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
 <20251203094307.3187669-4-sowmiya.s@intel.com>
 <DM3PPF208195D8D0E7D1CB98C5CFA848B57E385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D0E7D1CB98C5CFA848B57E385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DS7PR11MB7807:EE_
x-ms-office365-filtering-correlation-id: 87a3603b-4b78-48f0-6474-08de4e9933f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?iH96x/sbZsr4o0SX3l4xmyitqlQYYK8ONQncyKuVH64Vl8FSNKKmgTyA8yD5?=
 =?us-ascii?Q?Ql4zy/xLiSbk05gZlsT7bcq+2lPG1PvOFDv1tGj7s7AhVZyROEsAFT3HYq6g?=
 =?us-ascii?Q?wQ0YXdG6VFkTnHCkq0ZN8NHvBDL+vnik55OlD3XYV2Ge3WbAlHWkn2CslsbL?=
 =?us-ascii?Q?yqLp1C6zBsomDPfreRiAoMwOYA6U/nx8qNSwTPhMChuWmCxbbTDfwrEX26GG?=
 =?us-ascii?Q?UL/OEIxHAP0qMFLOVJhNZb/dXiMZZRqHxRWxHnzhPm9oU1sJTRe13kkrkmxe?=
 =?us-ascii?Q?/MNMRH9IgYBVBGQWXbaoaD1CNtoRn3Q2SErhUPuXZqQ8GnBzBoiVBY/fjvv7?=
 =?us-ascii?Q?kyigfmpHnoin9q+5T1D8G49jKUJIC7M8Hs34xwQn2DnLWbMylLoJIHPiI+hh?=
 =?us-ascii?Q?2eKox3APWq4e+kaoGKIGK9zHFwTpUZO2TXCpnZsh3nsxKQAZA2ZgraXNd7iv?=
 =?us-ascii?Q?QX61jsB0NZZ3rtxHMAryG93toJdHMhq3M8+1jvGjGcGAn5FXivSCHqvUda6U?=
 =?us-ascii?Q?JtkOHHnWmm0fry0Opk8HaJixulXowXpsAchSZjflh/jQErLA9JG13ni+L1jk?=
 =?us-ascii?Q?NwVnD9Rd+BzE/9u65855i5IjwFZBRK2RUBxHrad+FCW8tdQwgcyNcEXdluHa?=
 =?us-ascii?Q?7lXMQGN2VtKo3nn57ZzidoLQKihMe2Pzaw/vGD3nRkE2P5dODV4x+uW9MVLC?=
 =?us-ascii?Q?UFnb2UTpMumQWwQuqdnRO0EbgzEzymKgXpOslYYtAPcJ/R+6fzS5smotm5iG?=
 =?us-ascii?Q?my2mUHhWQVG/CC2MvhaD08O3FGBOrbcWVf/FW68WL7WOcQqNiA5QqffHdhaE?=
 =?us-ascii?Q?gvkMBMqpp4hfb3mQWNg+U2kJiEYinYowuPOkpILbDckXP5w+dkGCrXhAmbl8?=
 =?us-ascii?Q?alpN213IMaUEWmS4T2qISrJ19MJRexcfAMw9qMC1VEFOXSC8fDrMBsHg8Soa?=
 =?us-ascii?Q?vdMV46DLlqgRgo+dtCwWjwrrYSpI3F31ctbl1IItWnoJrt1ZJdECkLp9E5A3?=
 =?us-ascii?Q?ZbYR2P0om5VKrCTGld1mWIbDZfGjH3LI6DDvn8Uibc6lHflIYjpNZFKGn9rG?=
 =?us-ascii?Q?P5hzIFYo8grhWRRfksRPFDvOp6A9qEH7Noyb1EnyJDUF16nPPTBXRzYl2XXS?=
 =?us-ascii?Q?ByIujPlnya9vSBSGew6ChYwnQqFjxcgfKDx0OJGyd328+aPz9EOSBp6CwHYu?=
 =?us-ascii?Q?n92Y2bD7f0jps5Dp+BWCC3/3e4NP+D+7HHaFLdzNDPgLGtng9prf/ufLmvGZ?=
 =?us-ascii?Q?sc+VVvYSvksCO8HF5a2Pa1VHmqISYhndywC7vZywooapkvjfAb3iitY3uGkS?=
 =?us-ascii?Q?bTQg12h+jP7nsVnHlK1YvxPoZL+umOdwLYlnZgyZgCUNw2Aayn+zwRSrOw6t?=
 =?us-ascii?Q?VFO1Q7R9OHNiji0apNckzZmJ1mSw5tbfpvaCvlnp+vQk46l3tG/f+4JMEL0A?=
 =?us-ascii?Q?w14VGGhcXT8jsxl+jafXANcs54NVhix16xdzDdCAhG3+MhEMNT67M+w1J6rc?=
 =?us-ascii?Q?Whn5mvIGVe0Kw6WyvDoEb5i8OOPYHCSbpzEG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4vUGZqzitCAiakRXTFv9npYcokHU1Wb9NBCAIOBZ4OkAQBGiZdPLiMTX6tiw?=
 =?us-ascii?Q?FhHLoiwkzMc9h3X+ofluumFY16Fg81l4fiqsvxBB0rGiFd2c6x6RywjXoR0y?=
 =?us-ascii?Q?qOvNV5qlKRlKI6Tta8emRVX5Dv0YRZw2wsgX9CgjoVOTSOMwQEWg6VO6Hovw?=
 =?us-ascii?Q?96RNFuiIKu1O1sHMhe08bqgir8BbVxgch/tIR2nV1kTiHH326LV+a+otNcDr?=
 =?us-ascii?Q?GLJ/pmUcHwn3aPnbUmrFvrCVbwn49/jDAx37yr98ufexqaEdjyDb1EhcqGwe?=
 =?us-ascii?Q?/LwKTU5pVTk41WriBQRtiA3OD95eehYXrdRHT7XMNKj3AeKK7ayJ/bOnKvkO?=
 =?us-ascii?Q?19ffxm02erwYrkYdsmXUuh/gt/J2er64tcIgxUtHahG4IVlp1GfXirfhJl/B?=
 =?us-ascii?Q?W7/BuMND7MzS/V1+lOB31EY4evgAqclNcjWRQA5oyW/rcSW0OmcMIB2VU+WY?=
 =?us-ascii?Q?pf1en9zsO+u4AjLjjGSJg8OLvm5tv9hne5Unv3WXvftPJKVsYt30ctKxoQfE?=
 =?us-ascii?Q?eggYLojGJEFwDi/yUrM91ikmQ6GuVp9PgMApjyibi6AHQYJrouEqWENuMO8x?=
 =?us-ascii?Q?A2ZOPI84XJkXsoTzyatCLOfzt5y/xy4yQ34Z0d98zF9BykuD1+HJ2E7MXpwr?=
 =?us-ascii?Q?OyMlA3/EiQe4KDqWeuH8YA30Ql6d7BLgos29pck0Yg9wqz4cN4PIetWpcUGv?=
 =?us-ascii?Q?DzcjjXDwXJ/qX2aWTYwbJDAlEAPOl8I7C+ONQ/o/G1+dvb7rjmW+L5uBqbzn?=
 =?us-ascii?Q?vk7uovonTishlF3LDuQLQ9xFeOdb6ZQGiWdZ4JsP/F+dl4LnAAiWKiFNf1Sr?=
 =?us-ascii?Q?vzuTg78nMdCMr8j7IM9NM8Bbgva8MZf7ss62mR7bIpioaCCZqAg+xAVdms49?=
 =?us-ascii?Q?5UxLyXN8PPD3FYbdEWArgYPY+AsXI6pS3qAenMts03F35JBzIEpk3Xs2QJlq?=
 =?us-ascii?Q?934lDLeLVSgcDlRjExjsw26oKbCFserFGXkGcnimstfUCXuLm0xNA983Yy3W?=
 =?us-ascii?Q?kt/0vEnQgLwoynL/j0ZmmridWQ8iS9eb5mX4H3oMJ3oPnlwzVERvLLHCorWe?=
 =?us-ascii?Q?vfCuZbOzltXc0hMUxGm8vPT+wHtjZECttWDdykqCPY1s/TucTuQ+G+fTNUAD?=
 =?us-ascii?Q?sRUGyjDokc4/TrXO9c99EnXafuxwoedb1e7pn39K0bL4WFiuSh/6r32ABaZt?=
 =?us-ascii?Q?arKZ1lprlnuAUmP6TjuNZXL4SIszpqZpikeVB++Y9jLITL2UuajEE8OQICUv?=
 =?us-ascii?Q?H3FfnZ93mLrz1/xAtEEEwGVLct+iyCmAi+yulBKDUmUOC+/1iMa2Z1BLHCsN?=
 =?us-ascii?Q?JKwEARA5on8noj/gNRJIJSwKyS69bjsuHidU+u0n1YbumK/4uT8EGgZLI1dF?=
 =?us-ascii?Q?5cQ8LkvIaoEbn7+Qtul8RdK1zeua25QtS0uZC8K7vmn39ljiPXbBWS5hsxW1?=
 =?us-ascii?Q?cgx19icZWqXD5Pqwoevhp1IBUXVuuJXPgZBk8OOz5R03N8MGPGpMxSmCoabc?=
 =?us-ascii?Q?BhYOQCIXIIiEC3/NpsyJeT7oMXWseH3ECiludZrvo/ywxx1kVR4Ie4d35eEV?=
 =?us-ascii?Q?EwQ2Qm/v/VsGB9jiUECCEvcRTBR5wz71FNrNU/Rz3nKdx/Nq72/HXpz24dMg?=
 =?us-ascii?Q?pjWEaKuTYYUKR8MpLrqHKoYbiVTIrCXV7tG/56jYtwY7kyU43A6qYCGWaigw?=
 =?us-ascii?Q?azJx4Ohd5kuJmrUlr6dyi7rYdM9JBTtNOeEF6/xjL9p4pjAi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a3603b-4b78-48f0-6474-08de4e9933f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 09:35:04.1836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6+AuWLJrsdfD/Z0VLlAsk0zi5ul4Lf+RX5eWuBN4wTqYOOBoReJPDGyXQ5mAT2tX8eBUx61CsjpKY2zir1WOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7807
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

Hi Suraj,

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 08 January 2026 10:48
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v4 3/6] tests/kms_writeback: Add intel specific=
 check
>=20
> > Subject: [PATCH i-g-t v4 3/6] tests/kms_writeback: Add intel specific
> > check
> >
> > Add intel checks for platform specific execution.
>=20
> Add why the commit subject and message does not explain why this change i=
s
> needed
>=20
> Regards,
> Suraj Kandpal
>=20
Sure, will add it in more descriptive way.

Regards,
Sowmiya S
> >
> > v4: Restore drm_fd added in struct and access it from
> >     igt_display_t struct
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 15917d2e1..473f6c58c 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -290,7 +290,7 @@ static void writeback_fb_id(igt_output_t *output,
> > igt_fb_t *valid_fb, igt_fb_t *
> >
> >  	/* Zero WRITEBACK_FB_ID */
> >  	ret =3D do_writeback_test(output, 0, NULL, false);
> > -	igt_assert_eq(ret, 0);
> > +	igt_assert_eq(ret, is_intel_device(output->display->drm_fd) ?
> > +-EINVAL
> > +: 0);
> >
> >  	/* Valid output buffer */
> >  	ret =3D do_writeback_test(output, valid_fb->fb_id, NULL, false); @@ -
> > 405,7 +405,8 @@ static void writeback_check_output(igt_output_t
> > *output, igt_plane_t *plane,
> >
> >  	/* Two commits, the second with no writeback */
> >  	out_fbs[0] =3D output_fb;
> > -	writeback_sequence(output, plane, input_fb, out_fbs, 2,
> > fourcc_color);
> > +	if (!is_intel_device(output->display->drm_fd))
> > +		writeback_sequence(output, plane, input_fb, out_fbs, 2,
> > +fourcc_color);
> >
> >  	/* Two commits, both with writeback */
> >  	out_fbs[1] =3D output_fb;
> > --
> > 2.43.0

