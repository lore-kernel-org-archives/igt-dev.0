Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46F6C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 17:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F40E10EBA6;
	Thu, 22 Aug 2024 17:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQth1elH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97E810EBA6
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 17:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724348126; x=1755884126;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3NWMZemEDdILiZgVx8pNLMKADm2V67Xh0N35/41s9Wk=;
 b=jQth1elHivWfFs73YXXnU7vAlFKgt3go8/kfmcZMSonCRHY9bcx/x/1Q
 qTfq3leADHI+y4nlFg57MR3VkmlD8XrOEk77Tb5PE2AOPFIPvQoBt8J4N
 WVzlGbaMFnqIRUnlAX+8JSNyYTBx3Uuz7kw/7nCOkewMgiUT+1iTgFLi9
 CJ09Qe27KyWOCg2O8QOhTfN7LcjCvf6RwJA5+fZNOPBgskra53m6k83JY
 JtNkhU0eMcLVd1CMZbF41zvDwg9dupur5HFnK/fYsYXJU9/gKj3zgcrBC
 4ytSSuOoEo3eEWalwALZ/z7VPIyLAXdN5bVEdf03VeHOPrOmz7mfDGhnp w==;
X-CSE-ConnectionGUID: t/T+aitFTzCcpyfeCqjDgw==
X-CSE-MsgGUID: PYoFxQHoRFiDDM3Wacza+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22936420"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22936420"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:35:25 -0700
X-CSE-ConnectionGUID: QrJoGoCeQf+FaR1Z5O+QHw==
X-CSE-MsgGUID: JRxe+aclS1GE/nRj8Dhsaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="84708286"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 10:35:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 10:35:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 10:35:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 10:35:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 10:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNo66PUH8MHkfUrSE93HwiQBjfJwiypmn2a6RFoP7BBp6tPXrKTSwHYNm9eihugGFvHI1yb9Ej8WvvA+kBp9gTh0Q0kSIu3XjTSYjgI1c8+nBW/s8p2qV4VuByS/szLF7LX6iND1mpRlJKPyq1cQ13h8A9uEn8A3hQ9xzu689TsHsZJT656jB9sIi6dkL7S3TJzpdkwxq5HwYGkY8Egs70sgzuVd4TPgWOH0vCFXJtST4FuRmtMkuu709UOv74WU/xfcCWbYhTxR+6fzE2wxUzCyqRDmJmyCUvcGHsikLTAY8dzrExJT7KNr37Y/q9RCbqVFCATTY2vA52XBiUICBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=741gbQenc9jMNj0Q/r7o2tEYbHpvzIyCS8b3XTRSXJQ=;
 b=NDw9EYg+SU05SLD63KImoTLu2uBsUlzfLeK3lzCwXHJG5rV8az2XcmufxghUvOd5wnlwTXQ5L3L7r8+O+PtuVhLkQ8USGCj5hDexBWNlIUHJe7/yFyH/q9Gs8DJ0dWbTeVSBcB4p4qURe5MyJAbsLNo54RNj2avbAy21DpsUR0tv4wu69hfjmoRI1PfVlOKmsNRUYO/j967EcKZfsruCH4LkL+xoOwTGbcHcSBc/5wuIAHPygUU1hjbgX1kAB6txUzW6XWlIeonSin8mOCs5lDLrVtQ5e2JU5RFR8hxDZoAu5NzGcVDGfKro9Db8wEPGRFxGAklkO52ARYdgTYvXqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 17:35:21 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 17:35:21 +0000
Message-ID: <55575aff-cee7-4bc0-b22a-73a213da75a6@intel.com>
Date: Thu, 22 Aug 2024 10:35:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Print engine name
 on error
