Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AB3C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 13:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE2810E059;
	Tue,  5 Mar 2024 13:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqPcNTYR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E989110E059
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709644497; x=1741180497;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1iKWVt6iJ/LV8tHFxAktSDvsXqALpKEE4gCPHunLnNQ=;
 b=KqPcNTYRVg6b7CCmJWqlnAnf8Bvf8uM3QUshlyVrTcy44JiyY6QjS9jh
 MwX54S2ZNpp/nbiF/Q0kiUpAwXKJ3LLSh1GfuGUqPa7aLlDh3qbQM1R8x
 y0Dp84YlZ72BmXLbBgloWKx+BKVPCAOvgKcUJ1rSt4Ops4qhAvJiuJy34
 s/yfL/vuhFBl2SiK2TOCF2BzK2LIe2bq4/iopZn/+3yOU7sRgkYQdxGry
 +my/kgbwNJ5FW/NLdeZh2BXimmb+9jjdGe8NFA7/5gqrWqioc1ojZ5fZm
 hdZwuZHE18WGdGtEdb7YYOFSmZfsqnegrvpJxznKRdes6ASRmCJwvnX9a g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7139010"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="7139010"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 05:14:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="46907130"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 05:14:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 05:14:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 05:14:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 05:14:54 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 05:14:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hr2LCgHxd+1TV5gS/DGvKEdfYka21CBXJ2beJWCrYiD1rksoyCyKbZyudwgfdeJ48wWJcNmiCtQcxPWVXjNwDLxwbKYzQmof9Lq2UocXXUdtv+3mYWo94J5u8bfJ9bg+ijZgD4OcX2pnyx2Nx2UZegykGywu24s3VKmuDqMUNZ2bpcrciVFjHIqZFX+Z5QD1FSUyoYU/G0FvTj26WDCyllOQlQcGX/vdNDJI1Um7AZPycUKNFnMKXDfNGBjIIVjKqokda9c9GoJPXFiUtrknIiPp4NdfrLV9jAbb9NWF1rGmULJLUDVQZSauOM/j8dbUSl2UOSHIAp/pozve5i+8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtN/F16Xs7Ja8jrNm7J9EzKHntx4h1hr+B8iVb4ZuCI=;
 b=muzr5qzUD3SrCo0c4JVVdrZt6r231LAY/6OaZuBHUHugk8aNpwn0M4KRZN9vegbl/bgnNFo86DZLldTqlONMrclfbNutbhilO8jYWv97hs1PXrmy8+B8rjXZnKgSg/X8vaNrAWO9ebBpXNnS7AWwuRSvsD0i3YCWf9gU0gQBnzaCydPbOdCfb813zx/C2RdztLnr78pUqjnA43hMM2MTUkKNdZrIhHrR8tQlfZswNxMoITPYc2YOQZ+cUCg9yiKX6hJux+gyZVMYF3JyILpMyTLcYuxL2LbncrBHVb0Z18kzyMNSTlc8b40K3wISayz8YelTeC6tw3RXp4dJFER0jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Tue, 5 Mar
 2024 13:14:51 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 13:14:51 +0000
