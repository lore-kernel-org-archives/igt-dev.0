Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F74C41513
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 15:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32F110ED3D;
	Tue, 21 May 2024 15:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrPLnSY6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4947510ED44
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 15:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716304619; x=1747840619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=V2Im0lnc65t0cdOxV4U7zq4tBC6eztfEAE6LmtLyWw0=;
 b=WrPLnSY6ewiXB4GrpBhE4JaNpxFHY4O0Xae5jCz+fwFLITPwdr8h90+F
 wzwXW+AnbCrT4ePuVURLhyx3SWkGUXhaKwXteRPKfEaAGmUPjqDCp/ilS
 fMhxi6szkuh/B3C2CvStHo2xM35dAHjcmk64LDw2yirsb6k+AwKNvaPPs
 LaltiZ5VxdkMJcP1IpJnSpApKB/KBu27wabDRoRlXBz9B3Yt+ukgO3yfZ
 w/Y4crH5T7PcHZzOyctrMt2SYsyrpLCv8NjMw6iavj6QLkmkaUobMg0dq
 tQNeEWVqpH+yJldYY+YrxsfXhWRcxlE7023pHo1DG1T+eWgj5uvrNA+8/ w==;
X-CSE-ConnectionGUID: Pobe7GJISX+f8XmJP0ygQg==
X-CSE-MsgGUID: VGzogR3cSdyZXNGQCIxKSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23922277"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23922277"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:16:58 -0700
X-CSE-ConnectionGUID: GUX9guGmT7KUNdt+2ktPyg==
X-CSE-MsgGUID: ZX6/0Z/VScCBMvu/f0Wnrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33114356"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:16:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:16:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:16:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:16:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:16:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mf5di7fVLEqlKnbPR04Jjvvy/soh4TCkmhG6ArHaEmPz4PQrrLLxjXP2um+IjtSnIC4JkvfL5j862A8wN8RAP2gSV5iqV78+mXjpp9ewL1+e9HP2+xyCuxzhwZOu5ZAMvGqXuZG98ctLSaYafCcob4Vy5mSt76UxDVAANcpTnOl6haWOQGuU4xvlvzMzXYW81t9vz7xd6wqVP4Vw4+CePbi3JFGlLsi+9qNa2jj9swuKLRpd1oMwLMImsUk45aAzXAx/liSH4Ge7n9Tim2GmLR8Ba1Y/eKH5E9zACLMlQmoEVWLHWkW9PnULTv/xJosvkmWSOC8rjMNXjzNuH7WtQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUsiTf3v7cVrFwcVm5SsGgPcObOP42l52V1cx6On+vg=;
 b=WG9Oio5YuyNhKgwgeqnWIv1sCDCB4H0v8yJZionXt9DH5M9fWBaRGEsn6J5wcmlGfwc768ZhxcE0lgIatAPAN3/P9LgkHEw2Pai9aQAXl60ULdWBlPgloqbLeuvqDTekbqLFwnGr+WG1ECuHjowbZSAXMO48KpOhUewou72K39x6NHNq8VNehMGQPmE1BSl9yCKGokE5h0zq+1Bw5yPzQQJ/zoZPvoyU/HR3ftO8BdLbbiF6RvvazFLzoCq2bd1spAq70/ck11UHTqoZSieWE8Y0921DZEAqEud0Ne2WXxIo4iy8JthCGyRZjIMmBQ4yY09XM3+cgpHR70OoEl4bKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 15:16:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 15:16:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/xe_pm: Only check the rpm resume after
 the first mmap operation
