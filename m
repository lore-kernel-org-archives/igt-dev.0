Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBA3C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A8E89023;
	Wed, 15 Jul 2026 12:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoEIw2oQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A77610F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117759; x=1815653759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AbwfUD1joIoq4PljVKPRGtEQ/8FqTGDQw6VisuriF+I=;
 b=GoEIw2oQPZKjnQnz7d7dAfHbj+DzK1JorO2vGw949KW996eX1UNUVz6D
 B21pupQ0aJ3/KwJbfVIehEjB/dxS6d4lrVIdm3YxL0nRjPxmtgqLFf+ue
 R89W5F9eCUiowphJ8gDiTWiucGiS0sb56ZrXyMbhLsZXJzOjNXHKs2pBG
 oipEyDM4lHG0a6FM+XmVan+pIizio/w1c2+K0E92LBYiHWIMVkxHUasLw
 i0QbmENI6i7/WOSSCCu6byMh+jsmRVcn5bEMqOEY3sd8XQGLj2b8ljPvd
 s0zVrKuxiVm6WF36+OCB7O+Fb/kjwor332Rjlc2E/k9MTUoePURvW0ur+ A==;
X-CSE-ConnectionGUID: M0kYICS7SzuIAAb99+/TLg==
X-CSE-MsgGUID: p/HGCihCTey6z8asuWBtfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84607089"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84607089"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:59 -0700
X-CSE-ConnectionGUID: HiSZwCReT0S54vgW5RpOhw==
X-CSE-MsgGUID: GeNUNBZ6Sra+VPOWpcVy2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659673"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:58 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJhBwYGy1xIkN3r1i3su+yDmgd2H3W0aUcUsU4Nomf9gpJ7N469g7uGxvSKtnJA8CwiixcDYibmITPp2Z3EbWx4W8hREwR95OpeRTV/SE4YYB0/SWwoEBlbV4JTwpSw9DIAdUuTyyQi6ooxFvgxPL39Dp2hlS4SbMLpM6/U1WdpthWL86707ZzwKN8GQpzyBKIw18jyEaM4x+ExXBqV0x7fuNg1f4iLbnVXjgRnkWyfRsYhC+td0Mu4Cipml08nyXxovWuTQ2rxwllFzECYBVfmTle+LQEFPHFZULOrV/zRYCpZywkOF7dOPT7mVgD7a2kw7HL3bGRRHDsNgyGt9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IrwOjMScvlIycTjvMjUTdGjb2PDCrQbOwFFLnEoefo=;
 b=r0ZVndMX5w4ijLP7mGV1MiEtHmStT1NkfXsPwKEJr/fKrhXLN/BfWCltzcuMZ4IxuF8SZygVPJnsLBHRjYawtGIFUK2KsnP26HQoq17APv7XytrW1bG7lFKnpoO4tHuohqMXL4xoE7ZSMlJkUrnqF48p2dGruD/NxYiwyNaDXPF113pNTQwG/jf7g7EMkpOO7xEU4483+Un0AMkITaXZPVPB+CObZxUAWo2cvGlgFULVk5/XorerpakCygu/9/IZXTOws2tlBRrvSI+6VGWttH+La2nHYweuQH4iPLLc5y7l3MRmFsb7tMeP/XnQUlqjjUK15zTHxpBDZXCsPap7mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:15:54 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:53 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 25/31] tools/intel_infoframes: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:35 +0200
