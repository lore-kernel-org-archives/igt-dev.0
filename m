Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699B8C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 18:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A6510E1CE;
	Thu, 16 May 2024 18:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzk7Z7LU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D8810E1CE
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 18:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715882861; x=1747418861;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=341c+P7+EM+LZi4JcGtBzsObSeTRZYCnfAraxycanUE=;
 b=mzk7Z7LUzbcnHWdz23QCEUV5j/BLcvS4aG7r6XChC9qRcmKobJ9TBPXn
 NoYFKvOoEK6JT28udmOA9g4T+P9LSZSVeVy00Rb6iFLIXPxWAEGfWJYf6
 qDAXexk7ba9GUcbyX05c2CFDkkQiV1rtXxFSJvlgBlw84QqueIT53Wpyu
 DNzL59fjgOuyBN4NmEtqtvZGQxNYEPNYqDykj7S0VVQKZKLlcu+52r3oi
 0pJhNsC0y1OYSiTMTM39p8+TuCEUpqVKzfNs0ctGPvMxX7im5IG1C89B8
 PxSn08zgjyfN46KmNmswLq6V3/NwlBQqCiYf6SBu3s9dBmPU84onhLHbS w==;
X-CSE-ConnectionGUID: ZjHbkC8ERfuXcWfLjZdYuQ==
X-CSE-MsgGUID: VgFTQPxyS+G91YmqagvTmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12233214"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="12233214"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:07:40 -0700
X-CSE-ConnectionGUID: yQ7MwfWVQcKUdUi80+eLHQ==
X-CSE-MsgGUID: Hv384mdvRPeSlDWGrnaN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31519392"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 11:07:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 11:07:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 11:07:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 11:07:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9X3yM/rbXb3I/JRGHQ6v6qxXkw7jxyJZhDlSXpD/GpuDajleYCVBYpr0hk1LlaOFlXvDqLEzu9kB3GO7g7y4q0I2EPrS8HALJGisTgwhBDyrXVkBFMWUkFwK+c9kQxHz3RZYfGeNkiIRwMr4XLzf7wJM/op8n/t+582qdVBYGKhsEmDe3x9y5JQAa8xG6ZzkLwSnEXOHYmtjgcpYkz4hNTayrcspcXP8bbJX+At+/QAprRMl1fQ2DxRWO5EJjdZlLkOj6TygfUrpuFzD73XOjJ9c6TY0nktgfh90b0PbkeQ8F0ZJnLUGzZp32RjT+oGh9NLoECGtRk8pBSyJzoEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WX9lDODvHWzXD899F5k2NK+nYEUpcRfkGNu7uHKiyOo=;
 b=CfD3ZBTvuWzdeV5cIrYyjVU+zdY3ixS1EduBDT4AiUb20xMAaOrmjUqPO/H5+1bYj6ZKBj2Djxv1QBy8SS2UXVsr17+lLLkDFEtlUQ8vT7t12FBhZ7qi68Tb9ft4gPtmLsYgpoGvDt1LuXVHlP6NkjWcwEDeBlnIKOcFobqZFhtS+f5Q9S6EwFcndJkivh9GZ7/eBMd4TKcvJQL/ZOgU/qaba4M/OvZzvbx4fBTL2W1bDngxxPzV6IQLN+WgoOUlJalEZTib230tLggZd++3VbMlFug5OEggjUwTTp9xukl7JgE+orN4jiQrcf0JFD/tXhOGY0iTGjdu0yp17svktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4872.namprd11.prod.outlook.com (2603:10b6:510:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Thu, 16 May
 2024 18:07:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 18:07:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [PATCH i-g-t] tests/xe_pm: s3 vs s2idle: Validate only the platform
 default
Date: Thu, 16 May 2024 14:07:32 -0400
Message-ID: <20240516180732.144162-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: aacb196e-8ef6-4a67-48fd-08dc75d3112e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v6kso/jHq4pDK0HpngW+L1s7pofkoe7oHCvQQ3VZMpu58D5i4qE29TFhRY1I?=
 =?us-ascii?Q?yqA1RBGYPDlLcB/WQjXYq+CrdGSVgANi0P8exzci/MxAFCV/R4jkhJwOfUOE?=
 =?us-ascii?Q?1e0HdrM9zzMuOlukWA/jD432w6+6fze7sasvQYMecY341aBn1vnps+KN3Nxl?=
 =?us-ascii?Q?qm+wo3L6yYG0GaR+Mp5rxEIM5U05Jv3F40CPnMi7tE7QJyIKAk05QttPwfc+?=
 =?us-ascii?Q?Q9Do8sq8z2k99X5x6Wx6rM3N6uhdoNWMbzVZciVaOx/RG5OFrP5asU8JaMO0?=
 =?us-ascii?Q?LLdWqprMUlzqqypvTfzjjH9OvR/ZZhPO7iBIQcIB042l3EaGbOy3wDibbCjr?=
 =?us-ascii?Q?/Cz7wtwzL581297UdWLTXvzCqXJbTLgg+SwGMo3/SZj/dTYydplWEGPwXl7D?=
 =?us-ascii?Q?SczRYaL9Uq/csbwgCgAMEIS4lNnY1Gn20/+AL5m28EeORr5+BwFUyGsxzI1J?=
 =?us-ascii?Q?PEYF8GtQOD7NrSFkNHWJZVGZ1gYcDoz/A0HA1SuBqXBdepjrptkOkLDhB4PY?=
 =?us-ascii?Q?OmAhYzEWPvQZu/kLByD/4o9RhvOlcJjBGUR7yV1bOiDhnYcBjiXZ12mXyVQB?=
 =?us-ascii?Q?f03vDpMrJD//Ai7J7PBbpE/z12kTJKmyDz7IomA4aRO1PIAR95SkUEBQtJWV?=
 =?us-ascii?Q?noYePz4nRPSaAW3gBTPfs3lirUuYb5zzPvDj+QuzOhHrkcjnoG30rQfT2099?=
 =?us-ascii?Q?o2aEeI/n8LtuGTXOEoYxkmbJnAj/BC2wbS0mOFdsaIH4SEtqe8Z2tbq/bsW3?=
 =?us-ascii?Q?i16xgZGokpxNxWyeCZPSme1WEqAEacNcb92dlFAc2RiuQMl8Z42GkxV4ilU7?=
 =?us-ascii?Q?b7XdJQVYzO/LCP1Oaw5uxQRNtH+Ykk7H37wOxPjNUJD30/U1AVUHYU6zE0Qs?=
 =?us-ascii?Q?+bcezHtQb6CAivPaQockX17qr+JIAIdRfQZyMQaGL8gqxIESFRlavuvigQog?=
 =?us-ascii?Q?iMgaR2cfXvwBlodlDA6c0JEmdFBVVCtsPWriWgZjn95oDjRqGDphXAAWnVCD?=
 =?us-ascii?Q?QRphAwrI+ts7bbqUQLdDbfCgQ5tap/jmiMFGnRuhcSqcQL26lO872cGIFb93?=
 =?us-ascii?Q?r1RnI8jO2pJh2x+cq+HlaupQQdK/WmuIgs9cXTfMpArJPZfKe2fKWq1C7ah7?=
 =?us-ascii?Q?LWW+bm9FUP+a5Sh1kWrDjpEWVkg5Tm/roY40UGKP3NMpdzW8U4Nl5T0VdTQh?=
 =?us-ascii?Q?0a+almO9wDizZIOdcHWbCErewJPPzYv1xInTZO9kzumgp8LRGrnuhnfFFExa?=
 =?us-ascii?Q?AUPEWNNsiU6LBON1G2vunZNJEgg093zabz0Hw/Om8w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KH43a/caFDvGWGAjm7vsVpAHHCu7WOT0TF+GvqNnXOUI1Q0VqGq/F2kHnQ6U?=
 =?us-ascii?Q?bbqUvSwzNFVZcu4FtkMgxw9nkv0Sc4qWv6A6UcCQNToRCb2xYNXFliVzTfpR?=
 =?us-ascii?Q?cdDMxKGK+CLQXdxE/li1ab0skbvK2isD4AlyitVXHk6FdYagDiCy2Mosdsgp?=
 =?us-ascii?Q?cNOa6Ju+5in3z9BjBdCealmwWSbIO5GYnkUbdxeG1uGi4J06JXobuBevHAez?=
 =?us-ascii?Q?kaxWr51X3dANavcISEH8Rp+3PBSNblPmZ1Fbd9loKYbUTmDh/+iHJGgmPuna?=
 =?us-ascii?Q?TpKK42pjUHFFY13RCpNJ5NPuWFz8ZuL0F1klj9CvYm1ZxxjO+rRyF78k3Zq4?=
 =?us-ascii?Q?p3LPa1kPFwapJryH5Ld22Xsm9vNjG8gVZ3GoVwP55g1JeL4r+OMUd9lXnX+C?=
 =?us-ascii?Q?AqdB35PoHZoBQvV7RXQaHdN5ylFwZhF2HXH4N3dHhyY4B7f2VtbegUv9HG2K?=
 =?us-ascii?Q?HNTDu+bps/sAyaCiKM4QfgR1eQXxv3vFGoAiFrdrXJDedHuYe8TaYYag+7KU?=
 =?us-ascii?Q?WBlXrm1kGdcw2J45PFCflPITpQQOP2oAAORYesy3SZTKxdCS17i0W/Ly+GXW?=
 =?us-ascii?Q?uO7bbD5r/TVSw8kvc0oNpsPLV5aS3kvgNT6T/JDbROre63YaJ7Q4FSzQAup+?=
 =?us-ascii?Q?yvEiNjj3YTJF8PEtQ6qRl9X7vd2azUjUIvo/36dOiuNUpwoMvEGcb9MiO5tG?=
 =?us-ascii?Q?4tC49zUbnmtEU+RcduB0jEvSSjAsc8TvkPc7a8x6xqTrslNz0jmCoVRElLJK?=
 =?us-ascii?Q?WDoeEng1tDvXRsq7Kn19JpRFYTMqL4g+UpBsU8vuFua9nsW6dsLLxxeEt8SN?=
 =?us-ascii?Q?mhCOu2u5IlCS/OW9e3NvlPvfHwTkMiPc5Rip3soj3rKr/XN1s3ToOcSXfkQX?=
 =?us-ascii?Q?BlODNW66rTJwNb+xzmJ0JkuRqcV+xlTSzuWabraVN4VBRhx95Sl9iJYD34KC?=
 =?us-ascii?Q?hF/P0SI/NBOuXu8LX1poWRnirJbWdwPpmuoZ8nAaWUa0pE8ZvjWoJ1seDJGu?=
 =?us-ascii?Q?XUec7MU5JXpJOl5PmiHN+IMsVWNo+dgwRTC8mVEKDidGRsPg4JptWxlGvBjt?=
 =?us-ascii?Q?48qDrPp/4jrT6Y2WHqdnWq3eye/AmrKUO54C+XIK4TYb+L+DidecvMSPe2HJ?=
 =?us-ascii?Q?MtsA/7a2pb1RORBGx3AEsdMEjeel3OcihU7Fk3uNvP7QMF684yroUjpPa8MB?=
 =?us-ascii?Q?+4tb6SiUz/OS49nc6iKnVzP3TweAh/wr+WtTdttiOyB6QE7Sxb/rNaNe0MGH?=
 =?us-ascii?Q?GyXuoqcqRfcUZD9gpKiMGuyIzpSqv31RTjwN/UOoTjnzREPJfMuAKo6E05Ti?=
 =?us-ascii?Q?pSTfCbF/yuFaM6NO6hTMc23+AceIlKFbHwtM3bQPqyWymImmVgYZhb3Y4Gge?=
 =?us-ascii?Q?H3CitY78klF3HLlJWYkJIPS/n3QGpguoyNYPQoqAHfFYUSVBohld+IcLCPwI?=
 =?us-ascii?Q?0eSztzTHASmS5r7jCMCvBsmDV+tSjx2ZgC3+6o9CY7P3sdddMJQg3qAubwWt?=
 =?us-ascii?Q?JfujeQCmb0wA6qlwYkRH7VNjiQgRy2KRJLIDEgXTwo/rGdeLkM1SX3Us1IHZ?=
 =?us-ascii?Q?gl1voiuusxvsXh3bdt1FCGwuMpgSWGipUjnjYLlJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aacb196e-8ef6-4a67-48fd-08dc75d3112e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 18:07:36.8257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiLScjJPiKI8sOfZ3vOQ/wbHw70B7j/XXVS3rMcKCNQ7TIoxryOeb86zBtVV5Nc3WFousa8YVr1wQBQb2AJAfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4872
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

It is very common to reach issues from other drivers when testing
the full non-default cycle.

Get back to i915 approach and validate only the default mem_sleep
level of the mem sleep state.

However, keep the option in place where the developer can force
the validation of the state using an extra test argument.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_aux.c       | 31 +++++++++++++++++++++-----
 lib/igt_aux.h       |  2 ++
 tests/intel/xe_pm.c | 54 ++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 80 insertions(+), 7 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 3407cc4f2..7770a05fc 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -852,7 +852,15 @@ static bool is_state_supported(int power_dir, enum igt_suspend_state state)
 	return str;
 }
 
