Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D58E98DF0
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 07:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAB710E24F;
	Mon, 23 Feb 2026 07:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQ489/Ou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8D510E24F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 07:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771830266; x=1803366266;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r/TXF6Af7THFOfarUvmrI7GrD5SqXdI5Fn1PBfwr19o=;
 b=gQ489/OuALta/g0uR1fiTDZ2fmHeeNzkx/bN8/ZJ2kxqQSo7GqqG300G
 +j6aIftxq9tKtw5dbpxzDPApaAqcA3QPEK0aL3PXcF9x+HEbyoTyaMQkp
 Gl/YaCmjQy4ItSc5QnBebYAmLl0rCzMySIT7QLDfkppgQGRcj8BFa4Dg4
 Y/ysjLrlXWvcRxNBp8nsrYXd1aDhSL0p4E7KcVvoWjJNR3L0raweab1s9
 STFa1V+L3OVePahFiCw6dbimTb14gODuIQ21YnbuepqKLlFwj0WV4eCzO
 5YDmWMYtG2z1QVFg3Rn91THE5Wh1PfUlyj2+YeDB2QJx32Wx2m5wSDifl A==;
X-CSE-ConnectionGUID: Di7IjYUlQhCGlDTGbLrYhg==
X-CSE-MsgGUID: CdVzd6+uRXKmGgAeTaQFIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="84270581"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="84270581"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:04:26 -0800
X-CSE-ConnectionGUID: i5JBnOQARImk8DD9CfmeUw==
X-CSE-MsgGUID: IlE4XyWMRouQEN+EKegtig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="220010888"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:04:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 23:04:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 23:04:24 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.48)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 23:04:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWsRTWQQLCMWJTX3vrz3PhG3rUNffMDQ1ZS6/7tkyzUjJNeELXuge62DrTVQtxoz2PG2QA5KMXCM0QXyrtn8zXZdF4136zBoSWS4NnGqrhxYTjXDMIACzSKxvaH5reKwMx3YT1LyvaNymrgCXvtOIhjYvcFXFTxbcrgJhrAoWstqlOrtHXfOMUkvbUodKKP+gUsOE07lkjGmsKdvA+oPDYmQxC/MmNlDY2HyBUnwVniyxF7KvAtPg9UiCUNZifQ3TZnbjZxkKYXUiqUJphdyGRdslkBzIv7fnWUW8z/PnH3Zi5g3QI5jQOF1W+GxZb6kplbQLazoZ7Lj6HRhX9QpQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2A2+y8FFmlAqBEpfL7bHuUk/ZUMUeuotjNwdT8fwFg=;
 b=WvYUG12eDWhWzvfvfgHNTtS+P/GhOO/aM6Vaz9T0P+yaiDwWTUsD7dsC7qJ80vq4/pk2nsBY6nXq60XoF/2plQUSiPmdmT6gzm5bYRlb75+SmZyii9Ik07/UCSOEQaPQsGj7YeVZaXE1D3Iu3N0qoMnE/tNvRyEVv2uCdxcnrrO3GeUHanqEMrpP4HrSlSSvpkEJHMWxd7txM2mHB6pJELt2Xb6p3bXn88whJ4GtuQOh3RFnNjyynwmlnPVsjS/O4YR2ZmH+nHkL5M42A5yf/ErYgj43Sh06FifawdpMS9dA9I4PDhU57k0/yETOmD8qlB0aIpdS21nLx2Nt4Q38RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 07:04:22 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 07:04:22 +0000
