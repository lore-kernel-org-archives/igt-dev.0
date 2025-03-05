Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2143C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 10:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A9510E28A;
	Wed,  5 Mar 2025 10:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0vbFI8S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FFB10E28A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741170528; x=1772706528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hUDgZaMRkCQtSLYo55s6zsdDOXaCRd+MBFdKM3bcPE8=;
 b=f0vbFI8SYSWCXTjE27FQdHTH70EaHjJLoST90uo/TJXgBfsjQbKOVLtK
 CNeEvvAT2gczanTQInw9QjtH15JOmsWsEbe4ByfOu+dJ2Hr9fO2Ju5JDo
 L0f/obS3ZMQ3i68GojT6tqdS2gHdPR6orMJwLExNWkcsOpx3gzPjt4vy3
 vzZnfB9Rxyv/58XfBZi8BJtF36u4dj/LuuS1PI9fyTJd644xMELS3tsvH
 BDeMH8rETYn+eMn9GrMOvgLi1POLlOrBj4xT74G0imwTFm8DusblcS21D
 tOqUsgu4rrFa14UfVHagVb/ZOkbMOG9tX3rtNtlnO0bGmrTgCiwUTD+7H g==;
X-CSE-ConnectionGUID: ZjvyVY1NQ5aSXHD1LpHp+Q==
X-CSE-MsgGUID: r9onJX7VRUyUH48Jth2CZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42327419"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="42327419"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:28:47 -0800
X-CSE-ConnectionGUID: /mKXxMr2SPqOU+r8Z/6Lsw==
X-CSE-MsgGUID: FDx3vBGXTFyFRHKwnb998g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119562201"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:28:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 02:28:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 02:28:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 02:28:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxtjhHucVtPu9ahzpCLPXQNvEkHTTUAPqd/X6wtHC8iBDuB2gbj+mZ87xwq/uxbDTeBl69m1gvw2QZKQJetRFfQch7OdeQPY0d6W5JPQ5EZiYCDom/Q16WrU3BLhiTxzr6t0M6zw4uFMsT4sFFI3OIUyjDlmybutyGiS7jD10zgd4t1naoSH/vdL6diTBWP6LqTmLtxVwNKmxrSWsABngiTiMgUwvBAE5mUkdxcHLTfn3zMqtN1Oe2GvA8+0X1BdL752h9UrSsfw2GwOYMeeAYai/LOS+FyvyCBGHi/xnOJA23H9X0oGUJ20WNW2gHn6hzH9ORP833cNQVIrTaLwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPZ688ouFaaxFBWfGxVz0wHzNc2iLLL8+IbCFq9845k=;
 b=KVRKdyu/1VYxnyY75XTiTIA2wlHBZ7RFCSgdPqHKpt+Iq8s51IVZwXEtcV/OTBa1p1ngzMWiaSxx7nb8R/0uiAV0Mk27/rwlet1QWxRbNnPB0djTgKVmZD5kZyMMF2x+KEnVnAUeQhFlT7CkrNEDR66NvZyNS01vLai6vPEzub8wxuRf3f8DyLlh4TiC3glw+97Ue9YhWtc4n5+7fXzJqZoEiK+N+4Fk7H8z8jX2Uob2lzRhhZV7UwgGAAYFpggGKf24FL1uMxFXhoOVqKo/hR8XAzI0XBcSiIuw0IBC9dlrp8ZvBmc0B78qRAbi5m7+GHXG5P/Sgla+5XCXASZIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MN2PR11MB4695.namprd11.prod.outlook.com (2603:10b6:208:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 10:28:30 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 10:28:30 +0000
Date: Wed, 5 Mar 2025 11:28:22 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t v2 3/5] tests/intel/xe_fault_injection: Add helper
 functions to inject fault with specific budget parameter.
