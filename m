Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A382606A336
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 21:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CAnSEJAb;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=FkOrvjGP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B9410F0DF;
	Tue, 24 Nov 2026 21:44:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFA610E74A
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 21:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795556154; x=1827092154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OUIpXKEmA1jZxs5ikM7qkvVIdmQYm6VdI76OsbvsYH8=;
 b=CAnSEJAb5EH7LUlxkr8/wUyz6dD7Uys7kGCE8A3wawRpy0WIeSeEWXbm
 qJoCRr5Wr801fqE2+8i71OudvTb2XPmAw7Kl5zOr8aBGja2lxYCCPLEMR
 blq0FYhn+inDJcjHAt6BHzhU+K1Up7DjW4djEnSoLBnqZRQL2dfzwn/EA
 HYLVlZiVqayn93YhsViD89efIJKlM4Jp58KkiCqMv9VwSKf6homCxEpuh
 2S8xEoDOdEGyUK+jnH/mB2958hO6FZ8KY5Q+i3ipH+pE5XVFj6eGBGlN5
 XyrXbGNloTBVWocfnJV1hd5b8+d4mqct69DlcL3IbnUibE8ZHnnrTuLXi Q==;
X-CSE-ConnectionGUID: ybAX3OaGT8e7CkvU6ThkJQ==
X-CSE-MsgGUID: c8IAbl9NTz6VQjee552vaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4472983"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4472983"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:35:52 -0800
X-CSE-ConnectionGUID: 34UagZ5JSAq81ghPiWDBow==
X-CSE-MsgGUID: 7HKY8IQvSVuzM/CWWPn73Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11583315"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:35:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:35:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 13:35:50 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:35:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6aR8K0/AZvXunxwpOGnXZc3IH6UZizRvhdcfmN2BJhonl7voygFamcp8hkZnZU2IxLz5T1IEpFTlEtncD5FjOC3BtKJ9pBOAqU51iJy5DGIG3dJQnJ4r6wsGrRxMM4jLbfr7xYXVyRop6zLTlTKVi9rWeZAL9SyeQL8aijJAi0mZM92inBi9pSHt5Wbr/r/jWR0GIIOrS9lPqg4QF1im+MFSinMIPXqD/rxcuc5RNAfRtUxv+qJxI7G9Sh/XtaPSNcoQjL48Jh1wARepz3jnMCLesT+2wSFRSO4NQbjjmyFjItiCkbA87PFE8INb6/XeTqI1UuzH+ozolkI6a/NjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hwe5CCKCz6+j8rd0u9fQuCeX/sKsR5kT9iPRzsYZsPA=;
 b=ENvB+5pkNVhHdzM+yE6ZPa5yGSyAviupSbVnUrCc8Uhv7dY2VuszCg+s53DF8jWKK3iPAzkF+qYuiYx49mCtWQ/YjyPQPw8EvGOG7f1bC0ZY/CkAZSVGTljohrng5v1EcK+32mpaLHrUI3dkARekukUJg5HgGQXy7sCKs6FOVHRmpDgtenzS22TDxKf4+UDIlKzmcM2v7tvGuAc5nbW4P8IcsmVE0uCQlcEmLGFXcYOhnUXdVSGBm12LVt4TY1/BpFKfo8qNEQWM0JZWIuZPwipGeyCzszHfKfVrRzVaaBVUssoGKIK/7wYU3RfEXOUhqYbG/SmXPj2H7UqI/kPgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hwe5CCKCz6+j8rd0u9fQuCeX/sKsR5kT9iPRzsYZsPA=;
 b=FkOrvjGPDxXfijQHshwEr9BDq8RWEpvQjK261q2l4PEOBd1UOaGFCSc8/WtYmpWHpi3fM8GeoEgJKLC2Q6qpStbu150T21uZCol11snmhd/jriPHp+7lfwFXjpJNkrQW4V8WTRy3YWq+0pHYKzRU9skHFHgK3BX42bDLEUKvTn4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 21:35:47 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 21:35:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH i-g-t 5/9] tools/drm_ras: Show and set telemetry fields
