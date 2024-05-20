Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63CEC25B7A
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 19:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FF910E384;
	Mon, 20 May 2024 19:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POWkqm8b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469A610E384
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 19:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716231839; x=1747767839;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=XMIl8y++wZ5h9Xyk/jzp3cslyyfgEijLXeS127b6KRg=;
 b=POWkqm8bRZgu2ccyraOMFNuTKqz3BAryOwrnNe64OBTrOvHyVdMUq4gy
 33AzEQe2jA+3Dgar5OV7NmDA0AAxaLbKQgh0nH3Z8PvmpHbAVL9LcEkwz
 pvnegD1ORIGdwuxmTMnNeTrK5yPHZ6vR6M+i52EypGaZmbz/qjs3wSwjD
 09lAZOYn/GmV31pOcX2kt2GfOcW89QDU6Y+ijo5/yWEzQZRo9ntSncC3k
 jZpmYeu/zMuZ7Zt1RNFENq82vPQtNWxwndIJkXRsWuzloY78yObkgm7s8
 s5KDTt9OJwtoWRnX+d0Kd3tyh5N6fxm6gWbFs6EA3ogkqSee5eN6wwD7P g==;
X-CSE-ConnectionGUID: RaMIOnnVRBW+jfhpO6CcRw==
X-CSE-MsgGUID: hliEBXqlTNqoh3AZwXkMWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12504541"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="12504541"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 12:03:59 -0700
X-CSE-ConnectionGUID: jyOJh8BvQVaGQFeQ5Q5pxA==
X-CSE-MsgGUID: 7x9N9LqIQ9eVcm+UFwoBEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32515130"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 12:03:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:03:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 12:03:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 12:03:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYx3WIa8M9XPtuKGxY08nT4cJgR0LZZOoEQBcuT1Laz9T91h+IEgKylw2j8zPO3Ecemy03/NiVtqlZ7hgQE1zqVr59CYJ65Nznp2mMPl7kjJ1dwhD0uORpt8LXQowC4Ov5BA8IoSvcigmiAsGxGFtmzuatV5nFULqRirTNwKWBKqqnZHjrS0QaJAfkpTZC/NkiAeyY3jkWWET0r8H4Mu3fbMppdqrU4djtD6Iv4wdcjKsWa8mkE2HIKuzQv+OANcP96COUUw3zyGGoZLZqRkzeoINU8adFo12z3PDWN0rsEYZNaqV/gWNYcSJKmVm6Ui4Qt2tpj2N98mqJVYVd1RUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3mTKmtWmJlbYdKKRLqobzBq0LDGezD4BavtaFeZD+Y=;
 b=lv21HAOtMGwHS0JHo1bOnQ9FbW1uxt9Wdx8V8HporvfWWCeHsGyn1Txnyc/fH+N9Iaz61PyRYamEOgYalkKdvd6cXYL+4v8903eE3e0+ThwWiTw8h3O8NSwc7pfFoYu5A64teoBHysZcubZO2s+TIwA1eYqVq2cJDcs/0nUxgxQeq9VIzB1tKG85yEvKVk0AwUC8lwY2OKT4SFGmIHq8Lq37TBUH86uyUKe7Eyef34eEjxbZ0SpsHb8rWJ7i3v3XDPDMw+XKcP/FDHJs8tcVh4DoDE97gNPup9r8QNvfXQt8k6YIBfetq7gw3o6G3mpHamP9qVBziKDukFwVdwbUlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 19:03:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 19:03:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/6] tests/intel/xe_pm: Update runtime pm conditions
