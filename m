Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD31D6DDF2
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 11:44:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4925110E845;
	Fri, 15 Nov 2024 11:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSjVJ2o5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA43110E845
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 11:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731671080; x=1763207080;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=71W13Ur1+LGKwiiww1mL0KsfeBw6qR52r3GnhSv/j7E=;
 b=JSjVJ2o5X5uuSS6h5eCVjhKuuwSTEc8piJjC8C0loitAwrOGhVkwFat2
 WagSKs8hxt8BxQ9XzMZT91JKXksF3kArqUngwxltSjUDJ9J+4uTAwv76/
 Ya77HmoyjnsNZnJBS0zs3ccs6ZhJjtdVZ/BTHmNDPj1rrZvWG9oeHfrbv
 E2mz9EV//DRPHs2vS0WFzYq7qfcswkLCx6sHVBKiNW8ILF4QKlFa/vVV1
 7KHrejZnHyctDn4/sRRhZ5/aXJuqe1NPeETc9qNekRaebYWfaC2EMTqMn
 ZoG1q43wrNJR1kkiM3IgtM/kJBr7mylSiYh+g4uU1POYoKfCvRv96EZtN A==;
X-CSE-ConnectionGUID: 4bf/68RCQeGk9hsHR6OwWQ==
X-CSE-MsgGUID: RBeFdmFTRMCB1LtbgpNZ5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31595262"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31595262"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 03:44:39 -0800
X-CSE-ConnectionGUID: 8lQLmpb+S3yS6t5seEj2FA==
X-CSE-MsgGUID: Tt3cHN/PT+efTf1/OBdppA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88949938"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 03:44:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 03:44:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 03:44:39 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 03:44:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caovJ80wvzboZhJpylJLFD5tgVcwLlXCblmDLcIfN6qPi0bi0OQ+GFRmPH0qYjUpZ5QYsVqdQABcp8zNDV1oFcO4ZljzIpDwLKq/3TvvTN/WdkoTK4L4VxmowFoXri8SWREdHWGP7IXXILfwPIGMPDPEM7ebyLXP6MgDT38HejM+4Wp+koA/07zY9zlr42P8kYzWbZ+dru4OHOHo2AP0O7mUddlpkt9bT4CysNcBLBo0lTa9aIl8IXiqWa06uYjOqUMEceum3qH8CPjRVrrJxROM5W6Ofs3dvl4XJjuhKOy9D8LHIxjtHre8MnpSC/5acNe2K+RiSKYlbqRnndfnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Poepqr9xtIR8j5MmcF/HKoZfmFphBC8VgNNiiNupUdE=;
 b=Hbo5m8upRluuvfCI+AXIx+FLbq6aK+sctGhAjd6BCi41cv083ISb5SH8N09u0H1stRpI01L4i1EyGnCds5+jOTar0mIuowvwnzgUdy2tlqeJQFru/J7PWYGkELrDspggbjdbgcLwhIk/tkBG0vrruT3Ad/UOKDiKZDJmFjH8AtdYXuwlvKSCro2SkNKde4vRTi96ScguNawRJKRSeST5rHAtBoZi1L9CELHvN6+nsQ408Z/V3OL/qDRtyvGoHExJVU/4wPjhjJV8QUygPzVVPSDeGYd+WeF8Re03DWLx7qZsrsuDREaYQ0KXJs1R7UGDHt/RXmGZ1nFkyOCoBbUyCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB7067.namprd11.prod.outlook.com (2603:10b6:806:29a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 11:44:28 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 11:44:28 +0000
Message-ID: <ee9c4c59-3807-4712-bed8-30f09859a2ac@intel.com>
Date: Fri, 15 Nov 2024 17:14:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/i915/kms_flip_tiling: Fix pageflip
 timeout for low vrefresh modes
To: Imre Deak <imre.deak@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241022155311.2797257-1-imre.deak@intel.com>
 <20241022155311.2797257-4-imre.deak@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241022155311.2797257-4-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::20) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 6484fdfc-636e-4136-8039-08dd056adc73
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWF4WE1sT0l0cnNpZGw2N0NQZVM5ak1EODVHcFczLzV2QXo2UGIrYjg5OXdq?=
 =?utf-8?B?QWZLRlBhQU9QTUVNa3RyVUNMdDBKa01HcWliTGZ3SWNFV2t6WTdNNWdlaFRY?=
 =?utf-8?B?YWQyalU2VE5QSlBRdWhsWWZpTnJ4Z0RQbHFOYWl5aFFHL3lXMmlpRGZCSjc1?=
 =?utf-8?B?Tnh6c3ZHcEdNT1JVREdVWmsxRCtxZ0trVXV4N2hUbFNLc1VYUUlzT2t6OTl6?=
 =?utf-8?B?clRXcHczY3M4dnVrM2l1NmFGWFJMUjhTaG5tOTJpZUE1U1RVQ01ldGNDOTJS?=
 =?utf-8?B?Q3RsWkVUVjQyK05PaTdpQzY0am9LTVNmdGk1cGRXaXlKTnAxM3hmMUthL3Zn?=
 =?utf-8?B?M0tJdGgwMElMVEowVnRUODVXSHRTYUFmNng0RXErUE4vQzYxdjVCZm02cDNq?=
 =?utf-8?B?WHFSczF5cXpWbW9Qc0FkTE1ONjNaRVZMZ3U5b3dNeG5MVjc0TGJ5ZWc1QjhT?=
 =?utf-8?B?TGVteEViTmFjYUZwczNzRzh1bUpRWjU2bWJaZEZYS1FkQVk5VWZaWUNYNkc3?=
 =?utf-8?B?cHlZbWladGZFWGUyRFlnTk5acVJFL2ZHMm1tZTZJSkVmUnVFbW41dnRObTBG?=
 =?utf-8?B?MTFEL1lkbjR4SHNFMWJjU3ZjRFdkNG1na3ByZ1NkckNpS2R5WHVFV25jak8x?=
 =?utf-8?B?VEZMSzdSVTNCOXNoMThNMmJEMjlWWk5UMnlDVVhmVlozcTh4NGpnRXZENVhU?=
 =?utf-8?B?cWdBMkIyTjVmeDE2TWdsbVliKy9GYjQ2L3pSV2Z2ZHdNdU80K0lEVVh3Qm5k?=
 =?utf-8?B?SUY3NDBaV2c3TU42VXB4ZGM3aXA5Um04Mk0xeTE4Vmxjdkx4RThwM3VYUzY2?=
 =?utf-8?B?bkdhYlloYU9GYkRxQkJJMnZuZlFQcm1TL0NpOHQyYmdFMjRJd1FiQVZQdDli?=
 =?utf-8?B?QzMwbW1nT3ZyNkw3a2Z0bjFIOTRLVk9DeUNyYlVCSkFlZitRZStZK0dkaG51?=
 =?utf-8?B?ZTBwSlN3amIzK2xncFYvaFVrZnBnV294ZEtHL0pVb3I2Rk4vZXowbm5RdzVs?=
 =?utf-8?B?QnA3dnptOUR3UFM4Z1hBeU9RK3Bvdm5XRnFvRkI5czUzbXplY1gxSXRobFZt?=
 =?utf-8?B?RndaNGJNWCtPRzFKUmIvSjJ0OUFwd1hhM2p5cnBjRmZCajJoUFBqODBQYis2?=
 =?utf-8?B?TktiOHQ4MUNHdFhkK2J5aWw1TTFDSmhSRzA1cjMrMjdIOGpjOG9BRUlPajNP?=
 =?utf-8?B?VlhGRngzc0RMOHRWU3RWUFpEUW5RaXpFWEc4NjZJamNLc1R3ZVFVcC9jTmtF?=
 =?utf-8?B?UnMycmVBNU14KzcxNFNKWXB5eThYQVEyYWplUDN5S2JIcUZDV3NsekhTS2Fw?=
 =?utf-8?B?MUg2N0NxVVczZWIzYzVkQXNKVFF2WjRNOXJMV0hkaXhWaDVDcFFBbFpyT3hj?=
 =?utf-8?B?ejl3VVB0Uk5UYnVCT1B0eHk2bWNRNlNwQVhtdCtsV0VwbHVTcklFcTJUcW5P?=
 =?utf-8?B?S042Q1BZOWluS3VTOFRMNHRwbUZLemZaOHVLZm1LWUNRMTFydm5saENsY3dx?=
 =?utf-8?B?K2dhak5idVhPZWdVcWNWYVU1M205ZEhHVGFRMkFGUXFZaTNUdmwzTWh0T0hM?=
 =?utf-8?B?ZVlEWkFYTVpXOFpSN3NiYmlLMG9QVCtJVXk3a0o1aFNQUmhNOWhSL0E2MGk5?=
 =?utf-8?B?c0IyKzcvRUdTUjFxNUF6cWc1YThZeXlVNXIxcWpPQjBCUnRhU2E4T2VOL3E2?=
 =?utf-8?B?dVQ1M2RaVXVaUUNZUkZYR08vOXRiNXB6VmtRN3k0NWZIajZRRlhZTERlTWlS?=
 =?utf-8?Q?zRhNFDKLAdvzrHFRekuC+akk2rhoJA5XxEzvgOn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3NsV1FRSUlwRExGbVJ3NmZ6ZjdyTlhJRFNDTFJncmVBMVdaNEdMZEpoOFJU?=
 =?utf-8?B?cVVZcmYxd0E0NUQyZGNKa0IxZ0VHbkx2Uk0yVEFNeTdtSkgydmJTSjUyaHZu?=
 =?utf-8?B?QzVaTHFabHdZVjQ1dlZYUGgwRS9STkE5c01oN2dmWjJxbGNhcUxXWmZwS0E4?=
 =?utf-8?B?WkF0V2k3Y1hJMFdEYkwwWjBxSmQ1NGlvMytSMWFKT0tubTN1OE5ITUN6RFBt?=
 =?utf-8?B?bTlCT1Rrakptcm5Qd1F3akhtY1V6STRheUtubm1wVUVFWVpINVc1UWVka2JU?=
 =?utf-8?B?M0Y2V3JERncwMmpJSFg5YXdNaFhrMitOU2wveU9HYlV0RFdyZERaVU5nL1RF?=
 =?utf-8?B?R1pON3FkandOck54elhndWtHeDBidjRkZ2c1VCtZVWNCVlJIajd2YzFDMEsy?=
 =?utf-8?B?UE12K1RwNkZiSlVTd053QlhWLzUxU2dZd1pQOUs2YVVZaFN4WUJEQm4wZzJ4?=
 =?utf-8?B?UDAzYVZVTm1KSU9YNEpvVkRZNmdTMFVtd0xiS1FYZkpkYlFhQk1mVVB1SmJY?=
 =?utf-8?B?UHBvT1BocHd5NEZHeWVETmRKaDZDdGU5blUydnp0cENRaFRFQzk4SGZHSnJa?=
 =?utf-8?B?UWhORGJYQlViaUhrSFdrMllMTXRjUHF5cllvR0xDZVM3UlpFQnRGR3pLOHRB?=
 =?utf-8?B?TjFzYTE4VGZXMU04TllEdzVCT3RxVG1NMkxCbjVEaE9WNm53NjVlN1FwRU1M?=
 =?utf-8?B?Q2UvZ3haOTFHT3pEbVA4akdWTE15dVNHRXBUWUJ6T3pvM0s2YlRTUmxzMEh4?=
 =?utf-8?B?OTVKMnNOcDIxbHRXQ21McUNCbWhDK2lEUjlZaEtIbFQ5b3FhOXV5SXFPQXZS?=
 =?utf-8?B?bVMrUllNL0p0UGJLOGFvcnhLMUxmaHh1V2x0TEdoQ1c1WDhaRmMrcE1ycklX?=
 =?utf-8?B?bnlKem5jMXE3cW1ibGVFcjgvZ0RwbEtMZ0NMNEpwWFJqSkxFdWVxTjhIM216?=
 =?utf-8?B?U0xPaW1NRk1VNFY5VXdoSmJrUlpPaFg4L01PZjhVSFNMZWdWVTJ3RGxuMEJZ?=
 =?utf-8?B?c0MxMEVWVlBJSmE2ajFPQTRpQ040VGliamk0RFU3M2lvS0ViMlF5ajRqL1g3?=
 =?utf-8?B?YmFYM1h2ZEdKRm9vK1FSKzZ2TlZTT0VqUEFFK1dCRDJhUW5TNGo5YWx4WXNo?=
 =?utf-8?B?Q3dNNW5oQjZWRzMvcEZ0SDJBTlV2T2IzK0dGTmdVaXJpMVVpRXZuRCtQZFF5?=
 =?utf-8?B?bHI1WVYvUWNXMmlYU0REZGZObFhub01PZXAzM1RURk04T0VVdEk1cExLVHpU?=
 =?utf-8?B?bGtFOHVpNWQ3Q2JtMFppbzV2U1RBL0lrK0hINDA3SE9HUysyVnpsTE1IUUZ1?=
 =?utf-8?B?LzhtTExzSmdqKzM0czB0OEg1NTAxQmFraEFYVlpwdDBOdzZDMlZOTS9JdjRm?=
 =?utf-8?B?VzZ5dE8rRDk1VkZ0alJoSWF2eG1zeHlHOGxWY2ljNG5QZmZxWWlDOVpiZ1Z5?=
 =?utf-8?B?a0kyY1hrTmJEZlVFTXdDQ3l3K1R1Q0ppTHJQaUkvZ3VCV0hlSVBLbVJ0RFZW?=
 =?utf-8?B?a05sWW5zRW9PckRhUEF4TXIrTWtTZXhUc2UzTXVqMStwUVpYUFNPbzM5cm9K?=
 =?utf-8?B?cStPTjFZVWdWUzdPV1I4L1RyelNwRm9YWjNuMUk2eWZhblJlV2NLSno0Tnc4?=
 =?utf-8?B?aWtlaDdsUWVQZk9QcXhsSlBCdXorVU9KdVZjRmp1cnQwZ2h2ZC81WlF2MkJL?=
 =?utf-8?B?K09OUVFGalZyZk5oQ0dqZUt1QjhHb0l3SSt6Q1hBSU1jSkdpbm1tdzdtYm5p?=
 =?utf-8?B?R1BKaUNoYVhwaWhGZW1aTEFscGJWWEROWmw0eG5rcjNiSHJoU2w5TVhRSzJQ?=
 =?utf-8?B?bU91YTZFOURsaW9JQUNhQ0pvZWg5OFpBczlzaGVaRnNzUnUxd3Y4QUhpVzFU?=
 =?utf-8?B?SFBxU2VVdGpGdEJwZUVaTVFvRHVYQ1E3all0L2ZFZ3JOKzJaQUZydjhUVXZW?=
 =?utf-8?B?cDJvbVBvWTNqeWN2TEhzSnNHWldLZTdqaWxQMzE2dnNlTHJTSldDVWJXSTVW?=
 =?utf-8?B?UU5NRm9TdzNUNEZmLytUV3o4T2IxMlh1Q1pGdmtmeHBxSUNjYkJRa2hDOXdC?=
 =?utf-8?B?aXFwOUswYjdreTUrOEUyNUo5dXd0YmprTnFqMjhBa3l4K3VRdlhGYmxrWEZT?=
 =?utf-8?B?aHl0TlFHSERTWTM5T1ZVZTI0RXRIZ1ZGYUprS3RFMEp4eUVNNmNNa2dtcFBm?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6484fdfc-636e-4136-8039-08dd056adc73
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 11:44:28.2888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7eD0eN5V6HiLg/okdSWXIOaFaqtur9uZ0+8kMNoccwwtEYsqhN0yrrGcIzeWsFIOTgqTuFqnE5dKApZrWBYNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7067
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

