Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50E3C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9712A10F028;
	Wed, 15 Jul 2026 12:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmkwpk/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E696310F021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117712; x=1815653712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wrxjMBvnUJwUZrEJ7GEIKrfB9Ob2lfDJITNxj2pxjF4=;
 b=gmkwpk/r3Q6F/av1u7Kxs7ZlZUtkXK5LcmAYKdG+0URKDh6Nr/bZ6hdD
 ELlN4C0Re+YAU49iZ3FUqzQ7kmjqh0w3o/73GHwE9ItpS/SEbC+GTB8+X
 NWO5C5FTtek2v8fdb0t9mb6zk6A3WZtxNsP/6eTulw508we81+FRmcAlp
 i142EfRfuwG18U/5a2ULcDofSU0p8jAI0FNx1ju3Ae1S8iYJPeyTqZsk5
 EyL4FsNov1GoGMM2HCZMpeuHk4WkK8kCYCcXWq67mJNfiVYRnXbDONvr7
 IS35tVmmOf87SHEs1V1scUpGZAwpkcxha3LpSeGfKxUk8/NXmDMw1MGAd Q==;
X-CSE-ConnectionGUID: /kifSouvRme+jBdCD1a8Yw==
X-CSE-MsgGUID: 76q/uhV3ShSTGnqFtmpDTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95108058"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95108058"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:11 -0700
X-CSE-ConnectionGUID: tNbhgt8ERMO9JNO2S/BOEA==
X-CSE-MsgGUID: 2xuyCs+VQCCPVB4vAHfHcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="252209765"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:11 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.34)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1eRCGiZctSIW9y8R2K1+itqJZwq8xkuTSYDW0Him3Zruf7L/SslCDvjc5JmJk1khcOsSrF/+ZcQtZF8yh29rNDDyYFmJ+hwMJCUZRGyib/tedOE6U0pTJajDAAc9L4JAldwEjZu9vUsTPJPJnLGo9c8m2I8JGv9JTjgI/w0OEI40tUBDCjeCu92vN3OBHcpfLYEzy9Vj47TbaOkb636ktmHbKZZPLbsUfUSxeucy7sB98sel0CEJotJ+KmadZJKuDECk7t4ZEOe+quDARx3+qnotzSGDuxvC6/6s895Zs7YMyBIXA/O1ayBE6qtczXkEAQTv0RDgqn0i/9nPl7tUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTOekt2vqKunX0lV8CR917J5pVTjm1tOn/nWGwHDlxI=;
 b=GlcaiuXcqAcmq0esHgdIeaNf8mCDXZHWqVku8mDhDXvKerxixbJunWJnEQaLFPteM8/aHky3Pb7Xt+OamgM9EpmYsbUmEcB6W1l08hef9t26+r5U92jfK9gm7TqyoDOAdCiiTfOohJY+eLPkQM05m30koEyl14yvS4+fR+oe7KYVIp7Ibc9vFMnfkvsfSprYLhOMXP2pJOERr9g0tN+Fu5Irtu8otXTdW2FW7AnHdEanFj5Sjjp4mvm9xEEnP+O6ixv6t+5TLX8i008VV0DcZSmGTjNAdfbao6gJjY0YOffNGVf4IqDLfx5fsLzuTErstUF736UJrdY1Zsf5hu/vSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:06 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:06 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 06/31] lib/igt_drm_stub: introduce for tools needing
 driver detection
