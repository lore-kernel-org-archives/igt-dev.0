Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A7CC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7C310E170;
	Wed, 16 Sep 2026 11:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9qeOFTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F4F10E170
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789559541; x=1821095541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PF/b6/pFawFyILWaULZjDNDKhU++pxRZEunqWAG9L7s=;
 b=m9qeOFTvlDzbGpuvNq2J3sIs2ItZQ5O2s1K0Sgogn7HLsNz1ITr4+59+
 Zn5H7Q1F3Dq6tBaNvyz4rfRZ44NDSN/lJj+jL4t8+TKPqA7Z24oBSYHDC
 t26RcfkTqAeVJltPDdy1EST4QP2zTINkHEy0qlr2GGxT783izw9Wa1Zb1
 efmuCEfgW4YPYalRC+/mldPtP5EW4npPiLXTUB0vmB6pWis/ossZ8aRk2
 TPj+g48ModYqSWqh2tp0z9BCUInRZx5+dndvKm3eX7LIdjVgJQ/ajRDuc
 h0gLlHDKyba4myKfqk3/zk02MkqgAlezkNSy41KXKf4g21GHZMsk1FR/3 g==;
X-CSE-ConnectionGUID: 2bPXc3VRQ1uvztwKEi1Ypw==
X-CSE-MsgGUID: PogTOGDVSiOD4lvmcMTjhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89803676"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89803676"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:52:21 -0700
X-CSE-ConnectionGUID: jEkLfsyGS4eFOLFopm8LEA==
X-CSE-MsgGUID: 9YjM8loHS3WUY3ltuI+8bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="303205167"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:52:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:52:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 04:52:20 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tu9Hl0qi1XkNFWbIz93S3oaFLPUaoFM0jv3O5BpTYFvpSesFEm4aqC90VSS9e59EYlOXgrl0v3JZgdMROqYMGrqPtEPEAgf6rp4uiUPjz6KpYh5Dx1B4D9WZLch53cA2eLGNDC8+8xJ+RNQDPg9EpUhMqcx7w0tYZpyRXxiw8uzg8+JfNBm36qlkl+K01raU23n+xlv78hcvSZIJot8RhxjC5qY96yqJ+Wbx3wZNQ58ArqIFZ1XjWZCZ3N+OTu5uPrkr2Gsz1w/etO9E9cBIBGU/G4KldgSi5lnZoGpCkvNylI8rfXE8P76pSPJ2SWLUzbdjtLiM5zwGDWKJmMeXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2ClWe8pDhL1m4nH0x5HmkYtTgBixR6gJxy6DyioDQE=;
 b=FDP+tLDbbe256O5l2GFXJWxZci6k+jJt+uFiuMTPYYWyB7CZNvlKerpc309OF9STFoI/gTlzShPow7rauR4sCESZvOtoEzyFl8FtGlsstO+ZtneTIKiW98KyCClv0KwoAIcAWkuvg1+CGHiPERJQaS03EHPpXHguTXNEs02+nCvfVIgAkykiMvVvgWaG8tgOg5FmRtumwiMvduyugSXxmycbuMrL3fFHmxp5PY9nxyv8Ifwwk0yj9PaL52drCeT977ptZ3EKp/Mh7SPhutgzFYDYM7g3gS7DZGLzPjBNTV2AlpQuaPEqB9nDllj82m5cXc2qsd/SlQa47x24J1X1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS4PPF821BFB4AC.namprd11.prod.outlook.com (2603:10b6:f:fc02::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 11:52:18 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 11:52:18 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 2/4] lib/igt_pci: Add PCI extended capability lookup