Date: Tue, 24 Nov 2026 16:35:36 -0500
Message-ID: <20261124213532.3674338-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|PH7PR11MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: e89f7d4e-1b3b-415a-e362-08df4a72e728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|261022075727099003|6133799003|22082099003|18002099003|261009223027099003|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: G9cMGS4nLdFeN0jDiwoxbD/+tx/mzayVzdK3bjN0BjsS2dGden+I4o6d2kEbMGX23JVQEjsgqEWX1Jt2aSvctexLDPu9z3Yvi9Ypaoc5xzxbiwrePXhEq1WqFbW13pKWBKzLNqkIRjSziGlra5R+YG22gMqKrLyJsF9rrRJrUW+xzYCsMthfcUPrN5E/WHqUvcD9V//b4TZQS4A0JZG555vWbFTZG5MQGvKrXubZc8HGS0LWClomS0e/9nXS2bhzs2YS4DiTHEOJInpOw3Sb6joxmfFXH9n9VUsjE2g9wNDlLAdUeyTWnn55Nt/b7qhK1D4Bx0PYwrZm4FGNN26YPS7RYqaSoyj1KlkzylP60E/jrmrZiUJv9RcSet79W+lae/NVtZVzi7PwhhZjpIKPL0tfGcDkcHmkk/n7Bd6s/1Hkf4d2tJHcJgeKvlW8Y+45Lh4HN/SBy/4h4f67Nu97z8rv02u5yBTMjjnTJypMS/FWG82zm1yoBHMrBSlrTnwgp1I+ocx3LtieC6ikOjxO8TVarxBBvyYYtuSUwcrv6yJ2B2+sqV3TiA7izNwILiIOt+Ydp/UE/4XcSI0F4Wyk0F4Q97pvX9DiEEc6sqHLmnfJsqvDGp6EcFHKIWGBqs6Jy0xBRkyV886+qK9bIxWcukDP9BMUBXuix0Hwke0JHPQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(261022075727099003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aB9KC/vQJ5DsVeZym/RIqxMymXsjp8zCIJqL/NL4eenTgz75tCoTx3xZ0rd1?=
 =?us-ascii?Q?7wYiGGECKds4JBNQC7o1ZyAztM7Xb/HPXgPuf2ZUIPiJfP1ZEaVLKleQSgDp?=
 =?us-ascii?Q?zEVaRylxApg43ynxD13+y5JfJDKwWg7UNa+LM3+98LQ8k6f8qbQgZzHqXKFp?=
 =?us-ascii?Q?JKzlFXPL3r6hrYY4PasFdC0GKyH9egNxNzhTU3tzP+B4yJJFbo3ruX4YLmRA?=
 =?us-ascii?Q?eLmcyq+p3mLmTR30y8moiVXXXYjctQqZaiQlEsd0CN/h+/jWMrTSXW88qSto?=
 =?us-ascii?Q?IzKZ2m9GLoIrkMAGLCSPcS0HRih3WhNWbXW6FVdylgxdxmHsQOI5GTsFvnKs?=
 =?us-ascii?Q?WMgqBDdmXKlcGwzuTlLT8XITLK3DbnzYCAfoPg4sBwr42iXEXAuM66JYT+Hm?=
 =?us-ascii?Q?4qFQwa8MyDFUbMHpVlp0TQUjl0Aumy7F5LIevErYD0iqPUyg0TWoXIjVeVkf?=
 =?us-ascii?Q?bfLaOFaCIotv2zpRcOXYwSGqxolv1c6WwrjHw9SAHnPJOMw57JGr9ZrbmLZ/?=
 =?us-ascii?Q?fbKbQLUlTN/JxJprLlxGfqoAIGIif6DzJ3mhaW20kuWe07/DA7OMi/zMCWW8?=
 =?us-ascii?Q?HxfTs8F6jB4w/SVMpgzPLj4zvKRVBoVbsFeNGk7LS+dEhMIvGbLLMnKju06c?=
 =?us-ascii?Q?mySF94BlB45MkYQnR1tp53cldcoFcT86E4xyIMh11LWrHoMPF2xeD8S2P3RT?=
 =?us-ascii?Q?13n1B4/kJZ8n0NDh4LlVCkiEB7ZcNCN6Hi+qqaQz+6Z8YyPpMghD98zy7GUe?=
 =?us-ascii?Q?ojAlQRcR2Ns4W/5d1ss6IjbJl4wEEobf9kb/LyAejYDGX9yzYLxPfx+boiT3?=
 =?us-ascii?Q?hIHsqIWQC8e99YgRvOV5qyN2X2kZKPai9CeCRmbMGugR1PZ1t6QeFhPFzxJN?=
 =?us-ascii?Q?eaUdzsw6jTBQJ3w2Qhz6qgLRJRzfajpx67ZoAggsGZmqraoEfw2QDnqP+NFX?=
 =?us-ascii?Q?LASnnCNOJKYUqnwwfchJf7bExXb639yAUyIXr1a07z4Mn3swFG0pY0XFZWJr?=
 =?us-ascii?Q?gQV0FzmEmEvoD7zzYkDo5qbNid6maphgNr6K3pcmld7iJd0rWiWAAd0vbk2Q?=
 =?us-ascii?Q?M1wf4IgXToX1cBB5jpzDY3vyYPYVREfrVsJ7vFKQilYuH/eS1twSPA4Xn1fW?=
 =?us-ascii?Q?ruOsuG7IFEo61jQsKZRWK2gvv2nDJpBUlkscc8n1+XrEiAB48IaAbMa1NkIT?=
 =?us-ascii?Q?T8HB556lgrBOrBeuvUjjVFMl83xkyMtIxmGtrZU4GpiuDtY66MxsCrlq2q1i?=
 =?us-ascii?Q?55KuxoiQ91P7mYFosMaE/E/V6PWy1zE+EKi8GrGXlktTgHpgnXEkxIJrCK4w?=
 =?us-ascii?Q?OPvSVlr01pl65iaY5njCumHHsnW+VAym0cuGHCkzwFOH7UVs06HU8G+Da1av?=
 =?us-ascii?Q?3wKV1eFlooNPxy8KF90GaMWbxBD8s6rcIx5dZFmQt+sG7njhj0Dc/r11mRjQ?=
 =?us-ascii?Q?AMw8fttQdGqtN1E13vtdiWcULPErT8d0qrWFbsD6/OEw+YOdsRjY9qUn51mc?=
 =?us-ascii?Q?+67UaVBVL+IZohbspXsy9dsFJX4z8xKX80tuh3OORJoslpzMXKRabm/YZRxd?=
 =?us-ascii?Q?2Dmr7m3xEuTeP0bk41IsQ5sn+cX0Gk3KTPjOaJS2GmZ/cbkMyLe1CJrl+DOC?=
 =?us-ascii?Q?2ATFOYiTeeFW2DwfYuecJ5LC4UGoyG5mYefbZKNGu40JVNFmHoQl1aizeljc?=
 =?us-ascii?Q?3yDUJn2iWoisPuDzM4anc3XMCRpT/UM5BeBoqeRUQTfSo/P775+jZAJNrHm4?=
 =?us-ascii?Q?v2rOAns/jg=3D=3D?=
