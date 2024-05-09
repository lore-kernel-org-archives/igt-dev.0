Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC65C25B10
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 19:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C173610F0C7;
	Thu,  9 May 2024 19:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDoXoDtR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB8E10F0C7
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 19:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282210; x=1746818210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FUwLNW1MxetDKsUZEJVc2b/WNCUadaKmlBqGLTs7oJI=;
 b=SDoXoDtR1jKCxWLtgdBKZsIyc6tPwr8WoyNLvpHmRtaTZNSUCpk2JAvZ
 P8w15jtw0nm4IE3CsE+EHrpgBgL/lGbSNymNRzvrNqX/B4BdHpV+gkYTz
 LVpc8BLIYvaJ0NOIAeDBO2PBeiMnztrYuX4KuPoOdBAVteI+G36bxseL6
 MDTzdkO53+GowEtJ6KADRwiicJDd0YkihasFBCBbh0J74FgfybBHF12D6
 NUqdcryOnNK2+lPW5EfXoxIZ/e9tyQJfeXSBhYsDTKKqJ5sOOIqemjWFk
 xlk/YD0cQDmIRY/HcFTt8V3htw12/8lY4EI5Hug41k9CUkYfAAAxkMcOA w==;
X-CSE-ConnectionGUID: tb89ODBhQwa5+8fXEZFimw==
X-CSE-MsgGUID: OXkB/K6CT4+vXL2PL5nTYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15038415"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="15038415"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:16:50 -0700
X-CSE-ConnectionGUID: tg9EykdES+eAzKllysz2+w==
X-CSE-MsgGUID: 79qUuZdCTbON8tTzt4HfkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33879227"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:16:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:16:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:16:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:16:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8Dl7FAV6NrmIWbU/mkEYyt4ejex2KRidXzniM9qimibgPefxZlbVWi2naMYLnYDt4OWIxMLYKkgYjCbagp7Bt186PzvSva5qeTPkjV5bryTroteyWnmpZY2O6DABRuGzuCjkQUj2x3+Whvx1MzKRSsEw2GJ6SuO24K07cpRJOuBId+/uIToB4SVwgUzN+zHkK6LLFLBKK3avO8YdAEwDhrYcfc+iPQ7Lgb5iqTNktDRK9lIOkfMrxAn2c/wgZrp9aFsx+dyd/TgAAT7CCtJ0uyT1EdWVR+bydXqboXiSTHhX3KLRrJIcfk/UNHYmKGkNTRlM9HhPTOlbT91ggLO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB72mUdxCypQZOmQQOn/X3F4A6afpI1tEFXs9aMDpfQ=;
 b=C5vcGCx2VoTaaBzY5WJ1ioqZaR1Azw5Xu1vXPUqTQNpyEjneaEyppBlYuDpgWD/FedR13lnI87kIw3FD/VWo4YA6oFgGai2b7dHbEx2qiZAHeqg2IoJ8XfwqJLjk6kFXtD+0tJ8FvzLhMVBg9+3mxZjT0UetYF6eaF0CKiIXF2UHULqxKpE/BYaOcMMbSTn/vs/Ymu75en6nV+h45yKBww658bBMim0CGyG2cLWs51lc1qQMwEWVlh40b6kT8y7lTbLWNk5/W1Jsx5Lrjv6tUxFwWY1gMzswlUgO0zs19U0JV0+B6vGptE+FKBmqLB9ZQ3hotRuXcGxuJ8q3WR9RqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6602.namprd11.prod.outlook.com (2603:10b6:806:272::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Thu, 9 May
 2024 19:16:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:16:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [PATCH 2/4] tests/intel/xe_pm: Also disable display for mmap_system
 test
Date: Thu, 9 May 2024 15:16:34 -0400
Message-ID: <20240509191636.504200-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509191636.504200-1-rodrigo.vivi@intel.com>
References: <20240509191636.504200-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: a18972c7-7bdd-45f2-e02c-08dc705c903b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+RZcC41fdukl+ALnXplL6EmrQJ4MzsCR7PKopK3LslQOFlbKzU1EFzklwvEE?=
 =?us-ascii?Q?v/AKGmTxVHiY+zbpjwdGeEVQfabDMGqZhMEWFAXATq53LjpxzJNLQlEyih5u?=
 =?us-ascii?Q?7l6CAJMI7WeQkH9ZBwmrZK/HM6pnY1ui34Juvbcsk0nmj53Vq/iAeiFByaxp?=
 =?us-ascii?Q?/ACagnPKr+BlYSBqruXFI9/GRglr9yyi8J+EpmEqbXrGBwy5j6yrfTEnikR6?=
 =?us-ascii?Q?SCU631hCzXBSobZatizQ2twPi5FuUkkWqpRZCrS+3JfzyDmw6lqogDUbAVgG?=
 =?us-ascii?Q?/vu35Yj/yWHQzjyKzzSkh/bPpgxISKAfZrlyU+TgJ0JPsbBO+jr/V4VCm0+L?=
 =?us-ascii?Q?ms6XATLtklx21hMu6sPiG6C2HdR6J0Rb6n0inx+2Evi4SciMBCZixlGWNMWm?=
 =?us-ascii?Q?7549CoPFu3GWy3ailO+jHrJVPkCc0wnxx60PqO1BMGTxBwkENh/dHn6ay1G0?=
 =?us-ascii?Q?Pl0qLSRg9iBcoBksvnXPRFbBiqisLp0PU50eU8CZr5x/qkKLwjpffPU9jGSC?=
 =?us-ascii?Q?foe1bGep+5BG4fabp6vCej4EG+dDt+a93vhQ2U4f4B/YzWFGdMf7VwSKighD?=
 =?us-ascii?Q?N4rWKUdWAmuz0VKyrmxxPL98n6KqYOSINm2JtQFnbsN7pjy20JWfmRKOweB/?=
 =?us-ascii?Q?9gqWZ2XrSmdWyYS1B2uUaCxdFvb3UhJJqUH455JA+wIgGuJYnVL2Q4ct8fXN?=
 =?us-ascii?Q?mSI239Nyxjy6F3wDO6u7xjqhlOpKq5JDQN/K/wyHxhbpmghfdhUY9pstg9Tj?=
 =?us-ascii?Q?9y0ykEOxLCd7E2BqfI/9cYjAY/Lhv/1B8UP6/HODQlyBcVCudURy+CdKqt4s?=
 =?us-ascii?Q?nGY4qVAXQeE8oeJPmaFtkrV9DQ/wrzedZaJjFxOouRZQtuB1S2rHdXwr4rLc?=
 =?us-ascii?Q?qTd7w22lD5iHuvEmM1tL3YTY37yvKMhm4QRyguPglaaM8vjfraY604xKOTmu?=
 =?us-ascii?Q?OgKdBXyRO7Ki2niss+i7jfxC9pTN+iamHId7WsswdX0oIfZVVI6rQSQjx1D+?=
 =?us-ascii?Q?Hdgo2XcUMKi8t+4qsuJ6FI8FCcbhdRZiz7cMAUOuLxJ8cd4YJN+yYs7wG+Kf?=
 =?us-ascii?Q?eZT+1dMw7QZ9mq6pxV+Y8OTbXdvphUjayFGpp587e9Z9qRu1L7hCnaT3xXV5?=
 =?us-ascii?Q?nl+WEQBZNl+siOB+5OYQUZCYdM6V+LtmHVAYV76hdTRPF7kjBiR2RY8wIqC6?=
 =?us-ascii?Q?6qyymcEiLX9nmQSL//J5F5ppZi657EK4WgkVp3f44WHFLrnzQqx8F3PsQQ8s?=
 =?us-ascii?Q?C43xjZMUOSeHIUGudiJVPiAxDza+gH7UmsHZKO+V9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KKcmqGCZiVv75SOG2+XOncbAtkjcQzynr+BSMaTAcf23oGlFIYdACY2nyWBu?=
 =?us-ascii?Q?iA4xuIvnpBrlaCRXiJ0pip1B+Yv5KoAjRLAp2bIrEcJ1ecL/DnGiy2PZXjvj?=
 =?us-ascii?Q?Ca59sQDljtsspbIQSWs0nMmJFPRf4O/wQsjK/kzlN2AvVLAXhjHEkMjpcUUD?=
 =?us-ascii?Q?m4EUcy9m/YbO3Spm7ssO75f5mPgn5HFlaFale6qX58+Wkf3ys57Cg7TSV1WI?=
 =?us-ascii?Q?JwfM1UvNtGkLqyEqUjVXs3lwEeIlI38l16jEJ1/R7AWIreoHvbi5EuFbMOSd?=
 =?us-ascii?Q?8ynCmk3hRms4JDXqX0HE5jPaTL3QaNjKCoR5hVAb+mLWzibR4a3Vk9XxDlAC?=
 =?us-ascii?Q?3xCva6Eu3Rn2iMhWil67221xAlM8eNBRiK4Qn1M16dnJydZsuTmvvmEnbpBg?=
 =?us-ascii?Q?1fmjQtulJil5mPqv2l8hCcKG9kJSWcivaAuraIYx4p7irUSYJN9+4agl+EvS?=
 =?us-ascii?Q?yz2AniuLcOSPV8kqYeaz3vss3xLve0mlOurBvwCFd64w+PjRqhzWU9eMMtjc?=
 =?us-ascii?Q?Sxyd87uSw+OoRqb4Pw3uVNpKEVUQ720ru/FE0xyA61EM+SDTSy0OTchq+5Gn?=
 =?us-ascii?Q?Ma2b1Y9uh0o96Eq+sHKbCzq3Oq/YbUyhBtu2vZvGyjplFCWYgIL0urqViiZS?=
 =?us-ascii?Q?M+N0FiRyrbRzjOn5Ez6nhob/6Lj6YebN4sl8rf0koQVEA3rPT0nGuWobgamx?=
 =?us-ascii?Q?y8eSoDIRA6lP6Fixh8FhgQy6HMXB6juvlmlr6LZa7C3hVO8QstgtVOc+zyP0?=
 =?us-ascii?Q?a4XTI2pKHBpSueKezBZDxt17PHrNBB/jfXQ8eSXBqa2y2Ts2ocVp/PJG0qG/?=
 =?us-ascii?Q?LSEafGVAkFhxGuT3MXDwAl4dpXsMUScOnwtoH4dt7hWbcwRS4XOjhFfL2etY?=
 =?us-ascii?Q?+gZdRMKzsCeOEHvBVyr24/LZ7xh6qL5rbKYTM2tHhtr/Gb26F7FccyQzshkj?=
 =?us-ascii?Q?umBCZQUsvmWiOOAQCE+mQG9+tapF37lN6bEZZrBaY57i/kWHfnIAY96EMUHv?=
 =?us-ascii?Q?FRHBm3h0Jl3i9+r8qKBKfaxKsC1TLp0vRz3cwH9eJQjIni6jWwBMH/OLb2fP?=
 =?us-ascii?Q?3pV3T4yrtjBaJTC+N01Go8N2Cac7mL01GQRtbE9Fqk7uhaywRhMJRBFkxq9u?=
 =?us-ascii?Q?N8J0uNvJL673VgpvowbXj6NheVS1VtTRV1OXMe2GtSGdHQJazrzUDvddZ164?=
 =?us-ascii?Q?w2KnLciExrNvtAYuqBtaxfwC9RyTdjnEljvVGs+hKVlY0JN7DOrYLa154lHo?=
 =?us-ascii?Q?TChvDCfrIkXRr2OHbxDKu5ryoVD+uhPeKaJ1T1vNg3Tpl06PicFv31IOu+gZ?=
 =?us-ascii?Q?tKf2hI3SyrXLadn5WNc5MVml7hs1qyXs7nyLqNSyRRi/VdrvE5k4VqUUSGtf?=
 =?us-ascii?Q?Hrb1O5LUPUYmw1/4r79Q1s4h5q1/B7ln+uNeNN+2TnLsKEOTDhJnJedaqQ3r?=
 =?us-ascii?Q?h7Q/3D7XfE6EPbKSM8LIMSrIRoTAPMhceWK2UC+64A/DASS44LMy4e56e2uG?=
 =?us-ascii?Q?qyoVuAcC3SHW+GWIlcLoRqIgSVV59pjn5KBQ4i4J93On9WovuqHZ4EG8QZY0?=
 =?us-ascii?Q?dXyfPxdkTb4o2006zfuo1vjNPOWB58M1IOtvNdOS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a18972c7-7bdd-45f2-e02c-08dc705c903b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:16:44.1290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orEkH4V9dgbzv95VMpL/R9dJzC3FtEILESiPsnVd2MeYPiPRcpuRBI3oceB0PyYgTEyh1bynQSyRTpbxBt4URg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6602
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

If display is enabled, the always-on components will always
keeps runtime pm references, unless you put DPMS_OFF.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 661f837b2..89ffb8224 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -724,7 +724,9 @@ igt_main
 		igt_describe("Validate mmap memory mappings with system region,"
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mmap(device, system_memory(device.fd_xe), 0);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
 		igt_describe("Validate mmap memory mappings with vram region,"
-- 
2.44.0

