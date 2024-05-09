Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02107C25B10
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 19:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE4910F090;
	Thu,  9 May 2024 19:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0v26nqH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4359E10F0A4
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 19:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282211; x=1746818211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=c9TlWUxmYzg1LVOfN4z5otlHqX5iDO63H0gIJVq/4p8=;
 b=h0v26nqHrWSFhZjH47+8WUKz3Mzwr0Zj0NZRIT/izCPW29DuYABzv1B+
 qdk+Z3n9G6jixx4ar6uaMIMjs8KPD38GHvEDHolf7JQT5C3tbl7oXeiUV
 5M5t9/gUzdC1u423LWDsCiVDYvZPsnZ9tUt7M5jvkLjFd7qeEUZUJjL52
 Cwra1xNEfaOZeb9RZpa5SGwKC+Lcg2DC04+oQkDxkyjX+L42XIIEH4B/E
 8jDZ76co95endyplGl/XbXudhIz7xabXEoUN5qWR/+zolvbRtJdAPCnW4
 d62ck5lZi/7HNtChO6Dcyl1L7xeIr+l74lEfxjvlTQBZWbOTA/8guygF9 Q==;
X-CSE-ConnectionGUID: N9PPHKdFQc+sHT6WF8ewqA==
X-CSE-MsgGUID: zd918VIxQcODzHjmpdF/ZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11453711"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="11453711"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:16:51 -0700
X-CSE-ConnectionGUID: ffsIPOdRQBGsqyfCxPb55w==
X-CSE-MsgGUID: RsayA5eFSVOnDpYnecU+xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="34140221"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:16:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:16:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:16:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:16:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:16:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcikfI56QiUK3Iht7uo3xN07t5wGRzqG7eMw7x2WYfn6b4cgwUxxbOtbfQ1ynMA+kWXB/ejfPrq0fVxjdW2O+sAuiPbtdQqjrjjOn+jbkWL9nIamYTbddwh+nPbpP5HvfGcfYuFvfVAxL5Yhj68EVSWvtIGY3jUzXMJoEtgkwg+LeFNG+RqW0pPhlDPh+Ajj1eUvpyhVzc9s8nNyjwN/5ZOp5FQc2wodinsGBTRZZz7CS11sG/qNKZKw+N7tevNgbvpBhmy7L2R4mifd6oL2BNGwxa7CcLvjV7BIdo1u9rhY8F2BWXLfmrx6wXKtcao9WquYTBzNDSQci2RrrlEJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faafW3dSx2JDp++Y2wPNayF4ZmGkIaph0HETEeJV9Lw=;
 b=VUQqRURoqgQXCdRdbk488gy940r4VT6A5b5ZVdKj2v5d922JI1kBieH/xBnCXZXEwZyiH+BW7o3NX2X4vkNZMJOP+3Fq/b6CKAEfwC2QPVg17iobMtbByjF6shWyH/vzpsW9ZuyM02/6yXiHJ8EjSPP+TMn9MpAY+qLynQCSD40QoMhaseceyMLxTN3W3QID5WOT9aszocJI7EPX9ZRkaOuM4dX2BE5wyrnPYEJgeqALBC1+dzBWxxbHys6wVJv0PKUbxoKKWiRPsxo+YsfsHMfjz5Y0ZOIf13Ox0MS0345wOwP9xyw6Vh5ecNN9vqctCfe2z1kZIqI8JbqSq+yBFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6602.namprd11.prod.outlook.com (2603:10b6:806:272::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Thu, 9 May
 2024 19:16:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:16:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/4] tests/intel/xe_pm: Only check the rpm resume after the
 first mmap operation
