Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FB2C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 14:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1969810E32D;
	Mon, 21 Sep 2026 14:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsMQoO+T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C01710E7F5
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 14:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790001462; x=1821537462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gN/VvK2Q4rdAt5rSZR2RY0RXh85a85U5gLcPjOmH2nU=;
 b=HsMQoO+Tgq3lPppwgkUWUP0laSxRfPIn2I+dTK53Pn57vivKnDqMP2Jy
 1eAOKKE7E00aMkSRkDECZFefpaA3yyqdlhAQw9h1idmJfNrsh7a/X8s2z
 y6Lkd8a3AwrPZJu55PF6P0fHVTRumjvfrqm8Cf08kHSaCHOzzAUPh9vOB
 qjjiqQMg8uo2sLAEgvkAbZvyCgQvQlwesQfzLXHET7eqrXk/PKrl3UM7b
 y1zeS107HUTED+s5dMI6n0hlZFS8Kz7U3/PSXtOPsdA+d38aIrZsRVjOZ
 uYqwCsDfNQl54Ved8XNDYse2bnWEdGcZfXzuOOeitteKPCzTUO0q6CluJ g==;
X-CSE-ConnectionGUID: zv6FRu1rQmSuKKYwDNp/jg==
X-CSE-MsgGUID: ZLHkwv1JTzqeeR8J+C6Piw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89652076"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="89652076"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:37:42 -0700
X-CSE-ConnectionGUID: 6B7RMcRjQsONSpf4zbjxag==
X-CSE-MsgGUID: 8Og2tGh3QMaSJGe4WntKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="271858193"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:37:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:37:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 07:37:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:37:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ut+YDMoguiZdIeD5V5SveYqD4vsMO53ip780I3ebGMSLjAC3vFNjMqainBvUUx1J7QXAyAQfgX/hCG9kg/NrN1WHXm9d8GQYrOG5y0nLnO1alWpFFLe9ucLc/Gysn3/RkV6H9wX+vAK0CQP/Pd57Q20ETYyfA9+4GXUjIMfMCRg4VJhinYCIVBlrcW9nXvi1xWZ4Of0tfTSzTO2Ss/CFSJlTXCNVDtitMZCZKNJsHOeiVSEV+qNtDewF2tvx/JkjEsq8G1sHqmDFXydsgIFA31L9wuqf710/mE4mhN/na+VnQ8nYLzfmN4hzWG3gfxY5YaRl+IRZeYIKG0PwNdxVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GS6J2Q4e7TOVAMKyD91c8Jmx9Fq9DXwsAI9RZDAflNs=;
 b=xXtGrvO3gE4azmVLHCI+p078KEvIWrzrCss2Tg0XYOBz8ycRa4mYvd/m0ImQ9i2QYO/AC9pO4osCkK32/UDte6K/k1FU9/w6zQ6HBHkPFEFSNM/DBvGxFuYVsOQSn6z1SdQ2TPc5t6Y2Sh3F2lomzBW4UntPKWdS+fls+W40i0+3nuGXDpIhDhT+s4gjboAwlTZpuib4deH3JM9v1xh7lxrx1XUnIqpen+BtaU6uGiHuyPjgWEDvP6i3M7cmJCJn1ItsbJGu6sAIVu24YJoARUQkAn/vbiUmwN/jw6AzWJD+Z5PTsQ6ZmI5tJvdtEs44qZMKj8mieqN0GPNdnu71cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:37:39 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 14:37:39 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 4/4] intel-ci: Block igt@sriov_pci_config.*
