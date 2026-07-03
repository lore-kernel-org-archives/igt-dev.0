Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399FCC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48D210F829;
	Fri,  3 Jul 2026 14:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wd/ATx73";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0FA10E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088939; x=1814624939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sOPK8h0/sS+eB7wZdqB22D4h754FvzmtZXVvtBxiLZQ=;
 b=Wd/ATx7384QBDLCZ6UYOzMC3NAptvlzr8QADl5xg4p5BtQeiqnNO4Dr/
 xUTmB+CvB+uHZhiX/pmOCoc9E4cN5jmjfdcR13tzTzVLxUEmPr/EgyJwd
 cFgS0/N9phLJcLL9sJ5+6RucQs80vZyU0XSSh2n7MmLGjTOLi7erYg8k2
 3YsM/b4fivenDQma82upC1vLNGTaEx2RPt9g5byOLYMT9jNM3n58od52l
 cGZR070SlV9lKpjCTiTKjX+Y8S6Hj7wml30xo/jdW6aeVd+YGhjTZWX2b
 rom7r8sD6OslGeTVsRiLpimBKLBjUIwvCJ56ms2JHOvJID5crG1YMkBOi Q==;
X-CSE-ConnectionGUID: /b9yrgQFSZKp95iVs2oR8w==
X-CSE-MsgGUID: 5BTGNgjzTzKKjUO7uEH6lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83877915"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83877915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:58 -0700
X-CSE-ConnectionGUID: IZPu3fhcRAq7mwP4bLIyEg==
X-CSE-MsgGUID: 8HVAizwYR8qYkv9P3MqEng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258019333"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:28:57 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1M0ZIV6THcUrlhJARJBiAKC4uIfY0nxcnggjcCiM/VgIY+LmxJ+M1POnI7UP5YaS9SONeQB9OOOCUp4CDE/vV0J/eTMkEMp8eY4mECjbdBsuf9qK34/MqF9K7I382dPjlUfImicWs4SfsuYS80lZ5nTIY4alZW6iFnYEPJi32wxBiav0q6dg5hJrb4Bczv6jhXlYV6zXxjLYX1BgIozuYj7Wg9/Yh1xr69j4yDWv1fmDjIWhWBTZ+3L6aD8naXVIBTjhIbCRP6onO3N+8vl4M8QabshBExA0Xmww08zUAPXM9JFoBiVuQsVg4/vLGmQjN97qcYYYPURcrrQY5XkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siISF7+A0DNFnVl68z9AdRIn/J0w2AjvlIcdykiBK7c=;
 b=CntycnYkgzSZyKkDBv1ER2V5flIjmqP0rvGUFC8m54LxlmKmJXPAOd94OA6rQ2ZAiXGdYODTOpa7s0ibJzeRHORI3C2flb0rpp0tP2nPlt7JOqUuqzQa7oWMsO1Ef9w8JPauB/FZcQc4bnet/Apop1ejXcqbVgJ8MTOQHNsH8IwghaKGR33IIBO6hfaDa35HBoRyZ+zfFVctvE5/HQcMo5TvH6bwHeP1M96Pmw0zYuXH7P8fHFNfkPxS1EJhPJFmeaNNTrkWpsxg1t7jBxrBSjbApuLq2TIz2NVQJCidyy7yX7TgponqijM4HBLtTBo0oZnMVOPKnLIEGuUoYIZtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:28:55 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:55 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 09/31] lib/igt_halffloat: introduce static
 sub-library for tools
