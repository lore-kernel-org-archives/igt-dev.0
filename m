Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF504CD8CB9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 09:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6245210E83A;
	Wed, 10 Jun 2026 09:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtU1mRYo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FD210E83A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 09:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781083532; x=1812619532;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=8Y464ytsft2LL016hDEUvlpO2fglSAohNLHd/ixRQV8=;
 b=CtU1mRYoVfdH3727AtN1d4Op6enUiqk3yxk+LFahEEY6hKavvL4nXhzd
 WHLqmBlR1NgUCoJrltevwBKyPex25yt0UfFPyvGtongQk+as04Ne1km0/
 7ZL5wIIXmvFYlNd+ZZmo8ru8KdEk1ehuYhCUkZnMMeMlxqlc7gDgiTFa1
 wS9hhZz3GN+JlMhCnBkfzqddih32c7Dw9yVCdC6L2ktB+IOh+hpK0vMYw
 eXUUilyIgl42jwer9tDf6RDxMo+qVpm8Fq2n7lmHKPj22UgWuST53QTPw
 cmRKAT29V0olc9Nz+aWREh/PMArYITbpHshC8IcgI8sJfZ9pUmUt6FPxN g==;
X-CSE-ConnectionGUID: ahXgw05rTb2j52OFcg3HdA==
X-CSE-MsgGUID: Z/J5o0hVS1yt7PxwBIZW7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92978460"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208,217";a="92978460"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:25:31 -0700
X-CSE-ConnectionGUID: 6gBuAOl+QAyB9zshPr3Gng==
X-CSE-MsgGUID: 0zwpvQztQOSlK7WgMK0fKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
 d="scan'208,217";a="245265627"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:25:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 02:25:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 02:25:30 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 02:25:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZlICh3IJdy9s1CUjBGuUCp4ETXYMbVqw0NYIuXKZozbvR7itW0Xl4m2EP7JimRk2uJn8b71se//zMWYRm6dNYRNo3iNantTtu15S0ClWe1TL7GjE70pc476OtVEbfIYoCr+N3uSixtRjog38jj9/++hjShoFRjyUDvSzeH3YvWH0Vz7Ewx945pg7j+0OLZIRQtkUy5xDRVjKj6vtOWbKQOxSPvt/YGtp0wDgRMha2nOYhAQSXu/YzEbzBMfBCQu7ER7MY68RDsSyeyW3u8Rif4yraWL6OhOxniLbR9sWa1V21YBNQAkKgkgsK//LvglEnrnMovIoFJXqq6ll/jT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ki5+X9tR3yolo0wCiL781pqsUPFtA3KpIdwtf+Lig2k=;
 b=VwwpMqB+y0jm7/01en+OvTf+Z6XXPmCQp68qB8feJrfNaquE+64djz5SOjleWP0RYN2xFrejTGucubZPW8EYUEDVHhaFtzjsVXNotoAFJI9NKTZmLEYEb1xKJxCb0h95xafZjkYcQSaNQtp5ReYVUsFo4t33D6SkisU25VXvKFEWGM/VCqmYQSSe1e9ZiR6ATscS9M96WcrQMxOVsPPFvCttOSthFm9McmnRn/PoOr9pXCQoyOKEb+zieCQRzfbpekTkxNBOYXXz9VTUNqxGRI8RqTbJTHyOT3By9MDBh0QFMCxPKdEM1Ku1QBSLx7Wbs01DMBQzOH7A8AeRoP09nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16)
 by MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 09:25:28 +0000
