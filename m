Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6F8CCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 12:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AB910E2B3;
	Tue, 30 Sep 2025 12:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDWqBKZZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A8010E2B2
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 12:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759235034; x=1790771034;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YZC2ToEwdNXp7mq/NWJMOuCacw3x1H3j6dd1E/byMDY=;
 b=eDWqBKZZxpMdiOg35rfLCjHlWlGvgRqgl7og5fN+Da30SpLKe2CGGGkC
 ByU2K9ThugyKCTxqoPZP9Ztp0Q+9/RI3a+2zouGS8POoE3AdjFm12MXfc
 orVXVoXlP6YssOSmkoP+VM8lNuwbw8R0hrguSM9xzObJEBFZFAYnsfM+4
 MVEhkgR2HwRP6cvtozIYRl3z5QJNWTxvp2ktPyJvrFkKOTMR4CR6mRrtK
 7i8mrlPBEbH6mEqgnbKAMj66A/gBrxcuwrkgZIu0TNC6//fmocsWxkCLR
 5phi+/MRpaXpju4fRXoSz6r73gFPbMnzrWr+EhSog2y1oCFBedLGlkiBP g==;
X-CSE-ConnectionGUID: SJN3axwPS/Cx+INOy7SqxQ==
X-CSE-MsgGUID: cQfKhSeVTvuBp9qnqhXHNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72590285"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72590285"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 05:23:54 -0700
X-CSE-ConnectionGUID: 2JBwGRq/TouNvScIMFkE+g==
X-CSE-MsgGUID: Jd6yWOfnSqmpswqesTrTkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="215658757"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 05:23:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 05:23:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 05:23:52 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.12)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 05:23:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkbaUxV5AQs3S2+m0iNCFx2XJgQptmDMWk2PV1LjpT6d5pTnRoWIOsuL0sBHsM0hq0vR4oJ+OV6FTP4asZ11G7kZUJljvPQxzX2aOWREfiliKK4cDStV2aYyPiZVjC5/FJWYgzzZqSnWl8EnzetFfQR2sgUyajaJi2DHEREesAKQ3x9STPuS2eT8b5XGlRhIhkD1gnMGqAbuUaYayefZPaNf2p+MGwc7qFe+boXrCHmsBvHN9yawsasHOBV2Xuqz16BFMZF+8NwNMda7lf3cztzvdXnBnMCOQ1vwf/+aOlJ1xrJigo8Prlx0p1iCHZgLOrXMEIYDM9o5QQDd58ZFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZX/ZDOkX0cUPC8S/wet1nUWFAGPq9ZZoYt2f2hftJs=;
 b=GizknYyrZ461aabB5UR26su1vnSvCOL56LfDgIONIdhjqOmpoVv3uS7tAr2JwXkOS0z91J4fbPvCYUyUIq3DANTd6aCA+Jg5PF29qeczIJ0nVgngTHQT8Ritx2aMmbbjK6Rg4c5HB8A0mC+SQu6tbOvp9ChPwAVr3IN9Z0aqRw3faLf7x4uQRD1N8O/+W/oalnqHwRmgI7lHYMcv02II7VqpJ9j0JTQNregS5Y83eWTS9HKpbH2TTAzA47TEYE8U/f4pnLDrjb6iEbzxV2hmfD6dPyoarKDjJOzLp9daKgc7SIE4865eFG2KZ5H1quYveAv05Xy2fDZo7m3Qdpzchw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by IA0PR11MB7186.namprd11.prod.outlook.com (2603:10b6:208:442::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 12:23:50 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 12:23:48 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1 3/4] tests/core_getstats: Create basic subtest
Thread-Topic: [PATCH i-g-t v1 3/4] tests/core_getstats: Create basic subtest
Thread-Index: AQHcKYemSm8Y56mdy0mkLAvbHeVcc7Srtjhg
Date: Tue, 30 Sep 2025 12:23:48 +0000
Message-ID: <PH0PR11MB48064CD0915A835BA7FC231BE41AA@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250919170510.154992-1-kamil.konieczny@linux.intel.com>
 <20250919170510.154992-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250919170510.154992-4-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|IA0PR11MB7186:EE_
