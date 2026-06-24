Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAA5CDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9FF10EE16;
	Wed, 24 Jun 2026 08:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6wngao4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E2D10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290859; x=1813826859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sHXY23a8IRVxmYr/dWL3A450tO8Jt4sX/mIlYNB6Za4=;
 b=b6wngao4R//Trpdscd1LRhHf3/64oKI3WAhYSRkEnvbf4ODMQDtvLcXu
 COMgr4x6yNAWaPmHsu91RlvQ8Xr8M3RGqA706sGiETO7ZUu0oLdZq56oL
 CBn6cCOAyIhkgR+QrSrv5lChNrqUduZQsWRfTiY8D+KRnU+G25p9cyaTF
 MrvBz7IIbEifrSJw1tdC5ABcilpjMws9rPcKKwIvRRq9DyF8qSgcRx3SP
 jJZWAMnVvIsB346BpZ4CoAAJtL0CdAgPMyB61L55jhhafSNsRTj6P1LoG
 NW20mPsyKgQK0w2nfU9IYAbxVDYEbshz22mH7icL5u6jan3Yy+fh6kIf9 w==;
X-CSE-ConnectionGUID: ab9vZka9QHmYVsyofUkcfg==
X-CSE-MsgGUID: sVS46MZaQrqK4vlLPAK7pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105841223"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="105841223"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:39 -0700
X-CSE-ConnectionGUID: vs5ClJT6QfKKthDWKt1XIA==
X-CSE-MsgGUID: UirdMSPeTYuPcJrsVx2jZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="248880786"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:38 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8KDLCmH4v+nyh8iDqc+3IMq091Zt4cGInkkdjZUUDhZuImrs/jpPwasnHCD9Ib7qpJfCft7GfrAELSIcmg8BzLYBHWcPoxs0r2tWvCuClmQzOHMotrsT1WNhAUPsPfx0GOH1qRR7mMVabqvB7OupETky38L22053ci22J3YdXiIiwMXbRfklHEawZ4QSuA8xn+9UKiJUaZmwyPUSzJYhppNKzhrze8L5tx36B2p4c5L74/8NsSM7d9kZ7Z4N1W5aDnOkSlhzGWAIIlDQghsVkaRgyu2xR/bKO+z6ouQpaFBcqIwrln+ZHu9XehEe44VdrgUwK8j9Nl5zPcSLMjV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75zdtUx60VWHRpTJ/f79DoNRTDtnnK2fwVmYHzMsb9s=;
 b=d9/bfvcOCu7Xu1j0WaeRg4BGcM4Iyxk4yuPq++ri2UDduB/66ZPt69wRWl6/Mt+2IrXZ3XX0GaUvpUk73Drab2WXHXKJcMPx+S4zImOA4wzOmXlQyUAadgzpdFxsvluR1SzpTrVq3SndVr8qcvecyxSGYJv2AiCTLmNDoRSqrGq0QG1HmiLiCFdx5cMeRM24TUwydnGokTDCKxkmsvoJ2tLkWosm/WN9Fa97La35oLZnXti7OycalQY5u7OxC80ZTHCErDprT8V1OoO8t0Cp60R2nPhKnwn2jPNs0QrODfwGP46owQWpJmQRCnbj1QNGtBdRxfZTRYUvb6+bUEUGHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:30 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:30 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 06/25] lib: introduce lib_i915_decode static sub-library
 for tools