Hi Imre,

Do we have some gitlab issue associated with this fix?

On 22-10-2024 09:23 pm, Imre Deak wrote:
> The current fixed 50 ms timeout for pageflip completion is not long
> enough for low vrefresh modes. In general the timeout should account for
> one frame for the flip itself + one frame for vblank waiting due to FBC
> invalidation + a fixed amount for scheduling overhead delivering the
> completion event to userspace. For the usual 60Hz modes the 50 ms
> timeout worked ok based on the above (2 * 17 ms + 16 ms), but didn't
> work for 30 Hz modes (the minimum timeout for those being ~67 ms).
>
> Based on the above use a timeout length of 2 * mode specific frame
> time + 20 ms fixed scheduling delay.
>
> Testcase: igt@kms_flip_tiling
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   tests/intel/kms_flip_tiling.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index 3bf02564e..e937c2171 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -86,6 +86,18 @@ static int try_commit(igt_display_t *display)
>   				       COMMIT_ATOMIC : COMMIT_LEGACY);
>   }
>   
> +static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
> +{
> +	uint64_t timeout_ns;
> +
> +	/* 1 frame for flip + 1 frame for vblank wait due to FBC. */
> +	timeout_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh) * 2;
> +	/* 20 msec scheduling overhead. */
> +	timeout_ns += 20000000;
> +
> +	return DIV_ROUND_UP(timeout_ns, 1000);
> +}
> +
>   static void
>   test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier[2])
>   {
> @@ -137,7 +149,7 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
>   	igt_require(ret == 0);
>   
>   	data->flipevent_in_queue = true;
> -	kmstest_wait_for_pageflip(data->drm_fd);
> +	kmstest_wait_for_pageflip_timeout(data->drm_fd, pageflip_timeout_us(mode));
>   	data->flipevent_in_queue = false;
>   
>   	/* Get a crc and compare with the reference. */
