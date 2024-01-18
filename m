Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37CBC4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 08:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D1910E71F;
	Thu, 18 Jan 2024 08:50:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BE610E6EA
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 08:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705567853; x=1737103853;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=p6GDERu3h6absbwmwVnzcFqM7BdaP1p7ddPSgvbqA1g=;
 b=LS5NxR/f1BHakJDc3fTbS40WHlorJ+/NimxyoALJh93tbErMZJDtqGQF
 glpgzF1huRicPJl14xxoN3mpuHLWniDQZGMhdT/LX7vU/yTlgkmjVWy1v
 WT6+DcM5gADzAmgdxujc8NSAy3d/+OMeTeO6D0RoccK8yGGQzOIghra90
 fz5lJZFQnS71Ghbs0vVHft5+5HfWBX/jql4SSFBWjRzCevVwNE2vUk7Mr
 Z8OsHn8t7F942RGW2v9k+mu7ieEJAEoAH1TM8V3T1/EwGlwqlb7SMvE3p
 Vs5aBwMFQtGw21BVDR94weOL1zg4SpWPNd9rTZDWOL9fI5tOH9e/Kgskw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7764376"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7764376"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 00:50:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="306964"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 00:50:52 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 00:50:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 00:50:51 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 00:50:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X34mNvsJFzQg4yLcbOc7kJYPBsm6jDbg+Ru5RttUIext9Ow0k9AqqAUNiWmv0pN7UmbEdlhg6M9nmbKSnKbWPYFYZ+3SeOwLlZJ15KbRdWrrEQutoG5iriR8+b6pjI/a1eWK9Q2gzyrruowZh1JX+/YmbdWK6/ce+4pjznbzBtNv5EhAU7QLPE38YPa89G4PB95BdJbclnfdrFUSkWgCAAQYhOWk7O7KAhNV3YMiQ7PWv6Fo7wT43+xla29fFYV5DcTzD7jftSKZgVqpfBLuOx0OPFXhoMCJGk+Qs5xVvbCLWMmsqq4LXXoPCk+FqFNs2qDurWQVdM1uEg5/YmBUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYQAQ+iltPktblrO8Dqj8vxp/0Bu6wqN2SYOqjwIZNo=;
 b=kY8+2hd1gnAuaD5YCJcOLrfQ7NMzCM7RM9VzgWcmwxHwgio8Bn9nKiBaIRuG6lFaEcg490E50R2d9rftX5xOTSfAif1g7/B2AEVUEqibdVVnL5yanpsz4jrFXJLYLa+K8VRZ7oEDZDC2mazf7pelj2L6/WY7ZOgeV0Y0pkJU8JhlxFs6q418g2AJ2NfpoffnsRH+a/pE7ZgUE2luOC2xNrnlmOWQQV+J7VrYSfvOV0j3AZwBzo+z1QcWAb2ijKU0eKFQpEM+x0Y/1Rxx+O063t9oXhxD6sYNYC5GCbJEWFZVguPG9t2ut+laBBd9MG1DWH+Jsor29gD6e6/epFSu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.23; Thu, 18 Jan 2024 08:50:43 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::7b54:ba1:d53e:7d2d]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::7b54:ba1:d53e:7d2d%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 08:50:43 +0000
