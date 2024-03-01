Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343A7C5478C
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 15:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83A010EE27;
	Fri,  1 Mar 2024 15:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AB/6liFQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C19310EE26
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 15:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709306175; x=1740842175;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=RKuMXGX3n3fw1uejgTmRmkJOoB6bPQ14A7IvvzMB7Bs=;
 b=AB/6liFQE7XbP96uY/5VVGw21LsqFfNC12IuEotX5E7heGGY/fPuKWLO
 jBb7BB7MCKuFPGf3D3A3ImT6V4RknaovtAmQmlhQ2kmw792PlDobiBqLP
 8BItyYsKcLE/9qJs7A6COgsU5leHpta/mlt2HyViaA0mP/NsCYkZJ5us1
 fMD7weMUZZXP4WRRwY1qXdXAqv8/CVn1W66CpQpyPO0DIxdIdH1TLo0Sy
 v5OcqO7+QGQD1M6gpaLAys5JXs6Qx/VvkoJd6zZPzojpRu+knvF8TqqU7
 PiDKh16I3PC284u3/AyoxgJV4YQs9hR2fKIpcAJazlxzWJvr8EijqgXuk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7660587"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="7660587"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:16:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8281192"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 07:16:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 07:16:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 07:16:13 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 07:16:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R28JolS3h4Q8TI/gnDZs74NyhovmeKKCtK4rIZckMjf+gD4oRtD6sewDFHPNWBGouWzgzTqV6QqBF5BIrJQfUKc/aw67hZ83PXWnygRPfe8+rP08yZs/w6eLEGN1rVl4U5Qd3BqPxO42mKtHDZ4G8ELj5w//EIAdZz8P5GPI5oz3wJubdfjwll8ZMJ2C3dIwkRnxSiA7zEt1RFUad4aZP3txUzUF5szrDBigf2t2Tc8wTyXIXXAuu0BG8YrY8Ac/eEf8M5aQWXj2WX3AeoJL/VF85KxcJoTznm34X8r+IiEcgdQ8UPLT0DOJYz1vjFb5b20m9BLMgy2ypEB8PRVDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Gh39HKIz1kMIphXwPV8fOFgZhrjZ/bKNxRQcKiNI5k=;
 b=nX2W8GMEtySgqXlO809rSQYvZR+ztcj4XyogRVu+L9W8AXprQ+MiF7P1WYXqoaavZ9iRg0C7u6SisG7udTTo7cxab7x2GnbK0NlBOx6d9jw0+Xzn6Q8e3wr4dw7Qryc7iA9U0pR4AUJywIu9uS67K5ZNukIhdvBMHYxYlw1QI6PJpuSY2MLJuddUi5B4o7UWf5L34bVmnWt9eONDXFrpYl9GO1HZdTSurLHOQ929ZKGD7VUHPhgln+DSJEZ0n4Rdum4UxNmPQVhj+fWcANjQDXgFTmbK1GjXaLmune1oRw0ML7k3IXnEEEKpg9AKkO0r6idWstQJWK12F3zV1/OITA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Fri, 1 Mar
 2024 15:16:10 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7362.013; Fri, 1 Mar 2024
 15:16:10 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 1/3] lib/drmtest: Add IS_ALIGNED macro
