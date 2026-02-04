Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B94E9D3E3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042C710E664;
	Wed,  4 Feb 2026 14:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0QIuB2v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC2510E668
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770214595; x=1801750595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=x3px71yHxPpebD/D1aZuVbOwROsBOULeHBnTc9a0dMM=;
 b=Q0QIuB2vsa/4WqbGMdKNQExmWmPF9oePXFGJRUhUye5FU593HIZXxdlz
 GdNZzQ7B24HDfd27RnPEUUwFmqSQalfki3wMZgbmx/GX7wol+HqFVFNHW
 Dzc/N0G9OrWZX+J4PDoHcTtUMOKRO9uJVzss3l8fSPqlHgYIudYaEDBae
 PIfnuDu7C7DkJs94igJnO6ZdZ8X09JYAfHkzc2GH/bDz8hJi9wiRdkDNV
 haqEXIcfWJExBUAbhPkk52KWoWSiq7+JhlI2HNwku2qnynugLcMgvPugt
 /0a+6tAwCkXtOS0ImviO5TJbYoGHJc3vtKwg9PdCBX1k9S3B1LQTvnIu5 g==;
X-CSE-ConnectionGUID: PQt5H/+HSmC1hkiSPwUg5g==
X-CSE-MsgGUID: /DH7ksJxSmqvwsBOIh2iQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74004667"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="74004667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:35 -0800
X-CSE-ConnectionGUID: zliuYFIERMCuIGUuG12NRA==
X-CSE-MsgGUID: ixNvJ32SRZC0YaYeamjZhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209968162"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 06:16:34 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbFMFmQ48la3s+k9UaFWdoTucrPxw/stccMEEX/PEiQeBreLAMEJMxSRmkmm0lIC3lLzJVwzYNm44PtJAuVK1H80mg3qK37utzdqVbY0lXZARZ6eZWqQipU8Jm4KDFqbI/Ek4VeQU7a+torqRqC5lRF2ArfwjnDLAvCtjOr8W92mf8rzBOh6ObHUii4OjTYIHFqfn+lVxWBxjuH75dW16G1TKOtJgfLRCIVmzbn/yGQxcExivB+L9M50B2pMRwSmTq5zNnQClyzJNajOM7lH41L7LYa10y+Brce15kJOo0J7s8YJhjijSZtkr3b1rscnFfG4a166Nz1qK1SHlhFcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXhcZWTOS2SPcZozTimIZBRJEZNE/3AJA4yy+RxSiyk=;
 b=DzsLy/x+8ivY7uLmIiulMX1psamwI8CXAZOUT4dMnB5D2COzv4i3frB9LcjRCgJi3OGNEeSTkjnDXdIbGz5cLAeY7mhcYKaRhc7oGCJnl82eLuaUHOFbZg8drIX5Zyu96qC1bXPaGo+IxMEGML/Eqj15up4B5QhNMqz05CUdErFkr7rQAIFs69PlEM3yiVT6qSjlbtSwtx1IG3mrc3yxXmKkRLwejf7w0hnXAMBoHrPrWsB+xQAEMSGRLp4B4avR04N3ufnWvSfT9/dB5VVzFKwrjsdo4h96nEqHPUMZcI+6PUsPLNAE8ukgZZBcNSsITOgqQyudhIAcBU0SNp5RWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 14:16:30 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%3]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:16:30 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t 3/6] tools/meson: normalize tool dependencies and
 executable definitions
