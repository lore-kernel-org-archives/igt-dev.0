Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1302BC25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 15:17:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BCE10ED37;
	Tue, 21 May 2024 15:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZ0Josbr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050D710ED2F
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716304622; x=1747840622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AiW1frgleao3VSNPBys9+nF2G9Oe9fUkeYcQZajGO/A=;
 b=ZZ0Josbr4Tw150NdO7O3q+1aywO6qA9yKJQXddKyPwJuFiq+6Jkwtp2l
 OSUsjv7WfxUXbaOnTmXUSvKFH7xZ5tWsT/NzVDXqR1yu3SmHNe5aYvO3Z
 noe01MPOuyFLeQgCjlTU4uLVsugz45iVPc7BOpVAs5Gj3iscnGJQH8HZH
 mvjsESePCKh5hfHeiPGzdtqi4NpQ/44fQnYoHfwFYmvXcreG/4vrGz27j
 KwxZRW8zRbECPBLFK69U/jK7Iy0vBxpjBktDJ6TMhuoSBK2GEIMOZnKKs
 oZFx1jZHHpAP0xGs5uCtNaMkfBiX4TIqg283LspE6jjvPnUTyN2DH6UWJ Q==;
X-CSE-ConnectionGUID: HoCBrw+iSqi/Hkv5nwP5VQ==
X-CSE-MsgGUID: pczZAYoCRf6I1gsVaUxk1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23113032"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23113032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:17:01 -0700
X-CSE-ConnectionGUID: PnEf4HlCSwG6L0qwlhIxaQ==
X-CSE-MsgGUID: 2fqEUdp3Q+SIGZZAStVrmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37453866"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:17:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:17:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:17:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:17:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:17:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiQ+hNqmJeIT82/X02bAiYwYTxtbsWxZub6PZKfuKKvwsRWXpVA6XiyNEcypzJyDegnLlBURrjZlIlL1FhmHMssh91JTjCQnVcu6kLrJExVf05AmjX3ctjZ4ViybysdlwN/LR2iGtPm+mMVnoROQVevIeYJbLOFyP/pRpMFGPHjTkDr/TMI9EbTnEsPxbaPnPZDR57Q9MTIehUA3rK5W4r0O0EtXWdKmAjKACZj1JY+S5KkBGFqSkcnG+F4OleUD9kUTcP+uIQ3NPry6maEdiyYSfAJHTOKn5bz+0cw/es0LyDthkvBc0jyftnwSnDXDZsGijAVtLqjhoSpJBrpoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJevZPA0AXmYUlEx2652XZU6M6ZXky4AtcMz8javj6s=;
 b=kmOPRhuZNJcUN7XuYmHZv4oEDrL65RVOat5joql8i3rgCRoF09hp7TSPON4f0Ica3usb59IsD1YoqpXhCb3YrPBpAOLJcuhj0AAeEQtN/buFQHdHlqvCQMB1TCLjVWly3lieI5kStCdwFwZo+04Tl3uk834BiKRUeL00ZFAUjhU+9DUhwbsb2gbtRmus9YLzYrLfNuqI7PJqTI+QS1CaxLDVY5GotXePuUQ6v/2WkO62JIBwTvY/nPpIVs16UjrlMI1QwwHm5Eo4pS4Fy0Haa03ElPJQWH3qByq0uRk3418koWAZ5nCqpu4mmgyBjHptm7U0Ra3pSN5+PrUhZeBJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 15:16:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 15:16:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 5/6] tests/intel/xe_pm: Convert mmap tests to use
 existing d3 helpers
