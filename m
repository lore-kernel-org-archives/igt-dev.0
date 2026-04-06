Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23046E9D83B
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 06:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C8910E023;
	Mon,  6 Apr 2026 06:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFEaORle";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3314210E023
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 06:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775455620; x=1806991620;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Sk90nph37YoGkTDMR7CSiEfECzSEm2VliEzkZ73XbLM=;
 b=NFEaORleWJE44MuGdwB7+ilbwY3nYmiVzbuFmriMmXZlk9NPXmzEt8V3
 C4m4Tk837GqVcke9evM7nA8KTIvPICIkMStprQl05Jar9qpgQq4Aqdf6q
 ZzFc2/7iZxjUmazBW90nr50WdG4aELSdOmPNPu+3BihDDGYB9T8K0sHn6
 LoLrhCn78Oou6zR5XiY+2tzGtcrMv/itxZNoohi47mFaxZo8MJ5mqbOX7
 BX7FJDsbRFwLJyaoTUxDUy7eVyFwj0BfzfU0cowDDv/bHP2HHDi//BsEz
 KlPwg4mipe36zmyDwa4E7dFwy11Jm7JXWq01JRmBDzmtT2Egb88tTHKkS Q==;
X-CSE-ConnectionGUID: O/T+XPUwTxiW4kFx2l1GXA==
X-CSE-MsgGUID: 05tH/qtTR5u3sBaxOv98zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76302459"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76302459"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:07:00 -0700
X-CSE-ConnectionGUID: L9kApjWaT5qzK62qv1taWw==
X-CSE-MsgGUID: V9H1izJbSZqBpQHvCHpQFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="229461782"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:06:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 23:06:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 23:06:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 23:06:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMYUmCKZce3+sAzVoYlsOs9NK1sMuHIPclQYcOPQVcRcTA84AEkpBGf1nHdaBEAKPGWzSe0mwTipPHd118Na8dAFeqvOXtAjbmcj7WBJwvMoqjBkccpYZIAwpY7WI1Kwpt0YVYu3+WSqF3XMcxdUQgJtOk58lhnHiJJgu82NR3XZ4AOLRlw5GTCUiw1yjdT6FxpCr18xyghcgzfGOmVng5WE2D1z87srh0mfFE+129K/Vk+9I8Q0KBnD/Htq+Cqazdx4ioEuFF2BCMvJcC/W54FSlPEYatZ5DdaS6jLYv2JLLPF6AeXN8YEaHfCzTIXERKohgM5QugxquXX4/GIC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGCI8SKQ4O28YsyJ+AwITsSsNjjy5SuWhZ/3ff6FzfM=;
 b=NlhmoLeZQOtXxfFbECeREaJI8+UGbDpXA0oMSFLAsDI/TmTLJgOu232MIMb3pA4C6mBAE2gldW8TJuNk3y1nQ7c375s61kfscXW2J5cBFAE+LkZqbbFXRicXnnIy1eSCeJ/BUYfkxXs8Ob3Gf0oy8r5FXB/ADfFVnS/gC7poC5BwSVUeEKz7GugDj6238LMse53qJVBhhCB+HEME754ezjH9I9ny9CzVgH96XU+B0i4b4VfH5T+wNbKwt15S23DW+iyhkyC59KeKmRjOrGYxk/S6FV9gqCWWoQiF+k2qSgMLTPHYl5RKNE2+EkwuO+uJgcbSMneLs0F650XXNtHwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Mon, 6 Apr
 2026 06:06:50 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9769.017; Mon, 6 Apr 2026
 06:06:50 +0000
