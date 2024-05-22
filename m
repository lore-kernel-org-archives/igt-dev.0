Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E594C25B7D
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 14:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E30510EEE2;
	Wed, 22 May 2024 14:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vi+/f7xz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919B210EA28
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 14:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716388434; x=1747924434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WZGlPpe0AJ0SDqNv5u98bZ+KT+JChD+cG1DPQWSXZk8=;
 b=Vi+/f7xzPPF34bMgqTv13VYv4zq/YktOiSyTn5opSGVBK657oPJOWICV
 gqqvYqcNkJgAnExzYGtd5bWm58707FFMvDpTcd233rrJw4aI2qUaLy2w2
 0hDqb/PZiaeC3cIArjDwnu1mtsTGL6pbeQ2SBtUxPliyk+i2DF/2TQ04z
 EyyD6ar0Vvt+1FrLc+C/ioc7qOt5/8aDIABl42cChd1TRT4JfpYPuUtgt
 2/Qg+k96MmhCeV7akqOfemsgtiiFWjPxHIFpnXX+SChfLZy6lVnYjR86z
 fuHzmxwurMvzRD8o0UeYFDFJZGxTzNZQnDDlZJadeej8afZgn51yKZPT6 w==;
X-CSE-ConnectionGUID: xS2izBTxRU64pL1cNKqZ8Q==
X-CSE-MsgGUID: zlkCrGQfS6OMpiqDh9sDRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16475507"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="16475507"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 07:33:54 -0700
X-CSE-ConnectionGUID: K2lyhzkWRtKI0Gl5ya1GsA==
X-CSE-MsgGUID: REDT6oQeQxSAl7KtgWV0cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33888553"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 07:33:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 07:33:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 07:33:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 07:33:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 07:33:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TG+9bkeOVVkiOhuV+EMI+MALVl8pYEob+Zw/GvxNbuhq5m2Ud7Y0KPBPXVseOxh+xw73+I6K/1aBlTqKgnI53tfLlMm//3YUyLzSDKN/ebB+h2AXiNNQ0MWHzQfyZi/K2jkCjG0PWe4GcLhZikgKgfJLPBl9iS6JtamRWOR3yfGnBl/fJx/+XuSB4oTCQrR7FwRVRAi3jA+ZqVFRIIDY+2T3IJTQUA80apwHZblryWOFmxL7XW3kbQUNr5BlG80BaLNpDXufPbMF3VUNSADdpM1mllqVIzWuVUPsSvY1M+diNGxOn+Wf4yeUmmuk1PM256NTNnZBnvCN8GBKABx7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rb4tjYBtKnS5AUuiQkpVGu4LhmgOI2Dl3MaUw8V33R8=;
 b=ZLyqRtRsfYkqOP6bTehkiBwGQx+CCvxl8WV6Xvk5vQl48sYmIT2fojhglBbOZsrcAFNzzJSNm7hRAmurEmWm92vhDPE08XWmZ/MwX7D7AtOvCG9NPflfSCHn3PmVw3k2uFA0oCN3t02iUJA/xEPStfKcBV+OoDxORhzZUdgjtv4n2bJRnHM3jChF6sjyeY7w3u/jIRUOc3aeCebek0EColPb/Jvr7qcsiRKNbFkQUPZb2TzwasB9PQLPFKi42PNrk44libZZZhlOw7zb+9S8gdr7k4VMJmwyVO2I2V0lheTsk9gbt5wSoGRn0/ESLQnGv8jtK3YD2uvTqL7UNplveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 14:33:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 14:33:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Swati Sharma <swati2.sharma@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
