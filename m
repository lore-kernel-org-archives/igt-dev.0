Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADC1C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A36D10F026;
	Wed, 15 Jul 2026 12:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIj6oF9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437FF10F026
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117757; x=1815653757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Ygh5KPd1704hOOh5+pCV1EhLUO7Tq+TTurxvNJxEt1Q=;
 b=MIj6oF9VpmytTzY7OfvNWSbhzZ9yvhBk+xiRlwycGTl6ClD3R77XiHlN
 remJaqU71KQbXbp9Crvh9RGejE2xchc5wnwAGfMRKQ9Qaab+JZe9TUuOX
 jA1BivSbVxKSLFSddTBXtoK7T2CyvNNN82YUPs6K/0GAOvlblOvLosW24
 iukU+tOhGkGtET7C16yX5O7Ck11P3Eh79nKOc8abE7Sqr0VWK3Z8HiT6w
 Dw7IIt+nNI6JDJaOPhV3nUmutELeNVBjYjXJVDPlUgyDDWv5pfAddgg0O
 BYzXmpjnD9c158faoXmpa0NsciMzA6G0j3F1kv59ukUUcwOI0TYKaIOI+ g==;
X-CSE-ConnectionGUID: DbCL2MbYTBinCCxp0lt0nQ==
X-CSE-MsgGUID: rZFv3rjcTyyPFF7LaX36RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84607085"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84607085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:57 -0700
X-CSE-ConnectionGUID: pXEcNYmHSbyYaZuIJQncWQ==
X-CSE-MsgGUID: khItFDkIRKaMjkOyc658aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659661"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:56 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYG6lrcXGQ/X3+J8mfg87K5hcXH8wb3G959XWqlRFoUwDNoiTVsrjLnQ7z/CobXUlrgT4uEoSvU3L33eMsgjtwodCRt4W7ikdRnjC+P4IorhRNsU9/e1TR7xJu0RcVTj5LrALOmEl2xP1GqZVdBDm92tTCQfoCA+ill9mZy4VC2LY3DvzfnSuxfeHEFdqhdDIGgSwOr6s7jAoHwHOqJEwGXb9VN+NgT7enVYtAYqaYEh0TwupvOf//tGWh8AZ0pz38fwZ/ieEP6+xaduUINfdx8JnWGxQxN+L9djxbDZ/8isndQXb4Z5nKcIV9lATTNQ1uNJocqy64/jxb1K0LzMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi5lwXh9CcbaFL7FX2QyJH0nKHSnI3MpfhAxdzBHxQ8=;
 b=hK0K1r0m457zX1Mwbf89FQFWVvmnr1ahIotT1sIZjxdHo1DQZWbbghVM9bQr7UpTR95yOb5dLoIje5f3ePFxwQCZ36wFZqlXofT7FsxK7ze1aaxsPqEYjcWgvogWjuPLQKTykPJF0nQq8j2R+8cBntYClbaFjpkPjqU6dE6XPYttgv3B9eS9hKABVf2kuPa3wawOlSm9dscn5WWuRG7Y85dBlOy41ce+KJnnglumYgIwZPOC6wf6JqxCRAL+TGYDTgHprLOfuwM9eSEixWns3csz1ZTW9PTq/nIqJSKDz8/TUTO5PUVCjwxiX38RRO0tH3dpQkREw+1XPeh0DcCa2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:15:49 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:48 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 23/31] tools/intel_forcewaked: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:33 +0200
