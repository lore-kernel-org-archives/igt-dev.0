Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FD9C7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 06:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE46710E180;
	Mon, 23 Jun 2025 06:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRrc6wXq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5116E10E180
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 06:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750660037; x=1782196037;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=puhRM8eVWlSEUs6IItEdAS8L+NYC27QV4XhKgeW9PuM=;
 b=QRrc6wXqmESMhtL5T0mxVRaJpYGZ25vFdN98HjxX6O1XYA/u4lMwAizJ
 VVpzgXi8lHsTMr9/myNxXgntnCrEzz9sbpXd7OOSxE094S++crFJHh2kE
 rdI7upzMCNrZtR3XYHN69vmpCv815vWPCWVWtPueXF0tIn8JVoG2t9GVT
 AmscrrW+8sYxsCSEGZQh+io+ogFIixMW9AfO/AeGKMZnI29GvDPaafLaS
 JRoaapHx88ZB5bHp4jj58Tm8AfRrUAs7KcGjoeW4rXlL2TyqjHlHH+yPn
 DVpchsIMr6lVmxEnnc2MbBUZew+ybypWOCD8LhNwVq7/DmOECI/wTfUde w==;
X-CSE-ConnectionGUID: jYTUsaSHQXuN9LVncZdZ8Q==
X-CSE-MsgGUID: wXnJq5OZQ4qQxOxRB3TTMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52571764"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52571764"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:27:16 -0700
X-CSE-ConnectionGUID: MJmYjraOSUGqfz06o/rA0Q==
X-CSE-MsgGUID: 19hU3tmDQbug2yg1mNcXAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="157288375"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:27:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:27:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 23:27:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.78)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:27:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAqHa4jTk2L2iIinhpNF8sWqX0MQ7Ins+DHNy3FzrDx6Qu/vLO6gkINpt3V5sOjykfONc4ZNFPOf3KzFI+RAGkyLP+jxAmpsRU4QIEL2VEJq2XhrJ5n+MXN96/HW3EIFfSacewG8kCyLqNyOYQHMhSApYPv8pH6wZYTzduxDod1ioM+QdSxS3hzlazfGY1LOF9T7JSkd5Zt6M5vakZGBsYxN1T2SDEjJkEhi8LPhwUZb/PbX5uR4g8o4U3YTxcWo2BawDAXN2ZnzThtO/tIxrk6S9B8SkhLnOrjLZUaXpX1eooDa+ABG/beJ8N7Vv/ruSy+Ly0nhCTEJE5rGlDPmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e98uclW0J72sp9x/Zfz7rzc9/kDY3UKIFLYMSxfcXMI=;
 b=YM7n66MOzaZX1XXquaZoEbun3g3d6HMYyXz/xkvbREZT+OdB04c5WK8QYcIFzNQ7PttWmzjDcGV6zUad7V9Urv8o+CwggBypYvrMFQGBYq8VFJJ8IbxB/Fjqz56NK19qIlLp4ypaa2QbMvVhSXf7KX9mYdhQEjaCg64dMrqMl6qpAfAKrjgnYGrFChh6HAgy1tGa8FUADGHLgX3qKMcFiKGkA4AhnGts+R8nsU118N+UX3NK3FvRKgD5tYyimhVMzaaCuPGDmRb1sm1c/Er9UlrgfQ82qmFbRkm/oO+YUGBS3sr7LBkr+yNlMdJtZvW2vP3B69Faa913DdTwaVbiQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS7PR11MB7906.namprd11.prod.outlook.com (2603:10b6:8:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 06:27:00 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 06:27:00 +0000
Message-ID: <6928ecc1-22d4-4975-a080-ab5cf815072b@intel.com>
Date: Mon, 23 Jun 2025 11:56:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel-ci: Refine regex to accurately match
 plane downscale factor tests
From: Karthik B S <karthik.b.s@intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250619082436.56220-1-ramanaidu.naladala@intel.com>
 <45d873ce-6a31-471e-b4a8-d41f6a2ba389@intel.com>
Content-Language: en-US
In-Reply-To: <45d873ce-6a31-471e-b4a8-d41f6a2ba389@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::19) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS7PR11MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 31261224-86bb-439a-b995-08ddb21ef5f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enJYcWlYYk1XNnZodUxhN3FWcTFKNFNxR0I4OEVNZWI4NnhRaUc1S3BJbGw5?=
 =?utf-8?B?aFNsaEtMZTg4ODBObFcyNFhyclRzWDZnaS85ajVQZUxhUndHay9NbEtTYlcv?=
 =?utf-8?B?QTZkTFJ5Wm1xeUduZXZXZEF5UlBZb1BmMjlReWtYTmRBcHVnT3J4dzRLNGEx?=
 =?utf-8?B?RVpKdEx5Z3phaU5XVTk4aXIvd2l1UEtjWmJGNSttTnRwN29zOFV2Ylp3YTJq?=
 =?utf-8?B?S3hlYUVWckhVVEhEQU00YVNKQ2ZCZHlKcklSQjBSNC9NNHdaR2wwL0wzRklk?=
 =?utf-8?B?SGJ4UTBnRTJGOW5oOG1pblZGNVJZQmxLOGVXdjhjUXV5UFpxT1Ntc0w5YkZR?=
 =?utf-8?B?eFpEYnBpWUR5RWN0V0kvd0cwZmprMmpJbk1VaGdLWS9ZZTNFYzVmZU5mQkVX?=
 =?utf-8?B?eDU4NE9hYnAwblF1UzNuOFdCQnVKOGhlak1vNjNkbHJUcDlLeElPQnZhVGcr?=
 =?utf-8?B?T0dDTkF4NVRIQnhJMDVWaUF4YTJkTjliYTBYMlE3bEV3aDB1TnpDaVdtakdY?=
 =?utf-8?B?ZXloK2dROElPdG9Qa2RlbHFFZFRwY09pYzBmdlZGSUY2RDRLS3F3OFNWa1ZP?=
 =?utf-8?B?bThpcU5nelNMZUhrOTgycjFsYlp5dTVNbitlRlNMWEliRzd6bC93TTNNWGdy?=
 =?utf-8?B?Q29VeVpnMnRya210VkVKZFBBNUg1NG9Nc295eFdIMVg0ZlBBYjZCN2wxWjB5?=
 =?utf-8?B?UThISWdSNm4vQmdKRmF6TFh4WkJndEVYVnM3RWRuWUhEK3J5VmRsU2RZTE5T?=
 =?utf-8?B?NkNtRjdrMVpvZ1JTRjgvSlZXbGM1RHVEbEhuNWNITGcxMmpHQlIrYnJVVGor?=
 =?utf-8?B?M2pRMzZ3UVhXRHFiTmNXRjJqcTRSakNIQS9ZOStUSkE5MmhNUjJHOHlDQXJa?=
 =?utf-8?B?OGs5YjZTQTVmU085ZkEzZlk1MlhUOUhPUlBXcXRmT3FxMFViNVVXNlI3YUNp?=
 =?utf-8?B?Vlpad0hkczlHQkMrTVVQKzM5T0ZnMVpDU2lkNk40UDd3ZkFLWTZXOFhIVURM?=
 =?utf-8?B?bVBKc21Za25tWkppSTBOWFRzOEZGZWVtY2ZGU0xWOVZlSVhQWjh4TFpqbm5H?=
 =?utf-8?B?a1J1NithTXI0dUt4bVcvRXR2OHp5Qm9iNjJQRFZxd1NoaHJtN0NNRzZaZldI?=
 =?utf-8?B?V1BETFc5dGRTazMycTAxNXFWVnl4RGppU200ODlPOHZsQk5CVmNJcVpuNEVG?=
 =?utf-8?B?WWJpTGRJa1pOZFhpRCtVMEFGTXVzQXFnWVpRSlA5ZkdIVDhVOVJiTTQ4Y3hC?=
 =?utf-8?B?MzV3TXJFTk9vTHlVRUljdEdMd0FNbnFHalNHR2loMXIzQmtJZHdMdGJtMjBn?=
 =?utf-8?B?QXU3aEs5SktzbEdDL1VvcmY0Z1YwRUdacjQwNVlvNTJEVGhxODRsUFNmWG9B?=
 =?utf-8?B?UmhWNlJ5b2VmMUgxK0ZoZUlRVk53Y0NMNFU0T1RwWHpGUWJoTDdXM1RYNVBv?=
 =?utf-8?B?ck1DOU9EVWNmZnBUd3Y2UzlrNkFqNUc0MkUvWEVCQVVsWHo4YktnekpVWUNx?=
 =?utf-8?B?VC9hVDlpQTErR2w0Y3NaQVE3K2IveXNkQkt2d2gwZnRQazdLQzhiWlpOSHpw?=
 =?utf-8?B?N2RZdk9EaWpDejhwM1l1cnlmNjJKdTdhYWV1WWhUYklJN2hVeExraWdOTita?=
 =?utf-8?B?S0YyOVhqTkM2T2VsUU54V3RZaDVycEJoZG9ZR0pkUmZKeFZidmRyT3Fsdzdt?=
 =?utf-8?B?a0ZnWmFJNU5GVGNCaGtSdEZjeVo5ZHN3TkhCK0JDdDZYNzNFU3BOT1RYdk13?=
 =?utf-8?B?SG81a2xVNFNlSlcwTWg1a0JWYTVtTEg2c3EvbWdna292U1BSN0pKeHcyWmU3?=
 =?utf-8?B?K1Q0YTVzUkZEM3ZWbFBYNnl3ekUyY3dycmtmRVJhWkdPc05MdTY2ZzA4K0JC?=
 =?utf-8?B?QzNRbHN5S0dHcTgrZk1vVytFUS9TMkNwMUUvWk1ENldvb0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzR3ODNwUS96UlBsU3RmRW9nM1J3VkxFSXFSR2JVNzdldkRVNnpXbnJpR3RX?=
 =?utf-8?B?bHdmYmV0dDU3RkdnUmxwNS8waGRTUUZpeVNlSmo5RFRPeSs3QndwWDh5Z29W?=
 =?utf-8?B?Vk5MKzc5RGNkYU5NbzFlVll5dDBRM2p6T2lyelJUVFFmT2w5Z2hMRjg0YmMw?=
 =?utf-8?B?cmkvTTExMzBuRWV0ZGNtQUw5aW00VnZ4RVNWN3FJcFQxV0tNeldxcUtyOURk?=
 =?utf-8?B?a1pCTW9NMmxNbkErTjdSbC93VGN5bW5zeDlQdzdZU0VQTzlDTjRXdGV4c0dG?=
 =?utf-8?B?aFFoN3FpWk5JYUFGTHhpT1hrZFhabDYxZlZaZmNRdE93eXNraW5HaVFYN2sz?=
 =?utf-8?B?NkdKbEIyRTFYNGNCazVva1BncFk1RW5SQThSQTdzalI4d3dBblQzVU1iQ2Fy?=
 =?utf-8?B?ajBDdy9HSFltRHJmUGl5TGZlanl4VTczSzdBRTFBQThLSmZqU2laL2JsWXR5?=
 =?utf-8?B?S09rWXd0Z2lna1FQcWlSTkhjbENPSmpkWXB2Ry82RlRqdm5LUkRYeTRlS09S?=
 =?utf-8?B?aXczS2g0MG44QS9Fb0RmUlRIRjVvVTBoc0pLaGQ2OExKVitIL0lZeWtEYzdV?=
 =?utf-8?B?MFJPUXcwYlo0QkpIZEs0V3NhMDJoelJrVFZ4eVlTWmtCWVRwV3VHMzlJcGZV?=
 =?utf-8?B?c280ZFFoVlRMdTVhaUM2NjRGZldzNWNxclFpMVdzQk9TN0k3T3lMbUloNDZm?=
 =?utf-8?B?b0dHV2d4bU92NjZDUjFreVVKNGRxK01GU3RZdmZGVHp6dlM3VW10QklPaHpq?=
 =?utf-8?B?UTZDZ0VjT2dQTjNVZHZlSXRjbDB4U2dGZHltZUVaUEdjK280NGhvL0hTRXcw?=
 =?utf-8?B?NUg3QUZYN2dDZzZUb0FETzEwb0VDVTJPVzBMV3JLM3JQU0lrSUlBSkVyY1Ey?=
 =?utf-8?B?dnBLSzVpcEs4bXptOEUwSE9EREhhSmxsTUt0Wng4dmF6TFFsWEd1cUUwTVBL?=
 =?utf-8?B?QW5lZXArQ3FjWHhKWHhsWU1tYkxIcTA0V2d4OHZ5dDZObzhjYlRMeW9iN1Vs?=
 =?utf-8?B?SWcvd0tETGxmcDFreDJBOUxjOC95VXQrS3BKYXVvQ1U2cHJ4QWhmSmdLY2ZP?=
 =?utf-8?B?ZHN1NlE4TUNwQWpxTnNrczdtQUhIUE1UcFZac1dHZDVpSjFIMTRheFk0ZmFI?=
 =?utf-8?B?L1BDYkdQTWNuZDZmYlFmWm03MzMrWTg5bThwZk5WdlhHdFVUTmVvVkZpbnpW?=
 =?utf-8?B?WDUxeXF2eDdwOHU0Y0ltd3FrVy84bnk4NHJtdmRoRHdHVEVZTGNaeWFPWDU4?=
 =?utf-8?B?VEF3aG5mWFdQcmdidXdyQXM2SEVGY21HTVhrSE9BamFSNXc3MEVvZnlROG5V?=
 =?utf-8?B?S2ZnaHNrQ1BRRGU1THFXWDdzb0pTOFNtNkhKbjczOWhaZnN4aHQvTWVsTXcr?=
 =?utf-8?B?S0JYSVU1OXNIMm1hVDlYc0IxNG1CYkVxV0ZlVGc1ektWdDUxS0lsdmlqN3Ny?=
 =?utf-8?B?MTNZR2xhS0NxNE55VHRhVWxyL1hsMTNBUmRSNmJ1RVZtVEhQdDdjZDJYa1BK?=
 =?utf-8?B?QktRUGt1bUVmeVp4bURmQ2hOcWQySjZQdWFJdFRhaG8xREVvRGlETkk4bFVD?=
 =?utf-8?B?SWkyRDZqUzlzalZlbVQrYmRmMVlOVndmbWZuSDROY3ZJR0w3dTIzQmRTNTZ2?=
 =?utf-8?B?RExDZXNiVU1DZE9MZHRibUppRDFEaHpSZk5DT1BrOWhKd1pjMjBncjloRms2?=
 =?utf-8?B?UEkrcHRHeXRNUmMzMHpZdElZd1JjRXZ5WEVzNDd4ZGRTVElhMEpGekV3SjFK?=
 =?utf-8?B?RlJiVFpEK1c5SjVxdDlwTVBMbWZUY1I2QWJmTEdlUkhVK1lBSDlZdzBRQ3Av?=
 =?utf-8?B?V0UwZlc4OENJSjdpUThUQTFjaHRDa0NtNlBLZmJmOVNZUHFVYjNCQW41VTF4?=
 =?utf-8?B?L0xxSU02OVlSUENXWkNkUVNiaUlsbS9WMXkwdzZGUlYwcEsyT1FmaFZXcWlj?=
 =?utf-8?B?UWJnL0NTNXNDMTRXZWMyWFhtOUxLWUhjalZ6UERSUmhQVHA1c0k2YmU4WnlD?=
 =?utf-8?B?MVAwV2dON2hUNGpIWnFucFZRaks3VjJNNXhhRno2eGZzTjlOa21Yd1RZYWcx?=
 =?utf-8?B?ZjFyWWFtVUpnYklWQ1VRZFhOZHI0ZEZTMjI0ZkZ0NG1NRjRhbm4ydTBsTnNI?=
 =?utf-8?Q?0kLMGNC70JQeDoWYXOz+pmMkf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31261224-86bb-439a-b995-08ddb21ef5f5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 06:27:00.5488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKZUqN7BEutRcbR7fL5w5EE+m2NCZZAvAiogCrw3C/p1yC/USNCkzVIYIOwx2/TgRN8Ye3P6wHDUUHUhiIrTaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7906
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

