Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1D5CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 11:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C536510E915;
	Tue, 29 Sep 2026 11:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6wc4bhB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A7010E6CD
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 11:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790682308; x=1822218308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lAIOKY7Tv7gGBuyZjfosHYCih5oVA7M4kFto6FPIy1E=;
 b=T6wc4bhBMfwFgbpxcrSI3YAhxL9/3iC/unv9qm3or67EkfY5rW/Xf7hX
 U6WC61txZZZHu9bIWZ7dsmQ5h0n96mCY04Bj4nX0opRzKWkx+JxYaQzkN
 p3N6hCe8RqX0nWnGQo4NjE2//on3z/4gMITO+LvxNCZfCWwRsGY2bsy9d
 mTWQWW+DTQbDjS/NWdqKFEnrkWQBiu0n1BLaffPLZy6U13+4/Z4p/iBc9
 l1ZimoUMvfZbXKxzNyz6fSZq5Sy5lpORYisy0HzrJIbTX5kRRNcVrL1rV
 XNaqHU6iDmRdleBvqWj3Ns7DcNFmWXZTHQVLBN/Gh0OI4MpjQmDANTvPf Q==;
X-CSE-ConnectionGUID: tjbEiMddSCuFye5nIeVqtA==
X-CSE-MsgGUID: h4G72mIlR02M9Nck5wf4SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="116929618"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="116929618"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:45:08 -0700
X-CSE-ConnectionGUID: bl/Ho155RIGXlxXVBI2BWA==
X-CSE-MsgGUID: L6AM9cJMQJ+PXAEcCoxxag==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:45:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:45:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 04:45:07 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.21)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:45:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vE2SKyxSFdkiho/WI1wLmetMxBDFO8RuiOMi3x7lU1542K5qkpOugHU4plqdOq3lz1arxUMXXhaYjFd7+dEkFRI/Sse57YRJV1KBn03hEgD/ueY9dGNddnyQ52lGhoGBbArlU/n0OmtvTa0blwxqntV+pasZ1bJ6dk95o99ctK5BtcSX02KeFB4BEH5OwqSPG1LpakMmFyRKsrqMtbS5BIIl/TjGwYkr9lVy48L5e/c3j3BnOg/VOyZd4ZEYH/poRd03hkXgUKyrjn6tEbg0nw4tKBIFMMxEwQxuB6rRP4/OfGiY8QfSnf1FjeZIEdEVnnmfcz6s5rYAM28WqPzQwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwGQxnye2vwJNMN7i0XCFcHqgG27KSaLCW/BAgLNkRw=;
 b=BTwLStuBPqPB0MCotq47aMVKgG1sxVEO6jntOC9hD+LS8zo1mpIvbTzJ/uIHsYlBiL0uXaVQqNdtWnqDKo+0XT4Ty0Tx5pvUM4zwW8oATJ4WgdtJ356Dmc86cGohBpr08xyNyREoQrE4SnGxUNHtmhENbPpSpA/6RHeq59IX/7RMquOhfjmV/88blEArI45k5qtGi+nlLY8YE/xenF0xlexwrhgCzOuYfZAepNwBQt3bkIxFVgEIp6EM5irL41K++RspJ5U7J8N4Pe5cYNRvb/pBTRD2oaZtkUgFegnM0BjR+Q4rlluqss2eBDXDyeUHI2BRJ7MnDbjK6lNO/3SZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 11:45:04 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 11:45:04 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: [PATCH v3 4/4] intel-ci: Block igt@sriov_pci_config.*
