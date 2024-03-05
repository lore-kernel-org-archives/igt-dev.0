Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252EAC54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 12:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B300810E199;
	Tue,  5 Mar 2024 12:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUoGBbFm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5283710E467
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 12:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709643038; x=1741179038;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zgcOGPgW7St3Io3EIHKkKq3dws7cKzCfMol/wNmZ4yo=;
 b=DUoGBbFmCx2sS1I6fbJ6Ky5DoV8eibEVhdH58MxLRzn04d6VD+dgw385
 slTDj+f5N4FDVj/WlqMhgMaUrkmig0DcCYlPQOkrVfTiv1FHlwnBakSbA
 pj3IvM3ttkaw1CdlYXm8vQtE5KRZoK+tM8NFliQsvXhALFZ3LkWpS/fRv
 HEuw1+aBELtfnm7wY/NlTbfhR4g1UwlUjdroNq4eq/F15WFtjsjJug35c
 C01MWYjldu63QzOgaWZhXL5g19I9o/kaisXtyIx4vEyedePbc8TwdS+6E
 kYhaIWWwVzlRtHsuUdmKrf2x4yWZwvco6X2oPLtIuplI1L1Q/uCkYVAI/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="8000768"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="8000768"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:50:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9233052"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 04:50:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 04:50:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 04:50:36 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 04:50:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhyN1ijrM9AqCYu1+SKI56YiqeRxOHszSnWCaFjwMHsxuAsf3zxbgYKVLxRTdnTuMxDLIPTegtTljyWpmBRb5TyGNitvyFnoW32nRrqfp7jO36LaQw3aIg3vLWW62BHSdGpKBwz2KLi3/V0yeO3zB6OacXa9FpIn0enBc+2YTdI9g02G6iPAFbp2LdBeU2wV8VgWTKl138NsTyaSOnw05dLKSpkb9nsb6TLE8qtqlGXIrRAl1Q3g7qh1g/1eZ7JGOY6BrGecY0RveM6oQluYFF3Wjt6bU3+aGf9NF3d+gFnLBa3lTNKw3S7WtnYATCwFqM5Fz9roMRqe0AhZdfQjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqO7AUhOzsdHlLODrdJsV7U7TJXHEJ72wEbOFNRNvEQ=;
 b=QSCgNJUyQd4itvN2yxI53IREvQZOVvWrV6lvA4pGu5i9bn8FY89nOk1KZWdX+5ELbGzORPxmqPI3hA8FMPz37Ws+/3RQm3JUB1ezzqD0NTTsfKQYU7qD1o3x5M5xwZHx9hGVxgsE6MpfemSL0PM2DqWYHJScOaNRGHC7wVTVIL+hHIbxbyZl3767OA2JryJOCHhJ1MOGKuzhVBhyAT7JpOINnnUkUY++SVqhgDhNW2FFWD2R7rlj64IBW89bVcWHXn/0aFcDOmmoE1qCSSmgTPlVY4LWDjCtbXQLBxP7EVFTjmJ1Fiuqlh7T/mahCOUAJXmwjW5z12BxoIapZcbjyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by PH7PR11MB7050.namprd11.prod.outlook.com (2603:10b6:510:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 12:50:29 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 12:50:29 +0000
Message-ID: <e9d8e085-145b-4059-a5ac-70c3deff8598@intel.com>
Date: Tue, 5 Mar 2024 18:20:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] lib/igt_kms: add helpers to enable/disable
 force joiner
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karthik B S <karthik.b.s@intel.com>
References: <20240303172216.254535-1-kunal1.joshi@intel.com>
 <20240303172216.254535-3-kunal1.joshi@intel.com>
 <3919e872-a25b-425c-b467-ac340f0999f0@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <3919e872-a25b-425c-b467-ac340f0999f0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::16) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|PH7PR11MB7050:EE_