Date: Wed, 16 Sep 2026 13:51:59 +0200
Message-ID: <20260916115201.1973752-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916115201.1973752-1-piotr.piorkowski@intel.com>
References: <20260916115201.1973752-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0067.eurprd04.prod.outlook.com
 (2603:10a6:10:232::12) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS4PPF821BFB4AC:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b8f4c1-26cf-4768-23df-08df13e8f5a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|10067099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: dnNCh4h1aDk0uKPyL8on37PKZ55NK4Wr7T7Yfp2FGLCA+HFRaZPcddKZskUEjHzVby3RuKOts5SAWTDFfkVjdWzaj8g/qeIVF3YG89qPMDZcAFZz3PAA+bDxxa+/YlW8uzndBGHe+N6Yz32+bFu6d0uYSCgH7bEQrZrkv4bsYp+BLQmRLG1/ALDp9s4ew7OinPieVpUm/I5yhHhGZEfM0yD7g0V+uJa0GSgqsVf7We6H4Zwz4+2ZA0jD0gvvAmYqaXDXWKAhAr4A9aKPUYyIotbNlKKxIzMVlmQ51OJly8NncC4OW+ZVrZX1+onw5PkYaC05qvdbiKdoLF+RWo5UTn+RPpcHRJug2Dsw084Kj+y3w+XSHD02jFXkSMsAZ5IOQuBe/5JhYFa8TfF4VJxDfJlWKNk6MIqfAuV8BjNkgSQBgF+NcuVUYMcdbUbhjNhfieMIgGcmzR2/O/H/u+3dL4hmK6NEWW+G6Cxo0RarO5AZ9oYSPCBJUpERjlD1dKtGjU/gMseECfmSM0X53gdV71ASfs24PBQYiy5FtMLHzmowvPVdgl/rcadLBcCIlRss91niJmHYyys6D0aiqftKtGkizbcGudJlrqzA23aeqddIrqrQAg0AuT64mf9z1CbdFa7fajJ1XkeUanHH8RXfmWq35YNTd5448IeaTJRzYXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aCt1T3UrRXpCZHdSNlBUMVp0ZVRLSURIK2tpY1dBMkZTcVJ1N3ZZZ3kxOTF3?=
 =?utf-8?B?anREWXhWdjZpdXBKOEdPTWcxOFIrY2hmeEJuQVR5NUFodGUrOHJ6aithZjdw?=
 =?utf-8?B?ZGxnRXJsM2RLU1JNb0M0eTdtSTZpZ2NMUFdVSnlwaW1Vb2NQcmpJZzVkZ0Vz?=
 =?utf-8?B?cWl6K0tuZkVBcU0xWkpkSXpkNHN2clV5M2ZoQjZqL1ZMdG1yNzRURzhHN0tO?=
 =?utf-8?B?czYvdUxSOFlQaFRqUC9PaTRrcm9oZzZnZ0FPa2tHcGdWSE9WQ2N4elpsUXVE?=
 =?utf-8?B?cEFHSU1hZytzYUZaaG82QS9zTGRnK0U0Q1E4UE5lRU52Sk51cVFEQ1dMOWRG?=
 =?utf-8?B?WjZ4M3RMSG1DT0VNL0xsTHNqOUNXMCtnZTVqbTV5SXhuL25hd3Z2eUxGdkU2?=
 =?utf-8?B?UFVCaXkxbTk4RkVmZ3hvbnlHU0Z0Y0oxZ2xNcVRwVFZEYlgvMDVvSUsrc0RL?=
 =?utf-8?B?T3dVZ21YM3Yxd1o5eEo5MUtxd1lKcERRb0FqZ015MSt1RE4vdDQ5UGprVW96?=
 =?utf-8?B?dzhBVS82UHVEeTNKMnVCRlVHRUkyL1RMbm00K2Y2THMvZTdhTXJkekNBZ0xV?=
 =?utf-8?B?ajFhU1EzR2ZkMnBmWGpxWlFjd2p0SFVHWDZJajJmY3pkRE42eHpnVGo1ZkZt?=
 =?utf-8?B?WDdLeVFISVpJV3c5QVJiNlZFRysxclUrSWQ1a2tTd1BBb2ZLaUUzUzQ1K3h6?=
 =?utf-8?B?RTcrbUF2SE05bDcyUEp5N1RIU29la0s1WUlvWDI1dGg2VWhQT2xXbVQ3WWYw?=
 =?utf-8?B?TnFVUW1qem9xVUhsV0p0VHh1ejg2TjNmU2tVYmtMTG0vTDNLVkJ5M2NEaXpK?=
 =?utf-8?B?NE9FTEo1NFRZYTBUa0xVMnppaTJqQ0gxcmlnZWo5Y1VUbTJEQ3RjNVo5ZlJT?=
 =?utf-8?B?V2o0YkRnWGpISEpjZWpRWDM1NjlVd0k1QXBENS9QM3ozVXJ5NUV0cjljai9o?=
 =?utf-8?B?Q0NKM2tKYXA1QWdIclYxR0pLamhsSmxhMmNWRGdHQ0VJZWVSZWw5ZS9pWUN2?=
 =?utf-8?B?MG1rUGt6NE5NTFhBSjFIKzM0MWFsbTMvNG9uWkVocFlaL3hKdlBBTzNxUjJ4?=
 =?utf-8?B?ZHBSTXVMV3RHbFlVZU9DT2g1UUFETTUxNktHNDNPTnRPQlJKbUxmWnY1Y0U4?=
 =?utf-8?B?Ry9xM1JsY055MlpLdXFjd2FITnRXditBS2JtR0tCeThBejNxTlN4MGtVWEc3?=
 =?utf-8?B?WEpoeTNLVlBnZi83QkVxVXcyUjJONlpPL29LMkJUR2VoYW9JSldaeHBrSmpK?=
 =?utf-8?B?V3BIUzZvdUh6Z05YN1VkLzZzMHlTREZzK1lLWnNhcW16NmR1MmZKN2pNM2Jh?=
 =?utf-8?B?ZTJpY3ZpOE9vc2orbnV2QkJkMmJBbFRrdWlXcmVnbG5ndmR3dFkrL2RNRjgr?=
 =?utf-8?B?OTg4WEgzZG9JdXFMMVl5VE9ZbEp5NERraHViTkFYVzIvVDQyVjVMQ2JleTVt?=
 =?utf-8?B?cllsVGRLOWNMTDR5bW5sVzRQbytiUUh1cW9IbENRa3hTbE12bi9sZElrV3dW?=
 =?utf-8?B?TWZCVTV3L1piN3RLZTRwenN1MGxnbTRxKzFOcVRSakp4VE5DRmVsM2hja1Jt?=
 =?utf-8?B?UGJqMSs3LzJQNm0rOWtyVW41SXBOVXNJL2UwcGZLZk5RV0ZGN0dtVS9RcVEz?=
 =?utf-8?B?eWJob3ZmTnhPQjNnOGVHWGFwT21oZDZvU3dCeFlISDhXTk9WL093bURnNkFO?=
 =?utf-8?B?ZzgvMUZTNC9hNHk0ZC9ja3VOTFo4STlCVThwSTR2VjFSY1VCbTZqTGc0R3g2?=
 =?utf-8?B?V1ZXaU9mSjM0cEJMUkNFY3FMZmdvVllZZFlJSVZ3L21NRTNqL3VLUUUvZjBD?=
 =?utf-8?B?SkJtd0UvZ2dZMEdYTktrdTdKTXlpYlh1MHpIOEQrbktTblZkT3NHZVZOU1Iw?=
 =?utf-8?B?MUJ5Vi90cnVXZlJoUWN6cjBHZml1VEJJMmlsQ0orRWFUWlVlNkJwVm9rK3lm?=
 =?utf-8?B?dFFkSUx0TSttUDRzSEZwSldoSVYyYjhSaVBUR0h0eUZhOERPb0ZMZW9vd3V3?=
 =?utf-8?B?S3JRQ01jd3llSUk5dURCdnd1NU1IUmNSMjFPZHVoYzN6ZGQ3amw3U3ZoMTB2?=
 =?utf-8?B?YjU5N1liL2lkcUcrelhFRmtDQkQ5VVFmRkhJUDBVS1VQY3dtQUlkNGw0WmlI?=
 =?utf-8?B?R0VybUI2bmQvN3lJOGZhOEMvTFBtK2ZOWE1OV3U4d0NCZFJ4RGEvMFc4b0JG?=
 =?utf-8?B?dCtEOGIxVlgyVi90c3kzMHFZY1ZDSTVteHYvcHlaWE4yZ2dTcU9LSXJ4eGkz?=
 =?utf-8?B?RHdhUDhDdTdzS0xjTFZYd1ZUdjNQTkVXdHFGRnU2OFdmUlJqK29qald0OWxn?=
 =?utf-8?B?TzZRRHh5SUpsYms4ZDZLS0NoN2h1QnpOVWthUmFReDJDZitTZTRMV1p3K0Ri?=
 =?utf-8?Q?5NHrgGALT6keh6KU=3D?=