Message-ID: <27593910-996f-4de3-9a07-9e224ce63f4d@intel.com>
Date: Mon, 6 Apr 2026 11:36:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/7] tests/intel/kms_joiner: Require boundary mode
 for basic-max-non-joiner
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
 <20260401160627.1338526-7-kunal1.joshi@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260401160627.1338526-7-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0232.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 41538364-c68f-4c1a-a512-08de93a2b15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3SKfiTq9oXaQ/Tip7zHQB07+n02iJeFmZtMVRMnUTU9PCES3En5h+Sq+TODjTt+PLPKOLDcjPYSlM2xlWcFRJXNMx3Wz08SC+iQpKYCT/ygODx08sMoFtqFGcQ9Vbvy5ivuqMWLLZ/Uk4cKRVMoGPmGZUBNMUfJbcbgWIEjs+PBjinCrJcZaVcu/BPqX3+K+mcMXTlOrKigUZd/2CIk6HD+u6w9/Ye6g+k5UGZfGCCSEZHmUJU3oE2Z408E8a3K/srzyUhzgcCAaBY9u9AFd6sqbh5LzQlfE+JtgGYng9tneyoKcPrUwRvO6u6g+xqBYjqcf/ME5F9+Gqo1+xQ4nd/tsQLY54njMWv1N9sxGk8sCGHyBvIsr1fzWLOzKLAJ8VslaeSgYZ/93LVTr5O8UJ+UWQR4eEok6DPsU8dZm6ren50kj6ocfwE7Aj8UvD3+aevHB0eErpgoskTEtaFv7IZhLnL4iiKquQD9Lt6Hr1aSFj/niVd+x3kFzmvprV53oaVvZYdlgAC3mhB1KOu1tMuaKp4Ht6dOkeAPkJp0a0Mjy8+cA/kn9O4HlofC80RFKE/zf0I+SmrQcTJ8WeV/MbAZBN0WO7uBfh0dJEd7ySMlPIyFAZ7cJR2P5kU/K08p+oF3/hQh/a+f6Gm4SdRkjcrc1ydikBHZQhIBhDNdFf2mPQNz0Ls4Xzh/hpQTQAl13kOCYk+XFrZy/79QqH+g+zeTGpET3/7OsGJihylpuwtc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFpGRVMwMDNGRk40MVkrZFA2cG1HQWVsS3FqQUh2NHBDS2ppTE9RYUZ6OVFS?=
 =?utf-8?B?MzlocTZkd0Rlb0tDVDgzcWh1SVdzcFZvSmVEMDZTNEZ3azB2NGVuVWFyU1Z5?=
 =?utf-8?B?NS9GQzMveGEzV2RPQ2hOdWNSSk82WlB6eU04SGVMSDRxeEpxYlZrY2tpVGpl?=
 =?utf-8?B?a1hYUHBQdGdFZU9Xc2lNUmQwcUJEYWFRWU93WHRYcVQzajd1WjJhdWVZSkxk?=
 =?utf-8?B?RFZMRFoySythWlVZczZPUEF0ZEVjRThLbExKQzFwNGhNL1RaUEJvSDI2aE5I?=
 =?utf-8?B?QkZWUmpIYmlyWnhUd1hTUFpTaEd5dnZTSjZ4VThpajg3SnJsQlBidzBXNllC?=
 =?utf-8?B?TGE2YmpUTTIwUk1SQm1ES1l3N3JKVCtSejR6cG1SUldkZVpNL0ZMbzZSaUMx?=
 =?utf-8?B?N1ZWUDY0WFlxYnl5V1hlSlBDWTUxZi9sQmVXeWtHTUtGNmdVT2dmQXdiNUlw?=
 =?utf-8?B?Rlg0MVZVZ0RzTWRETDM1NGJyS2VuUFBjSnEwVlBXM2dBcnBwVHlFTkJsMWVH?=
 =?utf-8?B?b3FKS0M4SkNPbW43SHBnVklZL1FTSmdJRlVsakxmcnl3aTZacnd0UWtqa095?=
 =?utf-8?B?RVFzVnBHcFJvdkFWQ0Fhd1d3SU9GcHV2aUI1N1pkeUExMFVUbXprTDRRbzlx?=
 =?utf-8?B?eHBndnRUaktyYWpnT2ZzR09rUUU4aUliM09KV2l2STUzRlVua3F3L0xFM3Zu?=
 =?utf-8?B?NHpxbndBSnlkSkpjd3REeUpaem9hYlNMRWYrczk4d20zeDZHVmQ1QjlwR1Bt?=
 =?utf-8?B?M1o0bkp5V244dWZYbEdQV25XbW42TmFiUGhETGo2ZXZWaHhMMmxVRUdjbTJ3?=
 =?utf-8?B?UzlmcU9sbnVBaXZGV0ZOZkoxMFpVQWNGWjJ4NWszcUdaK1FSZjVKL0NpZDRQ?=
 =?utf-8?B?WnZDVkk0QmRSUVFYOU56SFJpT2Y0bDd0SUUvZGJKcXhXTGM5RnVrQnpFS2Fh?=
 =?utf-8?B?cTk1bmZjS0JzRlJKeXhOTnhyWk1GTU9jVEgrN2d1ZWtYdVY0YlV0Y3oxak04?=
 =?utf-8?B?VEhKVkgwNzFERDBaMXk0S0tWeUZLbTZCVUtVTG5DN1hZUmJveG8zbjJYNURj?=
 =?utf-8?B?eW5FQXZqNzltbDlONnZjY01sVitkWG1JcktoQk9FNmh3TGE0MTBrL0hvd3Z1?=
 =?utf-8?B?Y01Md21TWXVyVDZMREFueUpCeEFuTVNXZXNmdUJHRmdpMG92L0NGd2VKYkJm?=
 =?utf-8?B?M3BLd0Zjcnk3TFhwVmd0d1lzQmx4blNBMDJ0Ymo4djZUNDEvU0ovQ09aUVNI?=
 =?utf-8?B?UGlSNWJUbFlnNTdPYW52NWNMNndwejBLK09wSEJRczhwSWpEZmFBTTVWY256?=
 =?utf-8?B?VWplY2xaWCtDVHN5ZFJZOXdLMkxvc2FMaWhKMEtTeTZQdjZBNU5rcGN6clp2?=
 =?utf-8?B?alFRTzV2RjhiN3QvNkw5U0lVVmJ2RkI5eUtkenVFdWIyR04vSFRid3c5VnFO?=
 =?utf-8?B?KzFWblV3WkEzbEZkVm9pbVFzdzR4eXJYc0poSWh0VGdHWUhtSFFDR0VEQ0Qr?=
 =?utf-8?B?SUFSckdpODRXOHNuMEg1WjJkVFZsY2NqQXE1NFkzeWYxZW5Pd1pPVjZ5T25B?=
 =?utf-8?B?aEl0Nm9BcjJEb2VoZGptRnZiTXVGQkJybGV2cXFSVlpCMy9sMHRadTdNcU93?=
 =?utf-8?B?djBPU1h5RzBZY29HSndJOGFGZ3J5OHpZNlZHeE9TeEh3eFZscUVlY0lUMGpu?=
 =?utf-8?B?UXg4TlNQVWx3ZUxnY0padUxjYzZRaWdadzNodERXemN3cWdvSitBNXp0ZkhK?=
 =?utf-8?B?KytLUkFyTGkzR0tiZTFFQThjOHVZNk03MnJMTU10SWpGdFVuRHdKazlOQklQ?=
 =?utf-8?B?MUVBeXZTQVBFOXJETXRQQjMvZjhYR3hFdUxSczFxdEMyd0lHZGE5RWJ6N0ZC?=
 =?utf-8?B?RVRNbU5BWU5ONTRxQ3BXQkViSHZSQjJGTjhKcHNaRWNDVGIrTGtrZGlyRS92?=
 =?utf-8?B?ODhVN1hwcXh5ZjkzU0I4VFlma2NnS24rNS9TZXdwdkFzd0tXZjRjb094Y1hv?=
 =?utf-8?B?KytBK3kyc3ZRcWx2ejl0MFJRRHhGbHQvWHZLMVh6R3E0NjFBNHkxSHpmd0Vk?=
 =?utf-8?B?MHRSR3NUaVNTQmJlWnY2Vkt5RnE1U3VKRk1ONlk5c1JvcHYvSXlVQjdwSXU1?=
 =?utf-8?B?YVl1c0x3YmcxaWROcE1Xb3doOVpNd095eVpxYjZjZGZhVFRJVzhyVWdCMTlp?=
 =?utf-8?B?bDNkbFNQL0V3UXd5VGIyNlE5UVA4RnBwZmZodWRFTWdjUU0reGRpN2VuMkdL?=
 =?utf-8?B?d1RWandMSk5nQ0EreHlVZ1lsSXNhM3pMU3JqMnB1NGt3L0ZQV2ROdnJ0Mnls?=
 =?utf-8?B?bFRiZ2lsc1VaMDRaNG1zaVgrZ1FIN1FaU3RSRDRPWXJtS3JFcU1Hdz09?=
