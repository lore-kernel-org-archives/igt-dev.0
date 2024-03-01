Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68698C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 15:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EAE10EE37;
	Fri,  1 Mar 2024 15:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJNV07zh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB2410EE37
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 15:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709306202; x=1740842202;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=NlUjwezOjuTUCLJfqnVn0NInTr/fFziVg5r6JtdGX9c=;
 b=iJNV07zhKLQOne4rTiAyDY1zkP4L0QS6uAPYDjIXfIwN0iMf+0Eyxm9w
 Qt5b0oV4HA6Bql4Nt2Zf4wqWR9CKXbXU0eyw5Xzn2aZaZuQvI0AeKtrbI
 6iWnCOGqlGezFAMhccNHpt0wfgP8428Ducf8Ecy3Zgzms4TmRRKQqVdQ9
 EjLRCsoviG5VpvP6AJw4fm3i43MYly2FdChn+MJFXA095Hq+l8b+D3rti
 s02SId9qm2/7D67xMEaEWhkFcdTXAvyZLJOIMC/IX9uZ5G/S9rnhpMqJV
 Y3U22PszP8cruFRUWWkKUVgNsTDJcXv+s29OizzQqeKCybS8TDskNbfZl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7660623"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="7660623"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8281225"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 07:16:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 07:16:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 07:16:17 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 07:16:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 07:16:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSV65IsqM0fOQkcXOJ6LSpdRX5CQejeNMDBPXfB7frR/4KWwHFPW55o1LX6DUwza8NCbAYRLPSdYqibxXNUPh6kpCbobR3wbn9PmGpCMg3N9HYOKZoIEIwElebwTxKHN4rxlGXrHUtVtEFoXH6oQjzuToVehX4C8S94uofMDGP1i12Tzbzz808CtP8e8VBbSs2fQ4ypeFgmef2Qh8kYM/mWPMb3EtZUftXyKYzydH/6f6SDvILw7I1Ji/iQQcp3CEnOF6wxiY/or5ErWmdxPOhI0A8d6pVuP87HiCdgcAveRALBSFdODbm9/dFC9EbfyYywchu7Modv0DP+m5/gLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nq/P21ks6uAPoEfRO9DlzvLpCLA+GWGuRzSGde3hLo4=;
 b=DgRHNEA4CYciEjcSEErQ4RtUliJjK3bbD8z0yPdqvYkft69wH4t+u067MbVBB+F3G9EBwxB3ca+8BRQlq2ZyjWQEXZ2ulNiS0mJbpR3ix2w6YTLSuggZcljCA92du4srHPL06bobaXm+wuI9Q13s/rzh4ttH4tEL/Z+7db0Vs+kznsnZkwo0898eK4NHYPAgtmWA9NOI/w42Mg1KOiPahsrHvemQM+bdle2mJ9ODKFJ7Lx8tSQulQx5WQZgHZpblsLwBKWcUJQ7JIpQYuRchkICrE8yUA+U/JKpJ8kP/p54huaAMNB6y0HheqrPxwjflpb792Ps0VvFiR1t06bAJwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB6245.namprd11.prod.outlook.com (2603:10b6:8:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.18; Fri, 1 Mar
 2024 15:16:12 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7362.013; Fri, 1 Mar 2024
 15:16:12 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 2/3] lib/intel_mmio: Add 64-bits ioread/iowrite
