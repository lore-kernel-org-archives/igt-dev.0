Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EAACA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 11:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A597A10E915;
	Tue, 29 Sep 2026 11:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0ToiA9x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEBE10E6CD
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790682300; x=1822218300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bJ+Mvq/pU5WTSkzcC6Pd81aLD8K+OrILAE/Tgk09H0w=;
 b=O0ToiA9xGWwiK9IgNigUZ/NvBm0eIFg5lSWK1qdzoYGpMO3JLsr7Yht0
 YQMrMhNcb6Tk8F5q0AIHt1duMPl7VFEyzepuchCoMMVGkMYPzNqj70PNF
 b8VRU9hyxQTXGyE800SWnoNHvupf7AsBMFuqKVQNiAnRJzpNmDzNgwLM3
 zAlbIDdKvF0ApYRv8GH09VMb/mW2UDppGMKT2GCWr3OJyp+/oWyfdT/ml
 04HTTPaRSaGInEMxBi++2xqrobPZTvqZfSobPfnupEdjRJldn79qMpzzE
 b9K+RUueABnVk5gCdqCm8xyneD+wVhsZBVZI5jP7plcR9okQqQ15JaMgm Q==;
X-CSE-ConnectionGUID: OPi+7oDrTKe+Z979vP6uPg==
X-CSE-MsgGUID: xbOqeOkhTcy98A+Ofzx4dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90350232"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90350232"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:44:59 -0700
X-CSE-ConnectionGUID: MLSrnwV1SEamrhh7T/QLlQ==
X-CSE-MsgGUID: COAM44hhTJS9Q+3hw79hDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275499955"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:44:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:44:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 04:44:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:44:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgyQ/dhuvI7GzhKFlk4yNsqrOjkvHcCj9mZGtkQ8+40S49tuIAMZtfaVr4jal+WKc8MVtctuRmvjDKKsKmf0ZHkXE1Y5yzB4aywbwEQf/MfjylaCkyIMY0ejE9nTHlcOvDNTXciUZDqqVrsc02wDBBK67AkqW1p1KNE3QeUL4QGpTmi0aSBXDWYqsp+Len46+1mwKr/8paCdUHJ6jbVVl4sWJq/1Rb5JAYPiJ+O9RL1Z5SDutBBRDMyTodLygDWuIegkVXtGCEPyNSAcK83pDDl6LWo5XKVQlXlEXd1WMsWiS8kfaOAc/dgxNwxw52Umbz0RpbW2R9e2HGFWJU07kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hm8KnXh28gA32Ztm+aq7omZKUTrmOEPU4u/Pb+tO4Js=;
 b=xeND7yo6ooZm9iwceOkBz+K51aZ/xCHldaa7UGzN/o8c/8ZlzKN7gwkacZJmZNTFkF2FUbC6kl1uRcC7Hl3m9svBvsqJ2TJiWIAsGe33pPzRZ7NzflUe+cSj9H9Rm60Ut+8vPJDHjLQh5htmmSpCQkEZKiGRtGqA83mxWKLjlHBmWvetnZNk/9mtBd5btfP6uRMsNfqj8Yl2MkfoiSd4oNhfkcnqYShJ62GjqA5bCQ6GHlOiKZlM9WHPzPBqQvzsWCPcpCfPzhes3jSZ35fdWDqTSG/+YuL076jWEzEWgM2owoP7lfJQVHWFJS7iboC1Aie81GrOHGpIKd5BikaM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 11:44:56 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 11:44:56 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 2/4] tests/sriov_pci_config: Add VF core config checks
