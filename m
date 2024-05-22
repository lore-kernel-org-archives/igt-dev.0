Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA0BC25B7A
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 14:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351CC10EEDC;
	Wed, 22 May 2024 14:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOCfEcfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6301410EA28
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 14:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716388426; x=1747924426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=V2Im0lnc65t0cdOxV4U7zq4tBC6eztfEAE6LmtLyWw0=;
 b=HOCfEcfltPBf8Nwu9BVvTuaJrmPHrR1NEJXPrBQ8wq4cFt/7iLLwSsni
 MpHJAn8rnjo/Jp5wI/EXmA98tNOmme/RewQktp1z2mKkSRg0GC0VZnQEy
 JC3IUsYQLyXIMJU9XBY09m8JWKsi0eNF8B0GZQcN4+aJfPZe2tfmH6O4u
 BnLzizuaQHIRQ5M0gjr8sREFiyBcVDqb6O7CwpkCrdF7ixeqLNW4yXoic
 uDCJqfRSXERdWnLZjG0P0yMn/xrL46AcjvtMMyv6lhUKWyEKlpTeTRxV3
 o4Uy28d/4h6MuuglrD+odIk5mxO9fxCQ1iulQbwfiS2g8UlGKUvBcIlU7 Q==;
X-CSE-ConnectionGUID: f6wI5d1fThCVMsyXxhBbJA==
X-CSE-MsgGUID: zbS+Rsc9RxStlMwVT0mIZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12496074"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12496074"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 07:33:46 -0700
X-CSE-ConnectionGUID: W7LS6BjvReOLFoxdJ84HjQ==
X-CSE-MsgGUID: G9qEeYjDR7OznW424KXNIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33298808"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 07:33:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 07:33:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 07:33:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 07:33:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 07:33:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHo1JrSNUECz7m3l44W6y5xEemrs4fOs7wROXnf/s3jQ3MENSl0jxJ/65nnqXgO3tj8pfoPemhCNYfiroPsEDOikcwOoCDPSCOMzE4LKX+yO+7gWUuFF900EHQvnmVMhgAFUCHOkVr3jbki9g5hYoFs2z8KwtjXcvpqLUuUKyBoVglqxhxrWiJqrlraXLjf3EdM+kSAt/GqmbHTomAkzxuO8eSf5unA44NBNclUAuB6UUjnNt4S7x2OGKarsqLeBv4wA4WuZmfHugBh7tipBu17Vfxo1FEuG6Ojzbq/Fx8723nmlrTr12mS6tN/2C8KTHqqIR6BNl+7SjaPaDhTwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUsiTf3v7cVrFwcVm5SsGgPcObOP42l52V1cx6On+vg=;
 b=DzpNvzxWhpCh0Fd+GUjrZgpaDwtZX65D6hxhlTIjgaEOdlYevfX4Ct1zMMxTZOHtPU7bG+6H3KdxUdWcyUCWrnkEaVbzMU2fxatdi5BAHOGozwGUcT2Eeu6hPazzcf3uGdFxn9xUC1zD9+XYm7CsHDqtL/AZgnPGwchJOL4plwbJZpKr7T0FBalYHyYXzB+e5mzoexz0iHeD6MJr+hTvSWYHkHkyp3GuPUrm+azb4/j/8NSA7xG9B5D7/ZsxamHS3cmRXyZMNwRH1Xy6/G5ceJYosiJjne7yZwLQRHWsWCjUm1UQ2wP74kYa9VOK1oIa/h+qkwCNfImR83UAx2vO+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 14:33:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 14:33:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [CI 4/6] tests/intel/xe_pm: Only check the rpm resume after the first
 mmap operation