X-Exchange-RoutingPolicyChecked: jdg/Vjmskc19QWPXIMG0PrQCiGFRNTuWPniF3n1H3oCDF5AL6I24tKOWJCR6W9enXJxO1ojyfGmPr5x6S4zTpTpjNCV8QhBd/5vhGR8JTa0wad2Zarwj6xXMdAOjrBFQK1GJ9uHzQHCHlNeAog4XFrUfajiO1WrAmVnkVNbG471oRbGUeoH8Udrbq1vgB2LV1mzFSNwSyJueH6cI26Gim30YC36fLPNrRdhfKkTqSUgsIZ5n7sQzKXsJoWUSwFPvFZnD71d84kk+aRXWgylqV/2XPsyVv+5kotvn71Ro0i/J/KUc8kjUEUly48dD4ngXo0A0zbukRc2aSLZ7zqkdSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b8f4c1-26cf-4768-23df-08df13e8f5a2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:52:18.5203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5aprrhARj2AmHPRThEf77ffeoD2czjeIQ5volZnqSPWX82mbra7LwPb8VMHmEDkiWZc5/eTxs4SETyNj7q2flcgHGSgwkESuOM2egkrXLlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF821BFB4AC
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

Add support for locating PCI Express extended capabilities in raw
configuration space.
Validate the extended capability list while traversing it and report
malformed chains or invalid offsets.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GPT-5.6 Luna
---
 lib/igt_pci.c | 40 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_pci.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/lib/igt_pci.c b/lib/igt_pci.c
