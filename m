Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706AED3EE9F
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 17:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A15910EA3B;
	Thu, 22 Jan 2026 17:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0rBg2WG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829F810EA37
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 17:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769104339; x=1800640339;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=w/AtW+Am70pXiDbyCpsJxFpt8WKf2DTDjNe4I0pR0GY=;
 b=O0rBg2WG6ZGLp6WA+TKgS/VTu45yv76vWhbDQNNFxehSoz8J6G1cV3kc
 ILDJIG3OSSgm6fjicGsJ2UgDmDvI477vPrs3VRJhiD3pE6hkwMZGZ4wZl
 2b79ZN23gQAARKA0Jg6HeR4PBCAuFbtwCIR9L5uoktZkc6ir3Yq8PuNm0
 MjmPK4mARhksfwI/xowgCeLtOzTiZDvKdwKeNuGBx/S7WV6oBTiwCUM12
 1zv4j46AkrxtZlGTfffEd/hxCcj2SoQlk+7XJyEuljpffI944+sjgLwqA
 1yN3LDmkQ6ZNz6dHu07+yqd16V2CXnuhlO0KmpIon0BiW4wJdbIj0f7LC A==;
X-CSE-ConnectionGUID: qyzQBh+gS268rRuDcPlb8A==
X-CSE-MsgGUID: Tmhr2qbqRneC7AJg+i+q6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="74215084"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="74215084"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 09:52:19 -0800
X-CSE-ConnectionGUID: Q2MsE2XbQ1mfoOxhmL5b4g==
X-CSE-MsgGUID: /laKku1VSwOp8K69G/fVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206846884"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 09:52:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 09:52:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 09:52:17 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 09:52:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGLKF3FYQPR3nLxGy7sZisOYUclwFMjxrNh1wqWAYHiAOeElJcN5GsbMC0mX4MIjuLHZen/6V5+lSAxx7yquj6GgdyMbkLrQAtxL3L/qpnbUR6nTwWa67EaN532KGEdTU3qZA8ng4R+yhVO1WAWT8YYNKygaEHFmVkYBszhGZRG0e7ScEfOaZLn+8FszCDWC5l315gqfenM2mxLRAANIuPtI1SHO6TBgypHoGFP2tbZ3NAagcY64byO1Z4WaQNNXqBQnjDku+9XQoCKG8qlik/lHz2rOiq6iBRbi9aAO94TSJAY9BdKwz9mk4PjbWyTZm8HaSqXnR0uf7VvKuP+U/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITw0uqzqgLJEaB81t6FSFHDUCV/MBvSdeSDFFch5UmM=;
 b=mYzSU/svlH9DA9jJEqgXZlxoLc2tQ+/9mKyNHcDAqPXduZsvV3FwvRLiVARf5WnD19SE9Jn9rPuxatvyHNGWlA1kESPdUyaZOsptqIkehWErl2QNSG267r+zpx3ZiPtoKG4XqUHrbOF1Q8JvhvHO036KyxOMJmJ7XgAr6N/ouRIG/MrR9hJpOj9ziK+Jn9qr2uA4aMWukvWTbp6+IgiU+wQxkGeCoKVCU2yqOn/rMgvrq9JYdBGvWOa6KQv3tbFPf5JV4uAVtJRnozExs27Ms6EsUM1uTiaexi6s0APZG5USWgeu8kAsOcl4iuBN//kv/wg5Z2KFjTltZm4MilkxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by PH7PR11MB6555.namprd11.prod.outlook.com (2603:10b6:510:1a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:52:15 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::13d7:d295:64e0:273c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::13d7:d295:64e0:273c%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 17:52:10 +0000