Date: Tue, 29 Sep 2026 13:44:33 +0200
Message-ID: <20260929114435.2961154-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929114435.2961154-1-piotr.piorkowski@intel.com>
References: <20260929114435.2961154-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA3PEPF00000511.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::665) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CO1PR11MB4785:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c1c367-634e-446f-f49b-08df1e1f1586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|260925022911599003|260925021911599003|260925021311599003|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JAquozpikH+lSgugduK5LtOWtjBKLPOgxEn1rtHv+DD3kahOQmDMyuEWD2SyuGkwi1FYZpNFny63MeyP9B6euc5I1+h9cbEB48cqxG75SDQBkmZQW5pQWpmulPffpIQGctVc9inr2x1b9/csNpoMxXKyIRKnegRM/dwphaLJ4OEdlWPDlvTzXHLSlKrO/JzSSiAgz7+l98w7p40tUCFFnFL1UAtVVrGCsBsS3hmHEkiORWwR+EcySNPo29i6Q7sgZSshFtttlV/NcTMKddAxRFExzDs/4K6F/aS8+rwy1NyNdsh807Qr065LKFFYCKHtsM5BI1s6KL3S+YKH+6kiH7nwJ/z+/mQEdNQhL1oxw/Jt8zZ+X9WtFP+mNVAHkOYRWMZ33RRMR+paso/Y8vSC2un/A7L/6p1nJkOAkaMPldOsGkG6sjfgwkhEAnGKFUmsNzlLtdGqGV+GjE60P7a3XcOCjskrQJQc9aO6gNK+nWjWNFZkDprYe+XdL1kmGnzSrYQ6HcaXn3qNLrflZbFlvM44Uiw/U7Pc93X4CpmyI3eIK/zHVYDpFOtZjZRJlEXbhTo72JAZZLAeamZeI32VzvB3786VIS7u/TztOw8emhYQXuj7LRO4jDRVUjQZEb7gP3Fswrttvz4FTD/tbbvLQfjUPAYtz+RSbnP2kCrTZ0A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE1QUUpBbC9OSnNvRExwWnpkTzJFVUdUVlp5NGExL3ZEUVgvQjROK0dUUWdx?=
 =?utf-8?B?b3NyVjJYT3Vsd1JmTUZHZXpVaHpCZTZUQjBWb3A0eS9DZUF5OURYNnY0Vmt3?=
 =?utf-8?B?djhOSTNvdnEwbUgyUzVvZUp5NHByYjU3OHNwN1RMS1Z6S0gvSTNTcG5hSENJ?=
 =?utf-8?B?c2JyZ3NEcEh1eVlvTml4aS8xSi9oRW9raGdNUi9ueEx1bkFwaUhhV3ZXVWFC?=
 =?utf-8?B?RG1MZU4rOHJsUkZiazA5SVFQL20vaGFDbUVlekpqcTZsdVpzR2hJL0xob094?=
 =?utf-8?B?OGQzVDNMRm8yUTFhWDZuczJPZDNpRll3RTU1LzRVQUNqQUd5ekJwWmpFQ2pa?=
 =?utf-8?B?OWRKb0VyRFRhVVlmZVZueHlEUEtSYVFhN0tHaHQyTnZkV1RDYmpBOFJZV0gr?=
 =?utf-8?B?QWJnTkRiNGVWZy9pUUpjbUl6a0F5bEJhOHFsU0FLdkxqUndoTzltMUF1d0ZC?=
 =?utf-8?B?T2d3OEdJOGc0M3NTeExRaXB4bldBSlRXR3dXOUNUMVFrUWZ4YTdvcS9nMldS?=
 =?utf-8?B?ZndCMm9DR1dsKy9UTTZqY2I0ZDJqOC9ZVkQzSXRNVlp6eW9YSjFCTUxnckc5?=
 =?utf-8?B?bzIwWDNuaklnZUYzNHk1dzdFY1g3WWtBZkwrZHE1NTM5VVZLakUwYk1pM3ha?=
 =?utf-8?B?VENuWjZ0NUZ4NUl6b0RJOGlzZ0IrVEVjN2N1Q1JOczF2RnBJNkRhMlFGYkFu?=
 =?utf-8?B?dlAvcG1mNVdyUU11TkxCcm9qY3VXaml0YlVkcDdicEVidTBMMXA1azZ5R003?=
 =?utf-8?B?bXFPV1J2V0tSbTRaNEdRU3N1RUVVMlhjd0tGRzdIMkVIdnErS3pkZ2pqWG5l?=
 =?utf-8?B?cDRLQW9PbGJ4WkpQUU42dEpJMWxkWE1SYVl2NHg5bWFCejh5OThKdlRGNW9E?=
 =?utf-8?B?TDFJR3FhZVRSOWNVeUkyRElqb1QvYy95QTloQngyZFU3c1loZ3FLMzF3MTBx?=
 =?utf-8?B?VHlRbC9ZNm8ra3RvWHBTNS95aWpUWmVjaXlud1JHMnl0ZmpxTjJDdGdEM0hz?=
 =?utf-8?B?eHAvb0M1bFAyeFl3c3dVWS9xb2I4d3o1bUh2Z2M2M0ZwR2NJcThlaDBYdXl3?=
 =?utf-8?B?NXpxdEhnM2gwd1hqRE5QRHRXTytTd2dYcUJjTXQ4UFpBZld4RnFPamtmV1pE?=
 =?utf-8?B?ZVNPTXM4TnBhaXhYblpmMnNwU1hUSFA5QXNMWDVTalRaQmsvQ1NVUVc4Q0pR?=
 =?utf-8?B?b1lRZGtwQjUrdXJibEhTb3NKQUtzZFF0czBYNFNnN2lENGI0VnJMQlNsRHo3?=
 =?utf-8?B?UzZwV0JCUlRjVlNpdGNuNmFxNGZnZUQ3cjExVHk5eTFMS1FENDllc2dpWnZ1?=
 =?utf-8?B?MGV6YytMMGpGaERESWZjNmtwZTJpNnhqUERydml2VEM3QzRZUk13MW5iTVc0?=
 =?utf-8?B?YVlnaEQ3U1VsRXovMGhIMG02dmlGZTA2NDVQQUEvd2tUVERTay9LUU4rNXVN?=
 =?utf-8?B?bVEyb2ovVitUMjhNR3J6OXprVllLbEVmcWp1Zzlvdm0vQU9PRjA0WHQ3NS8y?=
 =?utf-8?B?QWRvZWZjUnVJS3BpeDNWQzRwN2VwSFVIQlpJUE82THZZSlpSajFqc2tWbGcv?=
 =?utf-8?B?NU5rTHBGWGl3ZzBGdXhyblJQWmZ3RU9Ja1E3T1RSM1FieU5NQUo4NTN5NnFt?=
 =?utf-8?B?c2tmWWRrbGR6bHpuMFhTUC9ic2xlajV2ZVlyVnBVQ2hEamJPeXNrbUNZSzM3?=
 =?utf-8?B?bE1KbGtpV0tNYU0ra2loUE5QMUd1UGVwUmpvNERSS0tWRGhtUk13MlVEd3NO?=
 =?utf-8?B?OXhRSXlLalUxSXQ2Y1Y0ejIyemNPamNmMFB0enNYMWR2S1Mvc0NkQXZOTWYz?=
 =?utf-8?B?cjk3MUMwaDh5ZzFmRDlzVytTcVJ2b3hsYy9PY2dvQnI0TmFVc2RUK2JJbXho?=
 =?utf-8?B?aWd0b0Y0WFJhQk90VGJmcm45Z2RQcUo0c1A4T3hOdXZhM21BdFVxZ2ZuMEZl?=
 =?utf-8?B?b2VNT2tybUZtMC9QRUVxRUtSc1ZMeU95UkZkM2ZNcFZMRkNObytoeTBHT1RM?=
 =?utf-8?B?Nmxqbm53QjhUMDhpUTdDRTNSbXJuaVlZYW50cTNncGgwd1FsLzdwR0YrQlJh?=
 =?utf-8?B?SlFablQ1TTJ3MGNLWHRIOC9Cc2N4Uzc2aUxyc3A0bVlKWXhGSVlhbFVtcnRC?=
 =?utf-8?B?b2RmNzFKODhkbVd3ZTc1bXVLWnEvR2NyeENhNG03U3lOdS9sQkQrWURUQi84?=
 =?utf-8?B?clR1QW5Lb3VzSTRWa0FVQUZ1RDJ1bmFQOG1TYU1oUDVwV0IveDUyaGU4OU40?=
 =?utf-8?B?VjVJb243SlhVN2ltaXRKMmVLaVllTXRMaW5UalAvMnBKT0hZRVVJcndkaEYw?=
 =?utf-8?B?czliM0h4RE9lUlBvdWJUamVXdldQdjZia0xDZjI0Rk1DazBwWVdDNVdXdFRK?=
 =?utf-8?Q?8JWzFWfMfGwnd5l4=3D?=
