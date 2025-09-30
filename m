Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52D5CCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 11:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF2C10E2AE;
	Tue, 30 Sep 2025 11:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqs9o0Yn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744C410E2AE
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759233440; x=1790769440;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eXjyf3PkbBmK0TTDxJZ+7Wg4aIJMnbe/p1tmZvX8090=;
 b=cqs9o0YnDyNtNnl/npd1PTwHNUqwGbJ77JNHgdZgoK3hXVmtMXHxxDz4
 NHOfE/prFtOMFeCXML2dJtGzXjcNi0Ors2BRjYlLo/sfqugCj9z9O3rci
 w+11gpnIeBNEnwL7xnXmRjpCJrcqpJ0cGnkA0pUxve2Snswy14BwFtvle
 YxbF7kS4sr9Ef7z9ajXIMJKGMr7tywx8M46j9NSQc1mPuShfOGzDXL5JE
 FPdYovgFfVQ+jIkWFDs2IQWkl4bgnvI64GFRCIrR3gU+tMHwRjOHbTqyi
 LCzUMCbkTFFlAb0sdDNs/ec6xzAsD9kM4MNCRd5Y4rxnP7JctUQhfiNse g==;
X-CSE-ConnectionGUID: tocOIeR3QFOlNzmMNqRs7A==
X-CSE-MsgGUID: 7h74Yu2bQeqPhMHQ50wH8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72106309"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72106309"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:57:20 -0700
X-CSE-ConnectionGUID: ftczVPFQSlGC4Z/7OFughA==
X-CSE-MsgGUID: dTSSGx1RRGK9CigF6nvcVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178908770"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:57:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 04:57:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 04:57:19 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 04:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrhFkMTOPzcV8zoaApZ2W0kq4yPdKvGRBxIrGklEHqJu6cOL4lJ1xybJlkoppLg4BuUnltZHuNi0izNdzl0rcpBWDNhvXmBn+N+ZKPQskrsnSJ2G0sjgo2BfMACzMYuoI7gdmx5HJcfIb2yTGGO50slaidKqYiMWkRHm2qbN+q+TayIbub9Ylb0IYyAF8qXkfl4QZjOIPMSoakHiYSBMCtqz/L9oEVJ4wHbMfOMg58ki5hlq/2OCg9RqoxL1fg3XMKv6J+j81UxH2eY4mSD4FFCIs5VmWVEMlgfy8erdVRR1XWwa3gdIB+zI3wvfBZZe6nqBtbIE5ndzh/+rJvvJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPia0hFJRPiZ8+0ai7PUq+FyMWrpZhiIvqDpBEuG1WA=;
 b=IWHsLR5MIH/78Bke/sehPJxirjjAMt7vCOvEsQDDXY4KRLIrl+wqSWahL1gki/b6WvbYtj9vmFYte1qY2K6aIKpJ3PyhK+2VU0s/HfxyEDoGxfsZFfTHwSPXI6N4D3+of9or2xC3XV1DwmDwAuGW2tNdmJf3M+M+I2OPWWYAvTxBOdlY/42S/mEbyenoDIIysVtNpJCBR+gnbkIG7osnC2dOvsZOqk+VhHE/KC9UBr28/yQ8G/EMF36yfC3Qq6WCH8Ji5UWo0WdrbJIgz6B8ndq8sNPuuZX48wttIkEY8PEcsRuf3SltcZNDQqZ4OiOvnmInOfntAv3ST6rozbFH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by CH8PR11MB9484.namprd11.prod.outlook.com (2603:10b6:610:2c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 11:57:18 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 11:57:17 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1 1/4] tests/core_getclient: Create basic subtest
Thread-Topic: [PATCH i-g-t v1 1/4] tests/core_getclient: Create basic subtest
Thread-Index: AQHcKYemvGkGDaHIR0+V1bpQddhC27Srr1OQ
Date: Tue, 30 Sep 2025 11:57:17 +0000
Message-ID: <PH0PR11MB48069C6AB47145B5250CE488E41AA@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250919170510.154992-1-kamil.konieczny@linux.intel.com>
 <20250919170510.154992-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250919170510.154992-2-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|CH8PR11MB9484:EE_
