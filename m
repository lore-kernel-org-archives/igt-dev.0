Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B385C9830D
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 11:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B8F10F9F2;
	Fri, 25 Sep 2026 11:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7qPxo13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E6010F9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 10:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790333892; x=1821869892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GagT6adf/alsoEAp63DzSNW3ODHBHhBxUThdyMdah5U=;
 b=O7qPxo134w3ZtKS0JRMZuqgV+AryreuL81Tner79Q8N2HwgHIVpw6xzf
 kbyE9kjqllnUX4ahwUZt8KHSy6c99mbekt77ansrJV2IleFQR5Se+78XG
 rH3zLl6f5Xrwssfx5Qdks2u9sQc7QwpF/aKAvtopmBGGWfDheMHg5j9Z8
 QQ30rodtP2oqSfXjRt4v3ydX4YfNsAbzEsEss/VyQtpuC0TWPKQz05EG9
 OJ66HYnhrq+q8P5x6NepM9FKqsLVCRQMqP8RsTcTfShGUhiXnjSNW7aWW
 cn6k4qLeaBhEChfbXzj8AJk1OWfpcxylb6GIalWG6LDz5KwR5AFkY54Be g==;
X-CSE-ConnectionGUID: jmRH2NArTDK0D47S5R9/wA==
X-CSE-MsgGUID: bKfQ3KgrQi68cLtjJiN1PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94935959"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="94935959"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:12 -0700
X-CSE-ConnectionGUID: 8egtFVhvQJa7su4RHyiCJg==
X-CSE-MsgGUID: I0+6UBIFSQ+OlxdY/1rinQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="312230434"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 03:58:10 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLBi7NKNLFQ+J3n4clkUVQfxoJDqX6T55KcKOpJbnbnLBv54kiQwNz8WtxMoLSmxa5ulKE3wvJLcdyvtD2C44iHLjgrEEAeX4QSqkQNVF9x4oxpKJCzbr6CJcSXRonDNyKBi9eh51/3WogUpDZctfh5ZjCvFvp8nEA1e8SusI9VJzg7B/NE3U4tzLl0pv+DR6hn/7pq+Ymwaopw30T8KiyHh9I32CZE5lPoqv8mE/fr7wYTbTHkzhyaZDY9NQT0wdCKgEW/aW/XH+PWSOfsAtwMHT4o+T57MrLR6OXilkmauvvExeY8DE0WtNrPkTGmU8nKTg88Yz00nKPwuGMolKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaW77MrjEBRUHtX0Yy6yHQK5n4tCSnW0IZBkJCr+9mM=;
 b=C1VjmRKXiUad1AkjQ9JOiN1RWoFtz1LM3ArjPBoTSwFFk33V6YaQ1P3H3uK55J73wDkrvV5HL8XGZlxHVgBD08YzZ0L/nJvjeuxOcCZBaSTc3OO+WWa8FzDDVEobzrToTaL02zIxH+GfyFSjLYtJWUrYj3pbmgDSV/OcIxexmZjWStCjtirrgAyzNKutWe49FpY6iNbxNpSFxALyo5AjzpF1Eseqy+AIa77DvMGsmW1yKQR816M4g1nGdh6GjV4NjrDOmzfCSPW3KupHFXksLceUncGfd1t/n/kai+V4/eAlWFxLByEBp1pYvz8ZqJxiNIh8rPmLlxuWY2lZLmMHOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 10:58:07 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:58:07 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 6/8] tools/gputop/utils: guard ANSI macros against
 redefinition