Message-ID: <a68be50a-b559-483d-a104-d95ba7d74cd4@intel.com>
Date: Mon, 23 Feb 2026 12:34:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/8] tests/intel/xe_madvise: Add
 dontneed-after-exec subtest
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-7-arvind.yadav@intel.com>
 <BL1PR11MB55256152932652611D4D77BC8477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <BL1PR11MB55256152932652611D4D77BC8477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::15) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: a1bfade1-c9bf-487d-2ed2-08de72a9c59b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmMySmU0ZkRxT2dIRGw2NjJ4VlFIRnRmWU9oeDNnWXVCcllaM285Z2ZiV2pv?=
 =?utf-8?B?enBDL3U2dThPeDdQRngvMk5EczVodEZqMUord1pKdDB0VDRvRVlHOGx2QWlZ?=
 =?utf-8?B?TnlTdGpGNEVrS0liTThnYldqMWpSczF0RGMvczNhZEV3ekJKK1hMQkN1WlNQ?=
 =?utf-8?B?cDNkT09YYnlvbVYxcGhMSzlaSkJ5blBJU3NaVFc0TE1zWjE3b2lQaTJrdmdH?=
 =?utf-8?B?emoyU0QxWDAvamNCUG9Rb1U5dnNkUWFLT2NMWTI3RlJ5NHFMWTcvYTkwYTJI?=
 =?utf-8?B?RU1TRC9wUk4zNlNSSk0yTlpaM2VtdlVnR1pkVThvcjlRODMwRWJ4SnkyVVMv?=
 =?utf-8?B?L1BMZDI4Y1BnTzNwOWllNzFZcE1QR200djJmR1c4UUNoZHZEMzdZVVlERW9X?=
 =?utf-8?B?WmFLL1RsTjJSZk1CcXljWUNrelBrN0FKRy9YeFZvMVh1Vk1neTRRNjlweHMy?=
 =?utf-8?B?dGQrTStTS1oxYTFSQ3lSUzBzRXliUlhYaW0rVHVGU0Z4bEtoUDNBNUQ4eEQ4?=
 =?utf-8?B?UkcyR1lFamVqZWVaUzBrMTZxb1ozNDVZaVJ4c0NNODMwWm1hSW91Nk91TTFq?=
 =?utf-8?B?SGYvWGVPNWczcHQ1QXNPWEw5UXdnTFNxYlRKbC9sUmdXWWhFYnp5N1N1dVZI?=
 =?utf-8?B?bWgrRUhJMFI1NzJLMGFnWm5OVTBqa1drTDd4YlBKYlhtU1lkWVpKcFV3UGZl?=
 =?utf-8?B?Sm02MHRISUxaZ3JlNUlZdUxpMExjZU02YWQ4U0d6T3RDelYyZ3ltRHQ4QUg1?=
 =?utf-8?B?eEpmK01meTJWT0lUeEpWN0NZajJEWkJSSklYOU1ZS3BqQUhMOUpSN0RDR3hH?=
 =?utf-8?B?SERwN3pFWklKc0RRVnBjU00ySC9iY0U3K0VJZjg1ZjJpdEE1SVdpdUZtWDBC?=
 =?utf-8?B?K1NUNkdzbmJXN2NCZTdIRnZ1VFlxSVRwbFZLL1FLNXpXUmR0d1VSNlhXMHVR?=
 =?utf-8?B?UDR0NWJDb1QzVWJoWFZIYk1HTzNLeTVPcENOT3VlV3ZnemEvc1lJRnVJd0Fn?=
 =?utf-8?B?TmFSWHIyYnFQRDJib1g1ZHgza2JnNkF1WkRmS0c1NXNqSDBodG0xSERhYlY5?=
 =?utf-8?B?ZEpPVzlhdjZacmZkaE15emhzYWYvVHZTdWVid1ZZZExTTk5WcC9uMXpvK0p3?=
 =?utf-8?B?Tll3TkticW5LbGMxUGxHZHh6aGZ1S3FPdFlKVGFTbEYwdXFxV3RzaEZabVI5?=
 =?utf-8?B?N1BJM2FMa2ZHWTBQS1JPak1ZR2hybFpDbkhjZWpFVTA0b21pOStxUmE0WEhn?=
 =?utf-8?B?Y1hzUThBUGJWTjV0cVdlZW1NaUYvWUo0ckdiR3NwbGsrREpKYlcraGVkVXgv?=
 =?utf-8?B?U09rZHBSR2tkQnc3bWtObE9BMGZIeWVkY0E4VU9Rd2FLT2ZhdGdPUFJCY25C?=
 =?utf-8?B?dmVMSWtkNlExZEVWYThyMitqd2N2b0V2UWk3NGhPWjd6TVhrUVNRd2ZWc0JT?=
 =?utf-8?B?NDlNb1c5Vk5TZUVBMDc1aURpdVBhYmJWRFZnY1p6d1pYVDZIeDNCR2dSaTBl?=
 =?utf-8?B?OVRrZ0Mxdk12YUlscWtmSzJOdTF2alJyYnhlZHJHOXRJb1FBMHpqL1lqL3B1?=
 =?utf-8?B?ZUppdlY1TUIwYkl1T1VVMjJkVXk0UDdGb2p6RTlueTlESjdHcjhCQ2w5R3Vm?=
 =?utf-8?B?OWkraG96V3M0Y1l2WGFWRThkSENneFIrZk5HRmxKZ1lIb1JjOWdBUWcwcUNM?=
 =?utf-8?B?aWl0cVhqMTFFMDBDRk5Ddk9lWnh5YlNjNDJVajJvL3NaWUpWdVdkZVZOK2gx?=
 =?utf-8?B?eE41NVlNaHpLUmw2aCtVbXNEVG1LM0h0NWJkbDREQzArNUpBMHF2VDlmZmdn?=
 =?utf-8?B?bWFKWjFid1JVR1pGdnZsZ1AwSjUzUk5qR29GZDdwejYwSGNONlYzRXpuS1lz?=
 =?utf-8?B?aUZsSnp4OENhOGNTVThlL3g3cTVRTERHQkx1YU1kQ0JNWHBXazBlbVBPdnF6?=
 =?utf-8?B?QXNGT0RPeEI1cGxxWkg0aVhQQlhoMDBHZEJ6MkIwMGtuQjJkcStwUkgvT2h4?=
 =?utf-8?B?NGc4R3BXbmw1V1lnZU1CNlBuUnQ3U204MWVPZEVlZE5Yc3RjMk9xdDZUV2Rp?=
 =?utf-8?B?RjEza1VOZlMvdE9ldHNBMUFnQUVWczBSVUFRSTh3cFhHbjF4Z05ES1QwbHhr?=
 =?utf-8?Q?CWLo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0VwRGxtL3NabTJJV25URm9NVWxlSWxoM2NSTHBFeGNqMTJpSllyZWpHVnVl?=
 =?utf-8?B?T29jVlVNSEhFV2lLMGtybUlwUmlSSTVpYjl4dldaRDlqSi9rVzRvcytQMUVz?=
 =?utf-8?B?YlZUSGd0b25FMkExeDhsdGhuYjZ6RitrK0hkaTdueWdYQ2dxTEFXM3ZkZXBM?=
 =?utf-8?B?ckdtVEdUeXNOWDNTa1VQS1cvRmk1V0Q2NlVZUEJJT2thN3lJWXk2T2YyVW1H?=
 =?utf-8?B?STdoOVFYa2RHYS8yVnZpQUFJYmovRytUQ1JqVVdGdk9HS0k3TTJYRGVwNTdz?=
 =?utf-8?B?ZGlmWWVkYU1ncDJYQTV0bFgvVHhhb0ZLVnE2RHZDVlRsNENyRzdmWnlxZkZC?=
 =?utf-8?B?TFFsd2gzRGhZcmQ4Umh3QXB5R3A1NG9ld1ZLVDQyR2Q4cUYrTFA0RE1UcU5G?=
 =?utf-8?B?U2xYaDRvdGpoWXlGejFvd243TFMxYk9IWVdwcGZvZVFIYlQ1NkJ5WlY3UDdC?=
 =?utf-8?B?cmYvRUdveUswNnVUSVRGRWdUbHlDZkMrK29haWVtdWNBY3VKUWVudi91Vzd0?=
 =?utf-8?B?YVJGdW9qVjBRRUQyeFllQjlvRnhQa29tWlU0Mm8vNThPbTB2SlVuSWM3VlEy?=
 =?utf-8?B?Q1orYlFnWVBKQnZTVllpQzBrQ2lteUF1bytzUzlLOVU2eUw3U09BNnRoV0xP?=
 =?utf-8?B?L0RzMmxSQVA1alJ1cmVYdXZ0czlsM3lONGNKbmFjZHFjWHR3Y3Z4aFVGQWs4?=
 =?utf-8?B?UGVsck4wbWNFWjhoQUY1U1BSZTdrTGhsVXZ3ZU9NTER5b3dTRGcvRUJPVTd0?=
 =?utf-8?B?OGxtVGFaMWU5YXYxRVJTazFNcllVQlVmeXcvZTljajJiekFjWnZWQjVhOGhh?=
 =?utf-8?B?SnBCM0pTODY5T2NseG55RlVyZHVJRkg4N3g2OTlZYUJ1eThsWm5RRzdLK2Vp?=
 =?utf-8?B?VFBoU2R6WFcwTWJXRzN4L093QVpZQ3Z6YTFCSCtkRTlidW9mRTJJVGxPMlgx?=
 =?utf-8?B?YlBnME00eTJiUUZ1L2Racmd4YkhYWUgrdm1RTlhvY05JN3pwMlFuUDBoUHZi?=
 =?utf-8?B?TnFWd2xFS1U2R3BRc2x1TDEzd2VCM2NDaDRoL1kzOHA4eEhFQmxncDFJL0V4?=
 =?utf-8?B?Qkxia0FGZ2I3SXNwNmRRWEpWNC9tVTBXYnE3cGlLVyt1c1FNNlJQUHlVbGxW?=
 =?utf-8?B?V2xBNFBUYWV0c3ZwMGVVUTF4M0FJVjYxNUZwa0cwNzdRTWpGN1lndFJUSVZL?=
 =?utf-8?B?UFZ6bTdWTzhGZjViT2VZVnY1TXRTaWJpSklPbDN0ZUN4eHhiaFVKQTJPNUY2?=
 =?utf-8?B?NTUxTFJhMUlMaU54Q2VHaTE4N25KUEZjb0M0d1FXc3h2eXJzc1doNWRweHNz?=
 =?utf-8?B?dTdKS1YzajJaeHo0cThKT3pVb1prSHdGb1NkcmVmVTV5YStUMmN6cVNKZncr?=
 =?utf-8?B?KzVrSWpHQTdPdkNtNmZXTUhvejNXYXBrcGkyZ2EyVWFtazkwcnl0WkpZYlhh?=
 =?utf-8?B?YTV6SkYvZ01nTGFTdWJUeG90SVlybndlMlEzaVhEZFZLNjVBQmg3MjEvMHg0?=
 =?utf-8?B?cm9RZ0lOd3lLUDVFVW9ZZVFhWUJBL25wSVhVTlhOdjBON2dDRm5oUGxodUJT?=
 =?utf-8?B?UUtSeXBjcXd6enJ0cGZqVDJrMVNFRVp2azhLNk9aSTR2TWV3NnNoOE1OYXBM?=
 =?utf-8?B?QW1jUHNrVi9iT3JubWdUaG03NE9tOGtRU2hNdllPSGFJbXV3dzlIUUFOTFFF?=
 =?utf-8?B?QmRvZXlvU2ZRQThjL3dENDB5bldQM1JaK29YM21BaWJaOVA3WU1WZm9MYWZ2?=
 =?utf-8?B?OGtybTRzMkc1eGxDM0VIMGQvQWZKUzQ5TnRnUXBOTjF3enM0WEpWRWZRZWdX?=
 =?utf-8?B?UTVLZ1VCRnBFNTNRVlV4QUw5OVA3UzBBZjdHUnF4VWx3K1VHQ1hVLzZ0Nkx5?=
 =?utf-8?B?L3Z5eGRXMElNK1lEVVpCeU13SUwwYVhUcEZWWGc3Q1NYTlNGNXc4d0srQ3M5?=
 =?utf-8?B?d0xwNlBlV3RYcWlINFUzN2VVNDJrQjJIWllGa0xsMnVGa2h4cmZwc0IrTlRG?=
 =?utf-8?B?Zk5yZTY0N0Uvc2RRcjlLTUsranRnazBXUVVkUU45T2ljN2tpZ2xUWVhuVUN6?=
 =?utf-8?B?aDIrTHlndllFNDhwSHdQc2s4YkJKanVkVjFEKzVGSkZzZ3NwclJ3c1pDanlz?=
 =?utf-8?B?RHBOMUkyRTZKWDN0ZDk5Q0huYTQ2aWozbUpNbXoxU1NtYTVQTGhhL1hGNGRv?=
 =?utf-8?B?MFhUdDR3NmdzQ0NqK0pjZWlXSzlWcE00aUQ2Y2tlQmJQTGZua3lHRXAwZFdO?=
 =?utf-8?B?cVJaYjFjeCtkcXZrSFlwSnVXbStXdHN3VFRteUNyZHdHSXFnSS90NTMzU2Zl?=
 =?utf-8?B?VEJwaEd2TXlpTEFLYnpEbjQyeEVVSFZZMVVrazZIOEFJVDJGb2QxYkJIUEhN?=
 =?utf-8?Q?cTUz7YTOirJ+fCiw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bfade1-c9bf-487d-2ed2-08de72a9c59b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 07:04:22.6415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJ7EFh5xH1Zj4rjYku5eJxje+K+YYkweIppbmN5NSJnw66JRDHA+Q1Y35Hs0hY+chqTp3nXswT5DGvfUGJhYJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
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


