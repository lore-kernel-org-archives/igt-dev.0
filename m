Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE506C48297
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 08:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAE610EE8F;
	Fri,  9 Feb 2024 08:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahfIuhBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A4810EE8F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 08:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707466338; x=1739002338;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=lFQtotrvK3WeRtwU0SxKjKMXQyGZVvSSeACO3zOJ4dw=;
 b=ahfIuhBMT3x+lQ3Xsh9qBvkXSL6px/OgjTbecmc/tvKmxhClf0XxXXoM
 io7rkCnXRyZHSLXoOibjjV1dCYfBIJJZMD4441AaTgsweogyIj/m5uAAx
 0JsSd91wChyoXaTcTmt1qJ+cQkerlhABEGNOoh3vZ6EiVuFbHd4VvgeZh
 8LknrkOo1Wj7l+m1Gqsck/tATJo/kkCLdybgunU2CchTRKrUtcYu0Yg5q
 MF7N9b9L+6eCpk3RhAwVJd6t417KbUylAptzH3Bfz4HKUtab7XXxwpRdl
 j9StvHOrzPQjqKAZNe31K8zRMQsQSeOoA7+QzT/A7/9j4OvzXjN2ZI2PK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12035220"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208,217";a="12035220"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 00:12:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="910628307"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
 d="scan'208,217";a="910628307"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2024 00:12:16 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 00:12:15 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 00:12:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 00:12:15 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 9 Feb 2024 00:12:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXR9BwvS8ZR30+Nbr9UleYWulcB6ik8YgyWaNe4uIi3IAhzT46+S3/CwdojWGdRfPqV5F60SpDZw5VNcNgX+zhLifA5sid5yg6hhaYtlJ6IDgw0q0doOF0w9TiU2Reh5o4W+9TP2te2JwH6kg6Zq/gopKVmi140iG27qAbtf5Ldq2zQRpMaf0RU9Yt4B69bEESHyL4ubfny64dDp8rEV+ifa89zbbJwi7KM2KMfRcy9M4zBEz4tLdOyz0/sKIugKL+tNd0jOkk5NHxdVdxTQzS4+KCAuYaWga9aet7Mg4sTyM/6PkxPEcTGDMI1sHBvTAnBGsINfLBtDbVqiowIbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIeatzCITuzVbh4ZRmqzjDF58N2XSBICwn5D1HUQPFc=;
 b=OiSHUZ51xYrNyLBzH4wVx/aON2kPKi8pjdo89uu32w9COWVMd3Lgp+MR+IeAiqhaOvIWPhTZqdDcDIcrUIs5E2aznxRZSJSAKyK/nGdQd7p9vQUECx9pbCUkADJRf2l4SnCaRzUTwtKFfycUVp7Czj1+kom0dB3oF3XuzXVV+asOCb3aTt00nnBYUzAz8jCm+7kvnYhIrSNc2UFVEeJlwgRr2zbXxIYwztC0FV/u4JbuuxmPXRjffw4WSZpoOw3ZFBqt4FWHJMy2h97ZS3ibCEQLNweLrYNxrDijo88tYMGluTO919QS8dsBWKUpzQMtgYqMDiLGkBJRV8BmZ3DrWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Fri, 9 Feb
 2024 08:12:11 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7249.038; Fri, 9 Feb 2024
 08:12:11 +0000
Content-Type: multipart/alternative;
 boundary="------------Kg3tPO0XPLwyP7BIl9CmMbJv"
Message-ID: <eea52bda-04e8-4d22-95bc-d3bc50858abc@intel.com>
Date: Fri, 9 Feb 2024 13:42:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/igt_psr: modify library to support multiple
 PSR/PR outputs
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
References: <20240207135319.1880229-1-kunal1.joshi@intel.com>
 <20240207135319.1880229-3-kunal1.joshi@intel.com>
 <cc5962a888e5b9dd5c0546a04cb3adb5f1588d92.camel@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <cc5962a888e5b9dd5c0546a04cb3adb5f1588d92.camel@intel.com>
