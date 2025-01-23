Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDCCC02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 14:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D707910E206;
	Thu, 23 Jan 2025 14:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxCaNr15";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A7A10E206
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737644201; x=1769180201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+vSJNLcqz0CzVpG2DgJ2Kk0Puf4gVKHLa4wpv7BiKFU=;
 b=NxCaNr153IjWej3/ouF78Kkn8gFL5nwcsSZ9S0TmDRlxonsV5uJuypoJ
 iPSGJR9bl6A+xRDi26BFyXA5BUOKq07lvRPELxE9yvlzINsXfkkfw6rYU
 6C64hKjKU54ovL3SUOhQByzxqHbr6hYWiRKUaqDzUPA3Od8L78Yy21mKV
 hmF5UuzgBeGkkb969CsS4Q9GsEZVUiNGpG2EnTjUuqtcmmqmlO7p2VGKJ
 yMqZmwMptWNhe1vNPH0IHS1VVT307bw3ExG1l52GahoDwCL6CxdhhDqgX
 6iAnLycn+6iihJTCwlaE+vtiYar3TtGo0AlRi+NAmRyfTUWA81R2U9zCH g==;
X-CSE-ConnectionGUID: AegJhgseQVm2tiUV1aTA/w==
X-CSE-MsgGUID: PxOB3jm7Taikl5SF/dRFHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41811184"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="41811184"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 06:56:41 -0800
X-CSE-ConnectionGUID: 1SFfPP3EQUqRn28HjrQ1Og==
X-CSE-MsgGUID: UDAzOaW0Q3SoztaKb8ThTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108347837"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 06:56:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 06:56:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 06:56:40 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 06:56:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwxXLgsJfwwq6MkzSgusGu5WMcKMulAN9KaJYL0uqy6uFcvJcIQQmuK7bw/1n7lwScAzOtgj+OUP05CLXFuLniEEUDp/Qx0U9MQFFzhtN5MR1E9j8RvDrjPCgIEonx0mroEwJG6eIVzwL1HG5nZtZOxFLe1o6Kjr9Dje5t2jDz4rl5iIuIcebh+W7P1/ly6O7uaB/WSnscORdnWm+rueeJ+5+HTbS2fwKMHQ1zpwJMcAjinN6XFjP8EvBbM3sF31NUrN0Ydq+6EILvFHuSrJ+KxCexvdbT31h97Q3QVrHHEXhzKIU8mMN3aDW44rYBEMRQ/dq62AAi9fQ4qXd0A7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u7X+dqavtNiqO/wO9K7ike41rEFsgvBUOhphWWT9XM=;
 b=HeP4Z/XMpG1ezr38Vhsn4/Cg6Uc0loq0u4DuKTNNlyF4QYf9mFMiuwomTZjlNLL12TiWurmoBCZ++pDiWQqBdEzTp723LRdLO+iXZlHYmxr6RQ9Vdz1x3nkE4PiigT0dhDwJzl6RIr2EEA14aNAfZphXHJIz7NYPc6LJfThmZo6sSl7bXlgWs9FXeqTNIwqA/1yYhxnBPqw70tAxuyb9kZektKkrTazB/w4xx288KsdDAqz4G3Gk0jR5fy9/UtMFcrVUCuNmT4PSC+RewlZ3LZTWnc2bQhKPZT2P9cUia3BOrVislsGAt9wQXG90oF0nuQYYJm5WjajUkOVSC+Wteg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 14:56:37 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%6]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 14:56:37 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Heikkila, Juha-pekka"
 <juha-pekka.heikkila@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_rpm: Update modifier to linear
 for display version 30+
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_rpm: Update modifier to linear
 for display version 30+