Date: Tue, 29 Sep 2026 13:44:35 +0200
Message-ID: <20260929114435.2961154-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929114435.2961154-1-piotr.piorkowski@intel.com>
References: <20260929114435.2961154-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0019.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:354::17) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CO1PR11MB4785:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5eb65b-a177-428c-0fa7-08df1e1f1a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cbdG2wxgQgw5U1lEwVWfdUyuc1TJEvjYra3sd3VUHXUZz6THaVhYSWCQ9ON7QwP6Ihc9ALFWcgnBtIfiffUcBVibAgcqK+91pHne64J13P80OCsqW/NWLleXd63lBIcKWAxQN6r25gwvZZZCdwZcOa1Udl4JGseRd90pzp14/h7t8HvWTypb3ziuiykBR6N33Ky+JwOZqgu/GKsz04WfIqrP4t09kfEhN84/wWxfxBfGpr2t/KRfUbCocTMHYtxSEhYv1ipPqf2S6ZZ8hVaLEGVzhu8ag0HaW/XFE8psH5MuxLJS09dtKkCXrOJ3r+YnFt78u+d6JRN1vdNFbODahrYvfm7bcmHj4tU44B1Iz6z1AyENjbhFdg1aTejUbyg/SDSh7c+6LgYN3vqnhYS5B5rDan7msqdxOY6q6YNfjIcO56CfsuLpoaF620eoBuo131qPXwEh8KDw9AjBAII9agoITjTmSiD7J24ZAn7zsYqGGpNDpqjJ/Rmw0jcDfkFUi7Gphg/OiQTkxfC/5Jr96OI6DaLULIAP1tqp7t4g8TQlIaiKgjyYLmfAMRr4lJ3/wmJUrCgPV67zDXNTh8MTFJsedUajxZ3tnEHBz4qMVVjM1aUbGHd7HA2SBQgOFvxyxHkGO3xk/JTKXVr99U1YWpjITPx+xw3TOAxC/M99Zss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWw3N2o1N3J3Nk11MFoyZERKTERkanZFWGRuVVBob0xydjZTRlZyTllDY1JL?=
 =?utf-8?B?R1dTaytHV2xDczZMZkFFTWRmVFRrNzFacDZsd3lhMWw5Z0w2a3djZ2dPeUZz?=
 =?utf-8?B?c2JUR1dYNzJpVEFpVjJkckpKaUFBcDRuMTl0ckhYVHBLdUZMdEZqL0JsajFZ?=
 =?utf-8?B?QVlGbE1YSTRxZVk1NmUxanVYT1F2SlJKcWJRQ1pxcHhVMlh0cnpsLzhHdVc4?=
 =?utf-8?B?Y2owLzdDVXNUOGMrVlp6RmQ0bUJUMFNqOFZnMHpta2FLMWtMMW5vMDltOW9r?=
 =?utf-8?B?WVg3ZHdWczhtVVBEczRQamxNTDNPd2FncjNRV3lQNHdLOXR1Q3BmNVBlaHh0?=
 =?utf-8?B?UmFoTEFsbEZtT05zTStqcUpBb3IralBqOVdHWElPU0MvVG05NS82dzVuQ3p3?=
 =?utf-8?B?ckFqdjVCWUJkbzJ4MDkyTGdYNm9rN0JlRDVHcENMTFhtZVRKakMvTExvTSsy?=
 =?utf-8?B?akUrZjFkWlgxTmFoQnNudm5WbVg1ZUd4TjZiVTIvMVptaE11aHYxVURwS0xL?=
 =?utf-8?B?aEdxaWZFbEduOEVhMVljNDU0aEtpSnpWVXgwdXVFQmVLQjNRcW9VNTRnUGVH?=
 =?utf-8?B?Y2pxaUR6NTNIdlRVV1hMbE95Si84Z003UWNCSUNTR2dmdklyWnFQd2Q3Tzh6?=
 =?utf-8?B?UFltaENxbjdDczhSZVlXZXdBNko4MGZUTU1DYnE3d3RDY1V0cG95blBWVG1n?=
 =?utf-8?B?RVFkZytuRFNRSThoeXJzMWZMODlHRGdIRU1wbnNzbHZFcytHendLTkMydVFR?=
 =?utf-8?B?b0VHWjRsWFB2WXpaNnRiNWdaNDlMRTRxUENMeksrK2IxUWgxMGtTRXM1RU81?=
 =?utf-8?B?S1RVb1U0d2psb0d0SlBzaTZpaDMrT3RpM2YrbW11aXczRUZkMzA1TXNRS0Rt?=
 =?utf-8?B?N3RNcnloSWlsaGY5djByUHo3K2FSZG1pRkVOZTFhMTJVM1RHWGw1cHRHWFhD?=
 =?utf-8?B?MHM5VmVmRUJuYk1OeDRNbDY5aUc3UmRyUUVVVHVhcGt5U2p1cGEyQUw1NWdz?=
 =?utf-8?B?R3VOT3VlT2NNa2I1dlVJQ1hJRW9KcVJhNllDWkN6TGhUV042Z0Z4UXQ3U2Fi?=
 =?utf-8?B?YXhHOUJveXFOZzRrOUNRTWRISndZMjhQV1A4NHVtRjZPdWtHNC9MTDhsbmkr?=
 =?utf-8?B?UXlqdE1UN3hxMktOT1ZabFpreXl1eExIOE53RGJVV3BQbE0zMzU2aWFGZkR6?=
 =?utf-8?B?TWlJTlY2N0QreWdFcE9ldGswcmJZSnhUbVUwZFZIZnhDTW81OEhXYzErTnBa?=
 =?utf-8?B?OGdCb1FtbWhzY1dqdTI2UExqekszZVNLYzRuL2ROV050NDNScmFzTXRRZnJn?=
 =?utf-8?B?UXZBRU5JL0dSZGZWbTNLWnRWRVZnNENpbVR0WkJhcnJ0ZEs3TS8wcnZpWVZz?=
 =?utf-8?B?S2RaVE81UDBCYmNXL0xrU3JqVWkzMFQ0UU9iRmtFSnpjT1hQdTA1dUt2TzFX?=
 =?utf-8?B?RG5rZmFYbjB1ajUvcVBTclFvUU5MUisvSzhnb3EwWm4xOFB2NGhLWDAybko2?=
 =?utf-8?B?UFRCWldVQkNQczlwdTZlWWJJOE9mdVk0MCs1WVVRTTNwL0xWQTR3bnBla3dI?=
 =?utf-8?B?SlRoZlRkcFZMQTdoWVFwSEJwVzJOOUR5bEkxOUI3cXNKVGFmT25MalpWVjdH?=
 =?utf-8?B?L0pXM2hjaW9veStOeUdmNFVmeEFlZFIwSzBwdVVzRmRKUnB0L0l5UHRpSGti?=
 =?utf-8?B?dEFFTzZEY1puWDlvbjZIMWR3OHF3T01rSUU5VkhuQTlmQmdmU055QUE1bnh5?=
 =?utf-8?B?aW5FUVN1TlAwb0l3ZGd4M0Y2N1JFZFZESTdnTVU4NXoyRGY0aVhOVUd1WlZO?=
 =?utf-8?B?UWJjNDl3c0V2eVY5VTVEclBjZ3FvUmFkRzhuSFJ3clVTQnhRUzk2eWsrQU9T?=
 =?utf-8?B?T0V0ZTFZa3QybElBNnpURUp3YTNoRWVIWmtNejB4aUlTdFRiS0xTNGFkTlhq?=
 =?utf-8?B?ZDBjaFJRM0daRVhLVHlJdjZ4UnV2S3dKMnBtNy85bndwTTM2VUp4SHg1RldF?=
 =?utf-8?B?LzBNYkhuOHdJckdNNmV2TzVWZm1VNW5BOUVRRUg1ZWs3R3lRZWU2dzc4ci9Y?=
 =?utf-8?B?NHVlbUxkRXNNSGdya0t4K0Uxb2xCYmd1MTJmVTgwNS9ldUwzclh3N3JQZVQz?=
 =?utf-8?B?Z3ZsWkx3V1Vnb0hSc21ycDUrMGhvdUZHK2RxaHhhc1V6SEV3SXhYcWhZY3BC?=
 =?utf-8?B?dFVCYldKSHhNUDJVdXZHZWpiMm9NaVVIcnpKa3l1UTh6TkMzV2ZVU3BKWVMx?=
 =?utf-8?B?UGJrUU1xanJNYSs0cTlLK2gyK2VXdDB6SnhVSE56cjVJLzhFR2YvNFVJd0o1?=
 =?utf-8?B?cndKeWlRMEVVR3dsRVVOOWNyZmdTRXc1ak9DSzVhY2JxeTJFR3J2Sjh5VDFr?=
 =?utf-8?Q?agO4E1O9nKeDfT2U=3D?=
