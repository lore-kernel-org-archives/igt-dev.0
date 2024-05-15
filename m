Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237B4C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CAC10E447;
	Wed, 15 May 2024 17:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDJ7J1XC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70C310E2F2
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 17:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715793251; x=1747329251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=252ZhcDetTsv91xTVWiUZ2H8jzTQB2gxrYj6VYWO22g=;
 b=fDJ7J1XCT4w/nyjWJ50QWdoSOf/1rttdLLN6QWmM1cJnS6P1j67Ej899
 7HAUGoyvt8BQy3Q1TpF6necuj0swDiDda2ShJOLGjJr3pLZJAFgnjWXv2
 RQai9gKJkKBpm86g9A3lM4VufgNfRqxPE6rM/0Rm8sCTs+z59gYwUxGl0
 6ctktvu9G6ZNG8fC0JP60HUj+cz4oj1ONDMeG5kkV7h/Mx4R2sh3YPHLD
 eETBxAOTEpwTE8plcqdJaUj/J2bI4pLXDN0q2qcPTWMZQcqwAciEjW6y+
 Fmo5VrWyHRmvkxwGLC30Xwt6Wco28qwDwAoKXthgE0TtpgCAUlR77QMUc A==;
X-CSE-ConnectionGUID: KIDrnHXwS96f7oqzLn5X6A==
X-CSE-MsgGUID: v/D972+4QuqEEZZeTCc1xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="14813258"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="14813258"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:14:10 -0700
X-CSE-ConnectionGUID: Agjjc2LKQRKBlxfpmbOlYA==
X-CSE-MsgGUID: 52/Z3le6Sda+G1Mzz1bBgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35586441"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 10:13:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 10:13:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 10:13:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 10:13:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvy1R5if0I2pUob2gU41iFSWKmZ9kWmQGVU0kqgR8rka9A0IcVdef0WhdVhRy8Xohi8PYlZsBK2oXJk2kg144LV4A5NfImtaIYcfIgdmGKjFS3DBfBDrkcs0xKywTGdrlMB4iJebtnbTJO8fNPeKSgPho8DnEVcD5W7AaQUO2qHs5e7KEXPF5Zy/UYAOseV989frzjH2j/vSct8H3fiwk/zC/k6fjyVbmb0C8JdKPTe6wdAJyp8MpOq9to4+3WwkrJY8+cuavFKLzAFvG39VdneTVcXOngpnpOBXzQlnej0QUmJYcdPSaMTGsTmw0WxEGPPvJ77+G0anL2wx941hkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgG1EvI1hgwwh3bvp6fv7vkrYQGTH9IdFHQj9iUi1ZE=;
 b=IhKLcKOcdPJUAXtX8mf+I2tqWV876X2FVmNR/oia9AfpNYlei8iA+AYXDlmFhcuXAn+x1JmdilOGo6TdJexW8lTX1aMzOneVw7zXE13tM6FCMsNSBjMjgo+RAn7FLaJ/2j8cEtAUnmzJJQw6eVt3CfYon4FXDmYEtZKofqBSHOylC2Cq1OiZJPd4N9hyanDs03NVV3clkvpKaZYavZN5a+M9brUoaxOt/c3OUV4zs9i3CyBsM/ykEdHXXNHyI7LRlaRmW8Y/fUAusaFGyGMAVopKngBbc7tCVFWm7yQCG3f4lul9BQgpPt2Df43LScDOrlRLqPjGsQmgpm4N7+LA3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Wed, 15 May
 2024 17:13:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 17:13:37 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/xe_pm: Only check the rpm resume after
 the first mmap operation