Date: Thu, 9 May 2024 15:16:35 -0400
Message-ID: <20240509191636.504200-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509191636.504200-1-rodrigo.vivi@intel.com>
References: <20240509191636.504200-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:303:b5::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 1768bf0c-b0c5-4eef-7a29-08dc705c922a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MReF3AVP1zgz1879izLZ9FmJyKowf8tQIrIV8oxrWbAyAFau4oSnBSz3FEnN?=
 =?us-ascii?Q?JyabHsD5HvV4tXXbhtuycWGsAZKWQmP1XxONOMw8Z6BRr53OUH88fevvMgjr?=
 =?us-ascii?Q?Rq0hKkgZKobZqEKO6zJ82XQsCeD0zSKxo/rjPy1xLVzMhtk9vKAPKRVelFfF?=
 =?us-ascii?Q?KNrSPCbIOxU8fyu/Cp+H3BoT9ZKerpRzR/HYaS4k+iStX+7eQJLTj01Vw2d6?=
 =?us-ascii?Q?xWTGwStrnCz6PA9w+oYnmmhJoxkYXJb8KKuz32y4JG3bYV6SZIQGcm0gYSZD?=
 =?us-ascii?Q?fvwXpEZsx4JDfmkN2iopVEHl3yEc8HAV30l80T/TIZ33xw7J4x+0La+CzMmI?=
 =?us-ascii?Q?hILztFWdCZpNT1CZhMmSsFcJ/j3Y5E2bLxryEIh9khdvvQiEFySX0L545Yls?=
 =?us-ascii?Q?Mq371/oX0lLnlN7NFuUVqeNDRmJzf7KdvRWlAUchs3+ZCY5nALi+3K6cYOaW?=
 =?us-ascii?Q?r7yXootKSN8sGc5H8MNSYHd7qvtZ07SQ2GLg7HQT3zDvxyj6Bc7TUV4plMgw?=
 =?us-ascii?Q?FSnNZsFR262gCb4CULtFYMVKzYFAJ4NM1/sDfOGHQsHVQ8g+/71TQulPun9I?=
 =?us-ascii?Q?Rb8vpvFYHnFfkJbHqSm0NFm3RRIJ4yJP1f/zzKXQfvwJYy7Pfe2VnaMsMGqZ?=
 =?us-ascii?Q?hihEwba3JrKzHON6C18ROv+I1GN+QuQ7JyoZA+hFYD3IaeYYy2LSAfBPgbbb?=
 =?us-ascii?Q?fgDCrz6lKdhxWl5XhZG5bSxISKJMyrFkMiAJ9CYRsQxxlKzL+8gEoj2tax1I?=
 =?us-ascii?Q?u66bnZxt+46HZ+W1MQoNT3Ie2SlOqrzkn2YeSOcgRQLQG8mBxernixyXeuJe?=
 =?us-ascii?Q?yLYbn1axnQg2Yz2ac3I7+2df9PkDuFVWAR5ww1PM5iAHsClfjZPkJsBO4V3I?=
 =?us-ascii?Q?fS4PPy4bfvqnjL1fDuaJeuP+uHbpaxS47hgbwR97dEz3Uh+/+GKkLmtp+xxP?=
 =?us-ascii?Q?qXvllB/VV636+SWBKq+KVwWR/2wXI1lK/aUdP27t6IHTkyuO1J/6WAhGG2u0?=
 =?us-ascii?Q?oRSE0Q31qiANSfjpLyCy52Vf8+7xOQTfVWbIbfohe1aKsKvdiGAJTJqb3+lC?=
 =?us-ascii?Q?MROkGjNlOTpMjawF2H3iK+x6M1d1Ovrnpe/PofluG78MRgVtcK55BVZBpst7?=
 =?us-ascii?Q?YJUb+ozE/CaDS5QOBvKbiYxDM1ztCWrqMUnQROufkJnvyEpF8WDPCQrDtv25?=
 =?us-ascii?Q?ChiY+7ZqhZKPRGtGzr7j9qQhbRtBXmyntShUbPROIDM/tEgabEww9fS6ER8H?=
 =?us-ascii?Q?pMMk+sITUxHYq2JeXSN7W01Foc5NO+3o4Nb55TbVuw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?epRhq/+4HBr5yuh+GI96LD8gWtbnBqs1hW8M/nOsgYnyvYU5q9TOwB89OaHp?=
 =?us-ascii?Q?GTZ8WQQUzjHN+i59o6cTY2u126c+hvNeBiNXDYe4pqKnRLe7EpcbIutCO7Zi?=
 =?us-ascii?Q?uv8fb8radSSQXO5Ka/3wWAU2cSUoCguvkEMQsKxsNUXAeczLmJ+m+aKBfq2U?=
 =?us-ascii?Q?BtnTZasKuKMxzH2DJVQWdtq9tlgAOc2U4nTSVURCCBA3gLAkQOYt2bh5IDQ8?=
 =?us-ascii?Q?L0fB6JRcBE7EiKOZ944rjdAtPP0q0aYUZNZHNJkIXNd/yr+jOvJRL9y1NP2V?=
 =?us-ascii?Q?yPZEsknO0WOZC8SpQqxDpaUw/JCFHYjEQFHixixDBwvU4G7Xkdrc8YB3RWBS?=
 =?us-ascii?Q?lxJsBOqcrD8kPBu9EEPBQHV62hMarkOHl8l6bvlhIn/tmevFi4+qKTgZ6cDH?=
 =?us-ascii?Q?N1C3C1Q7WjqqgZdwRj1hUVv/0/LhQ+RYkF2r+l9SzBI+wecQyUrxQM4iWHJS?=
 =?us-ascii?Q?SXerre6FPKaJWF3riyujlKO5OvBjfxn4alA+5pzYsdaSQwRIGZlaMyirq9x0?=
 =?us-ascii?Q?jCizr3a2AnFcaXl6RPQfumeimXIovquehJFVez2r+sd6ZX1tTz1OtelSMdgV?=
 =?us-ascii?Q?1W2C/hDH41GkwJPR5tG4eKNCNgeKzHc2OZKY856ofGtsbQqvjt1cISOKPd5s?=
 =?us-ascii?Q?AbsXOIugE06UI0AdUGcXXdNuPwgGpjme4HCYNVq3wVmjyGR8U1cH14yAVQ+Z?=
 =?us-ascii?Q?DE3Wzyay/hsJeOT5xuVCcJhTq3GnyYMxAePTwp7thcnmjqVfeABwYuMmXpGb?=
 =?us-ascii?Q?5zD79vpsLZrL+C/BahjsiziCSl+wLDsKYjWos8V8hst24lY+bNrkyU22cgNC?=
 =?us-ascii?Q?IP+Mqj2cl8i/BL4eHbZl6v9Lia+Pmox146DPDWxQOHh5hGqalWmY7Ufi6cir?=
 =?us-ascii?Q?4WF3jFOXkp/eJzQgkjZ4RypscTZz1KcQKwlbsGHbmrJHBgsyzppvqVuMwDkZ?=
 =?us-ascii?Q?nYIAPSJGG0XHNbWkQ1s7CE/GtVLdkc0dyL7wHXIOnz+ez0XwyKtXMXPQ2Cuz?=
 =?us-ascii?Q?nEVDo/HVUO1mVbvySxeg1dB+QDhqeeAyKmCylG3jdCxjPw62WwZuil9RTUyf?=
 =?us-ascii?Q?4Y9Ni/X6S2KhTXyZOaPvDg+5OlwKoz2uq0Ll+6+yZYSp387Q4zoxmlIPko/5?=
 =?us-ascii?Q?qS8z20KE8q8zRkDFWVmEwWsX0pICLCnBeTKr+4HEPSWJC74D41BwZvLEspyB?=
 =?us-ascii?Q?8Onn+CSKgU13Di/shI/rgAgQgXxIZDppEfCCgvPYWg2A2KmuaWSyj4zvusIf?=
 =?us-ascii?Q?6nvCCJsz9nbEuoPiGA7jlcWke7twjvwD21bey8Wv9gkq+T5HAxI/3o9Tj0mz?=
 =?us-ascii?Q?EmFGar8UtIMJkZ9nMervUAr0QfGLpxT3AWHtZbgCrmSgGa7yigbWonWpnCCa?=
 =?us-ascii?Q?VPbYwWOyFaoOw70lBVWPzZsMjUmMkRifTRurNDpZ7YJC4vdXCnaZtpkmcLlW?=
 =?us-ascii?Q?KJ4/8q9atFzVpfSkIoN8FSwVfPrDveDN40nPZCrf50s6FiR5BfLl6mTUg1jS?=
 =?us-ascii?Q?ZgDWEk7qiUhHDuPiv/0JZ1tR2EKLjZOTUECAbG243Oai3eaOv0IUb+nKTnLX?=
 =?us-ascii?Q?bWP05uaKtYGFRo3s3MQ22jsYlHLAF3R7cyJJYO/g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1768bf0c-b0c5-4eef-7a29-08dc705c922a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:16:47.6343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hixmwMBxMXwmo/Bn6AlD0xkZK0lIV1Es6MiROlM7tX6L+GA7x0K6GKQQ7bAlfOFKsx7MHfetye1BNH67oM8uVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6602
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 89ffb8224..67d51f4ce 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -37,6 +37,11 @@
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
@@ -518,7 +523,8 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
  *
  * Functionality: pm-d3
  */
-static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
+static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
+		      enum mem_op first_op)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -556,8 +562,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
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
@@ -567,12 +577,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
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
 
@@ -725,7 +735,8 @@ igt_main
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0);
+			test_mmap(device, system_memory(device.fd_xe), 0, READ);
+			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
@@ -744,7 +755,10 @@ igt_main
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

