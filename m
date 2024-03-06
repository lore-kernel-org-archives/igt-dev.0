Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858ECC54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 11:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB9510EC95;
	Wed,  6 Mar 2024 11:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5OABipv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815DC1130A1
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 11:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709724549; x=1741260549;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ZaVP80aG4qHDiJZ4Y9ZupKRewQvG/PEiOTWtWfS5TSs=;
 b=H5OABipvSPWo8m6DG1UHlID7AK1OvzaYqO4ZT/V7Nhwgvj6xv8FmP8Ji
 cL6yPrNBDsrMW5BYMqpRttKa9AkwBfp9pBmpQvyU/f7PjZT5OQVaxws4z
 iT3f+FwQipdCKqFWZo1QGbrVDxQiTX4tVntMD6BiRUCBZCs8ZrVeIcGpi
 PBfVcjvIlu7PVCTvoxoLld8X2R2mJIBgb7KU1IXsVg+viZBs7O+gNL3Pw
 fWRi4WJE8cAibAQZi3rC94R+3YRIR1BpL3I6no78wnFSdb1+ntcIdYlEy
 hrqLzH/2YjW5D2yHw7TZqt9FE5zkv7NSa0rN4N0/U9W9m1HBLN/FZAHmv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4513102"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208,217";a="4513102"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 03:29:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208,217";a="9698852"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 03:29:08 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 03:29:07 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 03:29:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 03:29:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 03:29:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijIPZVf08OhoHx1KAdWBOft/06dwXh6h+q5A/NZAMw+yxuBH7R/6V6G4mGXmEvrdBtNr04eGWnomtBa1etbsVqvm3DdxZuZSanD4v3RJCXQMieckUL73noqGWBZDphqk/zSaUDyK5fxyNWmItQncmLjR+/4U806EE36USZWS1kGDcdX9U/dg6FT7vtevDb2PdHhqDMvH7faOz4Cn81dBn2/u1uy5xLA1hmfU+GvoLxKkw1rCI8mifd+gmIh38iNVyPF1twPqsFOIjcgR691tWObF/FqqtQixHmvBrMbM9OC0+j+a4wTItaAi/QBlQMmUIpcrQXEArF9U6dMofUB7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpTqS0oMjrTHsa1JHnzFAoweNp+Q2rbdauJiDRBv63A=;
 b=giG95PQfqtlReGHURaYFPzeuWEXE4mwPatenAnAemIHqMz1zZlJCCP/xUhDLusWVzZDTEWJB/2l1lxRWToJtNAvH+trXsYOyT6HKjKiXHU+B1cqTZcdAyqPRev2RcwQbcMQCUx23qaKLK9J6NTamiqmRTojFjT6Qc3N1c9xxOBElIr4oG7AXoleEV4wnsdsIBDrBy1VZJt4qA1LtRf3K82FZlwm3cBt/wgmig0gGqSwcOKUUIOOySq4yT8Y7o2mm4fm5ToHNihrHMxkKN/PtGuPTVc23WOKXBw9OG1CJBNyaAnfimu/I/qK2YC8p0pWgGARIsgU7IykwjfZkPw16jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 11:29:03 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 11:29:03 +0000
Content-Type: multipart/alternative;
 boundary="------------vsNQvTWNrA94t0tZ0Lp0eJhc"
Message-ID: <215c1cb2-0157-4002-9ab0-c99d5ed4e985@intel.com>
Date: Wed, 6 Mar 2024 16:58:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_big_joiner: revamp
 kms_big_joiner
Content-Language: en-US
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240306052509.717026-1-kunal1.joshi@intel.com>
 <20240306052509.717026-3-kunal1.joshi@intel.com> <Zeg9KosfNa0Lld1C@intel.com>
 <2d71c76c-8205-47c3-9c5b-57671296eddc@intel.com> <ZehGg6Vkqv06MbzN@intel.com>
 <68466e6d-81af-46ce-ba10-ec38bdb06392@intel.com> <ZehPOZqqhLjX1nLY@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <ZehPOZqqhLjX1nLY@intel.com>
X-ClientProxiedBy: BM1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::25) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|CO1PR11MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f264938-c451-4186-aabf-08dc3dd0a040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMqUSdBj5zPAWcxuIXNQl9hMsFCLjo47LRhrIwvGEl3601BXCR73Ee7JsSGqB6JnxxMWzbIh2SBkumxt87pK90W1lldtNdjTnkO98qdVd+/7DtM3M0wxUSHkhDPw5d7fgNLs8xcAWRjhfC4jEHSVKbtn+4QgU6HGh4zgbsFXay9wf3s7Cghz4pMSeJi0bxG67fWo01oKgUmelU3ag4jKKfvxuR6rqGj4N9pkrIko06CAARnniFOwhobLzo8dKFJyHcTlBI2Jkct62bsnQio2XPSy63iovsGOZys/eW6yBeOWfnTKN3OBBPB6HBSDzmoyWf5yFgLzcjTqtAo3PfwtH1kTA+mGkZUhDcbqRIyVWO+fvoamf4yD1VnUq/+t43l43UctI7Y14sKlz8c4OWXnwGUSxMyEK+q+u7+r3fto07JIvyEY4lrR6MbRGSJup2JMV7T0nwmoe5aCuEmCP8j/0BOMOSsLZs4XAoz/lVBf5dPBZD8hXNqd23iSh/qfe6T3ARnn9eaI8rLKe5YawfOYZ18deN19X0S7Z3Jf21ocqNImeVl7oUo12oCkW9CC6lno5XMiQhGRqbce6IDZHKAC4S9ShVGI/H6sUhgrqrmUO5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3RUSUtXaS9wZGNtb3BWVjdJQmZaTmk5M0IwdlM5K1FsSnZQSkFOZ3BrRHVO?=
 =?utf-8?B?bytnTXNhd3I1TE9JUks1MnBobUxiaDQrT0RQSGNiMWRCdDZiZ0RVNDhjakw5?=
 =?utf-8?B?NmRxdTc0T1p6OFpUNUVyRUt5dGt5S3NabXpZMk1aQndLbElEUk5mR3NaS25X?=
 =?utf-8?B?YkxTSEVXcWRFeW9sOUNTQjJuTUR3dGp5RE5JNkUwQ1ArRHVDWWdlOXpYNDhE?=
 =?utf-8?B?RW5YMDk5cVdMVVExMTkxMWxTNXZ3UktXMThzZVRWaFF5WW5aaXZVNzJiZHBm?=
 =?utf-8?B?ZEhrQ0xLV1JqUkVBSG9oREJJNjBCckMyRmFvOTIrMUdjUnRIUVJGVXh1TWxJ?=
 =?utf-8?B?K213M096OU11YlNUaGFWajRGc1dvQlBUMGNVd0ZXQzQvU0ttcDNpNFkyRnBY?=
 =?utf-8?B?dlJ4NTFsS1UvVWZ4WHRsdFBHblhsbnJwNlE0NHoyUG5sVm1vY29zV2dTa2Ns?=
 =?utf-8?B?azFvYlFzSWVxSHpLSUhrUm5Rc1BteUFBbllLT2tqdytOZ0RzOGF6MGRPRDY1?=
 =?utf-8?B?UjA4UUIwdHFoUlhNNHM3L2RFUVl6RkFpRjlmZ2xTYVNrSW9JNlVYVXFjdFFS?=
 =?utf-8?B?YjlraC8rc0lMb2ZIWUtDUXNrVU5lT1h6WDhYZWJsZittN24wcWcyL0dFeWdo?=
 =?utf-8?B?MkVCN21Jbzg5eDBlZDV6bEE3YTlqRVFDZ01zUngxVExoSDRMMDdSNkRyR3hM?=
 =?utf-8?B?RC9sOGZ2TWdiaEVWdm5laE1nbXBsRnUxcFg0WmgxMmMvTkZnSjJnQ2NZaVhT?=
 =?utf-8?B?V3pkN0JjNncyQ200ZHY2VENFaThwOUIwazUrK0N0N1dJZmt1bDdJZFNRLzMx?=
 =?utf-8?B?ZFI4ZVdLOWpKNzdZNlhCMk9TdTM1TFZOWGxwa2RQRGlIVHBPaUQvYzFyT2ND?=
 =?utf-8?B?UlNYS0dDNWxSZEtKZmI0enZ1RExwOC9TdVdyclhDWXZPVWVpZmo4cHpER3hF?=
 =?utf-8?B?VzFWNkNFSUtSOVphNmNydGJHVWxFQldyMUd0cXhJZEVuQkI3dVNWZ0ZRallJ?=
 =?utf-8?B?cEhQVWQ3ckhFZS8zNmpkQVFyNEhLczBXeEhkQjBtTnlMc2d4LzBmUjJrR1gw?=
 =?utf-8?B?KzFYUFplNUJ3NWZlbkpuU0FZVzNuOWZOZERTM0JFSGtRRWdTZ3VZbm4vZmh5?=
 =?utf-8?B?cGlwWk1wV1Z1Zjk0dlU4UERnT1VDWCtvNVJMeG91SkR3dnYxM0gzMGE0ekZV?=
 =?utf-8?B?bFZDczRsempzcjZ4T0VsaEFDU3ova1FzeEgxVklyekpGZmpqRlhsUmwvTHpy?=
 =?utf-8?B?b0U2c1FsLzlVWFMwQm1yK2hEbFh5L05aVWdSUk1YYThhQk5Zb1dweGgwSTdE?=
 =?utf-8?B?UXVmdGZlZ2NmbUtZNGpxSXplSFp5R2lYUlJSakFpbmpXQUlIc2plTjJPY21l?=
 =?utf-8?B?S1JYL3VtbFJqd0lCUU4yUFFoc2hheFEvdlJCMVFVSHNtOE9uU1BweThpc3RN?=
 =?utf-8?B?aFVnc1NWN1NVT05iOU4rZjIydGZ6NnZVWlZTTzNEemtKWXZOME9mMi9IT1Rn?=
 =?utf-8?B?WTJLdnppbEloY092Z1FnUTAwcjQydTVNd05ORmlGR3JzTXNmZFZiR3JmcWZJ?=
 =?utf-8?B?ckp2clJhbmV2WkFvRDNqSUU3OXAwNVJUbHFveENhbEhpTXVLVVd0Rm5VUHc1?=
 =?utf-8?B?NTJNc2pBZzVpVXlRaVJnTVErMGk3dHU2dW5sUjYzeXlNZ2JHTDZNS28vQVdH?=
 =?utf-8?B?L3pPQjJQd3QxQ29kNWpScWVnczZLcWErU2NOUFJQcmJVVmdHRVgvWGlFK28z?=
 =?utf-8?B?SmNrVHcvaHhMZm5rejRKNk5nTHdyVmZXTC9VM3BWTGlnSlAzT2d5WEhpMzAv?=
 =?utf-8?B?bGtYRk9LN2gxRHpoMytuVW5GZlhReEF0T1BySlo1SGZBTlg2Q2dJUGM3OUhP?=
 =?utf-8?B?Y3lyMmR0aXVRWjkzeEhJZmdNeEtTQmVrQkQvU0RMdkF2VVRubllmRytmNUw2?=
 =?utf-8?B?ejRxeC91SFBlRWRXa084ZzM0eWxVdWN4VEI1VnMyUmpGai9KTUc4aDVuNHVZ?=
 =?utf-8?B?eFNJM3BYb0ZNVENMblJFVnA2SE1IMjJISUxlM2lGU1lGaVNBWVR2NXBGOVpq?=
 =?utf-8?B?UFhya3RPZGpxVnRhbTVEYktUblFGSEFBUmU5ekoreE1xaHBIaHZVeTZNRi9F?=
 =?utf-8?Q?jtn+jLUjX9tIcXhcnM496kX47?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f264938-c451-4186-aabf-08dc3dd0a040
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 11:29:03.4339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfWqzOgWmpHeHEGKnO1zPfifDVUAtVF8zf+hCxoR0bzjHA9pySg90EHVLcnVbk+eDgiMCD+OfjkHWdHZaSJWsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
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

