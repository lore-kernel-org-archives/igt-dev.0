Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4949FC54798
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 18:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3EC10E5E1;
	Thu,  7 Mar 2024 18:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUHDfUFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419FE10E5E1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 18:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709836276; x=1741372276;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=miYT4ccO2B7cZ5rNYOT8GFd4aHywevV9E+L8gKQi0T4=;
 b=hUHDfUFud/oW3LLqd2fUnQAWD6Cqy08eJu7gjNIUHGS/d4ARhIByRxOu
 NQKg5y/R+eySaOoe7IWULmMTwgzOo1B2EpZOva5wdvASCZrP6U/Y+N7TM
 7iGZhAV+rfp5I9MJyavB/vv2xRWafH19keizpOHuvnojDGlSB/Mp/Xnx8
 mO13zclj7VUkpOST2Bpaesfm16XOUx3QA6RxhjCtNc2KVBkKBxI0A0Nfg
 aiMFdVmjRijBqrzQyijAmuyTLYUtFRnb3cy+UPo1NvPDD4nWtEJzLATmY
 JkO3dp2pABl/hLkLZrAG8ejN8pCYKqSNi0ocZnoO+pDASJrs4efs67GzJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15248549"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="15248549"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 10:31:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="47676206"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 10:31:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 10:31:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 10:31:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 10:31:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRv7xlBiJP0v3lRms8cgR5cN+VmaehUzE83ymFuu91ud3+p9SIs5qoLmIao1s46yzrSmuSlfJBK60tebu1NMzKAnng0++0Z7bqN+o+M6qmYgxusxSU522DNAmusvIb5gVY9KWaiRK5P2wvyrfdhHd1wmB7zU7Mgxq96ICBweYivjl8/xj/joLJlDJaeQtdipdbtZppc8pyegDyMOcJ5OmvS3q80ZyLQygzQHy70uOj7grz5RBVorhY5kWZY5EPlGMUN4VGZruNH6lKXUu9CyGbjjIgD2uVgpsH1MD/z2NJSqJ5MjMOFTL5fXWMhfKrwiUfvKVMHesgVpfJzY+a5/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfWnmCSfk6+c8wprGUVpvZOlXYIDBY0DsfzXxkvdYOg=;
 b=TUOcKwuQBfrNpiGEpqIvQtWqFdVVfwu/YoRVNCNilV3VsDgKLxA1mpWHXTj0Hd2tkvQ8Hy5oO6cBHK4CugL+4lOFGxaxIp9V43eFHDY+L7J3l9rMvVNjqPs0qwAJDOr3y0Alju7G6IWOa+HSkkfBPe8MxtTRkE91rRYVhEFPy1Afm2sG92gWDaVmF/EU8X71u6GpoGoTD0DBZn5hnJAJQzbZ0dcV2UocUjaUYj6ETSwM8wXsy5mcWnha4RKO/lQqEWxH2A5MFt/EH1vB2y/cXggW1wYfjJNzia8JHA9g334QsZeuD2AYT6wO2//52Szf+xPw7HOpCSXHAN1WMHBgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 18:31:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 18:31:12 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_pm: Fix runtime_pm tests
