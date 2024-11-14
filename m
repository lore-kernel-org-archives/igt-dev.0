Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D125D68B33
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 16:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A7710E0AC;
	Thu, 14 Nov 2024 16:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGs7VyGe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E9B10E0AC
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731601477; x=1763137477;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=395BhFVRZBeJcbG8kqG3sz23jQIVmQ5N/banfjC0z4Y=;
 b=WGs7VyGeyODnzbY361vlmyNnrbf6NPOqARoyeT9aWbZGPxOamye0K98j
 A8L9lZq6pOhZLZ00SjR5RMYuI0xWZUlsQrTm3blmfKiPyYPUKM7XubavQ
 z7OQb73/pVAsslzHqdDVEWb5m0rkBUrxG6ByOG/juCR9Wcns9lh/kr0KD
 HAIwh5bW5rQS7Sy48On9UywEEBb0sgVPzmg/fOgvbjlOjmpVJPv45laNO
 Nc+A4iSr8+OJZ+t6dfg8hC1uxTx1dRUaWbAof+L5UjrprOwyy5Pp6WYEw
 yH0JChXyUrBCnVNZ3ZtLzg6JFP//3sc0LNny1uZz69wVoLbEgElGMib7X Q==;
X-CSE-ConnectionGUID: 15V13eSrQMqTSb7elD0uVQ==
X-CSE-MsgGUID: ZwVSB0PaSu+RHyTCuh7dGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31533684"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31533684"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:24:37 -0800
X-CSE-ConnectionGUID: 06SqR8WNSra+6q9ChwlNIQ==
X-CSE-MsgGUID: rPTc4AyZSA+GZV0H1VmH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88380131"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 08:24:33 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 08:24:29 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 08:24:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 08:24:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCt+z48mjh/qfOLOSjV0g0fJVn6kt3BMuYq7Ql/nUhBj3xmfJedQpgAjYs3Xt0YDslv/OrOuN5kpkzt5hbjou8hSsSWxXJi8Ttl0kvOS1kM1NxaVSBOtTtOltLI6/WI/wZVteISF8akd9rihrOITRf+egrHTjLt+yHcSlVMEOkOhIu/4pE0GviL/EboiEFwLGL/FDtdCF6SJwtGyv+ctu8aG/vxO5DgWwtiiqj2kpeyCLR61rnZAvQ1yTn7UBrJuXWPe106+c5cU2jfOzJdESJclYm2SEHCH1gKYTNOj0/MJwNEDcfdgmorB/CHLzi3QHn+ryMsmBv43Hbt+GWOU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHMfeoOmXmzJluHWtmG6hYw0JNBs+aRKRUQ7YMxbRtY=;
 b=LHjkJkLEdcrOgbpeueIIXLjZlEsC3Ifybd0LqLMrVZ/FN3fmeMdWQCvX6k4+MYXT041j0zXL1lCoymExWnilL68oX6MicJlBWS82Qir6KyqoCXgTQV38aPYRXd97yYcw145aCpw/xf8w2+tn+uvaUJ8YvMNvjb3cG82MHAzKF+rzo8/kaJbTCHBHdc+bE9N8C62720KG3XroJ7NHW5jwyfVS8wHh05JefkanC9KgJzoSloCqMV53oWKXfDbK8GL/NCPj4KlYZYssi498tVlDfskl5E6Fsaz/0DADpQxM3qVVTsFCi71tC4/QJO2DA+N4eKr5/Yg6TxpHRW7l3GUGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6619.namprd11.prod.outlook.com (2603:10b6:303:1eb::13)
 by SN7PR11MB7589.namprd11.prod.outlook.com (2603:10b6:806:34a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 16:24:26 +0000
Received: from MW4PR11MB6619.namprd11.prod.outlook.com
 ([fe80::55f0:ee1a:cbd4:a704]) by MW4PR11MB6619.namprd11.prod.outlook.com
 ([fe80::55f0:ee1a:cbd4:a704%4]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 16:24:26 +0000
Message-ID: <2cfc586e-e27b-4e7e-b9bf-2ca9a7fa22d9@intel.com>
Date: Thu, 14 Nov 2024 17:24:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] lib/gpgpu_shader: simplify load/store shaders
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
References: <20241114-gpgpu_send_rework-v1-0-e0914e09e7b2@intel.com>
 <20241114-gpgpu_send_rework-v1-2-e0914e09e7b2@intel.com>
 <abb23f4eb3669b19270f3491bde8482da6ac9561.camel@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <abb23f4eb3669b19270f3491bde8482da6ac9561.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0451.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::22) To MW4PR11MB6619.namprd11.prod.outlook.com
 (2603:10b6:303:1eb::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6619:EE_|SN7PR11MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a19d7bd-2e45-413d-403e-08dd04c8ce8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHJ2MmlGKzA4RHdjaWxXUkZCTzRvSEliUEZPUndTWDdEcEVzUW5wS255VkU3?=
 =?utf-8?B?VjMwSUM3WW5KYjNCTjEwUms0UXpCdXBaSmpsZEI1VUZERkVSK2JlWG5HR2tk?=
 =?utf-8?B?elJNemdhbEJ2TUZiQXIzd2VHU3lUWkVBQ1hLc0tteUU3QklyNkR3eURwMG5K?=
 =?utf-8?B?TzhZc0xiYUdYaytuWmVQV3N1TkphR3EyVDdnOG5KZHZqcm5hZkcyYU9HdXY2?=
 =?utf-8?B?SFhRSzVSeGZrTzdmZXRqRGsrZDNRNkViMGNrYmEveDNveVQ3Sk5zdHBXSlVN?=
 =?utf-8?B?ZnNjTzJZNHFJMEhMcTc5Z21SMkQ5RWRzdTdxZU5KVHVIS0dMYUY0Mmg1OFUw?=
 =?utf-8?B?cFlWM25aYzZieFNIMW9jRzZRRktZYnZ2WWpDeHBYTDRPK1lsMnQ1UWVMSWhX?=
 =?utf-8?B?aEpZVWFqQUtuUkcvK0Jpemd6WlRsRkJ4ankvRjMvNFlTNFVkRlVmQmtmQ3l3?=
 =?utf-8?B?ajlYUWl5dTdicWpaYmF3TVZjcllDb3BpbUROL09uUDJVODcvT3VwUVNqMUR5?=
 =?utf-8?B?SHc0UW1wSnc4ZlhpbU4xZVdMQWdMcERXUTRiTE5EMzI0V21zU0NYVXVVa2tp?=
 =?utf-8?B?ZXRrRDhyUGh4Yjh1QXNtVWZBUTNQV282am41WEpZWkJkMVN6aUFhSHZnVG5W?=
 =?utf-8?B?bFE2VG95Zk93YURMdGp0VHg1Mmw0ekgvdUM1VzVSSGFtbE83OVc4Ny96WmhI?=
 =?utf-8?B?WWk1amd4a3poT0MwaU5heTJNeFAzSEpuTS9pamhpSGI4MWo4VStiZWhQcTdT?=
 =?utf-8?B?VFdvNFdBYmVFTkVBUTlWUksybjJIY1VhbC9WUjFUbUpWcDdxZDk0Z1l5SHdJ?=
 =?utf-8?B?TG5qL3NYOVUzZkQ4RkIzSnVvbkVWQ1ArUXI1bk5GQWh3QWEyRUJmRWR6ZkJR?=
 =?utf-8?B?ZTJDUVRtT1NDUHNXNUM0M1pBeGRwR1cyMCtWdktIZnUyZUcwYitjcDRnNnh1?=
 =?utf-8?B?dXp4NGphemRUWXhJLzNGRElYcXVSTDhVcWNFZEwwN2xyaUpZUGQyMHpldGM4?=
 =?utf-8?B?QkZ6eG1nV20xUDhza1NKTTR6ejZ6TnFlM0YzZFJ5ZzlOZk4wWDZaYkYrcDVF?=
 =?utf-8?B?YmMxWS8reVJ4Z2ZmRmJSUVBhM2VvMEU0Z0Y4Zmx1dlNRRW1Gekt0MzhqdXhr?=
 =?utf-8?B?aERXMVFLMGZCTGQwYzRzOFIrenVVMVZrU1VQVXQzdUs5Qkx4ZnRlbytyUFdl?=
 =?utf-8?B?WnFmUFI2dTRaMDZydW52RG1mdlBJbGIyd2NJaUhjR28rQUx5WEF2aVBBS0tk?=
 =?utf-8?B?bHlSM05Uc3JxdzJPTFJBb2thWElQQ3dQZklDYzQ2dlkxS01rRGxNQnZmVXR6?=
 =?utf-8?B?SGtwZ0JnMjVVQ1VUMjJ3eWZiWkYyYmE4b1hPck44YXFpUjhveTdiOGJoMU1h?=
 =?utf-8?B?RVI3dlJFYjRLVVJKejJHdThZVkZGU3ZnclNacTN4akJsYmQyNkh6eGZUN2ZM?=
 =?utf-8?B?dGU0T2pUbHM3cUFiaVZwQ2FZR3RyTFk2UTMrY2FYbDVDU3MwOEJ1Q0xBc2Fo?=
 =?utf-8?B?UG5QZ2lpcFNXcWdLeEx3NnExcHlKQngrdzNSajc4cGp1M1NSc0EyS1JIcXBE?=
 =?utf-8?B?MkdqZSsxSWRhZndVU2dSa2pLRG1PTEp6dkFhNTFwak4xZHRCTm04V1ppN0du?=
 =?utf-8?B?cWc3SjFHRjVNQWpwcHkyc3FORG1rWHEvVmRhTFZNbmNyZkVWQTZUUForNk9p?=
 =?utf-8?B?Rms1NzlZc1JpcVZ0Z09xRHFaODBhaDhkS1JmSUwzS1RuQ3B5UzZFai9ybDNj?=
 =?utf-8?Q?fSDroNz5USxVT6oxk8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6619.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0hLd0NpSnNuYnZETFNSY2Q0Q3pGYnBaL2ZuOEFmUGNZWHJNQkJCcG02cSsv?=
 =?utf-8?B?dXA1aDlCNzRwVCtKZVAxaTVpTWxaK0p4aGgrbVRPc05Ra2Rkc2IwTDMwTjMx?=
 =?utf-8?B?d2xuREtuOW1iOVVHWUkweVdvTE9tbWd4b1dnM0RDZzhmczkyd2JKWUNOb3RX?=
 =?utf-8?B?MXZmV3hPaXZOVkxpbFFKZklSZ1ZEOHRXNFJMVXJOd1NEVUdDamZPdEF0MGFz?=
 =?utf-8?B?bzBPZDZiQ3gvN1creUhRNmh2MVBhNk5xbm1icVVNUU5SUlVJc0Z6TVExS0Uw?=
 =?utf-8?B?bWxMOU9xT1FKZ3ZFb05FZUhHaHhCUVlCSmc0cWhsQk95RW5tdy9tZnpXR01l?=
 =?utf-8?B?NkFQMmgyT0hHOG9KVjBzc2tCbHdFMTZQekd5N0Y3SFFPZ3BJMnJINnFJc0pN?=
 =?utf-8?B?dklrT01HUW9RaU9iSzJwT3NRcnRPcmZsOS85Zk11dFNsU0tFVFlocU1JRHZy?=
 =?utf-8?B?UzNaZ3FmRmtHa2syR05lQnh3aVpxTGY4cTYvV2lKZWpzQUZjRnhjTmgzZXIx?=
 =?utf-8?B?SHNwYWloVkpmOXFVYnRUU2VxNDVMUXV1cHVXNit5WnFSNWhWWk5mM3QxaDlr?=
 =?utf-8?B?QnQrOG0zMFJKVG5zR3NsNkllVnNXZFBSSE9hSGRSY0ZSaHRmNDJqUjJKK21T?=
 =?utf-8?B?cGI5RGlMM29EenRjcUNKTlVMRGZ0WFhvQzdLdzVHbCtvRE5FbDBuTUgyRkp3?=
 =?utf-8?B?MkZ5RHgvR2EvM0prZFNEUkRtYVpjanV2UjJubi9EZmd0SWJFRzJlUGpFNzZI?=
 =?utf-8?B?U0x6TWhhSGdEZHhzQUxGWWd3WkJnbThrVjVNZjdLSDJXOFgvbGNnYnBnV0p5?=
 =?utf-8?B?dCthb1lsU1hYOGl1YkVrampaelM5VXVTWDVRZ0dINDlFbDh2cEtycE02dmZo?=
 =?utf-8?B?ckZzeC8rL3RtSnpNV0tnbCtqZ2h3Y1ZEbVZoai9ydDhzaUlZMWFKV1pHaFg5?=
 =?utf-8?B?cVRJaWpEN0xXdU04SGQ0UThnRFcwNFZ3NEt6aE5zeWFscURrODdlZVZmNEQr?=
 =?utf-8?B?MW1abXJ3RFNaMmtpZGYzSi9oOU01TjBHMnBtTXdCaXZ3b0RvRDdxazNETng5?=
 =?utf-8?B?K3g3OUdacllUdkJrNWdUM1I4Ym1sVk9UT0x0NzdDOFFhMldGK3lTRXl2SHps?=
 =?utf-8?B?MWtQTk9LQVRYK3hmTCs0a0lMQ0QxQzVxUzZvZTMxaisraklTcmdEdktYSDZU?=
 =?utf-8?B?WCtrMUg0V1UrTHNXOTdhQkdiMXFNdEM5ZHFyVWFNUUY1dXcyNFpjNlgxdnk4?=
 =?utf-8?B?a2g2UFU4WThzU0Y1YUtHeVFkVys0SloraFZSLzUyUnhRVmszUzZTTzBzdmxV?=
 =?utf-8?B?amhCL2V3SHkycExOYnhnRFJWMDl4U29FWnFoWVRIS3hkYjJ5bUJLTGFsVUpF?=
 =?utf-8?B?WnM4V2hDMk9RL0QwMW0yRE9EUDdVbm92M2NRdk9LZU91amxQb0grQmZSNmUw?=
 =?utf-8?B?SUp3VmJGVEFRbmtGUnlQT0JSZVUvZ1pLblpuMG5tRlJML3RIV0ZPZnNOY1Rw?=
 =?utf-8?B?dnNpc3REMUkyWmduNjZmb3lZUWxoRFJ6Z2N0MWs4OVdUOGlVR2hiL1FqOWFW?=
 =?utf-8?B?elhYS0l4ZG9IeWthZFpvTmNFUTVVeGplZ3IvOExaL2t3bWlMclovOWpRbTRJ?=
 =?utf-8?B?UWEzbzFOUS9wSUFWM0JGbkhmY2lTUmgzemhtN0pZVHh6eHNzRzZNTkFLUE9C?=
 =?utf-8?B?TzdnUldkUDBlaDNmV1B3MSt2R3BKaGZydHZzRm1mOVFHSmJYZnZVTWZUUWlO?=
 =?utf-8?B?eGhGdjRXMXJDYVZEUzVRNFkwbDFWMG90U0lLQmxlNmFwcEYrU0U5NVdCNjZX?=
 =?utf-8?B?WHlvS2E1MTFHODNWZzU0RTY4Rm8yZE9FU292M3dZYThoSXFya1QyZnhLRHFp?=
 =?utf-8?B?MVo0MkNYdkNld2JNYWppK1dxMkVrT2p3Z1BxM0REbmhRREF4SFI1eDB4djNS?=
 =?utf-8?B?aGRJelRnNXRQQmIvaHlLUS9sejFiVDNWR3BydlF6S3ZNUlRWcjBsbElCVW00?=
 =?utf-8?B?UjhLcHBJa3dlSHBlKzZ0SVZCSUxQQUFXb1JuSkdjM0t4YTFXbzQwSk1qMStN?=
 =?utf-8?B?YitzZERla045VmU4aU5mVGVFWnc3OHVPbUZyRTBGbmpLRVZlVi8yc3JENXI4?=
 =?utf-8?B?TjFndmx2ekx4K1hMdFBwRGFzQjY5c0poWWZMWG5pQjB3Nk1EWU5mUTJSaDIr?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a19d7bd-2e45-413d-403e-08dd04c8ce8a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6619.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 16:24:26.4673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gvoPRHZ32CYEoLHS8WtHp6aB+ZjbmE70xRKTaYEATFdWvi3Rp67Ae4zw5sUCBgzoh3VsHcp8xiWY4R2cue5zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7589
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


W dniu 14.11.2024 o 15:05, Grzegorzek, Dominik pisze:
> On Thu, 2024-11-14 at 11:31 +0100, Andrzej Hajda wrote:
>> There is lot of redundancy in shaders code regarding load/store messages.
>> It makes the code barely readable. Simplify it by using macros in iga64
>> assembler.
>> Every load/store operation is split into two phases:
>> 1. Load address/descriptor (from) where data should be stored/loaded.
>> 2. Issue load/store instruction.
>> Shader threads needs two types of memory access:
>> 3. Private area per thread.
>> 4. Area shared per all threads.
>> Different platforms access surface in different ways:
>> 5. Using media block messages.
>> 6. Using untyped 2d block messages.
>> 7. Future platforms will use different messages.
>>
>> All this is simplified to two macros per message in shader:
>> 	load_(shared|thread)_space_addr(dst,y,width)
>> 	(load|store)_space_dw(dst, src)
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   lib/gpgpu_shader.c          | 160 +++------------------
>>   lib/iga64_generated_codes.c | 338 ++++++++++++++++++++++----------------------
>>   lib/iga64_macros.h          |  43 ++++++
>>   3 files changed, 230 insertions(+), 311 deletions(-)
>>
>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>> index 4e1b8d5e9009..7728f96bf305 100644
>> --- a/lib/gpgpu_shader.c
>> +++ b/lib/gpgpu_shader.c
>> @@ -431,22 +431,8 @@ void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
>>   
>>   	size = emit_iga64_code(shdr, jump_dw_neq, "					\n\
>>   L0:											\n\
>> -(W)		mov (16|M0)              r30.0<1>:ud    0x0:ud				\n\
>> -#if GEN_VER < 2000 // Media Block Write							\n\
>> -	// Y offset of the block in rows := thread group id Y				\n\
>> -(W)		mov (1|M0)               r30.1<1>:ud    ARG(0):ud			\n\
>> -	// block width [0,63] representing 1 to 64 bytes, we want dword			\n\
>> -(W)		mov (1|M0)               r30.2<1>:ud    0x3:ud				\n\
>> -	// FFTID := FFTID from R0 header						\n\
>> -(W)		mov (1|M0)               r30.4<1>:ud    r0.5<0;1,0>:ud  		\n\
>> -(W)		send.dc1 (16|M0)         r31     r30      null    0x0	0x2190000	\n\
>> -#else // Typed 2D Block Store								\n\
>> -	// Store X and Y block start (160:191 and 192:223)				\n\
>> -(W)            mov (1|M0)               r30.6<1>:ud    ARG(0):ud			\n\
>> -	// Store X and Y block size (224:231 and 232:239)				\n\
>> -(W)            mov (1|M0)               r30.7<1>:ud    0x3:ud				\n\
>> -(W)            send.tgm (16|M0)         r31     r30    null:0    0x0    0x62100003	\n\
>> -#endif											\n\
>> +		load_shared_space_addr(r30, ARG(0):ud, 4)				\n\
>> +(W)		load_space_dw(r31, r30)							\n\
>>   	// clear the flag register							\n\
>>   (W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
>>   (W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(1):ud	\n\
>> @@ -511,28 +497,13 @@ void gpgpu_shader__common_target_write(struct gpgpu_shader *shdr,
>>   				       uint32_t y_offset, const uint32_t value[4])
>>   {
>>   	emit_iga64_code(shdr, common_target_write, "				\n\
>> -(W)	mov (16|M0)		r30.0<1>:ud	0x0:ud				\n\
>>   (W)	mov (16|M0)		r31.0<1>:ud	0x0:ud				\n\
>>   (W)	mov (1|M0)		r31.0<1>:ud	ARG(1):ud			\n\
>>   (W)	mov (1|M0)		r31.1<1>:ud	ARG(2):ud			\n\
>>   (W)	mov (1|M0)		r31.2<1>:ud	ARG(3):ud			\n\
>>   (W)	mov (1|M0)		r31.3<1>:ud	ARG(4):ud			\n\
>> -#if GEN_VER < 2000 // Media Block Write						\n\
>> -	// Y offset of the block in rows					\n\
>> -(W)	mov (1|M0)		r30.1<1>:ud	ARG(0):ud			\n\
>> -	// block width [0,63] representing 1 to 64 bytes			\n\
>> -(W)	mov (1|M0)		r30.2<1>:ud	0xf:ud				\n\
>> -	// FFTID := FFTID from R0 header					\n\
>> -(W)	mov (1|M0)		r30.4<1>:ud	r0.5<0;1,0>:ud			\n\
>> -	// written value							\n\
>> -(W)	send.dc1 (16|M0)	null	r30	src1_null  0x0	0x40A8000	\n\
>> -#else	// Typed 2D Block Store							\n\
>> -	// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)	mov (1|M0)              r30.6<1>:ud     ARG(0):ud			\n\
>> -	// Store X and Y block size (224:231 and 232:239)			\n\
>> -(W)	mov (1|M0)              r30.7<1>:ud     0xf:ud				\n\
>> -(W)	send.tgm (16|M0)        null    r30     null:0  0x0     0x64000007	\n\
>> -#endif										\n\
>> +	load_shared_space_addr(r30, ARG(0):ud, 16)				\n\
>> +(W)	store_space_dw(r30, r31)						\n\
>>   	", y_offset, value[0], value[1], value[2], value[3]);
>>   }
>>   
>> @@ -565,31 +536,8 @@ void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset)
>>   	emit_iga64_code(shdr, media_block_write_aip, "				\n\
>>   	// Payload								\n\
>>   (W)	mov (1|M0)               r5.0<1>:ud    cr0.2:ud				\n\
>> -#if GEN_VER < 2000 // Media Block Write						\n\
>> -	// X offset of the block in bytes := (thread group id X << ARG(0))	\n\
>> -(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    0x2:ud		\n\
>> -	// Y offset of the block in rows := thread group id Y			\n\
>> -(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// block width [0,63] representing 1 to 64 bytes			\n\
>> -(W)	mov (1|M0)               r4.2<1>:ud    0x3:ud				\n\
>> -	// FFTID := FFTID from R0 header					\n\
>> -(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud			\n\
>> -(W)	send.dc1 (16|M0)         null     r4   src1_null 0       0x40A8000	\n\
>> -#else // Typed 2D Block Store							\n\
>> -	// Load r2.0-3 with tg id X << ARG(0)					\n\
>> -(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x2:ud		\n\
>> -	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
>> -(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// payload setup							\n\
>> -(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
>> -	// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
>> -	// Store X and Y block max_size (224:231 and 232:239)			\n\
>> -(W)	mov (1|M0)               r4.7<1>:ud    0x3:ud				\n\
>> -(W)	send.tgm (16|M0)         null     r4   null:0    0    0x64000007	\n\
>> -#endif										\n\
>> +	load_thread_space_addr(r4, 0, ARG(0):ud, 4)				\n\
>> +(W)	store_space_dw(r4, r5)							\n\
>>   	", y_offset);
>>   }
>>   
>> @@ -618,38 +566,11 @@ void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t value)
>>   void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>>   			       uint32_t y_offset)
>>   {
>> -	emit_iga64_code(shdr, media_block_write, "				\n\
>> -	// Clear message header							\n\
>> -(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
>> -	// Payload								\n\
>> -(W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud			\n\
>> -(W)	mov (1|M0)               r5.1<1>:ud    ARG(4):ud			\n\
>> -(W)	mov (1|M0)               r5.2<1>:ud    ARG(5):ud			\n\
>> -(W)	mov (1|M0)               r5.3<1>:ud    ARG(6):ud			\n\
>> -#if GEN_VER < 2000 // Media Block Write						\n\
>> -	// X offset of the block in bytes := (thread group id X << ARG(0))	\n\
>> -(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// Y offset of the block in rows := thread group id Y			\n\
>> -(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(1):ud	\n\
>> -	// block width [0,63] representing 1 to 64 bytes			\n\
>> -(W)	mov (1|M0)               r4.2<1>:ud    ARG(2):ud			\n\
>> -	// FFTID := FFTID from R0 header					\n\
>> -(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud			\n\
>> -(W)	send.dc1 (16|M0)         null     r4   src1_null 0    0x40A8000		\n\
>> -#else // Typed 2D Block Store							\n\
>> -	// Load r2.0-3 with tg id X << ARG(0)					\n\
>> -(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
>> -(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud	\n\
>> -	// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
>> -	// Store X and Y block max_size (224:231 and 232:239)			\n\
>> -(W)	mov (1|M0)               r4.7<1>:ud    ARG(2):ud			\n\
>> -(W)	send.tgm (16|M0)         null     r4   null:0    0    0x64000007	\n\
>> -#endif										\n\
>> -	", 2, y_offset, 3, value, value, value, value);
>> +	emit_iga64_code(shdr, media_block_write, "		\n\
>> +(W)	mov (1)		r5.0<1>:ud    ARG(1):ud			\n\
>> +	load_thread_space_addr(r4, 0, ARG(0):ud, 4)		\n\
>> +(W)	store_space_dw(r4, r5)					\n\
>> +	", y_offset, value);
>>   }
>>   
>>   /**
>> @@ -697,41 +618,14 @@ void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value,
>>   				      uint32_t y_offset, uint32_t mask, uint32_t expected)
>>   {
>>   	emit_iga64_code(shdr, write_on_exception, "					\n\
>> -	// Clear message header								\n\
>> -(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud					\n\
>> -	// Payload									\n\
>> -(W)	mov (1|M0)               r5.0<1>:ud    ARG(4):ud				\n\
>> -#if GEN_VER < 2000 // prepare Media Block Write						\n\
>> -	// X offset of the block in bytes := (thread group id X << ARG(0))		\n\
>> -(W)	add (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
>> -(W)	shl (1|M0)               r4.0<1>:ud    r4.0<0;1,0>:ud    ARG(0):ud		\n\
>> -	// Y offset of the block in rows := thread group id Y				\n\
>> -(W)	add (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud   ARG(2):ud		\n\
>> -	// block width [0,63] representing 1 to 64 bytes				\n\
>> -(W)	mov (1|M0)               r4.2<1>:ud    ARG(3):ud				\n\
>> -	// FFTID := FFTID from R0 header						\n\
>> -(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud				\n\
>> -#else // prepare Typed 2D Block Store							\n\
>> -	// Load r2.0 with tg id (X + ARG(1)) << ARG(0)					\n\
>> -(W)	add (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
>> -(W)	shl (1|M0)               r2.0<1>:ud    r2.0<0;1,0>:ud    ARG(0):ud		\n\
>> -	// Load r2.4-7 with tg id Y + ARG(2):ud						\n\
>> -(W)	add (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud    ARG(2):ud		\n\
>> -	// Store X and Y block start (160:191 and 192:223)				\n\
>> -(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud				\n\
>> -	// Store X and Y block max_size (224:231 and 232:239)				\n\
>> -(W)	mov (1|M0)               r4.7<1>:ud    ARG(3):ud				\n\
>> -#endif											\n\
>> +(W)	mov (1|M0)		r5.0<1>:ud	ARG(2):ud				\n\
>> +	load_thread_space_addr(r4, ARG(0), ARG(1):ud, 4)				\n\
>>   	// Check if masked exception is equal to provided value and write conditionally \n\
>> -(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(5):ud		\n\
>> -(W)      mov (1|M0)              f0.0<1>:ud     0x0:ud					\n\
>> -(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(6):ud		\n\
>> -#if GEN_VER < 2000 // Media Block Write							\n\
>> -(W&f0.0) send.dc1 (16|M0)        null     r4   src1_null 0    0x40A8000			\n\
>> -#else // Typed 2D Block Store								\n\
>> -(W&f0.0) send.tgm (16|M0)        null     r4   null:0    0    0x64000007		\n\
>> -#endif											\n\
>> -	", 2, x_offset, y_offset, 3, value, mask, expected);
>> +(W)     and (1|M0)		r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(3):ud		\n\
>> +(W)     mov (1|M0)		f0.0<1>:ud     0x0:ud					\n\
>> +(W)     cmp (1|M0) (eq)f0.0	null:ud        r3.0<0;1,0>:ud  ARG(4):ud		\n\
>> +(W&f0.0) store_space_dw(r4, r5)								\n\
>> +	", 4 * x_offset, y_offset, value, mask, expected);
>>   }
>>   
>>   /**
>> @@ -778,22 +672,8 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>>   	emit_iga64_code(shdr, end_system_routine_step_if_eq, "				\n\
>>   (W)		or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud	\n\
>>   (W)		and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud	\n\
>> -(W)		mov (16|M0)              r30.0<1>:ud    0x0:ud				\n\
>> -#if GEN_VER < 2000 // Media Block Write							\n\
>> -		// Y offset of the block in rows := thread group id Y			\n\
>> -(W)		mov (1|M0)               r30.1<1>:ud    ARG(1):ud			\n\
>> -		// block width [0,63] representing 1 to 64 bytes, we want dword		\n\
>> -(W)		mov (1|M0)               r30.2<1>:ud    0x3:ud				\n\
>> -		// FFTID := FFTID from R0 header					\n\
>> -(W)		mov (1|M0)               r30.4<1>:ud    r0.5<0;1,0>:ud			\n\
>> -(W)		send.dc1 (16|M0)         r31     r30      null    0x0	0x2190000	\n\
>> -#else	// Typed 2D Block Store								\n\
>> -		// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)		mov (1|M0)               r30.6<1>:ud    ARG(1):ud			\n\
>> -		// Store X and Y block size (224:231 and 232:239)			\n\
>> -(W)		mov (1|M0)               r30.7<1>:ud    0x3:ud				\n\
>> -(W)		send.tgm (16|M0)         r31     r30    null:0    0x0    0x62100003	\n\
>> -#endif											\n\
>> +		load_thread_space_addr(r30, 0, ARG(0):ud, 4)				\n\
>> +(W)		load_space_dw(r31, r30)							\n\
>>   		// clear the flag register						\n\
>>   (W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
>>   (W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(2):ud	\n\
>> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
>> index 0bd92b8c4dc9..017adefce400 100644
>> --- a/lib/iga64_generated_codes.c
>> +++ b/lib/iga64_generated_codes.c
>> @@ -3,7 +3,7 @@
>>   
>>   #include "gpgpu_shader.h"
>>   
>> -#define MD5_SUM_IGA64_ASMS e2d97ef45d5f322200793a0aa76872d7
>> +#define MD5_SUM_IGA64_ASMS fa1b0aa75c3ee1cd13300ad1324737b4
>>   
>>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> @@ -80,71 +80,81 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>> -	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>> -		0x80100961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e654220, 0x00000000, 0xc0ded001,
>> +		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x1e558220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x1e558220, 0x02001e54, 0x00000000,
>> +		0x80000040, 0x1e658220, 0x02000064, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
>> -		0x80132031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>> +		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
>>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>> -		0x80040961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x1e058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x1e058220, 0x02001e04, 0x00000000,
>> +		0x80000040, 0x1e258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x81000965, 0x80218220, 0x02008020, 0xc0ded003,
>>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>> -		0x80100961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
>> +		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x1e058220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x1e058220, 0x02001e04, 0x00000000,
>> +		0x80000040, 0x1e158220, 0x02000064, 0xc0ded000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80032031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
>>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>> -		0x80040961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x1e058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x1e058220, 0x02001e04, 0x00000000,
>> +		0x80000040, 0x1e258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x81000965, 0x80218220, 0x02008020, 0xc0ded003,
>>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
>> +	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
>>   		0x80000166, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
>> -		0x80040161, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +		0x80030161, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x1e058220, 0x02000024, 0x00000002,
>> +		0x80000140, 0x1e058220, 0x02001e04, 0x00000000,
>> +		0x80000040, 0x1e258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80009031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x81000165, 0x80218220, 0x02008020, 0xc0ded003,
>> @@ -193,84 +203,83 @@ struct iga64_template const iga64_code_breakpoint_suppress[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_write_on_exception[] = {
>> -	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x02058220, 0x02000014, 0xc0ded001,
>> -		0x80001969, 0x02058220, 0x02000204, 0xc0ded000,
>> -		0x80000040, 0x02158220, 0x02000064, 0xc0ded002,
>> -		0x80041961, 0x04550220, 0x00220205, 0x00000000,
>> -		0x80000061, 0x04754220, 0x00000000, 0xc0ded003,
>> -		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
>> +	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04558220, 0x02000454, 0xc0ded000,
>> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded001,
>> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
>> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> -		0x84132031, 0x00000000, 0xd00e0494, 0x04000000,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>> +		0x84032031, 0x00000000, 0xd00e0494, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
>> -		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
>> +		0x80000965, 0x03058220, 0x02008020, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x81004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000014, 0xc0ded001,
>> -		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04158220, 0x02000064, 0xc0ded002,
>> -		0x80000061, 0x04254220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04158220, 0x02000064, 0xc0ded001,
>> +		0x80000061, 0x04254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04450220, 0x00000054, 0x00000000,
>> -		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
>> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> -		0x84132031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>> +		0x84032031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
>> -		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
>> +		0x80000965, 0x03058220, 0x02008020, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x81004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
>> -		0x80000169, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80000140, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80000165, 0x03058220, 0x02008020, 0xc0ded005,
>> +		0x80000165, 0x03058220, 0x02008020, 0xc0ded003,
>>   		0x80000161, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80000270, 0x00018220, 0x12000304, 0xc0ded006,
>> -		0x81049031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80000270, 0x00018220, 0x12000304, 0xc0ded004,
>> +		0x81009031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -324,84 +333,68 @@ struct iga64_template const iga64_code_clear_exception[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_media_block_write[] = {
>> -	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
>> -		0x80000061, 0x02150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
>> -		0x80041961, 0x04550220, 0x00220205, 0x00000000,
>> -		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
>> -		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
>> +	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
>> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
>> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
>> +		0x80032031, 0x00000000, 0xd00e0494, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 1270, .size = 48, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
>> -		0x80000061, 0x04150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
>> -		0x80000061, 0x04254220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 1260, .size = 44, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04158220, 0x02000064, 0xc0ded000,
>> +		0x80000061, 0x04254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80032031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 1250, .size = 48, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 0, .size = 44, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80000140, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80009031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -432,65 +425,68 @@ struct iga64_template const iga64_code_write_aip[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_media_block_write_aip[] = {
>> -	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>> -		0x80000969, 0x02058220, 0x02000014, 0x00000002,
>> -		0x80000061, 0x02150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x02158220, 0x02000214, 0xc0ded000,
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
>> +		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
>> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
>>   		0x80000061, 0x04754220, 0x00000000, 0x00000003,
>> -		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
>> +		0x80032031, 0x00000000, 0xd00e0494, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1270, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1270, .size = 48, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008040, 0x00000000,
>> -		0x80000969, 0x04058220, 0x02000024, 0x00000002,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded000,
>> +		0x80030961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1260, .size = 40, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1260, .size = 44, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>> -		0x80000969, 0x04058220, 0x02000014, 0x00000002,
>> -		0x80000061, 0x04150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x04158220, 0x02000414, 0xc0ded000,
>> +		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04158220, 0x02000064, 0xc0ded000,
>>   		0x80000061, 0x04254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80032031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1250, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1250, .size = 48, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008040, 0x00000000,
>> -		0x80000969, 0x04058220, 0x02000024, 0x00000002,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded000,
>> +		0x80030961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 0, .size = 40, .code = (const uint32_t []) {
>> +	{ .gen_ver = 0, .size = 44, .code = (const uint32_t []) {
>>   		0x80000161, 0x05050220, 0x00008040, 0x00000000,
>> -		0x80000169, 0x04058220, 0x02000024, 0x00000002,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80000140, 0x04258220, 0x02000424, 0xc0ded000,
>> +		0x80030161, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80000140, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80009031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -499,77 +495,77 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>>   
>>   struct iga64_template const iga64_code_common_target_write[] = {
>>   	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
>> -		0x80132031, 0x00000000, 0xd00e1e94, 0x04000000,
>> +		0x80032031, 0x00000000, 0xd00e1e94, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80032031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80009031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -627,56 +623,56 @@ struct iga64_template const iga64_code_clear_r40[] = {
>>   
>>   struct iga64_template const iga64_code_jump_dw_neq[] = {
>>   	{ .gen_ver = 2000, .size = 32, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
>> -		0x80132031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>> +		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x84000020, 0x00004000, 0x00000000, 0xffffffa0,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1270, .size = 40, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1260, .size = 36, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80032031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x84000020, 0x00004000, 0x00000000, 0xffffff90,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1250, .size = 40, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 0, .size = 36, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80009031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x81000120, 0x00004000, 0x00000000, 0xffffff90,
>> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
>> index 03cc726d48c2..0fd5e268d957 100644
>> --- a/lib/iga64_macros.h
>> +++ b/lib/iga64_macros.h
>> @@ -13,4 +13,47 @@
>>   #define src1_null null:0
>>   #endif
>>   
>> +/* GPGPU_R0Payload fields, Bspec: 55396, 56587 */
>> +#define r0_tgidx r0.1<0;1,0>:ud
>> +#define r0_tgidy r0.6<0;1,0>:ud
>> +#define r0_fftid r0.5<0;1,0>:ud
>> +
>> +#define load_shared_media_block_msg_hdr(dst, y, width)	\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
>> +(W)	mov (1)		dst.1<1>:ud	y		;\
>> +(W)	mov (1)		dst.2<1>:ud	(width - 1):ud	;\
>> +(W)	mov (1)		dst.4<1>:ud	r0_fftid
>> +
>> +#define load_thread_media_block_msg_hdr(dst, x, y, width)	\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud			;\
>> +(W)	shl (1)		dst.0<1>:ud	r0_tgidx	0x2:ud	;\
>> +(W)	add (1)		dst.0<1>:ud	dst.0<0;1,0>:ud	x:ud	;\
>> +(W)	add (1)		dst.1<1>:ud	r0_tgidy	y	;\
>> +(W)	mov (1)		dst.2<1>:ud	(width - 1):ud		;\
>> +(W)	mov (1)		dst.4<1>:ud	r0_fftid
>> +
>> +#define load_shared_a2dblock_payload(dst, y, width)	\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
>> +(W)	mov (1)		dst.6<1>:ud	y		;\
>> +(W)	mov (1)		dst.7<1>:ud	(width - 1):ud
>> +
>> +#define load_thread_a2dblock_payload(dst, x, y, width)		\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud			;\
>> +(W)	shl (1)		dst.5<1>:ud	r0_tgidx	0x2:ud	;\
>> +(W)	add (1)		dst.5<1>:ud	dst.5<0;1,0>:ud	x:ud	;\
>> +(W)	add (1)		dst.6<1>:ud	r0_tgidy	y	;\
>> +(W)	mov (1)		dst.7<1>:ud	(width - 1):ud		;\
>> +
>> +#if GEN_VER < 2000
>> +#define load_shared_space_addr(dst, y, width) load_shared_media_block_msg_hdr(dst, y, width)
>> +#define load_thread_space_addr(dst, x, y, width) load_thread_media_block_msg_hdr(dst, x, y, width)
>> +#define load_space_dw(dst, src) send.dc1 (1)	dst	src	src1_null 0x0	0x2190000
>> +#define store_space_dw(dst, src) send.dc1 (1)	null	dst	null	0x0	0x40A8000
>> +#else
>> +#define load_shared_space_addr(dst, y, width) load_shared_a2dblock_payload(dst, y, width)
>> +#define load_thread_space_addr(dst, x, y, width) load_thread_a2dblock_payload(dst, x, y, width)
> Only width of those spaces? Possibly we could have height of the block parametrized too, right? That
> could be added when use case arises of course.
>
> Mine concern about those macros commes from the fact that future reader may think that this is part
> of iga assembly. Could we by any chance change the name so it emphasis that it is our own making?


Capitalize?

IMHO syntax  "f(x, y...)" already suggests it is not iga64, but 
capitalization is even stronger signal :)


> Or
> somhow point reader to the implementation of those. There are obviously some constrains, i.e. wrt to
> the 'width' params, which user can only deduce by reading the implementation.

Hmm, comment on the top of file? Adding "#include <...>"to each shader 
looks overkill for me for now (but is the most explicit way).

In the latter case we would need to move macros to another include file, 
then add sth like "#include <space_helpers.h>" to shaders.

But as I said before, it would be nice if our macro library grows, for 
now it seems overkill, but I am open to suggestions :)


Regards

Andrzej


>
> Regards, Dominik
>
>> +#define load_space_dw(dst, src) send.tgm (1)	dst	src	null:0	0x0	0x62100003
>> +#define store_space_dw(dst, src) send.tgm (1)	null	dst	null:0	0x0	0x64000007
>> +#endif
>> +
>>   #endif
>>