--------------vsNQvTWNrA94t0tZ0Lp0eJhc
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hello Stan,

On 3/6/2024 4:40 PM, Lisovskiy, Stanislav wrote:
> On Wed, Mar 06, 2024 at 04:11:03PM +0530, Joshi, Kunal1 wrote:
>> Hello Stan,
>>
>> On 3/6/2024 4:03 PM, Lisovskiy, Stanislav wrote:
>>> On Wed, Mar 06, 2024 at 03:41:26PM +0530, Joshi, Kunal1 wrote:
>>>> Hello Stan,
>>>>
>>>> On 3/6/2024 3:23 PM, Lisovskiy, Stanislav wrote:
>>>>> On Wed, Mar 06, 2024 at 10:55:09AM +0530, Kunal Joshi wrote:
>>>>>> big joiner outputs are statically assigned to pipe,
>>>>>> rewrite to assign dynamically
>>>>>>
>>>>>> v2: Don't change license (Bhanu)
>>>>>>        Add documentation for generate_combinations (Bhanu)
>>>>>>        Print the pipe name (Bhanu)
>>>>>>        Remove unwanted commit (Bhanu)
>>>>>>        Move combine output logic to igt_fixture (Bhanu)
>>>>>>        split revamp and force joiner (Bhanu)
>>>>>>
>>>>>> Cc: Karthik B S<karthik.b.s@intel.com>
>>>>>> Cc: Bhanuprakash Modem<bhanuprakash.modem@intel.com>
>>>>>> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
>>>>>> ---
>>>>>>     tests/intel/kms_big_joiner.c | 391 +++++++++++++++++------------------
>>>>>>     1 file changed, 187 insertions(+), 204 deletions(-)
>>>>>>
>>>>>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
>>>>>> index 28678b958..ba4097d8b 100644
>>>>>> --- a/tests/intel/kms_big_joiner.c
>>>>>> +++ b/tests/intel/kms_big_joiner.c
>>>>>> @@ -43,16 +43,19 @@
>>>>>>      *
>>>>>>      * SUBTEST: basic
>>>>>>      * Description: Verify the basic modeset on big joiner mode on all pipes
>>>>>> - *
>>>>>> - * SUBTEST: 2x-modeset
>>>>>> - * Description: Verify simultaneous modeset on 2 big joiner outputs
>>>>>>      */
>>>>>> -
>>>>>>     IGT_TEST_DESCRIPTION("Test big joiner");
>>>>>> -struct bigjoiner_output {
>>>>>> -	uint32_t output_id;
>>>>>> -	drmModeModeInfo mode;
>>>>>> +#define MAX_OUTPUTS 256
>>>>>> +#define MAX_COMBINATIONS 1000
>>>>>> +#define INVALID_TEST_OUTPUT 2
>>>>>> +typedef struct {
>>>>>> +    int combination[MAX_OUTPUTS];
>>>>>> +} Combination;
>>>>>> +
>>>>>> +enum joiner_type {
>>>>>> +	BIG_JOINER = 1 << 1,
>>>>>> +	INVALID_JOINER = -1,
>>>>>>     };
>>>>>>     typedef struct {
>>>>>> @@ -60,273 +63,253 @@ typedef struct {
>>>>>>     	igt_display_t display;
>>>>>>     	struct igt_fb fb;
>>>>>>     	int n_pipes;
>>>>>> -	enum pipe pipe1;
>>>>>> -	enum pipe pipe2;
>>>>>> -	struct bigjoiner_output output[2];
>>>>>> +	uint64_t big_joiner_outputs[IGT_MAX_PIPES];
>>>>>> +	uint64_t non_big_joiner_outputs[IGT_MAX_PIPES];
>>>>>> +	uint64_t combined_outputs[IGT_MAX_PIPES];
>>>>>> +	int big_joiner_output_count;
>>>>>> +	int non_big_joiner_output_count;
>>>>>> +	int combined_output_count;
>>>>>> +	int output_count;
>>>>>> +	enum pipe pipe_seq[IGT_MAX_PIPES];
>>>>>>     } data_t;
>>>>>>     static int max_dotclock;
>>>>>> -static void test_invalid_modeset(data_t *data)
>>>>>> +/*
>>>>>> + * The generate_combinations function generates combinations of pipe allocations
>>>>>> + * for a given number of outputs
>>>>>> + *
>>>>>> + * @output_count: Number of outputs to allocate pipes for.
>>>>>> + * @pipe_count: Total number of available pipes.
>>>>>> + * @pipes_per_output: Number of pipes to be allocated for a single output.
>>>>>> + * @combinations: Array to store generated combinations.
>>>>>> + * @num_combinations: Pointer to a variable that stores the number of generated combinations.
>>>>>> + *
>>>>>> + * Example (output_count=2, pipe_count=4, pipes_per_output=2):
>>>>>> + * Combination 1: 0 2
>>>>>> + * Combination 2: 1 3
>>>>> I think this might be a bit overcomplicated - just for your information, we can't deliberately
>>>>> choose which pipes can be used for bigjoiner. On some platforms even only certain pipes, can be
>>>>> used for bigjoiner.
>>>>> Moreover the way how driver decides, which pipes are going to be used for bigjoiner is basically
>>>>> this code in intel_dp.c:
>>>>>
>>>>> if (intel_dp_need_bigjoiner(intel_dp, adjusted_mode->crtc_hdisplay,
>>>>> 			    adjusted_mode->crtc_clock))
>>>>>             pipe_config->bigjoiner_pipes = GENMASK(crtc->pipe + 1, crtc->pipe);
>>>>>
>>>>> Means if you try to do a modeset with resolution > 5K or exceed max_dot_clock on crtc->pipe,
>>>>> then _always_ pipe + 1, going to be used for bigjoiner.
>>>>>
>>>>>
>>>>> Stan
>>>>>
>>>> Thanks for the inputs,
>>>> Goal here is to try various combination possible,
>>>> Suppose a platform supports 5 pipes(A-E) and we have 1 bigjoiner output
>>>> (DP-1) then we want to try
>>>> DP-1 on PIPE_A
>>>> DP-1 on PIPE_B
>>>> DP-1 on PIPE_C
>>>> DP-1 on PIPE_D
>>>>
>>>> Suppose a platform supports 5 pipes(A-E) and we have 2 bigjoiner output
>>>> (DP-1, DP-2) then we want to try
>>>> DP-1 on PIPE_A and DP-2 on PIPE_C
>>>> DP-1 on PIPE_B and DP-2 on PIPE_D And so on, Going forward this will be
>>>> useful we introduce any feature which can allow having more pipes per output
>>>> also.
>>> That won't work. BSpec and current driver code allows to use only _adjacent_ pipes.
>>> I.e if you modeset PIPE_A with 5K resolution, then bigjoiner_pipes mask would be
>>> PIPE_A | PIPE_B. If you modeset PIPE_B with 5K resolution it will take PIPE_C as a
>>> slave and so on.
>>> So for instance of you had DP-1 assigned to PIPE_A and DP-2 assigned to PIPE_C by test,
>>> _driver_ will still reassign PIPE_B to DP-2, in order for bigjoiner to work.
>>> That logic is implemented in intel_dp.c, as I mentioned above.
>>> Also you can check the BSpec Bigjoiner programming description.
>>>
>>> Stan
>> I think there is some confusion here,
>>
>> Below is result of the test that was executed with current code
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-arls-4/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
>>
>> Assigning pipe 0 to DP-3
>> <7> [44.263216] i915 0000:00:02.0: [drm:intel_atomic_check [i915]]
>> [CRTC:131:pipe B] Used as slave for big joiner master [CRTC:80:pipe A]
>>
>> Assigning pipe 1 to DP-3
>> <7> [44.568716] i915 0000:00:02.0: [drm:intel_atomic_check [i915]]
>> [CRTC:182:pipe C] Used as slave for big joiner master [CRTC:131:pipe B]
>> Assigning pipe 2 to DP-3
>> <7> [44.909690] i915 0000:00:02.0: [drm:intel_atomic_check [i915]]
>> [CRTC:233:pipe D] Used as slave for big joiner master [CRTC:182:pipe C] So
>> we are leaving one sequential pipe for a output,
>> Please let me know if i still wasn't able to explain properly.
> Yes, that is correct here. I was just trying to clarify that we can't have all
> possible combinations unfortunately.
> There are only certain scenarios supported, so could be a bit overkill trying to
> approach this combinatorical way, but rather I would see this more like introducing
> some mapping table, containing valid mappings or something similar.
> I don't think we are going to have more than 5 pipes anyway soon.
>
> That way, it might be way easier to check with spec and maintain this code.
>
> In case if more pipes are supported per output, most likely it won't be that straight
> forward as well :)
>
> I would add something like "get_next_master_pipe" function, which you call for each pipe
> which is allowed to be master. That function would also take available pipes as a mask.
>
> Then it returns next avaiable master pipe, considering the available pipes mask.
> That way you easily generate all allowed combinations, by just modifying available pipes mask.
>
> Stan
Can you please provide more info on this only certain scenario's supported?
Or just an example where this code won't work will be really useful.

On the overkill part, this to me will only have the combinations which 
are valid,
Maybe we just need to exclude those certain scenario's which are 
unsupported.
>
>>>>>> +*/
>>>>>> +static void generate_combinations(int output_count, int pipe_count,
>>>>>> +				  int pipes_per_output,
>>>>>> +				  Combination combinations[MAX_COMBINATIONS],
>>>>>> +				  uint64_t *num_combinations)
>>>>>>     {
>>>>>> -	igt_output_t *output;
>>>>>> -	igt_display_t *display = &data->display;
>>>>>> -	int ret;
>>>>>> +	int i, index;
>>>>>> +	int current_combination[MAX_OUTPUTS];
>>>>>> -	igt_info("Bigjoiner test on ");
>>>>>> -	for_each_connected_output(display, output){
>>>>>> -		enum pipe p = output->pending_pipe;
>>>>>> -		drmModeModeInfo *mode;
>>>>>> -		igt_pipe_t *pipe;
>>>>>> -		igt_plane_t *plane;
>>>>>> +	for (i = 0; i < output_count; ++i)
>>>>>> +		current_combination[i] = i * pipes_per_output;
>>>>>> -		if (p == PIPE_NONE)
>>>>>> -			continue;
>>>>>> -
>>>>>> -		mode = igt_output_get_mode(output);
>>>>>> -		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
>>>>>> -		kmstest_dump_mode(mode);
>>>>>> +	while (*num_combinations < MAX_COMBINATIONS && current_combination[0] <= pipe_count - output_count * pipes_per_output) {
>>>>>> +		for (i = 0; i < output_count; ++i)
>>>>>> +			combinations[*num_combinations].combination[i] = current_combination[i];
>>>>>> -		pipe = &display->pipes[p];
>>>>>> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>>> +		(*num_combinations)++;
>>>>>> -		igt_plane_set_fb(plane, &data->fb);
>>>>>> -		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>>>>>> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>>>>> -	}
>>>>>> +		index = output_count - 1;
>>>>>> +		while (index >= 0 && current_combination[index] == pipe_count - (output_count - index) * pipes_per_output)
>>>>>> +			index--;
>>>>>> -	igt_assert(!igt_check_bigjoiner_support(display));
>>>>>> +		if (index < 0)
>>>>>> +			break;
>>>>>> -	/* This commit is expectd to fail as this pipe is being used for big joiner */
>>>>>> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
>>>>>> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>>>> +		current_combination[index]++;
>>>>>> +		for (i = index + 1; i < output_count; ++i)
>>>>>> +			current_combination[i] = current_combination[i - 1] + pipes_per_output;
>>>>>> +    }
>>>>>> +}
>>>>>> -	igt_display_reset(&data->display);
>>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>>> +static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t output_id)
>>>>>> +{
>>>>>> +	igt_output_t *output;
>>>>>> -	igt_assert_lt(ret, 0);
>>>>>> +	for_each_connected_output(&data->display, output) {
>>>>>> +		if (output->id == output_id)
>>>>>> +			return output;
>>>>>> +	}
>>>>>> +	igt_assert("Output not found\n");
>>>>>> +	return NULL;
>>>>>>     }
>>>>>> -static void test_basic_modeset(data_t *data)
>>>>>> +static void test_invalid_modeset_two_joiner(data_t *data, bool combined)
>>>>>>     {
>>>>>> +	int i, j, ret;
>>>>>> +	igt_output_t *output;
>>>>>> +	uint64_t *outputs;
>>>>>> +	igt_plane_t *primary[INVALID_TEST_OUTPUT];
>>>>>> +	igt_fb_t fb[INVALID_TEST_OUTPUT];
>>>>>>     	drmModeModeInfo *mode;
>>>>>> -	igt_output_t *output, *bigjoiner_output = NULL;
>>>>>> -	igt_display_t *display = &data->display;
>>>>>> -	igt_pipe_t *pipe;
>>>>>> -	igt_plane_t *plane;
>>>>>> -	igt_display_reset(display);
>>>>>> -
>>>>>> -	for_each_connected_output(display, output) {
>>>>>> -		if (data->output[0].output_id == output->id) {
>>>>>> -			bigjoiner_output = output;
>>>>>> -			break;
>>>>>> +	outputs = combined ? data->combined_outputs : data->big_joiner_outputs;
>>>>>> +
>>>>>> +	for (i = 0; i < data->n_pipes-1; i++) {
>>>>>> +		igt_display_reset(&data->display);
>>>>>> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>>>>>> +			output = get_output_by_id_or_assert(data, outputs[j]);
>>>>>> +			igt_assert(output);
>>>>>> +			igt_output_set_pipe(output, data->pipe_seq[i + j]);
>>>>>> +			mode = igt_output_get_mode(output);
>>>>>> +			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
>>>>>> +				 kmstest_pipe_name(data->pipe_seq[i + j]),
>>>>>> +				 igt_output_name(output), mode->hdisplay,
>>>>>> +				 mode->vdisplay, mode->vrefresh,
>>>>>> +				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
>>>>>> +			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>>>>> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>>>> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>>>>>> +			igt_plane_set_fb(primary[j], &fb[j]);
>>>>>>     		}
>>>>>> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>>>>> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>>>>>     	}
>>>>>> -
>>>>>> -	igt_output_set_pipe(bigjoiner_output, data->pipe1);
>>>>>> -
>>>>>> -	mode = &data->output[0].mode;
>>>>>> -	igt_output_override_mode(bigjoiner_output, mode);
>>>>>> -
>>>>>> -	pipe = &display->pipes[data->pipe1];
>>>>>> -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>>> -
>>>>>> -	igt_plane_set_fb(plane, &data->fb);
>>>>>> -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>>>>>> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>>>>> -
>>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>>> -
>>>>>> -	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
>>>>>> -	igt_plane_set_fb(plane, NULL);
>>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>>>     }
>>>>>> -static void test_dual_display(data_t *data)
>>>>>> +static void tets_big_joiner_on_last_pipe(data_t *data)
>>>>>>     {
>>>>>> +	int i, ret;
>>>>>> +	uint64_t *outputs;
>>>>>> +	igt_output_t *output;
>>>>>> +	igt_plane_t *primary;
>>>>>> +	igt_fb_t fb;
>>>>>>     	drmModeModeInfo *mode;
>>>>>> -	igt_output_t *output, *bigjoiner_output[2];
>>>>>> -	igt_display_t *display = &data->display;
>>>>>> -	igt_pipe_t *pipe;
>>>>>> -	igt_plane_t *plane1, *plane2;
>>>>>> -	int count = 0;
>>>>>> -
>>>>>> -	igt_display_reset(display);
>>>>>> -
>>>>>> -	for_each_connected_output(display, output) {
>>>>>> -		if (data->output[count].output_id == output->id) {
>>>>>> -			bigjoiner_output[count] = output;
>>>>>> -			count++;
>>>>>> -		}
>>>>>> -		if (count > 1)
>>>>>> -			break;
>>>>>> +	outputs = data->big_joiner_outputs;
>>>>>> +	for (i = 0; i < data->big_joiner_output_count; i++) {
>>>>>> +		igt_display_reset(&data->display);
>>>>>> +		output = get_output_by_id_or_assert(data, outputs[i]);
>>>>>> +		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
>>>>>> +		mode = igt_output_get_mode(output);
>>>>>> +		igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
>>>>>> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
>>>>>> +				 igt_output_name(output), mode->hdisplay,
>>>>>> +				 mode->vdisplay, mode->vrefresh);
>>>>>> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>>>>> +		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>>>> +							  DRM_FORMAT_MOD_LINEAR, &fb);
>>>>>> +		igt_plane_set_fb(primary, &fb);
>>>>>> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>>>>> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>>>>>     	}
>>>>>> +}
>>>>>> -	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
>>>>>> -	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
>>>>>> -
>>>>>> -	/* Set up first big joiner output on Pipe A*/
>>>>>> -	mode = &data->output[0].mode;
>>>>>> -	igt_output_override_mode(bigjoiner_output[0], mode);
>>>>>> -
>>>>>> -	pipe = &display->pipes[data->pipe1];
>>>>>> -	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>>> -
>>>>>> -	igt_plane_set_fb(plane1, &data->fb);
>>>>>> -	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
>>>>>> -	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
>>>>>> -
>>>>>> -	/* Set up second big joiner output on Pipe C*/
>>>>>> -	mode = &data->output[1].mode;
>>>>>> -	igt_output_override_mode(bigjoiner_output[1], mode);
>>>>>> -
>>>>>> -	pipe = &display->pipes[data->pipe2];
>>>>>> -	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>>> -
>>>>>> -	igt_plane_set_fb(plane2, &data->fb);
>>>>>> -	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
>>>>>> -	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
>>>>>> -
>>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>>> +static void test_basic_modeset(data_t *data, int num_outputs,
>>>>>> +			       Combination combinations[MAX_COMBINATIONS],
>>>>>> +			       uint64_t num_combinations)
>>>>>> +{
>>>>>> +	int i, j, ret;
>>>>>> +	igt_display_t *display = &data->display;
>>>>>> +	igt_output_t *output[num_outputs];
>>>>>> +	igt_plane_t *primary[num_outputs];
>>>>>> +	igt_fb_t fb[num_outputs];
>>>>>> +	drmModeModeInfo *mode;
>>>>>> -	/* Clean up */
>>>>>> -	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
>>>>>> -	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
>>>>>> -	igt_plane_set_fb(plane1, NULL);
>>>>>> -	igt_plane_set_fb(plane2, NULL);
>>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>>> +	for (i = 0; i < num_combinations; i++) {
>>>>>> +		igt_display_reset(display);
>>>>>> +		for (j = 0; j < num_outputs; j++) {
>>>>>> +			output[j] = get_output_by_id_or_assert(data,
>>>>>> +						     data->big_joiner_outputs[j]);
>>>>>> +			igt_info("Assigning pipe %s to %s%s",
>>>>>> +				 kmstest_pipe_name(data->pipe_seq[combinations[i].combination[j]]),
>>>>>> +				 output[j]->name, j == num_outputs - 1 ? "\n" : ", ");
>>>>>> +			igt_output_set_pipe(output[j], data->pipe_seq[combinations[i].combination[j]]);
>>>>>> +			primary[j] = igt_output_get_plane_type(output[j], DRM_PLANE_TYPE_PRIMARY);
>>>>>> +			mode = igt_output_get_mode(output[j]);
>>>>>> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>>>> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>>>>>> +			igt_plane_set_fb(primary[j], &fb[j]);
>>>>>> +		}
>>>>>> +		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>>>>>> +		igt_assert_f(ret == 0, "Commit failed\n");
>>>>>> +    }
>>>>>>     }
>>>>>>     igt_main
>>>>>>     {
>>>>>> +	int i, j;
>>>>>>     	data_t data;
>>>>>>     	igt_output_t *output;
>>>>>> -	drmModeModeInfo mode;
>>>>>> -	int valid_output = 0, i, count = 0, j = 0;
>>>>>> -	uint16_t width = 0, height = 0;
>>>>>> -	enum pipe pipe_seq[IGT_MAX_PIPES];
>>>>>> +	drmModeModeInfo default_mode;
>>>>>> +	i = j = 0;
>>>>>>     	igt_fixture {
>>>>>>     		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>>>>>>     		kmstest_set_vt_graphics_mode();
>>>>>> -
>>>>>>     		igt_display_require(&data.display, data.drm_fd);
>>>>>>     		igt_require(data.display.is_atomic);
>>>>>> -
>>>>>>     		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>>>>>> +		data.big_joiner_output_count = 0;
>>>>>> +		data.non_big_joiner_output_count = 0;
>>>>>> +		data.combined_output_count = 0;
>>>>>> +		data.output_count = 0;
>>>>>>     		for_each_connected_output(&data.display, output) {
>>>>>>     			bool found = false;
>>>>>>     			drmModeConnector *connector = output->config.connector;
>>>>>> -
>>>>>> -			/*
>>>>>> -			 * Bigjoiner will come in to the picture when the
>>>>>> -			 * resolution > 5K or clock > max-dot-clock.
>>>>>> -			 */
>>>>>>     			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);
>>>>>> -
>>>>>>     			if (found) {
>>>>>> -				data.output[count].output_id = output->id;
>>>>>> -				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
>>>>>> -				count++;
>>>>>> -
>>>>>> -				width = max(width, mode.hdisplay);
>>>>>> -				height = max(height, mode.vdisplay);
>>>>>> +				data.big_joiner_outputs[data.big_joiner_output_count++] = output->id;
>>>>>> +				igt_output_override_mode(output, &connector->modes[0]);
>>>>>> +			} else {
>>>>>> +				data.non_big_joiner_outputs[data.non_big_joiner_output_count++] = output->id;
>>>>>> +				kmstest_get_connector_default_mode(data.drm_fd, connector, &default_mode);
>>>>>> +				igt_output_override_mode(output, &default_mode);
>>>>>>     			}
>>>>>> -			valid_output++;
>>>>>> +			data.output_count++;
>>>>>> +		}
>>>>>> +
>>>>>> +		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count > 0) {
>>>>>> +			data.combined_outputs[data.combined_output_count++] = data.big_joiner_outputs[0];
>>>>>> +			data.combined_outputs[data.combined_output_count++] = data.non_big_joiner_outputs[0];
>>>>>>     		}
>>>>>>     		data.n_pipes = 0;
>>>>>>     		for_each_pipe(&data.display, i) {
>>>>>>     			data.n_pipes++;
>>>>>> -			pipe_seq[j] = i;
>>>>>> +			data.pipe_seq[j] = i;
>>>>>>     			j++;
>>>>>>     		}
>>>>>> -
>>>>>> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
>>>>>> -
>>>>>> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
>>>>>> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>>>>>>     	}
>>>>>>     	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>>>>>>     	igt_subtest_with_dynamic("basic") {
>>>>>> -		for (i = 0; i < data.n_pipes - 1; i++) {
>>>>>> -			data.pipe1 = pipe_seq[i];
>>>>>> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
>>>>>> -				test_basic_modeset(&data);
>>>>>> +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
>>>>>> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>>>>>> +
>>>>>> +		for (i = 0; i < data.big_joiner_output_count; i++) {
>>>>>> +			uint64_t num_combinations = 0;
>>>>>> +			Combination combinations[MAX_COMBINATIONS];
>>>>>> +
>>>>>> +			generate_combinations(i+1, data.n_pipes, BIG_JOINER, combinations, &num_combinations);
>>>>>> +			igt_info("Number of combinations for %d outputs and %d pipes are %ld\n",
>>>>>> +					 i+1, data.n_pipes, num_combinations);
>>>>>> +
>>>>>> +			if (num_combinations > 0)
>>>>>> +				igt_dynamic_f("%dx-big-joiner", i+1)
>>>>>> +					test_basic_modeset(&data, i+1, combinations, num_combinations);
>>>>>> +			else
>>>>>> +				break;
>>>>>>     		}
>>>>>>     	}
>>>>>> -	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>>>>>> -		     "when the pipe is active with a big joiner modeset");
>>>>>>     	igt_subtest_with_dynamic("invalid-modeset") {
>>>>>> -		data.pipe1 = pipe_seq[j - 1];
>>>>>> -
>>>>>> -		igt_display_reset(&data.display);
>>>>>> -		for_each_connected_output(&data.display, output) {
>>>>>> -			if (data.output[0].output_id != output->id)
>>>>>> -				continue;
>>>>>> -
>>>>>> -			mode = data.output[0].mode;
>>>>>> -			igt_output_set_pipe(output, data.pipe1);
>>>>>> -			igt_output_override_mode(output, &mode);
>>>>>> +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
>>>>>> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>>>>>> -			igt_dynamic_f("pipe-%s-%s",
>>>>>> -				      kmstest_pipe_name(data.pipe1),
>>>>>> -				      igt_output_name(output))
>>>>>> -				test_invalid_modeset(&data);
>>>>>> -		}
>>>>>> +		if (data.big_joiner_output_count >= 1)
>>>>>> +			igt_dynamic_f("big_joiner_on_last_pipe")
>>>>>> +				tets_big_joiner_on_last_pipe(&data);
>>>>>> -		if(valid_output > 1) {
>>>>>> -			for (i = 0; i < data.n_pipes - 1; i++) {
>>>>>> -				igt_output_t *first_output = NULL, *second_output = NULL;
>>>>>> -
>>>>>> -				data.pipe1 = pipe_seq[i];
>>>>>> -				data.pipe2 = pipe_seq[i + 1];
>>>>>> -
>>>>>> -				igt_display_reset(&data.display);
>>>>>> -				for_each_connected_output(&data.display, output) {
>>>>>> -					if (data.output[0].output_id == output->id) {
>>>>>> -						first_output = output;
>>>>>> -						mode = data.output[0].mode;
>>>>>> -
>>>>>> -						igt_output_set_pipe(output, data.pipe1);
>>>>>> -						igt_output_override_mode(output, &mode);
>>>>>> -					} else if (second_output == NULL) {
>>>>>> -						second_output = output;
>>>>>> -						igt_output_set_pipe(output, data.pipe2);
>>>>>> -
>>>>>> -						break;
>>>>>> -					}
>>>>>> -				}
>>>>>> -
>>>>>> -				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
>>>>>> -					      kmstest_pipe_name(data.pipe1),
>>>>>> -					      igt_output_name(first_output),
>>>>>> -					      kmstest_pipe_name(data.pipe2),
>>>>>> -					      igt_output_name(second_output))
>>>>>> -					test_invalid_modeset(&data);
>>>>>> -			}
>>>>>> -		}
>>>>>> -	}
>>>>>> +		if (data.big_joiner_output_count > 1)
>>>>>> +			igt_dynamic_f("invalid_combinations_with_two_bigjoiner")
>>>>>> +				test_invalid_modeset_two_joiner(&data, false);
>>>>>> -	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
>>>>>> -	igt_subtest_with_dynamic("2x-modeset") {
>>>>>> -		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
>>>>>> -		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
>>>>>> -		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
>>>>>> -			data.pipe1 = pipe_seq[i];
>>>>>> -			data.pipe2 = pipe_seq[i + 2];
>>>>>> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
>>>>>> -				test_dual_display(&data);
>>>>>> +		if (data.combined_output_count) {
>>>>>> +			igt_dynamic_f("invalid_combinations_with_bigjoiner_non_bigjoiner")
>>>>>> +				test_invalid_modeset_two_joiner(&data, true);
>>>>>>     		}
>>>>>>     	}
>>>>>>     	igt_fixture {
>>>>>> -		igt_remove_fb(data.drm_fd, &data.fb);
>>>>>>     		igt_display_fini(&data.display);
>>>>>>     		drm_close_driver(data.drm_fd);
>>>>>>     	}
>>>>>> -- 
>>>>>> 2.25.1
>>>> Thanks and Regards
>>>> Kunal Joshi
>> Thanks and Regards
>> Kunal Joshi
--------------vsNQvTWNrA94t0tZ0Lp0eJhc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello Stan,<br>
    </p>
    <div class="moz-cite-prefix">On 3/6/2024 4:40 PM, Lisovskiy,
      Stanislav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZehPOZqqhLjX1nLY@intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Mar 06, 2024 at 04:11:03PM +0530, Joshi, Kunal1 wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hello Stan,

