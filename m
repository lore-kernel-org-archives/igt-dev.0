Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2EDC982E6
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 14:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CA610E32D;
	Mon, 21 Sep 2026 14:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAZRYU+f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8089210E7F5
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790001458; x=1821537458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FU60o6ii5+mQpVWw1yauaKvjz40KVDBTDeqkXDI90vA=;
 b=oAZRYU+frCAfYN5RyKVN6YRNNBRMN4JGgAh0iCWMXxw7l/9IQ6pKxJI/
 diD390TSgPMP3WWQR53+APvyVzeFkODqKrxmPR4MdwTWLDMbjY2R6Jdd0
 ScuFNtFMHFHpGtA74vyKeLPgygdfXtSPrFdNzchr1Zjp6rSmqyClVa/jy
 AklQCsbDZB07a8Sob5DKtnp6f+qxveuz1Bg5lAwZyvke7Mu2MROO0DLNu
 yTUgGSrEP8084g0O/KizyVmdND+0o6rtF60jfdw9assUzMefoVemiWAHg
 aCc329pRgxL25j0EssfkNBzTelNYSR/TKX0gejXbhWw9a0IsKkhGfbo8t Q==;
X-CSE-ConnectionGUID: iDgj8pJgTr6kugijqw781A==
X-CSE-MsgGUID: q2Z001crT2WtmpGoAS8Luw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101868202"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="101868202"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:37:38 -0700
X-CSE-ConnectionGUID: xc/fYzbwS5SSkoVnKIaHMQ==
X-CSE-MsgGUID: dEoTFNWaQOey9fLPBWxWOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3659133"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:37:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:37:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 07:37:37 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:37:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmR3DZXnlx0mHCK06kAxNHFfo7JaPLygbMnEiJ9K1d2PlklyCn5qKHMfq7fqyU70hmjlx1xOAbLNPnrquoCAJ46PrYnCebFGKgh9rfWLIzYj2WLbRiK3K5gDuO6ZlPZLz4nPBEU6LNCOrzLqhWv4Nr1VpWaJ/S1V/xY9B6s+0uwlD7/N226plPeEvuD91AEBzGebDNdYsWFXwhgVOJOjpaVpq8p90w7j5xNG29s6nURo7Uv988i7JGxCXCkLZPwC3320tNBfNxBAGIz0LUqJLvGCzKXL8LEiKRqLWkVqLK5WrDaXFT4k3bwsB8sCbuTuVYDbZiB+8CSO3tLLHKw2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMao4igzfuKiqieATwylV1fd/Pgf15asyMRRikWWoOU=;
 b=A4VEBU07DZWvcc1qsjqJ9naKLEK41FqQWpVPtrYYwC02FfkjbmlX/PDdLe9h6zfn3O5IgzEGiWZRz1cpYqbUqAZNRAsXs74zGRL25jZd4ztqihrdA89TO4elFAhUoDVfuoc5Xs0PInkjlE633DJr/N6pwmeip8l6Jd2Hy+h2wZHaBBxpEIpTSSqKv7g1ASGdAqXSmU4z21ONp/3QBI3DF/7BS1ymC+P/farlCGeSdsso/h0NMgr2eKUa0vSOLXXvaRZDNcaZoyZRys/FGVkn7VAd9B8hpCPTpIrGWUdeSfsDiCCjb6y00Muvox/wOtTqt8mE3PuUHJLXsbcS5WPwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:37:36 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 14:37:35 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 3/4] tests/sriov_pci_config: Add optional capability checks
