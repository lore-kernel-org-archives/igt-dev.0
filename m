Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784B8C46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 22:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C491136A1;
	Tue, 30 Jan 2024 22:37:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608C11136A5
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 22:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706654233; x=1738190233;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Fvp5Bnm7SvBn0UyP8/OifheSPKhQ6+PAnCgbnFGxFmk=;
 b=hbzoZGyWOPs3YmlGhqRcD9Crp58IEb5tMyEoTZkFlRb88ztvZzBtgxPJ
 e7Pwd1OEVwjtJz96yQKVPYJ0xRwA4OaKyKJrVVzKRK+3/WQB36S3bkN9k
 EtnVMnyylX849SJd7EmeWpIWB0x7eo+qDdxoRdjKUEi/5W5JI6z/kxTyF
 qRseAXymRq+D88SBTFem+PaWtaXIb9urgUiQel3L6/cYmKHOXpjz9mYMU
 iA+G2YBajHqmoW++groW0UBS9dzrvWH+tSA8/OCLsVanBo2jf6WjPtGCk
 eOZWfWJ8xaIqzqMRwewMBWPitJ88niDB8ruzpWSmlWHAG62jROajZm+Ed Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3267801"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3267801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 14:37:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3943218"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 14:37:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 14:37:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 14:37:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 14:37:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 14:37:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF3xb/gwWNNApIn/QttUTRmWThceVV8mRTkP/aRYGuTFCRXCzVTH/SsWMVrirldgtYjY2ClA4h8COMhyilVHxluPthqsTpKsx4VEsQ7hfQqBhnP3Cfjx///heVxX+bWxW9mbxVnptWFqETNfiqW/ZuGwiKTb+XDUmwavggwRMmi8YArqL2LR4IZXZVZ+bkBRRwnLxLN3v4oQf8JQiXpQOWz0N28REsddNlpRtmW/pv18h2dsGvi6gdgRQLvd1GQSZhGza1W3pu4lD44MyLSbfbX6NGwiEp36fPGZS+WE3XtSMZPMf/q1l4vhW0R5FXYsOnYVF2Ro737qYxvWa/GXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMSWoAemqPr6Dx/1xC9GFisgtuTZ7abqi6ph/g04wyg=;
 b=EsWFoEov2hr0eX696zn6NhOnHj5uaQEnjiaCgCKrGEmCpBL05fwK8RnypcT1DbE9PHhJJJ3DZOfiwHIo7QHP+MfKrV9q1HxM06pRsvEjxc0U2ot6lCnDhQfbUOPdYvwCJNxeb8j96aVxNAKMswscNKx+9IoXauJBzg4m/r/pmsbXP+lxpxQHkyEnQ6qwO+Em8lHwdtvOAcwIUHfXOZ277SO1Zum3/fboYpGjqBRmuy/q903lNfpfXIffkpWZDchdNCIzoTDCCyHqTCBTUJNssqZMdnxHjynXQSEs2mUYA323S5feSshBr2KFXgEXNQjia8CLyn8gQ4ojXxqpPoWF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 22:37:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 22:37:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [RFC] lib/igt_kmod: remove devcoredump before a PCI module unload