On 3/6/2024 4:03 PM, Lisovskiy, Stanislav wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, Mar 06, 2024 at 03:41:26PM +0530, Joshi, Kunal1 wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hello Stan,

On 3/6/2024 3:23 PM, Lisovskiy, Stanislav wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Wed, Mar 06, 2024 at 10:55:09AM +0530, Kunal Joshi wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">big joiner outputs are statically assigned to pipe,
rewrite to assign dynamically

v2: Don't change license (Bhanu)
      Add documentation for generate_combinations (Bhanu)
      Print the pipe name (Bhanu)
      Remove unwanted commit (Bhanu)
      Move combine output logic to igt_fixture (Bhanu)
      split revamp and force joiner (Bhanu)

Cc: Karthik B S<a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a>
Cc: Bhanuprakash Modem<a class="moz-txt-link-rfc2396E" href="mailto:bhanuprakash.modem@intel.com">&lt;bhanuprakash.modem@intel.com&gt;</a>
Signed-off-by: Kunal Joshi<a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
---
   tests/intel/kms_big_joiner.c | 391 +++++++++++++++++------------------
   1 file changed, 187 insertions(+), 204 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 28678b958..ba4097d8b 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -43,16 +43,19 @@
    *
    * SUBTEST: basic
    * Description: Verify the basic modeset on big joiner mode on all pipes