Date: Tue, 21 May 2024 11:16:39 -0400
Message-ID: <20240521151640.280354-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521151640.280354-1-rodrigo.vivi@intel.com>
References: <20240521151640.280354-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: 458e235f-97b6-4248-d1a1-08dc79a90e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aWfGjXgnTlZI8NpwfxTs13xlLulz4bEMlkvSSyxYg9kryRsQwR6Y9HajJ+IS?=
 =?us-ascii?Q?yruXQo7r2jHPfWJzVmjOzdMxGGbR7e5gKJib0l66y21BWLmPK6252cNOFEme?=
 =?us-ascii?Q?kVZ05Jbm42G3nbRu8Dq8rWvPJA2rTtP6hFNJt7wK/oj8sHN7sQzZmkxyP/ee?=
 =?us-ascii?Q?j51lIaMk5L35LLqASu9aahGV87dJz9iIE7+tuUlDaCnD/iMc8T+j7mWYeouB?=
 =?us-ascii?Q?WvXbM2E9/dPX5sCTEDnnW/1l4u887VaYpmkzx3Y3RNtlrAykykFK7wOEd9cC?=
 =?us-ascii?Q?oElGv8+zMh6tQM7a/uRSHmnGjft4AmkW+fJn4sHSfYD9Tej/7uhlhjT7uMiR?=
 =?us-ascii?Q?M6PK3cTLOq7Cla4XnPJXbYH0OtyBFw2/FnkpYaqneFCUkCkeOT3hx3gtW1m5?=
 =?us-ascii?Q?HGJ2+3qFqG9IAGJa0WnuASxtsX6aoHN2wdoaTh3x6OdQrGzWm/Q4OrZfcFHT?=
 =?us-ascii?Q?kgyipIsrnKum+YWSgZaNA7JpbCas6hxnBMNe8cSAVef/+P+PCZP8nzWr7+CJ?=
 =?us-ascii?Q?bULSycHZUl2ODfg3vGmDX9/y+2GtUnZ2qHyW9h3ZCDV8mlATt46SLzpZIUQy?=
 =?us-ascii?Q?YvUwK6KGUvIspVhvsua2mmRElVudAnVkzz3iVN9dK/ncV0sCdRm1YfnmDrRH?=
 =?us-ascii?Q?KhE//y6V6G01udTTM7dGBo3F6mUDX5rSE63xw9hJ1pnA72BrosnzEVtNYQ4l?=
 =?us-ascii?Q?IALm3vFqXn6u4idUZ5Qdb6Bncj0oA5NunjTMK+x4OOXn6+tl4hfoPmHsE6SG?=
 =?us-ascii?Q?B4yEXv3pf9JNF8MoPUBPlyzCKYnTajyTFzXW5L+HcwLfYAkjIjUln2g16MFE?=
 =?us-ascii?Q?CBle++HLxtNMQoJbtWfPaaYZ73fgB6cFbk0Av+3wKW+CgkRGb6woxHTTL/g4?=
 =?us-ascii?Q?6iIodb6pCWiWGGSolEhQmjvZZZV/HLqMtVo9R4ejlXbEzPgtQyx38C/Ja3G4?=
 =?us-ascii?Q?MiMEqm6fFhxKSClVejbCMMcWku3l3VnvrMFtLSqXr4kUAYIEn34gEXViZ4HS?=
 =?us-ascii?Q?OaZroHjeEjWlL+EK15lVmm/jwF73RiiBuzh7AlKm/GMHyk0AvSNQhSMYOhS6?=
 =?us-ascii?Q?f734ZIbXBCL37xqi5K07MMPnlVAt3WBVhI+hSkBGnVxjzQRVf01iACq4Hslb?=
 =?us-ascii?Q?0OHowcTl4rDr734WpDbRAsPcLx8GnLJHvP5OYR8w9KY8RcFh7+JVb3ppbG+P?=
 =?us-ascii?Q?OLJ6ENENwDpOMZ7nJSesTdqME7R2sgtakT2by0tZ4zu3lFR4vJx7dj/k8Haa?=
 =?us-ascii?Q?vkpJB9J6D7qLLcZ4XYaa1HXCkGuvq/UlQYX+ZdPWbg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?skXVsoNN/UleQmhjeJcfKWeqRIhHMvp1BQwursXzZlRZzDY93KM0npgpkYE8?=
 =?us-ascii?Q?P1fjgDXSoD0f7chw0L0HOJarIYZlgorW1tgWi1/1soRaK9GLevvaLkHf2YQ4?=
 =?us-ascii?Q?CTF4p6QoKPlZL69SH7PhSZw7r6/578SHodQU1xCXI3iAGO/hhOomCMGqvIK+?=
 =?us-ascii?Q?4vjEIwcXJvJhtaN99gZzvioJruxIGEYnGgaXs9fMyZ2hslYnbXqLE5lP60Ds?=
 =?us-ascii?Q?HfeVFSlCUISyHslMMLLQNch/IP0eXBlmf8E6KTtENUer6SjGbgTv/v4/YaAn?=
 =?us-ascii?Q?n/+lPI5Q87u7n6iVhShm+2IoXsPrZJNqMSQlwpKdeLZuLA8L2d73g1PCR0+0?=
 =?us-ascii?Q?ydjPdY2QpkzQ2vUGEb6KyfdfjNMwzxRcHGkj5fXIDoav45YHYPxqZKHMCAyb?=
 =?us-ascii?Q?gDuYJIEdqlpB2XsxFErxco5GRD9HV2dSg7f98gHsHsh7gsUqai2HqJDtCwt3?=
 =?us-ascii?Q?30OxOrcGfL2KK1wgVg7gWUljpvx+zrazHx0KbZmsIhL7Tk7dCWjR1mGVOe2S?=
 =?us-ascii?Q?EoKdsBF0a3QuHrRCXdSNllcvk/ZY7cPlN28qH2v1+Ap3HEqSPQOAojTEpNlw?=
 =?us-ascii?Q?xpyiJhOxhq8/qhbDLaTrM9B2/alE24PM6KhLbg7VVJA5R0cO5aWkkxyo9mrC?=
 =?us-ascii?Q?t4N922u80Z0t756xRc6VQ7J1Gj2Lf8oRdkYwSxDw53vhNZON0vl+wr+f3gzL?=
 =?us-ascii?Q?TB8gokjVj8bac8IpSWFtog+DbCrVB6+T2A3P946QAEAEj0UwnshzaSf6keoj?=
 =?us-ascii?Q?Wu1D4TbjVMyCBOmtloippYPjYseDg6BsFIpBXjqfbLn7atxVdk38uvGuAFSg?=
 =?us-ascii?Q?hdJwIXfcusEkxwLQOL9QgiRLkshpDrFeCnGBRtDCegh/QsGFfdd/aMEeXHAG?=
 =?us-ascii?Q?RhM+fK2ACMijsP8wCeuVIZciyYH27aUdFGuK5dglI3Xzy/72c6AXqLXhlEeJ?=
 =?us-ascii?Q?rA0SeuYRvmQgPzXRjjWY980FGZcrff54crnEgvZOcrQSH11Xum2BfBywwfGE?=
 =?us-ascii?Q?Y+fWtPXr0rvm/LpfDEaW6EPMg1hUUj3NuqqCLoDz1Vl43+8HbEs3RPVcIjBC?=
 =?us-ascii?Q?18bXMsjfw9rNljFXclvIAcYADZqGzpQ4ueyZinlg51JZNHQoVZ5jfPrvcRPh?=
 =?us-ascii?Q?wxVcNSYzlRoereTrSCCW9PT6VD4kFSg2RntnI3SBzrMD9L8Cou2HgMH1dsgN?=
 =?us-ascii?Q?/atn85YwCA9bsJMdFvd59YNfBJITqnA3Vk3+v2S9yQH286RHOFlEdrFE8Vxh?=
 =?us-ascii?Q?lrJRNWgC9pEn3ZoWXmDhjmUvnhrncos35GbOh61cvcEZdK1O5xWh0NtUN96O?=
 =?us-ascii?Q?jBwpE7OLxIb2EABsxuSBRiboaMYpRBGhXLQAohxOy89plbI5pqC7KTcfeJJA?=
 =?us-ascii?Q?9v6Zpletx18eGTB4h98ovez5QKoeQoNF/3W92qbFMxPn2HXrE1gXV6FHXVhi?=
 =?us-ascii?Q?qAh74szWUKrIsGFn/0mLTV+i5b9svlivqLFnlJPZHptCHT3d6KpQ4pSKWphZ?=
 =?us-ascii?Q?vpQ+tVRhqWZz/j4DUP0Dst34uHNUDyU0Um0QUL4rN9tHqadXjqb5w+g8pyZ9?=
 =?us-ascii?Q?CLBmxuAoo7hZpsfg9VlN6jAfXmEe0nHHos26GVetoe4CP/F/KpmsTHPSBzZr?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 458e235f-97b6-4248-d1a1-08dc79a90e53
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 15:16:57.8534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGpgbpELpuwlMP/ZXTybhQHKf3/deghigI2ds2q+6B8gle2PIAggvuX3NqPXapX6O2I0YYLh84eov3KazyQPNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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

