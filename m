Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B34CDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518DA10E070;
	Wed, 24 Jun 2026 08:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9DSLPfP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5A910E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290873; x=1813826873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QFMWWP1mjDJOAmzcDq/ZF/X65HyH0DAGFBxIimLUNoY=;
 b=V9DSLPfPuEEvx6GdVAmh7z9Gt3wrZNo8AAxrp6tjGwI5layEuoCWzu0F
 lbpxSqIZdUNGcOjAWjtYI14TpzhmN1iSrKJ5e/bJxFZ3iUknC9CScXdfm
 rFlvYlqM3mNmtEIowUPttu4GNDYWUqNUyL2qK3rTCsOPh/Qf4r/bomrC4
 WvbNi598T/dvuJbT8Ghsrz9varJUndfL7CM/mhET1STrD3UDO+5eUMX86
 1U8xTUpDpwDe3BwpQbDGhD4XYJ6sZkFRNhZrrgKKLb47GJKGOSmKDI2UV
 LESGMDOuvsK9cNaUy95Io8W7I00gE04RGjJVe+1A/zHDQSfL8OL6U+xDU A==;
X-CSE-ConnectionGUID: O7esi+g3RxqRtgteS91M9Q==
X-CSE-MsgGUID: zwKcehlnSSiAp7n+EzMEnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142269"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142269"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:53 -0700
X-CSE-ConnectionGUID: Yoe9xyG+Rxi7PWSG0AiHWw==
X-CSE-MsgGUID: 6OL+hmy2T/W4GaEA/t3XGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="254865330"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:51 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8eRG2QtDgI8717m+ZFcPblxxYebB0am1KRiJ2RUP9bBT6hjz3jPL2SB+kXfuZYi9m8pvxsvhFLlpH3NNCHtrbUkOLEG7Uk+wVvyUWq6X1SdewmG3kijhNNt55KCIjX/jTIbba7lr1VllqIDnj+YFD4whIrJaVekxpFiSkboohBwjFX1vYiOuGdlMctV5Q4aQ/Fkli3db+imt16Z/Vi209/30G27NE1biA4tYxc8v/f7urpSyuSc3Se8QW5Z2DrC6jvNmIwqEXGJGB/r6b4B+FYV0o4cdV/uDFH55oLfcPRn+B3NjTncHsrZZgFsj+1DcgXgZT0qxx7brFnWZUwjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsBvFWRqUnxMcWbdwaIawbJoFFdKfR5yIEq1i7dsPV0=;
 b=i2wdTY0ms9bg+3pp77kTfaOKuc1ZdXcj06yKTyTLOzaIaAlo4u0AlhytbrPX3/0ZJ52Hlu+Eo8eoD4GTKzCbw+GoQ9BKh5QhmHrTRekwsJ+UboFciLoxTIl2Nn0VHr8F/2Fhnrz36fKTEACwd8lacL0irmj/VfUWJJ2Qx97iyUXn6H/D0d15MokwPMTuZ8iDXQozfs4aRxnvR+LSdVy8F3DAmEh427kQqLe5lCmyXRIt3E0cyPkZill+BubsfzdMav1PPg4kh1iVtItO0I4CjRESGPN4YO+jQVZQ55JTssvL0WtXOpON8Asx3NBHebToS3BSK6lB1opHrc1j5G07oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:49 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:49 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 14/25] tools: intel_backlight: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:21 +0200