x-ms-office365-filtering-correlation-id: cd4d9a5d-46ed-4f3d-eda8-08de0018812c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mAOv2TI+yl8LWKhuE43CyTDPTDkh/EreZSXTJobf+ILLSAoAOLmcn2r7LNc8?=
 =?us-ascii?Q?40dBmPxYQUWRVpAkirzpnqug5Zzf8k69reD7PnJnfJpwKkzab0h1mLhZspja?=
 =?us-ascii?Q?1jPUpNSVDuSxenWBhJMimV9T5E0juVG2SEWmMQZJ2smpAL2jaHz0horAnDA7?=
 =?us-ascii?Q?kpU39xlLn4Jjw5dZ8VvbCtwxU8juyGY8cCEUmx5F71puU9JwErK350W+LGXa?=
 =?us-ascii?Q?9gOfWgnkpKXZWeG5s8Q4KpFEuj4cSXtC1xgT+FMmlqGL5jtxj0KziO0ck6Fq?=
 =?us-ascii?Q?/Iao8z0fAxAfCNrP3i5yAI3qAxnOEnyJInz6NH7cbTs3XHJcPxUzgYRA76Ho?=
 =?us-ascii?Q?+JD8+epBFrdGNCk3o8oLvw02dvMCelRjAdc2cQQniL8QVCfmRwmGrw7mAElb?=
 =?us-ascii?Q?mcd5re7huMmQulxze6pM+GJGFAxGo6r6cmSnXaBow1tuw5r+S+bX4+JyEMOL?=
 =?us-ascii?Q?AcDYBomA35+E3KuPFXff7IY8h03e2GVGHhO8D6rzpvlShsSVzVFT8YvqjaFm?=
 =?us-ascii?Q?IO9T4RNlqgWVRGjb74d3C1luW+b911yGsSiE/g1h8Ysz2eiVVf/ItGib3e1U?=
 =?us-ascii?Q?zaue7cMt6A1U6vB49Zk8fiqruLBwgeIN38Mo8Z0I2XEOjizhQN1OMBhvybwi?=
 =?us-ascii?Q?kFmT/SwLTog9q2B4uIGxe+V/pU5ArETMcIXCLLyrAIfn0SMZy+RtEcZF3EuR?=
 =?us-ascii?Q?I7vkvthJ6ZOCpWvfJgToRFZZhSIB7jOQrZO4NbK91vphAIk00jjUCMR3FmMx?=
 =?us-ascii?Q?fbGAMNr4qNtdxcLmbU1CiY1UFpCd50ndn1xwPCuEiz+nrEqP12NB4bR/T5NM?=
 =?us-ascii?Q?BE9Vekek3v1ulvmnadIe0EBwUwL41XsaKzs+5asMz993p9gL55ra+TWzRgSN?=
 =?us-ascii?Q?6iUc16aTlHgmuFRA0DITV1pOd1L1uzvbh69cR17ZEtCtHdp8lpkEmcrZk6ie?=
 =?us-ascii?Q?cLCrMkYsV1RdEWtxc10UfmzqAhGyjHChyh0K6QONDDv2wljEH8ZCiDI9yews?=
 =?us-ascii?Q?OESTkBlKjYdlve/nZ6/NlGlcPz3MSPBMp5Kg0YEbus+xhsX0q90LBu5PcqlM?=
 =?us-ascii?Q?GxVfd4+wctgO+AKMjq+jitwNsWpHTnvm1GDrTeqaVUEHp1ffK7SuscPxPn5K?=
 =?us-ascii?Q?B6M8W/e/42tTYqOjtR99KADjYpY7KljDYyoFVqACDm3rvboIK2ehAPXSOhAl?=
 =?us-ascii?Q?5Xwp5b9n/0LYRJYngYXPv1+dgmRyrnZahv3pePaeqQ0VbmmM4DmLw8P3O/BM?=
 =?us-ascii?Q?bfvEJJu7kKuAbsRrEGzahBo9v/B1TAPrdZszlnWAFjPNuAu03VR45DckAZ8u?=
 =?us-ascii?Q?i+LLKoArdn9DSgurnciBBg8o2mC8hqFQr4jzi+Pmy8Hn0lnwYKDAH7+k6eoK?=
 =?us-ascii?Q?27W3GeF2xYniVvt0y2Fvm+aE14Qi8XfQvOfj1PHiUZgPBmFjkesxkYS3JQS6?=
 =?us-ascii?Q?/CJAeJT3lMCZ6smXZuHp7xDn7XFI0Zk1hCwD37yOQI4PHEYD5rGLdWjhNLlE?=
 =?us-ascii?Q?ZMllFRg+tRTHgulk/MzkG6rJkZCbY4bvl/uV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J1iCUsG0FzoV0vZOodrzURlhrTmkXTcrx6uLWnf9L8pPPS1SKKGK0RQDT3Y7?=
 =?us-ascii?Q?1DyAL8NowgKWoyJsQYanwtrMLGXcVWNwMlroeXAwysDfCNRJEhX/B2EVNk+C?=
 =?us-ascii?Q?MjSl4KbtuesA+v2fFLsxf9tPsiULduU5zCi6brrj+fTgCKesyfxm8vVKfMke?=
 =?us-ascii?Q?zGjPqWES+PA90u1uS1zRDnOypaRi3SPKt/aPeMkLKundp7Ahk/qZUxasrKqd?=
 =?us-ascii?Q?X2AM+NABO9ru2LnLqU2wprdbJCPoQyEOxz5/NuXoUk7UHgvoowqOprLTt5yz?=
 =?us-ascii?Q?/X5teYuWBje5IYC0YcinmB3YYKn6jCSwqlv7t+bhD6iykR7ognlnvHJQYHmL?=
 =?us-ascii?Q?s+DGI7v6fGoxnWaK1GVwsjA5gDviggmp1HRqcoDsS8ozOJM0Nnxluz4j9LtG?=
 =?us-ascii?Q?xJTHqwOjaexjGRXoQvGF/a3jR4BtOPswTDaUVD2fs+tUnF483u2hThBoOLYQ?=
 =?us-ascii?Q?4D6KA3tBWoh9qub9NH5bds7Ed5c7NaSUmnBuRPfwbWKAel6aTBeQBP/aHYKC?=
 =?us-ascii?Q?piGNRNzGGCo6RA9EVu8c+8dzXlH5Ecf6Ymi5IUd+iLcejAfR+WyI159DE/8G?=
 =?us-ascii?Q?rujOUfzwV7tqJZRoxy3g+B+NXNv3kp2eNX/RgP/6brdFnlKNFn81MFf31ErV?=
 =?us-ascii?Q?Bt9XW8yh1i3V/eLz3tsHavlZCly7Y25/MFPni3KRpV+Z1Ij0HQ09dpkJxgn6?=
 =?us-ascii?Q?hNU2z8llzMNN2H7egOVTDI67v7WU7EclhTLKBEDV77iSin4Hj/aN7lptB1XU?=
 =?us-ascii?Q?HNOY/qKihL2JpDjijUQcwAY8kp8ku/BoFyhOHcY5nTFs+cJB3qFLa8Y2hNIY?=
 =?us-ascii?Q?tVwIWG+koyGlpw5CNrE7MbauR6Lqqx3Ly+2dEqZb886c9WFdKatKW/3pOdOr?=
 =?us-ascii?Q?cn5DKPJG52O+GAvnAvgxMcr0krwzni4LPts0mHqElt4R3PWMDRU19OuGQC/J?=
 =?us-ascii?Q?J0u6/6LRNXFKE1b+3R8U6cDK4w6NydzHvKy1KvIADkaPoRgjP4sjtbxm2v1W?=
 =?us-ascii?Q?gePe3b3RffoXack65ahp8cAMvdDFPupcrYQ9WBZ5C9RzdlqPDnsuQyZo50LV?=
 =?us-ascii?Q?KcByYbQJCc20HEN9+jLPLN70msEopOX+3BYYUceTFVJc1zPK+RTju5jEepeP?=
 =?us-ascii?Q?CsqFqQcHgjM13ORj/7y8p1DURXie4F060tNGdkMZ9902J8paLBIpiOTBEGbT?=
 =?us-ascii?Q?IMgTkMUHLgoFVWF9kFFJcfncFBCP53R1ERic09eMLgvTIpDM+N0qFzjemW4H?=
 =?us-ascii?Q?5E6NUEsY1zkRWqORxH26auwr9vBuQu6HWnwmpJzNxJaDcaek9Xz6PtqRQ2VE?=
 =?us-ascii?Q?ww05JLQ0ZedN65IRphIsoU+Rx28yFkv9ELVl6szjCx4ZRHiKgt1so7COPxuY?=
 =?us-ascii?Q?PbXCmDz61FnhOPlsDicyMgPtJ6aQtsHV0SsAxCB5GPuxNpRSMvG6ZAXrdWoU?=
 =?us-ascii?Q?XBDhK1AlanyBMzdFIP1/mOVMTgpm8PRd1jlqzP2/qECgCq5tdh2NbYXiqF1n?=
 =?us-ascii?Q?vm57DgkhcD6vbE06OiB6soxsFK+S9PaLdaOFXoycsCEzpWG80PuaGe3hqjep?=
 =?us-ascii?Q?Qhgq+3dgYHf+Of9LXgC9KAq+UEern9bjoMX3PcGotg468R1uh6XclriV1Q6p?=
 =?us-ascii?Q?CACFYApNGSV2t4tSH4QIUUBk81+sbG4zSyrfugfP17pJ4WOecWK+QZes1JEJ?=
 =?us-ascii?Q?Iazh3g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4d9a5d-46ed-4f3d-eda8-08de0018812c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 11:57:17.9262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n/iX4IFFrGg4S9I+3AyuvAv9NGffx2AVVUIYuVyddLMFLdEDqozE1xRgEp+VKSQYBO+tfExPooJrmHebKvabyFRtL/ukLjPDxadkWJ/1WcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9484
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
Subject: [PATCH i-g-t v1 1/4] tests/core_getclient: Create basic subtest



