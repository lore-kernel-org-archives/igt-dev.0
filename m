Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54790C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 12:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D954610E0D1;
	Wed, 29 Jan 2025 12:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgcvneCP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC6510E0D1
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 12:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738155166; x=1769691166;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+FOmyKA96Ilq/dF1pqqMUHeOUV/t9EHv1JpQywh3fd8=;
 b=CgcvneCPENggOf92LkEELYMsYuISntz1iTBvKUuoWcM2d0O9c726GIMq
 nZAlu7ykzwlLJCduFbw6SNaHx1WDQ7pzHCBiDhdbdOuCdIBKa9WvtbDRB
 4Bu/rYHbpvdfTBLU7EHlVpBIVfC0sF3STbQng5GRvjBRnGNnJ4a9CxXzX
 NxyrtSOkC323PW/nmdmKMTLKCPByDWq9RKgJ4V+RpuqjHUyA7TaZWecib
 PxjKTQaQMZR0QRvS9WbjB9cJ79/bVNjaetT/LKGZIPfwO2Bl7Lv4f/K+y
 3YlUWYsbbgy/36aa+6egcBDQ63v2hefotVIm+rZthfgugu0a+w4q9TAIe Q==;
X-CSE-ConnectionGUID: dJ4+CCe7Sl68+rIpBkHJ/Q==
X-CSE-MsgGUID: GNOaiOqzRc2773x3XY3ueg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38550999"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="38550999"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:52:46 -0800
X-CSE-ConnectionGUID: 4ae53wgDTa+Q9Cuxwk+snQ==
X-CSE-MsgGUID: 9Jwd0jYTT02x8bF6hJ1C7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="109608309"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 04:52:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 04:52:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 04:52:45 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 04:52:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpEmZIZzPoM3V60hNkR2vPW9ib7zb40SPVhS+VC8Q7JEJAfWjh9TmrycTQ+ySmClaflhaVQFrOG+/UP4+UhYV89DqY1mUIfsrd+VIvnAmQm6qpDOn5E9uPzX6ogmAO//4johRBbySz0pGl5Y88zvS4+T4l/lZjhVA9ETCAu0LTPaciNxNJ594DviKGoEERraPx4FOcEG4zBrsTkehPVDR0kAcPkha818rFGWdYDxQ4zxAe8J2vjwVibKAvCDMv2JGusqDTreX/T4+2HpPsHqFejzMacDTxssM0chv4N29Du6gZ8nMdtbBDsTBP/zIol60cwBFhGuB8az+E063VNHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FOmyKA96Ilq/dF1pqqMUHeOUV/t9EHv1JpQywh3fd8=;
 b=rOxSrRL0VhjpR9FnGo1hXCm0U5yqPXR7CR2ZXKj1YfOCZ8RcgRTdRafWXkAa3sf4qraoOMapkeXva9BAranBpgXQC8KBTCj76Z4wlBXmss4yLqLADoDSXuSeoWH6rpJyJlssk76tB6hBs2z/MfvF+cSdTr1vguj/pl+VqUDGdqOur8AFI7NfV85eqTzt47JH7teOfMjhjBEdrpX+H0pmSLJW1MFivvvu6kES4n0psPQ7dONWzn7ztLcFHOBJPtNDC0HNr8AL+4rCZyy5sV4EoVVQj1Ed5zmobjs8LRBulU4TPoYSP7DYkbmaabcLg7qpOqnOwzAR7D1s4Q0EvFmkpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by SA0PR11MB4720.namprd11.prod.outlook.com (2603:10b6:806:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 12:52:11 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%6]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 12:52:11 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 2/2] intel-ci/xe.blocklist: add i915 specific tests
Thread-Topic: [PATCH i-g-t 2/2] intel-ci/xe.blocklist: add i915 specific tests
Thread-Index: AQHbcNZDJB54JTpGoECaqsDQfsVIHrMttxgQ
Date: Wed, 29 Jan 2025 12:52:11 +0000
Message-ID: <PH0PR11MB480642453C1735753C27701BE4EE2@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250127162736.3451740-1-jeevan.b@intel.com>
 <20250127162736.3451740-3-jeevan.b@intel.com>