Date: Fri, 25 Sep 2026 12:57:46 +0200
Message-ID: <8f9c75ad3af3e1622b6d09fa0bb482290677f410.1790331690.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790331690.git.sebastian.brzezinka@intel.com>
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 363448b0-bb7c-4397-34c0-08df1af3e16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: gOSp7U486CkT/YzQngcVZR+kJP2h1JOf8n6plE82YVqKjl74V1SjfbRWJEuYfJrmw22kiv0rHoan0DenBDochSfsEJeoq7Y5E2DCAtbDD69H+PRdVU/CGrcXtctNiPt7N7ylxBNYfXpQ5cnr+5fi6Stu3IQilpmR7Re1qYcwpX2YUTRnOjTF3OoeE3Y1NkfHOAmZ9v2TA+MW2rcASR2v4ceQAa+dBNNXI83Rj0FWAT5lKyOjqTm3UTDKaWp/m6orc/ELc9eVWBsEOSrXCfIN3rk3k4I8XpNedXP//UgG88eiDJzdFv2TPiN7i2NqgnEdlHjN4/SSEgGMZyQzC6SN/yFl7NVUnM9GzWaAIJpHYK32N2zCw59+cbWzNlQVvmPYepBu3S3boJEio5sfL58pue1EabojS/RmkcgD+DnjORUf3fvwzd45Dg+jW6a6oxJk8K1pBl/qi1HRKGrMVbAg5kmkxJCroE8yxYLyryiuYgjirBbjH74c7kVq2hG+znvjDICyV6Ci0gagKB8b3MTuKJjuOyvdFKK+I0ofGYxfmr1CTZodR1OXFv+iTSDiH6wPcbuFcNrTh1PtF1BnxNLfzWbQrIrBxGMYyM3jK2yBRGj/6Pwi4o5fS8yzWTKbhOcff6ORuA+Qgres9giCokT1bpB+FGWXNMVlDQD1nBdVETo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jpsLCItTPByp79zgvVU/kuba3phWPLodmk+U4CUj5urC9F1EBjzqrg4NB3zK?=
 =?us-ascii?Q?vec0CqaWWjl7Fx0OePjpJmaeS/fvZj1tOqiSiyKQoSYZ/1a0duILY1d0qam9?=
 =?us-ascii?Q?kzCNpF4+C+/U9E38GTPNN7HUG6JIkrPPkKEyor2kPp8tj9THaMsluAdYLuHq?=
 =?us-ascii?Q?ettysgQ3uQCVTbpqX/llKlh3CSJlG6tnS4z8JuhsTNMgVa8AaMx7Igwk20Rh?=
 =?us-ascii?Q?46HTjfcI6/TsIfQw2+iFIk5emZoaFQntG5bT96fx2o02bpWbL3fNkEAjA91D?=
 =?us-ascii?Q?35vsn7yo6M9HgRSrIfA2+F+9AiBzUMIBO+1v1vr2LUSkOUEn4IV9sIN9mzvI?=
 =?us-ascii?Q?Dc7OjjD5ZHOW2mO+S4/TYHJnZQmRDr8pT5IokaamhSc0WQlVn4mEXMeCtvo7?=
 =?us-ascii?Q?BYC9PsLq+Gufy/pS9iwZhxk33VSRxfBjp1CfkGEaVj53AjmEtD74jbyNKHux?=
 =?us-ascii?Q?pAdC395lZldRgkXV0E8t/NBRmIFzIj8ndfpC/IBYylhGoh3/jAIp3pO4j509?=
 =?us-ascii?Q?sw905UW2W2R/Fb4Mm6ohefuT1NcIhQ98xV5FsFVWnzSbTI2ImSnC7CDP2CSp?=
 =?us-ascii?Q?kl6va/CTOZFHm9/WGd6wTaGbBAjvRiS4wNfGu5Oo6JssqLK4lVADKYA2uFXl?=
 =?us-ascii?Q?4nmMVWPREzHBxWNhaV6mMrir00WViRqk43ro/nLmtAI4ky0Bsci7pZSSABnk?=
 =?us-ascii?Q?xgambPnWk2KCrx3S4RBqHQuVH+nx8QGsWa9G5QppoldtXJGKdjILeqULkfYs?=
 =?us-ascii?Q?Kn8inGM88GVBreXOTZTVIcqE3BY+e81Nc9vbhrODFBV9pHYE1qhfLXzg9dPC?=
 =?us-ascii?Q?z/WJwSm3lYIBGD7Ejv8qEOekyAbQWiYVs12midcQs8ra2USLFrsZePfUJ/1R?=
 =?us-ascii?Q?lVbrLSwPYMLKNK2m9CnJzM7XYHCW8GiEWv9sMrM2hrU54P/CU2iajVAhZ3UP?=
 =?us-ascii?Q?LWOqEZ7lRLPajDkCC/Ik+J9PgUnniFZZ/qq5NMBO/wWZFUsy7ujyQk86wC4f?=
 =?us-ascii?Q?X1m3z5/HQpTtDFXCJrjpBUwXMzHtiUhpeFoHAe1akRFSr3JYAh4RCn6FoRKQ?=
 =?us-ascii?Q?CxL8ioSn4poGSkRIkWmkF9lwG3s1L9biCsfzJRt2UhBn9JYBOC9lH50g48F1?=
 =?us-ascii?Q?ZKKbiGY1kHpjEZqxZtYmEF8UZtv2KxeRr7FS2Z7NB2O+/oPrvz1oHcdXN/Kg?=
 =?us-ascii?Q?ht3VcP3gLf6hAxJHxQKLSCv3O7z6KuPNOZoxggNaOopm8SczKoGcifb9/hR2?=
 =?us-ascii?Q?scEX+HF9NrwHzCwzdcW9EpBuwMgKBS4Cee0WB3WLPq8hYesFActuoeLRpJvX?=
 =?us-ascii?Q?dC/V/Jy4Y+g19P9wAISrptB99JFa1Wb00cF23dY60IVbPqfoDQsG9FOOgerR?=
 =?us-ascii?Q?r2McakdPYuEHbKOOpAFuTtUG5KqH1FF+dxpW+h3GVInrpcCUVF48+Fnhoeqt?=
 =?us-ascii?Q?KhkX6lLd0Mv/EWD6oVzxzHLgC8LTbBytJ4Q/SoSFNsro3RD7By7/h9lMNte5?=
 =?us-ascii?Q?SKJSVdIdlcc2oHna0yYSkjJfDLSqiVHjrU63Lr2tNz27z8vWp6wkt3NYP7e4?=
 =?us-ascii?Q?R9zddf2il0dEJdxyBxlBCItDknbEctauFZz7vQD1ow4yZuROuNkmVXMIlcKu?=
 =?us-ascii?Q?3XPjOXsXiQa779Izqmz2oIPGBMIX7fftgIpw8TMxvawLVhmg3PlDh5R80Jrq?=
 =?us-ascii?Q?zGOgDA2iZfVeLk4kZe3HSSkW6EdaGZnX9xWox0WKxtjUnsQB5xFdTpaY/jg1?=
 =?us-ascii?Q?qe2qH6K7jttfQgA5D4ByqHZCd6/vlTE=3D?=