Subject: [CI 6/6] lib/igt_pm: Convert suspended_time from int to uint64_t
Date: Wed, 22 May 2024 10:33:30 -0400
Message-ID: <20240522143330.312014-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522143330.312014-1-rodrigo.vivi@intel.com>
References: <20240522143330.312014-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 7107d037-161d-4f76-aa88-08dc7a6c3235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pJRDo8kHFjkTz77wthKKU/AWWELS1QtOyRfdJC4Yj9wbVxkvccL3C83m1Dc7?=
 =?us-ascii?Q?zvdgsCUxmLaSj/Yr32KlCmVYe6uXvU+MRgE3rDWCKX9LskjMw3yS0cZ2C4GA?=
 =?us-ascii?Q?Pu+fCNG6LJFp8hF4Xw/351b0nXxkf+PEzUUzstulIV6MBOluxtC2YbNFO4om?=
 =?us-ascii?Q?SgPl6HnEwI2zvgoL/cs19aLPxrQcApJgCdx9ltkhMfjQYzOqkMT2VNjGN4mK?=
 =?us-ascii?Q?GnSYhsSNrlGuAYJB9GD+N7YlF4jpY3StDI43AFWCOYzt2sdXYayeouGct/Z3?=
 =?us-ascii?Q?AajNXCURhfjNyYCVLeSl6QsqzjVtZQ7to9cZMF4ooZEdAPcn093srGCw9mlv?=
 =?us-ascii?Q?97CXiKjWXNVm1x04DlU1bcsbWsww7yDv0oO4Aw6l2SAmS3vNx2OwB8Al4LbS?=
 =?us-ascii?Q?LY9awe6kGs+7zg2iTmeBKsat1csQ/EBx6+F0I02I48vAASJhccuKpo2vKWZ8?=
 =?us-ascii?Q?upFJP0O6WbJ2A29mXl9aMTRn1/kLg0Xk8Zt1AIJe9cIIIK/hAAWgSth1NjxU?=
 =?us-ascii?Q?OlcvcvyHXk5HU93cH3WhtP3iBsMaM4CB0ybMzu6YZelIYEVECDiDKNFRUoVv?=
 =?us-ascii?Q?jQ4b76cfi+pyqKcGvshFlqVOYpWqzzmasqJ8birO74w2uqRcy6IWm2qXA6M+?=
 =?us-ascii?Q?wFy2rx7pXHK4DPCWElHTB8FzjH/Xlb05SxvRKKPo3icCU9Vae7K7COMt89w8?=
 =?us-ascii?Q?JfW6twG4GeQ+Bl8tIicxFdWAAAz9jJgun+kWoWQl6KtMr/ZpLVFlOEcReapo?=
 =?us-ascii?Q?yNKPANMbuycieUXMoFHSZCqFcmc/60rHR/eq8MuxlPX9M0S0D9AWK2oohzmI?=
 =?us-ascii?Q?jsKAhGy0lhfY8W8vkc0laYf6+yPy2X9CGjUO6+CO8EZCjiuvsmKHDO5oX0Qs?=
 =?us-ascii?Q?Zzt0VhGDnmd14D7M6pr01eNpJSkbeH00DjZvD9y/Jc7sJ64//0jEeKVQ0WTX?=
 =?us-ascii?Q?jT0xvzs82/JTX6qmYWA3nZMkU4S8GqLGWRPLRrSTRPvkVzGbyg4YFw5eIu3W?=
 =?us-ascii?Q?28C+MrVq1+FPB21Vwp+wEWFb/RNwLO4uI6N7ysQlukLLMvEH/P9t5InD9lCC?=
 =?us-ascii?Q?UHBdFn0g1Hhqz2Fj0PTMCt9DsWQjABEyg3moadV3LhcqpzcrYlDcjYGBmE+h?=
 =?us-ascii?Q?eUH9gl2/QrTPP48HCGCZq6dsCoLvnInMec7SpKNaYX+a3EJq3bDMjLF2ZiQv?=
 =?us-ascii?Q?1/N+6QPis3jTS5keRdCDDCGf6wgYu6qn76BM47F0PwGf1rE+GKOQkJvR3Lmm?=
 =?us-ascii?Q?RsRsMoTzqtnU6A+6+I8/Ts+9M+IwCk9iBuoN0WcNjw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IDypuGVMY1HrSO1a4rcqtVx7xHZ8nQD/wIBWZjaPYw8bLMv5CfxsRw+cySnI?=
 =?us-ascii?Q?YzicR4gcXy7e6L0Nox7CS54cNDMBjzRWKddnUk573UOcjAacZQWWpVAJdk9Y?=
 =?us-ascii?Q?4UteD/W44umLmQY+goHE1+gmWZGqR/VaaPl0v+LfvszudPO3lC840LLVvuKv?=
 =?us-ascii?Q?sIxqv8x+42tnXk0TeddQ1wyVXJl9QMDYw7R1JrBI4wLdSfURmxKXdQrsX2uN?=
 =?us-ascii?Q?qanU894pkp312Wvt/lZnw35eijScVQOnbN4lYgmtGSR9Jnl5FRuqaGsoU61g?=
 =?us-ascii?Q?2UlnRiUfvv/NETUd7Smys0qZ8uFrbPn6Ndgd6yzhXWoyhKut/AjmQlKPRxaT?=
 =?us-ascii?Q?r7aQO+iFibwmuSxq3Zrx6Xadcy9kgsIVFnZMSKeFkVHaxnd83QESjB4OS8in?=
 =?us-ascii?Q?+WGTTtTxpA0XvWXilhyuxLFI0eGx1lQYwYoyT1VWP/Q3RGRD+o/PeIvsqL6n?=
 =?us-ascii?Q?OpduZd4bTGECPGxnir6TUBg1pPcLePzNpmmJvIN/5Vdb4n4hnEER9o9TawVT?=
 =?us-ascii?Q?m4X1KHK3F9RXlN+aYTs7UTiSKbPKwXHRbqDLe3uuqMFcs3tHlSclozzzsOZ0?=
 =?us-ascii?Q?Y6ZoWZMzjxvwv3x11zJdCnd5GQosBSMkEmen28ralX1xwKhxoVuGVv0H/KDM?=
 =?us-ascii?Q?2brS7wnM1bYZBaWHGwu2WS0Q1zynEPE9sXPdserSvmcoRMnNan7/SOPMVC6F?=
 =?us-ascii?Q?CYZNDzealPWjpaKexihdmiJy3/dWLPeyXGmwiMl8Jy9xYUqkBqjMVtd8o8+k?=
 =?us-ascii?Q?PFa+F9Mqdn9Zursdk5LgRmKJMH2xRlA2eHc5+hzAi3kfZmw8l+A8+/8kHyYm?=
 =?us-ascii?Q?xR98SloniMV5GIx00VWXEBByuyXuaSb+mA5ucBdoUBVicX8WxXSKnJkpWYpu?=
 =?us-ascii?Q?Dwl5z/c2wZrfsJkIdnz//96k4W9JkkSiVq+E4EWylscooqYoRVnPcI7f+Ux0?=
 =?us-ascii?Q?PrBbub9q3angJj/f3Xh7BMHNcpzEuLt80xdfA8AwMu3OILaFbtgDXh59BSSV?=
 =?us-ascii?Q?bKqxCJSiNVLyEEINdmcPwJJgTqmBOMVep38KD879Se9VENSh00vDe7JS8zy6?=
 =?us-ascii?Q?vWSp5EWaLwYdIZiHmIM+ixUYYBxe5LP/tt/jqvr+H0x+UAnHEy4ctN26REKQ?=
 =?us-ascii?Q?vgSXdB+IFue4Un7ZoyON51q9/jRmJO00Cp2uFPadTOyaFySpKaWoTcpiDizp?=
 =?us-ascii?Q?1CMpBvBFblDUibhqDcWURTjaT9L8pXHUBK+1U47OyLzZX6BruBCZSzDBlpO2?=
 =?us-ascii?Q?mXvKaOnfZFfj4CgUawWTKjGgG4E8At0GRItqZjpY1QXkBtWPM3TG8geiJhJQ?=
 =?us-ascii?Q?n2oBrbeOl2rucBcn/AAj9RBhKwh7Xl1O9eoaTrAEJ+6ZuongyoU6/m49ZvcJ?=
 =?us-ascii?Q?5h5cAi1dw27gDOzsLuyy6UuHFMXLSE/Pm0mGHz7PF9eqNCYdm47ciIsie6tU?=
 =?us-ascii?Q?1mo5lfuiX3wntZZbQOoT9dgOz+nPgXylCg3qf4VWuHNtnCCc/8I2JLGlSP71?=
 =?us-ascii?Q?aC3U+f+OI172TvcfwGZMcbQNcWPiHda9CHxpa0sBIzJhfiUCPJjDxLo/4uE2?=
 =?us-ascii?Q?Qc/dICKXYKrVYDiLBdIby4Sm3tDTL+2Iswa1lzoblxAmOo8lsG9QvLQs6ZPe?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7107d037-161d-4f76-aa88-08dc7a6c3235
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:33:50.0381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQQfvYK6Y39eoj0o7f4JiHBzZN6x/+FSPlPINT3WcBknk/OAaEUsq0SPAboy+9jjQk6y/Sa0O9LU6tL/AsmCRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
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

