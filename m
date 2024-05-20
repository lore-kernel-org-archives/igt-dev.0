Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D30C25B77
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 19:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D77810E060;
	Mon, 20 May 2024 19:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWgNTBxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C105010E060
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 19:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716232147; x=1747768147;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Egj9Wma6JeJceOSUM/bwaPEu5SREPCZNSvQXXp5w3ZI=;
 b=VWgNTBxWnPF0vJbyJFgMgQvgC/JfMLBc7Xplvr3abkfpa0+LkXvhPDP2
 Iqr2IrEYKFJ0/r6bS300L8hkD+zQlXkASpw7iQ0GXJyR0tNM40q79v2Ch
 FRU9xb7sW2nBjBexw+ty7nUw97wgA+vtRrm2f3fITdYd0kr1HyHqH4gXf
 dkAIndwjs0rVQ8aHKVxcMrdD8v3pNuqvt/nmqSENUf/bACU+b5IhmValC
 cFpZXyuH4sbUrgU8SOc6GSyqzX5A8Cg7qEs4JJSDy1CFkjNV9mLMiX70J
 P5kQL/mQCrgW7kQ7EV4Pag8rssO6CEfLp0qdcHtSt9ZWur0sfI+Vxj6Uq w==;
X-CSE-ConnectionGUID: j2C6zm+HQ1K/+TUW2w4LIw==
X-CSE-MsgGUID: Fxn+/wVqSwO3oKvg6jkNdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23795926"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="23795926"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 12:09:05 -0700
X-CSE-ConnectionGUID: fIzXq7QiSyiCqcE5nWVeGA==
X-CSE-MsgGUID: ewNtOo+IRuuPS1wAkdTKBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="33234304"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 12:09:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:09:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:09:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 12:09:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 12:09:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/2jpylQqWHIpxLFRy6WL4Pkz1cKPtnK6nH+yJ3whl07uVtBUJDi8dh1DZNRe8aBJ1VFmDrux7M5t6ZaFHudciCGzg4XjRQjD4DdB3sYOHbID5Ljbxb4Pfr5SQv5GmzfYEmRN4ja/GpAyt8eo4eYUmvb3J4NvcIKJCoDHgsSMPedbAcEwfUtu4A/WaVrNA94JOojuQUZv+dEAAwPqo4mOHWf2VJnwWp0w6X1eWrWYxV0PKSUri03gLFl3makuDFaeNYZ/TScNWKiReQ4pkEpGsWBxvLUIUaYT3BWiw64MXZWXqWLvZBKsySmeZfOXVMk07kvkQjsK5XGbkziZiN+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJfbCREI8ls5m7t/2Y7saIfNlq+QBWdwBe9agk2ehRA=;
 b=Zx8Dc1CKtkPTR0DZeaSfpG27ZlUuhK15YETsuuyCVk17ZNqBzruscpKaeZAR+5Aq4Z2gqBCtK3uMAmxBTwb5Qo9ljIHaH3pai5ehYLj2I474HCAu0LMfggHAO41Prh+R4Tsqe7fAa8EWN5eieEgIIZSzcmwWVksXlNWZnU+RzyZp7iG4K/4FIlKft177XZw3m2WttzOlYlui70uVGDfnL3ISLyXG8WK/qnFRSQphh/Z73saPYto1SS9OhenPWL0AS3NP7/vUDXNOHauD9viBvrhO0hCKAqrsPhwAUShZqlgjl/UegIrBV3f1On1OKQeb39aR4wN/SPW5wKoHFjb1Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 19:09:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 19:09:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_pm: s3 vs s2idle: Validate only the
 platform default
