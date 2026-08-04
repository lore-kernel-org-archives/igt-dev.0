Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEDDC55172
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 10:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF1210E66A;
	Tue,  4 Aug 2026 10:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sg9/nmwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869DD10E150
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785839320; x=1817375320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XIRAv/6JcjAZRn0HTehRb5zlb2dYk+ePoFYjQMPnXOE=;
 b=Sg9/nmwTj5bUfjDhZKTcydhlq46mE3C82yKtt4hH05dvAesm6DhB96QB
 TAgrAx8LXpS4RFgg331pMndcChOnvjhh4g8U/4TE3DGgO4MDvddNa5wnF
 MfQcpjyPJAGJ+JdxaIrGRQBlr/6ruIvx0Cc3dmK0gSCcXZyVlpq3OmEcG
 zAQzsT0JFQvv61dfG/1yBpBjo+1cqG36VQmCj8QPNCW/omNQFruDuNi7m
 zbTIlBJGc1YDhQZ/JhZwWepGgnuDK5pzRrjek9fNhmXYzTm1AfVT0svAu
 G9+DAc+GXfGc9X0QPJa19CV8qz0lLHMaFTH6gsrHVOr+u5zCXNmi9aSNl w==;
X-CSE-ConnectionGUID: h7ZitIv3SdS45+I5Ud3utw==
X-CSE-MsgGUID: IeUpbeZXSQaYSu38+vsuSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86156954"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86156954"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 03:28:40 -0700
X-CSE-ConnectionGUID: gHm7/DwNQOm2Y2o95mHEfQ==
X-CSE-MsgGUID: JVo6bwr5RsWoQFoG6JUdng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="260229529"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 03:28:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 03:28:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 03:28:39 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 03:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiKUBVTA3w7lDNwmkif2nOKgbNMsHAnqYN438jzNfH6CS8PPAoj6/dCiZiLrqRogEW28COM3soRtbV3/iUy+QOMBtSNu0qfEWQnik3BB7wQ6rXiEiEVtTfUNoVpu1F6kQUoidHUDZagnsvLMdxwwStAFuXkATJxBMHqhErhFLx71tIB5o+0NgtTPoMfNyLmqOMnP0xcljH74boi16JAEWsGeLo59BBPMnQ2M6ipcxQH1ca+s/nDGbUSLGroKp/GJEYPeHNq3rs8kzR7d+8c6uQ/2thxDLuu0QgXcWowW/RdEhZlqxplyVmk5HmikiGQEoxuFe4pv5vwX/kjK1s2LAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufAjhXa8gOiJpASlYBVJX467XCc2OJnBj52unGAVvFk=;
 b=fLEyO51UJUlt7by1Yw13jpb0OkcinTGPbJU3X4WmxbXbk1lAzMy3KZpDdlnTSGp9lcGkSW68mzgR+IbzKX82tfYzLkz7n9Ft0vaF2ta9GT13buZJtA4HCQtqj9HgX1M8Xx6ydjnBsQvIbyw1Q3bY8+5cL8MZGLsrSPEahkG68984HI10MoxMmg5sY9pRvNtuC8kFe+BoZqBRQSBE8YRQZM2PwYcOTMwFgo1QXqoUSUQgbmtsFQWCNjIhkkJgGDdOM3g/dW+Oxb/VrqQdiDcZGkLVoTE0hU/GrS2ITjX+x65kh8Ze756Q5qCGsjI6g9m2uR1Ueq87IYRu68lBiMJFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA4PR11MB9230.namprd11.prod.outlook.com (2603:10b6:208:567::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 10:28:37 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.015; Tue, 4 Aug 2026
 10:28:37 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v5 1/2] lib/igt_core: move igt_load_igtrc to igt_rc