X-Exchange-RoutingPolicyChecked: mMY/dS1JJ9soqT/kjchiMB8xIsHCHdi0FgVQfbXXD4phchGhuwOmxvKahInntk5JVKxm5EYDBVbD6phcyUyYsmUxkDQG8b8kMw/MPQWfBhFl2xPKXqbTe8wXmelt2Oa1pmwE3m0ZbP2C1chKuS7WXqtbAhOZMXKOOWOsy5B945RjrXyjDV8hZyldHcHl5ICVildTeWytBu84ojrLvXXZeOe4nNAx9zbdly6sQ6YbMflGXq1w7u7QZf+QcRRXkSWLNSlsfqdiCGKunNoG4TYXJfKoGn2Ny2RW2IbnLtGCQELkGPdHwpZHPwtkxqEeJZCudqS7oyltegw8GRnVazC9Fg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41538364-c68f-4c1a-a512-08de93a2b15f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 06:06:50.6719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGUqxllP8dJhYtWXB9R+i5R3UnMDcKltqHjbAxsrlH6i54DlF3qo7Gsxue91tmWQmwl5c3zQcRqUNgbyP51jNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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

Hi Kunal,

On 4/1/2026 9:36 PM, Kunal Joshi wrote:
> Skip when the returned mode's hdisplay is below the
> platform's single-pipe limit.
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_joiner.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 86226a3ba..765572d98 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -572,6 +572,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
>   static void test_basic_max_non_joiner(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
> +	int max_hdisplay = intel_get_max_pipe_hdisplay(data->drm_fd);
>   	int count;
>   	enum pipe pipe;
>   	igt_output_t **outputs, *output;
> @@ -597,6 +598,9 @@ static void test_basic_max_non_joiner(data_t *data)
>   				igt_require(max_non_joiner_mode_found(data->drm_fd,
>   								      output->config.connector,
>   								      max_dotclock, &mode));
> +				igt_require_f(mode.hdisplay >= max_hdisplay,
> +					      "Max non-joiner mode %dx%d below single-pipe limit %d\n",
> +					      mode.hdisplay, mode.vdisplay, max_hdisplay);

This will break when we've a case where the highest mode returned is 
based on clock and might not always be the mode which has max_hdisplay. 
So we might need to have an independent function to handle this?

Thanks and Regards,
Karthik.B.S
>   				igt_output_override_mode(output, &mode);
>   				igt_info("Appplying mode = %dx%d@%d\n", mode.hdisplay,
>   					 mode.vdisplay, mode.vrefresh);
