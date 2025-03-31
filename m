Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0A7C3600C
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 09:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034D810E3B8;
	Mon, 31 Mar 2025 09:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftvsNMPy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D3F10E3B8
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 09:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743414561; x=1774950561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LQ2OubIYooR+o8+DXI6PGigVEkFLu5fqQOEKoiD7IWk=;
 b=ftvsNMPyIOCr8ngjNU0R0cj6CjFTK2X4FczBbxa+1tM/TmRMpZJUtGRB
 EM/OUPOHJB/o+xri0BnbpDHiDgnldRwXBppIQm3mwxlaYdiRFWGTM+etS
 gE5y0RknLHbwSrsANJkfbk1y8fueafyTkIqjFjyXPfczwHomwEmOShi6W
 L/dYiYuUG59NiYHHJkuA14kxvTMuQQuJPxjbmzSYkq8olWp3pc3eLDZ6F
 +rHZ3gKY2n1LBdjw8+XWIzkDkWLnHVQ7+vbr0aljYSw9Wfia0xNJDEGQr
 HRk9iqvh5Yr5SvqaG+PzZVrObd2U6jrkUkTCBtKFhX026I7blFdYZcXbM A==;
X-CSE-ConnectionGUID: mc96+bZXTEu8UXGgEk+9yw==
X-CSE-MsgGUID: kC+X2vBwRJOt9stCRTr6jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="56068675"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="56068675"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 02:49:05 -0700
X-CSE-ConnectionGUID: 3vhDCKlUQa6p5zezj0P/Tw==
X-CSE-MsgGUID: a4U1DMM0RvaBeyfqiOjtkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130886449"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 02:49:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 02:49:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 02:49:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 02:49:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xB0R3MUDryMuf4t/jbpTjnCMAWyWHtKI3q23573MWTfyd1chsrQ3yQBbkO/v2rx7/XN0P2tyrdz0a/afBBGuZGWW8xUiV+xjgvOJi+sI4lxE1DzlWC3S6K3N0s7jAcKbrBtlVmJKfDKggtidTYY/rhm4XQ4b9tiJ272IM/wxouaI/JxvjOvO/JByn6tILeAPxuxWyeax0sBdV8v5Wv9QB8vbRq0BpEGZs1eaBJW1JJw6ibiJeq1wsq2xUQWLSp3FuDhaRbRKr/lD6wrwqQKny2C/eI3VMZqB3qRTuful33KjyqTE6bWBZzRPWvbflNICP3Y1EC/7lEpCAQM4/zg4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r98okEgXtuCHEBwiWJy6TL1b05qgSRS1nTfmC/MEjZo=;
 b=A/X1cSTNUmQsAlUaUGMlIzpXS+JWWtRZ8qlHMkmQ1veiTJQfBRgH91+gsTGPWxeCv9ojCjcdvbsFUXAhb+0io3qElnDkZNcmt4a6kvNbOZSeOteGBhOw49BHifm7CGpSAwR0jBngkJk/TWx2P+AMSErJPFgHwcXu4leBuH44vGlhfMVrbLmW8yr6z7j7bnUo/+FvUuyPY+6tPzRso6y1l29EV0ks1kuVwd/qNhqBToEv+BWq9QZYDwNnSfkl7iVRoIIobZQ3IWpOJZnwItOc5sMIWAtgzAFqNIq3N2twcB+L29uqvNPm6aJGjTGKZ749sxG7S/gtFDVCYxre67VLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by SA3PR11MB7413.namprd11.prod.outlook.com (2603:10b6:806:31a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 09:49:01 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%7]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 09:49:01 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Sokolowski, Jan" <jan.sokolowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, "Sokolowski, Jan"
 <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] tests/xe_eudebug: Implement faultable
 variations of some testcases
Thread-Topic: [PATCH i-g-t v1 1/2] tests/xe_eudebug: Implement faultable
 variations of some testcases