Date: Tue, 4 Aug 2026 12:29:48 +0200
Message-ID: <20260804102950.20892-2-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804102950.20892-1-sebastian.brzezinka@intel.com>
References: <20260804102950.20892-1-sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2P250CA0030.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::35) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA4PR11MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe5fa9e-d06a-4227-d0ce-08def21324ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 3P3syZLBZ3GV61654vxQ7mpG5ZGFW2Vu0nlSG8umN9An7sHPq2nVPxlSmMm4vhFs73uoQ1+8d83g7R13z++l5j4KEr5Jtoc5L4ANDDMdcAMfMbw7//rLAE1i8AvagGl1L0r+AOXqSvOyvhVeoozuWn2EH7OPkgcwfw2VlIJzjQM2+gATy7LsIoDeVEalf1AgTJeko4WzfPkUzWWPjJOOe1BWZh21xEO8IcSwfyAywosStpnyusiXPTI/RRAeKYkfidTFLluIBX9y7a6qJEGIbLtc2LBAY6gP01PkYpQQSmQsLRZXWRC6AwcXG1HssBzIVJSzdITFCyEJW/DSJWRZJ+LUtGatx4SMQQM4g8CWv98WiwSKO9p/zsXA8Ef+r7har5Hwgw81uUpNEi3v4yrOmsVjdpCEejfEF8Y56wBojvVS45JQXYXWEX57sFjis8wYR+CYlZzWukOkcLZfm5+nmGnSrZRg/xavfXt3hpB/PLPo4HaUR6gh+geF6ukXIBBDcOmp6LweIj2ioa24h276DnEjZTiarLjjlidi1/9Sog5mct809RMMW70pF36PNusKLeyJ8Cdny6EqyVgAJ8Q1d66qsYUlAlJ6Q86v0hj8td5SMksOt5BuCDA7vKZ3BV/xrkgsoRSD5NtVKCP9wbnA/jL/zczrmDcqZWASOVW/SnA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnpDN0VXLzNJMHhIQTgwNHR1VWZ5Zmp0b1FsQVlVV25EenVmczNkbk5zbndn?=
 =?utf-8?B?SnJUM3M2OHlNWi83VVJqeTA5VnJ0Yk9aWUpZRE1QVDJLOCtqOGcvSGdETHdo?=
 =?utf-8?B?RVRTa0NYa1NFck1zbjdRODNjdWNPMTUwaThEQitLbjZNWndKOStsaStaNGYw?=
 =?utf-8?B?ZXFxY0RKbDBiTTJyUmpmK0ZEeGJ2NEdKZ2hMWUxlbDVWbWNIQWtyQndlTnk4?=
 =?utf-8?B?YXJveHlRYnkvVzVaMDl2WENUR0x2UmJsM0tjaktuQmdjdE0xdlZGclFRRGJ6?=
 =?utf-8?B?NnpGaUxDR015S1VYM0s0T29CdFZ3QXRDNG84RThyenRmaE5JZFdOWFNUYnEz?=
 =?utf-8?B?cDhZMzlLQXFkRy9GcHN0V201Vk9nS0xwa1g0ODhXN3ZsRmxLYit6N0VXNE9x?=
 =?utf-8?B?c3ZqYjNtb2hrYUNkM3FzYjBRQk0wbEpsamZKZEo1RXJtaTgydE8xVWhyNUdI?=
 =?utf-8?B?aGttb0FxMnFzZkpwa29sSzBNZlZVN3p3ZkVSWVNiaTdOOGhNMlo3dWQ2SE1a?=
 =?utf-8?B?Ukl1SVpCalEreDhJZWhoVFl0WnM1NzlKVmJFa2xXMm44WWJ1UE5tc1hsUUpJ?=
 =?utf-8?B?c203aG84QWVzUEJDdlZZZU9SWmwwQWVwVlNSaTd3Zjl6dFYvYXpkb3ErTEVV?=
 =?utf-8?B?S3oxOFFrWDRqSnpKRSt2SDhQSU9CeVNxb2xlQ01HUHF1ODVHWTRXS3NDR2Vr?=
 =?utf-8?B?eXRldDUrQk5jQlc4N1hPTktxTUVlb1krZWZtZ21zUUYrcDVQQTZrNzJ0RnVU?=
 =?utf-8?B?QmRNY0ZBVEUvMVBmNURNVUpIOFJWaE5KY3p1TjJITkFiMGxybHlXMjZaVG90?=
 =?utf-8?B?dSsrNG1EMDhpMWdnSmxuZFQ4eTFaNEl3N0JXclFSUFJVWk9UR0sveDNVYWlY?=
 =?utf-8?B?QUJuWGxxcUd6RGY5RzRRMzlKUFlDVzNuWnBYRmpieFpyTm5KSDdxRml6cnNm?=
 =?utf-8?B?dGRBdHJORk9raWFGR1Vrb3c3NlJPRStCYjZpQUJwSk93eUxNZXY5dXZOUEhM?=
 =?utf-8?B?cDBCOFd1amt1SzNDaGtPdWxzQUNzWGNTYXRRK0J6OVNFeEJvMVJBRm0wVTcz?=
 =?utf-8?B?UUhpRzFobEZXK2ZYU0k1b0ptOTc3YVl2eEJsNTNFNm03ajVqVFNpZGVxV2Y4?=
 =?utf-8?B?a2JIR1pPaDc1cDU0WmRmVW9SelpNMTlyQlc0VXMxd0tYMmhEdnJ3c0pqb0Jm?=
 =?utf-8?B?dzkvRE1rL0ZLQ0lLc0pvaXFDZnNnYzQ3ckxZcVNDZ1h4Umc1d2l2ZVpzd1NH?=
 =?utf-8?B?bVNscDdkZ3l1aExwTDVvWXd6VE0vR3pDc0xqbzNjajE0QUdpd1N2MTByNzBv?=
 =?utf-8?B?VDMzZENQbUxHSUlXenR1UWYzSU5HSUNrdU9PMmZLeGdkd3VxMGlJZlJObXBr?=
 =?utf-8?B?MGM1VUdsQldEdE04Y2VJZEI4Um1tbGV3OHFtdGd3TFNUVkJnR0w2MFNyZXlr?=
 =?utf-8?B?WDd6OWNkY2J2dkFDTU5TRVY4SE5IT1U4b0lSZDd5SkNGSUlxN3YwV3pwayta?=
 =?utf-8?B?NEd1c1k2RVh0Z1ZTSWZQSFlDTU1UOWl0NUZXMjB5dXN1c0pVRXVVK0xGY1lB?=
 =?utf-8?B?Nm1DN1NQUW0yeUJRL0JwYm5iVTJ0aGhvK3ZLcWsrTjB1NDlBYlRmb3hNcGlz?=
 =?utf-8?B?eTJ0OE5hbDR2UGJFOEl5K00yT0xsL0J2dTJYT2RYa0hranJ3Q0JyWnRsaXZi?=
 =?utf-8?B?MzdRZ2dzMUQ5ejZNaVhySlBmRlQ1NGlKcnhXajlRQVY1ZmUvMmVBaXRieHFI?=
 =?utf-8?B?eDFEc2VtSEFxTmlnc0VXR05GVnJGMEFkdlgzTmJic29haWtTTC9Ia2ZCSFYv?=
 =?utf-8?B?OHNyOUEybUx4NHk3QkRZYUtGWjM1aTc1eWhIazdBdzN3VDJkZGxmWTVnbEpy?=
 =?utf-8?B?MnZsNGpObVcvSjNKUzljQklUUTUzSVNxZ21qRi9WY2VKL0liOVBWVmRILytm?=
 =?utf-8?B?TzV4V2NIWGJiaHRxMktBUlRKVC9BazBSQkhFbXg0TDJiODgxVC9uTEtHakpu?=
 =?utf-8?B?VklPWmNVTi9SNFBYaGVMN0tEaWNjNmJXTmJ2THBVczNDSHFESzFnNHhCS3lB?=
 =?utf-8?B?S3dSVVpGM09xa1FrU3dvUVNoVzhsRkN6SzRvL3VYZzF1ZWc5dzJMTkRxeStj?=
 =?utf-8?B?VUQ0V21VVXUxbmlSSWdQcUdtdUNPNzBTOVhZOEp5SkNlM0hzTFc2a0t3ejdP?=
 =?utf-8?B?YXZ5VVRFVk1GU2tXdDhneHYrdS9xT1NjanYwUld5UitoWWFKSkJ5VnBmeVpm?=
 =?utf-8?B?NXdieXE2ei9ScDQyaUVJUlNDenVIMWtuclM4c09jZ3ZzOFg4cEROYjZJM0FZ?=
 =?utf-8?B?azI3bEtxTnBRU1lLbS9UOENHWWRiM2licHBDR2h0SndTTmZQVUtNbjdSVXFB?=
 =?utf-8?Q?HH/AYiWUJP/c3brk=3D?=
