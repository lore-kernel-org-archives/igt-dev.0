Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED78AC2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989E410E870;
	Thu, 20 Jun 2024 23:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2MOzoYC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B9E10E870
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718926829; x=1750462829;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gw4a4pB9P0+LiNonkPh5Ukp4duUCHFILrGrnyWwTymw=;
 b=l2MOzoYCtoS/v0fwQ5p7EJCkwbPCD0Uj0u1NiRP/vBmP4cvb/eQl32KC
 10hsSR/JeMIj0SK3fzhRha2X+IkraTjbMoHbxoXqae/qPzo/qUkdzum+b
 1KH4UrA6kL4IXm0DSbyEz7DEtg/sKWfP4LooUt8qlAp5mvy91BcOqPRKi
 /thIS5i549rJT2nB6Dkh93wRVAsaATUuSIzgtKNQVh5p9InV2AcZ7NeZY
 pkztUODCSa7VTE2QJX8OyD8Ot4/jHvb/vKuF9nZBRWHudvktAaPjb7tmT
 8tQQb6w/13suOAmxhqFWvUb9NJl6NYHPxmk9gKumFK4nbWHqeXaJ3jozh w==;
X-CSE-ConnectionGUID: WuxpfsIZQPS8vDnwktlrlA==
X-CSE-MsgGUID: OIcdajJsQZW/vBLUE9IihA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15921250"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="15921250"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:40:28 -0700
X-CSE-ConnectionGUID: 3GtacDkZRnivcS5D/Q9nAg==
X-CSE-MsgGUID: oCS0uZfdTW6VWbe/+k1JdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="42367489"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:40:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:40:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:40:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AR5X9z5Vw+3+/2BwvkbnsyDUu9NEYVjwNSEdLK7iJsTnOJtTzXM14GG5Y0VYH587R6enLu0Ewgm18YUY71uwzBHdn4qoHmQDDE4wfmcLcI2gVzcr3S4QmNZ/LMOLLsjpkY4bAdOotMmZjV1KLz4HwOpyeY0vqxbT+z0fdcJYLiwKJ7nMsfSvQatabfWyjAQ0wHue8+D9IPye14HK7l5W/n5D5z5rWQLQ00MkxeCJT0v1ylpMRiDNLxEXesJYEOR3CqXgK7kP9dx/bq7Pk0NicE9NQHLMjOsWGAIEjKMuHjKXo8SJswqGkYc5FZOtbCTbANc6eYH/uVzEkI0fPKtrkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AL7fqvhpXrJ4BnO1wZxbLN6u12SUf3qr71HP4sH31VQ=;
 b=esVZpXBbXp/cnnZdlea996ouCNPb1qjrMcxP7qPRO/DmjptrJA1tc77ZwvT19sU/cr5/1/ecHq3WMYXV7qJXZh44dqeJPYxLYLNBo8oRV7yRhPTp0Y2L1dZdquNppEbOu1zArlmYNh+nMPpsNV5wBFLZiMNsEZSNgAe6LH9Yz9LrLBp6BT9fth7wT+YgqGMddvWUgDy27eHA2kPdg4ikIlkQGdQNj27OIov9TN1u4v6UxTyUVYwvL91G8wQWS+GCg5qyRkFWRYp4CgI6AoEvcaCezK2jIO+EeNAj77YXQ3fF18p76q5p7qkwI2gpqvsAcWT7+39DLZ/f4ycxqvQ4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 23:40:25 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:40:25 +0000
