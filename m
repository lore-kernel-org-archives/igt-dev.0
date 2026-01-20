Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A33D2ECE9
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 15:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B7F10E61B;
	Tue, 20 Jan 2026 15:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLuex3Cr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA6510E61B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768921811; x=1800457811;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fS7YTHHAJ6wo+YWJWbt598VL+RI+WwN4gleT60vO07Y=;
 b=RLuex3CrNm2MQSCPgn9rAjjPV04tbZbJGlPd1yd/JOEZadpv954e6wlR
 SH8S1ujZBJOa09PX/EwHB7takACwA+vvwWbvcaQPBhXI7yoDKYU9900Qh
 uZpzIiJ0FSN61DMnW7jg+tSDmtGViJq2dIXAkSzkPHrV3KWnB5RuFzO51
 8Wu1abhq6gHzPdqvNO74LCl1vHAu+d87/G43bQ5HJ+JEcoau56K8JwxuT
 Pj80OZBNrHhuWv15qPZI1UX/EbzgAOxBuNS37mjzcKeBdIiNAo6mpenD9
 cHqdMFhGNWGS3YP7TATNgDAckeLdIALqKSLuMV2doIxnQmiyId0nFO66X A==;
X-CSE-ConnectionGUID: TtPQ364KQUSJF16euiknfQ==
X-CSE-MsgGUID: x/szIQgaQamFcQd9FZE8yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69865083"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="69865083"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:10:11 -0800
X-CSE-ConnectionGUID: KzBOHdNgSCmeRT7UEogv7Q==
X-CSE-MsgGUID: kzFEVzU4T22Rrlf8TeCWgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210612403"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:10:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 07:10:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 07:10:09 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 07:10:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlKc6njcBw0WG58cYw674RNDjKkB/RuL58t91E/NFiKOXpdkuy13AKky+fWOHjJsPZ2KihpSPoFCI6nVao4EDbH6bZCoTKZGpPMlUZNVEO828g+GibFVK6P20tfGmHXZquv9Vhqhah03LdqRuMbT0H3lEEaKNVD+NVwrjRXK0ikwBxYI4cc07Q2JmEbYOzvVO4Vdf2OfaMyOtWs2D8FB9u5rb/Ojlupt9S7vfuiYSWNWU9SUt6piY5XmEcmlk67UEJf2yHFhzYvA3A5RJzp9UG037z1YdeQXj0XCc59YU8Umq4mtE/suqQPod4q3549VyjQCbm9/0CfVGeHHiMygRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EX5aDspCdhcyqpAY6vfIY396aYgHjZGNgQiv5aobXqU=;
 b=V/ZpLZNjhAXWnZATpCgJR1xk+UP9lcpE8lcJd/tlf9HmxAxne1y//djDZCCIszQWKwWcMm6VXqCRCW80H9BcSDfpUva/N6HJojf57PNWX2rdSsDBqYRzIif43M5t8jH4IdWgnI8GF0JlZcW1XBZrvGo1m1YlPCgQWlqkuI2aWmbPC1H2b1rXufQXFBWng41iG+XWEKAsiJgge+tuUPi/bAAqyKaqbbSIV27PAY/qw17wtITObDCNxqWWYrX3e8pQzWLkLh2xGaly1T7NpW4fAj7ewWZrfws0HdGpf7TM0r625MXXG6UV1iRGpXTZ20TfaLRwmUxbvjzDkZr7RynyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by IA3PR11MB9040.namprd11.prod.outlook.com (2603:10b6:208:576::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 20 Jan
 2026 15:10:06 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 15:10:06 +0000
