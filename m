Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D7ACA5FCB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 11:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E59110E029;
	Thu,  1 Oct 2026 11:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lz/e9jSu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE93D10E21A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790853246; x=1822389246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tbOl3I4zTZmDrNvuyQu8K0fgFPLNF8dI4J+bU+wrfq0=;
 b=Lz/e9jSu0vbG4kVTCeRCfwXRT7WRANnzTh6W/xKHmMO+nCf7ewL840Du
 +Z91RyKW7RG+njFReQVlKQh99hN92D0kZQhGCFsKx13iw21P1Tj4OzwVG
 20pn2TcTSkJghkAgxqBoPh7pOCV07p5qGXkftIcCFhoJhVfzlpXCwvAf3
 4vNqMjIlFx6TH/Ez4oMFTxzBIbi6s91hj6VDXJskXT5D/JY/6bjGKjEwP
 PQatppVJ0i9tmrD6/F2PeTn3xwwh9ATVqzMI3mPW3cgFO3xr3UeHzn5di
 LUUIa43iPz+Tr3DTXj3EHmPoMfGtapRgTp5dLkDE5sTpmB3FFNrxW8P7V w==;
X-CSE-ConnectionGUID: V40mSf3OQtOHm3SrXEil1Q==
X-CSE-MsgGUID: /WlhvBfcRgibhQXMCpEI2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90372490"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="90372490"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:05 -0700
X-CSE-ConnectionGUID: ymsKRmAgTEixp55NxdxQ3Q==
X-CSE-MsgGUID: 9BypGrMFTLygwKi/2QWg5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="273776848"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:14:03 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlJhvmoW5Qfk6hrggNj9W5+785YnLzkL8Mcmo51QAQ44jRGx4bnhpzhmNe8DGbAJetzOgOrBM9VxQmyr+pae7YywbsWANsyQ/VHPvIa9WWEoU/MC3KBJuZq2okhrv5ui9JZVun5jDaKf9TH3RQe/FhEW4ZxgUq2akhRaIIGT8+ek7Un3f7jnQ9BeHUZAcGZ847VnA5GdWsYmu9tM5sCdlDmYIWFDIeqWFiEL2ceLbMG0V2ixY4IzVjzJizpjUllx4Jwtw4xvltRI6MfvgiL1d67h7dGBb9yh0Ldwity7KnkxlwnKbt3hnsxfOB9IlfNkfnUWHNTrrg8hHH/acjmE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ArO5h+TbcqNFgoCoaGaC7fe/ek2h5nQFvnII2FZG20=;
 b=K+X+I9dZ5ssFeCE8bXQyVJvgp4vwghfUOGBhNj5NT2+kaKgXDSA/Xuqs9t5HJ9Wx2saD6SmZK4fK98Q4sJ1OPDtiT/7Nyy07kyrXe1LTn7POKDU1XU+HqJvXjb+is3CnEmaZX5mkTh7qnXBYjWjpsK9nYhUal1tmY5qFvf7Hgf105pL8ew+KLQCGFKqRjwXO6s9iyznfjyOIgEBHZvGEfH65wbPWHOSYUQLoeVZgjCkhznhOFhQ02zPyZFdjWEU6+VACto1P2VCqp7IFFs/VOYOVbgC9VY8QLGbwWWgEivoa8dB7JToSR2zLfGWsZE6tq1xfR2b/EbzhM3d6O1eHqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 11:14:01 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 11:14:01 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 1/8] tools/gputop/xe_gputop: fix struct layout and
 PMU read
