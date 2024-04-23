Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B63C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 22:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDEB1128B8;
	Tue, 23 Apr 2024 22:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UI4qZrEQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C74310F813
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 22:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910866; x=1745446866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SU1vttmvVzbS3i8EaBv33A0mWYWLAOsmT1Z/rH6JXk8=;
 b=UI4qZrEQkWzgSpafStdry2+VT43FbF4dl5WCJzoYwEkbv+P55jc4+wxr
 imsHjPsLGdMZDgvfHHTfOY0v8gTHOHv1TvFXlBsd0bu3KsYxI8SCKeuro
 eDGDw71TpQiegSJVx2iu5MFf4GESOxYVEpX9z1re1K2GeaQEWK+FlIr1o
 6T43nP+g7oWWI36npyuBu5dpys763Fy2V7oWtcb4o8jA3aDm10dX9DQ8X
 CLsOarkRszJkcDbOGCI3DQtrLfxpx3uFd+yAeMWgFMDhIgvHvaL2mExoV
 A1pHQsgtHwfDcssA+wi/wSNcerVcu9b3eeDfyAMsH04VLj0QGsqxaiQpz w==;
X-CSE-ConnectionGUID: j/nEkOlnRnyswJjA8S+tmg==
X-CSE-MsgGUID: 3v+dNwXkRv2/DeO20G7fKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9682194"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9682194"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:21:05 -0700
X-CSE-ConnectionGUID: ZvJSfWihQzmNCRLXfNK7tw==
X-CSE-MsgGUID: 5ZwK1znqQxydc6Z1N9B0wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29158262"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:21:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:21:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:21:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:21:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:21:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZlljsWB8a9E1TIYvtq/oBCSJyH1K+VrpAOz6lXEu2GB0D+/4sZAHTFGkmj7dPEBqy0naYGqTDIq4G5b8ZjYZ/JVglRyctGWuiRFl0Z4RaVKFJnu29Y0cFmmWmpQQNzOi43Pg98b3QpEx63Q6dQfjWCynBSdh12waX2Tj1yVHh5P/YqVUYTTz88Fm2eESb9UevoSgWoCltiV+lNpc0QFCF+AjaWGVJr2XxVwB0JSciXGQ2xZYkE255WxcaW8xd+s4yea0/Tu8jfnbLEJRsPVxkQ7DW8vKvQLoxA9fW3MJkpMhSE+RyfVgecimnLM2IL/qsRUPR2xj/ngTHFnA/WhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPSc82N4lrL9IetBW7ToHlX2f93uuMnN8w05GTox5Jk=;
 b=IUMfVQH0TEH3wARbDImg3oUOlQ9XZzdkgsR2tBeo6+CaOG6XWvYXWpXgopsSlmfTynlbxvEunO3scLfspHkithjquhDN0ZDBftGRBJCo/Uj24aMIo71OiUfs/Pg5QqHwCzrGuSFJ90mafRJK9k46PclYbrNXd8r3Jq/pfW5EIkiY0t+v2ViCsJaRCvjo+iYnlO/WrB+XPoa4jS0BB31TMOZgOuubrmYkdnwAPtKvh0Z+F8xGcg/kucqJI/537rAoSMFivi5O51mK1thdLeomMUXDOIq7P3Hh466istbjY9OBIpWlb25AJrmQbAzghDHeJM7zTFzlsOsHkqlsSSjxmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 22:21:01 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 22:21:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/xe_wedged: Introduce test for
 wedged_mode=2