Message-ID: <3d05e422-eed5-446d-ac75-32cb3e29559a@intel.com>
Date: Tue, 20 Jan 2026 20:39:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_exec_system_allocator: Add
 purgeable memory madvise tests
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <nishit.sharma@intel.com>, <pravalika.gurram@intel.com>
References: <20260120061141.3139060-1-arvind.yadav@intel.com>
 <20260120061141.3139060-4-arvind.yadav@intel.com>
 <d2a42b33a4b948eb5ab4043a80add20b1ec759c2.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <d2a42b33a4b948eb5ab4043a80add20b1ec759c2.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::16) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|IA3PR11MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: a5759a9c-0764-40f4-db25-08de5835fe59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGU0ZHZFVGhpRTZlUnhRcjJnUENSMnZiM2dqdE1rNWdQQVJKcnRIUHF3aFhM?=
 =?utf-8?B?WnVBN3NobDFGK2ZZckl3NjVMeGY5RW04TWJmUXc0RW1jaWxjTlVjamFNOXA3?=
 =?utf-8?B?K1NrMUdXQ3V4eERBUjdxR2xQUjR6MGdGVU01aWhGQWFPYWVmc3JlcFE5eGdy?=
 =?utf-8?B?K2phRk81bDRCajN5dnVUeENpV1NRaGFneFo1clJyZmJKSWgvWnNMT3RNY2dW?=
 =?utf-8?B?U0FIb1dkOXpEc2lvSTFjdlVRZXliYUsyRENjTUpldFljeG9BcmRGMmxNWkdI?=
 =?utf-8?B?QmY0T3hjK2h2Qzd2VGVzdkdBWHNlY2kvSHFTMHBXRHNEQlhTNWNaMnNXR3Bq?=
 =?utf-8?B?a2xjLzQvWGlHOWNqditnZ3Ixc2JhMWNXR2V2YzFxSDlwTzZTY1hRaU1Ia2E4?=
 =?utf-8?B?ajBERCtFT25La3RRU3ZObUNnQnpYZXZLYXBXUkFJcXFDeVlrTjYySWZIaDFX?=
 =?utf-8?B?cW41Uk1CbWlwZHFLaDJyc3N5ejhIZDZYZ3JEbkpHeDdTaWl4TUYrU3NJelVv?=
 =?utf-8?B?VUxkckNiTWQ2NjJFQ2xVUEJwQlFETkZFdmxYQ3lhYzkzOENGMUxjbXZkeFJx?=
 =?utf-8?B?TjRTVGhhRWFJS2w2VklaU0ZoZ2U2Z2pLcGdqS0ZMQ3J2ekM2SDhadVJ4Sm5O?=
 =?utf-8?B?aFFhajNiR1lmaTFYdVNBanBnbmV5TGdodDdmVmRYb0FWZlJ5cC9qckdpZWhK?=
 =?utf-8?B?eFVHRzZVcUdXTXNrZTFYUG9vR2FZN1YyS1ZHMGJXZTlQWUFtMThlUmI5Y2pS?=
 =?utf-8?B?dkI5K05jVitGNVllNm5UWVkzWGJuUTZvSzVPZGVNb20rNk4raDdEa0tMY1Bq?=
 =?utf-8?B?SEk2M01saFo4cVQ5Vy9GalI4MFI5MDJrVTZpWEY0Qmd6WjlTdXB1NWJ6cEtT?=
 =?utf-8?B?UnF4cGF6ekFCMjljTEhjZUdzcUorNFZ4b200bGduVjVQaStVV1dxTmFmb3Zx?=
 =?utf-8?B?NVk4NithbWtQRDJjUnIzVXlMck5RR1F5YS9YcnI1ZnM2SlJxWlZ4bHdsWXhv?=
 =?utf-8?B?M3A3TFJhZXNsa3NqWElpRUhLSGtjVEtra2ticjFNYk1xMjE4QXFreU1PeVVX?=
 =?utf-8?B?MEttYWRncnY5MkVTVUZ4Wk9kYVR3S3dxVDBNbmh4SWtNZDJwY1JjbVg2WjQx?=
 =?utf-8?B?R2tnV2UzeWpFRW9pUEVTcExZYW9aS3ovdnJWbmtQUkNENzFYWnJNMTltUW5E?=
 =?utf-8?B?cGEvTGluekFrZDhzZ2RYQU40NGx6UG9mQXJjVllhZVZJNHlSQ1g2NEFRdlVX?=
 =?utf-8?B?U1JEUUxBTkcrWjRCUzQ5ZXVCNzJXU0tmNlVwSW9hZkxieGJXcVBHelN5OUxv?=
 =?utf-8?B?VjBPY2h4aktiSHY4T1oxd1hib0NkWXMvTmhFdVE0WGpNblpTd093TlRsQWdn?=
 =?utf-8?B?clMxcG5EWDJ4cngzU3VhMzBseFF3UEFYM1MvOG50L2EyNmRSUStVT1VhWHdC?=
 =?utf-8?B?ZzcxdDdGRm85bm1pZFYrSEJRWFdJeFp1cGVrc28rTDRISnlCWHBXYldaenBq?=
 =?utf-8?B?UU1zbHpOZHZUbGpBdGVsSmgvL1U0TlkzWGF6OFB1NFdJdVNlRUlsNXNTMHRi?=
 =?utf-8?B?SkZUWm1mZHpha3NLeFpWSWRsb2NRUEtCVXBUVnFDQWw2S1YwVEUvcEIzZHVZ?=
 =?utf-8?B?M0c5V3VBcExyZTFlTEwwZGpsSkx6Ry9Ebk10b2h5d242WEJYUWNQc3krSXUw?=
 =?utf-8?B?dllxRTNSNCtUM0pyR3J6cXpoaE1aRVRxSU5VS2pkVjJxajFOTm55MlVyOHY0?=
 =?utf-8?B?UVRrakhScyt1bTBHVkUvdU1CTVU2N2UwL2k4SXlYOEZkVDRKTkFOYUUxQ1lX?=
 =?utf-8?B?UlpEcnRYZ0tvNFF2M0JoWDM4T2tFYkJuMWpHcnZpamJFV3BaM0t4ckJtZ1hQ?=
 =?utf-8?B?NXJyU1BxbHJTSlkrUmlWZEFnOXA4bWU5U2lOaiszZHhwV2VLcUFSdDR1QW9u?=
 =?utf-8?B?dE9Jek85dTFOOW9ZTjh1VHZFdklmZG1uK0U0ZU9tVlM2S291OWNjOVJaOFY2?=
 =?utf-8?B?MXAyTllPVHNGRUk4Ymo2eXRWeGpYZnpCNDlyRjNXcy9BeHp2UFBiUTJPUHAx?=
 =?utf-8?B?R3ZYS3YyMldEYndNWEUwOGFJaEpabC9BQk9BUldmSS90VGRCd0pEWUhlbndU?=
 =?utf-8?Q?T6N0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0pFaTd2bm0yVDEyVTQ1Q2JNakRzZW5zcnQ2RE9ZTUJzaStOSk9Hd3U1MGRs?=
 =?utf-8?B?Ui9nSDhKNGRmR1M2Umtwdmw2SU5mNTZFUEQ4aGZqdVV4NVhJQnIwN1c3b01z?=
 =?utf-8?B?c3J1SHBVTFdhVGhjalNtU3N2amVqRWdJbVRTT3V5N2h5UE1sN1ZpVGd2eEVV?=
 =?utf-8?B?NU9saHM0YklQS1VPNjZuMjNBUVdxM3ZCdXNHV3RWQUlTZ3RSOE5SRC8ycE50?=
 =?utf-8?B?MFF3R0xxTjJiakUyN2pxZzdUZGZTZ01xS1dEMzJnaG9rbFVkR1hJV3NEblFv?=
 =?utf-8?B?SFR2MERwSUx3MWhkbzVPdlZhRjBNaDh2dEhzOWlZVitrT3A1TDA2N3l3TTVB?=
 =?utf-8?B?eCtVbWN4TDVFUkVCU3dnc3hOdHl5Smg5TmhiSG10RnVKcGhPRUlmS0lkbW9v?=
 =?utf-8?B?KzhSMGJJMlgxRCtWeHdhRHRLZDNhaUFoVDMyWWZKeU5qOUwrQjh5bVh6TWVi?=
 =?utf-8?B?MDI5STRiZ3U4YVNxejQyR0R0Z2dQRFl5ZGQ4SlpXSE1Dc2lheFppNUhKRFBo?=
 =?utf-8?B?WnBsK1BuckRDNFpMYUE0NndWaUNsbUtWVmpwVExKNU8ybmtUbTZZVXlPQnRW?=
 =?utf-8?B?U3A3T2JROHZCSGxlVWozUCtmNU5nSVJwRnlUV1prK3IwelljZW5xVFVSbjls?=
 =?utf-8?B?dlJTcW9yaUFTY25BL1hFYUgwQi9MTkUzMWMxWmw4UXNzS1hwemphZHpXMUZH?=
 =?utf-8?B?aDdMVmFlRGhzdzh1Y1BYQjFmSmhLN0gzVkovcXlQMUpWNjdiSjh3VVpEdnJY?=
 =?utf-8?B?L1BsYWI5cjJyWkkyL3hxYnBMSmdVcWRIcmdmY0N3ZDlXTVdQVHc5enAyN01R?=
 =?utf-8?B?b3YxampNbFpKVFppS0JXZ08vWkRGeDFld0ZKNlVxZENEQUE0a0l4NlJnVWZy?=
 =?utf-8?B?am1NZTZqWHorbDRYUHlqZlFzb0dkY2pucDNKbTd5eDRMNCtHYUsvTXNaM3dO?=
 =?utf-8?B?ZnhqUkU0NjFndHNjV0FSdmNyZFh0Sjd2bzhITDVjcGI4TUsvcExtVjJNS2Va?=
 =?utf-8?B?TmpmdHVmaFB1ZS9VRnVZbUlqWTdmUEZIZVplaUg2cXJZRVhKU0o2KzdKUENT?=
 =?utf-8?B?N3hRcHFqemNIdGQzNUR0SHNLQW4yaXFzZkJEN3VOcWliQmRGTjRUMEFBV2Vq?=
 =?utf-8?B?TlcwaWFPKzJtbWY2eUludTluNUFGMGk3UXNVUElQcjNWZHVrMFcxT0ZqRkdp?=
 =?utf-8?B?anZCVUpTYktYc2o1OER0bjNxYUlaTm5uWFpHamJqZGttWXR6YW9UU2dERUVN?=
 =?utf-8?B?MWRzV2Y4K0xWdTdoaDRTOU5vQ2lUdVdYSVhHWkkvbUcrcE5sczBWRS8rUmFL?=
 =?utf-8?B?Z2FBeXhDZHp2M1hodllXR2ZvNDkyUy9uWmVNOUl5ekNVYkx4bFVwSDJxTmZ6?=
 =?utf-8?B?UmwyejI4MFdwV3dHaTBvaFMrQnBkMUVGWlFzbmMyT25WYythTWJSTDQ1d0pk?=
 =?utf-8?B?cWVzR1FaWUtheDRoUkE0OEV2eThWb01oWmUrek4zc1RKM2VMZ1d0SG5TRFgv?=
 =?utf-8?B?d3I4THhNZUJncE5UZjZ1ZlBqOEdmZlRCVnZWWFZnOVlzOWpHa0Ezb0lzRUE1?=
 =?utf-8?B?REFJU0t0L05IelNZZklyVjlzRkx1QkF0REoza2tHaFM4dHZQbjQ3OFc4cm9o?=
 =?utf-8?B?bzFjRFJOOS92ekRoelRiK3FubHI3MVpybU9vM3FHRFhkY3BMOUl0b3ppNGVa?=
 =?utf-8?B?WjI0ZTMwanErUnFQc2JmVTRLOHJCazVnaU1seFBGOEdzeFZUL0p2bGRXVkVZ?=
 =?utf-8?B?ZGVuYkMyUWdiMmxZRmxqZ2FXd240WXJ0RWdFN0p2Nmx1aUpMdXBvRUlZdW9D?=
 =?utf-8?B?NWlVNEhHVjVGZk5VV0dKYmN5b3dCVU1xanp0VENXZkdGanViamZkSWtndTdi?=
 =?utf-8?B?ZEJQb3dzM3JPZDVoOGt0YkZReWd1NnZGVzRYWGxMZkRhUk1NWDVPblZ0ZEtV?=
 =?utf-8?B?WHJwSVdKd3lJbkFFdCt3MjBjR2svWEVUY3Bjay9kc3R3M3F2cExGMTJqclhj?=
 =?utf-8?B?bEJIRlY0aDRsVkNnQ0NGYWwxMWkrbkFFZU1tU2dGaUx3aDlDY3l5dFM2MjFp?=
 =?utf-8?B?YVRqS3kvRzRGbHc5ZHlkVVRsS3drdXdGYnd3akhIZVlCQVNUTFRBUnBMcnRV?=
 =?utf-8?B?anBGOGo5YVIxd0l0UFgxTmVXTGdsOFNIa1RSUkRqR0JpQk91WS8zQzZzUVJ2?=
 =?utf-8?B?aUVPMmp6OUROVm9wMFV1QU5DNG16MFhEV0lwZHBPYjRaWWg3b2UyWHpQR3hl?=
 =?utf-8?B?Vk1ua0FidlArMFVkMUFtd0FXRCtRMnNCODZUQ0NtYnFkTFRISVlCQVJ1QzdG?=
 =?utf-8?B?eHhlc2RTcUFCb3BNT0gyVzQ5QU9SL290VVBMdnlOeHl5OXgzUmUrUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5759a9c-0764-40f4-db25-08de5835fe59
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:10:06.2373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rkwEpJJZpXsL8e6anbf0DIuqPemImw6KRF2dEDnwqOVM3gVR9dH7XoIngRf3FNNLw/s2dOnUb0nZclEw1Xp9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9040
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