Date: Mon, 21 Sep 2026 16:37:07 +0200
Message-ID: <20260921143707.2117970-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921143707.2117970-1-piotr.piorkowski@intel.com>
References: <20260921143707.2117970-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0020.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36c::19) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: 136e68cb-2db1-4ca9-dfd0-08df17ede319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: fixhI+zTP9ENWtmj2Kf/DDTqZ/N5F17zuCQxudr+GqFCy6G4SDUUbFxMB+XOoDA6js235wgwJN8doXL4SgiGphQn94jmp2uwhKimPuv2n+/53b+TfGb4uNQtRHCKyU80pTFgJh2UzpLrOrKW/fCEBdhFws0FNf7Qd71TFfBP7xHvv9cN6hKPF656iF45wB2Temeipmpe/wu2eLP4BIz9sBypgMYcU4PQTZ9Q25+FxPHDbSvsF8AD4EmM0LP21xOsbs5hg1DCPJelMD12tYIcOL55eteohfWoxNnmVdn77aqBAN6YntwaMZKbHgrUbZpX9WjeyxL727mGnLBhH0eg/pPvhmiLXMK15kGx+ysua32m4EPDdcacwNnKD4EwDJHYCGO4TLzq1G5Ln2mbMfI3FsRU618QAbF/CeIsLPFfqGtYbqTRPNthw0GXzcflWfLnLfyuv4ZR8+eDQfKr5Zjmh5QtwUU6H/e9igGDYreme0XO7A76SA3Up7QY5eStiGOs2ABukJKeIUUYFSDwdJCSmiEdY6P270y49s0YbWtHSzGzCE7X+2T8rFmD8GQ+7Ta1G3/jhrEW9t/4ry7kz7rPcY2NFZipn9kjGz7tgLnbjeMvI0lS4vo4qCmDMegx1GuU2Ugpl0oTuUrhUxaWHbV1HdqnXkYlfuOrQAYcgUBx2aM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S01QWVMvcEJGQmpYbTh2ak1TZ251VklISi9uSXpibEErZU5CSGgvTUtyaXly?=
 =?utf-8?B?aFlzRjlIdU5UcFM3czFyVmw3NXdCaWh5Ykc3R01LQUZmQ29pcmpreDVMRUhF?=
 =?utf-8?B?MFpuYURPM1kzYUNsTGVwek12d2xEZ042MEJxMkNnaUkxV2c1WDg2azRFZWVH?=
 =?utf-8?B?eEJuVjRBYlBTNVZTMUFGeVFHbzc1TUhtV1NMc1NyMHY4bS96ZmFIMitiVGdP?=
 =?utf-8?B?c2pBQk82TUljNlcrQWhjN0I3ZUpzUkIxUGNBTXlPRUNtb0NaVThIQXdNY0hW?=
 =?utf-8?B?dFN3aUg3K3pGSzRrRHdzMUtUMFBuN292ekdhQTB0WDRoYmgrWU1tTm42U2xF?=
 =?utf-8?B?V3JxN1FSTjU3VHBNem1heE5yTHVTV1pQSTJoRExUUVZrWEVwVWh6YnRIUGwx?=
 =?utf-8?B?YmI2QjRjSjMwS0dlaEFTaDNOZ3UvN1Q4Mm1aZUhyOGQrcmhPYmgxdmhicElV?=
 =?utf-8?B?VzZzazFJeUplWmU4TWJ3VmdJdUI0RWVSa0wvRW9nSFMreTZCTkJ1LzVkZ2gr?=
 =?utf-8?B?Y3gvUDZGdDhkTy8zZThvUkFNVUo0ZGI0YWpwdTVvZHNkZ0lxeHUzZGFHaW56?=
 =?utf-8?B?M3BlRWdJbDJrV2x5L0ZKRk9nSW1DaW5VdjhNc3hHRm90OWtTY29pWVY3cUEx?=
 =?utf-8?B?MXd0N1llWGxnUFNUYVlrMEJTOEVQMGxjTHJxMmNyYUFXMVZBUEhhWFhZM2g0?=
 =?utf-8?B?L21VdnErQ25qMGxRNG83a2VFdGtQS2xuL2orMjhPTzA0ZHBFbm9RdElSeHV6?=
 =?utf-8?B?R0VmNEMxTGRxeE55MFpoYW9MU21LeVc4ak5JVko2aDJmSHk1ODduYWxZdzVn?=
 =?utf-8?B?Z3lyd2lBUkdEdytYWW5hU01ZcENnRnpXcThpcGxKMng1U0xHaitGYXp4MlBE?=
 =?utf-8?B?R2VEUFErSHRaNEk3NSsrSTgzeDlUc2lHL2w4UHNJQlFoaklGZkpzM091bWxK?=
 =?utf-8?B?OFlPc0xtWEFQZ28yZWNMUjJlU3JBampjZFJVU0ZsUWN6VW94dkVhUnZ2cCtp?=
 =?utf-8?B?RU5qLzY1MWcwMUk4Y2tZNnF4bzhvWjY0Rk03YU1kQzNWcTduS3VOUnNvUXY5?=
 =?utf-8?B?SkFtSnRYaGVCM0wwZGRwcnoxQndrN2RHL3RtUDAxVFY5QzAxUXhJQU1ZUCt0?=
 =?utf-8?B?UzIzVC8wdlcxcUFDRkNlcEZ4YUdkdVJQU2U4R3JHcUwvemdDM3E2b2pZN2ZS?=
 =?utf-8?B?MWJtenUvakR1OGpHWFBoSFAza3FZSDZ0eFgxWUtkL0JlUWxZZVo5L3RQaUUr?=
 =?utf-8?B?QkhiOXRYMW0vMXJ1NEJ2WUVWUzNWbGFEVlJFNnZGZzN5VTNYVzU4WTFDbkdZ?=
 =?utf-8?B?dWdFa1hxTUowSXUrYkd5USs2bFVGZmFQSE9UNGczazloTC80R2VwaER5eG56?=
 =?utf-8?B?SVo2Y2JjcERaQ3RZaDZ2YW1TSkdVeGdCTmRRYlJhYlZwVnBnY0dqSC9LdERu?=
 =?utf-8?B?Y3UxS2UrOE5GaFlUVUYzYXZGUzVCdUtmcnQvWDlDNm9uZ3RvQVFocDkzVm9j?=
 =?utf-8?B?MDZPbUlxQXg2WCtuNTBHb2NrSEd2RjhqQUZneTk0RlNlRm5zQno2SmlZOTVI?=
 =?utf-8?B?RVVrMzdWMmRySFY5UjVMMFV0ZW9uUE10eC9hL3Z5czV3Y2dFcTkxNjVKbGR2?=
 =?utf-8?B?S1k2Unk4RXRidlhuazhuVmFrTTZSZUxLekpXRHc5a3dCZ0lxL3g1c2wwdmcr?=
 =?utf-8?B?WEwrYzRoV2ZnOXJLUFFTNE1LQjNkN0hoQXRHOXZNbjgwNkoyT0M2dmZoMGNH?=
 =?utf-8?B?MnNRRDJrM1UyTmNqa3Zodk43blBlSldpLzRKTDZOVldZb0RTT1NUZXFqd0pP?=
 =?utf-8?B?S3EwOXBzUm1XTDZ5d3NUMUlTcU4xRVN2MlY1YlFkVE1SVTZvRUFNbDV0VERh?=
 =?utf-8?B?aGJQVUtsZXVJMUlabnRqTnIwV0JzUjJLTEJxbSt0V1NSM0hZY2Z1VXZlc3dp?=
 =?utf-8?B?NlhyWFRRT2dPUkZkaW9xbTFpSkJnbkljR1BLZTEzMjk0Njd0c3IySHpGbGhS?=
 =?utf-8?B?T1h4bVEwTEtubnJ4aXcwamNXeGtBZ3hXeVpVOFV4Vm5RTmZOdkI2eXF1S0hB?=
 =?utf-8?B?VzdoV2JHbVNwUU1LRmFjWHBmY0ZnYVJjVW82R21uNFRSbm85YXpaTUJUd1Vv?=
 =?utf-8?B?cURBanExcFhZZEhZV3Mvai81WnVFaVdMbHpqRlpBQmVHd2hlL2JGRWxGU1NH?=
 =?utf-8?B?RnZQLy96d0RZMUt6QkFPaUpGR2dscFRHSzllU0RETWt5M1lvQzk2ckxPRXZx?=
 =?utf-8?B?eUhoVThtWE9XaHQyWlczMzZrSGsvb0t4WHBmNmhhZ1NtVkpDQitRVXFCZTBy?=
 =?utf-8?B?d25iSmNIYkttb21xQ0hmblJEbzR4NXo0cEE4UDJ4c2tWdExDWW9SY0Z6MGgv?=
 =?utf-8?Q?dckig5h6+I8XoG3c=3D?=