Date: Tue, 23 Apr 2024 18:20:46 -0400
Message-ID: <20240423222048.1285570-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423222048.1285570-1-rodrigo.vivi@intel.com>
References: <20240423222048.1285570-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b18cce-d804-4350-f9b0-08dc63e3a879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wg1QLBosf0HBXNR17KQZQGszuA7dI7soDuF736sdQjN9v2GwvoQV+lLqDjTM?=
 =?us-ascii?Q?E5OGwvYoGfmW7Mc823sm+jI+Th4Zyyhze74vdq/Ym0Bc6glQqtlE2NVbjxVT?=
 =?us-ascii?Q?CGRo1cGkEgmP4/5t8BWXvSfx+I7uPz5r+er9aS94ok5Rv150d++YVGIcc8qc?=
 =?us-ascii?Q?nswEF0oCFUcLRlB8Thd3npDICUnuBLmX27cxReaJauSWUC4dziVQ3MzP/iQR?=
 =?us-ascii?Q?wwDAHOqi/BxYVzpKcJX3BKjkOrldL5PFjaI/oEyEYmi6n+K1QIDMgpOZKndn?=
 =?us-ascii?Q?VxFNlq0NOTLcRG4CFezq7K6Iqo+TWRbWNdr1N4rr9uGLcMcgc9qArStrDe8b?=
 =?us-ascii?Q?o1/+V+RdsnvaQngLGzgzk1RT54+LrfQmP6IQS6daO5IMom8GbmFdaxm+dB8W?=
 =?us-ascii?Q?ipZtNh1+TGF/SrL01n012Kr9g6K1HrrPKgsKH5LeY1d04+vOyckZxDhRMQz7?=
 =?us-ascii?Q?qs5AfGp0spdcetsIJYNgeCs1wDieeYhAroAVydT3RPlVpFEFwFDLcxl9OEbg?=
 =?us-ascii?Q?Ij3jQ29hvxWDuENTeCYgqnlZ8PUG2vW1DzIP2v7+nDwYORrsMowWPPYFeMHT?=
 =?us-ascii?Q?XukhUKn/JebyVrODvqGfFfEeN1hwuEBeH1ZVwb9zPtWcMDu7nWhvPexsyBJa?=
 =?us-ascii?Q?td9YLjD7n7Ew0NATYSCLSz8QlIVqlToIU6YgIVJHXolujlEzFTvGyf6egrWb?=
 =?us-ascii?Q?EIp9GJOzi8FYf2oNhmrTzyZT9jICSfXlFcbotkcxv+k+u3+mMVoa1lrl4le9?=
 =?us-ascii?Q?0KPVg0Ip25oLrIl068z070FXCWrSZ3Ej+j82Gb1K4Q2R7cBr+OrQrjaDg0RL?=
 =?us-ascii?Q?cCQfHyVlNcJO7M46I+8/dHAobTVaT/sJM40T2Dk2caSXrWHZypmoO0TSyw4y?=
 =?us-ascii?Q?NeYq1px5qWRAu5pxS3gBDRKqfPVzCH7xrO0nJ081e5C3BhKQ1i2ClAGq11Mo?=
 =?us-ascii?Q?p64g72lKMUJK18D/6sF/iHPO8AsklOle7NK0nxC/1UmnEfhG6mY0xTu02Eap?=
 =?us-ascii?Q?X6IWV0X8pHmzMtCKD7dDlRORFgYWT3kikkqsPWLg6UZ4vVAFuvP0Jz2aKcj6?=
 =?us-ascii?Q?Tb/I+e6oueX3K38xJJb38VP/YTRrRfjiu1piRHR26Wp0TQ9ZTfEjfEJkkv/C?=
 =?us-ascii?Q?GXy6B04DJdYFbk0GnA6RjJtiAmGVl9WiOypncASiy6qGKTGNAGrxVz1vlifG?=
 =?us-ascii?Q?vfoWp7BqlPEyWs5jnejHyRIaQGaWYDyLfo/lBtplKljl2Ej9z2GJkwQtPyza?=
 =?us-ascii?Q?LmQu5FO7uwYyy7AN3eTifE4uH5NyxNwJio9ow7ce9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P9miD7WkKELr2mYP98ecUf/4jA/hFD+QhtQU4Uiqj5EZMi2N/iDMaZtIwVei?=
 =?us-ascii?Q?asHKz0nLje4FVA14ngIl51E9s46w4kHLjnwQzKXvpckcdl1EIAedL6stP+LU?=
 =?us-ascii?Q?okMMRWEj1qpeWcCgBJJs60yuof4svyZoUFFhlZf9XKBJLE1ps/QyXTSde2OB?=
 =?us-ascii?Q?rD9r1pg4ZajXULsv3xJt8s4jhzEJDsZWMKr74a8PTwmxStJgoueQaYP9Vg9w?=
 =?us-ascii?Q?ZNM2y4nJPrzco160ckPLo4zhldjBlpHSf0MTqWSBsiW5njDOik1yLlmEi0Zg?=
 =?us-ascii?Q?piaPtSW273TtR/FiGTeyoYTc9L2y6aUz/0FWrllmn6oMHDmJvRH4xR+G9bvW?=
 =?us-ascii?Q?2P3jNZpuOuFvnHM0CzcYpLGeAhNJLmIZjEaTaYJ+vaTDnJXezJrpoT2qTlh8?=
 =?us-ascii?Q?nuoPyQ/kWMyMKi9awUa+8NYqMxFQ79ZLqolQlVMKtkfe/Ujq7hmd+hVrhYqA?=
 =?us-ascii?Q?L+r9inz3CY1AqZAkrIhy73nr44LRICPoSqPM/zBl0iB9wkZiQAJpG74BYJly?=
 =?us-ascii?Q?8DvYACmnGhKi4S9jdDNMVLKEIk7puTBCT2S+zDrmpjapL1oIuwAnbxEF1C0p?=
 =?us-ascii?Q?qtJuriRfKvyuP6wRvVg5vRMxEm6SGUWNKJCRbH0VoZLxWT6XiRGbse1WCn4R?=
 =?us-ascii?Q?PHCbJrxeDVx/0hx0MO7gwLF07WmkhaFkIvSJvdgu3MjSP3ZentPax5HGZaJL?=
 =?us-ascii?Q?t5A2pnhpuJHZQLMU+P2c5L+tBnPeRJvGt/dsyIXTdSVFxCrvT35n5H1J4U2+?=
 =?us-ascii?Q?6WC3B8lz7jvlqpUakY9qBiwB6innmIBlzzyW/ldWY5IyzApsBA8HgMxay+Jr?=
 =?us-ascii?Q?eKTl7fBjUlQ53YkS+2TYyzH09cHJ64u4yEo1Mb+ppQDKL33Wzlt0PlWNmQUZ?=
 =?us-ascii?Q?dRGjgJJ6BdZBljZpcG9hVF24hdvz2CyEvrnmEx4rvCUywwHKwQfhMLfNbybT?=
 =?us-ascii?Q?UGrFsE012r+JLu+FBbRZ0D7eqewgbYnIlaho/b1aaXv0yVTVThaYiXP5lPGb?=
 =?us-ascii?Q?xVA+x3WmxalnrZDIzwEucTDO3y1oqgAA+tpzh5Lz2H7HqWozP2DbbHThKPwC?=
 =?us-ascii?Q?M0xJhcw8niLSBcKYLjaLUI+sL3DpF4ps7st+BOEVs3o7Eb5NpSxwn3CSCp60?=
 =?us-ascii?Q?9i0f4EHxwW7ABv84k62xgkx8chOVjju1zyIBKf0fdMwV/d+nJ/Xb3m2WndYA?=
 =?us-ascii?Q?DgwOUFzGo4+FZCRXpLbZoAnllkalFRdvPTAhg1YGTOhGTO0j6ZWoAZYM3UFY?=
 =?us-ascii?Q?fsw4E0RevqPVBBKIGyu5FUqmDa8fQzbt+gz4TPTyg50c/matdALfA2/Jn4hM?=
 =?us-ascii?Q?rsagYAm/KkwEt6lv8UXkcszMmUP/CwZ7kuh5ZMECNF59FfT5os6Y5H3Bs+hs?=
 =?us-ascii?Q?b3pRauw2GuhqcPplXJdHLQKRVi7YA2/xhPQzOzZBOKTnS13wYBS2yrXMQ0Ll?=
 =?us-ascii?Q?fqX+6tVsDwueSjAGAs30CE1SFhidK+JIN3iKIfvL5loJ/aoewii6xnS2frlm?=
 =?us-ascii?Q?Uq7d2W5oh6gF0sp+8VtDdm+uZjyZDEhuuw+ewyRqvJyEcBvUenPkY4Yvh9B9?=
 =?us-ascii?Q?8BzhYk569SpB6mfxbOSF6/4LRu1UqGH/cv3rm82gEj0YJ1QICUTCpVRM293N?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b18cce-d804-4350-f9b0-08dc63e3a879
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:21:01.7057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LQkQ1WLxwRQ6ShCejc1A7Fz1JPyhtSsBWx+g4/P4vdTep/2U4C2HfcfgS9N/Cc6enZJq743stJGwwSBiimnEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
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