Date: Tue, 30 Jan 2024 17:37:02 -0500
Message-ID: <20240130223702.50769-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:a03:117::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 8559cfe1-d871-4b28-8bd1-08dc21e3feaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wSoTQzjK/IycjX26ckswGphmnFioACGEu3whvjbOmDA+GNO5OVwOJEvAlZ3u7/MK9MB+0fVXeFVVPbiKWIbWTj3Lv32b4H4UBQfaO7rX5WM//5Io+sh0W7H8SY0yB1eLZ6qwtK2W43FjdUv3Rg6ZT2+huaHNRSmS8+lo1iUVB1yfeXkZ6J2C3A1u8A+yP+TGiRf0Vk5x1QgCl3lZAlkx0EPsP2tJ+mAZoJ8fRdX190gRXeiP2t8CFjHTxIEy8h21p854fq4WumJZFEUZVQ2NeZy+y4JmvgKANqcov/AaryqCapd3X155xuoD9yjMaRv5AuQ1ohN5FiC7jEWNOXXn6ET0naC1dfotn7rGVOk4NJQlLvCJfWCpyf+o3mloZxyfcGM6H3REuYRVdr8TkRckPISPtxV7RM+DSC3I4kdeY8k0bh/UMcj3zeMLXbyjdJlIEG7kXEBHL/+86MK+QsYc05LlWgLbR07nMesILJCUKjXBXPgQLUSDNFcRcT7qd8IgxSR7AxM5/PlJtuw5nlusirU92OcdkvVcgfcbIqzhqwVUHLRVa53a8gKRdpK3pa85
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(6506007)(6512007)(1076003)(6666004)(66946007)(38100700002)(316002)(8936002)(41300700001)(44832011)(5660300002)(4326008)(2906002)(66476007)(8676002)(66556008)(54906003)(6916009)(6486002)(2616005)(36756003)(86362001)(82960400001)(478600001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y25zUEZ6Y0FuSXJvUE52U3ZYcVVna1VUaE1UUTZOSVkwamp6eFN1TzVTdkNB?=
 =?utf-8?B?QjcvU09lYlh5M216dG1kR3RmaHBqZ0dsc0Jhc1NTd2VBSy96QUVlZXgzckJ2?=
 =?utf-8?B?cStuZVdLUUkxQmkxWE14MkpCa2krZm02d1N0UFA2Q3hXQVVoOVJZckhSR0pF?=
 =?utf-8?B?SEtNVDBKUlNiK3JQUkdMdktxWTRjNlRZNnZYVEdLbUtqL2VOZzgyd0xRaFl2?=
 =?utf-8?B?Ny9WNWRjZkJ4UkdhZ3F2bTUwV1NoN0RUUlFxSFRXNExrTHh3TjNlTDNHaDVK?=
 =?utf-8?B?WTlQaXdkcjRSRGFDQWdkTEFKOCtCSjBFSlhDTUJ4TWVPWFFiMVl6ZFAvY2w1?=
 =?utf-8?B?M3JUNm1ydzlUaGp5RzZWSGdMRHU4TlJ6UGFnSEJSNEhCbmJydFhSTnExcjNz?=
 =?utf-8?B?ODlXY2dEVXNWQlNzcnZnbUxKZlJiUWRxc3ZPZ0JkVXZIZnJkN3k1VEoxQzZn?=
 =?utf-8?B?U012NmJOaTNwZC8zL2JMOVhXVVZQcGFVUDYyZ1A2V2tSMEdNK0tuM3c2Z3RE?=
 =?utf-8?B?RkhOaFd5SGRXb2tJYk9xRXZDcXFob3JxWVhvNlpoRzZBeGZUY3dsaUdhZHlp?=
 =?utf-8?B?MDRZTjVCckorTDFORHhYaURrcHYveU1vMkFPbEc0T296RFVST0JIQTRicW13?=
 =?utf-8?B?emhGUFQ4eGZUUDE2UzBoQno0TkpOdG1uc0N6eDZLcWJVY2dGYURDYW81RVhj?=
 =?utf-8?B?VUNiTFZRdG1QOEh0b1ZBdGlYQk9Vb2FDclE5NGt4NmhZYlZ4ZnBVZHA0aitm?=
 =?utf-8?B?d0R2bEZFQy9leTQxSlcxemY5VHkwRDhRMUpZZm12N1Z2SDBXUkN2dTlYaVBF?=
 =?utf-8?B?a0M2U015aC9VY3dMdE9OS3ZLWmQySjNjN1Z1R1ZjUzlJSGtXTkdhdysyNVgz?=
 =?utf-8?B?eWlsMEg1VEh5bWw3TDdKL0tTRG5yWk5ZUnBGY01IZ3Y1cWhwaXVCNFpJb0hi?=
 =?utf-8?B?Y3hQNjQ2RVN1NnAwVVIzNDVvYmNJR09nZnJVclh2TnZRemRPS2l2Vzh0cFRQ?=
 =?utf-8?B?ckcrWS9mZTlyTU5WWnpReGxTRGFxRUhFVzZydTRyMXNhZU11cWdLT1Q2VEQ3?=
 =?utf-8?B?bmljUHFUYzlLNC96NGFFVzVIQmNrb3lHdGFKRW1nN3BqdWovdG5rMVBBeG1x?=
 =?utf-8?B?bE5iZGE4bHFvTU1VOG1PaXFla0JQSit2aTZvRjZFT3crSkpwckYrV2tBZE90?=
 =?utf-8?B?UjdUVlRXN1J1cVJ4YlFYQVJmbGVodnh0SDZpclBhM2lDd0RkNXVNWVJnYW5m?=
 =?utf-8?B?amdsV29xaWp6MnlsTUtwRnNURkI3QzBGVnVXQk05T21GNU9ROEUrQllhN2lM?=
 =?utf-8?B?eUhmeUtxVjhPRlFPYTNOMDIxdG8yUXRMSEZQR25vL1FrdGJGaEZ1d2g3NklC?=
 =?utf-8?B?Yk1rKzhrTHh5L1Z4Qm1ReDFOWndPT2ZxWTR1TGxmSHNDZk5lNnFKZ092ZkY5?=
 =?utf-8?B?d1JVZ2VZMjQxVURHODhpUmVEMUpPV2FBenNVNG1MUE83cXQyTXRRMEFieWlv?=
 =?utf-8?B?Nm94ZW9wOGFvWC9Ed01QM0VhQUNMbDZRMGtLRDVMTGRQVENEdno5dWE4d3N6?=
 =?utf-8?B?RnNjUGdmTitIZFNtSmpic3RnbXJKTmJsYU9ubmZSdGJQbE85bU9UMWdCU0dO?=
 =?utf-8?B?SmpxV01qa3lORndyNjAzejE0blJqWjEzQ3B6WDEzN044bW9kdVh3aFU5Y252?=
 =?utf-8?B?Q1JHUTExNmpzbEwzKzk1MnhOenpteko4MVA2K2ZtNHZPS21lMFEyZUltdW41?=
 =?utf-8?B?dXBvY2ZjTlJCbUV6Vi85cmVSaXpvbTFlVHp3TmtEMjdiclRjcWFTc0VNM3g4?=
 =?utf-8?B?ZVk2R2IzWURrNFVEQU16dS9mTEpudTYyRVErR1hKQU13MWhOYlVjWGRydElr?=
 =?utf-8?B?bVZOdzhpUmFvcmwvaEtJU2dOMFZITGNPUE15L3gvRTFWd013eVpsWjZ2ZUNx?=
 =?utf-8?B?UlF6Nll5TXB5R2NoTHNTRXlQRk1kdG1LT0U1RWFjMzNDcmt2and1OHhLRFFv?=
 =?utf-8?B?U3V6YVY1NytoWjdIc2JNY2hScHpyQ2Y0NGRSRVNSSktqZi9OcCtZcmh5R2tZ?=
 =?utf-8?B?RmxKQUh6bW92MVNWZDNUYm5HTkRRSFltTUxScHdhakdMbkkzcnc4Q1ZrZ2hK?=
 =?utf-8?Q?XgZyirNmjhYFlBEoFz7ysg3RG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8559cfe1-d871-4b28-8bd1-08dc21e3feaa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 22:37:09.5490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJNOWK2ImPXPKR9brrBjDI8aOCFlsuw5+L4pCdTQ37j8JtcG6AImOB1iwO/8bXTbH1rKNTiNHaA6U+iYlT8mAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

devcoredump holds a module reference, blocking the module removal.

It is intentional from the devcoredump perspective to keep the
log available even after the unbind/unprobe. However it blocks
our module removal here.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_kmod.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 250ab2107..da44a7bca 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -323,6 +323,58 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
 	return err;
 }
 