X-Exchange-RoutingPolicyChecked: T7KOmz48rL//vfs6aBZIXRjs9sKsM+gwKyifzY2bt4Y9p7PC1bQU5WtZ1Hrq0/lb6RoQqq3ymf5lH8LmHJ5RCYJGvblhHJ90obKE6ae1109NUxkZxJ3PYNST3+54LzmNtW0JiMGr1SauUAI/MmfGu6aFrTuYiMmo3Kq0U6lq/92hX9IJIPoqxLLq8BdB8+2zeItUlrzd7OZI0udOYjauBqf6dc2kjPQ3z/VecOE4Mcd+UdAsgkKQbG0MtqnJkZzBnxXyRoLEq76hw0u+EtAyRycJkPgN5h7j7z5Ua2D17KnfUmZJcwXs6eGR5weBp2obNxdrfCJJl3B+0Jy41PdGww==
X-MS-Exchange-CrossTenant-Network-Message-Id: e89f7d4e-1b3b-415a-e362-08df4a72e728
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:35:47.7198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICTrraXBKtdmVFGxusfyZLuHqPwinqARZK/9+TvVZWJyeru5MpYia4z+/D9CPsHWL2fqRqt8hclDpKwuxjRw9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
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

For telemetry nodes, show one line per field with its ID, name, access
mode and, for readable fields, its current value or the status reported
by the device. Add -s <field>=<value> to write a field:

  # drm_ras -n <node-id>
  # drm_ras -n <node-id> -s <field>=<value>

Build-tested only, no telemetry device was available.

Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/drm_ras.c | 115 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 109 insertions(+), 6 deletions(-)

diff --git a/tools/drm_ras.c b/tools/drm_ras.c
index 0af1ca919..bfbd7853a 100644
--- a/tools/drm_ras.c
+++ b/tools/drm_ras.c
@@ -5,6 +5,7 @@
 
 #include <errno.h>
 #include <getopt.h>
+#include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -14,6 +15,7 @@
 
 static const char * const node_types[] = {
 	[DRM_RAS_NODE_TYPE_ERROR_COUNTER] = "error-counter",
+	[DRM_RAS_NODE_TYPE_TELEMETRY] = "telemetry",
 };
 
 #define name_of(names, i) \
@@ -38,6 +40,89 @@ static void print_error_counter(const struct igt_drm_ras_error_counter *counter,
 	printf("%u\t%s\t%u\n", counter->id, counter->name, counter->value);
 }
 