Suspended time is in milliseconds printed from u64 variable in kernel.
Convert to a more appropriate variable type.

v2: - Use PRInt macros instead of %ld (Kamil)
    - Explicit time units (Kamil)
    - s/suspend/suspended in the debug msg
v3: - s/miliseconds/milliseconds (Francois)

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c            | 11 ++++++-----
 lib/igt_pm.h            |  2 +-
 tests/intel/kms_pm_dc.c |  9 +++++----
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index ad7e13604..cfa628324 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1390,18 +1390,19 @@ bool i915_is_slpc_enabled(int drm_fd)
  * igt_pm_get_runtime_suspended_time:
  * @pci_dev: PCI device struct
  *
- * Return: The total time that the device has been suspended.
+ * Return: The total time in milliseconds that the device has been suspended.
  */
-int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
+uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 {
 	char time_str[64];
-	int time, time_fd;
+	int time_fd;
+	uint64_t time;
 
 	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_suspended_time");
 	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
-		igt_assert(sscanf(time_str, "%d", &time) > 0);
+		igt_assert(sscanf(time_str, "%ld", &time) > 0);
 
-		igt_debug("runtime suspend time for PCI '%04x:%02x:%02x.%01x' = %d\n",
+		igt_debug("runtime suspended time for PCI '%04x:%02x:%02x.%01x' = %" PRIu64 "\n",
 			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
 
 		return time;
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 15e301533..6b428f53e 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -93,7 +93,7 @@ void igt_pm_restore_pci_card_runtime_pm(void);
 void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
 bool i915_is_slpc_enabled(int drm_fd);
-int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
+uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
 uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 176f7a04b..7766d34d7 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -488,10 +488,10 @@ static bool support_dc6(int debugfs_fd)
 	return strstr(buf, "DC5 -> DC6 count");
 }
 
-static int read_runtime_suspended_time(int drm_fd)
+static uint64_t read_runtime_suspended_time(int drm_fd)
 {
 	struct pci_device *i915;
-	int ret;
+	uint64_t ret;
 
 	i915 = igt_device_get_pci_device(drm_fd);
 	ret = igt_pm_get_runtime_suspended_time(i915);
@@ -500,7 +500,7 @@ static int read_runtime_suspended_time(int drm_fd)
 	return ret;
 }
 
-static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, int prev_rpm, int msecs)
+static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, uint64_t prev_rpm, int msecs)
 {
 	/*
 	 * Runtime suspended residency should increment once DC9 is achieved;
@@ -522,7 +522,8 @@ static void check_dc9(data_t *data, int dc_target, int prev_dc, int prev_rpm)
 
 static void setup_dc9_dpms(data_t *data, int dc_target)
 {
-	int prev_dc = 0, prev_rpm, sysfs_fd;
+	uint64_t prev_rpm;
+	int prev_dc = 0, sysfs_fd;
 
 	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
 	__igt_sysfs_get_boolean(sysfs_fd, "poll", &kms_poll_saved_state);
-- 
2.44.0