x-ms-office365-filtering-correlation-id: d624ccd2-e55b-4970-925f-08de001c354a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?vgLLYwzwAGJpRc3/cfNdw8zrNhYCC8O+w20bHN4bBJ5x4x/Pg9sVWxuCQDb0?=
 =?us-ascii?Q?Yiz7HTA5hpwzkzLp0ESMIGLs6eJdJO+Ha2v6nk1U2KEOfV8fH3INWrGmI4DP?=
 =?us-ascii?Q?wTLT7B8AMRxzK++Hum0StJMZQYoaXCigSnP/aPFxf6onEcjJIid3VTOJyCxG?=
 =?us-ascii?Q?7YqcffTcrSCE+cxF2pWCEruOlklP+RaTToeQd8qCXAMPxyqT9fIJTVHvFLRv?=
 =?us-ascii?Q?PVw7u6EjKaUmsQOdZI1eMY7FBd1flllJzTXUMPRJ80gHHMhr9iC5boP2Mhyt?=
 =?us-ascii?Q?kOm7jqK+Am6C4d+tp0B/uyncBfsHSCX/IkTJ7jKEjmnXSqHZSeL3jguNfBbr?=
 =?us-ascii?Q?4sDykJyMeb7eXPzAxWm2DjXodExrxcZIMgsonZSYLbLC8kHjLBQ59KN+Tchs?=
 =?us-ascii?Q?v9BhMMtkMLagCYx5EdZu+hgLQa0oNcRI8u0WbvxIKb5QtqiXOSRd9Zdaw1lf?=
 =?us-ascii?Q?7neq5OwEKziwKaB8E0hTENPRAsnpNFYyYnXC7g7oxJpRRZFr1uudkuMo/15U?=
 =?us-ascii?Q?pKqKQrJdevD5+8tS3WL0aRpTHa87wcxlliEEabBN5jB2tqBnXsue8TphNQQ7?=
 =?us-ascii?Q?8ZuI6u25FSmdTgd4DetKqshY8NHZhlTg5viI9QfVzgrViBrKoFP73sReHINi?=
 =?us-ascii?Q?2jbcJs6Bc51PjQEuypMGNNtm7eD/xSZ/rkS9KUINIAD4d5N9l4i7WnpBdIq8?=
 =?us-ascii?Q?yc96oTsLbXpkaJcehtvtQ2K29LamWZ7LmZa8naBte55t7jrRDBMd8jNeItcn?=
 =?us-ascii?Q?aspqtv1uFOKTL5Cja5dFWgxHhPX/K95cNItcMiurH3L5rPa1aQ4DxKJJiX6u?=
 =?us-ascii?Q?EhEpFGTZ8dEzcox9wiLxoxoJOO8GH/n1iQzegsKPTem0OrQNfLgi7DhHVr75?=
 =?us-ascii?Q?3H1VLG10jlzWlYOSKK+79GlOxuYVIaoFOxlhVrGqX2nVts52NBM0a/N4Kg0S?=
 =?us-ascii?Q?rKShiucCWL1gmPObmwLWUAxNS7xgQAR4Nha2onFDZtVbs6lT8Nuj0x8Sq6aP?=
 =?us-ascii?Q?MvegcWZyiPMQzdDz0Q7kH4fR92ssqgaJ+L8xRczrQWvDmunt/rMWKfMzoN2E?=
 =?us-ascii?Q?rzSWDUbufgKOkMEW3M5780iJIXfoBYuHpv9BjPLhaX0Reo6RcpJHXfZWY+fW?=
 =?us-ascii?Q?UnVHYMnVB4YpONErTTTrtvnKk4wDZSQDK1R4/eaJqv2fR9DrI8fSDXPdmtfh?=
 =?us-ascii?Q?2k4VqFxesSDyemqR6G9m25q2g1UodCAU9EtPvyXy4locDAnKAYI30iq56rOB?=
 =?us-ascii?Q?sJlGXE4HDlHeg+EwtO/KmAEYATYtzaCW5BPi+DprSsFpx33GxY+sgJbxTD1O?=
 =?us-ascii?Q?7dh3N+88oA4wfQ8G1MzwCG3Q3tiXeYviYcPq1aW4GsjrHZTwcbDxbmFo3bE6?=
 =?us-ascii?Q?hDNJDEgdNOGwjXAxJgkRD59aNWn2WgM+viRr6b+Sy/TOFBIxXPQzMlKxM8js?=
 =?us-ascii?Q?zhs1rYRV5/XKRAKuh1RbeAjlVJ17h/I5hX8HhdseKvoZgTxe866zIlUnDyG9?=
 =?us-ascii?Q?0SIC/dzVrIlbK3SWIdwGepZoltYnB1xhTasZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W/JaTg/LZDvPKLIXy1IXsH5uZKzBua63BawCR9y4i3OR+Gknx27z1PHYQib5?=
 =?us-ascii?Q?jCf1BfmWmiuCghIraeyYY35bbpZnbX60RiwiD1LBWQwYHmV3oZYWYHBzcOsm?=
 =?us-ascii?Q?r3rov4//UvVKuKNjyNuJYGuHL/fo7fgJ7C1F6LD6cMnqJT3xIKWqyixd8pgh?=
 =?us-ascii?Q?op2b4Be1hmmdvTEzbGA1JO1uB1VWCPCVLksRUmlhuINVD8wVNSHnahwintez?=
 =?us-ascii?Q?93+qxHrdoFjJS88eoOFqI5KGp1PyxE/PpatLQ+7nB7k0kr0fcuaI5/iG4OuH?=
 =?us-ascii?Q?e+Od07e28VlRSWtDicsfjjgEHZVBz9YgVW2S+65VWbQVscYAFepJvdZ7qCcx?=
 =?us-ascii?Q?OFOPl83kU5/DC2eeZQweK5tV6IkpUUnPy5ejNMPyyBAAihTu4lokrLHGeIMN?=
 =?us-ascii?Q?Owb+ZzF3SD6XdbrWvUPLUU6Npdi/UecMipWMODPjaxyfw7iA1pced8YROuoy?=
 =?us-ascii?Q?jFoPOb6uuNHcUgwSFEwtB+J8xnxrOVXJS94HFQvxFJvDuSlqcE7FIlwjDWbZ?=
 =?us-ascii?Q?AIx0BNOIkfWqjzRQ0bIUa/sqFN3tfxTl8Z2cbKGxdZQN2Mbd7AhQ2+9iMAoe?=
 =?us-ascii?Q?kZ+Q/twRjRbPhZQiTATmRamO8YPLEEgUnACY0gfdbgTSRGBbLRBEb+8W8sOA?=
 =?us-ascii?Q?y8MOF5XoHUg1BtC20kKWm4RQkMM6AzPtGuqJbdXWNhpuGNtBjyySWWHuwZNa?=
 =?us-ascii?Q?JgbgXIbi7nAisaygjkEouPkcL2++W88vVUFpdct1THLpTntnpd7fs9cwQ1FR?=
 =?us-ascii?Q?+HGn90d757tkfDcV6KhEKaroVYTOy2k7QqKrH4i9OIP7IQOujLPoqv8j0n3W?=
 =?us-ascii?Q?Zd2gc3Dur8bJ9IVsMbPCEtfWlI9VgXduvS4uHs7GL0CSrIf2iepPNDoC1ENk?=
 =?us-ascii?Q?/mhpJOYIqH59IKXuQMJnhCVCL401yPCug8SsTQK/FLwZAUFaSOT3TvQI2zCt?=
 =?us-ascii?Q?dLXPHEJu4NE5Q0/OqSwtheN96hVaz7CAEIyCv56lkMs1GZ7FFDFf5R/Fbinc?=
 =?us-ascii?Q?8f6B7kddzoglug1KsQ7WaAUJJHz+Ml/RSQEVB3/90hoEsloUO9K3SB9y++gI?=
 =?us-ascii?Q?Y0TqlZwfNOvZ3Gza2PnJdjdsrCnE/zUJyBMl5MltGtPvfF9noVmx4lFzS7IX?=
 =?us-ascii?Q?W57h2D8xxUjI8x40GhRCX/Iw2jaUvKTC1xcQnslpp8HTLMoUmvFqjODQGx83?=
 =?us-ascii?Q?GujioCAVwFnpKExqSc6zqWGRKoCb5D+qOTKWYj4zsL8LsDqlme+PC0SI5vdG?=
 =?us-ascii?Q?Jhsdk75YvDXLbu2Yr191WJfBIH9HLr8S1xvGL5XwIuDRbRuMYltZ9qpaxM+S?=
 =?us-ascii?Q?mlfxqHdc7qPUZnA3wuI8tMowBcU0qjqU75YEaY1iiifgSLRX2HSUcFaaYQNz?=
 =?us-ascii?Q?yphJf9k6H+2+kE5M2U5Za6TzvWXztZBUejy8L5Uai6R8Phk5so/kw9zfnHg2?=
 =?us-ascii?Q?zaa8pXoqANDz6yBlLxPuF3mWFoCrGXMBFJWLhHRm4rr5ZEgOhWgsPycnFrCE?=
 =?us-ascii?Q?Olm7irGaCuth1q1W3Yy8loB9WcI0npUgZpnmgsIGL79i/+QzSWxgTWdwJuO9?=
 =?us-ascii?Q?0Uld/eksySDLZ1Vni1rP+m7PJS9fAiuA9GDZqkUpriPGzMBAOG01P//SkqH8?=
 =?us-ascii?Q?qCVsBelFtewTdWuzhDtlwT6eces7K68h29tbgChWQitEEVMaXSuje9CB4QYv?=
 =?us-ascii?Q?0lFX4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d624ccd2-e55b-4970-925f-08de001c354a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 12:23:48.5910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kf/EKe96Vk7vQA+BrL2NV/ddCSaCJfQHry94aI6i4fUdMF+OznOHpw3UblHjyquJLUzFjueXTfge/r3k9iDnkF5SbnOlN0WKmUQb4tRJ9zE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7186
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil Ko=
nieczny
Sent: 19 September 2025 10:35 PM
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 3/4] tests/core_getstats: Create basic subtest

