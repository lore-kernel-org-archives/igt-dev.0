Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAB8C48BC3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 08:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED83610E08D;
	Mon, 19 Feb 2024 08:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XU/7FpL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD29F10E08D
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708331771; x=1739867771;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=QiSXQn5ej1qJ/noX+9322sJ942+jU5JDokhrbCCisKA=;
 b=XU/7FpL/WkSyDOCohUrQWqcqAjv3nuiz/Yjywk7/+FgrjuTmOji8pUOg
 WyID6qg+/yltwx8O5a61pdql9J7rUG5cf2IF3/psMIy9y1U1y7i9+69MP
 96X3wwlsluSnNa8mCoo0DuiqqFbCNAcPx9Tv/x+liyebuCoBYjwhoLZ3U
 6abw8NLMUTcAAJorUbt98CJiSeYL424IGoNJpEsgjTmOT1TQ7LtGAw6Hs
 RVDlP7Pcoc0tiwmuo+htzUTx9w0ga9Kzp8U/zcqIxoQIkTk0SKP2etU8E
 U4yocghcTHpmlmcYNUhwavBTgG4kyQBIRce0uBRRqVyBzi28PEsOMwgmR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="13508924"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208,217";a="13508924"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 00:36:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208,217";a="4452452"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 00:36:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 00:36:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 00:36:10 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 00:36:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn1hDpxlHGg7cTffxQNby+5oAhzILtagr9R6l7BPLM+UPVNbdqX9vns60MQik+4gOwJq8Ao2qWjeF9EYCFRXPJURsgzEzj1zhdkhmq2ha9bAhGh+NuiaorhOW7n9pEBMqY9p9cvUs9p4b9konQqK6Ca+JPJPNSwHKCXimobwqS4zHNeFEQrobPe/EhmQJ7d3H/UzyQ0rkp/1lt3CtyQGpbNKG3c0d6XyWb6iLfxuUa+cNd/pTQ0wXqwjjK85FuRsCev9QNJbDCQKeLM+fnEaLZ+iSymEMvSp1yCaD6tcseJLOzHJxbftIQswN6MXWwDIj8G6KBVWE1gblcZuFjVtwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyvmqAzY83tZtnhZ8Ljqr2mmctKaDtVdCDhWAGW+nr0=;
 b=Yqymd1tAmigtuoB4ojVL7MO34YX635XJCK6ZnUcdwLbZYRW/3v7LmK6n2BTDlCGE9Rc327g5suL7Omko305bgPn8y3saTRUX5ytOskxXTrcwVxw8sXhrEM+aaBVlz0RTs4AHcTV1AWGkNnhST1tcGg1R/8+d1ujkp06+rd1q9/7Slt6B9bGnKkl0s5Z4TNhTDk8qQctisyeskwf5JWBkNSoFTZtn9D1kzrL9LOnpCdHu05Nj5eB8DkzzIKPGyD0R66vU7bt98esDkYpB7rNtMs7/L5XA007DcR8XnPpIRUgMMSwldoJRaCfMXf8iYV1/EK6t/uW1CzmqSJjgNoVblw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Mon, 19 Feb
 2024 08:36:08 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 08:36:07 +0000
Content-Type: multipart/alternative;
 boundary="------------mpNIgnuZxcub5AZOKWwLb390"
Message-ID: <d934b05b-7ee4-4b00-8eae-09f18236e801@intel.com>
Date: Mon, 19 Feb 2024 14:06:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/igt_psr: modify library to support multiple
 PSR/PR outputs
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
References: <20240218091704.2259937-1-kunal1.joshi@intel.com>
 <20240218091704.2259937-2-kunal1.joshi@intel.com>
 <23724dffbc7d0224ea26541fa34a17ad77cc6f36.camel@intel.com>
 <6f058d0c-0cef-479e-ba87-2e263c4220ea@intel.com>
 <225179de6cf4afe93bb499790b63cd1cf4fbc3e6.camel@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <225179de6cf4afe93bb499790b63cd1cf4fbc3e6.camel@intel.com>
