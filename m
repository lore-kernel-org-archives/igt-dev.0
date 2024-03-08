Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B786CC54E41
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 22:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2C51123E2;
	Fri,  8 Mar 2024 22:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOgOyRMd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C081123E2
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 22:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709936289; x=1741472289;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=sLT++pTJ56BhOpUwqNOsq2oxotDTcVjC58LLeR0ksRQ=;
 b=nOgOyRMdgpINSe6eRqo3LUDWjNFFqR+QdIUx7GMHc7uY1gY/Apkld2xe
 OvBZWpLb3gTkQoSdBrLWTuwweoeA0KHvcGY05JGIOtcYp9vaqA5icTtVV
 pkqhG2d0xz3BAfRxgwvqQGAK8tf3n0XpNwzPV6tLjNR9wt5VM3ccF79m5
 HDy2c6qq69eYp19NGD+5Epc6qE0VgoKNaMN5fmjLXK90smEnxGdDjTTYR
 iN+AyLbuWe5ZT9nBZiiQobzFNsHKGhtXz6auWSybNQDro2zfOGyr6zDmB
 oNb1EVKAT269IahAd28Rao0MwMNwkvLHJzcm5RoYAq08xnQb/sd/ysp3s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4854007"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4854007"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 14:18:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="15157721"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 14:18:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 14:18:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 14:18:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 14:18:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqvzJCVp2vRmFNOnZdV3BELJNdnuIOw+cOGCED8eRGo1oDGvVKNoFO+EM5i6OADj2FFAruj0zq33YICNBNDlZ4IJOMgTFBe16quj6uCmVvAwx8B4OHy2KRpjX4rA/pOVFz+pcEIwKdeRIF2nrYLgRxtkoq+0fzhUFU+y+PUcUaCxyBpOKnFfg820yfidwU99qjNQ2/v2gZw/jKR2HaGBv56ulTDUqKHugijmCAp8KL7R7A/MC/qdNjuOp/hdH6Nj+Z9goARL4pZ4yuXQhetCFCDIgIZBFHZxvHSgAGGiG9IQkyGzHPE66wd7a84SFgOQTJGUJOEj9FDOOI+yqH8uCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3riGe7kuI8I4edRIx2E44Jf6/1uqNm9viDl1rFZ3l+M=;
 b=nCD6BxZ6TnoCEB74BaHUnuZh9XBgFNzqXYtDJXR+dYyxuYyjMRjUfTdyBKF8pickZJ5XtV5V1q7k3xzN3MQ7FscT2XU5kGSf0s6Vzb66rijhhY3Ni0qFGJGmDoeNeW8QYNcOxTEot9p3X/2zfJGFd63zoPF4cD2/qGbfm6S2ks9VbOHiOvRBL1N2tyA1fdJh614ZM6qq9gWT8kkSexEi0rD+Nhm/cXIE7iod7Z5kmFfnah7Z6vlZQ8oq5QycE2wpoJzlXpw/bBaaj1TFiItLtWkDeMV8DL3u7oP77ydltlAZxYgyniqq4r7S1bhUbIILD5S1Jpm0f+ly49WO4j3SDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Fri, 8 Mar
 2024 22:18:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 22:18:05 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: drop devcoredump before a PCI module
 unload