Message-ID: <6c25941170913726ed4b4ec4296e16127cea751d.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: cb4109fa-23ef-4d28-ee4e-08dee26acde3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4UNfiQMBtJDBmQHAybnTuj9cOY1EFUAwSYomcC4tYj6lAZhXUGCLCaG9hyig+CGsUm9V21sUc/PB5LtAeUqK+5yEbSESBVIonnv2MbhXqwYtHp8KLOKgA/Tzy6YDPnHuye/DOGgteLlshsi45Z87CX+UOyrAWvflFSMSjeYRzC0Q5nG/S0Et7KmM/zoUTohyx4yl4rPRbqkokFl/m+fupfiQHtEdl6OYfi9bu3dsQnJF7a/zzPHvmRepJRjSG2HCBSShErjyF7FT4TTjNuVFUXBpa0ZZEArJy7pttktHEd0gqq2SVPQ9xpBYV5BoqjZu0mR9ZzGZUtEsgzjyL2mpzYh4igaIJSVdonAGfnbZCNb0WWLg9VGl52ZhDtUduUbFPcAqFucZxIgq4rrowzLiMeDQqo0EyEXL+8EXuKNz8WVELvPguYI+CXhdyEEGb2KHaR/L/94XzBMivyh0redSFhhlT43qnJtr/HtSQlX+yLiapjQxA39SlNe1rPgqI3CJFkxlLnlH0P4p49FzDeKao2PHmqVOfEa0ENNLOUOs7B20j9plje+xyne64VHXQuLMSdza1bU2OFgAgUMnSRCvRIUv2D/UrCkdx4hOXoGs1sCP8QRx18cr/OVavLmnEdYBNgHLDrtX2XSYZuKT8waAuNiCYw5escTBF165TCFSglw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b4jwvr2Sn+Ob8pN05C8n5T+oUKb8cwdnNkV9ArZgQyQI9TGerIof4NzBvmX0?=
 =?us-ascii?Q?cj9Vke0v7C2tYFpCPuFfk2yxo2NpV0RjI9aFoBfTX53iNnrMbVryHlUHltZ0?=
 =?us-ascii?Q?6uIv9nxi2qmiJzLb6eIslcJrBPEe++5yrmr7SFzqcFk7qMsgIVod4G25ON1q?=
 =?us-ascii?Q?+rAbKlxr8YEG49VOjkREu93WZMewRevprmX7eUm+esR42ggnAVzBAIHeBrOa?=
 =?us-ascii?Q?cOpvaKro1bAPcLYhhGLPVQs1Wb9Q8UZzJhjnX86CuR+Lpm+WXg6ttn7IT48z?=
 =?us-ascii?Q?iZ11SmSkJjIohHCHwCQVTKYP+UoUVtYVy+tkbI5YpZIaOSmrH2PXjw4USMFh?=
 =?us-ascii?Q?IP0PRvwb8eoU8spq+acX/V5VTZ7vVDBpKcihkMZQgfpzjsCBWv77UmJeov9G?=
 =?us-ascii?Q?rwwfbhMhk+hhSV5OB9O5fjYbit25D15ZILS3rnFhqQwZaDu6yjrHADymmzH8?=
 =?us-ascii?Q?01VednGSz2t+orPmnXU0ntdoluy0838fNOoYJudmoty4aF/r+MsvtnF7PGLj?=
 =?us-ascii?Q?VNGcoeRr/oyOIzlufHDU0eEBFqgD9vqYvC9KFD8r3zsr6JBCBFuv9Zno5+fk?=
 =?us-ascii?Q?T9dQgsSTlPMJv6qWOLrTAFyfZIuKBwS1LtWB6zuKXgqfS9dHzxsZin+Zwg83?=
 =?us-ascii?Q?eMoFt1PgCOafwbMiKiKzymf83cu9T/+CHxL4BrCveL5OjG5FKwqYqzgLVTxt?=
 =?us-ascii?Q?1N9WIyoftoi2CUYzjap34wOmNVS/kqCbFXgYsR1A9Ipn2pI8iRym6ZfhK69I?=
 =?us-ascii?Q?8/e+pySShlLvAVxRViFDiN/65e5v+9J7+jtsM/LaP/4uNnT2I3H9uFfpHpS5?=
 =?us-ascii?Q?EkPaVFqBVMvJnGTdMQM+Ov8HrOo4d8c78+2mrBCw69hRVa7lytTgqa5CdbC5?=
 =?us-ascii?Q?FNo8DH17O9dxyH5yFeXPRjh7KpX6ABokIUFczfYV505keQBgHZ0YPgsT+xMC?=
 =?us-ascii?Q?Qj7rtOUXaml+E0VMin+MKKFXqDakOyg4LVQ5r1F1Rz9PBhZrE28PJ5qIuOWs?=
 =?us-ascii?Q?efQySP8IPj5QClLs2colV1wrfgT1qkL6F94azn8RgANFFGDnm+/HPrUJ7OHS?=
 =?us-ascii?Q?gOJveXSooH8jDmMrHLirsbuM1JjPS8O4spf514m+u9yqCDo7TbSq6+ZdtuIY?=
 =?us-ascii?Q?oLmcROAdTHzrZUv5e0M76ZuTLPAkkp+3c3196U6t19knCQ20YQYm7Tvfrj1/?=
 =?us-ascii?Q?ZpTG/bjBGukY4ve/IWUaiHCKVDGpvEHXpuU+uXqzgfgv5VKASM0sFsOby2Xq?=
 =?us-ascii?Q?SocQYoqikSzMSeRKVgIXC5j8fCuFyAdtVfXLXWSe5EEXkT77N0qRkTlNz/A7?=
 =?us-ascii?Q?TC+jreD7KzfNpYnxytsksBo4c30koL0JxoSBb+EgnjlFcdbwRSU9HnvZh5wW?=
 =?us-ascii?Q?dKTawML7kBeeepUwyqf583kC0ui6JhRIKZthwiDZ98TEuG38LYj7mtxYt4Dj?=
 =?us-ascii?Q?uQiNUxWfjfFTUGGmtxG9CWReFFNGgyDkJG7xy+BHgHrKcV6058t058q9+3qc?=
 =?us-ascii?Q?VX7y1aEFzqtkA7YfbGBehFRwsA3et+d0EtKaz8kEkLm2I5WOsV+PiaZrspTn?=
 =?us-ascii?Q?3W3avmR+kSdO5us5ehOsCagnl2FiSxiipgVW3FS2A0YayqsQT06b3295OBfa?=
 =?us-ascii?Q?VG5vnro8pM+8Yon86dMKPlfqLbBZ7skV6HXJQ/OzdMuUMIR89b0yPuDWePH3?=
 =?us-ascii?Q?fyy4HSAsdJCKeUlw53scHXPGB5eH9153v2YRhhASBrYH38eqp4k60U814lwo?=
 =?us-ascii?Q?Y90n5WqRpIU4nW7OvCwlmPOMpCvmUnE=3D?=
