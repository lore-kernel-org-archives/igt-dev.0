Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6930C606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UakCKZDf;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KZMNK48c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2295D10EEBE;
	Mon, 23 Nov 2026 14:57:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A06410EC28
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795445674; x=1826981674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eACRftZIcDrTSnYk7LhBf8CIKizWW9iH8QK4oBSvEwU=;
 b=UakCKZDf8B+4Y8fXnkG3h5IxV7DgamW41SryRxEPlaLAIQ0rxnlz54D8
 QMKR3EcI7VNOMjsG8ni2VmmO8KeD177x2aN0ehUotvw6JNJvPFGuxMfto
 l4m2e30Y4UN6XEYqumeMr2LxPMzJgXTt1kQa1aZuUdIex+B8K5QJWhmIr
 VgynbLoakbk/Xir1jUmsdNE8AW/igVkpvHYCIpipkXKf5hDqueY2UKX+Z
 VvzDR8d1lVy/lLbFqZhsLQMjA6CTqvBiuQ9HkS0xNhJYmlj9qsKQXS35A
 X892s6osiIImbbJMcoBwVD+prQZs/Zt2SxJRdxgRaargMIXOgu04NocRK g==;
X-CSE-ConnectionGUID: zHzsXNl/SZaC0bdt1ngyvg==
X-CSE-MsgGUID: kI2iti83TX+nnt62qtnlKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4104116"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4104116"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:34 -0800
X-CSE-ConnectionGUID: sbtE3aLrQwiNNtsBnQSDzg==
X-CSE-MsgGUID: 41buW+PXSOq64xTo47OzmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11329893"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 06:54:31 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 06:54:31 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:54:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrsRv7gFmycqsQw3s1TYoSjR5RrU70UYwwXdsZllgoBrQrMLUcmfxBHgRGU4Hxx4/E2RAPmKWgLCrcJR/WqeSOrbzvdjTl8mrSbl7fSSlTtWqfKCZAiHBh9VRUL4G1zL2m0DUnv5AJKK1NZE/cUIMsPZLjjbpuSVOEXf9iLyeg1jU1lVpO4fVk6Q7BTJSbF+FtqVWyOSHHUQbWrfC1GERPL+YfC1ZYslcpDilvAhrM6nvVf2Py7g2EBIbqUjt/pbPzhvjJR5FhbTHk//9iJsBa/2jJG8zkiwCIXucuU26LK9IKzaFXmcJ/nJiVl58R87LXyqSD+F0Rb55Io5sXb0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVEDUHMeoKhkmqdEOmhCphphO6rEqX2Ols3GO91jwfQ=;
 b=CLUAjgktlcoaYbUD1tkkEfF7a5lSdSJRqR+J13x0qS5InoUt5kE7y6Xf9gaOzRkOtwtveGv+4lxXO2i6HhEtMJ5pYKdsh8b/wcBpjsCBjUx0WovKiHW7ic2Q/nn669wv9vUd5ARhyKVa15YxD8vruNr21RRCRu9VarAtAfdNm5t4utN6gWRiyTFm+mu9bpQBGAtXi5GNdNt/GJgdB9shiNeu31n6bYhMBUOJOE34v9Gn7d+xOiareZzWIWY6WdW0LlchDopWewBKDWIgnHmRCOq4jOSSNKcOp0p5jtU3V7ZxJyE7lQbrCCT8VLrq9ljcWDw1XVQJXpWpdY2o2RjogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVEDUHMeoKhkmqdEOmhCphphO6rEqX2Ols3GO91jwfQ=;
 b=KZMNK48cIl0wKoZEIZsr6lHUW9/W/iAVH0VtylKF5AG9S46/7VNFMVmHoDlOWOntbzg73FW2tgYE0KHaSXLI/+oq6aSncFJBR645RKw+nQSagE+y+6W8cLBYO04YQjNBBWmtig7UWFeNd2Y+7TUoKovC2Alm8/CCeOAargBIaJc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DM6PR11MB4578.namprd11.prod.outlook.com (2603:10b6:5:2a7::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Mon, 23 Nov 2026 14:54:29 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 14:54:29 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 5/6] tools/drm_ras: Show retired pages