Date: Mon, 20 May 2024 15:03:42 -0400
Message-ID: <20240520190347.242249-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 0754fade-a1c2-4e05-aa57-08dc78ff95e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NLAh+1UckPy2qrNAfxXN/VDGY/vGAlRFIkkFIoq3U5QsRYWBXrfC+84nY9LB?=
 =?us-ascii?Q?P8F7VZwK8u9S7nEc3kTIAkKuZA6eCSpfrmGoSlYurkOL7OoMO0PQWcWn0JLY?=
 =?us-ascii?Q?DKXcWAtqabj4Ncsb3u6KllPNWCpmqG3VXEjl45WgfXu60f6azBR1b0fuTeA3?=
 =?us-ascii?Q?+6Irj5w6ILdG5KCo5TPnSFF1VOiwt6wa71o6NIAh/vfJFFlz+MXjhcIzrWaD?=
 =?us-ascii?Q?wUSIVXdxPByMWxoJjZmIfblPubOddLDvGEgWDsPSv2bZUmBZLevDV0YErkh3?=
 =?us-ascii?Q?FTeTdOz5oTR25Vgbp5TWKz+HS1sbW5mje8GDvezQTtCvRr+35ajRT6j63GjL?=
 =?us-ascii?Q?GQbgJPYBRxsniwjUkGeivd7RL/KlFM3NCZ/JvChMtWERtsvCR2TelUpdiJSg?=
 =?us-ascii?Q?GWZe4JZAITOJZCfnx6KmGY2R3+JHESeaTsyazy5TKl3vGqjVpc28d51TrbcX?=
 =?us-ascii?Q?XjEGwe6KuRjd6Og1NHgwSGPZ4zqW6rScBtUhDXXJDT6C7YbYXLgBjEmPyDW4?=
 =?us-ascii?Q?4zp8Nu+5aaH2pO/puJh9kIuyabNrh2cOXZ28+AXNkFRGRptekKm/p8Yvd/hZ?=
 =?us-ascii?Q?K7WE4HD49p3YOiqGQXCyT+zOyyz1a/Mwh3vPkTiTIdV1787VFYnSzK2kwd8v?=
 =?us-ascii?Q?sCpbAKmsv3YMSE2FFYUCkyOInGm/i/Z+MjZVHVMROEpQG2KbRLHaJOfpLDsM?=
 =?us-ascii?Q?zcv3gX91SsDLbc3bG9Rtvb2/dDwweQW71zuRxqOo5iIg+ZftCBw1zQk/pSip?=
 =?us-ascii?Q?xsJbn82Iz6bFtANksz0vdR3PVOR8s9ON0TTLR+1ftO3491Jef6orie30w4n2?=
 =?us-ascii?Q?+/HfqcshsNTNAIafzojxjtuUhsEq4NRur/kN95Z+wafJR2at/i98eHIpp1rN?=
 =?us-ascii?Q?j+O5n0SBWFUAKfFL7zwxZwW8rQj7oC5xePIP/+Ej4M20vCdrQgO7Lm5m7uOV?=
 =?us-ascii?Q?fZin1ZjCTaG0EHjRUPNoRvWBjkfUnGPWGa0dmF8P0n9obo6EDYzSLZOhtua5?=
 =?us-ascii?Q?aU9a3N3HRYVm4INJolyCyyLvJlWFQ8I7ZQTknaayuyJVrVPexN1hIVeb3XcU?=
 =?us-ascii?Q?zpS+dX2VpWfx1vjifa8kwCIPS45isGwOv7LZzY0NVn33pJ6qxCPuNAxqMS7/?=
 =?us-ascii?Q?jyeiOKad8b7NcOTPF1W+FqmAuQe1+D2u7YU75oFFR6F0gNBZvna02WJE5LU0?=
 =?us-ascii?Q?x81lY+J/Hr81+oVasW3MfWl2Ho6xFtXxNbBmlUZ3O6aqEw3lN/bWDfknaK3F?=
 =?us-ascii?Q?rAgPt6xYuxeNJibrGafnUi1x0luV6FyLiqgzoc07aA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lRcq2saxxsucgdsAPRhv281SRvao/5rvtCbdJIATjk2Z4x8rhi4QVbM6ajjb?=
 =?us-ascii?Q?XM7eFRvACCLkkPNJXD5vMJWRouOZzNhy80I0P5m3gel7V/FYj6AHAQfOIb9N?=
 =?us-ascii?Q?4FyE4Yz7lY+1BXBvExWuvy5Vro086hbUMc+zJpQtd+tXvteuAIfapAOpDHNV?=
 =?us-ascii?Q?aqXzjuWIik+NRrPPjSTQSjOP3hWPAxlgcFFLmpilnxRAwcdQRqRX61Gsatku?=
 =?us-ascii?Q?5XaDJfAsbwCPPUfXPoZvLNPanyhqyN9hdirL/HRyeA5mhGVJU+e+uMrU1iGF?=
 =?us-ascii?Q?ryl9gqN1E8Xx87rNjmM+nA9grmKPbjkCVIRPg0yniigt0/5J7nrdq7r9KcQx?=
 =?us-ascii?Q?jTcnj93P0MtUBNhR35nyJOv0LuCZTF1F94Csqa0kH+28k2Vl9V+exNIH4vGk?=
 =?us-ascii?Q?BwhSsjEVCabOeU/fkMVDi9hdZm+q8DpFtY+KDuvKj27l4ma1OwgnLVxcsBEd?=
 =?us-ascii?Q?zjvNF6lOS4N+7swqVI0DQRi3JRXVhbqejNzLePjw2zPS/IO0AL54RgXFPAqD?=
 =?us-ascii?Q?vaTPyp4GZlbh008M4PCjlss4TPNhjIGa+nEaMvxH/sm+i5itXi3R29zNA7qP?=
 =?us-ascii?Q?rYIgaNduah9hjL0Qre9yrU6eyCgjlUt+NuxzIOsXypMHE+3lTZ7pXXzx2Lky?=
 =?us-ascii?Q?SvoxActbQnJPcDq5S6sv0u+njfDsHmjOj+ddRQQnS748/qWAeVNG5ncvqcd1?=
 =?us-ascii?Q?Jd18DYfq5Fso4EoNtVkWGGbiP70aus1LFGAQQ/x6tlGoHL1gpmoswSICj/W/?=
 =?us-ascii?Q?DmeObHnLaHPBvse4wsVUOox+ohGHMFQdjQUM5nzijxuYzqS6cAc72CiV2qPg?=
 =?us-ascii?Q?Z67ail29LyI0lZqLeL+0MnOOuK/js8rZfFvxK+75fZT6RO1d1fFHL3U1TYTX?=
 =?us-ascii?Q?RRK8M2S2V1mEr5hTr00tqc6uyy1Gdqz7/if6Pm2ULW3AKB33dfe1BQKdHTHc?=
 =?us-ascii?Q?To381YpJIYFefA4zFYZl2yQeKvj667H17aa5S7UhW3EA8nrXOneuBlWDr0Cz?=
 =?us-ascii?Q?mdFkQe4gX0nhA33z+K/ULgtsXIL9ISh9EgHDvv5ckUvCjqX0/Ejlx+AOHcVp?=
 =?us-ascii?Q?MknlrYdIoTsEb9gzuqzbh9W8QNxpUu5xyMVWRmk29GsBbw9FI96Ecvly/BIT?=
 =?us-ascii?Q?ig9Bsus5QvN17F2SUL6H4BT4Z7Qy5mAlLmRtmOTV17WTtrsIZzpxdDdzcTFY?=
 =?us-ascii?Q?CQi5SQbBii7D7/WsN78aBQ7Hf2eNm0G5B/ujlYMYcI2eDjNPULM0otTeG+rP?=
 =?us-ascii?Q?FNvY9KzVMn4B0gQbXcOXP1uG7XBtaInyT6MrQtAcaWeEUeSHRzssCrw/qNx1?=
 =?us-ascii?Q?RAkzZr1ik3W9/rlCoNZWuvf97txpx8/4VMXutm7zkn0AjeHqbi8obnjJvTXS?=
 =?us-ascii?Q?4QAAcvnjsY0dTui8Eie3HaV3W7JYtr8GgS3v3S+x71u1nQvaA4lBdO6Mge01?=
 =?us-ascii?Q?7cVb90/BeNzUcWB2FMITmsb0APpEIhykP4aoeBJ8aNPcwZPn4KaeENkwb28I?=
 =?us-ascii?Q?fYYW9yqu7W0rZiILpSOItUPGxCMPLJF1Duy0YApxWtzNoEMLFIvMrPwLcPL3?=
 =?us-ascii?Q?50E1QVqcDFWZypfoestTFD7uIQAfOnDsN7XBBL5U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0754fade-a1c2-4e05-aa57-08dc78ff95e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:03:50.8647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+DwsuGAh61awDpL2ZvFoBWpV6I5+aaRARPopnxjs6dQfNxzFHBqcOQT6oYv7sQ+QXZCzC8I6DfUGVjvx+u+dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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

