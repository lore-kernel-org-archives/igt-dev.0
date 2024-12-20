Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CCEE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 15:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FA310E396;
	Fri, 20 Dec 2024 15:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqH5EuVY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F23010E396
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734707658; x=1766243658;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ny1/MC+6HRCwVghUWuhio5bBJxeo8DE9EH1tP339z40=;
 b=KqH5EuVYysSqO83+7MqCUsqqqvsYkCpWW+Fg/Ikf1K7pibOJyVPUu3gf
 bIlleLoMzt76Iq73bTvJ/6Q4aCerCo2dS9fdDhfHSTtlA4Unx/EZPqaP2
 MyMw5TOkvFS22T+9/g6OW49PUWIkp96wQQQEER83RMwTYaA/HnVxgP2d5
 tvko2n4RhJ50oRbl5evcaFeFp1mncHbaMa8+gRvwRSUajrWL78+RMjgUR
 f6nbR5+9ZnPoHZOTByGQf0LiauGCgeBVH/TlZAtGvl+Qomzc8W9szXRft
 dYC1av1aDUd3+c4DOpcS7xUXYngkJT8rlcLy6LGvJ19Av8B+NDC+6yae/ Q==;
X-CSE-ConnectionGUID: 8pdRUAKKRvmQvC/2xh3i1Q==
X-CSE-MsgGUID: 4BGAQ/ZMQAK8ptU4ZZj2xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="60639771"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="60639771"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 07:14:17 -0800
X-CSE-ConnectionGUID: Q62jteJmQ6+ow2IWX/MXVg==
X-CSE-MsgGUID: YSmRi6DRS9GzoforV6nIaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98315986"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 07:14:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 07:14:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 07:14:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 07:14:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOcQqUDodKt6ekIzgh9/uCfpVOXvadKx58IGb+YmVT5UxT0xPxJpwvuUAG4biGf48tLDHl1Ule/kdXx2LXIy2c1nVMbXR1xy0iQTU5TOie7zT1ubAC2bpIASS0xuQfVhcHjiPTj5hPFW4uRtIUQICGd45+O3e9AESVGxBnqk+f+gcAF4DL/BxX+VyE79Rt900iGL+uA6sAiRC6U62gc6BE64nMgfJT7obr0kf7e+9EEAO1oH2BKBFL2JDYj30jUOtst/n/70LZ1ap83Gmzf1n95ttHU2DuhoOFxqDlgQEb7N3Gbib/QSo16AlhXt5cHYA8TEKZwn+14bPl7sYv5oNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9ZuiIpctCwFUiQLogw4WW7TBLYZ17HcnwupII0AqnY=;
 b=G8x/3Dze2w87Hnf5pBOJXaSQp8vQ6VQTnOPgRC8tzpbBIGkVdR3xWHJqFaYV2Pz7Wiy7cTVuKEBfge0xnC74MV4aBVqw690jMZT+KNWTdgcmzRCHvR6OB6eCHzWnHX0EwD+pKdyqup9Ub/ubDJ5GzsbS31OLrBRWGexYi284wCf/a8feYnR1otaghyCiI9c/N5qsKYW9UL+FZS/Irxpp5/SZKDiRAQOCzAPj0cn7MGHePNMt1Q09V4pro+yz+3kkW5T5jm4QmBIXlI95FBpy2TEN8sawpidtWE6tXdW6GTKMO+Ja7z3KEaqoj9Z9QHSg4TG8DLMmvBAfn0QLQSMMsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by CO1PR11MB5121.namprd11.prod.outlook.com (2603:10b6:303:98::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 20 Dec
 2024 15:14:13 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%7]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 15:14:13 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Gurram, Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH v1] tests/intel: Remove TEST field from test documentation