Thread-Index: AQHbn9+aa9c+vECWEUiBwuvj29NZ+bOM/l6Q
Date: Mon, 31 Mar 2025 09:49:01 +0000
Message-ID: <IA1PR11MB6097CF7C88731D749C35DD6286AD2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20250328124555.255036-1-jan.sokolowski@intel.com>
 <20250328124555.255036-2-jan.sokolowski@intel.com>
In-Reply-To: <20250328124555.255036-2-jan.sokolowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|SA3PR11MB7413:EE_
x-ms-office365-filtering-correlation-id: 529f04f6-b6b9-453e-1cc0-08dd70394442
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Vsbl7gRHRYxQ23jxkaPkHdocXNXCG1NRtf3+Z6jjNc2Y3PLu/kUZ/ODkrAY/?=
 =?us-ascii?Q?2u6x3Ur+Ea5UL40nVX4+yIlDxoUnk4XH8ibALNtMs6qVipcG90N9O+QF3Yws?=
 =?us-ascii?Q?5WFnSIUVO1IlNZ6xze06Q4CoAyGzKrDI2Lbn5tBrCM7f//Hmtb0h+P2d3FWe?=
 =?us-ascii?Q?EPVtv/K2Q9egF9frtD3pqM26BHOWJ/rf3UAitwexM9lxI07dKinbXTkruBt4?=
 =?us-ascii?Q?JkIlnbYcgLqunt5mtwHWkSPyPPWIjiffJ/GS98Pz25f9xH+OVbDPPkV/5i9x?=
 =?us-ascii?Q?MEY5x4+Uyuk1pdyCHR4KjvWqHLWypAcXZYKkpOPN0wgAYUBGo43p16qlsruL?=
 =?us-ascii?Q?XNY2UK/o56MdTVKh5ZKqaIn4HqUfLwZPMyBNYEUipzXNeFP0oF/yuP9PW82x?=
 =?us-ascii?Q?Gnu/vLypv6X6Ir4G2ppA/6lj9e4/AqRA2R4aka2Swp1snNJX2YKSAJB/WGZr?=
 =?us-ascii?Q?GX7F6Gh4Lf/Y1TK3ew9wWbG9VmYm/UCQpRo14X3DU8e45pa/FxlVgTxW2IcF?=
 =?us-ascii?Q?hdIyWB5nw9BZ0lxAxKakp9ixdIW6Ks5R5BVVSNtzVntC3qCP4E41JESDuT/5?=
 =?us-ascii?Q?C7v2cWZKnV77lKUQ7NF1am70UqD/TeZROQLuS+ya0l/X/24h7432jpbMN7Ee?=
 =?us-ascii?Q?urIkkia0s78u8qrVTbxJbbWOg9CnUvMwYwON6xoMRyEUTG4l/rRwj+c31+O8?=
 =?us-ascii?Q?R1oYcmBeKSpleQs1h8gs8mYYwCTGQqwcSL46n1bdhjSyRplPmi9yrReeJ+1B?=
 =?us-ascii?Q?ObDa+9qFM2bH6gBsjo4PITarKfP0Ix8SP21o7v29AtC30OKtAftVVFsvYqBE?=
 =?us-ascii?Q?oCCY6k29sG+KLEAD1Jzd0XgoZ3HQWQT9T6yN85r7DJNpBa+y7pS4pEmiHvIh?=
 =?us-ascii?Q?m4n71TJUKQA+afRtGYf/Ymu8KocI83mfkH2JPujBWmgVx46hsXasSwtYC2Ts?=
 =?us-ascii?Q?NRLbhJ3qMxAZRDGxeuUrLkx/WdikVqp9CJGNcAiX/1wUvmp1+Bx+LmEKleyR?=
 =?us-ascii?Q?w7xtqNtLgTTkLGvzMX2C8iXWASv4oV0G/gkP7MPEAhIkl/GqftcU2k6to8i0?=
 =?us-ascii?Q?G8GXEkP3dm6eaMLQuM5+QY/SG+t4X5jeUOBEFYegHw8vlx/IqGNK5WkrRZG7?=
 =?us-ascii?Q?muP6ZGgdmoT7+np0200l9p2NE3YU7ARuCwCiUvrETlTzEkEgEoBiCa53toS2?=
 =?us-ascii?Q?617WKf9ubgLUTB2dkRUjDk9ThuxU8/HgaOMS7npfK0Vz9Yp5km8dAkyuhH9c?=
 =?us-ascii?Q?KVoib11+wk+dtLfNPQ4B8K2vEiq/1t2pBz0CtFRDcBaaenF/JEt9wapUOJVd?=
 =?us-ascii?Q?3oKnbWnLgJrO9uGeyFHZ8qhs+j1jmzjb1N9Jj1EBUCISS3b3LHFdbfEtoov2?=
 =?us-ascii?Q?5yirhoRDOvRyLqK3Ty8Fam6swN4KoMZvRoMFNwu2v5W/t0X8T7NXdYdIGsCQ?=
 =?us-ascii?Q?uMGDnrSuISC+8hmuWyQ9hdwmlPvsTU3z?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OsTOYGWIGQXkcqSNaI0rTgs6LTq86wK+QHcAwC9ZKpecEBtmh8uYu0ZmJgY6?=
 =?us-ascii?Q?Uw+cFP5PxH2csPO+R/1MXQoCEhHgFhMz/ZMUdWELNW21WFCmWJQ+jCqjrKnc?=
 =?us-ascii?Q?SUrsfFW+zUwAWJtKSpJ5YCZQhXlfJXFZ4KyvvymBfi/XljPDb5KyaJ6n/9fQ?=
 =?us-ascii?Q?RfxbC6ALHNms3rxxilehcHEu1tJ1XpaxVn8o9kpQfNOtMjVoPOWLDIpd8N2x?=
 =?us-ascii?Q?yIEEkdhHardXKGCzlMXiqIjo7jMstKxqg4rxVYsyLZKTwRO5XRYGRtt0YNIz?=
 =?us-ascii?Q?0ENAh1WGp8NA3HMHVDFlg72AbDfzIWTQtyMUzIZjGJqzSKS6W5+/KMfHnwfU?=
 =?us-ascii?Q?3J+ggr+bNBoOILyGP+NFlaO50LBJ0F6O/HMyamtuoNoNxzuZZ/iCAzo7dQM/?=
 =?us-ascii?Q?9Vn+7DU1CHzCJxOxgLh3D2Nr1HytEjP0Jw/vrNu8XoSZXaZ+bMDG0mc/6Izw?=
 =?us-ascii?Q?apSL2KQjmGYhSQ38tZOHg5mrMdymg2SxYnTSdQM/LE80aiPXcbf2EoBZJL/Y?=
 =?us-ascii?Q?uV5JITDxHRH6HtH50YGB9gVV1/ZmO2jzM5txLpT3wplMy97dmsL+Mxou6tDR?=
 =?us-ascii?Q?TLOr4YItERPGqMKjkcfSrRDP33yr+fS2z8qzMDEk2p8SocA05ecp9sRYR7f3?=
 =?us-ascii?Q?dCrakijBGb7q2Oydv+Zk0tMkbJPYvK9SWf/LMnpH0h3n0JUMkFLcwaOLmLQF?=
 =?us-ascii?Q?KQnft5X92sQwfexbufOPaheaAEHt37+cfZStMqwgutyba0SxvjSRiIHGV/Cm?=
 =?us-ascii?Q?nFNT9KJbdrG42K/vSJnAsQlG7IzXJebYhKgASQ076NW7IxEdELuast4a/Ddt?=
 =?us-ascii?Q?0Pkv1FolF9CeHCuFN00GZ3NX6di/cPYy6yFxTsJzEt4TjJGVuLklIdMpBwbu?=
 =?us-ascii?Q?L2UBJz9PIUQDnBd/1Nx7cQ64e47sylQucBxXvguHXJAn/+kxrWDpYmV1xED+?=
 =?us-ascii?Q?dbX6wVoGEZzrLIHxecetn/uws+DMkDVpmEcB51oowp0IXL/UcXzoSnhI+zbY?=
 =?us-ascii?Q?YRbjc9gHiksjFC1wr1MbOR7fkx+KneiRfb42h7ubMhTqNBWZoWwvduMtBG3E?=
 =?us-ascii?Q?imSp1/nHbBGKvVm3Zb4AmR/EyJqYdSEmjnoDbfOtzgbm4iPfHFHS4QLbct6l?=
 =?us-ascii?Q?w/ZsPtMT+eLZpgRDwabKIkZ/WWzLXmiD3ZfX7fvLfblf451EClqmHsXX09vJ?=
 =?us-ascii?Q?ZsZHKn3dK0ALVvmhPwNyrSl/y+7dxDPGEUN3Z0cA6kH2zguRQhKhtHcUXrbp?=
 =?us-ascii?Q?JMrTLt6pP9gUJgSv7vl7eB/wpq8w83BvPZWPY1RhmVYgueZ6wkORXVT3PyPN?=
 =?us-ascii?Q?d4FTEVCdktkICf3c1Bhq3eIkJJ0HFwgKhgW9XmQky+k9pgdwd07nSbpsBNDr?=
 =?us-ascii?Q?mRF2a+kBLS/Qf8zEtvgsP/Sdqpm0C/KEa4kkhEUMi8YvayBUw/6nKmyHAQsf?=
 =?us-ascii?Q?gLpUODYw1F0J85j1oQFseP5+/xrPleOQO3fTlvOZDeOGk26EbKVIPdg9HulE?=
 =?us-ascii?Q?zovhaqs2C964r63lQ/G1YROjP4CwqwUByV1+3Cyij+SR1JrZ5g/rOIiU7UcD?=
 =?us-ascii?Q?avZUYkIOIxBh0nATE8Z/kRqH4QUMWcvJMLX8wkw/anNm4C55AhGNnrSsVl7a?=
 =?us-ascii?Q?7Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529f04f6-b6b9-453e-1cc0-08dd70394442
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 09:49:01.6868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UhlmkvYvdEbbtWC1TvkIMfeA8YGYW7qgvYr1sK1DJ3+Bz/R3TVPzzxnlWo6Nm7EqGvJGVFsx/Oko8S3w4BWvq+GIfLr7nR+bjIpriashL0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7413
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Implement fault variation of tests, which are accessing the memory via debu=
gfd, by creating a vm in FAULT_MODE.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_eudebug.c | 84 +++++++++++++++++++++++++++++++---------
 1 file changed, 65 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index 7687=