Date: Wed, 4 Feb 2026 15:16:05 +0100
Message-ID: <48b8fd6176a262b4aae80b60cbab39505817925d.1770212190.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770212190.git.sebastian.brzezinka@intel.com>
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e17132d-1a27-46cc-a869-08de63f7fde1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2XGLVWdTHEGj/DjkQx4FUAdUw8xeDXup++LD9kAX+z12nUEborsb/Enghj0o?=
 =?us-ascii?Q?dviCHDq2PZdt5ewYY8xRG2t/e4YYJbA2vkDLz2Tqt8uxSvyfGEjbs0WgtqoC?=
 =?us-ascii?Q?XP08QH/hDWpxbGTxujgPPVUFV14BApMKa3N7J7UWJTUY8dtVXlVQhku0ybYo?=
 =?us-ascii?Q?CJjBT3ZIruoJ121mJRS9gEtDrYldhMP/x7IygSsRIxRdMFil6SxdSb5Ddl0A?=
 =?us-ascii?Q?Tr+dI3MyTcLQ+bbiwXkoMmoq98xnOrwHyB05Ax/r6AQMPB5A0j3aGX3StjS6?=
 =?us-ascii?Q?esgEb+SkRV6uBzMi+zSxcex01lZaNck4oHEbAn32yS2xIyqK/6hQwBak+xms?=
 =?us-ascii?Q?UwHnjYwmFQJ07BUaC2RtGjCyTMVIVmb+uhtIxv1vRnUz1CWO9s91Jit2qEzE?=
 =?us-ascii?Q?dX/4B1NDAafLgQDKmUqXpnicJ4+IBvtsYsRZhMUhDWVOakerrcmCcoHdjV9e?=
 =?us-ascii?Q?dRGxmf3BZ+LIuOb6VXcWLzyizgMx3IvovZltpweUcUsMxjBVwS31ro9Pzcoy?=
 =?us-ascii?Q?ryuLmyoE9S9LV/Q2zGvXm460rAsK3Y/i+n11riL28DUZ55FpZ/QDQF6OxW1Z?=
 =?us-ascii?Q?8+gvhfVNJUitrIMX4loImpEnolm7l/jeu/PwewDSC1+gMN4ZqI5LJFjjH6HW?=
 =?us-ascii?Q?R/t2lenU5ldtqeNpLdFa9RVU2t+JcRdsC+lmT7heSiSCBsn8UuRmwe6eGOgk?=
 =?us-ascii?Q?AfY50kaVMituCrcnur8+2YqzvdqUCdN1FY5NQXsak0mVsv0BEB+DA6z+sebI?=
 =?us-ascii?Q?sFa5/d4KZ/dSXvmb76VBeqm/7HlI/lss8DN05Cu/iQdJjDPruP90CHcD4lmK?=
 =?us-ascii?Q?Z5hFwYU2R2AnRKAlbu5uKv1Q7FBgJTn6KnW0una2yPq8oa880yTV7pPfruDh?=
 =?us-ascii?Q?dyLjFDjOmwFVBNRAB1PQjorJM77FKnCCOx+z9wnTG18rt10ZdEjPI/SSThMb?=
 =?us-ascii?Q?y1vbzWZgl6yMwXnS6gaVn4bAOdI0jzlMBkrT3+csUltsfoXbwWU81dPeSfVZ?=
 =?us-ascii?Q?aoT39V2juu9ZQ/K+RyvlIYmsNYa6cH0WHsefIbuMnI0F3A1FZ+vLsg0Fjq1n?=
 =?us-ascii?Q?IMheJjdmIlRmsoEhxpIAkx6V4UQzxHmWEv+GnGll2gElipmkv6Y2jSXnJHWt?=
 =?us-ascii?Q?yGpvGiww0o8CYUdV57/J/lA1inhe8Qb3XpmD9v3nxA09/WNFphnoApvKWNRQ?=
 =?us-ascii?Q?eJTgmowHXYijee31osvFQ7NsloViIKEQ7YDMgED456JC9tnWq4fJIiZSItAM?=
 =?us-ascii?Q?WWd6eLS8sWIqnCF/TK9ifaf2+OdaeninTxuDEh98AlIRty5c53vNskm4xIat?=
 =?us-ascii?Q?qwsow75SBjgDVfeFbkqVBQ4qQyKBfOgpGdxZc32EGGtmb6yb6vqVDEeaPuW6?=
 =?us-ascii?Q?/5xBYTf9nRsv6NzgaXFPU/+A7bd6xQM4tHdOhU80I2dTvqVSaiUofWIrKllT?=
 =?us-ascii?Q?jV94wcDeboWYJ+2yFxs5L5LzujDjdoI3tgJ7yhCjrq19slC2l7jiGYaXBHYv?=
 =?us-ascii?Q?YwUp4k24dr6m2sXlLKefvolVXvXO/AszL2QFJOlwSsxtTDT3oeiGwhI0n6NR?=
 =?us-ascii?Q?V6bFLyQfkQQf1O5qhnY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yGrsC1GHA7h0d8vZh4GuQ+yLaERspt2zew4Kbwy1lzNqjgT73023ng/9CDsi?=
 =?us-ascii?Q?UGBvQgyEWf7aWhqS9wrWcGg+efgnmCqmpgoUa1QS8FJSVxsKqAJhwYCa/5lt?=
 =?us-ascii?Q?3DU8XYXQZ9XXPX4vK9iAE1CwrFYM3TmmFt8f0hO/OmmLFV+r0QMpAVJEmdSF?=
 =?us-ascii?Q?B6TkX1+NLO67EZy66VHib50vEPcm8MoWTJgS5jR2E8CXgO97kLinlysz/kP7?=
 =?us-ascii?Q?R7XZ0nbzxK38OHzjitadWEFm74woWEIL637L7R1F04G4ejvIyxXFpf21m5H6?=
 =?us-ascii?Q?6DVEJZ4jaosYIvJyqyclR527ZNZlMp988ZStiZW7qU2V67MGlDFjkTsgcD+E?=
 =?us-ascii?Q?FhfybRvYG3W8JYwwpxb3BWtU0DRqfIUfQIFzi89MwxEY755wxzio7B21Kklo?=
 =?us-ascii?Q?DOBKIyYBEJSZ2DJFEwOi+znELK0v3JXbgr4uWPp23iDAhmEBbLdspNbF+bcb?=
 =?us-ascii?Q?lS+aSYamzNjvfjuY+E/eieMmFbCUvBGcVDBXtgUAWldDr6MVzPNswqwxhz6g?=
 =?us-ascii?Q?PE8gt25qVI5VBAppDaMu8ozQdZZfO5qgXBzfrxqvO7Um+ctsnHYwzK7LDoN/?=
 =?us-ascii?Q?BzpOeELdcTvmPqA7WWxrpHIKWtSHT/KtN+Omik56+kzu97PFkllSHCyVtb9t?=
 =?us-ascii?Q?1TGBF5QI+AhgQpjH/4sJpKBDhYGzDOGpzwrMruiv0ah2fuK+xfN40adJydvK?=
 =?us-ascii?Q?2NzJWz4z6tgYbr8orqlAzPjVtcB4YPka5/WUvTTzZl2NVhlLY8ytZVXVywjE?=
 =?us-ascii?Q?YiRBf7VnWM7KbhUovJp6Zp0+c/xwAXjxxzFCPBLeEZ5BJN5hgJVQY8qwDqHQ?=
 =?us-ascii?Q?O/4/f7Gbg61s4MvVckLCA0KyIir+mkLLImEf6bwKk3uxxYDnrb/cB2tHyqWB?=
 =?us-ascii?Q?yiinrPYqCmhGGN1hxKkv5CR/8nozM9zpxyS5pYpSzRye/jEt7uZ6rwY0zqaE?=
 =?us-ascii?Q?PM7wqeSYQKEy3YWU4vwala3DOP3WEu7/szYrrj8gELGuLztbsD5I5Rn/Rs4b?=
 =?us-ascii?Q?w1a432Tn9GuSpG3ntkVuW+iGhj+6/I3USN8uils1wOGU3cAnOSiXU9HseF99?=
 =?us-ascii?Q?FHVedWB1QzzYyCEivRrhmdnG1lItf1jlI/2TeK5/2NwVoGTiPGvqicjkNu09?=
 =?us-ascii?Q?fNx3chPS7QRekfzaMXdQuxQdGrqlS+5JS42wNg2DnyJRbo7N5UcDhb9A5UQM?=
 =?us-ascii?Q?asrQHeiCWHRGxqTMO5ZiEMcfwhp5r5imD19Qan/bnSIEZdnwJrpAwrykJ2V9?=
 =?us-ascii?Q?E2pfYDZqrqtTSMqr2lZ0KLi9c43OxcyRJhkxnS6xvd2daPHqmQLDSjQtNjZD?=
 =?us-ascii?Q?tRBdXfepq2PtkFmj2mFnRI2fU5Gpa6p2dSfrBe/Zg+RLBNBddUitLSiE5aRG?=
 =?us-ascii?Q?lUnTMmVN+eQgUCYiUrvAPznLYTwwe+di90WkwWJvdjXuwApnWA8FrCCiWObe?=
 =?us-ascii?Q?4x7iM9kBArjj6opRGxSC3jTrGFh5hIbeMjuc6untOJFCbK5VOJ+OqjSblydz?=
 =?us-ascii?Q?07jJ81lNc6r6Y/Bbm3e9kcm2MH1b75gQvFs4blepFKJG6BOXNvvP6JdE58tu?=
 =?us-ascii?Q?upwxv+r8e31aJJPgr0e7tNg2qbPJcXh7KFiP73fgXLQ6T/ItQZKcZpeVdCS5?=
 =?us-ascii?Q?+n0cg1RosThcYPyHYMvGcC8yYot5JPMeoMnaNnqs9Yxa20B4R87f95DfVpkR?=
 =?us-ascii?Q?AhLgZWIaEnvG1oDTN+1RfI+8GPkB9x9kZGRz+1hwmWyf2biKRu9Ig3J5aMaS?=
 =?us-ascii?Q?Tv2nc4m2GHkztuzOlYM89adB3GYgQxs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e17132d-1a27-46cc-a869-08de63f7fde1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:16:30.3525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VM3Z7Ubbvk5n8jvSJRJ6x+UDDfTf8CQWOefrJHOBM7oKJv8DfUj31gjO1CPoxz94PfVpFHpITNvZV7ZytCRXy8ONbnyOB+QCPl/uHks/zJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
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