Thread-Topic: [PATCH v1] tests/intel: Remove TEST field from test documentation
Thread-Index: AQHbUsNsDjy0eh653UqKW1dflqS+kbLvPd8w
Date: Fri, 20 Dec 2024 15:14:13 +0000
Message-ID: <IA1PR11MB6097C49139E26D91DDB68B6D86072@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20241220093914.706003-1-pravalika.gurram@intel.com>
In-Reply-To: <20241220093914.706003-1-pravalika.gurram@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|CO1PR11MB5121:EE_
x-ms-office365-filtering-correlation-id: a10d915c-0d9a-42bd-b5dd-08dd2108f698
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Dsudf8R75k5kFx8cZ1BtHzlAfCs1nxo/eUM+YCqTSEooVcFsNjpGq9DR9uCJ?=
 =?us-ascii?Q?OLXZW93BqWUDgeSWYxMKRdVcFYor0m+UfJchQKk+XmrS2WbQwGwnFkJWXmac?=
 =?us-ascii?Q?JevcqasYkEkdr0w3BRpdyj69sdDm6leroW2bBVDpatCRYYIApbHvu23NMCwH?=
 =?us-ascii?Q?FBPK+abISN8zjbysqAhTDnPiDrWf8QYbR3qAnU4wbBaTo4pWk0JOi6ISEARs?=
 =?us-ascii?Q?FGTGSHOjN2G7L6ssk/tZvr35IOuAUbZ/4tCbb9wEHKpWI2EQpYgBeu4y/mKT?=
 =?us-ascii?Q?ElAJw8YSTgQaDCgliiwWsW6VwqZNL8yzvaOAVh9/qVbCyagGCvSO2khKEXab?=
 =?us-ascii?Q?WVTadabLOj499jvndQIXtg40XJ/9Igvx4MKGOdXgIWTM/+HjjyzlHC1hpnm4?=
 =?us-ascii?Q?cx/x0MKWSyyOsl92ifUZddY+gE/KWJKU0rpsxuZArtWwVbnM30n5kZXnaoFd?=
 =?us-ascii?Q?DmD7svB+Jt02sep/GX8emmLBXGiOQBa/qckBY3EsbrG9Pr1d0AhWW0DqCx2r?=
 =?us-ascii?Q?gep4gDhn8ZdxzGhWR6Cyt46yPoWbUzuq+B/N0J3F1PeI77zr2sQ+RyK6ngzq?=
 =?us-ascii?Q?2Bc7K9yuqJmAmmUMRqCvQgsUnb5/OW3irnjgQV7KWdRX+OG6qfl4T9qysV9K?=
 =?us-ascii?Q?KkQ1tQXkjOpsMH0KQvYtotvZz4S4h3vhA+VHtvhs6gHPz+bL5WZ4WmCOWqca?=
 =?us-ascii?Q?AOXEbtDBbO40CmD1g/es0ufg7cFEyCxgdTOcsyEitunuqLEA+qQMdM+dffjl?=
 =?us-ascii?Q?EULUuZ5qsE95VQd5FkqPTzi4cmc5qbM2W76HJbyIDmjTQe2svD1YaYICpWU5?=
 =?us-ascii?Q?rzajGgqCSPoF1ipj6Oq0cQh+hrL3mJ5rmSI7cS2sbBr03/iy3YBMwJP37XZz?=
 =?us-ascii?Q?Gu4CSXK6gkjq7o2gSuj5RobCadw6zyHEItqc6zbVjvjUJdlhenUWObUa3cx+?=
 =?us-ascii?Q?XXWR2xceMCKnsHCY9tkQuJScUlifBdyGQfI07A6nUHfPKJH3AiliCtts7adO?=
 =?us-ascii?Q?d8vDlPSP+Nv/8DhPgqRAngseVCJdSdLbGbVV9Rk6TDxoaKsSHda4sR1U9VI6?=
 =?us-ascii?Q?zCLp1MIBpKNgTc2XwwKlv8LYRgbfHY/J4g0q/1srW+LyTtONWZjKMBnCsqB0?=
 =?us-ascii?Q?+akTMoWDN2gog7xBxsR8e2F10l2U7bfW1krhW/XG/EhWAceG+Wjxpb8GPd8L?=
 =?us-ascii?Q?JPPhhSIejUxaMLNSldBxYD5A7F3KgkEapnIOiSWA65bz9MIUH6FRhY/89Z/8?=
 =?us-ascii?Q?+M+b3vlGuSbszRji1N5k7EhWWNmt2qVNHi8MIIrNwK0cHCi0OY1qkQz0Obfy?=
 =?us-ascii?Q?UiljwnGEcW8FMyEmGgqYLMB/mp967PnVuIcdaIuDPoWaK2mxDLcpM2xBi3LY?=
 =?us-ascii?Q?KxYAtGXj+5wb8UxVLcxNiilx11NORazdHGsT/c/IRdtV/KQ8zbq8uCR8LgVP?=
 =?us-ascii?Q?xdLkFS8FaLneyxSJfejgu46UDy+FI7Uf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ne02iNMnn5bTQRBbeLR6izduMLSZu3b6O/+8GUxqpudno/JdqN00MtEVS8gh?=
 =?us-ascii?Q?2zVAx4zgIdKkP2vNLqjJEvhAT6+/b8NCb3OUiRpLhYefFKhW8F6bBqvSJ1Sq?=
 =?us-ascii?Q?FYpV88z0KevHZXGv0sLtmjjX9GS7oYIrNnzsmPzqVii7J61f77BuNiGvOL5l?=
 =?us-ascii?Q?GEdUuVEyNjCSsuFmHmYSJTYKMv02Romz29b5s8AXz4EUlGg+E31BgcTe7Tzn?=
 =?us-ascii?Q?af1jQrOEgqC7tyIfs1wJWJ3FeGfr2BkFqCd23RLiTjeYn+1fM5rssxoCU5he?=
 =?us-ascii?Q?oWuBBT3mYgv2/cxtW1Dw0NzxA1uEYhUfjZXmI5UfWvkgHV6WgymTNO4jiKwG?=
 =?us-ascii?Q?C78eaVO0owSzT+jxvCVOMNh6nhTl3bRO0/1zM9IeQzKFTZdV7PHqOxl3jut6?=
 =?us-ascii?Q?tDYWjdC/VRH6RIFz7WglNjJFwDOo1yZdwdxL4DA4Bj+Zmvj3YQUuXNN0dnoh?=
 =?us-ascii?Q?tAiX1wkQEL1JIBskB7wQqKQfCitMSm+Mt6UwqnrSCMRVxqT93LwRc5j9Vb2U?=
 =?us-ascii?Q?wQ8rqNXfaMTnkt7kovA15JAEiC82iy3lBP7SYO0ygYNA68U+xFTP4RlTsJRG?=
 =?us-ascii?Q?Awf2abtk+aWsKvElwsJ7JbEHqyCRXYFmi6HzVABIpqpavIjc3h4o1ogwuxmy?=
 =?us-ascii?Q?gcxTIgBo2vErFA2IB3eFWr4hLgsGAhrC15ALcdw6VvbLAk80vo7Vj359SOQw?=
 =?us-ascii?Q?+Nue97NXxR/rOGfmt/rNDjfkfzFIhD5jNMWd6PofPqONtsoXIjmuVAApq1AR?=
 =?us-ascii?Q?NEu33lyi0mEm5csZ/mOsE4pPJb412uEYEl2Qk0xzjf2aVjOZpim7sj3BrdtA?=
 =?us-ascii?Q?64aNg2EU6VDrVyRiZIt43gEX77BvzxoQvGW6fVYkd5sbHtEJuY0JS79oUJF6?=
 =?us-ascii?Q?RRh8WM7lNks/AM02HlHty5PHFEDOclLapTbaURFcVIR79DG3Z4O8MRNfg2S4?=
 =?us-ascii?Q?1xZTznih3cWyEij6i9gjPCtWq27qf1JamgMKPE5czbogt8I4NKXOhZWcXS0S?=
 =?us-ascii?Q?/rvFDYyd1EQC/J3mkkWqh3d3IZOctSUDCBZI/F7yeHkMh1vPGiKK7MK1j1y+?=
 =?us-ascii?Q?Xi8xGAmiSbtQ8jQ5Zh9J6HpVYGNKV4o2szBbdw+OHtStbpLQpvlLlut4BRwz?=
 =?us-ascii?Q?aOQXR8Jg6D5ORn3zOkSP2d55liSJUo0FDyDkUM8j9KQJvPK1NTbJQ4LTYWWs?=
 =?us-ascii?Q?6lvJ+AyVcB2nYlZb94C4KIS2yo3IupwB005JG2o1LF03eJuza5oIuTN48Dkp?=
 =?us-ascii?Q?NQmIUBEifW/sGh76glmo21kZkK9GaZYSdUi5RZ8VLcDITO0YaVqFrl1D9VHw?=
 =?us-ascii?Q?TXSnkABfdXZXyW9fe8G9VRfhK6KCAbGxE1ScheZD6Bs+cOnkegyFoclIhrqP?=
 =?us-ascii?Q?IAzpegqK63pengMmpR1hcALJ8yOfZdn+cXEKSIfE6OIoE8xD4bN5+9DkUvUC?=
 =?us-ascii?Q?E10K+KSqBlJlu56v7+5cd15ZiJFMxj6XfRkaub9NI7CfXciHhWqf9geH7QPv?=
 =?us-ascii?Q?S1OfkpEHdcyFxGTqtQWYsmmJ5JFfQL3cL/ycyYHK5Sub6LK6r/TnfX6eAfHD?=
 =?us-ascii?Q?nQtg2PKv8fa5JyZt/Nthux1vckDRZm6J0Ozzk/lCzwmCGn56FD55sCJkhh4k?=
 =?us-ascii?Q?fw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10d915c-0d9a-42bd-b5dd-08dd2108f698
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 15:14:13.6606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qmtdi/tzfXiZGTNMtateQQGlCG5YUu1H7jCs9SYXA3V7RTMhdV3ckFJspoxhmD3o7Dpmxy5q+yxB8l8qw2jaR9iDvSCtsSRK3M1OFXN6z7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5121
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

Each test should contain only one TEST field.

Add the Functionality field in the TEST section to fix the warnings during =
the addition of subtests.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_vm.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c index b10269191..b55=
19c9fc 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -8,6 +8,7 @@
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: VMA
+ * Functionality: ioctl


There is no need to add functionality here. Each subtest has it.
Rest looks good.
After changing that:
Reviewed-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>

  */
=20
 #include "igt.h"
@@ -2247,15 +2248,6 @@ static void bind_flag_invalid(int fd)
 	xe_vm_destroy(fd, vm);
 }
=20
-/**
- * TEST: Negative test for vm create/destroy ioctl
- * Category: Core
- * Mega feature: General Core features
- * Sub-category: Synchronization
- * Functionality: vm create
- * Test category: negative test
- */
-
 /**
  * SUBTEST: invalid-flag-%s
  * Description:  function %arg[1] used in vm create IOCTL to make it fail
--
2.34.1

