Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D66CC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 14:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F88310F723;
	Wed, 24 Jan 2024 14:35:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2F010F723
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 14:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706106908; x=1737642908;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vbomZHLgCHAKUZ+RtdlcC29oc4D/DMQyC7GSLynCWlA=;
 b=gm7IEDDf8JVh8Nen1s8+FOY2sk5bVlXyiBGw4mJqH6atrA9ybWZp7TCF
 gH2criYnhP5IkQ2Ktan0gRIp3qaSjSoVYMht3A46sv1OUTSX1WLRWLUhl
 lmjh2+YKoFJauAXxRvzbOzQYt3ko3XgWMksDAwwvJEd2HqrGqrr9mI4py
 qEATj/tpQGrVNfq0Yuw7ik+8QWQu6aFMa9hu5ggr+65oMH36x1rAB2EtQ
 lDyjLbuFLu4oT0ATt86Hh7lnx4OE0PNsMxqrkYyTOrhk5ChHceDz2B15+
 O0YHtfEz+ZVV+Gz3lBp+byRK2Uly1wyYz+ITrrgB22mszJ6cxNxlCTb7P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8619153"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8619153"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 06:34:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856711037"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="856711037"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 06:34:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 06:34:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 06:34:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 06:34:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AB8IaznfuLfycZO+SwdIm+HkUeo0rcULAKv0RR9G/9kfguNzqrQHPuTxYzc2Wm3kwjVkWD/w71RjScvJ0hxqVFyLO0EBYTVrv2Y152LgXIZCnEQwPKhsIUEZneOzaNFkj4lQWfG+D+VA/JfnEcu+lp4jPwzwJ8rk6dRS8WmoD+l9OTvZG1lIoSP48EyzcD1LZsXMbG0vJJecqRGEz4eanKRBciYzrJ/mn8MpkdNRpHCAdSukWMUjW5zWy5SYUh2PVWDeIEi46Gs2fsRalQjLLFL4s/YPti3Jin1HoC0dgLF5VG5/tL6HNdmgPKZ4pGe6Ff447KpuHkXhgKmZ0QF3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jrZFYdar4mdWBfW1rE1cop5+Kan1dlGv31dAtpcEfQ=;
 b=CHtvLNvVLmN2299rjnzW7PNiiyLMDjVNkDq9eVSuqluUPCMy8zlfCDjxB3rOe2N6WONRT+vret5KkL1TqMOdfEigZsBPAVHBdHUt8ZEMREX5YCErovjx+HnjiJ1evpR6aWJ4trdDGFphZHNDGszG1byiwVy8lht31Nyd1vEt4tNuLhKi6V3DVazIx3jAszJ1USRiz7YlyILXWCrYS4CMZfgl5cfDAq48HZt9lc9Aj/XmrtvfJsrhWNqhcUZG1AEcedOJOcd2Z3n5feRJu/NVk9ve7atn0b4bWk5zMFuBeO1bfa1/S6wxooVWqTyLl7O9TkM4+WbM8gj3EEtLYSYd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Wed, 24 Jan 2024 14:34:49 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb%3]) with mapi id 15.20.7228.023; Wed, 24 Jan 2024
 14:34:49 +0000
Message-ID: <4e004f9d-eea5-41c5-ba5b-73f541ea9c8d@intel.com>
Date: Wed, 24 Jan 2024 20:04:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_psr: add helper to check of given psr
 mode can be enabled
