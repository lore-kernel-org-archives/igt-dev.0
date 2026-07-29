Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623C7C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1572410E631;
	Wed, 29 Jul 2026 11:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCahdDTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A184310E4F9
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322972; x=1816858972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RYwkAuroT0MU8k4nf8MifH1EsdY0jKyZMjTPdrUmjKk=;
 b=ZCahdDTCHGEJCEmzkmbP/mMEzYbIv/UaFR5mvUb/BKUlfflGeOf1TD5X
 Q+ROZptOSAh+d1Lzfy+/0gR65wghSK/Di+CRfZFvbF/mBBJmo6oSZ4ZOq
 A96UR2WreOcCcOrrO04gbc8v9PF/5Kuh/EJmA0I4BdwfUzTKZTCnvLTKs
 Zqt/13kupZk/HnsiQhCkeWpZzGeOOw3Kn7Ec+W4OF2StR3z68SMUm6Wkp
 7Q9Z6dJ+YhCkoTXxJR7pzgtNpzr3quOwh/Klln3YOX2HDW4vKTuLsIiUZ
 yLkhtUAd00/RRN0TyGqKWCLMicIY611i86oJHXaffwthk7+XhurCDsOEt Q==;
X-CSE-ConnectionGUID: IkcR+9HYRD2f3Pr11hiwxQ==
X-CSE-MsgGUID: CDGNinVLQZaAqV/jD9Gvrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85797543"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85797543"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:02:52 -0700
X-CSE-ConnectionGUID: Cnhtb711RpmtY4A2i6ndrQ==
X-CSE-MsgGUID: PIZhy+nSQmmE1hqn5yM4Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="264264015"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:02:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:02:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:02:51 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rORg8hbkJgLgYRGnjIbHeL+wHZsk04prc8ZWMnpbo7otCVZSUihyTfhNXmdhvpsw59ID7tsfZzcHyC0MJJ/xdkTjLNm/vsgZE1VllBpQpKjKgN93mUj3MOUeljc2BnOSCfncuaYpDmh83KZ100eG5XqhzZ1qcxg46RNcC5WCOKeYwfCgJi4MecMafBTb+9jx3Fyq0V5q+YmJQv3tnMYArIEMT+9p/pu92EOrmZ5zCEiLwxUzbg/lTasL/qWqlQiL6yl2njuAAoTYJd5KL6jCI4/FHuTfxKQ9ddUaMxQ52tfjvBnBiNsVKnLgtkwMiBhqEF1/ZNBy3xgPgb0MVZz57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4qP/q8go7wp0EM5LNLWq6gsb7w09WSDTlZ+KbDgF3c=;
 b=qpgr/eufgGWRIofHJ3003WNmxtpNuiYQGjxm2zkJAs4fqX1Uqu2AyQuKsVMVgL684ftTejyhJ8AuU543xk5P53G1TgDpuL9UQdAbaqI33Jfvis9dpx3nUd23l7Ym2GCuHAx5R1BhILxBXtH/aAbCbNNMQwRMxZ+ZuFrXWs6wPBe6/WPap5U2QAdz+13Tebk9EnfZsr4e5uyw2lq8TQv2anY9ESDfukEdHYFtpM+MNv69YfrgLGnYRkROFXaazFYhk6zV1n+7/vbhOuDaHpvNUX7dP5Ym6Ea0QHjPhDdueO5LofC4iNcVc3uqP3HUUSwNapZ3h5S39PvOqQaX1Ipmqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 29 Jul
 2026 11:02:46 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:02:46 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 01/31] lib/igt_tools_stub: introduce static
 sub-library for tools