Message-ID: <5d9643d5-6d7c-4be1-a705-7566c86293b5@intel.com>
Date: Tue, 5 Mar 2024 18:44:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/intel/kms_big_joiner: revamp
 kms_big_joiner
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: Karthik B S <karthik.b.s@intel.com>
References: <20240303172216.254535-1-kunal1.joshi@intel.com>
 <20240303172216.254535-4-kunal1.joshi@intel.com>
 <93e8badc-b8d1-40ae-a0d1-779746609d31@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <93e8badc-b8d1-40ae-a0d1-779746609d31@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0213.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::7) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|BN9PR11MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cf56fa-38be-4962-a9db-08dc3d163daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: na3Il8kv8IwadUDtE0ZOSx19nlsE4UeunOWzK/co1mQFxlCDKx9B8wLP3Zh7LV9+y+uVKEaSw5FPLw+V8V0OBM1lSkHGkxPzBF7kYMObgs03tEHX7W3BfmS562WUeUcZtP4brnKn44vCKTeyoD/AjYFYG0ARzGvEN6TShGtVPbjlJjbwGSCXXfJ7CA9HhF/ttZAU9fkWvx/atwMICcjDuv5fjWhzQPJKWkLx5MIxHP2DPKacGZJyIYCKsvum6TsTGufD+7VRiLXdP7sFnIXEeGouirJb6sWcOT5+pxeJ31IMxw4znQH8dHlAp9dE8Jv6GPNzY0Kx2ywuqXr6RYnulNpEfg7gl6EHUEjOgUmBwWZHC+1p7mSg56iq/7Kq9PqZuVVBpJ20dMKI36vL/l8F48cZvKIwV0LD/LlITTNDnjxHpFtMr3ET/rXNBpaSFtf6NvhY/F6RIt99HudZutJdrLmtSZp3ET72eAj/hj5UeElv/DwxFIer5xS+DVhRTy9XbKUaTK1C1u/OdWsxxBuuYVh/n8yX2+9ascostBgVQdFA6fhtCpqT/u80ZrZ4l/ldQAa0Ct28vQeKz0oEuM2S3LKpXqjdLXro1W6GW6HsuEDnJJ+enUBWkaf2psUJw0Vf9vv4koc7WL6M41Fdy1rHwQjTl5o2miMe2gKUHjr81+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTVua1FvTll3ZXF6RlVSdkU1V25US2VaQVpKUG00TmpUai9kNjdkaThrT1FB?=
 =?utf-8?B?d0xESzNsU3ZxeURMWU9YSXBlUWR3Y1ovQ1RKb0lZVFJpZUxxeFIwZVZmamp5?=
 =?utf-8?B?d3I0WW1jUnExMGdMS3IyZDU1YVRaOHZqSk1qWGFYOFFtM0lNZi9vK1VhYkF4?=
 =?utf-8?B?R2xMcitDRXRGb0I0Vno4Y1NWQmpOVk1tLytRcUpvSWxYdEdnajNpYzhnRWtH?=
 =?utf-8?B?cHNMVUZsWVNQY2VMNmFISEpmWGZyMEZVcm5teDFKUUhoSmttU1hDRVhrMms4?=
 =?utf-8?B?NFFKYzRHY053NHRJazErNVBlMWxScFRpS0ZreUZzMkYxUHZSMWsxeklacjFP?=
 =?utf-8?B?ZkRaaWlOeVFzK3Vsd3FDaE9LVC9qam95blNMMWhLVEl3UTd1WW1NNFhiWWpj?=
 =?utf-8?B?NDZMdm5xRlV5d29nUlFnNUtYTmZQTFNocG16SFVSRlc1TWlNcnIyK3d6TlRI?=
 =?utf-8?B?OElsWUM3bHMzWkFOaGk1UUxQejlEMGJCbWtnUFAyRlh2OGw3OVRyUE1CS3Br?=
 =?utf-8?B?VXlWUGFNbER6SGx2TGRyUEQyeWtWVTBncVc3U2V6MzQ2bXR2VllKLzQxK3hR?=
 =?utf-8?B?blFJVzhWbkxVSGwvMHNtWTJNVjd0dEMwYW9MRjdEaFlFTVlxMlovN1JsaXRu?=
 =?utf-8?B?NFJyTk5zKzJYQzVwbVJHSEZ6M3hVRjcxNDVqdjBXeXJRaUVEMFdmZGMrUXJH?=
 =?utf-8?B?ZGxtek5LUWFHbFhpUWlqcDlBdG12SUZlYzJ3TDdUc0VrTDJ5YVJvTGtiSjU3?=
 =?utf-8?B?RFc5blVxV3pQSit4NHEvblJ3NXdDcXBTdjFuNHk5dVpOWDBJZUxNckxadlJi?=
 =?utf-8?B?Y2lkSVZxdCszY2NhOHN4Z2Jod1dpUENMdW9kbml6bjdPdFp3S2s4V0g1cFRY?=
 =?utf-8?B?L1VsYzJGb3VBaExtYnloUURnUUJqbktndlJ3Q0hCYUIvaC9HZHJ0YUdTNTVj?=
 =?utf-8?B?QTFRbkEzMnppdGJYMFprOEJubDJORmlFRWtMS2Y5TVlQaDg3cmQvb2pFTW9w?=
 =?utf-8?B?a0NCTllMQW5CdUhYcHlUSkhoUHpZN2paakVxUlZCR2Y1QSttTzkxNWxXbGRY?=
 =?utf-8?B?QTNSUi9uUjArbmRKUmFuaVZ2OFI3M216c3JCdzl5QVdNTDVVL1Z3WENyRTc5?=
 =?utf-8?B?MjBoNGxqTmFMdis0T084M2pKMUdXZzNTRXFESlNMRDR4dTNjSERsR25SOVph?=
 =?utf-8?B?bVkzWHdIbWpnV0tzaFlmcVMvaUZsejNGZllmMVo2bFhtQ2ErblRuVTBxbStK?=
 =?utf-8?B?TmV2bTViL0NlcVZRVzh2aWl3TnAyWEJCcFpRemFoeDRxaURDU0xDRVlTZjQw?=
 =?utf-8?B?aVE2eDFROCtBN0xheFUyTmZOamJCcGdieWtPWE9QSkRSSUJrOXJFSjZucVE4?=
 =?utf-8?B?YXlHWnhQdnVXd01QN1huVkRxVjdKMGxoTjVYS2FZRGZNS2NtcFkrZjNWb011?=
 =?utf-8?B?Y21nUjVBQzhUMnZaUmFXNmNqNWJ2N1BzbDJPcVhlQnRuRklHSkdEWE1TR1l2?=
 =?utf-8?B?WkU0WFlpNW1tMDFISVhrQXQvUzJwRWVxODhVeG9HM3NHQkVNODhVekZIdE8w?=
 =?utf-8?B?eXNBMUJrMFM5Q2JEUjBJUTJGYXpkNExlYW03WExGUkViVFFOMXZmVnZiVDNa?=
 =?utf-8?B?aTdEQXNDVkFmMVo2RXowNitITzZiTkVMblNmRkpyODhNT3BhN0Q4LzZvMTlu?=
 =?utf-8?B?S0ZjRDB2MUtwTjJ5a2RHS1VTY3UyRlNZSXNFM2duZWFJcThFYkthVlk0SDZk?=
 =?utf-8?B?SkZDUWwzRkZkMi9XL3hDTUk5YUJKRWlmU3hyVUM2TnZXdWZyRkdyNEJFYlNY?=
 =?utf-8?B?bzZBWG1QbGVlN3VaNmhaQ3JJU1U2L0ZDOHhIVlBPRnJOWVo4Wm1qcDVBTmJi?=
 =?utf-8?B?MjArUDRDUTVzQWJjazF4TFJUL3FXRm85dEo1dXJraFRHOVZGOFc2K01PNWZa?=
 =?utf-8?B?TEhZVnpjN2ozemplS1lvVzFXTGROM3pCbE5oYTgrTExpWGZNd2JRbW54dzQx?=
 =?utf-8?B?U1ZkbmliZWZzbzg1KzQyNGRGZEtjV1p1aEs5QUNjbWIvK3plNlI5cUp2Njc5?=
 =?utf-8?B?QWZIbnd1VVZEeXQxSlYwQlk2Vncvd0l2eUVtb0VnaENMeGx3bndPM29QZzdS?=
 =?utf-8?Q?36vlRX9+oP7QbUxpMLIRfCBH8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cf56fa-38be-4962-a9db-08dc3d163daa
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 13:14:51.6715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHWVUsaLSw01N57qwPslyGH36+tj1GaHTQ9GBfQBF0k0dn0KVYSfkJ8K2+GfZnX+7mvMNRrF/wOG1fQzLTsmfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
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