Date: Fri, 3 Jul 2026 16:28:43 +0200
Message-ID: <86f7e4fd4af5c051405e0a82a1ee41b478444da7.1783088106.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e8be12-9b90-467a-a2b2-08ded90f6964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: kp723u70hRAs59acm1tGwcPRGUAvHqAnU47Z1utPvazAzoqLqq5MUEqh58se8iAnGVeW5mz0xUxfP5cJthWkJ8VCS3l6g7g/6xc4RcNlWNTP6XBPDrNbuLFHGxu4n2sTsm9CLvlEIcQEZtSRb9jhsu3+amM7eRoBi5wthSWwGTfzruHdxpNeN3wjV8Un3wqaJrYm6XlnqwigoEOrn40DpQDQjAjbTZmhb2o0cxIeQ1ygcggaXZxB6YWbtzzpj/ipAa/rjdQSy0qKPOGO6XyxfEzpg5mMdV8vyHisdawUZlh9IP7Pe6gOpMkeO17MHQlQ2DoCe0lRZtWSZSe2NsqAwp6EE9HuiKkxZp8OW+5LS+soU8ZLBQBg7eyZlt/SCPfbeBNcP5WLEf6iT9UcyePDyHjmsG19gDpjMPN8foi54joihlxpH9XLuibr+jz+L9kVVZwpFb2yGt2fNRS8Me3bfc4CI06eUcamcoSIZJbW2wIhYoXQPQ7Xx4MBU20OfS6wmTi2hI7utdNrmAi3Z5CpGgcQcG2aUDAhS8R54XO+6JpfO7kueM5gD7t2j+tzT78M8AY8+OEACVFc5RZCRiuVXwT3DqeVCWY7fRGyksJzXDBMkG7py3Nq9n74JmUlUhGNmqTQGrW7qKZC5buyV505Vg+h79Rq0DIUo1sLuApJU2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ao+sGCViiYdE2rp7nOe3Oy+msnTNHufPoEc11wym5L1E/4FEdmy50/dnvHV?=
 =?us-ascii?Q?k4HRDzOaFDiYmbiVhmdX7KZnlu4YSl/LOlr0dqNR+VksAZYPWb21Qe/HLO/N?=
 =?us-ascii?Q?zvlv9SDG4qIsbzvNOhqJDtTpG3Y7FlUwkczvw2+0iA4p1Q2JnhmcjddaMSGy?=
 =?us-ascii?Q?nNBrdVzyieu7k/N3EjGzR6pY7YvNqOQnjGuf4bgti5vzj1TtslDLm1U6yEb3?=
 =?us-ascii?Q?m4SeSkIHP4+UFAyA0J/7PpWT4FO53DBDnbdFPSjxD0sCDXhCt2/YSaIY+Mf4?=
 =?us-ascii?Q?/MLobchJaIZYfbgZ510Pd7Jdpmc8hcJRBCOqHuHHul9aKI5FQ2lPwIq3O/Un?=
 =?us-ascii?Q?vYZV+c2QiKj56FPHbd54YGia4R/GlrTEyRSp26CzfdNBFp5s/N5urn48DjfF?=
 =?us-ascii?Q?ZpouBBdhsrBfdmvfLRo1nuJT1rFmchjzldszX/vptsziOLWJzQQIVDwq6eKY?=
 =?us-ascii?Q?QNPk0abnTF/WojtKCjL3QEZaS9WB0Ug2FUfkFIYV/4jJpJnuzsu7qhXKOLES?=
 =?us-ascii?Q?tgCXfIU+2XxDBphDj8W/hYjcTyv2MBg25lEbZpDkHVg7Vo2udVyHpJ+R7YDM?=
 =?us-ascii?Q?3zH8Xw2mEzWahi1QzGicsnndhVrOW28sUz3e3oG3XdgVm3c4MrwtlKZ5Zi4H?=
 =?us-ascii?Q?9GUsozQNLN5CX1vPXlrns0lyyxp5krXLNlOlMalfiyHsZBMVpkTnwxgt9afy?=
 =?us-ascii?Q?DrVaGQLiA9FfSxUhHxABrD+qpT1eM0lP3mG4J/iRM/CDdvQBpFnc4Qtdgpg4?=
 =?us-ascii?Q?+XVrkml8E1+2QcbRUk5c1xnvmevHzzN0/5PIT6tLGQXR6Y8bEHEhhztz6+mn?=
 =?us-ascii?Q?iFaATeP1yzB28kvPLDUTSz9L/4+8xh42mIEMwzQjG8yzprmYoeD+ExrN3WMg?=
 =?us-ascii?Q?S82TLQI2DfsIHi3iQZyI44Xm2ors8FEx5hx5kSGJzUzACWhqRkoa7EivYIeP?=
 =?us-ascii?Q?125nwYnbl0fnWpQ1D8W2aDJ6yRKB/Mhqmies70tzSzurVaRiZVkUPhqTOnT0?=
 =?us-ascii?Q?REUeyFF9fskwdmMTqzCBuI0v0MEcOOQ4gbU7qYqeHyaBqz/ZRu46sjQpdRBQ?=
 =?us-ascii?Q?un2IMedEK9zOam4hyffXlbkGuYcreTTQXYOqGq7dJceewzi+syDA4DTpVu5Z?=
 =?us-ascii?Q?Lc4o+/MSPql1xmlS3ennqc1FqG6pXfue+sRtdbydS7v5Zsm+Ju5cO26yj0+9?=
 =?us-ascii?Q?5K9KSnJf4C0RoMnmfvm4dxJ3sEuzB2LANZhCVVU2p9nF3uBNtw49Y4DO3WfV?=
 =?us-ascii?Q?8hwvmJa9CVKXnLSxeyQnTRQKjPZBfSklg+KJ8e2SX6BFAQGUeMQJ1RXsNO6o?=
 =?us-ascii?Q?ck79rmolZdZOw2BsqbZcq5Aatn+d/DM/8sqw0coWoblmler8BBueNUgbWCRc?=
 =?us-ascii?Q?Nu0ak/8A0qwUQuBoocVGqtEHp/yvcjPYx0zVQsFFj8/wkJx/UcyQ83A0ndt4?=
 =?us-ascii?Q?j1nmYrTH9HIhLoZ5ern7iDwm+vItirxWKadqB198yNR7nHMOOc2tQUJvHYZJ?=
 =?us-ascii?Q?uq6qqPmEoaBJB5lv0RmVprQCrA5iB1CwKs5lm4wktlBDS7Gl66xs5lCONz0f?=
 =?us-ascii?Q?UCrc07YupBifGyLMwbQhi3B7gDtf8P9yc2MHOEl8hKKS8x0YjqfC7tdQYWxV?=
 =?us-ascii?Q?2ma2UFdzfotmcVCtuVRbVPNQSg+Eh1tqAeMDgTt7TxiLrkYzYNuTEnbPegNF?=
 =?us-ascii?Q?B7FOR7T/rxhvoDeJFE3hgdyjaVkKPmt9U39EWXksskh5OvPrDciliZOUsBoO?=
 =?us-ascii?Q?TAu6SP9gwsdVecz97v7Ba+/rBTdK0xQ=3D?=