Create one basic subtest. This will allow it to have proper end fixup. Also=
 while at this, sort include headers.


Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM.
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/core_getclient.c | 49 +++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/tests/core_getclient.c b/tests/core_getclient.c index 21711cc5=
5..594c86a6f 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -25,12 +25,12 @@
  *
  */
=20
-#include "igt.h"
+#include <errno.h>
 #include <limits.h>
-#include <sys/ioctl.h>
 #include <stdlib.h>
-#include <errno.h>
+#include <sys/ioctl.h>
=20
+#include "igt.h"
 /**
  * TEST: core getclient
  * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
@@ -41,35 +41,40 @@
  * Feature: core
  * Test category: GEM_Legacy
  *
- * SUBTEST:
+ * SUBTEST: basic
  * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
  */
=20
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_CLIENT ioctl.");
=20
-igt_simple_main
+igt_main
 {
 	int fd, ret;
 	drm_client_t client;
=20
-	fd =3D drm_open_driver(DRIVER_ANY);
+	igt_fixture
+		fd =3D drm_open_driver(DRIVER_ANY);
=20
-	/* Look for client index 0.  This should exist whether we're operating
-	 * on an otherwise unused drm device, or the X Server is running on
-	 * the device.
-	 */
-	client.idx =3D 0;
-	ret =3D ioctl(fd, DRM_IOCTL_GET_CLIENT, &client);
-	igt_assert(ret =3D=3D 0);
+	igt_describe("Check GET_CLIENT ioctl of the first drm device.");
+	igt_subtest("basic") {
+		/* Look for client index 0.  This should exist whether we're operating
+		 * on an otherwise unused drm device, or the X Server is running on
+		 * the device.
+		 */
+		client.idx =3D 0;
+		ret =3D ioctl(fd, DRM_IOCTL_GET_CLIENT, &client);
+		igt_assert(ret =3D=3D 0);
=20
-	/* Look for some absurd client index and make sure it's invalid.
-	 * The DRM drivers currently always return data, so the user has
-	 * no real way to detect when the list has terminated.  That's bad,
-	 * and this test is XFAIL as a result.
-	 */
-	client.idx =3D 0x7fffffff;
-	ret =3D ioctl(fd, DRM_IOCTL_GET_CLIENT, &client);
-	igt_assert(ret =3D=3D -1 && errno =3D=3D EINVAL);
+		/* Look for some absurd client index and make sure it's invalid.
+		 * The DRM drivers currently always return data, so the user has
+		 * no real way to detect when the list has terminated.  That's bad,
+		 * and this test is XFAIL as a result.
+		 */
+		client.idx =3D 0x7fffffff;
+		ret =3D ioctl(fd, DRM_IOCTL_GET_CLIENT, &client);
+		igt_assert(ret =3D=3D -1 && errno =3D=3D EINVAL);
+	}
=20
-	drm_close_driver(fd);
+	igt_fixture
+		drm_close_driver(fd);
 }
--
2.51.0