X-Exchange-RoutingPolicyChecked: 1Ysdr4Q6uW7D+tmh3I/3Xbw3fhrywRJWwH+svynkQjkWryfeaxANGPDVyP8s637Uwq4JdGqFtQD43EQ3AB3ycVLfz+LwD4aLvTsKkxZhLgWKUUV2BphMs7XH14fbarviOeLyxApK9igekfge83wd96PO+RDQvUIea12u8sf5YE7zjFXermrfEYrsWpBJ6a4s7G3R3R6Ay3MdKrocvzAujsFPerSo8pKrCm4Vg0UlA2G2eKFs0HU9ft8n3sjRzBO002jbItzsWWVzVXuiyw+pVXERfpivg0zB3WddVG98sAzufhK4Walb1vAVZ5bZqGSXJJFJ0mJJVYaiH4bJFqN8Rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 363448b0-bb7c-4397-34c0-08df1af3e16c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:58:07.4419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xpn0IL5vwHz9H7YdW+ziEoCt6n6fOcL6O0qSvJs6aRThnK2+ahIH61uzlLAFaiWXgrH+Yxkc4unDhdORNlKxpOzqaP53WaRPojudWYderYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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

Wrap ANSI_HEADER and ANSI_RESET in #ifndef guards so that including
utils.h from a translation unit that already defines these macros
(e.g. gputop.c) does not trigger redefinition warnings.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/gputop/utils.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/gputop/utils.h b/tools/gputop/utils.h
index 00befed56..d319bff09 100644
--- a/tools/gputop/utils.h
+++ b/tools/gputop/utils.h
@@ -14,8 +14,12 @@
 
 #include "igt_device_scan.h"
 
+#ifndef ANSI_HEADER
 #define ANSI_HEADER "\033[7m"
+#endif
+#ifndef ANSI_RESET
 #define ANSI_RESET "\033[0m"
+#endif
 
 #define PERCLIENT_ENGINE_WIDTH 8
 
-- 
2.55.0

