Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9EEC28B28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 08:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FA710E7F9;
	Thu, 13 Mar 2025 08:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRbEJ/Fm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA9810E342
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741853561; x=1773389561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kgwILMjjipLkrrilAPZNErNhJTLTZ6mwpmu64SkP+Hs=;
 b=JRbEJ/FmR5110RHQh+nMXFtyKrXSe0kOhsPDaE8zTw72Mj4vZm45XY+d
 uPsGq1YCV0Pj7ipkH+A3a5l2salUoTKWTQebUr4tHXswpFzsKez9k/bv5
 73QuKls9oLx308XDz/ysbN5howdDCDRVHRJ/UlmjCsnfzt8Y/QLjBvPz3
 NcF/tHKfAnsfBzTf7Yltu8y3wYqIKleXcQAWVG1SBmJ2ce3ug9Tr3KkNe
 shQhXb9UTzipOjFvq2cGzg413moChd77RAczoI+ipgPbvh6Uy2QvKvCT7
 Cy9qkKlu0PhGclYBBj25Vhnc1+NQAuiq+9DfL9xo8AO7eVClfqpeRlZDK g==;
X-CSE-ConnectionGUID: aWN6pIqLRbmlDT3tdG1VxQ==
X-CSE-MsgGUID: L88S+XEhQL6DnFx0/sAwEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53165128"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="53165128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 01:12:40 -0700
X-CSE-ConnectionGUID: l6FjPMoiTYaJGFYkXquWbg==
X-CSE-MsgGUID: 3P9JTqyuSg28rZZNUG6Hsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="121804149"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 01:12:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 01:12:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 01:12:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 01:12:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOWLYOtlM6w6CyYuUSEJsDB2o/laV/DEYh/ZvW4m02cwUjwYZ8EniyWc4IgPAwllZdekckAG+e3nsAZQAc3s4m67UdSpCvmk60lmtlYxLYQayPnFe+SZWjNjxms3a+Uv9JmnRhjATqDot8VlCXDXDS6waWhQ7Xvh/tSpk1Tez+w0QSMBf7xlrN/ss1yiTyfpAM5gdcH78CIGBvvICVKN4Au+KANGzUk9uKaomD8uvjtjTSBhoqsQf5iKk1o7XGxyVBX/xSajz2quhYzy7QuHGm6ZwVDr+rylL8B8VKOjW17IrsnJy1yVTKyhAvGSbJEFMFVq8g/0TJ8YARy5U5/b8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ldb8e5oJa6VEMm0iQAg3qgBldxWqLYZ6noN9qildnvo=;
 b=UBpISTHWbQGdC4fqRx83XQ2tBexJkifemoabn2j4morzf/AIO/7ZyxZF+46q6V0t/PN4/lDJ0+cVhBT7YxTWUtbcq1EGFfxKJp2hYcGLe2osnhhaDy7vUPPkqSBRZazS4X+QdVCpDVTD4Bbg7VaTmYMs2rFsrKtsZBGig5Pt+hwpKlEhUiENkevlmCPbqHNJTADr+eDZ27TjP8mpaQZZETyQkj6w/+Rn06CfjoOSup3VNaPyiReEEtlzhWqGGDAEgtJ0tDu4xYYbsWyr4qAm76C0wxFBae+SdbENupSu3tW/UV7MhMlW/hpqrw9+kIcySMqhOsB1Hr27jtWPs7cjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 08:12:36 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 08:12:36 +0000