Date: Mon, 21 Sep 2026 16:37:06 +0200
Message-ID: <20260921143707.2117970-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921143707.2117970-1-piotr.piorkowski@intel.com>
References: <20260921143707.2117970-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fc7af5-fb92-4844-bb9b-08df17ede0d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: cobVWCjTUbQxZSakjAjgWNXhO7v8Z4Jdew/7htQ/LbojoBCb1wur8PvpKOAhrBR6nJxZRPsrkA4+TW3mZRocBu3MehTjo1ZJRoTS7IcNbzYNyz1puuK5Y/cmhfIYL6XlZ+Ay9hTtme2H3LNsX1UjbCLPvTWFCaslQyXsLmvBgFLtp6TDRsI+O4MLhWm2Ur/K7TwCZA+e9JQVH+EzHQ5yIWbZq5G99tqTaSEo6aqZKFH2steLXNJorJK/DSxoHBA/c4izi1l5Eli4P30EyEjjy/3BD4Nh+bGF59hr+3QNjS4Q/E7tXImg+RxTxG7dmtDLzYGAgy9erBwT0rDBVYn0t5Xs1RmN1IN13vMylOs46lF7Bbsxohf9L/G1HsHi2v3UOOZY9YljjSkSPdoBMyU9Dicr5GFFqqPuhRMp1KM0OZrg1k8qW+yTJy9oq7W/mWjyrRl4nWuoMIbLz3XtJoAKzzvKqbA2E88MsoBImLsbiK0tRXGMjaJhxJbMfbsg8lgkXnG2TrvO0GScO68J8QTQSwa20GmyoLARjCKMLgWOtkQwf7QXbri23O0JN848daaUO6C6x6CXxpeWeSWuA0u6tOJ5JmYIU/ZQ6iohzob7K1+FJQOxaqYsHnc7S30O01A8aXx3SuQdZzWhxWz+SAMu3Z3E4Scjp+oE4JFGBV2OvLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09hclZiRHNoVU1kUS9PMnVLTEVVQUVBQkVLZjhFSTIyNHRScElzRzN0WkdY?=
 =?utf-8?B?TStLMjhKaHhrUlM3bjFVYmV0S0MwMldycktSVVdWSzVYRHBQcklmNXUwRjlI?=
 =?utf-8?B?Ykh0ZGRNeHlGTlpHdGN3d3dsOXBsQzE0MXpCa2d3b3ZHbUVtaFJ6MGZhSXo3?=
 =?utf-8?B?MTBSMWxLckZuOXVFN1ZIbVdYb2g0c0JTR2JRRGJiTG1ZRXh2MmpVaTFaWVk4?=
 =?utf-8?B?Ny9LZ0FDV3d1NkNNaC9JNGtsbUU5QmdjUE1KdFNSVEtkbXBESjFWVTlWWFlk?=
 =?utf-8?B?V1Q0U0xqTk81VTVTR01acUxrTTRwdm9GV1ZkcFNRcUFJeDlwaFVKdnBQUnp6?=
 =?utf-8?B?NXRhRm5RbFh5YXA4ZjJjU1ltSmNvelVJakFscm82SDRhL0duYTdwc1N1c243?=
 =?utf-8?B?cE5mbXg1ZEFxT1FUSXhSbk5FMzVvby9TV25xdnQ5ZmJEWlcvd0tZVkRGajg1?=
 =?utf-8?B?WVhQK01xZWlUS0dhNCtrY1diRHhkazRxL2FXelprUHM4ZnBsS2IyNjhINzJw?=
 =?utf-8?B?YXBGL2hlazZzR21GUlBjd24yQldJZEZreXBURTBmMXVvWjRWZG1DTUlsV0Ri?=
 =?utf-8?B?dnVHQ1puNW1TU2QxVkp6WHV4R0JuNlB1UytIUm5oNVhuaE02NnVwYytqVGZI?=
 =?utf-8?B?d2RsZkVwVDlmc09CMzJqbWJNUlBoNmk0Z2laUklMK21JdkRaTlZHbWh3YTJN?=
 =?utf-8?B?WWMrYjhxTDdnenJab3YvdHNVeG54SXpJMWtsemxXSnI5UlNLVGZoV0pKNnBz?=
 =?utf-8?B?SmloYU9TNC8zSnFXUlJVTWcvZEVMeHJJbytCcUQrL2ZwL2hScjdUMmR2RGNw?=
 =?utf-8?B?b213RGxUSSsyL3hBTkE5YjdYdlpMaXZJajIyeWVycFdrLzRiOS9LcVdTR2xF?=
 =?utf-8?B?RXNBTit3dUNDOXhJMktTOUxNMUM0TFlrOExwV3luWXE4Y3pJMjRTU2JzRXZs?=
 =?utf-8?B?MTZ3OVdpV2tsZzliejdsU0xrMnRDQTI4OE13M2NON0J3NmxFUWV1SEE0M1F0?=
 =?utf-8?B?Ui9hNVRrT2srYjlnWkxvM2tyM3JHZ2xLNFBpd1RzTkVaSDZXV0FwT1NjV29G?=
 =?utf-8?B?TjExaitTZ0hGcVdPSHFuOTM0VXdIdUlzdlNkZWJVWlFMRnU1SndYVkFPWUU2?=
 =?utf-8?B?YTFIN1puUXZGUWJnSCt6WE1zcEFmenduYnlhWEtOcEZBaDlyMy94bEtVclpi?=
 =?utf-8?B?cXVRbEcvcEZ1d084SzJBNjFyeXNhTGsrRjg4V21obStIb05VVk5WaGVFdXY1?=
 =?utf-8?B?SkZIaWpVOW8zTVhlUlZSUk8yOVN1VDgzNEdUMFBtek1oclFqZnVuMHFBeTV3?=
 =?utf-8?B?TWYyeTRBRlFWZHgvMGxEMldFSHNYalBMcEs1clpta3hEZHB5MGtwdDd6bkxP?=
 =?utf-8?B?OGJjVXNNY3YxQmFtY3ZrL1pHamVGUldsaEhWTmRHK1huL1o1T1E4WU9xUXhB?=
 =?utf-8?B?Rm50NXV1YVo1R2lCalV4WGRFM3cxWGpOdm9xeEphR2hwNGdsaUdURkl2bWJt?=
 =?utf-8?B?UGRwanBXdVdqYWYzeWVoOXZHcjlJU2V6NXNrNUUrajdzZDRRTEhSL29zWkwy?=
 =?utf-8?B?RFNtVy8yNTNsM21TRnU1K1ZpSmJTaHk3a3dxMnB1SFNBTGFBRTJtcytnTUgx?=
 =?utf-8?B?T3Z3RENNQVIralBKUWxHSERhM291V1Qydm1OQ0RES2t1OU9LdzA3N1JpVHlM?=
 =?utf-8?B?TDg2NmphTHpGcnNhQjBPS1VnaXU4S1dmWWViOXlwTy9Qam9sQ29Kbk9GWmph?=
 =?utf-8?B?VGpJTlpZSzgyMUNXQ0lXRzFpcFBIb3UvZmRiZldpZnIvTE9RMkVuaHhsbjJS?=
 =?utf-8?B?UEZBWVE2MktxdVlVTXVUMkJFZ2ZVRVZ5VGdHb3NqWkRuWTVoMERBbzBKbENB?=
 =?utf-8?B?NlVhNDVhWVRCaDdycmU4MFZidWx2UWVXMGQxYzdiMUVGYUpodVdIelIzdlAy?=
 =?utf-8?B?eGhWVjlTaERiZmp1NnNyVVRxaXRuRzd5eENiM0tqZFF0Q2xJTk9EWVFrVWVz?=
 =?utf-8?B?Tk1DM2F0NXQ3MW9EM0NUV0VIY014bDlaT1NkcDc5VFJibG9JMStvVDI1eU9x?=
 =?utf-8?B?czNzL29sQXhSUG1yRS91YitaTmQrVGkxanhoS29XUzJqN2pkWDRHc05iS3dG?=
 =?utf-8?B?bFllbldFdDE2Nm9ZZ1NvdS9XK2d4MzNRSmJNckFlZ1I3MVFKcEZvVy9Ga3BP?=
 =?utf-8?B?RjFiM0xJZHFqTTBWRWUwbnV2cDlWanFGa1ExbWFIZ1dIeExYYmlUZFRqS2po?=
 =?utf-8?B?Snl4T2RiN0dQdGs5REIvT29NOHl1VWVkRHd3VDl2NTBHZVg2cUJtbTdURDA2?=
 =?utf-8?B?amZwa3JXUERFdkdqaVg2QkZHaXlHL1lXcDBrTm11bExoU0ZHaytwK043OGxY?=
 =?utf-8?Q?QEZ7OqDwCyZJwkcA=3D?=