Date: Wed, 15 May 2024 13:13:16 -0400
Message-ID: <20240515171317.84811-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240515171317.84811-1-rodrigo.vivi@intel.com>
References: <20240515171317.84811-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:74::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: daa15af2-f8ca-4156-0cb6-08dc75025beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Tcnv60iaBvpMlCfDpJWPE1vKFezQEkA5e+1YNmvKp3HpANCjIPOLHmRND9j?=
 =?us-ascii?Q?4L/Rw4GL9PZr3m9KFKrWUdtL4YCHhPqB0SuERYDdiUI9oOCebaikvYc0LgDD?=
 =?us-ascii?Q?df1P26gDVfxWolbUrP5/qDGlhEIyj8Aq0lZ5VqWpkXiCPKIGT6UFzpNkOqXa?=
 =?us-ascii?Q?VeAbd5G+CssunN1fBC6bGYTlzJgWjqbnnvqtiZUXmo47ouYDAqPbGQ0sFuI4?=
 =?us-ascii?Q?0iqM2gP+l50UTdrdyG7smRdbyWXR+iZlhsJVcwVHqyuC7T4bdfqWci3RSDjB?=
 =?us-ascii?Q?SLMvO+OVa9U/21CZ+IampCvGc8GkuoSvxdxlmwHbuGAdqTADSDWTC0qQGVLa?=
 =?us-ascii?Q?4Mw8BpaOwC0m4awYRnqOMLzpd4uP3kXFCQ7ked8lBYM9S8h27a4Lq2AjKkN9?=
 =?us-ascii?Q?7ndhdYpLfbzGu1ixRMRDv4JQAtqVpAg14rLjsDgS+FBeZw1Phl07VUmAJ4/1?=
 =?us-ascii?Q?5WWb1UAw6dCnLiHwakbLCeMBXk2Cr0Q5UMqpSvUZHWlKati8hkKmBrlysedq?=
 =?us-ascii?Q?roRjMehxgA320R8aS2otr/jZZ+8lngrGwuVQuigeHkLUbtOEw0a+uHjl518Q?=
 =?us-ascii?Q?7x1uXz+tuMLc59md1smntQmV3IRZnMrJpFX3rZ+qaTnkBsjnbV9ELwLk5S0Z?=
 =?us-ascii?Q?R6H6xhj9RvB2Y2IhY8H8lga5PQdsZfdarzVCSaopzBYDEPxt+dzeQLdfQCU4?=
 =?us-ascii?Q?ziBXxzc0r3J/IWDTJl/pRh3APUiJKNzH8+O56ivzKp96MXA1dwp18P10NPwu?=
 =?us-ascii?Q?u8zRHuL+AhPZpwz+dGXYRYu1Chgw5oLblVIL7jmF4nKU1l6dCEte+3ODXPI+?=
 =?us-ascii?Q?iwrDxQNZ2IH+5iPuc1wkTGxfQueOjWtntRBystepiHaz4hagSTsMpZ9caeuY?=
 =?us-ascii?Q?OJKGkbg2Ac5C/6gcoAqOW7DKb5HVl5XqShSAmisj76We5v44q/qLmu97ZUEI?=
 =?us-ascii?Q?z46q/EcYBLJJQWoFF0h7E1HlEBmmuP5VBFHjrNzSaKY7LIxPgVGVH0raYThJ?=
 =?us-ascii?Q?tU3wPmzka71FO/KlxvRsqaOpfyU6L3zlHDjFbh2jtxzgJrKuPUj6pwQ3QD6c?=
 =?us-ascii?Q?iwDGXE+uYIeQ9b4sj5psM+E6MgHa3RyJhiBzgHyzs9O9GGzkk/vzu3Il9u7P?=
 =?us-ascii?Q?w0eTLqtFE30tV6ERbtrP9mt1m4S987L+j4iIgOjMNVEFFAiXNnZwCBhGtA+R?=
 =?us-ascii?Q?P1lY4lXBQ0NLvdaVj9f/xrJ+xcv9RmV6rt+51p7hKQ3/AHJXhk7BwRfu+mXr?=
 =?us-ascii?Q?boYARqPs+z1ji0/NQVdksDrczDA+O/Yx5bl0UK9LiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A/ulwf8EouLjFfmWPsw0s6xoaaP9yxrH2qXvFoBfhgi+w1uZ1n9f76ZBJS3U?=
 =?us-ascii?Q?YnNoohsOHAtbBo0L8DgZUROvdqwggk0GLzb1NmwaayZLz74mqsKvbUYdreIZ?=
 =?us-ascii?Q?QjCZwX+NMB+l9UZpO9a+tad+bqlyHbAeN0cDONRUO496lQMPvcLyhqVuss/8?=
 =?us-ascii?Q?P1nAmqUL85i7bQz6Ut/D4Cv1Geir83GRKmacz74LCVTsckIkjKNgdl9lugW2?=
 =?us-ascii?Q?8sXnh85j9eWCDGWL4MDCKU7ypiL+QDu3sVC1P56AQMZHIXo8sTHHhEox/SCh?=
 =?us-ascii?Q?lFJtHWNFLn8HMPoIYvLmjt6jFBuebokzfivwdCMOlhgCrpWPYIUwTqhM12rb?=
 =?us-ascii?Q?mPXRqdqbcaY8vrFHY4GKf3ZyAMfIH3DTJa5LTsstGyzUXdE2ECY6Q2BMkPDt?=
 =?us-ascii?Q?jRQJVRgg37kBIoYhHx+vV+Y3Q32+dD2ck4/NThHhSJaykvV1PTbuXitWVqbt?=
 =?us-ascii?Q?EeeXd183kS8f+lFZDWfelcIQVNr12x1A5UBdxzdFfdCKYyVBNh0+nc9QTR9o?=
 =?us-ascii?Q?ik5fiW+SZCUCpaOJRNt9c0+3AUeZkohO7s7EujtCakWDrorIIiX35Tv2pEAv?=
 =?us-ascii?Q?tyP7gZhXOigI6DY48QBxLy0kkAtkakgN/H1f2izZQ5IwIDRktJuloWBIwIlr?=
 =?us-ascii?Q?c6FLBPVnCrF/cnFoaIN3eG7kWeHHHBEDoDiL3CY/WeQJFHzMHOylFFedckXV?=
 =?us-ascii?Q?6D52Jm/uhAtknKcVJ5mzWd9jo65hGFgrBgj4CFHABRBPbaKzgg97SBWlYmbZ?=
 =?us-ascii?Q?oslbwuwChBLKbYsP7XSYEwlLCHU8uIhdDb3gTa9/gUHiBS2gCX/mTfZ/NTPV?=
 =?us-ascii?Q?ssw7Czhp7X2FN93m0+0qLNrC0aIQk3SgPa0IZDK9IeQvwxTM+oMX+lBAf0c5?=
 =?us-ascii?Q?cRJ4wZBplBMHkyx7mvB+rTOmyRHcXP249AWgJ8nN3UystqLJi9q/UQp2ljdr?=
 =?us-ascii?Q?pB3WDS83VUT+9AxR6LQYFjO7GuRjjgrzU/hB1aj66DLpzY+yW2kT36LKNg8R?=
 =?us-ascii?Q?rqqrjUEtXyYpt81rJIxkBa/fvis/3J4/QoQ33Y2OOqrnPIMSD0wDO8qSTxsd?=
 =?us-ascii?Q?3jBCHPZWlFtcM7Wo2I4bztagjWyaNXBhAph6x+VzYTP+QZL4WCxYv92Jzqfx?=
 =?us-ascii?Q?M1lwLydq8Tuv6UbBc+OFrGkLWsg0exSnFZtOy/JRnEevsrh3yDzhSBLMT8fc?=
 =?us-ascii?Q?F7Xm2Ar72gbE7phS14UJrt+Su2PZ00o44sbGRsZz3kgaHlQdXxh87WXXlRMo?=
 =?us-ascii?Q?78MV9iRhvnQkpEto0Rh+SHDioMHonMbuxcumrbHUGyQbaBl/0Uf/qpnTQzFY?=
 =?us-ascii?Q?W93jKlHMCbWpOGbpiXfSlVLysfMw6WOe1RrrsCg0ZbP8sdTLR9526dehzpN8?=
 =?us-ascii?Q?9me1i3f5SeZVoig+px4Z1uRvmq2AMWFGuY6YISvDUuv1Gf5FtI4nIQpszKhN?=
 =?us-ascii?Q?LLVzGChJ1izLbnaPzMKriJj7BO8Cns1fWJ/sLEZkwMX8fAtziLhOhCVejjeH?=
 =?us-ascii?Q?BrhMt9y3zlax45MfpS5xjTru+Vaocr/NTv96D2mj8lzRIviziSXSrNODvhlN?=
 =?us-ascii?Q?KYBxKHWADWeQ59jPWiN2g78xTgmdEn3M+o0RauBY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daa15af2-f8ca-4156-0cb6-08dc75025beb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 17:13:37.5336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p51YJKNXoa4BWZeHmJGTcGCtZu899ULPV0s9M+y31Moclz8+8LMExhWjf06WfzDguWZ5jwfNGU9aeWDDoCRGjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
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

