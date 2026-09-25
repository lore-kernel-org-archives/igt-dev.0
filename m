Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5FBC9830D
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 10:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B174D10F9F8;
	Fri, 25 Sep 2026 10:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cf4Yg25A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94CC10F9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 10:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790333883; x=1821869883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xc3WB/NUn+tEd6/oBvEwT7vYwPmdIbux1ypYIS59T/E=;
 b=Cf4Yg25AiBFedpGMZYLKgqBPCwmJPmPQl9T4zueCiFMQ0vodE1YwZlh/
 Pzz7LZojjqvRj1WX1cumjCEDbgnCgNJL3PrYFPfn340hE3HD0TO/gNYsq
 MiNxQxjxdd8ZOpHedq+K2KPpgWg0h5i8kNBZ+Azw+r6oEL6VV1QLK2UO8
 zRQr4lyBqSTl4v2abBJWn8WasXMSkRICTQYBOPuDi/Dg5XrOLBH4Nm2OT
 tp2PnYxnqxMNvpjl95i2w4bC95E4BQVAyvQJ7uIsBx2H5wEnrzfjWZRZw
 4OiThUeuqVtmcoskxnf/TE5bNp4wEdZecXB88BB9ziiYaaKMffgJTP1cI w==;
X-CSE-ConnectionGUID: OCShQam1STCyrd04GPIu/A==
X-CSE-MsgGUID: OuC1AlOnQ3GI/SBsxB/MFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93613494"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="93613494"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:02 -0700
X-CSE-ConnectionGUID: iHxI4XVjRcSbstgVTMIjbQ==
X-CSE-MsgGUID: bRaRLgwgSTaOVdjMcmH8sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="273539715"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 03:58:02 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlsUKP8fRfDN4BkhR1v3K/8NLK8V/f3ezOlnR2jklMMd48KICDm4ojXAuO1zVe8ocQPt55WJLbJDdDNtpXnbyxYGTagckcwk938UbYQ/hINPMTxnc/wp2v7hDgqUuK+XAsbD5QdNCumgljoT8WVdWKCO6YbThWnUQo3pKus3ZUc1ExmwmW5i9fj0NTEB5a3ItdON87crOrX/Q1vbIWlUS2OH5qnyTWdg7IW8pTAAZ/7bpl2gqTFOxJIOnX0cM3v2U8MFXUFBYFk8gt8cJgXvWcDqRhSp+GhAWVm9qCTQUYquJhhCC/dhReM7C9yYOm5Y/uoKsERJlYubhQ4n2C2NCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OicUMqLzNp4lSi4Ary0LSa7TayKYdw+nFchc14GRorI=;
 b=O6g/tF1hOdOr2tgZ1EpZRZOMgiMSg8rioNlgKDo1Q1hhk08alfaZ33ko0kH718+3Ajx8c9M4a6Of732tdAxQBX6HezM9mhDY1mgUcMD/O5SeL130YIRAMwtFS+ekW0o3An41eg8nYxgiAzurb+wIygl6T1GYJzHB/ppMHIhjqLSrgN6lvDgGM8+XzWhpHK6YUZkz21jbGeZoi1w8asS/SHtr+8T1jGmgN/YUh8eVp7Wuz90JsET97kbFNKPTZ/8/UDn9GTYGud035qm52CdZ26IME31qlXmz5d9/kxREGTG2K1iPq1hGQCBphwyA32qQNF3RLSKmE9YWMKDDPSvgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 10:57:59 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:57:59 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 2/8] tools/gputop/xe_gputop: fix CLAMP() usage
