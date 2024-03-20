Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D3FC54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 12:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FE510E2E8;
	Wed, 20 Mar 2024 12:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxUZFs4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33CD10F9AE
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 12:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710937759; x=1742473759;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u/ZIYQj7u9Dxe7pp6j5Gchrp5JKG+zzzDBj7gxFFmeU=;
 b=SxUZFs4wuS8piza7+U91i//eODVwxBeEpzc7Vt/rh2jqPioo9AUsVfAm
 Fjfih9Mhh7H0Sf7ClV5uG+UzLHOLYhpaoMOk5ElR3CFwGi+U/Pm5j24Fk
 KMBxqjOiKucVexsQSfnJ4o082x7lJd9nlJgzazW2kMorB7huPtur48CLe
 MhXXJcpuWoDJSbGY3ChrWgg053rMf2umERAxQ627WtzmO/7rBwzJUwTHa
 K8M5qX/hP3Vtj/6qgXLyYk25MnYQuq595Q+3XZEBkyYYaugUA/rMTWqI7
 lvmoy96Wb4hGxPqKRFsk15XbpkL40Jalp7KjhYrBmY06rTA1qqnvXvetj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="9673660"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="9673660"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 05:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18606150"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 05:29:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 05:29:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 05:29:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 05:29:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 05:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpBN/xBsTvCN4AUVFCXgdHoIe13aJRYw/8jmfYPLTqvnnoYuH930VTD1CoEAX0d2VrxX1g5Erd5i+aRyLzeFHHsi94cXjugoslpCQ1x8fNIysYq8I8md314SwVcuVEaRg0Hb1tAzXGVYkIBfxq1Gbb4U/GGmOFRb53Li+8wJC+nqCmAs0SbsCdYU7fvdp7Vgdz//IfjCHq9cMtr8c2tV0GDNbuDnbMYVFi527MJn6PI0ELkxnApIqFKwt1FzcB4TyuRD84P5CrykoGM7I/BOjJnb1QTfCLNfUqqK9eKBeqKkkUSmcBYbO6UB5LWPEYc1R6z9hkxptp/GS2QqNWXvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ieef3FCX3pEvJpHDj2FtSeGVVS7ZFcQbFLlbZHDKAE=;
 b=GXVr2yRCmvRvk553xTaKRSAHkdGNT+uUdJ4le0XyOHci3XCC5LmF6A7rDc2QfrjzYuBT+Q6FbyPWjc3TbHI1CWRqIfpGSKRNglT/cG/YESSUVoQ3OkOZa3iCVTazfQCRL1yP+SFy9UaGJIJgdMIcMvnnauxmwXVXhHJ8jar80zg9fS3/3TYFiO6Ivo+0+f5bYxjYGbg5/9Rd6/09JqruVkzyjH7BOc6y3aoa/KWJwm3QalaE4hkb9mY/Xbn8lPsPuH011TKv1HPxehPvaJ2BKWucCSE+uhbucHwXKj3m6flTIFJrjPyK6NoGVavxFdGlSwVfmhf4ImTQ5/z5J/QNcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8772.namprd11.prod.outlook.com (2603:10b6:408:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 12:29:12 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 12:29:12 +0000
Message-ID: <b22e0e7d-3fd1-423d-9c78-ccabd92e7d19@intel.com>
Date: Wed, 20 Mar 2024 17:59:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/igt_kms: move bigjoiner_mode_found to lib
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240310142721.874315-1-kunal1.joshi@intel.com>
 <20240310142721.874315-2-kunal1.joshi@intel.com>
 <0507ad7b-4f1f-4c66-9109-5d6903f93634@intel.com>
 <6636e3b2-5cc6-421c-99de-3ae4de91d699@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <6636e3b2-5cc6-421c-99de-3ae4de91d699@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::16) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 36732aed-ec14-4a21-0828-08dc48d9591e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xs+EXVoOLylrY6249eM+Xyv31JIpKyxn+FnHqkW8QK5WvwXuVdE78LRE3QoW5KK7jjWIUXAkxXdysB35ljsZLCcqCYtXVHLJoqgjcuYiMXw5mh+ET4MycvLZNnmJz6E6kpcyq3O+PeiLUUg+LMT7buYvOyeH2rz5vMesgs1jsoQ2RJwiSPFLbgprznCXsqqT+Ydo7+yg8YHzujDR8odakWxxZnx6JvLJ9L+Gz+MuJGVhRZZpduhod4dH81zMONUu1dmbTo/8/V/zQIdAyv5tSB5nDUHWDtzaahNbZAvw0fPoqpqmafZktYnqlJ7A14HyAAqdfWizNRSzmvCIEKXJjTKdUFR7OlGd3k+VcRUbEoVhUr3yeLFzGPAOR2hqha6tf3ikj0sSJizrB0QtMSvv/mq8KtRj1CeA6yFsfbwYL6vYx+UyhOWvBy1jZ2kUpszkPql4+BT3LZxcT493JKxIaElbkxnTVqomUfQuNuAa2GeglG5pBl8H/y7eE3R5sBk6AkFOkd99/WBxcsozohZmzWv9zuIm01Ep/xm6z1zxjATmp+I91WDdJFokoaSdSngjJemcVTAWOERAnC31aB8wq5fS/OzpppuyQxIWGzwJLNmrZJvYbODMXSPp8ZM7fa6MyjJmi7BCVlSUTdOMmwOnxU19/oiJ7YuY4qphRMHGfMM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUlNYW9IMnplNkE4UldsQ3JBQWUxV1JnVlA4WFBqS1F6d0V4aHprSWJyOW9j?=
 =?utf-8?B?M1EzaUU2UzlKclV5Y1lXVzdBMG9ZSlpSRGFnbm1uUnppMlFKVWhCZWluVVU3?=
 =?utf-8?B?Y3JEVGZQS1BpUlJLK0NYb1BiakZTSk1KVG5pdmIvUlRERHZYeWpubmRmOEwr?=
 =?utf-8?B?WkJDMExPbTdaa2F3U2Rqb0paWXltMUVacXE2amRzc1R6d1pLM2ZGbWVYbFhX?=
 =?utf-8?B?OG0rUVhHdG05SlNlQTZJY2c5T1pJbE5tRHdNbU9IekU5dGlYTk1IUG9KT0Zi?=
 =?utf-8?B?Q1luVS9DRVFkSkVwYytXM2dMYzZKclNnUm1YVVAvbVdOTUYrMnZIeWVVb2JF?=
 =?utf-8?B?VDFCOTVPMmVva3g3SmtXNCtxMnJueTZNLzgxSllFL2QyU3ZldTBJNjdXNSt3?=
 =?utf-8?B?bVZTT1V1ekdNL3hNKzQ5Vi8wNnZVblFWTi81VS91OEt4eEQzb1hIYXdyK3Ix?=
 =?utf-8?B?RkxpVHoxM2FaZXZURDA4MS9keGtQVThXWm13Mms1SzRLMmJhQXVtekdESlIw?=
 =?utf-8?B?c1p2YlFCWmkrNGNmZ1BNc214ZnowZy9jV1h3elNXRWU1ZUoreGtLU05vUllj?=
 =?utf-8?B?VFpSNzh4aTRONXZOalhjWFByZUcvaEZTeGhCVnVRd2Y0U0N6b0tXUWRJWnQ5?=
 =?utf-8?B?MVRSUkxWdVJmVThidEhQMDIxNXl4eE95dURVcWVDbVlBckRZemQwNmpWRXVl?=
 =?utf-8?B?ZkRXbHlGc2M0R2NSdXh5Uzd3YmJuR1RRcWVWazJrdTRtOUpHQ29XbkJNbWpz?=
 =?utf-8?B?SlVIalB0U2V2VzNzbkdkODhOOGZhWk8wWUFqS2w0bDFPbG45UkVqWUh4cmlL?=
 =?utf-8?B?SkJkVWRmdkRrT0NkSWFsWk9SeTFhU3dOMU1FQlloQzJ2WXpiMi9DcHFIL3pO?=
 =?utf-8?B?b2xzejhOUTJJRnRheXNxSkVUdjFVcC9RTmQ2VGJWOThBWjN0eWJtQWw5bTdE?=
 =?utf-8?B?Ykh3bzVicmhpRnNLTktIbDVWdGZmeXZ1TjI1OWpGMHFnaWlMU0cyUXVKZU1u?=
 =?utf-8?B?M1lpYUl0TnFVM2ZRdHZPT2xleDh2aHNsb3gyNlp4VFlVNWpEZzFMdm1BVW90?=
 =?utf-8?B?MmQwUW5SaFgyRGpGSnpYRXl5eGY5eDJOeGJoaWt4WW5rNTFoSSs4Ukc4LzBh?=
 =?utf-8?B?cWI4dGpSalNHRTBZR0pRUFA5cUdQV2h0UHB2ZVB3S1VIMEVwbDRzNWlRUmJC?=
 =?utf-8?B?SEltTzdqVHBra0JpUEQxLzZBbGd4VDJ5U2ZYQS9kQWtWZFlqNVc1SUdhdjlv?=
 =?utf-8?B?K0FwazROSFI3aDlMK1A2U3pvNnoyclltZi9hUytaM3ovdjhLZ2ZVYURZMy8x?=
 =?utf-8?B?TlNENTZpL3VuU2gvTHVKWWI3bkRtaDhEOXZwOHorMXp6cXBmSTVKUzI0dGJh?=
 =?utf-8?B?dmNVazFQUjJNemIzbWh0YnY2WGM2MWxReFMwR2QwZis0N2ZPcS9XNnNpdHZW?=
 =?utf-8?B?Y09Ld1NBMWJlTldFdXloVXVDc0NWK1VYa21HbGpuZVR3T0FTL3BiVUVLbWNn?=
 =?utf-8?B?dlhvdEpoM2g4V1dpWnpVa0ozOWt6TzdPVTJXVWZCNmJxRm42ckg5YXMvdXZx?=
 =?utf-8?B?dUxXTHRjMWxPS2dPK3ptakIwd1RoaWgxMS9NL0VVeGw1elJiQmczcldJTzhE?=
 =?utf-8?B?a1hvRi80aWlaZHVGbUtKQmVnVExCT1lsa05qUkRmSE13YmdDU2tCQjBIRU4x?=
 =?utf-8?B?bVlTSkZ0Nm1Ib1I5dUFFRldhVmVPZUluaWNNRVZCTXExSkRzUjN1eGxKNmla?=
 =?utf-8?B?WC8vZ2xScEtjSHIzdzRFSkdnV3pjeU1ZRGR3YmlXdnJKbFFKS3ZBUnc1VW5Q?=
 =?utf-8?B?QVl5Qms5Q01QL3dlbUZZMjZsV2N5ZXdPQkpVWHVBQldod242Y2hQQVk1Si9n?=
 =?utf-8?B?YkNrMS9iM2JITkxUNEkzV3JFdFRXeDJHZTRweEJlOGhqeVJKRmZzUEdqV3p3?=
 =?utf-8?B?VS9LdXprVTZnbDIyaGRRM1NjdUs0VGxHajByZ2pxU0pKVEdvaVZtakNwVVhx?=
 =?utf-8?B?NFRobURvUHVXUEZNZGdFZThka2F3aTR5SGdXSFIzeEQycjdScnBmQXJJMTkr?=
 =?utf-8?B?c0swREp0QzJRR0lPZ2Vwc1VNQWZCRmZwTzRxZSt3NUthSzFDV1NOK3B6eWhR?=
 =?utf-8?B?eklWeVFXeUxOUHM2ZTlsaExKeisrTTYrSUtPNWFpOVoxa0hsN1hjV2t4Q1k1?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36732aed-ec14-4a21-0828-08dc48d9591e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 12:29:12.0992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77uFuvDbt5v9ncPlJ+9Btn66ukL2U6JqFIN81OT9TVg3aWpZ0Tv2XC6s+QAxjzX6fd9N0081JZDY8QGTRsSf9CDN/9wZK9+nW/j/SHjCreU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8772
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


