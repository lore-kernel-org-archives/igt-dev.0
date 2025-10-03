Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E90CCA471
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 12:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10EE10E10C;
	Fri,  3 Oct 2025 12:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVlmWwZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F14510E10C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 12:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759494393; x=1791030393;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=svv38vauOwfxAcw10eNBQyKmT6wUCUyBxSptQ08AdhA=;
 b=VVlmWwZ8xyl5JLmznyq/Tnd829IuU0GJex/D4E2u3cvpRrGxuS/XI7ZQ
 nf/mQdKA15dmpYKXEyN1KvNUXYjK/uH8kKXgNFayVA3wmssqLmX6gOCe6
 /IyJWNAgYt2ybkjeaeT+11QZeiTv7WEBaqGU+8oMFqtO5+R+ge+GYGsra
 xh3KMcsD8ADGJpd9ZcAY8rLravChQNzjE7YtWCedoKwBnC96+RlBOj8PN
 /GQEz6GDhZODzn+hbqwG3ZBA+bq07d5/0ZcB8PmCA5jECg8QOgptP++SN
 fTV7Y990cdb/jjGUckAu5t8rSwKvtEJ3EJzhePdlRwEeL3IR9jOvqYLNU w==;
X-CSE-ConnectionGUID: 0dkZyEAiQeqLweV9+1DZsw==
X-CSE-MsgGUID: KGMmZ5y+TqylT8Lww2gwIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="87231867"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="87231867"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:26:32 -0700
X-CSE-ConnectionGUID: xhaVCf9OS/qhRMPsKhH2mw==
X-CSE-MsgGUID: WNycXCFBRtS6jvqc2MaOKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="179696626"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:26:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 05:26:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 05:26:31 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 05:26:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUoC0SvMdSrQwL9g2vqfAA2aaKd+U5uuydxHg8cSQO//aMWCpksNnCoehxSLFPi1gJsJfu6dmkmo0914sIfZxZ2JyrYHVxr4Hm1lFn/gQOqB0Q9E/Kwa+CU/SBAu3tGzOoXxqYoD+c8tsPoP9RoeM3o7/1m9mTE/n5d565hPTzZ3U5vm7gmpoUhMaknSr4UbWJcdj0v/O96KduS6jpvMF13rB2TPqDKE7wVoizXktW5VgmPq7Ew1C5J5n1D50ZGUMc+LcdVOTT+vybVJGDDn0Aw+TQdZeUxiFPVulYC8VTfR9pghmR4Tg2uWvR5/+Q9xxEbaur0113OwekDdgJ/1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cxPoB/8WrnV9ftceb89qzaVVjtcXFPqb9eeEduBULk=;
 b=jJJagVs8l9DiVlnhY17sxyV1pIvwOMoqNtVyRbXet+56LdJDE7zKbfWyNUhFmipZhIqJM6GVFVFXCiH0UWJ63pbzq5d74ocxKbCdIsND1tVdX6bSQEYV0rCHuzlvrvQNP4ussIg/pgbtzVmvLrGVwS2CA4EPj2h+HQggeXirj1CxZzdSNZDMmu+Tu+KsLp86GjEcah7/kM4D1tqRU7zKnCDVuwfsGcjtwtpc+WBjYk137MLnGe4HZ+IPM9Qz/v2FFd8Lly+Mbd2JSYWw+O+ffokQfNRWvlnkSsz6TqgHG0b8tBrJns+WeeeuVxVBzQf6QzomxBPWFhhHFhPHTfCyoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Fri, 3 Oct
 2025 12:26:22 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 12:26:21 +0000