Date: Fri, 25 Sep 2026 12:57:42 +0200
Message-ID: <e1fca483c0201eaaa8172e9dafb092307e550dfe.1790331690.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 74db3bf2-e180-4442-e7fb-08df1af3dc98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: KGzvHq9BnjqFWJ32SzSuxkscJP3jsXshS7nlgcDiC6qGiLmWKO4ZNzWd9sa3JoGl3sauk6pXZH5Mb956hEGEiRcSdAQryInpeH5xCQ/nmpO5HWuR5Hlqgom9nmS//GQG/5veKGPASJWv/saw+XmV3EkPAgsXl6irS5FJtuoBBMzZ7Af6iYkmkxzah4/gHVglDfchSmALeV9BJsd+p7+cgTu7UbFUz1/hOrdwA2KfSSZVc9uccmze0d3QeP89Kp5uUERpwamwNF3CtKglx7QD3MppDNB+hrosBVFunCrzkI+pd5FMXLtR+tMoy5lqkq1biHyi7wE/WYz4+npb70XncnbUB2cjxXBDhVC7QxQtGb7dge2IiuZiZdagzrxBA+CMWdP0IPXxIXOPtFx59MgxyBZCUVOZywEOsPfmyRqoGIO2H0t1Zaq/9Wvsyf5HCcBfEUDiSNE/qhQG80sfU+6XxDsI0fBrWxZpX64otyHHjeXbif12zrcyum96VlQeliyIJSiANafOLXVhVP4NS3PZRPMgxn127jfo5AChwwLDJHm3AB/n0Pzvd5IEjNd2nJYyiF7PYpjyrS7k3M0Nd1nyky7yActvKst5rtTpY3QNNam6+hRcL4hbYDZ+4/cG0PwC2A+/Jv6UhCTjXOtn60yaGcICg2d90RrbCxmd37NbasY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S52VyQd2Ron4mtDBHNX/AmoSMWBH5ojfzLjiuh0texC3iT4ybkIHl5PA4dD+?=
 =?us-ascii?Q?3lEjj2bcPl0sor6rffw3S8J2xWTb1vBthUWjRcBfWEFnVBE08qI5zkL4SL0N?=
 =?us-ascii?Q?io0Tf8vaT60eMzFm45jCWYbL/eWU8tjDuIWlJC/XJAkiveHGt5+hgbf/tBBT?=
 =?us-ascii?Q?5vkJEO64djYQoC1Z9U3bVqIP2p9zkzLV2ntsq6zfrCZoF9S7pNxY2yfD/ko1?=
 =?us-ascii?Q?NM9y0B+BOhGLLTm49LKNTgT3wWX4Thl9D0HGqCZ7xX2Ymm96Bo2JzOr3RLOM?=
 =?us-ascii?Q?ZnWweY0ULfA+5ycK4suV7Q1/cLEIHdQxORwbAVWlc3AtOta4v17N0wYDfkH5?=
 =?us-ascii?Q?oNR9Vr35O6kvCkFgUPi1+t0aVRLhM9wckPgAAn+RD4r2EoXtmJGxJf3tmypW?=
 =?us-ascii?Q?o52Cwb5QztzL2Br8L6f1M5GkPi8UwrMpGZto2p9ij3nyYRrxZ0d2To6LJAQZ?=
 =?us-ascii?Q?I0LQEjpu7XisDvYREqkx2pyRaIR16wMBTTMbtJV+bQ4ASzvsH81iGSmb6qer?=
 =?us-ascii?Q?cgRhbbmhHuWi1wMpKqY5KQNSji9+Mqwqk4oM0BbquDnDIoZCUcbILm6G2DkM?=
 =?us-ascii?Q?eVF0/cP1gcCB32k/d5CvJjgpgMYE5K0xHUw4vxvWgoDw7kxcomjUkYkjj/ye?=
 =?us-ascii?Q?rc4XpOt+8NiI8g2CVHcDf9gF8A72lKdDi2ORI2NZXBU/7pmwGtuvehOHzNP0?=
 =?us-ascii?Q?fGAPexGNeJoR3uBoHHd0V+1HEtHLsujtkjfeSup3Cxu4ZqdWb9QndXY0LQC6?=
 =?us-ascii?Q?6djGnjkchQWTQUls/qfczt+7lqbs2ZM4hNVZgSja5NaXZFeqpbpCR/Cs7aSO?=
 =?us-ascii?Q?6ijujuM3jeZN6T62U7+XNsX1Xy8m9h/09CKUqWyRxXmpQh8xIPIhMNLY+/bT?=
 =?us-ascii?Q?/jyv1K/UOXbQJJLsUszAnmA5Eevdvp4k/L7rE5QQtqShovvVRBH21Cnj9lcG?=
 =?us-ascii?Q?O39XcRCor83XNX2tV8ykwpOpOjjXku935MCtS4X9qXK7jxHWaR9s719sN7nV?=
 =?us-ascii?Q?MHEU6oGtCTmBTuTgocheoP+GnURuBpBgZesjPaGjwm4X/SbDPWwA+YSrQ8zC?=
 =?us-ascii?Q?MStNVF/qpBM/Wob8v3cweFScZ3Q7mq9dolxiLRrgeS4P1AL0uQ7PXVHHNeJI?=
 =?us-ascii?Q?ure5KOHCR+D1IM7LLazkbrvdOzA2XcK9dLHtP8rpxxOZIJb+VL+7oQ2q6nzl?=
 =?us-ascii?Q?70Tyg8T8QpoXzUFulPIrhwCPWrTEc6EPrxtTIXbRIxmjiD45wYlDRN6iHG8A?=
 =?us-ascii?Q?Nyrr5NwXzgCYUUcXsJ7TMXYg5dIQOnuMn5vOCtNc3vLau4JxSmR4LcbaE+dP?=
 =?us-ascii?Q?wScyUyK1TmSngFN0V6NKrq69hXJ/lTPrE4HsLROlT0L1/3pzHmIwGE9qTyfr?=
 =?us-ascii?Q?lELm2X8Auq0e+C9hYPHLCHqjBq8WS0VnGLKSW3NN9puCBwzzVPfD6vr/wiUl?=
 =?us-ascii?Q?EiO+F89VIW8BsAfr4n4kAyqy6RhmEl3bXxtdZUW7nQR23LFhQcoeFvw3SIEu?=
 =?us-ascii?Q?Xf2hNbJ12jzvLChT5steI2QYQiD+AjzwJN7/sCTT1Zd2a7p0t4BJskfwO806?=
 =?us-ascii?Q?TpVCc7YmGejtuwFep9bXDPayslLE9aCAU6O9cHYugCFszIyNY7qSKyjYGBg+?=
 =?us-ascii?Q?8NhLvF4eUvFURrXkGRBA/xwMnrW2DQN/9gVAlK4rUelGHLiIgP+MO/Fb8W/U?=
 =?us-ascii?Q?noEYmbEWnjMn0asBvGtpbwd5go7fQ1rRLTWBxFJvJGdMxjePv1GHh5m3b2Mc?=
 =?us-ascii?Q?AByCCXWsvnZc5m9zEF8qf+xjbU/DDDY=3D?=