X-Exchange-RoutingPolicyChecked: O0rBOZN1NoNTo4yJWGabLRclS/88nL8uIMJBBMKkmFmT6/yHcRymSiBZQQ7w9f+8xJQE5LYI+wAphMQB2B1CThVPzzLGxjmhnPKLcGu3XA9HcGVZ5svZk2Iig5csu7zj8ttjEG8apBOECtHbxpT/9i24v7o3eFSzHKQSiGG97uT+hyRhq5zCkI8Io3JlGHMPrQhPa22Yg7qbtpx2pdfWBLWcV1SD6pa9F+7MGe1i31zX/CIp0q1JYmgHq3mdM9K1R8NdsTCTaIU+bYDZnt42DBD17ARc+hAy6VIR580tn35+rZZPDsEWfM3AtZm6sQtoIae2qH7wL5D58thbyeYe9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5eb65b-a177-428c-0fa7-08df1e1f1a57
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:45:04.6408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XMhhz838c6fS+CJps1yjEBNkxNRXz5NqaKp8wgexuBW9Nath005vZsz4G3cR7TNjLSN9J5CVh5dYiwigYIbPvlBbLimMYckfn8yRQ9x9o4=
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

This test is intended for HW verification and does not need to run in
recurring CI runs.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GitHub Copilot:GPT-5.6 Luna
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index d0a2bf87d6..c1dd3c7a83 100644
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