X-ClientProxiedBy: PN3PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::10) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|DM4PR11MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: b96662dd-65e4-49f1-8a29-08dc3125d132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gyf7QCdJRz5PVvsJLTnvVYTJrIpjC0KUS1b08MV4ovPOqBBg22aBmhL4+vQdG0Q5+BdKtDNI3gRgwZtI2doOP2YwnErTs72a53iZNkF9ksX/enIhPe/jQuqW64CoWKNrVBDHVs02R2gRyRtdnPQxpOLVITjvzk03LnIyC/DAhhqTpjkFmmQNVQCxq09kuwtrRjmCQ5AoiNY6XByI2gQM27p2oj5kSTlop66nadO72wgq9F0Lj8RQ0hWyDWM6UaSMxRDlMx9aNZ+SrXxrxQlDAXfuMl0zftofdgu6rbfnJUq0WFnUjYVnq75z0p+5FtGDf8ruv+CclcRhqVY0EPdwDc8/b48j0Z0crc5MzcmjDxRws1Hz16EXnIEJEBUr4IcJ7V4A0nSCjivWgicMDPOU14V2XUMR5Pn24cEiiJh+x5dDC+hl91jp1LOTgYtemlEO4wNO9Mul5dRBZBDwW8mftwoyONAMBOFbLX3tIKGmMzBkzxaS+ftA4uT4arNVJAHvH2DYFLj0LHHJtmnlecsF1VLCMIGTxyOqF1hQGmQBU9FlpKfNMX9GWIclMEwnAAin
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(8676002)(4326008)(66946007)(5660300002)(66556008)(31686004)(30864003)(2906002)(66476007)(8936002)(31696002)(86362001)(82960400001)(36756003)(38100700002)(83380400001)(66574015)(26005)(107886003)(2616005)(6512007)(316002)(53546011)(6486002)(478600001)(110136005)(6506007)(54906003)(6666004)(33964004)(41300700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHdtT0NRZjkrRlJsbkVCU0NFaUlpYlBueW9VWWVpVVA5bHpPTWozMnNyV1Z5?=
 =?utf-8?B?WTFQdlRCZjVGTVZmRWhnNHl1VnpEMWZTQ1Z1UHBpeDVHaEh5M2VMZVhpdzJi?=
 =?utf-8?B?aUtLclNaVitEeFQxeVVQb0lGWHdYb1R6Wm1Xa2R3ZGcvZ3ZEZ1lCSDQxT2NF?=
 =?utf-8?B?SGoyRjdPWjZ3SEw0N1ZmTk41VEMrZzN2SzVRb0JPOUdtT1ZUWVg3REtsY0RN?=
 =?utf-8?B?bVFFbExKN1l2NThEbW5uZnVtMU4wVWRzTFE2UXdwalZRMEQ1dlVqTDRBUnRm?=
 =?utf-8?B?UGVocjFkK1JFRTdENS92bStaWEgzY2l2d3dUVUdmQXhzYURjV1VNUnArMjRk?=
 =?utf-8?B?MnM3allGSFhPL0lNWGQvc2dVeVExTFhSVXoxZGxCTmxFbUJwY1F1UTllL1hQ?=
 =?utf-8?B?NURiRkFsUFZjbXZrZmJZYUFzTFNoYjFDMmtlaDdPR0srd043RXRkOWVaeVJ2?=
 =?utf-8?B?enlIaEJyWjNWR0FIWkNSVmFSOXdzdlVRQWNycEhrVko3NGdYYXlDZTZ1dGpl?=
 =?utf-8?B?cWM1aHpLMlRsY1pyNk5DKzVBeVFGUUJyMm9WV2tMT0ZySmVwb0g5SVJSMkcx?=
 =?utf-8?B?bDVib3VQOWhyb0Z0bTJKZUljMFBHQlBraGZoOURkUDZQSmJmTnBrc1pnVTJL?=
 =?utf-8?B?cFd4azJSZFYrR3JtV2F4ZjRUUzlLczNZcXJhVG5rQVJYTFdZSmJ1aEhjMXU2?=
 =?utf-8?B?aWl3OXMrVWgrRU9jUFJ4OVNWY0ljTGFyMHdQREJueThlOXBzRksyc0FrZStW?=
 =?utf-8?B?dnZ5ZFY0Y1pRdEQ2VUdGWnZIVDBQUms0WXRSdFZDOW9yOXNJWStNQW00OG02?=
 =?utf-8?B?d2xzRFlXeTNjTGN3SlpnT1hFamJWeVRyclJQYVdDVU5KM0xOUFkvcnM5Yjgw?=
 =?utf-8?B?TzUxUjlLK1JkMEw2eGZpQS9VQThBZVN2WS8xeWpaR0NoZ2ljMHNnZmhKY2Rx?=
 =?utf-8?B?a0ZCUUxlc3BRckJkNzBZT2V5c1ZBRGxzblNJYjFnVzF1OTZ1dnA2M00vKzVt?=
 =?utf-8?B?eE0rRGpQQTR5Nm9PNXJqdTBDTE9LV2RlTEh2MUswdm80V2FCVEdrZnBoMWR3?=
 =?utf-8?B?T1N3WWpub2FVaG9uZ3hSZE1MSnNxcHRmcmczZGhhSVBJSUwrQ3poRDAxNkti?=
 =?utf-8?B?anc4VVR4RUNHdFI5VVhFZzhNMHhiWkNCNWRhekNqOUxBUXc0ZDlWMXBEb1R1?=
 =?utf-8?B?T2xRcGEwaFhha211T1lzUmJsQkhuNjNvMjRkcGRHek9vbTFtaFlKWkNaNDZX?=
 =?utf-8?B?ck1GcHVsUm9hcGhwME8xSGEwdng1WHNGaG14ZUVDRWsrOGp5NFVrdWhWZWh2?=
 =?utf-8?B?WExHVFlQSHFuelM3aU5HcG0zcTV4TEZpS1g3eUVGSDhJMnUrMFdMcFpDbFFv?=
 =?utf-8?B?NXhJK042V05oQnZ4MlN6eVdzWmN6Uzd3YU1FNG9kSUVRMS8wZll5aFZBM045?=
 =?utf-8?B?YTQvMFZhKzRPVlYxMWxPRDlyUzFZU2FVdUtVenowWFN0Q2dLd1RNQjI4d2U3?=
 =?utf-8?B?VXZhYWlXS0s2algxUjFqTUFjTE5veXRMT2R4N3J4V3RYeVI3VGpxYzJiU2h5?=
 =?utf-8?B?dSszOTZ0NGhjMERzR2tMb0Z3V1JsM0pkZTVPeEw3QkZUR2hpVWFzbnIxeUFC?=
 =?utf-8?B?eUVMUkV3ZjlvcGhlbEFPcTlzM0w5MFRPdGs0TDZOV2xlVXltVFdhWlM2VGtz?=
 =?utf-8?B?QzgwK2Z4a0VVMlk5aUNDR0E5NWlIWTI3elh5c2tEU1dqM0JaNTk3OTZqUE5K?=
 =?utf-8?B?eTlsUitFckxyNWNnTmZ6bmMyQWZSVnhZNU5DeE96QmVTZFRIaVluZHlaUEhp?=
 =?utf-8?B?TzNYTU96a2xha2RZTkdxb1VDdUdwN0YrTFk2OHBLWWJEeUhTVHV3WjArTlQv?=
 =?utf-8?B?WTc4ZXF3UzM3cDBHNDdTaTlrMzVMVDB5bms0MWoxeGFnOW9ENkNrNWU0a0th?=
 =?utf-8?B?N2lyMXhsSGlRMmhDUHBtUUJ3NTdrQS9zQWNIYzI0OHNUK243a2xxN0VqQkhy?=
 =?utf-8?B?SHZZMEt0aVI4QzcyZDNYR25OR1NQUXpsTHFiTzlYS0RwSDkxc2VzYjZXam5E?=
 =?utf-8?B?OXhCTEx5dk5hZXZpT0lqUGNpWUdFWGl0TEhDb2hqT3lka0o5RmZUQnBPZi9m?=
 =?utf-8?B?ZHdkOUlFNFErZCtEUlBITDRmd1U0dUhQc0NDREhxOXNpK3lCRE5yL3JIbFRo?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b96662dd-65e4-49f1-8a29-08dc3125d132
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 08:36:07.8997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cL4ShQI72p1v1/ygAs0+2/3ZTOflm9fvfM4TU6ncp9s3ZyrjxlW0DTWxibftCNBSX+1XQX7NJ9IwZUEc0dJ9xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7328
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

--------------mpNIgnuZxcub5AZOKWwLb390
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hello Jouni,

On 2/19/2024 2:03 PM, Hogander, Jouni wrote:
> On Mon, 2024-02-19 at 13:37 +0530, Joshi, Kunal1 wrote:
>> Hello Jouni,
>>
>> On 2/19/2024 1:15 PM, Hogander, Jouni wrote:
>>> On Sun, 2024-02-18 at 14:47 +0530, Kunal Joshi wrote:
>>>> We can have multiple panels connected to the system so PSR
>>>> information
>>>> should be exposed per output. changes provide support for
>>>> multiple
>>>> PSR/PR to be tested simultaneously.
>>>>
>>>> Cc: Jouni Högander<jouni.hogander@intel.com>
>>>> Cc: Animesh Manna<animesh.manna@intel.com>
>>>> Cc: Arun R Murthy<arun.r.murthy@intel.com>
>>>> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
>>>> ---
>>>>    lib/igt_psr.c                          | 76 ++++++++++++++-----
>>>> -----
>>>> --
>>>>    lib/igt_psr.h                          | 14 ++---
>>>>    tests/intel/kms_dirtyfb.c              |  4 +-
>>>>    tests/intel/kms_fbcon_fbt.c            |  4 +-
>>>>    tests/intel/kms_frontbuffer_tracking.c |  4 +-
>>>>    tests/intel/kms_pm_dc.c                |  6 +-
>>>>    tests/intel/kms_psr.c                  |  4 +-
>>>>    tests/intel/kms_psr2_sf.c              |  8 ---
>>>>    tests/intel/kms_psr2_su.c              |  2 +-
>>>>    tests/intel/kms_psr_stress_test.c      |  4 +-
>>>>    tests/kms_async_flips.c                |  4 +-
>>>>    tests/kms_cursor_legacy.c              |  4 +-
>>>>    12 files changed, 65 insertions(+), 69 deletions(-)
>>>>
>>>> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
>>>> index ac214fcfc..cad8cce05 100644
>>>> --- a/lib/igt_psr.c
>>>> +++ b/lib/igt_psr.c
>>>> @@ -27,6 +27,10 @@
>>>>    #include "igt_sysfs.h"
>>>>    #include <errno.h>
>>>>    
>>>> +#define SET_DEBUGFS_PATH(output, path) \
>>>> +       sprintf(path, "%s%s%s", output ? output->name : "",
>>>> output ?
>>>> "/" : "", \
>>>> +                       output ? "i915_psr_status" :
>>>> "i915_edp_psr_status")
>>>> +
>>>>    bool psr_disabled_check(int debugfs_fd)
>>>>    {
>>>>           char buf[PSR_STATUS_MAX_LEN];
>>>> @@ -37,11 +41,13 @@ bool psr_disabled_check(int debugfs_fd)
>>>>           return strstr(buf, "PSR mode: disabled\n");
>>>>    }
>>>>    
>>>> -bool psr2_selective_fetch_check(int debugfs_fd)
>>>> +bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t
>>>> *output)
>>>>    {
>>>>           char buf[PSR_STATUS_MAX_LEN];
>>>> +       char debugfs_file[128] = {0};
>>>>    
>>>> -       igt_debugfs_simple_read(debugfs_fd,
>>>> "i915_edp_psr_status",
>>>> buf,
>>>> +       SET_DEBUGFS_PATH(output, debugfs_file);
>>>> +       igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>>>>                                   sizeof(buf));
>>>>    
>>>>           return strstr(buf, "PSR2 selective fetch: enabled");
>>>> @@ -54,11 +60,7 @@ static bool psr_active_check(int debugfs_fd,
>>>> enum
>>>> psr_mode mode, igt_output_t *o
>>>>           const char *state = (mode == PSR_MODE_1 || mode ==
>>>> PR_MODE) ?
>>>> "SRDENT" : "DEEP_SLEEP";
>>>>           int ret;
>>>>    
>>>> -       if (output)
>>>> -               sprintf(debugfs_file, "%s/i915_psr_status",
>>>> output-
>>>>> name);
>>>> -       else
>>>> -               sprintf(debugfs_file, "%s",
>>>> "i915_edp_psr_status");
>>>> -
>>>> +       SET_DEBUGFS_PATH(output, debugfs_file);
>>>>           ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
>>>>                                        buf, sizeof(buf));
>>>>           if (ret < 0) {
>>>> @@ -90,13 +92,18 @@ bool psr_long_wait_update(int debugfs_fd,
>>>> enum
>>>> psr_mode mode, igt_output_t *outp
>>>>           return igt_wait(!psr_active_check(debugfs_fd, mode,
>>>> output),
>>>> 500, 10);
>>>>    }
>>>>    
>>>> -static ssize_t psr_write(int debugfs_fd, const char *buf)
>>>> +static ssize_t psr_write(int debugfs_fd, const char *buf,
>>>> igt_output_t *output)
>>>>    {
>>>> +       /*
>>>> +        * FIXME: Currently we don't have separate psr_debug file
>>>> for
>>>> each output.
>>>> +        * so, we are using i915_edp_psr_debug file for all
>>>> outputs.
>>>> +        * Later we need to add support for separate psr_debug
>>>> file
>>>> for each output.
>>>> +        */
>>>>           return igt_sysfs_write(debugfs_fd, "i915_edp_psr_debug",
>>>> buf,
>>>> -                              strlen(buf));
>>>> +                                                  strlen(buf));
>>>>    }
>>>>    
>>>> -static int has_psr_debugfs(int debugfs_fd)
>>>> +static int has_psr_debugfs(int debugfs_fd, igt_output_t *output)
>>>>    {
>>>>           int ret;
>>>>    
>>>> @@ -105,7 +112,7 @@ static int has_psr_debugfs(int debugfs_fd)
>>>>            * Legacy mode will return OK here, debugfs api will
>>>> return -
>>>> EINVAL.
>>>>            * -ENODEV is returned when PSR is unavailable.
>>>>            */
>>>> -       ret = psr_write(debugfs_fd, "0xf");
>>>> +       ret = psr_write(debugfs_fd, "0xf", output);
>>>>           if (ret == -EINVAL) {
>>>>                   errno = 0;
>>>>                   return 0;
>>>> @@ -113,7 +120,7 @@ static int has_psr_debugfs(int debugfs_fd)
>>>>                   return ret;
>>>>    
>>>>           /* legacy debugfs api, we enabled irqs by writing,
>>>> disable
>>>> them. */
>>>> -       psr_write(debugfs_fd, "0");
>>>> +       psr_write(debugfs_fd, "0", output);
>>>>           return -EINVAL;
>>>>    }
>>>>    
>>>> @@ -134,14 +141,14 @@ static int psr_restore_debugfs_fd = -1;
>>>>    
>>>>    static void restore_psr_debugfs(int sig)
>>>>    {
>>>> -       psr_write(psr_restore_debugfs_fd, "0");
>>>> +       psr_write(psr_restore_debugfs_fd, "0", NULL);
>>>>    }
>>>>    
>>>> -static bool psr_set(int device, int debugfs_fd, int mode)
>>>> +static bool psr_set(int device, int debugfs_fd, int mode,
>>>> igt_output_t *output)
>>>>    {
>>>>           int ret;
>>>>    
>>>> -       ret = has_psr_debugfs(debugfs_fd);
>>>> +       ret = has_psr_debugfs(debugfs_fd, output);
>>>>           if (ret == -ENODEV) {
>>>>                   igt_skip("PSR not available\n");
>>>>                   return false;
>>>> @@ -179,7 +186,7 @@ static bool psr_set(int device, int
>>>> debugfs_fd,
>>>> int mode)
>>>>                           debug_val = "0x1";
>>>>                   }
>>>>    
>>>> -               ret = psr_write(debugfs_fd, debug_val);
>>>> +               ret = psr_write(debugfs_fd, debug_val, output);
>>>>                   igt_require_f(ret > 0, "PSR2 SF feature not
>>>> available\n");
>>>>           }
>>>>    
>>>> @@ -193,15 +200,15 @@ static bool psr_set(int device, int
>>>> debugfs_fd,
>>>> int mode)
>>>>           return ret;
>>>>    }
>>>>    
>>>> -bool psr_enable(int device, int debugfs_fd, enum psr_mode mode)
>>>> +bool psr_enable(int device, int debugfs_fd, enum psr_mode mode,
>>>> igt_output_t *output)
>>>>    {
>>>> -       return psr_set(device, debugfs_fd, mode);
>>>> +       return psr_set(device, debugfs_fd, mode, output);
>>>>    }
>>>>    
>>>> -bool psr_disable(int device, int debugfs_fd)
>>>> +bool psr_disable(int device, int debugfs_fd, igt_output_t
>>>> *output)
>>>>    {
>>>>           /* Any mode different than PSR_MODE_1/2 will disable PSR
>>>> */
>>>> -       return psr_set(device, debugfs_fd, -1);
>>>> +       return psr_set(device, debugfs_fd, -1, output);
>>>>    }
>>>>    
>>>>    bool psr_sink_support(int device, int debugfs_fd, enum psr_mode
>>>> mode, igt_output_t *output)
>>>> @@ -211,11 +218,7 @@ bool psr_sink_support(int device, int
>>>> debugfs_fd, enum psr_mode mode, igt_output
>>>>           char buf[PSR_STATUS_MAX_LEN];
>>>>           int ret;
>>>>    
>>>> -       if (output)
>>>> -               sprintf(debugfs_file, "%s/i915_psr_status",
>>>> output-
>>>>> name);
>>>> -       else
>>>> -               sprintf(debugfs_file, "%s",
>>>> "i915_edp_psr_status");
>>>> -
>>>> +       SET_DEBUGFS_PATH(output, debugfs_file);
>>>>           ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
>>>> buf,
>>>>                                         sizeof(buf));
>>>>           if (ret < 1)
>>>> @@ -305,7 +308,7 @@ void psr_print_debugfs(int debugfs_fd)
>>>>           igt_info("%s", buf);
>>>>    }
>>>>    
>>>> -bool i915_psr2_selective_fetch_check(int drm_fd)
>>>> +bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
>>>> *output)
>>>>    {
>>>>           int debugfs_fd;
>>>>           bool ret;
>>>> @@ -314,7 +317,7 @@ bool i915_psr2_selective_fetch_check(int
>>>> drm_fd)
>>>>                   return false;
>>>>    
>>>>           debugfs_fd = igt_debugfs_dir(drm_fd);
>>>> -       ret = psr2_selective_fetch_check(debugfs_fd);
>>>> +       ret = psr2_selective_fetch_check(debugfs_fd, output);
>>>>           close(debugfs_fd);
>>>>    
>>>>           return ret;
>>>> @@ -331,7 +334,7 @@ bool i915_psr2_selective_fetch_check(int
>>>> drm_fd)
>>>>     * Returns:
>>>>     * True if PSR mode changed to PSR1, false otherwise.
>>>>     */
>>>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
>>>> +bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t
>>>> *output)
>>>>    {
>>>>           int debugfs_fd;
>>>>           bool ret = false;
>>>> @@ -340,8 +343,8 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
>>>>                   return ret;
>>>>    
>>>>           debugfs_fd = igt_debugfs_dir(drm_fd);
>>>> -       if (psr2_selective_fetch_check(debugfs_fd)) {
>>>> -               psr_set(drm_fd, debugfs_fd, PSR_MODE_1);
>>>> +       if (psr2_selective_fetch_check(debugfs_fd, output)) {
>>>> +               psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
>>>>                   ret = true;
>>>>           }
>>>>    
>>>> @@ -355,12 +358,12 @@ bool i915_psr2_sel_fetch_to_psr1(int
>>>> drm_fd)
>>>>     * Restore PSR2 selective fetch after tests were executed, this
>>>> function should
>>>>     * only be called if i915_psr2_sel_fetch_to_psr1() returned
>>>> true.
>>>>     */
>>>> -void i915_psr2_sel_fetch_restore(int drm_fd)
>>>> +void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t
>>>> *output)
>>>>    {
>>>>           int debugfs_fd;
>>>>    
>>>>           debugfs_fd = igt_debugfs_dir(drm_fd);
>>>> -       psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH);
>>>> +       psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH,
>>>> output);
>>>>           close(debugfs_fd);
>>>>    }
>>>>    
>>>> @@ -369,16 +372,17 @@ void i915_psr2_sel_fetch_restore(int
>>>> drm_fd)
>>>>     *
>>>>     * Return the current PSR mode.
>>>>     */
>>>> -enum psr_mode psr_get_mode(int debugfs_fd)
>>>> +enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
>>>>    {
>>>>           char buf[PSR_STATUS_MAX_LEN];
>>>> +       char debugfs_file[128] = {0};
>>>>           int ret;
>>>>    
>>>> -
>>>> -       ret = igt_debugfs_simple_read(debugfs_fd,
>>>> "i915_edp_psr_status", buf,
>>>> +       SET_DEBUGFS_PATH(output, debugfs_file);
>>>> +       ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
>>>> buf,
>>>>                                         sizeof(buf));
>>>>           if (ret < 0) {
>>>> -               igt_info("Could not read i915_edp_psr_status:
>>>> %s\n",
>>>> +               igt_info("Could not read psr status: %s\n",
>>>>                            strerror(-ret));
>>>>                   return PSR_DISABLED;
>>>>           }
>>>> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
>>>> index 82a4e8c5e..372bef2b2 100644
>>>> --- a/lib/igt_psr.h
>>>> +++ b/lib/igt_psr.h
>>>> @@ -46,21 +46,21 @@ enum fbc_mode {
>>>>    };
>>>>    
>>>>    bool psr_disabled_check(int debugfs_fd);
>>>> -bool psr2_selective_fetch_check(int debugfs_fd);
>>>> +bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t
>>>> *output);
>>>>    bool psr_wait_entry(int debugfs_fd, enum psr_mode mode,
>>>> igt_output_t
>>>> *output);
>>>>    bool psr_wait_update(int debugfs_fd, enum psr_mode mode,
>>>> igt_output_t *output);
>>>>    bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode,
>>>> igt_output_t *output);
>>>> -bool psr_enable(int device, int debugfs_fd, enum psr_mode);
>>>> -bool psr_disable(int device, int debugfs_fd);
>>>> +bool psr_enable(int device, int debugfs_fd, enum psr_mode,
>>>> igt_output_t *output);
>>>> +bool psr_disable(int device, int debugfs_fd, igt_output_t
>>>> *output);
>>>>    bool psr_sink_support(int device, int debugfs_fd, enum psr_mode
>>>> mode, igt_output_t *output);
>>>>    bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
>>>>    void psr_print_debugfs(int debugfs_fd);
>>>> -enum psr_mode psr_get_mode(int debugfs_fd);
>>>> +enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t
>>>> *output);
>>>>    
>>>> -bool i915_psr2_selective_fetch_check(int drm_fd);
>>>> +bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
>>>> *output);
>>>>    
>>>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
>>>> -void i915_psr2_sel_fetch_restore(int drm_fd);
>>>> +bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t
>>>> *output);
>>>> +void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t
>>>> *output);
>>>>    bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
>>>>    
>>>>    #endif
>>>> diff --git a/tests/intel/kms_dirtyfb.c
>>>> b/tests/intel/kms_dirtyfb.c
>>>> index 26b82e50a..c2411c824 100644
>>>> --- a/tests/intel/kms_dirtyfb.c
>>>> +++ b/tests/intel/kms_dirtyfb.c
>>>> @@ -127,7 +127,7 @@ static void enable_feature(data_t *data)
>>>>                   intel_fbc_enable(data->drm_fd);
>>>>                   break;
>>>>           case FEATURE_PSR:
>>>> -               psr_enable(data->drm_fd, data->debugfs_fd,
>>>> PSR_MODE_1);
>>>> +               psr_enable(data->drm_fd, data->debugfs_fd,
>>>> PSR_MODE_1, NULL);
>>>>                   break;
>>>>           case FEATURE_DRRS:
>>>>                   intel_drrs_enable(data->drm_fd, data->pipe);
>>>> @@ -167,7 +167,7 @@ static void check_feature(data_t *data)
>>>>    static void disable_features(data_t *data)
>>>>    {
>>>>           intel_fbc_disable(data->drm_fd);
>>>> -       psr_disable(data->drm_fd, data->debugfs_fd);
>>>> +       psr_disable(data->drm_fd, data->debugfs_fd, NULL);
>>>>           intel_drrs_disable(data->drm_fd, data->pipe);
>>>>    }
>>>>    
>>>> diff --git a/tests/intel/kms_fbcon_fbt.c
>>>> b/tests/intel/kms_fbcon_fbt.c
>>>> index 90484dccf..71e42f19c 100644
>>>> --- a/tests/intel/kms_fbcon_fbt.c
>>>> +++ b/tests/intel/kms_fbcon_fbt.c
>>>> @@ -277,7 +277,7 @@ static void disable_features(int device, int
>>>> debugfs_fd)
>>>>    {
>>>>           igt_set_module_param_int(device, "enable_fbc", 0);
>>>>           if (psr_sink_support(device, debugfs_fd, PSR_MODE_1,
>>>> NULL))
>>>> -               psr_disable(device, debugfs_fd);
>>>> +               psr_disable(device, debugfs_fd, NULL);
>>>>    }
>>>>    
>>>>    static inline void fbc_modparam_enable(int device, int
>>>> debugfs_fd)
>>>> @@ -287,7 +287,7 @@ static inline void fbc_modparam_enable(int
>>>> device, int debugfs_fd)
>>>>    
>>>>    static inline void psr_debugfs_enable(int device, int
>>>> debugfs_fd)
>>>>    {
>>>> -       psr_enable(device, debugfs_fd, PSR_MODE_1);
>>>> +       psr_enable(device, debugfs_fd, PSR_MODE_1, NULL);
>>>>    }
>>>>    
>>>>    static void fbc_skips_on_fbcon(int debugfs_fd)
>>>> diff --git a/tests/intel/kms_frontbuffer_tracking.c
>>>> b/tests/intel/kms_frontbuffer_tracking.c
>>>> index 912cca3f8..023843161 100644
>>>> --- a/tests/intel/kms_frontbuffer_tracking.c
>>>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>>>> @@ -2234,7 +2234,7 @@ static bool disable_features(const struct
>>>> test_mode *t)
>>>>           intel_fbc_disable(drm.fd);
>>>>           intel_drrs_disable(drm.fd, prim_mode_params.pipe);
>>>>    
>>>> -       return psr.can_test ? psr_disable(drm.fd, drm.debugfs) :
>>>> false;
>>>> +       return psr.can_test ? psr_disable(drm.fd, drm.debugfs,
>>>> NULL)
>>>> : false;
>>>>    }
>>>>    
>>>>    static void *busy_thread_func(void *data)
>>>> @@ -2867,7 +2867,7 @@ static bool enable_features_for_test(const
>>>> struct test_mode *t)
>>>>           if (t->feature & FEATURE_FBC)
>>>>                   intel_fbc_enable(drm.fd);
>>>>           if (t->feature & FEATURE_PSR)
>>>> -               ret = psr_enable(drm.fd, drm.debugfs,
>>>> PSR_MODE_1);
>>>> +               ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1,
>>>> NULL);
>>>>           if (t->feature & FEATURE_DRRS)
>>>>                   intel_drrs_enable(drm.fd,
>>>> prim_mode_params.pipe);
>>>>    
>>>> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
>>>> index 0d5824e67..7deebf83d 100644
>>>> --- a/tests/intel/kms_pm_dc.c
>>>> +++ b/tests/intel/kms_pm_dc.c
>>>> @@ -362,7 +362,7 @@ static void require_dc_counter(int
>>>> debugfs_fd,
>>>> int dc_flag)
>>>>    static void setup_dc3co(data_t *data)
>>>>    {
>>>>           data->op_psr_mode = PSR_MODE_2;
>>>> -       psr_enable(data->drm_fd, data->debugfs_fd, data-
>>>>> op_psr_mode);
>>>> +       psr_enable(data->drm_fd, data->debugfs_fd, data-
>>>>> op_psr_mode,
>>>> NULL);
>>>>           igt_require_f(psr_wait_entry(data->debugfs_fd, data-
>>>>> op_psr_mode, NULL),
>>>>                         "PSR2 is not enabled\n");
>>>>    }
>>>> @@ -665,7 +665,7 @@ igt_main
>>>>                   igt_require(psr_sink_support(data.drm_fd,
>>>> data.debugfs_fd,
>>>>                                                PSR_MODE_1, NULL));
>>>>                   data.op_psr_mode = PSR_MODE_1;
>>>> -               psr_enable(data.drm_fd, data.debugfs_fd,
>>>> data.op_psr_mode);
>>>> +               psr_enable(data.drm_fd, data.debugfs_fd,
>>>> data.op_psr_mode, NULL);
>>>>                   test_dc_state_psr(&data, CHECK_DC5);
>>>>           }
>>>>    
>>>> @@ -675,7 +675,7 @@ igt_main
>>>>                   igt_require(psr_sink_support(data.drm_fd,
>>>> data.debugfs_fd,
>>>>                                                PSR_MODE_1, NULL));
>>>>                   data.op_psr_mode = PSR_MODE_1;
>>>> -               psr_enable(data.drm_fd, data.debugfs_fd,
>>>> data.op_psr_mode);
>>>> +               psr_enable(data.drm_fd, data.debugfs_fd,
>>>> data.op_psr_mode, NULL);
>>>>                   igt_require_f(igt_pm_pc8_plus_residencies_enable
>>>> d(dat
>>>> a.msr_fd),
>>>>                                 "PC8+ residencies not
>>>> supported\n");
>>>>                   if (intel_display_ver(data.devid) >= 14)
>>>> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
>>>> index 521d4c708..3822b3081 100644
>>>> --- a/tests/intel/kms_psr.c
>>>> +++ b/tests/intel/kms_psr.c
>>>> @@ -519,7 +519,7 @@ static bool psr_enable_if_enabled(data_t
>>>> *data)
>>>>                   igt_skip("enable_psr modparam doesn't allow psr
>>>> mode
>>>> %d\n",
>>>>                            data->op_psr_mode);
>>>>    
>>>> -       return psr_enable(data->drm_fd, data->debugfs_fd, data-
>>>>> op_psr_mode);
>>>> +       return psr_enable(data->drm_fd, data->debugfs_fd, data-
>>>>> op_psr_mode, data->output);
>>>>    }
>>>>    
>>>>    static inline void manual(const char *expected)
>>>> @@ -658,6 +658,7 @@ static void test_cleanup(data_t *data)
>>>>    
>>>>           igt_remove_fb(data->drm_fd, &data->fb_green);
>>>>           igt_remove_fb(data->drm_fd, &data->fb_white);
>>>> +       psr_disable(data->drm_fd, data->debugfs_fd, data-
>>>>> output);
>>>>    }
>>>>    
>>>>    static void setup_test_plane(data_t *data, int test_plane)
>>>> @@ -976,7 +977,6 @@ igt_main
>>>>           }
>>>>    
>>>>           igt_fixture {
>>>> -               psr_disable(data.drm_fd, data.debugfs_fd);
>>>>                   close(data.debugfs_fd);
>>>>                   buf_ops_destroy(data.bops);
>>>> diff --git a/tests/intel/kms_psr2_sf.c
>>>> b/tests/intel/kms_psr2_sf.c
>>>> index ecf9ad77f..8e6a9e02c 100644
>>>> --- a/tests/intel/kms_psr2_sf.c
>>>> +++ b/tests/intel/kms_psr2_sf.c
>>>> @@ -1012,11 +1012,6 @@ igt_main
>>>>                           data.fbc_flag = true;
>>>>                   }
>>>>    
>>>> -               /* Test if PSR2 can be enabled */
>>>> -               igt_require_f(psr_enable(data.drm_fd,
>>>> -                                        data.debugfs_fd,
>>>> PSR_MODE_2_SEL_FETCH),
>>>> -                             "Error enabling PSR2\n");
>>>> -
>>> I started to think it might actually not make sense to remove this.
>>> Currently kms_psr2_sf is skipped if psr debugfs interface doesn't
>>> exist. I.e. PSR is not supported by the platform. This is with
>>> reasonable info "PSR not available". After your change it will
>>> assert
>>> below as debugfs entry can't be opened.
>>>
>>> BR,
>>>
>>> Jouni Högander
>>
>> Thanks for catching this,
>> How about having a check before looping on all output to check if we
>> have psr_debug interface present?
> I think that is ok as well. But you can drop this change completely as
> well.
>
> BR,
>
> Jouni Högander