0805c..0b3de23e2 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -64,6 +64,7 @@ static void test_sysfs_toggle(int fd)
 #define VM_BIND_DELAY_UFENCE_ACK	(1 << 8)
 #define VM_BIND_UFENCE_RECONNECT	(1 << 9)
 #define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 10)
+#define TEST_FAULTABLE			(1 << 30)
 #define TEST_DISCOVERY			(1 << 31)
=20
 #define PAGE_SIZE SZ_4K
@@ -1445,16 +1446,19 @@ static void test_basic_sessions_th(int fd, unsigned=
 int flags, int num_clients,  static void vm_access_client(struct xe_eudebu=
g_client *c)  {
 	struct drm_xe_engine_class_instance *hwe =3D c->ptr;
+	uint32_t vm_flags =3D DRM_XE_VM_CREATE_FLAG_LR_MODE;
 	uint32_t bo_placement;
 	struct bind_list *bl;
 	uint32_t vm;
 	int fd, i, j;
=20
+
 	igt_debug("Using %s\n", xe_engine_class_string(hwe->engine_class));
=20
 	fd =3D xe_eudebug_client_open_driver(c);
=20
-	vm =3D xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, =
0);
+	vm_flags |=3D (c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_M=
ODE : 0;
+	vm =3D xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
=20
 	if (c->flags & VM_BIND_OP_MAP_USERPTR)
 		bo_placement =3D 0;
@@ -1567,17 +1571,27 @@ static void vm_trigger(struct xe_eudebug_debugger *=
d,
  *      vm fd, concerning many different offsets inside the vm,
  *      and many virtual addresses of the vm_bound object.
  *
+ * SUBTEST: basic-vm-access-faultable
+ * Description:
+ *      Fault variation of test basic-vm-access.

[Kasia] Please extend functionality for Faultable test cases by adding 'wit=
h FAULTABLE_VM', e.g.:
* SUBTEST: basic-vm-access-faultable
* Functionality: VM access with FAULTABLE_VM
* Description:
*      Fault variation of test basic-vm-access.
Apply that to all newly added test cases.

Kasia

+ *
  * SUBTEST: basic-vm-access-userptr
  * Description:
  *      Exercise XE_EUDEBUG_VM_OPEN with pread and pwrite into the
  *      vm fd, concerning many different offsets inside the vm,
  *      and many virtual addresses of the vm_bound object, but backed
  *      by userptr.
+ *
+ * SUBTEST: basic-vm-access-userptr-faultable
+ * Description:
+ *      Fault variation of test basic-vm-access-userptr.
  */
 static void test_vm_access(int fd, unsigned int flags, int num_clients)  {
 	struct drm_xe_engine_class_instance *hwe;
=20
+	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
+
 	xe_eudebug_for_each_engine(fd, hwe)
 		test_client_with_trigger(fd, flags, num_clients,
 					 vm_access_client,
@@ -1717,15 +1731,25 @@ static void vm_trigger_access_parameters(struct xe_=
eudebug_debugger *d,
  *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
  *      with bo backing storage.
  *
+ * SUBTEST: basic-vm-access-parameters-faultable
+ * Description:
+ *	Fault variation of test basic-vm-access-parameters.
+ *
  * SUBTEST: basic-vm-access-parameters-userptr
  * Description:
  *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
  *      with userptr backing storage.
+ *
+ * SUBTEST: basic-vm-access-parameters-userptr-faultable
+ * Description:
+ *      Fault variation of test basic-vm-access-parameters-userptr.
  */
 static void test_vm_access_parameters(int fd, unsigned int flags, int num_=
clients)  {
 	struct drm_xe_engine_class_instance *hwe;
=20
+	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
+
 	xe_eudebug_for_each_engine(fd, hwe)
 		test_client_with_trigger(fd, flags, num_clients,
 					 vm_access_client,
@@ -2185,7 +2209,8 @@ static void *vm_bind_clear_thread(void *data)
 	struct vm_bind_clear_thread_priv *priv =3D data;
 	int fd =3D xe_eudebug_client_open_driver(priv->c);
 	uint32_t gtt_size =3D 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
-	uint32_t vm =3D xe_eudebug_client_vm_create(priv->c, fd, DRM_XE_VM_CREATE=
_FLAG_LR_MODE, 0);
+	uint32_t vm_flags =3D (priv->c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREAT=
E_FLAG_FAULT_MODE : 0;
+	uint32_t vm =3D xe_eudebug_client_vm_create(priv->c, fd,=20
+DRM_XE_VM_CREATE_FLAG_LR_MODE | vm_flags, 0);
 	size_t bo_size =3D xe_bb_size(fd, batch_size);
 	unsigned long count =3D 0;
 	uint64_t *fence_data;
@@ -2397,14 +2422,20 @@ static void vm_bind_clear_ack_trigger(struct xe_eud=
ebug_debugger *d,
  * SUBTEST: vm-bind-clear
  * Description:
  *      Check that fresh buffers we vm_bind into the ppGTT are always clea=
r.
+ *
+ * SUBTEST: vm-bind-clear-faultable
+ * Description:
+ *      Fault variation of test vm-bind-clear.
  */
-static void test_vm_bind_clear(int fd)
+static void test_vm_bind_clear(int fd, uint32_t flags)
 {
 	struct vm_bind_clear_priv *priv;
 	struct xe_eudebug_session *s;
=20
+	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
+
 	priv =3D vm_bind_clear_priv_create();
-	s =3D xe_eudebug_session_create(fd, vm_bind_clear_client, 0, priv);
+	s =3D xe_eudebug_session_create(fd, vm_bind_clear_client, flags, priv);
=20
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND=
_OP,
 					vm_bind_clear_test_trigger);
@@ -2433,7 +2464,8 @@ static void vma_ufence_client(struct xe_eudebug_clien=
t *c)
 	const unsigned int n =3D UFENCE_EVENT_COUNT_EXPECTED;
 	int fd =3D xe_eudebug_client_open_driver(c);
 	struct ufence_bind *binds =3D create_binds_with_ufence(fd, n);
-	uint32_t vm =3D xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_=
LR_MODE, 0);
+	uint32_t vm_flags =3D (c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG=
_FAULT_MODE : 0;
+	uint32_t vm =3D xe_eudebug_client_vm_create(c, fd, vm_flags |=20
+DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	size_t bo_size =3D xe_get_default_alignment(fd);
 	uint64_t items =3D bo_size / sizeof(uint32_t);
 	uint32_t bo[UFENCE_EVENT_COUNT_EXPECTED]; @@ -2613,12 +2645,18 @@ static =
void vma_ufence_trigger(struct xe_eudebug_debugger *d,
  * Description:
  *      Intercept vm bind after receiving ufence event, then access target=
 vm and write to it.
  *      Then check on client side if the write was successful.
+ *
+ * SUBTEST: vma-ufence-faultable
+ * Description:
+ *      Fault variation of test vma-ufence.
  */
 static void test_vma_ufence(int fd, unsigned int flags)  {
 	struct xe_eudebug_session *s;
 	struct ufence_priv *priv;
=20
+	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
+
 	priv =3D ufence_priv_create();
 	s =3D xe_eudebug_session_create(fd, vma_ufence_client, flags, priv);
=20
@@ -2742,17 +2780,31 @@ igt_main
 	igt_subtest("basic-client-th")
 		test_basic_sessions_th(fd, 0, 1, true);
=20
-	igt_subtest("basic-vm-access")
-		test_vm_access(fd, 0, 1);
=20
-	igt_subtest("basic-vm-access-userptr")
-		test_vm_access(fd, VM_BIND_OP_MAP_USERPTR, 1);
+	igt_subtest_group {
+		uint32_t flags[] =3D {0, TEST_FAULTABLE};
+		const char *suffix[] =3D {"", "-faultable"};
+
+		for (int i =3D 0; i < ARRAY_SIZE(flags); i++) {
+			igt_subtest_f("basic-vm-access%s", suffix[i])
+				test_vm_access(fd, flags[i], 1);
+
+			igt_subtest_f("basic-vm-access-userptr%s", suffix[i])
+				test_vm_access(fd, VM_BIND_OP_MAP_USERPTR | flags[i], 1);
+
+			igt_subtest_f("basic-vm-access-parameters%s", suffix[i])
+				test_vm_access_parameters(fd, flags[i], 1);
=20
-	igt_subtest("basic-vm-access-parameters")
-		test_vm_access_parameters(fd, 0, 1);
+			igt_subtest_f("basic-vm-access-parameters-userptr%s", suffix[i])
+				test_vm_access_parameters(fd, VM_BIND_OP_MAP_USERPTR | flags[i],=20
+1);
=20
-	igt_subtest("basic-vm-access-parameters-userptr")
-		test_vm_access_parameters(fd, VM_BIND_OP_MAP_USERPTR, 1);
+			igt_subtest_f("vma-ufence%s", suffix[i])
+				test_vma_ufence(fd, flags[i]);
+
+			igt_subtest_f("vm-bind-clear%s", suffix[i])
+				test_vm_bind_clear(fd, flags[i]);
+		}
+	}
=20
 	igt_subtest("multiple-sessions")
 		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4, true); @@ -2=
781,12 +2833,6 @@ igt_main
 	igt_subtest("basic-vm-bind-ufence-sigint-client")
 		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
=20
-	igt_subtest("vma-ufence")
-		test_vma_ufence(fd, 0);
-
-	igt_subtest("vm-bind-clear")
-		test_vm_bind_clear(fd);
-
 	igt_subtest("basic-vm-bind-discovery")
 		test_basic_discovery(fd, VM_BIND, true);
=20
--
2.34.1

