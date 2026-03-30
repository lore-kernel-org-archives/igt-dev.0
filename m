Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B08FB3CFD
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 10:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F3010E49C;
	Mon, 30 Mar 2026 10:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwcE0x74";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFB510E55D
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 10:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774866259; x=1806402259;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ozU5LCvUoAUgNLrGcAAWLOT4ddzh/XifNgMskEecAvU=;
 b=WwcE0x74Somi2DOUIFgqFWcg7R4yKgwZw7WKxotgQWttHpBxYkZi0YDD
 QRKHhDfa+M8TB2JXwchwb8eTKNiuZ2sLA07zZf3UWWKhk+33QC4U86ToA
 3MnXFrnF16KvJhGG31hvISwxhKRSdubEWagkeovdyYsEhsxkgS0L2qfWb
 fnIL48XL4eOhgiN17J5hqZZltfZl92yilhV72V9UfOmV72pzqN9HjgcEi
 Jw7wfW/kd9EzWF/ZEHSgdBSL+/CYLj8sMcAUJU0wcK8/v7CMmdjFXWtf+
 Hbs1w51GyKqpK2QUcDnw7RNnP1Q9GrIrlm1QNp+Ad46rwdQ1nnyhcIkQg A==;
X-CSE-ConnectionGUID: vIbwdp0iQJ2Tm0e2tIcD6Q==
X-CSE-MsgGUID: LQbeWKcdRD2/rTpr+k5e1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="78450353"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="78450353"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 03:24:17 -0700
X-CSE-ConnectionGUID: RgXBF6tuTbyYDEOGzNHYpg==
X-CSE-MsgGUID: aFtsegKsRdWzjroFqF+P0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="227630779"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 03:24:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 03:24:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 03:24:16 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 03:24:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEJyuA0nwlPFN+eOSepsURtCeRDAsJ+TYMxBhvXbXJc11avbZ+SpzwGWmkhNQ+WbrP8o9ygi4upmYVzUbLV8tldk0SEZ4mckfKRBYXu1XyPmeNMRna4sNtrx2nu30Ht6yTodsO9C4RxXYNltW1q1KPvGSWnlObFmX17gI4QjjaYDCDKu5yoNahxp+sSlkmuQUMf83hFnUIZvvunG9v3wa0XFj2wHIl4TI5bSkG3/npE5N4UKOCuPOCKGw9J+3EBCbd5xZnJjjCmUbFA33q5KaYW3Oh3k2I0QtGMYd+dEhSByrCV3QMfAa+QQDQC8ZLk9sy/PQQzBjzIKe9XM7YNT8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI+sp7xFpCNcw0WdoGxqe+Xt9O1wrxlpbgM4iqU3eEE=;
 b=NY9i5Qdr82jJ5ko4aLfiSEf8EM+MIxDrpnXm9UDI3KbIXYCgqgu4r02HW/E3Dg/TZo+Sv70oOlH4gxbqBmuH4x1xN9CTeqSh9vuMa4qaEgBSE7hcmls4MrTrhJXvfcuyCjaMX2+tmOjVEJxtVqVFaH99tBVVnycEI1yuvaqU18Y8YmRIpQ0t44DhuoKVkDqPFVD4aftT5lpjlNu2NFDlz0DxlfE2nxTLHxGs4VeJRy1JJyYLTRaybBaA9F8bM+D6tjEAQ3kjnA4FtgGci0peRTNqO9MS830zVdYubWLpNLO/AEQ/KF+BqRbd73hEJ2vaVIF2TsO3IjvxQb2G5bSRYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.12; Mon, 30 Mar
 2026 10:24:09 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 10:24:09 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH DO NOT MERGE i-g-t] tests/intel: Add current IGT PID to driver
 options