Message-ID: <Z8gnPWhK0seaPf08@fdugast-desk>
References: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
 <20250219073445.31423-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219073445.31423-4-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1P190CA0038.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MN2PR11MB4695:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a057d6-61a6-42c4-792d-08dd5bd07958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3plZ0N5WFR0ZkMyYjg1bWNzYWRhMzFidTRERnhGNXB0ck9SNzRvQVh5K2Za?=
 =?utf-8?B?TVdPVEdyTDhPd2xOOE94RVJBd1JWU0lCQ2JjSkN0T1E4VDVrdnVzbmpxZHl2?=
 =?utf-8?B?RE1SUnIvZGxvVFFuekk5d1dOclRCbm9OR3hhMzV6MlJZdGdUczBsaXlLakZ4?=
 =?utf-8?B?R1pROWRwT1NVSDZkVGFDekoycTVGbDlwME04V0VnZjZlQVFVektHdmYxOEhM?=
 =?utf-8?B?N1pHQmdOQ29zcTMvay9FWm9SZndKbnU4dFlwbXFCT1hlUDg5YVpBUVVINy9Z?=
 =?utf-8?B?RVRMc1dvOUZDTEN6aDl1a1lESlJwZWNQZW10M3pGUnBTeHRseDdkd0kxOG1n?=
 =?utf-8?B?SnpkcUhwaHNpTmo5MGpzc0NqaWRpUEZIdzRFMXF4VW9rYTRuQVRjWFBmOVpj?=
 =?utf-8?B?d001VVVYWGlHNC9tUUxNVkd2N1RxVGZBNVd2Ujg2WDFVZEY4RE41bjg2ejlj?=
 =?utf-8?B?QWFHWEVkb0xXWVkxZVdrQitmUG9tNm1vZi9rK1JWTTFBKzczVmRSTXhoSWd6?=
 =?utf-8?B?cUVOcytnbHppRW91eENpVzlicTlMa3NGUDZKaUN6QXNXaENETlRCbmlFYjFC?=
 =?utf-8?B?bjNUZVgwWnFCRExoZzkzYjgrYzhrd2J0eFczQWJhQ2RWZ095eHl1blpZK1hK?=
 =?utf-8?B?UUdLQVIwcG9oYnMyODdVaUlPTGN3SXcrRnNQR2ZOQlRKSTMxNVR2VEwwZlYy?=
 =?utf-8?B?VkJJenlua2FPM1A4VlNtZlVtZmhwUVc5Snh4T3p0UXBuRFAzTHEwMEt1aGZW?=
 =?utf-8?B?WEpndmV2UGJTMnoxT0tyRmNvN29OcXhsYkJHaGtFUXZDK09tTUhCb0JuZngy?=
 =?utf-8?B?VWlXU28xZFdLTTZUSkUwRUlnb05tNU9pNytCUGdvdWRsdko2MFQ1TS9tRXNY?=
 =?utf-8?B?b1B2aFcvaGZjNGt2MWI1OGF3MFBNRUp6ZDFuY1JmUXBidzQ5SUVsdGVjbWc1?=
 =?utf-8?B?YmF1WGZaSnlrc3F2eUdXZlFNSXd6TXMxY09nVU9Rc3NSVWNDNHlqU1NnNlRV?=
 =?utf-8?B?cThoanRkS25rMzRONmxtUUJBUmVJWE56YnNUNU9WT1BQK2U3Wk5hNFBSNVkx?=
 =?utf-8?B?VjU4TGNncGlCK1ZDcVh4NHNKT2ViU0JkdHp5QnNZL1VFMTZ3c01Od1FYTlB4?=
 =?utf-8?B?NG0vWkFkT0JpcUcrWVBCUVhkaVhreXNFSTBtWTZBSEFzQUpLOGNmZXdnTS9Z?=
 =?utf-8?B?c2FiMGtNSTV0OTdCaWtXSTc5TjVPSldrWFdnRWlOQlpNWXhHSWF2NXczRTR0?=
 =?utf-8?B?a3ppeXdsRkd3UHdaeUg2VGlmUjFSN001b1ZnTEp6T3o4YkdRK2pzaVFsNTRr?=
 =?utf-8?B?cHl5aVozVVhYWkJCdGpBKy9acXpGdFpEUTlHaU1XK2NLNG5aMzNXdjFWcjBi?=
 =?utf-8?B?OFlkd29oTXdma2tMbVNlcjNRTGs5TGN5QldKNWk3dzBBcnRlbEZ3NXNsaEIr?=
 =?utf-8?B?OEVaWFF1UWNyRmd5ME9NT3FKanJJMmZFYVpEY1psZThnMkRHM2NZdVJxa0RS?=
 =?utf-8?B?UTFydkdTNHlYelRZbUl5U1ZCZVh0VmZpNFFDbGVNQ051UWpubzNuOVFuQmdi?=
 =?utf-8?B?UE5mUmJVZHZGOVNYbDlKZ2lyU1pOZkMzbXBMbTRPcDdieWYrQ1NkWnZTQUoy?=
 =?utf-8?B?VitETG1RdnZPVi9PWFV0U3dRSTB0Mm1PY3NKbjVFRDdteW5yTnYvbEw2aFJ5?=
 =?utf-8?B?Zk9nQldDMUVoenJDUWJLNlNjMTBJQWJkYVIrdnQxb01qRVE2L1VEOUxWeFFp?=
 =?utf-8?B?RlVlUTY3RjJSU3Y5bkFiVi9IQzhkeDBCRmN1MXA1R3EvN0lUSW5BaDNjZkVs?=
 =?utf-8?B?L2pOakVuSGw0WThwZHRHc2dBaXBkaXdQS3k1TGlEQnAxZnlLM2VPTzJ0bUxG?=
 =?utf-8?Q?W8ZzrXzu2AmVi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFpZVzViWWVIWTNvSWpIMTV2R2Y3TUtLM1huNE5JNnFYL1hLSW56TWM5K1A0?=
 =?utf-8?B?ZHdjWnJFeURBaEFQM0VUK3A0UDFYeGd1RTl2aFU0VGEwUE5hU2l3Y25YZ0Uy?=
 =?utf-8?B?NzJCc2xjZElSUEdwOS9CL2FLQjFscHFla21XenpiYXJMbS9mZnN4QVFyUkwz?=
 =?utf-8?B?ZFFJWmFPdFZ0OFdnREFyazZMTGN3QzR5QTJpckl3eVZOSmJhS3BTWlh2K0xC?=
 =?utf-8?B?Z2duU2tFMmprMEk4Qit5ZXU0Z0hLS0xWWFdrZGxlcjEvVi9pMFRjKzJ0UEVk?=
 =?utf-8?B?cUtsbnMyTVBEdDQwRGh5anlHOGZUM21QVUQ1N0VBWTRsKzVGRk51dk8xc0s0?=
 =?utf-8?B?UHVHU2krR2k2aGdNb3hsU2cwOERCRS9sWXhlU2VNRmVPSUpYcTZocnJ3Ynly?=
 =?utf-8?B?Z1F0Q001R2NSY1FvSmVUZWJQU0RuV2FIbFhvRFJPRDVtSE9pK0V0Ly9KRWRr?=
 =?utf-8?B?SmQxUm1VOUFONC95ZFhuaGhHYWk1bTdYOGE2dU9pTnRXcXM4eHpWeVZCZHhF?=
 =?utf-8?B?OHJiWDFvbnlOMG1UL2REN2dIbGl6VmJBMnM0MmhobHlwclRiWTViK2Z5WVM4?=
 =?utf-8?B?d2lMcGw0TU4xcGRjblU3L0Y3eUp6RzlvZW5xclRHRFYvRkRsN09LVFI3N0V5?=
 =?utf-8?B?SjBHN2RacVI2OThMYmpFQzFTNnl3b25oQkhpK2FvVlN4NFpiRGMwZnNXM3VI?=
 =?utf-8?B?V1krRFE0UG9SSWl5N25TOWJZUVkrVEV6REZtdXNUMzlvcndIb2VyWW40RHph?=
 =?utf-8?B?czZiSG5vaXZ5K1MxMTJaZnBNSXgxVk9NdE85VkFoVEM1aUo1REZaSFRIbkdI?=
 =?utf-8?B?OFpYVEY0SHJrU09PNTdFbTRqR2xhMlJ2YUVVSDB4YmNnWjFwSGxQeTRseDdy?=
 =?utf-8?B?dzJ1emRmZnpJYjdWWVJPZkZ4eGpuT01XN0xENGdKbytNYTk1a3ZOY216cnhh?=
 =?utf-8?B?empER3lLM2lzQ1NWQ2RjZ2FzLzJmQ2tVbHI5ZWxJbXdaa0lyZlg5SXNIa2Zv?=
 =?utf-8?B?MXpVWDVmallUZkVtS01lYVpNcnZFZmlkdlNLdHc5WGJ6U2dTajRrWWlGMWJs?=
 =?utf-8?B?b3ZYNWZiUlR2ZTVLT3Y3OUJLMzNtbEcvL3FRWDVFblFubkJSbTRGK2VqdVJx?=
 =?utf-8?B?QmFxT1ZkVlY0TXhPY3A0OFQ2QU1aS1V4MjRUODRJTEc0L3NMU0w4QmdyeTNa?=
 =?utf-8?B?TTZxMkVYc0htWkk0cEQ5YWJ1OHJxTWhjcE04cmh3Ymo3ejRhM3ZGMmZkTDlE?=
 =?utf-8?B?dHNaWkpta09Va1JRdDFYSU5VWVBTUVVkZUw4dDFJQXJ3aWFQaU1zK0dZUVh4?=
 =?utf-8?B?NHdWRnZlcFFmWVB6bXIvbzJ6VHhaNGQwODArM1FtOXVQeTV6c2tabHlFK3BE?=
 =?utf-8?B?NEhBOEpxM2pUUmJMR0pLSWVWUkVSZFA4TEZOYlBmakRyZGhhR2Nld05yeGNE?=
 =?utf-8?B?ZEsxMjB3MFY2VGQ4a3lQcDRPV1pTNVlGYWFWNnZkbURnYThQcjJKcm5KQmpU?=
 =?utf-8?B?WmdTekdOZjVXV1dJeVI1aGFwQ2toMHBTKzN2b25qMUNmRURaVEJiUEdwZnZn?=
 =?utf-8?B?MkU1WUFXNGdFV1pRYlBvS2VOQXNPbjM2cjZGR05tcXhxSjlUTURFcGZyYnc0?=
 =?utf-8?B?aTZ3bGhkWG4zb1B4SEhTVGhReTloclJTdFJJbWcrdGtraUdiTkNILzJ1UTRn?=
 =?utf-8?B?d2ZBUEdrNkxqK285SUpZYTc3MkZFZ0p2NjVVbkxxbFVveFVOOS9qTDFsQ1l5?=
 =?utf-8?B?VHhESVBHc0NiYXhhYit6YWNIaUNIQ3hNL211NVRJUXlsUldtMDhESnRlN3pB?=
 =?utf-8?B?SVJ1YUNUa1ZUbW8veTA4M0RNaUY0SlRFZTBCMGdOTG50YW50Q2FSRlVrRGsw?=
 =?utf-8?B?NmhjY0lxT2d0ZzFWWHdIN09Od2JoL1doMm9QeWhjaWJWeE8ybWd0S3RNY3d3?=
 =?utf-8?B?UTJ1ZEhGN3h1Wkx0NU5tVHVpbDA2SG1rV0svTW15WitGcVBaOFZEcGVVYXZm?=
 =?utf-8?B?a1JNOVFvRGorQ0JSVmU4Z1E1bFd6a1VMRE1SNWFXVlRRZ243SklQYy9CWmpT?=
 =?utf-8?B?YytYdUNuSUp1QnB2dER5MG5VVHZVUFlWeldPWExxYUZ0VXdSRlFOYjdyT0Z2?=
 =?utf-8?B?dzZ5THhOYzZWQ3MrUnEyWGlqUmI1WDR5VXVkbDFkZnBCcnBCbTdtNEpaK0dk?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a057d6-61a6-42c4-792d-08dd5bd07958
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:28:30.4875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5WKzPuYtDbhvcNToy8e7mc1XL4TC/VwygHrP0i9I1N90jXwfomQbLztfKh52UPfT/DCKAas8g+kX05V1JKGbYfb5BMKknVtuOtQixrfM7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4695
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

