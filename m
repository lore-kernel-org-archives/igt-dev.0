Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D217CC369CB
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 22:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C1010E283;
	Wed, 23 Apr 2025 22:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOs+6ov3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F52E10E283
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 22:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745445769; x=1776981769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7ioa/UsI0lZfFOzwz03lDRh07wE3kuViz6FnjJT8+4c=;
 b=QOs+6ov3yUHPLVqwnrvdpE9OM4+Gn9TsOcgIwaSZEWmnhrvq/TsYzt/V
 3cjUel6HvnFtgtHVqJIwbrBZE81dHZirdH3urKWi/pmm6BFxHEP65Vj3d
 C8n9q9YIqbMpMPZlTwPdhL5h7m5giZ8nHz+uLo/tJtJxzdq8nbWYu2P38
 LPkx3fxsy3UyP7lTBANU9Tpq+Asb5s02Mvy1mceoIXwpJdThvIFr+Vk+n
 F/CdM1CyH+7C91dW14wSSJO2Smglgh3zo0FiYDpUZg/2UdaTconhvX3yT
 VKKnfkls6WClGmfGLuXxDDlaq8Ku17LjIrSC4epA55bs3Np07fq2RvQkL A==;
X-CSE-ConnectionGUID: KYQXR2zbSN6TxbmaSfV0Wg==
X-CSE-MsgGUID: KEUbSperQcebxBcUSSG4kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47073629"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47073629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 15:02:43 -0700
X-CSE-ConnectionGUID: +QVQA3e2RzGVfZe3wczSZQ==
X-CSE-MsgGUID: lMov75VbSI6kXj1IcZNdcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137225666"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 15:02:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 15:02:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 15:02:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 15:02:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6OjIZsFaqeHP/uKT+fk9vBKDhHjW6OzIQrRfD2lzCxA6HSPFPTXGoj54DkSlEExUHrJIjJ7rtbrndzTrINVUNzf9H0EibpgC9nBVVbjnnfhEcRFp3/pIfHJ94t1pGEJIAe//f0gIpkLLdRiiL83AsNV0dW3YhhBNupBMxYmNfpKMLEeH4sfmawrezP4aBdOfveLMcz83HCugroxA+1AL7adqdfYHsXWmQC73HaVGAGQeHFWySa//N1/Mmib1glGByQlmSn4AlTSUPQjNV3YyRP2RUnWONHZUAdKGHqyYnFkS2LdXgbRjiYsH8Bk/mIv4KjS6Da07wd5VXv5FVjUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlZ6lO2afDXBRk+q76GpAZReg/FrMI1BkHVI1KNkHcY=;
 b=CvrL83PoJ0IS4ECvTLJMu7HdMqZrBtpSAKknU9t4KCbqgJl3+S5KwX+/3u5WJFwKvIS7YYPYCzESbeM6SFqnDnTVX3eZOydJ/78TqCPs9bq1cXrliNBWKWlQTh+FHN8GiaXsanynUI4NvT1qsOs4J4L16YJHX9CnrfQ3LojEJjUqKuaEoY06/Y9hOW2uhvdi52Gypukfa1VC0raE7aw+5JpeSf/UgNAa8q+YFhlYhsvuqZR2/6P9VcItIhleghwSpf7EnfaggSBzkD7RgKHCaM79kGnEB56//cg0FiYHheklxQFEF/dU0sj2OQOxj6dCiBOR0wJqg28b5FveUjJFEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 22:02:37 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 22:02:37 +0000
Date: Wed, 23 Apr 2025 15:02:30 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] tests/intel/xe_eu_stall: Add tests to run blocking
 and non-blocking read twice