Date: Mon, 30 Mar 2026 10:24:00 +0000
Message-ID: <20260330102400.1157658-1-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0325.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::30) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DS0PR11MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 422fcdc2-45f1-47a8-59f0-08de8e467ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: buBK/shxBPUULR6r1XnXbY46K5+Sps92zCEDAh1wJ+SwtSikZyjMB3KUhY5ysRRbCLWyxXdVlYHPTLIYTrbSgTK+HejVbCsZVXc8HG/rqZWUTPP7GwckLiBUmnJvv2Y16y32s7oJAkFGauTvZid7PfGJEQ5x8S49/AeJACG4dRkO6SB+h9M6KIwdMEK5pQDgnl+X0E0hzPIWJWsyJVlDtU2BIFDX4hNlUDhxZdVdLPgweaOtPscZg0q+6lr1quXZFOyHAy4lt+y24Uu7U2XKh+qg0Mri0bmKvYDpwJcy38KJemNpZ8MhKiaq13YzZ3OxveNKWpR6CyPZD3bkglG/LqXgkpE4j0evfU3iRPlItq56caeNjovCK+OKUOd++qCtHa/VPYC0swvqm2/+/wWaNO7Ipxaz8VJk5FqHIdmAwRMPZmyF/ywkP5htzW7cTvTC2b8i+Kj7wcbnf9XY3fGjZ1dSo1mTKfA3qyknT1FiWql3Q8A+EEa192TFxp8lYCh6YB05tgcOXGR19nvTE7W4jejrUfWu9vOFBaHoI4rtrFWo015EJc4St/QJr6i7F9q6sJR16D8/0c8TtfXMPtR8WLoP5yF2XdDykvhhOzgHVusDmOGdC+3PVp3msEdu7rGLdEzmywO2LeLZvzYSIvyO9pbrpM2a4JyNu+ytQ0rfOyOEGSu8MdsmN/9Eyq90qhiYaEJTHhTpB5rTrvSRnIQ5rEHxgLuf+eGg9bE0YE6Aavo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lozB7XMcops01d+AhQdhnWavK8F5xuEzKz1ltIF83YFF0wubu7zT0rzUYhrQ?=
 =?us-ascii?Q?T4ABtjB8p2nx2lETQuqDEDE8NcjCaUanQTERwZ28Bk7gfVFdq9UeXeA0xVZw?=
 =?us-ascii?Q?WDONdvX7zR1dsM1A9ziEQdaeLAxO8XCJ0/a1bM8luAV7os0Y1jnakdr8kmrB?=
 =?us-ascii?Q?e8hWewt5asd/XyY6Bpzu+XePXeagijv6iH95TBhbB3h2QGlOnyBAxXTbKxwJ?=
 =?us-ascii?Q?9zjoY5lStpyfUhTMP1bCTXpob9lMXg7dxQ1B7600638BMOYtLmmNDWnyOPMX?=
 =?us-ascii?Q?TeTzFK3HfOIbRcVYjj4j/Ua9FdINOHbiAqJfObtmCvQzILdUHybZOjV7Pe/t?=
 =?us-ascii?Q?A31KKnDJMbZvKbqHfaEeARPp9FyY6I+C2gH8piSMZ9ONssKW2OIMYKwXtPjg?=
 =?us-ascii?Q?sfyRVzGMwOHNzWLMvTfoWQ+QzTW6IIFiZNoWRa5LPYhfHDGpsytaBQOHP45O?=
 =?us-ascii?Q?C/dRqSl/uO3jlZ2phl6xw4S3/i98JCfK5PP7G3l4cYgD843Qn37vOeyhwZT1?=
 =?us-ascii?Q?CUyXvVQRXhHLOexahaImRpX3JODaou+c34Nh9Oy43pFzH8CHyaB2ebyiX3lJ?=
 =?us-ascii?Q?lPYNwK4lP/pMB+WLEb6To6+DomKlcLePmu759dISSDYzfHsgoa3M33IuXorz?=
 =?us-ascii?Q?r/B36vQ+rUHy6GT963fUhiSq8up/TgrJhhZ2ZIHj0CVKKgpnbALOkS51Uf1G?=
 =?us-ascii?Q?LiFOGjS4qnBTEgaa79JToI6ybr+LM21RpQy3y13UYWLw2MZjTMPeRzDRyMg3?=
 =?us-ascii?Q?c1lsfkDOE6C6Z68L/gtS9PweXoB23GPI/h9wAWpA4iogIcFIewWpO65yQp9i?=
 =?us-ascii?Q?5mg1yFrMV3t+XF5odutAyREQrlCDqDCbKA760lSCJOMt9TQAz/FzV06Zg4N3?=
 =?us-ascii?Q?e1aJ5axoKzjAjG5wk9HbLlSmM6rRF0Jqz4UuWQCcHV2u2KhMALA1ynOBIfHk?=
 =?us-ascii?Q?sH1VNwoYlUBGYZWqK83co3heH90D9hThLNo0yKI+zuAwNiKQikL1cxkLlPkO?=
 =?us-ascii?Q?Q3cMlap2rlrq/X+EQ01fZn3SZEYMM6Mg+gU7dKexcjpOWAlef8+0+ZLunUUE?=
 =?us-ascii?Q?y8WeDiZV1I8CbbB6ctKNUJZmmHPGk/C+iBxkzJ5xeMNW3UqiSzlh+ie3S2SX?=
 =?us-ascii?Q?RZIrLmcJFR/aCqQr4oo94IEJpraGHBJdKfgFWE2VXwrOr9wL6mZEQaqGQ+Mm?=
 =?us-ascii?Q?EDGG+YmD8ZmbrD5LoRg6SeP7W4sBgKY0sv5c+4+Hz1vr5bK4kLvQnRlAX24O?=
 =?us-ascii?Q?CfcG5OE/nyW0IKfxAUcBAw6y8m8mIh+JlQAgGJb8+tk4DNC0Mq19h8Oerm6d?=
 =?us-ascii?Q?II9xPaWblFPTeA+asRlpqITfmf/BgukbrSGF/u1IMImeFKej2laPs6v+iUWB?=
 =?us-ascii?Q?JtelNojfOc6jlGamf355aDSZ7K5cBHHxK3ZkgLPVj//1TgwVs2FBIWp4ljV8?=
 =?us-ascii?Q?xx7jqcRa8PlGk4az3P/oxX6KDozxzqyo70SuegmXmBsgBxFBZxr0rmjlXgtp?=
 =?us-ascii?Q?eQdObQuM276Sb8agMdxgtIyxQy1jFsn4BrSxL214rHj4bHOmzvR9mes3D1Oj?=
 =?us-ascii?Q?noWVkDmEpnmDBJXY/oltQHKJKlfIbEv+iqHDHe2fkG8zcqcboi72Uc7yhUZ0?=
 =?us-ascii?Q?0DGw8PSmJLIan8cfPp8tMOb9pjua3L9O29SsyAjQGMYRlw7JkIrF5Yd4wKP/?=
 =?us-ascii?Q?05bWCDB4T0IXVnqQYIUJTkkUP2IhR/cDqTfFA2BZxCJKklwVFC0yh3sjPmnk?=
 =?us-ascii?Q?71m3IczDYr6q3IjwIM/ckg6zhqkDYBM=3D?=