index 06717fe8eb..a87e45c184 100644
--- a/lib/igt_pci.c
+++ b/lib/igt_pci.c
@@ -61,6 +61,46 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
 	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
 }
 
+/**
+ * find_pci_ext_cap_offset:
+ * @dev: pci device
+ * @cap_id: searched extended capability id, 0 means any capability
+ *
+ * return:
+ * -1 on config read error, 0 if capability is not found,
+ * otherwise offset at which capability with cap_id is found
+ */
+int find_pci_ext_cap_offset(struct pci_device *dev, uint16_t cap_id)
+{
+	uint32_t cap_header;
+	unsigned int offset = PCI_EXT_CAPS_START;
+	int loop = (PCI_EXT_CFG_SPACE_SIZE - PCI_EXT_CAPS_START) / sizeof(cap_header);
+
+	while (loop--) {
+		if (pci_device_cfg_read_u32(dev, &cap_header, offset))
+			return -1;
+
+		if (!cap_header)
+			break;
+
+		if (!cap_id || cap_id == (cap_header & 0xffff))
+			return offset;
+
+		offset = (cap_header >> 20) & 0xffc;
+		if (!offset)
+			break;
+
+		igt_fail_on_f(offset < PCI_EXT_CAPS_START ||
+			      offset >= PCI_EXT_CFG_SPACE_SIZE,
+			      "pci extended capability offset is invalid: 0x%x\n", offset);
+	}
+
+	igt_fail_on_f(loop <= 0 && offset,
+		      "pci extended capability offset doesn't terminate\n");
+
+	return 0;
+}
+
 /**
  * igt_pci_config_raw_read:
  * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
diff --git a/lib/igt_pci.h b/lib/igt_pci.h
index 787c10fc51..d7d2254678 100644
--- a/lib/igt_pci.h
+++ b/lib/igt_pci.h
@@ -29,6 +29,7 @@ enum pci_cap_id {
 #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
 
 int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
+int find_pci_ext_cap_offset(struct pci_device *dev, uint16_t cap_id);
 int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length);
 uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset);
 uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset);
-- 
2.34.1