Date: Thu, 1 Oct 2026 13:13:54 +0200
Message-ID: <8abb54c9df9b7c9087da25fdb8e1b996af76d38b.1790853076.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790853076.git.sebastian.brzezinka@intel.com>
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 3696de74-6806-447f-5d30-08df1fad17e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4c8zvdDKWS5UD4HAbgFUvFmprRH25o1FYHFOai9O4o6cifQZT3DGOVM5Tvy+yJef1FwPOJinHDh+M5r12wszKDczhUCUZIZxAy14xyF5SzjhjUcKEvKndYueZMs6rBQJdfqggOxUH8AMVEFcDUbRKHrxci7QFZGxrZoDqSu9+CbNUn9VQLqS4prqiktIlOdQ2k/qV7XZfbINUG0oiaROY6mNRKByRm6znzib7CvJCLl+PwLBYtz3KspQLlzDlSSW2SoT3lTcEpEHPc/LORBJJkYL/05qvCyypz+Sp6S3I+KQN3Nrp4KWlEMKmMFEthi1qpqEfjR7qdBbMA2m7DY9mGZoPam2d+AFof+l0WtpqD6ZBtg9JrH0YJohn+PrWVqNMbO9M2I7U7p6Da/2k/z2qeS6rPjLPJAsK0pcUXIVBwCIUyUKf+p7oT35eyy0rMJrVKoE8HUFkYx+DXF9fU3xWCjTEt+dCy0fjqV4No8m7NpHxHGYDGRVXcUKCGKxz0XZWlqW+J9jruBJpOpsuWJjs9DgLqwXy6gxdcaNcqtFqP6AbzRlNbyEx21aqi777iLf4A3T2IU0u+SFlZEdmpqJ1/gT+fW87prrIP7KEv2VcNfKdutTR1LgqYbg/N1OHbrQOuUH/AqBmcbwG7+8Ivkc+9A/T2dplzZCDmFz9/4+En8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5h5yfcY4uzULujJk0T8mDp0hPGq965epQ9CAJYxzzmIgVwW7zp1gUZQZvTN5?=
 =?us-ascii?Q?fpEk3vs5k6GgSjfA8C49ikmAmLqbQdIIBKFYkjDvdt5TZrVB9Ib+VM+oQk1Y?=
 =?us-ascii?Q?aW3XhdhEjIKnrJD5KTdDVYDssqDmNMS3XWUgEJ3R/ifBhd4Cl5kNurUSRrZM?=
 =?us-ascii?Q?HUtcsd5CTYdR7Yj8z94mabVFUU8hRx32px9bvDTEMMg/FEQ7qVcAlwVITa/t?=
 =?us-ascii?Q?+Bts501ntElsOHVO/e+pWdCjT5r5QLGbnFWac8c/eqmH+SSD8gCv8ykQbsXu?=
 =?us-ascii?Q?xvpxFe65xECutuYsuOSI8urPJjbY5BKEafCC6Z4cb7EaK2Cns3KtNDvSUCXt?=
 =?us-ascii?Q?4DVl4H3viJquDovVOveudm9OJmFzFpMi525ImL2R94lT3pnyXr10Sos0Vehw?=
 =?us-ascii?Q?NibydsvLNO/DFVaeot3Zw5KC5SDsgZGjhgT2efJDU6m9s47xp01W8nNoNDdQ?=
 =?us-ascii?Q?lXCRzRulrDOHbllTw8AYCklsRvZM3OVLTyYHKACoDkZWTDpqfzXPQ+U+pLBl?=
 =?us-ascii?Q?iVWg5idABzHw6uAWwzE5JnTnVducR5ZslXdrvFtWAWjDPM3aGjAVB6MYPkM1?=
 =?us-ascii?Q?Scmjc8+v3ogMd7ksDxsjuJjNQJVRlGJywzPFVlxYleohJw6NU1ifxItOI9Zd?=
 =?us-ascii?Q?RmzL+mFgcqUiq4bVQ7k9xwCClxWIMDhPH3G+I6Pn4fd9EbdExcc/UiDmkVYP?=
 =?us-ascii?Q?Yl8U5t7aIAqJA9zBBFFQ0R9IDQef87hlA6Kb1VsRabzsX8+XCCVGFMIhl/ll?=
 =?us-ascii?Q?PSvEqwljrRrRvh0s7SRpOwCTpmAtu5pHT3Q4wn7Twn3aoOy01mHbiGbBX5LK?=
 =?us-ascii?Q?bE44yN9G3USjoReSoplbUdknFViIlxJwIneNSEIB0nCTG5Do7bOAFTZ1QsWR?=
 =?us-ascii?Q?L1yK9oKgqrSxdIFwKDOMzGAU0yYt+qFmVi6Mh9RTvJpv63xGltAmXCKV1bja?=
 =?us-ascii?Q?FEABdruVeeryKJJMZVNr8dXY9/uWM42njrqUxpyH+wl1xgcpAohjUIL8rogq?=
 =?us-ascii?Q?Kv6GlIqbSLdNNMY47pO+86RX/8usmchJJMs2AKVQlQxvbfEgBRufkdNlJsr1?=
 =?us-ascii?Q?VAxOs9ZV3Ci4+YxjfTx23eFeAqXav+sux0GwCCnplfaTEQ+YybOFGI0MBbcf?=
 =?us-ascii?Q?rk5c2lQToWmTWTSaARJy6m8tQCB/+3XLYisy5ZWf4Ie8W5fOxaqsKDLRlhmX?=
 =?us-ascii?Q?1eefBy/HJSTW5ilk20BerG84bI7LjR5dKxcZqyQ9GSEW6PmR5NqBEdfKb2Vl?=
 =?us-ascii?Q?DHv3FxSwNnixtytNopYstpAnkEb8QwnTaF7uR0lyN8iESdX6MDtYJBRPm+A9?=
 =?us-ascii?Q?H9i4R6qxUG8KTnd3OqWT4awUOeQUZoBoVX4kuj3T27nb5n7xJeDHbS6x6j+h?=
 =?us-ascii?Q?KvRl6QidRDQrr5zTFR1TrEbSduyuA5caIA+T8YRxE3TkQltq0wlq+JmI6qUb?=
 =?us-ascii?Q?1o8FJlse2EDQye2xk0/xPnJM0E5qCoi4SHEbTO6YRv6EPIBaoZ0K6awtV0lW?=
 =?us-ascii?Q?QlRH6/lsQuD+5XS0kCgln4s1bc9qTMKV3AuzWoNIBtTFdTGtv34I5johLXl7?=
 =?us-ascii?Q?tk0p2unpq0amCJHMBTcuCG0w+U2mEOdWUXVSN1M4RPf30AWf6xr2DJHYyKVS?=
 =?us-ascii?Q?8z3gaa5JmR8V2+UbAByiDgvQGF+1Hh832MAIfyAu4ukOxJddu0534v918NFj?=
 =?us-ascii?Q?OS3G9XoYFA6OFgG3+pyP1UQ0lpp9BpmyLBu7amSbeUjc0DRlARL27yIrX2iq?=
 =?us-ascii?Q?titApegbbYOx4sjEU3yG2kR+1QHGbJg=3D?=