Date: Wed, 22 May 2024 10:33:28 -0400
Message-ID: <20240522143330.312014-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522143330.312014-1-rodrigo.vivi@intel.com>
References: <20240522143330.312014-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: a5081f8a-7f22-4882-4bd4-08dc7a6c2e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2uP9PZUeeNI1/59q3xvyJyjL8nV5tmG04x2c4AKgJcPUihaMcZxoajmARcpi?=
 =?us-ascii?Q?HHZ2ipNh+00GOPNsC6y1XMGcS2+FGgBftgB5hJjQXO2+lXi11kiG2t8EsZ97?=
 =?us-ascii?Q?sA3+I7vJ9ALXFXSVvfUwFkPeXjYAKkEdZMvmW8KJrETNT8N5f/t5zNMJbhSw?=
 =?us-ascii?Q?QtEoZ5Websht6X11OXOVCQocE8D/mvhP//Pq62fxCHPdGElBFCZVP0WDYKY5?=
 =?us-ascii?Q?+hSjRVgYHxafL8POVWXTtW9zXxdPe1UGYN/N5FwzK0YPDNGjnaPbQUs68HVe?=
 =?us-ascii?Q?2z5tSHyMNtiq0QFhyqzj5MHf3L4X8aPvQ/jtk56qY8MqFkN1w0XeEwERyWdG?=
 =?us-ascii?Q?VfOFqos/BbY40hq2umhXdiW3bl2chnakGzCfNByu0EIyOC1oxXzElmQo+m7g?=
 =?us-ascii?Q?+GNpXYBvAg/34rg0exwyYQiGKw+Clst2okNQIUFaWRJEmh3VkGRzNKS6LbEN?=
 =?us-ascii?Q?10v+6/6N7cq88Jgy5Cby070atogMl+SuWq4+FqQyk+uQABg2jxibIb/ApCeV?=
 =?us-ascii?Q?xxzb+qQyxc82Dv3gVYwzify3tHVmP5iIMSCELIkzo9gkqFQzhUaC/qj8yWOj?=
 =?us-ascii?Q?2lJHAyRSi2ufQEeFogojkx6FZJzbOvImtn9CHOeqMWPvEvt7QEhkEChyExbO?=
 =?us-ascii?Q?wH38SARkAHTV7cwPAgtP4qO7swR6cfkIzlrCwX5Y1rj/TiZm8eenjPFjqZK5?=
 =?us-ascii?Q?4Vh0Z8oKE7AnBCQfIYKKLn4fJNqr8QA7J1/+9unP0X8gWTsTjsUk88a5GRga?=
 =?us-ascii?Q?aWuLoBUv3WqTJDOYcqI8EwtOrZ+BvvV0O/ZfcIhDidbg0dmnQ7Pt7wSDqRsG?=
 =?us-ascii?Q?RygeFIuOpeaeU3Z+rZhYFyxjr+LGdu/SoihaFpyAL/kCD7U7w+6bEYH2csqn?=
 =?us-ascii?Q?lVmFznwciQyLAgC/AnkOFgYs6qlZcq6mIqf7/BtWfBpITnMF7wY0fmu2pH/6?=
 =?us-ascii?Q?uHUp78xTLpXx4CoydiF08NolFRIXuWUpnqHu8WMpBbBEG0hC9Mi/nb7S9eMl?=
 =?us-ascii?Q?UX5qq5j1sQCQoJ2kgpz6GKCbvIWbi+IG35RtG1iWGtYTPrfx5xVYWWw9Ut50?=
 =?us-ascii?Q?Fo2+0A9wab1e2iv2z+iY7RnMVxuSkBunsAwQkjwMwVY6nXg1Kj0lsoi8j3Rg?=
 =?us-ascii?Q?yHKH9/l0sCWVAomSDwt8VcsKkeXyAt2DvpJ9IUcOERyt+vSyXxlc1XPb+/jP?=
 =?us-ascii?Q?4I/eIEGzqj6P4aOhZ0wfNr73Zhx0XRkuNP15Aehof90N7jF6edpt5WwaNExe?=
 =?us-ascii?Q?SNY87hFqCMuWF1nXa6apENfFmWpESTyZrSauADqjxw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YntxPGRJAxWGBAVyNrjdL2RvOvCpBQtBhStzPyxEmxuTi21f5YnZsXsjOXXX?=
 =?us-ascii?Q?KJMaSmjFI0SUboilEp7/bEYrTlxbmiPYbuBsQrtUue538b6csr6FOyE+JL04?=
 =?us-ascii?Q?BFYJchiGgLiBOwPe1+UxeUP0/s77+gLKSYV5rww5ZoEDFi5z62LBNISHFBX6?=
 =?us-ascii?Q?Wh9zKRlTR5HGB1Ti/YF9oT7FuMaKQuhGwttX7L3wQLlP1G3ConnU0Sm24s+q?=
 =?us-ascii?Q?EiUDO5BzDbfZ8eKoZPCxWmHGt80xn31MPHGWXkgj6EJ7bC1UThBA3PCu1kwx?=
 =?us-ascii?Q?3loToCEEPDVs9fjZbbCvXlAbos2t0LOC5aGGTtZYn3AEFg8DAdXbDy7fWu+G?=
 =?us-ascii?Q?0bSDEpUG1yn9gHEcc9M/llSbYOBfUwQpQPLOY9JTaEZAisHl54IUFaAvQgJw?=
 =?us-ascii?Q?WEF2riYZUbHRlTbFxRb9uyaSEK0+3YMccqlFUACndUVVZhn92Os0WQ8NbV9k?=
 =?us-ascii?Q?OGFYSzS2jnf+Ap8uWd1d8GHQ92C79s+Y96CXbOJjaMMHyRBigkzZeIKQ9dpc?=
 =?us-ascii?Q?eGgFst99JoWUMsBkJMNH9QvRfzAHhoMNJFV1YavG1bkmV5sfvCSBGTgl4nPG?=
 =?us-ascii?Q?7Ny6Z/EeVll0kAsVPejNrzI1xHEyL6DWmONdzmBmOLEOqSSn424bIaMTx1pH?=
 =?us-ascii?Q?HGD0NyAWpPFGA4aAR2WOOp+L2kzQSW7+1cc7kurHq5OrHYFuTkzRLw682hSF?=
 =?us-ascii?Q?IMDkHd/pfBoYIhvFV9eF266W+CrK3rn+XgpBAJp+cSK2GXkCJILuAJHYSXWH?=
 =?us-ascii?Q?c6Dh9CrdSB5e3+h4In9EUi0+Ij3fh70PG2sGzn3GJLhhzu6j2kCAQb9IbqQR?=
 =?us-ascii?Q?+9LYNLFWWmEGVsQDf5U6cnaBLzcoArek2eIF2GUsXnjznJWdcdMWA5Ird1NC?=
 =?us-ascii?Q?l8aT/y4sB5q4C0HuB+tuhrafNo4OkHk2HhWnZKQciNli0sti8A1T9xQ5ePKI?=
 =?us-ascii?Q?bCzLlXVpfqQgNER6fD5riowOZ/WHtAeuKarEsaDEpTtRQNKr4EEpTPemFDA+?=
 =?us-ascii?Q?aU67hqICKX7RjYx1ZfG6Gm6ohCW1+DkPkNU7xmYVv81/fBqVlQYHfa0OlmjN?=
 =?us-ascii?Q?7QgUeDahSWO9QOA3h95dCM3sD0wtk60cvZ4vqDJ7gzNAh6AUGsj/1WJX3JRD?=
 =?us-ascii?Q?Tli2KwihAlfBMW1cl8jbF5IxgdxnKiL2eY0+MMCDamvKyZuNkLiryWOg6tAe?=
 =?us-ascii?Q?jnn7+fPfaHK53Rq3Iq9EIFZXGXKCgTR8iVsWrgB0vPfnGX4Tg6ZuMUpGTOu4?=
 =?us-ascii?Q?I6je6JofmRlEzMs5s0Ot6G2hGhutyrDLiE/kEPNZIRrilLZEBNCxMGF7P3Dq?=
 =?us-ascii?Q?tRyY0QZFyQP3psmBvLLmmjGtx9dws1htTAFLOpOdQa5RCKBv8aLE73sXHKYY?=
 =?us-ascii?Q?DQLcF54wsyqUod6lP5X71PvYpzVgKy7PuuYcEzD8v09zWbIecI68sqjip3iO?=
 =?us-ascii?Q?7RVZha8LZPn97oCezaZ6DgG2z/ZW5/vYaOcSIlbIsN65Kke/kkbcyw/N26iZ?=
 =?us-ascii?Q?e1QAyZiN3Lft06hKLLoOEmkmIlsW/K2ifc9KmE6I3EUqEbQgS7ePRb/t8+8t?=
 =?us-ascii?Q?IjnnG94bQRuIdfAV9/cruJQcbd38sCJ3aXWAkMGMCAIVK/KwxuopgkYsJuM1?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5081f8a-7f22-4882-4bd4-08dc7a6c2e4e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:33:43.5756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peE88OfaLAermAMN2t1jyPZi5lx68GT9R90WEqz0H7i/r26mJoNol5Kq56/jn4s7XPxJs0hH6TJaPmbJbuNFdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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