On 3/18/2024 11:08 AM, Joshi, Kunal1 wrote:
> Hello Ankit,
>
> On 3/15/2024 9:40 AM, Nautiyal, Ankit K wrote:
>>
>> On 3/10/2024 7:57 PM, Kunal Joshi wrote:
>>> move bigjoiner_mode_found to lib
>>>
>>> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>> ---
>>>   lib/igt_kms.c                | 25 +++++++++++++++++++++++++
>>>   lib/igt_kms.h                |  2 ++
>>>   tests/intel/kms_big_joiner.c | 14 +-------------
>>>   3 files changed, 28 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>> index e18f6fe59..63c8045c7 100644
>>> --- a/lib/igt_kms.c
>>> +++ b/lib/igt_kms.c
>>> @@ -6143,6 +6143,31 @@ bool igt_bigjoiner_possible(drmModeModeInfo 
>>> *mode, int max_dotclock)
>>>           mode->clock > max_dotclock);
>>>   }
>>>   +/**
>>> + * bigjoiner_mode_found:
>>> + * @connector: libdrm connector
>>> + * @sort_method: comparator method
>>> + * @mode: libdrm mode
>>> + *
>>
>> This is incorrect.
>>
>>
>>> + * Bigjoiner will come in to the picture when the
>>> + * resolution > 5K or clock > max-dot-clock.
>>> + *
>>> + * Returns: True if big joiner found in connector modes
>>> + */
>>> +bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>>> +              int max_dotclock)
>>> +{
>>> +    bool found = false;
>>> +
>>> +    igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
>>> +    found = igt_bigjoiner_possible(&connector->modes[0], 
>>> max_dotclock);
>>> +    if (!found) {
>>> +        igt_sort_connector_modes(connector, 
>>> sort_drm_modes_by_clk_dsc);
>>> +        found = igt_bigjoiner_possible(&connector->modes[0], 
>>> max_dotclock);
>>> +    }
>>> +    return found;
>>> +}
>>> +
>>>   /**
>>>    * igt_check_bigjoiner_support:
>>>    * @display: a pointer to an #igt_display_t structure
>>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>>> index b3882808b..bab8487d3 100644
>>> --- a/lib/igt_kms.h
>>> +++ b/lib/igt_kms.h
>>> @@ -1212,6 +1212,8 @@ bool igt_max_bpc_constraint(igt_display_t 
>>> *display, enum pipe pipe,
>>>           igt_output_t *output, int bpc);
>>>   int igt_get_max_dotclock(int fd);
>>>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>>> +bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>>> +              int max_dotclock);
>>>   bool igt_check_bigjoiner_support(igt_display_t *display);
>>>   bool igt_parse_mode_string(const char *mode_string, 
>>> drmModeModeInfo *mode);
>>>   bool intel_pipe_output_combo_valid(igt_display_t *display);
>>> diff --git a/tests/intel/kms_big_joiner.c 
>>> b/tests/intel/kms_big_joiner.c
>>> index aba2adfbe..28678b958 100644
>>> --- a/tests/intel/kms_big_joiner.c
>>> +++ b/tests/intel/kms_big_joiner.c
>>> @@ -199,16 +199,6 @@ static void test_dual_display(data_t *data)
>>>       igt_display_commit2(display, COMMIT_ATOMIC);
>>>   }
>>>   -static bool bigjoiner_mode_found(drmModeConnector *connector,
>>> -                 int (*sort_method)(const void *, const void*),
>>> -                 drmModeModeInfo *mode)
>>> -{
>>> -    igt_sort_connector_modes(connector, sort_method);
>>> -    *mode = connector->modes[0];
>>> -
>>> -    return igt_bigjoiner_possible(mode, max_dotclock);
>>> -}
>>> -
>>>   igt_main
>>>   {
>>>       data_t data;
>>> @@ -235,9 +225,7 @@ igt_main
>>>                * Bigjoiner will come in to the picture when the
>>>                * resolution > 5K or clock > max-dot-clock.
>>>                */
>>> -            found = (bigjoiner_mode_found(connector, 
>>> sort_drm_modes_by_res_dsc, &mode) ||
>>> -                 bigjoiner_mode_found(connector, 
>>> sort_drm_modes_by_clk_dsc, &mode)) ?
>>> -                    true : false;
>>> +            found = bigjoiner_mode_found(data.drm_fd, connector, 
>>> max_dotclock);
>>
>>
>> How does this work? Earlier mode was filled by the 
>> bigjoiner_mode_found().
> Currently it works as we will have the connector modes sorted.
> But as you state for better readability will have a mode parameter.

No, I meant that with only this patch we have a variable mode which we 
are not filling now.

Later we are doing  `memcpy(&data.output[count].mode, &mode, 
sizeof(drmModeModeInfo));`  inside the if (found) block.

I think we need to remove the drmModeModeInfo mode and memcpy line.

Regards,

Ankit


>>
>> Now mode is not getting filled at all.
>>
>> Regards,
>>
>> Ankit
>>
>>>                 if (found) {
>>>                   data.output[count].output_id = output->id;
> Thanks and Regards
> Kunal Joshi