Message-ID: <aAljdg7bjcW9Fbbl@intel.com>
References: <eef990ac70dd804c500c31d801e7329a364cd6fd.1745376823.git.harish.chegondi@intel.com>
 <87a58623sp.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87a58623sp.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fecf000-525e-4c8f-276d-08dd82b28ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTVNaElSdFB4dTdXc290bGdDblNXWnB4RmNlcFk4M3I2bTRsWGErNDU4bzFI?=
 =?utf-8?B?SFpXbS9lQmp3YWN6QzBYbjFJU0g2TnBlV2w1SGdkQlcxd3lHRyt1ZEFqOFNP?=
 =?utf-8?B?VW5CLzJIR1JZaWVnYW5UY1FTTHpmNXFIdk5sd1NTakw0UjJmenI4endHazFo?=
 =?utf-8?B?b2FJS3habWt1UWhoSUNGeCtodWR1T1Q5dzhZbFNTZlZraU5yNnl3cW9ueVFw?=
 =?utf-8?B?UytIU2IxdWQ5Qk8vbXFGaGptZDRFYlpSOFBmWk9VNW9heWNCRFU4WmFPeFV6?=
 =?utf-8?B?MUhhVlBzTVpITG90bXFoN2RoazIzZ0dNUXNQc054a1MySDIwVVEzQlFPRkMx?=
 =?utf-8?B?MGIvZHR1TjdicFQ5NFlZSlBSUFR1dVFiV1V6bXlrWUF1ZnVmRWlKaEJXTCtO?=
 =?utf-8?B?ZVBmUTVueG96aEZPQzJUYWR6YmZENXNiMVREZEJrQkpQUFpZUnNsUVRkcXhT?=
 =?utf-8?B?MFFKRWgxaDd0cnIyY2hPM3VvOFp3WDNNalJ0OVllY211VWZGWUNmclZVcDV4?=
 =?utf-8?B?bDMrN0V0NXp3R1lFalgzZTJYdk9SMHlncHJqTnZzWThpZCtWR1NHYXlWUG0v?=
 =?utf-8?B?TzN4bXdTRjN4ZW4wZm8vSyt2SE1qNUdZSUw2cTlvUnBFWER5VmhxdHBJUGV5?=
 =?utf-8?B?ejVadGtWNGNzalpoazRrOTVoRW5QN2d3ZUhEYUthSTRvbGlCSEhodHFVS1Q2?=
 =?utf-8?B?TysxMi9VbW9tVXl2czF6eGRrTndQQjk4cWYrM2pWYnk5SHpPanNDY3prQ2Zl?=
 =?utf-8?B?OXdsc0twT1BvR0NEZ2puQktLdGU0c0NXY1I1WHBuZDk2Sy9tRFcrcVpObGtY?=
 =?utf-8?B?bnc4dWJrMmdGQU41UXlncUNjNlVPYlJqUWo0ZUZUaEx1MU85b2JTS1gwOFkr?=
 =?utf-8?B?YThma0J3ZkZyRTN1MzcxSU1uV1QxN1d2R2JweDRITm13RC9PeXFrVUFsVytR?=
 =?utf-8?B?TmFubUx0Y1JPQ1ZFMkc5NW5YalpUVDhFZVZ6SmQ3aWpneEN6bVV5VkZhRVpQ?=
 =?utf-8?B?WDlxUUgrbUZhazNVSVhnalB6RTAwNWF0SVRwSU83QlN6RXRKSGlLOUY2VTNt?=
 =?utf-8?B?QW95c0hZZEYvOTEvMW1zK0t0b0ROZ3FlK1ByR3M2K1ZFdmRmSXZ4YVhlQ0s4?=
 =?utf-8?B?MjVENkRzL2JaL25UaXVDMjA4VWZSRHhFY0d5anVxcFBYTmpzdFFFc05TTkJJ?=
 =?utf-8?B?R2ZJOXNUeEUwNnREMDRSb2ZoMVNXSmVFMEdFaExjSTk3ZnNwTmt1RmZOdHN1?=
 =?utf-8?B?cVZESXgvYktVZkVEdmhjQWlVQzJMT2pzQ2lUaHYveDdqSnF1a3pTNTE4THVT?=
 =?utf-8?B?UWhWMVRrcDRJWmZsT3E1L2Fwc2d4THFXQ2JyemNBSCtlNEgvTXJIQTJraGIr?=
 =?utf-8?B?ay9WeEFUK01jdjhHU0k4ZXQycUVYdG1BM3N0MHdyc0NqZjFuZVdqdDFiU2lx?=
 =?utf-8?B?Rzh1VUhzL2NQZnkwZlh5U1JLbFJ2S1gzaU5qYTRkUGRha0Q2OEM4M0twa3hx?=
 =?utf-8?B?Y05aVzlSUXhNTjlsWXlxdnRZZ3BFNkMzWFRlRjBzNlpvdmUxQnl1OGxMbUxU?=
 =?utf-8?B?VTd1dnYwOWxWQ0ZMdmpPeWtPUXhmblMrb0JkYURST3AvUEdpUy9HYnNHRy9O?=
 =?utf-8?B?YkMxcFZpaWNXczBGdWhPV0orMzZiUjBucFNnVStkOGNWbFpkS0cwQk8wdnRW?=
 =?utf-8?B?YVFKNWY1cTBrL1BCYXFYR3hqM1Aya2EwbHVicU53UHVua0tEaGk4R05qdDJ3?=
 =?utf-8?B?T3k4bjFJZTRJUTl5WTk5NFdlK3NUK0pnbkdxN2wrMmhzdUFVbzc1akJRYksr?=
 =?utf-8?B?RERWckVxODJEaldNWXR4L21FMjhHMm9OUGh4cEdjZDRreTVXS0IvclNkTzZp?=
 =?utf-8?B?ZHlZL1V2eUNQdUtpTERtYTF4SnZGQlRmTzZKcVdQcWpybGhKU0FPZGt3WTdL?=
 =?utf-8?Q?4Gt4KfgZKtY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzVqZisyQmZrZ3NidkZ1V2RvQis2UlZ0QXpadEJhTnNkZGZBbU5ZdUtZUjBs?=
 =?utf-8?B?eEMyblJEaGVsVmJjTlE4UTVzZEhUam1CeXd1ejczaHp0QlgvK0Z2ZUZNcjll?=
 =?utf-8?B?ektUMEIyMlRZVDhTQ2FYc2dLd1pYeWxWckZBQUhtYmJHV2hjeDdTRVEybHA2?=
 =?utf-8?B?TGVhYk9LeGluMUc1TXFlbkVMSGk3REYwQ3IyaHNqdllnNlZqUElUaVNER2tC?=
 =?utf-8?B?Mzl6T0xSL3VWanN2VXEvMjVlOHZHaitReTJvYWYwOWRJdDVZc3Zjb1BTUzZU?=
 =?utf-8?B?MVJKeG8yb0hVVVozQWhtYU83YjFQWTJZUDNXcVkvaE9WalpiVjVEMUhMV3hw?=
 =?utf-8?B?cTg2L3dQU3NBeVQ1d2hsOTgrK3N1bFpadEEzK0Q3OGl4TlA4RVh0WFZITFk0?=
 =?utf-8?B?eFlXSTA5ODBSN0drSW1mckw0RDZmZEJlRWF4VnY0N1ZDMWxsZ1ZWNjIyM3cy?=
 =?utf-8?B?T01rMjdob2hLNjVnSEoxY3k2L2dEcGZLUEFYb1NiMWx6RVB2RXMrM21ESXlU?=
 =?utf-8?B?YlErQ0t0NDZjZlRadmJ1WVEwVDFsT1lQRm1DVUxEYy95M0d5OVlOcmxQSlRW?=
 =?utf-8?B?M0hDMTZWOTJaYXQ2dmlLdXh3ZEJPOEl3dWhSb01yUFdYZTRzc0JlV1liSGd0?=
 =?utf-8?B?UFRuUXNqa0ZuMEt4akJqNFdEMlNNTzdINmNRMmpXL1EzUnRBTjNSbGljZEd2?=
 =?utf-8?B?QmVGZExRVm5qZElFdllnSnJwcEY3TmJnaDlFR3NDdFlkYUNFZ3gydnRvVVNv?=
 =?utf-8?B?RldOMjdqV2dEM04vSnVKaGF5djlwMzIyelIzQW0rdXVBR2NwdlFrWmRUdWl1?=
 =?utf-8?B?VVFpL2EyRzNpMW1YcCtxMWxadjBIaHFJUnRONlpOdDY4UGZVVUN0MDFlalIz?=
 =?utf-8?B?Q2NqYWR5UHdZaXhDUnRNWXhZNzg0S0ZYL1N2VHpWbDZNRVI3RnVyWllaa0Fx?=
 =?utf-8?B?WnFqMTdBWmkvMHZHeTdHY0hmSlVFNnZCVExRc3BsYzkyMVVYV1d5VjNxcm02?=
 =?utf-8?B?UklYK3hScVpSV3o5cjJ2UEhES1NBUHpMK2krMDFuR3VqSHgvTW5tVS9ZaFBI?=
 =?utf-8?B?YVhWZUQxRW9sRE83N0drTFMvcHVWaUNkdWhEVm5ZWExFRDBTdjZSWEt5N1dz?=
 =?utf-8?B?b2hRdzh6S0FnVVhvMktWMUw5Q1E0dGRKbS9MZnJPaXVaRE56SzRKSDlQYWhM?=
 =?utf-8?B?M1MvTE80N3hLcis0S3ZrV1FySGZ4ZGJvQTQwcUliN0lteEs5aDZJa1U1R3BE?=
 =?utf-8?B?bFUwUkxpUHZHWkx0Y3RmYjc2K3pnMkxhakF6S3hSRyttVGUzblNjb29McTNJ?=
 =?utf-8?B?dTFuZWQvUUtYWUwvV2V1VC9BNXdtSXdDVFZEajFEWGJTNnZmSlFVYUxmeDRY?=
 =?utf-8?B?c0Y3NGZzbFlEMjlJL2dFZXVDSFlnWmNIUzJVa1ZCa3J1bmw5ZFNjODI5YU5R?=
 =?utf-8?B?dkN6aE8vNkVDbzhFdFNQZTRyMDUzbE9yd3ZPRW1mbC9YQ0JzRDR3QzBDL0Ix?=
 =?utf-8?B?NzNuK3lOSWFWTks3dTJ5UVZXWmpUdy80TDJJMFN2UCs4TnNhZ0xZOTd1RFVX?=
 =?utf-8?B?Qk5Jd2diQmNZRGNqQ21vV3k0ZDF2cktMZUwvbjM2Sk1scEw5eTNhaFpZNTJa?=
 =?utf-8?B?ZUluK2JIZGhWS1Uyb0ZnNi9UN3ZhN1d1MFY0YXJUNm1UVE1MUTVyNVVCZFpV?=
 =?utf-8?B?MWhpYWJFZjNkQ0ZITUdheDhjY2ZJNlRNd3haVWlQZnNWUkEyaDlLVDFQL0ZV?=
 =?utf-8?B?U20zeXJtaUNJeWpYenZZWnRNbjYxY0l1REFod3ZaZ0ttWjRBZk1lOE0vc0xN?=
 =?utf-8?B?UEJLQXFUQzIwSGd4YjhTWmhiT3ZRMjkwczBVN1JQeGNDWHJWMkZBN2wyS2pw?=
 =?utf-8?B?RFVDVDZheW1nb1JiaWkrSGJDUkhyNW5aQWxDUHpGOHpKb1JmZi9KUkZwZE1u?=
 =?utf-8?B?ZUZsS3ppYlJpVHFqUjUvZGVPSHI3YUVmaVppWFM3WmlmdGl5blh2ZE5SQ0lj?=
 =?utf-8?B?dDk2djdtUERBTWgzL3NWRUIxL2lRbkIwN1FMampGU3FWRUZTY3BmS1VEOGUr?=
 =?utf-8?B?cS84UHliUUV6UjBBOVdkdm1KelE2UWhEcjFOR3lhdW5NajJXVEFQVHhmRkFu?=
 =?utf-8?B?MXhiYlhPc0VmTXgvOHFQbXlMVlVaV3R2VENSMUdYMUEzMlBNU05pRUVINS91?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fecf000-525e-4c8f-276d-08dd82b28ed0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 22:02:36.9512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCoaBkmyDWB5/xrL6gUGls9WfAuPayBoQHAZKEP0qHthPHRdytnwPPayLuZZ4Y8/A5mA2LTKpHreVicpYaFKiVm/z3e5Sb/YHlzriCJoMoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
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