X-Exchange-RoutingPolicyChecked: Tp5vfKQY9uGcquKUKHF+B9GmuzSKSRkkXraw9NXbUZmRfbkuR4YG/4yUnTGlnHJ+gb1cc0FGr8q53gK96T9WWDhbFa1AOlwBKz8nDkS0pNEsJhEoW6v7haNPz5Oj8xzeHqBtfw0/mB+TIQnj60CY6i2Ubx7DjaaF8fyx8wDgaobASRYEReCyJ4aXD/3UL+Meg49fuExgy9M2D9Cbr32GrS53+8bB3tLtXqNg389lLN1ZCahlfp7Vh8YJJyO2h6quVjpjdFl617ui6KrfgFPbl8y6nBw67mH+Tu4D284J9CJugyaQjvhBF6PhAUv4YAdVchkw7Tl97q3W4QZOtcaEVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe5fa9e-d06a-4227-d0ce-08def21324ce
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:28:37.0649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcfWuwzt8Bj5cHdVrQlyRjxMG8hhpBwySZyJGsrM4bh/WQUNNsIBJbsh34EuU96QpyTNMl2/0xKtCSPzB6RfJhm0UtJUv2haSy6PmXr8INU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9230
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

igt_load_igtrc() reads device configuration from the igtrc file and
is used by igt_core, igt_chamelium(_stream), the runner and lsgpu.
The associated global, igt_key_file, is already declared in lib/igt_rc.h,
so move the loader implementation there too instead of igt_core.c.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/igt_core.c    | 47 -----------------------------------
 lib/igt_core.h    |  2 --
 lib/igt_rc.c      | 62 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_rc.h      |  2 ++
 lib/meson.build   |  4 ++-
 runner/executor.c |  1 +
 tools/lsgpu.c     |  1 +
 7 files changed, 69 insertions(+), 50 deletions(-)
 create mode 100644 lib/igt_rc.c