X-Exchange-RoutingPolicyChecked: TAxrEYEc2R3pcsiUnPjElp6jeUSE7J8U6V/X80+Yi2DkqyGGxTq4lY1L2XQ7727179TCsyJXFjdgPIN6iL2yLReHszHgBBZZUN4pI3HsD28Q5geQpCvCt9yIpFd0xJCOGWgr1Dgsp4aBo2ruCLgIKMyF0x4v4P7GanD1B5zZazv6+MPrafcQ9yrcjOZmwue6l1zfdK41sxgNGV0CaR5hbX61QIsE/WzPBI7Ogk7+aEsYe3fakPngZksef+LPA69RnK5Do7MelH6z3hXmLmcasTHu5YE2Nv0wX2JA3yBa5l7GxGFDWQctCU8yrPntL12Whln9E78InN/IcODs4+QQJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c1c367-634e-446f-f49b-08df1e1f1586
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:44:56.4990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7XAxOJY4CoF0VVv+MDx+alT5cRTbQH+kWEsdra0+DoAHR8gSIimN/YrtamDeScOsf7+XXaMQP6o5C+OhfImuIc2UfgFi5kL7MzxdwMkgNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4785
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

Add checks for PCI configuration fields required by SR-IOV VFs.
Cover the common header, BARs, and PCI Express capability fields.