X-Exchange-RoutingPolicyChecked: eIRGw/7Ubpq9NMPB5ohhJ3bxKyGfl5xgMLnZn5POtR7oi0fBVqeaOdWCbnjNnnMhAxGW7vTEJv2FW2A602aIuwX2Qgbx1XEVCJ/O53mldZ3GHezpFJG152OzBKvHe3ppdyVk/Sl2VrdFstBt0BOZ+FIOHWTkpJip/bbIBe7zuZE+W7rXUsfOGCkSG4hdCDKdw6pDm7OYUGo6Ex4NbIH+KHa9ZzSu+lTf9Fa5sAddNFH7lzkHAlXP4NcBUKjZ35N/WxhukHiMG6W0u6ZQ9G7DgrxsEXSDuMaLc0N2MdCe5jxQ1cagRPmKg1J+KHKosFLdndAJIMmB0V/mp3Y4Cy+jhg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74db3bf2-e180-4442-e7fb-08df1af3dc98
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:57:59.2994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqGXOjrjXIoPOvgqS84IZykK4X+PpPTlMqQZTl+buzSenjP0d2dc7Fgw+U6X/13lv0Hrs6egnpx5RkL0xeXDkAbUfDy+SqW3UGXBcX+e/Lo=
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

clamp() is defined in igt_aux.h which is not in the include chain of
xe_gputop.c. Use the glib CLAMP() macro which is already available via
utils.h -> glib.h.

Fixes: 6a181fab8 ("tools/gputop/xe_gputop: Keep engine activity percentage between 0 and 100")
Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/gputop/xe_gputop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index 119545c75..f643fe33e 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -301,7 +301,7 @@ static double pmu_active_percentage(struct xe_engine *engine)
 
 	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
 
-	return clamp(percentage, 0., 100.);
+	return CLAMP(percentage, 0., 100.);
 }
 
 static int
-- 
2.55.0