X-Exchange-RoutingPolicyChecked: wvBlKE4YBVmETZc3VnzFRLRsRi0HJ7u7sCiYa6cquaPh6LjZVvqlnMinr4ZDD4Y/QMaO2j8OXzCcl8C4Md9zUgTIKCCGI75vaGjH+WzCB5sQf0CQIhdxdSVpcqizNXgY7+ygcoJGX2m9jdSpSX0sXePqN6VEfsNImhqDcOgUOj0xNoqpklENvk9JEKBTP+hFmHafHPU47d+QhmYxxqCJ7X6i8IY9pbht/oXAwGYnY9XxTomSDcMHMxWx8Jo9AnilHu8a/SlRK37g1FfyQV+m9tqt5h57zId325E2kRZYziLshbGSOWjbh9OOmfu9RAUE0sSAWhtH1TzhZ6hYdhwqpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fc7af5-fb92-4844-bb9b-08df17ede0d4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:37:35.8109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2u0oXwwXBkhtzyfE1pxQwVcOpRZ7ZhYUDS3gnirz4WeTUIwag1vn0FQJovEgdUfDqlCGq1M9w2P36o0aOXhAvhqs2gl3C1PfvbRAx7AXV1U=
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

Add subtests for the optional Power Management, Advanced Error
Reporting, and Address Translation Service capabilities.
Skip an optional-capability subtest when the capability is not exposed
by the VF.
Validate the VF ROZ fields required by the SR-IOV specification,
including Power Management Data Select/Data, AER status/mask/severity
fields, and ATS Queue Depth/STU.