In-Reply-To: <20250127162736.3451740-3-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|SA0PR11MB4720:EE_
x-ms-office365-filtering-correlation-id: 6d100adf-510b-41b4-7931-08dd4063bf36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?n9Hk6Sbmx2t5WJ7lephqtB4RGYVhZjw5PFr498wLPipsvlLSGj0keTmALTdy?=
 =?us-ascii?Q?BbAq+eXB1cwctsDPRZi7aEs9Fu3YET5aMAnkOtP9DlAhDdzSmdwRK4QOGi0+?=
 =?us-ascii?Q?fpG93oIcDEC+Ose09fgldldBbQUUkb5LTH8YIz/8z0zWCUtxlmdoBMaXUQFO?=
 =?us-ascii?Q?HXGKpLHad7uUFiWiCxppcgCU4gxacnGOzHpxUvr1mPilO+ZWVOkHVttgmaAp?=
 =?us-ascii?Q?1ke+pEOMGp16AWwiGGM/SV6Cn1rIdFHPSZRJu1CILDalJP+6XVLX9zxy8iAQ?=
 =?us-ascii?Q?m6R6L/cq1q4xBtXZDxAThYk1O/iMHJdVqUhbLkUp4y5rkWhfd6X5QLOQPJUG?=
 =?us-ascii?Q?I5Eex6EOA9wWtz2U12tkWC6qNKJMKWJRXcdNoykxU0qA0IdHxgWI/vnkKawn?=
 =?us-ascii?Q?/SPEx9lbNioEVhSMeB3QpHrzjtOIH0RQtq7SOPWW4t/+nwkamlp4fH1QI1bG?=
 =?us-ascii?Q?S3ztdElrKettzalYrDhIQUcM95Eps6W8D7pcSzncGK6vOf8xxjJ2XmWpORnN?=
 =?us-ascii?Q?AO2XOv8R2WXHfP3CaG6wleibWIx9QMtZdmI/+KZjTnKiC9XH3q9NrdFdcMgp?=
 =?us-ascii?Q?Ptyu2gP5ESishNottrNgNzKh/iCBL0jJJrFmXKRAbfVUS1dK8v7qKHZxAF3S?=
 =?us-ascii?Q?URUMwRG8CZWdWGYMUh7g8793jmYKb4EAYmc9vTip39lcx/tv3Z0ve36UokAZ?=
 =?us-ascii?Q?o0FsLisoepHPXYMr0CkFqriTVbNGrQQbFkz2LG8JQuxN2d2UKVJ1XXceZKZ8?=
 =?us-ascii?Q?FItGUxumDm34l18xcXVsxZIdK0g9h1qW1MJZF23NP72dcp5lgsSHD2uQv6Nl?=
 =?us-ascii?Q?1RHb6UH9g4MbyfhETZbE420WeVxZJHRfgZ63HDDtuqRRPhaSOq4hjHByrl80?=
 =?us-ascii?Q?hkNiKG6S8TlW8yR09CdzoQkNGOitpdnDDgnbGWO/iRIJ9q+XCqANbUCJynBI?=
 =?us-ascii?Q?nwCi/lQ6T+2lrCtdLeGCeSJWvna4AWNwq3bZH5Pgs1gZNR3d7Es8yTH9skHM?=
 =?us-ascii?Q?nbxPizPNjLsgGiZ09xfvnwQ6p4MREGH+jx5hOxhDKfg1S40fZCXUiJeLCQwV?=
 =?us-ascii?Q?U8rBU3a6J+1UE7UDEQYxVl208DbyRxPEcTMeHQkhdXOuB6WyS8mRKIstGi2X?=
 =?us-ascii?Q?YCsRrvHFtxviL2d/EpNrcPTC6Ek3AliFLZBWeXRQAQ0H0ykVrg4sA13brpMn?=
 =?us-ascii?Q?1uZTh4njHL2GZj+rFF5IMQG1c0TRHvleTNBGt/+YSEWrxzQDR0gP/Hw7qywv?=
 =?us-ascii?Q?WEHm7bS0m2k9kDFacRkDLuh8yW2XLdnxesZ4X1RXhy9qioPj1teWal3XhYLr?=
 =?us-ascii?Q?fNZFePwnLWHeOpxP+E3CT+Cdpb263RnKrKNIaXp5l7DHK9kmuFrNaLGP0KZh?=
 =?us-ascii?Q?lr+FU+j45oLapBHbITwhgervB4k7U/RCasLkl1TS8NG0I6vJf6A9uo6BEuSM?=
 =?us-ascii?Q?K9y3O/6ZVRE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F/maVSwifUTAWMN+7WWqazx/x0YM3pV694nl/8a5k1JUbQ+ZG2G2TZRn6m74?=
 =?us-ascii?Q?FWQgeI1ENPOvckb7CMn1Paz36tc3A5t2NCwQnXI5b7BOy8VI7tdbW76HC1Pz?=
 =?us-ascii?Q?mDoFbxfB2VS6oLYE871ZbLqkqxGTkKOOitArtADGJTaZBJOwbdEyZyu1kI5t?=
 =?us-ascii?Q?lAxWfasi4B/FPAg8zkBGRKwSCGeSIh8mxitBWhXHKBGCUK5RyDGPQQZenvPb?=
 =?us-ascii?Q?rgYp8kKhLo8IIB12Sf9iCQLw60xvbdEGmKwVvOXq6lVpmowYWM/GXLY8ps1H?=
 =?us-ascii?Q?9Rvgu6ql7WWIWi8P9SGa97EkkhKKwVNStCr3elzJkGHKrP+ZMm/YQg6SSrw8?=
 =?us-ascii?Q?urc03+6NWU7mOTLO7bGTDa7MmdNM9uB1Z0N7J673BkC9Lr3vAN1b28ii97Wd?=
 =?us-ascii?Q?OLUB4v8860odlS4mH8U5aVenrs6r/F7KjEOrudVLlIIvlAyH3IijUBiw+Gvo?=
 =?us-ascii?Q?QdWa8USXBHRBDMV59ths1eeuVws/ZJa18ZKj/DKSBYZxroPTnwFijiI4pxuf?=
 =?us-ascii?Q?YB0OhnElQAWwImGUH4Ak6BrpXTcW80wY2pwB5TlCVsADf6uCRWheRszGzF5l?=
 =?us-ascii?Q?58DQp+LBl2KMnSyBfSzDSaz6BCPMr1XksJu5bI2jFki8qce/wdE08AReS5c4?=
 =?us-ascii?Q?bw7bG0RnOP8WxaCQ3Wsrmeoj6CiQDeHJT3oFbQmKpijiLSM/xQEcmFRxkQe1?=
 =?us-ascii?Q?jc+rcIwRQCcKPvmkR7I1OwHXqjvGzVeqnj/Jg6Fv3JErz9Dy2bqdZp1M2UJk?=
 =?us-ascii?Q?f9lQFdszvafrxzGLpZyJp6kFrXDP6XfPZvHPojJ6aUER6OT9LgrGzVi8GdpP?=
 =?us-ascii?Q?z5om6+Pojwlk5rUQdJe3FdkBZfbZR6+UrjXhjWXVmruYicnkUb3j00f7tMUC?=
 =?us-ascii?Q?N/+gIqLGPYx2pxShlzzXP7oS3CtT759EdwQlsTVq8YPuQWpfN4y284NS2yKE?=
 =?us-ascii?Q?mRSB+fISQStEp5ReYfcn06RId3gSMzUXDX4eGBC5FIpOu3UGvv9BuS3Y5ovm?=
 =?us-ascii?Q?uoz1a/3jCmxWVYnvlH6rhN5unZM3DHcbwE9Xtq678yIDEKN4q2DFA7j8sNcV?=
 =?us-ascii?Q?Ko3hRTO1PLHnPpvud2FDkCQ2Ds+hZYpeOdzYM9vE7Z9uIM5KzPKLMneWyMk9?=
 =?us-ascii?Q?0CqxKBUhN+USas6Fogp6LTGKL8ZWugcmbUv/sXP3tQJ3N/y3xdXT6QyR3ABK?=
 =?us-ascii?Q?dU5CwHAYCPdz3LrVpQaNeSdAnqJPoWY0487/cYpTtqo9BR0Td4tSFM7DBdXP?=
 =?us-ascii?Q?flILuAGJ7WMEUcUjfhXhWSO2nAaRzltuCUrE1mvp/G2iJ6Pw+Pxg8m963baf?=
 =?us-ascii?Q?sJSLG1qkjNk+bvVKFEObDsvtvwxDfsjSaskYlCg/Uav6K34erbZ/5MzTBSEV?=
 =?us-ascii?Q?RukpyCyLaHV3/3GckxsuD1wYi8N7ldOwX7Tkx8CkFStsHRGGG/a8b6QB4TWe?=
 =?us-ascii?Q?Zr2FpROX/JCVSajpO3HbnRmGSOfmJbAWkXLhgKCWXKDXKLik2YsB9/pmGypR?=
 =?us-ascii?Q?UGOAuYIDUHiXIddSiK/UZNNMto6g79kYem6Ig7ignIJPMYwgRdsaev//uFJI?=
 =?us-ascii?Q?+HGBBrqf7EvLo5Qtf3jixUmLX4kHG+XuHHcjqQTMy5YIwSC/Det9sAU+jLCr?=
 =?us-ascii?Q?Og=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d100adf-510b-41b4-7931-08dd4063bf36
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 12:52:11.0148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: exLXKmNryuKl5SXopCR2/Bffl8peb3Og34TqHMc9r8f6Cweb49WqNql3twYvXfFZcJcprzyk3LqFzTslxrLSeA+FrI4fTCycV738HNXtrKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4720
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan B
Sent: Monday, January 27, 2025 9:58 PM
To: igt-dev@lists.freedesktop.org
Cc: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>; B S, Karthik <kar=
thik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] intel-ci/xe.blocklist: add i915 specific tests

Add i915 pm specific tests to blocklist.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.=
txt index fc270198f..78df5393a 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -74,6 +74,8 @@ igt@kms_rotation_crc@exhaust-fences
 igt@kms_pm_lpsp@screens-disabled
 igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
 igt@kms_pm_rpm@.*pc8-residency.*
+igt@kms_pm_rpm@cursor
+igt@kms_pm_rpm@cursor-dpms
--->Can't we update these two tests in a single line ?
 ##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
--
2.25.1

