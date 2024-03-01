Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71CCC5478C
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 15:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818E210EE2B;
	Fri,  1 Mar 2024 15:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ht06Xo6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536C710EE2B
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 15:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709306180; x=1740842180;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ubgy42QRVHUvYleM1EFfqWVYv14oqq1gIPuQinPjOmc=;
 b=Ht06Xo6+Gz3JncRVXCP5rrdYM3uY8XxTS4Hw1coubbAoiTbmSehvxRD9
 xcbqmqzNUskFHVQNCDbaUofY+3Ii56R0BJpkrA7XkamKHFMbSnMeDToBV
 zWsllqsLyjjaF16clCVzfNqnxLCNNDxJi9MqHTayf/fBhjpYl46yMGJpu
 jzsnYXoVPH892FzU35QV2vP2GjSCHa5Flb3DQey7zCv4FupqxJ9dfbrM8
 c80VeZ464xzo44pI3IOPgX2Dv+jkgngsLK6CpwT8ThhenZhpbw0SEEBm5
 G5iIMqnJIIhCzK684X2noAt7o04RPmmevf6fyZkcEhZe2kN+2/bLeqGFm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3735850"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="3735850"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8154044"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 07:16:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 07:16:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 07:16:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 07:16:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/LOv9AY7kNeURnVGE6q58XF6Ansq3H+AyqyRPSk1aR6dJOB72+gpi3t52d/nb6LLWzxbHEAZRCnAOT4lJDE6FA+wJ7SqCoOdA2mYNcETpSSABOC91nvyWqsMJSGOcJrIwMdMDxnngxVKbaZZspVP6jM6jys4cOF2Mj8apDhUtmaX7GtlP7n2/Jlevq+KkTIgfpLGV+2BFz8AS1eRw4LD13MKZ3NG62LrEfN++EzDHh+luQ98uaKLH5BN09DwsEOmESARz6tseCDdFpNl1HEgQ9BuK/2teSWgOrlciXQXgWQfI7tPY2hLqmD/YeN8/0yb9P+ABNp6ajrlN47GGMasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK+vQWGzkylSbLoSR9KrS9V0CCOLFRilEIOUBhRI1C8=;
 b=RQEfAeo1dsZj4VDJcGBurZT2v0w0HvErVraAfbVDM62OZeSjaHqqUI8Q1NcJRW3kAS5goJs9vKRpEcvq+HRPHYuRLwg++VjffQJeEgCLq1a0UFcWWBuDy4YGqBDUfcIh1Pfg5XQCX9fLonYJyRDlBwDFN4INelcVVpqEvdGw4pf3L2wU/ZBuQkDYZW4hHzIr/JyM27AK63Ehe26g5uaf8IZmIOJeonGxoLy2N/DRaKvD1HsAvyiiMrPYp26ffO9ODzFjNU75MIJ/kFLYaKdu3USuz9B39vF8cAks4sCn6S8UexzQ/aC/alD+Xm25jADggecLBnbs2M2yFW0+O9V+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB6245.namprd11.prod.outlook.com (2603:10b6:8:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.18; Fri, 1 Mar
 2024 15:16:14 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7362.013; Fri, 1 Mar 2024
 15:16:14 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 3/3] lib/xe/xe_query: Add helper to check if given gt id
 point to media gt