X-Exchange-RoutingPolicyChecked: YFOmcMfbP2wdw17srYm6CIrmC4KDiT/UPFOAS2hBIxYKSvGPqjb7H9cQ22rIjFX1PIStSb59yoh69PMyPUTMHs/rcyNMo3VVFsWUULIdtII+glnHZzwC/Z1rtdvOS+11hdq5OKw6NPHs2mT80F1gu5vtw/K8DSkmmC6gVeiQ2HERiQXZSKDp4Lj6/pEalh9wtXaUYskBHCg3qkknNXxeKB6rEdoFlIY+u5R6xlg/Sd5zx63NzNMgZz3pTVf7y3gd+M4w2ztbBYR+aoaZLyiuxbJk/ZdQQzSwgDDtmmdKryH1xVaffgfYQyMdzfZLUnSLIgDicOE8a0aj2J//TJfZGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4109fa-23ef-4d28-ee4e-08dee26acde3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:48.8571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQaoMSwwjd+/1osCj8lGT3f4XaO+9fFsAxN6D2y2UU7VVnb0ZV+/Og5qTXJk9NmBwlObUI1MthhBWN6s+FNxSjGpgROGW1bW/XbIPBaM/4c=
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

intel_forcewaked only needs the register/MMIO helper subset, not the
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
index f9bbb41a9..15bd40dec 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -18,7 +18,6 @@ tools_progs = [
 	'intel_display_bandwidth',
 	'intel_display_crc',
 	'intel_display_poller',
-	'intel_forcewaked',
 	'intel_framebuffer_dump',
 	'intel_guc_logger',
 	'intel_hdcp',
@@ -108,6 +107,11 @@ executable('intel_audio_dump', 'intel_audio_dump.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_forcewaked', 'intel_forcewaked.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