I think we need to remove this check as we check specifically for 
PSR_MODE_2_SEL_FETCH Even though it doesn't matter but for readability 
purpose. Let me know if you think otherwise. Thanks and Regards Kunal Joshi

>
>> Thanks and Regards
>> Kunal Joshi
>>
>>>>                   data.damage_area_count = MAX_DAMAGE_AREAS;
>>>>                   data.primary_format = DRM_FORMAT_XRGB8888;
>>>>    
>>>> @@ -1026,9 +1021,6 @@ igt_main
>>>>                   igt_info("Big framebuffer size %dx%d\n",
>>>>                            data.big_fb_width, data.big_fb_height);
>>>>    
>>>> -
>>>>                  igt_require_f(psr2_selective_fetch_check(data.deb
>>>> ugfs_f
>>>> d),
>>>> -                             "PSR2 selective fetch not
>>>> enabled\n");
>>>> -
>>>>                   for_each_pipe_with_valid_output(&data.display,
>>>> data.pipe, data.output) {
>>>>                           coexist_features[n_pipes] = 0;
>>>>                           if (check_psr2_support(&data)) {
>>>> diff --git a/tests/intel/kms_psr2_su.c
>>>> b/tests/intel/kms_psr2_su.c
>>>> index 936b5beb3..437ee36f6 100644
>>>> --- a/tests/intel/kms_psr2_su.c
>>>> +++ b/tests/intel/kms_psr2_su.c
>>>> @@ -338,7 +338,7 @@ igt_main
>>>>    
>>>>                   /* Test if PSR2 can be enabled */
>>>>                   igt_require_f(psr_enable(data.drm_fd,
>>>> -                                        data.debugfs_fd,
>>>> PSR_MODE_2),
>>>> +                                        data.debugfs_fd,
>>>> PSR_MODE_2,
>>>> NULL),
>>>>                                 "Error enabling PSR2\n");
>>>>                   data.op = FRONTBUFFER;
>>>>                   data.format = DRM_FORMAT_XRGB8888;
>>>> diff --git a/tests/intel/kms_psr_stress_test.c
>>>> b/tests/intel/kms_psr_stress_test.c
>>>> index 7aea8e8a5..bca3bd513 100644
>>>> --- a/tests/intel/kms_psr_stress_test.c
>>>> +++ b/tests/intel/kms_psr_stress_test.c
>>>> @@ -230,7 +230,7 @@ static void prepare(data_t *data)
>>>>           r = timerfd_settime(data->completed_timerfd, 0,
>>>> &interval,
>>>> NULL);
>>>>           igt_require_f(r != -1, "Error setting
>>>> completed_timerfd\n");
>>>>    
>>>> -       data->initial_state = psr_get_mode(data->debugfs_fd);
>>>> +       data->initial_state = psr_get_mode(data->debugfs_fd,
>>>> NULL);
>>>>           igt_require(data->initial_state != PSR_DISABLED);
>>>>           igt_require(psr_wait_entry(data->debugfs_fd, data-
>>>>> initial_state, NULL));
>>>>    }
>>>> @@ -343,7 +343,7 @@ static void run(data_t *data)
>>>>           }
>>>>    
>>>>           /* Check if after all this stress the PSR is still in
>>>> the
>>>> same state */
>>>> -       igt_assert(psr_get_mode(data->debugfs_fd) == data-
>>>>> initial_state);
>>>> +       igt_assert(psr_get_mode(data->debugfs_fd, NULL) == data-
>>>>> initial_state);
>>>>    }
>>>>    
>>>>    igt_main
>>>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>>>> index a0349fa03..2895168f7 100644
>>>> --- a/tests/kms_async_flips.c
>>>> +++ b/tests/kms_async_flips.c
>>>> @@ -391,7 +391,7 @@ static void test_cursor(data_t *data)
>>>>            * necessary, causing the async flip to fail because
>>>> async
>>>> flip is not
>>>>            * supported in cursor plane.
>>>>            */
>>>> -       igt_skip_on_f(i915_psr2_selective_fetch_check(data-
>>>>> drm_fd),
>>>> +       igt_skip_on_f(i915_psr2_selective_fetch_check(data-
>>>>> drm_fd,
>>>> NULL),
>>>>                         "PSR2 sel fetch causes cursor to be added
>>>> to
>>>> primary plane " \
>>>>                         "pages flips and async flip is not
>>>> supported in
>>>> cursor\n");
>>>>    
>>>> @@ -704,7 +704,7 @@ igt_main
>>>>                    * necessary, causing the async flip to fail
>>>> because
>>>> async flip is not
>>>>                    * supported in cursor plane.
>>>>                    */
>>>> -
>>>>                  igt_skip_on_f(i915_psr2_selective_fetch_check(dat
>>>> a.drm_
>>>> fd),
>>>> +               igt_skip_on_f(i915_psr2_selective_fetch_check(dat
>>>> a.dr
>>>> m_fd, NULL),
>>>>                                 "PSR2 sel fetch causes cursor to
>>>> be
>>>> added to primary plane " \
>>>>                                 "pages flips and async flip is not
>>>> supported in cursor\n");
>>>>    
>>>> diff --git a/tests/kms_cursor_legacy.c
>>>> b/tests/kms_cursor_legacy.c
>>>> index 0017659d4..a430f735a 100644
>>>> --- a/tests/kms_cursor_legacy.c
>>>> +++ b/tests/kms_cursor_legacy.c
>>>> @@ -1849,7 +1849,7 @@ igt_main
>>>>                    * page flip with cursor legacy APIS when
>>>> Intel's
>>>> PSR2 selective
>>>>                    * fetch is enabled, so switching PSR1 for this
>>>> whole
>>>> test.
>>>>                    */
>>>> -               intel_psr2_restore =
>>>> i915_psr2_sel_fetch_to_psr1(display.drm_fd);
>>>> +               intel_psr2_restore =
>>>> i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
>>>>           }
>>>>    
>>>>           igt_describe("Test checks how many cursor updates we can
>>>> fit
>>>> between vblanks "
>>>> @@ -2074,7 +2074,7 @@ igt_main
>>>>    
>>>>           igt_fixture {
>>>>                   if (intel_psr2_restore)
>>>> -
>>>>                         i915_psr2_sel_fetch_restore(display.drm_fd)
>>>> ;
>>>> +                       i915_psr2_sel_fetch_restore(display.drm_f
>>>> d,
>>>> NULL);
>>>>                   igt_display_fini(&display);
>>>>                   drm_close_driver(display.drm_fd);
>>>>           }
--------------mpNIgnuZxcub5AZOKWwLb390
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello Jouni,<br>
    </p>
    <div class="moz-cite-prefix">On 2/19/2024 2:03 PM, Hogander, Jouni
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:225179de6cf4afe93bb499790b63cd1cf4fbc3e6.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 2024-02-19 at 13:37 +0530, Joshi, Kunal1 wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hello Jouni,

On 2/19/2024 1:15 PM, Hogander, Jouni wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Sun, 2024-02-18 at 14:47 +0530, Kunal Joshi wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">We can have multiple panels connected to the system so PSR
information
should be exposed per output. changes provide support for
multiple
PSR/PR to be tested simultaneously.

Cc: Jouni Högander <a class="moz-txt-link-rfc2396E" href="mailto:jouni.hogander@intel.com">&lt;jouni.hogander@intel.com&gt;</a>
Cc: Animesh Manna <a class="moz-txt-link-rfc2396E" href="mailto:animesh.manna@intel.com">&lt;animesh.manna@intel.com&gt;</a>
Cc: Arun R Murthy <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a>
Signed-off-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
---
&nbsp;&nbsp;lib/igt_psr.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 76 ++++++++++++++-----
-----
--
&nbsp;&nbsp;lib/igt_psr.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 14 ++---
&nbsp;&nbsp;tests/intel/kms_dirtyfb.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
&nbsp;&nbsp;tests/intel/kms_fbcon_fbt.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
&nbsp;&nbsp;tests/intel/kms_frontbuffer_tracking.c |&nbsp; 4 +-
&nbsp;&nbsp;tests/intel/kms_pm_dc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 6 +-
&nbsp;&nbsp;tests/intel/kms_psr.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
&nbsp;&nbsp;tests/intel/kms_psr2_sf.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ---
&nbsp;&nbsp;tests/intel/kms_psr2_su.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp;&nbsp;tests/intel/kms_psr_stress_test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
&nbsp;&nbsp;tests/kms_async_flips.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
&nbsp;&nbsp;tests/kms_cursor_legacy.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
&nbsp;&nbsp;12 files changed, 65 insertions(+), 69 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index ac214fcfc..cad8cce05 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -27,6 +27,10 @@
&nbsp;&nbsp;#include &quot;igt_sysfs.h&quot;
&nbsp;&nbsp;#include &lt;errno.h&gt;
&nbsp; 
+#define SET_DEBUGFS_PATH(output, path) \
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(path, &quot;%s%s%s&quot;, output ? output-&gt;name : &quot;&quot;,
output ?
&quot;/&quot; : &quot;&quot;, \
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;output ? &quot;i915_psr_status&quot; :
&quot;i915_edp_psr_status&quot;)
+
&nbsp;&nbsp;bool psr_disabled_check(int debugfs_fd)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char buf[PSR_STATUS_MAX_LEN];
@@ -37,11 +41,13 @@ bool psr_disabled_check(int debugfs_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return strstr(buf, &quot;PSR mode: disabled\n&quot;);
&nbsp;&nbsp;}
&nbsp; 
-bool psr2_selective_fetch_check(int debugfs_fd)
+bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t
*output)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char buf[PSR_STATUS_MAX_LEN];
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char debugfs_file[128] = {0};
&nbsp; 
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_debugfs_simple_read(debugfs_fd,
&quot;i915_edp_psr_status&quot;,
buf,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SET_DEBUGFS_PATH(output, debugfs_file);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sizeof(buf));
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return strstr(buf, &quot;PSR2 selective fetch: enabled&quot;);
@@ -54,11 +60,7 @@ static bool psr_active_check(int debugfs_fd,
enum
psr_mode mode, igt_output_t *o
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const char *state = (mode == PSR_MODE_1 || mode ==
PR_MODE) ?
&quot;SRDENT&quot; : &quot;DEEP_SLEEP&quot;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret;
&nbsp; 
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (output)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s/i915_psr_status&quot;,
output-
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">name);
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s&quot;,
&quot;i915_edp_psr_status&quot;);
-
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SET_DEBUGFS_PATH(output, debugfs_file);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf, sizeof(buf));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret &lt; 0) {
@@ -90,13 +92,18 @@ bool psr_long_wait_update(int debugfs_fd,
enum
psr_mode mode, igt_output_t *outp
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return igt_wait(!psr_active_check(debugfs_fd, mode,
output),
500, 10);
&nbsp;&nbsp;}
&nbsp; 
-static ssize_t psr_write(int debugfs_fd, const char *buf)
+static ssize_t psr_write(int debugfs_fd, const char *buf,
igt_output_t *output)
&nbsp;&nbsp;{
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * FIXME: Currently we don't have separate psr_debug file
for
each output.
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * so, we are using i915_edp_psr_debug file for all
outputs.
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Later we need to add support for separate psr_debug
file
for each output.
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return igt_sysfs_write(debugfs_fd, &quot;i915_edp_psr_debug&quot;,
buf,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strlen(buf));
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strlen(buf));
&nbsp;&nbsp;}
&nbsp; 
-static int has_psr_debugfs(int debugfs_fd)
+static int has_psr_debugfs(int debugfs_fd, igt_output_t *output)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret;
&nbsp; 
@@ -105,7 +112,7 @@ static int has_psr_debugfs(int debugfs_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Legacy mode will return OK here, debugfs api will
return -
EINVAL.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * -ENODEV is returned when PSR is unavailable.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_write(debugfs_fd, &quot;0xf&quot;);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_write(debugfs_fd, &quot;0xf&quot;, output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret == -EINVAL) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;errno = 0;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 0;
@@ -113,7 +120,7 @@ static int has_psr_debugfs(int debugfs_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ret;
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* legacy debugfs api, we enabled irqs by writing,
disable
them. */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_write(debugfs_fd, &quot;0&quot;);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_write(debugfs_fd, &quot;0&quot;, output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -EINVAL;
&nbsp;&nbsp;}
&nbsp; 
@@ -134,14 +141,14 @@ static int psr_restore_debugfs_fd = -1;
&nbsp; 
&nbsp;&nbsp;static void restore_psr_debugfs(int sig)
&nbsp;&nbsp;{
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_write(psr_restore_debugfs_fd, &quot;0&quot;);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_write(psr_restore_debugfs_fd, &quot;0&quot;, NULL);
&nbsp;&nbsp;}
&nbsp; 
-static bool psr_set(int device, int debugfs_fd, int mode)
+static bool psr_set(int device, int debugfs_fd, int mode,
igt_output_t *output)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret;
&nbsp; 
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = has_psr_debugfs(debugfs_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = has_psr_debugfs(debugfs_fd, output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret == -ENODEV) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip(&quot;PSR not available\n&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return false;
@@ -179,7 +186,7 @@ static bool psr_set(int device, int
debugfs_fd,
int mode)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;debug_val = &quot;0x1&quot;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp; 
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_write(debugfs_fd, debug_val);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_write(debugfs_fd, debug_val, output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(ret &gt; 0, &quot;PSR2 SF feature not
available\n&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp; 
@@ -193,15 +200,15 @@ static bool psr_set(int device, int
debugfs_fd,
int mode)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ret;
&nbsp;&nbsp;}
&nbsp; 
-bool psr_enable(int device, int debugfs_fd, enum psr_mode mode)
+bool psr_enable(int device, int debugfs_fd, enum psr_mode mode,
igt_output_t *output)
&nbsp;&nbsp;{
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr_set(device, debugfs_fd, mode);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr_set(device, debugfs_fd, mode, output);
&nbsp;&nbsp;}
&nbsp; 
-bool psr_disable(int device, int debugfs_fd)
+bool psr_disable(int device, int debugfs_fd, igt_output_t
*output)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Any mode different than PSR_MODE_1/2 will disable PSR
*/
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr_set(device, debugfs_fd, -1);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr_set(device, debugfs_fd, -1, output);
&nbsp;&nbsp;}
&nbsp; 
&nbsp;&nbsp;bool psr_sink_support(int device, int debugfs_fd, enum psr_mode
mode, igt_output_t *output)
@@ -211,11 +218,7 @@ bool psr_sink_support(int device, int
debugfs_fd, enum psr_mode mode, igt_output
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char buf[PSR_STATUS_MAX_LEN];
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret;
&nbsp; 
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (output)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s/i915_psr_status&quot;,
output-
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">name);
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s&quot;,
&quot;i915_edp_psr_status&quot;);
-
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SET_DEBUGFS_PATH(output, debugfs_file);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
buf,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(buf));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret &lt; 1)
@@ -305,7 +308,7 @@ void psr_print_debugfs(int debugfs_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_info(&quot;%s&quot;, buf);
&nbsp;&nbsp;}
&nbsp; 
-bool i915_psr2_selective_fetch_check(int drm_fd)
+bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
*output)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int debugfs_fd;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool ret;
@@ -314,7 +317,7 @@ bool i915_psr2_selective_fetch_check(int
drm_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return false;
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;debugfs_fd = igt_debugfs_dir(drm_fd);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr2_selective_fetch_check(debugfs_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr2_selective_fetch_check(debugfs_fd, output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;close(debugfs_fd);
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ret;
@@ -331,7 +334,7 @@ bool i915_psr2_selective_fetch_check(int
drm_fd)
&nbsp;&nbsp; * Returns:
&nbsp;&nbsp; * True if PSR mode changed to PSR1, false otherwise.
&nbsp;&nbsp; */
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
+bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t
*output)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int debugfs_fd;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool ret = false;
@@ -340,8 +343,8 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ret;
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;debugfs_fd = igt_debugfs_dir(drm_fd);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (psr2_selective_fetch_check(debugfs_fd)) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PSR_MODE_1);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (psr2_selective_fetch_check(debugfs_fd, output)) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = true;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp; 
@@ -355,12 +358,12 @@ bool i915_psr2_sel_fetch_to_psr1(int
drm_fd)
&nbsp;&nbsp; * Restore PSR2 selective fetch after tests were executed, this
function should
&nbsp;&nbsp; * only be called if i915_psr2_sel_fetch_to_psr1() returned
true.
&nbsp;&nbsp; */
-void i915_psr2_sel_fetch_restore(int drm_fd)
+void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t
*output)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int debugfs_fd;
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;debugfs_fd = igt_debugfs_dir(drm_fd);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH,
output);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;close(debugfs_fd);
&nbsp;&nbsp;}
&nbsp; 
@@ -369,16 +372,17 @@ void i915_psr2_sel_fetch_restore(int
drm_fd)
&nbsp;&nbsp; *
&nbsp;&nbsp; * Return the current PSR mode.
&nbsp;&nbsp; */
-enum psr_mode psr_get_mode(int debugfs_fd)
+enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char buf[PSR_STATUS_MAX_LEN];
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char debugfs_file[128] = {0};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret;
&nbsp; 
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = igt_debugfs_simple_read(debugfs_fd,
&quot;i915_edp_psr_status&quot;, buf,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SET_DEBUGFS_PATH(output, debugfs_file);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
buf,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(buf));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret &lt; 0) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_info(&quot;Could not read i915_edp_psr_status:
%s\n&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_info(&quot;Could not read psr status: %s\n&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strerror(-ret));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return PSR_DISABLED;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 82a4e8c5e..372bef2b2 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -46,21 +46,21 @@ enum fbc_mode {
&nbsp;&nbsp;};
&nbsp; 
&nbsp;&nbsp;bool psr_disabled_check(int debugfs_fd);
-bool psr2_selective_fetch_check(int debugfs_fd);
+bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t
*output);
&nbsp;&nbsp;bool psr_wait_entry(int debugfs_fd, enum psr_mode mode,
igt_output_t
*output);
&nbsp;&nbsp;bool psr_wait_update(int debugfs_fd, enum psr_mode mode,
igt_output_t *output);
&nbsp;&nbsp;bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode,
igt_output_t *output);
-bool psr_enable(int device, int debugfs_fd, enum psr_mode);
-bool psr_disable(int device, int debugfs_fd);
+bool psr_enable(int device, int debugfs_fd, enum psr_mode,
igt_output_t *output);
+bool psr_disable(int device, int debugfs_fd, igt_output_t
*output);
&nbsp;&nbsp;bool psr_sink_support(int device, int debugfs_fd, enum psr_mode
mode, igt_output_t *output);
&nbsp;&nbsp;bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
&nbsp;&nbsp;void psr_print_debugfs(int debugfs_fd);
-enum psr_mode psr_get_mode(int debugfs_fd);
+enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t
*output);
&nbsp; 
-bool i915_psr2_selective_fetch_check(int drm_fd);
+bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
*output);
&nbsp; 
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
-void i915_psr2_sel_fetch_restore(int drm_fd);
+bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t
*output);
+void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t
*output);
&nbsp;&nbsp;bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
&nbsp; 
&nbsp;&nbsp;#endif
diff --git a/tests/intel/kms_dirtyfb.c
b/tests/intel/kms_dirtyfb.c
index 26b82e50a..c2411c824 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -127,7 +127,7 @@ static void enable_feature(data_t *data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_fbc_enable(data-&gt;drm_fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case FEATURE_PSR:
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd,
PSR_MODE_1);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd,
PSR_MODE_1, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case FEATURE_DRRS:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_drrs_enable(data-&gt;drm_fd, data-&gt;pipe);
@@ -167,7 +167,7 @@ static void check_feature(data_t *data)
&nbsp;&nbsp;static void disable_features(data_t *data)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_fbc_disable(data-&gt;drm_fd);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(data-&gt;drm_fd, data-&gt;debugfs_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(data-&gt;drm_fd, data-&gt;debugfs_fd, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_drrs_disable(data-&gt;drm_fd, data-&gt;pipe);
&nbsp;&nbsp;}
&nbsp; 
diff --git a/tests/intel/kms_fbcon_fbt.c
b/tests/intel/kms_fbcon_fbt.c
index 90484dccf..71e42f19c 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -277,7 +277,7 @@ static void disable_features(int device, int
debugfs_fd)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_set_module_param_int(device, &quot;enable_fbc&quot;, 0);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (psr_sink_support(device, debugfs_fd, PSR_MODE_1,
NULL))
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(device, debugfs_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(device, debugfs_fd, NULL);
&nbsp;&nbsp;}
&nbsp; 
&nbsp;&nbsp;static inline void fbc_modparam_enable(int device, int
debugfs_fd)
@@ -287,7 +287,7 @@ static inline void fbc_modparam_enable(int
device, int debugfs_fd)
&nbsp; 
&nbsp;&nbsp;static inline void psr_debugfs_enable(int device, int
debugfs_fd)
&nbsp;&nbsp;{
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(device, debugfs_fd, PSR_MODE_1);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(device, debugfs_fd, PSR_MODE_1, NULL);
&nbsp;&nbsp;}
&nbsp; 
&nbsp;&nbsp;static void fbc_skips_on_fbcon(int debugfs_fd)
diff --git a/tests/intel/kms_frontbuffer_tracking.c
b/tests/intel/kms_frontbuffer_tracking.c
index 912cca3f8..023843161 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2234,7 +2234,7 @@ static bool disable_features(const struct
test_mode *t)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_fbc_disable(drm.fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_drrs_disable(drm.fd, prim_mode_params.pipe);
&nbsp; 
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr.can_test ? psr_disable(drm.fd, drm.debugfs) :
false;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return psr.can_test ? psr_disable(drm.fd, drm.debugfs,
NULL)
: false;
&nbsp;&nbsp;}
&nbsp; 
&nbsp;&nbsp;static void *busy_thread_func(void *data)
@@ -2867,7 +2867,7 @@ static bool enable_features_for_test(const
struct test_mode *t)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (t-&gt;feature &amp; FEATURE_FBC)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_fbc_enable(drm.fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (t-&gt;feature &amp; FEATURE_PSR)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_enable(drm.fd, drm.debugfs,
PSR_MODE_1);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1,
NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (t-&gt;feature &amp; FEATURE_DRRS)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_drrs_enable(drm.fd,
prim_mode_params.pipe);
&nbsp; 
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 0d5824e67..7deebf83d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -362,7 +362,7 @@ static void require_dc_counter(int
debugfs_fd,
int dc_flag)
&nbsp;&nbsp;static void setup_dc3co(data_t *data)
&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-&gt;op_psr_mode = PSR_MODE_2;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">op_psr_mode);
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">op_psr_mode,
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(psr_wait_entry(data-&gt;debugfs_fd, data-
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">op_psr_mode, NULL),
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR2 is not enabled\n&quot;);
&nbsp;&nbsp;}
@@ -665,7 +665,7 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require(psr_sink_support(data.drm_fd,
data.debugfs_fd,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PSR_MODE_1, NULL));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.op_psr_mode = PSR_MODE_1;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data.drm_fd, data.debugfs_fd,
data.op_psr_mode);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data.drm_fd, data.debugfs_fd,
data.op_psr_mode, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;test_dc_state_psr(&amp;data, CHECK_DC5);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp; 
@@ -675,7 +675,7 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require(psr_sink_support(data.drm_fd,
data.debugfs_fd,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PSR_MODE_1, NULL));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.op_psr_mode = PSR_MODE_1;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data.drm_fd, data.debugfs_fd,
data.op_psr_mode);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_enable(data.drm_fd, data.debugfs_fd,
data.op_psr_mode, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(igt_pm_pc8_plus_residencies_enable
d(dat
a.msr_fd),
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PC8+ residencies not
supported\n&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (intel_display_ver(data.devid) &gt;= 14)
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 521d4c708..3822b3081 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -519,7 +519,7 @@ static bool psr_enable_if_enabled(data_t
*data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip(&quot;enable_psr modparam doesn't allow psr
mode
%d\n&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;op_psr_mode);
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
            <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;}
&nbsp; 
&nbsp;&nbsp;static inline void manual(const char *expected)
@@ -658,6 +658,7 @@ static void test_cleanup(data_t *data)
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb_green);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb_white);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">output);
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;}
&nbsp; 
&nbsp;&nbsp;static void setup_test_plane(data_t *data, int test_plane)
@@ -976,7 +977,6 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_fixture {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_disable(data.drm_fd, data.debugfs_fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;close(data.debugfs_fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;buf_ops_destroy(data.bops);
diff --git a/tests/intel/kms_psr2_sf.c
b/tests/intel/kms_psr2_sf.c
index ecf9ad77f..8e6a9e02c 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1012,11 +1012,6 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.fbc_flag = true;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp; 
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Test if PSR2 can be enabled */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(psr_enable(data.drm_fd,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.debugfs_fd,
PSR_MODE_2_SEL_FETCH),
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Error enabling PSR2\n&quot;);
-
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I started to think it might actually not make sense to remove this.
Currently kms_psr2_sf is skipped if psr debugfs interface doesn't
exist. I.e. PSR is not supported by the platform. This is with
reasonable info &quot;PSR not available&quot;. After your change it will
assert
below as debugfs entry can't be opened.

BR,

Jouni Högander
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

Thanks for catching this,
How about having a check before looping on all output to check if we 
have psr_debug interface present?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think that is ok as well. But you can drop this change completely as
well.

BR,

Jouni Högander</pre>
    </blockquote>
    <p>I think we need to remove this check as we check specifically for
      <span style="white-space: pre-wrap">PSR_MODE_2_SEL_FETCH
Even though it doesn't matter but for readability purpose. Let me know if you think otherwise.

Thanks and Regards
Kunal Joshi
</span></p>
    <blockquote type="cite" cite="mid:225179de6cf4afe93bb499790b63cd1cf4fbc3e6.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Thanks and Regards
Kunal Joshi

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.damage_area_count = MAX_DAMAGE_AREAS;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.primary_format = DRM_FORMAT_XRGB8888;
&nbsp; 
@@ -1026,9 +1021,6 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_info(&quot;Big framebuffer size %dx%d\n&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.big_fb_width, data.big_fb_height);
&nbsp; 
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(psr2_selective_fetch_check(data.deb
ugfs_f
d),
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR2 selective fetch not
enabled\n&quot;);
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for_each_pipe_with_valid_output(&amp;data.display,
data.pipe, data.output) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;coexist_features[n_pipes] = 0;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (check_psr2_support(&amp;data)) {
diff --git a/tests/intel/kms_psr2_su.c
b/tests/intel/kms_psr2_su.c
index 936b5beb3..437ee36f6 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -338,7 +338,7 @@ igt_main
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Test if PSR2 can be enabled */
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(psr_enable(data.drm_fd,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.debugfs_fd,
PSR_MODE_2),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.debugfs_fd,
PSR_MODE_2,
NULL),
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Error enabling PSR2\n&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.op = FRONTBUFFER;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.format = DRM_FORMAT_XRGB8888;
diff --git a/tests/intel/kms_psr_stress_test.c
b/tests/intel/kms_psr_stress_test.c
index 7aea8e8a5..bca3bd513 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -230,7 +230,7 @@ static void prepare(data_t *data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r = timerfd_settime(data-&gt;completed_timerfd, 0,
&amp;interval,
NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(r != -1, &quot;Error setting
completed_timerfd\n&quot;);
&nbsp; 
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-&gt;initial_state = psr_get_mode(data-&gt;debugfs_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-&gt;initial_state = psr_get_mode(data-&gt;debugfs_fd,
NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require(data-&gt;initial_state != PSR_DISABLED);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require(psr_wait_entry(data-&gt;debugfs_fd, data-
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">initial_state, NULL));
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;}
@@ -343,7 +343,7 @@ static void run(data_t *data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Check if after all this stress the PSR is still in
the
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
            <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;}
&nbsp; 
&nbsp;&nbsp;igt_main
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a0349fa03..2895168f7 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -391,7 +391,7 @@ static void test_cursor(data_t *data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * necessary, causing the async flip to fail because
async
flip is not
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * supported in cursor plane.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_psr2_selective_fetch_check(data-
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">drm_fd),
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_psr2_selective_fetch_check(data-
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">drm_fd,
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">NULL),
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR2 sel fetch causes cursor to be added
to
primary plane &quot; \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pages flips and async flip is not
supported in
cursor\n&quot;);
&nbsp; 
@@ -704,7 +704,7 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * necessary, causing the async flip to fail
because
async flip is not
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * supported in cursor plane.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_psr2_selective_fetch_check(dat
a.drm_
fd),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_psr2_selective_fetch_check(dat
a.dr
m_fd, NULL),
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR2 sel fetch causes cursor to
be
added to primary plane &quot; \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pages flips and async flip is not
supported in cursor\n&quot;);
&nbsp; 
diff --git a/tests/kms_cursor_legacy.c
b/tests/kms_cursor_legacy.c
index 0017659d4..a430f735a 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1849,7 +1849,7 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * page flip with cursor legacy APIS when
Intel's
PSR2 selective
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * fetch is enabled, so switching PSR1 for this
whole
test.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_psr2_restore =
i915_psr2_sel_fetch_to_psr1(display.drm_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_psr2_restore =
i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_describe(&quot;Test checks how many cursor updates we can
fit
between vblanks &quot;
@@ -2074,7 +2074,7 @@ igt_main
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_fixture {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (intel_psr2_restore)
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i915_psr2_sel_fetch_restore(display.drm_fd)
;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i915_psr2_sel_fetch_restore(display.drm_f
d,
NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_display_fini(&amp;display);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm_close_driver(display.drm_fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------mpNIgnuZxcub5AZOKWwLb390--
