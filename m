Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5EEC3ABAC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 08:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB96510E1E1;
	Tue,  6 May 2025 08:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtKRET2z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F240F10E1E1
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746520272; x=1778056272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=36tJJXP7sRTUx9fs9IAmXLyRQlNGr1A1PSXdpAp1Kks=;
 b=AtKRET2zGoGciugfMrnTWKf3iqEbydYjmUoR/8THCtEE+OsCAKx7NswP
 fRbvBU+5SHzXt2nQaVrcCTLd8BeKXhB3o+jIhFgJRG1Hy8kpatlvI6Q/o
 b2CQrRdtyAtTs5n2b9Tp7QABX0jV4IjfoeUz/ImjZFHnRHJNJ9rrB1PE/
 fpCjaHxdslTPLdleV+HmNGXepuWON0F30VlBvK9NjIXIwDoXNlf9Yvid+
 73Zo8bwh/w1CEWsbCVC+SeBVhK9GMBkofnieuzwGDgFTVJHIMxY6rQY2h
 zGCeUVQ2CCGOjM+11DBrswIYliR4rm1ADahP3TnO7V26i9GTUUyJfdgYq A==;
X-CSE-ConnectionGUID: 2JLe8A7CQxKrZHpRWR1dJg==
X-CSE-MsgGUID: K2AFSjsAROWfmepty3HWAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48321200"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="48321200"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 01:31:12 -0700
X-CSE-ConnectionGUID: 56tPaazPTWGXG87famTbCQ==
X-CSE-MsgGUID: pjMZTE5HSRmFj/dgCDoVJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="136489441"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 01:31:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 01:31:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 01:31:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 01:31:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kq5PI5VTN0n5Q1i4AJupesNsluRxTBDQLMA1eVfXkfQF2a0n2IJCwLmQnNaZGLz+GcCjzLMyRd29UKDkk1lyciD+58oNGnqsollKayLH7qMJAf2vBYQ/jysct2k/x7GWk8FRW0RLK132AAuw2GbcpZda3INDMQRkvs7TjAhrZBHtzu20B0FIzBRBh4uwghj9BUeVNwRWY4AOXnCbr2OAjEDXNpAwCrr+C1ahQp9Fg8gzLCXGyg555Wo7vfAPQBk3wEK4+QMAVLQILLgtn6M4cebNpRGJ56p7kINbRFbdpUdm9I7Rc5/jO+v+9jIGjVn99+mwEuOXrWCwEMlk5ZKCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pU2XAtjX+FXXbX0F2OhwQOz0g065GMW0KYcngXwNpY8=;
 b=AM1YEgnDn2Ewf6kMBWeYvC49R6bet9yI1kF6RepWxMbDHMw0TM4zJONhNkAV8c+zgLK3X6omPqvDhiXAEXmOpoaBIgA18SoSiDDehbtsEI7wIrwou7O/cuyqGkobncIaDRfn2wykOjrbeVJhT6dozra6IeNC2BUble0ZRgVI6f3QGpmvTncK2Yw5GBNfcN+g4C7yrDm1L0chH+UwTEKJg/s4GSnZlGFLzX6Wgf3lSw0h7O6jwWPsEsBZ1Zf7FzV6owmPc4+OWXc+Ovblwfp4F3+rpq3sA+XBqzpdjTJuglmP5Wsj3lKNZPMWKbvURGgUYKr/iq26prJ9/ROrp7sh7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 6 May
 2025 08:30:48 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%4]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 08:30:48 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST
 bandwidth constraints
Thread-Topic: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST
 bandwidth constraints