Standardize d3 setup and ensure that it tests with D3cold and
D3hot.

v2: rebased
v3: rebase and fix description arguments (Francois)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 82 ++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 683f25969..438c6fe30 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -517,19 +517,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 }
 
 /**
- * SUBTEST: d3-mmap-%s
+ * SUBTEST: %s-mmap-%s
  * Description:
- *	Validate mmap memory mapping with d3 state, for %arg[1] region,
+ *	Validate mmap memory mapping with %arg[1] state, for %arg[2] region,
  *	if supported by device.
+ *
  * arg[1]:
  *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ *
+ * arg[2]:
+ *
  * @vram:	vram region
  * @system:	system region
  *
  * Functionality: pm-d3
  */
 static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
-		      enum mem_op first_op)
+		      enum mem_op first_op, enum igt_acpi_d_state d_state)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -539,7 +545,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
@@ -565,7 +571,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 	close(fw_handle);
 	sleep(1);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -580,7 +586,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
 			   active_time);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -590,7 +596,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 			igt_assert(map[i] == MAGIC_2);
 	}
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 
 	/* Runtime resume and check the pattern */
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
@@ -785,6 +791,36 @@ igt_main
 					  NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
+
+		igt_describe_f("Validate mmap memory mappings with system region,"
+			       "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-system", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  READ, d->state);
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  WRITE, d->state);
+			cleanup_d3(device);
+		}
+
+		igt_describe_f("Validate mmap memory mappings with vram region,"
+			     "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-vram", d->name) {
+			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
+
+			/* Give some auto suspend delay to validate rpm active during page fault */
+			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  READ, d->state);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  WRITE, d->state);
+			cleanup_d3(device);
+
+			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
+		}
 	}
 
 	igt_subtest_group {
@@ -800,38 +836,6 @@ igt_main
 			test_vram_d3cold_threshold(device, sysfs_fd);
 		}
 
-		igt_describe("Validate mmap memory mappings with system region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-system") {
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0, READ);
-			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-		}
-
-		igt_describe("Validate mmap memory mappings with vram region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-vram") {
-			int delay_ms;
-
-			if (device.pci_root != device.pci_xe) {
-				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
-				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
-			}
-
-			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
-
-			/* Give some auto suspend delay to validate rpm active during page fault */
-			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
-		}
-
 		igt_subtest("mocs-rpm") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mocs_suspend_resume(device, NO_SUSPEND);
-- 
2.44.0