X-Exchange-RoutingPolicyChecked: mIhttpNAhXk7ylzVk0KxNbmi8qIX7B7s/huZS4m0vI3DzNAYGfoJerM+6BsF1p+eBRjcVEIMqTQKZXDq82eeA/AxxdSd4iNYD/2xG8hgCmKcxSM+shIHfJNFbWX12+9Y9HnYBjNrsjYgqp9louxejOdKAIiowv3CfHbMBtTIH9vZzYkcTLnGpZvr/qiKKxneYYzGF/lPgZpZZe6K963daMn75ZUJbcwS0Y+cUF7Zqo+1TB2EQb48SghPA9FixnAWbyvaI+z8qyQHNsXxVyGrMceoPZJOp+2IlcJNE5UhTBqEie+Z8VMp7Di2/qDMoKul3BQCssse2mA1p909d0iVcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 422fcdc2-45f1-47a8-59f0-08de8e467ab3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 10:24:09.5271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lHPK7UdYoHkLdutylBow36r1P7Z971KEmLgFe+Z0qe0uPL12itHC7YplkXH4qvjk96dP9Vi3YvmDlSMMTrrbxi3Vt90IX+pfhO+aJ6g+Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
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

i915 mmap selftests lack trusted address space in userspace,
so use a driver parameter to pass IGT process's PID to borrow
memory from for mapping. This will help to ensure mm_struct used
for maps does not die during the test causing SIGBUS errors.

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
Please do not merge. This change is required for testing in
i915 CI on the intel-gfx side.

 tests/intel/i915_selftest.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 6972de64c..1a8385883 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -649,8 +649,8 @@ int igt_main()
 	igt_kselftests("i915", opts, NULL, "mock", NULL);
 
 	igt_assert(snprintf(opts, sizeof(opts),
-			    "live_selftests=-1 disable_display=1 st_filter=%s",
-			    env) < sizeof(opts));
+			    "live_selftests=-1 disable_display=1 st_filter=%s st_userspace_pid=%d",
+			    env, getpid()) < sizeof(opts));
 	igt_kselftests("i915", opts, "live_selftests", "live", NULL);
 
 	igt_assert(snprintf(opts, sizeof(opts),
-- 
2.34.1