X-Exchange-RoutingPolicyChecked: vRA1zymgoX5yZwNRf1E12QPPtAi0/ptXn2kg2K72qPrFrTUSmz7G3+H7zJ83Xi/2YssLwVF6OnTXO+ggJM9elc8YckQljMr4kuYyJop3BjfvfctU7a7kldAZVdX54H6yQMSWaQH+nB2KOFlnhcrAh8o96VDiOyN/C/aklLyGDTqA+pgD/qQzQxJhuGhZITI3RvW8/meudJRZhQW1h+hW4dZQuir3Le2oxxdgdhmIrinokFJNTlAd96IzJxBkoormHb5zrqDRG7GLfEA4QzCcw8tVtVuD3jlj+DP2oMwKSdXNPQr9pwsi6hZzzXmkjapG0oBTfLQCs3QaPqYOof+Osw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 136e68cb-2db1-4ca9-dfd0-08df17ede319
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:37:39.6090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RHxdcDhIBWW8HFwNDe0faCiVui6brALmrHb7EsyoW7xjrvZ7DaLZDQSICxAJ0BCIm7hClU7mseaA0Mre7mVzdnsCkqaN0hgGTuBXW44w/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This test is intended for HW verification and does not need to run in
recurring CI runs.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GPT-5.6 Luna
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 0f68df95d5..0a7e63c5ec 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -116,6 +116,7 @@ igt@sriov_basic@bind-unbind-vf$
 ##################################################################
 # SR-IOV tests for HW checkout, not suited for recurring CI runs
 ##################################################################
+igt@sriov_pci_config.*
 igt@xe_sriov_ggtt.*
 ##################################################################
 # Chamelium V1 HDMI receiver supports a maximum resolution
-- 
2.34.1

