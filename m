Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DB0C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 22:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA8C10FC6A;
	Tue, 23 Apr 2024 22:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GS6fuw9k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434CB10FC6A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 22:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910953; x=1745446953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SU1vttmvVzbS3i8EaBv33A0mWYWLAOsmT1Z/rH6JXk8=;
 b=GS6fuw9km8mdMRofMNCsnezx70lW1qblgOcdrn/puNbf8gdzYYuLcVX8
 471BSa5lxPsTREGi35sgxhTBE0Cwl9D8nTVapCJHIJsSHlxOnrRRS4XBD
 JD0CSjbfB2wBxCwjmySAFzYVeuZj+DEzPCTz4FSM1bOm0EaZjyLf6PcAI
 F1+iY84Ku5EJzr3eQJADWcLTaK4NqiPxiIHgS0XZWxQSMrmUB6/WotkLa
 Fmf+LUL99X7oUc1umW5JmXO9A/Hp7ZgiGBXk70GLGKym+WM0uYSq/EMmV
 ypxDJLKkkdLX3xrJMiEISWrCQdBABtW15aYPDWKRT8GeY+bYDfOsQOdz5 w==;
X-CSE-ConnectionGUID: MPwJh3NbSoa7MtzuScO4FQ==
X-CSE-MsgGUID: BxOK5RasTJqDGmbNuifYrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9685273"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9685273"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:22:32 -0700
X-CSE-ConnectionGUID: 35xJgVYwQrmzasPOtmjumQ==
X-CSE-MsgGUID: tJV+sPXYQlmt2po608d9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28993277"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:22:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:22:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:22:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:22:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:22:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PruvEGdw8scJseKd8MWpjX9XaLcIFQ6uwC0+KGOh3rfNUxsNAbdQuRySqyMlIg/m8zJJMAsQi+aS8nbXY+F96Cgd2ZTijRa8+t9s/7em8LeQ20UtCuvff6hWY+fRmTK6KFahnvHKgFC6uX6JjAS27ODgvWegeHuC3DX73uEdKGbIqAEkx7MAu/uefCUXy7QCJ91KgEJX2SalebkP1G0vbk83n8mslUFIbn85+SRdqRRRIamT/+1KhelsiE3kdY/V88paJ2xBAzT/waHi2o8IKGYc+xg5ykj0LrIfsyuzcjdBFBXk3B0Unb6zGSGMj+kaGeeifayMHHbxjzQcDDjfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPSc82N4lrL9IetBW7ToHlX2f93uuMnN8w05GTox5Jk=;
 b=Hx+F3G+Prr3qHeVSvYqeNP4fOqxSiK2MoK4WQn2kJopM3n3yL/cjxo62e1gfNs4TLBbpx1W4SMiCXUBbjNfC45lLLxKGwjO+CtvxCO6/zuUdgpl5bRrFG1Jci/7itZbHwsHt4AVQS5RbORGcrx3CtdEWmd8BJ2CXFIayoFHleMciVNExWZZbR126gidTqVA8DLVZeZLxTNxzVGnKewR58pImeEsHrDroaHPC0rGijrtSvKeOZRDYstyenHugzHZ0MT8cqWjq6MMicfMd431lKeH4ouasyGR+efHcqpv679blVP9SyeQJKMIgn9Jyc9mMtjJQJ9Z39vWUWg/iEuIf8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 22:22:29 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 22:22:29 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/xe_wedged: Introduce test for
 wedged_mode=2