On 20-01-2026 19:58, Thomas Hellström wrote:
> Hi, Arvind,
>
> On Tue, 2026-01-20 at 11:41 +0530, Arvind Yadav wrote:
>> Add six purgeable memory test cases for system allocator using
>> madvise:
> I wonder is xe_exec_system_allocator really the igt we should use for
> this? Sure, it's possible to bind bos to a SVM VM, but I think that's
> not really the typical use-case, but rather ordinary VMs used by
> graphics UMDs.
>
> xe_exec_system_allocator is already a huge test, primarily intended to
> test the system allocator functionality rather than bo functionality.
> Can't we craft a separate igt test app for this that tests the
> purgeability functionality for various VM types?


Agreed. I'll move these to a new test file tests/intel/xe_madvise.c 
(following i915's gem_madvise.c pattern which has similar tests) to keep 
purgeable BO tests separate and focused. This makes more sense than 
cluttering xe_exec_system_allocator.
I Will send v2 with the new structure.

Thanks,
Arvind

> Thanks,
> Thomas
>
>
>
>> - madvise-purgeable-dontneed-before-mmap: Mark BO as DONTNEED before
>> mmap,
>>    verify mmap fails on purged memory
>>
>> - madvise-purgeable-dontneed-after-mmap: Mark BO as DONTNEED after
>> mmap,
>>    verify SIGBUS/SIGSEGV on accessing purged mapping
>>
>> - madvise-purgeable-dontneed-before-exec: Mark BO as DONTNEED before
>> GPU
>>    execution, verify GPU behavior on purged memory with SCRATCH_PAGE
>> VMs
>>
>> - madvise-purgeable-dontneed-after-exec: Mark BO as DONTNEED after
>> GPU
>>    execution, verify previously-used memory becomes inaccessible
>>
>> - madvise-purgeable-per-vma-tracking: One BO mapped in two VMs
>> becomes
>>    purgeable only when BOTH VMAs are marked DONTNEED
>>
>> - madvise-purgeable-per-vma-protection: One VMA marked DONTNEED
>> allows
>>    GPU execution on other VMA; both DONTNEED makes BO purgeable
>>
>> Tests use xe_vm_madvise_purgeable() for WILLNEED/DONTNEED state
>> management
>> and trigger_memory_pressure() to simulate OOM conditions forcing
>> kernel to
>> reclaim purgeable memory.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_exec_system_allocator.c | 638
>> +++++++++++++++++++++++++
>>   1 file changed, 638 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_system_allocator.c
>> b/tests/intel/xe_exec_system_allocator.c
>> index 8af66d76e..338037a48 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -32,6 +32,15 @@
>>   #define QUARTER_SEC		(NSEC_PER_SEC / 4)
>>   #define FIVE_SEC		(5LL * NSEC_PER_SEC)
>>   
>> +/* Purgeable test constants */
>> +#define PURGEABLE_ADDR		0x1a0000
>> +#define PURGEABLE_ADDR2		0x2b0000
>> +#define PURGEABLE_BATCH_ADDR	0x3c0000
>> +#define PURGEABLE_BO_SIZE	4096
>> +#define PURGEABLE_FENCE_VAL	0xbeef
>> +#define PURGEABLE_TEST_PATTERN	0xc0ffee
>> +#define PURGEABLE_DEAD_PATTERN	0xdead
>> +
>>   struct test_exec_data {
>>   	uint32_t batch[32];
>>   	uint64_t pad;
>> @@ -2245,6 +2254,599 @@ test_compute(int fd, size_t size, unsigned
>> int flags)
>>   	xe_vm_destroy(fd, vm);
>>   }
>>   
>> +/**
>> + * trigger_memory_pressure - Trigger memory pressure for purgeable
>> tests
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle
>> + *
>> + * Creates temporary BOs exceeding VRAM size (VRAM + 64MB) to
>> trigger memory
>> + * pressure, forcing kernel to reclaim purgeable BOs in system
>> allocator.
>> + */
>> +static void trigger_memory_pressure(int fd, uint32_t vm)
>> +{
>> +	uint64_t vram_size;
>> +	const uint64_t chunk = 8ull << 20; /* 8 MiB */
>> +	int max_objs, n = 0;
>> +	uint32_t *handles;
>> +	uint64_t total;
>> +	void *p;
>> +	uint32_t bo2;
>> +
>> +	vram_size = xe_visible_vram_size(fd, 0);
>> +	max_objs = vram_size / chunk + 64;
>> +	handles = calloc(max_objs, sizeof(*handles));
>> +	igt_assert(handles);
>> +
>> +	total = 0;
>> +	while (total < vram_size + (64 << 20) && n < max_objs) {
>> +		bo2 = xe_bo_create(fd, vm, chunk,
>> vram_if_possible(fd, 0),
>> +				
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +		handles[n++] = bo2;
>> +		total += chunk;
>> +		p = xe_bo_map(fd, bo2, chunk);
>> +		memset(p, 0xCD, 4096);
>> +		munmap(p, chunk);
>> +	}
>> +
>> +	for (int i = 0; i < n; i++)
>> +		gem_close(fd, handles[i]);
>> +
>> +	free(handles);
>> +}
>> +
>> +static jmp_buf jmp;
>> +
>> +__noreturn static void sigtrap(int sig)
>> +{
>> +	siglongjmp(jmp, sig);
>> +}
>> +
>> +/**
>> + * purgeable_mark_and_verify_purged - Mark BO as DONTNEED and verify
>> purge
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle
>> + * @addr: Virtual address of the BO
>> + * @size: Size of the BO
>> + *
>> + * Marks BO as DONTNEED, triggers memory pressure, and verifies
>> purge.
>> + * Returns: true if BO was successfully purged, false otherwise
>> + */
>> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm,
>> uint64_t addr, size_t size)
>> +{
>> +	uint32_t retained;
>> +
>> +	/* Mark as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +					
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	if (retained != 1)
>> +		return false;
>> +
>> +	/* Trigger memory pressure */
>> +	trigger_memory_pressure(fd, vm);
>> +
>> +	/* Verify purged */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +					
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	return retained == 0;
>> +}
>> +
>> +/**
>> + * purgeable_setup_simple_bo - Setup VM and bind a single BO
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bo: Output BO handle
>> + * @addr: Virtual address to bind at
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag
>> + *
>> + * Helper to create VM, BO, and bind it at the specified address.
>> + */
>> +static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t
>> *bo,
>> +				      uint64_t addr, size_t size,
>> bool use_scratch)
>> +{
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = 1,
>> +	};
>> +	uint64_t sync_val = 0;
>> +
>> +	*vm = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
>> 0);
>> +
>> +	sync.addr = to_user_pointer(&sync_val);
>> +	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +}
>> +
>> +/**
>> + * purgeable_setup_batch_and_data - Setup VM with batch and data BOs
>> for GPU exec
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bind_engine: Output bind engine handle
>> + * @batch_bo: Output batch BO handle
>> + * @data_bo: Output data BO handle
>> + * @batch: Output batch buffer pointer
>> + * @data: Output data buffer pointer
>> + * @batch_addr: Batch virtual address
>> + * @data_addr: Data virtual address
>> + * @batch_size: Batch buffer size
>> + * @data_size: Data buffer size
>> + *
>> + * Helper to create VM, bind engine, batch and data BOs, and bind
>> them.
>> + */
>> +static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
>> uint32_t *bind_engine,
>> +					    uint32_t *batch_bo,
>> uint32_t *data_bo,
>> +					    uint32_t **batch,
>> uint32_t **data,
>> +					    uint64_t batch_addr,
>> uint64_t data_addr,
>> +					    size_t batch_size,
>> size_t data_size)
>> +{
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = PURGEABLE_FENCE_VAL,
>> +	};
>> +	uint64_t vm_sync = 0;
>> +
>> +	*vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
>> 0);
>> +	*bind_engine = xe_bind_exec_queue_create(fd, *vm, 0);
>> +
>> +	/* Create and bind batch BO */
>> +	*batch_bo = xe_bo_create(fd, *vm, batch_size,
>> vram_if_possible(fd, 0),
>> +				
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	*batch = xe_bo_map(fd, *batch_bo, batch_size);
>> +
>> +	sync.addr = to_user_pointer(&vm_sync);
>> +	xe_vm_bind_async(fd, *vm, *bind_engine, *batch_bo, 0,
>> batch_addr, batch_size, &sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);
>> +
>> +	/* Create and bind data BO */
>> +	*data_bo = xe_bo_create(fd, *vm, data_size,
>> vram_if_possible(fd, 0),
>> +				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE
>> _VRAM);
>> +	*data = xe_bo_map(fd, *data_bo, data_size);
>> +
>> +	vm_sync = 0;
>> +	xe_vm_bind_async(fd, *vm, *bind_engine, *data_bo, 0,
>> data_addr, data_size, &sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);
>> +}
>> +
>> +/**
>> + * purgeable_setup_two_vms_shared_bo - Setup two VMs with one shared
>> BO
>> + * @fd: DRM file descriptor
>> + * @vm1: Output first VM handle
>> + * @vm2: Output second VM handle
>> + * @bo: Output shared BO handle
>> + * @addr1: Virtual address in VM1
>> + * @addr2: Virtual address in VM2
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag for VMs
>> + *
>> + * Helper to create two VMs and bind one shared BO in both VMs.
>> + * Returns mapped pointer to the BO.
>> + */
>> +static void *purgeable_setup_two_vms_shared_bo(int fd, uint32_t
>> *vm1, uint32_t *vm2,
>> +						uint32_t *bo,
>> uint64_t addr1, uint64_t addr2,
>> +						size_t size, bool
>> use_scratch)
>> +{
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = 1,
>> +	};
>> +	uint64_t sync_val = 0;
>> +	void *map;
>> +
>> +	/* Create two VMs */
>> +	*vm1 = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +	*vm2 = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +
>> +	/* Create shared BO */
>> +	*bo = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
>> +			
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +	map = xe_bo_map(fd, *bo, size);
>> +	memset(map, 0xAB, size);
>> +
>> +	/* Bind BO in VM1 */
>> +	sync.addr = to_user_pointer(&sync_val);
>> +	sync_val = 0;
>> +	xe_vm_bind_async(fd, *vm1, 0, *bo, 0, addr1, size, &sync,
>> 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +	/* Bind BO in VM2 */
>> +	sync_val = 0;
>> +	xe_vm_bind_async(fd, *vm2, 0, *bo, 0, addr2, size, &sync,
>> 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +	return map;
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-before-mmap
>> + * Description: Test marking memory as DONTNEED before mmap access
>> in system allocator
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_mmap_madvise(int fd, struct
>> drm_xe_engine_class_instance *hwe)
>> +{
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size,
>> false);
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr,
>> bo_size))
>> +		igt_skip("Unable to induce purge on this
>> platform/config");
>> +
>> +	/* Try to mmap - should fail on purged BO */
>> +	map = __gem_mmap__device_coherent(fd, bo, 0, bo_size,
>> PROT_READ | PROT_WRITE);
>> +	igt_assert_f(map == NULL, "mmap should fail on purged BO");
>> +	igt_assert_f(errno == EINVAL || errno == EFAULT,
>> +		     "Expected EINVAL or EFAULT, got errno=%d\n",
>> errno);
>> +
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-after-mmap
>> + * Description: Test marking memory as DONTNEED after mmap in system
>> allocator
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_mmap_madvise(int fd, struct
>> drm_xe_engine_class_instance *hwe)
>> +{
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size,
>> true);
>> +
>> +	map = xe_bo_map(fd, bo, bo_size);
>> +	memset(map, 0xAB, bo_size);
>> +
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr,
>> bo_size))
>> +		igt_skip("Unable to induce purge on this
>> platform/config");
>> +
>> +	/* Access purged mapping - should trigger SIGBUS/SIGSEGV */
>> +	{
>> +		sighandler_t old_sigsegv, old_sigbus;
>> +		char *ptr = (char *)map;
>> +		int sig;
>> +
>> +		old_sigsegv = signal(SIGSEGV,
>> (__sighandler_t)sigtrap);
>> +		old_sigbus = signal(SIGBUS,
>> (__sighandler_t)sigtrap);
>> +
>> +		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
>> +		if (sig == SIGBUS || sig == SIGSEGV) {
>> +			/* Expected - purged mapping access failed
>> */
>> +		} else if (sig == 0) {
>> +			*ptr = 0;
>> +			igt_assert_f(false, "Access to purged
>> mapping should trigger signal\n");
>> +		} else {
>> +			igt_assert_f(false, "unexpected signal
>> %d\n", sig);
>> +		}
>> +
>> +		signal(SIGBUS, old_sigbus);
>> +		signal(SIGSEGV, old_sigsegv);
>> +	}
>> +
>> +	munmap(map, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-before-exec
>> + * Description: Test marking memory as DONTNEED before GPU exec in
>> system allocator
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_exec_madvise(int fd, struct
>> drm_xe_engine_class_instance *hwe)
>> +{
>> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr = 0x1a0000;
>> +	uint64_t batch_addr = 0x2a0000;
>> +	size_t data_size = 4096;
>> +	size_t batch_size = 4096;
>> +	struct drm_xe_sync sync[1] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = 0xbeef },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint64_t vm_sync = 0;
>> +	int b, ret;
>> +
>> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine,
>> &batch_bo, &bo,
>> +					&batch, &data, batch_addr,
>> data_addr,
>> +					batch_size, data_size);
>> +
>> +	/* Prepare batch */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = PURGEABLE_DEAD_PATTERN;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	igt_assert(purgeable_mark_and_verify_purged(fd, vm,
>> data_addr, data_size));
>> +
>> +	/* Try to execute - should fail or cause GPU fault */
>> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	vm_sync = 0;
>> +	sync[0].addr = to_user_pointer(&vm_sync);
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	if (ret == 0) {
>> +		int64_t timeout = NSEC_PER_SEC;
>> +
>> +		__xe_wait_ufence(fd, &vm_sync, 0xbeef, exec_queue,
>> &timeout);
>> +		/* Wait may succeed (NULL rebind) or fail (purged) -
>> both acceptable */
>> +	}
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-after-exec
>> + * Description: Test marking memory as DONTNEED after successful GPU
>> exec
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_exec_madvise(int fd, struct
>> drm_xe_engine_class_instance *hwe)
>> +{
>> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr = 0x1a0000;
>> +	uint64_t batch_addr = 0x2a0000;
>> +	size_t data_size = 4096;
>> +	size_t batch_size = 4096;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = 0xbeef },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 2,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint32_t syncobj;
>> +	int b, ret;
>> +
>> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine,
>> &batch_bo, &bo,
>> +					&batch, &data, batch_addr,
>> data_addr,
>> +					batch_size, data_size);
>> +	memset(data, 0, data_size);
>> +
>> +	syncobj = syncobj_create(fd, 0);
>> +
>> +	/* Prepare batch to write to data BO */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = 0xfeed0001;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	/* Use only syncobj for exec (not USER_FENCE) */
>> +	sync[1].handle = syncobj;
>> +	exec.num_syncs = 1;
>> +	exec.syncs = to_user_pointer(&sync[1]);
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	igt_assert_eq(ret, 0);
>> +
>> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0,
>> NULL));
>> +	munmap(data, data_size);
>> +	data = xe_bo_map(fd, bo, data_size);
>> +	igt_assert_eq(data[0], 0xfeed0001);
>> +
>> +	igt_assert(purgeable_mark_and_verify_purged(fd, vm,
>> data_addr, data_size));
>> +
>> +	/* Prepare second batch (different value) */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = 0xfeed0002;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	if (ret == 0) {
>> +		/* Exec succeeded, but wait may fail on purged BO
>> (both behaviors valid) */
>> +		syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL);
>> +	}
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	syncobj_destroy(fd, syncobj);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-per-vma-tracking
>> + * Description: Test per-VMA purgeable state tracking with multiple
>> VMs
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_tracking_madvise(int fd, struct
>> drm_xe_engine_class_instance *hwe)
>> +{
>> +	uint32_t bo, vm1, vm2;
>> +	uint64_t addr1 = PURGEABLE_ADDR;
>> +	uint64_t addr2 = PURGEABLE_ADDR2;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	uint32_t retained;
>> +	void *map;
>> +
>> +	map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>> +							addr1,
>> addr2, bo_size, false);
>> +
>> +	/* Mark VMA1 as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +					
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Verify BO NOT purgeable (VMA2 still WILLNEED) */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +					
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Mark both VMAs as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +					
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, addr2, bo_size,
>> +					
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure and verify BO was purged */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +					
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 0);
>> +
>> +	munmap(map, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm1);
>> +	xe_vm_destroy(fd, vm2);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-per-vma-protection
>> + * Description: Test per-VMA protection from purging with GPU
>> workload
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_protection_madvise(int fd, struct
>> drm_xe_engine_class_instance *hwe)
>> +{
>> +	uint32_t vm1, vm2, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr1 = PURGEABLE_ADDR;
>> +	uint64_t data_addr2 = PURGEABLE_ADDR2;
>> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>> +	size_t data_size = PURGEABLE_BO_SIZE;
>> +	size_t batch_size = PURGEABLE_BO_SIZE;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = PURGEABLE_FENCE_VAL },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(&sync[1]),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint64_t vm_sync = 0;
>> +	uint32_t retained, syncobj;
>> +	int b, ret;
>> +
>> +	/* Create two VMs and bind shared data BO */
>> +	data = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2,
>> &bo,
>> +							 data_addr1,
>> data_addr2, data_size, true);
>> +	memset(data, 0, data_size);
>> +	bind_engine = xe_bind_exec_queue_create(fd, vm2, 0);
>> +
>> +	/* Create and bind batch BO in VM2 */
>> +	batch_bo = xe_bo_create(fd, vm2, batch_size,
>> vram_if_possible(fd, 0),
>> +				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE
>> _VRAM);
>> +	batch = xe_bo_map(fd, batch_bo, batch_size);
>> +
>> +	sync[0].addr = to_user_pointer(&vm_sync);
>> +	vm_sync = 0;
>> +	xe_vm_bind_async(fd, vm2, bind_engine, batch_bo, 0,
>> batch_addr, batch_size, sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);
>> +
>> +	/* Mark VMA1 as DONTNEED, VMA2 stays WILLNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, data_addr1,
>> data_size,
>> +					
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure - BO should survive (VMA2 protects) */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2,
>> data_size,
>> +					
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* GPU workload - should succeed */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr2;
>> +	batch[b++] = data_addr2 >> 32;
>> +	batch[b++] = PURGEABLE_TEST_PATTERN;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	syncobj = syncobj_create(fd, 0);
>> +	sync[1].handle = syncobj;
>> +	exec_queue = xe_exec_queue_create(fd, vm2, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	igt_assert_eq(ret, 0);
>> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0,
>> NULL));
>> +
>> +	munmap(data, data_size);
>> +	data = xe_bo_map(fd, bo, data_size);
>> +	igt_assert_eq(data[0], PURGEABLE_TEST_PATTERN);
>> +
>> +	/* Mark both VMAs DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2,
>> data_size,
>> +					
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure - BO should be purged */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2,
>> data_size,
>> +					
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 0);
>> +
>> +	/* GPU workload - should fail or succeed with NULL rebind */
>> +	batch[3] = PURGEABLE_DEAD_PATTERN;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	/* With SCRATCH_PAGE, kernel may allow exec with NULL
>> rebind.
>> +	 * Without it, exec should fail with -EIO/-EFAULT or wait
>> should timeout.
>> +	 * Both behaviors are valid depending on kernel support.
>> +	 */
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	syncobj_destroy(fd, syncobj);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm1);
>> +	xe_vm_destroy(fd, vm2);
>> +}
>> +
>>   struct section {
>>   	const char *name;
>>   	unsigned long long flags;
>> @@ -2649,6 +3251,42 @@ int igt_main()
>>   			test_compute(fd, SZ_2M, s->flags);
>>   	}
>>   
>> +	igt_subtest("madvise-purgeable-dontneed-before-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_before_mmap_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-dontneed-after-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_after_mmap_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-dontneed-before-exec")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_before_exec_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-dontneed-after-exec")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_after_exec_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-per-vma-tracking")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_per_vma_tracking_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-per-vma-protection")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_per_vma_protection_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>>   	igt_fixture() {
>>   		xe_device_put(fd);
>>   		drm_close_driver(fd);
