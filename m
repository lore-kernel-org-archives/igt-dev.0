Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5BDC53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F0410E82A;
	Wed, 29 Jul 2026 11:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUTNMVUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60E610E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323022; x=1816859022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PrzyilHKIeQ/ybkoOFfBWvjAveGKPvyIHk3j0575Aw0=;
 b=QUTNMVUM2nHtppaksVBpt2Gh2h4a8SQwxf6yw1qACni8FlGoNMDiJGTO
 34Ac8PNHOSivTjlgL91ele4u6wYRZucdx1NaziS/za+OOi9ANm+gk7Tii
 pf+roxRirARqAaQEThRATMXMNDr1yh8bHnlQzwAePW52xVDfX0kxhrO1y
 TyDlDdDclq0bP7jLGgrMMHjHIJpck9U6fx9mmYK7R3Ix/BaopnQ3kPEHB
 vKPbVU7r6NTBKCNvBCURWbLrbDCZn0yPZ0XEdqQU170LaYtrcw6Ft8Tj1
 0IJTwigeBV+KKMq5qHsjhVvw6AW3szVEQlkDl5bG9NFvlUwXbXlm03B8G w==;
X-CSE-ConnectionGUID: B4TdU0zRRUukI2qax/B2Jw==
X-CSE-MsgGUID: uLV7bH3VQdC1a6nSlLVf7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108719023"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108719023"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:42 -0700
X-CSE-ConnectionGUID: SBiABgbVReiZcRTZn49HcA==
X-CSE-MsgGUID: p8oEsOfFSsCZWayLuJsvnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258204813"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:41 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPerqO17fBTwo32JfG8G3kG/TCXpBMznbP8SGyvmdkm9pZeVUOx16cvJ2LIWlK9ooTg21wyXL9pxHF6goBwl9awpO3eJ2Hmqu1ssx2NHJF6Oa7TXMU69EhwWgg28racieU4y8Z92Txny/+oR22JyQaWFeJocxKKBaU4WTOpq/CEjNNWbz6y6+DzIkf8yN9frC2k+RfvEp15FpOOqAPPOj+ph1mSqlyKw6woRO/nafW42vy9iNt2N/VT6T5zxeUBUW1fWbB3oCoXtG0XVUMVm7WT3yWR5fUlR+NlXJ0fK8riBsFQe7KXczIDOAlkaxtrRdgMP3DPN76V3GAv8tOl3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Oepf+x4XXaYaGRPqC/EESmVCS2oYgAX7fxPcmOFPkk=;
 b=qNDtGeal8zntLQLc2q39f7tmcxrJjiobsk27D5ai4zQ29Rjd1Nj6pGkeSVq3vtWGXt0Y5aaoNjPn5G6ayhEhRiK+iOIBaxe/0i8nlm/uPmpkH7G3FJ51xfbEMnl39dAzMnVliYJlNSQD8DmYBn3dkrvZi3Dx1rMD81KbrHFpwE6FSRhv5B6F62a04TB4tB0VH6Ta+mx0OthXzEajIfIVai2BrMZaFP3VqTGNbMElwvbQOS1pV5U/FmdTm4j7UWByj642eUxz7EALWzslO/2teezAPZJwD23FRH3sZ2MspLl79eP030qHodMVWzOoZ7hP803G1XbcWgKSGkO8brXd5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:34 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:34 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 23/31] tools/intel_forcewaked: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:40 +0200