diff --git a/lib/igt_core.c b/lib/igt_core.c
index a7c097d9e..2f737b01a 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -972,53 +972,6 @@ static void oom_adjust_for_doom(void)
 
 }
 
-/**
- * load_igtrc:
- *
- * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
- * home directory if that is not set. The returned keyfile needs to be
- * deallocated using g_key_file_free().
- *
- * Returns: Pointer to the keyfile, NULL on error.
- */
-GKeyFile *igt_load_igtrc(void)
-{
-	char *key_file_env = NULL;
-	char *key_file_loc = NULL;
-	GError *error = NULL;
-	GKeyFile *file;
-	int ret;
-
-	/* Determine igt config path */
-	key_file_env = getenv("IGT_CONFIG_PATH");
-	if (key_file_env) {
-		key_file_loc = key_file_env;
-	} else {
-		key_file_loc = malloc(100);
-		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
-	}
-
-	/* Load igt config file */
-	file = g_key_file_new();
-	ret = g_key_file_load_from_file(file, key_file_loc,
-					G_KEY_FILE_NONE, &error);
-	if (!ret) {
-		g_error_free(error);
-		g_key_file_free(file);
-		file = NULL;
-
-		goto out;
-	}
-
-	g_clear_error(&error);
-
- out:
-	if (!key_file_env && key_file_loc)
-		free(key_file_loc);
-
-	return file;
-}
-
 static void common_init_config(void)
 {
 	GError *error = NULL;
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 3337293bc..afaf35aa8 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -95,8 +95,6 @@ extern const char* __igt_test_description __attribute__((weak));
 extern bool __igt_plain_output;
 extern char *igt_frame_dump_path;
 
-struct _GKeyFile *igt_load_igtrc(void);
-
 /**
  * IGT_TEST_DESCRIPTION:
  * @str: description string
diff --git a/lib/igt_rc.c b/lib/igt_rc.c
new file mode 100644
index 000000000..b7f1731fe
--- /dev/null
+++ b/lib/igt_rc.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#ifndef ANDROID
+#include <glib.h>
+#else
+#include "android/glib.h"
+#endif
+
+#include "igt_rc.h"
+
+/**
+ * igt_load_igtrc:
+ *
+ * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
+ * home directory if that is not set. The returned keyfile needs to be
+ * deallocated using g_key_file_free().
+ *
+ * Returns: Pointer to the keyfile, NULL on error.
+ */
+GKeyFile *igt_load_igtrc(void)
+{
+	char *key_file_env = NULL;
+	char *key_file_loc = NULL;
+	GError *error = NULL;
+	GKeyFile *file;
+	int ret;
+
+	/* Determine igt config path */
+	key_file_env = getenv("IGT_CONFIG_PATH");
+	if (key_file_env) {
+		key_file_loc = key_file_env;
+	} else {
+		key_file_loc = malloc(100);
+		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
+	}
+
+	/* Load igt config file */
+	file = g_key_file_new();
+	ret = g_key_file_load_from_file(file, key_file_loc,
+					G_KEY_FILE_NONE, &error);
+	if (!ret) {
+		g_error_free(error);
+		g_key_file_free(file);
+		file = NULL;
+
+		goto out;
+	}
+
+	g_clear_error(&error);
+
+ out:
+	if (!key_file_env && key_file_loc)
+		free(key_file_loc);
+
+	return file;
+}
diff --git a/lib/igt_rc.h b/lib/igt_rc.h
index d871b3b26..3b7179808 100644
--- a/lib/igt_rc.h
+++ b/lib/igt_rc.h
@@ -33,4 +33,6 @@
 
 extern GKeyFile *igt_key_file;
 
+struct _GKeyFile *igt_load_igtrc(void);
+
 #endif /* IGT_RC_H */
diff --git a/lib/meson.build b/lib/meson.build
index 3001b473e..484cd4a55 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -37,6 +37,7 @@ lib_sources = [
 	'igt_os.c',
 	'igt_params.c',
 	'igt_perf.c',
+	'igt_rc.c',
 	'igt_pipe_crc.c',
 	'igt_power.c',
 	'igt_primes.c',
@@ -436,8 +437,9 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
 	'igt_map.c',
 	'intel_device_info.c',
 	'intel_cmds_info.c',
+	'igt_rc.c',
 	],
-	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub],
+	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub, glib],
 	include_directories : inc)
 
 lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
diff --git a/runner/executor.c b/runner/executor.c
index a8907c575..1592feee2 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -36,6 +36,7 @@
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_facts.h"
+#include "igt_rc.h"
 #include "igt_taints.h"
 #include "igt_vec.h"
 #include "executor.h"
diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 935371dea..3f8444187 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -36,6 +36,7 @@
 
 #include "igt.h"
 #include "igt_device_scan.h"
+#include "igt_rc.h"
 
 /**
  * SECTION:lsgpu
-- 
2.53.0