Message-ID: <cc150379-62b6-4063-8596-90f1e8d4bf13@intel.com>
Date: Thu, 22 Jan 2026 23:22:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume
 validation test
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260113132639.13411-1-mohammed.thasleem@intel.com>
 <20260113132639.13411-2-mohammed.thasleem@intel.com>
 <PH7PR11MB6053721799CAAE295BEF9936E78EA@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <PH7PR11MB6053721799CAAE295BEF9936E78EA@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::11) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|PH7PR11MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: 74fdd108-1d8c-48ad-9f92-08de59def738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aytJUm1Dc3VTSDhRclJQU3E2QlFrY2d0UysxQXNqUDJmZUlGVlZERVZQU3k1?=
 =?utf-8?B?YVJmZmxxblRINUg4UkFZV1FQNmZjcSsxRytyY0FpN0gybG9qS0JkeDd5YXpT?=
 =?utf-8?B?VEh4ZkdyeXhRWTB0RTJnUEJhbkNTcTVtQzR2K0hrM3cvSE15cGVvUklTYzMr?=
 =?utf-8?B?aVZ1YUgwUEFaV1JZUU04WTAzT0RLYTZ2OThRNU1Fc2Q3QWRPeWZSZkVvY2U3?=
 =?utf-8?B?NW51MXM1NjRJSUxTeVJWVnlCVW94SlVXMkdFeDE4cWxDc3pzVmVtZjhEUzIx?=
 =?utf-8?B?RG9vdFlma3Z4ekZTclltREx6Zmw1dlVuK01McnZzRUdYUWluUENxc2R5SmMv?=
 =?utf-8?B?bm1GZ2lxQmN4S2NQQ1MwT0g4R24wYXB1ckRRL2NpWXgxbVhQTUdPWndrOTRL?=
 =?utf-8?B?cENWMUdweHdDaC9Nc21KamVpVDFRczgyd3cxbXlISi9Ka3lGbS8vYVBKbTN4?=
 =?utf-8?B?elE5QVRwc0VOai9SQUg4Q0FkUmp1dms2d1IxekF6RjFqaXRjQW5GNlNBRXd6?=
 =?utf-8?B?TnJXR1ZRaTgrQXpUZHZvR1NqdW1ZcFRseFN6bXZmRkpCaFNweVdwWmZLL3h3?=
 =?utf-8?B?clVmZ3JCOC8rQ0xySWpBUTZMNGxBdVpDQ3hZVSt4Q1d4Vkpsazh2NVoyak95?=
 =?utf-8?B?U3ViRE5OR01qWVhRWDNheExqSDBQTHZhMmo4Y2lWNmVMM3NlZTlRZlZmYmIr?=
 =?utf-8?B?TVhMVXRZVnkzUTVNUURGVldnTkFvTHR1ckdaU3Y5UnRVSzNkOUQ2QW40NVNQ?=
 =?utf-8?B?WEZnQ0ZUMmdkUzU1Nit4eGdXVWRrSSs1WVZhY3J0c001QnQwZFRLNGNjbk0v?=
 =?utf-8?B?YkxEMEdmY0FIUEw2OXpLVXNyVU42M2JnNFg3OXltL0VSQ2E2WW5pemplOGg1?=
 =?utf-8?B?ZnEzZmNHbjNVMU9NTmFhT2Zsd0NvQk1VbUFQV3VjNmttZXQ5Y3o5d2tJSTNX?=
 =?utf-8?B?NWNuUUdjaHhwT0JxcFVwTXNkNy81RUVyMDRNcElHRVRuREFncGVuekQxYkdj?=
 =?utf-8?B?QkVSTjcxRW5yYSt3VVRmS0RtbEcxMkl3VTZFeis3OGVJWE1SaEJRYklzRTN3?=
 =?utf-8?B?TE5lenU2bDdNSnZNLytPV3o1SUZiUDcraTFxcWZBdnp6SzVJNmVlSTZnMFpM?=
 =?utf-8?B?OHdnWjdDRmgyZm94UzhOYit0SUpIdjJDaFdqVU1zZk0wZW02TDFkTGZLbGxk?=
 =?utf-8?B?bHRqRUZwUmlKZWhwdFo2Y1ZCSThsbExFeW9hNHBLVEFNeGlOekpZbHpPa2tt?=
 =?utf-8?B?YnBsdUhFQXlGWnZNanFGWTViZUtyK2w4MmFRbGhiRFR4cGxnTzlGdUp6U3Yv?=
 =?utf-8?B?VGEzMGtOd0pzeHZOR3luL2VYMjN2TVY3bHlmZUlNbmt0bWQ3MTNjL3Rla3Rt?=
 =?utf-8?B?dE4wWnR5ZXI2ZWU5bnk0cFFHVW4zYkJ5M2VvK2JwOWY3R3F0NjE2OUdlWEZI?=
 =?utf-8?B?VFNSdDNCcldnQmFsKytERFJPUWtrMEtrdG5VWFlrZGFDK2k1YnlpMlQ3SmdP?=
 =?utf-8?B?c05QU2Z3Z2E1c05pWWlPNXBCK3lTYU93RytZWVYvSVVQbnRrazA1NnVhNUIy?=
 =?utf-8?B?VHBBUHVnZnk2YXJDNlhMcUVlQTcyV1ArTkNZN3VIU3BhODV1ekpuR1ZBM0xJ?=
 =?utf-8?B?TFpSYXZ2S1FLVjdUcTdLenBOZTJOaG0vWkIyY1ZuNmhjWUhxSjlxeFc0OXJp?=
 =?utf-8?B?bFowdzdCcFNUYkszbW9NWjlXbTI3Z0pRQ01TTEFwU21DdVpNQi9EWjZ6bTRp?=
 =?utf-8?B?a2lWYkZVbUhVZVh3Uk9PRmRqdWdrbnN1K0lNVnZxN0Mvd1hIZi9BYmtHVGN4?=
 =?utf-8?B?WExSd0J5Y08xQmR4Z08vVGF6ZytFRVpxQXdMcHNzQUFxMXBYWnUyS0Mrcktp?=
 =?utf-8?B?cUtUV0FObmxLQ3V5Y01NZ056TXQ1WGh4RWRFb1NVR1d3bkJtemNXb3FzL2tO?=
 =?utf-8?B?SDR5dXdvcnVCdlNBajhLYnBoMExnRHllSlkvZWo5dk9LakVVekwvNVliejBC?=
 =?utf-8?B?a0RnZE9BQ0FEYUdsNFZtUEpOZUtLTVEzVmJocTU1VytIM3EzbjZDVGszOGJQ?=
 =?utf-8?B?YkUrNkc5aEZqU2tvbGsrVVRJK0xzMGlRdGxpd3B5TUZnQWRFc3NobFRNV1V5?=
 =?utf-8?Q?+s+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDVFRHRuWmljUGRLMllvQW1LTGZqZlpvUTB1V0J0ajlTVEdNOEJ1WHltRHRQ?=
 =?utf-8?B?QXBmYmo3b2RzVUZmMkVNcW1TN0EzdnhyUEU1SmVwNC9kdUZqNE01dDF2UkYy?=
 =?utf-8?B?a2Vrc0hsUTEyVytpMndPeWROdHBSUjdUTG9FZlo0L1B1blkyb1FtakNkVU1x?=
 =?utf-8?B?ZG8ySndTOHQ5RUFIMjhCMjhvRVhvMXE4NVk2bm9Jc0h3MVJrZHBUVGlBRHhS?=
 =?utf-8?B?WmlQNWxwN1phN0lpeWhwUXlxaE8wN1pUOXAwdFo2Z2szWS81OUgzZGZXMXEz?=
 =?utf-8?B?QVNQdzdWZlFvcW9YdGM3QUhIdVpOMndpbzN4U2dSNWtYZ0pXNUI0S05PV2Z3?=
 =?utf-8?B?MFB4STBpR3VBNDBnTiswNldTcmtXRGJ6elg2Y2NXOXpPRFV5OXZVRHBJRlk5?=
 =?utf-8?B?eWx3SW1tZ0J0ZEdEYjNoOHFkRHJHR0R1V012SERFZDV0MFlGTS9KaW0xZTFF?=
 =?utf-8?B?ZDBpbWUwQ0hnbkFsbmRSeCt5SDZjS3RYWjF5dnlkdEZUSVh3dUdwUjJ0STk0?=
 =?utf-8?B?ZEpVdXRvZEZMRGVDYkpwVFovOStWTVVsWERjZXU1ckJPSks3ZWZab3lSWTkw?=
 =?utf-8?B?UFp6dGJrZzgwdHJrN0xNNGJFVC9Ya0RiNUcwN3B4WUZ6N0hkYkdDTFRvVmZG?=
 =?utf-8?B?QjJGeTFKYjB6bXhONzd6WVIwZUJnZEhZYTlRUHJiUmZndkpBQ2NsMmlVNHBM?=
 =?utf-8?B?YTkvbDBORk5vMnZrU0JwWWx3eGxkRGc1RUV2NkJWVjhKWmpWdndCc2pxV2hG?=
 =?utf-8?B?cVRCOWJ6YkN4di85bGhTN1l1RXExRkdGdWwvS2NmQVNWWHUvNGFSYTF6MDZP?=
 =?utf-8?B?dWxhSWxvSFdmSUZIT2JaUU9leHVMOUVlZm95TjBxc3l5eWo4blRoSEpZN1VL?=
 =?utf-8?B?WXB0ZVVNb05PbjBJcHRkUEhGbW42SXdKdFd5VnlJUXZRSk1QYWV1Vm1YQU9h?=
 =?utf-8?B?bEU1QWNkNC9tRUhFL2ZZVzAzMitKTnBTak1rTlRNT3h3VE1FMUxwZnNqV3pU?=
 =?utf-8?B?YStJV0pjblVZVFlrZ2VWYXdHWHhPb0p4TTV3ZDdzMEdsTXlNWitSSHVzREtR?=
 =?utf-8?B?b1N2aEI1MkZoem43Nk5paEFGWWVuOHVWTWttS1Y5dVRzRzZzMzhwMk1LYUFP?=
 =?utf-8?B?RzJkY2wzZEVjOFNkTGwzTGE5R0FnTDV6UXdXUXhHblZ2QUZsK2ZMK0FSTVBp?=
 =?utf-8?B?YXUxQ0E0SmJ1OWo1L0xiZzA4ckRTRTVRUkh4UUZwVER6SXk3OVZQMkNUSTFt?=
 =?utf-8?B?YjRLcXVGUWhwMEpuMXZuTUhCZWE3cFRPTy9xcDNMUEUxZmV2d0dma0N5SnhL?=
 =?utf-8?B?MytTZXQ3ZUxURkk0RElBVkU4d2FMcm5waTRqL3pQWEF4ZVNzcWMzZ0YrR2lF?=
 =?utf-8?B?TFh1SFVzdzJwOHZYcmh1OHJRZXFSMmZWcmNWQ3EzMjY4TTdVUEVXOTFzY3Br?=
 =?utf-8?B?TCtqRk81U1kyS1lJaGhOSFRLUTVmNW5ZTkJxT1d5alI2ZnVwcUZKUVg2djR0?=
 =?utf-8?B?QUduWkxmQTRVVForVnpxVGtQZmdQa3FrRzE1OWpxUlhhd3BhVnFsS2VabXBw?=
 =?utf-8?B?TEE3SS85ZXZaZXFuaS9La2p2YkJ5bnNnNVFLd2s4TUJUOElCQXJOQ245TFRY?=
 =?utf-8?B?dkQybit4Q3l0VWJBb1JoS21sZlpWbEJtbVJFcWMzR0NJOEZVeTc4bFlSWWJs?=
 =?utf-8?B?NW1ZUjE5ZDVLS1VnWTZycjRacUxzekFxMVFsSlVSRk9FZHhTejhvMEkrOUFv?=
 =?utf-8?B?a0IybEtpeS9Fa21wdzUxaEk5ai9pRHBwOU1sMVBENjVIQVk0T0prZmhtYVRI?=
 =?utf-8?B?c1BrNll5K0lXVGNKNGIxOHA1RTlTNEMwdG8rbUI2ckNVV1lkYVhwaGp1dkNv?=
 =?utf-8?B?aXU3VjBnOWQ0MUdZYTY5aHhuWWhpWGpoOHlJR3dJZVFZa1FXWXVGdUhHbkUv?=
 =?utf-8?B?bEkva3lrbFY4d1g1SlZnTHFjME1Sc20wUlRtaU9OeFdIUTNXR1BPbERwY2VK?=
 =?utf-8?B?V2d3NTQwTDNsdE5iMjFuQ2VydUJHSGJhdHc4MlFrdHU0K2M5UHFjNTY2NGZS?=
 =?utf-8?B?NzdGckJYUUk5QkIvdlZ4QzhRMlZrRjNRRU94bTJSYTM2ZUlTaHZKdWlLdTIw?=
 =?utf-8?B?dTJwbXdBbzFKTVJjUXN3ajJTVW9sUmo1dWlFcEtPKzFOMGJkMDNxa0Zhemp2?=
 =?utf-8?B?TTZWYWFYSXFRMVBiWDE0Y3NaUThuVUJaMS83TTNobHN2S01KNy9xelpqT2JU?=
 =?utf-8?B?TFNKMUpZQWt1OFk4d2JQNW5kdlg3amlsZGhNU0M4eEdwd1prNElwcXRMbDJJ?=
 =?utf-8?B?YW1hNUEvcXpRd0JTVFg3ZlVLL3VZL296ZVU5ZUZFSWh6MHZvc29BVHg4VWNM?=
 =?utf-8?Q?zs+m/ZDgG6bimNKI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fdd108-1d8c-48ad-9f92-08de59def738
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:52:10.0270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: feexeAa82HGtpglnsx+ueCdHoJCwwJkgvfbvM/h0Bm1lk/m5leC57EnCMAGD1TTWD40OqTt/hHvdycOgi75dsJxsvfXIyoaBBakMofyJIdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6555
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