Content-Language: en-US
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20240124103410.1259607-1-kunal1.joshi@intel.com>
 <20240124103410.1259607-2-kunal1.joshi@intel.com>
 <63ff29e1-66a3-4f30-be54-476f345a1aee@intel.com>
 <CY8PR11MB68892CCAC82F1B40750C22C2DA7B2@CY8PR11MB6889.namprd11.prod.outlook.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <CY8PR11MB68892CCAC82F1B40750C22C2DA7B2@CY8PR11MB6889.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::18) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DS0PR11MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8d22e1-a30c-447d-5140-08dc1ce99e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fVQO9OcQb6tAwYPdoP4DpWXvXB4FD1qt6oZqdbB5In1Xk5WLmngSjPPqNLC7qUKe8n1WlOXNmwc+Ncc5uVWksowiWkaMz/XTtwYcvijHYv3AHhie1DmJP3vouv81AupkWsoXzs/7cg2ubsEgmk4TKYp3v4PUYAEJHsXIx4eMdO3pmm6S4b593rVpZ/Z0VLpXn3E7gi46BMaSHbdHr5n898kCy/we9lLZZML1nAYn0Uj5uUtRpU0Yy5FrhEnnIZ5qN5HlOlc0byFEcHJD979Tpfo+vT+3Syy0ga0bru6Lr4XTim2sm9H1QIdXyz4GwThoQu61Z4s9W0E1e77+6nkrIm8FgBHKVr7gd2ngPGF3304Z9oKK61+qo0N87o3P1pmAREmBtQtpa6K5T75TI4tzgyCdsBzS0+TxTkr4bou5VxCA3tMeWU1du62albl79dxHPD2uLObjQSfgx3CouUjET/wnDTbma8gtnTIw8Z4gedxyxhCqLJ6GqhU0RyNI8XSeoouyElSTCxtD6QSC17sT2BXeSJ3rMKeVeK+vede/rf6PqjU42eKij9IMcsilHC4uHgk2FUXmv+yoAefwZGvJCmfooUuJI91naT6WcN6y//AkHvEMK6XUJoUdRCCGRGw9Ajrha9n0+ZDN/RI5i8oneg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(2906002)(86362001)(31696002)(82960400001)(6512007)(6506007)(53546011)(2616005)(316002)(107886003)(110136005)(66476007)(66556008)(66946007)(478600001)(6486002)(41300700001)(36756003)(6666004)(31686004)(8936002)(5660300002)(8676002)(26005)(83380400001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnZYekJLOC8vTEFsVUZnOGVMMmhNa25jaldnZUhpdTlqS0poV29GYnR3dzg4?=
 =?utf-8?B?MTZHTVVoV2VTTEduOFRwT3JaWFU3RWRQVkFrK1I4TzBmMmlKL05pbTRVNGNW?=
 =?utf-8?B?UzFYYlBnZG0vaHQzbkN5clRiN2F6UFRPaFh0Zlhja0h1Y0krcWpMWmtIVnJN?=
 =?utf-8?B?YklVRWZwUzV5RWlxcHZEUWI0N3dxU3Z1V0xpSHpHNUxKYjRmd0xrWnNOdzhJ?=
 =?utf-8?B?Y1JLM2UyOHBtMXNqYmpkeWJQSkhuaWp6VE9jL3QyaGRldGNIT1N3cm05U0JT?=
 =?utf-8?B?Mk1XdUs2RU5MMmpSSUJtWjJtbzUyU01ISmtmVHkybktXTGRsTDZRclhuUVFm?=
 =?utf-8?B?d3JMU2hrQ242K2tRRERaTlNRcVlPcGpzY3B1U2NWc0FpRTdxRWtTMTNJNEwy?=
 =?utf-8?B?MzBJQjBOQ1BXLzg2SzZYV291MGxobG9sSTF2eTdEYWZxKzhjNm1DRFFhaE1y?=
 =?utf-8?B?a0xyTGpzVS9USEpFSEFhSi9UNURKNnlwc0c0S29IYTJVRVFPeWFocjB0SCtO?=
 =?utf-8?B?ZmoxSndLbzFzTjdWa2xJRVJRak5rQWdOdjd3ekJjZjJuMUQyK2RodWtjMEYr?=
 =?utf-8?B?ZU1pdWdGQ0JieU1yaHgzSTR0UEhhWjdOVGltdGdRWXBkZTVLOTdlejBvdFA2?=
 =?utf-8?B?ZHF1WGtBZm9OTllxYnRQam9nL3JMRWt1cCtNcDB3d1hLOFRvbXVNY2hLY2ll?=
 =?utf-8?B?c1ZtSTBidmVlY3M1c29aSjVLaGFuNmttWUZYREFOMDNpRktxUDhXYUxQM0Jk?=
 =?utf-8?B?QzcvN1UyZ201R01DL0Fxd2toemkyOTZqZ1VSYTlZZmEzMkhjQWt2eVB5Nk55?=
 =?utf-8?B?Z2J0ODI1RzlFNThudzVjMHd2QzVGd3c1N3NnR21RbFhtZnQzbTdwb09HeHpC?=
 =?utf-8?B?V2xNSWE0bzNSQUp3M2wxTHZmeFhQR1FHMk9XZHBGRnJtVW9MaXQ0YlJrenNG?=
 =?utf-8?B?R2liNU13ZHV4dFlTanB2d0l1S0Y3NzJVS1FQZWVHcWpqREpEOXdTWkRwOFZl?=
 =?utf-8?B?WjVZUk1TczBCS3FCenRmUTZhT1JGQ1d1T2ZLN1dhMkxsT1NFaEdIMFJLbG01?=
 =?utf-8?B?MVlHeDhNQ1B3Z2pRS3o2eEJxL2lsMjZDQ0hmQkN2RUl0SCszNFZkczRkdndv?=
 =?utf-8?B?UXo1cHZnTzFDKzFUcmphemhOaTZ1dlRsdlllYWlnZkhYV1lrUHN5TDF0WFZj?=
 =?utf-8?B?eGdzUWRjQ3dSbEFEQnlBZ3FXaEYzOTBGNml4YVVRRkVPWVEzMGRYS2xiVW9y?=
 =?utf-8?B?cmF6UkRyK0lmeEh2YWFmbWpYbUJqeXQ0b2V6WmRoTW50eWdMb3dlYTdXVjNw?=
 =?utf-8?B?WGZwRGpZbzZhRlh2MUZnbGhWaE5EVDE1eU9qRVBBc2ErRFZHWFVYVHlhUExi?=
 =?utf-8?B?ZTNQMTJRZjg1dUlSeFY1b3Q1bzh6UVZ3c242WHR4RXI1RVdNcm1kRjRSZ25G?=
 =?utf-8?B?bERNZVFwbzJTelpiSlJncmtXTjBXMWREYm1pNTVBTzRZSFVjNGJqQW50MTlH?=
 =?utf-8?B?bk5peFpRQmtnK3QxZHNLUFFLWjRXU2s2RXNnZzdwa2ljZU5SVFhhWDM1R2Zx?=
 =?utf-8?B?YVk5MDRZY2pxUEkvQk8xMEhtYnV3RTVOeFBxNUp6ekh5VWVuOXp3TFY4ZHhK?=
 =?utf-8?B?MmFSL3Aza05qMFpjcEtDQXlObEtGSURmOUxNRTRKZmxKOEtPR0hjcElHNHBZ?=
 =?utf-8?B?MlhUV0h0NHhyQVlWbkRoQ2xCUlVPVSt0dWlvSk5ZbkVZaFh0dzdpOHNZR3Nl?=
 =?utf-8?B?MjBBOGg5VkxEZm9ZTHEySXN2TmkzMHZpTUJhQ0JXZ2FHTVZGbysxeWNwYkhw?=
 =?utf-8?B?NHB5QVZ0ZmlDWllGOW9yeVVNMU9mYXFBbWNTcGlZdW9hM1Rkc2JkSzA2ekZq?=
 =?utf-8?B?OXlSckRvMmRzamlBbHo4bUJZV1ZYN1BkWTVtY0cwT1U3U2x0YkJyL05zdy9W?=
 =?utf-8?B?Z3gxWEd3cnZTQ3dyZDZYMCtxVUh6NHZFcjhWZTk4OHNFNHAyMTNUYnVXRVhi?=
 =?utf-8?B?RVBXODk3R3grM0xOd1Y2VXRkS1NCNDI1eEN1OVcwK1RpWDE3SFNSOVZFZ0dY?=
 =?utf-8?B?L2FXQmcwT1VKTjdEeTZJL1NEWFRwTk03Sno2M1hmUWJ2Y0R5amYrRFlwekV3?=
 =?utf-8?B?WDVCU3crOGh5T0JEKzZ4aGxpTGEwb2ZXMzdxejJFanUzN2s0d1VHT2lubVlq?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8d22e1-a30c-447d-5140-08dc1ce99e62
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 14:34:49.0893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuh+tzwtIYVKJHd5SqSRsN8YIql63wDKXyVmp8rb2FQbA1CoCOGrBN6p3YCV9Y4KDqZ6onSqKNc8pZ4JvzzaM8b04Faqak4JFuLOhe7pnwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7405
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

