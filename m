Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC62ED44150
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 12:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5B110E2A6;
	Tue, 19 Nov 2024 12:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAf2u/gS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AA410E2A6
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732018567; x=1763554567;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0TK7HPBJWbOv5lHuJV3aKv1BtoDNVKGOwcUlMwGpNwk=;
 b=oAf2u/gSHD56MHkrbDw0gSvSFqyeZlwizMHoubniJV/FqcZKvkoF5kNI
 6EUvoDd1QJZjkqSy5Ph4r1BIRZ5HBlUcCIAL8UM46dAG1UrU6jqFgD2xj
 jll2bP7iauKLL30p+WYG3pju/wJGS5EXCzSqxb0IFydwR1wKqpvH1NiHV
 O4sw9PUK2uqtSw6KjthCDCr35Sd2IxOMjQMfQUVdoebduzzNaRfiMlk+B
 8AxZ2WybJqrImHgOofhjDPCelDPAKl0Wm8hfxLAeK9uz/luIFdza2ZCga
 qYgY4AwgdXCP71+cwjL8duzmUOGkDVK/U9zHDTxdQVkjKEtw9fNymfRoZ Q==;
X-CSE-ConnectionGUID: +OLq/hTWT5irZEVXuPyYrg==
X-CSE-MsgGUID: IMHHcNwqTG+52RjkUkc4QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35921129"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="35921129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:16:06 -0800
X-CSE-ConnectionGUID: Y25r+HE2RoqiaO9MxKzxvQ==
X-CSE-MsgGUID: 4oO9DFQ+TGuef42HHHsFkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89938422"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 04:16:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 04:16:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 04:16:05 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 04:16:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybD+wt6wXOv8jFLOzng6enPLIvvkRf3+FkkXIjyelnhORsESH6KicqGE3B110bivK8hsQf0uzV3hU0RsSPgYgVAMAY9qYRewHgtesDIKhAw8LhbnGGZwIn8aZ8MU5+GOt0BPnKNaLa3w7txJY50FK+DRxwn69OxnNTh0Lmy31n2It+E2vtty1NAvgJb0zRCkuCZdbmYuxmV0oTnFXyNm9OTQFfZkimBApFStHx4CPiVbGjdJj8Vgovv2uJAyrlCjyXQlWQWMRtR8KoakrKMnDz+4hnwHggSHwSmjw8R4/jJXBO51z6BItDlD4yr+sKtobBtlhlyHQ8YKjJK2MxUmdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=698HdPFp/m5Wp+aITo2HQxit60JpNkIF6B8HZ3lelWw=;
 b=cxZukOzlmYyvKklR137jKN3FxcByaR87z3A6dSYMauvQtPB4KI3mo4HjXHUCNq0f2qsSCIAMvzrDDKMfI9kCiiHiVTCCbCJVLguGRdVVC9XaujS/sJsn+uaHizGh5LVtl1kuwE+bsoG8wUj/e3NhsDCxbA65i0cDMMUttWEernMvmPCd4ADha/tr0RmP+zroeZ+KBGNvI4Pm8s6/t53ECsxGpAMd7vpWEPIj+XLU6+sQ2nm9ysQUZ6DArVc7d9NlsRRPth+vpKvfo/jnIJmUOQRrD66JhsB2cfBc2aO2CIq8GKuKsQ7b2iyxUA6UQpVxCih+74c5RJ5u0rgpTCb7aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.20; Tue, 19 Nov 2024 12:16:03 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 12:16:03 +0000