Hi Ramanaidu,

Just realized we're having adlp/dg2 running on xe on CI and these tests 
are expected to run on these platforms. So lets discard this patch and 
also get the original patch reverted. We might need to handle this 
restriction at a test level for now at least.

Thanks,
Karthik.B.S
On 6/23/2025 9:28 AM, Karthik B S wrote:
>
> On 6/19/2025 1:54 PM, Naladala Ramanaidu wrote:
>> The previous pattern was overly broad and potentially matched
>> unintended test cases. The updated regex now accurately targets
>> the intended downscale factors.
>>
>> Fixes: a0d787e069ce ("tests/intel-ci: Blocklist unsupported Xe 
>> scaling tests")
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel-ci/xe.blocklist.txt | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel-ci/xe.blocklist.txt 
>> b/tests/intel-ci/xe.blocklist.txt
>> index dcdce8b20..1eabd4232 100644
>> --- a/tests/intel-ci/xe.blocklist.txt
>> +++ b/tests/intel-ci/xe.blocklist.txt
>> @@ -82,7 +82,7 @@ igt@kms_pm_rpm@cursor.*
>> ##################################################################
>>   igt@kms_atomic@plane-primary-overlay-mutable-zpos
>>   igt@kms_plane_scaling@.*downscale-factor-0-25.*
>> -igt@kms_plane_scaling@planes-downscale-factor-(0-25|0-5|0-75)
>> +igt@kms_plane_scaling@planes-downscale-factor-(0-2|0-|0-7).$
>>   igt@kms_plane_scaling@planes-upscale-.*downscale-.*
>>   igt@kms_prime@.*
>>   igt@kms_scaling_modes@scaling-mode-none