Hi Pranay,

On 13-01-2026 08:04 pm, Samala, Pranay wrote:
> Hi Thasleem,
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Mohammed Thasleem
>> Sent: Tuesday, January 13, 2026 6:57 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
>> Subject: [PATCH v1 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS
>> suspend/resume validation test
>>
>> Validate DC5 state entry before and after suspend/resume cycle using DPMS.
>> Ensures DC5 functionality is preserved across system suspend/resume
>> operations.
>>
>> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>> ---
>>   tests/intel/kms_pm_dc.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
>> 5e59ba6e0..ba00fd96a 100644
>> --- a/tests/intel/kms_pm_dc.c
>> +++ b/tests/intel/kms_pm_dc.c
>> @@ -77,6 +77,9 @@
>>    *
>>    * SUBTEST: dc5-retention-flops
>>    * Description: This test validates display engine entry to DC5 state while PSR
>> is active on Pipe B
>> + *
>> + * SUBTEST: dc5-dpms-suspend-resume
>> + * Description: This test validate DC5 state entry before and after
>> + suspend/resume cycle using DPMS
>>    */
>>
>>   /* DC State Flags */
>> @@ -721,6 +724,14 @@ static void test_deep_pkgc_state(data_t *data)
>>   	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");  }
>>
>> +static void test_dc5_dpms_suspend_resume(data_t *data, int dc_flag) {
>> +	test_dc_state_dpms(data, dc_flag);
>> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> SUSPEND_TEST_NONE);
>> +	test_dc_state_dpms(data, dc_flag);
> Here you are calling test_dc_state_dpms() before and after suspend/resume.
> If DC5 state is not entered at least once before suspending, the first call will fail.
> In that case suspend/resume portion is never exercised.
>
> Can you confirm whether this is intentional?
This design is intentional and follows proper validation methodology:
First call fails: DC5 implementation issue (not suspend/resume related)
First passes, second fails: Suspend/resume broke DC5 functionality
Both pass: Suspend/resume preserves DC5 correctly.

>
>> +
>> +}
>> +
>>   static void kms_poll_state_restore(int sig)  {
>>   	int sysfs_fd;
>> @@ -841,6 +852,12 @@ int igt_main()
>>   		test_dc9_dpms(&data);
>>   	}
>>
>> +	igt_describe("This test validates display engine entry to DC5 state "
>> +		      "entry before and after suspend/resume cycle using
> Rephrase the description to remove repeated "entry" word.
> -->Typo will be updated at next version.
>
> Regards,
> Pranay
>
>> DPMS");
>> +	igt_subtest("dc5-dpms-suspend-resume")
>> +		test_dc5_dpms_suspend_resume(&data, CHECK_DC5);
>> +
>> +
>>   	igt_fixture() {
>>   		free(data.debugfs_dump);
>>   		close(data.debugfs_fd);
>> --
>> 2.25.1