Message-ID: <eb5a6517b6ae90cccfd10fda286615f048524c82.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 51664480-3390-41c2-b2ba-08ded1cd44ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 0t0K3ezy7PRnk3ifCvbOY18758Ae9QOKmtRaaxNcniRSlv6VQEb1vVis6XuHLnMwe1QRoefIhiUvfxCqFFNcVZFN9MCX4KWEd8zgGDSnQlMrju222piMJKLx0NvI8ahpoB4/zim2gDGW7iRPqeTfTv9v8qQGhCCpW7PGaP+oDZ0TSRCXBhON616L1nOoZYRgrJDN4gkT+Uyi6vDHjK1x7XpiHMHsECnrDy/NT+4IhpV5+Iv6iX1B7m05HJM4NICRwGBjDyE4B95w88eVUTRFSd5IoNRx86fdtB9AjNXLL/qbrS1ydze/GDqpMYG7dKNaWIXhsj38LcGFZUX3G3xpx/Wp4DR11TwmOdLCb0HUqMaZt5OUFBDHDTe+HAEwYnG0EFDIIbO/bYf8rUpr8hCb3ji3NLUOHlwGy3wqOyr3MzXuqwttmH/k6BViLGlPM8VChbVxf0H1bYv1YZjw6Z6mzK2mYvtvruyfWC39l+uuwKwyg6gzrDPBEzht5YMMkUXtO6fGL5PkdaoIlIJ+f2awQ55Be+qAEAwY+A5XIfuCnC0wJO8bz/f5+tsQZgLBRmw2nNKbM1lokFjLqeqfE86bUviZCbPfaLQUeYwkOKQD//ygRGJQbk4mHph1Nn33TtZJbsgF4As17T50PGKLbXa9y+Um0C2wSO4JqrxVBDbkjtE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GlQp2ySV5myt/SPHHTxh+mwt/yDrPDDSyvciMOmVDoyvR7KpJfNiQ1YD09EX?=
 =?us-ascii?Q?48YfrkvVriEFxd5Y32ecJOC95f4e8ZJKyR2aKx1y/Kw5XEgumavKccpKQTyu?=
 =?us-ascii?Q?lowZsH8rbF7Bo4dm5zYE4c+czIIuXCVBi1rJNHxhbFF9lZE0FOalPMvSx727?=
 =?us-ascii?Q?mGR9wi4thEsrljxQ8kKrFZpv+NeW0sMLE4siAQpCHpqfIniUg4pYYO8jwl3r?=
 =?us-ascii?Q?Hpw3dhPAPRX+jf1jA+ps2LWs4lV0LiW0hwX4aRfFCGHXaiz9NomADL9HMCLu?=
 =?us-ascii?Q?Hs3YT9iJUP1NU8lNzGI5koZ6dLhF5SLatJ9HmU1Ijlu8kfQq/3m8hz/O/FvN?=
 =?us-ascii?Q?onyPgpuwHtgkkf7UCtw3iBt/pQ+psoQ6j8tgxZHQHVo16FNh3DCkYTLNd9nJ?=
 =?us-ascii?Q?RNNYbX+6mQbw4fbyI61Xc0pwq7J4yeZi+VKQI4w4ombA6tIVxrhVBtqOkXFK?=
 =?us-ascii?Q?nBB9DHk7HKegGgWYqJ9F/D0j+FTlYCkL4MDd9PBvm+YQa4Q4D5FC0AcQf0WR?=
 =?us-ascii?Q?CkNxK90/LVe4anXf54Ycrz+lV//20w4VYePWdHXjDgiIAW1kmGn+3+EHApcC?=
 =?us-ascii?Q?NU4wjy9AeNVixVkU+n0aygDlLV6QyLnvCJBV4RbE8m8Vw7yRQTIiCY9/FAcp?=
 =?us-ascii?Q?zYYEIK7VY8vF0djuX8oBACrN7qMMMOgucLXt0AIkVqnhrK6DhmbZlrqgTwDi?=
 =?us-ascii?Q?Fz+Prjyh7/LXjUYyhHEUj3ReyGbpL1KyJ65BBE3ABiHmWuLZC4P4WZM/1lzt?=
 =?us-ascii?Q?MfyEk9K2abhSUrUWueIzxdbIUcZbIETorl31vDR/r3WhhZEPHNiB0l/txqeG?=
 =?us-ascii?Q?20GwCTngfO3yKXDo9RUtNUIz/F68TqrkePkHXz12TCU5mGsp9J3+NZIqeEGf?=
 =?us-ascii?Q?9UbaxcXdULMsKNt20jMNw10GuG3GqfVnpBXJ6p2gKWTkb3l0X4lPG21FumP3?=
 =?us-ascii?Q?Lzz8r6ukcdJmoTsk+qEpSohtzXm4B1P3Io3eclfjq1PotU9h7ig3yoWcwy3r?=
 =?us-ascii?Q?m3sa96kWwhlT/2YAXOWfKw8pMg2sc3MgJahxVE4zbp9Rcaj5Y3skzpu1nm8y?=
 =?us-ascii?Q?AVKR1XvyLm7afU1GE+6m6QiKQcww1jAhiXTK443cL0qgc4zKJQX7NhJs8Btx?=
 =?us-ascii?Q?NZF5afNwNaaqxrwx2KMP2ncdrhflXyGRbvogF48uqe9EqOCb3c1y0UkmIy4g?=
 =?us-ascii?Q?EHX51XBCxjKg4B8y/VTJmJlpFP6kWz/wIBptQEMQCGxFfd7mQElkZa3JRxmn?=
 =?us-ascii?Q?tSSENA1FfGX07+MA7KpIm2/vF91Hn/3GQrre1AYBGRj5gtZyujy5KkHAIN+p?=
 =?us-ascii?Q?KQoyzJBFPwmOMoHix3zw9hqpnkVlch3205r7gqopMYf9QqSdXZvB0IJ72ZLL?=
 =?us-ascii?Q?v4ckgUtT0y5136erLsDYhK6WhzgYxKnzK70ZcDB17PalMeOnfGKQqaBCnljD?=
 =?us-ascii?Q?bB7XDHf9cfcYarDO/KqENKVa8AfAVFzIqRPBV9niFWsba48jf7v2xUZtlssE?=
 =?us-ascii?Q?r4MNBVPB998Lb+2J+t9icbSjyiDxWnL0700AStOKGRGdGxOKk4P/Mj1QobSo?=
 =?us-ascii?Q?tg1pm8vm18yuBvZx6E1YcMojqH7X/DfG2TqfREJmfQxKeQz790i0hE4buL2S?=
 =?us-ascii?Q?Cr/30Q3u3/LucBTi41Fc6IjH2zOAgjlHVjEUnNLNEAGyz6uVImEMVyNB/LBu?=
 =?us-ascii?Q?MGmo/rWK9w4cv0vdKNz1kpo1lCDhnNujIsQEvIMj1SdlZAF/K5CThija1iph?=
 =?us-ascii?Q?MymH3/m8IWdZf2fdyDFSMhWZYMHiaMc=3D?=