Date: Wed, 24 Jun 2026 10:47:13 +0200
Message-ID: <a866ccacb4c38ae836eecd4efdbe9b60dc8b040e.1782288071.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782288071.git.sebastian.brzezinka@intel.com>
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::28) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CH3PR11MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eec2591-88fe-4cee-d3dd-08ded1cd3995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 1rf2WRsPnA06u0UqmCer9HZ3y/M5bF8FAXrZ0r82867pg7vUs1fyBTuXQHO4JPSjkGNwLMtKP536B6IgUBve51YIEHk9C4TbVmdKgxCoFvjS1IfyacXzp2Pw24BGpl/Z8OKfhBJpaHDIucG2+i6pW8ZvTkZtNKupilEiO4ueoeJARemfBs6Ntiz4CO/m7o7SILG4eu+xVk0YcszAFP7utXM/y2WAdR09mKbJx53rB+//Zvxx1CZBbaDU7VExSoMo5d6C5N6i/v02xE19EactyzbMP0hIWCNyKRdX9eCmmUgoMIKbIvWOIhv+Ranrg+I5nrkffsuOit3dC40KTDxruF+VB3FQeOvLt+xnAgbhhMopM7LCDoZZo/XzI8NgIRQHVkPBEVlk/M7gB9lpRoZlo2rK1miQ1HA34t5fAFYQO+siwrBuzsTN3U7LDpnMktqBtfbXP3K8JnHB9VmGW6EcEI3Z3DwJ5JWWAhj4yyE0/umBCaD7g43LoMyqvhVZKrz2ssrHMwgOzLmcHXCnEhe4gxMZyhRv1t/GQZz/44Nf181+D7WBBqcmkAQWfr3HCDya3IPjosCaoeG/FtaAqGPy8fuxOSjqVXbKyros6XgXjGF9WyRwJSn4V8bB3oPASwPloEUxcm7UvErHZOCBQEXfL2wNyeEPUrK3eNBFPmtV4Ns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NlcSkx92IiUAuJ1AHHuUaukgaxLQZvrtM5qT5XqGCvN+A6Z1OpybZKyhHPRD?=
 =?us-ascii?Q?cbH0/2LJ1JDa2c5IAm5VQxcj3nsc+Bjtb5PTX8sjoQY0jkyBS1DbL7PARrf/?=
 =?us-ascii?Q?rgZi9eeYX4M8kIzITj+jAze39/okl0hIIBpUpqsnV7K7uan2Ast71a6i8a/q?=
 =?us-ascii?Q?DOoyO28IE91J4dDAdj7kJZQGW399ZmZeW3Wfj8ZzjZiwFvv8ggXF9J5YxDSg?=
 =?us-ascii?Q?P0DNTy1n5eSHlZjk2SOlKHpFOKCuoR4KvmNXK4QszeYHR4HoR4nnyXf4ZHIP?=
 =?us-ascii?Q?rAngW/0G7mUbr/JA7NC5CHhJatQpxnOqE7RUMOgyCQAeyd+xFuBmq0qJ/4ru?=
 =?us-ascii?Q?iX8lmmz8Sr0w8BHqs+qq0FHC5I6kePNrYxdodJgttT7/i78f4HGo1o0fD0gQ?=
 =?us-ascii?Q?LHT6ZiqqA7LZ2RUfbQYZOydIi4as98IXx1BYPciRI+xU2O3rCnIJGOfoACHL?=
 =?us-ascii?Q?LHcqS25dq1iHZnjyVC8jATHBXmlt/fDaZ7CXhbKAbt05c1rp4iZ8eRJdtCc/?=
 =?us-ascii?Q?efUGypnMBGvnPI6FX+Nqo8+WiSq4jqsEm49rPUNzXAhDhb3uKByIZr4x13i3?=
 =?us-ascii?Q?QcnxVf1nLhKPQNAhcIYBYd3OTz7SN9Qx5DRe/QrVI0qQmiiK6zRnck+D9gyw?=
 =?us-ascii?Q?vqvBCjagOaQn0Axy+U3Ckxaw3huOSlOC/NaFDe9csqGXy/rCMszfsWSzec2+?=
 =?us-ascii?Q?GFPY0QjDeGkleLl0G4PuquAJmZsQv46KFam0KXuSstdCRJHIhbjCmbqICIjy?=
 =?us-ascii?Q?lAGG+FL1LeE3SoLyTDsrTBKwP44Bx3LC6kEKpo8WhPWPFp6ed3DINdi7Z7UG?=
 =?us-ascii?Q?TqAD2x8l08T1UWSnsnFL/SPMZj+IIyJEnXPZ1dNVQ6nxFpbg/JOVJTHYZ8TB?=
 =?us-ascii?Q?EyWQ/wWEql+3Ye3SCtiSThus7Y0a55eG3rGY3Bg8vMtZl33K7yCJyQh7GbaY?=
 =?us-ascii?Q?0c8q7EExWdMqCNswvGcYkaYI1sM87KHTr5AxfRozhy1J5gK8uq+7iUtroRmo?=
 =?us-ascii?Q?7l+onOx75MmDpklZSER5U8WVeztxFOz+eUqouFCykUZ2HCtK0I+qnLDTddM9?=
 =?us-ascii?Q?8IsVZTygic1lu+fkTkuqKgHQ5Ra1lfr9gvH/EPKYatLFJbmsl1jm3rVCxhw7?=
 =?us-ascii?Q?iYlkCDtfXAzaf8wKnoHo6Nb0WKbpZfYgPtSaTJljJCh2oV4Z9+1WgpkWAugO?=
 =?us-ascii?Q?puw/KZN0H450N7b9kZPpEjjmvlbRRRgxUTxSewl9axJJM24FGMSFp/fnpTKv?=
 =?us-ascii?Q?+qaFfXF++9QO0nOuq7+5noODoBE0Y9bqT1jM6mMAkwUC4c4Ba3OQFOEFVDw+?=
 =?us-ascii?Q?UbP4rgpivDr651BhbfYvFcIovQ4PuhAVhLFNJ5tuVWUDZA5zp1NQQSfLJaPX?=
 =?us-ascii?Q?XtSfLvwqQywqS3muLtAPxHsnyrSZDXthgC4ArlRAXG4jv70GcWydx8U57pfM?=
 =?us-ascii?Q?TcWyysmKBole/SkWJDp4WBmN3W3cMpyj9mK10U5705dRbssQ4/oN4Qz6hHP1?=
 =?us-ascii?Q?Kt1W55klI4hPfvSEHsqJioHI0nOxEaVB4LWNegibYfFBmrAdc20OSoIjMmB9?=
 =?us-ascii?Q?QKbVfL8f31LyVVjLt51XoTj6vN2dayitndcSlxNXTXn0JV3RXO7SshHx/wpr?=
 =?us-ascii?Q?HgpehuvfP83qp0Ii1cNlbqp38Hg9usfbQIoPfTW5jdbvT5NzINd/o4gM46d7?=
 =?us-ascii?Q?tKnlTZvGiMbRXg04rpCcAwxcqnmsVheK6Uv+1bHmBYgXtxT1hn5A8287OlSx?=
 =?us-ascii?Q?CSZrENXsCN3NgeXYdVLwd5A7ExpWJxE=3D?=