Date: Tue, 23 Apr 2024 18:22:18 -0400
Message-ID: <20240423222220.1285742-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423222220.1285742-1-rodrigo.vivi@intel.com>
References: <20240423222220.1285742-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:217::16) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: bc583b9f-9004-4929-3b6e-08dc63e3dca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OPxZQbJYRAJxpA4mjn0d4hfMlDQNAPT0i0rWkHthKY4MMtne3VGeHtRroHXH?=
 =?us-ascii?Q?PsJCAnKI+O1BhIp1M3N6qA9RJmIdmFZjbx42dcN48CUArGp+VOpXtZ/ZAX6R?=
 =?us-ascii?Q?nFSRCROXr91mubFKvsp/+ot8BGoIOfmdw/i8UNS/FxfCx5qGMWm5KGG2tdIe?=
 =?us-ascii?Q?cnVIHnIhXo6MAIYSx+Dbyikojm1YtrwZtUzjBmZXil5hGyJ8OFAHLjEZTdIU?=
 =?us-ascii?Q?i7ccARMxu9tg/B2MefMqOk+nx0Bpd/obe6/kKKKBjmOw3PsY/EXAOljMxN0l?=
 =?us-ascii?Q?KkAad57y2ANfMqT98C8/CdEbJ37SmXljg489UyNSFhvBKeMYcz+rAo4vBhv/?=
 =?us-ascii?Q?ZY3a3V9qrRpE1Gu8OIKvkvLRXoLsdDLlIpk2IpoBs0H+rvBGTj9O75KTTNY7?=
 =?us-ascii?Q?H0nrB9p4oIf4clHh9udMc30WGpBIHk230ajIfQc8SpC3H2OlmcvHsZmWWXUQ?=
 =?us-ascii?Q?CLfiw1PB+UCxqPlzfOyxy+0rxcvZrgDS3evtbmRV4QKUCG4nMd9fMkaQmk0m?=
 =?us-ascii?Q?n0M20CCpRePZ1l6gS2wdqnQzYvNqId0lVhZT0ZVf3V0zPfvpkdJbbSRmuZra?=
 =?us-ascii?Q?oUzSqdTEbnNu8ZMRJv3w+rht4iw+GwtTbKDvOpY3M1rgbH+QVceb0yrxf1tH?=
 =?us-ascii?Q?LLXykAshwP/Fi6Pkpp7E6AYZNoKD6sPBNbs0e+qzcYOM/scZ7t9egp2l0BBJ?=
 =?us-ascii?Q?SWU8CEAHN2RVnIscbxYM2yDYTykW9TQyugULad66b9G1XjEdAXgsnSs9YEBA?=
 =?us-ascii?Q?dYZXiaPJ1/KsLm9HjPnxh22EM/95ll2Wy+zzNOy23uydDqu90OrNizeJ0B1h?=
 =?us-ascii?Q?sq2+6cEvRHHe5YQb2zXwjMvJV2DWccivoX2+R+z1f6yJk8Gh6OmiV9sxTiKl?=
 =?us-ascii?Q?cO4at7H64ztyn4fBqF8YMQ/sh5xw3zWWUqNvUNeJJRoRgibJVKMDf+vcvH7h?=
 =?us-ascii?Q?LcP2Ef2bFWJVFOLQouWg+g+wWAD2BJr/nrGZVOtq7hZvp42G6UBfnPI7oKSc?=
 =?us-ascii?Q?ncsa1uk28n3ZBIPxc/xRi2IYEUYXVerTZExyMKUg64CECRKg/2Ax/t+ZHYwS?=
 =?us-ascii?Q?DOvmlmh6nwPT4d7D2V+tg3dUG2g2gqY8xcl1qNSjhBwFnKBCWSVTXQiKxhh4?=
 =?us-ascii?Q?jDVCDGNp4kanP/IozvEXwcHlHE59miBQdmih+SA/6oQhFk4MXD4zDexDkEai?=
 =?us-ascii?Q?0WWAr47o4qBVy5LqloqW9AVq0KdFH23eEo5epYGJ+XhESV/Jkn6i4CQF1CjZ?=
 =?us-ascii?Q?C+rJxxTDt9wCgNCDSae1upU1HvSkuwUKaK/SOluD/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?//Lmv5xpfYngUZp0ChdmOXNWs7yAc47Tsj0RwunxEWDkk2F2nwgx8paDTwdD?=
 =?us-ascii?Q?fxFyj168eNH+bMktPZzFe+ZJnd1tGGTWeIFovUDucyKAxnn0AaoSYS+293ZN?=
 =?us-ascii?Q?n0HpqZBNYBYR1LyxfQjtHQE08/78Iqh6Z4GUdTJhjra5noyWgQgeV7HiCHcM?=
 =?us-ascii?Q?LlAb/IlNV71Ukl+5Do1Llyw/L7Tj7wl/+y3UGgfIr/X4rtheaUthUuEAGFz3?=
 =?us-ascii?Q?4ggdaONT0tYzqJfQNu/5uiV2ZvOv40kEaTjMIcy7F/OBmAmEeMZK6CwPhCln?=
 =?us-ascii?Q?kU8WtyJcBM1epEpDbq5pN5JNubRFw3fraKLyOhzDBpzVqO7ARiuLThkYjL3l?=
 =?us-ascii?Q?yHHtvFR4nrSRp/e/60YRxDeYgEgTr7Nl8nfGCIiwjz0r7d+Y6+LgAjsEGOTA?=
 =?us-ascii?Q?mGKKmzyM9M3QbbGWWHSQWMvCuWndZVyxo46vwTADlVGBPHdvTD9ggjKO30Dn?=
 =?us-ascii?Q?YMSnTUReCVxgZLjVLVWom6Et3Axa+A2LMmTtpeiPjM2T17hRTkvpQVCVYIzx?=
 =?us-ascii?Q?pHxgcy2UNSjw7jYenkhafciNCYDygPphucjszc72GFTgI6+j/xC8KH7Q7o6z?=
 =?us-ascii?Q?BOywB0jb5768JWzHn1NG5OH83/ltFkaHrK0gWiQRlS1eepdv+ugAQfjEFZ2l?=
 =?us-ascii?Q?gDLIRKyQqzvW8Juy68TC7WGdFIjA4M0+Q2bAcq8vSiXjlZjcOhVvimdBAjRO?=
 =?us-ascii?Q?gbHK6YYPe/0CneU2NWyoZqfKkSCzQLG7fHF58fljkyxHiKCwhLt/jn1FBBcO?=
 =?us-ascii?Q?KxrQ0VslxKUH2/MYwEleFzi2VUfT9E2xROy91jZ2XWlaSGTjFFyoJRdyQLij?=
 =?us-ascii?Q?n6QH0cS46x60HVqfNvRzc6I7H22Q0TXiEWVNT8YZgFinim3LZyYtH0dh7v0W?=
 =?us-ascii?Q?ONRC2tNL/DAZkv+zM1p5XAa/W0188MtiVDqM89tx1SOnEuHPJ6Qz0XImesNq?=
 =?us-ascii?Q?WjJ730kd/1AEZr/GiDxeDCw5CpR2ffnKbs3qGmEDKhDpwf3trDVVoxpQwtAQ?=
 =?us-ascii?Q?2QtPMt0WmVEMFsXpdw5lhiQuLuDGGnQI4570QwRGIz1hEFTor5flB3wB11Lc?=
 =?us-ascii?Q?mmJj3HO4TWlKAT8PtGkQEyMtY1gCZD/YmqmpRBWP7iJJs69NjZBk6/WYfg5/?=
 =?us-ascii?Q?v3sMhEJO55xZCEoIFW7RPdjDHh1ukIG+4rC7nSuU18k8Hl4+lrdmkbD62AE2?=
 =?us-ascii?Q?ukilfvWK8bgmQY2MlPEp95hgHIfBFg2G8IjBT07tR3WyX6aXsv2KjiQTMN+z?=
 =?us-ascii?Q?dhneMMHPpTYW/u6B+ci8Zg695rJX6bNJGvM4iMEs9VQWBbBbA8RnM8EFC9Nq?=
 =?us-ascii?Q?YOBeiOQNkl6dgA+sjBFagdr8MA2uaRfZEUw64v6H0QvF+eLDaTuqUARzhzDO?=
 =?us-ascii?Q?aKzRKRUihHC06wCCgRBcPBgilTzy+F2rO6/3EPXUM0Lb7ZCmX5hNbxEbUzco?=
 =?us-ascii?Q?RBsPHOhnUD7uNr+z/+NLNYpa/kYJGKZekLGBxY4IGZFSDZ/RVOHMFQIckc3i?=
 =?us-ascii?Q?WDkrCayMCWfi1kj7iaPDZAn/YkNPb6AhWWOARWdA9RSrPRZJiJZWjnxtEIT7?=
 =?us-ascii?Q?knCMOYj68IpcUb4rYDn1WuIUbIDmcCgansiaGcDy7RcwzZj4q8Nt7aWHNbP8?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc583b9f-9004-4929-3b6e-08dc63e3dca8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:22:29.3034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePph4EGYcjesVertT7hPPJJ9j1u8sl569igclsJfS6+dJSJiyAijSj51XE9qiA6yXAFCa0STj5lTupBIHlk+qQ==
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