On 24-01-2024 05:36 pm, Joshi, Kunal1 wrote:
> Hell bhanu
> 
> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Wednesday, January 24, 2024 5:28 PM
> To: Joshi, Kunal1 <kunal1.joshi@intel.com>; igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>
> Subject: Re: [PATCH i-g-t 1/2] lib/igt_psr: add helper to check of given psr mode can be enabled
> 
> Hi Kunal,
> 
> On 24-01-2024 04:04 pm, Kunal Joshi wrote:
>> Check if given psr mode can be enabled by reading enable_psr modparam
>>
>> Cc: Jeevan B <jeevan.b@intel.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> Reviewed-by: Jeevan B <jeevan.b@intel.com>
>> ---
>>    lib/igt_psr.c | 20 ++++++++++++++++++++
>>    lib/igt_psr.h |  1 +
>>    2 files changed, 21 insertions(+)
>>
>> diff --git a/lib/igt_psr.c b/lib/igt_psr.c index 663bac163..ac214fcfc
>> 100644
>> --- a/lib/igt_psr.c
>> +++ b/lib/igt_psr.c
>> @@ -394,3 +394,23 @@ enum psr_mode psr_get_mode(int debugfs_fd)
>>    
>>    	return PSR_DISABLED;
>>    }
>> +
>> +/**
>> + * is_psr_enable_possible
>> + * Check if given psr mode can be enabled by reading enable_psr
>> + * modparam
>> + *
>> + * Returns:
>> + * True if given psr mode can be enabled, false otherwise.
>> + */
>> +bool is_psr_enable_possible(int drm_fd, enum psr_mode mode) {
>> +	char *param_value;
>> +	int enable_psr;
>> +
>> +	param_value = __igt_params_get(drm_fd, "enable_psr");
>> +	igt_assert_f(param_value, "Could not read enable_psr modparam\n");
> 
> IMHO, Please don't assert here. Instead, allow the user to decide if modparam "enable_psr" is not available.
> 
> - Bhanu
> 
> I think it's fine to assert since we expect enable_psr to be present,
> since the caller may not handle this, one less thing to worry 😊

I am just thinking about the scenario, where the panel is capable of PSR 
but failed to read "enable_psr".

As enable_psr is already present, I guess, we are OK with this change.

Acked-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> 
> I can see this is done similarly at many place
> example :- intel_pipe_output_combo_valid

Then we must review & fix them if required :-)

- Bhanu

> 
>> +	enable_psr = atoi(param_value);
>> +	free(param_value);
>> +	return enable_psr > mode;
>> +}
>> diff --git a/lib/igt_psr.h b/lib/igt_psr.h index 36711c0d4..82a4e8c5e
>> 100644
>> --- a/lib/igt_psr.h
>> +++ b/lib/igt_psr.h
>> @@ -61,5 +61,6 @@ bool i915_psr2_selective_fetch_check(int drm_fd);
>>    
>>    bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
>>    void i915_psr2_sel_fetch_restore(int drm_fd);
>> +bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
>>    
>>    #endif[
> Thanks and Regards
> [Kunal Joshi]
