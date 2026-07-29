Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AD6C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FA210E631;
	Wed, 29 Jul 2026 11:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvgPDEBu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C16F10E631
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323032; x=1816859032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lurURN+vLydr1zV6PWSK3XC+TwSo97/IQhFGyMsllm0=;
 b=gvgPDEBu/M76Rwcv7kshKJ2nL0xJ6Biqo4c3Ux7bQzOJgNA9zILusHkC
 LbWBRKaIC2yCaImmvf2K9Nld+D+EV3OktkJTcgd732ET2DcqZMqVkv3RB
 LMrdcIUGghrKE5EHLexmcCY56MpS0/3X4n6EV0gx5Ltuy62xBf68nas0P
 7UFwBs3z1zvLXcVVD3pZ+OSAmvM2KDPZTT07L0aQqBuAlvm8G9tEGDEU/
 z5cRdz4grh/WFZWeqEbbGej0iI41u1wd8ZYPTA9GZdnv4Kp+2B3PymS+4
 +0hD0DNZGyBy26Ps13aPSZCqeXtHmipUNsOxkDL7f2eSKuC2ZE0NIyGIX w==;
X-CSE-ConnectionGUID: NIJmoAzwTV+iIWnaRcTseg==
X-CSE-MsgGUID: Z1yECTgwQkeJZeGr8mbFPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89743539"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89743539"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:47 -0700
X-CSE-ConnectionGUID: 6wX4EbG2RB2F4t4m7DD5MA==
X-CSE-MsgGUID: 6Wcngt/CRLCia96j4v1Tnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256652939"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:47 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WeLtrRI1lPrXlsvAFxVB5U5C62vj/SqZWYX5NZMq/PP/OYcspEiQXKFzOfY0ibHPrVGFmXrF64CIc3NOet99JZYQWGfBk0lenZJFi3NNrECdO3Ae5zhGSPLW5YJwg9sEnptrN3y852OTD1aQGcJf8LiaOxM+17JFMQ42pR4aBcjcfKK6SVWY0MGEiwKSefoSAb4mbht0y+w1pikfatfT6S76bPhKTOoJBu6XB48eAnVc6x4PjC8EtarQablhAktgh6GJNT+q12xjQIv1u+pm1W5Ve2/IUGLLOakXvN4Tg46L7IAajrdzePQm8KYkHYmXo+m67yw5hnf6Ka6ac7l++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnLBqWecAWUmGRWhN2OzxQvWn2NvAgyPeV1lKRyJP6U=;
 b=HINRehDR1G8zT82ZsvWtIwd/tiaO+zH/H8ESoXFuuf+djYxY268vBCYBNU1LDHTBl9Dpd/TWv093KMb/7nkAyw0wzycQXZGGX8yjf5yBua8aPjh0eYVL/4HvziI6UGnX772alW2/p/UOmP23cmb7BcMiFPZ38r/TZNY563z5Hn5erGwHCv4B4xAUVcWBS2Mdf0ZMgQmArlIAiG/aRfujOihnmqJg+ccgXgVp8U3TL0tyEekbiSh8RK6JZqkUwdQVrXJ+82E44XT+Z7gcuZbpgZPANPsD2GiE9DG8RyjfcUzgY98pe81gcdrndJo5LbbAXK1EHfeFdVpD0sLhHMzfvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:44 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:43 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 27/31] tools/intel_watermark: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:44 +0200