Message-ID: <3e8d0b94d5bfb5fdf0f2c1a4884eced55f8b3485.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785152675.git.sebastian.brzezinka@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 53edadac-7ca7-406c-b048-08deed61087a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lIF1BhfMihnumrbHS/OSh+j5ZL1Cdi9ke4I38N7dQhbT67mQkebedPRp4K2UWel9uQ8U54TdaDJQ0Z6bTS8R4AQEJ+zJx7IQfpWZp+uCN0xtJ3ZX46lWMn0YqLPK9S2/aFxnwr50eybC0113/7dbK7mqhpF9+MgkWhzYNd0kAuMp+MJPm0SuPleaJOj3hke1QLItc6LZ5INccg2A6uYoUGEaNNRvhCM2D54GB1Hge81J5nBjN2paxqlFJUv8iiTdootbBraR9mFFn+hm5rEluD7a6UHzIkxzIzoXLbhHwSbP+IKCg9oXLw8Wnt4cC1DQJypAqWCiGCPkKb/nSxXepODjoQwJFiChamK66xZc7sE6mWYHUieQ8CjhoTVbUZr0zGQ2KcjYGqTl2DB118iRyv3/wrRJEn4BNFO5xcvjnZeu6eerv5flRg9krVvo0KvZIQfJx8gC86uaiUCbMmjDzsMP+tvM5kMJqSFsz3rNI7AGLToUQse3jclzrByR8iKnXUnpiSxiGJulw3q6ulkCbG1mNAtKQ7kYIW8aa+8K+JIlm2IO+pGFfxKY6sY62tVF8tRAW+ZoOPIASY+++hla6ut7gb4WgrGRoO6jnuKjC47mY8+Wm083l1id4Li4ITrjhB1q7h1OtmFsEgPW6NJsdG9iHBZ9VitwIKEwsAGHT24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZmDfAVhxJRXCh7iSKyQJNonGuN2gfCkoGyjFlaJAEd2J8OmoF9heAJsQz2f+?=
 =?us-ascii?Q?m+GUrSrcXztV3/o+ONEDZ0TqA/4qpBgD/tJ5lTNGVoByk/zlZeI570/e412+?=
 =?us-ascii?Q?u3O8sutXREnec0z3mev9zl8fCWCo3OevJP2lbiT4IOt0k7J4i/8sQoDXLEgX?=
 =?us-ascii?Q?kpZDjZu3pmgFHeO8g1BEQknmugNefEyOUUgcttdh3LfruqVBcYPFUxWjqvX2?=
 =?us-ascii?Q?pEmWHVTdgLut+a70bJJNwLb60rjBLrBTU15UTpQypmk/ttDUJcD4E3d3ZXz2?=
 =?us-ascii?Q?D8fnM51BZOKSRFcF6oQDrvNbMVsSsJkOztXWhc7OPoJSn2u01y9U4fzPP28U?=
 =?us-ascii?Q?LOHN3ZCRIDkk/u2to+251zdP6cbOMNAe8rZir2UhIZktpkGVAlSCVQ3qCv5g?=
 =?us-ascii?Q?SzALEVI8MQIarRiAdHgrnsDs3YazH7/FMQVdFaNcSOld0lA5ocrWE7fwu5y1?=
 =?us-ascii?Q?uAXZaFWYzDUZZJhEWMaOf36FkA3cje/3+xgHhu9X1DGx5m9nU18vwS3Dd+wl?=
 =?us-ascii?Q?zGJsrY7ZPp+x3sSGwBcoWNkeM1vT4VIebqZLRBzlzKn8AW4NE1dci2uhUkt/?=
 =?us-ascii?Q?X/bSaNcMwBycYVxstayCIa2ZP4DZg5TiYgSEWwtSX/CXjhJWau+3FYPghgvW?=
 =?us-ascii?Q?srwxlF/Gi6wp+0/xn6s+nvdZeOhIRL2utRbxKnTg2PdBUHLIezWtQJPzdSJY?=
 =?us-ascii?Q?8fMHFJydTUEqjKdjT7Q+NOl/PsU8vpnwoxlOMTtz0ZP43/oH/a0+eHO5Vv8L?=
 =?us-ascii?Q?h0+fNeG/VD5Ze6E74m/IWVM2duBU506GvTKH2vW5vVPaJWG+3fTlp/D6aGl8?=
 =?us-ascii?Q?zF6ODF4WahUmqWkNsFoA3dFQ0Mb5cqDKcKM4Nej+EIhP9pcdzGVZ8vdMQ5Ne?=
 =?us-ascii?Q?09SwWIbnacYgQmWML9F4yGFaWFny3jUCG6BB+dFuCJ9vlNhI/XWHostsSxrd?=
 =?us-ascii?Q?iEzw/NheelPQQgx5FMvJV/nPIczFw/665O1grdZdhYI288an9DznwZ5XTb48?=
 =?us-ascii?Q?R150z2Of9ZT4ebe7UICLXVyZHG28/SlwRyeFascY8lpCRYy2dbhDrfhQvTHK?=
 =?us-ascii?Q?xEujSm7BmM35ytQ/Var610VkYilH5J/ndRLEbJGpW3wkC4mWiD/W3f9si4Fg?=
 =?us-ascii?Q?Q/42E5WAm/lzhYOmMwu+J1ROyhJbmHckQ0VoQPp+iS2H8lvS70jljPFUyX7e?=
 =?us-ascii?Q?2bpFZj8zGlvmK3AO+xFTJewAOpLdYm13tnRx74KUpTZnSLIgwlkJp60mu8Ix?=
 =?us-ascii?Q?zUh3gcKoV8ml81ZEOKqTJpLKL7jheN+ii3+08caZxluK2YwtBMxzHIDZkBNL?=
 =?us-ascii?Q?yoRatj6cSk8sIz76us7zVr0Dv3mzISBnrfkaUhOfTdWhuidgOzVR7s6xEAfD?=
 =?us-ascii?Q?PUfei2znkcH+xhYRLGgW+lDTvJ8EXR0Es0J5S2u0ASnRSGCpNpvOVa6iAB8p?=
 =?us-ascii?Q?l2QeiOaV5h3Cxmw/+XLkUsFAuEG/8fqovddf7UBmjerKbc1Vxcev2wWHs65K?=
 =?us-ascii?Q?QsbsvxYpQBUpc2RnKRGDmkWog5URh0uAhcaGjPd5upTSXQ9vwdnik06an2ft?=
 =?us-ascii?Q?TVXzjnQ5e/vpkb/qpWZ5zW1o+Y73UF8qGYmqFtE7lAZLpYlMcdWADWsOTJDf?=
 =?us-ascii?Q?Pqx8CkqvUOm0x3RrD/rmJrGPwl+fFLuqJL2ecCt5ayfpG6T7+KgayXHl2qgO?=
 =?us-ascii?Q?Gc+z0W8Fz6Sxixh4ZK5waXyc37U+WzbmPoEqG9LgZ42EmPQQ0s88v9OYTb0q?=
 =?us-ascii?Q?rgg083x4uUPa3VQQvU5CwCV6CGbiKKc=3D?=