X-ClientProxiedBy: PN3PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::6) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|MN6PR11MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c00e119-9a9f-4244-bb31-08dc2946d0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cCY/7a6C+mhhFUPQBdoM5c3lSBhQ2xZlEmqYUVRiQpJClsPsC61Sn7IcSdhArMEXXPObitYSwjNsTDBSpn9p/Gp4hO6o46lBb3uk1ug8T9OcjCNtFcAGhlDOVCcUw/FVqT9pUej8AsPOWR9x2xlUiXg6KZV6RXYzJQTvFZpn1Dhbzag/Fxa/96YMrWuH5v6fbUONmzu1ADYo6/QvQzkLQ5PnQD7XejfyS/YP3iY5OJQjKwocEo9m37Xsncr4Mzns7Lh6PfbZUcs2g/S4SLzqSdRYsTdkQS6IlZJ5c/anz8hGUQqGNf9RS+N2oehvPxdL7nKdPF5wJN9tLedqPDdDnz1oaL9WMp0JjBjGmELhneICBCBKpVzeUutU50yZWpIfFeOCjxxTqMmeElyFURKBBML+JSlW4NKpm0S0fa6kVc73HPALtdzF54WVIQFicqoFaD/AHXJFJRUezb1RteC9xa9QQTMf40Anpdk3JMELzbq0wQIRmQd5CkhYcRWGJLNKQrezZ6hgPR+Zy3SMRc9Q49pReCtMTMXU8kh0hVZqvqjs0I5MLTWYy5CNnoa8N1IL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(4326008)(478600001)(33964004)(53546011)(6512007)(6506007)(6486002)(31686004)(41300700001)(5660300002)(30864003)(2906002)(54906003)(66476007)(110136005)(66946007)(6666004)(316002)(66556008)(8936002)(66574015)(8676002)(83380400001)(31696002)(86362001)(82960400001)(2616005)(107886003)(26005)(38100700002)(36756003)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXVIMUIzdzVpaEVtMCtzTFFvaS9KdGF3WTd3TERSS3lDNEEyYmZ4eWVvYzZw?=
 =?utf-8?B?ZlhJblVqZTJXZi9XMmhLVk5uSkNjSmZsUGE1L3BNYjZOSTFRUXYrUmJsK3d2?=
 =?utf-8?B?Z3Zzdnp6MG5xaHNZM0VQRTJwbTRRUjhPVDJKRVpyYnF1Q2pTNmNMWUhwNmZr?=
 =?utf-8?B?YkQ1NjB4c3dlUEljNjA3VkpaeVVHNXlVblcxM2hpMXppYXFqdWhYZFE0YmhE?=
 =?utf-8?B?N0ExeHc5WmE2QkdJd041NGUyU1dtSnNpMDN3eFYxaG9XV1dtUFRyY2hUUXIv?=
 =?utf-8?B?ZHZlRW00a1p4NTNTUDJxWVhGc21kSlhURnhFdCtYUWY0RVhpd25nVUNUWTVZ?=
 =?utf-8?B?aTdNWHVPVDR4MENOVExRdnA1NTBQSEs4eFEyMzAzTGlXRVRtN3p1OW9YV3Vp?=
 =?utf-8?B?Yk5vNCtQTjlDTnF0QS9SRDgwNjdxd3REVnY5Zk5jNUF4SE1CcDFqc0l1OGgy?=
 =?utf-8?B?TUxJL3JxMUdMQ3VmWmx5QVlRazEyNTBLOTBZd0loeFQrUWFuS3hqbCtSelds?=
 =?utf-8?B?dWhjVEZWL0M1U3R6SkRIc0xPNEozNFkyeHNHWGVqL1JtcXNNQVZRTi8wK1Z6?=
 =?utf-8?B?eitlWTM0NnBXMUY3eEQ3TDk3MlR5S1lJbU92OWZYV0VaSTBYMUtEbW54NzQ1?=
 =?utf-8?B?NkQySFM2NzN3TE5NRUJ0UzRrT3VmZEdxSnlOQ0Z4SjIvNlhKWjJJYkhTbGh2?=
 =?utf-8?B?QnVGTHFqWmdJM3NaODZUTXRwV0EreG9QTEFqL2RhS3VJTmFVa24va3JjK2VD?=
 =?utf-8?B?a0p5YTE3RndReG41RHh0UDVKRklwKzFYL1dyWVZ0anhQazBOeDRUZEI1dmJl?=
 =?utf-8?B?Tm1HUWNqaGJwcEhiWGdUQjRNZkNBUm5vdm04eVZDSXRaSWR4c3JNR1Q5U0JY?=
 =?utf-8?B?NjdHZnRUNWVjSW00UFNPcnlkMGdkMDFZR3VTdkVkMUVrQkNxc0VSMXpGbkk5?=
 =?utf-8?B?VlNhWm9vTEQ3SXF6SzFBVStvSksvQjh5WjF5cmZ6Q2c2OTBDckdFWlhLWkls?=
 =?utf-8?B?YXpEVkFpbDU3ajVQaC9WV1JzcGoxclRNVnVmaDBqSFIxbEtZSXNaYkx6b21S?=
 =?utf-8?B?NENRaWw3SksxbFJZeXo3dkJjVk5YRFMzcVZLSDc2RzhqSER2eUhGemdFN05F?=
 =?utf-8?B?cG5yZkRjY0RPcjJTYW1JeVVhY2hnb3M4NTVCMUJLMFc3eTUwcE5ndTRELytw?=
 =?utf-8?B?UVVGMjU5c3lQVUVnbDhjRmp4d1N0RjhjUEI1TmpDc3JoRXFNSUZObWlGK2lS?=
 =?utf-8?B?RXAxZEZSdEVPbmNKVDNVWStHU1JVcHkwOFBsbEgwdmtWaFdxdldONnhJQVNk?=
 =?utf-8?B?d2ROSFJNbWI4Y3RWWkk0alNGVHNZZ3hVL3pxMnp5MU03a25McUFRdGFpeTFX?=
 =?utf-8?B?UTRaalBWODJNTVlMdlJ5ME5nV2pDbXg1RksrSVFCaUpkSUczZVhhUDE3S1A5?=
 =?utf-8?B?bml2V29kaS92RG4yekhXdE5yVWZzWkpHT1dneDBXNVZ1dFhOMmxzMUM3V1hM?=
 =?utf-8?B?ZXhrUml0LzBuRmljK3R3eHAzNGw0NHBlZXFkekNtQzN5bThwdkVLUGgvdEw5?=
 =?utf-8?B?TjN2YlhKV1BWdk1FenNGTkRIQldUR0tMMWorVTRzbGxNYWhtdmR4Yk1jcHow?=
 =?utf-8?B?NFhFRytFVi9PNC9RSXpuQlRSZHpxYm5IMDN2U09QT29jMVprdEtpVHNGZENX?=
 =?utf-8?B?ZlViZ2ZSZmVuUytaS0s3cHJsaGoxMXVWN0llY2poRUFWUUdsT1ZOT25GeGZs?=
 =?utf-8?B?MUNkTGZ1bEc0NUtOWWFPN1pSYzUxdldUdFh6czhIUmxPVk03NEJQbEJscVQ3?=
 =?utf-8?B?T2Rra3V1K09ZZG1sSXg4dUkrS2ZSSW1CT0U5dHVjSWRzMFhWQzI0WU1zQXJp?=
 =?utf-8?B?YW80MnRNMWY5dEVaZUlkTzlrWGNPYUhHWkQ4MHc3WnBHd00yOEhSL1NER1RP?=
 =?utf-8?B?bGVjekdBaytMb3lGdlIvM2U5b3FiTFdlVTdBR2VTbmdOVmpJNXJ4V2R2d05G?=
 =?utf-8?B?ZFZLUWVVY21HSjV2OGpSYlRxTkhQR0hyU2twcyt6UEZJUmFTK2ZKVFcwSTR3?=
 =?utf-8?B?bTV5anIzWmw4eDdZbDI1MlQyL05xQkJxb3dqVER5RlgxaldzMlkrOG45WXdi?=
 =?utf-8?Q?PYSCRQsY0gYmMhlx1ZqPde/5Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c00e119-9a9f-4244-bb31-08dc2946d0fe
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 08:12:11.6491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wUM8fZQLQFvujOavyILV5SJ0UGU/QalGkdswRUYWLJmCOvP0W2B5paoXZOgrQatd53vLbEmbeqAzPh19VeGdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
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

--------------Kg3tPO0XPLwyP7BIl9CmMbJv
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hello Jouni,