In this mode, selected with debugfs, the GPU will be declared
as wedged at any timeout. So, let's also introduce a command
that will surely timeout. Based on the xe_exec_threads hang.

Then we confirm the GPU is back alive after a rebind.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 69 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index ab9bf23d5..35fc905e7 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -162,10 +162,60 @@ simple_exec(int fd, struct drm_xe_engine_class_instance *eci)
 	xe_vm_destroy(fd, vm);
 }
 
+static void
+simple_hang(int fd)
+{
+	struct drm_xe_engine_class_instance *eci = &xe_engine(fd, 0)->instance;
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_exec exec_hang = {
+		.num_batch_buffer = 1,
+	};
+	uint64_t spin_offset;
+	uint32_t hang_exec_queue;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = false };
+	int err;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = xe_bb_size(fd, sizeof(*data));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+	hang_exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	spin_offset = (char *)&data[0].spin - (char *)data;
+	spin_opts.addr = addr + spin_offset;
+	xe_spin_init(&data[0].spin, &spin_opts);
+	exec_hang.exec_queue_id = hang_exec_queue;
+	exec_hang.address = spin_opts.addr;
+
+	do {
+		err =  igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec_hang);
+	} while (err && errno == ENOMEM);
+
+	xe_exec_queue_destroy(fd, hang_exec_queue);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: basic-wedged
  * Description: Force Xe device wedged after injecting a failure in GT reset
  */
+/**
+ * SUBTEST: wedged-at-any-timeout
+ * Description: Force Xe device wedged after a simple guc timeout
+ */
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -188,6 +238,25 @@ igt_main
 			simple_exec(fd, hwe);
 	}
 
+	igt_subtest_f("wedged-at-any-timeout") {
+		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
+
+		igt_debugfs_write(fd, "wedged_mode", "2");
+		simple_hang(fd);
+		/*
+		 * Any ioctl after the first timeout on wedged_mode=2 is blocked
+		 * so we cannot relly on sync objects. Let's wait a bit for
+		 * things to settle before we confirm device as wedged and
+		 * rebind.
+		 */
+		sleep(1);
+		igt_assert_neq(simple_ioctl(fd), 0);
+		fd = rebind_xe(fd);
+		igt_assert_eq(simple_ioctl(fd), 0);
+		xe_for_each_engine(fd, hwe)
+			simple_exec(fd, hwe);
+	}
+
 	igt_fixture {
 		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
 			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
-- 
2.44.0