Date: Wed, 29 Jul 2026 13:03:18 +0200
Message-ID: <6cd55f6efb0ea8e6dce0a66de140a2010100dbbb.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785152675.git.sebastian.brzezinka@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: b04696db-4e68-40a3-97bc-08deed60eb81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|10067099003|6133799003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: szWcg+fOUpdeqwa6UvtmXi9+dEBSl3WhyghI1hnakKy+rnYRWKqzmKRhiC3bk4WZAHLator12WaW6DW5DB9y4hYQu9G8gQAWoDbnVSCzSUjO8cfnCVIqHhq8tIycPOhaLUNgleR9xKL6w/M33KLPJ0HxswTeIYLJQvW26CLjnw7dimvq1cFJIm221IArs01yxbgzKucAtu/Zsp/vXx2SzxR1hR/11UJUSt4BergwQJEIxSa5MMMnhbNMCkub3scvnOUKPjelmT3Ebqy8LK3+uVk5DdFgPgty05xnRmLUcZF22tC1mp5Km7YbX7YavkTNCrj52+79jiu6qsQLHqoCr+1nHCAghqOqt8Z7EnrmqeUZ6FRa7SRxlH9NWmqMAZINkrn0INvvGVMvofG3MNQ7bRdZvKVqlPqf185oHPu9iwDPfIUe8kBnevmNLSNgFP150rhXOnN/hCnrI/39nN6AodHGOLL3ERoP7evivBM8i57/0G8tgJbmrOJV2v+X62LkSFjtdqQiDhMPU62b3sOeqv7+FaFZkyC0ZQE8h69auRkCthnKV+mud+eH0l332Yl55y0E6/BOpOrxh+kU4lMCcPmtm8zlma3poGma8Ict5749NW++hEGEs+Clk0Rd7wbwt0nsDuyN0N75Pg5nwnlmM1wTV+/DizAwK0M9nDbyS6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZqBp96vkLkmLd2IGVJMSDENrTUls24Onq0GehgcihrRuZBNa5r0cKxJdr/1y?=
 =?us-ascii?Q?5+Vdz1z2BMYP+xmOCKs1uIVR6YULR7J6LYcTKwviPudCIq571FnwhqQkv+p6?=
 =?us-ascii?Q?owe/w2M/WZ3iQ9VbjeDA/6amM1C9PlpUR31CvGA4JiBYvQSINFBPBb70tB9j?=
 =?us-ascii?Q?Hz2ENLl7NPVTycYHXKXT1+KijySFlS3zbIQ7hJ9IS+aunwfiP+LGF02w4FWN?=
 =?us-ascii?Q?xJxGfzL6dw4moloxsjUD+7cc6HbkNwcGtaNSZkmPjJ54jD8RipZLeU3ibO+j?=
 =?us-ascii?Q?S8awPprK2+LQSVwImgClWJpA2nn3O4zHyfmFcu97VT9x9GjxHTe/cKR1SSUM?=
 =?us-ascii?Q?i6RmbLKi+hoPa7K+/FOXs+obV8l0yOe0zCUaY30A6HLMSc8lpqOGM1gFI9Pg?=
 =?us-ascii?Q?K2ZbiAQAF9Dr0SV5olz76jhBe4Orfz3wPKh0e+EpGQNQs1T5EeWLmOzzT9iP?=
 =?us-ascii?Q?iJRlhncbID+mqgPCYHWJkG1R3kR9A4Qacio2EIUQjEyJf53icf8hZrkHojzl?=
 =?us-ascii?Q?b7b7SNgyIzKZ5yPFecnfrv7CKW6Pbh9xoivpMiMBGlKzyFwn0+1H5w/mN7we?=
 =?us-ascii?Q?4xi54E62OOFHRycLBgfGJNzaV0qh0x6syJoRK+Fiv/2RSt1sNzjgDVTe4MNj?=
 =?us-ascii?Q?hp9SY+Y+Jwc+TruJIUmXXuc/4MFWamMY8LYqBbWaSsxUHNhIIDs8nmF327G8?=
 =?us-ascii?Q?Yl9expHSR+JpkRef70cY5DhS2xKg+6y3RQkg7faiAh84LASqleoxMmDo6YW3?=
 =?us-ascii?Q?Y/ZjE0xKDQHjDLse+Cbn0TCStq1aN5WSGidzEB9M7/7DDC2h9tk7XsSKfIxC?=
 =?us-ascii?Q?al8084npCjDlCkHls4MucvvoUqjwCDKqgmTb6ZVcEEeMwfH+nSKTD7ZESsdO?=
 =?us-ascii?Q?vMaaI3Mes0PzF0sxpGw5oQxKcUyP5G47jG1N4CknCsgZEJ3PksVVMG/0JQ1w?=
 =?us-ascii?Q?Ikg+VlIriGk1+pPK2U+BHBzSndmrFlC5MCc9wL1+EOQqDXNb+cABz/xQbzGN?=
 =?us-ascii?Q?BY6lnWjzSrUDuTHPjxQWnfsR/khDqp0nKoGB9R2F1G6mfVIZtpAu42Q1jxiI?=
 =?us-ascii?Q?V4sBIpB2/79ZY0SLeinKjHvEj+6udJ2NyCoOoxwFbXcyofhBNSbfWhBN8pYf?=
 =?us-ascii?Q?1uui1rt177vmiqORwthI8oAzeJiVagurAqHG3OQygQhtL4wv7kQK2fAUSrRs?=
 =?us-ascii?Q?/DrvNBY245YArCmH2pwX9NFF9wSPtps3MV2d33/BQSqyQvXOihpUaaJnH23O?=
 =?us-ascii?Q?6NIaLbqHcU2DXrimqby7DIaLZm4P++dfAQH6r+KJsW1b5fWgDxjy6ULmLqZ2?=
 =?us-ascii?Q?d/Is3tsu3j44lcEVMYlOtNu2dOnt5ZETmoR3YCrmTXwLX9k3eie0OA/Le0ef?=
 =?us-ascii?Q?Iul8yt/AGWXgRfEC64gl1uwpfsThs+xMbgTEDccrXQq9ay5Gg3dXUU5BGz6i?=
 =?us-ascii?Q?amPMIporeGA9f6hUZGFHRDIDDqKTzX01pzxlLWqBtCBO4XLeBJ8CIT8zKOif?=
 =?us-ascii?Q?OpRE9DR/3MylaogLEKDRSLOkEEBe8d8n95Vsb5LHqaiILDeFtYacelzhnw/l?=
 =?us-ascii?Q?pml7LgdPJwbFeGbsP236aAObYs5EeQH4rLKxdzTflCZv0qYKDdMWZtBGnxw1?=
 =?us-ascii?Q?zpbgqObQIgBXT/GLMCGkFKTRHG4WzMd7k97YjmacQGy8QQ5ftiGkTtf8NLji?=
 =?us-ascii?Q?2l0w+OgyKsPtF+iLH6Hi0BvuotfO9KAi+Q41KGhUDh9CgWFBVa9ZXaGn9AGD?=
 =?us-ascii?Q?HijvS8uAuZKaq87ZGUzbgL4VOpuOhpE=3D?=