Date: Wed, 15 Jul 2026 14:15:16 +0200
Message-ID: <20236b1a70d9595799effb782de718298b8a9f91.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784117512.git.sebastian.brzezinka@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 85aa017f-fe77-4701-8dc5-08dee26ab4ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|3023799007|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: l7CF4ZV+i8LFEdJsuHh/HGo1TQK+OOI4oM8t1dQsOBOSpBW4DSoID754Df/VFxy24Zq1M2tjlCm+tTmIL2AHZqq/sQmD8VQIGm5uG7B9g3OKI4VnvsZXC3MO/ffoZQTKyLOmV3xsusEMlDTqqWVZKbDsn2DHGUeNladPaUTP71bMZX0MPZwoMgJpKdgqcUYaS+EcmJj/wVvMoGVNY33Hir7VRcMFO23hKeuuewDcXLjkZfuVdEB10yvFpypotPrQnrOJ5X7k6knNMHbvGD/gzOwKtvugNguBZUCxt5vHedNchclNE0WFSfBoztPaDFqSPILqMB9T4md8wbtuJ6Z/Zz10cPLzt8YepGcg6kcP2UT8YnLlTXFfz6v5hKV6ZZfRXaDx49NwC3VGXw0mDDsuWOHN4FRbykVgW2MqhSGjAe6JzGZ+jmEL+buN/Fx9JhHJ30VFsKqw0cdx7bsjEKBaTjmCkEwc5Lo5GgRcc34bOSLuV06BxEKhvicUqS6CR/zq5IYmqQZaKknVmvGzMoaeui2laDD0+J5kx1guJeyLBQsPJu0pK8a5o6QmTofIlG7dKovcc/EHgSum+VdaRFZiiXkzlH/COHK5gXGScL7IxK4KrHWDYl2vK4ItOSrGOhpR8x3ul17Y6s/NJyzvdR6z7tGWiY6IgtWidiKJLGZp4jQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(3023799007)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0gzaktkSVNpQTNYWTNDT2pKTnVGQUR6TWNMNUFubk05cUg4RVhZSmlWREVK?=
 =?utf-8?B?MFJmcytNTzF3YVh4NTJjb25XSFFsNmI0dDM4RTI5blNHRXJjeXdyU3pPM1ZI?=
 =?utf-8?B?VERrL3FmTDZTbjZDYmlUMVp1TG00M2gyS3E4OUV3aXFiTDBzYjBaNTVCdEsy?=
 =?utf-8?B?SlYrYWtMTUpkUFR0MU5PNVJQZ3MranNvbjgwRTdnRlEybGpJdkEzSlpCUkIy?=
 =?utf-8?B?NlRQRGNVZHFtUUNTazBSTG1sWlRYQm5BWG83WkpXRTJNaUdNdkwyVjlXRE15?=
 =?utf-8?B?Nm5NMDJBVWU1dEhxeWV6d0lMYXBQNksycWs5QlZMSjFzMTNPVkUyYUhwYi9S?=
 =?utf-8?B?Z1BXcmc0UW9mUmtNQmE3dGNuSlkvM0RSYU5BeXIzTjFiMUxYNmN1NFU5K1RC?=
 =?utf-8?B?ZXArU3V2bHFXVk8yYnlXS0liWGxDWXBtdXluWG5rU2RpNzArZ3V4cDhXcVZE?=
 =?utf-8?B?THQyVzdOZ29jU1NpaFhpV0Z6ZC9Va3Vrbi9LQ1lPcXNPUTRnNGI3cWcxTzJB?=
 =?utf-8?B?NXhLcktGTUlQVUdGMUdiMWRYRk5sUGFKOHZIYVZ6YVllWkRYbmVOUnZZekQr?=
 =?utf-8?B?ZlpuMjBGektNVWR6UVJjQW5vcmpqRUs5NE9CanF0NVpvUnc3NVVyNFpoay9G?=
 =?utf-8?B?QXU1RHh0SHl2NVVJdUJHLzFrZnJheGQzSDVpNkRseWd4NURZaXlQSjE4WmNu?=
 =?utf-8?B?U0k0VEhELzFlRWlhUStYeUsrMW90SFVLbC90ZkwzZVJSRUlOYzk0WmttR0ZL?=
 =?utf-8?B?T2txM3c4cVRhNTY4UGhVOGZrV3grSmExcENSN3BNYzlMNThhcGpLME1zanpj?=
 =?utf-8?B?TDZUMkladFBUY295ZDF6SnpCdFZoakRyR2hvcmJRMmpkMWplcFBQczVoSUd1?=
 =?utf-8?B?S2sydE15MUQ0RTFuVEJjdGs5T2ROK05qeFNiYlM3emFyVURqOFg4K3M1LzVr?=
 =?utf-8?B?cWI0Uytib2hieDY2dGErT3ovR05Qbm1SLy9qdWRIMDVpOFFFZmJWVzhQWVF0?=
 =?utf-8?B?NVdEVTE3V1NvTFV4QXVTdjhlU2t5NTJTcitBeDkrREJ2emhvUjAxMVlnOXZP?=
 =?utf-8?B?NjNGN3RXWlcrNGtXYTJGL0hUYTAvYkFNT2NDMlJJS3MvQkRldUhYWG4rOHBn?=
 =?utf-8?B?STVqQnZiTlhBcUc4c1Q5UTZsQ3pLbjljb1FDSk9CdzFLT3hVY3haamZqZXY1?=
 =?utf-8?B?cWhid2lGS05yNnIyTkNmdGh0WS9UQkJjeWx6aDVxdzZrVjJsU1l6T0FaL1ZZ?=
 =?utf-8?B?WDBNUkN5Q3lZR3NLa2oyL3Y1REtXSy9LOGprUitoakYzbzhmSHJicnd2M3h3?=
 =?utf-8?B?bFpCR3JEYjRLOVRaQ0ZaUE9XK2x5bTBHdjlET0FVekRQOHRReHljNTByUDdZ?=
 =?utf-8?B?UHI0UEp2S1c4UDJuTHNHbDczdkwrZ0FUdmUzNzNZaVVsR29VSk9RU0JiNHQ5?=
 =?utf-8?B?L1V1MFF0MU1kS1liaUdmVktYZFZjK3Y4dXVHaWNVM0JmS2xWOFQ1djRWV0NK?=
 =?utf-8?B?em1tZXZ6ZVZqb3BvK3poZ215cVNMRUE5VUJkYjFJQTFCU3pjRjd1c1ptcFRW?=
 =?utf-8?B?QmQ1akh3L0RWNHB1UU9kUkMwRTBZejRTT3VaWVltdkhYMHV0elNSWUIxTmFs?=
 =?utf-8?B?TXI0UEQ3V0JmZ2U5N1M1eTEyVTZSMkl5clFEeGJiSmY2cCs3MytpME0yeTF4?=
 =?utf-8?B?TC9FZStpV3hVMXhVeDhjVWlBcHBQdDRGbTFSa0RxdmNoKzkwZVk4a2hBWXJn?=
 =?utf-8?B?eVZhbVNvZWt5NmtGV0xEbHBDU1JqVE9IdjdRNFVpSGVGbGY5SVdJVWRSN2ZU?=
 =?utf-8?B?b1M4dTN6aUtwWHJ4Rm5ZcW1tU0FnZ2liRFZpNEJFMVNHeXBmWjVTcHRnZFZO?=
 =?utf-8?B?T2daY2lHcm9VUlNoNEZLNzRaVzVpSExVcjdkQ1hvclp2TEJuVEtHRVp1ZmtC?=
 =?utf-8?B?Q0JKMWRPRmJMUjRtK2orOGJmcHd3eGYwNy9FVklrN0lNNGRyQ2ZMTk5hbkxU?=
 =?utf-8?B?QmJqdks2TzlKOGNGQ2dRYmE3ZmEzbWtsREJ1QXVCdFVqUWhPTExadzZHejcw?=
 =?utf-8?B?WGpvb2hMOWZsRGl6MU1KVmp1ZVhreFB2SDFBL3hMcXEveTFseHhJR3p0dTV0?=
 =?utf-8?B?dWJHUDZDcWdXRDJrL0VhcWxTWEZBdGZOK1dMcDZNSkxpdThMTVpqaGFQajJq?=
 =?utf-8?B?RGdqbE84YkNjV1V6aDlBTXI4b0gwWDFBbnF3SWFCQlRWUmQreVFGV0E2bFNM?=
 =?utf-8?B?c2pvWk83VzlnQUQ0VTVoSUlIRHRtRkptQlBURUNUMmNSK2d6YlhsMVJrUER1?=
 =?utf-8?B?azUwYzJTelRjN0Z6b0diY3Y3MllXZnFNZ00ybGNsRHd0eGlxRlR1K3RPMnNt?=
 =?utf-8?Q?DM2IGChhwoiTOFDE=3D?=
