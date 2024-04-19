Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EE5C04FF6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 11:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BBA10EE40;
	Fri, 19 Apr 2024 11:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4FDD85H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242E010EFD6
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 11:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713526478; x=1745062478;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7hA4D68LO8e/JrE5eD8VflY0GIXC+gF1pds4GEX4OgY=;
 b=E4FDD85HMzsLkyTIzWPMHYcrzMFbZZ+0soKQJ1w/m0mtr17MIm/MFElF
 tl+xXV9cEGlK8hDqfjNKe1lyUVmVXLjZ0ZIyZThzSUyxKzC67K+713OSB
 UZRokwmPy4CHqBfmCEyk9AV6P+Myu6K59orZMsLE7nKUkG9qQhTjodDhG
 SLN7fBJc/QN/jQLU2o8Xq4TJjvLwZWaA7cVpeewDJkPqsfMzb9yVrfLeX
 SVNEDgXWRyIWSWIvenzSyB58bzsqJfahpOodJB7eczKJd/uN9MjAue5ot
 BMKCvuwetZUn5G6Khlob6t+WiCVdacHF6XgAByj47hC/KroXteWpM8iBb w==;
X-CSE-ConnectionGUID: M2mdt4ohSWK/2exELMGjew==
X-CSE-MsgGUID: vjQrqMqpRciUSQHpBpRw4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9664591"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9664591"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 04:34:37 -0700
X-CSE-ConnectionGUID: eZA5OdaWQJWYQ45DaSXh1w==
X-CSE-MsgGUID: Z9LOmsjKQhGHw770AhNIPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="28139346"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 04:34:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 04:34:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 04:34:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 04:34:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 04:34:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxxTo0HbDvOTFb59+zYHpjp5sCfXuwnKPFqcDQhqypTqsl34iOGut90iEEaQESg2x8kFGHsEPEu9fV5tr8a1FE9h9ehjaViO41sweNKZsjxS4I8Yko1RiaS4lcv/grh5iYJ1GFEqCojY/16eaQpZHXGGoai1vIJK4HDfk+ZEoedalNQcDxO3i1hmKg9aHC5z7SnfVCUKt+MPUFDkD+p2FSCs9oxd1StmnmMtkfsRyc+v/XuR3vFCS6Lwwwv0qRYCyKhYLLu4ULrDKjVNK18NSEJJdzHf4jqAbstcnU2RbE02QPm9ruOiTcn/uX9RIj87Zd13mIKKBi7I0G7YsMMtIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvEViq+7ZhRjlhE0/s9Kcee62QfboYZbEXboj8pMcXw=;
 b=h1tmAv0xn+UTWBOg067Z0S8WF4u6HQBEmWlA0FXiUhALaRMHbN4PREBMjcbQ70EFFU2KKK2QGcgYVmubnIHk1IQ4YjbWPhz5eIepw2avzR2iTYBcFs50PVGPwMe9DO0jmEzZB4WP0xFn3nxcDPjxhtqAWBMeZjZQCKPGCijcFUFx14fWjZDR2XBJnTEhM7fscd+7FxmpZdrZR4yT9Y4RbAWqI3b9VMJMso/EIqcR4/pFsEEwdIjX1+aflXSGFPqzL2iThFP+h4q+mg0v9SejDQWxfmgStdq+AVABb+rNCQz8Jgvtn/sfzHcyu004iT5or8n2bAZ+M4VRiqEXaZKhww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by SA3PR11MB7627.namprd11.prod.outlook.com (2603:10b6:806:320::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.14; Fri, 19 Apr
 2024 11:34:34 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7472.027; Fri, 19 Apr 2024
 11:34:34 +0000
Message-ID: <f7506aba-28cd-4e27-bbd0-b62afc081efd@intel.com>
Date: Fri, 19 Apr 2024 17:04:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/7] lib/igt_kms: add support for forcing bigjoiner
 on particular connector
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
 <20240419064001.2401850-5-kunal1.joshi@intel.com>
 <34c9cf2e-ac0c-42bc-8b18-b6ec1728a908@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <34c9cf2e-ac0c-42bc-8b18-b6ec1728a908@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::18) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|SA3PR11MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ebd07e2-4e73-4c2b-fd4a-08dc6064af91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: BLwoYy9NAZ2AOqBafr7jZ+pkLHWWzYOj/EDrhwG9O6mn59WCBxpYxSf/0IaUns1EJ4FN/vto5T2bmfB8BMqCOBcLeLoYIxwnTg7gzg0A5P3ND6TaKs2eACYlcR3CaWfhe0a1FOn0Wnm87UPBv//RQ7U7Bfqn93MVg7OW4vOMwSWFvnO5lecrSI7JNTLfUCJB/+7nFGf/7p2j6Xr+iAQxCa+XfNY3hmOCIPthw+/ZiF0snwbP9cA8KJKGD2XtOqYnSG8xS0HcZYqNQ7rDbPIjXvieH7AiZCMiqDE+y7PhMI0A3mCrabRuEpediRKLmGlgRe2MIAhRDp1tomFconNvWTzzzOCalDiGVTYARgzzR0+C/BZUkWaLh3nbIr9jorTZZBvZm0VYg3mO6Z4TR5ByRy1ZC3L7VqgHzQBnvmM4VhkkHERHaF44Pd0o8fDblnJnUc/iJXdRSJmWuaI55DhZ2DMRftostlDiXNm8wH0f5KHvXqfrdgPUkKg0UIJR4o6maVpD5RPS7o4WNxB/BrKDO/t3WsnD1T6OqNtvqkMPqIU0OHswL0fgTSVuRi4qT2pPAecfaDLm3Hpox8bo7fBxcIN/OqnLWFUHsA4vocnQD8l0wRbQCSeS0zu9pWudyMDsaClP1JA5OIaBD7A4hcssyv298wtPtbOmmmEjs2WM+7k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDVlNjg3SWRrS3dMVWJwdkh1dm9uSExqR1locFBpZXh1UmxNQTk3c3pQd2RP?=
 =?utf-8?B?NVFCVnlaUnV4VTFVOGRFOHg1Wmpmd1lJdzB3Yk9JSVM4Uy8xUmw2YUErK0Np?=
 =?utf-8?B?Nno5MWRta01zVCszVVpTcko5anExUHp0ZFY2MDQ2Ky9aN1JJeUxrbkYybUxV?=
 =?utf-8?B?ekExd3VJVDl5b3IwYzIxRVFYWG5ob2ZKU1JYdXFtcXhGODluUndoVGV2VW03?=
 =?utf-8?B?NE4wK0FsVGVqaHBuSllHMjhyTC82MjBQYmNqLzJ0bjRlRktGOUVzcXp0TUY2?=
 =?utf-8?B?YkVmNng5QXlKZWdhYkxpOXBHVEJVZk1iVkdkOE9ObXBtMjlJbnJ2R3VEb3Nj?=
 =?utf-8?B?bHlxWHVlR2ZHbXAxbjd5YWtOUUJvZUxOVHB5dXRmZHhzZmZ4VWNzdi85WWti?=
 =?utf-8?B?ZlNIL2FxcEdpdHNnd3FSMndwUkU3cW9BWkxzNXk4Ujh0Q0p5cGphRzNZV1dH?=
 =?utf-8?B?d1NXSTJnV3U3NzNJZ0ZNYURlcjcyT1pRc290ZjhmeXgvWWl2TnVaR2I5NHFZ?=
 =?utf-8?B?c0VNYThGWmw2VG1IenFYeCtuTmxpQU9rNDVnekdadUZnU0JPdHpJbDBKeVl6?=
 =?utf-8?B?UjBXbU4zSnpDdExCbHhQTUNTbkhTYitaY2YzNE05Q0hqbmk4bHp5eUU2U21L?=
 =?utf-8?B?TjJkeFRQdG1xRGgwS3lDVGdOU3BlWjE1VDhDTkZ1WnNpelRsb1pHdTFnT2dn?=
 =?utf-8?B?M0pMQVhhYkYyNUMwS0JUcjd6TjNvU2N0SmRVWm5YNTFhYmJNSDJ4eGxFQ2Z6?=
 =?utf-8?B?WDJyWmtiUlNzNVdnbXFzQWpINmc1SFBKcW1QM3FxVzZNWTNPUWtYWGV6R2FG?=
 =?utf-8?B?YTRkb0RmZUh5QnFLcVBvSVFMRHluRFd2UEE3WFREVjVGZDhtZUFQNjRaSWVR?=
 =?utf-8?B?MGhwRThBR1Voc1JkTVZ6eWV3VUpoL3g5WDFqNXZ0dC90U1dqYWhsWVBpY1Bs?=
 =?utf-8?B?T1hXU2paRVVabkwrdEI4dVc0SnptMVZDUmJVQ3JoSG1taGd0MVU2NkNhazc0?=
 =?utf-8?B?b2FWUDMyUUVXR2VRTW5nMUFzUDBqYmM3bEcxSlZKTWpEdHV6b2s5NVFvaTZy?=
 =?utf-8?B?STBoYW1oaGFodjREeDE2SGk4dkRXc0sxUE0rZE5odnh2U05FOEtyNHNGcTJs?=
 =?utf-8?B?Q1E3OFA1Z253a3VsbHN2NHNldGdyZkd0NjlYUWt5Z3grUVYyMEJIbzNPMTVs?=
 =?utf-8?B?TzJDeGYrSGZWZjZ1dmM2Nk9hcXBFR0wwRlJOVnczT2liOU5lbWx2M1RKM2ox?=
 =?utf-8?B?ZU1lV0Qrei9Camhrdyt4QmpocENueVRXMnIrNnlvZjhsVXhpUUVXOENzTmRv?=
 =?utf-8?B?ZFplM3l1MWViN2FSbys5MjRtZ2pKTWJQd1daNmM4bjNnVkR1c3F4QzNxTmpT?=
 =?utf-8?B?a1doMlFLdTNYcDhBSEpIU0xLSzdxczU4M0J0MUl0L21iOUhKZ1lqQXdVTlVV?=
 =?utf-8?B?SDdyK3JPSStHRG9sZmpsUWhXM3ZMSDBEY25MejFia2RXNlZrR2ltUCs0Zlpz?=
 =?utf-8?B?SjI1YzBzMVE0aTc2Vi9DTVBldlpmVGtGK0J3OXpMaEl1VWI5NldMUC9pTjJF?=
 =?utf-8?B?VjU0V1lsUHdxaUYxem91dnNpRm5nWUUwbndPV0kzeVQ4Q3lzeDVZVDBiMWN5?=
 =?utf-8?B?eFNtNGJJVk0xUEJWU0NzWGZMUDdDTTR3UlhpaS9NZ3VjWnkwYzkvTnFlb1JO?=
 =?utf-8?B?TzMrd1RDM3hMbXlnQ2xKOVhvbTNudk9aSzdWa2FVRTZZS1NHZFNiNTZnd29J?=
 =?utf-8?B?bWdVTlN4LzllMmo0ejVjVE1RSkdEVGIvVzk3aXNjUCt2NGFCSFI2dHNGS3JC?=
 =?utf-8?B?R2hKVy9RNmVXZnRYNEl2amVaQWxEOXpPeDVkWWgwb3kzNm0za0RGN1dOTmhN?=
 =?utf-8?B?Vm5DUUQzbGFXMkE2TTNpY1c2cW5ZK21nVWVLWXNKVG1VaFdWbVAwRXZwUTM0?=
 =?utf-8?B?SmwrdXN0R0IyWnl4bjNES2hRYy9VaWEyMU95T2c1STBjL3ZDSElBaWpxZmdD?=
 =?utf-8?B?Uk1HS204WS9tWG9nR2NmaWEzajlKRVNNQitpQ2IwVVBOcVZyT2h3Uyt6Mk8y?=
 =?utf-8?B?a29BWndCZzNrQXJmUzV5N256SlVBUEEydlUrVERkMDBtUVRDNTUvZ1g2VlR2?=
 =?utf-8?B?L2syUzFKazM4Q2dTdlA5ME5YaTNzbHhWbGNGZlFqbVVHaURIRVFPYVhPNzVX?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebd07e2-4e73-4c2b-fd4a-08dc6064af91
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 11:34:34.2187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GL5OmeYXIe+8nLsHvsdk5KKAOf9QiiYF8/6GvGfjPjA45q4xTjjkvNlKsOTlW8IQh7SYxvEA4/bsl6HfLw6Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7627
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