Message-ID: <bff9632c-4389-4378-baac-f46958b854cf@intel.com>
Date: Fri, 3 Oct 2025 17:56:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 09/30] tests/kms_colorop: Add kms_colorop tests
To: Alex Hung <alex.hung@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-10-alex.hung@amd.com>
 <20250827105359.kg2x5jmo2w25iqxa@kamilkon-DESK.igk.intel.com>
 <5b909804-494f-4ffa-909d-25cbd38ea17c@intel.com>
 <264688db-1917-44c8-9373-b8fc200d116a@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <264688db-1917-44c8-9373-b8fc200d116a@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::8) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|BL3PR11MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbaa52a-5037-40d1-1b99-08de02780f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzUwZ3RYT3cxUE9lWnhSaS9WdFFrMGdlSTdhWGpaeU5aUjB3MjlQcXptM3JJ?=
 =?utf-8?B?L2svajRBK1czZjFpd1h0S21hVTlBYTh5MUFsc0ZNQjQ0Z1VuS1k2MTdKM3k4?=
 =?utf-8?B?UDdoaEQ2YU1RekNxbmxPSEgrNGcvODBQWE1EN0xDYnFCN2xiM1BVdlp1bXcv?=
 =?utf-8?B?SVRRUlh4M2RydThaQU1nTHY4UlBBSk9wRTRCZ0Y2K1N6R3VkUWFKV1d1aHVN?=
 =?utf-8?B?aUdhdzFWUisvQlJkdC9GRkZpNXpqVWcwTmxnS29WbDFFQjdndEc2QkV1cEVi?=
 =?utf-8?B?VTM1OHg5ak8xdVZYbkxzY1l6VzgvNmlWUTkrajFueEpwNzFQU3Z2M3NGU0hn?=
 =?utf-8?B?NWV5K2hOQTRkZ3poZ29wWVVUU1dJT1BZZDFudGhuQkdpL3RJeWQ2aGdiM2dF?=
 =?utf-8?B?bmcxc0VrcnY1dURMNXR6dmRBN3p4OGN1UnZ2WnBsUit2Z1FqcWMreW00UnFK?=
 =?utf-8?B?S3VCS0pPY3ZFeDJ0c1J4NkJqRUk2MytDVFJnRTBXR1lUNFM4RVkyclprZEdx?=
 =?utf-8?B?U1NNVWJzQU9FcjBnS2dCRFBuWlJKWWJoSjltUFlmMytXVXJxQ21DM0NPTVZX?=
 =?utf-8?B?UXFnMDh1WXZqb2pTZDlVWW1udEJyenVtblorMFREZXI2UUhMaXZua2NFUWJi?=
 =?utf-8?B?QkRFRlFDYzlsaW9jVmlxMml2QzhhdG85YXVXd0IvR3FjRlJwQUxzNVhudFNU?=
 =?utf-8?B?S3N5dEdTMjNISkJWVUxBUGU4bXNXSzF3cStTRE1DMjQ0bzFtNEtONzA3MjBo?=
 =?utf-8?B?MXpDZFZOeTJuRjBhM1c0WlMya0h0U09OS09nYmp2cGYyM3FlUDMwVnJmUkFU?=
 =?utf-8?B?T1hGd0FiVDVmcmIzdmt6WmlOMDl0Q2M2VzBmcVg1b2FSUkxPN1QzRG1DWlZC?=
 =?utf-8?B?clFiNzFlcGt1N3BjeDJvdkRVejJJTzVKMnJrT1pzeVdiMHVYK1JwM0I0d013?=
 =?utf-8?B?RU5VOHQ5RWtYYXdsS0o3RlNrRUdEd2cwSElNdk5ybzExM2lHbG54dHZEajZY?=
 =?utf-8?B?cjNVUXV1SnFVb0JQS3JTckR4V2ZXQ2JoWTRDR2YyWjRkN2JCV296Rnhrd0lG?=
 =?utf-8?B?ajY0ck42SlNWeGtXV0xUUDZ0bTFuTy9DZkVrVjNEZXlPa241c0JaTmxKU2Va?=
 =?utf-8?B?YURoWjlubWs0R3JmekdpNWMxYWkwak5mUlNVbTJUN1JtVW8xYnd5T3pFeEZ5?=
 =?utf-8?B?NnNyd1NRbDV4WERyWEhQckMrUGlyMjBYNStxUWsvUEVxR1FubTc3bDVVbHZE?=
 =?utf-8?B?bUZNdktsb3ZWaFJGUTlhUElMWC9nMk1vU2hjSVZQVFErTy9zOEVLYnhLY2gw?=
 =?utf-8?B?OEJlNmwrNWJPWm9NYW1xaEtnQXVYWEFSbjRDTE5NUEErdmNRN2FzeDV2VUFn?=
 =?utf-8?B?cUJ1NHdkaVR0ZVlDQXdxRjM2N01RaHpoeDdrcG1pTHRMcTk1czNibnBWS0FD?=
 =?utf-8?B?QUYzZU9wMmM4d3hxVmo0V3Z3MmVDUHpiZkxnbzBLRi9WQzgxQkhjbC8xbU5M?=
 =?utf-8?B?QUZBQWZOZXJrYWJNWFkraW5ySnRmUXNVb2pQZDI5SnBkU0N3ajlYOHc0eW1W?=
 =?utf-8?B?K3UxRlVkaHNNTFdSMFhqUmdRQmNwZmZDZjdTOXpELy9rblFTeXhQNlloRjlD?=
 =?utf-8?B?V3ZNV2dIUTgrdDhEamphNzEwZlFZVndBUUttU25FUWk1T3laTWdLQjhLNGRi?=
 =?utf-8?B?SGRGUkhDTUFUUi9ILzQ3MUR4ZTBJWUpvUVVSVDFjZXpNLzlFUWt3eUxMdVRV?=
 =?utf-8?B?Rmt1b2pNYlBHNTRIU2xsTkQ1RFZCdkdPN20wVU1heStScVNza09XMU50VXFT?=
 =?utf-8?B?TDJ3S2M4d1MyMUdvOERiSUVKMjU4eWtqejdQSEJia2VXV2lBaWV4VDhkOU9T?=
 =?utf-8?B?cDJTMU9od3grKzNmc0lwK3ZkRFNUQU5TYWRiMlJZcHV2bkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c00zNUxUdEdibGt1WFVYeEJRRDBqeHpBTnZ4QWlJU3NNOUJNZk1uZ0RmZ2dq?=
 =?utf-8?B?Vmc3bENCcFp1MmE0SE0vZEhFVmVGdjMrT3NvZGl1SWR6UGZXRVhZMmd1SElX?=
 =?utf-8?B?NTJ5blA3VGczek81eXZqYXFjOVZpcUx6ak82TTJGMis4TXk2TEtBaTFIT2lw?=
 =?utf-8?B?aGszSXJlN3JwSEI4M05kZjMwUjhMcHI0a2JoKzlFWkVmUFNKWERXZDR0cTN1?=
 =?utf-8?B?c2doRVQzWDJYMTQ5VzBtK2YyNHpBOElibmJlN0tKMlZJaXFZeWk0aEVKYWxY?=
 =?utf-8?B?TzFuc1FOQ0FiZ3R0Y3JmNVBPbGpRT08xM1BYc0lyMnhBdzNwK0FnaE90TDQx?=
 =?utf-8?B?VXkrN3NJSHk4SVZmVW5BYk5qcENFRjBwZFdXTzRYelpMdzd6VktWdUoydkpW?=
 =?utf-8?B?MGN6c2ExUlFCWUlKMTUrQXRSU24xYnd0c1ZzNFdzUE1KS2hHbndJdlNBek5m?=
 =?utf-8?B?ZHZvcm5UdGQrS1Ivbk1ENEFQQzNHQm9nZzhhTUJrempGTWkwNHlNWG01Zi9D?=
 =?utf-8?B?WUNhb1FzWVNTT21YRFhFNit3b0dtNk0wd1N5S1dEb1JHUmNCNkFzVTlld2Fx?=
 =?utf-8?B?bkRwZHg0UzZMZ3JVT1Y1TmdUL2s1NVYzcGVOYVhjZnArRkFRMzF2eHo2Yzlz?=
 =?utf-8?B?S2VjOTd0eEI4R0xFWWJmU29RZVRoUHRCam5saGJMMGZkZFdZckkvcDIwNVE1?=
 =?utf-8?B?Z1g0NUNkY0s4bUtMNDc3NmVIM0x1Q1RXczIxWEFoV0FWK1F6T1pjSXhnZlIz?=
 =?utf-8?B?T1VjbVQyZ1RLRjhJSFBDOFNOYXBzYXNoNUJGOTNHUDBGdWFJdVQxWVNuNTM1?=
 =?utf-8?B?UEoxVXFDcCtFTkVGcndvdmZYOGQ3OFBxN3FQVGxXNGRqdUtjbHQ2YVpla3Jj?=
 =?utf-8?B?cS9tSzY3YnZKOHc2RDEvMS9sOHVyN1JOaDBoRndxbmp6aThUSytJNkNrRmkz?=
 =?utf-8?B?MkdBYkdxYTR1cHI3WW1TWklnOHU2a1JvSFc2QVFiZ3RjblBhSkZreU1ZZjhS?=
 =?utf-8?B?UlNreGVLUHBTMnMwd3FrY3RQVTRmc3ZCc3lVNlpyeEVHcHVlNkRuWlJjUWRu?=
 =?utf-8?B?TmpucmFxcXhmNlJtc3lGRkhML3hOWlhDRmM5bEtlK3Axd1BMaC9mZTdRN0tW?=
 =?utf-8?B?TSt6ckNaYlFVYWIzQzZrblR2Zy9wNFF2bFVLd2U5Rnl2SE92YnNOWkV2bmox?=
 =?utf-8?B?SER1WFNLRDNmS24wWmxPalh1KysyekZ4S000cmhkODRwTGI4WEVDY3psMkIv?=
 =?utf-8?B?bDhQeFlPYjFtQ0lVOEJpeTFYS2Rld3hucVA1OWE3UThDN1hMeWtJYVpURW1x?=
 =?utf-8?B?MUdSSVZaM3BpOS9WaXZoY0laMG5qbVNBb281ODZEZlFmak13NUI3K0lwNDZN?=
 =?utf-8?B?WGlndDlqcTlhVnB5bEQ4czFiVWZrU3pndXhZN1JKNlpYUXIydlgxYm9XUXNE?=
 =?utf-8?B?bDNIbVBobTlNSTB6K29vNnNSWnNzdUF4allLcUgra1pvcUd2WkpOajN3OC8z?=
 =?utf-8?B?TGZmYTRsVHVUMU1pM0lpQWg4QURmZWJramhLdzNnUDN4WllKeDhxd0hqV1Fl?=
 =?utf-8?B?VHM3VEZHM0hIeXByWnB1UThVR0RmUWtQSE9zZWxQNm9YVHVUYTRaWXVWRWtM?=
 =?utf-8?B?WmhrUzhkLzdMdE1iWVVtRHNQaXJGRkZGYytwbVdYcWpWVG9Yb0sxaE9wT2xx?=
 =?utf-8?B?cVJscG1aSFVWSVRJUkFkenpwM3gwRlhZSytSb3FPYXNpbTJTL0dCbStFM0hY?=
 =?utf-8?B?Smg5aXpIU1ZPVHlKd0xta0Q0Y3hWeUR6N2ZmeVVGVE8xem5wRHlPa1JVc0p4?=
 =?utf-8?B?VC9VNXJnVWNWVkRsSWgxdlhadnh5RXVJT1hjNENtQVNLNG9xSHNNaThRT2pQ?=
 =?utf-8?B?L243eVVhRk5pQVpnOFo5ajZSTDh1L2YrVmk2dEFOcjdUU1Y0WnA0NzZQODNR?=
 =?utf-8?B?MGRxVy91SFF1R3NBWENsK1p4QmVWTVQ0dnpNaDJGNWlPWnkwSTJnR0JBQldO?=
 =?utf-8?B?L3JCVkNXaWo0TzhCNUVKQ04yTjREYUxhWHErM3lCQlpoaWVkMHRyZWdYYVNv?=
 =?utf-8?B?NThRcVI5eEhUMWFWTENheitnSlY0ZzhjU0hRMkRIS09IUnpLSWhlSldzdGhG?=
 =?utf-8?B?eVpoeXd4ZGVxZ0lQcmdrMnhFQ0lnbm9ySTNUaUxuNzl0R1hySiszTjc2NTFu?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbaa52a-5037-40d1-1b99-08de02780f7b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 12:26:21.7704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KMbAHQmkKvgOENhWwAZxFRzIhiE0NwOrDGWsRbR8X58eExGZzveSYIBQ9PO4v6vuBsXwNTjKG+kSijpmA+rcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
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