-static int get_mem_sleep(void)
+/**
+ * igt_system_get_mem_sleep:
+ *
+ * Used to query the current configured mem_sleep. In special to stash the
+ * default of the system before any test operation.
+ *
+ * Return: Current mem_sleep configured.
+ */
+enum igt_mem_sleep igt_system_get_mem_sleep(void)
 {
 	char *mem_sleep_states;
 	char *mem_sleep_state;
@@ -891,14 +899,25 @@ static int get_mem_sleep(void)
 	return mem_sleep;
 }
 
-static void set_mem_sleep(int power_dir, enum igt_mem_sleep sleep)
+/**
+ * igt_system_set_mem_sleep:
+ *
+ * Used to configure the mem_sleep. Useful to return the platform to its default.
+ */
+void igt_system_set_mem_sleep(enum igt_mem_sleep sleep)
 {
+	int power_dir;
+
 	igt_assert(sleep < MEM_SLEEP_NUM);
 
+	igt_require((power_dir = open("/sys/power", O_RDONLY)) >= 0);
+
 	igt_assert_eq(faccessat(power_dir, "mem_sleep", W_OK, 0), 0);
 
 	igt_assert(igt_sysfs_set(power_dir, "mem_sleep",
 				 mem_sleep_name[sleep]));
+
+	close(power_dir);
 }
 
 static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state)