Date: Fri, 8 Mar 2024 17:18:00 -0500
Message-ID: <20240308221800.48860-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e1bedf-3975-40d9-e0fe-08dc3fbda01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bR2DW6va2Y/YPmjhX0ny8QcYKyjWNwdgCEct47r52aHSJU97m/Tlpq0M6ACnCtmIbAlD46g+e5lHUAf10WSRnouGN1oQ5oj6vPiGt5HoQ9dcUB1tkStEW6B+Dxq1oS6qyynUz2Ik8yMKKcHChlplOUU7OiJhqtEniqvWF+lKYphs77WIsQFqVTWVitfFh2lbucwjh7lPtyUQD4oG2STN9hO9+GTOM0XceFLFpfO5RTWGsT5r4TT0EfCxF9mhvd2hfTM5Ol7kYPZ+d+5oxbuXp2ahS7FcKwraOTSmIFnrsgzKbfFBbVyj7vzJF3dlDB6u4mf/hqiip6zZEpGMSPfrjps7NMRgRG3lZPCssdaEXI2sJ/Ms+ImcGuAxdRMaSql5oV5Ody7E8Vez9/atdkbLJtrcVVOo4XPxULw0xgq/gUc2AZIjqkm6xjR4xbJYGLYymydRCqFPVfhazOL6fRjEF59J/2Uo4CByN+DS/Bto+aLGYIv+b047wpS71fv5mfwoORueI5qx3FLujnjJ9szYt2lWPiwkxHpyLEHv/AkMtBJ77yV6KwyxzncAwOtUqqulDM3QnmUMgSNSp42tvTqZ3qDzFWENuJwNzGZLWoTAmLYFXjaD294+A6tFHMD8gdv8EAjiLXyuG5Yn56Jy1cF02WQuqxUBBVgsD8Ykw3hV7jI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0Y1QW90K0djclBZeWpnZVM2WWhDdXlmZDNNN3NrYVd1L1NOZFRGVHM3MDg4?=
 =?utf-8?B?RnBHU2lLSkdnenBvMldXMlFzS1BTVjE0WGluMDZNYXpFUFZRWndjMlYxd3dM?=
 =?utf-8?B?bnZIWWJQYWVHTlNoODFJYmZBWXlqcVJVZlI0QkozMnkvUzJkY0hvc25NeHRt?=
 =?utf-8?B?VFQ0MGNQck9aa056RSs3VnJ0MWd0WjV1ajdXTURjU1Ivang0Z0VocXlBTDh6?=
 =?utf-8?B?QVQwSmZnU0d4V1N3SnF1ZVdPZldLbGlaQUpueE9uU2oyQmRKNkFPZGNKODE1?=
 =?utf-8?B?cENUekxMMnh6aldLa2ZWUWdLa0QyOFV3aXFFVzMzTGI0VTN6aDBXMlRxTmdS?=
 =?utf-8?B?RkMvcGMvUldnenV2d0F0Sm9rQ1hlaTdPajNFem5qOHIvbjBFSEo3SUF1UldK?=
 =?utf-8?B?aWJmckJvNGNRZVF1Uis2OHFyZ28rWVpHTGo5TW9jRVpCbVkzYkNlQ1d0b01s?=
 =?utf-8?B?dUZ1R2w1YVZtMjZTN1ZoVFA0NU1BWHFxd3pQTkxha25RU0t6TTQxQnpKMlZa?=
 =?utf-8?B?ZVVkSG9qM1JoRjJVTFl0dm55S1RSdHpvcCt1Q2V5QTdIWFhSMElPVWpNMWxB?=
 =?utf-8?B?ZVd0VFhvTU9LVnlFUzM0MC9Ib3B4TDg0TWJmVHVjVGloZS9HdzlQN2ZzTWVN?=
 =?utf-8?B?MFNJZlRtbURBNHJOSFNoWDFneHhFQ3dGekx0QUsvUlpMN2UzYWl1d3lId2J2?=
 =?utf-8?B?WGY1VTgyRnN0RVZ6MU9PcWRYZVluL3pmU1hValNmb09wVUttUW1FS3pWMHhi?=
 =?utf-8?B?d0hLdS81OUZQby80TzZiclFMUWVPeERNWlpNNGpGQ21Bc0ZlRTZuTUs5OHFB?=
 =?utf-8?B?QUIxSCtSaXMyK0lKNlpWNlovdnNvcHUyT2h2c1lZWG1nN0ZybDExWlNuOXhP?=
 =?utf-8?B?bmJaWS9uaVlITjB5ZjNGUGcxZEpob09SK3R6OXdoT3lRYXBBS1JIYjd2aFBw?=
 =?utf-8?B?RDJBZ3hWZklscFAvNUw2bGVYVFVHckhYM210Rml3Um55bm5yV3FLRS9SdzBG?=
 =?utf-8?B?UUlhNkFaSWlxZm93Ri9Hd3NMNzh0eExORlBuNGR3Z2t1c1d2T3BZS09makFZ?=
 =?utf-8?B?YTlzMGhvOFJRampIeWZZTGZ4UFNqYnNrNjY3NmIrdExQcWhoSjZVQUN2Z3Za?=
 =?utf-8?B?S1c0TEJOR0I5M0hsdjY3VnBaZFhIR0kyZWZNQmZGdHpHeWQ3Vi9hN3k4NlVu?=
 =?utf-8?B?eVc1cjY4WDhuUjRrdHUvSnFJN2JaZHRhVjZxTXQvd21CQm1VMlY3R2hRYThL?=
 =?utf-8?B?VjhYNUI4YzV1d3oxT2MxYW4zTXNCZmRhRzVwSEhucWJIZHZEYkdJdURtQzNq?=
 =?utf-8?B?UVZsUDlTR2FyQWVrS2p4VDlJbEZCc0F5YlY5RHU3NXZpR1FMYVU3ZWJlY1dQ?=
 =?utf-8?B?WmpxM212d1N6ckNpNmVtSkd4cEt4d3hkQXc2L3B2Vm8yQ3FvTFAyV25UcThL?=
 =?utf-8?B?L0JpRlZaRE9QVjVzcDB2a09OMGdwTW9SM0w3dnV1Mk9XUm93RXdBbUVmMlhy?=
 =?utf-8?B?VGhFQnBFMjhBMm96dUNHNVVoT295R0p6bHZ6K2pFaDFLY1JhellUS1hsaDNm?=
 =?utf-8?B?endoRWxrSmE4cURiVGwybHVPNUtPR3ZsNldXeTBoUFdic0JiUHg2M2NjQ1cv?=
 =?utf-8?B?VVMrZjhQZ2Y3ZlpvQTUreFkwZ1hzOGxSbHFxamVrT3I4L0lEaWtweVBSUytH?=
 =?utf-8?B?ak5DQkRlUktpTHFlVUtJdlRIbHR4V2NrVGNLV09xRXB0ak1nSHRDU1hxSnU5?=
 =?utf-8?B?c3RESVVrRlRORGJzR05Od2dSblZRdUxBQUdvVEtXTGJlYm5uMWJVbFhKTnFK?=
 =?utf-8?B?V3hab0hVcGdqVkpnVlNvUU5RblczY2NRUFVmbEJYcUVrekNRNUVkV3VKeGlk?=
 =?utf-8?B?Rm9WSnNNbzlJZGl6VEZVZ3VGalV6MURkNmhIaHNPai9aR2JaREsxM2FDaEdr?=
 =?utf-8?B?SFpYNWZLUHBMbUI4QWJEU01uYXlPWlQ0cFYwU1l5S05qYXlscGpWbS9qZXVy?=
 =?utf-8?B?TDUzNHEreE9SeDJEZDJoYmNPejJ1Z2RhU2xsaXllVitES1R2UkY4aHRqMHNu?=
 =?utf-8?B?M1pZelRyak9RaG0rdUw1TUdHSGtnWlpadmtGazc1c1FTQVpGYjE3WkIxT0Ix?=
 =?utf-8?Q?1l0lH69+OvsKPNxsNvw2trTK9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e1bedf-3975-40d9-e0fe-08dc3fbda01e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 22:18:04.9883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uc/oLGiZFjJNY/A045kg/73fa1CEu0lA9Y/JsFZEx6ctjEa1yImCcXOoFR+YUzrO3u3I4zGHcLKWvxlFAnM1Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
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