Message-ID: <b5d2ff5f-b7ae-4425-9798-18201c8ed9f9@intel.com>
Date: Tue, 19 Nov 2024 13:15:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_ctx_persistence: Wait for
 context termination
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20241118121657.10624-2-krzysztof.niemiec@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20241118121657.10624-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW3PR11MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd919e0-afce-4c72-a726-08dd0893efb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGRGSFFIQVlzaFZ2eFVpVzBRbDVuVVBEMTVpRWJTSW1EWC9ndnpSZG1TaHpO?=
 =?utf-8?B?TW1xMm1vcVJJcDBtZlVWRVErR3NTakkybTU3aGl0Smt1TXc5ejdtaHkzTHpo?=
 =?utf-8?B?eDVvQlFZMStVNGd5aTV5dUdMK3FWcXl3Zk5ldzBpWHh4eFNPNjF0YVlHbFZ0?=
 =?utf-8?B?WUFET25QK3VteTlWSFJTTElLamtndHhibTMxT3U5enM1d1VJWlFkWHJaVUlD?=
 =?utf-8?B?dlJnQ0YrcnVxeC9vRzJHaW5BbHpSWjQ4aXBuazJVOUhpcTkwNzVlYnpDSSs2?=
 =?utf-8?B?VVYwYUlWWGtvaXRrU0k1Z0xDT01yYWowTkJPK2hDQjVOeHk4N3dMLzRWU3R5?=
 =?utf-8?B?U0krc09SWnZXWXorUnpDOTNQakplSFhSa05uT3Y3RUZpQVhYaEIydFp3ZnlV?=
 =?utf-8?B?ZGJyZ0RHRnd2MlpoRHhSOG95dUx5czlwN0J6SFI4dXVpcEpqcUtaVGhXM0Z4?=
 =?utf-8?B?WGxCRTVIM3I4REZTWHZHaHNaZlNiRm00U2gxT2pMaldYbVJDb1BZeHZjckRW?=
 =?utf-8?B?NkN2N24zMW9GUTFoQVBJcXY4UkNLbDk0N1h1SnZmK3doRDVTc0dwNFlmenpv?=
 =?utf-8?B?VVZlSGE1eGdqNlVURFhlQ285bWNWNGtSVEJPVU9BU0RWWWU4R3daTFVuWTFm?=
 =?utf-8?B?MDhWbmVQaFovY3ZvaVYwSC8waGNGMUpnNDZmZkZYQXhPM1M2ZmQvR05nSENJ?=
 =?utf-8?B?UXdRT1dzNWpmQkh1WE5DTHNUeWhzWWtFeHRpVmttWVdXZHB6czhaVktqWkd6?=
 =?utf-8?B?NmIrNE5SMVJSWVlOQ2hsT1hFSndtOW1qMTJydGhOVU94RGtDeVNIaWZHMVdE?=
 =?utf-8?B?c1ZwWm5rY3NHcW5PbUttMGJMQUhCQmZMOGRFMGFlQWM0bUZId2l0Y1VGSU5u?=
 =?utf-8?B?OFppMG9SSzZlUVBITlErNEY3WDJCeDA0VEM5R1VuZVJGamMrUngweGs4V1BU?=
 =?utf-8?B?emRYSXhQU3VKT0lETlpHMnA5ei80VjNQVzZyUjlyeTd3bS9xdnJESThrRFFw?=
 =?utf-8?B?YkJRK3QweVVxR3JiQkhKU3pBUVJQQ01Qb3BKYnRPRHZWZGxzVW9qNWRsZGE4?=
 =?utf-8?B?RlZxMnRTOWdiVUpXQ2pWTy9wMW9YWUVNT1Y4WGx4WGF6WU9LeHRLOFNsUHFM?=
 =?utf-8?B?TWpRL1ZRTVdsYkdvTFRYMml0c2RVdGdSbkwzNk5XNThMNGljMTZNSEZrQUNL?=
 =?utf-8?B?dmRIUmVETGV6WUJxaVFadDZqYTE4YTBFQThsL1ZIVWpXakkwQXdsS2U3aUxn?=
 =?utf-8?B?MWJJdS9GWHlFZVZmdVdpQ0VmaWdINHkvZHZ4TkFFVW1VV1h3UmR1MTh0VXV1?=
 =?utf-8?B?bCtZZTlsazBPUTB2dnc5U1hoNTZLWjIvMFJNdmZOUHgyRDgxVzVYRnNsTm9M?=
 =?utf-8?B?NTVSL3FHVkV3MXcxbHJZYWZCc204aE9XQjJ4ZFgzV1JLazg5MlBGZERSWFN3?=
 =?utf-8?B?VndPVjJuVDVwUURtY2p4YVJzTnN0eWl4Tjg0dnFMT3VzUDRSWXNIbDUwL1Zn?=
 =?utf-8?B?L2dkRXJ1L2l0eFRUdGVrN3V0cnFic2FFYTl3OFZoY3hhbTIweHY5UEdXcDZS?=
 =?utf-8?B?RjVMYzR5TnRHc3RJR1RKYXFRRXE2bkw5cE1EV0VqcmFjNkFhZjNhSzk1YzBl?=
 =?utf-8?B?eGsreUhHem1QSzR5YkhtK1VNbDlUUENzTkJMTkY2dDZndkg1dzhwRWxuMzlx?=
 =?utf-8?B?VU95T2dDYmNpTlQ5R25aZ2JZZ3FlekFBSS9OTEJBY1FhT2VRRXN3THgxa093?=
 =?utf-8?Q?cES2YsHk6GpFFAuEg7CICETcqSFl1qsnNpWcU6I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vy9Fcmx4R05NWUVabE83REU0VFR1dG5wT3p0bnM2c0tJRnpKdmpoK2lWNkQ4?=
 =?utf-8?B?K1dxODFMNmpjUXpBb29hTGdHZDZqTE1EWlYvYk9lc25CcFQ3am9wVXo0Rkxu?=
 =?utf-8?B?RlcrYUgzcnpOOU5JSlBKcmIzbzJIS0RFYm5TbHAvdUZTdTU0aGdwYmkwMmdu?=
 =?utf-8?B?MVV3ekZqT2pMSGMvZUVlRDlpZHI1ZnMrR2F1UjhhcGVHWms5OEhUZ3hqY2xv?=
 =?utf-8?B?OXB0Uy8weExmRnJOcXYybDkyZVpCbkdvRlZ5T0g5UmcrS25tQWNsY042YXI1?=
 =?utf-8?B?a3MvNDVESHNyUFNiY3VEeGd6NTBhUEJBbGVLM3U2b0JzUHRTR0Jma0ZyKzlS?=
 =?utf-8?B?QldPUVh1TnNMamlCSDQ2K3FpNlZJaHMrN1owc0J5NitTaDd4bnJPdkE5ZE9Z?=
 =?utf-8?B?Yi9LYXphcFNJYXhwU09TbEEycEhWdXRQcU5JL0dmS21HNVk4WWhiU2RjSVc3?=
 =?utf-8?B?MHZZUVRpZVZ3Qkd2aUVGajMyZ2YwUnNNdXo2aFA5MjNneTBnTGRoTktQRkhD?=
 =?utf-8?B?OFJSVFRyaUZRRXlLZWZxNjJnWklVSW5MazNlVkNMNnY3dFpXOHlBOUZ1SDRI?=
 =?utf-8?B?N3YvZXpzODBtcmJjSlZWdmw0Zmk0SGdJK3RkSXd5S3FUdHNkUHlWY0VuT1BY?=
 =?utf-8?B?aWVPTE43bUVkZnBjcmluOUFyMzdySUFra2NnY2drT2Y3KzJnaXVVZ0ExQVlP?=
 =?utf-8?B?Tk9kNzkvb1g2Zk8vSVNFZ3pOb0VVcjVTV0pkanNXMHlkTTNZeHV6aDFsbjFz?=
 =?utf-8?B?WmRQMDNkSjV5WkRzV2x3OVBONnQ5aUtDYVRqN0FvQ1JhNVlKVXMranRTVExJ?=
 =?utf-8?B?TEVlQ004Yk9TSXlqYW9RQU9HVnVoSVhQVUY1OVhtMHJwRHlmdGVTZk51RXp3?=
 =?utf-8?B?S3dMV0JDK2xwZEJ1SVJXdEdWSnZ5S0NPSXdycFE4RDBneVczNFlUK2xuTzJY?=
 =?utf-8?B?RmpzaXQwUVlaYUFkSUFFUjd5MCthV3FUUUlWUnp6MmhGWWZyQWFRTGF2dzNz?=
 =?utf-8?B?c3hWTzV5L1NwaW1MNzhOZjVQbDNpTnVCNlQ5b0krajhQb1BscmJVelJPVWwr?=
 =?utf-8?B?c1hyd3JTazNKdksva1dqdFc1MGJnN3hiVUMwMmozczYxS3VNV25NeUlXOTBV?=
 =?utf-8?B?SzdBNC91SGJIaktOTDZZbTRLM1RlRmh0Wml5RmFqSXNySEpGa0syUEc4bld4?=
 =?utf-8?B?UjNkUURWTk5yVXAyR0oybENVRHVYKzk0eXA2MEFVckxlQkhXRmsyZ2RSekVy?=
 =?utf-8?B?RUE1YmNHNDFDL24vYWgvYWhiRjZaSExCQjR6SFhZWUlkZGNrWHZYYWV6dVZV?=
 =?utf-8?B?b2VENU8zektrSzdqMEtjdnV2ZGJtamd5S3NMTEdtSUtWbVdOTW9hR3dqUnhq?=
 =?utf-8?B?azhDYWZTT0kzbUUvNC9veUpVOWdQL3lURmhOQ05abEFVMDVsbHBjV1pZbmdO?=
 =?utf-8?B?bUh4bXpGQkNTMTZjQU1UQXFqbkJTeDRmM2tvVncyZEUwazdTYy85empkOWdm?=
 =?utf-8?B?NUVmd1poREkydlVGanlQRzMya1dDRk9IRjMwU0t0c05ibWVXSmNpU3hCdFZZ?=
 =?utf-8?B?Y050SUhHaExjVDIxaitOaHRLYm5IYnVXNzd6djluNnJOWmlIZlgrRUJtTEd1?=
 =?utf-8?B?c3YxN1lNbTdQVlQ2VU9sMGJuZjc0bTY3YTl2TlE5VCtGMThHRGkrdlR3VnFU?=
 =?utf-8?B?M2xuTkdpRGRpVXhGbStIcjZMcjR5bVVMU3ZTK0lqb0tmdkgrRHJ3bnA4WkM0?=
 =?utf-8?B?Y3dtMFBrVmc2NVZ5Y0xVTGhJOWVtSnozQW8rakRwL3pRcHM3VGZvUzNYd2F2?=
 =?utf-8?B?RGUyN1BtSHdydThqTGN0V1Q1ZkRZR0kyYndzR21kN3h1QUJFaUZrRmh3c3ZZ?=
 =?utf-8?B?cUh3VVRWNStCSXlhUUdyZ3RLVDVkRmdER2U5Qk8zejVsNFdHemdlOExtQ0VU?=
 =?utf-8?B?MHljcDMybWR4RHppUGtKUlY5eW5sdFAyVFRWV3BTSXhEaG9Va2RGbWwyRVZI?=
 =?utf-8?B?cG4wbFY3K1pqMWRkbzgzWWZPZmhjNW53dTFBZm04S1VXeE52VzFJNlRyQVVF?=
 =?utf-8?B?Yjg0aVVVcFlSTmRtUWQ4VEJPNGQ0U0dVM0MzdytOMFBMendjNm1lc2dGa2sv?=
 =?utf-8?Q?bezgo5ovt/XCSM3u6nLShDrWY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd919e0-afce-4c72-a726-08dd0893efb3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 12:16:03.4014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsWVo7EmyBXQP0SdefdYlkBPEdVtpfIG+mK8oT5pSXxQESmoeDp2Q6znMxYHlKUO9nr8j0UD5/EHh71GuA6mIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
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