Refactor tools/meson.build to consistently use a common tool_deps
(lib_igt, libdrm) base and layer per-tool dependencies explicitly.

Fold previously standalone tool definitions (e.g. gputop,
intel_gpu_top, amd_hdmi_compliance) into tools_progs and unify
executable() creation.

This is a build-system cleanup only; no functional changes.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 134 +++++++++++++++++++++-------------------------
 1 file changed, 62 insertions(+), 72 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index 039103ce0..f7874cf82 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -11,50 +11,58 @@ foreach prog : tools_progs_noisnt
 			install : false)
 endforeach
 
+tool_deps = [lib_igt, libdrm]
 tools_progs = {
-	'dpcd_reg': [],
-	'igt_facts': [cairo],
-	'igt_power': [],
-	'igt_stats': [],
-	'intel_audio_dump': [],
-	'intel_backlight': [],
-	'intel_bios_dumper': [pciaccess],
-	'intel_display_bandwidth': [],
-	'intel_display_crc': [cairo],
-	'intel_display_poller': [],
-	'intel_dump_decode': [],
-	'intel_error_decode': [zlib],
-	'intel_firmware_decode': [],
-	'intel_forcewaked': [],
-	'intel_framebuffer_dump': [cairo],
-	'intel_gem_info': [cairo],
-	'intel_gpu_frequency': [],
-	'intel_gpu_time': [],
-	'intel_gtt': [pciaccess],
-	'intel_guc_logger': [cairo],
-	'intel_gvtg_test': [cairo],
-	'intel_hdcp': [cairo],
-	'intel_infoframes': [],
-	'intel_lid': [],
-	'intel_opregion_decode': [],
-	'intel_panel_fitter': [],
-	'intel_perf_counters': [],
-	'intel_pm_rpm': [glib, cairo],
-	'intel_reg_checker': [],
-	'intel_residency': [cairo],
-	'intel_stepping': [pciaccess],
-	'intel_tiling_detect': [cairo],
-	'intel_vbt_decode': [],
-	'intel_watermark': [],
-	'lsgpu': [libudev, glib, cairo],
+	'amd_hdmi_compliance': [tool_deps, cairo],
+	'dpcd_reg': [tool_deps],
+	'gputop': [lib_igt_drm_clients,
+		   lib_igt_drm_fdinfo,
+		   lib_igt_profiling,
+		   math],
+	'igt_facts': [tool_deps, cairo],
+	'igt_power': [tool_deps],
+	'igt_stats': [tool_deps],
+	'intel_audio_dump': [tool_deps],
+	'intel_backlight': [tool_deps],
+	'intel_bios_dumper': [tool_deps, pciaccess],
+	'intel_display_bandwidth': [tool_deps],
+	'intel_display_crc': [tool_deps, cairo],
+	'intel_display_poller': [tool_deps],
+	'intel_dump_decode': [tool_deps],
+	'intel_error_decode': [tool_deps, zlib],
+	'intel_firmware_decode': [tool_deps],
+	'intel_forcewaked': [tool_deps],
+	'intel_framebuffer_dump': [tool_deps, cairo],
+	'intel_gem_info': [tool_deps, cairo],
+	'intel_gpu_frequency': [tool_deps],
+	'intel_gpu_time': [tool_deps],
+	'intel_gpu_top': [lib_igt_perf,
+			  lib_igt_device_scan,
+			  lib_igt_drm_clients,
+			  lib_igt_drm_fdinfo,
+			  math],
+	'intel_gtt': [tool_deps, pciaccess],
+	'intel_guc_logger': [tool_deps, cairo, pthreads],
+	'intel_gvtg_test': [tool_deps, cairo],
+	'intel_hdcp': [tool_deps, cairo],
+	'intel_infoframes': [tool_deps],
+	'intel_lid': [tool_deps],
+	'intel_opregion_decode': [tool_deps],
+	'intel_panel_fitter': [tool_deps],
+	'intel_perf_counters': [tool_deps],
+	'intel_pm_rpm': [tool_deps, glib, cairo],
+	'intel_reg_checker': [tool_deps],
+	'intel_residency': [tool_deps, cairo],
+	'intel_stepping': [tool_deps, pciaccess],
+	'intel_tiling_detect': [tool_deps, cairo],
+	'intel_vbt_decode': [tool_deps],
+	'intel_watermark': [tool_deps],
+	'lsgpu': [tool_deps, libudev, glib, cairo],
 }
 