devcoredump holds a module reference, blocking the module removal.

It is intentional from the devcoredump perspective to keep the
log available even after the unbind/unprobe. However it blocks
our module removal here.

v2: Accepting many suggestions from Lucas.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_kmod.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index cc242838f..14d51f4f6 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -323,6 +323,59 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
 	return err;
 }
 
+static void igt_drop_devcoredump(const char *driver)
+{
+	char sysfspath[PATH_MAX];
+	DIR *dir;
+	char *devcoredump;
+	FILE *data;
+	struct dirent *entry;
+	int len, ret;
+
+	len = snprintf(sysfspath, sizeof(sysfspath),
+		       "/sys/bus/pci/drivers/%s", driver);
+
+	igt_assert(len < sizeof(sysfspath));
+
+	 /* Not a PCI module */
+	if (access(sysfspath, F_OK))
+		return;
+
+	devcoredump = sysfspath + len;
+
+	dir = opendir(sysfspath);
+	igt_assert(dir);
+
+	while ((entry = readdir(dir)) != NULL) {
+		if (entry->d_type != DT_LNK ||
+		    strcmp(entry->d_name, ".") == 0 ||
+		    strcmp(entry->d_name, "..") == 0)
+			continue;
+
+		ret = snprintf(devcoredump, sizeof(sysfspath) - len,
+			       "/%s/devcoredump", entry->d_name);
+
+		igt_assert(ret < sizeof(sysfspath) - len);
+
+		if (access(sysfspath, F_OK) != -1) {
+			igt_info("Removing devcoredump before module unload: %s\n",
+				 sysfspath);
+
+			strcat(sysfspath, "/data");
+			data = fopen(sysfspath, "w");
+			igt_assert(data);
+
+			/*
+			 * Write anything to devcoredump/data to
+			 * force its deletion
+			 */
+			fprintf(data, "1\n");
+			fclose(data);
+		}
+	}
+	closedir(dir);
+}
+
 /**
  * igt_kmod_unload:
  * @mod_name: Module name.
@@ -341,6 +394,8 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
 	struct kmod_module *kmod;
 	int err;
 
+	igt_drop_devcoredump(mod_name);
+
 	err = kmod_module_new_from_name(ctx, mod_name, &kmod);
 	if (err < 0) {
 		igt_debug("Could not use module %s (%s)\n", mod_name,
-- 
2.44.0