On Wed, Apr 23, 2025 at 10:20:06AM -0700, Dixit, Ashutosh wrote:
> On Tue, 22 Apr 2025 19:57:34 -0700, Harish Chegondi wrote:
> >
> > Add tests that enable EU stall sampling, read all the EU stall data and
> > disable EU stall sampling, two times back to back. Add tests for both
> > blocking and non-blocking reads. Also, add a check for the presence of
> > /proc/sys/dev/xe/observation_paranoid file which is required for the
> > unprivileged-access test.
> >
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  tests/intel/xe_eu_stall.c | 44 ++++++++++++++++++++++++++++++---------
> >  1 file changed, 34 insertions(+), 10 deletions(-)
> >
> > diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> > index da9bd7843..15d4589c6 100644
> > --- a/tests/intel/xe_eu_stall.c
> > +++ b/tests/intel/xe_eu_stall.c
> > @@ -14,9 +14,15 @@
> >   * SUBTEST: non-blocking-read
> >   * Description: Verify non-blocking read of EU stall data during a workload run
> >   *
> > + * SUBTEST: non-blocking-read-twice
> > + * Description: Run non-blocking read test twice with disable and enable between the runs
> > + *
> >   * SUBTEST: blocking-read
> >   * Description: Verify blocking read of EU stall data during a workload run
> >   *
> > + * SUBTEST: blocking-read-twice
> > + * Description: Run blocking read test twice with disable and enable between the runs
> > + *
> 
> Not sure about the "read-twice" name, i.e. not sure if that name clearly
> communicates the purpose of these new tests. The purpose to me seems that
> reads can be done after a disable and enable, correct?
> 
> Maybe "blocking-enable-disable" and "non-blocking-enable-disable" are
> better names?
Yes I will change the names. How about non-blocking-read-after-re-enable
and blocking-read-after-re-enable ? This would convey that the test
would enable two times and a read after the second enable ?
> 
> Otherwise this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Let me know if you are going to change the names. Thanks.
> 
> >   * SUBTEST: unprivileged-access
> >   * Description: Verify unprivileged open of a EU stall data stream fd
> >   *
> > @@ -33,6 +39,7 @@
> >  #include <fcntl.h>
> >  #include <poll.h>
> >  #include <sys/ioctl.h>
> > +#include <sys/stat.h>
> >  #include <sys/wait.h>
> >
> >  #include "igt.h"
> > @@ -460,13 +467,13 @@ static void print_eu_stall_data(uint32_t devid, uint8_t *buf, size_t size)
> >   * while the parent process reads the stall counters data, disables EU stall
> >   * counters once the workload completes execution.
> >   */
> > -static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> > +static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int iter)
> >  {
> > -	uint32_t num_samples = 0, num_drops = 0;
> > +	uint32_t num_samples, num_drops;
> >	struct igt_helper_process work_load = {};
> >	struct sigaction sa = { 0 };
> >	int ret, flags, stream_fd;
> > -	uint64_t total_size = 0;
> > +	uint64_t total_size;
> >	uint8_t *buf;
> >
> >	uint64_t properties[] = {
> > @@ -520,7 +527,7 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> >		flags = O_CLOEXEC;
> >
> >	set_fd_flags(stream_fd, flags);
> > -
> > +enable:
> >	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
> >
> >	sa.sa_handler = sighandler;
> > @@ -540,6 +547,9 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> >			_exit(run_gpgpu_fill(drm_fd, devid));
> >		}
> >	}
> > +	total_size = 0;
> > +	num_samples = 0;
> > +	num_drops = 0;
> >	/* Parent process reads the EU stall counters data */
> >	do {
> >		if (!blocking_read) {
> > @@ -574,14 +584,16 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> >	igt_info("Number of samples: %u\n", num_samples);
> >	igt_info("Number of drops reported: %u\n", num_drops);
> >
> > +	ret = wait_child(&work_load);
> > +	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
> > +	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
> > +
> >	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
> > +	if (--iter)
> > +		goto enable;
> >
> >	close(stream_fd);
> >	free(buf);
> > -
> > -	ret = wait_child(&work_load);
> > -	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
> > -	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
> >  }
> >
> >  static int opt_handler(int opt, int opt_index, void *data)
> > @@ -634,6 +646,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
> >  {
> >	int drm_fd;
> >	uint32_t devid;
> > +	struct stat sb;
> >	bool blocking_read = true;
> >
> >	igt_fixture {
> > @@ -642,6 +655,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
> >		devid = intel_get_drm_devid(drm_fd);
> >		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
> >		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
> > +		igt_require(!stat(OBSERVATION_PARANOID, &sb));
> >		if (output_file) {
> >			output = fopen(output_file, "w");
> >			igt_require(output);
> > @@ -650,12 +664,22 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
> >
> >	igt_describe("Verify non-blocking read of EU stall data during a workload run");
> >	igt_subtest("non-blocking-read") {
> > -		test_eustall(drm_fd, devid, !blocking_read);
> > +		test_eustall(drm_fd, devid, !blocking_read, 1);
> > +	}
> > +
> > +	igt_describe("Run non-blocking read test twice with disable and enable between the runs");
> > +	igt_subtest("non-blocking-read-twice") {
> > +		test_eustall(drm_fd, devid, !blocking_read, 2);
> >	}
> >
> >	igt_describe("Verify blocking read of EU stall data during a workload run");
> >	igt_subtest("blocking-read") {
> > -		test_eustall(drm_fd, devid, blocking_read);
> > +		test_eustall(drm_fd, devid, blocking_read, 1);
> > +	}
> > +
> > +	igt_describe("Run blocking read test twice with disable and enable between the runs");
> > +	igt_subtest("blocking-read-twice") {
> > +		test_eustall(drm_fd, devid, blocking_read, 2);
> >	}
> >
> >	igt_describe("Verify that unprivileged open of a EU stall data fd fails");
> > --
> > 2.48.1
> >