Date: Fri, 1 Mar 2024 16:15:40 +0100
Message-ID: <20240301151541.1280595-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301151541.1280595-1-piotr.piorkowski@intel.com>
References: <20240301151541.1280595-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4d8e92-1619-4ad5-5195-08dc3a0287cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AsN/ABIcMhi5UOOrDvmJZhmt5HM42daabGRrYPbdPig1ur/teBmkPtvPbN0ZqxM3jcZr1H6CmCwITGCIBvBJkoLkcKnw/ZZqZJO/+JLDCWBJCwDBsBMzJbK/zWE6T0rN5kTn1lenc8LAhvYkBhqXxZUqmT2z4nQogwfL46uih4TWWBdzykkbv1kgkp4HGHiI8LIDuWlMzmL5jMMbHU1rUVfeAj8DAd9nofHW+byiL6Fdjyx6nmM6G+3yGsz+EZopCs4AJ5blvsiGWnGXh9RAOrZfOwL/pPEZQt/cCtvg2tsbusV0yj/FGkk4NZIpJ2/qn7PIwCVUAn94XiTuk7RpFfZdKumD5BeL3GF3C/zUUXF64p2cwFIcV0H/1drrm45CnabGTy82d1Y+A/dTIgBteIYCOBxVR4jPn3CWvYWHqYVFleC+mLlfd8jgK7p1OTxdqbVPpECPJDhcjLxIQDQBuGhzpNxSoHyMYQ8XuvipL+FFpIuFt9o3byMpL0kQObYnq01GMqZlCark/aHnN58GseMnoklUSDUplNbCYzUytx3py6GqNu7q3fU44a3XpE2Ky3M6rlcfWJCX/WPlObgByPT0KC6Hs3AkjX3UhyrK66Gm3p3GlnbVcQDXu0m2HujKnSGCdCPvlUkZits79Q8RZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3IvQ1FXSm1WTjcxQ2IzNURjdVc3cFBpOFl6cUdDSWNReTNBQUwrY0ttd3px?=
 =?utf-8?B?c05DQXAzMS9BdS85amxOdUc1Y1NUelUxUGZMVUFxSXBadTBwUEM0R0FkWC94?=
 =?utf-8?B?U2UxS1Z2L0Z1Sks2UUkzZ0pXNnBRU3ZRdnM5Q05NdVk4UjJONXNhNE91V1pT?=
 =?utf-8?B?UzJnTGU3ZGI1M09vRllZM1pMU21WUFErKzdJT1d4RHhVT2Z5aUg1VkZXME9w?=
 =?utf-8?B?RzR6VFB2cjkxQ3k1WVlrYmV3VzFNdHRGVko1NVBFZ2NaclUxOElzZ3dqUjJk?=
 =?utf-8?B?Q0l0THNXb0RSMDQ2NE1DRXZKaTNRellIU1Z4QTdJYVBaWnoweDk2eUlxRFJi?=
 =?utf-8?B?anZ2aGhoNElJcE1XRkZKK1dHak5aODArQ1ZLYitQWlVyTDZEa1k3ZG51S0F3?=
 =?utf-8?B?dlZJNWloVndnQ29FSWVXQXVkUUNQdkd4UGpCTmRrUjVFOWVHcTM2TmhOZkVv?=
 =?utf-8?B?alBmR1c3Sy9HbnhlZmNPUm5HWGVZT2x4Y2QySXZtT2g1K290eGJ6a2tzRGhC?=
 =?utf-8?B?ZEZ5T3NqT1ZLNGJ1VnJYb1NkSVYzMDRvOXo4N0JGRlhNVkhBRmNWZ0RoWXNj?=
 =?utf-8?B?M1QwNlhBU04rdFJGQjBlN2tJbTBTck8zRml6Y3hlQXg1aEhYUjdIODZENEU5?=
 =?utf-8?B?aHNwUGNBSk5PWGIzZFNOZHN1NE9qeFo0ZlNFVnVnRzN5MlQydWZuTUFJYllW?=
 =?utf-8?B?aDN2OU1nTGdFUmVUR2NLeDltWVI2NjJodk1vT0Z2Z04rSU9MeW1pRURZTWxE?=
 =?utf-8?B?QjExMS9lU1ZlTXRoSkVjYTkzRUhoZE5SYWRBb3pIclFmUWo3S3dGd21hbGxN?=
 =?utf-8?B?eUNrK1o0RmcwbGV0ZG9GSDZ1TjFKN2kzV2pKLzltRUhVTFNLeE5UOUJ4OHRy?=
 =?utf-8?B?QlRsMUxFMVB5bjNJSHlOck81bHUxRUJybnV0aDFnaXNWenN4RDJVaXdXMTJy?=
 =?utf-8?B?d0tzc2lZRmt5aGdxQTlGWDBlMEYreVpiUkxjUmVHOEZLSnc0dXZVcU93dlFV?=
 =?utf-8?B?OEh1RTVBU2IvYTlLdEpWZEwwMVU3WjRqZUp6WlVMaGw0cmV5YkhBTmNUVFpa?=
 =?utf-8?B?ak44cnFTZVZPYVVuOVc4bGtTR3NDWUtRTEtSNkpPY0tXODRRODFMUTJra3Zr?=
 =?utf-8?B?Tjg5bWxNaWdEN3RPWStXK2hINzZobmxUTitGK1BFY0t3bVVsdy9lQW5iR29X?=
 =?utf-8?B?elc2MkRxRHBLRWtkY3hLUzA4aFR2b0dZc2FiM3RFdUQvVVFOd0V0MWFhZll6?=
 =?utf-8?B?YTV0aHBma1p1TU1oeVVGc3U4dTFwTHhXUlU1dk02U1gzSzVDOWVwZTFNcERM?=
 =?utf-8?B?VUtVWEFQazlEaEhiTThPVUlDWTF1dXczODlVZUFGbHZNYjJBS01QWlplLzBD?=
 =?utf-8?B?OTJNUzVoVkFWNjdWQkNjZ25RMy9XeXNtUmJ4SmRZVGJUNDNJSXhvbDRremtU?=
 =?utf-8?B?NFk0WTJHMktZVTdSS0RuZVVtMTNYaDQwVy9Td09mSUJFSk9GaXA1Z291ODdk?=
 =?utf-8?B?dHZ3NXhKWWlaNFZzWGpkQWR2Vm5aSEdETmMzT1lhcWhjZGp2WmZJUGpWa3dS?=
 =?utf-8?B?WHNiUUN3NDF2Z3VNa3p3OWxrUFgyVk9WdG4yYXJvT2JLZ0drN25nOSs2RE1G?=
 =?utf-8?B?ZzBwZTRSVnJ2L1NBM1QyN3ltSWVsM0dVMnJKTGN5SHRtNGhvM3VBUmtibzdM?=
 =?utf-8?B?ZHVhTzFBMDQvWk1vUWF4WnQzNFNMKzd4Z0dib0ZnRkpaYXQ3R0k5UndQSzZz?=
 =?utf-8?B?a1IxUkE5MHFwcUhvNHpsT3EzUEhPcEltNmhGQkc2V3l0bjM5VVBBNitrWmln?=
 =?utf-8?B?SzBCQUNwTFAzNDRDbzZhWGZrL2sxcG1aZFEyY0tvQ3JzcXJVTW9JOUE1ci9i?=
 =?utf-8?B?L0lDUG5GcXVwM1h2ZkVpNEczK1plTlhtbjIzRFUzNzByWXZ4bFBEVHgwa0J1?=
 =?utf-8?B?YldTb294SWRKeWVydzFMN0twT0lQRTMzaHM1dHBFeC8vMG8wdkh2Z0tEMUhY?=
 =?utf-8?B?eG1FelQveVZQbFNlU3JTMFY3Rk9DZUljYnpvUkFtRkc4WVFmbmQ5ZG5RNHFz?=
 =?utf-8?B?RmtVd1ZiL2V2OXhkd2FFa2J1SHErQ05SNDJWOTlsa1ZUSE8wZVhudFNFL1Nm?=
 =?utf-8?B?a1VpNGZ5WXB2Z0t1cmRqVXBXNTVTc2RQZlovSkdpTjV5QWJJNVVJSi9LanFE?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4d8e92-1619-4ad5-5195-08dc3a0287cf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 15:16:12.3374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+IFX/gbaIstSQa0WAgkX1nnQqucxfyGfubY6I2xckUGHyUaWB59tNTjaLKOKySc20jidjyFaA1ReopivmYt/FVGcB7rQpEr37IFDgyufb4=
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

Add functions to read/write 64-bit values from MMIO

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 lib/intel_io.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/intel_io.h b/lib/intel_io.h
index e39384ca5..e8dfd930b 100644
--- a/lib/intel_io.h
+++ b/lib/intel_io.h
@@ -79,6 +79,7 @@ static inline uint##x__##_t ioread##x__(void *mmio, uint32_t reg) \
 {\
 	return *(volatile uint##x__##_t *)(mmio + reg);\
 }
+__ioread(64)
 __ioread(32)
 __ioread(16)
 __ioread(8)
@@ -89,6 +90,7 @@ static inline void iowrite##x__(void *mmio, uint32_t reg, uint##x__##_t val) \
 {\
 	*(volatile uint##x__##_t *)(mmio + reg) = val; \
 }
+__iowrite(64)
 __iowrite(32)
 __iowrite(16)
 __iowrite(8)
-- 
2.34.1