v2:
- Reuse the VF configuration captured by the common fixture.
- Use PCI register definitions available from linux/pci_regs.h.
- Simplify optional-capability skips and runtime descriptions.
- Remove redundant informational messages.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GPT-5.6 Luna
---
 tests/sriov_pci_config.c | 110 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
index 9f410ef23a..a3d7e86b58 100644
--- a/tests/sriov_pci_config.c
+++ b/tests/sriov_pci_config.c
@@ -43,6 +43,21 @@
  * Description: Validate that the Current De-emphasis Level field in Link
  * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
  * and later.
+ *
+ * SUBTEST: vf-power-management-capability
+ * Description: Validate that Data Select in Power Management Control and
+ * Power Management Data are ROZ and therefore read as zero when the optional
+ * Power Management capability is present.
+ *
+ * SUBTEST: vf-advanced-error-reporting
+ * Description: Validate that the specified ROZ bits in AER Uncorrectable
+ * Error Status, Mask, and Severity, and Correctable Error Status read as zero
+ * when the optional AER capability is present.
+ *
+ * SUBTEST: vf-ats-capability
+ * Description: Validate that ATS Queue Depth and the Smallest Translation Unit
+ * (STU) are ROZ and therefore read as zero when the optional ATS capability
+ * is present.
  */
 
 IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
@@ -161,6 +176,85 @@ static void check_vf_pcie_capabilities_2(const uint8_t *config)
 		     lnksta2);
 }
 