Message-ID: <354eb738edbe81f52225e6b4d2e6f50e19265138.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784117512.git.sebastian.brzezinka@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 92325266-0fbe-428e-0577-08dee26ad10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +ViTTtW7CLPc8Q5msRoFMJV74zrChbSe4wLBeSBE4zIWl14NvD86WjY6HmOtWCMbSMbqZ3hgPNHTtWLTwP6oec4TkKF7VDFPMFyJizj3D7Fg52Fx81O4oYe2X9ojFhFpTOPFElRKyukZTFqr85B/s4juEdJUGFWDHhjzqQpOixt+FCCO1nWI6CDPFPvSMB+gpb4+KFZBpJgBtda+XH/wsrOzB+2jqUZGnZHnZLS8yZ2IuKP3MrFvl45Pys2q6JtgSEzzv0nHKqqM7IYJ7yj/YBUWY5GxSJa11OpNrEDJ5PjjEEefIJ/9hAKYA+Vb0O0xhFSLXyXTAHu/eVvY7AwUWY8iwEbarJi/xMXTZ9aqayLPTYLGuaVvoZiB63rH3KxGgKpRWh3x2GkVYRUQIOuta2ZQ4dV5jExPzT9hbG4aih1HDnvartM1DeMYde5Dx0y/BNI3mWze5l4wLPc8DFUsiYKY2U0WEVBj8jRcLP6dg+rForydUvFYn/sbQU/v0S+N/byA06HhBylGmEckX1r3Idv9w3VPpf6VvMg1XwoYt7hIBVdcp/uExxnkZOcTi30zjdWRp7jvIqW64Ph9uuPBSKc3FrYx/jyumFBsNxum2w9UiP51FFO4mrsgAscuZxL7OBenMHrGaI4zaIS/MjAhdKF7b2eMnM16HIB7Q25MQ4E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oz7UzTUM6WKO6W9UwTlPOwan94GtcjhwosifwiS7BtFdHAbXMvnDJ9F+5uAt?=
 =?us-ascii?Q?PPr3sfZs2vV3NokoJQKpHuqHmkXuBLQJwE17aOHcSDjcU8do0KvkPARShJC/?=
 =?us-ascii?Q?vO0Wukv0DL/yHoVmyVPlYoL/4rVoPYPllFD6SGXBE9wbfZrxMVXsLRJHgGSl?=
 =?us-ascii?Q?JTUn2tCClG8l7wJUZQITMwMC2QAx+0fD81W5dEGDbMRkl2gpVkuXT7ppEabw?=
 =?us-ascii?Q?w5hu6FIefpzgwrJO2+1IJZu5+aGzhKr/8DyHglAKLNDgUQo/gH0N4NlMsEAs?=
 =?us-ascii?Q?GPDs3xxJ2msne/cGGiS7mZjpXCAvj0C9+6XO3Aptead++VuZkkafBUdvqtAM?=
 =?us-ascii?Q?WKnazIKPAKzCeUnqzAdJ2yjVx8q8gQHJTPO53YuDMQnl+9no/ify0JhYfcaG?=
 =?us-ascii?Q?IfyXqQOhmC84JWqe6PqFxDCc40Al7DtMvMe5o3b+QjGypRcOEsS7fWUO+kk4?=
 =?us-ascii?Q?RUmokRpRt98HQ9OQrxIDBqJcM8od70u0fzV3hOW38dE8IlC6uSNY0jP3HM9p?=
 =?us-ascii?Q?e422GwgdITFEVUqJWJwAgSjt0zBEF5qemJVBXuOl58IZfmMB4/GeR5HUpXdR?=
 =?us-ascii?Q?inp2cNku+oMBHAyvYR5YimZlM7+jrsIt8Y+xXhYiN2rgZe+iDqEwn+BCLqOB?=
 =?us-ascii?Q?YpGw5rlhWbb8EapR+B6hsp/9+4FAbV9v2HOIgu+v6+4wC2klDeXiD3xrhnLV?=
 =?us-ascii?Q?ZJD4efnE6H9cclCJlwvGj2LsozkWc/BJu4wsFw5WFVGyZ6yMKBVq/wKyJk0V?=
 =?us-ascii?Q?2BmoLAYIX/c8Rptaa+1OC8WqDX8vydebTndTImK00d20SZgsbFqEXk31562w?=
 =?us-ascii?Q?2H/rh37tkw1G6rlqf4K/n/tUofu151pGY7ELM9zsb0D2jswyKtYhQw+tIF+4?=
 =?us-ascii?Q?Lt1swtvu/naGKLbqBmUcKZRN/qaVB41NeNjuqr4df8cBH/sKjd+jei4QuwuN?=
 =?us-ascii?Q?gLqVSRltRyHWrsyht7xZp1Abl4j76T9XweJAf5BlHBn8N/qYlvvlb5s7gOC6?=
 =?us-ascii?Q?IBem1UWi9q2a7joyYJgHfI0AVz/YIeCzjKe+Tft8gIMJvc2R4wSFECr1ptRu?=
 =?us-ascii?Q?6XBpZY1n+MXwoUPh3Sb9MqaQmzVR+t87aOYjc0xSAk3sB/JXL7XqMFuXKGsP?=
 =?us-ascii?Q?fm3hl7PbEBqBN49zwCHaTkkectYzP/jRwNh4houXsKwVhKXXNREIJ6KmI8YD?=
 =?us-ascii?Q?6ARfOCl7P7xS5uCK6pI2WYfAkFkLxq8Anl5Pg/n00Ko7KerH+Vc++IzM4Hc4?=
 =?us-ascii?Q?dA4FhlqVD8vXzehzBmesSI/eBs17hflAamnfUWUT5B4stq6yeOSxYRo0FexV?=
 =?us-ascii?Q?6iGL3nQf4jVKpDk1Yvzb8toPXe8+EZK6fHtPz5VTxR6dB9Ln7ynkdZwlBR9D?=
 =?us-ascii?Q?EMWdRrvduaAIg8SRshMcAIQ+EWI4bsTq6WebjCX/XwWJBCzI6RIsnM5I4PCK?=
 =?us-ascii?Q?/FGTrx2fDHp/7AP+AlO86X3pKXDClSyT4sPWRo5cF+OWXkSij6aTlzCkWn3n?=
 =?us-ascii?Q?cdHeIafEp8apURNwVpAhBv1xwPl1GQYAIuKzJoj17JnO5vIhszPLu8AEw6Gt?=
 =?us-ascii?Q?7kP3N08NUvE+9PKZhkzz+Wv8vZ9XU0FvKmT1Vd4MXA1K3Jo6gDmaBscp79MP?=
 =?us-ascii?Q?O59YNk8ibvrgSfLGtnP8Zv70zCFEPC5OqnVI04Man9mH8Ha14P7nAvP5idvy?=
 =?us-ascii?Q?DIacfONwpVoO/EVLnirQFgqSyXpZXc5kQ4DCLBb0C0q2u7OlD11u6RKInBds?=
 =?us-ascii?Q?Tuk3WtFHyCbh6YczS8faO7PKqABH8As=3D?=
