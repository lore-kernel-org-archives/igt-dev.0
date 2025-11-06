Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F2FCCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 04:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5759210E0C4;
	Thu,  6 Nov 2025 04:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHTOJDcD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B666D10E0C4
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 04:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762405167; x=1793941167;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4ZqL/Ht3bZ45BuYlXn7rLcdRp7BWKYcHp7VIew+AZ/s=;
 b=aHTOJDcDY5SByWVkIKdihj1HKUdcZy4+wRgk42ZiLQmaA3vcE+IMNOaz
 lzCCMmuLlU/p972yJs/UhAixc4qIuQngSBQzXMbeZ1OsJBKxOSEm+Nm6L
 OWiibaBGxP9xRKyaaOzZLRdSlYINqD6bdLZCVb6M1humDTmwwJxYGc30/
 1gA8aEkVIW0rSwtgprUdDuRrOB4DRVckZs7r2FOvIh9U8ICgNHWiaslII
 XgsCgGUd6G6AxjXj/atHK5XSOfyP+YLflePJA+zyswrNFa14EwSY5XW93
 gPYjZGNXbndGkH4DQkRCB/1OxyB8kf7ZiOOwIPgJuQ8lzBg6C3Wf4ij51 A==;
X-CSE-ConnectionGUID: PH39iW65RKuTN06bwgOXPw==
X-CSE-MsgGUID: EZrq1JQZSL6yGWbvLwKQgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="82163023"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="82163023"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 20:59:26 -0800
X-CSE-ConnectionGUID: QzpqrhJpTTeQofi9cKIQ+w==
X-CSE-MsgGUID: 7kNJGHruTCe5s9q/y0DWjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="187319726"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 20:59:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 20:59:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 20:59:25 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 20:59:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kz16H6ui3PwuWeER91UHSDlTCp0xIlYdNZCC9fnadS18Dd3OoEnlh3w4NxDre06OX+FqCJdV5Sby1ziS26CvMGCQi5NMbxMBfiiiIIkfcfUQAPaUn7GPdvcbbUN4XE+bROCBJ2yXDo8rWO2ntDVSGd/f3TIENOZy7oxOgT4twZs3ZVjgxygXuZCfL/RibeNsomiOTtjN1nvaVqgsvIbgfty6TkuQgGWYbmCdHlw+mYhzeY0rNAZLtHvT8vNAe/7eEp+W0TlmMar4jabwaFPVkr78MkmOEEfY7CgE/k9iqWL08D/4pGjJlWed6rPn6XQbCDmz/gtH2zHzqJ8ZsVbYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3a8JTYM8J2E/EMi6C0j9kijftTRPzeKEk3MrJu6sNQ=;
 b=DcQqmqGBOVfkJnr2EMhZFa6B8fBW7QPDqdLjtQYuLpmc9HLK78XPv18gJ3fsDWvBGYJTSM33rsJNJlY0JOjVQyMfxuucGJWIlAH015qJFMBtEICAyB/C5GTvoY7MNnXBSeVJq3HKutUDyG/p0Cm4Ckcl0J0MNd+PrGq8Uzl+BfVLquHr0ckIs7ma9N/sES6TIejIshLqJMyXf69s2Ped5DOtJJnNYzq+OdjTf2x5E5JA+I88onBVQcQJDVALf6pizaBWlFhh8Fbw02u/yzFm9ZgPb8QngjlqGtIZpNNGHjxFlSaC59T/Eu9YGeESePqI3i1tQW723lhpO1W3GZogaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 by DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 04:59:23 +0000
Received: from BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::28c1:d233:2034:754]) by BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::28c1:d233:2034:754%5]) with mapi id 15.20.9275.013; Thu, 6 Nov 2025
 04:59:23 +0000
