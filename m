Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44294C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 22:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE6310F7BB;
	Tue, 23 Apr 2024 22:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmW8ZJua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B6810F7BB
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 22:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910863; x=1745446863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H2frxpWlfTLR/Cc21pvGPimEui1LNZyGGHDOAzv1pwg=;
 b=FmW8ZJua82ZHPQR8xl5yFhPVTDXje8d4TJmRRnRt1J87VTdYyNltvvQH
 wz8dRLgKfXmqQxuMHPAFiSc+e9kCKx9m82zaamkZdEhXvVcNOULit5cla
 IVdWwd37KIiRCUvT9Ia58SWQVua3nnDZMXLWPMEvgxUwCyvT5f5pRnuPo
 0cbP0xLD+TCtVwRzAM/Vn3SSGDw5PNbPNzv2vYd1wcIIp+MdL8vCMS56Y
 s/aKP2wcPB3Tye9lnWK9F7X1Doiy9oQ643cLivLzE6aE16ZfUZrpZRauY
 9Ha5zbHSMRF6aXh1n/5jIpG3jKkSXUXG1IGnILeJYv8Aljl3EG6oPjH7x w==;
X-CSE-ConnectionGUID: vdN+bYsrQk2gGRB9aT1UtA==
X-CSE-MsgGUID: g8loOwe6SVy4qkAEAys3Rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9736924"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9736924"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:21:03 -0700
X-CSE-ConnectionGUID: 75NLT90tQMqir8EDEuQkDw==
X-CSE-MsgGUID: Kr9ZcnP+SOWv4OKSNal7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29305940"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:21:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:21:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:21:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:21:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=birL7fK/iTT3quRXC/FtPTN0pNUHTVSHANdSuwEO56y+IbFqKP2Il8WCqnH2z1X08MnTh/0QBP8lywzsKm0Nh8JuY3mb3ZMIVgkr8Clj22/5DULrHNTzTHofryYnV/WzgeGa0Ygm8vjcWZKbJ3+QclYyLC00XCpMcx4uK61wfHsY8WOmm8daVJhi9tfiy73OM/nH/1xRFZjsUbmLiq16U2LqQOdZYv6TzePhXUEs620tw0ACuQgRtPQ9lMSWsxJ8PMiXvBr0eJBxKsOSbu9WObSbaSvuyixjbgtzxokhXW6rA0337Id1kfFCzkHOHTH/GixXEycZ8A5xyJiW8jqKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtbeRIKKdT2oLaOStpD3rQPwn8QyEN9DyCIbkeDzqSQ=;
 b=gO7eWNbxpVSLedMPGgrIGjr3nLCFL/WtkiqR6cwRRgRFv5RoS5rQ9G+75o1noHPphwLiWerLOZxq+/kweuB2oMH+xXpi+B3cf0E+dyM2RSEnRgcCmvpPno2Sw+VBqPyM8GYZDyW0tXjpLXMSA11UrPQZt/8tY2541v5Kjph/cQEM6pxjdspkswDI4nQnVV3NlJKaj7pBI2abx5ZjSBg5mcmCPFlyZ/gLjcMWy4Mjiupbw5A1jh4ESDraEkxtpdi8CO9Qiw25yghGyHK65fRa61orLD4lM7/+tf79MwxlcHpNKyDB/7c9czA16XSiPxpFeCQJ/a1+2dQtn6SK1LKRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 22:20:59 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 22:20:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/xe_wedged: Also add a simple exec to
 confirm GPU health