+static int get_optional_cap(const uint8_t *config, uint8_t cap_id, const char *name)
+{
+	int cap = igt_pci_config_raw_find_cap_offset(config, cap_id);
+
+	igt_assert_f(cap >= 0, "Invalid VF PCI capability list (%d)\n", cap);
+	if (!cap)
+		igt_skip("%s\n", name);
+
+	return cap;
+}
+
+static int get_optional_ext_cap(const uint8_t *config, uint16_t cap_id, const char *name)
+{
+	int cap = igt_pci_config_raw_find_ext_cap_offset(config, cap_id);
+
+	igt_assert_f(cap >= 0, "Invalid VF extended capability list (%d)\n", cap);
+	if (!cap)
+		igt_skip("%s\n", name);
+
+	return cap;
+}
+
+static void check_vf_power_management_capability(const uint8_t *config)
+{
+	int pm_cap = get_optional_cap(config, PCI_CAP_ID_PM,
+				     "Power Management capability is not present");
+	uint16_t pm_ctrl = igt_pci_config_raw_read_u16(config, pm_cap + PCI_PM_CTRL);
+	uint8_t pm_data = config[pm_cap + PCI_PM_DATA_REGISTER];
+
+	igt_assert_f(!(pm_ctrl & PCI_PM_CTRL_DATA_SEL_MASK),
+		     "Power Management Control: Data Select must be zero (0x%04x)\n", pm_ctrl);
+	igt_assert_f(!pm_data, "Power Management Data: expected 0x00, got 0x%02x\n", pm_data);
+}
+
+static void check_vf_advanced_error_reporting(const uint8_t *config)
+{
+	const uint32_t uncor_roz = PCI_ERR_UNC_DLP | PCI_ERR_UNC_SURPDN |
+				   PCI_ERR_UNC_FCP | PCI_ERR_UNC_RX_OVER |
+				   PCI_ERR_UNC_MALF_TLP | PCI_ERR_UNC_ECRC;
+	const uint32_t cor_roz = PCI_ERR_COR_RCVR | PCI_ERR_COR_BAD_TLP |
+					 PCI_ERR_COR_REP_ROLL | PCI_ERR_COR_REP_TIMER;
+	int aer_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ERR,
+					   "Advanced Error Reporting capability is not present");
+	uint32_t uncor_status = igt_pci_config_raw_read_u32(config,
+							     aer_cap + PCI_ERR_UNCOR_STATUS);
+	uint32_t uncor_mask = igt_pci_config_raw_read_u32(config,
+							   aer_cap + PCI_ERR_UNCOR_MASK);
+	uint32_t uncor_severity = igt_pci_config_raw_read_u32(config,
+							       aer_cap + PCI_ERR_UNCOR_SEVER);
+	uint32_t cor_status = igt_pci_config_raw_read_u32(config,
+							   aer_cap + PCI_ERR_COR_STATUS);
+
+	igt_assert_f(!(uncor_status & uncor_roz),
+		     "AER Uncorrectable Error Status: VF ROZ bits are set (0x%08x)\n",
+		     uncor_status);
+	igt_assert_f(!(uncor_mask & uncor_roz),
+		     "AER Uncorrectable Error Mask: VF ROZ bits are set (0x%08x)\n",
+		     uncor_mask);
+	igt_assert_f(!(uncor_severity & uncor_roz),
+		     "AER Uncorrectable Error Severity: VF ROZ bits are set (0x%08x)\n",
+		     uncor_severity);
+	igt_assert_f(!(cor_status & cor_roz),
+		     "AER Correctable Error Status: VF ROZ bits are set (0x%08x)\n",
+		     cor_status);
+}
+
+static void check_vf_ats_capability(const uint8_t *config)
+{
+	int ats_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ATS,
+					   "ATS capability is not present");
+	uint16_t ats_capability = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CAP);
+	uint16_t ats_control = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CTRL);
+
+	igt_assert_f(!PCI_ATS_CAP_QDEP(ats_capability),
+		     "ATS Capability: Queue Depth must be zero (0x%04x)\n", ats_capability);
+	igt_assert_f(!PCI_ATS_CTRL_STU(ats_control),
+		     "ATS Control: STU must be zero (0x%04x)\n", ats_control);
+}
+
 int igt_main()
 {
 	igt_fixture() {
@@ -195,6 +289,22 @@ int igt_main()
 	igt_subtest("vf-pcie-capabilities-2") {
 		check_vf_pcie_capabilities_2(vf_config);
 	}
+
+	igt_describe("Validate the optional VF Power Management capability");
+	igt_subtest("vf-power-management-capability") {
+		check_vf_power_management_capability(vf_config);
+	}
+
+	igt_describe("Validate the optional VF AER capability");
+	igt_subtest("vf-advanced-error-reporting") {
+		check_vf_advanced_error_reporting(vf_config);
+	}
+
+	igt_describe("Validate the optional VF ATS capability");
+	igt_subtest("vf-ats-capability") {
+		check_vf_ats_capability(vf_config);
+	}
+
 	igt_fixture() {
 		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
 		igt_sriov_disable_vfs(pf_fd);
-- 
2.34.1