Thread-Index: AQHbbXVLIz1nxDjzrk+FSSxkYnETArMkbBeA
Date: Thu, 23 Jan 2025 14:56:37 +0000
Message-ID: <PH0PR11MB480690DB632E243000AEDFF2E4E02@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250123091546.3126819-1-jeevan.b@intel.com>
In-Reply-To: <20250123091546.3126819-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: juha-pekka.heikkila@intel.com,ville.syrjala@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|IA1PR11MB6516:EE_
x-ms-office365-filtering-correlation-id: 8e5565e9-5f28-4540-0c04-08dd3bbe2307
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qQLVqtCxK7iDwx6busKjTL7QGy9dn2wSCDLDJnIhaRo5WeaRUFhsT4U8tCyr?=
 =?us-ascii?Q?D7FqLXxmf0XRuo6sRmFo9yg4UyTk0Ea2e6KxvVnZ+3+yZDnw3Ns7nNHqF14n?=
 =?us-ascii?Q?1UaPV3/g6dfFBvJTF6JLx4x7xhiID2i4erTLBvG87mLs/7bOAzoCm6sglYIn?=
 =?us-ascii?Q?ODLelyPQnIiuPYx0fARfAO33cl65cUxn7tIu8DpxT/Cnczo2oU4i+jIhAd9J?=
 =?us-ascii?Q?lBadMVqjwuDf/7bNxo0wfvdi1Bef7X2nYNpMb3kksPL9flWL+iiKEdQ9zAbk?=
 =?us-ascii?Q?OvjgHUe3QjcAtbLJnvj55jKFDCUJFBr+o/vkCy3lS5ZQua65HUHjaRJbQP9p?=
 =?us-ascii?Q?O2cA22/p1Z9cJBmT0DY1XatoTcIO8k15SjYwWb+3bLY6EEoZEZRHieDYa41M?=
 =?us-ascii?Q?dZmNkM2eJyx5Z9F/7NpvbR1kaJS96NCVnAOdafMq03rxm+fCLlCZDWX1ak7O?=
 =?us-ascii?Q?v7ZMiS4D8jKc/f0UXCZ/QFTAogpmSWn1nV+UoCOMRnJH2gsP8EoAs+nUmsK3?=
 =?us-ascii?Q?5ppgeYGIQRvXa1FM7vRq+IrjNkmiPuI6wZ/Qvd+rITO9gpkC4HDOX00CgpP3?=
 =?us-ascii?Q?iMPCBnEb755R/fBiefY61wPi78PHa7QPTyoyhzbKLmPrPcG5BbXle0/ZoRbg?=
 =?us-ascii?Q?rEXDO5h0ykQilokCdbO2tFfuVHsyqUMZ+KwKy59FdMmGG5iq1a0ZEHhil6kg?=
 =?us-ascii?Q?5+nUJcXf8zpWKNsH0wZCMtTB9xCGwcPZn8nNMK+nsuancERWWKQf2/LEIdGy?=
 =?us-ascii?Q?9edvnarXc8vaXY1QpqDTBQRawv/zg+CoynsOyrYzm7blO1X2r1/DhIf2/87n?=
 =?us-ascii?Q?NInux8C/OQ2ONTMihUOmW9zdDiSSTUrjralKz3wBfgnbGBr/kUbjhuVKkPO6?=
 =?us-ascii?Q?bCrW4k8FiU+5BAStZpn+SwuDpozwEKR4ToCJOUaaAe/asl7+lI72W1pUBv7f?=
 =?us-ascii?Q?NbfwOj0qHl1hrdzLJ1whE2ULWUEQx/3ImC677l3sFLAYayG9Au7x1Z+n5JbZ?=
 =?us-ascii?Q?GeQuNNu4GfTt0H80BxwxFrHhY2oSoOVOlgnPDifFgtjdiFyzVowhg5yE0gRS?=
 =?us-ascii?Q?Jg7zwbx+UjkkQqdyaTSU2AfaB6Tt2Ypij20zE/t1/DzdOOQxVvIcehRgxVrR?=
 =?us-ascii?Q?L46CQ71gC0oM6p5hWAveIIY9PmW2bcFOMRPTwX/n6CKJpqMpyJ33pxvY22rk?=
 =?us-ascii?Q?zQCaICjkRthb/PgH42xpaMbD5WApPzaQGJZeuC2j+Uh+P4fi9u54zedhOKuK?=
 =?us-ascii?Q?8m6osmERuA+Rl4ynE6+JYojJE0RGcSqNttFNde54qbstcDwoUBT2i0BD7Z5Y?=
 =?us-ascii?Q?araW3xHG++ATGuMOS8vTXywzuzBzNf4iRxZlRDKUNultE6LdD7X2OPNRoQrQ?=
 =?us-ascii?Q?pHrsASblHWMKBd+D2Gut/it5R2odU1NmDtClgN8J6rSSXYageJHWIXVgS87h?=
 =?us-ascii?Q?EMZ/TcMW2g3OoAueRCYd5kuUJ8ZPxGj1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DJ6fQcFYaNPCnK5fxjcqHjTZBaoPkUiLcqMVuTOYAL9uusGOGneevOJENmLB?=
 =?us-ascii?Q?Kik4/04OCU981eOgkXl5d9ZkIu1VdH/wvAhmPYjv1BhRN/pWowa5vMUoFXN3?=
 =?us-ascii?Q?wSYxQzi6T71B4qkEsfyslYZceiosKyCANhCk+8fhlRtgD0fHcgm84UFQCYlP?=
 =?us-ascii?Q?8keDW9P3Zj25H5uNWqM87P3/qWDpsLEQEpJe/MkLAaGtF0Lzi+q9CKOoujWB?=
 =?us-ascii?Q?VdC87VzEaant4pEqLMcLDuWGZpjbFo/mdqL1Rj43l0tYQyybwyo+Y3i1Y3S6?=
 =?us-ascii?Q?KdvvPGf+MTgH1SaXpByWc8PCnwL0cAGFItGtQAA8qgCRXGH4ZpMHVb8VhriF?=
 =?us-ascii?Q?/DjAbR5+k2Pd8JkZWoUS4TUU/GQSY/VD9Vs+3JN1q4Mk8D9c2FKfqV9Zk0W8?=
 =?us-ascii?Q?MAdJkGV4h5AsHnCmUhVSO4EbQTGin4Kl+8z5S8vHFPfABO46GIzUEaVR6ZMP?=
 =?us-ascii?Q?i8KDtvvX2a8jzjTtpaq3/jPAcTD377aSqzVRUDL9ulAcgFSIkhgIoW7MhT+y?=
 =?us-ascii?Q?ShL3UbjS32cVFzCItIfKdQIJwxo5J3YCcWkQUTe0f1hEj/q7UCBWumBXsqJl?=
 =?us-ascii?Q?E44IV+HXD9vtXGRCCKO0K5+rYn1kDT4I15p4oDq5uuTSXKSNxnvy98l/s9j2?=
 =?us-ascii?Q?wmIO5sAy1TL1Xt3pvu4GL/VNwcms6kIsumZx8/H9uX3RPaasUtMGuWHTcIi9?=
 =?us-ascii?Q?U9P2a4HLCB1yDTfFnJVMqFWdNGYqOID2q6seLNC7sQHXnwYqeERS/qz2sy5C?=
 =?us-ascii?Q?To7QeAAT4LMzkOgOSjmLCnoDNzvlaqYAqRScDInWdbPdZistE51tQ+Dc2esv?=
 =?us-ascii?Q?QcfS25O9XwEj7y6grSx1Xn6FC1beR58cZlGOcciYwYrL1TvGR1l0pmW4gVvf?=
 =?us-ascii?Q?rNUnp4wXNYAbJHMC90Fl18WGqY/LM6Ctg60P2ieS/Uym6bAoEMKm73qBdPNt?=
 =?us-ascii?Q?H6hj1MHzE5Zen0ndM6/PkluzfEn8NLWmOafxqLGDq1QmDwYQbYV3i371ieHJ?=
 =?us-ascii?Q?nUxDI8+RMvYeQBhpfUnvckH//k0uddKQmlrFvQ79t9FVPVCQAcMZ1smAZ+p9?=
 =?us-ascii?Q?uH2rxz/ioOmKGVcFNJmw0JUu3A/pR90oHGAXZKCtw3wSu4WkhLgNbzsMYlcc?=
 =?us-ascii?Q?Ay1YXjOh6NVecMP2jMpm5SEuHu1AVH1OIoLy5w7rdwN5mjiehQsoQNXJdJWv?=
 =?us-ascii?Q?CB1eylB9268/e/E0GeWTXtxpdHcVVYimnN0XJZuYCcTVBZh7pCiZ/hsENe5s?=
 =?us-ascii?Q?p+jb1Zq7cxVrhzgPh3RU7EuqwK3oqx1Gd+wBHtCvHlPVO4Een/x6hFE4XB+A?=
 =?us-ascii?Q?6qO1REwoqkV0GvnJ9I+neSdn5deiE70S3/W8In5b4io5eTPMS4VyaIQYTIiV?=
 =?us-ascii?Q?xfexnaFfiL/LIubd5rCDCdjbANELFYgNNluUnh6/HlWYLxc0/h+THU+p3oXO?=
 =?us-ascii?Q?jrVHLH3hMsnd42VRHXYo05bVhq6wRDyWPmcQLFto1RRpiT5R3i2rs+e2ANxE?=
 =?us-ascii?Q?NAarWtGTW2NCfO9fnbr2VJnTAx2CbWaETbvU5RW/kiUHDib2yLcE6yEztgtS?=
 =?us-ascii?Q?2k0PGBNsG9Oyl8KUt8p5BYO/Ci2QmxlAMh/GPxD4cD3aP/9zAKN4IeV5+FnU?=
 =?us-ascii?Q?RQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5565e9-5f28-4540-0c04-08dd3bbe2307
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 14:56:37.3739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LQMhaPaaBwsmm4ul9NyjmoyfzyrJoR83tl9EZOeI01aXTjRY9wHMBSnt0cctuB9pF5fvTy9NPjfZQHCjnGoFgrpHPlyV59aqOgP86hzKZZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
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