-tool_deps = [lib_igt, libdrm]
-
 foreach prog, deps : tools_progs
-	exe_deps = tool_deps + deps
 	executable( prog, prog + '.c',
-		    dependencies: exe_deps,
+		    dependencies: deps,
 		    install_rpath: bindir_rpathdir,
 		    install: true
 	)
@@ -70,18 +78,23 @@ if libudev.found()
 		   dependencies : [tool_deps, libudev, glib, cairo],
 		   install_rpath : bindir_rpathdir,
 		   install : true)
-endif
 
-executable('gputop', 'gputop.c',
-           install : true,
-           install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
+	msm_dp_compliance_src = [
+		'msm_dp_compliance.c',
+		'igt_dp_compliance_hotplug.c',
+		'igt_compliance_utils.c'
+	]
+	executable('msm_dp_compliance', sources : msm_dp_compliance_src,
+		   dependencies : [tool_deps, libudev, glib, cairo],
+		   install_rpath : bindir_rpathdir,
+		   install : true)
 
-intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
-executable('intel_l3_parity', sources : intel_l3_parity_src,
-	   dependencies : [tool_deps, libudev],
-	   install_rpath : bindir_rpathdir,
-	   install : true)
+	intel_l3_parity_src = ['intel_l3_parity.c', 'intel_l3_udev_listener.c']
+	executable('intel_l3_parity', sources : intel_l3_parity_src,
+		   dependencies : [tool_deps, libudev],
+		   install_rpath : bindir_rpathdir,
+		   install : true)
+endif
 
 intel_reg_src = [ 'intel_reg.c', 'intel_reg_decode.c', 'intel_reg_spec.c' ]
 executable('intel_reg', sources : intel_reg_src,
@@ -93,31 +106,8 @@ executable('intel_reg', sources : intel_reg_src,
 	   ])
 
 install_data(['intel_gpu_abrt', 'intel-gfx-fw-info'], install_dir : bindir)
-
 install_subdir('registers', install_dir : datadir)
 
-executable('intel_gpu_top', 'intel_gpu_top.c',
-	   install : true,
-	   install_rpath : bindir_rpathdir,
-	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
-
-executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
-	   dependencies : [tool_deps, cairo],
-	   install_rpath : bindir_rpathdir,
-	   install : true)
-
-if libudev.found()
-	msm_dp_compliance_src = [
-		'msm_dp_compliance.c',
-		'igt_dp_compliance_hotplug.c',
-		'igt_compliance_utils.c'
-	]
-	executable('msm_dp_compliance', sources : msm_dp_compliance_src,
-			dependencies : [tool_deps, libudev, glib, cairo],
-			install_rpath : bindir_rpathdir,
-			install : true)
-endif
-
 if build_vmtb
 	install_subdir('vmtb', install_dir: libexecdir)
 endif
-- 
2.52.0