On 2/23/2026 10:41 AM, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Tuesday, 17 February, 2026 08:04 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t v3 6/8] tests/intel/xe_madvise: Add dontneed-after-exec
>> subtest
>>
>> This test verifies that memory can be marked purgeable and reclaimed after
>> successful GPU execution. The test first executes a batch that writes to a data
>> BO and verifies the result. It then marks the BO as DONTNEED, triggers
>> memory pressure to purge it, and attempts a second execution. The second
>> execution may fail or succeed with scratch rebind, validating that the kernel
>> correctly handles purged BOs in GPU submissions.
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 93
>> ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c index
>> 42cf1b3e5..51ef4fad3 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -16,6 +16,7 @@
>>
>>   #include "xe/xe_ioctl.h"
>>   #include "xe/xe_query.h"
>> +#include "lib/igt_syncobj.h"
>>
>>   /* Purgeable test constants */
>>   #define PURGEABLE_ADDR		0x1a0000
>> @@ -378,6 +379,92 @@ static void test_dontneed_before_exec(int fd, struct
>> drm_xe_engine_class_instanc
>>   	xe_vm_destroy(fd, vm);
>>   }
>>
>> +/**
>> + * SUBTEST: dontneed-after-exec
>> + * Description: Mark BO as DONTNEED after GPU exec, verify memory
>> +becomes inaccessible
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_exec(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr = PURGEABLE_ADDR;
>> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>> +	size_t data_size = PURGEABLE_BO_SIZE;
>> +	size_t batch_size = PURGEABLE_BO_SIZE;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = PURGEABLE_FENCE_VAL },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
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
>> &batch_bo,
>> +				       &bo, &batch, &data, batch_addr,
>> +				       data_addr, batch_size, data_size);
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
when num_sync  = 1 then why assignment with &sync[1]. Although sync[0] 
is not used. Either you can have single sync for both xe_exec or use 
different syncs for each xe_exec
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	igt_assert_eq(ret, 0);
>> +
>> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>> +	munmap(data, data_size);
>> +	data = xe_bo_map(fd, bo, data_size);
igt_assert(data != MAP_FAILED) before using below
>> +	igt_assert_eq(data[0], 0xfeed0001);
>> +
>> +	igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr,
>> +data_size));

Resource cleanup? Although if BO is purged it will assert but is there 
any chance if BO is purged and it continue execution second xe_exec() which

can lead to undefined behavior?

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
>> +		/* Exec succeeded, but wait may fail on purged BO (both
>> behaviors valid) */
>> +		syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL);
>> +	}
We are not checking result in BO after second xe_exec(). Is it intentional?
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
>>   int igt_main()
>>   {
>>   	struct drm_xe_engine_class_instance *hwe; @@ -406,6 +493,12 @@
>> int igt_main()
>>   			break;
>>   		}
>>
>> +	igt_subtest("dontneed-after-exec")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_after_exec(fd, hwe);
>> +			break;
>> +		}
>> +
> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>>   	igt_fixture() {
>>   		xe_device_put(fd);
>>   		drm_close_driver(fd);
>> --
>> 2.43.0