Xe is no longer holding a runtime pm reference for the life
of a VM or exec_queue.

Also, IGT changes autosuspend time to a minimal time, so we
cannot guarantee that rpm is still suspended after the execution
has finished.

So, the reference usage is not a reliable reference.

Hence, start using runtime_active_time as the indicator
that runtime_pm resumed upon our actions.

v2: Usage of runtime_active_pm and inclusion of mmap tests.
v3: Add doc for the exported lib function (Kamil)
v4: Use uint64_t for active_time, which is a big number in
    miliseconds. (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com> #v1
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c        | 25 +++++++++++++++
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
 3 files changed, 55 insertions(+), 48 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index fe7692960..9904f976c 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1412,6 +1412,31 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 	return -1;
 }
 
+/**
+ * igt_pm_get_runtime_active_time:
+ * @pci_dev: PCI device struct
+ *
+ * Return: The total time that the device has been active.
+ */
+uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
+{
+	char time_str[64];
+	int time_fd;
+	uint64_t time;
+
+	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
+	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
+		igt_assert(sscanf(time_str, "%ld", &time) > 0);
+
+		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %ld\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
+
+		return time;
+	}
+
+	return -1;
+}
+
 /**
  * igt_pm_get_runtime_usage:
  * @pci_dev: pci device
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 91ee05cd1..15e301533 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
 bool i915_is_slpc_enabled(int drm_fd);
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
+uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index b4a8c4d15..d301ad031 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -185,34 +185,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
-static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
-{
-	uint16_t val;
-
-	/* Runtime resume needs to be immediate action without any wait */
-	if (runtime_usage_available(device.pci_xe) &&
-	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
-		return false;
-
-	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
-		return false;
-
-	switch (state) {
-	case IGT_ACPI_D3Hot:
-		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
-						      &val, 0xd4), 0);
-		return (val & 0x3) == 0;
-	case IGT_ACPI_D3Cold:
-		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
-			IGT_ACPI_D0;
-	default:
-		igt_info("Invalid D3 State\n");
-		igt_assert(0);
-	}
-
-	return true;
-}
-
 static void close_fw_handle(int sig)
 {
 	if (fw_handle < 0)
@@ -323,27 +295,28 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	int i, b, rpm_usage;
+	int i, b;
+	uint64_t active_time;
 	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
 			  d_state == IGT_ACPI_D3Cold);
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	igt_assert(n_execs > 0);
 