Message-ID: <20ce3b33-4040-4c3d-b099-8a7043fab15b@intel.com>
Date: Thu, 13 Mar 2025 13:42:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel/kms_fbc_dirty_rect: cleanup the
 dirty rect tests
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <juha-pekka.heikkila@intel.com>, <jani.saarinen@intel.com>
References: <20250307154854.246073-1-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250307154854.246073-1-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::32) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|IA1PR11MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: ddcfde40-6400-4715-4cc5-08dd6206d08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnVzc2VtSTduckltc29hVlRGRWRvNjVLYVBCellLeUdBOTFTd2ROclV6dWYy?=
 =?utf-8?B?blEvcFVUMG9DbGF6VjlDY1RuNkRGWFA3OGZCb1hmVll6ekg4bDNUb0UrQzZ5?=
 =?utf-8?B?TFVaTWdUci8rOHVKSlZycEJoTkZPRFhqNXhwTis0d0NCL296Njlpa25PbEI4?=
 =?utf-8?B?WFhYMWsxYzRtcXVVOXNIdG1nU1o4bEt4T3NqbGpVSG9sK01FeVc0Y0JTTXRP?=
 =?utf-8?B?N2duRnE2R2lGeCs2bHN4Z25VMWR5aVZUejNadFRtSXBLa1RqMlEvdDhUQzNK?=
 =?utf-8?B?VEJBbk1zd1R6a2ZZOUZCd3JKU2MxMHNSWVhKbTM4WVRXSHpnUXhLcmx3Mm1l?=
 =?utf-8?B?R1piZmovZ1R2R09pZWR4SlBQeFpneGlpcWpvTmUxa3N0NHhic0wzanlEUkxE?=
 =?utf-8?B?T3NSbHo3cTdJQzFrMFExci9oaGI5TUFPamVzSnR5akpVbnI2MmxkU2hKR1Zh?=
 =?utf-8?B?RGpVdHNTSHJ3dXYyODV4anJ4dlhONUJic2VHK1VmRDExZmgyY3RTdHhxV2xC?=
 =?utf-8?B?SUJpWVRGRzlncTJEN0hHT0lrT3RkdHNiQXpFa0FCeUYwQm0wSXFyUHJLbGNG?=
 =?utf-8?B?ZEowcnpWcHB0MkVEMGI3N1dHbk5uSldldUFpTk1tcXV1bUhpc3VlZlBTVHYv?=
 =?utf-8?B?VnFDOFdnSnJUdGlHYmFQRFltandKaHJnMjdZQjBFdnREdGhpWXNyYkNQczVE?=
 =?utf-8?B?WjkvazhvY1RzOVNRRU1zRHNhMVR0VFVkSE1Tc1VFWkFycldmT1pCb0dRVjJa?=
 =?utf-8?B?ZzJnZkhHTlFkV3d5Mm1PTjVTK29DQXlwcXo3WWtvNzhHS0JBOVFPeVh4aGNG?=
 =?utf-8?B?Y3pWT3k0bUtVS2xrVmdNcWdML25INDFXSTI5MFAwTC9JelhGRFNVREdkcWti?=
 =?utf-8?B?WU9LbkV4UTJOdGRHUE1ueXJGRVN0L0NZb3h0OStEYnJSLys1UFgrbGVMZ0R2?=
 =?utf-8?B?Z0Y1MnRiTlFMakJKSmhzMDR5bXN5TEZMV3AybzhyVXBMMU9VMTNCRmlKUm54?=
 =?utf-8?B?V1dnWkc1Sm52RlVCOWh4d213KzAybDZVcm5BUUg2dHFLU0tUUmc0OHlHNVZH?=
 =?utf-8?B?djBUTFBXbC81QURKb3ZQanpTeHhQY0tjS2cyUDFYM0JhV3NFSGJmTGszbU0r?=
 =?utf-8?B?NjJJb0RvVjlqekFBcU1hc2tQS1hZOUJlTlBTZ0MvMzR6YTNDZjUzM2twL3hC?=
 =?utf-8?B?aWpZWkRxOFNmbUlNRFVuTDQ3Q0V0dnUweDh6Z255NWNDUGdRb3pmeDJzaDY0?=
 =?utf-8?B?aTNreUxMaU1KbG5FMkRoN1ZBSW5uSlNjaGVWZlFlZCs2QVdqRDJ0c0ZmUnZT?=
 =?utf-8?B?bE42Qys5elkwSlpxcGVud1l1MXNRaENGdTV4RUlhTzlwMHpOdy9zRzJHRmJ4?=
 =?utf-8?B?djltQmhOSlRQTm9PNlFVTUFURnF5MHRFOXJYK2ZnTUl0NVhKVHZSQkltT1J1?=
 =?utf-8?B?Rk5SY0tUTDh5TmlUZkVVdXJoNnpSQURaWm5SdTZrQ1ppVEhVL2FWZXRwelFU?=
 =?utf-8?B?VkViNXFxZTV6QkVlazRiQnFiQ1VXeER6SGdNYWJGbzFzTWF0c0NpOUZjbE0y?=
 =?utf-8?B?QlA1L2IwakROcTErS29iZFk0UHVhQzFhMndoYS9NS25OWnB3NlczU0hjRnVH?=
 =?utf-8?B?TjVVZHlSeVNuRDlFWTIzdW85TFJZM1hEa1JRL2RnRU5SWVlqSTBURFZxaGI2?=
 =?utf-8?B?VGZHWUhLZ05zQmI0dWZNNUNCSldvZ3JvR1h4SWdiMDJJVUFoalBuK21GNHR6?=
 =?utf-8?B?bHQ5ZmU5dHFNU01zRUdCL3o2bGJhbFg4TjUxeUg2Z3RaWVN0MzNhUC9yVkNy?=
 =?utf-8?B?b2ZDTE9vMC9rRnNNYmIrczE1SE9yOTZhQllYRUhldTZGQVVVNnNTaS9pcERB?=
 =?utf-8?Q?HujUjFBFefcKS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJrcEkyV0xselNaR1pBNC9TSDlub21MTTl2dExGeGUydTRXMk5FVkJrOG9N?=
 =?utf-8?B?N1h0aWVwaE1vRTFTeEdjbUUxWDh1ODJpckpRcnRGamwxeVNPTi9hZGZBd0s3?=
 =?utf-8?B?b0dWUUNVRFlFa2d4TC9taUZTb1IxbVZ0anMyenJBdUhReTh4VmJTWVpBR0Fv?=
 =?utf-8?B?TXNmVmltODQ5YzlNR2tEakhYSjN1T0htcjJqN0J0MS93QmVXdDM2US9RVWJG?=
 =?utf-8?B?b2x6cGE4dWphQnlTbXdYWkNKQ1Z6Yk15eEh2VTlFUzhrVUpyMnhwN3dkVHJ0?=
 =?utf-8?B?ejI2N3hzRnNvc0I5cVhiTUZ3dGUyYnE0NERXc3d1YXcreVM1aVA5elZMWlZ0?=
 =?utf-8?B?QXlQbng0d3JnQ2hQWHZmc09uZnh1a3lyT2dNQ3pkMG96ZWNBQ2hjRGp6YVhr?=
 =?utf-8?B?SklCSWdJaXh6RUFKTEhzVVRFVE1tZWRGS3IvWlZkZkhwdFNPblQzYVEvZlFn?=
 =?utf-8?B?OG83a243VEpBeWFLeEVLTjIyOWpBcFE1dVp2TjYwcURMSGdFMVRSaGFqVUN0?=
 =?utf-8?B?ZVA1YUp3a1VVS2YwMVgyRjV1S2dLVHBrZGk2M2kwVnptUk93WVZMN1FocitB?=
 =?utf-8?B?UHc0VEtXWjZMRC9iK3NHU0lSVjNCNlVFSkpKTGhmekkrNVhuZ0pscDNmUDA2?=
 =?utf-8?B?b2trUlRpcTJRSzFnZ1N0V3dCS0JiRVEvUXVjTGJGdUt1S3dzdlZ5VWQ2TEla?=
 =?utf-8?B?SDRyMHIzZzFFWjZFT0pZNWphaUtHSWtzSEt6ajFtL0RsbkRwMHVRZXRtNkxY?=
 =?utf-8?B?VlFIbUwzcERnY2ZsY3l6OENhckg0ZUY0dUY1ME9NYWhGbElWc1BJbURSdGNM?=
 =?utf-8?B?ZHBEU0hmSWtFSW9GNnA1K1RWZmtrNUFmK2krWDNYUXd2WFkvMnVtdlJtUmRK?=
 =?utf-8?B?OUIrNFBseWZyVkQ3djdpOHBJSHIwM0luZk84MmRHT0tIUU1sRldzanZVcmgr?=
 =?utf-8?B?Wjc2Wlk5NmhoVlhhVjMrN3pWOWs0Q3VWYWVQaVU0R0JLL2FGejhMRUlBOGpO?=
 =?utf-8?B?cHFGanF3bisrN1prWHRNTlkxNUtKWHdDQUhKQTJLd0RCcFJ6cm1hVlo5ckN1?=
 =?utf-8?B?SWZjRXNoUEc1YlN6bTRQaGE5QzNTVXlFdlkzUXlYMlErNHhEemZQOUNGM1lS?=
 =?utf-8?B?RGNaYXBvWmJjUHBZeHluMlJoMitIT0ZHV2ZwWTNvenZRM25tUkhLZFYzS1dh?=
 =?utf-8?B?ZlM0M2tpMUlSKzNBeXZ2ZkdsNldvdi81VXpWUlI2MkFjRzJxL2JLMUpUM0Zw?=
 =?utf-8?B?dDRGTzlabmduakszSVFoK0NDNmZsN2ZWaC9CR2F2R2xxWktZMkxVdllhdzhD?=
 =?utf-8?B?aXZNbTl3ZUdyOVA1bi8yU3d3N25UbWp5UFlKZTFKK2dLdDZuQVlFSmZxY3pH?=
 =?utf-8?B?eSs4a2lGeDdTWVVzMXJnS2h0SkcvbE9mWi9HZkNIWnUvT3MrVWJkNTdPOTYv?=
 =?utf-8?B?RWlwSitDTkxONFhmeDlrRnRadkdjZDlzWFFFWG92L1NnTGQ3Sm5UeStub0N6?=
 =?utf-8?B?WkkybW81VjFvV2Mzdk1VdlRGZHJpekQwWnErZklubkR6dFV6TXdGZ1BEaVZ3?=
 =?utf-8?B?c25NOWhsZW9sSUFuckVRR25maWJCSmxHZWVVbkdyYXYxMVNuNHRjOTNyL2NJ?=
 =?utf-8?B?SDRwSUgrSitwdEIrNFQ1SGUvM3dwbVRvTDhQOVoyZE1ZVlBmODNvYjBSRjl0?=
 =?utf-8?B?RVM0a3JFVzJOQlVWWHlrR2JNNElqaVQ3eEE1dDVVVGdhMTBvdFlZckJKQkJJ?=
 =?utf-8?B?amtBSzFweVhzaHA4aE5LVTllUzBpN3pjMXpkNlpGMkFnSGU5a0JNYnBUeWY3?=
 =?utf-8?B?SzV5REdDRm4xL3B0UDh3U0xRZTZuNWkrNTFDenIzRnp1eFcrR0xrR2g3Y0hv?=
 =?utf-8?B?MERwTWFQQiswdUx1QmVOQ1VvVzJwNlpRRDhyT210STc4VEdJaGc2Q3haQlVv?=
 =?utf-8?B?cEt5NzJmNTB1SFVGQzNWUk5BQ21QTFhJaXlwVlplTkJSMkpwZnY0MnlRQ3d4?=
 =?utf-8?B?TnJwUHZiVnU1RDBYMnBPbEc0MGhUcDAralk0ZXpvaVliZGtrZGxRSGZScEJt?=
 =?utf-8?B?NFVLYVI3YWwvTEo2WUJtVkhJL2Z5eHAzemxLUHpCUmxlWHRoM0hHZ3JXL3dD?=
 =?utf-8?B?VXZDNmcrZHc2S2NIS1J6VE56KzVGMUhDZDNSOEJQSWR3VXB0M3I0UGtUS0lF?=
 =?utf-8?Q?FZEHQzwRC7YpJJ3CDA/HEUc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddcfde40-6400-4715-4cc5-08dd6206d08d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 08:12:36.5964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QM16Y4zFp57MG5OBZQ4EnhB3Fe2J/Et1Pw5Pux0+U4gNU3KkeN2P9DKypGKfId9Kld6XfLW7EfUtutLZQQen56V6GBeKbzF0xegqQYXGexlZUW6Jk8RlalnHigMSSS0A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
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