Thread-Index: AQHbvdZLLznqoHxcNk2Ae5YmztUm8rPEb8qQ
Date: Tue, 6 May 2025 08:30:47 +0000
Message-ID: <PH0PR11MB48068DB52701CA4527373D44E4892@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250505161217.484268-1-jeevan.b@intel.com>
In-Reply-To: <20250505161217.484268-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|SA1PR11MB6663:EE_
x-ms-office365-filtering-correlation-id: fe21391b-71dd-4200-02f7-08dd8c784d7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tgOjXznLUU0e8tyGMnTR/Y6Gf816v2MYUXs2cW4Amp4C4nk0hWZd1/e/X5Mh?=
 =?us-ascii?Q?CIQiFFpRnTuWZ7o8jKL6SeTzZ5pwhqlTsSSLB1tST9eDA0prRb1ftWFPYklK?=
 =?us-ascii?Q?NAXk/ZP72CzW69glv7/vxvDD+REKarkP3LaNceK0c51zxXPfrGTh/g7oDkne?=
 =?us-ascii?Q?WJYzxKv3d/LqEbOAA7VXL5R3tEUtOQef685fV+sSNpQJsyTCfZwvVaoscB8X?=
 =?us-ascii?Q?t3NAZG4MxFO3j0HLkHi+W7OAg4WgabQALHZv8jFN7m1K+SAZNZVheLyXlsZz?=
 =?us-ascii?Q?g4ESL2Aw5byEr46vd8Y8iBqFJDocLtZVdIjneYPq/y7znzB9uqCj72Lx5qEr?=
 =?us-ascii?Q?l31xb3HwxuDMoMDSe7c4bLw/poZ8RAHb780EGUPHCiHeZjxZ/6F+4CTDpQ9W?=
 =?us-ascii?Q?6nusO/LSKUvJXPfH9jRLOelpRtCfXjEMEvtf6z2kXzY8r7mNkPcll+EV7blc?=
 =?us-ascii?Q?nXsmXSn3z8E4dFwuH07pOru45LobFVCjeRdNUZKJH9W4rwxEmlheZDzPFljk?=
 =?us-ascii?Q?fx0hyzdOneSBw7eq2Dr4KX3dmiIERSG6rFQukNO8roqTN6WZ8naMWJzrjYWN?=
 =?us-ascii?Q?mTLH8B3L9XjbGNUe0f+b/vUHi8KLBVS77n/NnVGNTPOawgbwxykm9ufSmYjY?=
 =?us-ascii?Q?u1W+cVZ7vpQez12wtEssMYinsWZP+P7GMnuQ+LzlycA70Am1baBXwqMZVmRm?=
 =?us-ascii?Q?+NjOkG2Fb8xwmCEhuXSpmzm8FFndJHwvEPJGFjIJX7oEkBaxV5Q5x5JOQKgo?=
 =?us-ascii?Q?GA/w5o2cLBC+bogeU0oh7SVluuS9ZsjogNSArMneBVqOQNtwjy7GZSf7+g01?=
 =?us-ascii?Q?CQL5UXhsQXGhjcmxh3iOlIMAEQWdtPYamr5lP0aqrUbcZI3XwgVjxfCmlBW5?=
 =?us-ascii?Q?K4nQTMSQ0B+0XE0SxpPV2vnGq9to4vYFLfG1YiDfNnDeZz3OTnB5ujk9iu2r?=
 =?us-ascii?Q?CuFrncAhCegP+fHGHki1JBpI6ma7E0rUFcQbSHTJ1VEVM4k3vdqK2A0woRDj?=
 =?us-ascii?Q?JRn8g1o5TajhghShijw/InBee/3LzA0zpkTG5R80CkvD9/RROThfK1LsahHn?=
 =?us-ascii?Q?6I+O/g9intfI6f6/jhcgSawvHAtQ/QTYxTxKHSw1E8UhKdB4Db+gsXEcMIKH?=
 =?us-ascii?Q?dDeAuQBKr49565FxqAH/v3j7Wh7bYPqsLPSOoaT0eH0GPPndGaDlr0fJO/i1?=
 =?us-ascii?Q?rTRLklSUd7T1OtSIdkDmC+qURAe9HGgRU41UtrF3g7EJlipAWWzvLrJSUGc6?=
 =?us-ascii?Q?PkOwapZThi44ofRupVG17ZrtNgXBlPacdHmqwO9U9MIw4aokm2kiuhYwk7cB?=
 =?us-ascii?Q?TnlgFPC+KJpHqZRpgivIK9X+cCW3rexSUjNJaE66WaKhQrQ8rCePpP6WN0Cl?=
 =?us-ascii?Q?m8CxjnZGxjUeC8Ey721+VlVyhgAX14UW9xOnkBVPDLsOD5TsNs86zF7fSkHt?=
 =?us-ascii?Q?CwDvV5XRx+E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1kzJK2ZtBHsNmDPfm5aade1H9c+kek/37sdL0AhNfZlPC75QkiPdFGLO4WNn?=
 =?us-ascii?Q?lKpp4U3NlmRYDx6+u9Sga+1xkFowXkZsomW/Um88lSTtqQZ7uwoVVYO3HQRf?=
 =?us-ascii?Q?Zkz6SFYw5CMAVVKnL/tiEARUxavcfnhe1ofwb1e2njjRIOSvOOvxcsbz4HqF?=
 =?us-ascii?Q?RnNDpk7DTSU3cOKrGcLlfWjripzEvYvLl5TGHeqioLWZn4LXHuo5jtKHC0Xl?=
 =?us-ascii?Q?DRrvROwVDC5hO0LxUK73SLz56zhVkJ1cE9zTj4tQdH4eTmeQKCbMaQHxaeaa?=
 =?us-ascii?Q?WnsPYKcHppK5MEalIvOV5QuDnAQSQdwsOwBo8XrDMwqP38xhYOqeMd5ZbCM1?=
 =?us-ascii?Q?8EhLrgXfr8NQzjeH/bBYzt5UKHSwoSkeg0a9N+0xkzOrEK15RkyBA4VySTl1?=
 =?us-ascii?Q?Z1HKIpq1vvBxHoQAOZvkZPyJM2sebbVxmj9m4D1upo96rVtMO3UuAfVd+M7E?=
 =?us-ascii?Q?dKM5xDnoSvE/JuzC6vzzEACRSEwREb2pc9oWIMN7efKwtpMQOuEukgOUBF6+?=
 =?us-ascii?Q?2TxDQrwLZL71bnEROr/9sMd4HKjG/NfR2lro7wsdtpeJlP8Y4AfcSv5/x6aH?=
 =?us-ascii?Q?xGh4GkqxZGq7l+OJcDlV20/3lLkr5IcmeaOZTsoBBzVH0BoYPzq6bFC/+Pg/?=
 =?us-ascii?Q?AudoV6b9KEB4cJcqtvt13u3VpP8b8ewiKYdP0l2IiNLbAI0tI4KioIMp9s/L?=
 =?us-ascii?Q?kv5f+MTgYftrCAslH1cGvBI96vS+jfe3sselbDag2TuIstYzJMbcFD64fnpv?=
 =?us-ascii?Q?RGYkEBCMIE191sfJY3IVQkMiLfBgaMIMKAD2pn5VcYJKh6hTf3ycHy7Mzpmo?=
 =?us-ascii?Q?VbB0Ax5XeJj5IEtTup3xB+lsEaYrcPs8U+2ri9QDunf9fb2hr3Ckbq1cgsYt?=
 =?us-ascii?Q?5HoO6OncVZOhJyFPaMQabRL/W50ScyXS7FP3bZVTXMYtT19wxlI3Z7EQs1Km?=
 =?us-ascii?Q?Q2IDwSAKrGhCezQ2yiUyP1KxoVCtsV9dv/SM/1ury3Rm5uGuzVsn5wnK6YMy?=
 =?us-ascii?Q?fxmDFumeqXzWfYx7SGLnowj26swkk9Ce6vw0dc6iP7CG6Duu4gCAMe7lK/uC?=
 =?us-ascii?Q?6sovLvkGRaR3AS7bdnizcDNUTXFo2jV/NBMecJF6RvpKdS2xijTW20I3o7Kx?=
 =?us-ascii?Q?KIYdj+9rKTEEXLSlMY7kvlI7rTi1uNf5uxibxHkdZuTW+Rrei5kksdN8sd36?=
 =?us-ascii?Q?g0OfLUAcjvI4cW6jVymIlZyUaZ+FrHFSjrTDJXJ0Qzw7XWxW4te3QaUhW8PJ?=
 =?us-ascii?Q?wGy1neUvpiT7edndivqGxrFK3ZPW0TXFWkWhNQUcf9CLlWIp5UftRhFZjGh6?=
 =?us-ascii?Q?rLAbD4N2Zj+iqrjPubc2M5XwDU+rSfeRc05Yy0j2/fCv+LXjdwrUwONemLGu?=
 =?us-ascii?Q?kM76gYt0juW0PKukHD7MpyqYV/IdA0N3+jFb46tRZ38TP4KQ9kFVwLxHQsj9?=
 =?us-ascii?Q?1Z7bfSJJFfijDBQY1cmoLW/djpej8NxwiqVaJ9FtICs1Q89SY+bduxv1fR/F?=
 =?us-ascii?Q?x0r9ayQlwSZ4NsyejIpH46/khDMG9Y4swcNlOyxWVho7pLCsSf6ek66OziT2?=
 =?us-ascii?Q?qg/hUIPYGIrSgz9SEbX5u4HO/PirG2VwyoVS4Y4ZNuuTo2UzHkftzCV+k2pM?=
 =?us-ascii?Q?CQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe21391b-71dd-4200-02f7-08dd8c784d7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 08:30:47.9996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Y8qTfG+wmDxa6BcPEEfN7fhkTnd7CB0MB5yZH6L+mH1KTNA/G21nOt08ZnQwltPKzmH9ifAwrdOLLfOsk0oTpAP7FbJOx5I7SNaYUHzHA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
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