Message-ID: <39d2afc2-a308-49e8-854d-5e1c95ca2335@intel.com>
Date: Thu, 18 Jan 2024 14:20:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/igt_kms: add helpers for big joiner debugfs
To: "Sharma, Swati2" <swati2.sharma@intel.com>, Kunal Joshi
 <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240110113906.523857-1-kunal1.joshi@intel.com>
 <20240110113906.523857-2-kunal1.joshi@intel.com>
 <2012b655-b96d-4782-9d69-92666bb57060@intel.com>
 <45f19834-694b-4f26-86d7-4db563a0b935@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <45f19834-694b-4f26-86d7-4db563a0b935@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::34) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d98a51f-40b3-46ab-d4f5-08dc18028df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Fe0/WX9JHIaRML4+iVFD4/QMHt6Lr9bnf+uHUYvXGwqYW0B1kY1RAyEtoj1MdoJ435L0FxduZSK0ig+dYZlfy75s7dc7JI1YJvM/FFqAD+xnofIowmHX+4onYSl/Gw3twCUq2+dJ3YWH/6uV8X7ns4WBb4F3VTtHEHlbt5va6ErhcVUNqc2I6WIMPvN9YsvXbtj7AX1TKINUnr5P8tmWG70QJqmqvUcE62zYCYd0vFKhnTXYg2chxhzGa/nXXupRqwc6Q/n0WkrLDsQif94b7Q/Dw9rjExxIh/tIgr6SNyoP+o9+YkNwm2bJm3jbIIvFUiAfsFbQZ69DiNLfxKa/5QDWEfFyJJt1fJZXK69LeAESsvF9rT2Vs+VzG1QDIlKPGYrryGFlgBADHnUdNwr74tA/HtQ1MEKRtqnmdTgB5Sxk1OVjwBFDkDlkC/Cj7OMNbO3dM1U5AnvuwJA/AKezU8x8ECLDNr8sxOJ67C5wMvxQjd0meFpbVjUqFEOqTMYatQcKJa+I2HITZIaizAaDWyJEP/IoW7T9FTaPxfPuc6XTeWUDh5x9ZXjhnim9Dd+AX/4g5wOitu7uXWCSbH+IH5SdJzPfjOzfbfuVcEphEKvoKrNwg6DJh/90mV+JDXj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(396003)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(26005)(36756003)(86362001)(82960400001)(41300700001)(38100700002)(31696002)(110136005)(6486002)(66946007)(316002)(66556008)(2906002)(66476007)(966005)(2616005)(478600001)(8936002)(6666004)(8676002)(83380400001)(5660300002)(53546011)(6512007)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmtYYXlUeUpqV1UwcEt4SU9DZVVtRWlKbm1WZUlFeGxMYlUyaVFXdVZjVktB?=
 =?utf-8?B?Z3BONDhycTk4UVpMOTNBYjZZaS9sc1JLL21qUS9pOHB4L2l3dThycmhaUDlW?=
 =?utf-8?B?S21FdmlWUHlic0lxZXFScnNoeVFhbFRLeGJnR2xwdVlJdmsybTZzTUZ3Ump1?=
 =?utf-8?B?RFErcE5pdlh1U2gvRlkrbmpYbU1xclJ5TjJYVmx3YXI4bE1VNkdBMEpoR3Bl?=
 =?utf-8?B?L2QrMzZKd2o1ajY5eWZBRWRwTS9qbGU4MnJKNHJ4dXp1VEVTWS9pVWZIMWZF?=
 =?utf-8?B?TlFWZzRzRkpLY2ZrVU84Tkd5VzA5TWtKbC9WYUNYbTJQSG0waXFYWXFPNC9H?=
 =?utf-8?B?ZXJMdjJmWERDYWdwNnhLV1o5ZUs4VGNCTXVNT3lOemFBVmdwQU14QmNtVnNq?=
 =?utf-8?B?dmkvTzZlaUVTQ052YzhLblo2K3JnUUxnc0hkK2dFeVFxZnlIaGFlWW1FZHJ0?=
 =?utf-8?B?V1g2NzBFRTZwTjRpL0NzYlM2aS90bGREUDVlTEhjYkErak12c1h1YytpOEcx?=
 =?utf-8?B?NmlFcEFRRlJrbGNxbjRFbjk3cFpWbGhoMmVaK0ZLL1NmaE16eDVERTFqT2dQ?=
 =?utf-8?B?bnZORGk0MThZbFJ5SGVRVGxsTlFBL3J2WXNXRmFMemNvL1Y5Smo5WWhJWWMz?=
 =?utf-8?B?ZkR4Rk1GS2ozdVJpWWhhSjZNQXlOcUNKNWhLL21NMk5FT2RibWVTVldyNzc5?=
 =?utf-8?B?Q0gzejZJOVFGM0RDTmdsREJERHVONWxScVpHUytEbnh1ZVpzb0VDc1hmNVIx?=
 =?utf-8?B?VU9vR3NlcmpRamd5Y05uTk1BczYxZ1hzaXhmRVMxTW9vMGZ0NklyRXU1V0V3?=
 =?utf-8?B?REtvUHA3aXVud3JFNkxFQTVpTUcraDFoVDhDVFhyWnFTK2dxY00wYU5BUzdW?=
 =?utf-8?B?VmdpN2Z1b0lmRlA4RzBGdFRGdnJjYUovZG4va3pQWkdQMGdwN24wV0N1UjJC?=
 =?utf-8?B?RkNTVGs4Ym9zNW1mZWMvT0RLNzhVMzAwUFpZUm1EN0RIb1kzVEs5SEh5RzJN?=
 =?utf-8?B?Z041WTNFaVM3Yms2QUFLQ0owZ2huQW85WTNYd3pXTm9nQldCK29KVFpEUGtQ?=
 =?utf-8?B?VFYyNk1MRlU3WFdJSHRPa1V1cTVtMXVRTkF1cTgvWERObGRnb1VqUTRrb1dG?=
 =?utf-8?B?cGJHQlJjRDFMSmErSzRFbWZ3ZWpieEdvWVRXSkt5bmVZaUtpZFo5T3VTVG54?=
 =?utf-8?B?K3d0a1h1blpZS25rS2ptYUNKcDhCTUFHMVY1Skpka3RWcVNFWFZ6c1lIZHhM?=
 =?utf-8?B?RDZsRmFoZ1FRZnVMc0lLSUxEbUlKejZTVTlxZ0RYRkNJVWxmME4rQm0rM21o?=
 =?utf-8?B?OXhBcGJGVk1hMUxuTHUvYnBLK3doR2hZdzB2N3VybjRwUmZmb0tFcFNYbndr?=
 =?utf-8?B?ZHZ5RW1MWDFCbXFXL0xDOTQrMUM4eDR4ODIxcDdkTFlpVjNiSVhsc2NDa1Jm?=
 =?utf-8?B?a1J5V1VXTlNYaVd2Y0owOUQ0QXZGbmlFTm1GTm5oeDJJb24zcW9uUFVCb3JR?=
 =?utf-8?B?azdVb1NDVUJvWVFycU9NaStSemthMElKQVBoblQ5YVlaTWZwU1NKaHM3VnV6?=
 =?utf-8?B?L1J0VXJUUGgvczc0elg4dDRubVBXUUtBS01DN0dEVS94ZzhGalZnVGl0cmY0?=
 =?utf-8?B?dGVZbVh6MFJVZk0wdVlrUG9BS0MrekxTdHJzOG9YQTJobG5MeitpT1ZvRFJn?=
 =?utf-8?B?ZEltMTdpWGQ2Q3RPYS9selE0SWN2QVZZblNac0RNQ0pVY3dENitBWGlNcTZP?=
 =?utf-8?B?YlBheXM4SXp4cmF3ZTUyMUFvaHgzU25rSUw2ZENGbExWSlNTTDArei9HRnNT?=
 =?utf-8?B?NzdkeGdMQkR0ejRNclVwWS81bExjNTBodFdiNnNtSHcyQ2F4dHY0RWZIcFhP?=
 =?utf-8?B?RlpxWXM2U3BjUFNUTndaMVFMV0tsa2VYK2gyVWMyUzlkU2ZsYWZIVGVSOXVQ?=
 =?utf-8?B?c0F1ODZ5Z01yUDRmUFd3Y0FBUk56bWRUdzhJTEhZc0lnbUNqWmYxUWlQT0Qx?=
 =?utf-8?B?cVFuTmpDRlRwRTd6aFozQmE0ZHVIbHh5QWJpR1hjY3VJT1VLWWZ0dWtrK2R6?=
 =?utf-8?B?V1F4eHBTakVyVktnd1daOU93N21wZytxUmxsc0FiYmhWUHhXV0luQzAvSkhp?=
 =?utf-8?B?bDFoZTFlQ3JYSWMyT2FYcUVpbnpmcjRCZ1hHSlZpNFhQMmlGclN6TFFGeG0v?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d98a51f-40b3-46ab-d4f5-08dc18028df3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 08:50:43.1499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V59zkS2Ee73R0GCHbTjNP9emls9CDd/6AsXgcr1CBSSD8IeX3Wudb93z2FtP2yTs1iABvZG+ATu5L52CC+JqyaCRXzDrjfqfRbPoyflL114=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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