To: Nirmoy Das <nirmoy.das@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>
References: <20240822162602.24246-1-nirmoy.das@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240822162602.24246-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:a03:60::22) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 764fcead-2719-481e-5965-08dcc2d0cc2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnlDZW53RklIWmxZcXJMWEt3clRNcFVyRXpkTEZFUWU5TVF6Sy9maCt5eEV6?=
 =?utf-8?B?MllvZnl3NzlRRG5rVFY1NkJ5cTRlYTlJcjhuMlJMWGh4VGhBMnJ4Sko5Tjkv?=
 =?utf-8?B?VW8wclp2ZHc3SFhOUjh6bFp2NU1BRHBUMEo2WFNoNlpiUnBiOUpXaU9IaEhI?=
 =?utf-8?B?akJoN3BnYTl5SS9UMW9ha3l6aGNNNDhZM0ovTldiQjVxUFpuelQ0ZitsbS9D?=
 =?utf-8?B?UkZYK3lMWnBKN1dMS2VKeGJtenJxNDVRNHdBSTlEaWdkOGVTcnFab05nYXdn?=
 =?utf-8?B?S0lVRGNNSGM4aGQ0YW9wRWNqeWJPMkpSSGRnaXd0NUpkeXpxMmFORjBqRXU5?=
 =?utf-8?B?ZUtONFlTWUE4dVBaNHZkb1VHblIrYko1VldoN0JzdmNVYWd0b1NVRzZZbTg4?=
 =?utf-8?B?bm1YdmNCL240K0ZwVWdZUWwwQU91b3dFUGFicHlEdWNJODgwVFFFM3hMbVVm?=
 =?utf-8?B?NHYzZVVPS3NxMXlRZXE2dHRtVDFCZWpPWUJhcDhWcElzUFYwd3lOSHVvUmFa?=
 =?utf-8?B?blRob3BiM0lWaFEvTVorTTcvVG94SE8rQW5MYSsyd3k5N1RicG1Hb1VpeWxj?=
 =?utf-8?B?dzlKMzF2bzZ4TWVPbXNkaU42R3VMbnVWQ2dVYVYrb0F1OHErbDI4SFJkbEo4?=
 =?utf-8?B?Wngra0EwTkloT3lXM1hOVktCTHVUU2hmQ0orbkg0anErT25hSkVHb05TNjVk?=
 =?utf-8?B?bVVXamhGSmhEbjB6NEtIVkxOVk9ML1NPMmVqTXM0WUFCaDZlbG1qQzlSMXk1?=
 =?utf-8?B?WUI0QUJvT2FHZFV0MDlUQi9zQlFNTldNRDlVQitiWU5welY5dmprUGtlTXdV?=
 =?utf-8?B?WWxiS2FSK0o0Szg1Z091enl5bllWd3ZWa09PM2pSNm9CemsvWjZiNlpKWVpR?=
 =?utf-8?B?cDFSV2dmZ0FLZHcrbGgzSHdhbEVVVm1QY3Q1T2FtcktYRitFcnhqRmR3S2lM?=
 =?utf-8?B?R0lESGtReHh2dWFjR2RFRkpwbWJSR1NsZGdIOWs0SHlORVRFdU8wTGltc1NN?=
 =?utf-8?B?eDVtYXJ3VkgzR2hSeVNacWltdkZ4eWI0dEt2QzBCS3dqdXNTMFJ0K3I1YVlK?=
 =?utf-8?B?c0ZFeXJmeHllZDF2b3hLd0pueE5LMm9zVEZtYUJyUDZKbUhvNkZ2bHZyUTFO?=
 =?utf-8?B?MEVOY2lhY3ZBaDdjbzZOT0JOZFN6K3JGbE1rN3A1aWN4QXdGTUFHbkxTYlhq?=
 =?utf-8?B?bFBHWE04WC9HZlErYkh0MDlDTGFMNGlWUldTREFCcVRZZVZoZzZqK0NXeXZQ?=
 =?utf-8?B?VzQva3RoWXdvcnNmSU44MnYvc2ZYdXBleUM5VDhmd3dvazN0TTFVcVJXVHJX?=
 =?utf-8?B?alhJV3piZXRpb0RZblMybjJ4a0t5dmk2amVLNG1MSnFKSFRDY24wd2tzYUZ2?=
 =?utf-8?B?bC93WGdCUzZUaUZVWHFsUFdSWmRVVlRoaUJMYWhXV3IrTGZ2d1FGQmxVWkF0?=
 =?utf-8?B?dGVuamlFOWlSZVljdlI0aTJHQmFjN2toUEJkbjQ0U2JUaG1KYjVSbEZXK1Rx?=
 =?utf-8?B?eFZGY3QwWVFPWm9vYk83RFJhUExSa0pTMEkvUEUvOEdDTnVPM0UvZDd4ZDlp?=
 =?utf-8?B?RS9wVUkrN2FyOEtwZTJ2QVZ6K05IMWg5NUVLcFlyNGZXdjMzcDhBeUdxS2gy?=
 =?utf-8?B?d09SVnpyYk9xZi9PUWEvS1g3SXB4M0NvZCtuekNybE45QzNCaFpZeVhTV1Bl?=
 =?utf-8?B?OGc1THZZSmgycUVJcWpLcC9ud01nZlhMMjhRVUNySzAxNWdXMjRRWFdGOUNr?=
 =?utf-8?Q?rtX+bq17x7l4ZPKjpw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2FIY2p2TDg3SGJrZGJ5UktuUjZRMjVha29xZm43TDdrcFNUZVFoeUJUTGxF?=
 =?utf-8?B?Znc2QnFBOWR5TUJ6SjlIeCtIRDQvQ2toNEtTUTN6bXFaK0pWMDJCejhvZ28x?=
 =?utf-8?B?V0VIWGY4VDNWaGsyQlFMZlk3WXRwMVNYMlhiU3ArbGhrWUtuZ3RWbEw4di96?=
 =?utf-8?B?Rmt5eFdJM3lRb3VCaHY3UGhjY3RiT0ZZTC80V29DK2ZiRTU2cndVYmdTSng1?=
 =?utf-8?B?c2pmQzNFR1FEWU5HRTlHN2UvTnJJUUFWMTJNdkpZWXJReW5JZFBSRVpDV3Jj?=
 =?utf-8?B?SCtJZ2xyNGl6THBUZkNKRGtUOThlb3hTNXN6aDROaFovYW1PWTU0L2xFdTVt?=
 =?utf-8?B?bWowNEl4c0c3cjZoWGJ0dmQ4NHFEYWZlMHozK29ERjRkblJLOFJEeVEvbnRX?=
 =?utf-8?B?d0ZaS0N0TzgydDJJNjcyVzNSQlFJOUtoQmtpRyt5Ni92MTl2Y1lpcWVVdmQv?=
 =?utf-8?B?ei9qcENjRUNFQ3RzM1Z1bUloeVlUOXZ4WW0wa1FkNzg5Y3dlUDdWd3hlNmVt?=
 =?utf-8?B?RkZ1SW92RzJKU2JZQXdORHRYeEhYb0RMajJxdVJpM0Y1R0NrWXdmUnYzOWpt?=
 =?utf-8?B?VkJrSXJKeW9WRk5lcGx6MVUxQ2tIaEd6b2I4ZDRmZ1hhaG5NTXFlbW5sTmZ1?=
 =?utf-8?B?Nk1sdVJNcXJSdVZVN044UmRsdlNocGFuNXBQYjNnMFdCTWtDSFZiVHlTRnVI?=
 =?utf-8?B?aXc3dHZJRlJkUWpSTjJ5NGpBRVBZSDhyeXh6cWF2b3ZURU1Iem5TYnBMQVNH?=
 =?utf-8?B?WW10TjBzNGoxOWtORWJ1RHZtTEdiSWJzbVNGU1pKdGJjV1crSTR1Mkh3VXEz?=
 =?utf-8?B?RHBLQXpqb2VaNEc2QzVYSVNORDVjZ0tiaTE5MldaTG5WckdpSExIN2JVN05p?=
 =?utf-8?B?MHdUbWZQQklsY3JtdGJ3QWZWN2VGQTdrZ3B5eVlKd0hGRVlHM3JXQzJLOEV4?=
 =?utf-8?B?dmN3dGJYS2lWV2s3SzByY09KYUY2VlBLWWs1cUJaWGlRSEJZWHpnOUtZb3Ny?=
 =?utf-8?B?UlNmb0RvNVN5YVNTV2RRTmpsTS9JMWlUOGVuZHVoa2hmZUhFNjBMMzBmMitO?=
 =?utf-8?B?QnJtbXFMbkFMZ2VMRjlYc1ZQaHdPNWVMZDV1SHJrQml6S0RHcXBSM0dxaEov?=
 =?utf-8?B?V2NreUNmMWRBVk13WGFKYXg4dWpOUnBSZW13YzdMUUVjRlJlb1Bva3M1TFJ0?=
 =?utf-8?B?TXAvYjlkUHpCV1pKQ0g1K3Z4c08vUmpWVklqR3ZCZG8wUzBCTFFmK0RpQS94?=
 =?utf-8?B?eiszbUxtQmV6NTZLK3RRWEp2OXBYZnZFUExNdU0yTXBZdzQxVWhOT080aVhS?=
 =?utf-8?B?cVhWNm1yRHVITlNqb0NEZFhhY2piU2I3UjUwNCtwcTkzOHJ5RkVUMWtjK3Bl?=
 =?utf-8?B?SXV3NjJHVFVqNmNCNXExMEd0dmlaNU5ZSHpWL29YL3hwZ3h0Z1hna0RHakMv?=
 =?utf-8?B?emw1T0ZMcElITlVNUFFSa0JiMGd5R1NWUlhvN09BSjBEMFV2Nm1hOHJLQ2ty?=
 =?utf-8?B?MHd0U2ltT2s2aDdHOFRRcHhUUlF4QlhGTXJBcno5VDhvejVaNFhaVHhhYkRv?=
 =?utf-8?B?aTk2RFlkYnZUR05YKzUzcy9BS1JCay9OMC9TOXlkNEJsRWhuWHFxVk9ZVVdu?=
 =?utf-8?B?YmErajVWdHdxT1ZRVEVzWnpKVU5mQVZKK1BsalRwYmNkUlI4TGpGM290R1dI?=
 =?utf-8?B?a2R2aE9yaVV1ZnI2Yjk1U25IU3FYeU9QNHZqcWpSTDR1U20xWkF1RDdaS3Rj?=
 =?utf-8?B?RUpIdXJ3N0ZadDZ1ci81TjlvR2tQYjlvbTZOQkplQzN2QnRxTG9lamlsMEFT?=
 =?utf-8?B?dGJGYXJkUlZwVS8rdXBNc3Fod0xvRkdQMWVUSmJoNkN6YjZobXE0NzMrazBB?=
 =?utf-8?B?eDFDbHhWaTBTaFdUTXJJMEdCM2xiSFRVdW1nbDNyQmViMlQxSEhsSWlKQita?=
 =?utf-8?B?RWxkSFFzSm1XNFlCOUJnNUVycEw0dFFEclNZRUZyWFB6U3FPOWF1VHdGbDFp?=
 =?utf-8?B?emNaSlJ6Z09jZVJuQUJnVjdiTUJUcDZxczk5ZlkyMXVwZzNlRDg3TmpNcFFw?=
 =?utf-8?B?YXlXVmdDNGI2OEJLcGlhdWRDU0hYc0pGU1c3M0d3NnhyMDNzdXRaVFJleGt0?=
 =?utf-8?B?TlZLb2pBazdBNlFOeFVVN3pxM0xaVlo5ODlTV0pocGVYYVB6ZEtVZU9HU29y?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 764fcead-2719-481e-5965-08dcc2d0cc2a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 17:35:21.5257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPNVqh7KVCXfEw0zn6GdHCQW3HA3bIL/mZWC1xmu3tNMrO7lL6xNFUSzJVOmj4GJ9XBrZ7gcaiyYgMAkMIcrsBqCR1kT3gjA1L7gNHZNmcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
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


On 8/22/2024 9:26 AM, Nirmoy Das wrote:
> Print engine name the test is running on to help with debugging.
>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1461
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>   tests/intel/xe_exec_fault_mode.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 87375ed17..1f1f1e50b 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -140,6 +140,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	int i, j, b;
>   	int map_fd = -1;
>   
> +	igt_debug("%s running on: %s\n", __func__, xe_engine_class_string(eci->engine_class));
>   	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>   
>   	if (flags & ENABLE_SCRATCH)