Hi,

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan B
Sent: Thursday, January 23, 2025 2:46 PM
To: igt-dev@lists.freedesktop.org
Cc: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>; B, Jeevan <jeevan=
.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Update modifier to linear fo=
r display version 30+

On latest platform tile-X is no longer supported, So for display version 30=
+ we can use linear tiling and tile-X for older platform.
This change accounts for the limitations of gem_set_tiling, which no longer=
 works on recent platforms and will not be supported on Xe drivers.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_rpm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index 990c=
50915..0f4da426b 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1188,6 +1188,12 @@ static void cursor_subtest(bool dpms)
 	int rc;
 	struct igt_fb cursor_fb1, cursor_fb2, cursor_fb3;
 	uint32_t crtc_id;
+	uint64_t modifier;
+
+	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >=3D 30)
+		modifier =3D DRM_FORMAT_MOD_LINEAR;
+	else
+		modifier =3D I915_FORMAT_MOD_X_TILED;
=20
 	disable_all_screens_and_wait(&ms_data);
=20
@@ -1199,7 +1205,7 @@ static void cursor_subtest(bool dpms)
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
+		      modifier, &cursor_fb3);
 By adding this check for x tiled and liner it will check based on platform=
 but...
the successor code which uses the cursor_fb3..
...
/* Cursor 3 was created with tiling and painted with a GTT mmap, so
         * hopefully it has some fences around it. */
        rc =3D drmModeRmFB(drm_fd, cursor_fb3.fb_id);
        igt_assert_eq(rc, 0);

If modifier was DRM_FORMAT_MOD_LINEAR then below code __gem_set_tiling call=
 become no-op.
As buffer already in linear layout operation below does nothing here.
And if we add check to run on linear by skip blow line, we might miss essen=
ce of the test.
      __gem_set_tiling(drm_fd, cursor_fb3.gem_handle, false, cursor_fb3.str=
ides[0]);
@Heikkila, Juha-pekka/@Syrjala, Ville could you please share your thoughts =
on it?
igt_assert(wait_for_suspended());
......
 	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
 	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
--
2.25.1

