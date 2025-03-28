Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA49C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 12:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFC110E9F3;
	Fri, 28 Mar 2025 12:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSimLImU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DC210E9F3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743163232; x=1774699232;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ek+SRDKIn+oXouK7cDngKCn9IpxalnwHZbnxMIM8yVQ=;
 b=WSimLImUYb9Y45/Qqz4abZR9hBjKe5dYy2B/HNYcLRjdnTvAYHJIEqwD
 Uu20XiiBNp17mjleV56R8VSlIw1dXj6SdH6bWnT/Nm++57CdCUuJaNM24
 DPC0d1YmmofF+bW/A9A3D2E4lCXTnrszUAQfP782jZRi6Dg6N83CizoU9
 8/M1YNYDYCjE8xSWIeQRISW6qeBS7rZFr72ngiX+rnYyGD2gWTsrOBbOT
 WDsdLw65l9SgMbfX+eUPh0CA6UYaXGO1P2EL0PLY4HSeVJoqjNnHAe4yr
 UQasB71DZEZzjs7yoYPO4xTXobjExhHenZD1WBu/9eJtq5VnDfMINzFo5 w==;
X-CSE-ConnectionGUID: FJbmivIVS1qAVb+Ebk/SBg==
X-CSE-MsgGUID: FVnIxlpaSnq4abh0GOAmBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48304236"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="48304236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:00:32 -0700
X-CSE-ConnectionGUID: 83nmk05dQEuwZOn8UYtbLQ==
X-CSE-MsgGUID: FYO7j8SrQ76a/JMHMmhI7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="162666298"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 05:00:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 05:00:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 05:00:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 05:00:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/E8qiAxBVYNSwrSxZO/dLBwbWk/P7Bcea1k7vkDh+qV9gDaIMYkIDInTmNTWtfoM3ss47STx/ID0gpuO0TsqCqZCe8xWE0a4qpYDziXCLZBDAhq3gMebdVNOC9rL+TnF5dPWIDniPytX3sykB1n3FDbE9zDfPynFIXa11CLJy6mtlxpcfU3UyZsmhMi81rylix1fZ+9gHfyQ7Nl3MDERwlnWQs5g2iMQ65hFJ5NAhw8FVL36r2UgWZRhniFxw67WzxH6GD50Malkx4xI6ICo1aSjleSkUbxO+E1cTzGBQfbtsmcwZ2lv+enWIxR1mwqMXirGCS8cOnO2vhl4N4ncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P3Z2xdNCDGNOrsv5ogjnvSv1rqnvialxtpagHbfLB8=;
 b=uqLVZm5D1Nl7FKY+ZiPp/mzGpmxv5GlguiVzgHIlRh6IB6c1Dvb0xrEwzZVDtqdIQ47xIzl5HkwdCOwL8CoaSNFsKk0wxWHUVFIfhkKPYyZrRrP4DSGYo4HGpag2DQY/F+UiBrUqDQTSYLCcDndVJ+cTuuvuxD7Omhfs00lGCJZi6KH6rLUDDbsqT9RXAsFSVaOvCvf1L6Vq/ArLDzZlFp3Poxw1Q9EQSr13sg2CZHwGhc1yKLPSzUvo9S59SiL0H0kvZTnyMVfmG+ceK6nXWeU6t3EO9hiwJPW4t5ZVF3nNz1+sTaz3eLokDpWHx8DeR/BHOpWpuVrIJeWhuGfmGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 by SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 12:00:28 +0000
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d]) by SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 12:00:28 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci/meson.build: Add missing
 xe-sriov-vm.blocklist.txt
Thread-Topic: [PATCH i-g-t] intel-ci/meson.build: Add missing
 xe-sriov-vm.blocklist.txt