Hi Vinod,

On 07-03-2025 21:18, Vinod Govindapillai wrote:
> These tests rely on FBC is enabled, some FIFO underruns can
> disable FBC and can trigger asserts. In case if such asserts
> are triggered, we end up not clearing the used fbs and crcs.
> Use  common functions to prepare and clear igt test parameters
> as required for each tests
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_fbc_dirty_rect.c | 231 ++++++++++++-------------------
>   1 file changed, 90 insertions(+), 141 deletions(-)
> 
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
> index ea7a73124..4484355b2 100644
> --- a/tests/intel/kms_fbc_dirty_rect.c
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -51,6 +51,10 @@
>   #define SQUARE_OFFSET 100
>   #define SQUARE_OFFSET_2 600
>   
> +#define N_FBS				4
> +#define MAIN_FB_IDX			0
> +#define DIRTY_RECT_FBS_START_IDX	1
> +
>   typedef struct {
>   	int drm_fd;
>   	int debugfs_fd;
> @@ -61,7 +65,7 @@ typedef struct {
>   	enum pipe pipe;
>   	u32 format;
>   
> -	igt_crc_t ref_crc;
> +	struct igt_fb fb[N_FBS];
>   
>   	enum {
>   		FEATURE_NONE  = 0,
> @@ -73,17 +77,12 @@ typedef struct {
>   	} feature;
>   } data_t;
>   
> -static void set_damage_clip(struct drm_mode_rect *damage, int x1, int y1, int x2, int y2)
> +static void set_damage_clip_w(struct drm_mode_rect *damage, int x1, int y1, int width, int height)
>   {
>   	damage->x1 = x1;
>   	damage->y1 = y1;
> -	damage->x2 = x2;
> -	damage->y2 = y2;
> -}
> -
> -static void set_damage_clip_w(struct drm_mode_rect *damage, int x1, int y1, int width, int height)
> -{
> -	set_damage_clip(damage, x1, y1, x1 + width, y1 + height);
> +	damage->x2 = x1 + width;
> +	damage->y2 = y1 + height;
>   }
>   
>   static void dirty_rect_draw_white_rects(data_t *data, struct igt_fb *fb,
> @@ -116,16 +115,11 @@ set_damage_area(igt_plane_t *plane,  struct drm_mode_rect *rects,
>   
>   static void
>   set_fb_and_collect_crc(data_t *data, igt_plane_t *plane, struct igt_fb *fb,
> -		       igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
> +		       igt_crc_t *crc)
>   {
>   	igt_plane_set_fb(plane, fb);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
> -	if (!data->pipe_crc) {
> -		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
> -						  IGT_PIPE_CRC_SOURCE_AUTO);
> -	}
> -
>   	igt_pipe_crc_start(data->pipe_crc);
>   	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, crc);
>   	igt_pipe_crc_stop(data->pipe_crc);
> @@ -186,52 +180,45 @@ update_rect_with_dirtyfb(data_t *data, struct igt_fb *fb1, struct igt_fb *fb2,
>   
>   static void fbc_dirty_rectangle_dirtyfb(data_t *data)
>   {
> -	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
> -	igt_display_t *display = &data->display;
> -	igt_output_t *output = data->output;
>   	igt_plane_t *primary;
> -	drmModeModeInfo *mode;
> -	struct igt_fb main_fb, fb2, fb3;
>   	struct drm_mode_rect full_rect, rect1, rect2;
>   	igt_crc_t main_crc, fb2_crc, fb3_crc, crc;
>   
> -	mode = igt_output_get_mode(output);
> -	igt_output_set_pipe(output, data->pipe);
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>   
> -	set_damage_clip_w(&full_rect, 0, 0, mode->hdisplay, mode->vdisplay);
> +	set_damage_clip_w(&full_rect, 0, 0, data->mode->hdisplay, data->mode->vdisplay);
>   	set_damage_clip_w(&rect1, SQUARE_OFFSET, SQUARE_OFFSET, SQUARE_SIZE, SQUARE_SIZE);
>   	set_damage_clip_w(&rect2, SQUARE_OFFSET_2, SQUARE_OFFSET_2, SQUARE_SIZE, SQUARE_SIZE);
>   
>   	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
> -			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &main_fb);
> +			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[MAIN_FB_IDX]);
>   
>   	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
> -			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &fb2);
> -	dirty_rect_draw_white_rects(data, &fb2, 1, &rect1);
> +			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[1]);
> +	dirty_rect_draw_white_rects(data, &data->fb[1], 1, &rect1);
>   
>   	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
> -			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &fb3);
> -	dirty_rect_draw_white_rects(data, &fb3, 1, &rect2);
> +			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[2]);
> +	dirty_rect_draw_white_rects(data, &data->fb[2], 1, &rect2);
>   
>   	/* 1st screen - Empty blue screen */
>   	set_damage_area(primary, &full_rect, sizeof(full_rect));
> -	set_fb_and_collect_crc(data, primary, &main_fb, pipe_crc, &main_crc);
> +	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &main_crc);
>   
>   	/* 2nd screen - 1st white rect at 100, 100 - using damage area */
>   	set_damage_area(primary, &rect1, sizeof(rect1));
> -	set_fb_and_collect_crc(data, primary, &fb2, pipe_crc, &fb2_crc);
> +	set_fb_and_collect_crc(data, primary, &data->fb[1], &fb2_crc);
>   
>   	/* 3rd screen - 2nd white rect at 600, 600 - using damage area.
>   	 * Now two white rects on screen
>   	 */
>   	set_damage_area(primary, &rect2, sizeof(rect2));
> -	set_fb_and_collect_crc(data, primary, &fb3, pipe_crc, &fb3_crc);
> +	set_fb_and_collect_crc(data, primary, &data->fb[2], &fb3_crc);
>   
>   	/* 4th screen - clear the 2nd white rect at 600,600 with dirtyfb.
>   	 * Copy rect2 area from main_fb to fb3.
>   	 */
> -	update_rect_with_dirtyfb(data, &main_fb, &fb3, &rect2);
> +	update_rect_with_dirtyfb(data, &data->fb[MAIN_FB_IDX], &data->fb[2], &rect2);
>   	/* Now the screen must match 1st screen - with whole blue */
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
>   	igt_assert_crc_equal(&crc, &main_crc);
> @@ -239,21 +226,10 @@ static void fbc_dirty_rectangle_dirtyfb(data_t *data)
>   	/* 5th screen - Copy the first rect at 100,100 with dirtyfb.
>   	 * Copy rect1 area from fb2 to fb3.
>   	 */
> -	update_rect_with_dirtyfb(data, &fb2, &fb3, &rect1);
> +	update_rect_with_dirtyfb(data, &data->fb[1], &data->fb[2], &rect1);
>   	/* Now the screen must match 2nd screen - with one rect at 100,100 */
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
>   	igt_assert_crc_equal(&crc, &fb2_crc);
> -
> -	igt_plane_set_fb(primary, NULL);
> -	igt_remove_fb(data->drm_fd, &main_fb);
> -	igt_remove_fb(data->drm_fd, &fb2);
> -	igt_remove_fb(data->drm_fd, &fb3);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -
> -	if (data->pipe_crc) {
> -		igt_pipe_crc_free(data->pipe_crc);
> -		data->pipe_crc = NULL;
> -	}
>   }
>   
>   /**
> @@ -270,56 +246,43 @@ static void fbc_dirty_rectangle_dirtyfb(data_t *data)
>    */
>   static void fbc_dirty_rectangle_outside_visible_region(data_t *data)
>   {
> -	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
> -	igt_display_t *display = &data->display;
> -	igt_output_t *output = data->output;
>   	igt_plane_t *primary;
> -	struct igt_fb main_fb, rect_fb[3];
> -	struct drm_mode_rect rect[3], full_rect;
> -	igt_crc_t main_crc, rect_crc[3];
> +	struct drm_mode_rect rect[N_FBS];
> +	igt_crc_t rect_crc[N_FBS];
>   
> -	igt_output_set_pipe(output, data->pipe);
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	set_damage_clip_w(&rect[0], 0, 0, data->mode->hdisplay + 200, data->mode->vdisplay + 200);
>   
> -	set_damage_clip(&full_rect, 0, 0, data->mode->hdisplay + 200, data->mode->vdisplay + 200);
>   	/* Rect Horizontally outside visible region */
> -	set_damage_clip_w(&rect[0], data->mode->hdisplay + 10, 100, SQUARE_SIZE, SQUARE_SIZE);
> +	set_damage_clip_w(&rect[1], data->mode->hdisplay + 10, 100, SQUARE_SIZE, SQUARE_SIZE);
> +
>   	/* Rect vertically outside visible region */
> -	set_damage_clip_w(&rect[1], 10, data->mode->vdisplay + 50, SQUARE_SIZE, SQUARE_SIZE);
> +	set_damage_clip_w(&rect[2], 10, data->mode->vdisplay + 50, SQUARE_SIZE, SQUARE_SIZE);
> +
>   	/* Rect Horizontally and vertically outside visible region */
> -	set_damage_clip_w(&rect[2], data->mode->hdisplay + 10, data->mode->vdisplay + 50,
> +	set_damage_clip_w(&rect[3], data->mode->hdisplay + 10, data->mode->vdisplay + 50,
>   			  SQUARE_SIZE, SQUARE_SIZE);
>   
>   	igt_create_color_fb(data->drm_fd, data->mode->hdisplay + 200,
>   			    data->mode->vdisplay + 200, data->format,
> -			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0, &main_fb);
> +			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0, &data->fb[MAIN_FB_IDX]);
>   
> -	for (int i = 0; i < 3; i++) {
> +	for (int i = DIRTY_RECT_FBS_START_IDX; i < N_FBS; i++) {
>   		igt_create_color_fb(data->drm_fd, data->mode->hdisplay + 200,
>   				    data->mode->vdisplay + 200, data->format,
> -				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0, &rect_fb[i]);
> -		dirty_rect_draw_white_rects(data, &rect_fb[i], 1, &rect[i]);
> +				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0, &data->fb[i]);
> +		dirty_rect_draw_white_rects(data, &data->fb[i], 1, &rect[i]);
>   	}
>   
>   	/* Main rect */
> -	set_damage_area(primary, &full_rect, sizeof(full_rect));
> -	set_fb_and_collect_crc(data, primary, &main_fb, pipe_crc, &main_crc);
> +	set_damage_area(primary, &rect[MAIN_FB_IDX], sizeof(rect[MAIN_FB_IDX]));
> +	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &rect_crc[MAIN_FB_IDX]);
>   
> -	for (int i = 0; i < 3; i++) {
> +	for (int i = DIRTY_RECT_FBS_START_IDX; i < N_FBS; i++) {
>   		set_damage_area(primary, &rect[i], sizeof(rect[i]));
> -		set_fb_and_collect_crc(data, primary, &rect_fb[i], pipe_crc, &rect_crc[i]);
> -		igt_assert_crc_equal(&rect_crc[i], &main_crc);
> -	}
> -
> -	igt_plane_set_fb(primary, NULL);
> -	igt_remove_fb(data->drm_fd, &main_fb);
> -	for (int i = 0; i < 3; i++)
> -		igt_remove_fb(data->drm_fd, &rect_fb[i]);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -
> -	if (data->pipe_crc) {
> -		igt_pipe_crc_free(data->pipe_crc);
> -		data->pipe_crc = NULL;
> +		set_fb_and_collect_crc(data, primary, &data->fb[i], &rect_crc[i]);
> +		igt_assert_crc_equal(&rect_crc[i], &rect_crc[MAIN_FB_IDX]);
>   	}
>   }
>   
> @@ -359,115 +322,119 @@ static void fbc_dirty_rectangle_outside_visible_region(data_t *data)
>    */
>   static void fbc_dirty_rectangle_basic(data_t *data)
>   {
> -	igt_display_t *display = &data->display;
> -	igt_output_t *output = data->output;
>   	igt_plane_t *primary;
> -	struct igt_fb main_fb;
> -	struct igt_fb rect_1_fb;
> -	struct igt_fb rect_2_fb;
> -	struct igt_fb rect_combined_fb;
>   	struct drm_mode_rect rect1;
>   	struct drm_mode_rect rect2;
>   	struct drm_mode_rect rect_combined[2];
>   	struct drm_mode_rect full_rect;
>   	igt_crc_t main_fb_crc, rect_1_fb_crc, rect_2_fb_crc, rect_combined_fb_crc, crc;
>   
> -	igt_output_set_pipe(output, data->pipe);
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>   
> -	set_damage_clip(&full_rect, 0, 0, data->mode->hdisplay-1, data->mode->vdisplay-1);
> -	set_damage_clip(&rect1, SQUARE_OFFSET, SQUARE_OFFSET, SQUARE_OFFSET + SQUARE_SIZE,
> -			SQUARE_OFFSET + SQUARE_SIZE);
> -	set_damage_clip(&rect2, SQUARE_OFFSET_2, SQUARE_OFFSET_2, SQUARE_OFFSET_2 + SQUARE_SIZE,
> -			SQUARE_OFFSET_2 + SQUARE_SIZE);
> -	set_damage_clip(&rect_combined[0], rect1.x1, rect1.y1, rect1.x2, rect1.y2);
> -	set_damage_clip(&rect_combined[1], rect2.x1, rect2.y1, rect2.x2, rect2.y2);
> +	set_damage_clip_w(&full_rect, 0, 0, data->mode->hdisplay, data->mode->vdisplay);
> +	set_damage_clip_w(&rect1, SQUARE_OFFSET, SQUARE_OFFSET, SQUARE_SIZE, SQUARE_SIZE);
> +	set_damage_clip_w(&rect2, SQUARE_OFFSET_2, SQUARE_OFFSET_2, SQUARE_SIZE, SQUARE_SIZE);
> +	rect_combined[0] = rect1;
> +	rect_combined[1] = rect2;
>   
>   	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay, data->format,
> -			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &main_fb);
> +			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[MAIN_FB_IDX]);
>   
>   	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay, data->format,
> -			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &rect_1_fb);
> -	dirty_rect_draw_white_rects(data, &rect_1_fb, 1, &rect1);
> +			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[1]);
> +	dirty_rect_draw_white_rects(data, &data->fb[1], 1, &rect1);
>   
>   	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay, data->format,
> -			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &rect_2_fb);
> -	dirty_rect_draw_white_rects(data, &rect_2_fb, 1, &rect2);
> +			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[2]);
> +	dirty_rect_draw_white_rects(data, &data->fb[2], 1, &rect2);
>   
>   	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay, data->format,
> -			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &rect_combined_fb);
> -	dirty_rect_draw_white_rects(data, &rect_combined_fb, ARRAY_SIZE(rect_combined),
> +			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[3]);
> +	dirty_rect_draw_white_rects(data, &data->fb[3], ARRAY_SIZE(rect_combined),
>   				    rect_combined);
>   
>   	/* main_fb blank blue screen - get and store crc */
> -	set_fb_and_collect_crc(data, primary, &main_fb, data->pipe_crc, &main_fb_crc);
> +	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &main_fb_crc);
>   
>   	/* Whole blue screen with one white rect and collect crc */
>   	set_damage_area(primary, &full_rect, sizeof(full_rect));
> -	set_fb_and_collect_crc(data, primary, &rect_1_fb, data->pipe_crc, &rect_1_fb_crc);
> +	set_fb_and_collect_crc(data, primary, &data->fb[1], &rect_1_fb_crc);
>   
>   	/* Second white rect and collect crc */
>   	set_damage_area(primary, &full_rect, sizeof(full_rect));
> -	set_fb_and_collect_crc(data, primary, &rect_2_fb, data->pipe_crc, &rect_2_fb_crc);
> +	set_fb_and_collect_crc(data, primary, &data->fb[2], &rect_2_fb_crc);
>   
>   	/* Both rects and collect crc */
>   	set_damage_area(primary, &full_rect, sizeof(full_rect));
> -	set_fb_and_collect_crc(data, primary, &rect_combined_fb, data->pipe_crc,
> -			       &rect_combined_fb_crc);
> +	set_fb_and_collect_crc(data, primary, &data->fb[3], &rect_combined_fb_crc);
>   
>   	/* Put full blank screen back */
>   	set_damage_area(primary, &full_rect, sizeof(full_rect));
> -	set_fb_and_collect_crc(data, primary, &main_fb, data->pipe_crc, &crc);
> +	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &crc);
>   	igt_assert_crc_equal(&crc, &main_fb_crc);
>   
>   	/* Set combined rect - draw two white rects using damage area */
>   	set_damage_area(primary, rect_combined, sizeof(rect_combined));
> -	set_fb_and_collect_crc(data, primary, &rect_combined_fb, data->pipe_crc, &crc);
> +	set_fb_and_collect_crc(data, primary, &data->fb[3], &crc);
>   	igt_assert_crc_equal(&crc, &rect_combined_fb_crc);
>   
>   	/* Clear first rect using damage area. Only the second rect should be visible here! */
>   	set_damage_area(primary, &rect1, sizeof(rect1));
> -	set_fb_and_collect_crc(data, primary, &main_fb, data->pipe_crc, &crc);
> +	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &crc);
>   	igt_assert_crc_equal(&crc, &rect_2_fb_crc);
>   
>   	/* Clear the second rect as well. Now back to original blank screen */
>   	set_damage_area(primary, &rect2, sizeof(rect2));
> -	set_fb_and_collect_crc(data, primary, &main_fb, data->pipe_crc, &crc);
> +	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &crc);
>   	igt_assert_crc_equal(&crc, &main_fb_crc);
> +}
>   
> -	igt_plane_set_fb(primary, NULL);
> -	igt_remove_fb(data->drm_fd, &main_fb);
> -	igt_remove_fb(data->drm_fd, &rect_1_fb);
> -	igt_remove_fb(data->drm_fd, &rect_2_fb);
> -	igt_remove_fb(data->drm_fd, &rect_combined_fb);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +static void cleanup(data_t *data)