X-Exchange-RoutingPolicyChecked: erGYxfBFSVc/ZZ4vVCuYRiWu4yXYjPuYBxdbyoS7LBeQlR4cx3KiwQp5Jx7DY6AxQr1H+26vehG9eWc4jZfjY+1R3Qjc00ly9DkV30a23zhxdURbwz9ldurbDBFX9MzmQ8WFNs7Y1/+ARI8jjnDhwmwlx/qSmHI4DLAJ7UqOPxb0XIrC931H/lytx2HU1YAZmGNaTko+GYXbxzEaiFge1GwkEkXeCQLcya/QYs1HL2D2Z3AQ03R+Jce/A7vnjVzqTkKPojF3yK0fBEOxjhna57omPD77qYZXbsdnAzv/3d0uRfNclfvb6KQJbrJRlTDvniQPw6N+jpqUqQkuM4Dpzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eec2591-88fe-4cee-d3dd-08ded1cd3995
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:30.0401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYmdRTDuv+MG9ySye9yjFtnvOzhWDUGHzCQIBYMy7psOL5of0X8nuzKrqYy/nJEZ7GeEHx5oJld6oO9tl5E5Kd5iJfhQ53kygk/HHp0tJgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8776
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

Add lib_i915_decode built from i915/intel_decode.c and instdone.c.
This lets tools like intel_error_decode link only the decode logic
without pulling in the full libigt.so.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/meson.build | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 299acae7f..cced7b260 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -422,6 +422,18 @@ lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
 				       dependencies : [math],
 				       include_directories : inc)
 
+lib_i915_decode_build = static_library('i915_decode',
+	['i915/intel_decode.c',
+	 'instdone.c',
+	],
+	dependencies : [lib_igt_chipset],
+	include_directories : inc)
+
+lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
+				     dependencies : [lib_igt_chipset,
+				                     lib_igt_tools_stub],
+				     include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