Hello,

On 4/19/2024 3:56 PM, Modem, Bhanuprakash wrote:
>
> On 19-04-2024 12:09 pm, Kunal Joshi wrote:
>> add kmstest_force_connector_bigjoiner function which
>> force bigjoiner on provided connector as well as resets on exit.
>>
>> v2: remove redundant function (Bhanu)
>>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/igt_kms.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_kms.h |  1 +
>>   2 files changed, 70 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 378c97f88..324b0527f 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -1607,6 +1607,32 @@ static bool connector_attr_set_sysfs(int drm_fd,
>>       return true;
>>   }
>>   +static bool connector_attr_set_debugfs(int drm_fd,
>
> How connector_attr_set_debugfs() is different than 
> connector_attr_set_sysfs()?
>
>> +                       drmModeConnector *connector,
>> +                       const char *attr, const char *value,
>> +                       const char *reset_value)
>> +{
>> +    char name[80];
>> +    int idx, dir;
>> +
>> +    snprintf(name, sizeof(name), "%s-%d",
>> + kmstest_connector_type_str(connector->connector_type),
>> +         connector->connector_type_id);
Above differs
>>
>> +
>> +    dir = igt_debugfs_connector_dir(drm_fd, name, O_DIRECTORY);
above differs
>> +    if (dir < 0)
>> +        return false;
>> +
>> +    if (!connector_attr_set(idx, connector, dir,
> --------------------------------^
> Passing uninitialized idx?
Hmm, not sure how could this work still,
Will assign proper value to idx in next revision.


Thanks and Regards
Kunal Joshi

>> +                igt_sysfs_set, attr,
>> +                value, reset_value))
>> +        return false;
>> +
>> +    igt_info("Connector %s/%s is now %s\n", name, attr, value);
>> +
>> +    return true;
>> +}
>> +
>>   static void dump_connector_attrs(void)
>>   {
>>       char name[80];
>> @@ -1690,6 +1716,49 @@ bool kmstest_force_connector(int drm_fd, 
>> drmModeConnector *connector,
>>       return true;
>>   }
>>   +static bool force_connector_bigjoiner(int drm_fd,
>> +                      drmModeConnector *connector,
>> +                      const char *value)
>> +{
>> +    return connector_attr_set_debugfs(drm_fd, connector,
>> +                      "i915_bigjoiner_force_enable",
>> +                      value, "0");
>> +}
>> +
>> +/**
>> + * kmstest_force_connector_bigjoiner:
>> + * @fd: drm file descriptor
>> + * @connector: connector
>> + *
>> + * Enable force bigjoiner state on the specified connector
>> + * and install exit handler for resetting
>> + *
>> + * Returns: True on success
>> + */
>> +bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector 
>> *connector)
>> +{
>> +    const char *value = "1";
>> +    drmModeConnector *temp;
>> +
>> +    if (!is_intel_device(drm_fd))
>> +        return false;
>> +
>> +    if (!force_connector_bigjoiner(drm_fd, connector, value))
>> +        return false;
>> +
>> +    dump_connector_attrs();
>> +    igt_install_exit_handler(reset_connectors_at_exit);
> ---------------------------------^
> This will reset all connectors, Instead of resetting all connectors 
> I'm expecting to reset a particular one. Maybe we can take this as a 
> separate activity.
>
> - Bhanu
>
>> +
>> +    /*
>> +     * To allow callers to always use GetConnectorCurrent we need to 
>> force a
>> +     * redetection here.
>> +     */
>> +    temp = drmModeGetConnector(drm_fd, connector->connector_id);
>> +    drmModeFreeConnector(temp);
>> +
>> +    return true;
>> +}
>> +
>>   /**
>>    * kmstest_force_edid:
>>    * @drm_fd: drm file descriptor
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 6d13e5851..0abf450c1 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -262,6 +262,7 @@ struct edid;
>>     bool kmstest_force_connector(int fd, drmModeConnector *connector,
>>                    enum kmstest_force_connector_state state);
>> +bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector 
>> *connector);
>>   void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
>>               const struct edid *edid);