Date: Tue, 21 May 2024 11:16:38 -0400
Message-ID: <20240521151640.280354-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521151640.280354-1-rodrigo.vivi@intel.com>
References: <20240521151640.280354-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0234.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ae3b60-d1cc-46ce-fd34-08dc79a90c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BWSDPLHn35S4n8eVY+LOX6ZTg7L9FQcPAi7mfXfCfQNXlqnW1TnDXcW/Uhpk?=
 =?us-ascii?Q?prNNQqkkuCbm9/A/yJ8gZNE2BWpw9dXWBsFh9fqT8W6PG613RyJh7zPnguvH?=
 =?us-ascii?Q?NMtObff0x/UZAkCM8IEspG6VD6X0vYtNq6IgikJCmzldaPZIzSitPi6/VgyT?=
 =?us-ascii?Q?oxNIVCWh4m2VsPRu2KAMoKL01Yb5o6DKU0uOvtcvPN5NaFDoSvwpPH1sAlUR?=
 =?us-ascii?Q?uGBxBQbJjYmeYy9lLgSMQZJf3z+8RkjBmttBwFP2WZF0SSoNN9Jjf3PXLXKg?=
 =?us-ascii?Q?TllZAjgbo3oRP6dU2vvCfQFcOf7OAlMaixuoReIvSok4tHNgfHjo3gujyR0P?=
 =?us-ascii?Q?CSliHKVFAhZCZPyvA2gmU7GIyk+FYT7TRSH8EYrwcNUdiknBTssIEUa2QtRb?=
 =?us-ascii?Q?cOx6X2F7CVH0AG7pDQa5ff5vEVepFx3ynBQzZk0Rd1+8FugBwl2D2ncz28xe?=
 =?us-ascii?Q?tUbesT7Y0fmKLy3dHmXkTDIYPIQKHbUOv+Iti7xqg/wvVwFck0ctiIgdY7DJ?=
 =?us-ascii?Q?OWXWcms4rw/dQIixvuLcH4aiA798HO1k9yT+5zhyHv+Xu8J2OuOE1tqmX/Lc?=
 =?us-ascii?Q?l6p2wfh9ea+MYi91HyY9ujrTPfQ8zwEeOepcokjirg/kgYEoOP4jz2yCqUHE?=
 =?us-ascii?Q?4QsqaIYeoeRyWcgI0n2xaUntPwgfVfa1RYMV0eR64gQaO7Gw2AMBTw+SlpHI?=
 =?us-ascii?Q?jkTUnoFBu4CqBPSY6TJDsnmcoetW2qmCMtivg5GNk31oE/iERldwuUoFh1CT?=
 =?us-ascii?Q?QID0DQOmMmbEeeV43k+UTX9xRx1Obm6uN6gxfDyF3hyJfIrt2TMaSq7AGKKb?=
 =?us-ascii?Q?s0zoNmqM0NXchgVcZ0lCnbtR6ZujJkq3/EaIIyvWyZ49ZLGjzWsk3bdS8ZA5?=
 =?us-ascii?Q?LM3+mXqDVnzUIgyaZJ/vqvpTb7F6OHsQ91da9zEd+t/KyEAfx6VJ0lTPBEwz?=
 =?us-ascii?Q?DqI7EoZJ1h2tpowg6gA5UGq74aMjTM/STALvGT26q1xJmfIHpyWi7Z8PnxXL?=
 =?us-ascii?Q?lsU4e6SOyju8UW2sQkWs9OJU++mcktbDC8fR7bCpxPqn0HokbwtRZkA4PLaL?=
 =?us-ascii?Q?uwCNAsB/yDLCcaQnBqJnMEJiBoA38AhlKclyi7cq+K1X7afov9PoPSEm4Fw1?=
 =?us-ascii?Q?NAwB7ny1aexJWS7dmtF+wQTVeCJkyuuLWgJOrcyNTb/6yPauizIObLbJRWRD?=
 =?us-ascii?Q?TMiii2l1nyVHfFX1mV0YlD4s6hX1qpJkX0tce7rECti2zKCCFiiV/KeG1psC?=
 =?us-ascii?Q?JHlfEDsWyxOmufQmHLM2KgRm8S43ckc/3LVgYBUBNA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vDrXbMICxr8RL+qIR/FdHhk/I8AsQjNhFIeFNh1vVJuq7o6jJhT8O2nMmSjN?=
 =?us-ascii?Q?fHZGwxb7E4a6ftu2GiX4tsxp/tGpRKOQIvv04Y9QUKGcn94bNxIbl+cC26ql?=
 =?us-ascii?Q?SkJCiXsfZLlQ/ri7m2odzywPMgjU6gvb36d+tnG37OU5rSpk1CmoErBNBcNe?=
 =?us-ascii?Q?21L6MaInILi/jiLAyZjY6WG031hIj6MAKHC+edEKxqpwtx1CTxjXR7LPZPAu?=
 =?us-ascii?Q?biOlMtRrSFMxM/CV1iSx8NAqP9qlwhyQfA+PXlTQRWXipb+kVljNCef0de0m?=
 =?us-ascii?Q?HF21Xh38nHxS+vtCH5SxM89CY6VBhbFYRInkimL4QTbjcUM4yIjvd1dlzCZO?=
 =?us-ascii?Q?gCiTNmVwGI+FHsqbz+LPL0/stKGw1PJsea+l7cv4HV8UNWnj0wwboalmeWzn?=
 =?us-ascii?Q?jb+QsQItXW14iXI1Rtmxfi7kAwgxzURYelrkWwI2tzBZu64P8ciJlmc0M6Sk?=
 =?us-ascii?Q?4gD2zMRVDmfnqJ3WZMqgL7s13/PzK+X0vM/MrSu0NMnAPz5/ZIZaCeN3zQEt?=
 =?us-ascii?Q?ZeacZi6yLuht5lrh2UEkWNQIUgtKIX1C0sZ2HGLPmH7lo5EbqgkAmGZdSwVA?=
 =?us-ascii?Q?db8uNycPP9IUz9eviz5SnsehKq1nrrwy9gNp74AAUlSBfiFGgHMqTgxEpOCr?=
 =?us-ascii?Q?OsQwPmUOcKYiRV3TSaOQj/5SzrnxBR3dzp4Y54raqM3De5pGspyuv1EjnN49?=
 =?us-ascii?Q?52VwnDyboNw2jfn7u4PBgMM3bpS9x1pN5EtASmrIXiafpUkKOTO6PFrRM+BD?=
 =?us-ascii?Q?Ghhy4/cy0pYfovjat/r0OZMbTtCLnV1nZDREm/Fctl6Ws7maVcRb0AFjNFsX?=
 =?us-ascii?Q?5KeNkuv0GQjcxKNsOnJuBL3TB30f8AIqTO6ECAMeYl2z7465NrxWZ+jxIGyM?=
 =?us-ascii?Q?aRLRI+f3sOWG7irP9g7ji7rT+NUq3F4Pv9txogmMUIPmx7P8QvO1BEZiHPLF?=
 =?us-ascii?Q?C7mey7KmitvmJSLguTxCMvbqnBEO8WK8OAIpWeEjH2ZRDWNxrVxeLWLXbjfX?=
 =?us-ascii?Q?xKtyPLh4arLLFDiVfM/tvvXDL4kTHF8ZsjDTQzGN4KgW7/QuwUD6S34gKMNi?=
 =?us-ascii?Q?mXfdpzzfQ9FRa7QfMgiC4/puj/bq6TdYEZspdD/PpPQ+aX6Cri8iu1IkR+Lc?=
 =?us-ascii?Q?xltyyVLlYpvkO1dqR7XwgxlitUA58Zuxv9zs5hrHn8QGkX/vMRXvJscGEo7v?=
 =?us-ascii?Q?tEXON8VRoHhgVrpwgJfLnUs/lL8aQRAvevau+QqvtAAvKah0l8/1wncJ98p3?=
 =?us-ascii?Q?qPCFf4d7nsIjPDf7fV1tmUnRDKhSuxA/NVnDCJTkH9UNSgtJAtYiB27Jmdyv?=
 =?us-ascii?Q?h8jZ69sfEhVt7LpCPr27lj4X06r5fqOXLqPK39xu1WA+69CP/EL+3baEQSkL?=
 =?us-ascii?Q?TreXtLq6jVop237Ae/2yOwKQIW9mUsNpIO9bFf1tcWzezPVJXoxgtPBiepQe?=
 =?us-ascii?Q?meMRHcO7uh3UKBLdIvFevh3OGhLxcqdHafMymwnPRSBDO53SpHFAokBdTuj9?=
 =?us-ascii?Q?evmXwrQStWkaf3YxBmRrpftrM34bKsBcsGFhHheXwnC3i3kI/M5wGuUFjlbM?=
 =?us-ascii?Q?uFUlUPYPxW1CBvFdp9otMfK3a57WJYGAGgUY2AkMhIZtvrOMtJ8Ilp19h9Sx?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ae3b60-d1cc-46ce-fd34-08dc79a90c66
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 15:16:54.7100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yabwPD7ODKyQx3qOR8aSaEMp6+oTb9aVvXbJ7y2MqyxOO1pb2sKyX9djOUOc5iDjSXZcfmoGoqlPptrSuDqgRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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
can be migrated to the system memory.

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
are actually validated.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 68e3dd1ec..683f25969 100644
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
@@ -523,7 +528,8 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
  *
  * Functionality: pm-d3
  */
-static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
+static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
+		      enum mem_op first_op)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -562,8 +568,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
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
@@ -573,12 +583,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
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
 
@@ -794,7 +804,8 @@ igt_main
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0);
+			test_mmap(device, system_memory(device.fd_xe), 0, READ);
+			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
@@ -813,7 +824,10 @@ igt_main
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