X-Exchange-RoutingPolicyChecked: CeofL5wYCNC7eoNlhpWc2NoZXICj3C5OLSbEfibDVL2rEf1g29TDYN9MsLFsujNF1FzPdatraQqSdMWX8cnGj2FuV/Q0xZ72Yy60OBBIlXw+ttBN+nnHonJQnHmrT3uGw1kwmI6IM7glacWDJLAtnjTCfJxQ3mX+M7loXngp8AB/mFGgXRR3UvDltq0SomRaNzGM8kmV88L9gzQTdKurJXHrO+R5Hpst+ekb1wMtRNhCj1T4c9iWyBERso0/KyDRb8FJz3rBkTWoowi+fZaFzU+/OfwlTdD0PxmvT6YpBKlsnUR58slo2uAe20gQILj0a1BZMNGbIpk0qDNGpEWyyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3696de74-6806-447f-5d30-08df1fad17e4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:14:00.9900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVZZtPHdPPKbgdi+mDNscY+yy9dICXAhu2u1QVQpatjcyABDsyqTPD1JXNBfubjEYNgYIMWLsIisHXO3jEokWrbRLHy5mOs5I1SUMpb481Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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

struct xe_pmu_device ended with a plain 'struct xe_engine engine' member,
but xe_populate_engines() reallocs the struct to hold multiple engines
beyond that member, which is undefined behaviour. It is replaced with a
proper C99 flexible array member (engine[]), and engine_ptr() is updated
to use [] indexing accordingly.