On 2/8/2024 2:09 PM, Hogander, Jouni wrote:
> On Wed, 2024-02-07 at 19:23 +0530, Kunal Joshi wrote:
>> We can have multiple panels connected to the system so PSR
>> information
>> should be exposed per output. changes provide support for multiple
>> PSR/PR to be tested simultaneously.
>>
>> For review purpose here is the breakdown of changes
>> may not be part of commit
>> - Added new function get_debugfs_file to get debugfs file for each
>> output
>> - Added new function get_psr_mode_for_output to get PSR mode for each
>> output
>> - Added igt_output_t param to all necessary functions so that we can
>> get/set
>>    PSR related debugfs file for that particular output
>> - param is currently passed as NULL for rest of the test other than
>>    kms_psr2_sf and kms_psr, maybe taken care in future patches
>> - Currently we don't have separate psr_debug debugfs file for each
>> output.
>>    so, we are using i915_edp_psr_debug file for all outputs.
>>    later we need to add support for separate psr_debug file for each
>> output.
>>
>> Cc: Jouni Högander<jouni.hogander@intel.com>
>> Cc: Animesh Manna<animesh.manna@intel.com>
>> Cc: Arun R Murthy<arun.r.murthy@intel.com>
>> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
>> ---
>>   lib/igt_psr.c                          | 120 +++++++++++++++++------
>> --
>>   lib/igt_psr.h                          |  14 +--
>>   tests/intel/kms_dirtyfb.c              |   4 +-
>>   tests/intel/kms_fbcon_fbt.c            |   4 +-
>>   tests/intel/kms_frontbuffer_tracking.c |   4 +-
>>   tests/intel/kms_pm_dc.c                |   6 +-
>>   tests/intel/kms_psr.c                  |   4 +-
>>   tests/intel/kms_psr2_sf.c              |   8 --
>>   tests/intel/kms_psr2_su.c              |   2 +-
>>   tests/intel/kms_psr_stress_test.c      |   4 +-
>>   tests/kms_async_flips.c                |   4 +-
>>   tests/kms_cursor_legacy.c              |   4 +-
>>   12 files changed, 109 insertions(+), 69 deletions(-)
>>
>> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
>> index 8acab2231..6ec755004 100644
>> --- a/lib/igt_psr.c
>> +++ b/lib/igt_psr.c
>> @@ -27,6 +27,35 @@
>>   #include "igt_sysfs.h"
>>   #include <errno.h>
>>   
>> +enum psr_debugfs_file {
>> +       PSR_STATUS,
>> +       PSR_DEBUG,
>> +       PSR_MAX
>> +};
>> +
>> +static const char *get_debugfs_file(igt_output_t *output, enum
>> psr_debugfs_file file)
>> +{
>> +       static char debugfs_file[128] = {0};
>> +
>> +       switch (file) {
>> +       case PSR_STATUS:
>> +               if (output)
>> +                       sprintf(debugfs_file, "%s/i915_psr_status",
>> output->name);
>> +               else
>> +                       sprintf(debugfs_file, "i915_edp_psr_status");
>> +               break;
>> +       case PSR_DEBUG:
>> +               if (output)
>> +                       sprintf(debugfs_file, "%s/i915_psr_debug",
>> output->name);
>> +               else
>> +                       sprintf(debugfs_file, "i915_edp_psr_debug");
>> +               break;
>> +       default:
>> +               igt_assert_f(false, "Invalid psr debugfs file\n");
>> +       }
>> +       return debugfs_file;
>> +}
>> +
> I'm not convinced this function makes sense. Especially as you are
> anyways doing sprintf(debugfs_file, "%s", file_path) in the caller. If
> you really want to have something like this I would rather:
>
> #define get_debugfs_file_path(output, debugfs_file, debugfs_file_path)
> sprintf(debugfs_file_path, "%s/%s", output ? output->name : "",
> debugfs_file)
>
>>   bool psr_disabled_check(int debugfs_fd)
>>   {
>>          char buf[PSR_STATUS_MAX_LEN];
>> @@ -37,11 +66,15 @@ bool psr_disabled_check(int debugfs_fd)
>>          return strstr(buf, "PSR mode: disabled\n");
>>   }
>>   
>> -bool psr2_selective_fetch_check(int debugfs_fd)
>> +bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
>>   {
>>          char buf[PSR_STATUS_MAX_LEN];
>> +       char debugfs_file[128] = {0};
>> +       const char *file_path = get_debugfs_file(output, PSR_STATUS);
>>   
>> -       igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status",
>> buf,
>> +       sprintf(debugfs_file, "%s", file_path);
>> +
>> +       igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>>                                  sizeof(buf));
>>   
>>          return strstr(buf, "PSR2 selective fetch: enabled");
>> @@ -51,14 +84,11 @@ static bool psr_active_check(int debugfs_fd, enum
>> psr_mode mode, igt_output_t *o
>>   {
>>          char debugfs_file[128] = {0};
>>          char buf[PSR_STATUS_MAX_LEN];
>> +       const char *file_path = get_debugfs_file(output, PSR_STATUS);
>>          const char *state = (mode == PSR_MODE_1 || mode == PR_MODE) ?
>> "SRDENT" : "DEEP_SLEEP";
>>          int ret;
>>   
>> -       if (output)
>> -               sprintf(debugfs_file, "%s/i915_psr_status", output-
>>> name);
>> -       else
>> -               sprintf(debugfs_file, "%s", "i915_edp_psr_status");
>> -
>> +       sprintf(debugfs_file, "%s", file_path);
>>          ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
>>                                       buf, sizeof(buf));
>>          if (ret < 0) {
>> @@ -90,13 +120,20 @@ bool psr_long_wait_update(int debugfs_fd, enum
>> psr_mode mode, igt_output_t *outp
>>          return igt_wait(!psr_active_check(debugfs_fd, mode, output),
>> 500, 10);
>>   }
>>   
>> -static ssize_t psr_write(int debugfs_fd, const char *buf)
>> +static ssize_t psr_write(int debugfs_fd, const char *buf,
>> igt_output_t *output)
>>   {
>> +       /*
>> +        * FIXME: Currently we don't have separate psr_debug file for
>> each output.
>> +        * so, we are using i915_edp_psr_debug file for all outputs.
>> +        * Later we need to add support for separate psr_debug file
>> for each output.
>> +        *
>> +        * use get_debugfs_file(output, PSR_DEBUG) instead of
>> "i915_edp_psr_debug"
>> +        */
>>          return igt_sysfs_write(debugfs_fd, "i915_edp_psr_debug", buf,
>> -                              strlen(buf));
>> +                                                  strlen(buf));
>>   }
>>   
>> -static int has_psr_debugfs(int debugfs_fd)
>> +static int has_psr_debugfs(int debugfs_fd, igt_output_t *output)
>>   {
>>          int ret;
>>   
>> @@ -105,7 +142,7 @@ static int has_psr_debugfs(int debugfs_fd)
>>           * Legacy mode will return OK here, debugfs api will return -
>> EINVAL.
>>           * -ENODEV is returned when PSR is unavailable.
>>           */
>> -       ret = psr_write(debugfs_fd, "0xf");
>> +       ret = psr_write(debugfs_fd, "0xf", output);
>>          if (ret == -EINVAL) {
>>                  errno = 0;
>>                  return 0;
>> @@ -113,7 +150,7 @@ static int has_psr_debugfs(int debugfs_fd)
>>                  return ret;
>>   
>>          /* legacy debugfs api, we enabled irqs by writing, disable
>> them. */
>> -       psr_write(debugfs_fd, "0");
>> +       psr_write(debugfs_fd, "0", output);
>>          return -EINVAL;
>>   }
>>   
>> @@ -134,14 +171,14 @@ static int psr_restore_debugfs_fd = -1;
>>   
>>   static void restore_psr_debugfs(int sig)
>>   {
>> -       psr_write(psr_restore_debugfs_fd, "0");
>> +       psr_write(psr_restore_debugfs_fd, "0", NULL);
>>   }
>>   
>> -static bool psr_set(int device, int debugfs_fd, int mode)
>> +static bool psr_set(int device, int debugfs_fd, int mode,
>> igt_output_t *output)
>>   {
>>          int ret;
>>   
>> -       ret = has_psr_debugfs(debugfs_fd);
>> +       ret = has_psr_debugfs(debugfs_fd, output);
>>          if (ret == -ENODEV) {
>>                  igt_skip("PSR not available\n");
>>                  return false;
>> @@ -179,7 +216,7 @@ static bool psr_set(int device, int debugfs_fd,
>> int mode)
>>                          debug_val = "0x1";
>>                  }
>>   
>> -               ret = psr_write(debugfs_fd, debug_val);
>> +               ret = psr_write(debugfs_fd, debug_val, output);
>>                  igt_require_f(ret > 0, "PSR2 SF feature not
>> available\n");
>>          }
>>   
>> @@ -193,15 +230,15 @@ static bool psr_set(int device, int debugfs_fd,
>> int mode)
>>          return ret;
>>   }
>>   
>> -bool psr_enable(int device, int debugfs_fd, enum psr_mode mode)
>> +bool psr_enable(int device, int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output)
>>   {
>> -       return psr_set(device, debugfs_fd, mode);
>> +       return psr_set(device, debugfs_fd, mode, output);
>>   }
>>   
>> -bool psr_disable(int device, int debugfs_fd)
>> +bool psr_disable(int device, int debugfs_fd, igt_output_t *output)
>>   {
>>          /* Any mode different than PSR_MODE_1/2 will disable PSR */
>> -       return psr_set(device, debugfs_fd, -1);
>> +       return psr_set(device, debugfs_fd, -1, output);
>>   }
>>   
>>   bool psr_sink_support(int device, int debugfs_fd, enum psr_mode
>> mode, igt_output_t *output)
>> @@ -209,13 +246,10 @@ bool psr_sink_support(int device, int
>> debugfs_fd, enum psr_mode mode, igt_output
>>          char *line;
>>          char debugfs_file[128] = {0};
>>          char buf[PSR_STATUS_MAX_LEN];
>> +       const char *file_path = get_debugfs_file(output, PSR_STATUS);
>>          int ret;
>>   
>> -       if (output)
>> -               sprintf(debugfs_file, "%s/i915_psr_status", output-
>>> name);
>> -       else
>> -               sprintf(debugfs_file, "%s", "i915_edp_psr_status");
>> -
>> +       sprintf(debugfs_file, "%s", file_path);
>>          ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>>                                        sizeof(buf));
>>          if (ret < 1)
>> @@ -307,7 +341,7 @@ void psr_print_debugfs(int debugfs_fd)
>>          igt_info("%s", buf);
>>   }
>>   
>> -bool i915_psr2_selective_fetch_check(int drm_fd)
>> +bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
>> *output)
>>   {
>>          int debugfs_fd;
>>          bool ret;
>> @@ -316,7 +350,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd)
>>                  return false;
>>   
>>          debugfs_fd = igt_debugfs_dir(drm_fd);
>> -       ret = psr2_selective_fetch_check(debugfs_fd);
>> +       ret = selective_fetch_check(debugfs_fd, output);
>>          close(debugfs_fd);
>>   
>>          return ret;
>> @@ -333,17 +367,24 @@ bool i915_psr2_selective_fetch_check(int
>> drm_fd)
>>    * Returns:
>>    * True if PSR mode changed to PSR1, false otherwise.
>>    */
>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
>> +bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
>> *output)
>>   {
>>          int debugfs_fd;
>>          bool ret = false;
>> +       enum psr_mode mode;
>>   
>>          if (!is_intel_device(drm_fd))
>>                  return ret;
>>   
>>          debugfs_fd = igt_debugfs_dir(drm_fd);
>> -       if (psr2_selective_fetch_check(debugfs_fd)) {
>> -               psr_set(drm_fd, debugfs_fd, PSR_MODE_1);
>> +       if (selective_fetch_check(debugfs_fd, output)) {
>> +               mode = psr_get_mode(debugfs_fd, output);
>> +               if (mode == PR_MODE_SEL_FETCH)
>> +                       psr_set(drm_fd, debugfs_fd, PR_MODE, output);
>> +               else if (mode == PSR_MODE_2_SEL_FETCH)
>> +                       psr_set(drm_fd, debugfs_fd, PSR_MODE_1,
>> output);
>> +               else
>> +                       igt_assert("switch not possible from current
>> psr mode\n");
> Not all these changes here are related to "modify library to support
> multiple PSR/PR outputs". They are more suitable for previous patch in
> your set.
>
> BR,
>
> Jouni Högander
>
Thanks for following up,
Have addressed your comments in the next revision.
>>                  ret = true;
>>          }
>>   
>> @@ -357,12 +398,17 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
>>    * Restore PSR2 selective fetch after tests were executed, this
>> function should
>>    * only be called if i915_psr2_sel_fetch_to_psr1() returned true.
>>    */
>> -void i915_psr2_sel_fetch_restore(int drm_fd)
>> +void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t
>> *output)
>>   {
>>          int debugfs_fd;
>> +       enum psr_mode mode;
>>   
>>          debugfs_fd = igt_debugfs_dir(drm_fd);
>> -       psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH);
>> +       mode = psr_get_mode(debugfs_fd, output);
>> +       if (mode == PR_MODE)
>> +               psr_set(drm_fd, debugfs_fd, PR_MODE_SEL_FETCH,
>> output);
>> +       else
>> +               psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH,
>> output);
>>          close(debugfs_fd);
>>   }
>>   
>> @@ -371,16 +417,18 @@ void i915_psr2_sel_fetch_restore(int drm_fd)
>>    *
>>    * Return the current PSR mode.
>>    */
>> -enum psr_mode psr_get_mode(int debugfs_fd)
>> +enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
>>   {
>>          char buf[PSR_STATUS_MAX_LEN];
>> +       char debugfs_file[128] = {0};
>> +       const char *file_path = get_debugfs_file(output, PSR_STATUS);
>>          int ret;
>>   
>> -
>> -       ret = igt_debugfs_simple_read(debugfs_fd,
>> "i915_edp_psr_status", buf,
>> +       sprintf(debugfs_file, "%s", file_path);
>> +       ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>>                                        sizeof(buf));
>>          if (ret < 0) {
>> -               igt_info("Could not read i915_edp_psr_status: %s\n",
>> +               igt_info("Could not read psr status: %s\n",
>>                           strerror(-ret));
>>                  return PSR_DISABLED;
>>          }
>> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
>> index 82a4e8c5e..36ba7f068 100644
>> --- a/lib/igt_psr.h
>> +++ b/lib/igt_psr.h
>> @@ -46,21 +46,21 @@ enum fbc_mode {
>>   };
>>   
>>   bool psr_disabled_check(int debugfs_fd);
>> -bool psr2_selective_fetch_check(int debugfs_fd);
>> +bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
>>   bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t
>> *output);
>>   bool psr_wait_update(int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output);
>>   bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output);
>> -bool psr_enable(int device, int debugfs_fd, enum psr_mode);
>> -bool psr_disable(int device, int debugfs_fd);
>> +bool psr_enable(int device, int debugfs_fd, enum psr_mode,
>> igt_output_t *output);
>> +bool psr_disable(int device, int debugfs_fd, igt_output_t *output);
>>   bool psr_sink_support(int device, int debugfs_fd, enum psr_mode
>> mode, igt_output_t *output);
>>   bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
>>   void psr_print_debugfs(int debugfs_fd);
>> -enum psr_mode psr_get_mode(int debugfs_fd);
>> +enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output);
>>   
>> -bool i915_psr2_selective_fetch_check(int drm_fd);
>> +bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
>> *output);
>>   
>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
>> -void i915_psr2_sel_fetch_restore(int drm_fd);
>> +bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
>> *output);
>> +void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t
>> *output);
>>   bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
>>   
>>   #endif
>> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
>> index 7bf49cb15..22ca83305 100644
>> --- a/tests/intel/kms_dirtyfb.c
>> +++ b/tests/intel/kms_dirtyfb.c
>> @@ -127,7 +127,7 @@ static void enable_feature(data_t *data)
>>                  intel_fbc_enable(data->drm_fd);
>>                  break;
>>          case FEATURE_PSR:
>> -               psr_enable(data->drm_fd, data->debugfs_fd,
>> PSR_MODE_1);
>> +               psr_enable(data->drm_fd, data->debugfs_fd,
>> PSR_MODE_1, NULL);
>>                  break;
>>          case FEATURE_DRRS:
>>                  intel_drrs_enable(data->drm_fd, data->pipe);
>> @@ -167,7 +167,7 @@ static void check_feature(data_t *data)
>>   static void disable_features(data_t *data)
>>   {
>>          intel_fbc_disable(data->drm_fd);
>> -       psr_disable(data->drm_fd, data->debugfs_fd);
>> +       psr_disable(data->drm_fd, data->debugfs_fd, NULL);
>>          intel_drrs_disable(data->drm_fd, data->pipe);
>>   }
>>   
>> diff --git a/tests/intel/kms_fbcon_fbt.c
>> b/tests/intel/kms_fbcon_fbt.c
>> index 90484dccf..71e42f19c 100644
>> --- a/tests/intel/kms_fbcon_fbt.c
>> +++ b/tests/intel/kms_fbcon_fbt.c
>> @@ -277,7 +277,7 @@ static void disable_features(int device, int
>> debugfs_fd)
>>   {
>>          igt_set_module_param_int(device, "enable_fbc", 0);
>>          if (psr_sink_support(device, debugfs_fd, PSR_MODE_1, NULL))
>> -               psr_disable(device, debugfs_fd);
>> +               psr_disable(device, debugfs_fd, NULL);
>>   }
>>   
>>   static inline void fbc_modparam_enable(int device, int debugfs_fd)
>> @@ -287,7 +287,7 @@ static inline void fbc_modparam_enable(int
>> device, int debugfs_fd)
>>   
>>   static inline void psr_debugfs_enable(int device, int debugfs_fd)
>>   {
>> -       psr_enable(device, debugfs_fd, PSR_MODE_1);
>> +       psr_enable(device, debugfs_fd, PSR_MODE_1, NULL);
>>   }
>>   
>>   static void fbc_skips_on_fbcon(int debugfs_fd)
>> diff --git a/tests/intel/kms_frontbuffer_tracking.c
>> b/tests/intel/kms_frontbuffer_tracking.c
>> index 912cca3f8..023843161 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -2234,7 +2234,7 @@ static bool disable_features(const struct
>> test_mode *t)
>>          intel_fbc_disable(drm.fd);
>>          intel_drrs_disable(drm.fd, prim_mode_params.pipe);
>>   
>> -       return psr.can_test ? psr_disable(drm.fd, drm.debugfs) :
>> false;
>> +       return psr.can_test ? psr_disable(drm.fd, drm.debugfs, NULL)
>> : false;
>>   }
>>   
>>   static void *busy_thread_func(void *data)
>> @@ -2867,7 +2867,7 @@ static bool enable_features_for_test(const
>> struct test_mode *t)
>>          if (t->feature & FEATURE_FBC)
>>                  intel_fbc_enable(drm.fd);
>>          if (t->feature & FEATURE_PSR)
>> -               ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
>> +               ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1,
>> NULL);
>>          if (t->feature & FEATURE_DRRS)
>>                  intel_drrs_enable(drm.fd, prim_mode_params.pipe);
>>   
>> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
>> index 0d5824e67..7deebf83d 100644
>> --- a/tests/intel/kms_pm_dc.c
>> +++ b/tests/intel/kms_pm_dc.c
>> @@ -362,7 +362,7 @@ static void require_dc_counter(int debugfs_fd,
>> int dc_flag)
>>   static void setup_dc3co(data_t *data)
>>   {
>>          data->op_psr_mode = PSR_MODE_2;
>> -       psr_enable(data->drm_fd, data->debugfs_fd, data-
>>> op_psr_mode);
>> +       psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode,
>> NULL);
>>          igt_require_f(psr_wait_entry(data->debugfs_fd, data-
>>> op_psr_mode, NULL),
>>                        "PSR2 is not enabled\n");
>>   }
>> @@ -665,7 +665,7 @@ igt_main
>>                  igt_require(psr_sink_support(data.drm_fd,
>> data.debugfs_fd,
>>                                               PSR_MODE_1, NULL));
>>                  data.op_psr_mode = PSR_MODE_1;
>> -               psr_enable(data.drm_fd, data.debugfs_fd,
>> data.op_psr_mode);
>> +               psr_enable(data.drm_fd, data.debugfs_fd,
>> data.op_psr_mode, NULL);
>>                  test_dc_state_psr(&data, CHECK_DC5);
>>          }
>>   
>> @@ -675,7 +675,7 @@ igt_main
>>                  igt_require(psr_sink_support(data.drm_fd,
>> data.debugfs_fd,
>>                                               PSR_MODE_1, NULL));
>>                  data.op_psr_mode = PSR_MODE_1;
>> -               psr_enable(data.drm_fd, data.debugfs_fd,
>> data.op_psr_mode);
>> +               psr_enable(data.drm_fd, data.debugfs_fd,
>> data.op_psr_mode, NULL);
>>                  igt_require_f(igt_pm_pc8_plus_residencies_enabled(dat
>> a.msr_fd),
>>                                "PC8+ residencies not supported\n");
>>                  if (intel_display_ver(data.devid) >= 14)
>> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
>> index 521d4c708..3822b3081 100644
>> --- a/tests/intel/kms_psr.c
>> +++ b/tests/intel/kms_psr.c
>> @@ -519,7 +519,7 @@ static bool psr_enable_if_enabled(data_t *data)
>>                  igt_skip("enable_psr modparam doesn't allow psr mode
>> %d\n",
>>                           data->op_psr_mode);
>>   
>> -       return psr_enable(data->drm_fd, data->debugfs_fd, data-
>>> op_psr_mode);
>> +       return psr_enable(data->drm_fd, data->debugfs_fd, data-
>>> op_psr_mode, data->output);
>>   }
>>   
>>   static inline void manual(const char *expected)
>> @@ -658,6 +658,7 @@ static void test_cleanup(data_t *data)
>>   
>>          igt_remove_fb(data->drm_fd, &data->fb_green);
>>          igt_remove_fb(data->drm_fd, &data->fb_white);
>> +       psr_disable(data->drm_fd, data->debugfs_fd, data->output);
>>   }
>>   
>>   static void setup_test_plane(data_t *data, int test_plane)
>> @@ -976,7 +977,6 @@ igt_main
>>          }
>>   
>>          igt_fixture {
>> -               psr_disable(data.drm_fd, data.debugfs_fd);
>>   
>>                  close(data.debugfs_fd);
>>                  buf_ops_destroy(data.bops);
>> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
>> index ecf9ad77f..8e6a9e02c 100644
>> --- a/tests/intel/kms_psr2_sf.c
>> +++ b/tests/intel/kms_psr2_sf.c
>> @@ -1012,11 +1012,6 @@ igt_main
>>                          data.fbc_flag = true;
>>                  }
>>   
>> -               /* Test if PSR2 can be enabled */
>> -               igt_require_f(psr_enable(data.drm_fd,
>> -                                        data.debugfs_fd,
>> PSR_MODE_2_SEL_FETCH),
>> -                             "Error enabling PSR2\n");
>> -
>>                  data.damage_area_count = MAX_DAMAGE_AREAS;
>>                  data.primary_format = DRM_FORMAT_XRGB8888;
>>   
>> @@ -1026,9 +1021,6 @@ igt_main
>>                  igt_info("Big framebuffer size %dx%d\n",
>>                           data.big_fb_width, data.big_fb_height);
>>   
>> -
>>                 igt_require_f(psr2_selective_fetch_check(data.debugfs_f
>> d),
>> -                             "PSR2 selective fetch not enabled\n");
>> -
>>                  for_each_pipe_with_valid_output(&data.display,
>> data.pipe, data.output) {
>>                          coexist_features[n_pipes] = 0;
>>                          if (check_psr2_support(&data)) {
>> diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
>> index 936b5beb3..437ee36f6 100644
>> --- a/tests/intel/kms_psr2_su.c
>> +++ b/tests/intel/kms_psr2_su.c
>> @@ -338,7 +338,7 @@ igt_main
>>   
>>                  /* Test if PSR2 can be enabled */
>>                  igt_require_f(psr_enable(data.drm_fd,
>> -                                        data.debugfs_fd,
>> PSR_MODE_2),
>> +                                        data.debugfs_fd, PSR_MODE_2,
>> NULL),
>>                                "Error enabling PSR2\n");
>>                  data.op = FRONTBUFFER;
>>                  data.format = DRM_FORMAT_XRGB8888;
>> diff --git a/tests/intel/kms_psr_stress_test.c
>> b/tests/intel/kms_psr_stress_test.c
>> index 7aea8e8a5..bca3bd513 100644
>> --- a/tests/intel/kms_psr_stress_test.c
>> +++ b/tests/intel/kms_psr_stress_test.c
>> @@ -230,7 +230,7 @@ static void prepare(data_t *data)
>>          r = timerfd_settime(data->completed_timerfd, 0, &interval,
>> NULL);
>>          igt_require_f(r != -1, "Error setting completed_timerfd\n");
>>   
>> -       data->initial_state = psr_get_mode(data->debugfs_fd);
>> +       data->initial_state = psr_get_mode(data->debugfs_fd, NULL);
>>          igt_require(data->initial_state != PSR_DISABLED);
>>          igt_require(psr_wait_entry(data->debugfs_fd, data-
>>> initial_state, NULL));
>>   }
>> @@ -343,7 +343,7 @@ static void run(data_t *data)
>>          }
>>   
>>          /* Check if after all this stress the PSR is still in the
>> same state */
>> -       igt_assert(psr_get_mode(data->debugfs_fd) == data-
>>> initial_state);
>> +       igt_assert(psr_get_mode(data->debugfs_fd, NULL) == data-
>>> initial_state);
>>   }
>>   
>>   igt_main
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index a0349fa03..2895168f7 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -391,7 +391,7 @@ static void test_cursor(data_t *data)
>>           * necessary, causing the async flip to fail because async
>> flip is not
>>           * supported in cursor plane.
>>           */
>> -       igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd),
>> +       igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd,
>> NULL),
>>                        "PSR2 sel fetch causes cursor to be added to
>> primary plane " \
>>                        "pages flips and async flip is not supported in
>> cursor\n");
>>   
>> @@ -704,7 +704,7 @@ igt_main
>>                   * necessary, causing the async flip to fail because
>> async flip is not
>>                   * supported in cursor plane.
>>                   */
>> -
>>                 igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_
>> fd),
>> +               igt_skip_on_f(i915_psr2_selective_fetch_check(data.dr
>> m_fd, NULL),
>>                                "PSR2 sel fetch causes cursor to be
>> added to primary plane " \
>>                                "pages flips and async flip is not
>> supported in cursor\n");
>>   
>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>> index 0017659d4..91e5e9b07 100644
>> --- a/tests/kms_cursor_legacy.c
>> +++ b/tests/kms_cursor_legacy.c
>> @@ -1849,7 +1849,7 @@ igt_main
>>                   * page flip with cursor legacy APIS when Intel's
>> PSR2 selective
>>                   * fetch is enabled, so switching PSR1 for this whole
>> test.
>>                   */
>> -               intel_psr2_restore =
>> i915_psr2_sel_fetch_to_psr1(display.drm_fd);
>> +               intel_psr2_restore =
>> i915_pr_psr2_sel_fetch_to_pr_psr1(display.drm_fd, NULL);
>>          }
>>   
>>          igt_describe("Test checks how many cursor updates we can fit
>> between vblanks "
>> @@ -2074,7 +2074,7 @@ igt_main
>>   
>>          igt_fixture {
>>                  if (intel_psr2_restore)
>> -                       i915_psr2_sel_fetch_restore(display.drm_fd);
>> +                       i915_pr_psr2_sel_fetch_restore(display.drm_fd
>> , NULL);
>>                  igt_display_fini(&display);
>>                  drm_close_driver(display.drm_fd);
>>          }
Regards
Kunal Joshi
--------------Kg3tPO0XPLwyP7BIl9CmMbJv
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello Jouni,<br>
    </p>
    <div class="moz-cite-prefix">On 2/8/2024 2:09 PM, Hogander, Jouni
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:cc5962a888e5b9dd5c0546a04cb3adb5f1588d92.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 2024-02-07 at 19:23 +0530, Kunal Joshi wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">We can have multiple panels connected to the system so PSR
information
should be exposed per output. changes provide support for multiple
PSR/PR to be tested simultaneously.

For review purpose here is the breakdown of changes
may not be part of commit
- Added new function get_debugfs_file to get debugfs file for each
output
- Added new function get_psr_mode_for_output to get PSR mode for each
output
- Added igt_output_t param to all necessary functions so that we can
get/set
&nbsp; PSR related debugfs file for that particular output
- param is currently passed as NULL for rest of the test other than
&nbsp; kms_psr2_sf and kms_psr, maybe taken care in future patches
- Currently we don't have separate psr_debug debugfs file for each
output.
&nbsp; so, we are using i915_edp_psr_debug file for all outputs.
&nbsp; later we need to add support for separate psr_debug file for each
output.

Cc: Jouni Högander <a class="moz-txt-link-rfc2396E" href="mailto:jouni.hogander@intel.com">&lt;jouni.hogander@intel.com&gt;</a>
Cc: Animesh Manna <a class="moz-txt-link-rfc2396E" href="mailto:animesh.manna@intel.com">&lt;animesh.manna@intel.com&gt;</a>
Cc: Arun R Murthy <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a>
Signed-off-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
---
&nbsp;lib/igt_psr.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 120 +++++++++++++++++------
--
&nbsp;lib/igt_psr.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 14 +--
&nbsp;tests/intel/kms_dirtyfb.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +-
&nbsp;tests/intel/kms_fbcon_fbt.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +-
&nbsp;tests/intel/kms_frontbuffer_tracking.c |&nbsp;&nbsp; 4 +-
&nbsp;tests/intel/kms_pm_dc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 +-
&nbsp;tests/intel/kms_psr.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +-
&nbsp;tests/intel/kms_psr2_sf.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 --
&nbsp;tests/intel/kms_psr2_su.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-
&nbsp;tests/intel/kms_psr_stress_test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +-
&nbsp;tests/kms_async_flips.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +-
&nbsp;tests/kms_cursor_legacy.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +-
&nbsp;12 files changed, 109 insertions(+), 69 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 8acab2231..6ec755004 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -27,6 +27,35 @@
&nbsp;#include &quot;igt_sysfs.h&quot;
&nbsp;#include &lt;errno.h&gt;
&nbsp;
+enum psr_debugfs_file {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PSR_STATUS,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PSR_DEBUG,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PSR_MAX
+};
+
+static const char *get_debugfs_file(igt_output_t *output, enum
psr_debugfs_file file)
+{
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;static char debugfs_file[128] = {0};
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;switch (file) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case PSR_STATUS:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (output)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s/i915_psr_status&quot;,
output-&gt;name);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;i915_edp_psr_status&quot;);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case PSR_DEBUG:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (output)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s/i915_psr_debug&quot;,
output-&gt;name);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;i915_edp_psr_debug&quot;);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;default:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_assert_f(false, &quot;Invalid psr debugfs file\n&quot;);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return debugfs_file;
+}
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not convinced this function makes sense. Especially as you are
anyways doing sprintf(debugfs_file, &quot;%s&quot;, file_path) in the caller. If
you really want to have something like this I would rather:

#define get_debugfs_file_path(output, debugfs_file, debugfs_file_path)
sprintf(debugfs_file_path, &quot;%s/%s&quot;, output ? output-&gt;name : &quot;&quot;,
debugfs_file)

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">&nbsp;bool psr_disabled_check(int debugfs_fd)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char buf[PSR_STATUS_MAX_LEN];
@@ -37,11 +66,15 @@ bool psr_disabled_check(int debugfs_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return strstr(buf, &quot;PSR mode: disabled\n&quot;);
&nbsp;}
&nbsp;
-bool psr2_selective_fetch_check(int debugfs_fd)
+bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char buf[PSR_STATUS_MAX_LEN];
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char debugfs_file[128] = {0};
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const char *file_path = get_debugfs_file(output, PSR_STATUS);
&nbsp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_debugfs_simple_read(debugfs_fd, &quot;i915_edp_psr_status&quot;,
buf,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s&quot;, file_path);
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sizeof(buf));
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return strstr(buf, &quot;PSR2 selective fetch: enabled&quot;);
@@ -51,14 +84,11 @@ static bool psr_active_check(int debugfs_fd, enum
psr_mode mode, igt_output_t *o
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char debugfs_file[128] = {0};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char buf[PSR_STATUS_MAX_LEN];
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const char *file_path = get_debugfs_file(output, PSR_STATUS);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const char *state = (mode == PSR_MODE_1 || mode == PR_MODE) ?
&quot;SRDENT&quot; : &quot;DEEP_SLEEP&quot;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret;
&nbsp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (output)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s/i915_psr_status&quot;, output-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">name);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s&quot;, &quot;i915_edp_psr_status&quot;);
-
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s&quot;, file_path);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf, sizeof(buf));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret &lt; 0) {
@@ -90,13 +120,20 @@ bool psr_long_wait_update(int debugfs_fd, enum
psr_mode mode, igt_output_t *outp
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return igt_wait(!psr_active_check(debugfs_fd, mode, output),
500, 10);
&nbsp;}
&nbsp;
-static ssize_t psr_write(int debugfs_fd, const char *buf)
+static ssize_t psr_write(int debugfs_fd, const char *buf,
igt_output_t *output)
&nbsp;{
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * FIXME: Currently we don't have separate psr_debug file for
each output.
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * so, we are using i915_edp_psr_debug file for all outputs.
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Later we need to add support for separate psr_debug file
for each output.
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * use get_debugfs_file(output, PSR_DEBUG) instead of
&quot;i915_edp_psr_debug&quot;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return igt_sysfs_write(debugfs_fd, &quot;i915_edp_psr_debug&quot;, buf,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strlen(buf));
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strlen(buf));
&nbsp;}
&nbsp;
-static int has_psr_debugfs(int debugfs_fd)
+static int has_psr_debugfs(int debugfs_fd, igt_output_t *output)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret;
&nbsp;
@@ -105,7 +142,7 @@ static int has_psr_debugfs(int debugfs_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Legacy mode will return OK here, debugfs api will return -
EINVAL.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * -ENODEV is returned when PSR is unavailable.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_write(debugfs_fd, &quot;0xf&quot;);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_write(debugfs_fd, &quot;0xf&quot;, output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret == -EINVAL) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;errno = 0;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 0;
@@ -113,7 +150,7 @@ static int has_psr_debugfs(int debugfs_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ret;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* legacy debugfs api, we enabled irqs by writing, disable
them. */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_write(debugfs_fd, &quot;0&quot;);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_write(debugfs_fd, &quot;0&quot;, output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -EINVAL;
&nbsp;}
&nbsp;
@@ -134,14 +171,14 @@ static int psr_restore_debugfs_fd = -1;
&nbsp;
&nbsp;static void restore_psr_debugfs(int sig)
&nbsp;{
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_write(psr_restore_debugfs_fd, &quot;0&quot;);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_write(psr_restore_debugfs_fd, &quot;0&quot;, NULL);
&nbsp;}
&nbsp;
-static bool psr_set(int device, int debugfs_fd, int mode)
+static bool psr_set(int device, int debugfs_fd, int mode,
igt_output_t *output)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret;
&nbsp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = has_psr_debugfs(debugfs_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = has_psr_debugfs(debugfs_fd, output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret == -ENODEV) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip(&quot;PSR not available\n&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return false;
@@ -179,7 +216,7 @@ static bool psr_set(int device, int debugfs_fd,
int mode)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;debug_val = &quot;0x1&quot;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_write(debugfs_fd, debug_val);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_write(debugfs_fd, debug_val, output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(ret &gt; 0, &quot;PSR2 SF feature not
available\n&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
@@ -193,15 +230,15 @@ static bool psr_set(int device, int debugfs_fd,
int mode)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ret;
&nbsp;}
&nbsp;
-bool psr_enable(int device, int debugfs_fd, enum psr_mode mode)
+bool psr_enable(int device, int debugfs_fd, enum psr_mode mode,
igt_output_t *output)
&nbsp;{
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr_set(device, debugfs_fd, mode);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr_set(device, debugfs_fd, mode, output);
&nbsp;}
&nbsp;
-bool psr_disable(int device, int debugfs_fd)
+bool psr_disable(int device, int debugfs_fd, igt_output_t *output)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Any mode different than PSR_MODE_1/2 will disable PSR */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr_set(device, debugfs_fd, -1);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr_set(device, debugfs_fd, -1, output);
&nbsp;}
&nbsp;
&nbsp;bool psr_sink_support(int device, int debugfs_fd, enum psr_mode
mode, igt_output_t *output)
@@ -209,13 +246,10 @@ bool psr_sink_support(int device, int
debugfs_fd, enum psr_mode mode, igt_output
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char *line;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char debugfs_file[128] = {0};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char buf[PSR_STATUS_MAX_LEN];
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const char *file_path = get_debugfs_file(output, PSR_STATUS);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret;
&nbsp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (output)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s/i915_psr_status&quot;, output-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">name);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s&quot;, &quot;i915_edp_psr_status&quot;);
-
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s&quot;, file_path);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(buf));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret &lt; 1)
@@ -307,7 +341,7 @@ void psr_print_debugfs(int debugfs_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_info(&quot;%s&quot;, buf);
&nbsp;}
&nbsp;
-bool i915_psr2_selective_fetch_check(int drm_fd)
+bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
*output)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int debugfs_fd;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool ret;
@@ -316,7 +350,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return false;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;debugfs_fd = igt_debugfs_dir(drm_fd);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr2_selective_fetch_check(debugfs_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = selective_fetch_check(debugfs_fd, output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;close(debugfs_fd);
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ret;
@@ -333,17 +367,24 @@ bool i915_psr2_selective_fetch_check(int
drm_fd)
&nbsp; * Returns:
&nbsp; * True if PSR mode changed to PSR1, false otherwise.
&nbsp; */
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
*output)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int debugfs_fd;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool ret = false;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;enum psr_mode mode;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!is_intel_device(drm_fd))
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ret;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;debugfs_fd = igt_debugfs_dir(drm_fd);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (psr2_selective_fetch_check(debugfs_fd)) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PSR_MODE_1);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (selective_fetch_check(debugfs_fd, output)) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mode = psr_get_mode(debugfs_fd, output);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (mode == PR_MODE_SEL_FETCH)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PR_MODE, output);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else if (mode == PSR_MODE_2_SEL_FETCH)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PSR_MODE_1,
output);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_assert(&quot;switch not possible from current
psr mode\n&quot;);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Not all these changes here are related to &quot;modify library to support
multiple PSR/PR outputs&quot;. They are more suitable for previous patch in
your set.