Date: Mon, 20 May 2024 15:08:57 -0400
Message-ID: <20240520190857.242928-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4a08c0-61d2-489c-fcff-08dc79004ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mt1p6auU6/t24K3tJgsXR9EBikX7GmlqoB5XJdO2rHxtrZmaIddDHP85HIvi?=
 =?us-ascii?Q?UsRkZp1ixe5ocu/65D/389hmG3EKfiAkNLRsAu8kZFI126UcVavQgp9NSGT8?=
 =?us-ascii?Q?gkCPJoRYzcdsMJeuO+7cY5lteDKLDoQjiW7WeaV9oABwtR/ox3RUevbYFqIT?=
 =?us-ascii?Q?Q8r/aLcWOrbflOM9lfxg76ZAPRWGXb+knCQWnc/tgQtpswg2xytHw2B8bNn5?=
 =?us-ascii?Q?tUkLcXcYqHmbpmtbys0FEJ8OcnOvcjGEx6fI9GVtNr46y0nM4nIcAQT3cs/K?=
 =?us-ascii?Q?C5GRk8o6h3emeqIzkDzaTpFcYA6n7ayDOLTUdBzCeSQgNrGVhUr34KuGRjgH?=
 =?us-ascii?Q?0E4UuontY4xm/5W/2BrT6GBXDw+ZxvEyO+X0NOFzWGdmv33mqi2EdDD2tPvn?=
 =?us-ascii?Q?ZYToxiRQS3mjmjn92eqof54UL0eFjpV5NGVAdl2REzqyxtyJtPkUlBmrvxs3?=
 =?us-ascii?Q?OM+xti3CjXUzXKgTWcZnTg5xfRQLjQzHaaz/nr6Q9jDFEskyV8ArUiX6bTwi?=
 =?us-ascii?Q?Hh0pIliAjwtPE3FmSaD6gWE2JUhibiWtheQ1zKIUIkGU2yti8ud62RDeE0kP?=
 =?us-ascii?Q?21FrIGkP8Ek7kTZlevtCjYyGlq/6ip5WF9pl/ssOeAZObGjTy2tIBwxxkaar?=
 =?us-ascii?Q?zRVAn7FnYEhkzaI/3RGEkDYqCIfoheZu9sFwe7OMFFJbi/drim4BWcFZRT5X?=
 =?us-ascii?Q?M7A5vK/1nVuoLRFp+SxM29oRP0VV9jGcdzfXARgvQ3N95ReU8zh7+mvDyS9T?=
 =?us-ascii?Q?K8bWvXjfbwZrVWrMpCD4j8YWk4H4iv/qcUDlgau0Naq9uE9FqYxmjNN4dvLj?=
 =?us-ascii?Q?b0HTLpplmllogE+F/LjjRBWr9T/L0fCnW1JF1/vmZtFmK9zaDRvIp6XfS60b?=
 =?us-ascii?Q?H/VtHloefOOEHtagYOg9oQ6ybV13SjHOD8x3PmhkaVG6fSp4hMRgupSOQYPf?=
 =?us-ascii?Q?4OgDhB4n6VU3NgvdtkCBw5cPMh1ZLGtAkO5Zflfo602wWwqkaS2XG8tbKKCs?=
 =?us-ascii?Q?sv8N6mNx8OZbwzpSsWuIcSeMUjqA5gLlnXrbw1NFQgmVXp3SUx+W2z1Zg+hd?=
 =?us-ascii?Q?BKP50gO0UWVDKO125oH9KEMB2RsmTtpYU5tB8EBWwBbhtSQfnKU1+EwVOK+y?=
 =?us-ascii?Q?GuCKAGIiUly/C+irItO+Enh2c0MLgUyxY8OiVGPKUujqNv8CfiCRhgnRr9o4?=
 =?us-ascii?Q?ri/ARpWpmya/kpRP2EU3lpM/Qm28MZS4HPX6ENxavKZ3nJpK8ScGYzBVvjIP?=
 =?us-ascii?Q?/9iQwes4xMqhI4ugOYOp38SYzVAPBhFnHTMo3ixuzw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CZNZPuWm16pzEBVhetJpdCeFpQOgKMo2sCQV1kL9lVLkO/JwszCjJgYLKSNh?=
 =?us-ascii?Q?2MuKI65PVRuAD9ezp+Z5/MAw35/+psOMob2RZXSupcfElUY/dM06oFM8fDGN?=
 =?us-ascii?Q?/X4ZjZhcjM/eOf2+vbjyrqnnoQHa8CDcedL96y2QaApZ4YmE6utFgwX90OJV?=
 =?us-ascii?Q?0DuqyZmByuB8PS5q70xodKCgXAoVoVjpgLOFe2nHGhAFeIl/QiyC4U4hlsF3?=
 =?us-ascii?Q?NQO5VC2RzM/RitsfrBHOvdf173qotQCGIoQmH3eByEEiVU1CpD4dKUXCFlUx?=
 =?us-ascii?Q?PNmNf6Qdb5UWLCtT7Sq5SABpFxJQYIPyvUQXh5YmE+PcDYSvmnqm/elDpVpL?=
 =?us-ascii?Q?DWPtFZnLeeZ+PU7PEGA2ScbqsS/fxkuQ766/4S5sSq34iI+ECrY2+mlkwQi9?=
 =?us-ascii?Q?v/uA0gHj6qU3DTdb8+wOaYH+59KK7jWBTZnOkVW07G+qy1Nge8DjgjjM0KF5?=
 =?us-ascii?Q?7+20mjpm66DBsRCyvUAtA3GqQu8gmA9px6r0FdP/Eb541ifDlrjOvD2EfDtY?=
 =?us-ascii?Q?3yJC44zXlm4zwDjrfmVCbhTjaCNyLH/sgpacl5or+lbO9Pq6D6Y0+r0KZ04/?=
 =?us-ascii?Q?k45S+cRte9vvi2vFqD7OZ8U4QeZMT7dIPICKjfDAN0OoJ8Do1JdwOmBSV8cw?=
 =?us-ascii?Q?D7UXXqOvJGEvQ64Ddlgo8KoSx4rBDAZg5e7eEFSIML8aL6tYflZh7FQNn24n?=
 =?us-ascii?Q?WJ/uoUA/snnaX1/reJJI1GsGHNAXyDf1nx36rhAXoKmcSBEDYPLz6eTXGpx6?=
 =?us-ascii?Q?K6oiiG1EOHvF/SVis2tDUfOQcnIvqRVqcz64gvWR52RU7tY8T+FX+7PtaDDf?=
 =?us-ascii?Q?6DPyikMV0iTMZxYj85oSUuaaqItl+ye6EWmRvo4JUGABfVfjDwHNDPeZY5zL?=
 =?us-ascii?Q?oluCyxS3lePGJO49xdYQgl4rC5mOzQGc5jTu91F0bDOkzouHT4MeMZemup22?=
 =?us-ascii?Q?3yDf1PX4qsi3tgqYq325XsrmmDY6KjcXNivbNiyvtb+BJdEBdADVLugV/TaO?=
 =?us-ascii?Q?0vq/x+5Ercpy361UNSEdjnQEsBOFwasNafjogK+EAEgsfaKyrmAXAFB4pgav?=
 =?us-ascii?Q?m2frMtBSWXkt12n98bbxkSRO/+UrsnFNmGKvJzJMAX5NYSL+Iks6MVtT/a2w?=
 =?us-ascii?Q?2J/DkRCEgdEUG8cmGtPC17c8nqvwiTP9P/gvhxkTNI6kY0yAnkprjS6e3zAy?=
 =?us-ascii?Q?rRhrq4M48h+jdecFDOgk1hazn8vWOfabYKrCpYMCokR1lSbE9QXvMBCshRnW?=
 =?us-ascii?Q?mpMQpP1v2hdBOisRAfVdNuh+0+cen829CLRrNMzbzHhi2ZoGvSGyjt1Dp1Pf?=
 =?us-ascii?Q?+ejxIu47270iPlMdSlsST5vDX/FrE8nA/vUeBJXOVp+AsYPROjr+hOuqjwlN?=
 =?us-ascii?Q?g3lgpJWdOi7QY8dgnDPwv5feWu34F5BscKeN777e5H8lL4BWvdelzkLVVlQl?=
 =?us-ascii?Q?ShznyplyWHEpCBVFfjnSKpxtTTzY6ccDucrkJYhM+yZJnwfn6pIT/2fks78W?=
 =?us-ascii?Q?JwbgG3tbfXg+R4XZFNqcHI+LQ+TSftmoU8hyXfphbtD2rhPam0S0wHm3Me3b?=
 =?us-ascii?Q?oxiPkOrxXkJCJVR03/HoTs8uPYOpavcEtgk8L1n4GKkywR65BOnYw9USnJKd?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4a08c0-61d2-489c-fcff-08dc79004ef9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:09:01.2922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFrvXRVCA8S8ghXGeog16O5fNmDBVe6cNE8OmzZL53msTQWQNrHh1chT9Shjlp9hwZ/xacRrBcaXEx3jXyCQQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
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

v2: Fix Subject (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
index b4a8c4d15..29d576522 100644
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
@@ -848,5 +898,7 @@ igt_main
 		igt_restore_runtime_pm();
 		drmModeFreeResources(device.res);
 		drm_close_driver(device.fd_xe);
+		igt_system_set_mem_sleep(device.default_mem_sleep);
 	}
+
 }
-- 
2.44.0