Create one basic subtest. While at this also sort include headers.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM.
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/core_getstats.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tests/core_getstats.c b/tests/core_getstats.c index 0b9138aed.=
.76804d518 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -25,12 +25,12 @@
  *
  */
=20
-#include "igt.h"
+#include <drm.h>
 #include <limits.h>
 #include <sys/ioctl.h>
 #include <sys/types.h>
=20
-#include <drm.h>
+#include "igt.h"
=20
 /**
  * TEST: core getstats
@@ -42,7 +42,7 @@
  * Feature: core
  * Test category: GEM_Legacy
  *
- * SUBTEST:
+ * SUBTEST: basic
  * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
  */
=20
@@ -55,15 +55,20 @@
=20
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_STATS ioctl.");
=20
-igt_simple_main
+igt_main
 {
 	int fd, ret;
 	drm_stats_t stats;
=20
-	fd =3D drm_open_driver(DRIVER_ANY);
+	igt_fixture
+		fd =3D drm_open_driver(DRIVER_ANY);
=20
-	ret =3D ioctl(fd, DRM_IOCTL_GET_STATS, &stats);
-	igt_assert(ret =3D=3D 0);
+	igt_describe("Check GET_STATS ioctl of the first drm device.");
+	igt_subtest("basic") {
+		ret =3D ioctl(fd, DRM_IOCTL_GET_STATS, &stats);
+		igt_assert(ret =3D=3D 0);
+	}
=20
-	drm_close_driver(fd);
+	igt_fixture
+		drm_close_driver(fd);
 }
--
2.51.0