Date: Thu, 7 Mar 2024 13:31:03 -0500
Message-ID: <20240307183103.188082-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 430a9ea8-2a77-41a2-d4f4-08dc3ed4c3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IFArOZ4I7Omx5BPmpWY8/51YN3fv4GcO8YMDMbVjLUbLb1Di4bpLwoDL50SAImeprsWwPBdfgn7IPvqqB2jno9Xemv1MGzCawpTI/2NsXWOm05N+EnwxboAASIQKHX1DZhQB21HdvRrQ9ZfjXmzhXV1d29/fPZXbyp6I/8GqcQKFFDZcsM+7OE/xwMQOEgILG7YLWPxjxg9gssjwdASfj3zdiMkKGfV6k4nlNVDmMxSlispeyLrwT2iIklwda3nDmIBty5nNApTDN2SMvtAgy1jq4zLV0tVcqAvIu8o5573/+XpPBd6FFraggySX2afT6vK5d7bNrjdxHK2N1+2B5owoq0VrEhOtmk73eZIJ/S3tPrd/HB+ZeyMMK/Fktdzie5cvCYxYl6U8GVm8ked4JT9zOjWfwHHoK19XjOFQd0c6ssXQ3ObF4VTcivUpO3cqzcUH0OO8pEvpul1W0LmUFlU2jEAkrtbXDu6lfH9CKmn9zipWksw7J80/vCVEfsN9xivoOxAEliaZCJQKT4QHuGZ38wJhRfJr7q0CCN91E+tH0cS6NTDq6CHKNDGui+Cw/H86YKxZYiZrjXEokjqXEaE+fzUQMQMcDcItxE9xiQn7uOwJlF31P1ho93G86icNR69TDvuKZgn39lL96NiclzZldBw1wFISNedc1/hxc+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oxBlJJ2BwKwRyp27Wpdg7dZSYHjwH8EfhP8QJyjowC8GGMI+WEPnx84JXZu7?=
 =?us-ascii?Q?1FWldtDyn5BOjfwuZkDyURlnTDJ8Hb0rjbsDSHPRqTxpdGgdpid6fC42Gda+?=
 =?us-ascii?Q?/1gUu94gVF3Dm+fVN+Iz19+gdgyX3Rn2MNY2/ZmfEzni+F8jUdXk/qWf+4VX?=
 =?us-ascii?Q?4yGHCw+f9znQiDXkBbUzXKByeTSNlSZOiU4McxKX17bmZALBuT8/IDfO3PSA?=
 =?us-ascii?Q?eq0ACzNTqCpiFROvSe6Jv89U03NBC5erP0s7mfO/4YANcgzVWkJnHhsfih7x?=
 =?us-ascii?Q?9L7A9XXbAZRm2Y6tTT1EeAz/UCWSOa4TvnUzcAQy3C91WxGy10Ypco+spzCq?=
 =?us-ascii?Q?nXJvse7/0kmQS6ChbuzmnZOzv75n2QqpJbIH4n5/rTgvloNoJH5aypoyvOEf?=
 =?us-ascii?Q?aZ+dW3SYVTHrJpI48nMritEfYXlXjxd0ZJg7aCjgaCNA7yFKn86RaAOvrUt2?=
 =?us-ascii?Q?goc4C8XZCb6PuiEcNSPBv2UPv/29ZpYSWjCm6lnwIddVhfFSy+KZJ81nD7Ui?=
 =?us-ascii?Q?6NYnoXSaOHAEruZRgXcZuTd0Mz17jTQfTwddB0bjRrbupx6B51a0YQTzZUk8?=
 =?us-ascii?Q?C+k6Su8nzcfoY7LEsrBt44HJi0RiU1k8xTY/IhDM7QJiEQ7p+pdefB2LHy/g?=
 =?us-ascii?Q?HHX3e68bWhvf39tanCLrG8GG/Z0JlZboFOaDKAdjlirJDXow7Df9mCzVW2Lt?=
 =?us-ascii?Q?xrIzo++DUhc8AABpE9XgUIn8SJKm4GkgqF00ieIXPU9SFsmk3ZnzHnUNgDRS?=
 =?us-ascii?Q?GZQLqeGO6Gj4+uSAMcvz6WMjSCZ8jp2CE2fDJWzc9zF7CfXMhzs80MDoLX9A?=
 =?us-ascii?Q?km80h2lg0x1XJeJktLhPbig6zJviQ/Ms4YJ0qsuZ1sxPH8bR/feA8lOtq/ni?=
 =?us-ascii?Q?KJezhJIbWO761UW90WN9muEQpw0bQWSKOyFQK2Bz/7bO/vleEM++txXcx2hB?=
 =?us-ascii?Q?yxlZ4xlJMZELK7jeUcv05JwklNiCjUMFCSBSRrzwBwpDTONyvsue/uSqAfQM?=
 =?us-ascii?Q?SSj9jqS2xZ9T3aXQJ0R4L3B9xeGm4kQfIPp1FJjkDvsk0FwuUG+cBJXYOq3D?=
 =?us-ascii?Q?xvq+D4d6D7GUZGNe6Z9cOC9+wZbQzElbEAiksGuZ/it+jS0Scuf3HwVSG39i?=
 =?us-ascii?Q?fqh2mgOfhBG3EaH4DbF21DNSsmR1QQbqoqw6cQeBXpZ5lFPXqjqCrfOD40fb?=
 =?us-ascii?Q?a7gucov3BipOFECtQC4n5L4OWugl7jVq+9dGfoel4HjR8mw8h1pJn2/OlHUR?=
 =?us-ascii?Q?Vws3QioUKGJoPBA4cJF814LKIKVfChFNPqSXXGZlg8NjN40tNfLH9U24Sv1Q?=
 =?us-ascii?Q?5v14/GEF8+D1PR4aYlPKCbe9eZvHQ4oMDJnNY5EvMqj2PwRYN90mEbVoTOfl?=
 =?us-ascii?Q?lnbXWhMbuawXggRtFfavE5KJXGKawepS8RZHvxIGg8oKIDyC1KiEpAp+nqUz?=
 =?us-ascii?Q?KW6eTEk3goQkTNnFJWx0SB2RTlay4ojuuOAjZ9QY+oq2Q5XcG46EMXdGYz6L?=
 =?us-ascii?Q?MUlGMel3omNjdrqAmujz1/FlmQ+ld677zA0b2GLC8Fi7QENDgm8gCBAGbJO7?=
 =?us-ascii?Q?6m6KKB8NrLVQD2a/vVwkaefRvGUQfmdYYGwqFzO3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 430a9ea8-2a77-41a2-d4f4-08dc3ed4c3f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 18:31:12.6489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mzu7xsA164ba2CLPwS01O4FHYtJ35L+Ecsm0AihQw5oPi93saTc2NKRSfGs1yEkFdlMJxHoOiSw+E9BLeOBcDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
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