Message-ID: <338da0349d82fc2b70f4614142ee6acc3fb0fc64.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0d3ea71f-98f4-48da-e4ac-08deed610d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xF9k1jAaubDiXIoXzSLK3hqpBhNm/HcZDAC9gGtzUof4iXZjl266vc72Bp6b9GmyQzCElykNcZFCObNLUfjIYjPIZEtUXuDohCIFEE8km0LfENKudClpBe3ztDRFfrTK3xWTvCu8pvt6NFaGQUXSeeKsYmnHgOj8wUJIvLf84thXFVusF4+NmTlsrkgMTwaLAvTdgp59Sj4pgsZCTb4v1McZIG2SntPrKns9xRtsbrHeqV9abjN53xRG0vfxQA0simbxCPIE6hF31QYgjPStNcgLRy9DxKhK5g48KOHsxrI1opmoa6uPQ7le0SU3vzY4AvVrnzWWO+NpuAL+ViH2nnxRzRSDEcKFkTGuAQCkvBnmuacSu9SsemHRQ8hZLgaVKz5yXZjhsvMfuJ/L9fPPlPSfZclp00m4VsBMjhft1lsiO5tu+wozES0utxURrLdDmHacQniTruMw0YoT3e7WSa5az5HvrfpoesGeSsNeZp7Ny0LqA1yenik+g+ti2I03g49/vR8nWT7ohzPYxw9hG6k2AJFWyvypLXDeUPI0IUSEB7qJG775VdNqJZ5FUbu9fJB2ZiYCyXlhOu1UeFtMilgu3x2pNnAld57GjZASkKQc94RQQpcwwYTsUpm3YRAV+BcQIJ0NyRbzA+LPB76RGrMkFoP5dDx0k6Otey0R8yE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/lSbCDCHdPGwd04E7HU/M9J5BKFqTLLRalNXum/4KFH1e7WRt/daz2N9ka64?=
 =?us-ascii?Q?8Tknyq9P+/eOk/CZf+XW7amroNhGoP+yBGBWS7GX/67TUTbZeEzfqCKuShhs?=
 =?us-ascii?Q?5REscF+KBg36F7mj4C+atWmThwfXSXsXE2uduU5bj9ZnfGOpP22qMpIb3HuB?=
 =?us-ascii?Q?tZHsegm+4991GFuMVOh83w3mAT+rXEDLP/E6ex52hNBsddDOkIaNSpQ4Pnaa?=
 =?us-ascii?Q?8kmBJF/27IWJyIkx5LWA4jNOdw9olTz4NDzArmgogqYIqZLBUGYwWy7amtJ2?=
 =?us-ascii?Q?DhuYjOuULejIjpeAi2ZEMylEK08T1CjKAWPUWSRB/VTlRZ+pAPmqSDd7sUp2?=
 =?us-ascii?Q?VNxtWOWCSw22l28cLalMLu3O/ufTlMZCYon8bcKIxZxdj3BzRgohyua0E7DR?=
 =?us-ascii?Q?2VSMcDnLrLft/8r40ahKwlB3/FLuuEAaThzu3B/Sq0uq/y0rGdXk+VVYXwJ/?=
 =?us-ascii?Q?OZ+2cTqK9B4aY3a/pkb1RU0bdh59724QToxuTpV0KS2XX3MgpFJ8VlUEL6o5?=
 =?us-ascii?Q?EXqjoTNSHE/GXYFMC7zlJ3ETKbtb5ngoHCLZZbAEgm+A67fSOh4AvOAX9pd+?=
 =?us-ascii?Q?wWjkmU+nCtOx6/Z20N+nYPf/j1l1KZdeIc4Ek3VrPJ7LsjRo0oL0PWBOnVHc?=
 =?us-ascii?Q?CKzXwmKB2GxpfzyAbL95RcgGzF/O9VN0knC5IGTgwTpC691sX8o5OMd+zuwY?=
 =?us-ascii?Q?vVrEwMRzUZxJiMuyem7Y9mmvATAJZh9cgBTStZ6E+fIl2ZME1lcz0NM2BLWk?=
 =?us-ascii?Q?mLpvnREhmMK+edRrQKo+A2GnzlNdZnr+mhtqG80/NWp21mReB7WKVIpcUEK+?=
 =?us-ascii?Q?MWlvTK/rw1X3xh7RJn9b1Sq3INtpy9jSmuRfJBIdi1/gj1PWOSFlCDzUjhxu?=
 =?us-ascii?Q?c/7ylrfVLmrWKN9LrnlTdug9j6+Hhspyj142iPzFhdBvkQI2K38vqhZoaOYz?=
 =?us-ascii?Q?eVyccaTpwFn5BlaoGRtetmNJH+7PRWNTWSr1tbTdn0iG7zFYLEET97IuYAN1?=
 =?us-ascii?Q?ew12t4lD8MNEn7g1+jIALG+0ONxlKx7Ut9L71UAq505tQuWYHb/oSvhfClhd?=
 =?us-ascii?Q?Q1zi4s3Zodv8bAM7Iz6HdRLJXhlIBmtVSfiV4pNNJNg+A78YTNRUgyq0LvBZ?=
 =?us-ascii?Q?T2JiztfZHTAEkKoGtJUjvEdm8TMoqDUv/GXGZaKGyUZBpI1FHzz8WonQBX44?=
 =?us-ascii?Q?ETFff3Hev2MbDtGWB00i73YvePI0pwrMucXYX2cqeDuh317DDqT2nBh2Y6SP?=
 =?us-ascii?Q?ApC//fhkDKSg2iBdW8UQm+12cFaGVV8XgFY8QR7kKZzSzC2dEshEODQ8918t?=
 =?us-ascii?Q?B4LJFaVJDqaYnfDePWVTHFYjs9GD7T1GtJEGFTf4h4V1tepzePLoLbKTq66e?=
 =?us-ascii?Q?e8YVIjgyf9ByVGkE8yUBmvi8FoPVjzrD+UKMAG33z444PdCU2ZX7HOCcfPwo?=
 =?us-ascii?Q?LOhRgMWYSktASF7snS3XIuXnaO4Dl/Hzc+uRa+59fpKt76lOVD1EFafifHvw?=
 =?us-ascii?Q?VYLSbefkRVGdnOBqbhq8yJdbqFggSUnMeLD1tt1p0N5zD5gzci9fvUdC0hTs?=
 =?us-ascii?Q?NQHoJ92vXyrLmFAdR9bHSj0f/FvrspPAtipURfjOQGD08OrQDw6tfhB5ldqy?=
 =?us-ascii?Q?m2jtC/TdmHcZC8sOMNT0GogR5Sg2Z8uX+cxibcLLi/f+y6/kKj3HnhXw0ltL?=
 =?us-ascii?Q?goVGmsjPcD1tC7hhgRnVub2y7hOUTtfb8o48fsDt3hFa0uPDJodHSQ4yl93w?=
 =?us-ascii?Q?LRehCCWhjeCDVDvKNH1xk69LkQA9NRg=3D?=