v2:
- Enable the VF and read its configuration once in the fixture.
- Restore driver autoprobe state and disable the VF during cleanup.
- Clarify test documentation and shorten runtime descriptions.
- Remove redundant informational messages.

v3:
- Move test state from globals to igt_main().
- Add missing blank lines in the test.
- Reject a 64-bit memory BAR type in BAR5.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GitHub Copilot:GPT-5.6 Luna
---
 tests/meson.build        |   1 +
 tests/sriov_pci_config.c | 214 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 215 insertions(+)
 create mode 100644 tests/sriov_pci_config.c

diff --git a/tests/meson.build b/tests/meson.build
index 4f5c9be7b4..0e1a3faf32 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -74,6 +74,7 @@ test_progs = [
 	'meta_test',
 	'prime_vgem',
 	'sriov_basic',
+	'sriov_pci_config',
 	'syncobj_basic',
 	'syncobj_eventfd',
 	'syncobj_wait',
diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
new file mode 100644
index 0000000000..9a7145a5f2
--- /dev/null
+++ b/tests/sriov_pci_config.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#include <linux/pci_regs.h>
+
+#include "drmtest.h"
+#include "igt.h"
+#include "igt_pci.h"
+#include "igt_sriov_device.h"
+
+#define VF_PCI_EXP_DEVSTA_EPRD		(1 << 6)
+#define VF_PCI_EXP_LNKSTA2_DEEMPHASIS	(1 << 0)
+
+/**
+ * TEST: SR-IOV PCI configuration
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: PCI configuration
+ * Functionality: SR-IOV-related PCI configuration space
+ * Description: Validate PCI configuration fields required for SR-IOV,
+ * including Virtual Functions.
+ *
+ * SUBTEST: vf-common-header
+ * Description: Validate that the VF Vendor ID and Device ID read as 0xffff,
+ * and that the I/O, Memory, and INTx Disable bits in Command, the Immediate
+ * Readiness and Interrupt Status bits in Status, the Header Layout bits in
+ * Header Type, and the BIST Completion Code are all zero.
+ *
+ * SUBTEST: vf-bars
+ * Description: Validate that VF BAR address bits read as zero. The BAR type
+ * and attribute bits are static and may remain set; the upper dword of a
+ * 64-bit BAR must read as zero.
+ *
+ * SUBTEST: vf-pcie-capabilities
+ * Description: Validate that FLR is supported, and Phantom Functions Supported,
+ * Auxiliary Power Detected, Emergency Power Reduction Detected, Current Link
+ * Speed, Negotiated Link Width, and Link Autonomous Bandwidth Status are all
+ * zero.
+ *
+ * SUBTEST: vf-pcie-capabilities-2
+ * Description: Validate that the Current De-emphasis Level field in Link
+ * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
+ * and later.
+ */
+
+IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
+		     "including Virtual Functions");
+
+static void read_vf_config(int pf_fd, uint8_t *config)
+{
+	char *vf_slot;
+	int ret;
+
+	vf_slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, 1);
+	igt_assert(vf_slot);
+	ret = igt_pci_config_raw_read(vf_slot, config, PCI_CFG_SPACE_EXP_SIZE);
+	free(vf_slot);
+	igt_assert_f(!ret, "Failed to read VF config space (%d)\n", ret);
+}
+
+static void check_vf_common_header(const uint8_t *config)
+{
+	uint16_t command = igt_pci_config_raw_read_u16(config, PCI_COMMAND);
+	uint16_t status = igt_pci_config_raw_read_u16(config, PCI_STATUS);
+	uint16_t vendor_id = igt_pci_config_raw_read_u16(config, PCI_VENDOR_ID);
+	uint16_t device_id = igt_pci_config_raw_read_u16(config, PCI_DEVICE_ID);
+
+	igt_assert_f(vendor_id == 0xffff, "Vendor ID: expected 0xffff, got 0x%04x\n", vendor_id);
+	igt_assert_f(device_id == 0xffff, "Device ID: expected 0xffff, got 0x%04x\n", device_id);
+	igt_assert_f(!(command & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
+				  PCI_COMMAND_INTX_DISABLE)),
+		     "Command: expected I/O, Memory, and INTx Disable bits clear, got 0x%04x\n",
+		     command);
+	igt_assert_f(!(status & (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT)),
+		     "Status: expected Immediate Readiness and Interrupt Status bits clear, got 0x%04x\n",
+		     status);
+	igt_assert_f(!(config[PCI_HEADER_TYPE] & PCI_HEADER_TYPE_MASK),
+		     "Header Type: expected Header Layout 0, got 0x%02x\n",
+		     config[PCI_HEADER_TYPE]);
+	igt_assert_f(!(config[PCI_BIST] & PCI_BIST_CODE_MASK),
+		     "BIST: expected Completion Code 0, got 0x%02x\n", config[PCI_BIST]);
+}
+
+static void check_vf_bars(const uint8_t *config)
+{
+	for (int bar = 0; bar < 6; bar++) {
+		uint32_t value =
+			igt_pci_config_raw_read_u32(config,
+						    PCI_BASE_ADDRESS_0 + bar * sizeof(uint32_t));
+		bool is_mem64 = !(value & PCI_BASE_ADDRESS_SPACE) &&
+				(value & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
+				PCI_BASE_ADDRESS_MEM_TYPE_64;
+
+		/* Only the address bits are hardwired to zero; type/attribute bits are static. */
+		igt_assert_f(!(value & ~0xfu), "BAR%d: expected address 0x00000000, got 0x%08x\n",
+			     bar, value);
+
+		/* The upper dword of a 64-bit BAR holds pure address bits, no type bits. */
+		if (is_mem64) {
+			unsigned int upper_offset = PCI_BASE_ADDRESS_0 +
+						    (bar + 1) * sizeof(uint32_t);
+			uint32_t upper =
+				igt_pci_config_raw_read_u32(config, upper_offset);
+
+			igt_assert_f(bar < 5, "BAR%d: 64-bit memory type in the last BAR (0x%08x)\n",
+				     bar, value);
+			igt_assert_f(!upper, "BAR%d (upper): expected 0x00000000, got 0x%08x\n",
+				     bar + 1, upper);
+			bar++;
+		}
+	}
+}
+
+static int get_pcie_cap(const uint8_t *config)
+{
+	int pcie_cap = igt_pci_config_raw_find_cap_offset(config, PCI_CAP_ID_EXP);
+
+	igt_assert_f(pcie_cap > 0, "VF has no PCI Express capability (%d)\n", pcie_cap);
+
+	return pcie_cap;
+}
+
+static void check_vf_pcie_capabilities(const uint8_t *config)
+{
+	int pcie_cap = get_pcie_cap(config);
+	uint32_t pcie_devcap = igt_pci_config_raw_read_u32(config, pcie_cap + PCI_EXP_DEVCAP);
+	uint16_t pcie_devsta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_DEVSTA);
+	uint16_t pcie_lnksta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA);
+
+	igt_assert_f(pcie_devcap & PCI_EXP_DEVCAP_FLR,
+		     "Device Capabilities: FLR bit is clear (0x%08x)\n", pcie_devcap);
+	igt_assert_f(!(pcie_devcap & PCI_EXP_DEVCAP_PHANTOM),
+		     "Device Capabilities: Phantom Functions Supported must be zero (0x%08x)\n",
+		     pcie_devcap);
+	igt_assert_f(!(pcie_devsta & (PCI_EXP_DEVSTA_AUXPD |
+					  VF_PCI_EXP_DEVSTA_EPRD)),
+		     "Device Status: Aux Power Detected or Emergency Power Reduction Detected is set (0x%04x)\n",
+		     pcie_devsta);
+	igt_assert_f(!(pcie_lnksta & (PCI_EXP_LNKSTA_CLS | PCI_EXP_LNKSTA_NLW |
+					 PCI_EXP_LNKSTA_LABS)),
+		     "Link Status: Current Link Speed, Negotiated Link Width, or Link Autonomous Bandwidth Status is set (0x%04x)\n",
+		     pcie_lnksta);
+}
+
+static void check_vf_pcie_capabilities_2(const uint8_t *config)
+{
+	int pcie_cap = get_pcie_cap(config);
+	uint16_t flags = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_FLAGS);
+	uint16_t lnksta2;
+
+	if ((flags & PCI_EXP_FLAGS_VERS) < 2)
+		igt_skip("PCI Express Capability Version 2 is not present\n");
+
+	lnksta2 = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA2);
+	igt_assert_f(!(lnksta2 & VF_PCI_EXP_LNKSTA2_DEEMPHASIS),
+		     "Link Status 2: Current De-emphasis Level must be zero (0x%04x)\n",
+		     lnksta2);
+}
+
+int igt_main()
+{
+	uint8_t vf_config[PCI_CFG_SPACE_EXP_SIZE];
+	int pf_fd = -1;
+	bool autoprobe = false;
+
+	igt_fixture() {
+		pf_fd = drm_open_driver(DRIVER_ANY);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_vfs_supported(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
+
+		igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, 1);
+		igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
+		read_vf_config(pf_fd, vf_config);
+	}
+
+	igt_describe("Validate the VF PCI common header");
+	igt_subtest("vf-common-header") {
+		check_vf_common_header(vf_config);
+	}
+
+	igt_describe("Validate the VF BARs");
+	igt_subtest("vf-bars") {
+		check_vf_bars(vf_config);
+	}
+
+	igt_describe("Validate the VF PCI Express capability");
+	igt_subtest("vf-pcie-capabilities") {
+		check_vf_pcie_capabilities(vf_config);
+	}
+
+	igt_describe("Validate the VF PCI Express Capability Version 2 fields");
+	igt_subtest("vf-pcie-capabilities-2") {
+		check_vf_pcie_capabilities_2(vf_config);
+	}
+
+	igt_fixture() {
+		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
+		igt_sriov_disable_vfs(pf_fd);
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
+			       "Failed to disable VF(s)\n");
+		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+			    igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
+			       "Failed to restore sriov_drivers_autoprobe value\n");
+		igt_sriov_clear_exit_handler();
+		close(pf_fd);
+	}
+}
-- 
2.34.1