Date: Thu, 20 Jun 2024 16:40:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 21/28] lib/xe/oa: Add xe_oa_data_reader to IGT lib
Message-ID: <ZnS957sH+s+RezjZ@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-22-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620200054.3550653-22-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:303:2a::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba6cf07-99ea-45e3-dd0b-08dc91825bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1RYV2dlai8xQnJsdVd2QS9KRUJ5eFNqNkUwYkVncncxWHRua2V2dmdmVzVq?=
 =?utf-8?B?RzRTR2E3SmZtRlo5aFE2aFhsMlFmdFVNYzZqU2ZHRkFGL0VoVUR1cWRvbGJ5?=
 =?utf-8?B?OEhya3k2cTFCNWVScWFuUXRLcDROeDZpVmEyYjBPSmsyM3QyeUVadHR1MDg2?=
 =?utf-8?B?NHlGTUpnb1RKeHZDV3oxbytzSktSVWVPa3E2dzFCT3pFSmlIZktIeHhwMFla?=
 =?utf-8?B?VSswN1lrUmI1bW8rekM4S0ZlS2VQcGU3ZHlYbDJ4U1pPNjBVWEFjVmIzU1BE?=
 =?utf-8?B?WGZ5cWk4YUx0SFlTcjdVUGowNmpDNmJsdnM4dGg3NDlaZVFXbXdlTVNtYkc4?=
 =?utf-8?B?SitscEExRSthVDhYdUlBLzI5NGxJbXJTUXMvbnlxaEI0MDdnYmRLNEZCSWYy?=
 =?utf-8?B?bE9CR1AxWGZKUDdJNHFOYmVwemlxREh1d2R0VE9tZ1ExaVZxQnVCaktuNm83?=
 =?utf-8?B?UWZDSkJMdVE3UHZEazN1cTZoTFp5SGk1UUZxNVdqd0dlTGNxY1QxYjlGUDZ1?=
 =?utf-8?B?aG9ycTc3OTFOdWpBUjh3TkVGeVdoNWZ2bnRUYS9ucFpMQzRLZytrWGdSMUlt?=
 =?utf-8?B?U1dseFBYY0dhU1dlL0FOOEZuNGtNcXNDelJjc042WUtGMnFuQnFqbTJJS0hW?=
 =?utf-8?B?MFJHTmtnVVFBK1l4LzlMR3gzK3pndGMzN0xsSkZqRXRkU1ZPb0RrVlNVR21I?=
 =?utf-8?B?eWFiNHd2MFcraVZqQUZNSU5LU2ozeVIrczhHeldSRFppako5Q0EreWNTeWs2?=
 =?utf-8?B?SW1USDZDMURtb2RVYUYwVUxGckhqcVNQQ3EwcnJKREFwUzJTMmdSWFZDaGE1?=
 =?utf-8?B?a0lFTENlRStlUjRmZXFTcEZnTWp1VlQ5ODlTVnFXRkM1UUM2YTk1VndWUC9F?=
 =?utf-8?B?ZUhYLzVvR1VjY0dGVmNnaU1XazFqTlI5QTdvS0xWNU1IWUhGb0t5Zzh5Tm5Q?=
 =?utf-8?B?c2R4MHJqL1dVWFRodkZCcWh3Y0F3L25RN1pVMit6U3dxS1hqelZDcSsyRGZu?=
 =?utf-8?B?cXlhOW1heEZSSzlxZW8veFdHd2ROQ0o1VHltUkp5UW1rTEUxMHplMUF6Ui9K?=
 =?utf-8?B?RTFoWnl0aUxVSGV3WXJTWFMwNkUwRHN5SGhsSHA5TGNXODBlUTl3Y3psQ1Nr?=
 =?utf-8?B?S3E3WkFBOWVvUFVENVpuYk1jZ1VwZ29qeEUwRCtPdXZTRGRqWnR6dCtxL1lM?=
 =?utf-8?B?VndoZ1N0WEZXbFp0S2lYYkoySlZ3SytRZmZPWjREZmJRaklLQkxiSElUZzFo?=
 =?utf-8?B?WmljVGFycmxHOVM1ZnFWR3dwUkRITExOdk4zVENreGRvV25LMWN1QVh4elNY?=
 =?utf-8?B?V0JQeFh5VHI0ZzgxL3g4ZXdLbUUzekl5YVZsZGtFSTNzK3ZvbldLTXVBdWtj?=
 =?utf-8?B?QXZJYmtFbnpQcWpaSktrTDZ3dWpmNUZtV2M3bElpd25IS1JKUkpQcmdsMHUz?=
 =?utf-8?B?Y2xibW1DbER2WExnSlU0ME5RUzdYWXZpZWo4eTRsTFhrTjE4L2NtN2dDK09P?=
 =?utf-8?B?bTljL0U2OUlFSzFkeGtkU0VabmpRQTBCaVd1RUlxaFR3U2dlRG1vOE9zZllm?=
 =?utf-8?B?WmxoV1hVZk04MzRjTjBHa2tFMGJMSVZSZGhxUTN4OXBCNFZXV0FrY2wwSWg3?=
 =?utf-8?B?ZkI4WWdJMitJV3pBS2h1MGh3TU1GbWhQZ0dkQjYydnBDUkpxZnV2VGJEOXNa?=
 =?utf-8?B?dXFKamx1N1luZm9SWWoxWUt2RisvWW5FS1ZLd0pLMWlBTGIrVXZpMEl2U0pO?=
 =?utf-8?Q?9fyh1fDZR4QplSFdbhGSFkAhfk8jlhjtNrWywC7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEV4dnl1L0p6d3RCaVlTemViUWl5Yk53NERTSmV5cWdhZFcweHg4OWZJZEFC?=
 =?utf-8?B?d0M4K29UR2MxcU82dllZSTlTd2hGKzFEWWFxc1BYbmNSZmhjNzRuUXE1SDFU?=
 =?utf-8?B?S3RFQjh0bnYvT3ZTNjlkaUEyNXpNOXUvWVU3S0FsWW8xTkNFVCs0VHBiT3Bw?=
 =?utf-8?B?ODFvR1liblE5L1lzVDJpTUJLY1p3WWd2UHhyN2krWU5rdEw4Z1ErYU1SMHJu?=
 =?utf-8?B?a2VuWDFoQVIyVElHUnVtOER1Ykk5dG00RTFVZFpsb2RkV3ZwK1JZYThhSmVU?=
 =?utf-8?B?eHhUMGdkeEZIRzZTQ0Vzb0J0SmZDdjhvSmMyS1BuTUdUU3QzYUtaTUk3ZUpW?=
 =?utf-8?B?MWN1WmpNREgxa3pBZUZnVXBiQUdmTjdIVzFLR0RMM0RTU0VUanhDU0dPcnN6?=
 =?utf-8?B?bjI5VE9KeTh1WDdGZjMxb0Zza09zTVZQUnA5SEJYSTJQYnluWDgvb0p4ZHZ5?=
 =?utf-8?B?WW40ZmVkNG12aHhPMXJqaHYyVmJzU2c1azRuWTZQZ0M2Y3UzVlVleTZTMTk2?=
 =?utf-8?B?akJ6UTBhL0NwZ1BGZlNKVWZ2YThDQmlOMmlIRU8xQUxzM3FOb2FiMVNGaEti?=
 =?utf-8?B?WFRqNWUrSE55d1lKbG5XM0dZOWw5ZHhqRU0vT1dKWFVYa1lZS1FwZ2NJb3pl?=
 =?utf-8?B?WjVXbkdtTi8yS1RCbXBQOTNGQ2V5QXFHVkRjUFN1VFNwdW5GcXJobmsxTmpH?=
 =?utf-8?B?TkJDM2NRNmE4b2ZVcTZpYVprbHRBKzNYQXhTaGFxUjh2ZXBSUHFUU2tNdjhk?=
 =?utf-8?B?SFRpTHBNY3EvcUFwekRsK2JqdHloNVkxMmNORDVmc0VNZ1hXZS9ubG9nRnBX?=
 =?utf-8?B?NExTdFFYeUdQSXMxSGpINjdZSFNrUjVvKzJOc2xCaWlDMWZ2WHRRZjc3ZmIx?=
 =?utf-8?B?aWphRGpQZjdBTGJHeC9VVlROaXp1ZlhUbHFub1Z1OVFiUWdNeGtKR1QwRzdr?=
 =?utf-8?B?WDlJU0NTSC8vYUd4UjRZVW1XM1RGd3RTQ0RuQXlRVUY2N2l2YSt5VU03NFAr?=
 =?utf-8?B?WjNwbHJzQnAyUkVnbVJ0d2lhdXZ3VDhkZlNHcnlwakhjS1ZZb3FjMW9OaGJT?=
 =?utf-8?B?cVQyLzJBUlBoVzh2WjJQYm1vTmdDVUxINi85Y21iN0dlWG9NNlNhV05yY1ow?=
 =?utf-8?B?by9KUHZNaWRRTm5yR2FlenhIeVlyRjlqdmtZZ1J6RDF3Z2tlY2FlVUVYRUlF?=
 =?utf-8?B?WW03bndzQW14Z3FqcFRtV3VaNFd1bUs0QUdld0hiZDg1eC9JMnprMkdwVXZ1?=
 =?utf-8?B?Y1hoYUN6OFJMYisvYVYySlZBamNTKzZ1enBTNnZ1bUVtcWgrWTJpN3VqL01N?=
 =?utf-8?B?OWNUZng3bXdxUmpleEt6NnJ1NkFnWHh4dFI1YWhGNU9BeXdYL0lRNnVDTHJK?=
 =?utf-8?B?ZHJ0L1RLWG5BZmExWmtmc3pBNnBtVTR2TVd3Y2hMaklkMUJlQWtyQm9nWXNq?=
 =?utf-8?B?NXdSSVJCTnNJZUh4WHQ5MTRSbnJrM2RXUzRmR0x6L3JyMXIreldUOGVWZG9s?=
 =?utf-8?B?dzFsT0dBVzlwNEhjN0pMVm00STJaeHZmTUFJK255MHFKZTRReVRHQi8xSnMw?=
 =?utf-8?B?UkN4MlAvc3Q3QUdOYzlra2RibXNKOUs4L2JvTllvTHUrV05Vdm9NVWQvQ3E4?=
 =?utf-8?B?a2M3YkswN2JIMHFSbUcwTHh6TjVoRXRNNzFCUk0yZFVvalFnVytqQU5FR1Ay?=
 =?utf-8?B?NE9TbnkrbG9jM1VwNDZiLy9Wd2ZwZC9ZU1NnR1BtUnlGcFlFakNOajNOZ3lv?=
 =?utf-8?B?R3hwZThzdlR1cHFGNTBLMlR1L1ZHa1JybkxjM1htWTAzd0I1WlFjS0tWUldC?=
 =?utf-8?B?cnlKTEE0cW85cGt6Smw4WEh5UlFLZ3hEK3l0NXB6VS90TVBXYlI2NndpaGdQ?=
 =?utf-8?B?WVBWWTZJU3ltaXg4YlV3VG0yeUxHU1RwSUx0MUU1UmhrU3ZlL3V5aTljcVA3?=
 =?utf-8?B?OGgrMTdWalhOWnZBVVphOUtLUGdGeHlXbVVPZzNwR3M4TUloRGRnNkg3Zk1s?=
 =?utf-8?B?eVZJLzBuZnlYRGYvUlJ1aXZKYjRBRUpJQWxmK1YrTmJvazcvVDRWekdaWEt5?=
 =?utf-8?B?NGZyNEtsbDJtZkI4ZS9FdC9RWFArelZsOTZiZm5iR0ZEUWUvMVdMU2pVUXFj?=
 =?utf-8?B?RFNvK3dSbUgwdEcySnNweisyYUNqdUV4K1g4WXpGZ3kwVS9KdThiN2NDcUJx?=
 =?utf-8?Q?XjHWi2jgiJRaNWb1z3qqcRg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba6cf07-99ea-45e3-dd0b-08dc91825bb6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:40:25.1888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgYCI+cjPrtmTVXsDyvy0MafEu2ao+72z0YXG7SqhSEuIwwps4LYPPJQKFSbrGk0+z0D4E49GLpC90L9ewySQCXFZyExF1sbhzk1+jIM3AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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