Date: Fri, 1 Mar 2024 16:15:39 +0100
Message-ID: <20240301151541.1280595-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301151541.1280595-1-piotr.piorkowski@intel.com>
References: <20240301151541.1280595-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 6843a0b3-2b57-4b99-836f-08dc3a028681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6O4CmCJMw3+PnfnGBptHpXKCLAAfozMpq60zCc3+KTvPrk1l2E8WMLmq8oyAFA7ih7u2lk7Q5yr/NvBSge5d5rb6ujxLtbFTLNVA2i1LwjXZyZVaud/+Nsn3hZwc3eh1gwRzRVUI9MPaVumAfusnFJGdaKWn4VKcm7Np/rGgbxFURXqubirYTkUMi1pet0QSTUhzuDPj8+kK2vq1jbGFPeDULIgCT/748EfGCj6AZDfLs7MNz8otYIb1vUlP0OuatFYEBti1lAQkryNRIXf8Z7OKvwZKg3MtSk+8RufJilJHL5/bv/k7U4Gp8pCHOIHxhPMJBqYKIjmUXlk9emE+ABA0o3ffCntZkrpAhku4rP316ti1E6drGdsdlsCB+M2+pNA6GIfKeoC4TE9YgRZ3XF/Le/o53JmqK3Ka2+XSMiyHCId+A3PShxdJ5BWqQXsqIaQgbOiuQf/9BCXC4Lq6+vdFSBTG+11iy9BAFao1nkxkJjC70oU5hzJe/S1NCctsmB71B8E62hfPzreU4oxLo/yeb233VrdwT7gwYEA+yPGrEu8BvVfFVi4p6NUnSng1+B65n9QJPEARC0RdfoE1fbEK0ycSfzW0x6r+m15/1DsOWp+R9e0p3KdDO+/pmMQS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmVQanJzT0RJTU1RaERJbkV0a0Foa0p0dXBITSs0SGlMMFZaanc5SmZmcXJB?=
 =?utf-8?B?VXVBM1NhTXJ0emZRdXNhdHBrdkpBeGY0NE90d05QZzFCNkFPOHlZU0V6UkpQ?=
 =?utf-8?B?bWhDdWdMVW1na25Db29uc0V0TDM1cWJGSUVYWmtWNmIwUit5TmZtUmQ5WWhk?=
 =?utf-8?B?T3VzemJMdXg4Y1FzdXdEVHFVZGNKbzdKYk9IbVY2N2FBV1lhOWNtcDh2RU1r?=
 =?utf-8?B?ejFaS2c0L1pyNmJ5QnJQQ2NwVnl3aHpqVUZFMjNyTGdia2NPcXlXVmMvVTIx?=
 =?utf-8?B?aFhMdXkzWjgydTF6SVNRb1pjMzY3UEJQbHhrRTVYQTc2STY4SHpLTThSUjlt?=
 =?utf-8?B?Y0ZjM3BlZjQzZlo0OC9HNlFlQzhkYnd1VjRBUENvWjZzNzEzVEpRVzNuK3ZX?=
 =?utf-8?B?OUx2L1pGNkxZMVZrMUlWbUV1c3h4cEZUV3pkMmp3ZzBjcjk2U0g2STc5Mml5?=
 =?utf-8?B?STNJNDVxMG1zMDBpK2tFQ0R2L1FFcDFxMVAxaENWZ1lvQkh2Q2VibUFQcDk1?=
 =?utf-8?B?alcvNWppZWVtcU01M095SUszS2xYbll2eVEyRVU0Q3FzWlFhTmljdkZQNWp2?=
 =?utf-8?B?U0lwMGx4Wi8vR1hUVCtEZGRtcXBqeFd2RTVYd1loRkYwSlBVQnprSUpJVUhZ?=
 =?utf-8?B?a01Wa1JuM1VWMVpJMHVpR3NJcGRLbllGb0JhbGVIZ2FMNnVDUFZUM3YvSjFD?=
 =?utf-8?B?bGJuKzJKVmw5VnY3eFFKZlAyYXErWHBUTDNiOEgxMS9mcTJ0VkxiUkZPdlB1?=
 =?utf-8?B?a1JkQmZRVm5uOXhUMDNDWS9ZTitrc1N6NFpPQUFQd1FRWjQzSnBGZTBHZk5s?=
 =?utf-8?B?ZU45UGtwcXJyM0pFejdHbmRJdjBQeGxublYwc0FuYlBGd3BUMkxuRldqTjBy?=
 =?utf-8?B?UEt3WGN0RU93M0hqdFNPZkt1MStOTzZnclFKOE5FZFMzd3NuZ1hPNytkMktr?=
 =?utf-8?B?RXdXZUxQenl5SHFHWnl3Tmw0QlIxUW9IeDNkTU1KV1JGa0NGSXNQK28rZmxS?=
 =?utf-8?B?RVQwTGdXUmRGcWhHNTRtUHduTlJkQmlZRTd2eDFtbENJWStiY2lCSzZ1OVh6?=
 =?utf-8?B?TkU2NDlYK3A0ZE1ObFJZTXpab0FHTjh0dmRCemVEQUxleUlKRTJ4QnRUOTNa?=
 =?utf-8?B?L1Zhcm96NjE0aklTbDNhdm42UkFiNnBpN1AvZGxxYzgzZFM4bWZHNEVPZzk1?=
 =?utf-8?B?NXFTclFraWt4ZFBOQkZpMURHaWZXcjc0M2xvUXl1bVZLdjAzUVc0a0ZJMGp5?=
 =?utf-8?B?QSs1Vm50RWs2dnJlM0xtWnY0L1hOUDdQZDdBZ0NraWtXQ2ZYSUlaSnNzT3pp?=
 =?utf-8?B?NHkvRFVYcW9yeUl6SEgxT1RqOHpFQis0bjRRaUREc1RBR2ljSERNWU9ZRyt3?=
 =?utf-8?B?anRtdnpucmw0N2E2YzNUazY4MVZ3QkNQTmtoUFRaVEp3UWxya05mREsxZ25q?=
 =?utf-8?B?c3d0SytYR1lHV3R0RDJoY3hVcUNyeEJFTm5keGRTcGZWZGVaSEV1OSsyZGNs?=
 =?utf-8?B?WVVWZ1d0S1RHZXdtZzB6ZjZZYlRnMTI4aUFLYXZsWkN1N3VTaWk3SEdYdmRH?=
 =?utf-8?B?OFduajdtMnY2K0tybGdYMG1RV3VqZ3ZTcGwyZUFZZW5jVStEODhEbVpTanlo?=
 =?utf-8?B?RjlOam1KczBmN3JGR3ZDTUxVYUc3ZFFoR3Bvdi9vOFIwalhNUEwrOGFrb1ZO?=
 =?utf-8?B?R1BGcFJJN2tRNG5pdERhQ3RiclBvRHRMeG85ck5HTENPZHV4WXJUbURTalVn?=
 =?utf-8?B?SVBQNHhlUENnQmlGQlBRRUlPWms3dVJFNTVRNGIvRHVndGhwdFVNWDN4SzhO?=
 =?utf-8?B?TjFaVy83L0c5ZS9YWWJlUkJhM2RJRXlyVDdEaXZNc3JUSGY0SmVkNDVsYzhR?=
 =?utf-8?B?Y2UvbTBPLyszZXIzZE1VUzI3bmhLbmlwRS9YUm82eFQydTdPK2Y3a0h2MHJZ?=
 =?utf-8?B?UHltV2ZuRjdFeFhKZzFud3FnUmtzbzBPNjBCSzhaSTJNTTlRVUEvZ1EwLzVu?=
 =?utf-8?B?czB6TkhrejRaOVl2VHdCZUs3NVBlRVlES1pIcVI3NU1ROHhJTkZXcVFqalVm?=
 =?utf-8?B?TXlhWm5RZjZZbGo4dzF3VHQ3SFV4NlJxcGQ1VExITm5ZOUZsbVRsM0VwMFVp?=
 =?utf-8?B?am02YnNTQTlNdFBkcGE4Ly9sZ1E1UVJpVmpPNXRTeUVZQmR3d0l5Tm1MR1lC?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6843a0b3-2b57-4b99-836f-08dc3a028681
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 15:16:10.1817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnOpyUT++zNXwC4Ut4T2tIuFy1dQ9itL9rIXVLBNAqpldbvS+3ZYAj4SizAjJck5bPvOtvN076G/i10NA6jfEVh2upi8/WDc/VVXMBoH560=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
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

Let's add a new macro that will be used to verify whether one value is
aligned to the other.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 lib/drmtest.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/drmtest.h b/lib/drmtest.h
index 6bc819734..588d7da17 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -99,6 +99,15 @@ void __set_forced_driver(const char *name);
  */
 #define ALIGN_DOWN(x, a)	ALIGN((x) - ((a) - 1), (a))
 
+/**
+ * IS_ALIGNED:
+ * @v: value to check
+ * @a: alignment unit in bytes
+ *
+ * Macro to check if value @v is aligned to @a
+ */
+#define IS_ALIGNED(v, a)	(((v) & ((typeof(v))(a) - 1)) == 0)
+
 int __drm_open_device(const char *name, unsigned int chipset);
 void drm_load_module(unsigned int chipset);
 int drm_open_driver(int chipset);
-- 
2.34.1