-	if (check_rpm)
+	if (check_rpm) {
 		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	vm = xe_vm_create(device.fd_xe, 0, 0);
 
 	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(device.fd_xe, bo_size);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	if (flags & USERPTR) {
 		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
 		memset(data, 0, bo_size);
@@ -381,8 +354,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
+	if (check_rpm) {
+		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
@@ -426,9 +401,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 				NULL));
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (n_vmas > 1)
 		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
@@ -456,15 +428,13 @@ NULL));
 		free(data);
 	}
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
-	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
-
 	xe_vm_destroy(device.fd_xe, vm);
 
-	if (check_rpm)
+	if (check_rpm) {
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 		igt_assert(in_d3(device, d_state));
+	}
 }
 
 /**
@@ -558,10 +528,14 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
 	uint32_t bo;
+	uint64_t active_time;
 	int i;
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
 
 	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
@@ -572,7 +546,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
 
 	igt_assert(fw_handle >= 0);
-	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+		   active_time);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_1;
@@ -582,22 +557,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 
 	/* Runtime suspend and validate the pattern and changed the pattern */
 	close(fw_handle);
+	sleep(1);
+
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		igt_assert(map[i] == MAGIC_1);
 
 	/* dgfx page-fault on mmaping should wake the gpu */
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_2;
 
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
-- 
2.44.0