Date: Fri, 1 Mar 2024 16:15:41 +0100
Message-ID: <20240301151541.1280595-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301151541.1280595-1-piotr.piorkowski@intel.com>
References: <20240301151541.1280595-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 328fc649-305d-495c-fe92-08dc3a028902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i84OvHBqjal7R8r2nYxvKwxDK3tA/KLgB7WG7TKYqOTOGz6hXgRIgIPZqD2NfDBowsFC+BG9cyRdplPp2ZfWrKEcwtqulCJcE7bZqoFcGXm0t3BqTeAzeuMjEjRfKqeEk0kMzLLwnp9Y2xtHlxTAFaiLT9MzuvCn31WsKIHE6UVA0u8r2wRM+6NM6/fyd0hNc1G0h9hvwAw3LZhdSkcSYS7RFch95kDIu7avtIO8Z08Dc5FjVfiZnfsJEltbZjr5DbPXEQYP6p7pReFqRtEsVvBLFLSRlEMLZRpWqfFmq6XeS/abAqYL8gpkKG+vuXZSUlkcbQjC0DdxPwaFi/51dThxLCS0hWy8JSJCTEXyNDKhqxlBFTbgqWjcy5VVFexokwbSsqnjOCfgUGQ3JB3IeIXh2H/y+N1cQEXpTr8rXu8HUgFacZHf6f96cWLojRhpkiHHguXwhYx6p0spuDK3x5Q9qASDsblaoWE9TJzZYqX7XnL2PDhig2jt1oUsqEtCC51zoGyfTyyIcg1R/lBjYGARCan/TtakLfvDjVyatw6NP2Vh23YcRTaYYOhkl10TNqDSJeWIvgIcNzuBj0wjNLs1jU8I7VN8cXlUUIYN6O5UCbby0dSmzb1TMQ5P1SrUB3aE8+zCtfjdLGgue06koQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjRpbzkvZzBuK2F2RkZ5cytZUUhYWHBla0hjQXNvR3lNMFBlcEMzaDUvM2pS?=
 =?utf-8?B?b1cvSFI1Zk9UdEMyS0p1RWNCWFpmUkVvTVNOUzQ0cDdlMFdabXdTdW5Cck11?=
 =?utf-8?B?bXY1c3VtZTJpOVRoZnJxUnBPQ0lXdFArWlR6cTg2d2g4TDdMSDIwdUtxdjda?=
 =?utf-8?B?MHN4WGVIS25IOTQvWUpuS1ZsYTZQZHpOQUozZjRoank2L1hrWEp0N3Qxd0Nz?=
 =?utf-8?B?NmFVOXdxa2ZDeFZxak4zUGh0bGJIMFd5T0FtTXZWY2ZybFQ4YkZxdHo1Vy9z?=
 =?utf-8?B?NlltNkpYZ2FoV2J2THlDMFdRWGpqSUZXdGIyQUJUckwwZDcwRmhEQUF0MmMz?=
 =?utf-8?B?cVI2VjVuU0lCUC93bjlPekhsMzQyUlJLdmlTeXJmWFhNMXdJanE5M3RZcTY4?=
 =?utf-8?B?WlpZdnNWbEZDSXVYRjJMbWhReXRhNnRRankwS1ljVEhLUWRRakR2UEtzQ3JQ?=
 =?utf-8?B?RHJ3aG9qYzdUNnI3eWt2L21PcWZFOHlkTFo2RW5xSGdxUU1jTjhhU01XVytE?=
 =?utf-8?B?UUpzaTVXMmp3dFlYY0lQR1hSbWxnalROY3ZWQVFUTjZESE5aeVJCajVNVTc3?=
 =?utf-8?B?VkY2Mm1ZZlBBZis1UklMRW1DMkNOYXlpVmZFcmNwVjYyZWpjR0x2WHFJU1NT?=
 =?utf-8?B?cFdjL2RSeExIZUp6Wmhxc1lhWnJsMC9FV3NObEExMlJoeTMrc1ZiMDBMV1lT?=
 =?utf-8?B?NzNNL0NzaFBPUGwxekNuNUo0WkFnNUUxUFhaYWJkeko1NlNGa1paaVBLTnlY?=
 =?utf-8?B?aE4wbFBUVGw5elJEYnBTWXcwRWt0U01HUTdoUmJnMHN2VUFIQlVuYlhUeHRw?=
 =?utf-8?B?TlBuOFVrSzZjQ2czeEJGN3VuaXR0N0ZGWlE1b05PdVk3NzRtYVlmZ28rbTVp?=
 =?utf-8?B?eVVyTm9ZWStNL29QZG9WS0dQNmZDYklWL2pKZWNSWmkxbzB1OHZhc2piUWRD?=
 =?utf-8?B?SzV1dGx4Y2RkS3dJcFRrT3hYclRCUFBHWmZnTklTRDlQZDRUZDQzeXRkdElp?=
 =?utf-8?B?TVlsWS9BT0JnbU0weGdSRDAxR1pSUXRpdWRRQ1FXbzRLVXU0a1hnMnRlK3dO?=
 =?utf-8?B?TFBGMktFbnBrZVJ3MlB1ZEhCdERYMUtueVpKUGZRSEUzZlpRbUcySXRMa3p4?=
 =?utf-8?B?Vi8zbzZzQmtpeEIxWkNSZUJVSnh3T21YRnFJM1QveXB1Y1ZsWW5NMzF2M1Js?=
 =?utf-8?B?VnF6NlBpQ2IxRzhOaG5MUndPMmtwa2l3T3d4V0lwK2MyUjh5OVArZjliSHg3?=
 =?utf-8?B?VlBXcWxSTXc5bkg1RzlhY3pZMFpncHhxb2F2b0JvK0tiRmtIcEF4QWE4M2w1?=
 =?utf-8?B?dUlDblg1NWczZUN0OHRwOGFQRHVCQno3U2ZaQWFWdCtxbE14dHBxSkhtQ2xt?=
 =?utf-8?B?YjZSN0t0ZTZQV1IyWG1QQ3AzVm5UMUpXb21hVG9LazlDa3dBZVc4Q21JNTNS?=
 =?utf-8?B?MzlQaDZSb2FPN1ZXL2N4eW5zREFBRnRYR2pJLzI3Ym93MUJiU3lzUlNrdVlZ?=
 =?utf-8?B?bnJzTWNXZHRyTTlDaTBCSFVlYUw1aXV3dXdQKzRNa2hwSmk3T0wvKzRwdGlU?=
 =?utf-8?B?blBYNTZabHN0MCtJYW9GR3FvVlhYVUpiVm5RYWpyV21seTNPYkNCK3VVQ3ow?=
 =?utf-8?B?eFJZOHpmaTVWOFBzdDJ6eGlCZXdvbUF1UmhxZTczams3a1FvWXkwWSs2MUg5?=
 =?utf-8?B?V3JORWFWcVNtUnVsaStmaUpXNm9ZVFJFTVAxVFZtaTRWVDhBUW8rdTlNYjRM?=
 =?utf-8?B?VkFKR0twSU8rQzN1NjBvWUIxSGQwdkl6VFgwejZvNXRDdDZlOWFmakIrVzZ0?=
 =?utf-8?B?S1NNTTlzL2RGRjVpZnUyL1RwYnI4Umh1VE1VVWdGbDR5TE53SDVSakpZcWc3?=
 =?utf-8?B?dDkxeU9TYnhKRjlTR0drOHlrcmVCS3hXaHVldGY4RzJ6Qy9HUk02ZWh2UmUw?=
 =?utf-8?B?VEJCRmlFYmplbDc1R1V4cnVTR1JNMVR2czVCaFdCbzVoVW9hT2JxRFZvcHZB?=
 =?utf-8?B?SVJiYVhEYlYrN3dFM0dSOXNTN1VJOGhFNXlDcG9wVGFYdCswS3lJUnB3Z2NI?=
 =?utf-8?B?Y0RLcmZZRXNHYzNRY0ZBM0dIQVA1QnUxVjROak55K2xCNDFtK1hiWUlLejZS?=
 =?utf-8?B?VUJKVVVPd2tURjF2SDNxYWxod0RDNDV3NWNlamdWdFBXYUJST2tpTUhCT29m?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 328fc649-305d-495c-fe92-08dc3a028902
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 15:16:14.3752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1D3L20v0lyVb/woP55ahzOH7ti88zAxfEy1nOya+gREZ4PNtjjJU0pvCCajxzulRiW8IRxIr0LLeGIrDvIohgZ9UQ0ncwoYHl0htPZPrBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6245
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's add a helper that can easily verify that the gt id points to
the media gt.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 lib/xe/xe_query.c | 21 +++++++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 729fba6b1..53a2b4386 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -710,6 +710,27 @@ bool xe_has_media_gt(int fd)
 	return false;
 }
 
+/**
+ * xe_is_media_gt:
+ * @fd: xe device fd
+ * @gt: gt id
+ *
+ * Returns true if @gt for device @fd is media GT, otherwise false.
+ */
+bool xe_is_media_gt(int fd, int gt)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+	igt_assert(gt < xe_number_gt(fd));
+
+	if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MEDIA)
+		return true;
+
+	return false;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 2460384c9..82af2706d 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -98,6 +98,7 @@ bool xe_supports_faults(int fd);
 const char *xe_engine_class_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
+bool xe_is_media_gt(int fd, int gt);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
-- 
2.34.1