BR,

Jouni Högander

</pre>
    </blockquote>
    Thanks for following up,<br>
    Have addressed your comments in the next revision.<br>
    <blockquote type="cite" cite="mid:cc5962a888e5b9dd5c0546a04cb3adb5f1588d92.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = true;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
@@ -357,12 +398,17 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
&nbsp; * Restore PSR2 selective fetch after tests were executed, this
function should
&nbsp; * only be called if i915_psr2_sel_fetch_to_psr1() returned true.
&nbsp; */
-void i915_psr2_sel_fetch_restore(int drm_fd)
+void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t
*output)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int debugfs_fd;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;enum psr_mode mode;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;debugfs_fd = igt_debugfs_dir(drm_fd);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mode = psr_get_mode(debugfs_fd, output);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (mode == PR_MODE)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PR_MODE_SEL_FETCH,
output);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH,
output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;close(debugfs_fd);
&nbsp;}
&nbsp;
@@ -371,16 +417,18 @@ void i915_psr2_sel_fetch_restore(int drm_fd)
&nbsp; *
&nbsp; * Return the current PSR mode.
&nbsp; */
-enum psr_mode psr_get_mode(int debugfs_fd)
+enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char buf[PSR_STATUS_MAX_LEN];
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char debugfs_file[128] = {0};
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const char *file_path = get_debugfs_file(output, PSR_STATUS);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret;
&nbsp;
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = igt_debugfs_simple_read(debugfs_fd,
&quot;i915_edp_psr_status&quot;, buf,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s&quot;, file_path);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(buf));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret &lt; 0) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_info(&quot;Could not read i915_edp_psr_status: %s\n&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_info(&quot;Could not read psr status: %s\n&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strerror(-ret));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return PSR_DISABLED;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 82a4e8c5e..36ba7f068 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -46,21 +46,21 @@ enum fbc_mode {
&nbsp;};
&nbsp;
&nbsp;bool psr_disabled_check(int debugfs_fd);
-bool psr2_selective_fetch_check(int debugfs_fd);
+bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
&nbsp;bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t
*output);
&nbsp;bool psr_wait_update(int debugfs_fd, enum psr_mode mode,
igt_output_t *output);
&nbsp;bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode,
igt_output_t *output);
-bool psr_enable(int device, int debugfs_fd, enum psr_mode);
-bool psr_disable(int device, int debugfs_fd);
+bool psr_enable(int device, int debugfs_fd, enum psr_mode,
igt_output_t *output);
+bool psr_disable(int device, int debugfs_fd, igt_output_t *output);
&nbsp;bool psr_sink_support(int device, int debugfs_fd, enum psr_mode
mode, igt_output_t *output);
&nbsp;bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
&nbsp;void psr_print_debugfs(int debugfs_fd);
-enum psr_mode psr_get_mode(int debugfs_fd);
+enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output);
&nbsp;
-bool i915_psr2_selective_fetch_check(int drm_fd);
+bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
*output);
&nbsp;
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
-void i915_psr2_sel_fetch_restore(int drm_fd);
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
*output);
+void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t
*output);
&nbsp;bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
&nbsp;
&nbsp;#endif
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 7bf49cb15..22ca83305 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -127,7 +127,7 @@ static void enable_feature(data_t *data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_fbc_enable(data-&gt;drm_fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case FEATURE_PSR:
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd,
PSR_MODE_1);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd,
PSR_MODE_1, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case FEATURE_DRRS:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_drrs_enable(data-&gt;drm_fd, data-&gt;pipe);
@@ -167,7 +167,7 @@ static void check_feature(data_t *data)
&nbsp;static void disable_features(data_t *data)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_fbc_disable(data-&gt;drm_fd);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(data-&gt;drm_fd, data-&gt;debugfs_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(data-&gt;drm_fd, data-&gt;debugfs_fd, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_drrs_disable(data-&gt;drm_fd, data-&gt;pipe);
&nbsp;}
&nbsp;
diff --git a/tests/intel/kms_fbcon_fbt.c
b/tests/intel/kms_fbcon_fbt.c
index 90484dccf..71e42f19c 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -277,7 +277,7 @@ static void disable_features(int device, int
debugfs_fd)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_set_module_param_int(device, &quot;enable_fbc&quot;, 0);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (psr_sink_support(device, debugfs_fd, PSR_MODE_1, NULL))
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(device, debugfs_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(device, debugfs_fd, NULL);
&nbsp;}
&nbsp;
&nbsp;static inline void fbc_modparam_enable(int device, int debugfs_fd)
@@ -287,7 +287,7 @@ static inline void fbc_modparam_enable(int
device, int debugfs_fd)
&nbsp;
&nbsp;static inline void psr_debugfs_enable(int device, int debugfs_fd)
&nbsp;{
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(device, debugfs_fd, PSR_MODE_1);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(device, debugfs_fd, PSR_MODE_1, NULL);
&nbsp;}
&nbsp;
&nbsp;static void fbc_skips_on_fbcon(int debugfs_fd)
diff --git a/tests/intel/kms_frontbuffer_tracking.c
b/tests/intel/kms_frontbuffer_tracking.c
index 912cca3f8..023843161 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2234,7 +2234,7 @@ static bool disable_features(const struct
test_mode *t)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_fbc_disable(drm.fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_drrs_disable(drm.fd, prim_mode_params.pipe);
&nbsp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr.can_test ? psr_disable(drm.fd, drm.debugfs) :
false;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr.can_test ? psr_disable(drm.fd, drm.debugfs, NULL)
: false;
&nbsp;}
&nbsp;
&nbsp;static void *busy_thread_func(void *data)
@@ -2867,7 +2867,7 @@ static bool enable_features_for_test(const
struct test_mode *t)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (t-&gt;feature &amp; FEATURE_FBC)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_fbc_enable(drm.fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (t-&gt;feature &amp; FEATURE_PSR)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1,
NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (t-&gt;feature &amp; FEATURE_DRRS)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_drrs_enable(drm.fd, prim_mode_params.pipe);
&nbsp;
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 0d5824e67..7deebf83d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -362,7 +362,7 @@ static void require_dc_counter(int debugfs_fd,
int dc_flag)
&nbsp;static void setup_dc3co(data_t *data)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-&gt;op_psr_mode = PSR_MODE_2;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">op_psr_mode);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-&gt;op_psr_mode,
NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(psr_wait_entry(data-&gt;debugfs_fd, data-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">op_psr_mode, NULL),
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR2 is not enabled\n&quot;);
&nbsp;}
@@ -665,7 +665,7 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require(psr_sink_support(data.drm_fd,
data.debugfs_fd,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PSR_MODE_1, NULL));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.op_psr_mode = PSR_MODE_1;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data.drm_fd, data.debugfs_fd,
data.op_psr_mode);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data.drm_fd, data.debugfs_fd,
data.op_psr_mode, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;test_dc_state_psr(&amp;data, CHECK_DC5);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
@@ -675,7 +675,7 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require(psr_sink_support(data.drm_fd,
data.debugfs_fd,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PSR_MODE_1, NULL));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.op_psr_mode = PSR_MODE_1;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data.drm_fd, data.debugfs_fd,
data.op_psr_mode);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data.drm_fd, data.debugfs_fd,
data.op_psr_mode, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(igt_pm_pc8_plus_residencies_enabled(dat
a.msr_fd),
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PC8+ residencies not supported\n&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (intel_display_ver(data.devid) &gt;= 14)
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 521d4c708..3822b3081 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -519,7 +519,7 @@ static bool psr_enable_if_enabled(data_t *data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip(&quot;enable_psr modparam doesn't allow psr mode
%d\n&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;op_psr_mode);
&nbsp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">op_psr_mode);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">op_psr_mode, data-&gt;output);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;}
&nbsp;
&nbsp;static inline void manual(const char *expected)
@@ -658,6 +658,7 @@ static void test_cleanup(data_t *data)
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb_green);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb_white);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-&gt;output);
&nbsp;}
&nbsp;
&nbsp;static void setup_test_plane(data_t *data, int test_plane)
@@ -976,7 +977,6 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_fixture {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(data.drm_fd, data.debugfs_fd);
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;close(data.debugfs_fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;buf_ops_destroy(data.bops);
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index ecf9ad77f..8e6a9e02c 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1012,11 +1012,6 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.fbc_flag = true;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Test if PSR2 can be enabled */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(psr_enable(data.drm_fd,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.debugfs_fd,
PSR_MODE_2_SEL_FETCH),
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Error enabling PSR2\n&quot;);
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.damage_area_count = MAX_DAMAGE_AREAS;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.primary_format = DRM_FORMAT_XRGB8888;
&nbsp;
@@ -1026,9 +1021,6 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_info(&quot;Big framebuffer size %dx%d\n&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.big_fb_width, data.big_fb_height);
&nbsp;
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(psr2_selective_fetch_check(data.debugfs_f
d),
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR2 selective fetch not enabled\n&quot;);
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for_each_pipe_with_valid_output(&amp;data.display,
data.pipe, data.output) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;coexist_features[n_pipes] = 0;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (check_psr2_support(&amp;data)) {
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 936b5beb3..437ee36f6 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -338,7 +338,7 @@ igt_main
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Test if PSR2 can be enabled */
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(psr_enable(data.drm_fd,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.debugfs_fd,
PSR_MODE_2),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.debugfs_fd, PSR_MODE_2,
NULL),
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Error enabling PSR2\n&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.op = FRONTBUFFER;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.format = DRM_FORMAT_XRGB8888;
diff --git a/tests/intel/kms_psr_stress_test.c
b/tests/intel/kms_psr_stress_test.c
index 7aea8e8a5..bca3bd513 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -230,7 +230,7 @@ static void prepare(data_t *data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r = timerfd_settime(data-&gt;completed_timerfd, 0, &amp;interval,
NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(r != -1, &quot;Error setting completed_timerfd\n&quot;);
&nbsp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-&gt;initial_state = psr_get_mode(data-&gt;debugfs_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-&gt;initial_state = psr_get_mode(data-&gt;debugfs_fd, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require(data-&gt;initial_state != PSR_DISABLED);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require(psr_wait_entry(data-&gt;debugfs_fd, data-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">initial_state, NULL));
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;}
@@ -343,7 +343,7 @@ static void run(data_t *data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Check if after all this stress the PSR is still in the
same state */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_assert(psr_get_mode(data-&gt;debugfs_fd) == data-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">initial_state);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_assert(psr_get_mode(data-&gt;debugfs_fd, NULL) == data-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">initial_state);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;}
&nbsp;
&nbsp;igt_main
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a0349fa03..2895168f7 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -391,7 +391,7 @@ static void test_cursor(data_t *data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * necessary, causing the async flip to fail because async
flip is not
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * supported in cursor plane.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_psr2_selective_fetch_check(data-&gt;drm_fd),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_psr2_selective_fetch_check(data-&gt;drm_fd,
NULL),
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR2 sel fetch causes cursor to be added to
primary plane &quot; \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pages flips and async flip is not supported in
cursor\n&quot;);
&nbsp;
@@ -704,7 +704,7 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * necessary, causing the async flip to fail because
async flip is not
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * supported in cursor plane.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_
fd),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_psr2_selective_fetch_check(data.dr
m_fd, NULL),
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR2 sel fetch causes cursor to be
added to primary plane &quot; \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pages flips and async flip is not
supported in cursor\n&quot;);
&nbsp;
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 0017659d4..91e5e9b07 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1849,7 +1849,7 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * page flip with cursor legacy APIS when Intel's
PSR2 selective
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * fetch is enabled, so switching PSR1 for this whole
test.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_psr2_restore =
i915_psr2_sel_fetch_to_psr1(display.drm_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_psr2_restore =
i915_pr_psr2_sel_fetch_to_pr_psr1(display.drm_fd, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_describe(&quot;Test checks how many cursor updates we can fit
between vblanks &quot;
@@ -2074,7 +2074,7 @@ igt_main
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_fixture {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (intel_psr2_restore)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i915_psr2_sel_fetch_restore(display.drm_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i915_pr_psr2_sel_fetch_restore(display.drm_fd
, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_display_fini(&amp;display);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm_close_driver(display.drm_fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
</pre>
      </blockquote>
    </blockquote>
    Regards<br>
    Kunal <span style="white-space: pre-wrap">Joshi
</span>
  </body>
</html>

--------------Kg3tPO0XPLwyP7BIl9CmMbJv--