The very first memory operation on a mmaped region after runtime suspend,
the device will be resumed if the memory used is vram.
However, after this first operation with page fault, the memory
will be migrated to the system memory if resuming from d3cold.

During this migration, Xe kernel will get a notification at
xe_bo_move_notify, and the bo will be removed from the
vram_userfault list. Then, on the next suspend, we won't mark
bo for page fault and resume won't happen and the active count
won't increase. This is okay, since the bo is now in the system
memory we don't need to wake up the device. But the current
test is wrong, because it assumes that the bo keeps forever
in vram, what is the issue here.

Only checking the resume after the first operation is the
enough. But also, ensure that both read and write operations
are actually validated, so we can use the same approach on
both d3hot and d3cold without differentiation.

v2: Improve commit message to ensure that it is clear that
this migration will only happen in d3cold, but that we are
checking both opperations so same flow can be used regardless
of the suspended D3 state.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index a80964d1f..2770ce83d 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -38,6 +38,11 @@
 #define PREFETCH (0x1 << 1)
 #define UNBIND_ALL (0x1 << 2)
 
+enum mem_op {
+	READ,
+	WRITE,
+};
+
 typedef struct {
 	int fd_xe;
 	struct pci_device *pci_xe;
@@ -522,7 +527,8 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
  *
  * Functionality: pm-d3
  */
-static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
+static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
+		      enum mem_op first_op)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -560,8 +566,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
-	for (i = 0; i < bo_size / sizeof(*map); i++)
-		igt_assert(map[i] == MAGIC_1);
+	for (i = 0; i < bo_size / sizeof(*map); i++) {
+		if (first_op == READ)
+			igt_assert(map[i] == MAGIC_1);
+		else
+			map[i] = MAGIC_2;
+	}
 
 	/* dgfx page-fault on mmaping should wake the gpu */
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
@@ -571,12 +581,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
-	for (i = 0; i < bo_size / sizeof(*map); i++)
-		map[i] = MAGIC_2;
-
-	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
-			   active_time);
+	for (i = 0; i < bo_size / sizeof(*map); i++) {
+		if (first_op == READ)
+			map[i] = MAGIC_2;
+		else
+			igt_assert(map[i] == MAGIC_2);
+	}
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
@@ -792,7 +802,8 @@ igt_main
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0);
+			test_mmap(device, system_memory(device.fd_xe), 0, READ);
+			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
@@ -811,7 +822,10 @@ igt_main
 			/* Give some auto suspend delay to validate rpm active during page fault */
 			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
 		}
-- 
2.44.0

