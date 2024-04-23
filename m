Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F717C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 22:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F55D10F813;
	Tue, 23 Apr 2024 22:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDyjNvj7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D406410F813
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 22:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910886; x=1745446886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vd7E/pSgBgjNHanCzG6R8aQZOhj13xRZLf1S2fxS3s4=;
 b=YDyjNvj7n1Iz4Ip/9CWU1NLRnPeRMGhXGOxPNjPiTEviQf9hUWtT8Tv+
 GvSBP3a5ZCusLZfqv08rcl9X5R0kcdaM0U0O37uuDX70zTXCsLcdHaX6d
 VIRCEk8xArzKtsqsWUPMRLqwMzQ6fgggLLJMBoenBO5XRjjpyRIPHIelY
 RnJcpMzmcm2cme4nG1jYHv0wbrGQ+VNBT8IiwBB5hKcEgrAhgpyj34oPY
 1h4MzCyXw2B8gcX6KocG5RBgUKO/1rpCziURuqh/wnOcJJmErrl5UlQGs
 85E2U5MBPH1pof3f6uDsOaQz2BjpSQTBnSLd89OEQWyFsaoWt86rzun6d A==;
X-CSE-ConnectionGUID: Ox79ORnyTlef592T05EO3A==
X-CSE-MsgGUID: 6XYWRX/7R1iyOA18zg5BXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9736998"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9736998"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:21:25 -0700
X-CSE-ConnectionGUID: INVmCXWfRi2u5+SVAEYiNA==
X-CSE-MsgGUID: mlE2NOtzQJO9E/T5cwEaTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29305989"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:21:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:21:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:21:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:21:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFWMDByun+wjSIqQgi7NtcxUl/fkrtDhpRNN8xPU2DZKC2pCxf6Uq5mjJlY/6SjGhgyamSmZnkq36WWq/So8ha3VnJvB+sDp6/S3QM0S77hV/0XoIln8R4O2p6VD4c5xCkGOag3fTTpRIewyvLC5JqjrQ5sFvzAXQHcRiXjDgejrHvo4BAX4A6R550EbTwZbXfRqComeW51YaJJjJJ0hDgQSv6ZIBp34AituRU3wdEfgOn3XHNXswiQBVvrrual+kWWmUdZY1Ro0o/lPLvd7fUaDJSxFdrLmZhZwaiSOvm9WnMvoujewpVqpP1hIxhIjdmQ4MZs005c0li3241QkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2MLnKVsZYKv7e2gwp5x3J1F75OcxuTG1dyYNtv1FsE=;
 b=ijXIOGUaOWYcu6Qz32324tuPya88s1RHhFZDR3fM09U4LjNiQwSnkf4nV2Gcr8LYthQjijvD87jWrDP9Lg3LdmYi5WeTulPrBVzfQcMn6URYRn+7YrmKKvxlwzbF+F5L3HPwgS5yWAfShYpEEHLRGIL+hdsi0KVDb6DYdj4y4UleToifPt/yVKa1GCFvEMlfiBEa0QXAV0EwgveCq/9BExjJw797Xi2N8LVqPHeerT5NRVHU/NsoWsZfNULwau4NgCIyYcSAn7AYCKaIVpHItbQzhreaR3ULf3GbvmToXZWi2E4xPB6IvO6Ky8qdv2e5h1h6XcjtrBeeuDAiYOBbbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 22:21:03 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 22:21:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/xe_wedged: Test wedged_mode=1 after had
 toggled mode=2