After the introduction of kernel commit
23cf006beac3 ("drm/xe: Runtime PM wake on every IOCTL")
the many ioctl called during dpms_on_off might be forcing
rpm to transition back and forth active to suspend.

Then, when setting the d3cold_allowed during a transitional
runtime_state, we got some situation where the runtime pm
might decide to keep the device awake for a very long time
even with runtime_usage == 0.

Then our tests would start to break like crazy:

(xe_pm:29453) igt_pm-WARNING: timeout: pm_status expected:suspended, got:active
(xe_pm:29453) CRITICAL: Test assertion failure function __igt_unique____real_main473, file ../tests/intel/xe_pm.c:556:
(xe_pm:29453) CRITICAL: Failed assertion: in_d3(device, d->state)
Stack trace:
  #0 ../lib/igt_core.c:1989 __igt_fail_assert()
  #1 ../tests/intel/xe_pm.c:432 __igt_unique____real_main473()
  #2 ../tests/intel/xe_pm.c:473 main()
  #3 [__libc_start_call_main+0x7a]
  #4 [__libc_start_main+0x8b]
  #5 [_start+0x25]
Subtest d3hot-basic failed.
**** DEBUG ****
(xe_pm:29453) igt_pm-WARNING: timeout: pm_status expected:suspended, got:active

By simply waiting the suspended state before we touch d3cold_allowed,
we get our tests back to a sane state.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index a0045da0b..fcbed6249 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -121,6 +121,16 @@ static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
 	dpms_on_off(device, DRM_MODE_DPMS_OFF);
 
+	/*
+	 * The drm calls used for dpms status above will result in IOCTLs
+	 * that might wake up the device. Let's ensure the device is back
+	 * to a stable suspended state before we can proceed with the
+	 * configuration below, since some strange failures were seen
+	 * when d3cold_allowed is toggle while runtime is in a transition
+	 * state.
+	 */
+	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
+
 	switch (state) {
 	case IGT_ACPI_D3Cold:
 		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
-- 
2.43.2