X-MS-Office365-Filtering-Correlation-Id: b585f322-ac29-4782-42d2-08dc3d12d62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RQZv6UdCarFaPUiL8snuo2WfTUzJgWOBlFuDDUHHrPlgSMTApEwbSyA/v62C4AApQzJYdWMzB1hJ0qgkZ+hgJatFHouYF6tS16IOudmuKVE3uEgGjRUjxivmYU3+r5mhjqYg/gEiOOiG7JO9v1dxipjAmoRRhass9dVNthybKC6UzGQqlE2RH9TtOviiSCBSmt3wFtQIs3d3yYo2Y2Bjse6x4Mo8mY2H+ge2/VHwwFYEJCcF31EWzCaX1XX1ybHxQxV7r0IuEOnZoTmzdJOUecswl8r5LJ/wqu/XaFZlXVl0cKEyOUgHoWi4kcF9e6akULxsRmstjh2Z4plbcYEglQJVziZqnnO2xd2WaE+D6lHnb+6m+eJSzEcKct1/B8wupOgpX5lK4QySPsn261f+Q0Gd8Y7xDOi7IEJ8sQjQ5WRwjF3F0l6dVJ9VV1kFRPnE97UWm6YOWp2+U4DbA10m/+X0P5akqXYTRmjCZOZ6m/4lRrCAt/OiNQQS0Xh1vQwsSOgUjrCEmGxKsedlTac5SMWmzou7nBVHl122p/rjHWBrRd4YrW6Zu6ye0TVZy3GZTxH9YJ2Y6CyRf04H71g4doPY/Bh+S+1ixlY8ZAnP8b3TIx7Mw2/Kc/SmBv3ae0rrN2ZhhIr5bNIa6tssCXfDpjm3F3N3AreI7WSTiy9rFNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aisvMmFKUTNkczk5R0cyb04veG9ZRktyZnFobEUwSVpldWlRV3hFTCs1MGQw?=
 =?utf-8?B?L2ZUSVRNQUNxcWVWMjRDa3hUaWxjYWdndEg2SVZYZldFTm5uYmM4ZTBFL2s0?=
 =?utf-8?B?R0ZobmpaanBFQUFlVFU3U2pPdWcvVmVRQVdrcXJPcUJlRGtGZFVSQmg2UVJh?=
 =?utf-8?B?US9pREdXVnBvdFdORmdjMnpiTUpvb2dIMnZPMXFiT0FRWEN0dEVWeVUzVDVq?=
 =?utf-8?B?RGh0eEJiVVVkMFg0VXBtVFVLaC9xYXNZOXNMV2tHSVRIRk43cFcxaTN0SWZv?=
 =?utf-8?B?ZldxcjlLcC9FZkdJN0E0SHdPN1c2d1Z1WHZ0NzhTWmRlZWNMQ3RScHZLQ3pj?=
 =?utf-8?B?S01jOU1VYUhtK1NTVXE1ZDlZY1oxY2lzN3pnWk1wL3U0ZVhsMFVYckFQVUtK?=
 =?utf-8?B?dm8xR3FLN2Urei9OTmp3NkpRVWFWMzJwZlVmd0N3bzJ3b0p0bzZwVUE1WG01?=
 =?utf-8?B?TVVNVDV1Y3RaWER2UGFDY0pPa3ZGaTlJUTJTME5VcHg3d0Y4MzIwK0ZKczdE?=
 =?utf-8?B?ZFZsdTRLNWtWRXhzL3d0NzdVNmFQSmVHSzNkWVFwVUJqSWxkalJGSjJUTy9s?=
 =?utf-8?B?ck5uU1lRMVQ0c0JzOVgxT1JsS2J3Y2NjM1ZVUEdVcjVLdTFrVVJ0NlRkaVdI?=
 =?utf-8?B?NE8xc3N3cSsvL3ZGNmk1TngrUGttY1FzK25CQ0VhV1JWWTBsUE9KelBERlBD?=
 =?utf-8?B?Z2VSME9yRHhpTndxUWlyT05wdmZSK2JEaENGNE5FazZ4RDFCQThDenUxUExH?=
 =?utf-8?B?a2NuM1RPdVhMU2xKeGdheXA3b1FYVUZGUW10WkJzaUM4QkpZczAzc2YxNGtr?=
 =?utf-8?B?MWNVZDliUDFBT2ZTdVNhSXBUS0h5enNJelpSQ3dPcHRyd0dHNkhpVGNpalVo?=
 =?utf-8?B?cWZIZXQ0WXZsTTdjWFM3V0MxQzZVOEs4bWlwU2t5a1o5eS81MXJFTGFLMzM3?=
 =?utf-8?B?Q3V5QjhVbUNNMnhkSHp1bHlUZUErSEFETC90cTMyMXFLRCs2c3VTemlKNVJI?=
 =?utf-8?B?eFVKNWxvclVVem1LK3g5dUNhTUhoeG5md040di9iNTRyZUtZeURUMUoyc3hp?=
 =?utf-8?B?a2JGNkNnYjloa3ExRWdnUnVaNW5mOHozVFlGWDQvVTRrL3ZodEZoM1IyUHRQ?=
 =?utf-8?B?dU1FQlVLbzBhOVQ3ZldDZTV3ZzhTc0RNdXZxdGt0TjNjdFA5Z1JmcVl2N3p1?=
 =?utf-8?B?ZGNGc3B3a0RJZHU3Skh0UWlJU05VR3N3UFVlUlJ0a0xPMVVDTytualIyUy9T?=
 =?utf-8?B?dVllYnVITFNrM2xHMGQyeWZqMTNuY3NNc0JIYko5UkpvaDZtdTF3YlhsZFJX?=
 =?utf-8?B?ZkROWnVLeFJsZDJLS3IwemN2TjRhaXZPeFhoeGFZNjZaZ05pdHBNcUZrMTQz?=
 =?utf-8?B?Wk8vbnlKTThCUVBXcUI3aERoZGlsZWJ2M25IeVlXOE9Qc1Rudi8xOEcydVQr?=
 =?utf-8?B?eFY1UC9Sd1VYU3JsaXg3SWNNOEVidmpzUnVrL0FVYzdHa0NDUXQyTGRqeDNk?=
 =?utf-8?B?VHFTTlV2bjBtTExKVmFBMnhGbTBDMjRIVjk5eGk1T3RkWnhOR3VWaGo5K2l4?=
 =?utf-8?B?S3Z5NkMvRmhHOFNlMlRZakJMTERTTzNJYVMxTUdsenVDVE1oZ3puVi8xT0F4?=
 =?utf-8?B?ckRXazVHT2NJU1d2WW9XWUJHbjRNbzNiUGVhQWRrUTN5ZVVpUURybXV3Y01U?=
 =?utf-8?B?TlpBWTBpVXp2M0ZzbzhuZW10OTNLTDk5N3ZKZ0Rja3dOZXVIem4wcnlraGMr?=
 =?utf-8?B?UlhOVjVENXlSRkNEbXN3YVhBcURJeEY0Sy9wZjhReVhlQUVtSlIxcC9hd0I3?=
 =?utf-8?B?ajlkQ3RXcFV5bHVoMVBUMXZwMjJ2RlhPbkYrM1ptMzhXZnlqank1SG1LaHk3?=
 =?utf-8?B?ZGt6SlhWYksxQmlPdExqWVZCOGZDbUErZEhEQnZtalovS2Jmc2F4aEdPSWdN?=
 =?utf-8?B?cVkxNnExTThQZTNzRWpPZ3QyS25kS0RlTXBFTXdXM1JuS2RpWURZQmFydXVB?=
 =?utf-8?B?UmhFeFVhMmNzd1cvbE54U0FlcjVaS1NNOFl4SUhWQVJLUGgvdENwTDB0ZFR2?=
 =?utf-8?B?dE1sbTliMGhvelRqeXJmRi9LR0xFeklQcGpXRFNXeUNXa2ZBNU1jRnZOT2I1?=
 =?utf-8?Q?2EbLK7hFl+HvdRzZ3qHync6JH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b585f322-ac29-4782-42d2-08dc3d12d62a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 12:50:29.4963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbzfg2ZU6rcRjLSvIQZ3nbmcBoOSplW3o10O9b3TwF1uEC+tAuO+kAtAJgXl/1lq9g5rY89ScQgrjbylNT5EIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7050
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