I think the cleanup is not called when igt_assert happens in the 
function, but the overall changes like creating common functions to 
preare and cleanup looks good.

> +{
> +	igt_remove_fb(data->drm_fd, &data->fb[0]);
> +	igt_remove_fb(data->drm_fd, &data->fb[1]);
> +	igt_remove_fb(data->drm_fd, &data->fb[2]);
> +	igt_remove_fb(data->drm_fd, &data->fb[3]);
>   
> -	if (data->pipe_crc) {
> -		igt_pipe_crc_free(data->pipe_crc);
> -		data->pipe_crc = NULL;
> -	}
> +	igt_pipe_crc_free(data->pipe_crc);
> +
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   }
>   
> -static void prepare_test(data_t *data, igt_output_t *output)
> +static bool prepare_test(data_t *data)
>   {
> +	igt_display_reset(&data->display);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_output_set_pipe(data->output, data->pipe);
> +	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
> +					  IGT_PIPE_CRC_SOURCE_AUTO);
> +
>   	igt_require_f(intel_fbc_supported_on_chipset(data->drm_fd, data->pipe),
>   		      "FBC not supported by the chipset on pipe\n");
>   
>   	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
> -		psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, NULL) ||
> -		psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL)) {
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, NULL) ||
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL)) {
>   		igt_info("PSR is supported by the sink. Disabling PSR to test Dirty FBC functionality.\n");
> -		psr_disable(data->drm_fd, data->debugfs_fd, output);
> +		psr_disable(data->drm_fd, data->debugfs_fd, data->output);
>   	}
>   
>   	if (data->feature & FEATURE_FBC)
>   		intel_fbc_enable(data->drm_fd);
> +
> +	return intel_pipe_output_combo_valid(&data->display);
>   }
>   
>   static void fbc_dirty_rectangle_test(data_t *data, void (*test_func)(data_t *))
>   {
> -	prepare_test(data, data->output);
> +	if (!prepare_test(data))
> +		return;
> +
>   	test_func(data);
> +	cleanup(data);
>   }
>   
>   igt_main
> @@ -491,13 +458,7 @@ igt_main
>   
>   		for_each_pipe(&data.display, data.pipe) {
>   			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
> -				data.mode = igt_output_get_mode(data.output);
>   				data.format = DRM_FORMAT_XRGB8888;
> -				igt_display_reset(&data.display);
> -				igt_output_set_pipe(data.output, data.pipe);
> -
> -				if (!intel_pipe_output_combo_valid(&data.display))
> -					continue;
>   
>   				igt_dynamic_f("pipe-%s-%s",
>   					       kmstest_pipe_name(data.pipe),
> @@ -514,13 +475,7 @@ igt_main
>   
>   		for_each_pipe(&data.display, data.pipe) {
>   			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
> -				data.mode = igt_output_get_mode(data.output);
>   				data.format = DRM_FORMAT_XRGB8888;
> -				igt_display_reset(&data.display);
> -				igt_output_set_pipe(data.output, data.pipe);
> -
> -				if (!intel_pipe_output_combo_valid(&data.display))
> -					continue;
>   
>   				igt_dynamic_f("pipe-%s-%s",
>   					       kmstest_pipe_name(data.pipe),
> @@ -540,12 +495,6 @@ igt_main
>   
>   		for_each_pipe(&data.display, data.pipe) {
>   			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
> -				data.mode = igt_output_get_mode(data.output);
> -				igt_display_reset(&data.display);
> -				igt_output_set_pipe(data.output, data.pipe);
> -
> -				if (!intel_pipe_output_combo_valid(&data.display))
> -					continue;
>   
>   				for (int i = 0; i < num_formats; i++) {
>   					igt_dynamic_f("pipe-%s-%s-format-%s",