X-Exchange-RoutingPolicyChecked: gvAjKK+i5BJMJK4/+imNiz6y0olPFDhvdfSR89J6SQajMbKSmopSGhgeD1QhX9TdFAijyUw4kHArvvwPvrUAIYY9EEs8YoCQbeFv39+UzG02+3+ifndSgqgm98dwoUWIYiob7IRCKTuDvm6Mow3LcCO41B/7NecLmF7KfnzIwwpcw7e9xJbFlwmVSLM/mmjTTHEqHGxmr/eBL9JX9POfWHsMBrZSznJePCpHXOAxrMR84FvwLTn6ZFYP7rG/nO72TBiqukkpqnQZefbKM+gg4URpn5Y4K124L5/Scf1MQcI7cyMrKTKiRqf2b1EiisfL7ixyEepirWJAofXMF6WXEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3ea71f-98f4-48da-e4ac-08deed610d85
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:43.0704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xek3cPlN4MIHAhVIKkJWz4zh1UCbrIa7R8VOkG71smyxgmFA70QTV6FadsMJImCSFEM8ygEvF+rwbUJGJFQBhdmMbxk/vHsO2+vjyo/yDBE=
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

intel_watermark only needs the register/MMIO helper subset, not the full
libigt.so stack.

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
index 1a4e14ed3..0cc62b54d 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -26,7 +26,6 @@ tools_progs = [
 	'intel_reg_checker',
 	'intel_residency',
 	'intel_tiling_detect',
-	'intel_watermark',
 	'intel_gem_info',
 	'intel_gvtg_test',
 	'dpcd_reg',
@@ -124,6 +123,11 @@ executable('intel_panel_fitter', 'intel_panel_fitter.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_watermark', 'intel_watermark.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