X-Exchange-RoutingPolicyChecked: cdwmWfKlNEzXZvijg32OWg7fvuV4bhbcLa3S9Y8CCuy9yEWwdlJ6wMny/giXTXITM7OaL0jkJ1rFUicCu2LuxYPXGZiiaHjAI4wUHWKVDpBTXfrXaO682goPrlKnYEtiU9X34IpH285etk+oYWibgoQNihQlWql7DH2p2OOnTS35ydHjJ3hzMCAwz7cq3AOetP8QAXLMTG4g5FK1Nh/uBrwC91ABUNmF2a0oLy3ShU9p+4ygxqquPnEmPGMmDbrZVg/pnVLPoeEMBVZY4mYZUhXy+qpw7od1ymHndcOMqEzQVm5J/bfCiVh6e/F8EL+M/BXHJjweAI/qP/eNqOvmeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b04696db-4e68-40a3-97bc-08deed60eb81
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:02:46.0169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iMb6uXNubC49cLKsDCUP+jp15C5bYt+G9OmegAAY2gp2dxzYeF17wptK/IEeVJHvavtEC7LDLYPnlpFx9JOflJfaEuVO87LhQC1x+uu8LY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
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

Add lib_igt_tools_stub built from igt_tools_stub.c. Tools that need
minimal IGT assert/logging stubs can link this without pulling in the
full libigt.so stack.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/meson.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index d1289a5e0..e95b29d49 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -349,6 +349,13 @@ lib_igt_perf_build = static_library('igt_perf',
 lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
 				  include_directories : inc)
 
+lib_igt_tools_stub_build = static_library('igt_tools_stub',
+	['igt_tools_stub.c'],
+	include_directories : inc)
+
+lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
+					include_directories : inc)
+
 scan_dep = [
 	glib,
 	libpci,
-- 
2.53.0