Hello Bhanu,

Thanks for taking a look.

On 3/5/2024 5:14 PM, Modem, Bhanuprakash wrote:
> Hi Kunal,
>
> On 03-03-2024 10:52 pm, Kunal Joshi wrote:
>> add helped to enable/disable force joiner and for
>> checking current state enabled/disabled
>>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/igt_kms.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_kms.h |  2 ++
>>   2 files changed, 50 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 89956b9d5..e6952f56a 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6242,6 +6242,54 @@ bool igt_check_bigjoiner_support(igt_display_t 
>> *display)
>>       return true;
>>   }
>>   +/**
>> + * Checks if the force big joiner is enabled for a specific connector.
>> + *
>> + * @param drmfd The file descriptor of the DRM device.
>> + * @param connector_name The name of the connector.
>> + * Returns:
>> + *  1 if the force big joiner is enabled, 0 if disabled, and -1 on 
>> error.
>> + */
>> +int igt_check_force_bigjoiner_status(int drmfd, char *connector_name)
>> +{
>> +    char buf[512];
>> +    int debugfs_fd, ret;
>> +
>> +    debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, 
>> O_RDONLY);
>
> We must guard "debugfs_fd" with igt_assert() or igt_require().
Will address in next revision.
>
>> +    ret = igt_debugfs_simple_read(debugfs_fd, 
>> "i915_bigjoiner_force_enable",
>> +                                  buf, sizeof(buf));
>> +    if (ret < 0) {
>> +        igt_info("Could not read debugfs %s\n",
>> +                 strerror(-ret));
>> +        return -1;
>> +    }
>> +    if (strstr(buf, "Bigjoiner enable: 1"))
>> +        return 1;
>> +    else if (strstr(buf, "Bigjoiner enable: 0"))
>> +        return 0;
>> +    else
>> +        return -1;
>> +}
>> +
>> +/**
>> + * Forces the enable/disable state of big joiner for a specific 
>> connector.
>> + *
>> + * @param drmfd The file descriptor of the DRM device.
>> + * @param connector_name The name of the connector.
>> + * @param enable The desired state of big joiner (true for enable, 
>> false for disable).
>> + * Returns:
>> + *  >=0 on success, otherwise an error code.
>
> IMHO, let's make return value as bool. Return True if write success 
> else False.
Yes we can do like that way too, will address in next revision
>
>> + */
>> +int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool 
>> enable)
>> +{
>> +    int debugfs_fd, ret;
>> +
>> +    debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, 
>> O_DIRECTORY);
> ----------------------------------------------------------------------^
> This could be O_RDWR or O_WRONLY?

No O_RDWR and O_WRONLY are for files not for directories.

>
> - Bhanu
>
>> +    ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", 
>> enable ? "1" : "0", 1);
>> +    close(debugfs_fd);
>> +    return ret;
>> +}
>> +
>>   /**
>>    * igt_parse_mode_string:
>>    * @mode_string: modeline string
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index bab8487d3..b28022db4 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1215,6 +1215,8 @@ bool igt_bigjoiner_possible(drmModeModeInfo 
>> *mode, int max_dotclock);
>>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>>                 int max_dotclock);
>>   bool igt_check_bigjoiner_support(igt_display_t *display);
>> +int igt_check_force_bigjoiner_status(int drmfd, char *connector_name);
>> +int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool 
>> enable);
>>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo 
>> *mode);
>>   bool intel_pipe_output_combo_valid(igt_display_t *display);
>>   bool igt_check_output_is_dp_mst(igt_output_t *output);
Thanks and Regards
Kunal Joshi