On 3/5/2024 5:14 PM, Modem, Bhanuprakash wrote:
> Hi Kunal,
>
> On 03-03-2024 10:52 pm, Kunal Joshi wrote:
>> big joiner outputs are statically assigned to pipe,
>> assign dynamically also add support for forcing
>> joiner, support for forcing joiner was introduced with
>> below kmd patch
>>
>> drm/i915: Add bigjoiner force enable option to debugfs
>>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   tests/intel/kms_big_joiner.c | 494 +++++++++++++++++++----------------
>>   1 file changed, 270 insertions(+), 224 deletions(-)
>>
>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
>> index 28678b958..a4f6b8782 100644
>> --- a/tests/intel/kms_big_joiner.c
>> +++ b/tests/intel/kms_big_joiner.c
>> @@ -1,27 +1,6 @@
>> +/* SPDX-License-Identifier: MIT */
>>   /*
>> - * Copyright © 2020 Intel Corporation
>> - *
>> - * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> - * copy of this software and associated documentation files (the 
>> "Software"),
>> - * to deal in the Software without restriction, including without 
>> limitation
>> - * the rights to use, copy, modify, merge, publish, distribute, 
>> sublicense,
>> - * and/or sell copies of the Software, and to permit persons to whom 
>> the
>> - * Software is furnished to do so, subject to the following conditions:
>> - *
>> - * The above copyright notice and this permission notice (including 
>> the next
>> - * paragraph) shall be included in all copies or substantial 
>> portions of the
>> - * Software.
>> - *
>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
>> EVENT SHALL
>> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES 
>> OR OTHER
>> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
>> ARISING
>> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
>> OTHER DEALINGS
>> - * IN THE SOFTWARE.
>> - *
>> - * Author:
>> - *  Karthik B S <karthik.b.s@intel.com>
>> + * Copyright © 2024 Intel Corporation
>
> I think, we don't need to touch the license part.
>
> @kmail JFYI

@kmail please let me know if this needs to be updated or not
will remove in the next revision for now

>
>>    */
>>     /**
>> @@ -37,22 +16,36 @@
>>   #include "igt.h"
>>     /**
>> - * SUBTEST: invalid-modeset
>> - * Description: Verify if the modeset on the adjoining pipe is 
>> rejected when
>> - *              the pipe is active with a big joiner modeset
>> - *
>>    * SUBTEST: basic
>>    * Description: Verify the basic modeset on big joiner mode on all 
>> pipes
>>    *
>> - * SUBTEST: 2x-modeset
>> - * Description: Verify simultaneous modeset on 2 big joiner outputs
>> + * SUBTEST: force-joiner-basic
>> + * Description: Verify the basic modeset on force joiner mode on all 
>> pipes
>> + *
>> + * SUBTEST: invalid-modeset
>> + * Description: Verify the invalid modeset on big joiner mode on all 
>> pipes
>> + *
>> + * SUBTEST: force-joiner-invalid-modeset
>> + * Description: Verify the invalid modeset on force joiner mode on 
>> all pipes
>>    */
>> +IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
>>   -IGT_TEST_DESCRIPTION("Test big joiner");
>> +#define MAX_OUTPUTS 256
>> +#define MAX_COMBINATIONS 1000
>> +#define INVALID_TEST_OUTPUT 2
>> +typedef struct {
>> +    int combination[MAX_OUTPUTS];
>> +} Combination;
>>   -struct bigjoiner_output {
>> -    uint32_t output_id;
>> -    drmModeModeInfo mode;
>> +enum tests {
>> +    BASIC,
>> +    INVALID_MODESET,
>> +    INVALID,
>> +};
>> +
>> +enum joiner_type {
>> +    BIG_JOINER = 1 << 1,
>> +    INVALID_JOINER = -1,
>>   };
>>     typedef struct {
>> @@ -60,273 +53,326 @@ typedef struct {
>>       igt_display_t display;
>>       struct igt_fb fb;
>>       int n_pipes;
>> -    enum pipe pipe1;
>> -    enum pipe pipe2;
>> -    struct bigjoiner_output output[2];
>> +    uint64_t big_joiner_outputs[IGT_MAX_PIPES];
>> +    uint64_t non_big_joiner_outputs[IGT_MAX_PIPES];
>> +    uint64_t combined_outputs[IGT_MAX_PIPES];
>> +    int big_joiner_output_count;
>> +    int non_big_joiner_output_count;
>> +    int combined_output_count;
>> +    int output_count;
>> +    enum pipe pipe_seq[IGT_MAX_PIPES];
>>   } data_t;
>>     static int max_dotclock;
>>   -static void test_invalid_modeset(data_t *data)
>> +static bool output_supports_force_joiner(igt_output_t *output)
>>   {
>> -    igt_output_t *output;
>> -    igt_display_t *display = &data->display;
>> -    int ret;
>> +    return output->config.connector->connector_type ==
>> +           DRM_MODE_CONNECTOR_DisplayPort ||
>> +           output->config.connector->connector_type ==
>> +           DRM_MODE_CONNECTOR_eDP;
>> +}
>
> I think, this is not a source of truth. Perhaps, you can just check if 
> debugfs is present or not.
Will address in next revision.
>
>>   -    igt_info("Bigjoiner test on ");
>> -    for_each_connected_output(display, output){
>> -        enum pipe p = output->pending_pipe;
>> -        drmModeModeInfo *mode;
>> -        igt_pipe_t *pipe;
>> -        igt_plane_t *plane;
>> +static void generate_combinations(int output_count, int pipe_count,
>> +                  int pipes_per_output,
>> +                  Combination combinations[MAX_COMBINATIONS],
>> +                  uint64_t *num_combinations)
>
> If possible, can you please add some documentation? I am not able to 
> understand this logic.
Sure will add.
>
>
>> +{
>> +    int i, index;
>> +    int current_combination[MAX_OUTPUTS];
>>   -        if (p == PIPE_NONE)
>> -            continue;
>> +    for (i = 0; i < output_count; ++i)
>> +        current_combination[i] = i * pipes_per_output;
>>   -        mode = igt_output_get_mode(output);
>> -        igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), 
>> igt_output_name(output));
>> -        kmstest_dump_mode(mode);
>> +    while (current_combination[0] <= pipe_count - output_count * 
>> pipes_per_output) {
>> +        for (i = 0; i < output_count; ++i)
>> +            combinations[*num_combinations].combination[i] = 
>> current_combination[i];
>>   -        pipe = &display->pipes[p];
>> -        plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +        (*num_combinations)++;
>>   -        igt_plane_set_fb(plane, &data->fb);
>> -        igt_fb_set_size(&data->fb, plane, mode->hdisplay, 
>> mode->vdisplay);
>> -        igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>> -    }
>> +        index = output_count - 1;
>> +        while (index >= 0 && current_combination[index] == 
>> pipe_count - (output_count - index) * pipes_per_output)
>> +            index--;
>>   -    igt_assert(!igt_check_bigjoiner_support(display));
>> +        if (index < 0)
>> +            break;
>>   -    /* This commit is expectd to fail as this pipe is being used 
>> for big joiner */
>> -    ret = igt_display_try_commit_atomic(display, 
>> DRM_MODE_ATOMIC_TEST_ONLY |
>> -                        DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +        current_combination[index]++;
>> +        for (i = index + 1; i < output_count; ++i)
>> +            current_combination[i] = current_combination[i - 1] + 
>> pipes_per_output;
>> +    }
>> +}
>>   -    igt_display_reset(&data->display);
>> -    igt_display_commit2(display, COMMIT_ATOMIC);
>> +static igt_output_t *get_output_by_id(data_t *data, uint64_t output_id)
>> +{
>> +    igt_output_t *output;
>>   -    igt_assert_lt(ret, 0);
>> +    for_each_connected_output(&data->display, output) {
>> +        if (output->id == output_id)
>> +            return output;
>> +    }
>> +    igt_assert("Output not found\n");
>
> igt_assert without condition?
Expectation is to always find output with given id, if not assert
Probably will change the name of the function
get_output_by_id_or_assert()
>
>> +    return NULL;
>>   }
>>   -static void test_basic_modeset(data_t *data)
>> +static void test_invalid_modeset_two_joiner(data_t *data, bool 
>> force_joiner,
>> +                        bool combined)
>>   {
>> +    int i, j, ret;
>> +    igt_output_t *output;
>> +    uint64_t *outputs;
>> +    igt_plane_t *primary[INVALID_TEST_OUTPUT];
>> +    igt_fb_t fb[INVALID_TEST_OUTPUT];
>>       drmModeModeInfo *mode;
>> -    igt_output_t *output, *bigjoiner_output = NULL;
>> -    igt_display_t *display = &data->display;
>> -    igt_pipe_t *pipe;
>> -    igt_plane_t *plane;
>> -
>> -    igt_display_reset(display);
>>   -    for_each_connected_output(display, output) {
>> -        if (data->output[0].output_id == output->id) {
>> -            bigjoiner_output = output;
>> -            break;
>> +    outputs = force_joiner ? data->non_big_joiner_outputs :
>> +          combined ? data->combined_outputs : data->big_joiner_outputs;
>> +
>> +    for (i = 0; i < data->n_pipes-1; i++) {
>> +        igt_display_reset(&data->display);
>> +        for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>> +            output = get_output_by_id(data, outputs[j]);
>> +            igt_assert(output);
>> +            if (force_joiner) {
>> +                igt_force_bigjoiner_enable(data->drm_fd, 
>> output->name, true);
>> + igt_assert(igt_check_force_bigjoiner_status(data->drm_fd, 
>> output->name) == 1);
>> +            }
>> +            igt_output_set_pipe(output, data->pipe_seq[i + j]);
>> +            mode = igt_output_get_mode(output);
>> +            igt_info(" Assigning pipe %s to %s with mode %dx%d@%d%s",
>> +                 kmstest_pipe_name(data->pipe_seq[i + j]),
>> +                 igt_output_name(output), mode->hdisplay,
>> +                 mode->vdisplay, mode->vrefresh,
>> +                 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
>> +            primary[j] = igt_output_get_plane_type(output, 
>> DRM_PLANE_TYPE_PRIMARY);
>> +            igt_create_pattern_fb(data->drm_fd, mode->hdisplay, 
>> mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +                                  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>> +            igt_plane_set_fb(primary[j], &fb[j]);
>> +        }
>> +        ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> +        igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>> +        if (force_joiner) {
>> +            for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>> +                output = get_output_by_id(data, outputs[j]);
>> +                igt_assert(output);
>> +                igt_force_bigjoiner_enable(data->drm_fd, 
>> output->name, false);
>> + igt_assert(igt_check_force_bigjoiner_status(data->drm_fd, 
>> output->name) == 0);
>> +            }
>>           }
>>       }
>> -
>> -    igt_output_set_pipe(bigjoiner_output, data->pipe1);
>> -
>> -    mode = &data->output[0].mode;
>> -    igt_output_override_mode(bigjoiner_output, mode);
>> -
>> -    pipe = &display->pipes[data->pipe1];
>> -    plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> -
>> -    igt_plane_set_fb(plane, &data->fb);
>> -    igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>> -    igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>> -
>> -    igt_display_commit2(display, COMMIT_ATOMIC);
>> -
>> -    igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
>> -    igt_plane_set_fb(plane, NULL);
>> -    igt_display_commit2(display, COMMIT_ATOMIC);
>>   }
>>   -static void test_dual_display(data_t *data)
>> +static void tets_big_joiner_on_last_pipe(data_t *data, bool 
>> force_joiner)
>>   {
>> +    int i, len, ret;
>> +    uint64_t *outputs;
>> +    igt_output_t *output;
>> +    igt_plane_t *primary;
>> +    igt_fb_t fb;
>>       drmModeModeInfo *mode;
>> -    igt_output_t *output, *bigjoiner_output[2];
>> -    igt_display_t *display = &data->display;
>> -    igt_pipe_t *pipe;
>> -    igt_plane_t *plane1, *plane2;
>> -    int count = 0;
>>   -    igt_display_reset(display);
>> +    len = force_joiner ? data->non_big_joiner_output_count : 
>> data->big_joiner_output_count;
>> +    outputs = force_joiner ? data->non_big_joiner_outputs : 
>> data->big_joiner_outputs;
>>   -    for_each_connected_output(display, output) {
>> -        if (data->output[count].output_id == output->id) {
>> -            bigjoiner_output[count] = output;
>> -            count++;
>> +    for (i = 0; i < len; i++) {
>> +        igt_display_reset(&data->display);
>> +        output = get_output_by_id(data, outputs[i]);
>> +        if (force_joiner) {
>> +            igt_force_bigjoiner_enable(data->drm_fd, output->name, 
>> true);
>> + igt_assert(igt_check_force_bigjoiner_status(data->drm_fd, 
>> output->name) == 1);
>>           }
>> -
>> -        if (count > 1)
>> -            break;
>> +        igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
>> +        mode = igt_output_get_mode(output);
>> +        igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
>> + kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
>> +                 igt_output_name(output), mode->hdisplay,
>> +                 mode->vdisplay, mode->vrefresh);
>> +        primary = igt_output_get_plane_type(output, 
>> DRM_PLANE_TYPE_PRIMARY);
>> +        igt_create_pattern_fb(data->drm_fd, mode->hdisplay, 
>> mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +                              DRM_FORMAT_MOD_LINEAR, &fb);
>> +        igt_plane_set_fb(primary, &fb);
>> +        ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> +        igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>       }
>> +    if (force_joiner) {
>> +        for (i = 0; i < len; i++) {
>> +            output = get_output_by_id(data, outputs[i]);
>> +            igt_force_bigjoiner_enable(data->drm_fd, output->name, 
>> false);
>> +        }
>> +    }
>> +}
>>   -    igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
>> -    igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
>> -
>> -    /* Set up first big joiner output on Pipe A*/
>> -    mode = &data->output[0].mode;
>> -    igt_output_override_mode(bigjoiner_output[0], mode);
>> -
>> -    pipe = &display->pipes[data->pipe1];
>> -    plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> -
>> -    igt_plane_set_fb(plane1, &data->fb);
>> -    igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
>> -    igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
>> -
>> -    /* Set up second big joiner output on Pipe C*/
>> -    mode = &data->output[1].mode;
>> -    igt_output_override_mode(bigjoiner_output[1], mode);
>> -
>> -    pipe = &display->pipes[data->pipe2];
>> -    plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> -
>> -    igt_plane_set_fb(plane2, &data->fb);
>> -    igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
>> -    igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
>> -
>> -    igt_display_commit2(display, COMMIT_ATOMIC);
>> +static void test_basic_modeset(data_t *data, int num_outputs,
>> +                   Combination combinations[MAX_COMBINATIONS],
>> +                   uint64_t num_combinations, bool force_joiner)
>> +{
>> +    int i, j, ret;
>> +    igt_display_t *display = &data->display;
>> +    igt_output_t *output[num_outputs];
>> +    igt_plane_t *primary[num_outputs];
>> +    igt_fb_t fb[num_outputs];
>> +    drmModeModeInfo *mode;
>>   -    /* Clean up */
>> -    igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
>> -    igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
>> -    igt_plane_set_fb(plane1, NULL);
>> -    igt_plane_set_fb(plane2, NULL);
>> -    igt_display_commit2(display, COMMIT_ATOMIC);
>> +    for (i = 0; i < num_combinations; i++) {
>> +        igt_display_reset(display);
>> +        for (j = 0; j < num_outputs; j++) {
>> +            output[j] = get_output_by_id(data,
>> +                             force_joiner ?
>> +                             data->non_big_joiner_outputs[j] :
>> +                             data->big_joiner_outputs[j]);
>> +            if (force_joiner) {
>> +                igt_force_bigjoiner_enable(data->drm_fd,
>> +                               output[j]->name, true);
>
> Do we need to check the sysfs write status? since this helper has the 
> return type as non-void.
Yes we can check but here we are checking the status to see whether 
write was successful,
Maybe i can combine both igt_force_bigjoiner_enable and 
igt_check_force_bigjoiner_status

>
>> + igt_assert(igt_check_force_bigjoiner_status(data->drm_fd,
>> +                                        output[j]->name) == 1);
>> +            }
>> +            igt_info("Assigning pipe %d to %s%s",
>> + data->pipe_seq[combinations[i].combination[j]],
>
> Let's print the pipe name which is more redable than index.
Yes this was a miss, have done it in rest of the places,
Will fix it in next revision
>
>> +                 output[j]->name, j == num_outputs - 1 ? "\n" : ", ");
>> +            igt_output_set_pipe(output[j], 
>> data->pipe_seq[combinations[i].combination[j]]);
>> +            primary[j] = igt_output_get_plane_type(output[j], 
>> DRM_PLANE_TYPE_PRIMARY);
>> +            mode = igt_output_get_mode(output[j]);
>> +            igt_create_pattern_fb(data->drm_fd, mode->hdisplay, 
>> mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +                                  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>> +            igt_plane_set_fb(primary[j], &fb[j]);
>> +        }
>> +        ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>> +        if (ret == 0)
>> +            igt_display_commit2(display, COMMIT_ATOMIC);
>
> This commit is not required.
Ok will remove this.
>
>
>> +        else
>> +            igt_assert_f(ret == 0, "Commit failed\n");
>> +
>> +        if (force_joiner) {
>> +            for (j = 0; j < num_outputs; j++) {
>> +                igt_force_bigjoiner_enable(data->drm_fd, 
>> output[j]->name, false);
>> + igt_assert(igt_check_force_bigjoiner_status(data->drm_fd, 
>> output[j]->name) == 0);
>> +            }
>> +        }
>> +    }
>>   }
>>     igt_main
>>   {
>> +    int i, j;
>>       data_t data;
>>       igt_output_t *output;
>> -    drmModeModeInfo mode;
>> -    int valid_output = 0, i, count = 0, j = 0;
>> -    uint16_t width = 0, height = 0;
>> -    enum pipe pipe_seq[IGT_MAX_PIPES];
>>   +    i = j = 0;
>>       igt_fixture {
>>           data.drm_fd = drm_open_driver_master(DRIVER_INTEL | 
>> DRIVER_XE);
>>           kmstest_set_vt_graphics_mode();
>> -
>>           igt_display_require(&data.display, data.drm_fd);
>>           igt_require(data.display.is_atomic);
>> -
>>           max_dotclock = igt_get_max_dotclock(data.drm_fd);
>> +        data.big_joiner_output_count = 0;
>> +        data.non_big_joiner_output_count = 0;
>> +        data.combined_output_count = 0;
>> +        data.output_count = 0;
>>             for_each_connected_output(&data.display, output) {
>>               bool found = false;
>>               drmModeConnector *connector = output->config.connector;
>> -
>> -            /*
>> -             * Bigjoiner will come in to the picture when the
>> -             * resolution > 5K or clock > max-dot-clock.
>> -             */
>>               found = bigjoiner_mode_found(data.drm_fd, connector, 
>> max_dotclock);
>> -
>>               if (found) {
>> -                data.output[count].output_id = output->id;
>> -                memcpy(&data.output[count].mode, &mode, 
>> sizeof(drmModeModeInfo));
>> -                count++;
>> -
>> -                width = max(width, mode.hdisplay);
>> -                height = max(height, mode.vdisplay);
>> + data.big_joiner_outputs[data.big_joiner_output_count++] = output->id;
>> +                igt_output_override_mode(output, &connector->modes[0]);
>> +            } else {
>> +                if (output_supports_force_joiner(output)) {
>> + data.non_big_joiner_outputs[data.non_big_joiner_output_count++] = 
>> output->id;
>> +                    igt_sort_connector_modes(connector, 
>> sort_drm_modes_by_res_dsc);
>
> Do we really need to sort the connector modes?
Yes bigjoiner_mode_found will sort the mode first by res then by clock
If this is non big joiner output then it will be currently sorted by clock
Maybe i can check if there is connector reset which sets how it was default.
>
>> + igt_output_override_mode(output, &connector->modes[0]);
>> +                }
>>               }
>> -            valid_output++;
>> +            data.output_count++;
>>           }
>>             data.n_pipes = 0;
>>           for_each_pipe(&data.display, i) {
>>               data.n_pipes++;
>> -            pipe_seq[j] = i;
>> +            data.pipe_seq[j] = i;
>>               j++;
>>           }
>> -
>> -        igt_require_f(count > 0, "No output with 5k+ mode (or) clock 
>> > max-dot-clock found\n");
>> -
>> -        igt_create_pattern_fb(data.drm_fd, width, height, 
>> DRM_FORMAT_XRGB8888,
>> -                      DRM_FORMAT_MOD_LINEAR, &data.fb);
>>       }
>>         igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>>       igt_subtest_with_dynamic("basic") {
>> -        for (i = 0; i < data.n_pipes - 1; i++) {
>> -            data.pipe1 = pipe_seq[i];
>> -            igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
>> -                test_basic_modeset(&data);
>> +        igt_require_f(data.big_joiner_output_count > 0, "Big joiner 
>> output not found\n");
>> +        igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are 
>> required\n");
>> +
>> +        for (i = 0; i < data.big_joiner_output_count; i++) {
>> +            uint64_t num_combinations = 0;
>> +            Combination combinations[MAX_COMBINATIONS];
>> +
>> +            generate_combinations(i+1, data.n_pipes, BIG_JOINER, 
>> combinations, &num_combinations);
>> +            igt_info("Number of combinations for %d outputs and %d 
>> pipes are %ld\n",
>> +                     i+1, data.n_pipes, num_combinations);
>> +
>> +            if (num_combinations > 0)
>> +                igt_dynamic_f("%dx-big-joiner", i+1)
>> +                    test_basic_modeset(&data, i+1, combinations, 
>> num_combinations, false);
>> +            else
>> +                break;
>
> IMHO, we need to split this patch into 2:
> 1- Rewamp existing subtests
> 2- Add new subtests for forcejoiner
>
Ok will split.
>
>>           }
>>       }
>>   -    igt_describe("Verify if the modeset on the adjoining pipe is 
>> rejected "
>> -             "when the pipe is active with a big joiner modeset");
>> -    igt_subtest_with_dynamic("invalid-modeset") {
>> -        data.pipe1 = pipe_seq[j - 1];
>> -
>> -        igt_display_reset(&data.display);
>> -        for_each_connected_output(&data.display, output) {
>> -            if (data.output[0].output_id != output->id)
>> -                continue;
>> -
>> -            mode = data.output[0].mode;
>> -            igt_output_set_pipe(output, data.pipe1);
>> -            igt_output_override_mode(output, &mode);
>> -
>> -            igt_dynamic_f("pipe-%s-%s",
>> -                      kmstest_pipe_name(data.pipe1),
>> -                      igt_output_name(output))
>> -                test_invalid_modeset(&data);
>> +    igt_describe("Verify the basic modeset on big joiner mode on all 
>> pipes");
>> +    igt_subtest_with_dynamic("force-joiner-basic") {
>> + igt_require_f(intel_display_ver(intel_get_drm_devid(data.drm_fd)) 
>> >= 11,
>> +                              "force joiner not supported on this 
>> platform\n");
>> +        igt_require_f(data.non_big_joiner_output_count > 0, "Big 
>> joiner output not found\n");
>> +        igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are 
>> required\n");
>> +
>> +        for (i = 0; i < data.non_big_joiner_output_count; i++) {
>> +            uint64_t num_combinations = 0;
>> +            Combination combinations[MAX_COMBINATIONS];
>> +
>> +            generate_combinations(i+1, data.n_pipes, BIG_JOINER, 
>> combinations, &num_combinations);
>> +            igt_info("Number of combinations for %d outputs and %d 
>> pipes are %ld\n",
>> +                     i+1, data.n_pipes, num_combinations);
>> +
>> +            if (num_combinations > 0)
>> +                igt_dynamic_f("%dx-joiner", i+1)
>> +                    test_basic_modeset(&data, i+1, combinations, 
>> num_combinations, true);
>> +            else
>> +                break;
>>           }
>> +    }
>>   -        if(valid_output > 1) {
>> -            for (i = 0; i < data.n_pipes - 1; i++) {
>> -                igt_output_t *first_output = NULL, *second_output = 
>> NULL;
>> -
>> -                data.pipe1 = pipe_seq[i];
>> -                data.pipe2 = pipe_seq[i + 1];
>> -
>> -                igt_display_reset(&data.display);
>> -                for_each_connected_output(&data.display, output) {
>> -                    if (data.output[0].output_id == output->id) {
>> -                        first_output = output;
>> -                        mode = data.output[0].mode;
>> +    igt_subtest_with_dynamic("invalid-modeset") {
>> +        igt_require_f(data.big_joiner_output_count > 0, "Big joiner 
>> output not found\n");
>> +        igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are 
>> required\n");
>>   -                        igt_output_set_pipe(output, data.pipe1);
>> -                        igt_output_override_mode(output, &mode);
>> -                    } else if (second_output == NULL) {
>> -                        second_output = output;
>> -                        igt_output_set_pipe(output, data.pipe2);
>> +        if (data.big_joiner_output_count >= 1)
>> +            igt_dynamic_f("big_joiner_on_last_pipe")
>> +                tets_big_joiner_on_last_pipe(&data, false);
>>   -                        break;
>> -                    }
>> -                }
>> +        if (data.big_joiner_output_count > 1)
>> +            igt_dynamic_f("invalid_combinations")
>> +                test_invalid_modeset_two_joiner(&data, false, false);
>>   -                igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
>> -                          kmstest_pipe_name(data.pipe1),
>> -                          igt_output_name(first_output),
>> -                          kmstest_pipe_name(data.pipe2),
>> -                          igt_output_name(second_output))
>> -                    test_invalid_modeset(&data);
>> -            }
>> +        if (data.big_joiner_output_count == 1 && 
>> data.non_big_joiner_output_count > 0) {
>> +            data.combined_outputs[data.combined_output_count++] = 
>> data.big_joiner_outputs[0];
>> +            data.combined_outputs[data.combined_output_count++] = 
>> data.non_big_joiner_outputs[0];
>
> Probably, move this logic to igt_fixture & use as:
> if (data.combined_output_count)
Sure
>
>> + test_invalid_modeset_two_joiner(&data, false, true);
>
> igt_dynamic() is missing.
Ahh, thanks for the catch.
>
> - Bhanu
>
>>           }
>>       }
>>   -    igt_describe("Verify simultaneous modeset on 2 big joiner 
>> outputs");
>> -    igt_subtest_with_dynamic("2x-modeset") {
>> -        igt_require_f(count > 1, "2 outputs with big joiner modes 
>> are required\n");
>> -        igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are 
>> required\n");
>> -        for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
>> -            data.pipe1 = pipe_seq[i];
>> -            data.pipe2 = pipe_seq[i + 2];
>> -            igt_dynamic_f("pipe-%s-%s", 
>> kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
>> -                test_dual_display(&data);
>> -        }
>> +    igt_subtest_with_dynamic("force-joiner-invalid-modeset") {
>> + igt_require_f(intel_display_ver(intel_get_drm_devid(data.drm_fd)) 
>> >= 11,
>> +                              "force joiner not supported on this 
>> platform\n");
>> +        igt_require_f(data.non_big_joiner_output_count > 0, "Non big 
>> joiner output not found\n");
>> +        igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are 
>> required\n");
>> +
>> +        if (data.non_big_joiner_output_count >= 1)
>> +            igt_dynamic_f("big_joiner_on_last_pipe")
>> +                tets_big_joiner_on_last_pipe(&data, true);
>> +
>> +        if (data.non_big_joiner_output_count > 1)
>> +            igt_dynamic_f("invalid_combinations")
>> +                test_invalid_modeset_two_joiner(&data, true, false);
>>       }
>>         igt_fixture {
>> -        igt_remove_fb(data.drm_fd, &data.fb);
>>           igt_display_fini(&data.display);
>>           drm_close_driver(data.drm_fd);
>>       }
Thanks and Regards
Kunal Joshi