Received: from SJ0PR11MB4926.namprd11.prod.outlook.com
 ([fe80::50b8:e73:5783:b611]) by SJ0PR11MB4926.namprd11.prod.outlook.com
 ([fe80::50b8:e73:5783:b611%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 09:25:28 +0000
Content-Type: multipart/alternative;
 boundary="------------rSXT3plH0rH0YdZtLvy6Bd5H"
Message-ID: <fa546efe-176d-48ce-9ba6-ab8bb46c65e4@intel.com>
Date: Wed, 10 Jun 2026 14:55:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 1/7] tests: s/check_dc_counter/assert_dc_counter
Content-Language: en-GB
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>
References: <20260609034650.2281712-1-jeevan.b@intel.com>
 <20260609034650.2281712-2-jeevan.b@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260609034650.2281712-2-jeevan.b@intel.com>
X-ClientProxiedBy: MA5P287CA0032.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::10) To SJ0PR11MB4926.namprd11.prod.outlook.com
 (2603:10b6:a03:2d7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4926:EE_|MW4PR11MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d750de4-4ba5-4fda-f4e7-08dec6d23559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|3023799007|11063799006|4143699003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: L7gndki3ctfCx0YpFqSaLqqFQ/P0z0DurFkLpOGs8LEw+aXs9MfhyEj69tiJL36MLW2FYbsFkhEEL4Qye0TTH+6p25kh4n1yFPxXMPZvbe2/Z+fGz3MHqBD9TfjVeXzBQ6atyN/wZVno2hyxzj8ukneg0l8rWHRsFCOXnpnEDaN7kHryAwOqLCf3lVUUfqyMsxCJw1ZEF8qb3xH2H2UzYm8UNmJHfB4UawTZYy+aviJ0S/3aJwaVvpN4cuf3tHXtSevteg5rjS0fYzOPKVaLly2XJIe7efJFMROwAOILFtOlToPtqVVVRpbHU3gYYvH213l/1wew6ezwVpzA/Rn2NinpcvuV0MJXKSygTg06tjRyi6FCLQENbkE1NJMeHvSCJZOrl7evr3s3vdE1YIxEAEC7gzZdcVu4sbFCOqqKabLCuntttWg8ElAzKvJcK094OtATLyWVrubOtkOzAJqI5BTDkO6AAOvf1wOpC8mjqzAJKJg4kHIJPYxdoB+15h8zrCJX4SP+mzgUfThVs0bfivh8vZCbujfiGc4Sq8CgJs3GZGBryuTKyDio6cmAMdPjnUI1r+I5fsK/QYbcnyTmqE+awyg7iyvMo96g7y4ppQeEUPCoLsCROAW/wZUJYe8vD0ahhA9aETX3BQE+hcmDcjW2JgKiVrfxA90tTxZI9GPnuwE4coMjCfaJA4p6bO9R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4926.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(3023799007)(11063799006)(4143699003)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUhxL0Q3VWVoMldCQ1AzeTNMa3lGOWhLN0Y5SS9WMmZ6dGpKR3BSdGQzQ1RF?=
 =?utf-8?B?MUVrNFdrU29BQVR3cjFMSVNKZzgxUWdpaS9LMERReUtaYnNMK1hIZWJ2ekJX?=
 =?utf-8?B?NDhhNkNWQ3ZpaXFQUDZObis0MWF5R1k0UDRkUEEwc2psaHJUSUduaVFWVWNs?=
 =?utf-8?B?OE1odTM0Rk1mV2phejA5NndEaDFHSm9RMkpacjdPZmVRNjMxL1c4dFRtV0li?=
 =?utf-8?B?ZmdMR2VOQ1lhUVpsKzZEV01rQ0FnbE9wMnk2REhKUXV3UzNQOGVKQkZMaVli?=
 =?utf-8?B?aHVIemlJcTNxWGVMTkt5Z1BwNGZuZGNwZ0ZyYU1Bb2xaMlVRRjB0Mm9VZHVn?=
 =?utf-8?B?ZUVUQWZJOFUyUWVBaUplSzdJQi9zUWhLQVMwbVliQ1MwOTk3Z3BxcU1BZy90?=
 =?utf-8?B?OWprZ1VoRVBCNC9GL1JxME1MMFJXbVlhKzRoNTk3VWF0djNpTEdFT0U2RmFj?=
 =?utf-8?B?ejErUFRaNzVJZ1FZVnV5bFREUjhvcTA5cW81Kytma3hsa0R3cGpHV1JzWWV1?=
 =?utf-8?B?RG15TnBrSHRucEVDSDdoaGFpSUE1MlAycUhBa09kWHJ4Y2RMTENOQWdvaVhn?=
 =?utf-8?B?RkZ1MkIxT3RmK2ZEV2NvNFkvY1liVjFaVkMyU0szOWtDK0xNVTRra0RVb2lO?=
 =?utf-8?B?cGJ1N3JwUmxySUhBbER3VHJEWEpNRGdTUDZpNk1JelFGMzFmWnFCbjRFbkRF?=
 =?utf-8?B?UVNnM3o5T1B0Szh4SitzSmJUd251b24wOXJJeVBISEkya3hSU2o0WFJKSG9W?=
 =?utf-8?B?NVpBN01adUZNV0dETG9xekNjR05NWG1aZjhvbmp5bDNWSk1yUTN5NDR1RDQ2?=
 =?utf-8?B?ZEZtM0owblNKTjVRWnhFZ1grcFhGdnMvZ2RnU1RGL3NZL3ppWC9yY0dOTU9N?=
 =?utf-8?B?TDZKNTkwQi85R3NuRVFKamh3SE93U3U4OHZ2ZXYvMzNOZ0lPQkYwTi9mQ1lP?=
 =?utf-8?B?SDYwYjJaNGhaZXNRcWJhSUE3SVI1Rkh0bFVxVFNZN2orYnFHbElrZjNoRklw?=
 =?utf-8?B?SVl2VWNqM3hnWjZ3MnRPd2tiU2JBb2dOT1oraEkyMWtST080WjRvQzExd1dO?=
 =?utf-8?B?MGVYZC9HL0lYamF6TmVxMVFpaEI5Q1l6aWZJVm5zakRCZFBHdDBGdFJFcndm?=
 =?utf-8?B?OWYwUElSam9FVnNVN2t0QUluT2VYWU9tMzFtNUgzTUVhMDlaWXpkcjV2S2t3?=
 =?utf-8?B?R3BUQmIveXVlOGtMa3pFSEd4T2xoVndiTzRGYmsyUE5PVjB0R3IzRWtOcGZw?=
 =?utf-8?B?VVdCSDRRUFpRTUhYMG1ReThwTEpteHRheG15NFlVTHZZZk4yTnduUzJEVnpy?=
 =?utf-8?B?VTZHMEVmTVJGMjdSTmRKMUJCNG54cG51QlBOUk5TZjFrZnh4TnFlZk53ZkxY?=
 =?utf-8?B?YmcrUXlzV3ZHZjZYTk8yNEpJN1cwSXVLRmI0bGRGK2hWM0ErVS9XVnU3L09E?=
 =?utf-8?B?YXN6NE83bUV3WmhMWk5NZTVGU00xMUE1RmtJOVdTbXJYREpPVmRsYjY3cEtQ?=
 =?utf-8?B?Y1FUaGZkNjBSaUNDckswdlpVSWZjVmgwaXkzVVU3ellGaEpFN0FZbEE2Y0Jr?=
 =?utf-8?B?WUdTdEFQWUVqcC9SZEh5bU9tVHNIcnBUR3c1bTk0TXdGOGVLb3B4L2o0dTdZ?=
 =?utf-8?B?RndhY29tSFErY0cvVU9aZkZtaDJoaFc2U3lOTTk0TUZBUDk1NlVHYkk0RFlx?=
 =?utf-8?B?cysvT0xGQ2pPRzhBbjZneFk5R21TVFluaDRvRkxzNXZ2YzdoQUZhWUY5T1VO?=
 =?utf-8?B?S213eG13TVZCclVteW92VmtNVnZLYkRmV1FIUXlOdXF5WDJBWUsxM0Ezc1pX?=
 =?utf-8?B?SUpFa0NsdVQ5eHFYbDNoN3hjdCtrN3N0MU9hQ2x3clUxMTJyRXl3dWpsN2JJ?=
 =?utf-8?B?enFkL3BmL0dhN0J0elRJaVVhQkFBVTM2cTV2UmFVTjFETVFjOVNjcHVMMWlR?=
 =?utf-8?B?RFE3N29JamRrZTJpaUluRWlXOUpMZ0xCL21XTWtrelhSWUZRd2RWZUhveWsz?=
 =?utf-8?B?YXZ2OWROY2JEMG1PTHZQNmQ2OElQeTluUkZEMDVldC9tS2c0WDVPcGZ2eTB3?=
 =?utf-8?B?Q1NjZ2F1OFBxU29DYXBwY3VxK3JqUXJxL09zdzdINTVzblBTaTAyei8vSGZG?=
 =?utf-8?B?NHRnYzRyRnlGcmVXZmtqWHE5MXlqL3NIaTIyMGNjYThQL2R1dGM0dUxvbnlS?=
 =?utf-8?B?NHF3ZmFzSlEzYWNveksxQXJaRzlMQWU5ZVhabWRHb0U0UjdsRmxRQW1ySFR6?=
 =?utf-8?B?bVJTcFEydjZkWVF3bk5DWmRwT09BUnRsWHpEWjQ0aVNCVFk2dzVJWDZLYkw1?=
 =?utf-8?B?bW4rQmRVcGJPWG5FNjJzUytwZiszVW1LYkl3djhmYnlPMVE5cU4yaFM5b1Yv?=
 =?utf-8?Q?CD1tZmbiwBFC6b/k=3D?=
X-Exchange-RoutingPolicyChecked: YIx6vu+ErjJ7tAOwY3+MZk5mdziQbmzR3cMwoyh1xh/LCiowWPF4UG/z16M4IoO18ir0KIcKxTu/Y4egAn95D55f9VMAOBQzhAtW8Xxhd4k6zebkIa/3ucdGPXTGfJfMTOMdeUKTnPkQcCWsyYSEKRwsKtq1ts8Vsk1FfQPRu7NaGwEUzbnfUn9UcTBOCi04swKF9xFhNlPRpuYJSQm9yIJP8hrfxJOZeiNghK3H18JPWKfhfC0A+xQ+ZBM1RLOUSKuBXK+sC4S/a0BKe6rLI2FtzFb0z56oGwxa1qi9MxWqwg28TiAMxZ8N0BcAgM6jItw0lxz1OEBeEgFLoDbSxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d750de4-4ba5-4fda-f4e7-08dec6d23559
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4926.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:25:28.5760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaXzQ+AxDBtjsUQabE0mkl3xX+2bwmYgfSctt4DDbCtERT1zuZnFBHsEUMCmmtI5Bq0NmNqe2WTTKw6DwLSEk2sCozaZvlI6ItKwss7O4Q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
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

--------------rSXT3plH0rH0YdZtLvy6Bd5H
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jeevan,

Please update subject line to: tests/intel/kms_pm_dc: 
s/check_dc_counter/assert_dc_counter whing merging.

On 09-06-2026 09:16 am, Jeevan B wrote:
> Rename function name.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> Reviewed-by: Mohammed Thasleem<mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 423a5c4a4..c8cfa300c 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -110,7 +110,7 @@ typedef struct {
>   	bool runtime_suspend_disabled;
>   } data_t;
>   
> -static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
> +static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
>   
>   static void set_output_on_pipe_b(data_t *data)
>   {
> @@ -257,7 +257,7 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
>   	paint_rectangles(data, data->mode, fb_color, fb);
>   }
>   
> -static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
> +static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
>   {
>   	igt_assert_f(igt_dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
>   		     "%s state is not achieved\n%s:\n%s\n", igt_dc_state_name(dc_flag),
> @@ -265,7 +265,7 @@ static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
>   		     PWR_DOMAIN_INFO));
>   }
>   
> -static void check_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
> +static void assert_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
>   {
>   	igt_assert_f(!igt_dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
>   		     "%s state is achieved\n%s:\n%s\n", igt_dc_state_name(dc_flag),
> @@ -346,7 +346,7 @@ static void test_dc5_retention_flops(data_t *data, int dc_flag)
>   	set_output_on_pipe_b(data);
>   	setup_primary(data);
>   	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output));
> -	check_dc_counter(data, dc_flag, dc_counter_before_psr);
> +	assert_dc_counter(data, dc_flag, dc_counter_before_psr);
>   	cleanup_dc_psr(data);
>   }
>   
> @@ -360,7 +360,7 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
>   	setup_primary(data);
>   	igt_require(!psr_disabled_check(data->debugfs_fd));
>   	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output));
> -	check_dc_counter(data, dc_flag, dc_counter_before_psr);
> +	assert_dc_counter(data, dc_flag, dc_counter_before_psr);
>   	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
>   	cleanup_dc_psr(data);
>   }
> @@ -439,7 +439,7 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
>   	setup_dc_dpms(data);
>   	dc_counter = igt_read_dc_counter(data->debugfs_fd, dc_flag);
>   	dpms_off(data);
> -	check_dc_counter(data, dc_flag, dc_counter);
> +	assert_dc_counter(data, dc_flag, dc_counter);
>   	dpms_on(data);
>   	cleanup_dc_dpms(data);
>   }
> @@ -452,7 +452,7 @@ static void test_dc_state_dpms_negative(data_t *data, int dc_flag)
>   	setup_dc_dpms(data);
>   	dc_counter = igt_read_dc_counter(data->debugfs_fd, dc_flag);
>   	dpms_on(data);
> -	check_dc_counter_negative(data, dc_flag, dc_counter);
> +	assert_dc_counter_negative(data, dc_flag, dc_counter);
>   	cleanup_dc_dpms(data);
>   }
>   
--------------rSXT3plH0rH0YdZtLvy6Bd5H
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jeevan,<br>
      <br>
      <span style="color: rgba(0, 0, 0, 0.88); font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Please
        update subject line to: tests/intel/kms_pm_dc:
        s/check_dc_counter/assert_dc_counter whing merging.</span></p>
    <div class="moz-cite-prefix">On 09-06-2026 09:16 am, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260609034650.2281712-2-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">Rename function name.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