Date: Mon, 23 Nov 2026 09:54:14 -0500
Message-ID: <20261123145414.2243338-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123145414.2243338-7-rodrigo.vivi@intel.com>
References: <20261123145414.2243338-7-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:254::13) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DM6PR11MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: b02f3401-d295-4b70-0bdb-08df4971acdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|56012099006|261009223027099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: aQOYdR+RdIA/KvtK+FefSONakHoEQarHIy6uVJNbxE0/f/mKuoicqtFrK3SfqW/J9GwczZftnrH+NkG7nELhk0tKLJFGLziW9FoFB9MGR/+Pa0GSx7XVlBmWbjSLjwmO+JaPiSGogd5l4iIU8QXESMwofEg0rWat+J8tEryBy8/rHM3tloe/wQ2CROMRBzswycbPtpvQX7Kqb5u6ykzQvc5eg1UPQDLp6oMXLUErEWvhrfi1WDlj0Shn0nWY8FzhzZ2fDT1ptRXNcdlKP4EG3/CspKjh3pbPksZeQb+3MSHXBeughVHYR+pmvqA7PZO9iwqJfQ1cIXUuHigTz7oBNLZ7g81ypIskhW44sqnQHQFaVsEIQkJrAM+91FhSe9uRjWSkbIyEj67lHG51TYolniGsskIhjLDqbD0+5jjcg8PA3m8e19/O8hYE5R8zQAbOeM/gS7M3GP8SSnz/fRQP2f4QiwK/QASsLAXgCeYoqCKTEgPWCVXhy4szkZt/v9OMAasG60yPihyZJ/i28zxDApiLzlvJXuk5v3C6lGxHQEnfd8MHf+rgC9UorZ9O6lk4ic5LTbNS0lB2iTvWCzfglpdsmEOsXW55UJCy6xBFpeAivg5EDwEEJpro4ZW14lpjuGGI3AunayNdZ4HPtcfKULc+58glGYRBxBkSJ5xzRR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xuplv+AIuX8PHIfhFlZ3N4ndpm28MJNffWlOmYUL8WMcDoOkdkUya8nSLlWs?=
 =?us-ascii?Q?Kmp/DC9RPVq+AejzvGsDgWm6yYmhc7GJhff8LbXqJ23ADavpvM5q32CIXwbK?=
 =?us-ascii?Q?dWhR49v5sprhUaQD3+m26/m5nhSjJeB9zPm8x15Etb4fj5pfHkVixgIIefQ8?=
 =?us-ascii?Q?mYyind62IsfH1HUGGSHoKtUnGHnfIz9ZjiZnzezxAUNPFQ6JD4NzIF2s8Q50?=
 =?us-ascii?Q?Zbi1fv8QJRud+GXE5iMg8O8X4WWWTmbOdjoYIRjVC1pJELSH+zLSlR0gWdt0?=
 =?us-ascii?Q?ptFvIbMiv8BHhJ5ZbG1BbEw+ZVw4bLh8l5ADaVOJc48+rRlRhnnUNhJdD/ST?=
 =?us-ascii?Q?jPqRa1AyNg3WXrWGAYeu/CqK/L5+AFMWIf0ljo3yAcFgRiHxftR7qkj1tLJV?=
 =?us-ascii?Q?1CxBA4JpzDz5I2LYzKJJ4Vu4fxloAoQO30X7y6a4hvOvMasAOzx1nQ/uHBg/?=
 =?us-ascii?Q?tUSSW6qBnCU05SiBFGS1dKz9PAOMfxIZkqS6MDDxKROvCfC2hyelmCha80BO?=
 =?us-ascii?Q?9eaqcHoY/FgiWUGClNNoMiRgS52pgn3WK6FuNOrxGmDbXgBY8tiDYlgKdAo+?=
 =?us-ascii?Q?o59Lg83M4zEiUnKiStEZbZ9x9dnE68d+XmmQHhhDyWZjBSzed9yTOrV948un?=
 =?us-ascii?Q?V6ZBs7vb5br+xdHh2IFhFzH32/+fBWIlxKWXw1NgmqwcCresbNWOs8sn1rmP?=
 =?us-ascii?Q?ChkytrOWY2vRZ0jEho4u3jvl744pDPuTBvzGQKJVfB1atxOANoxjHu0wb7bq?=
 =?us-ascii?Q?TCHWLqJwy0mFv7W4I5wN5y1uQycRQDRDt+0s6rCwk9DKiWbnDA4YqUfcwzAJ?=
 =?us-ascii?Q?3MhW0xCxDPNT+QUzSFOtTATBYohaNuYVJ6ALiWPr06TtK7eo4BrS0d7vsT1U?=
 =?us-ascii?Q?j52dN1AdD0ss+UGmLomsYpifPLW15g9IVkJHcGn9XSxaYd4tL4OWKjnOMW4y?=
 =?us-ascii?Q?rnONejl5OW1OpYBJSkxS3dC5o6DqT2hKUEYXkbo9Cpn5HkJMoQutu7UTfmEh?=
 =?us-ascii?Q?xrL3puk1nc3LRbjmjMmdqVjrtQE9Nyw0QQFsd8mNn/AglfUTYiEyA6t35UwS?=
 =?us-ascii?Q?TNIHarmrjUyqQomqNNYdBOyaYi8paqXpCKEYi95hlkVtxYluJTNjDq7mw97/?=
 =?us-ascii?Q?9WrzCpebdvAhEMsE9aQD4P2zyq+M7jp21nnDtItjzj6qUE+FBUAYhBj90BNX?=
 =?us-ascii?Q?Q73S5Z1w4OOknCpuFutbNzyUmE4Su8tpNvPqQY2MAEDdpkJEdSNZGNhAdYXY?=
 =?us-ascii?Q?stGqo9zodQKsio8z2QS4DBqWej4/oZ6z71mi6givtHz3SRso7WnOLi2HiCsK?=
 =?us-ascii?Q?cukYYuUzMLCJJH9uiB7ZIevEF9Tp6NpzPjLFatf/9++KmUNQZaHViA6myIfd?=
 =?us-ascii?Q?QpHHaIGm7CDu+HQ47BnCtNYU3bilUVpR04LkdJmbEntFUsSMbE145gZJnQmR?=
 =?us-ascii?Q?D6en/IBXJuwPT1nPoIBweYADFKIKUapb9YOPRx/ndR1R40K3Pc7TX9tHBH0b?=
 =?us-ascii?Q?fD7l2MUL4TdPxdGCt4Aa5dox5Ax/k8dNLYgbt3dCHLqkVk5ZHgsTfdsm4/3o?=
 =?us-ascii?Q?GT/BOv6DE9x+gl7HAuD4h2SYZ2yYt90PAtXEZ5NOQQm9FC0Hu7AYxuNDTChY?=
 =?us-ascii?Q?aMCk679tSOXzZrrxfROuhI+I+TPXjNOXH2ZC2vutyLdSQh3KJb6YYrTMuqyC?=
 =?us-ascii?Q?mQqfT1Gq8VL5zy3W/ApJ8nds2YAvjXz9KTCvSmJro1+E0RZWCa2mIrbrVAHL?=
 =?us-ascii?Q?5XQWlgRPSQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: CHPvXatMcV0EtIxJDFJeI6v4B88/b+yIXzczh47LJTbqk9rdqKyccTaq4ykPTlVShc5kRmVu9WF5mnSkS28GnQkw13HwoPQtQNQNFQlstoVbzT8YhKXmy7/aqgM7AbYPA+Gdwu9sDL7H64eCFEkZIKBydDWbnSrShs6BJChw7Nb+BHbLs0uF2+JVGlAFuqjeMCFzfxahZTwgE7fpJsR0Jx5QtO66FHo8LjB+vGVX5P6X8x919lQt/SSqyX7tA6YybFyL6AOS0r+ixzF+DYmlnNrSAfogtZiRfAsB7q0Nbzjy3lFlG/mJUuqbz9JItIVL4ScnYhxCSmPdegANOS2quQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b02f3401-d295-4b70-0bdb-08df4971acdd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:54:29.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybIzsexdc7JmrMmbyjQvIX86jkZo0KwNcdmZv1H+UYRs9xDtgfodfYVOhuzJTjdE7sqnUyC7+qqVWw0gsPfEjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4578
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For retired-pages nodes, show the maximum number of pages that can be
retired and one line per retired page with its address, size and
status:

  # drm_ras -n 2
  max-pages: 64
  0x00000002fb5bb000	0x1000	retired