Thread-Index: AQHbnzsINodZfyggyE2qoocB7hfkHbOIcvbA
Date: Fri, 28 Mar 2025 12:00:28 +0000
Message-ID: <SJ0PR11MB669671BEDD04AD45BB61F11BACA02@SJ0PR11MB6696.namprd11.prod.outlook.com>
References: <20250327170925.705874-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250327170925.705874-1-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6696:EE_|SA1PR11MB5825:EE_
x-ms-office365-filtering-correlation-id: 769914d2-473b-4b87-79e6-08dd6df021c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?T64r57JIFZU2F6ltcetGgA0j5VSkA5e4vfdpxEyoq9O39nmnGkc7fio1OoCD?=
 =?us-ascii?Q?3N7/z3lmoTE+nrt66O1uYimLtCkERq/d4GCAqd4g2cMVmUecZbaKgpovqi6y?=
 =?us-ascii?Q?op+xQAcw6AuH7rNkGL1rap1281J6bx/EXnAW41bns1O8bcYQv6NirOKP/CWO?=
 =?us-ascii?Q?2KHHGlY5Avp3Kf75QT2Fg+lENf58OO4JnHq++A3tniraWM9lUe9JJLpjpLqB?=
 =?us-ascii?Q?/RERldFZEqBQFyO4fNsRo6TJzQKREl3JRWQuH/UtZ04uy4T28zk4uwi7+DNo?=
 =?us-ascii?Q?yNPIFjurl6oYwNTJ1+3RdzpXbCh05a7O4OE33cFbVxDKO4h1SufSIGjE9ULU?=
 =?us-ascii?Q?DdZkiTB+RZWHhwvlVW9D0K98QrrCGQENwxRxtC5KVXLcfGYQOois8P7VCVx0?=
 =?us-ascii?Q?Q7p/1NVIfZZhbSPT1zQnBaxf8WkIYtC3w4bhFLIk7w5Z0uQdiuZmea6zmnFL?=
 =?us-ascii?Q?pumdGYQXL9gi7MJ5hoGwVscrl/7rbc3xjOwGcPkbztBVAmXpgg/bRxDOqqny?=
 =?us-ascii?Q?PEP3UBzEU2TVeP1hnqpl1DXpV/eYGEFFKnK2p1JAd7B5hU/zPeIbS84yLWPU?=
 =?us-ascii?Q?XJFqS30NnKMAxUQTZRzwOKin1zMJtDhlSUHAJq0KMPJakY2FDrzuXS9MakN6?=
 =?us-ascii?Q?cuqq3E7KPekJ0D0u6Jp02lRS88EFlYknVBd/dx7AAeEC+4zYYv4HtcjUd0ls?=
 =?us-ascii?Q?cwy1rAPYotSlnMXboWwzEbH+RkpQFjXljI9ST5jZg3ryvUSGpu2DKB/h+xEu?=
 =?us-ascii?Q?4BHqKra3/ZizPTluBeNffMhA675+p/62cjGdDpfK2z+6bOWjsbfZL5T7K7Rx?=
 =?us-ascii?Q?Hd7/epmWNkGwoQEQQGa1/5Wy/mLwrHvHFNZNq3aMKaCX+pI/5J5Ai2tnebKk?=
 =?us-ascii?Q?7b/8hNhc0VS5HYH/zy0QCGRdM3NpucJmRHoaXhs8YQhN/qhYf7MDwMB2pc35?=
 =?us-ascii?Q?OzA91rXO6bTgKHTEEkGaS5NE2TrAhlKdi2Uz8gsuio3ByRdJBNPr1LowZRgp?=
 =?us-ascii?Q?HOT2JTimlW4k8vKSmmcKLjIcBpQ90805afCdBQB6CgkwL9AmtGKQCT+IqCb7?=
 =?us-ascii?Q?4xTX22I+YXMd3h2QXyfzQuNBbBcHSLEW8qrQLnlvFUaayhn1hmbx6ufJ7aji?=
 =?us-ascii?Q?yrUVnUomIEGi2tgHFyyAnnadEDIyTJefMf7+j6plieRJr9MtbnrUkxbwQWz2?=
 =?us-ascii?Q?WFZxmB+88tC7S800oxyKyPDZITIbxnnlRFokUvu0yLjdsEtlLQW5PhZGNaIM?=
 =?us-ascii?Q?B+aT9hyka6tHGIkhtiJ1nE1eufSmBplmhNEtIbCp7rlbSKQ/phJ406r4Rvbq?=
 =?us-ascii?Q?JYA0QmohsvVSWj+hXGszVMqcGKFiHmReFWHEn7AAAT3zahQSQ28wbr7N7zvU?=
 =?us-ascii?Q?cmreMTH9CXHVp5UFJ/i7SOxyUSyhN0JEzELOOBzFYm1k6tQ9+aTauKXh27L5?=
 =?us-ascii?Q?3RcMPO6o4lAuMXd6UbQD45j5k+arnqwd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6696.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8FIWwQSEKzKBVUMRdRjYiZwoO3mTf/1B8ixukL3ma9hkg+Av5tYJFGLTlDSm?=
 =?us-ascii?Q?byY2vvDv9AIQ5PYuKactmIdvboVOW+nE9GvY+1spwhL0ZIN0URike5pCuW/t?=
 =?us-ascii?Q?xJ+WUOTm0fNR4ARXiABTDBS36y4NJiQ60WKSFEo/K9DPVq788Uq6eQVJXzAj?=
 =?us-ascii?Q?UKn6lTgm93R2Rgh3Vj+UflwCwmbiE9x3DkdhHbNWR+gbvMwDn5KOJsivR3XK?=
 =?us-ascii?Q?dqDdo2NoAaA/D+0uZtnonnXEW1nZmRfp6RLknlhCDc2wbNo5jM88sPX1QF0H?=
 =?us-ascii?Q?PvbUa3Eg+GZfldOjs/8zFNYNVUTinkr1XLMoIwwKELeCYXPgq5mBFoNEOx8X?=
 =?us-ascii?Q?JC1oo3WBcqCf0xwM6paewJrjHfhiwinGq2DwW1u5PhThUXPWCkqmerQ4Z2bA?=
 =?us-ascii?Q?9GTu0D8ntcaUh3xY+R3Hc43eOUcGbbS9GeuI2uUy82yllzt9TijqEnDlt4aP?=
 =?us-ascii?Q?Ejj1U0p+hax7KKs9kO6aJmCrIPOsn0QqJ5CnY5cGN8584Y8UBiE8FIj6FgN/?=
 =?us-ascii?Q?chK6gjL1+Nag3Wksh6qYOC6lX+O4CPRzNm/79pm2E4eHv8TDbzD21xowNpTo?=
 =?us-ascii?Q?7TlXpX3OPz0W0PJRMPXZmAO/2VYxEbsH/Ui5zNHYQk6NzrzSS2CyuxXI/PHY?=
 =?us-ascii?Q?6+VIndvHgqKyWFMGtp1zumT72MNDkfSouOn6XM+kL7CssDZF00bqwLrpzWpB?=
 =?us-ascii?Q?0QW9usFnWsyYVAoRR4w72K8rqAjFiJYSwrRFDm175AdjiondCDvx95VBP19P?=
 =?us-ascii?Q?jHurKp8kzMJUI4f/P2aGn1HOlS5vfmapk0vZLCiSNJpXQBOnWN48IZWMGDVB?=
 =?us-ascii?Q?PA1MSg5bFefoDtDygfAMPXzLCsaNa3fzBz66Z/nuP7QvtQudRudJ3lioOOfS?=
 =?us-ascii?Q?mNihTc/iTExBx0q43TFPyTx09aEzvUpPgI4pxv7c3T4vHNswQ791dwtgsrfx?=
 =?us-ascii?Q?PRB4dSo5hE2Q5DYLgODODjuPCn3OzAma8Q/XNMGm6E7kMUmeFb/kED+YUZ9Q?=
 =?us-ascii?Q?bam06tldm4P1YReEs16wcDMj5Iy0BEgz+rdopR6HC4VZCyCXr+5Q2VEPwaBn?=
 =?us-ascii?Q?GEdyB61XieyAZGX1RKP1w30SRwy95dQuFOCaG9at+oHbUEvq1FLL6HqDmGr5?=
 =?us-ascii?Q?p6ivsUZOdtmSuhSXzzdRz4PbrlEn81uhAKrSAt/1p6uUmwD1GdQy+Rh/J2xj?=
 =?us-ascii?Q?5TPCXNgYvoTKBD+8jJup5uzxl71GoOAcEWdfpAY8eg1bcA6eFL5jLUUKeXfE?=
 =?us-ascii?Q?oLqI2i1m7gmD4LjknTOjWtX8ryGuqf1V0H0u6hP78evDLmintTswZz8ghqtv?=
 =?us-ascii?Q?1oV4+rytLpPOX1ojzlwefUBXAC7IQrev9dqfzVRuYrcZYT6BeFnosALud5xg?=
 =?us-ascii?Q?IhG7+PE0tHF57TbEwGpmAXBO7FdLgJVyiXkkLBqjT04n2XwIyjLMwvU0umCi?=
 =?us-ascii?Q?va+uNC41nCHIGKHkMhAfHVP+8crASkAuWfqfV8VcV8s2RoKESceyK0Er/Hsi?=
 =?us-ascii?Q?SExtULTbfomXtAA1qthOQ+1xkqaUMWvTxhTyBpfM5POrMbNHSxGhkv4Wig9A?=
 =?us-ascii?Q?YM9Rv3R0mTzY1zM/SbUsRdcmMUGvz6UkPaJc49y9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6696.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769914d2-473b-4b87-79e6-08dd6df021c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 12:00:28.2532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tw8t9AzNnIlASVjKgbXGTreyp6MJAHUt6GAIIVIXHMQ79OQ5cluylYBUWe61wjDlLUrZ0+F/S8K37s1t7hB1j9GUFM72xR0LxKLWmg0eqjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5825
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

LGTM,
Reviewed-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

-----Original Message-----
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>=20
Sent: Thursday, March 27, 2025 6:09 PM
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>; Adam Miszczak =
<adam.miszczak@linux.intel.com>; Kolakowski, Jakub1 <jakub1.kolakowski@inte=
l.com>; Kamil Konieczny <kamil.konieczny@linux.intel.com>; Laguna, Lukasz <=
lukasz.laguna@intel.com>
Subject: [PATCH i-g-t] intel-ci/meson.build: Add missing xe-sriov-vm.blockl=
ist.txt

Add the missing blocklist file so it can be used in CI.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build index =
59323eda9..b6f1357cb 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -12,6 +12,7 @@ intelci_files =3D [
   'xe-fast-feedback.testlist',
   'xe-fast-feedback-chamelium-only.testlist',
   'xe-sriov-vf.blocklist.txt',
+  'xe-sriov-vm.blocklist.txt',
 ]
=20
 install_data(sources : intelci_files, install_dir : datadir)
--
2.31.1