+struct telemetry_fields {
+	struct igt_drm_ras_telemetry_field *field;
+	int count;
+};
+
+static void add_telemetry_field(const struct igt_drm_ras_telemetry_field *field, void *data)
+{
+	struct telemetry_fields *fields = data;
+	struct igt_drm_ras_telemetry_field *f;
+
+	f = realloc(fields->field, (fields->count + 1) * sizeof(*f));
+	if (!f) {
+		perror("realloc");
+		exit(EXIT_FAILURE);
+	}
+
+	fields->field = f;
+	fields->field[fields->count++] = *field;
+}
+
+static const char *field_mode(uint64_t mode)
+{
+	bool read = mode & DRM_RAS_TELEMETRY_FIELD_MODE_READ;
+	bool write = mode & DRM_RAS_TELEMETRY_FIELD_MODE_WRITE;
+
+	return read && write ? "rw" : read ? "r" : write ? "w" : "-";
+}
+
+static int show_telemetry(struct igt_drm_ras_nl_context *ctx, uint32_t id)
+{
+	struct telemetry_fields fields = {};
+	int64_t value, status;
+	int i, ret;
+
+	ret = igt_drm_ras_nl_list_telemetry_fields(ctx, id, add_telemetry_field, &fields);
+
+	for (i = 0; !ret && i < fields.count; i++) {
+		const struct igt_drm_ras_telemetry_field *f = &fields.field[i];
+		int err;
+
+		printf("%" PRIu64 "\t%s\t%s", f->field, f->name, field_mode(f->mode));
+
+		if (f->mode & DRM_RAS_TELEMETRY_FIELD_MODE_READ) {
+			err = igt_drm_ras_nl_telemetry_get(ctx, id, f->field, &value, &status);
+			if (err)
+				printf("\t%s", strerror(-err));
+			else if (status)
+				printf("\tstatus %" PRId64, status);
+			else
+				printf("\t%" PRId64, value);
+		}
+
+		printf("\n");
+	}
+
+	free(fields.field);
+
+	return ret;
+}
+
+static int set_telemetry(struct igt_drm_ras_nl_context *ctx, uint32_t id, const char *arg)
+{
+	int64_t value, status;
+	uint64_t field;
+	char *end;
+	int ret;
+
+	field = strtoull(arg, &end, 0);
+	if (end == arg || *end != '=')
+		return -EINVAL;
+
+	arg = end + 1;
+	value = strtoll(arg, &end, 0);
+	if (end == arg || *end)
+		return -EINVAL;
+
+	ret = igt_drm_ras_nl_telemetry_set(ctx, id, field, value, &status);
+	if (!ret && status)
+		printf("status %" PRId64 "\n", status);
+
+	return ret;
+}
+
 static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 {
 	struct igt_drm_ras_node node = { .id = id };
@@ -52,6 +137,8 @@ static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 		return -ENOENT;
 	case DRM_RAS_NODE_TYPE_ERROR_COUNTER:
 		return igt_drm_ras_nl_list_error_counters(ctx, id, print_error_counter, NULL);
+	case DRM_RAS_NODE_TYPE_TELEMETRY:
+		return show_telemetry(ctx, id);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -59,28 +146,35 @@ static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 
 static void usage(const char *name)
 {
-	printf("Usage: %s [-n <node-id>]\n"
+	printf("Usage: %s [-n <node-id> [-s <field>=<value>]]\n"
 	       "List the DRM RAS nodes, or show the content of one node.\n"
-	       "  -n, --node <node-id>  show the error counters of a node\n"
-	       "  -h, --help            show this help\n", name);
+	       "  -n, --node <node-id>         show the error counters or telemetry fields\n"
+	       "                               of a node\n"
+	       "  -s, --set <field>=<value>    write a telemetry field of the node\n"
+	       "  -h, --help                   show this help\n", name);
 }
 
 int main(int argc, char **argv)
 {
 	static const struct option opts[] = {
 		{ "node", required_argument, NULL, 'n' },
+		{ "set", required_argument, NULL, 's' },
 		{ "help", no_argument, NULL, 'h' },
 		{ }
 	};
 	struct igt_drm_ras_nl_context ctx;
+	const char *set = NULL;
 	long node = -1;
 	int c, ret;
 
-	while ((c = getopt_long(argc, argv, "n:h", opts, NULL)) != -1) {
+	while ((c = getopt_long(argc, argv, "n:s:h", opts, NULL)) != -1) {
 		switch (c) {
 		case 'n':
 			node = strtol(optarg, NULL, 0);
 			break;
+		case 's':
+			set = optarg;
+			break;
 		case 'h':
 			usage(argv[0]);
 			return EXIT_SUCCESS;
@@ -90,11 +184,20 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (set && node < 0) {
+		usage(argv[0]);
+		return EXIT_FAILURE;
+	}
+
 	if (igt_drm_ras_nl_init(&ctx))
 		return EXIT_FAILURE;
 
-	ret = node < 0 ? igt_drm_ras_nl_list_nodes(&ctx, print_node, NULL) :
-			 show_node(&ctx, node);
+	if (set)
+		ret = set_telemetry(&ctx, node, set);
+	else if (node < 0)
+		ret = igt_drm_ras_nl_list_nodes(&ctx, print_node, NULL);
+	else
+		ret = show_node(&ctx, node);
 	if (ret)
 		fprintf(stderr, "%s\n", strerror(-ret));
 	else if (ctx.dump_interrupted)
-- 
2.56.0