Hi Swati,

On 18-01-2024 11:52 am, Sharma, Swati2 wrote:
> Hi Bhanu,
> 
> On 17-Jan-24 11:46 PM, Modem, Bhanuprakash wrote:
>>
>> On 10-01-2024 05:09 pm, Kunal Joshi wrote:
>>> From: Swati Sharma <swati2.sharma@intel.com>
>>>
>>> Add helpers for big joiner debugfs.
>>>
>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>> ---
>>>   lib/igt_kms.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>>   lib/igt_kms.h |  3 +++
>>>   2 files changed, 78 insertions(+)
>>>
>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>> index e4dea1a60..0208eccc4 100644
>>> --- a/lib/igt_kms.c
>>> +++ b/lib/igt_kms.c
>>> @@ -6368,3 +6368,78 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
>>>       return num_scalers;
>>>   }
>>> +
>>> +static int write_bigjoiner_debugfs(int drmfd, char *connector_name, 
>>> const char *file_name,
>>> +                   const char *write_buf)
>>
>> IMHO, we need to drop this static function and move the logic to 
>> igt_force_bigjoiner_enable()
> 
> Why?

I don't see any advantage of having this static function, since 
igt_force_bigjoiner_enable() is the only one who is using this function.

> 
>>
>>> +{
>>> +    int debugfs_fd = igt_debugfs_dir(drmfd);
>>> +    int len = strlen(write_buf);
>>> +    int ret;
>>> +    char file_path[128] = {0};
>>> +
>>> +    sprintf(file_path, "%s/%s", connector_name, file_name);
>>> +
>>> +    ret = igt_sysfs_write(debugfs_fd, file_path, write_buf, len);
>>> +
>>> +    close(debugfs_fd);
>>> +
>>> +    if (ret > 0)
>>> +        return 0;
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static bool check_bigjoiner_debugfs(int drmfd, char *connector_name,
>>> +                    const char *check_str)
>>
>> we need to drop this static function and move the logic to 
>> igt_is_force_bigjoiner_enabled()
>>
>>> +{
>>> +    char file_name[128] = {0};
>>> +    char buf[512];
>>> +
>>> +    sprintf(file_name, "%s/i915_bigjoiner_force_enable", 
>>> connector_name);
>>> +
>>> +    igt_debugfs_read(drmfd, file_name, buf);
>>> +
>>> +    return strstr(buf, check_str);
>>> +}
>>> +
>>> +/**
>>> + * igt_is_force_bigjoiner_enabled:
>>> + * @drmfd: A drm file descriptor
>>> + * @connector_name: Name of the libdrm connector we're going to use
>>> + *
>>> + * Returns: True if Big Joiner is force enabled (via debugfs) for 
>>> the given connector,
>>> + * false otherwise.
>>> + */
>>> +bool igt_is_force_bigjoiner_enabled(int drmfd, char *connector_name)
>>> +{
>>> +    return check_bigjoiner_debugfs(drmfd, connector_name, "Bigjoiner 
>>> enable: 1");
>>> +}
>>> +
>>> +/**
>>> + * igt_force_bigjoiner_enable:
>>> + * @drmfd: A drm file descriptor
>>> + * @connector_name: Name of the libdrm connector we're going to use
>>> + *
>>> + * Returns: 0 on success or negative error code, in case of failure.
>>> + */
>>> +int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool 
>>> enable)
>>> +{
>>> +    return write_bigjoiner_debugfs(drmfd, connector_name, 
>>> "i915_bigjoiner_force_enable", enable ? "1" : "0");
>>> +}
>>> +
>>> +/**
>>> + * igt_get_bigjoiner_debugfs_fd:
>>
>> Not understood the purpose of this helper.
>>
>> igt_debugfs_connector_dir() will give the directory fd, then we can 
>> perform igt_debugfs_simple_read() or igt_sysfs_write() with that fd.
> 
> This is getting used here 
> https://patchwork.freedesktop.org/patch/574033/?series=128266&rev=2

After all it is just a connector debugfs, and I am still not understood 
the purpose of this helper.

- Bhanu

> 
>>
>> - Bhanu
>>
>>> + * @drmfd: A drm file descriptor
>>> + * @connector_name: Name of the libdrm connector we're going to use
>>> + *
>>> + * Returns: fd of the Big Joiner debugfs for the given connector,
>>> + * else returns -1.
>>> + */
>>> +int igt_get_bigjoiner_debugfs_fd(int drmfd, char *connector_name)
>>> +{
>>> +    char file_name[128] = {0};
>>> +
>>> +    sprintf(file_name, "%s/i915_bigjoiner_force_enable", 
>>> connector_name);
>>> +
>>> +    return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
>>> +}
>>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>>> index b3882808b..2d000d54d 100644
>>> --- a/lib/igt_kms.h
>>> +++ b/lib/igt_kms.h
>>> @@ -1218,5 +1218,8 @@ bool 
>>> intel_pipe_output_combo_valid(igt_display_t *display);
>>>   bool igt_check_output_is_dp_mst(igt_output_t *output);
>>>   int igt_get_dp_mst_connector_id(igt_output_t *output);
>>>   int get_num_scalers(int drm_fd, enum pipe pipe);
>>> +bool igt_is_force_bigjoiner_enabled(int drmfd, char *connector_name);
>>> +int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool 
>>> enable);
>>> +int igt_get_bigjoiner_debugfs_fd(int drmfd, char *connector_name);
>>>   #endif /* __IGT_KMS_H__ */
