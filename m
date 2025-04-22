Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0758CC369D1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 17:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FB310E168;
	Tue, 22 Apr 2025 17:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nc1B147W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0D810E168
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 17:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745343618; x=1776879618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bo/j4n9Yd2n2QPjZHGhHoj19/titt5ZDngzih9lfEyY=;
 b=nc1B147W9iM4Bcpv5G0h6BOY2+cHk8jh+609dVL56H2DwdQ1ZGh0ZUm1
 GOleez+Wg9qC0O0bQy7GUnAvin+GAETrKyj8r3dh9bw/6CelGXL78btwU
 hQG53pjJE8AV5bP0/S/AHtBEyCM8S8H4q4H3wY7kjg8tGMvCCqUPiuxpb
 XfFxtwIE+85I1zckdB/Zt9OX9AMCaUOl00cQLLulKtJKCktOQAMOMkphG
 3iHeUOmiDAh81wS1cmnnhwLoStkpLIOLtppq4Bh3UrQSg8XO6BN+j6qDC
 krK/0JCQPA/KCxh8t/lArPBgi3Hx6Yft69YrHLKw31YUhjDWjuo6LdE2+ A==;
X-CSE-ConnectionGUID: UVG6+lrES/qXMNco6xjrCg==
X-CSE-MsgGUID: XzYBQCpCTZKSPNDSOEv/vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64445033"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="64445033"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:40:18 -0700
X-CSE-ConnectionGUID: +Vp8Hq4AQKeuZZKLNrzkMA==
X-CSE-MsgGUID: PKVsOa2aQhyucPlRZMzExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="163043698"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:40:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 10:40:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 10:40:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 10:40:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEy9A4O5kKjwilNczb7n6/iOTAOkmNnJhQUvrAtD7aUvINJWXwJvH3tdetMPYlwl4f4WsNCe684qSqMkPfR3CjzeQYoQ3eqHJXOi+FXTxpd56qlr+1+I01ZaXyEfePgnjUiCanjLxxKmzGD7KNWuk21MFY6XCBWIILVfI0GH4vuT00euWoz7EhgLgmSHhcgIczxC0jgbaWKT4d7MZo0lZefxTDEWuuFDKb7HyBUgozXtFuWX40qduGLbZJD3BlT4ljc4vblSlS0aV1FrBOGZShqqASq4j7xwvCOanjq1zkqEzH/NrS9gtSuf+eNNbR50Jd88C8oQAmympBT6LvdUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJDC8MAJ88MWtEdvBhbrlQ1TP1JNZeIMxzUWQMBfoTU=;
 b=o5ltwdaD+5lt5ozMWbLkDb47mURBbvgk5r8eH8+0E5D1b6nIBBUDX5PSfMmLnP0VlG+mDgvsBznqcX1OOzkfs4+qGb1N9pGF1ZKcCDadXaYy1NEs5a4dvuzYeWz3pRCKEmUmdKZJlVzXlQU+jHOXp3vImjsYI21kDOPqZy/NmDHcvr14pSzx90Lh+5cMlmUKM/b+FWkOHp9JpWMipgBDUd4ZxTQD0f0DtoPQjF0gdOSOt+afetPHckG6MnuXrtsjBeTPCKzf9PlijwT6ZFMksW1qRLYlZ5PPOSUT6jCJCalqMfj7lz/fJdwIxoDQG7Ms2AroBJ/x9VvE8HoqXT1jPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB5947.namprd11.prod.outlook.com (2603:10b6:806:23b::7)
 by SA1PR11MB8523.namprd11.prod.outlook.com (2603:10b6:806:3b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 17:39:55 +0000
Received: from SA1PR11MB5947.namprd11.prod.outlook.com
 ([fe80::8a1a:daf4:47b9:9bbb]) by SA1PR11MB5947.namprd11.prod.outlook.com
 ([fe80::8a1a:daf4:47b9:9bbb%7]) with mapi id 15.20.8655.030; Tue, 22 Apr 2025
 17:39:55 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>
Subject: RE: [PATCH i-g-t] intel/xe_test_config.json: add intel_sysfs_debugfs
Thread-Topic: [PATCH i-g-t] intel/xe_test_config.json: add intel_sysfs_debugfs
Thread-Index: AQHbs6mgljYMPdbro063X9W8AqkIOrOv8q+w
Date: Tue, 22 Apr 2025 17:39:55 +0000
Message-ID: <SA1PR11MB594712B524ADADC95128571385BB2@SA1PR11MB5947.namprd11.prod.outlook.com>
References: <20250422171125.137275-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250422171125.137275-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB5947:EE_|SA1PR11MB8523:EE_
x-ms-office365-filtering-correlation-id: 79396a11-2649-4d08-784b-08dd81c4b1e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4LbiML4gmDycTOrlv4QfLdvJx+HOPkICkIMTR0rPLpL+oXWGyBDKT5CkPOzD?=
 =?us-ascii?Q?iUMwr3O3J8TqtBAao3kiuncYo9iRXcxfWNsGepzJNbxCPWAArctmz7xmn/EU?=
 =?us-ascii?Q?35D5qlTr162HvkUF/ORkUVgqd0w+MptgTsJV9WR/4nLt7v3UzJskfCtcprWI?=
 =?us-ascii?Q?foZSYfU5M7PLDGVxRIsJ07UhPVBGlMHJaRBFkZ9A9jLS6J9Ry3A7aSBsS1CS?=
 =?us-ascii?Q?Vryv/ZhNyMHerUKyZlzw1dnK6yp3wdnb3bj6xiaHBbGE0Xl6axgfGx115jjz?=
 =?us-ascii?Q?2X58cPn+F1d4mHhrgglJWrSs1RcbnqdS5LPxNkerdg4Ao3ZhhKqGLGfTnRM7?=
 =?us-ascii?Q?wM7CR5cu7J/xLE7PYVF6DgyV1SO2vmQnMOwFf8WcBfJn092osqDs3WOTU+aV?=
 =?us-ascii?Q?OCCZbeddxqV1MdUFlGPQTIaEKs8ZQzQwj9apY3DQvSNIoPl6oinTEmvMi/ER?=
 =?us-ascii?Q?PdcbXFDfgIfv4KLfWKfhMVHWeUtpeziYgoOpPSBTO3CBnQIEAKxB3gp2DHyq?=
 =?us-ascii?Q?pzR+Hr7RXE8TZqzrMgkjF9O4M+dlPGKYxH5rmpGfwlpFzaoVs8HSryCoBVdi?=
 =?us-ascii?Q?vjdPIF8tXNODxytu3ebQ1NwsEG2m6DMNSdDULTcrT/KvfcwEFE5AaLsJiStl?=
 =?us-ascii?Q?FcCeFnpWpMnP1EPJRkAUZiVJXpNDeL3tBSQb/TRcrjkgB/yG5vJW9ffB70L+?=
 =?us-ascii?Q?ulANa4KNO7v1zeG9uvHLO5/W3w4XZe1l/lf/vmgXAw4WaYJ8io9ByPVHm24s?=
 =?us-ascii?Q?mqOC1nW4loJiSWwCPiUkirbkrHGRz84fL/f2kUJhbMjhUFCkBpW9ST35sEpS?=
 =?us-ascii?Q?iNAnmJ/v/vFuidbgHL8UYozJjajuCNO2Mi0P546AkHT9nT0zU1bHbrcF1KAN?=
 =?us-ascii?Q?BUZduc+VepUQERiS13QX/uqT+FbWKRx/C4gatGJdTDwoV9T9ZhTxf0aZvTJ6?=
 =?us-ascii?Q?uj/1FmmkxJxvcnJt3rWwa1bBcT/2XK+5Z586+DQhEWl6Q/+ijSXIDw0hdEIM?=
 =?us-ascii?Q?jOMv4OHKQ1Cl/0pFyToPBQZK/6norMEeYfzr/Z7F8r9ECo7c+EeNz85esxBG?=
 =?us-ascii?Q?sJ7F6V+uTCGaH28B/FQkaYv8KAPYimR2w6D2dZIJ0fVTaE/JXWvikxW9QYGv?=
 =?us-ascii?Q?g1O1hqTY6zmMLHvnVQS1AN85uWw7W8Ly89n3OHiajNQqP2NcsFrnWNUmiJnR?=
 =?us-ascii?Q?K9VJNVRf+StKqKtpRcDKXvobWpj955HkfIV/cMSzEwKdrGPWrWv+NfC43s1+?=
 =?us-ascii?Q?KvP7m0PbpafgcOasuqUMcKsRaRBBpjcSOzvmvznInwGWFEMaizHAZ49GQmQE?=
 =?us-ascii?Q?xO85JOrR4exgxTKTU4OHy4R4mloTMQcAXoBqI2BRyBgi6Fxmw0t76ieyc8EF?=
 =?us-ascii?Q?gKswEVcF3t9aD837dqaAHS/vHhx5bEO+rMsTURxcVIu9SAwSvhZ068J/zT8b?=
 =?us-ascii?Q?gffFXCn58Dva35eF6BXtSF8WfNobKt7yn5eqPN22qbOozFcPMd77O7KxjSyX?=
 =?us-ascii?Q?HHNbvfLUjUhWY9A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5947.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?caVyZN4CnSAhwMuyF+sqhS3xaMsqAeLnBub6/bGSWc9JzIQU0JyKxZi+8rcn?=
 =?us-ascii?Q?RQkXrRJo3eJczrfJeLEp7HwxYZbYZ3DqPMuq8Ohn9rWTDl5p0VZ2SuzIR+YB?=
 =?us-ascii?Q?RFG6baMLzySZnRBiFXNqD1PDGv6XayFJvWrPBuZ5hoPqMSONS7IZA7Amtfe9?=
 =?us-ascii?Q?cxx3j+CNT0UhSe1qbxgLIqdToVhZLg/8bgthGsegfWuq3Bk7bIhMxfH4FAXP?=
 =?us-ascii?Q?GvvPrQKnztklSHPj335VCxjy2xxzO21u3nn5p9KIj8pqkl2ZdKbNttHMAkEa?=
 =?us-ascii?Q?ZOCXlo4ycyBvRW2flLBlv2DjI2eacPitGOjGw0yIXBnRV+DfS7ox0+IWCrhU?=
 =?us-ascii?Q?CjP4Nzv/VOmk7gAwETmU8gTWClQv02s7xcJJxuXn+stIvZNqy28SrgJe418y?=
 =?us-ascii?Q?z/s5aEspG66uvQ5X9F2hKsbI5cABiFHOLSiz18+58EiuIjoIFHPUz7MPoKKm?=
 =?us-ascii?Q?w9rD7lLU9uJzcB3gwPDXpI8iA9xDzprWHSUIA+e3/RNvtFxYtbedhgmK7N/g?=
 =?us-ascii?Q?fZHhpVpkX1sCyIIFmQNfAIUfUx89B/APzd1j03GL09CGQXtdtPdXuD6rcSKq?=
 =?us-ascii?Q?P0ZlWgvgNLtezYiR0tXy2agXbwTmO5wXTDx3SD/Jj39sKtfFjp3YxLoPC6Cb?=
 =?us-ascii?Q?Be00kj9ThIEzQhludXjuidv0J7f8We38F0g66B1VwtHuA2wkGnHcVL+oNYfx?=
 =?us-ascii?Q?PeANuOukMXNJltBZ9LN+dGLtJqtZP69jcKZHpuSL0yKig36Mtbp8ATafV1fU?=
 =?us-ascii?Q?K0CtTmmpPVBZCN2O/9qKhMZ39hFg3mcyEETNWQi6uX+QvenKLHP+v9Ae0+N6?=
 =?us-ascii?Q?s0NGAouAamM/Dkadrtbq+emzOUYvcY/fmv0YPIc6Xq3gJrsh0hDrLjNpusKN?=
 =?us-ascii?Q?JqvK56wQmY8yb+M3RPHOwKDyQdhaXBPkvOiBUEFu1BF2wQAAu1Z0gzO/aZIb?=
 =?us-ascii?Q?l4blu4kWjJmvc39x8AiH72NVYD4JF/kx7ZV7ce7gtI1EpjPMD59+rGVBrlrE?=
 =?us-ascii?Q?buGkbYstM1D66HZGu0GDUcQh+E6OYMiCO1pQDmyfm86hN/O50pn6lnAYVGa5?=
 =?us-ascii?Q?FvzMQikQ6l9qxJiaoxq9B3DhFyyfy9+fDtsWcsSffXP3wCHtOul7KI+RJ6fY?=
 =?us-ascii?Q?N+XTY3UHDbfhsludOPq/YZx/Q5etxJxv2NmwEBKhVEzTTBeG0Z7pvsK6Y261?=
 =?us-ascii?Q?qAuepUNLhRDWMNwcjVb3DlvcWq3YIQc/wfbFrvjQv1oAcyyttGNgDZM8k817?=
 =?us-ascii?Q?Zb5q9huhTS3ofPle9Zhe1POKIJBZaaSNpcvpulnDkHwf3DOUEGg0fWnF2Qbu?=
 =?us-ascii?Q?AQzg6Jj8wDI3AeN6++1FfkVHpRLBOxK/Oz/WIE3iix1IcuMAkOmk0UnHSkO9?=
 =?us-ascii?Q?6yLVN/3QJ2tI426i0omkbH/pvgadOMzzUZLwc7N7QqtWjxRCKZEi/APLGfzv?=
 =?us-ascii?Q?hzxTQiSX+nCkykcj5Bnn20KNwuzuAwcptku93J/60w9BHCWcVers8Xu6GPNN?=
 =?us-ascii?Q?wfoxpjE3ZuDn54iq+YStvaf2717G5acZlrtcUDll/cnVaMJIdtyWZCnjfK5b?=
 =?us-ascii?Q?NgOqLBwrU/FyyUlt03+NUw2YmaJmrw8xhInQlAF6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5947.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79396a11-2649-4d08-784b-08dd81c4b1e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 17:39:55.4304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AnPX1/Gbb+Qx1uvQJlot31ogI3ljibU6SEMi+lQXwsQYQ16QSi0RfISckClGwMookCaqiOAfwreUNuVyMy/SVt03eILdeag/z4UFweQf2Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8523
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
Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Sent: Tuesday, April 22, 2025 10:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; Gandi, Ramadevi <ramadevi.gandi@intel.com>;
> Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Peter Senna
> Tschudin <peter.senna@linux.intel.com>
> Subject: [PATCH i-g-t] intel/xe_test_config.json: add intel_sysfs_debugfs
>=20
> Add missing intel_sysfs_debugfs, after a unify it was missing in testlist
> generated for Xe.
>=20
> Fixes: 68f75d1dd410 ("tests/intel/intel_sysfs_debugfs Unify sysfs and
> debugfs testing")
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_test_config.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config=
.json
> index 4556025f7..b33485c96 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -2,7 +2,7 @@
>      "description": "JSON file to be used to parse Xe documentation",
>      "name": "Tests for Xe Driver",
>      "drivers": [ "xe" ],
> -    "files": [ "xe_*.c", "../core_*.c", "../sriov_basic.c", "intel_hwmon=
.c" ],
> +    "files": [ "xe_*.c", "../core_*.c", "../sriov_basic.c",
> + "intel_hwmon.c", "intel_sysfs_debugfs.c" ],
>      "fields": {
>          "Run type": {
>              "_properties_": {
> --
> 2.49.0