@@ -1018,11 +1037,11 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 	igt_aux_enable_pm_suspend_dbg(power_dir);
 
 	if (state == SUSPEND_STATE_S3) {
-		orig_mem_sleep = get_mem_sleep();
+		orig_mem_sleep = igt_system_get_mem_sleep();
 		igt_skip_on_f(!is_mem_sleep_state_supported(power_dir, MEM_SLEEP_DEEP),
 			      "S3 not supported in this system.\n");
-		set_mem_sleep(power_dir, MEM_SLEEP_DEEP);
-		igt_skip_on_f(get_mem_sleep() != MEM_SLEEP_DEEP,
+		igt_system_set_mem_sleep(MEM_SLEEP_DEEP);
+		igt_skip_on_f(igt_system_get_mem_sleep() != MEM_SLEEP_DEEP,
 			      "S3 not possible in this system.\n");
 	}
 
@@ -1034,7 +1053,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 		suspend_via_sysfs(power_dir, state);
 
 	if (orig_mem_sleep)
-		set_mem_sleep(power_dir, orig_mem_sleep);
+		igt_system_set_mem_sleep(orig_mem_sleep);
 
 	set_pm_test(power_dir, orig_test);
 	close(power_dir);
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 4664559dc..8fd21c37b 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -214,6 +214,8 @@ enum igt_mem_sleep {
 	MEM_SLEEP_NUM,
 };
 
+enum igt_mem_sleep igt_system_get_mem_sleep(void);
+void igt_system_set_mem_sleep(enum igt_mem_sleep sleep);
 void igt_system_suspend_autoresume(enum igt_suspend_state state,
 				   enum igt_suspend_test test);
 void igt_set_autoresume_delay(int delay_secs);
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 9cb00c7f1..ccb15134a 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -44,11 +44,18 @@ typedef struct {
 	struct pci_device *pci_root;
 	char pci_slot_name[NAME_MAX];
 	drmModeResPtr res;
+	enum igt_mem_sleep default_mem_sleep;
 } device_t;
 
 uint64_t orig_threshold;
 int fw_handle = -1;
 
+static struct param {
+	bool ignore_default_mem_sleep;
+} params = {
+	.ignore_default_mem_sleep = false,
+};
+
 static void dpms_on_off(device_t device, int mode)
 {
 	int i;
@@ -221,6 +228,21 @@ static void close_fw_handle(int sig)
 	close(fw_handle);
 }
 
+static void assert_default_mem_sleep(device_t device, enum igt_suspend_state s_state)
+{
+	if (s_state == NO_SUSPEND)
+		return;
+
+	if (params.ignore_default_mem_sleep)
+		return;
+
+	if (device.default_mem_sleep == MEM_SLEEP_S2IDLE)
+		igt_require(s_state == SUSPEND_STATE_FREEZE);
+
+	if (device.default_mem_sleep == MEM_SLEEP_DEEP)
+		igt_require(s_state == SUSPEND_STATE_S3);
+}
+
 #define MAX_VMAS 2
 /**
  * SUBTEST: %s-basic
@@ -327,6 +349,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
 			  d_state == IGT_ACPI_D3Cold);
 
+	assert_default_mem_sleep(device, s_state);
+
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	igt_assert(n_execs > 0);
 
@@ -636,6 +660,8 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
 {
 	int gt;
 
+	assert_default_mem_sleep(device, s_state);
+
 	xe_for_each_gt(device.fd_xe, gt) {
 		char path[256];
 
@@ -669,7 +695,28 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
 	}
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	switch(opt) {
+	case 'm':
+		params.ignore_default_mem_sleep = true;
+		igt_debug("Ignoring default mem_state!\n");
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+struct option long_options[] = {
+	{"ignore-default-mem-sleep", no_argument, NULL, 'm'},
+	{0, 0, 0, 0}
+};
+
+const char *help_str =
+	"  --ignore-default-mem-sleep\tUsed to enable s3 tests on systems where s2idle is the default and vice-versa\n";
+
+igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct drm_xe_engine_class_instance *hwe;
 	device_t device;
@@ -705,6 +752,7 @@ igt_main
 
 	igt_fixture {
 		memset(&device, 0, sizeof(device));
+		device.default_mem_sleep = igt_system_get_mem_sleep();
 		device.fd_xe = drm_open_driver(DRIVER_XE);
 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
 		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
@@ -725,6 +773,7 @@ igt_main
 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
 
+			assert_default_mem_sleep(device, s->state);
 			igt_system_suspend_autoresume(s->state, test);
 		}
 
@@ -738,6 +787,7 @@ igt_main
 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
 
+			assert_default_mem_sleep(device, s->state);
 			igt_system_suspend_autoresume(s->state, test);
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, NO_SUSPEND,
@@ -845,5 +895,7 @@ igt_main
 		igt_restore_runtime_pm();
 		drmModeFreeResources(device.res);
 		drm_close_driver(device.fd_xe);
+		igt_system_set_mem_sleep(device.default_mem_sleep);
 	}
+
 }
-- 
2.44.0