Tested on BMG with simulated retired pages.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/drm_ras.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tools/drm_ras.c b/tools/drm_ras.c
index 0af1ca919..c48348d1a 100644
--- a/tools/drm_ras.c
+++ b/tools/drm_ras.c
@@ -5,6 +5,7 @@
 
 #include <errno.h>
 #include <getopt.h>
+#include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -14,6 +15,13 @@
 
 static const char * const node_types[] = {
 	[DRM_RAS_NODE_TYPE_ERROR_COUNTER] = "error-counter",
+	[DRM_RAS_NODE_TYPE_RETIRED_PAGES] = "retired-pages",
+};
+
+static const char * const page_status[] = {
+	[DRM_RAS_RETIRED_PAGE_STATUS_RETIRED] = "retired",
+	[DRM_RAS_RETIRED_PAGE_STATUS_PENDING] = "pending",
+	[DRM_RAS_RETIRED_PAGE_STATUS_FAILED] = "failed",
 };
 
 #define name_of(names, i) \
@@ -38,6 +46,26 @@ static void print_error_counter(const struct igt_drm_ras_error_counter *counter,
 	printf("%u\t%s\t%u\n", counter->id, counter->name, counter->value);
 }
 
+static void print_retired_page(const struct igt_drm_ras_retired_page *page, void *data)
+{
+	printf("0x%016" PRIx64 "\t0x%" PRIx64 "\t%s\n", page->address, page->size,
+	       name_of(page_status, page->status));
+}
+
+static int show_retired_pages(struct igt_drm_ras_nl_context *ctx, uint32_t id)
+{
+	uint64_t max_pages;
+	int ret;
+
+	ret = igt_drm_ras_nl_get_retired_pages_info(ctx, id, &max_pages);
+	if (!ret)
+		printf("max-pages: %" PRIu64 "\n", max_pages);
+	else if (ret != -EOPNOTSUPP)
+		return ret;
+
+	return igt_drm_ras_nl_list_retired_pages(ctx, id, print_retired_page, NULL);
+}
+
 static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 {
 	struct igt_drm_ras_node node = { .id = id };
@@ -52,6 +80,8 @@ static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 		return -ENOENT;
 	case DRM_RAS_NODE_TYPE_ERROR_COUNTER:
 		return igt_drm_ras_nl_list_error_counters(ctx, id, print_error_counter, NULL);
+	case DRM_RAS_NODE_TYPE_RETIRED_PAGES:
+		return show_retired_pages(ctx, id);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -61,7 +91,7 @@ static void usage(const char *name)
 {
 	printf("Usage: %s [-n <node-id>]\n"
 	       "List the DRM RAS nodes, or show the content of one node.\n"
-	       "  -n, --node <node-id>  show the error counters of a node\n"
+	       "  -n, --node <node-id>  show the error counters or retired pages of a node\n"
 	       "  -h, --help            show this help\n", name);
 }
 
-- 
2.56.0