Date: Tue, 23 Apr 2024 18:20:47 -0400
Message-ID: <20240423222048.1285570-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423222048.1285570-1-rodrigo.vivi@intel.com>
References: <20240423222048.1285570-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: d27577d8-265a-44e7-b7ca-08dc63e3a9a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HsAJPz8vu4N+zCiW/0+92UHqhcaiNT8ADIWIIxBA9gTgI6k28eOLbnKiYyw9?=
 =?us-ascii?Q?Bat+IE3UFRSmveR1qE+o/4lUNfZNlH6HYBRtx3z6fIteoI9V6o661g5Yduou?=
 =?us-ascii?Q?8qZzGz3Fb6D4Ix0g6tnRNooYUFkS4qefuYZubwFkGftEZQ/+AKME4yiV0UyM?=
 =?us-ascii?Q?eceWdxGTSx5/UueNCyPD0CFSVrvnObY2Q0XNZZejtqhr7xnwpO3dxyIJ2heS?=
 =?us-ascii?Q?/tNX8NCGF0G6IIKA9g7u2zE22IZE2lENMCmeo4TTR5VqmxzB+EQsf3TQd8WF?=
 =?us-ascii?Q?/m/KwSuuWpiXNAe4968Z9k6qj2wzXHe44dxdfh+E93EC0EEwCJboNUjjctXJ?=
 =?us-ascii?Q?jTE4pWv7Se6cs8JheAHKSqlY4qWdCWka+yL3U6nOSarvXBS+pNOT2FDGToR+?=
 =?us-ascii?Q?WrChq0u1StpYqjNIqkVTA4e1apFn692uCMBdPA7v47MbCQ0QLGE4qsp+zF/e?=
 =?us-ascii?Q?JXnXepjHaPeY5xgaUEE/VMlyvwmgxlzJgtP/a8evBcltP2bs4wUohCQBtVnB?=
 =?us-ascii?Q?7BX8Ygsh2kaocaxa/9qYwFWdSfkdCJUsYjJPBxS6M/llZq6PJ1fwIPWVxvSb?=
 =?us-ascii?Q?Z53yH7gGr/5mHvHrTpHt9F41vvWRlYFkuVV+773pJElDXTZ8VDb6ORaFa88d?=
 =?us-ascii?Q?v5aF4jf1vzFkLkObvYV2T3p6V3yBXXMcs7x/P786kHNeyv0v4Fjn2Om8MXwR?=
 =?us-ascii?Q?uHi79hG9nq8k52oZMvd02r3sahTfeZFlUUxTZpeKxbk/SkG4GTPfdlxhK0xp?=
 =?us-ascii?Q?G+tvRoFYYiFo9Jn+IVQ8swDYhwb328i7RPPh90AycZkhl7lD08rLBFQFAxt5?=
 =?us-ascii?Q?3fWaBCNVuAfqtaXw3EsEA8WLz1GbMRnFfFrSziuPCUqW6CQFTfi4SPG4HoIr?=
 =?us-ascii?Q?wZ99xgfgTv9X3vmeBj4UEskZ1Jl2I0FfNdPjZnMsLe9Lx09zDQWdzhxn0mQ8?=
 =?us-ascii?Q?/MKhINpoq/ZJHiIOow8iZjPNAuiyfNjHISQyuZu/SCqrY7kg2wuKjDQyrcjE?=
 =?us-ascii?Q?uoGXyI6kmv1nID1c9nsMcRjT4NaTb6DZnmEhL4yjErMOZycuv1JHmtsb5gLe?=
 =?us-ascii?Q?TGM3hqpfwwWQt1L+BH/QmzywfrSNjxDprsREDiEVTEx/n9c0q3Xvv5tKkHFE?=
 =?us-ascii?Q?GnWsntT87ldHhFE8bE5w9vtp3nLU/1gosfjj0juD3YLbzk0Lxdl0BiWP3XfV?=
 =?us-ascii?Q?5KJFwDhIcERfD1WL9WD89hd8sDvu55M5M+b24DLvLV+A9I1Cc1+WHf8X8tJ2?=
 =?us-ascii?Q?V5mX4E1mVVMBfsGL4Y9iq82giI+yH0I0hgKRKPHZ+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rj6vBh4ocuvaRQGviOO7GzUzLgbwwk+4nnF/SU8pEZyP9t7VyvvCrRC41myv?=
 =?us-ascii?Q?2jZTGY/pMcIp5jPU/jrs4KQN4jFhiAIU8ZQwJoJ/AJisT12qpjoT4o8wuv7o?=
 =?us-ascii?Q?THpnt736/Z3d5MP+3bI5zh5s1Gg/DDvCVcKOAHiy7nn1tXv3I7bnroyr4B+G?=
 =?us-ascii?Q?qh4ccpFbFWf+a04+F2pYnSbXlVlQxbNrWuP7WEIFsz6GcgoUsWHfT9bgQ1tE?=
 =?us-ascii?Q?06NvTTFM3B7Hi1pWW+QG98yo4e1plMAXmhUhA4ZZwAR6+zXJvdciZ4EubSwt?=
 =?us-ascii?Q?1GpCFRSXkeOi7hDUHUUZlmlgAjcIiU1sIyD5lbZAPXSTNFrquNwDmpt0SD+N?=
 =?us-ascii?Q?Zd+nrTGTTidUEAGQ/WvKiRF5tm11dbR5woJK417VZAGhoV2RSJ+/m0Cafg9S?=
 =?us-ascii?Q?w9KtkwwO1j+nX4vr0F/Y5VY4DlDJcfWtS5EJx+AFv8/PCro0THqr08NLgjzV?=
 =?us-ascii?Q?LOLEsIPEwGq1Gbh8FA/HQW7x5tnQFOwrgYjZBBtdpRVlVdM8MeVuEikZgkAR?=
 =?us-ascii?Q?HNcb3Vhv4wCcRSbwvokXF9LNGZlWtDg9kkZ9IBOwC0508pOJ3LJAZeioNGNl?=
 =?us-ascii?Q?lvJzm8Se7GCzfpn8P+j7V7WMO0DTHXjre8IP4jWAhDx15Yqlfv7ZWxuhTUTY?=
 =?us-ascii?Q?VeQzqTgoM48sPW2G/kiahBeNnf7PcggKVlh/kDQGM+WPHf65As4gRVRKhFp8?=
 =?us-ascii?Q?NQikKH3uEJO/YUidQ39C2rA6Y3ROxDQ4o0OmwkEzpKPB6PpLVNVrqqnDpSJ+?=
 =?us-ascii?Q?vTIw20U44nl6z00xCeXptXCFsrci+9hP6fqkShe15ggY2U7TjjNku6HHeZQi?=
 =?us-ascii?Q?EpKEM1YZuIN+CH+FcPXHRQKcEKo6PMmcsJVqXiZv6ICAG/hHsGhW3hc89B+W?=
 =?us-ascii?Q?1LKmopleoa284/ba1umLNwKtWDaQt6bx/SuluNYNR6lx2lYopdZegp6D+Ras?=
 =?us-ascii?Q?5KG4IGLHSWLkyP8dj1BgY7re47U7JZJz5U0CLvD1ixLisMcUQynpUhfld5gr?=
 =?us-ascii?Q?AAmQl7AEMFPoGkYhGc6OfbZV9yT8XTnLJY4PArYofl33vacfTwcF7EqVWu/9?=
 =?us-ascii?Q?TPCj9CKRaa8aC9mXkPo3VN/DBOKEq3Lu8Zsm5+ygCacnbRXATEEVzknDIuZi?=
 =?us-ascii?Q?+lqKgJEi8sq9J79kMSfLrNyIzp0L1U6CrXY9CmyCHdbjrJYHWvU6KQYP84NJ?=
 =?us-ascii?Q?2O/oqMYemq8qX/MVi6q6xJ1S/rKRMGNawYUfNORd/gtdX2pd/SemXRUjsbYQ?=
 =?us-ascii?Q?BtcHTaby8DEVuMXstC+QOvLCq+X8VTmbi7cU2ScYmyo3MCUwcJ/QdwcWeLPv?=
 =?us-ascii?Q?GS/bHvMdiqy6wFRQwbMvehIzsiHPN2s+LBSfucphS81v4dbjiC6Fe/ALrgMP?=
 =?us-ascii?Q?RkyaHxdZYlNXewj8e+g0Ep1riiQ3DPEt1EhDXqWWxsZd8DS2eOKmSqnLtLYq?=
 =?us-ascii?Q?+6qcOlW6kNbTsuR+fcaEedxCd9i/M1ytebFYIrhMPcZGWTDh5X6+3BmHgyMA?=
 =?us-ascii?Q?JtPxnNOawOAoDRaCXF+mnvedLMKFVbLOmLeQ5OBhidqv1EVIxx8n4tGl0XKH?=
 =?us-ascii?Q?LWuliJ0lE9OVf0GRovXjM8sPKwZ4tXd5Ap1WmvE0ZKxpquzqhsbI9RpzQHVB?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d27577d8-265a-44e7-b7ca-08dc63e3a9a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:21:03.7792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEPeXXH29riA/1PzPH9bNbOvZw6fqkpVKilKR+E5WIrVL2mGgVQsqdIjIGhCDNm5F0f3XAXtiBkZH21kWJKTow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
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

Let's toggle between different modes.

Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 35fc905e7..b9bd49fad 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -216,6 +216,10 @@ simple_hang(int fd)
  * SUBTEST: wedged-at-any-timeout
  * Description: Force Xe device wedged after a simple guc timeout
  */
+/**
+ * SUBTEST: wedged-mode-toggle
+ * Description: Test wedged.mode=1 after testing wedged.mode=2
+ */
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -257,6 +261,16 @@ igt_main
 			simple_exec(fd, hwe);
 	}
 
+	igt_subtest_f("wedged-mode-toggle") {
+		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
+
+		igt_debugfs_write(fd, "wedged_mode", "2");
+		igt_assert_eq(simple_ioctl(fd), 0);
+		igt_debugfs_write(fd, "wedged_mode", "1");
+		simple_hang(fd);
+		igt_assert_eq(simple_ioctl(fd), 0);
+	}
+
 	igt_fixture {
 		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
 			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
-- 
2.44.0

