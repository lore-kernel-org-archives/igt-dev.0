Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB1BCD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 12:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F85A112A60;
	Wed,  3 Apr 2024 12:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwOTXrt7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A492C11268A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 12:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712146226; x=1743682226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GffmmAGplS7FJRLnE4To/lwDF6Tn2yHXa5Re3D9Xfog=;
 b=WwOTXrt7k+x6+YrAKo2xotYSLDqLcPoZMvHf+gw2uFLhxP+7VajwyXln
 a0zD6Sl85qG3Rx6ZkUgjcP4Bb6+JbGZq/0Qot528rEt1hEHMQyMOS8GM1
 k122eQFhTDaVhnGLKB13nQx1Nkz714FA6f672n3txY+Im3Cxm69V/EhDY
 cODemNeKC/v4viStedFAgn7MmMNCarMqTPmGEkPjBqWFz2ecLKR1HP0Qg
 FlEQ1RocgxRIQzr7GiP36Jc2sDAf7HflnOoIILHRQcye4zrOg0eZ35EzM
 rcrABqICifG2p+DvACzbZak95rXxg8BvIprH8fEgYkuuceIn1TMFT2sJ/ w==;
X-CSE-ConnectionGUID: IMecuKJSSn+SajvKFo+SRw==
X-CSE-MsgGUID: S6k64k32QLyoE0EKMR8HAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11147369"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11147369"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:10:26 -0700
X-CSE-ConnectionGUID: cr6ZkIuLThqu6izaH9pFjg==
X-CSE-MsgGUID: 02bxXuO7TDqoJ8Ek036o3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18857763"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 05:10:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 05:10:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 05:10:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 05:10:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 05:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFeunSmPbONy7GcfRouQmyUosQVFIm3Xd4vciWdX6ZrJzoQkg8SrbstUWCHH2mn1d8hIU0TMZhmBzfA8sNa2Uusq11oSpfAzSE3eSjxAzWuXDh7MVJkf8/9CREISw9mmLADhgWKcmYuIalya72uH7gIOMB063xNFkR+JnI3CV7K5gbJnuRkEO14SV4jaDsy4m2XKEgo2btnMRjIym4Hq+zdRXqkOFjACsQ7Upq/SmJqF2UQ6dK48fBwvHpnU7q7kefa4t56Jz7fHY427qI6VLNjvXWzRor0E/FTBIrE6nGyHqcMv4o7q9FqJt+/cUan1anqWKmTs+1BENT4XxvOA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0ylMerBsETJ0cvwqMpX+R4SSE+ga4+1IsY8nrD0wLI=;
 b=Etq4xVOnSZO25jp9+4hqD0Cx3bx4acJ4KG/UaQnAB/N/lf71siPqwPdzNvend/84QipfXE0u/B7hN2oDOUGA2am4oxypQONU3V3orzpG1GGo7mR1Bvw4PkzRJlmvn3EopbOH7rvdm5elyunF83zGfnPCH74+qO/r7k87T5sTeaQcUBHr1aU04NGdxYQktuINNvT5frw5iVk8G4XrjyVPrzbQekC9VdeZlblhhC6U0VNfIGO36OgENla+Ztqefil5mMeppwXRvvg8eav2plczDs4I5TFTZ4LmmAdPocwB2gc09VWfLWOsg2fyBZXyFsRqhG8BebFBgAHtbJGwaVNVIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 3 Apr
 2024 12:10:19 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 12:10:19 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t,v3 1/2] lib/intel_mmio: Map the whole BAR0 for gen12+