Date: Tue, 23 Apr 2024 18:20:45 -0400
Message-ID: <20240423222048.1285570-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423222048.1285570-1-rodrigo.vivi@intel.com>
References: <20240423222048.1285570-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b07a2e0-a3ff-4de9-3f23-08dc63e3a722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jhCMNzldwedITrqmwZvm88aU9claGo2RpmkpLqcfwiQN+6b1uPK9LVxUBWnR?=
 =?us-ascii?Q?lmJyAvKLxUnJ3XoxffoXGqwEZMNyiDQAx6SndmIQ93hk+vuIzzfKwniS+wQD?=
 =?us-ascii?Q?ersPrAEcuaPnibsW/JZ6+frbRATLuICIEmi8YydGrSf2cC1fsF/SH0lCY3Og?=
 =?us-ascii?Q?Bdb/F6SuYL9biPGe0Lp1ORFQm+nGHwwLCwc5fXF6+h7qV2rJi3t2T4HH7nMK?=
 =?us-ascii?Q?iNC9xFxuZQRKTqb1TjaMkj1Pjv7IswYxAvrNjMch9Zvrdr9XzPQdS8yJVFlu?=
 =?us-ascii?Q?yfB8Ahu92NJq6O8aIBnHvTf4UKz2eyRGbRcjrCx3ENZEOHN2bwE1i80wK1AD?=
 =?us-ascii?Q?6LLk/kTli37rC5vg3M60NZnIxsL97i9yutZLC3cKQEPXhU2Z9cxX4t3Wdf/D?=
 =?us-ascii?Q?l4MBB/T6qXdqJe4EzMOWaLGaiI8YGjnYS1eJ7AQhhHQFNyx9xLsiLCNep/xB?=
 =?us-ascii?Q?FL6gCuIt2gh9TfBUXXKDWvwOUB2o4iUQRaQHoYUIf4QhS4yw14SYP76AeURR?=
 =?us-ascii?Q?xBDBMrMChdLxtTptHmXxqS9HJiXsSq1u6/8wMVBpkM4jzsyILOKH1nBqmryk?=
 =?us-ascii?Q?dekzFZF9ZmPES4VkSyeEl09tl54df+g81aLz0L2QIsHV4jDLDbspN3ol/p7j?=
 =?us-ascii?Q?aQsAf/2h8DK/6ICXBkZ3VA7Zbo98+iE3oRFIu4lIoN6AkIORUsHnOP+xuHpa?=
 =?us-ascii?Q?3BOOCjJcxc/9RWotxp1TeIo4bQkO4l/YyhR3E7P3nE5rca002jMa7LdSCsAC?=
 =?us-ascii?Q?qja90h7WYtXDdI4WJQO3vN5D/7vAy3KeD+WNFu72PyFc3Fy8nwAMuX6JHef0?=
 =?us-ascii?Q?wgkbrs/pAlbml4Zs15+dZNao9RMlRzXu/DN7n2XhYcD/oDUIRbHIkDc81lL2?=
 =?us-ascii?Q?hQjEQV3bIi1yEj2Gxx1RTWBVlG3YT0ZXbDZX2GTE3iqCbwJMKbhrj3TjuRUI?=
 =?us-ascii?Q?o/BrB669nzIHChCAYKO/F+Wk1iAcvStjez9rGMQ+m04rmuFaACVsmZbT3xa+?=
 =?us-ascii?Q?Y5N2fvScAm8shu9uaep0sWimikUPnvItdDhKDSsYoUksvP7+9aytqZ8zX3D1?=
 =?us-ascii?Q?mEnrS0b7C1cf4eeppNTZWsIQlAr0w5/umi64Y0nUuN/FrbLJpn0+8sp8u85D?=
 =?us-ascii?Q?Ksy+bX7EdSbgGtbhzrB8Tu+i0zWnhkQ7V0oMbT7AcUmW66oK+khhcqmtcJdk?=
 =?us-ascii?Q?Ha+2ydymb+LUjWcr3xOtMxDjSq9x7XA+8alnoOeTriX+OZG/pIgKqBou/bt/?=
 =?us-ascii?Q?2RdVMxhVh5ZQqqapV0Zq5ymq1SmUqMAB+fAPlF1ykw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nVvncOPclFFZQKh4y0h7789n7jriS+Cu+gn7I/Dw7DMOWlHjYCQV5iB5856t?=
 =?us-ascii?Q?PuzOtX66Gxs+b/Y/QDooKsxaeexOLE8DLfevjauJVADzXVT5Z+ZYwQWjonjY?=
 =?us-ascii?Q?r/RnDcyPgciponUS+jVL6a88BzhHzy1qSqVyVvSqLpaiS0YPLMjK04ss1waj?=
 =?us-ascii?Q?+elagy6eHt64F8Ca/aqc+KA5SRpfgqRn4TjT7Cl379BEpk9v5sk32BSzTGWk?=
 =?us-ascii?Q?0VAq+P0QLhxbEp4gZdH9o2kCV7yGAxT8Jw5igE5hjs/qMpdsKqWSzEemLagp?=
 =?us-ascii?Q?2zgOUlrIsogdJ3cQ+aRtC+uBQh6VlaE39wjU6neJFMa4csqcoKeKwtGO2Ww6?=
 =?us-ascii?Q?zmWXnt5XqPhoWDzJOcjj6VNQ6DRguB3cG4HG9ffeY+niI8O15slBAMl//RBp?=
 =?us-ascii?Q?dxqXHG8mh3sEp1ESulqmwdwBYuCQwETHOQpmS/HjIWcCvz2oylb54WqpH28Q?=
 =?us-ascii?Q?obSfng2BSnfmIi2f4uUAjXPwojaiDuYN3rCCRrJ1JrQnf/PjxlD5y+5DfSm0?=
 =?us-ascii?Q?ojB0xYhbgQf/JWkcV8UJ2fuWQSNsyQYCQUF7MtmlrT5pPG1/lmUFzs3YuU6q?=
 =?us-ascii?Q?Ur0TymB7YASZd5mzccVwIgaXkfkZ5WBOD3GXSARefNJRKdcd05y7PYoMvUn2?=
 =?us-ascii?Q?Z+xofvmVtO7ygtS8E7hHfewhiyuzI/GYaH8UYoqeNc9d+WiHVI4toRFe4OY8?=
 =?us-ascii?Q?5XNxCo5SN7u9py2ibq3kOIOLwN7W5GXj1s3Gb5YC2lWyBc3M6Uy4bahyeS3a?=
 =?us-ascii?Q?iBLvCs0/JtTPdzrXq2iMYL/BD/9KK/B2VP1DJLbFvA+9C7tzNnhpqBT61tAD?=
 =?us-ascii?Q?GDENqc3wjUmncioi710T/2rSKRbBdN6ujmtXtQbthV6sqetZoFUlDzmjwKv6?=
 =?us-ascii?Q?hJ6zZm9CTOgB4aVYAyqjupH6LHcADjDQDW7Vcleo74DUAZ8w1NBqft3ZMmP8?=
 =?us-ascii?Q?T7iSWicurKL/IKpY+jQkFfHBg4NBS4eaS3sa5ToMeTuumzK9mNPj73TDzMtt?=
 =?us-ascii?Q?4OBQ8kknmhag4KrDulNwNaDiRcgxDH+DDIDQCSIS6rTc/gyOKag/qD1qHRZl?=
 =?us-ascii?Q?1DwhyziMbe1j04DbpcoSjcK0CmIA4e9GLVvUn/UOkTm42lcmartpgodHt7k3?=
 =?us-ascii?Q?D8cJB+aJM/hQhvBms3MAghugAlA/oTso+HUzgWdLZ7stmPIWQ4G8MfekPlw9?=
 =?us-ascii?Q?CC4QFQQulKQHdOan9OXmtrhNJgkBeCqRZ5ZpmLFOYSzZg+1qDLKduH0DjivL?=
 =?us-ascii?Q?jh97GenUAx9y0+9LE33FFEMDx9kmeP0NwOixNbcrrQoi6DMTaQjYeHbYO6T5?=
 =?us-ascii?Q?WyJoWSmd60M9Ax8xSzvLpRM7mQHc0z9rulUwsQpnOtHW4L7XdYcdeCZStErG?=
 =?us-ascii?Q?Ieoo5tf43x9rL1VoZCTDyRfyydyvoOQtUPI9NpaxmAcqoymdymDLOlWGEUlB?=
 =?us-ascii?Q?3gCZAe0MzZUGCcBzFN8tyB/8cldDGLaKNKzh/TZa/zzAmE8NzQh1gBrN7iXB?=
 =?us-ascii?Q?4gvyszl5BMsrytHg30hOzRwglzuA1nq33qSthxji0Wecytriqg1+YUFgVBc9?=
 =?us-ascii?Q?2B4p2Z+1nh6Obw3uAru/pJmMI6mxin9+YyEBchi1nQDLTPy9Id1bTuBHZwYJ?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b07a2e0-a3ff-4de9-3f23-08dc63e3a722
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:20:59.6407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDVkOKqZemE5hObGKP7oxUmi099HP0YlDfI2/WZazsHf+iP0A34BG34OkwMCdidRMSN1mxuLGjFLnNQVEQ5ECw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
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