Hi Alex

On 19-09-2025 11:48 pm, Alex Hung wrote:
>
>
> On 9/19/25 01:19, Sharma, Swati2 wrote:
>> Hi Alex,
>>
>> Is it possible to move colorop basic func() like
>> can_use_colorop(), map_to_pipline(), etc. to lib?
>
> These two functions use kms_colorop_t which defined in 
> tests/kms_colorop.h, and it is not available in lib/
>
> If you can refactor them to lib, I am happy to review your patches.

I have added common func in lib as part of the series 
https://patchwork.freedesktop.org/patch/678255/?series=150455&rev=3
With these changes we can add colorop tests in kms_color too which is 
currently being used by Intel for colorop validation.

>
> It would be nice if more colorop tests can be added to kms_colorop 
> though.

Yes, sure. But since intel KMD is still working to enable writeback,
we can't use kms_colorop for validation but as soon as WB is enabled from
KMD, we will switch colorop validation to kms_colorop.

>>
>> On 27-08-2025 04:23 pm, Kamil Konieczny wrote:
>>> Hi Alex,
>>> On 2025-08-14 at 22:06:38 -0600, Alex Hung wrote:
>>>> From: Harry Wentland <harry.wentland@amd.com>
>>>>
>>>> This tests the color pipeline API, exposed via the
>>>> COLOR PIPELINE plane property and drm_colorop objects.
>>>>
>>>> We introduce tests for:
>>>>   - sRGB EOTF
>>>>   - sRGB Inverse EOTF
>>>>   - sRGB EOTF + sRGB Inverse EOTF
>>>>
>>>> The last one is the holy grail of LUT testing. It tests that
>>>> after applying an EOTF, followed by its inverse EOTF we arrive
>>>> back at the original value. We can use this to test for
>>>> precision loss in the pipeline.
>>>>
>>>> All tests are tested via writeback. All transforms are done in
>>>> SW (in floating point) and at the end the SW transformed buffer
>>>> is compared with the KMS writeback output buffer. The two should
>>>> match within a bracket of acceptable deviations. Since these
>>>> deviations might look different for different KMS drivers we'll
>>>> do this check on a driver-specific basis.
>>>>
>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>>> ---
>>>>   tests/kms_colorop.c | 508 
>>>> ++++++++++++++++++++++++++++++++++++++++++++
>>>>   tests/kms_colorop.h |  88 ++++++++
>>>>   tests/meson.build   |   1 +
>>>>   3 files changed, 597 insertions(+)
>>>>   create mode 100644 tests/kms_colorop.c
>>>>   create mode 100644 tests/kms_colorop.h
>>>>
>>>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>>>> new file mode 100644
>>>> index 000000000..e247477ec
>>>> --- /dev/null
>>>> +++ b/tests/kms_colorop.c
>>>> @@ -0,0 +1,508 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person 
>>>> obtaining a
>>> Please remove this text as it is replaced by SPDX above.
>>>
>>>> + * copy of this software and associated documentation files (the 
>>>> "Software"),
>>>> + * to deal in the Software without restriction, including without 
>>>> limitation
>>>> + * the rights to use, copy, modify, merge, publish, distribute, 
>>>> sublicense,
>>>> + * and/or sell copies of the Software, and to permit persons to 
>>>> whom the
>>>> + * Software is furnished to do so, subject to the following 
>>>> conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall be 
>>>> included in
>>>> + * all copies or substantial portions of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>>>> EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>> MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO 
>>>> EVENT SHALL
>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>>>> DAMAGES OR
>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>>> OTHERWISE,
>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>>> USE OR
>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>> + */
>>>> +
>>>> +#include "igt.h"
>>>> +#include "igt_color.h"
>>>> +#include "sw_sync.h"
>>>> +#include "kms_colorop.h"
>>>> +
>>>> +/**
>>>> + * TEST: kms colorop
>>>> + * Category: Display
>>>> + * Description: Test to validate the retrieving and setting of DRM 
>>>> colorops
>>>> + *
>>>> + * SUBTEST: plane-%s
>>>> + * Description: Tests DRM colorop properties on a plane
>>>> + * Driver requirement: amdgpu
>>>> + * Functionality: kms_core
>>>> + * Mega feature: General Display Features
>>>> + * Test category: functionality test
>>>> + *
>>>> + * arg[1]:
>>>> + *
>>>> + * @srgb_eotf:                   sRGB EOTF
>>>> + * @srgb_inv_eotf:               sRGB Inverse EOTF
>>>> + * @srgb_eotf-srgb_inv_eotf:     sRGB EOTF -> sRGB Inverse EOTF
>>>> + *
>>>> + */
>>>> +
>>>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>>>> future) use */
>>>> +static bool check_writeback_config(igt_display_t *display, 
>>>> igt_output_t *output,
>>>> +                    drmModeModeInfo override_mode)
>>>> +{
>>>> +    igt_fb_t input_fb, output_fb;
>>>> +    igt_plane_t *plane;
>>>> +    uint32_t writeback_format = DRM_FORMAT_XRGB8888;
>>>> +    uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>>>> +    int width, height, ret;
>>>> +
>>>> +    igt_output_override_mode(output, &override_mode);
>>>> +
>>>> +    width = override_mode.hdisplay;
>>>> +    height = override_mode.vdisplay;
>>>> +
>>>> +    ret = igt_create_fb(display->drm_fd, width, height,
>>>> +                DRM_FORMAT_XRGB8888, modifier, &input_fb);
>>>> +    igt_assert(ret >= 0);
>>>> +
>>>> +    ret = igt_create_fb(display->drm_fd, width, height,
>>>> +                writeback_format, modifier, &output_fb);
>>>> +    igt_assert(ret >= 0);
>>>> +
>>>> +    plane = igt_output_get_plane_type(output, 
>>>> DRM_PLANE_TYPE_PRIMARY);
>>>> +    igt_plane_set_fb(plane, &input_fb);
>>>> +    igt_output_set_writeback_fb(output, &output_fb);
>>>> +
>>>> +    ret = igt_display_try_commit_atomic(display, 
>>>> DRM_MODE_ATOMIC_TEST_ONLY |
>>>> +                        DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>> +    igt_plane_set_fb(plane, NULL);
>>>> +    igt_remove_fb(display->drm_fd, &input_fb);
>>>> +    igt_remove_fb(display->drm_fd, &output_fb);
>>>> +
>>>> +    return !ret;
>>>> +}
>>>> +
>>>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>>>> future) use */
>>>> +typedef struct {
>>>> +    bool builtin_mode;
>>>> +    bool custom_mode;
>>>> +    bool list_modes;
>>>> +    bool dump_check;
>>>> +    int mode_index;
>>>> +    drmModeModeInfo user_mode;
>>>> +} data_t;
>>>> +
>>>> +static data_t data;
>>>> +
>>>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>>>> future) use */
>>>> +static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>>>> +{
>>>> +    int i;
>>>> +    enum pipe pipe;
>>>> +
>>>> +    drmModeModeInfo override_mode = {
>>>> +        .clock = 25175,
>>>> +        .hdisplay = 640,
>>>> +        .hsync_start = 656,
>>>> +        .hsync_end = 752,
>>>> +        .htotal = 800,
>>>> +        .hskew = 0,
>>>> +        .vdisplay = 480,
>>>> +        .vsync_start = 490,
>>>> +        .vsync_end = 492,
>>>> +        .vtotal = 525,
>>>> +        .vscan = 0,
>>>> +        .vrefresh = 60,
>>>> +        .flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>>>> +        .name = {"640x480-60"},
>>>> +    };
>>>> +
>>>> +    for (i = 0; i < display->n_outputs; i++) {
>>>> +        igt_output_t *output = &display->outputs[i];
>>>> +
>>>> +        if (output->config.connector->connector_type != 
>>>> DRM_MODE_CONNECTOR_WRITEBACK)
>>>> +            continue;
>>>> +
>>>> +        for_each_pipe(display, pipe) {
>>>> +            igt_output_set_pipe(output, pipe);
>>>> +
>>>> +            if (data.custom_mode)
>>>> +                override_mode = data.user_mode;
>>>> +            if (data.builtin_mode)
>>>> +                override_mode = output->config.connector- 
>>>> >modes[data.mode_index];
>>>> +
>>>> +            if (check_writeback_config(display, output, 
>>>> override_mode)) {
>>>> +                igt_debug("Using connector %u:%s on pipe %d\n",
>>>> + output->config.connector->connector_id,
>>>> +                      output->name, pipe);
>>>> +                return output;
>>>> +            }
>>>> +        }
>>>> +
>>>> +        igt_debug("We found %u:%s, but this test will not be able 
>>>> to use it.\n",
>>>> +              output->config.connector->connector_id, output->name);
>>>> +
>>>> +        /* Restore any connectors we don't use, so we don't trip 
>>>> on them later */
>>>> +        kmstest_force_connector(display->drm_fd, output- 
>>>> >config.connector, FORCE_CONNECTOR_UNSPECIFIED);
>>>> +    }
>>>> +
>>>> +    return NULL;
>>>> +}
>>>> +
>>>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>>>> future) use */
>>>> +static uint64_t get_writeback_fb_id(igt_output_t *output)
>>>> +{
>>>> +    return igt_output_get_prop(output, 
>>>> IGT_CONNECTOR_WRITEBACK_FB_ID);
>>>> +}
>>>> +
>>>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>>>> future) use */
>>>> +static void detach_crtc(igt_display_t *display, igt_output_t *output)
>>>> +{
>>>> +    if (get_writeback_fb_id(output) == 0)
>>>> +        return;
>>>> +
>>>> +    igt_output_set_pipe(output, PIPE_NONE);
>>>> +    igt_display_commit2(display, COMMIT_ATOMIC);
>>>> +}
>>>> +
>>>> +static void get_and_wait_out_fence(igt_output_t *output)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    igt_assert(output->writeback_out_fence_fd >= 0);
>>>> +
>>>> +    ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
>>>> +    igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", 
>>>> strerror(-ret));
>>>> +    close(output->writeback_out_fence_fd);
>>>> +    output->writeback_out_fence_fd = -1;
>>>> +}
>>>> +
>>>> +static bool can_use_colorop(igt_display_t *display, igt_colorop_t 
>>>> *colorop, kms_colorop_t *desired)
>>>> +{
>>>> +    switch (desired->type) {
>>>> +    case KMS_COLOROP_ENUMERATED_LUT1D:
>>>> +        if (igt_colorop_get_prop(display, colorop, 
>>>> IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE)
>>>> +            return true;
>>>> +    case KMS_COLOROP_CUSTOM_LUT1D:
>>>> +    case KMS_COLOROP_CTM:
>>>> +    case KMS_COLOROP_LUT3D:
>>>> +    default:
>>>> +        return false;
>>>> +    }
>>>> +}
>>>> +
>>>> +/**
>>>> + * Iterate color pipeline that begins with colorop and try to map
>>>> + * colorops[] to it.
>>>> + */
>>>> +static bool map_to_pipeline(igt_display_t *display,
>>>> +                igt_colorop_t *colorop,
>>>> +                kms_colorop_t *colorops[])
>>>> +{
>>>> +    igt_colorop_t *next = colorop;
>>>> +    kms_colorop_t *current_op;
>>>> +    int i = 0;
>>>> +    int prop_val = 0;
>>>> +
>>>> +    current_op = colorops[i++];
>>>> +    igt_require(current_op);
>>>> +
>>>> +    while (next) {
>>>> +        if (can_use_colorop(display, next, current_op)) {
>>>> +            current_op->colorop = next;
>>>> +            current_op = colorops[i++];
>>>> +            if (!current_op)
>>>> +                break;
>>>> +        }
>>>> +        prop_val = igt_colorop_get_prop(display, next,
>>>> +                        IGT_COLOROP_NEXT);
>>>> +        next = igt_find_colorop(display, prop_val);
>>>> +    }
>>>> +
>>>> +    if (current_op) {
>>>> +        /* we failed to map the pipeline */
>>>> +
>>>> +        /* clean up colorops[i].colorop mappings */
>>>> +        for (i = 0, current_op = colorops[0]; current_op; 
>>>> current_op = colorops[i++])
>>>> +            current_op->colorop = NULL;
>>>> +
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>> +static igt_colorop_t *get_color_pipeline(igt_display_t *display,
>>>> +                     igt_plane_t *plane,
>>>> +                     kms_colorop_t *colorops[])
>>>> +{
>>>> +    igt_colorop_t *colorop = NULL;
>>>> +    int i;
>>>> +
>>>> +    /* go through all color pipelines */
>>>> +    for (i = 0; i < plane->num_color_pipelines; ++i) {
>>>> +        if (map_to_pipeline(display, plane->color_pipelines[i], 
>>>> colorops)) {
>>>> +            colorop = plane->color_pipelines[i];
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return colorop;
>>>> +}
>>>> +
>>>> +static void set_colorop(igt_display_t *display,
>>>> +            kms_colorop_t *colorop)
>>>> +{
>>>> +    igt_assert(colorop->colorop);
>>>> +    igt_colorop_set_prop_value(colorop->colorop, 
>>>> IGT_COLOROP_BYPASS, 0);
>>>> +
>>>> +    /* Set to desired value from kms_colorop_t */
>>>> +    switch (colorop->type) {
>>>> +    case KMS_COLOROP_ENUMERATED_LUT1D:
>>>> +        switch (colorop->enumerated_lut1d_info.tf) {
>>>> +        case KMS_COLOROP_LUT1D_SRGB_EOTF:
>>>> +            igt_colorop_set_prop_enum(colorop->colorop, 
>>>> IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
>>>> +            break;
>>>> +        case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
>>>> +            igt_colorop_set_prop_enum(colorop->colorop, 
>>>> IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
>>>> +            break;
>>>> +        case KMS_COLOROP_LUT1D_PQ_EOTF:
>>>> +        case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
>>>> +        default:
>>>> +            igt_fail(IGT_EXIT_FAILURE);
>>>> +        }
>>>> +        break;
>>>> +    case KMS_COLOROP_CUSTOM_LUT1D:
>>>> +    case KMS_COLOROP_CTM:
>>>> +    case KMS_COLOROP_LUT3D:
>>>> +    default:
>>>> +        igt_fail(IGT_EXIT_FAILURE);
>>>> +    }
>>>> +}
>>>> +
>>>> +static void set_color_pipeline(igt_display_t *display,
>>>> +                   igt_plane_t *plane,
>>>> +                   kms_colorop_t *colorops[],
>>>> +                   igt_colorop_t *color_pipeline)
>>>> +{
>>>> +    igt_colorop_t *next;
>>>> +    int prop_val = 0;
>>>> +    int i;
>>>> +
>>>> +    igt_plane_set_color_pipeline(plane, color_pipeline);
>>>> +
>>>> +    for (i = 0; colorops[i]; i++)
>>>> +        set_colorop(display, colorops[i]);
>>>> +
>>>> +    /* set unused ops in pipeline to bypass */
>>>> +    next = color_pipeline;
>>>> +    i = 0;
>>>> +    while (next) {
>>>> +        if (!colorops[i] || colorops[i]->colorop != next)
>>>> +            igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
>>>> +        else
>>>> +            i++;
>>>> +
>>>> +        prop_val = igt_colorop_get_prop(display, next,
>>>> +                        IGT_COLOROP_NEXT);
>>>> +        next = igt_find_colorop(display, prop_val);
>>>> +    }
>>>> +}
>>>> +
>>>> +static void set_color_pipeline_bypass(igt_plane_t *plane)
>>>> +{
>>>> +    igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, 
>>>> "Bypass");
>>>> +}
>>>> +
>>>> +static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
>>>> +{
>>>> +    if (is_vkms_device(in->fd))
>>>> +        return igt_cmp_fb_pixels(in, out, 1, 1);
>>>> +
>>>> +    /*
>>>> +     * By default we'll look for a [0, 0] bracket. We can then
>>>> +     * define it for each driver that implements support for this
>>>> +     * test. That way we can understand the precision of each
>>>> +     * driver better.
>>>> +     */
>>>> +    return igt_cmp_fb_pixels(in, out, 0, 0);
>>>> +}
>>>> +
>>>> +#define DUMP_FBS 1
>>>> +
>>>> +#define MAX_COLOROPS 3
>>>> +#define NUM_COLOROP_TESTS 3
>>>> +#define MAX_NAME_SIZE 256
>>>> +
>>>> +static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t 
>>>> *sw_transform_fb)
>>>> +{
>>>> +    int i;
>>>> +    igt_pixel_transform transforms[MAX_COLOROPS];
>>>> +
>>>> +    for (i = 0; colorops[i]; i++)
>>>> +        transforms[i] = colorops[i]->transform;
>>>> +
>>>> +    igt_color_transform_pixels(sw_transform_fb, transforms, i);
>>>> +}
>>>> +
>>>> +static void colorop_plane_test(igt_display_t *display,
>>>> +                   kms_colorop_t *colorops[])
>>>> +{
>>>> +    igt_colorop_t *color_pipeline = NULL;
>>>> +    igt_output_t *output;
>>>> +    igt_plane_t *plane;
>>>> +    igt_fb_t input_fb;
>>>> +    igt_fb_t sw_transform_fb;
>>>> +    igt_fb_t output_fb;
>>>> +    drmModeModeInfo mode;
>>>> +    unsigned int fb_id;
>>>> +    igt_crc_t input_crc, output_crc;
>>>> +
>>>> +    output = kms_writeback_get_output(display);
>>>> +    igt_require(output);
>>>> +
>>>> +    if (output->use_override_mode)
>>>> +        memcpy(&mode, &output->override_mode, sizeof(mode));
>>>> +    else
>>>> +        memcpy(&mode, &output->config.default_mode, sizeof(mode));
>>>> +
>>>> +    /* create input fb */
>>>> +    plane = igt_output_get_plane_type(output, 
>>>> DRM_PLANE_TYPE_PRIMARY);
>>>> +    igt_assert(plane);
>>>> +
>>>> +    fb_id = igt_create_color_pattern_fb(display->drm_fd,
>>>> +                    mode.hdisplay, mode.vdisplay,
>>>> +                    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>>> +                    0.2, 0.2, 0.2, &input_fb);
>>>> +    igt_assert(fb_id >= 0);
>>>> +    igt_plane_set_fb(plane, &input_fb);
>>>> +#if DUMP_FBS
>>>> +    igt_dump_fb(display, &input_fb, ".", "input");
>>>> +#endif
>>>> +
>>>> +    /* create output fb */
>>>> +    fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, 
>>>> mode.vdisplay,
>>>> +                DRM_FORMAT_XRGB8888,
>>>> +                igt_fb_mod_to_tiling(0),
>>>> +                &output_fb);
>>>> +    igt_require(fb_id > 0);
>>>> +
>>>> +    igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
>>>> +
>>>> +    igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
>>>> +
>>>> +    /* reset color pipeline*/
>>>> +
>>>> +    set_color_pipeline_bypass(plane);
>>>> +
>>>> +    /* Commit */
>>>> +    igt_plane_set_fb(plane, &input_fb);
>>>> +    igt_output_set_writeback_fb(output, &output_fb);
>>>> +
>>>> +    igt_display_commit_atomic(output->display,
>>>> +                DRM_MODE_ATOMIC_ALLOW_MODESET,
>>>> +                NULL);
>>>> +    get_and_wait_out_fence(output);
>>>> +
>>>> +    /* Compare input and output buffers. They should be equal 
>>>> here. */
>>>> +    igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
>>>> +
>>>> +    igt_assert_crc_equal(&input_crc, &output_crc);
>>>> +
>>>> +    /* create sw transformed buffer */
>>>> +
>>>> +    igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
>>>> +    igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
>>>> +
>>>> +    apply_transforms(colorops, &sw_transform_fb);
>>>> +#if DUMP_FBS
>>>> +    igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
>>>> +#endif
>>>> +    /* discover and set COLOR PIPELINE */
>>>> +
>>>> +    /* get COLOR_PIPELINE enum */
>>>> +    color_pipeline = get_color_pipeline(display, plane, colorops);
>>>> +
>>>> +    /* skip test if we can't find applicable pipeline */
>>>> +    igt_skip_on(!color_pipeline);
>>>> +
>>>> +    set_color_pipeline(display, plane, colorops, color_pipeline);
>>>> +
>>>> +    igt_output_set_writeback_fb(output, &output_fb);
>>>> +
>>>> +    /* commit COLOR_PIPELINE */
>>>> +    igt_display_commit_atomic(display,
>>>> +                DRM_MODE_ATOMIC_ALLOW_MODESET,
>>>> +                NULL);
>>>> +    get_and_wait_out_fence(output);
>>>> +#if DUMP_FBS
>>>> +    igt_dump_fb(display, &output_fb, ".", "output");
>>>> +#endif
>>>> +
>>>> +    /* compare sw transformed and KMS transformed FBs */
>>>> +    igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
>>>> +
>>>> +    /* reset color pipeline*/
>>>> +    set_color_pipeline_bypass(plane);
>>>> +
>>>> +    /* Commit */
>>>> +    igt_plane_set_fb(plane, &input_fb);
>>>> +    igt_output_set_writeback_fb(output, &output_fb);
>>>> +
>>>> +    igt_display_commit_atomic(output->display,
>>>> +                DRM_MODE_ATOMIC_ALLOW_MODESET,
>>>> +                NULL);
>>>> +    get_and_wait_out_fence(output);
>>>> +
>>>> +    /* cleanup */
>>>> +    detach_crtc(display, output);
>>>> +    igt_remove_fb(display->drm_fd, &input_fb);
>>>> +    igt_remove_fb(display->drm_fd, &output_fb);
>>>> +}
>>>> +
>>>> +igt_main
>>>> +{
>>>> +
>>>> +    struct {
>>>> +        kms_colorop_t *colorops[MAX_COLOROPS];
>>>> +        const char *name;
>>>> +    } tests[] = {
>>>> +        { { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
>>>> +        { { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
>>>> +        { { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, 
>>>> NULL }, "srgb_eotf-srgb_inv_eotf" }
>>>> +    };
>>>> +
>>>> +    igt_display_t display;
>>>> +    int i, ret;
>>>> +
>>>> +    igt_fixture {
>>>> +        display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>>> +
>>>> +        if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 
>>>> 1) == 0)
>>>> +            display.is_atomic = 1;
>>>> +
>>>> +        ret = drmSetClientCap(display.drm_fd, 
>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>>>> +
>>>> +        igt_require_f(!ret, "error setting 
>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>>> +
>>>> +        igt_display_require(&display, display.drm_fd);
>>>> +
>>>> +        kmstest_set_vt_graphics_mode();
>>>> +
>>>> +        igt_display_require(&display, display.drm_fd);
>>>> +
>>>> +        igt_require(display.is_atomic);
>>>> +
>>>> +    }
>>>> +
>>>> +    for (i = 0; i < ARRAY_SIZE(tests); i++) {
>>>> +        igt_describe("Check color ops on a plane");
>>>> +        igt_subtest_f("plane-%s", tests[i].name)
>>>> +            colorop_plane_test(&display, tests[i].colorops);
>>>> +    }
>>>> +
>>>> +    igt_describe("Tests getting and setting COLOR_PIPELINE 
>>>> property on plane");
>>>> +    igt_fixture {
>>>> +        igt_display_fini(&display);
>>>> +    }
>>>> +}
>>>> diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
>>>> new file mode 100644
>>>> index 000000000..f414895dd
>>>> --- /dev/null
>>>> +++ b/tests/kms_colorop.h
>>>> @@ -0,0 +1,88 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person 
>>>> obtaining a
>>> Same here, remove this text.
>>>
>>> Regards,
>>> Kamil
>>>
>>>> + * copy of this software and associated documentation files (the 
>>>> "Software"),
>>>> + * to deal in the Software without restriction, including without 
>>>> limitation
>>>> + * the rights to use, copy, modify, merge, publish, distribute, 
>>>> sublicense,
>>>> + * and/or sell copies of the Software, and to permit persons to 
>>>> whom the
>>>> + * Software is furnished to do so, subject to the following 
>>>> conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall be 
>>>> included in
>>>> + * all copies or substantial portions of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>>>> EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>> MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO 
>>>> EVENT SHALL
>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>>>> DAMAGES OR
>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>>> OTHERWISE,
>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>>> USE OR
>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>> + */
>>>> +
>>>> +#ifndef __KMS_COLOROP_H__
>>>> +#define __KMS_COLOROP_H__
>>>> +
>>>> +#include "igt_color.h"
>>>> +
>>>> +typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
>>>> +
>>>> +typedef int (*transform_fb)(igt_fb_t *in);
>>>> +
>>>> +typedef int (*transform_pixel)(igt_pixel_t *pixel);
>>>> +
>>>> +/* Test version definitions */
>>>> +typedef enum kms_colorop_type {
>>>> +    KMS_COLOROP_ENUMERATED_LUT1D,
>>>> +    KMS_COLOROP_CUSTOM_LUT1D,
>>>> +    KMS_COLOROP_CTM,
>>>> +    KMS_COLOROP_LUT3D
>>>> +} kms_colorop_type_t;
>>>> +
>>>> +typedef enum kms_colorop_lut1d_tf {
>>>> +    KMS_COLOROP_LUT1D_SRGB_EOTF,
>>>> +    KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
>>>> +    KMS_COLOROP_LUT1D_PQ_EOTF,
>>>> +    KMS_COLOROP_LUT1D_PQ_INV_EOTF,
>>>> +} kms_colorop_lut1d_tf_t;
>>>> +
>>>> +typedef struct kms_colorop_enumerated_lut1d_info {
>>>> +    kms_colorop_lut1d_tf_t tf;
>>>> +} kms_colorop_enumerated_lut1d_info_t;
>>>> +
>>>> +typedef struct kms_colorop {
>>>> +    kms_colorop_type_t type;
>>>> +
>>>> +    union {
>>>> +        kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
>>>> +    };
>>>> +
>>>> +    const char *name;
>>>> +
>>>> +    igt_pixel_transform transform;
>>>> +
>>>> +    /* Mapped colorop */
>>>> +    igt_colorop_t *colorop;
>>>> +
>>>> +} kms_colorop_t;
>>>> +
>>>> +kms_colorop_t kms_colorop_srgb_eotf = {
>>>> +    .type = KMS_COLOROP_ENUMERATED_LUT1D,
>>>> +    .enumerated_lut1d_info = {
>>>> +        .tf = KMS_COLOROP_LUT1D_SRGB_EOTF
>>>> +    },
>>>> +    .name = "srgb_eotf",
>>>> +    .transform = &igt_color_srgb_eotf
>>>> +};
>>>> +
>>>> +kms_colorop_t kms_colorop_srgb_inv_eotf = {
>>>> +    .type = KMS_COLOROP_ENUMERATED_LUT1D,
>>>> +    .enumerated_lut1d_info = {
>>>> +        .tf = KMS_COLOROP_LUT1D_SRGB_INV_EOTF
>>>> +    },
>>>> +    .name = "srgb_inv_eotf",
>>>> +    .transform = &igt_color_srgb_inv_eotf
>>>> +};
>>>> +
>>>> +#endif /* __KMS_COLOROP_H__ */
>>>> diff --git a/tests/meson.build b/tests/meson.build
>>>> index 5c01c64e9..e612e1a05 100644
>>>> --- a/tests/meson.build
>>>> +++ b/tests/meson.build
>>>> @@ -26,6 +26,7 @@ test_progs = [
>>>>       'kms_bw',
>>>>       'kms_color',
>>>>       'kms_concurrent',
>>>> +    'kms_colorop',
>>>>       'kms_content_protection',
>>>>       'kms_cursor_crc',
>>>>       'kms_cursor_edge_walk',
>>>> -- 
>>>> 2.43.0
>>>>
>>
>