X-Exchange-RoutingPolicyChecked: UhWJ8y1M7CVRxFpfqU3lk56/dOnX75eHrYmd6458tVvA9P412Zl7Cs4E6xmVghvLwxZE/JY0M3aeMkfpTj2ByXsz1rlGzoMy5qMc1I+thYQjycxR924MmJD2XTyWJJzvn7bV40Y/lEQSsEkNYlz/VvMxq2MACHGlYzoPmt2DhEozUuXZl8ZnIAAmhuutEFeCDgsw/ROcXyoSTyX6BgUpqM4unBybBgNoykRsQLI0aARBDim4JYstsFFtQzJhu08P4oTNEYAdVEedxWxhRE99jqTt3XgowVKMpoNtHALij/h0wR6MlRe2XOFS1KZGgMkqe8TduyRr77ND0f+/GusK5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e8be12-9b90-467a-a2b2-08ded90f6964
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:55.1780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSu0LY/ICK4L7CtZT9wMqmM86NSKLv6A2VXCfUcLqPIkGF4VG+R/PQaYcf7ymTafBjZ5uJ7KR4i4wDBCrp1cSCSBUxOButHkhCpM+kwy00k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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

Add lib_igt_halffloat backed by igt_halffloat.c with a math dependency.
Tools that use half-float conversion (e.g. intel_vbt_decode) can link
this minimal library instead of the full libigt.so.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/meson.build | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 2c1fbcd43..93db217f8 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -415,6 +415,14 @@ lib_igt_stats_build = static_library('igt_stats_tools',
 lib_igt_stats = declare_dependency(link_with : lib_igt_stats_build,
 				   include_directories : inc)
 
+lib_igt_halffloat_build = static_library('igt_halffloat',
+	['igt_halffloat.c'],
+	include_directories : inc)
+
+lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
+				       dependencies : [math],
+				       include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