X-Exchange-RoutingPolicyChecked: OYpDDm30LcCDSjZnJbWUPb2ng1vi3RCeUA0xQ0nrRUjiqRek8sJ/OTfbaOFK2x1GIIBPriaTjxrm37iftz77KQ9PfabxgU+wVc/rw5pcKCSYXNdA2Z3TV0kfbr1ZdqfsIQ64x/+psUYCSzpwInR5SB18oRJ2DljMqifwzXLk6RtsR0IuvHZbl3rKkKyTlktKv/TPi7nfW9ToM0SK/XeOAzaHoIEq+yVq7FKFxHNz8OVYPHr0INitIiJVfpyPgidd4QD/AWsRLFuBLMj9zSg55/hhelNS/FQiNiL28NTdq+Q/rtls0v83WkUSbRn3P/QcxFQOmPaTSWcZo9bRca6cPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53edadac-7ca7-406c-b048-08deed61087a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:34.6012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vLgxKaD7IjdlXsguW+V7ZxwXGB7rjqI2fYFS5k35rxCXGyEH6fnJAIoOuZ0oPbzB7osmvT/xsQc1Rwy6ev9WJihF0GHrgT5gTtGe1gV/fY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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

intel_forcewaked only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index f9bbb41a9..15bd40dec 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -18,7 +18,6 @@ tools_progs = [
 	'intel_display_bandwidth',
 	'intel_display_crc',
 	'intel_display_poller',
-	'intel_forcewaked',
 	'intel_framebuffer_dump',
 	'intel_guc_logger',
 	'intel_hdcp',
@@ -108,6 +107,11 @@ executable('intel_audio_dump', 'intel_audio_dump.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_forcewaked', 'intel_forcewaked.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