Hi,

On Wed, Feb 19, 2025 at 01:04:43PM +0530, Satyanarayana K V P wrote:
> As per the current implementation, the fault is injected on the first call
> of the error injection function. Introduce an environment variable
> IGT_FAULT_INJECT_ITERATION using which, an error can be injected at
> specific function call.

This makes sense to me but not the commit title. What about something like:
tests/intel/xe_fault_injection: Add helper to start injecting fault after x iterations

> If the environment is not exported, an error will
> be injected in every possible function call starting from first up to the
> max number of iteration defined by INJECT_ITERATIONS, currently hardcoded
> as 100.

I would remove this part as this is not what this patch does and can be
misleading.

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index bc05515a8..32733fec5 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -25,6 +25,7 @@
>  #define INJECT_ERRNO	-ENOMEM
>  #define BO_ADDR		0x1a0000
>  #define BO_SIZE		(1024*1024)
> +#define INJECT_ITERATIONS	100

It seems this line does not belong to this patch as INJECT_ITERATIONS is
not used.

>  
>  enum injection_list_action {
>  	INJECTION_LIST_ADD,
> @@ -42,6 +43,21 @@ struct fault_injection_params {
>  	uint32_t space;
>  };
>  
> +static int get_fault_inject_iter(void)
> +{
> +	/**
> +	 *  Introduce a new env variable IGT_FAULT_INJECT_ITERATION.
> +	 *  When unset test will run for INJECT_ITERATIONS iterations.
> +	 *  When set to <=0 or malformed - same as unset.
> +	 *  When set to >0 it will run single n-th iteration only.
> +	 */

The function description should be before its definition, like this:

    /**
     * ...
     */
    static int get_fault_inject_iter(void)
    ...

Also, I find the description in the commit message better describes the
purpose of this new env variable and function: "... an error can be
injected at specific function call".

Francois

> +
> +	const char *env = getenv("IGT_FAULT_INJECT_ITERATION");
> +
> +	/* Return 0 if not exported / -ve value */
> +	return env ? (atoi(env) > 0 ? atoi(env) : 0) : 0;
> +}
> +
>  static int fail_function_open(void)
>  {
>  	int debugfs_fail_function_dir_fd;
> -- 
> 2.35.3
> 