X-Exchange-RoutingPolicyChecked: rfKbJmHJAChOt078T5PKGrdTBqonp5sTP597avmdZ3HTQpN34kBtKCCxeVw44XVYCaRkR9s0WONUwNeYrycqQhxmnfZzJcG4z4YdxH67lZ4+Kg2qf/rJ450K9r3qpgnS5tBt4oGxc2xika+OUC8T3g3CD3W+zrKr95GRGZyOUpCvD9t0b5FTEwQgCv0//k7yWbbSRszGxTUw/4Ef+etpLhJhEWoL0iOkyWrYWLvFisAZl2YqZDtNBcTdcRYo3ZqyhFMDm53jiBb2ojzZM+ZQOWl/i0vSsPl0HTtReSvIyj3m8p4qzCBEuLB5aayBSgKl9Aj07RQUW998VkjIMJv4qw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51664480-3390-41c2-b2ba-08ded1cd44ed
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:49.0789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/vNIwEJoud/07u+Pf4ToGiaqFSRsVRp1lVcYRaQe93rbqWSQ2pfDOt8j3HSO4Iu4ILocacpQZP33VGe88Cizfw98iQb+7cGdejXknL7ugE=
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

intel_backlight only needs MMIO/register access helpers and the chipset
metadata they use. The full libigt.so stack is unnecessary.

Add lib_igt_reg_tools and link intel_backlight against it instead of
libigt.so.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 46cf1a717..8899a5b49 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -15,7 +15,6 @@ tools_progs = [
 	'igt_facts',
 	'igt_power',
 	'intel_audio_dump',
-	'intel_backlight',
 	'intel_bios_dumper',
 	'intel_display_bandwidth',
 	'intel_display_crc',
@@ -92,6 +91,11 @@ executable('intel_vbt_decode', 'intel_vbt_decode.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_backlight', 'intel_backlight.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