Message-ID: <75401b8e-64cb-40eb-824c-0b60d90c56e7@intel.com>
Date: Thu, 6 Nov 2025 10:29:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/kms_vrr: Start virtual RR test above
 midpoint to avoid mode fallback
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251106044733.1502397-1-ramanaidu.naladala@intel.com>
 <20251106044733.1502397-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251106044733.1502397-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0151.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::14) To BL1PR11MB5302.namprd11.prod.outlook.com
 (2603:10b6:208:312::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5302:EE_|DM4PR11MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 5913935f-9c65-4d99-f010-08de1cf140bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZThVTlhvTThxNmt0eGxmRlY4dWdEVEJFNkc0RnBBME1hY0dJSk04UHFKS0w1?=
 =?utf-8?B?V0Y5cXQ1L3RnUXpJNzgzUVFBcEtEdzlOeFRZbFU1YzJOUDVYMjZWQmVOVmQ0?=
 =?utf-8?B?STcvMzYwNWxZblMxTTJCQ2FoL0kvR2VEOWpaWkV5NVcrMDdWUGg5aWc4T2cw?=
 =?utf-8?B?RXdCMnpQTy8zYVE1QzJGQlpuaHExc2pCRUpEMm9TKzRRYnNmMWdaYzA0TVNp?=
 =?utf-8?B?WDQyRzVYOWY5aFQveDRmSXFuV3JZSHRxcFpRNEtaeHZ2b3VTQkRRdkJFOEk4?=
 =?utf-8?B?Ny81NkxDT0t0V25tbTZXMGQwLzdPYytjenJGakZLcHNCUHVsejE4SGJWd21Y?=
 =?utf-8?B?NjFjVWhhdERmMTFMT1ZkY2tvRWpkc1RkOWw3aG9Tb1oxbEpBSEtGMHJrVEFa?=
 =?utf-8?B?Uk1uMzhsUjRHZC9nUVpPa3dxTUZZVEJVZ3czUkRzeEhFYTlPWmdwTzVQeHlU?=
 =?utf-8?B?S3lGbEpYZ3hGV1VLM0U2YWk1aFZiTHp4aFFXQ0pDd29YbXRxOHpXRkNTOUov?=
 =?utf-8?B?T1hMS3VCN3VWaU4vWUFYcTJySFhmODY0eTA3YlNFVEV3d0k5aHR0SnRmSEJM?=
 =?utf-8?B?OU4wTXhNODRiQTZ2Rm84S0VQK2NnZjZZRGM0d1A0bVdOclJCZEZpK1pnUk1v?=
 =?utf-8?B?anhwWDlDbnZRdWw3d2JaYlVUOWZ4TG1lL1JISjAxcXhLQ2gwUUwycGluV24z?=
 =?utf-8?B?NUkyejhqTnU2TUxNK0xFbEtqbEtiR1lJRXQ4dFVSYWdwTkd4ZGhKZlNMNzE0?=
 =?utf-8?B?d29hWnlVZlpuaERoZk4yNmhYei9IMWdJVDU2NTZHMHRyYWJsY2NnWjVUL2Rm?=
 =?utf-8?B?UFFLYTJPZFFXUGRQdVVJRU1SRGNtZWEyR0Y4VnZXdXU3cUpKNlowVzlZa2k5?=
 =?utf-8?B?L2FHOGFxQjNNZWxFZHV6eXVhMlcvTlNhRDZIN2MzeUhWSlFJdVlpRDZiWHdF?=
 =?utf-8?B?OEdKM2xKMHUyS0FwWkZkQ3JodVlBRlNhL2pLUnZ3VXpEVDZ0eVU4V1FIRlJE?=
 =?utf-8?B?czlIU2JPNVoxM3NxT2kvcmZNTHFzb0FJazNPZXFldUluSVk5WUE5dUZBZGNL?=
 =?utf-8?B?bzhVVVZaNkV1bTgzMGZYS25tTGZjSnB2bkU4dThLbFh6a0ZMYUdqWXhTUjda?=
 =?utf-8?B?NDZaNFhEbXhhcUs1bUpiOWRmTERTUmF0Z29sNGs0VXVtWHhHNG1qUVFUNHRC?=
 =?utf-8?B?RXlTYUZ5aFZCTUhHeWVGdTBPcEdLK2VGOEVEMWxjNkhmaFRYZldETTY4Ymgy?=
 =?utf-8?B?eTU3Z0lPN2w4OEltWm9teU84UWprSWo4U2JTbGpQZzlFZlp2aG1XaVNtYld1?=
 =?utf-8?B?TjVITlZxUkQ0TzhXVEpmSjZBaVVlRjF3bFdJSG90S294eU1wMkpUOUg3RU1B?=
 =?utf-8?B?T2g4cDRldUFKT2dPOFlScE9YUGRLUlRUeVlETkQ2MHFJUFJGVXhGZUQvSVVu?=
 =?utf-8?B?OWNPNEw3TlI5MGwvZ1RPaGpLL29ENkpITnZxTmEwbEZPelhqSnE2MHRLeHZV?=
 =?utf-8?B?YTlvUTh3ODhIUGdacUZtaksrOUpVbnFSQndlWFR5M01BYXhEQ1hHckl4RTlK?=
 =?utf-8?B?WWY5SVlqSnJyWXdIZng0S0pXc3kyRUd6aStzdFFSVzFFNTJ3Vy9Vcm9hbUNP?=
 =?utf-8?B?NmZCWFdBeVgyWE9CYnpTcUIwWU1ONXRJdmNQRE8vTTAya1dJSEhJWWRjQ1E5?=
 =?utf-8?B?T1U1VlpxbU8zNXVFRkF2NGlyRDVSa1B5UlJ4STV1S2JNbXcvUjkycDZmdzM2?=
 =?utf-8?B?bWxZRU9sTDdiRjhIc3AyZENrckdVYzNVWVpoaFIxeDdwN0J5bVhxS0lEaGNK?=
 =?utf-8?B?MTc0UEpFd0xIdmtuQzk0N2JpSWR4TEpzUjBLalBSWkppRTlTU0gwL2k0eGZQ?=
 =?utf-8?B?andMZko3QTBmNlpMSkNRVDVKWjRUV2JnVFVjczdESjNTK0ZxZUsrSlJxZk9y?=
 =?utf-8?Q?dpTyih/6meRpkG1tTlIt4mE9tCM89xFZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5302.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1gralY1WHpLTzl6eWpRN0dreVRWaGJ5S0xIL1duNVlKUnpaY3lLdVlVblZ4?=
 =?utf-8?B?UCtNNHZVSi96SGtnc0Rzc3U0M1o2V3VibTZ6TGNwTDJNQml4ampMMzR6aEpB?=
 =?utf-8?B?MXNVbk9IVDViaDRxam10NU9PNm5SZlliN012alJqelhlTWoxYXNKc0tvOUp1?=
 =?utf-8?B?MEtua1RKR1h4VXFMaDVyaXNHU2JsVHZzZFlKcTFzQUZXKzBza3lXNWZYemZC?=
 =?utf-8?B?VGg4MlVIZFQ3bFJ5OGN5cVVKaGxvZkxLZC9LbUlQcjBvSmlQM2RjSHN2U3py?=
 =?utf-8?B?c252Zy81SEMvclVFeisrVlhyQXl3bTg4aW1CTmZyMTZRcWdqQVk2d2xQTTZV?=
 =?utf-8?B?STZacmkzN3NMREtCTTJrclgwbEdiRFdQV29QT0NraHJuN0FVOU85Rm5oaThB?=
 =?utf-8?B?MnhHT1NhZ3BBRVBndTFsOVZnMmxDV0p6N3BPWldVSzY0eU5POU9rQXM5TXZt?=
 =?utf-8?B?Tkt4UTZCN2lkMmUwQ3NXM0pZWEwvYzJGTEtkM0FPVkpKV0JVcGpmMHkxakFY?=
 =?utf-8?B?Nnl3TG13bkcyalNkbmNVeVhxcmVPdWxUZzlVK1lsTnNSOVF1UVdCRExzWDhV?=
 =?utf-8?B?clBHMnlmVGFxTzgvdXk2dUpPME05L1JMYnpUSHhONkF4WWh6Y0w4UmVrK05a?=
 =?utf-8?B?VzVsWEdZQ3hHOEtnVWh3SnUzZTZRRlNVcUxqZ29uRUZnZXdtYnJaZ3h5MUNC?=
 =?utf-8?B?SWpOdVVwMFdJT0hKWSt5TGszTDZhdGI5L3NzOWFYcDZzOFBDWkdkME5PRlBK?=
 =?utf-8?B?RkQ4eE1wRXRPZGovYW5nV0FtaXdrbjBwY0s4NStpKzNKb0J6RW92WERjTldJ?=
 =?utf-8?B?V0ZHRi82WGtYcmFRK2JhNG44ZW9qMDcyYXdXL3Ura3VVSStsY210YXZRRFU5?=
 =?utf-8?B?OWZEWDFPZDZyRW0vUFErWitscVVrQlZ3NDl6Vjl2QWlXVGhZNG5uMzR0K0pW?=
 =?utf-8?B?UVJhVkdCMERJcnBNRzlMUndUV2RsYlZ2Tkh5Uy8vL2NaMWdVZ0tqWitEN2FY?=
 =?utf-8?B?ZHM0ZHJESFp5QzZXNTQ0d3ZrYXcreWsxOFJ0NlVUUEQzWWJEdFF3TmNuRzRr?=
 =?utf-8?B?Rk1zelZBeEp4MGN1eFdLWlB5azVvbDVFaFFOK3dNSGpkaVBrS1g4VVZva2NR?=
 =?utf-8?B?RmFBSFNRc3pURzlQU1AwZE9SclZ0NGJxUWtvZzRKazlLcnJEbGZ5YndBNDZv?=
 =?utf-8?B?b29PVjFvUXZxYktsNERSOWdteDF2ZDNELzJpdE9qaUZSVmlsWlRBeVJvVCsx?=
 =?utf-8?B?enBJMU5vTElwdXhCbk9SdERYMmU5OXVZNzJvaC9GZ0R3Yys4R2tEY3ViR2tz?=
 =?utf-8?B?aVJRYmMzWHdncHlwamxGenRuT0ZGVktUMkl6R3NqS1IvSXZ5Q1ByL2VIOXVG?=
 =?utf-8?B?UExlaXcxMEZiZEgzMkNtZmhvTEZZd29YbFlVbjNEVUJzbUNnRCtSOVNQbkZW?=
 =?utf-8?B?dE9oM2VwQVNtWlJ4Yk54ZFdVZTZXMXFsT3JCeFRITm5ZWmx5bStFaWhRb3Yz?=
 =?utf-8?B?b0NuUGhudDFNWXN4M1NUQnUrY2ZjeDZnZ2s0ZmYvTy9nQ29pMnZsZjh0bHJZ?=
 =?utf-8?B?K1pVczh5MHY2SHpXN2F4K1RLNyt6VzdGSmtZOURObkpJUUlVeHdXcU05aURz?=
 =?utf-8?B?QmZoRkxqbjZUTEczT2FqbVQ2OVliUkJ1Zm13WE1kYU43SXNPKzhWWHk0dTk1?=
 =?utf-8?B?VFF1Tm1Ec21TR0paUFovZUQ1a3g1aDQwaFlWOTdtL2Y1cXllcEIvQU83RTdV?=
 =?utf-8?B?eTR5UEpGdU9uWEdjVUU4MDV4b09pUHpVYVR1cjZBN1c0U0E2QzNLelo4K3Ix?=
 =?utf-8?B?UE50TzVNR2ZLbS9IZTJxZUdJWlp2cGpORmQzcXEzdGlZSVRwMmxURWZjSzBo?=
 =?utf-8?B?bTFVbzA5YTNLSS9qSGVHbUFURXJleDBlZ1VERXNGTy9hMUNrQy9UdVc5NVJi?=
 =?utf-8?B?K0Ztc09VK0J3S3lpMDJrL0p2blZvcHNlaXo5NXJNYWJOeE1ISWhzWUkxZlhk?=
 =?utf-8?B?ajdzUDBWSzlKRnZVS0IrQXc0VDdrTFVRZkM0a1BKTnFJMXhkaWxtUHFMYTFk?=
 =?utf-8?B?Z3NkNHUyQkV4dGEyMnRSTHBnNHB1M2tLdW0vUDBhNEFMT0RRek5ITVdhZ1ZG?=
 =?utf-8?B?b2NqdUIzSE00MnFDV3cwMnBMNnZlc3c1ZDRBYkg4SWpUcFFsYjJnQy9Ja1N3?=
 =?utf-8?Q?YCGKk18mRtH0gcmM3FgUWqg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5913935f-9c65-4d99-f010-08de1cf140bc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5302.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 04:59:23.4137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xe9ZavCgjcav2SSWdTsCUuGfWb2AMFg1SgxhXT5aiI8y7WTgB/FEI3H5mznn/acuOg4eetO5a3lwu2LF8NqyOjhjgQdv/KFFzbXZCUw092A9zpieIyJsm5GylEERS0p3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6117
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

Hi Rama,

On 06-11-2025 10:17, Naladala Ramanaidu wrote:
> Starting from low_rr + step_size could cause the driver to fall back
> to a lower physical mode due to proximity to the lower bound of the
> VRR range. This results in an unintended clock change, which violates
> the expectation of seamless VRR behavior.
> 
> To address this, the test now starts from above the midpoint of the
> VRR range when multiple modes are available. This ensures the virtual
> refresh rate remains safely within the active mode's VRR range and
> avoids triggering a mode switch.
> 
> v2: Change logic to ternary operation. (Santhosh)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_vrr.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index bcb756202..57691ccd5 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -851,7 +851,16 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>   	/* Switch to Virtual RR */
>   	virtual_mode = *igt_output_get_mode(output);
>   
> -	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
> +	/*
> +	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
> +	 * modes are available. This avoids the driver mode adjustment. which can cause an
> +	 * unintended clock change.
> +	 */
> +	vrefresh = (output->config.connector->count_modes > 1) ?
> +		   (((data->range.max + data->range.min) / 2) + step_size) :
> +		   data->range.min + step_size;
> +
> +	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
>   		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
>   
>   		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);