- *
- * SUBTEST: 2x-modeset
- * Description: Verify simultaneous modeset on 2 big joiner outputs
    */
-
   IGT_TEST_DESCRIPTION(&quot;Test big joiner&quot;);
-struct bigjoiner_output {
-	uint32_t output_id;
-	drmModeModeInfo mode;
+#define MAX_OUTPUTS 256
+#define MAX_COMBINATIONS 1000
+#define INVALID_TEST_OUTPUT 2
+typedef struct {
+    int combination[MAX_OUTPUTS];
+} Combination;
+
+enum joiner_type {
+	BIG_JOINER = 1 &lt;&lt; 1,
+	INVALID_JOINER = -1,
   };
   typedef struct {
@@ -60,273 +63,253 @@ typedef struct {
   	igt_display_t display;
   	struct igt_fb fb;
   	int n_pipes;
-	enum pipe pipe1;
-	enum pipe pipe2;
-	struct bigjoiner_output output[2];
+	uint64_t big_joiner_outputs[IGT_MAX_PIPES];
+	uint64_t non_big_joiner_outputs[IGT_MAX_PIPES];
+	uint64_t combined_outputs[IGT_MAX_PIPES];
+	int big_joiner_output_count;
+	int non_big_joiner_output_count;
+	int combined_output_count;
+	int output_count;
+	enum pipe pipe_seq[IGT_MAX_PIPES];
   } data_t;
   static int max_dotclock;
-static void test_invalid_modeset(data_t *data)
+/*
+ * The generate_combinations function generates combinations of pipe allocations
+ * for a given number of outputs
+ *
+ * @output_count: Number of outputs to allocate pipes for.
+ * @pipe_count: Total number of available pipes.
+ * @pipes_per_output: Number of pipes to be allocated for a single output.
+ * @combinations: Array to store generated combinations.
+ * @num_combinations: Pointer to a variable that stores the number of generated combinations.
+ *
+ * Example (output_count=2, pipe_count=4, pipes_per_output=2):
+ * Combination 1: 0 2
+ * Combination 2: 1 3
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I think this might be a bit overcomplicated - just for your information, we can't deliberately
choose which pipes can be used for bigjoiner. On some platforms even only certain pipes, can be
used for bigjoiner.
Moreover the way how driver decides, which pipes are going to be used for bigjoiner is basically
this code in intel_dp.c:

if (intel_dp_need_bigjoiner(intel_dp, adjusted_mode-&gt;crtc_hdisplay,
			    adjusted_mode-&gt;crtc_clock))
           pipe_config-&gt;bigjoiner_pipes = GENMASK(crtc-&gt;pipe + 1, crtc-&gt;pipe);

Means if you try to do a modeset with resolution &gt; 5K or exceed max_dot_clock on crtc-&gt;pipe,
then _always_ pipe + 1, going to be used for bigjoiner.


Stan

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Thanks for the inputs,
Goal here is to try various combination possible,
Suppose a platform supports 5 pipes(A-E) and we have 1 bigjoiner output
(DP-1) then we want to try
DP-1 on PIPE_A
DP-1 on PIPE_B
DP-1 on PIPE_C
DP-1 on PIPE_D

Suppose a platform supports 5 pipes(A-E) and we have 2 bigjoiner output
(DP-1, DP-2) then we want to try
DP-1 on PIPE_A and DP-2 on PIPE_C
DP-1 on PIPE_B and DP-2 on PIPE_D And so on, Going forward this will be
useful we introduce any feature which can allow having more pipes per output
also.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">That won't work. BSpec and current driver code allows to use only _adjacent_ pipes.
I.e if you modeset PIPE_A with 5K resolution, then bigjoiner_pipes mask would be
PIPE_A | PIPE_B. If you modeset PIPE_B with 5K resolution it will take PIPE_C as a
slave and so on.
So for instance of you had DP-1 assigned to PIPE_A and DP-2 assigned to PIPE_C by test,
_driver_ will still reassign PIPE_B to DP-2, in order for bigjoiner to work.
That logic is implemented in intel_dp.c, as I mentioned above.
Also you can check the BSpec Bigjoiner programming description.

Stan
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I think there is some confusion here,

Below is result of the test that was executed with current code
<a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-arls-4/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-arls-4/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html</a>

Assigning pipe 0 to DP-3
&lt;7&gt; [44.263216] i915 0000:00:02.0: [drm:intel_atomic_check [i915]]
[CRTC:131:pipe B] Used as slave for big joiner master [CRTC:80:pipe A]

Assigning pipe 1 to DP-3
&lt;7&gt; [44.568716] i915 0000:00:02.0: [drm:intel_atomic_check [i915]]
[CRTC:182:pipe C] Used as slave for big joiner master [CRTC:131:pipe B]
Assigning pipe 2 to DP-3
&lt;7&gt; [44.909690] i915 0000:00:02.0: [drm:intel_atomic_check [i915]]
[CRTC:233:pipe D] Used as slave for big joiner master [CRTC:182:pipe C] So
we are leaving one sequential pipe for a output,
Please let me know if i still wasn't able to explain properly.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes, that is correct here. I was just trying to clarify that we can't have all
possible combinations unfortunately.
There are only certain scenarios supported, so could be a bit overkill trying to
approach this combinatorical way, but rather I would see this more like introducing
some mapping table, containing valid mappings or something similar.
I don't think we are going to have more than 5 pipes anyway soon.

That way, it might be way easier to check with spec and maintain this code.

In case if more pipes are supported per output, most likely it won't be that straight
forward as well :)

I would add something like &quot;get_next_master_pipe&quot; function, which you call for each pipe
which is allowed to be master. That function would also take available pipes as a mask.

Then it returns next avaiable master pipe, considering the available pipes mask.
That way you easily generate all allowed combinations, by just modifying available pipes mask.

Stan</pre>
    </blockquote>
    Can you please provide more info on this only certain scenario's
    supported?<br>
    Or just an example where this code won't work will be really useful.<br>
    <br>
    On the overkill part, this to me will only have the combinations
    which are valid,<br>
    Maybe we just need to exclude those certain scenario's which are
    unsupported.<br>
    <blockquote type="cite" cite="mid:ZehPOZqqhLjX1nLY@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">+*/
+static void generate_combinations(int output_count, int pipe_count,
+				  int pipes_per_output,
+				  Combination combinations[MAX_COMBINATIONS],
+				  uint64_t *num_combinations)
   {
-	igt_output_t *output;
-	igt_display_t *display = &amp;data-&gt;display;
-	int ret;
+	int i, index;
+	int current_combination[MAX_OUTPUTS];
-	igt_info(&quot;Bigjoiner test on &quot;);
-	for_each_connected_output(display, output){
-		enum pipe p = output-&gt;pending_pipe;
-		drmModeModeInfo *mode;
-		igt_pipe_t *pipe;
-		igt_plane_t *plane;
+	for (i = 0; i &lt; output_count; ++i)
+		current_combination[i] = i * pipes_per_output;
-		if (p == PIPE_NONE)
-			continue;
-
-		mode = igt_output_get_mode(output);
-		igt_info(&quot;pipe:%s, output:%s, mode:&quot;, kmstest_pipe_name(p), igt_output_name(output));
-		kmstest_dump_mode(mode);
+	while (*num_combinations &lt; MAX_COMBINATIONS &amp;&amp; current_combination[0] &lt;= pipe_count - output_count * pipes_per_output) {
+		for (i = 0; i &lt; output_count; ++i)
+			combinations[*num_combinations].combination[i] = current_combination[i];
-		pipe = &amp;display-&gt;pipes[p];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		(*num_combinations)++;
-		igt_plane_set_fb(plane, &amp;data-&gt;fb);
-		igt_fb_set_size(&amp;data-&gt;fb, plane, mode-&gt;hdisplay, mode-&gt;vdisplay);
-		igt_plane_set_size(plane, mode-&gt;hdisplay, mode-&gt;vdisplay);
-	}
+		index = output_count - 1;
+		while (index &gt;= 0 &amp;&amp; current_combination[index] == pipe_count - (output_count - index) * pipes_per_output)
+			index--;
-	igt_assert(!igt_check_bigjoiner_support(display));
+		if (index &lt; 0)
+			break;
-	/* This commit is expectd to fail as this pipe is being used for big joiner */
-	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		current_combination[index]++;
+		for (i = index + 1; i &lt; output_count; ++i)
+			current_combination[i] = current_combination[i - 1] + pipes_per_output;
+    }
+}
-	igt_display_reset(&amp;data-&gt;display);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t output_id)
+{
+	igt_output_t *output;
-	igt_assert_lt(ret, 0);
+	for_each_connected_output(&amp;data-&gt;display, output) {
+		if (output-&gt;id == output_id)
+			return output;
+	}
+	igt_assert(&quot;Output not found\n&quot;);
+	return NULL;
   }
-static void test_basic_modeset(data_t *data)
+static void test_invalid_modeset_two_joiner(data_t *data, bool combined)
   {
+	int i, j, ret;
+	igt_output_t *output;
+	uint64_t *outputs;
+	igt_plane_t *primary[INVALID_TEST_OUTPUT];
+	igt_fb_t fb[INVALID_TEST_OUTPUT];
   	drmModeModeInfo *mode;
-	igt_output_t *output, *bigjoiner_output = NULL;
-	igt_display_t *display = &amp;data-&gt;display;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane;
-	igt_display_reset(display);
-
-	for_each_connected_output(display, output) {
-		if (data-&gt;output[0].output_id == output-&gt;id) {
-			bigjoiner_output = output;
-			break;
+	outputs = combined ? data-&gt;combined_outputs : data-&gt;big_joiner_outputs;
+
+	for (i = 0; i &lt; data-&gt;n_pipes-1; i++) {
+		igt_display_reset(&amp;data-&gt;display);
+		for (j = 0; j &lt; INVALID_TEST_OUTPUT; j++) {
+			output = get_output_by_id_or_assert(data, outputs[j]);
+			igt_assert(output);
+			igt_output_set_pipe(output, data-&gt;pipe_seq[i + j]);
+			mode = igt_output_get_mode(output);
+			igt_info(&quot;Assigning pipe %s to %s with mode %dx%d@%d%s&quot;,
+				 kmstest_pipe_name(data-&gt;pipe_seq[i + j]),
+				 igt_output_name(output), mode-&gt;hdisplay,
+				 mode-&gt;vdisplay, mode-&gt;vrefresh,
+				 j == INVALID_TEST_OUTPUT - 1 ? &quot;\n&quot; : &quot;, &quot;);
+			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			igt_create_pattern_fb(data-&gt;drm_fd, mode-&gt;hdisplay, mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
+								  DRM_FORMAT_MOD_LINEAR, &amp;fb[j]);
+			igt_plane_set_fb(primary[j], &amp;fb[j]);
   		}
+		ret = igt_display_try_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
+		igt_assert_f(ret != 0, &quot;Commit shouldn't have passed\n&quot;);
   	}
-
-	igt_output_set_pipe(bigjoiner_output, data-&gt;pipe1);
-
-	mode = &amp;data-&gt;output[0].mode;
-	igt_output_override_mode(bigjoiner_output, mode);
-
-	pipe = &amp;display-&gt;pipes[data-&gt;pipe1];
-	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane, &amp;data-&gt;fb);
-	igt_fb_set_size(&amp;data-&gt;fb, plane, mode-&gt;hdisplay, mode-&gt;vdisplay);
-	igt_plane_set_size(plane, mode-&gt;hdisplay, mode-&gt;vdisplay);
-
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
-	igt_plane_set_fb(plane, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
   }
-static void test_dual_display(data_t *data)
+static void tets_big_joiner_on_last_pipe(data_t *data)
   {
+	int i, ret;
+	uint64_t *outputs;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	igt_fb_t fb;
   	drmModeModeInfo *mode;
-	igt_output_t *output, *bigjoiner_output[2];
-	igt_display_t *display = &amp;data-&gt;display;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane1, *plane2;
-	int count = 0;
-
-	igt_display_reset(display);
-
-	for_each_connected_output(display, output) {
-		if (data-&gt;output[count].output_id == output-&gt;id) {
-			bigjoiner_output[count] = output;
-			count++;
-		}
-		if (count &gt; 1)
-			break;
+	outputs = data-&gt;big_joiner_outputs;
+	for (i = 0; i &lt; data-&gt;big_joiner_output_count; i++) {
+		igt_display_reset(&amp;data-&gt;display);
+		output = get_output_by_id_or_assert(data, outputs[i]);
+		igt_output_set_pipe(output, data-&gt;pipe_seq[data-&gt;n_pipes - 1]);
+		mode = igt_output_get_mode(output);
+		igt_info(&quot;Assigning pipe %s to %s with mode %dx%d@%d\n&quot;,
+				 kmstest_pipe_name(data-&gt;pipe_seq[data-&gt;n_pipes - 1]),
+				 igt_output_name(output), mode-&gt;hdisplay,
+				 mode-&gt;vdisplay, mode-&gt;vrefresh);
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_create_pattern_fb(data-&gt;drm_fd, mode-&gt;hdisplay, mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
+							  DRM_FORMAT_MOD_LINEAR, &amp;fb);
+		igt_plane_set_fb(primary, &amp;fb);
+		ret = igt_display_try_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
+		igt_assert_f(ret != 0, &quot;Commit shouldn't have passed\n&quot;);
   	}
+}
-	igt_output_set_pipe(bigjoiner_output[0], data-&gt;pipe1);
-	igt_output_set_pipe(bigjoiner_output[1], data-&gt;pipe2);
-
-	/* Set up first big joiner output on Pipe A*/
-	mode = &amp;data-&gt;output[0].mode;
-	igt_output_override_mode(bigjoiner_output[0], mode);
-
-	pipe = &amp;display-&gt;pipes[data-&gt;pipe1];
-	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane1, &amp;data-&gt;fb);
-	igt_fb_set_size(&amp;data-&gt;fb, plane1, mode-&gt;hdisplay, mode-&gt;vdisplay);
-	igt_plane_set_size(plane1, mode-&gt;hdisplay, mode-&gt;vdisplay);
-
-	/* Set up second big joiner output on Pipe C*/
-	mode = &amp;data-&gt;output[1].mode;
-	igt_output_override_mode(bigjoiner_output[1], mode);
-
-	pipe = &amp;display-&gt;pipes[data-&gt;pipe2];
-	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane2, &amp;data-&gt;fb);
-	igt_fb_set_size(&amp;data-&gt;fb, plane2, mode-&gt;hdisplay, mode-&gt;vdisplay);
-	igt_plane_set_size(plane2, mode-&gt;hdisplay, mode-&gt;vdisplay);
-
-	igt_display_commit2(display, COMMIT_ATOMIC);
+static void test_basic_modeset(data_t *data, int num_outputs,
+			       Combination combinations[MAX_COMBINATIONS],
+			       uint64_t num_combinations)
+{
+	int i, j, ret;
+	igt_display_t *display = &amp;data-&gt;display;
+	igt_output_t *output[num_outputs];
+	igt_plane_t *primary[num_outputs];
+	igt_fb_t fb[num_outputs];
+	drmModeModeInfo *mode;
-	/* Clean up */
-	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
-	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
-	igt_plane_set_fb(plane1, NULL);
-	igt_plane_set_fb(plane2, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	for (i = 0; i &lt; num_combinations; i++) {
+		igt_display_reset(display);
+		for (j = 0; j &lt; num_outputs; j++) {
+			output[j] = get_output_by_id_or_assert(data,
+						     data-&gt;big_joiner_outputs[j]);
+			igt_info(&quot;Assigning pipe %s to %s%s&quot;,
+				 kmstest_pipe_name(data-&gt;pipe_seq[combinations[i].combination[j]]),
+				 output[j]-&gt;name, j == num_outputs - 1 ? &quot;\n&quot; : &quot;, &quot;);
+			igt_output_set_pipe(output[j], data-&gt;pipe_seq[combinations[i].combination[j]]);
+			primary[j] = igt_output_get_plane_type(output[j], DRM_PLANE_TYPE_PRIMARY);
+			mode = igt_output_get_mode(output[j]);
+			igt_create_pattern_fb(data-&gt;drm_fd, mode-&gt;hdisplay, mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
+								  DRM_FORMAT_MOD_LINEAR, &amp;fb[j]);
+			igt_plane_set_fb(primary[j], &amp;fb[j]);
+		}
+		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+		igt_assert_f(ret == 0, &quot;Commit failed\n&quot;);
+    }
   }
   igt_main
   {
+	int i, j;
   	data_t data;
   	igt_output_t *output;
-	drmModeModeInfo mode;
-	int valid_output = 0, i, count = 0, j = 0;
-	uint16_t width = 0, height = 0;
-	enum pipe pipe_seq[IGT_MAX_PIPES];
+	drmModeModeInfo default_mode;
+	i = j = 0;
   	igt_fixture {
   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
   		kmstest_set_vt_graphics_mode();
-
   		igt_display_require(&amp;data.display, data.drm_fd);
   		igt_require(data.display.is_atomic);
-
   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
+		data.big_joiner_output_count = 0;
+		data.non_big_joiner_output_count = 0;
+		data.combined_output_count = 0;
+		data.output_count = 0;
   		for_each_connected_output(&amp;data.display, output) {
   			bool found = false;
   			drmModeConnector *connector = output-&gt;config.connector;
-
-			/*
-			 * Bigjoiner will come in to the picture when the
-			 * resolution &gt; 5K or clock &gt; max-dot-clock.
-			 */
   			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);
-
   			if (found) {
-				data.output[count].output_id = output-&gt;id;
-				memcpy(&amp;data.output[count].mode, &amp;mode, sizeof(drmModeModeInfo));
-				count++;
-
-				width = max(width, mode.hdisplay);
-				height = max(height, mode.vdisplay);
+				data.big_joiner_outputs[data.big_joiner_output_count++] = output-&gt;id;
+				igt_output_override_mode(output, &amp;connector-&gt;modes[0]);
+			} else {
+				data.non_big_joiner_outputs[data.non_big_joiner_output_count++] = output-&gt;id;
+				kmstest_get_connector_default_mode(data.drm_fd, connector, &amp;default_mode);
+				igt_output_override_mode(output, &amp;default_mode);
   			}
-			valid_output++;
+			data.output_count++;
+		}
+
+		if (data.big_joiner_output_count == 1 &amp;&amp; data.non_big_joiner_output_count &gt; 0) {
+			data.combined_outputs[data.combined_output_count++] = data.big_joiner_outputs[0];
+			data.combined_outputs[data.combined_output_count++] = data.non_big_joiner_outputs[0];
   		}
   		data.n_pipes = 0;
   		for_each_pipe(&amp;data.display, i) {
   			data.n_pipes++;
-			pipe_seq[j] = i;
+			data.pipe_seq[j] = i;
   			j++;
   		}
-
-		igt_require_f(count &gt; 0, &quot;No output with 5k+ mode (or) clock &gt; max-dot-clock found\n&quot;);
-
-		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR, &amp;data.fb);
   	}
   	igt_describe(&quot;Verify the basic modeset on big joiner mode on all pipes&quot;);
   	igt_subtest_with_dynamic(&quot;basic&quot;) {
-		for (i = 0; i &lt; data.n_pipes - 1; i++) {
-			data.pipe1 = pipe_seq[i];
-			igt_dynamic_f(&quot;pipe-%s&quot;, kmstest_pipe_name(pipe_seq[i]))
-				test_basic_modeset(&amp;data);
+		igt_require_f(data.big_joiner_output_count &gt; 0, &quot;Big joiner output not found\n&quot;);
+		igt_require_f(data.n_pipes &gt; 1, &quot;Minimum of 2 pipes are required\n&quot;);
+
+		for (i = 0; i &lt; data.big_joiner_output_count; i++) {
+			uint64_t num_combinations = 0;
+			Combination combinations[MAX_COMBINATIONS];
+
+			generate_combinations(i+1, data.n_pipes, BIG_JOINER, combinations, &amp;num_combinations);
+			igt_info(&quot;Number of combinations for %d outputs and %d pipes are %ld\n&quot;,
+					 i+1, data.n_pipes, num_combinations);
+
+			if (num_combinations &gt; 0)
+				igt_dynamic_f(&quot;%dx-big-joiner&quot;, i+1)
+					test_basic_modeset(&amp;data, i+1, combinations, num_combinations);
+			else
+				break;
   		}
   	}
-	igt_describe(&quot;Verify if the modeset on the adjoining pipe is rejected &quot;
-		     &quot;when the pipe is active with a big joiner modeset&quot;);
   	igt_subtest_with_dynamic(&quot;invalid-modeset&quot;) {
-		data.pipe1 = pipe_seq[j - 1];
-
-		igt_display_reset(&amp;data.display);
-		for_each_connected_output(&amp;data.display, output) {
-			if (data.output[0].output_id != output-&gt;id)
-				continue;
-
-			mode = data.output[0].mode;
-			igt_output_set_pipe(output, data.pipe1);
-			igt_output_override_mode(output, &amp;mode);
+		igt_require_f(data.big_joiner_output_count &gt; 0, &quot;Big joiner output not found\n&quot;);
+		igt_require_f(data.n_pipes &gt; 1, &quot;Minimum of 2 pipes are required\n&quot;);
-			igt_dynamic_f(&quot;pipe-%s-%s&quot;,
-				      kmstest_pipe_name(data.pipe1),
-				      igt_output_name(output))
-				test_invalid_modeset(&amp;data);
-		}
+		if (data.big_joiner_output_count &gt;= 1)
+			igt_dynamic_f(&quot;big_joiner_on_last_pipe&quot;)
+				tets_big_joiner_on_last_pipe(&amp;data);
-		if(valid_output &gt; 1) {
-			for (i = 0; i &lt; data.n_pipes - 1; i++) {
-				igt_output_t *first_output = NULL, *second_output = NULL;
-
-				data.pipe1 = pipe_seq[i];
-				data.pipe2 = pipe_seq[i + 1];
-
-				igt_display_reset(&amp;data.display);
-				for_each_connected_output(&amp;data.display, output) {
-					if (data.output[0].output_id == output-&gt;id) {
-						first_output = output;
-						mode = data.output[0].mode;
-
-						igt_output_set_pipe(output, data.pipe1);
-						igt_output_override_mode(output, &amp;mode);
-					} else if (second_output == NULL) {
-						second_output = output;
-						igt_output_set_pipe(output, data.pipe2);
-
-						break;
-					}
-				}
-
-				igt_dynamic_f(&quot;pipe-%s-%s-pipe-%s-%s&quot;,
-					      kmstest_pipe_name(data.pipe1),
-					      igt_output_name(first_output),
-					      kmstest_pipe_name(data.pipe2),
-					      igt_output_name(second_output))
-					test_invalid_modeset(&amp;data);
-			}
-		}
-	}
+		if (data.big_joiner_output_count &gt; 1)
+			igt_dynamic_f(&quot;invalid_combinations_with_two_bigjoiner&quot;)
+				test_invalid_modeset_two_joiner(&amp;data, false);
-	igt_describe(&quot;Verify simultaneous modeset on 2 big joiner outputs&quot;);
-	igt_subtest_with_dynamic(&quot;2x-modeset&quot;) {
-		igt_require_f(count &gt; 1, &quot;2 outputs with big joiner modes are required\n&quot;);
-		igt_require_f(data.n_pipes &gt; 3, &quot;Minumum of 4 pipes are required\n&quot;);
-		for (i = 0; (i + 2) &lt; data.n_pipes - 1; i++) {
-			data.pipe1 = pipe_seq[i];
-			data.pipe2 = pipe_seq[i + 2];
-			igt_dynamic_f(&quot;pipe-%s-%s&quot;, kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
-				test_dual_display(&amp;data);
+		if (data.combined_output_count) {
+			igt_dynamic_f(&quot;invalid_combinations_with_bigjoiner_non_bigjoiner&quot;)
+				test_invalid_modeset_two_joiner(&amp;data, true);
   		}
   	}
   	igt_fixture {
-		igt_remove_fb(data.drm_fd, &amp;data.fb);
   		igt_display_fini(&amp;data.display);
   		drm_close_driver(data.drm_fd);
   	}
-- 
2.25.1
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Thanks and Regards
Kunal Joshi
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Thanks and Regards
Kunal Joshi</pre>
      </blockquote>
    </blockquote>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------vsNQvTWNrA94t0tZ0Lp0eJhc--