Besides confirming that the rebind puts the device in a state
where we can send IOCTLs, let's also ensure it can really
perform some basic exec functions.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 90 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index f2587cc43..ab9bf23d5 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -17,9 +17,13 @@
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_kmod.h"
+#include "igt_syncobj.h"
 #include "igt_sysfs.h"
 
+#include "xe_drm.h"
 #include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 
 static void force_wedged(int fd)
 {
@@ -75,12 +79,96 @@ static int simple_ioctl(int fd)
 	return ret;
 }
 
+static void
+simple_exec(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint64_t batch_offset, batch_addr, sdi_offset, sdi_addr;
+	uint32_t exec_queue;
+	uint32_t syncobjs;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int b;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	bo_size = sizeof(*data) * 2;
+	bo_size = xe_bb_size(fd, bo_size);
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	syncobjs = syncobj_create(fd, 0);
+	sync[0].handle = syncobj_create(fd, 0);
+
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
+			 bo_size, sync, 1);
+
+	batch_offset = (char *)&data[0].batch - (char *)data;
+	batch_addr = addr + batch_offset;
+	sdi_offset = (char *)&data[0].data - (char *)data;
+	sdi_addr = addr + sdi_offset;
+
+	b = 0;
+	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data[0].batch[b++] = sdi_addr;
+	data[0].batch[b++] = sdi_addr >> 32;
+	data[0].batch[b++] = 0xc0ffee;
+	data[0].batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data[0].batch));
+
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].handle = syncobjs;
+
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	syncobj_reset(fd, &syncobjs, 1);
+
+	xe_exec(fd, &exec);
+
+	igt_assert(syncobj_wait(fd, &syncobjs, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data[0].data, 0xc0ffee);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data[0].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobjs);
+	xe_exec_queue_destroy(fd, exec_queue);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: basic-wedged
  * Description: Force Xe device wedged after injecting a failure in GT reset
  */
 igt_main
 {
+	struct drm_xe_engine_class_instance *hwe;
 	int fd;
 
 	igt_fixture {
@@ -96,6 +184,8 @@ igt_main
 		igt_assert_neq(simple_ioctl(fd), 0);
 		fd = rebind_xe(fd);
 		igt_assert_eq(simple_ioctl(fd), 0);
+		xe_for_each_engine(fd, hwe)
+			simple_exec(fd, hwe);
 	}
 
 	igt_fixture {
-- 
2.44.0