On 11/18/2024 1:16 PM, Krzysztof Niemiec wrote:
> In some of the subtests, there is a race condition - if a non-persistent
> context is not terminated by the driver before the associated spinner is
> ended and probed for status, the status will be incorrectly reported as
> completed.
>
> Add a sleep instruction before the assert to give the kernel time to
> clean up.
>
> v2:
>  - Update the patch description,
>  - Change the previous expression to a simpler usleep(),
>  - Add a usleep() call in test_saturated_hostile_all(), as this behavior
>    is also shown in this subtest.
>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/gem_ctx_persistence.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
> index 974444cf1..d90b78267 100644
> --- a/tests/intel/gem_ctx_persistence.c
> +++ b/tests/intel/gem_ctx_persistence.c
> @@ -1029,6 +1029,9 @@ test_saturated_hostile_all(int i915, const intel_ctx_t *base_ctx,
>  	igt_spin_busywait_until_started(spin);
>  	intel_ctx_destroy(i915, ctx);
>  
> +	/* Give the kernel some time to terminate the context */
> +	usleep(reset_timeout_ms * 1000);
> +
>  	/* Hostile request requires a GPU reset to terminate */
>  	igt_assert_eq(wait_for_status(spin->out_fence, reset_timeout_ms), -EIO);
>  
> @@ -1173,6 +1176,9 @@ static void __smoker(int i915, const intel_ctx_cfg_t *cfg,
>  	drm_close_driver(fd);
>  	flush_delayed_fput(i915);
>  
> +	/* Give the kernel some time to terminate the context */
> +	usleep(reset_timeout_ms * 1000);
> +
>  	igt_spin_end(spin);
>  
>  	igt_assert_eq(wait_for_status(spin->out_fence, timeout), expected);