pmu_read_multi() and xe_pmu_sample() also used VLAs (uint64_t buf[2+num],
val[2+num_val]) which are forbidden by -Wvla in IGT builds, so both are
replaced with heap allocated buffers.

pmu_read_multi() aborted the process via assert() whenever the perf
read returned an unexpected length. Since a monitoring tool should never
crash on a I/O error, the assert is replaced with an error message and
a graceful return. Its return value (a perf group timestamp) is unused
by xe_pmu_sample(), since xe's activity percentage is derived purely
from the ratio of two PMU tick counters and never needs elapsed time,
so the function is void.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/gputop/xe_gputop.c | 35 +++++++++++++++++++++++++----------
 tools/gputop/xe_gputop.h |  2 +-
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index bb2caa6ea..49d08536a 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -5,7 +5,7 @@
 
 #include "xe_gputop.h"
 
-#define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
+#define engine_ptr(pmu_device, n) (&(pmu_device)->engine[(n)])
 
 static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
 {
@@ -210,31 +210,44 @@ void *xe_populate_engines(const void *obj, int index)
 	return engines;
 }
 
-static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
+static void pmu_read_multi(int fd, unsigned int num, uint64_t *val)
 {
-	uint64_t buf[2 + num];
+	const size_t buf_size = (2 + num) * sizeof(uint64_t);
+	uint64_t *buf;
 	unsigned int i;
 	ssize_t len;
 
-	memset(buf, 0, sizeof(buf));
-
-	len = read(fd, buf, sizeof(buf));
-	assert(len == sizeof(buf));
+	buf = malloc(buf_size);
+	if (!buf)
+		return;
+
+	memset(buf, 0, buf_size);
+	len = read(fd, buf, buf_size);
+	if (len != (ssize_t)buf_size) {
+		fprintf(stderr, "xe: PMU read error: expected %zu bytes, got %zd\n",
+			buf_size, len);
+		free(buf);
+		return;
+	}
 
 	for (i = 0; i < num; i++)
 		val[i] = buf[2 + i];
 
-	return buf[1];
+	free(buf);
 }
 
 void xe_pmu_sample(const void *obj, int index)
 {
 	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
 	struct xe_pmu_device *engines = ptr->pmu_device_obj;
-	const int num_val = engines->num_counters;
-	uint64_t val[2 + num_val];
+	const unsigned int num_val = engines->num_counters;
+	uint64_t *val;
 	unsigned int i;
 
+	val = calloc(num_val, sizeof(*val));
+	if (!val)
+		return;
+
 	pmu_read_multi(engines->fd, num_val, val);
 
 	for (i = 0; i < engines->num_engines; i++) {
@@ -243,6 +256,8 @@ void xe_pmu_sample(const void *obj, int index)
 		update_sample(&engine->engine_active_ticks, val);
 		update_sample(&engine->engine_total_ticks, val);
 	}
+
+	free(val);
 }
 
 int xe_pmu_init(const void *obj, int index)
diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
index 1e3856071..c26db0e7e 100644
--- a/tools/gputop/xe_gputop.h
+++ b/tools/gputop/xe_gputop.h
@@ -41,7 +41,7 @@ struct xe_pmu_device {
 	unsigned int num_counters;
 	int fd;
 	char *device;
-	struct xe_engine engine;
+	struct xe_engine engine[];
 };
 
 struct xe_gputop {
-- 
2.55.0