X-Exchange-RoutingPolicyChecked: bF5P0K7ojZxSPdgjoPiKCEmUKvFEOixmEml5RHcnWpB6XHE9PI1ELYG43/VPQ7xeVzr6f6qEfhK+HtHmqSkCDvj3/Q5p9L2QZ++WrENRhNABNJbaPFjcd+IjPWrz+L7gonBIkj5CC/DETNg3H8tbJqBspTAPMKKzZVSIIzZna0hO1jLt60+rjVx2iH0oT0eabG6YlKzzTyYXwJGcg4UNScOYsTXyfaGB/1s+N1qItG/Oju0zCXUKSo+LTTJsmCCq3jPFg1ESGuRZ47Edob/3agCvdMsmQPosYXb7HQYWRmMTzAvIHKoXQT61ES2EaVqTVscHEbsleZjquu3LNMcMww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85aa017f-fe77-4701-8dc5-08dee26ab4ec
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:06.4991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQxBXFyq3ABoEmLaCt0fd1OaEpB0AjiUhGjCIaDvn+4LYEJR3gr1Bkrgpf3XxYLVigVmm2oUXbcKiXS87gtegZ9fTnK9Rf2uy6MpKmc69sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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

Add drm/pciaccess-dependent stubs into a new igt_drm_stub.c.  This avoids
pulling libdrm into tools that only need dep-free logging and exit stubs.