Reviewed-by: Mohammed Thasleem <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a>
---
 tests/intel/kms_pm_dc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 423a5c4a4..c8cfa300c 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -110,7 +110,7 @@ typedef struct {
 	bool runtime_suspend_disabled;
 } data_t;
 
-static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
+static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
 static void set_output_on_pipe_b(data_t *data)
 {
@@ -257,7 +257,7 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
 	paint_rectangles(data, data-&gt;mode, fb_color, fb);
 }
 
-static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
+static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
 {
 	igt_assert_f(igt_dc_state_wait_entry(data-&gt;debugfs_fd, dc_flag, prev_dc_count),
 		     &quot;%s state is not achieved\n%s:\n%s\n&quot;, igt_dc_state_name(dc_flag),
@@ -265,7 +265,7 @@ static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
 		     PWR_DOMAIN_INFO));
 }
 
-static void check_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
+static void assert_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
 {
 	igt_assert_f(!igt_dc_state_wait_entry(data-&gt;debugfs_fd, dc_flag, prev_dc_count),
 		     &quot;%s state is achieved\n%s:\n%s\n&quot;, igt_dc_state_name(dc_flag),
@@ -346,7 +346,7 @@ static void test_dc5_retention_flops(data_t *data, int dc_flag)
 	set_output_on_pipe_b(data);
 	setup_primary(data);
 	igt_assert(psr_wait_entry(data-&gt;debugfs_fd, data-&gt;op_psr_mode, data-&gt;output));
-	check_dc_counter(data, dc_flag, dc_counter_before_psr);
+	assert_dc_counter(data, dc_flag, dc_counter_before_psr);
 	cleanup_dc_psr(data);
 }
 
@@ -360,7 +360,7 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
 	setup_primary(data);
 	igt_require(!psr_disabled_check(data-&gt;debugfs_fd));
 	igt_assert(psr_wait_entry(data-&gt;debugfs_fd, data-&gt;op_psr_mode, data-&gt;output));
-	check_dc_counter(data, dc_flag, dc_counter_before_psr);
+	assert_dc_counter(data, dc_flag, dc_counter_before_psr);
 	psr_sink_error_check(data-&gt;debugfs_fd, data-&gt;op_psr_mode, data-&gt;output);
 	cleanup_dc_psr(data);
 }
@@ -439,7 +439,7 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
 	setup_dc_dpms(data);
 	dc_counter = igt_read_dc_counter(data-&gt;debugfs_fd, dc_flag);
 	dpms_off(data);
-	check_dc_counter(data, dc_flag, dc_counter);
+	assert_dc_counter(data, dc_flag, dc_counter);
 	dpms_on(data);
 	cleanup_dc_dpms(data);
 }
@@ -452,7 +452,7 @@ static void test_dc_state_dpms_negative(data_t *data, int dc_flag)
 	setup_dc_dpms(data);
 	dc_counter = igt_read_dc_counter(data-&gt;debugfs_fd, dc_flag);
 	dpms_on(data);
-	check_dc_counter_negative(data, dc_flag, dc_counter);
+	assert_dc_counter_negative(data, dc_flag, dc_counter);
 	cleanup_dc_dpms(data);
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------rSXT3plH0rH0YdZtLvy6Bd5H--