X-Exchange-RoutingPolicyChecked: Y6nEoBxbcDau0HVUrvbSuPcKTe4O/+N20QjYoDMN5qlfefz72yxoxSeE87+wUcuAKr+B0VtHzQ8sjSdrtxBxFJQtllp8ObZPLDK0c6ARXsaVFv8GJn4t445Dn4UiHqvaiI+7NHVX1THwn6eru+ajxzEmcGQs6GEVAu12bL0VchChA01eTcQfncPbqr14/VfruIQa71VwgViCcD3Eh0M/Q2wEFjMngVOvupwagEYM+h5yG1kS9yvnD37mfjKf7GJZwV5Gb0U+sGE+wPr0vsk4Z5CxZNJVTI2kXBLWhO3KrFLuNV0wNBZ7oin9MIRqotT9AqTJj8G0jU9bXO1jana0Nw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92325266-0fbe-428e-0577-08dee26ad10d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:53.8388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUHVEl8kvSD2omdCcDSxi8QMMopoSKiLzxYyqpANyjS6ZJU2G/kZS0kL/bRrbngFIVib9x2+W/Qf8XJHxE3CCq8mfkti42VfvEWZesk/t9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
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

intel_infoframes only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 32a345e9d..a31b6d0ed 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -20,7 +20,6 @@ tools_progs = [
 	'intel_display_poller',
 	'intel_framebuffer_dump',
 	'intel_hdcp',
-	'intel_infoframes',
 	'intel_opregion_decode',
 	'intel_panel_fitter',
 	'intel_perf_counters',
@@ -116,6 +115,11 @@ executable('intel_guc_logger', 'intel_guc_logger.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_infoframes', 'intel_infoframes.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