LGTM.
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

-----Original Message-----
From: B, Jeevan <jeevan.b@intel.com>=20
Sent: Monday, May 5, 2025 9:42 PM
To: igt-dev@lists.freedesktop.org
Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Thasleem, M=
ohammed <mohammed.thasleem@intel.com>; B, Jeevan <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST bandwi=
dth constraints

Instead of checking only the current modes, find a combination of modes in =
the MST topology that can be accommodated within the available link bandwid=
th.

v2: move fit_modes_in_bw to lib/igt_kms
v3: update tag from fixes to closes
v4: remove igt_assert from fit_modes_in_bw call.
v5: update function name with 'igt_*'.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1542
Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c                           | 30 +++++++++++++++++++++++++
 lib/igt_kms.h                           |  1 +
 tests/intel/kms_dp_link_training.c      | 24 +-------------------
 tests/intel/kms_dp_linktrain_fallback.c | 18 +--------------
 tests/kms_display_modes.c               |  4 ++++
 5 files changed, 37 insertions(+), 40 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c index f3bc481f2..9ee03e870 10064=
4
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5046,6 +5046,36 @@ bool igt_override_all_active_output_modes_to_fit_bw(=
igt_display_t *display)
 	return __override_all_active_output_modes_to_fit_bw(display, outputs, n_o=
utputs, 0);  }
=20
+/*
+ * igt_fit_modes_in_bw :
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * Tries atomic TEST_ONLY commit; if it fails, overrides
+ * output modes to fit bandwidth.
+ *
+ * Returns: true if a valid mode combination is found or the commit=20
+succeeds,
+ * false otherwise.
+ */
+bool igt_fit_modes_in_bw(igt_display_t *display) {
+	int ret;
+
+	ret =3D igt_display_try_commit_atomic(display,
+					    DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (ret !=3D 0) {
+		bool found;
+
+		found =3D igt_override_all_active_output_modes_to_fit_bw(display);
+		if (!found) {
+			igt_debug("No valid mode combo found for modeset\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
 /**
  * igt_pipe_refresh:
  * @display: a pointer to an #igt_display_t structure diff --git a/lib/igt=
_kms.h b/lib/igt_kms.h index 0381c82ad..a85fee515 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1226,6 +1226,7 @@ void igt_require_pipe(igt_display_t *display,  void i=
gt_dump_connectors_fd(int drmfd);  void igt_dump_crtcs_fd(int drmfd);  bool=
 igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
+bool igt_fit_modes_in_bw(igt_display_t *display);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);  unsig=
ned int igt_get_output_max_bpc(int drmfd, char *connector_name);  unsigned =
int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe); diff --git a/tests=
/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 9e9b1e6db..fb9b42608 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -140,28 +140,6 @@ static void setup_planes_fbs(data_t *data, igt_output_=
t *outs[],
 	}
 }
=20
-/*
- * fit_modes_in_bw - Tries atomic TEST_ONLY commit; if it fails, overrides
- * output modes to fit bandwidth.
- */
-static bool fit_modes_in_bw(data_t *data) -{
-	int ret;
-
-	ret =3D igt_display_try_commit_atomic(&data->display,
-					    DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET,
-					    NULL);
-	if (ret !=3D 0) {
-		bool found;
-
-		found =3D igt_override_all_active_output_modes_to_fit_bw(&data->display)=
;
-		igt_require_f(found, "No valid mode combo found for modeset\n");
-	}
-
-	return true;
-}
-
 static void do_modeset(data_t *data, bool mst)  {
 	uint32_t master_pipes_mask =3D 0;
@@ -204,7 +182,7 @@ static void do_modeset(data_t *data, bool mst)
 						  "Unable to assign pipes for outputs\n");
=20
 	setup_planes_fbs(data, outs, out_count, modes, fbs, planes);
-	fit_modes_in_bw(data);
+	igt_assert_f(igt_fit_modes_in_bw(&data->display), "Unable to fit modes=20
+in bw\n");
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);  }
=20
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_l=
inktrain_fallback.c
index 6a872efd2..f8ef0cac4 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -151,22 +151,6 @@ static void set_connector_link_status_good(data_t *dat=
a, igt_output_t *outputs[]
 							  DRM_MODE_LINK_STATUS_GOOD);
 }
=20
-static bool fit_modes_in_bw(data_t *data) -{
-	bool found;
-	int ret;
-
-	ret =3D igt_display_try_commit_atomic(&data->display,
-					    DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	if (ret !=3D 0) {
-		found =3D igt_override_all_active_output_modes_to_fit_bw(&data->display)=
;
-		igt_require_f(found,
-			      "No valid mode combo found for modeset\n");
-	}
-	return true;
-}
-
 static bool validate_modeset_for_outputs(data_t *data,
 					igt_output_t *outputs[],
 					int *output_count,
@@ -176,7 +160,7 @@ static bool validate_modeset_for_outputs(data_t *data, =
 {
 	igt_require_f(*output_count > 0, "Require at least 1 output\n");
 	setup_pipe_on_outputs(data, outputs, output_count);
-	igt_assert_f(fit_modes_in_bw(data), "Unable to fit modes in bw\n");
+	igt_assert_f(igt_fit_modes_in_bw(&data->display), "Unable to fit modes=20
+in bw\n");
 	setup_modeset_on_outputs(data, outputs,
 				 output_count,
 				 mode, fb, primary);
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c index d5=
3b83a86..c93195b3c 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -93,6 +93,8 @@ static void run_extendedmode_basic(data_t *data,
 	mode[0] =3D igt_output_get_mode(output1);
 	mode[1] =3D igt_output_get_mode(output2);
=20
+	igt_assert_f(igt_fit_modes_in_bw(display), "Unable to fit modes in=20
+bw\n");
+
 	pipe_crc[0] =3D igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE=
_AUTO);
 	pipe_crc[1] =3D igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE=
_AUTO);
=20
@@ -138,6 +140,7 @@ static void run_extendedmode_basic(data_t *data,
 	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
=20
+	igt_assert_f(igt_fit_modes_in_bw(display), "Unable to fit modes in=20
+bw\n");
 	igt_display_commit2(display, COMMIT_ATOMIC);
=20
 	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]); @@ -158,6 +161,7 @@ stati=
c void run_extendedmode_basic(data_t *data,
 			  DRM_PLANE_TYPE_PRIMARY), NULL);
 	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
 			  DRM_PLANE_TYPE_PRIMARY), NULL);
+	igt_assert_f(igt_fit_modes_in_bw(display), "Unable to fit modes in=20
+bw\n");
 	igt_display_commit2(display, COMMIT_ATOMIC);
=20
 	/*Compare CRC*/
--
2.25.1