Date: Wed, 3 Apr 2024 14:09:54 +0200
Message-ID: <20240403120955.4070545-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403120955.4070545-1-piotr.piorkowski@intel.com>
References: <20240403120955.4070545-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB7977:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kOvQM9cPlECCnimLUj/SF+kWWsPG6kHmh7NDSLcaeTQ+z21d4fckBB0r5wOU2BITjGFr0UfTOMoD3uCa9Ags/Wx3a+c2/QVlsUmUk6I5s5CbHBnLUcdGhULGzdS5lhGqAvIpZSxYr3bshBAvrTZkZ33ghRe3E0/98CasWAAdBYpgfmbyEQDoPNP4dmnrAJndP+WPNYNFrZ57g4FZ/5YcR7vPYEjZCVrraBGkj1XtEdI4kjJgVKq5MKMDOxV0y2G49E2uX5tbV8qdez8pCIt91Nh5UImDsX/Yp/J1pvFrjaoQG392oUHm+Kg6MSrGUku+nY76aUL17bS72p8D3ufFVKCRtk1gvjal1v1UctZ490neL25ELihlXPNtwMxpHBEv1f3sx99cbPnfOP/cLLlOP5s7mBcILBnjqMj+KEcQ+UleO7/Lqky/GExwlDMJaqWHrrbos4WgN5dPooCmJ/eRTiG+aJRbxJGwL8w+GZlsth1M2PzG+dVjEOlbIYsYwFLMF077+ii+E3j6kXph5u1NYjqI1K/Ya6QaSDnXr+KPt3mL8PXTSB4+SV1WK6BP9I3fcyUmgHf1lQ425/HA6itNyWi26C1ynVzb9iDgawF4sqFblMKiqdVH75jfo0aG5+x03Gl64kur66IqHlVzBNeHzdHzx1nw8wbf1NrZnPf74gc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mlk1N2wzTVEyRWtXN0hSK1FUbGxxRFJMRXhoVGtjam1uMFRHakEyMy9VMmlF?=
 =?utf-8?B?OTRrSnQ4Rko4TldneVY0QmdpeDNGNzdHM3Vsa3p4R0NMNThaREJ6VldyR3FN?=
 =?utf-8?B?aFMyM01wTkswYTZGUjhNTVY2WVgyN3pPMllmbkh0c2FKS1oyNUFkaVJnZFI2?=
 =?utf-8?B?RUlLVlBlUDMydklTdE5UZ1N5clJTbzdMQWVaNDdiQWhpRSs3ajZrNENMSmdB?=
 =?utf-8?B?V2NtM2JBRUcwaTRWT1hhWVhoc1dxYlE1a04vRVM2M1VRTXlvZkFJTFVGV09V?=
 =?utf-8?B?NVJBd1lJQm1JbmZyWFZrSm9jMk42WXBrZGwyU280RE53OG16MDk2aWRJYmtp?=
 =?utf-8?B?Y3BQcXNxSTBmZ2t4ZDZyKzlBajJqblJCYW95ZHZmNkI3aFZLK1VrYjcrR0NO?=
 =?utf-8?B?K0xDYm1ZYmJtT1lWNzhZTzVBNTczeTZpZ0o2dGRkVkhwakUrdzl1R0xWYnBG?=
 =?utf-8?B?d1l4M1pIb3VqRlJmT2U4dUZQOEV6eXh1Yis2WnV6L3FkbGJwSlBQVGN3eWpH?=
 =?utf-8?B?bjdKeDlrN1ArYTZmVzlGa0dydWh1dHZjR0hIa3R4RnVZRGZWOU5RMWk1UVhp?=
 =?utf-8?B?VjdHYSsxdFhpN1JwT2hoU05udDVFcldyTk1neUhWb2J2OGVoeGMwLzZnTkNh?=
 =?utf-8?B?N2pNY080Y1RBenk4VEJJMDJsekhxbTRNeDhSS1dJOUVMckExZVZYajFxYkJa?=
 =?utf-8?B?S2RiaFZBOWlzV2lzN05YRUc5aVA0K3FOR3cyMlZ3NTlWV0NyRnZOSVp5R0lH?=
 =?utf-8?B?ZjhzVXR1RzZKL1JuWjk4NXFNcVBJeDdTUWplUml4N1RzVDF5b3RUc1Z0QjNu?=
 =?utf-8?B?bmFTRnVvUzlGOHlTOGsrQTJha3l6b2Rad0NURUcwcGQ0SEZ6Vmtaa2NpTDl0?=
 =?utf-8?B?b0JwOHFaUk5NQ2dYL1BidXFBSkIyWGYwQXg3em1PMDEvdkY4NStmUFhjU3dv?=
 =?utf-8?B?OTAydXo4bFZSSmc5TmRCWUwzS3kyK0N3SStJWkF3dFBiS2poeUVtc3JjS2t2?=
 =?utf-8?B?aXM0UEF3eTg3V3M3ZEpBSkVQSmpkNWdqc2lDY25pL3YraUkwbHVhNjJuNVhK?=
 =?utf-8?B?a0dTUVh3QVVubCtkMDkrQmVWTEVwU0lqcW1rY2NqbnBXZG9ubXdpTlNsVVgx?=
 =?utf-8?B?a1pIU2JZNUthanBlVFFPUnQ0MDF1RXkrOWZ6YmdlT01yU1ptU2lCLzd4bVBl?=
 =?utf-8?B?VHoxRFlmWC95a3QyMVhCMDVCUlhsVHY3WHlIRmZJZTI3VkFsVGMxQ1dmQVVU?=
 =?utf-8?B?Q3JPY3o5Q0pkZElpWUZBeFkwMFFwUWQ5bXpGbDRMTWJPc0hLVlZBZzEzSkQ4?=
 =?utf-8?B?SVRqNmNqajdpYzFXbG1BdWtPZjIxaFpTK1BmT3V0UkRwTklhekZqUDRqdXdY?=
 =?utf-8?B?U2s0MHlicnh4SXlER24zWWpzTk9RK0MxaHNPNjZWWGk5UGlEK1JhYjlMYUJJ?=
 =?utf-8?B?Uyt3dzlQcktQQ3FjMlFQdHZNcmRINE5IdU15MjFJazJuOVNwMlZOdDN4Kyto?=
 =?utf-8?B?MUNrbjV2dncxZmJhTzY4aUJRazN2aTdXZ1I1NEdDVWlBM21lU0ZrUnRDNnRR?=
 =?utf-8?B?Nm1oeE9JZ2hIRGN5OHhIaGFGSDMzWWQ3MmlVZmdrMTU2RUF6UEwrOWNwL0hh?=
 =?utf-8?B?N0pNU0xQckdQMjZQdGd6S1NRTWdGd2tBR1liYTVBdDFsVWl2MUJoL3NscGVs?=
 =?utf-8?B?VUFXeTJleVM4MUdUKzhnTDQrS1NWMUFYYndGOUFQcVFvS3MzL1lrcFIxZmRm?=
 =?utf-8?B?cmpLSzhjMjd4TTJITGJKYWNST08yQTFldzg1eFdqa3JGbkdXTWgrRDE0UTFM?=
 =?utf-8?B?NUdDbXlZM1RYb283cHBPeTV3YWV3dXg2TjlBbHNKM0xIWmpycnZvQ3pja0tM?=
 =?utf-8?B?c1pPb05UbW9YV25YSG1BbTlua0tMUXpTVDhTWG1sODJNdVdVeWJnUDdCcTdK?=
 =?utf-8?B?dzZ2dzBnMjl0WitrbXBCZ0Y5bEhnSUxVaWk3dmF4WDg1ODNJUUlQUkJZMG1W?=
 =?utf-8?B?K1VIZGNTRUlZYU9iNGJuelQrbzZjYU84WXdDeHJkZ1VEOGhkVmhvWXRtRGtC?=
 =?utf-8?B?UlVEZE1VSm8xbm5kZXJyVjJ5dGdnSWI5QTdhbS9NQy8vSTFhOUJ5eXRaR0pN?=
 =?utf-8?B?MklOTi9BRFNoY0NDZkh6dnN3NURrZ09zamNSUDRFUzdrVXIrSGVHZnM0K2o3?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc864d14-8237-4918-9f49-08dc53d707d8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 12:10:19.5505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xo6RBOWDliEB9Qsi0iqZIiAlDC9/WCSA1ao0u9OtjvwOaPyiNAGwr5zOqL/CbC9+Ore8KETP42+/EFexcOTynAfULZHB5iOy4QQLhyNXquE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

Previously, we limited BAR0 mapping to register space only because of
the potential conflict with wc mapping for the GTT region.
For gen12+ platforms, the size of BAR0 varies due to the different amount
of tile.
And as for gen11+ platforms, we can already map the whole BAR0 as uc,
so let's map the whole BAR0, without artificial limitations.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/intel_mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_mmio.c b/lib/intel_mmio.c
index 4b6820787..31975727e 100644
--- a/lib/intel_mmio.c
+++ b/lib/intel_mmio.c
@@ -154,7 +154,7 @@ intel_mmio_use_pci_bar(struct intel_mmio_data *mmio_data, struct pci_device *pci
 
 	gen = intel_gen(devid);
 	if (gen >= 12)
-		mmio_size = 8 * 1024 * 1024;
+		mmio_size = pci_dev->regions[mmio_bar].size;
 	else if (gen >= 5)
 		mmio_size = 2 * 1024 * 1024;
 	else
-- 
2.34.1