+#define MAX_PATH 256
+
+static void _igt_remove_devcoredump(const char *driver)
+{
+	char sysfspath[MAX_PATH];
+	DIR *dir;
+	char devcoredump[MAX_PATH];
+	FILE *data;
+	struct dirent *entry;
+
+	snprintf(sysfspath, sizeof(sysfspath),
+		 "/sys/module/%s/drivers/pci:%s/", driver, driver);
+
+	/* Not a PCI module */
+	if(access(sysfspath, F_OK) == -1)
+		return;
+
+	dir = opendir(sysfspath);
+	igt_assert(dir);
+
+	while ((entry = readdir(dir)) != NULL) {
+		if (entry->d_type == DT_LNK && strcmp(entry->d_name, ".") != 0
+		    && strcmp(entry->d_name, "..") != 0) {
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wformat-truncation"
+			snprintf(devcoredump, sizeof(devcoredump),
+				 "%s/%s/devcoredump", sysfspath, entry->d_name);
+#pragma GCC diagnostic pop
+
+			igt_info("%s\n", devcoredump);
+
+			if (access(devcoredump, F_OK) != -1) {
+				igt_info("Removing devcoredump before module unload: %s\n",
+					 devcoredump);
+
+				strcat(devcoredump, "/data");
+				data = fopen(devcoredump, "w");
+				igt_assert(data);
+
+				/*
+				 * Write anything to devcoredump/data to
+				 * force its deletion
+				 */
+				fprintf(data, "1\n");
+				fclose(data);
+			}
+		}
+	}
+	closedir(dir);
+}
+
 /**
  * igt_kmod_unload:
  * @mod_name: Module name.
@@ -341,6 +393,8 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
 	struct kmod_module *kmod;
 	int err;
 
+	_igt_remove_devcoredump(mod_name);
+
 	err = kmod_module_new_from_name(ctx, mod_name, &kmod);
 	if (err < 0) {
 		igt_debug("Could not use module %s (%s)\n", mod_name,
-- 
2.43.0