The new lib_igt_drm_stub static sub-library provides: igt_pci_system_init,
is_i915_device, is_intel_device, xe_dev_id and __drm_open_driver.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 lib/igt_drm_stub.c | 125 +++++++++++++++++++++++++++++++++++++++++++++
 lib/meson.build    |   9 ++++
 2 files changed, 134 insertions(+)
 create mode 100644 lib/igt_drm_stub.c

diff --git a/lib/igt_drm_stub.c b/lib/igt_drm_stub.c
new file mode 100644
index 000000000..58395b329
--- /dev/null
+++ b/lib/igt_drm_stub.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/*
+ * Minimal DRM/PCI stubs for tools that need driver detection and device
+ * opening but do not link the full libigt.so. Requires libdrm and pciaccess.
+ *
+ * This reimplements a small subset of lib/drmtest.c (__drm_open_driver()),
+ * lib/igt_device.c (is_i915_device(), is_intel_device()) and
+ * lib/xe/xe_query.c (xe_dev_id()) so that tools can pull in just this
+ * static sub-library instead of the whole libigt.so stack.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <pciaccess.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <unistd.h>
+#include <xf86drm.h>
+
+#include "drmtest.h"
+
+int igt_pci_system_init(void)
+{
+	return pci_system_init();
+}
+
+static bool driver_name_matches(int fd, const char *name)
+{
+	drmVersionPtr version;
+	bool match = false;
+
+	version = drmGetVersion(fd);
+	if (!version)
+		return false;
+
+	match = version->name_len > 0 && !strcmp(version->name, name);
+	drmFreeVersion(version);
+
+	return match;
+}
+
+bool is_i915_device(int fd)
+{
+	return driver_name_matches(fd, "i915");
+}
+
+bool is_intel_device(int fd)
+{
+	return is_i915_device(fd) || driver_name_matches(fd, "xe");
+}
+
+static uint16_t read_pci_device_id(int fd)
+{
+	char path[PATH_MAX], buf[32];
+	struct stat st;
+	int sysfs, len;
+	unsigned int devid;
+
+	if (fstat(fd, &st) || !S_ISCHR(st.st_mode))
+		return 0;
+
+	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device/device",
+		 major(st.st_rdev), minor(st.st_rdev));
+	sysfs = open(path, O_RDONLY);
+	if (sysfs < 0)
+		return 0;
+
+	len = read(sysfs, buf, sizeof(buf) - 1);
+	close(sysfs);
+	if (len <= 0)
+		return 0;
+
+	buf[len] = '\0';
+	if (sscanf(buf, "0x%x", &devid) != 1)
+		return 0;
+
+	return devid;
+}
+
+/*
+ * Forward declaration required: xe_dev_id() is declared in the (heavy)
+ * lib/xe/xe_query.h, which this file intentionally does not include. The
+ * declaration below keeps -Wmissing-prototypes happy for the definition
+ * that follows.
+ */
+uint16_t xe_dev_id(int fd);
+uint16_t xe_dev_id(int fd)
+{
+	return read_pci_device_id(fd);
+}
+
+/* Maximum /dev/dri/card<N> minor number probed by __drm_open_driver(). */
+#define IGT_DRM_STUB_MAX_CARDS 16
+
+int __drm_open_driver(int chipset)
+{
+	char path[PATH_MAX];
+	int fd;
+
+	for (int i = 0; i < IGT_DRM_STUB_MAX_CARDS; i++) {
+		snprintf(path, sizeof(path), "/dev/dri/card%d", i);
+		fd = open(path, O_RDWR | O_CLOEXEC);
+		if (fd < 0)
+			continue;
+
+		if ((chipset == DRIVER_INTEL && is_i915_device(fd)) ||
+		    (chipset == DRIVER_XE && driver_name_matches(fd, "xe")) ||
+		    (chipset == DRIVER_ANY && is_intel_device(fd)))
+			return fd;
+
+		close(fd);
+	}
+
+	errno = ENODEV;
+	return -1;
+}
diff --git a/lib/meson.build b/lib/meson.build
index a57c1eb8d..484a912d7 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -356,6 +356,15 @@ lib_igt_tools_stub_build = static_library('igt_tools_stub',
 lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
 					include_directories : inc)
 
+lib_igt_drm_stub_build = static_library('igt_drm_stub',
+	['igt_drm_stub.c'],
+	dependencies : [libdrm, pciaccess],
+	include_directories : inc)
+
+lib_igt_drm_stub = declare_dependency(link_with : lib_igt_drm_stub_build,
+				      dependencies : [libdrm, pciaccess],
+				      include_directories : inc)
+
 scan_dep = [
 	glib,
 	libpci,
-- 
2.53.0