On Thu, Jun 20, 2024 at 01:00:46PM -0700, Ashutosh Dixit wrote:
>xe_oa_data_reader is used to interpret data recorded by xe_perf_recorder
>and contains common functionality used by xe_perf_reader and applications
>like gpuvis.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/meson.build            |   3 +
> lib/xe/xe_oa_data.h        | 101 ++++++++++
> lib/xe/xe_oa_data_reader.c | 369 +++++++++++++++++++++++++++++++++++++
> lib/xe/xe_oa_data_reader.h |  87 +++++++++
> 4 files changed, 560 insertions(+)
> create mode 100644 lib/xe/xe_oa_data.h
> create mode 100644 lib/xe/xe_oa_data_reader.c
> create mode 100644 lib/xe/xe_oa_data_reader.h
>
>diff --git a/lib/meson.build b/lib/meson.build
>index 02b86a77ff..4d51402163 100644
>--- a/lib/meson.build
>+++ b/lib/meson.build
>@@ -380,6 +380,7 @@ install_headers(
> xe_oa_files = [
>   'igt_list.c',
>   'xe/xe_oa.c',
>+  'xe/xe_oa_data_reader.c',
> ]
>
> xe_oa_hardware = [
>@@ -453,6 +454,8 @@ install_headers(
>   'igt_list.h',
>   'intel_chipset.h',
>   'xe/xe_oa.h',
>+  'xe/xe_oa_data.h',
>+  'xe/xe_oa_data_reader.h',
>   subdir : 'xe-oa'
> )
>
>diff --git a/lib/xe/xe_oa_data.h b/lib/xe/xe_oa_data.h
>new file mode 100644
>index 0000000000..82d9019a9a
>--- /dev/null
>+++ b/lib/xe/xe_oa_data.h
>@@ -0,0 +1,101 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#ifndef XE_OA_DATA_H
>+#define XE_OA_DATA_H
>+
>+#ifdef __cplusplus
>+extern "C" {
>+#endif
>+
>+#include <stdint.h>
>+
>+/* For now this enum is the same as i915 intel_perf_record_type/drm_i915_perf_record_type */
>+enum intel_xe_perf_record_type {
>+	/* An packet/record of OA data */
>+	INTEL_XE_PERF_RECORD_TYPE_SAMPLE = 1,
>+
>+	/* Indicates one or more OA reports were not written by HW */
>+	INTEL_XE_PERF_RECORD_OA_TYPE_REPORT_LOST,
>+
>+	/* An error occurred that resulted in all pending OA reports being lost */
>+	INTEL_XE_PERF_RECORD_OA_TYPE_BUFFER_LOST,
>+
>+	INTEL_XE_PERF_RECORD_TYPE_VERSION,
>+
>+	/* intel_xe_perf_record_device_info */
>+	INTEL_XE_PERF_RECORD_TYPE_DEVICE_INFO,
>+
>+	/* intel_xe_perf_record_device_topology */
>+	INTEL_XE_PERF_RECORD_TYPE_DEVICE_TOPOLOGY,
>+
>+	/* intel_xe_perf_record_timestamp_correlation */
>+	INTEL_XE_PERF_RECORD_TYPE_TIMESTAMP_CORRELATION,
>+
>+	INTEL_XE_PERF_RECORD_MAX /* non-ABI */
>+};
>+
>+/* This structure cannot ever change. */
>+struct intel_xe_perf_record_version {
>+	/* Version of the xe-perf file recording format (effectively
>+	 * versioning this file).
>+	 */
>+	uint32_t version;
>+
>+#define INTEL_XE_PERF_RECORD_VERSION (1)
>+
>+	uint32_t pad;
>+} __attribute__((packed));
>+
>+struct intel_xe_perf_record_device_info {
>+	/* Frequency of the timestamps in the records. */
>+	uint64_t timestamp_frequency;
>+
>+	/* PCI ID */
>+	uint32_t device_id;
>+
>+	/* Stepping */
>+	uint32_t device_revision;
>+
>+	/* GT min/max frequencies */
>+	uint32_t gt_min_frequency;
>+	uint32_t gt_max_frequency;
>+
>+	/* Engine */
>+	uint32_t engine_class;
>+	uint32_t engine_instance;
>+
>+	/* enum intel_xe_oa_format_name */
>+	uint32_t oa_format;
>+
>+	/* Metric set name */
>+	char metric_set_name[256];
>+
>+	/* Configuration identifier */
>+	char metric_set_uuid[40];
>+
>+	uint32_t pad;
>+ } __attribute__((packed));
>+
>+/* Topology as filled by xe_fill_topology_info (variable length, aligned by
>+ * the recorder). */
>+struct intel_xe_perf_record_device_topology {
>+	struct intel_xe_topology_info topology;
>+};
>+
>+/* Timestamp correlation between CPU/GPU. */
>+struct intel_xe_perf_record_timestamp_correlation {
>+	/* In CLOCK_MONOTONIC */
>+	uint64_t cpu_timestamp;
>+
>+	/* Engine timestamp associated with the OA unit */
>+	uint64_t gpu_timestamp;
>+} __attribute__((packed));
>+
>+#ifdef __cplusplus
>+};
>+#endif
>+
>+#endif /* XE_OA_DATA_H */
>diff --git a/lib/xe/xe_oa_data_reader.c b/lib/xe/xe_oa_data_reader.c
>new file mode 100644
>index 0000000000..b463f63c45
>--- /dev/null
>+++ b/lib/xe/xe_oa_data_reader.c
>@@ -0,0 +1,369 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <assert.h>
>+#include <errno.h>
>+#include <stdio.h>
>+#include <stdlib.h>
>+#include <string.h>
>+#include <sys/mman.h>
>+#include <sys/types.h>
>+#include <sys/stat.h>
>+#include <unistd.h>
>+
>+#include <xe_drm.h>
>+
>+#include "intel_chipset.h"
>+#include "xe_oa.h"
>+#include "xe_oa_data_reader.h"
>+
>+#define MAX(a,b) ((a) > (b) ? (a) : (b))
>+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>+
>+static inline bool
>+oa_report_ctx_is_valid(const struct intel_xe_perf_devinfo *devinfo,
>+		       const uint8_t *_report)
>+{
>+	const uint32_t *report = (const uint32_t *) _report;
>+
>+	if (devinfo->graphics_ver < 8)
>+		return false; /* TODO */
>+	if (devinfo->graphics_ver >= 12)
>+		return true; /* Always valid */
>+	if (devinfo->graphics_ver == 8)
>+		return report[0] & (1ul << 25);
>+	if (devinfo->graphics_ver > 8)
>+		return report[0] & (1ul << 16);
>+
>+	return false;
>+}
>+
>+static uint32_t
>+oa_report_ctx_id(struct intel_xe_perf_data_reader *reader, const uint8_t *report)
>+{
>+	if (!oa_report_ctx_is_valid(&reader->devinfo, report))
>+		return 0xffffffff;
>+
>+	if (reader->metric_set->perf_oa_format == XE_OA_FORMAT_PEC64u64)
>+		return ((const uint32_t *) report)[4];
>+	else
>+		return ((const uint32_t *) report)[2];
>+}
>+
>+static void
>+append_record(struct intel_xe_perf_data_reader *reader,
>+	      const struct intel_xe_perf_record_header *header)
>+{
>+	if (reader->n_records >= reader->n_allocated_records) {
>+		reader->n_allocated_records = MAX(100, 2 * reader->n_allocated_records);
>+		reader->records =
>+			(const struct intel_xe_perf_record_header **)
>+			realloc((void *) reader->records,
>+				reader->n_allocated_records *
>+				sizeof(struct intel_xe_perf_record_header *));
>+		assert(reader->records);
>+	}
>+
>+	reader->records[reader->n_records++] = header;
>+}
>+
>+static void
>+append_timestamp_correlation(struct intel_xe_perf_data_reader *reader,
>+			     const struct intel_xe_perf_record_timestamp_correlation *corr)
>+{
>+	if (reader->n_correlations >= reader->n_allocated_correlations) {
>+		reader->n_allocated_correlations = MAX(100, 2 * reader->n_allocated_correlations);
>+		reader->correlations =
>+			(const struct intel_xe_perf_record_timestamp_correlation **)
>+			realloc((void *) reader->correlations,
>+				reader->n_allocated_correlations *
>+				sizeof(*reader->correlations));
>+		assert(reader->correlations);
>+	}
>+
>+	reader->correlations[reader->n_correlations++] = corr;
>+}
>+
>+static struct intel_xe_perf_metric_set *
>+find_metric_set(struct intel_xe_perf *perf, const char *symbol_name)
>+{
>+	struct intel_xe_perf_metric_set *metric_set;
>+
>+	igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
>+		if (!strcmp(symbol_name, metric_set->symbol_name))
>+			return metric_set;
>+	}
>+
>+	return NULL;
>+}
>+
>+static bool
>+parse_data(struct intel_xe_perf_data_reader *reader)
>+{
>+	const struct intel_xe_perf_record_device_info *record_info;
>+	const struct intel_xe_perf_record_device_topology *record_topology;
>+	const uint8_t *end = reader->mmap_data + reader->mmap_size;
>+	const uint8_t *iter = reader->mmap_data;
>+
>+	while (iter < end) {
>+		const struct intel_xe_perf_record_header *header =
>+			(const struct intel_xe_perf_record_header *) iter;
>+
>+		switch (header->type) {
>+		case INTEL_XE_PERF_RECORD_TYPE_SAMPLE:
>+			append_record(reader, header);
>+			break;
>+
>+		case INTEL_XE_PERF_RECORD_OA_TYPE_REPORT_LOST:
>+		case INTEL_XE_PERF_RECORD_OA_TYPE_BUFFER_LOST:
>+			assert(header->size == sizeof(*header));
>+			break;
>+
>+		case INTEL_XE_PERF_RECORD_TYPE_VERSION: {
>+			struct intel_xe_perf_record_version *version =
>+				(struct intel_xe_perf_record_version*) (header + 1);
>+			if (version->version != INTEL_XE_PERF_RECORD_VERSION) {
>+				snprintf(reader->error_msg, sizeof(reader->error_msg),
>+					 "Unsupported recording version (%u, expected %u)",
>+					 version->version, INTEL_XE_PERF_RECORD_VERSION);
>+				return false;
>+			}
>+			break;
>+		}
>+
>+		case INTEL_XE_PERF_RECORD_TYPE_DEVICE_INFO: {
>+			reader->record_info = header + 1;
>+			assert(header->size == (sizeof(struct intel_xe_perf_record_device_info) +
>+						sizeof(*header)));
>+			break;
>+		}
>+
>+		case INTEL_XE_PERF_RECORD_TYPE_DEVICE_TOPOLOGY: {
>+			reader->record_topology = header + 1;
>+			break;
>+		}
>+
>+		case INTEL_XE_PERF_RECORD_TYPE_TIMESTAMP_CORRELATION: {
>+			append_timestamp_correlation(reader,
>+						     (const struct intel_xe_perf_record_timestamp_correlation *) (header + 1));
>+			break;
>+		}
>+		}
>+
>+		iter += header->size;
>+	}
>+
>+	if (!reader->record_info ||
>+	    !reader->record_topology) {
>+		snprintf(reader->error_msg, sizeof(reader->error_msg),
>+			 "Invalid file, missing device or topology info");
>+		return false;
>+	}
>+
>+	record_info = reader->record_info;
>+	record_topology = reader->record_topology;
>+
>+	reader->perf = intel_xe_perf_for_devinfo(record_info->device_id,
>+						 record_info->device_revision,
>+						 record_info->timestamp_frequency,
>+						 record_info->gt_min_frequency,
>+						 record_info->gt_max_frequency,
>+						 &record_topology->topology);
>+	if (!reader->perf) {
>+		snprintf(reader->error_msg, sizeof(reader->error_msg),
>+			 "Recording occured on unsupported device (0x%x)",
>+			 record_info->device_id);
>+		return false;
>+	}
>+
>+	reader->devinfo = reader->perf->devinfo;
>+
>+	reader->metric_set_name = record_info->metric_set_name;
>+	reader->metric_set_uuid = record_info->metric_set_uuid;
>+	reader->metric_set = find_metric_set(reader->perf, record_info->metric_set_name);
>+
>+	return true;
>+}
>+
>+static uint64_t
>+correlate_gpu_timestamp(struct intel_xe_perf_data_reader *reader,
>+			uint64_t gpu_ts)
>+{
>+	/* OA reports only have the lower 32bits of the timestamp
>+	 * register, while our correlation data has the whole 36bits.
>+	 * Try to figure what portion of the correlation data the
>+	 * 32bit timestamp belongs to.
>+	 */
>+	uint64_t mask = reader->perf->devinfo.oa_timestamp_mask;
>+	int corr_idx = -1;
>+
>+	/* On some OA formats, gpu_ts is a 64 bit value and the shift can
>+	 * result in bit[31] being set. This throws off the correlation and the
>+	 * timelines. Apply the mask on gpu_ts as well.
>+	 */
>+	gpu_ts = gpu_ts & mask;
>+
>+	for (uint32_t i = 0; i < reader->n_correlation_chunks; i++) {
>+		if (gpu_ts >= (reader->correlation_chunks[i].gpu_ts_begin & mask) &&
>+		    gpu_ts <= (reader->correlation_chunks[i].gpu_ts_end & mask)) {
>+			corr_idx = reader->correlation_chunks[i].idx;
>+			break;
>+		}
>+	}
>+
>+	/* Not found? Assume prior to the first timestamp correlation.
>+	 */
>+	if (corr_idx < 0) {
>+		return reader->correlations[0]->cpu_timestamp -
>+			((reader->correlations[0]->gpu_timestamp & mask) - gpu_ts) *
>+			(reader->correlations[1]->cpu_timestamp - reader->correlations[0]->cpu_timestamp) /
>+			(reader->correlations[1]->gpu_timestamp - reader->correlations[0]->gpu_timestamp);
>+	}
>+
>+	for (uint32_t i = corr_idx; i < (reader->n_correlations - 1); i++) {
>+		if (gpu_ts >= (reader->correlations[i]->gpu_timestamp & mask) &&
>+		    gpu_ts < (reader->correlations[i + 1]->gpu_timestamp & mask)) {
>+			return reader->correlations[i]->cpu_timestamp +
>+				(gpu_ts - (reader->correlations[i]->gpu_timestamp & mask)) *
>+				(reader->correlations[i + 1]->cpu_timestamp - reader->correlations[i]->cpu_timestamp) /
>+				(reader->correlations[i + 1]->gpu_timestamp - reader->correlations[i]->gpu_timestamp);
>+		}
>+	}
>+
>+	/* This is a bit harsh, but the recording tool should ensure we have
>+	 * sampling points on either side of the bag of OA reports.
>+	 */
>+	assert(0);
>+}
>+
>+static void
>+append_timeline_event(struct intel_xe_perf_data_reader *reader,
>+		      uint64_t ts_start, uint64_t ts_end,
>+		      uint32_t record_start, uint32_t record_end,
>+		      uint32_t hw_id)
>+{
>+	if (reader->n_timelines >= reader->n_allocated_timelines) {
>+		reader->n_allocated_timelines = MAX(100, 2 * reader->n_allocated_timelines);
>+		reader->timelines =
>+			(struct intel_xe_perf_timeline_item *)
>+			realloc((void *) reader->timelines,
>+				reader->n_allocated_timelines *
>+				sizeof(*reader->timelines));
>+		assert(reader->timelines);
>+	}
>+
>+	reader->timelines[reader->n_timelines].ts_start = ts_start;
>+	reader->timelines[reader->n_timelines].ts_end = ts_end;
>+	reader->timelines[reader->n_timelines].cpu_ts_start =
>+		correlate_gpu_timestamp(reader, ts_start);
>+	reader->timelines[reader->n_timelines].cpu_ts_end =
>+		correlate_gpu_timestamp(reader, ts_end);
>+	reader->timelines[reader->n_timelines].record_start = record_start;
>+	reader->timelines[reader->n_timelines].record_end = record_end;
>+	reader->timelines[reader->n_timelines].hw_id = hw_id;
>+	reader->n_timelines++;
>+}
>+
>+static void
>+generate_cpu_events(struct intel_xe_perf_data_reader *reader)
>+{
>+	uint32_t last_header_idx = 0;
>+	const struct intel_xe_perf_record_header *last_header = reader->records[0],
>+		*current_header = reader->records[0];
>+	const uint8_t *start_report, *end_report;
>+	uint32_t last_ctx_id, current_ctx_id;
>+	uint64_t gpu_ts_start, gpu_ts_end;
>+
>+	for (uint32_t i = 1; i < reader->n_records; i++) {
>+		current_header = reader->records[i];
>+
>+		start_report = (const uint8_t *) (last_header + 1);
>+		end_report = (const uint8_t *) (current_header + 1);
>+
>+		last_ctx_id = oa_report_ctx_id(reader, start_report);
>+		current_ctx_id = oa_report_ctx_id(reader, end_report);
>+
>+		gpu_ts_start = intel_xe_perf_read_record_timestamp(reader->perf,
>+								reader->metric_set,
>+								last_header);
>+		gpu_ts_end = intel_xe_perf_read_record_timestamp(reader->perf,
>+							      reader->metric_set,
>+							      current_header);
>+
>+		if (last_ctx_id == current_ctx_id)
>+			continue;
>+
>+		append_timeline_event(reader, gpu_ts_start, gpu_ts_end, last_header_idx, i, last_ctx_id);
>+
>+		last_header = current_header;
>+		last_header_idx = i;
>+	}
>+
>+	if (last_header != current_header)
>+		append_timeline_event(reader, gpu_ts_start, gpu_ts_end, last_header_idx, reader->n_records - 1, last_ctx_id);
>+}
>+
>+static void
>+compute_correlation_chunks(struct intel_xe_perf_data_reader *reader)
>+{
>+	uint64_t mask = ~(0xffffffff);
>+	uint32_t last_idx = 0;
>+	uint64_t last_ts = reader->correlations[last_idx]->gpu_timestamp;
>+
>+	for (uint32_t i = 0; i < reader->n_correlations; i++) {
>+		if (!reader->n_correlation_chunks ||
>+		    (last_ts & mask) != (reader->correlations[i]->gpu_timestamp & mask)) {
>+			assert(reader->n_correlation_chunks < ARRAY_SIZE(reader->correlation_chunks));
>+			reader->correlation_chunks[reader->n_correlation_chunks].gpu_ts_begin = last_ts;
>+			reader->correlation_chunks[reader->n_correlation_chunks].gpu_ts_end = last_ts | ~mask;
>+			reader->correlation_chunks[reader->n_correlation_chunks].idx = last_idx;
>+			last_ts = reader->correlation_chunks[reader->n_correlation_chunks].gpu_ts_end + 1;
>+			last_idx = i;
>+			reader->n_correlation_chunks++;
>+		}
>+	}
>+}
>+
>+bool
>+intel_xe_perf_data_reader_init(struct intel_xe_perf_data_reader *reader,
>+			       int perf_file_fd)
>+{
>+	struct stat st;
>+	if (fstat(perf_file_fd, &st) != 0) {
>+		snprintf(reader->error_msg, sizeof(reader->error_msg),
>+			 "Unable to access file (%s)", strerror(errno));
>+		return false;
>+	}
>+
>+	memset(reader, 0, sizeof(*reader));
>+
>+	reader->mmap_size = st.st_size;
>+	reader->mmap_data = (const uint8_t *) mmap(NULL, st.st_size,
>+						   PROT_READ, MAP_PRIVATE,
>+						   perf_file_fd, 0);
>+	if (reader->mmap_data == MAP_FAILED) {
>+		snprintf(reader->error_msg, sizeof(reader->error_msg),
>+			 "Unable to access file (%s)", strerror(errno));
>+		return false;
>+	}
>+
>+	if (!parse_data(reader))
>+		return false;
>+
>+	compute_correlation_chunks(reader);
>+	generate_cpu_events(reader);
>+
>+	return true;
>+}
>+
>+void
>+intel_xe_perf_data_reader_fini(struct intel_xe_perf_data_reader *reader)
>+{
>+	intel_xe_perf_free(reader->perf);
>+	free(reader->records);
>+	free(reader->timelines);
>+	free(reader->correlations);
>+	munmap((void *)reader->mmap_data, reader->mmap_size);
>+}
>diff --git a/lib/xe/xe_oa_data_reader.h b/lib/xe/xe_oa_data_reader.h
>new file mode 100644
>index 0000000000..dcb734bab8
>--- /dev/null
>+++ b/lib/xe/xe_oa_data_reader.h
>@@ -0,0 +1,87 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#ifndef XE_OA_DATA_READER_H
>+#define XE_OA_DATA_READER_H
>+
>+#ifdef __cplusplus
>+extern "C" {
>+#endif
>+
>+/* Helper to read a xe-perf recording. */
>+
>+#include <stdbool.h>
>+#include <stdint.h>
>+
>+#include "xe_oa_data.h"
>+
>+struct intel_xe_perf_timeline_item {
>+	uint64_t ts_start;
>+	uint64_t ts_end;
>+	uint64_t cpu_ts_start;
>+	uint64_t cpu_ts_end;
>+
>+	/* Offsets into intel_xe_perf_data_reader.records */
>+	uint32_t record_start;
>+	uint32_t record_end;
>+
>+	uint32_t hw_id;
>+
>+	/* User associated data with a given item on the xe perf
>+	 * timeline.
>+	 */
>+	void *user_data;
>+};
>+
>+struct intel_xe_perf_data_reader {
>+	/* Array of pointers into the mmapped xe perf file. */
>+	const struct intel_xe_perf_record_header **records;
>+	uint32_t n_records;
>+	uint32_t n_allocated_records;
>+
>+	/**/
>+	struct intel_xe_perf_timeline_item *timelines;
>+	uint32_t n_timelines;
>+	uint32_t n_allocated_timelines;
>+
>+	/**/
>+	const struct intel_xe_perf_record_timestamp_correlation **correlations;
>+	uint32_t n_correlations;
>+	uint32_t n_allocated_correlations;
>+
>+	struct {
>+		uint64_t gpu_ts_begin;
>+		uint64_t gpu_ts_end;
>+		uint32_t idx;
>+	} correlation_chunks[4];
>+	uint32_t n_correlation_chunks;
>+
>+	const char *metric_set_uuid;
>+	const char *metric_set_name;
>+
>+	struct intel_xe_perf_devinfo devinfo;
>+
>+	struct intel_xe_perf *perf;
>+	struct intel_xe_perf_metric_set *metric_set;
>+
>+	char error_msg[256];
>+
>+	/**/
>+	const void *record_info;
>+	const void *record_topology;
>+
>+	const uint8_t *mmap_data;
>+	size_t mmap_size;
>+};
>+
>+bool intel_xe_perf_data_reader_init(struct intel_xe_perf_data_reader *reader,
>+				    int perf_file_fd);
>+void intel_xe_perf_data_reader_fini(struct intel_xe_perf_data_reader *reader);
>+
>+#ifdef __cplusplus
>+};
>+#endif
>+
>+#endif /* XE_OA_DATA_READER_H */
>-- 
>2.41.0
>
